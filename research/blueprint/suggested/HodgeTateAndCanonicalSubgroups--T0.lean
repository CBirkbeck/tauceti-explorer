/-
This file is not the roadmap and is not exhaustive.
Independent review REV-HodgeTateAndCanonicalSubgroups--T0: needs_changes.
The typed algebra below elaborates only a small part of the contracts; the
geometric signatures, APIs and examples are explicitly missing. A comment
catalogue is not a substitute for the signatures required by PROTOCOL section 13. The roadmap document
research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T0.md is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proposed proof is `sorry`. No implementation is
claimed; implementationStatus remains unchecked.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Scope: layers T0–T5 of HodgeTateAndCanonicalSubgroups (the abelian/Hilbert route).

How this file prototypes. The pinned libraries have the algebra of the finite-level
theory but none of its geometry. Tau Ceti has the augmentation cotangent space
`TauCeti.Bialgebra.CotangentSpace R A = (ker ε)/(ker ε)²` of a commutative bialgebra over
any commutative ring (this is ω_H for an affine group scheme H = Spec A) and Cartier duality
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; the shared build used to check
this file does not contain those Tau Ceti modules, so the components below are written
against Mathlib with the same definitions (`Ideal.Cotangent` of the counit kernel), and a
formaliser replaces them by the Tau Ceti declarations named in each docstring. Mathlib's
`Module.Grassmannian` (rank-k quotients) carries the Hodge–Tate flag point, and
`IsGroupLikeElem` the characters of the Cartier dual.

Abelian and semi-abelian schemes, p-divisible groups (FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1), adic spaces and Shimura varieties are not in the pinned libraries. Every packet
declaration, API item and unit test is listed under its proposed name in the contract
catalogue at the end of the file; a name with a typed component below says so, and a name
marked "not stated" is an explicit omission, not an elaborated statement. Conditions that
cannot be stated are left out, never replaced by `Prop`-valued fields.
-/

import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Bialgebra.Basic
import Mathlib.RingTheory.Bialgebra.Hom
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Coalgebra.GroupLike
import Mathlib.RingTheory.Grassmannian
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.Ideal.Span
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Basic.Real.Basic

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section
open scoped TensorProduct
universe u v w

namespace TauCeti.HodgeTate

/-! ### T0. The conormal module ω_H of an affine commutative group scheme -/

section Conormal
variable (R : Type u) (A : Type v) [CommRing R] [CommRing A] [Bialgebra R A]

/-- Component of `TauCeti.HodgeTate.conormal` (T0/conormal-module): for `H = Spec A`, ω_H is
the cotangent space `(ker ε)/(ker ε)²` at the identity. This is definitionally Tau Ceti's
`TauCeti.Bialgebra.CotangentSpace R A`, which a formaliser uses instead. -/
abbrev conormal : Type v := (RingHom.ker (Bialgebra.counitAlgHom R A : A →+* R)).Cotangent

/-- API `TauCeti.HodgeTate.conormal_map` (component): a bialgebra map `f : A → B` (the
comorphism of a homomorphism `Spec B → Spec A`) induces `ω_{Spec A} → ω_{Spec B}`. -/
def conormalMap {B : Type w} [CommRing B] [Bialgebra R B] (f : A →ₐc[R] B) :
    conormal R A →ₗ[R] conormal R B := sorry

/-- API `TauCeti.HodgeTate.conormal_map` (component): identity. -/
theorem conormalMap_id :
    conormalMap R A (BialgHom.id R A) = LinearMap.id := sorry

end Conormal

/-! ### T0. The finite-level Hodge–Tate map -/

section HodgeTate
variable (R : Type u) (B : Type v) [CommRing R] [CommRing B] [HopfAlgebra R B]

/-- Component of `TauCeti.HodgeTate.hodgeTateMap` (T0/finite-hodge-tate-map). Let `B` be the
Hopf algebra of the Cartier dual `H^D`. A point `x ∈ H(R)` is a character `H^D → 𝔾_m`, i.e. a
group-like element `g ∈ B`; its Hodge–Tate image `x*(dt/t) ∈ ω_{H^D}` is the class of `g − 1`
in `(ker ε)/(ker ε)²` (Tau Ceti: `TauCeti.Bialgebra.cotangentMap R B g`). -/
def hodgeTateMap (g : B) (hg : IsGroupLikeElem R g) : conormal R B :=
  (RingHom.ker (Bialgebra.counitAlgHom R B : B →+* R)).toCotangent
    ⟨g - 1, by sorry⟩

/-- API `TauCeti.HodgeTate.hodgeTateMap_add` (component): additivity, `α(xy) = α(x) + α(y)`
on group-like elements (the group law of `H(R)` is multiplication of group-likes). -/
theorem hodgeTateMap_mul (g h : B) (hg : IsGroupLikeElem R g) (hh : IsGroupLikeElem R h)
    (hgh : IsGroupLikeElem R (g * h)) :
    hodgeTateMap R B (g * h) hgh = hodgeTateMap R B g hg + hodgeTateMap R B h hh := sorry

/-- API `TauCeti.HodgeTate.hodgeTateMap_add` (component): `α(0) = 0`. -/
theorem hodgeTateMap_one (h1 : IsGroupLikeElem R (1 : B)) : hodgeTateMap R B 1 h1 = 0 := sorry

/-- API `TauCeti.HodgeTate.hodgeTateMap_apply_groupLike` (component): `α(x)` is the class of
`g_x − 1`. -/
theorem hodgeTateMap_apply_groupLike (g : B) (hg : IsGroupLikeElem R g) :
    ∃ hmem : g - 1 ∈ RingHom.ker (Bialgebra.counitAlgHom R B : B →+* R),
      hodgeTateMap R B g hg =
        (RingHom.ker (Bialgebra.counitAlgHom R B : B →+* R)).toCotangent ⟨g - 1, hmem⟩ := sorry

end HodgeTate

/-! ### T0. Fargues's degree over a rank-one valuation ring -/

section Degree
variable {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ))

/-- A presentation of a finitely presented torsion `O`-module as `⊕ O/(x_i)`; over a valuation
ring every finitely presented torsion module has one. -/
structure CyclicPresentation (O : Type u) [CommRing O] (M : Type v) [AddCommGroup M] [Module O M] where
  n : ℕ
  x : Fin n → O
  equiv : M ≃ₗ[O] DirectSum (Fin n) (fun i => O ⧸ Ideal.span {x i})

/-- Component of `TauCeti.HodgeTate.farguesDegree_eq_sum`: the degree `Σ v(x_i)` of a cyclic
presentation of `ω_G`; `TauCeti.HodgeTate.farguesDegree` is `v(Fitt₀ ω_G)` and is independent of
the presentation (Mathlib has no Fitting ideals of modules yet). -/
def degreeOfPresentation {M : Type v} [AddCommGroup M] [Module O M] (P : CyclicPresentation O M) :
    WithTop ℝ :=
  ∑ i, v (P.x i)

/-- API `TauCeti.HodgeTate.farguesDegree_eq_sum` (component): independence of the presentation. -/
theorem degreeOfPresentation_eq {M : Type v} [AddCommGroup M] [Module O M]
    (P Q : CyclicPresentation O M) : degreeOfPresentation v P = degreeOfPresentation v Q := sorry

end Degree

/-! ### T2. The Hodge–Tate flag point -/

section FlagPoint
variable {C : Type u} [Field C] {n k : ℕ}

/-- Component of `TauCeti.HodgeTate.hodgeTateFlagPoint` (T2/hodge-tate-flag-point): the kernel
of a surjection `C^n → W` onto a `k`-dimensional space, as a point of Mathlib's Grassmannian of
rank-`k` quotients. For an abelian variety, `C^n = T_pA^∨ ⊗ C` through the trivialisation and
`W = ω_A` (`n = 2g`, `k = g`): the quotient, not the line, convention. -/
def flagPointOfQuotient {W : Type v} [AddCommGroup W] [Module C W] [FiniteDimensional C W]
    (f : (Fin n → C) →ₗ[C] W) (hf : Function.Surjective f) (hW : Module.finrank C W = k) :
    Module.Grassmannian C (Fin n → C) k where
  toSubmodule := LinearMap.ker f
  finite_quotient := sorry
  projective_quotient := sorry
  rankAtStalk_eq := sorry

/-- Test `TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian` (component): the flag point is an
element of `Module.Grassmannian` whose submodule is the kernel of the Hodge–Tate quotient. -/
example {W : Type v} [AddCommGroup W] [Module C W] [FiniteDimensional C W]
    (f : (Fin n → C) →ₗ[C] W) (hf : Function.Surjective f) (hW : Module.finrank C W = k) :
    (flagPointOfQuotient f hf hW).toSubmodule = LinearMap.ker f := rfl

end FlagPoint

/-! ### T4. The Hodge–Tate coordinate and the automorphy factor -/

section Coordinate
variable {S : Type u} [CommRing S]

/-- `TauCeti.HodgeTate.automorphyFactor` (component): `j(γ, z) = c z + d`. -/
def automorphyFactor (γ : Matrix (Fin 2) (Fin 2) S) (z : S) : S := γ 1 0 * z + γ 1 1

/-- Numerator of the fractional-linear action, `a z + b`. -/
def fractionalNumerator (γ : Matrix (Fin 2) (Fin 2) S) (z : S) : S := γ 0 0 * z + γ 0 1

/-- `TauCeti.HodgeTate.fractionalLinear_action` (component): `z(γx) = (a z + b)/(c z + d)` where
the denominator is a unit (on the anticanonical tower, `c ∈ p𝒪_p`, `d ∈ 𝒪_p^×`). -/
def fractionalLinear (γ : Matrix (Fin 2) (Fin 2) S) (z : S) (hz : IsUnit (automorphyFactor γ z)) :
    S :=
  fractionalNumerator γ z * (hz.unit⁻¹ : Sˣ)

/-- API `TauCeti.HodgeTate.automorphyFactor_cocycle` (component): the cocycle law
`j(γδ, z) = j(γ, δz) · j(δ, z)` for the left action. -/
theorem automorphyFactor_cocycle (γ δ : Matrix (Fin 2) (Fin 2) S) (z : S)
    (hz : IsUnit (automorphyFactor δ z)) :
    automorphyFactor (γ * δ) z =
      automorphyFactor γ (fractionalLinear δ z hz) * automorphyFactor δ z := sorry

/-- Test `TauCeti.HodgeTate.automorphyFactor_identity`: `j(1, z) = 1`. -/
example (z : S) : automorphyFactor (1 : Matrix (Fin 2) (Fin 2) S) z = 1 := by
  simp [automorphyFactor]

/-- Test `TauCeti.HodgeTate.fractionalLinear_upperTriangular`: for `γ = !![a, b; 0, d]` with `d`
a unit, `z(γx) = (a z + b)/d`. -/
example (a b d z : S) (hd : IsUnit d)
    (h : IsUnit (automorphyFactor !![a, b; 0, d] z)) :
    fractionalLinear !![a, b; 0, d] z h = (a * z + b) * (hd.unit⁻¹ : Sˣ) := sorry

/-- Test `TauCeti.HodgeTate.automorphyFactor_cocycle_test`: for lower unipotent `γ, δ`,
`j(γδ, z) = (c + c') z + 1`. -/
example (c c' z : S) :
    automorphyFactor (!![1, 0; c, 1] * !![1, 0; c', 1]) z = (c + c') * z + 1 := by
  simp [automorphyFactor, Matrix.mul_apply, Fin.sum_univ_two]

end Coordinate

/-! ### T5. The lattice ω^int, the modified bundle ω^mod and the AIP torsor (module components) -/

section Lattices
variable {O : Type u} [CommRing O] {ω : Type v} [AddCommGroup ω] [Module O ω]

/-- Component of `TauCeti.HodgeTate.integralDifferentialLattice` (T5): given `ω⁺`, the ideal
`I_m` and the Hodge–Tate class `ψ(1) ∈ ω⁺/I_m ω⁺`, `ω^int` is the preimage of the submodule
generated by `ψ(1)` (over `𝒪_F ⊗ O⁺`, here over the coefficient ring `O`). -/
def integralDifferentialLattice (I : Ideal O) (ψ1 : ω ⧸ (I • (⊤ : Submodule O ω))) :
    Submodule O ω :=
  (Submodule.span O {ψ1}).comap (I • (⊤ : Submodule O ω)).mkQ

/-- Auxiliary component for `TauCeti.HodgeTate.integralDifferentialLattice`:
`I_m ω⁺ ⊂ ω^int`. -/
theorem le_integralDifferentialLattice (I : Ideal O) (ψ1 : ω ⧸ (I • (⊤ : Submodule O ω))) :
    I • (⊤ : Submodule O ω) ≤ integralDifferentialLattice I ψ1 := sorry

/-- Test `TauCeti.HodgeTate.integralDifferentialLattice_ordinary` (component): if `ψ(1)` is the
image of a generator `w` of `ω⁺` (the ordinary case), then `ω^int = ω⁺`. -/
example (I : Ideal O) (w : ω) (hw : Submodule.span O {w} = ⊤) :
    integralDifferentialLattice I ((I • (⊤ : Submodule O ω)).mkQ w) = ⊤ := sorry

/-- Component of `TauCeti.HodgeTate.modifiedHodgeBundle` (T5): the subsheaf of `ω` generated by
`c ω` (`c = p^{1/(p−1)}`) and the Hodge–Tate images `ht i`, before the blow-up. -/
def modifiedHodgeBundle {ι : Type w} (c : O) (ht : ι → ω) : Submodule O ω :=
  (Ideal.span {c} : Ideal O) • (⊤ : Submodule O ω) ⊔ Submodule.span O (Set.range ht)

/-- API `TauCeti.HodgeTate.modifiedHodgeBundle_bounds` (component): `c ω ⊂ ω^mod`. -/
theorem smul_top_le_modifiedHodgeBundle {ι : Type w} (c : O) (ht : ι → ω) :
    (Ideal.span {c} : Ideal O) • (⊤ : Submodule O ω) ≤ modifiedHodgeBundle c ht := le_sup_left

/-- Component of `TauCeti.HodgeTate.aipTorsor` (T5): the set of `w ∈ ω^int` congruent to the
Hodge–Tate generator `e = HT'(1)` modulo `I' ω^int`. -/
def aipTorsor (L : Submodule O ω) (I' : Ideal O) (e : L) : Set L :=
  {w | w - e ∈ I' • (⊤ : Submodule O L)}

/-- API `TauCeti.HodgeTate.aipTorsor` (component): `e` itself lies in the torsor. -/
theorem mem_aipTorsor_self (L : Submodule O ω) (I' : Ideal O) (e : L) : e ∈ aipTorsor L I' e := by
  simp [aipTorsor]

end Lattices

end TauCeti.HodgeTate

/-! ## Contract catalogue

Synchronized with the independently reviewed packet. All entries below are comments,
not Lean signatures or proofs. A listed typed component supplies only the indicated
algebra; every other entry is explicitly not stated. No geometric carrier is replaced
by an uninterpreted proposition. -/

/-
Node HodgeTateAndCanonicalSubgroups:T0/conormal-module (definition): The conormal module ω_H of a finite locally free group scheme

Let S be a scheme and H a finite locally free commutative group scheme over S with unit section e.
Its conormal module (co-Lie module) is ω_H := e*Ω¹_{H/S}, the conormal sheaf of the unit section;
over an affine base S = Spec R with H = Spec A, A a commutative and cocommutative finite locally
free Hopf R-algebra with counit ε, it is the R-module I/I² with I = ker ε, and every global
invariant differential of H/S is the pullback of a unique element of ω_H. ω_H is a finitely
presented O_S-module, contravariant in H (a homomorphism f: H → H′ induces f*: ω_{H′} → ω_H),
compatible with base change S′ → S (ω_{H_{S′}} = ω_H ⊗ O_{S′}) and right exact on short exact
sequences 0 → H′ → H → H″ → 0 (ω_{H″} → ω_H → ω_{H′} → 0 exact). For a p-divisible group G = (G_v)
over a p-adically complete ring R, ω_G := lim_v ω_{G_v}, with ω_{G_v} = ω_G/p^v ω_G; ω_G is locally
free of rank dim G when R is local with residue characteristic p, and ω_{G[p^n]} is locally free of
rank dim G over R/p^n.

API:
  TauCeti.HodgeTate.conormal [constructor] (typed component: conormal): ω_H := e*Ω¹_{H/S}, over Spec
    R the augmentation cotangent space I/I² of the Hopf algebra of H.
  TauCeti.HodgeTate.conormal_eq_cotangentSpace [compatibility] (typed component: conormal (affine
    carrier only)): Over Spec R, ω_H is TauCeti.Bialgebra.CotangentSpace R A for H = Spec A
    (definitional for the affine carrier).
  TauCeti.HodgeTate.conormal_map [functoriality] (typed component: conormalMap, conormalMap_id): A
    homomorphism f: H → H′ induces f*: ω_{H′} → ω_H, with (id)* = id and (g∘f)* = f*∘g*.
  TauCeti.HodgeTate.conormal_baseChange [functoriality] (not stated): For R → R′, ω_{H_{R′}} ≅ R′
    ⊗_R ω_H, naturally in H and compatibly with composition of base changes.
  TauCeti.HodgeTate.conormal_rightExact [relation] (not stated): For 0 → H′ → H → H″ → 0 exact
    (fppf), ω_{H″} → ω_H → ω_{H′} → 0 is exact.
  TauCeti.HodgeTate.conormal_finitePresentation [instance] (not stated): ω_H is a finitely presented
    R-module, killed by the order |H| when |H| is a non-zero-divisor.
  TauCeti.HodgeTate.conormal_eq_zero_iff_etale [characterisation] (not stated): ω_H = 0 if and only
    if H is étale over S.
  TauCeti.HodgeTate.pDivisibleConormal [constructor] (not stated): For a p-divisible group G over a
    p-adically complete R, ω_G := lim ω_{G[p^v]}, with ω_G/p^v ≅ ω_{G[p^v]}; locally free of rank
    dim G when R is local of residue characteristic p.

Unit tests:
  TauCeti.HodgeTate.conormal_constant_eq_zero [degenerate] (not stated): For the constant group
    (ℤ/p^n)_R over any ring R, ω = 0.
  TauCeti.HodgeTate.conormal_mu [computation] (not stated): For μ_{p^n} = Spec R[t]/(t^{p^n} − 1), ω
    ≅ R/p^n R, generated by the class of t − 1.
  TauCeti.HodgeTate.conormal_alphaP [non-example] (not stated): For α_p = Spec 𝔽_p[t]/(t^p) over
    𝔽_p, ω is one-dimensional although α_p has order p and is not étale; ω_{α_p} ≠ 0 = ω_{ℤ/p}, so
    the order of H does not determine ω.
  TauCeti.HodgeTate.conormal_eq_cotangentSpace_test [compatibility] (not stated): For the Hopf
    algebra A of H over R, the R-module ω_H equals (ker ε)/(ker ε)², i.e.
    TauCeti.Bialgebra.CotangentSpace R A.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/finite-hodge-tate-map (construction): The finite-level Hodge–Tate map

Let H be a finite locally free commutative group scheme over a scheme S, with Cartier dual H^D =
Hom(H, 𝔾_m). A point x ∈ H(S) is, by Cartier duality, a homomorphism x: H^D_S → 𝔾_{m,S}; the
Hodge–Tate map α_H: H(S) → ω_{H^D} sends x to x*(dt/t), the pullback of the invariant differential
dt/t of 𝔾_m. Over S = Spec R, x corresponds to a group-like element g_x of the Hopf algebra of H^D
and α_H(x) is the class of g_x − 1 in I/I². α_H is a homomorphism of groups, natural in H and
compatible with base change; its R-linearisation is α_H ⊗ 1: H(R) ⊗_ℤ R → ω_{H^D}. When H(S) is
replaced by H(S′) for an S-scheme S′ (for S = Spec O_K, S′ = Spec O_K̄), the same formula gives α_H:
H(O_K̄) → ω_{H^D} ⊗ O_K̄.

API:
  TauCeti.HodgeTate.hodgeTateMap [constructor] (typed component: hodgeTateMap): α_H: H(S) → ω_{H^D},
    x ↦ x*(dt/t), through Cartier duality.
  TauCeti.HodgeTate.hodgeTateMap_add [simp] (typed component: hodgeTateMap_mul, hodgeTateMap_one):
    α_H(x + y) = α_H(x) + α_H(y) and α_H(0) = 0.
  TauCeti.HodgeTate.hodgeTateMap_apply_groupLike [characterisation] (typed component:
    hodgeTateMap_apply_groupLike): Over Spec R, α_H(x) is the class of g_x − 1 in I/I², g_x the
    group-like element of the Hopf algebra of H^D attached to x.
  TauCeti.HodgeTate.hodgeTateMap_natural [functoriality] (not stated): For f: H → H′ with Cartier
    dual f^D: H′^D → H^D, α_{H′}(f(x)) = (f^D)*(α_H(x)) in ω_{H′^D}, where (f^D)*: ω_{H^D} →
    ω_{H′^D}.
  TauCeti.HodgeTate.hodgeTateMap_baseChange [functoriality] (not stated): For R → R′, α_{H_{R′}}
    restricted to H(R) is α_H followed by ω_{H^D} → R′ ⊗ ω_{H^D}.
  TauCeti.HodgeTate.hodgeTateLinear [constructor] (not stated): The linearisation α_H ⊗ 1: H(R′) ⊗_ℤ
    R′ → R′ ⊗_R ω_{H^D} for an R-algebra R′.

Unit tests:
  TauCeti.HodgeTate.hodgeTateMap_constant [computation] (not stated): For H = (ℤ/p^n)_R, α_H(1) is
    the class of t − 1 in ω_{μ_{p^n}} = R/p^n, a generator.
  TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero [degenerate] (not stated): For H = μ_{p^n,R}, α_H = 0
    because ω_{H^D} = ω_{ℤ/p^n} = 0.
  TauCeti.HodgeTate.hodgeTateMap_depends_on_model [non-example] (not stated): Over R = ℤ_p[ζ_p] the
    groups ℤ/p and μ_p have isomorphic generic fibres, yet α_{ℤ/p}(1) generates ω_{μ_p} ≅ R/p while
    α_{μ_p} = 0: the Hodge–Tate map depends on the integral model, not only on the generic fibre.
  TauCeti.HodgeTate.hodgeTateMap_cotangentMap [compatibility] (not stated): Over Spec R, α_H(x) =
    TauCeti.Bialgebra.cotangentMap R A(g_x) for A the Hopf algebra of H^D.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/hodge-tate-map-compatibilities (theorem): Functoriality, endomorphisms and polarisations of the Hodge–Tate map

Let S be a scheme. (1) For a homomorphism f: H → H′ of finite locally free commutative S-group
schemes, α_{H′} ∘ f = (f^D)* ∘ α_H as maps H(S) → ω_{H′^D}. (2) If a ring 𝒪 acts on H by
endomorphisms, α_H is 𝒪-equivariant for the induced action on ω_{H^D} through the dual action a ↦
(a^D)*. (3) For an abelian scheme A/S with polarisation λ: A → A^∨ and n ≥ 1, write e_n: A[p^n] ×
A^∨[p^n] → μ_{p^n} for the Weil pairing; then, identifying A[p^n]^D = A^∨[p^n] by e_n, the maps
α_{A[p^n]}: A[p^n](S) → ω_{A^∨}/p^n and α_{A^∨[p^n]}: A^∨[p^n](S) → ω_A/p^n satisfy α_{A^∨[p^n]}(λx)
= λ*(α_{A[p^n]}(x)) for x ∈ A[p^n](S), where λ*: ω_{A^∨} → ω_A; so λ exchanges the Hodge–Tate maps
of A and A^∨. (4) The same holds for p-divisible groups with a quasi-polarisation λ: G → G^D
(R07.1/p-divisible-cartier-dual).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/p-divisible-hodge-tate-map (construction): The Hodge–Tate map of a p-divisible group and its completed linearisation

Let R be a p-adically complete ring and G a p-divisible group over R with Cartier dual G^D (R07.1).
Define T_pG(R) := lim_n G[p^n](R) and α_G: T_pG(R) → ω_{G^D} as the inverse limit of the maps
α_{G[p^n]}: G[p^n](R) → ω_{G[p^n]^D} = ω_{G^D}/p^n (T0/finite-hodge-tate-map, T0/conormal-module).
For R = O_C with C a complete algebraically closed extension of ℚ_p, T_pG := T_pG(O_C) is free of
rank ht G over ℤ_p, and the completed linearisation is α_G ⊗ 1: T_pG ⊗_{ℤ_p} O_C → ω_{G^D}; its
C-linearisation T_pG ⊗ C → ω_{G^D} ⊗ C is the rational Hodge–Tate map. Reduction modulo p^n recovers
α_{G[p^n]} ⊗ 1, and for G over O_K (K/ℚ_p complete discretely valued) the map is
Gal(K̄/K)-equivariant on T_pG ⊗ O_C → ω_{G^D} ⊗ O_C.

API:
  TauCeti.HodgeTate.pDivisibleHodgeTateMap [constructor] (not stated): α_G: T_pG(R) → ω_{G^D}, the
    inverse limit of α_{G[p^n]}.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod [compatibility] (not stated): α_G mod p^n equals
    α_{G[p^n]} composed with T_pG → G[p^n].
  TauCeti.HodgeTate.pDivisibleHodgeTateLinear [constructor] (not stated): α_G ⊗ 1: T_pG ⊗_{ℤ_p} O_C
    → ω_{G^D} over O_C, and its C-linearisation.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural [functoriality] (not stated): Natural in
    homomorphisms of p-divisible groups, 𝒪-linear for endomorphism actions, exchanged under a quasi-
    polarisation.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois [functoriality] (not stated): For G over O_K, α_G
    ⊗ 1 is Gal(K̄/K)-equivariant.

Unit tests:
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp [computation] (not stated): For G = ℚ_p/ℤ_p over
    O_C, α_G(1) = dt/t, so α_G ⊗ 1 is an isomorphism ℤ_p ⊗ O_C ≅ ω_{μ_{p^∞}}.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu [degenerate] (not stated): For G = μ_{p^∞}, α_G = 0.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally [non-example] (not stated): For
    G = E[p^∞] with E supersingular over O_C, α_G ⊗ 1 is not surjective: its cokernel is nonzero and
    killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel), so the integral map is not a split
    surjection.
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate [compatibility] (not stated): For G over the ring of
    integers of a complete discretely valued K with perfect residue field, α_G ⊗ C: T_pG ⊗ C →
    ω_{G^D} ⊗ C is the projection of Tate's decomposition T_pG ⊗ C ≅ (t_{G^D}(K)^∨ ⊗ C) ⊕ (t_G(K) ⊗
    C(1)) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/hodge-tate-p-divisible) onto its first
    summand, t_{G^D}(K)^∨ = ω_{G^D} ⊗ K.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel (theorem): Fargues's bound on the cokernel of the Hodge–Tate map

Let K be a complete valued extension of ℚ_p, v(p) = 1, and C = the completion of K̄. (1) For a
finite flat commutative group scheme G of p-power order over O_K, the cokernel of α_G ⊗ 1: G(O_K̄) ⊗
O_C → ω_{G^D} ⊗ O_C is killed by every element of valuation ≥ 1/(p−1). (2) For a p-divisible group H
over O_C, the cokernel of α_H ⊗ 1: T_pH ⊗ O_C → ω_{H^D} is killed by every element of valuation ≥
1/(p−1).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/fargues-degree (definition): Fargues's degree of a finite flat group scheme

Let S be a scheme and G a finite locally free commutative group scheme over S which is étale over a
schematically dense open subscheme. Its discriminant divisor is the effective Cartier divisor δ_G :=
Div(ℓ_{G/S}) = Fitt₀(ω_G) (ℓ_{G/S} the co-Lie complex, perfect of rank 0); its support is the
complement of the largest open over which G is étale. Now let K be a field of characteristic 0
complete for a valuation v: K → ℝ ∪ {∞} with v(p) = 1 (not necessarily discrete), and G a finite
flat commutative group scheme of p-power order over O_K, of height ht G (|G| = p^{ht G}). Then ω_G ≅
⊕_{i∈I} O_K/x_iO_K for a finite family x_i ∈ O_K, and the degree of G is deg G := v(δ_G) = Σ_i
v(x_i) ∈ ℝ_{≥0}; the slope of G ≠ 0 is μ(G) := deg G / ht G ∈ [0, 1].

API:
  TauCeti.HodgeTate.discriminantDivisor [constructor] (not stated): δ_G = Fitt₀ ω_G as an invertible
    ideal of O_S, for G generically étale over S.
  TauCeti.HodgeTate.farguesDegree [constructor] (not stated): deg G := v(Fitt₀ ω_G) ∈ ℝ_{≥0} for G
    finite flat over O_K.
  TauCeti.HodgeTate.farguesDegree_eq_sum [characterisation] (not stated): If ω_G ≅ ⊕ O_K/x_i then
    deg G = Σ v(x_i).
  TauCeti.HodgeTate.fargueSlope [constructor] (not stated): μ(G) := deg G / ht G for G ≠ 0.
  TauCeti.HodgeTate.farguesDegree_isogeny [compatibility] (not stated): If G = ker(f: A → B) for an
    isogeny of abelian schemes or p-divisible groups over O_K, deg G = v(det(f*: ω_B → ω_A)).
  TauCeti.HodgeTate.farguesDegree_monogenic [example] (not stated): For G = Spec O_K[T]/(f) with
    unit section T = 0, deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x).

Unit tests:
  TauCeti.HodgeTate.farguesDegree_constant [degenerate] (not stated): deg (ℤ/p^n)_{O_K} = 0.
  TauCeti.HodgeTate.farguesDegree_mu [computation] (not stated): deg μ_{p^n, O_K} = n, since ω =
    O_K/p^n.
  TauCeti.HodgeTate.farguesDegree_not_length [non-example] (not stated): deg is not the O_K-length
    of ω_G: for K with value group ℚ and G with ω_G ≅ O_K/p^{1/2}, the length is infinite (O_K is
    not noetherian) while deg G = 1/2.
  TauCeti.HodgeTate.farguesDegree_ellipticTorsion [computation] (not stated): For E an elliptic
    curve over O_K with good reduction, deg E[p] = 1 (BT_1 of dimension 1).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties (lemma): Additivity, duality and extreme values of the degree

Let G be finite flat commutative of p-power order over O_K (K, v as in T0/fargues-degree). (1) For
an exact sequence 0 → G₁ → G₂ → G₃ → 0 of such group schemes, deg G₂ = deg G₁ + deg G₃ (over a
general base, δ_{G₂} = δ_{G₁} + δ_{G₃}). (2) deg G + deg G^D = ht G (over a base where |G| is a non-
zero-divisor, δ_G + δ_{G^D} = div |G|). (3) For a valued extension L/K, deg(G ⊗_{O_K} O_L) = deg G;
for a flat S′ → S, δ commutes with pullback. (4) 0 ≤ deg G ≤ ht G; deg G = 0 iff G is étale, and deg
G = ht G iff G is of multiplicative type; μ(G^D) = 1 − μ(G). (5) A truncated Barsotti–Tate group of
level n and dimension d has degree nd; in particular deg G[p^n] = n·dim G for a p-divisible group G,
and μ(G[p^n]) = dim G / ht G.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/fargues-degree-generic-isomorphism (theorem): The degree increases along generic isomorphisms

Let f: G → G′ be a homomorphism of finite flat commutative group schemes over O_K inducing an
isomorphism of generic fibres. Then deg G ≤ deg G′, with equality if and only if f is an
isomorphism; more precisely deg G′ = deg G + (2/|G|)·χ(A, f*A′) where G = Spec A, G′ = Spec A′ and
χ(A, f*A′) = v(Fitt₀(A/f*A′)) ≥ 0. Consequently, for G′ ↪ G → G″ with the first map a closed
immersion, the composite zero and G/G′ → G″ a generic isomorphism, deg G ≤ deg G′ + deg G″ with
equality iff G → G″ is flat (an fppf epimorphism). Over a discrete valuation ring the degree is
strictly increasing on Raynaud's lattice of prolongations of a given generic group, and it is
exchanged with ht − deg under Cartier duality.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/fargues-divisor (definition): The divisor D_H of a generically étale finite flat group scheme

Let X be a normal ℤ_p-flat scheme or formal scheme (or a normal adic space over ℚ_p with an integral
model) and H a finite locally free commutative group scheme over X of order p^h which is étale after
inverting p. Its divisor D_H is the effective Cartier divisor δ_H = Fitt₀(ω_H) of T0/fargues-degree;
its support is the complement of the étale locus of H, D_H + D_{H^D} = V(p^h), and at a point valued
in a complete rank-one valuation ring V with v(p) = 1 one has D_H = (x) with deg H_x = v(x).

API:
  TauCeti.HodgeTate.farguesDivisor [constructor] (not stated): D_H = Fitt₀ ω_H as an effective
    Cartier divisor of X.
  TauCeti.HodgeTate.farguesDivisor_support [characterisation] (not stated): X ∖ Supp D_H is the
    largest open over which H is étale.
  TauCeti.HodgeTate.farguesDivisor_add_dual [relation] (not stated): D_H + D_{H^D} = V(p^h) for H of
    order p^h.
  TauCeti.HodgeTate.farguesDivisor_pullback [functoriality] (not stated): For a flat (or rank-one
    point) map f: Y → X, D_{f*H} = f*D_H.
  TauCeti.HodgeTate.farguesDivisor_rankOne [compatibility] (not stated): At x: Spec V → X with V
    rank one, v(p) = 1, x*D_H = (a) with v(a) = deg H_x.

Unit tests:
  TauCeti.HodgeTate.farguesDivisor_mu [computation] (not stated): D_{μ_{p^n}} = V(p^n).
  TauCeti.HodgeTate.farguesDivisor_etale [degenerate] (not stated): D_H = 0 for H étale over X.
  TauCeti.HodgeTate.farguesDivisor_not_reduced [non-example] (not stated): D_{μ_p} = V(p) is not the
    reduced special fibre when X = Spf ℤ_p[p^{1/2}]: there V(p) = 2·V(p^{1/2}), so D_H records
    multiplicities, not only support.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/isogeny-divisor (construction): The divisor of an isogeny of semi-abelian schemes and the section δ_H

Let X be a normal ℤ_p-flat scheme (or formal scheme) and f: G → G′ an isogeny of semi-abelian
schemes over X which is étale after inverting p. Lie(f): Lie G → Lie G′ is a map of locally free
modules of the same rank; its determinant det Lie(f) is a section of det Lie(G)^{-1} ⊗ det Lie(G′),
and the divisor of f is D_f := div(det Lie(f)). D_f is an effective Cartier divisor, D_{g∘f} = D_f +
D_g, and over the open where ker f is finite D_f = D_{ker f} (T0/fargues-divisor). Over an analytic
adic space 𝒳 with such an isogeny on a formal model, δ_H := det Lie(f) for H = ker f is a section
with v_x(δ_H) = deg H_x at each rank-one point x for which the specialised kernel H_x is finite flat
over O_{C_x}.

API:
  TauCeti.HodgeTate.isogenyDivisor [constructor] (not stated): D_f := div(det Lie(f)) for an isogeny
    f of semi-abelian schemes, étale after inverting p.
  TauCeti.HodgeTate.isogenyDivisor_comp [relation] (not stated): D_{g∘f} = D_f + D_g.
  TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor [compatibility] (not stated): Over the open
    where ker f is finite flat, D_f = D_{ker f}.
  TauCeti.HodgeTate.deltaSection [constructor] (not stated): δ_H := det Lie(f) on an analytic adic
    space with a formal model; v_x(δ_H) = deg H_x when H_x is finite flat over the valuation ring at
    x.
  TauCeti.HodgeTate.isogenyDivisor_mulP [example] (not stated): D_{[p]} = V(p^{dim G}).

Unit tests:
  TauCeti.HodgeTate.isogenyDivisor_id [degenerate] (not stated): D_{id} = 0.
  TauCeti.HodgeTate.isogenyDivisor_mulP_test [computation] (not stated): For [p] on an abelian
    scheme of relative dimension g, D_{[p]} = V(p^g).
  TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite [compatibility] (not stated): The quotient of
    the Tate curve by μ_p extends on the toric chart as t ↦ t^p, has finite flat kernel μ_p, and D_f
    = V(p). It is not a counterexample to D_f = D_{ker f}; this identity requires finite flatness of
    the kernel.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/multiplicative-hodge-tate-isomorphism (lemma): The Hodge–Tate map of a group of multiplicative type is an isomorphism

Let R be a ring and H a finite locally free commutative group scheme over R which is étale-locally
isomorphic to μ_{p^n}^r (equivalently H^D étale-locally constant (ℤ/p^n)^r). Then α_{H^D} ⊗ 1:
H^D(R′) ⊗ R′ → ω_H ⊗ R′ is an isomorphism for every étale R-algebra R′ trivialising H^D, and ω_H is
locally free of rank r over R/p^n. In particular, for the universal multiplicative subgroup H_n of a
Siegel or Hilbert–Siegel tower, HT ⊗ O: H_n^D ⊗ O → ω_{H_n} is an isomorphism.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/normalized-multiplicative-pullback (lemma): Normalised pullback along isogenies of multiplicative p-divisible groups

Let G and G′ be multiplicative p-divisible groups of height h over a base where their conormal
bundles are defined, with étale character lattices T and T′. Then G = T^∨ ⊗ μ_{p^∞} and ω_G = T ⊗
ω_{μ_{p^∞}}, hence det ω_G = det T ⊗ ω_{μ_{p^∞}}^{⊗h}. An isogeny λ: G → G′ induces λ₀: T′ → T. If
det λ₀ has p-adic valuation r, the integral lattice isomorphism p^{−r}det λ₀: det T′ → det T defines
the normalised pullback λ̃*: det ω_{G′} → det ω_G; det λ* = p^r λ̃*. Division is performed on the
character lattice before tensoring with O_S, so the definition remains meaningful when p is
nilpotent on S.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/semi-abelian-torsion (construction): p-power torsion of semi-abelian schemes on degeneration charts

Let S be a scheme and G a semi-abelian scheme over S whose torus part has locally constant rank r on
a locally closed stratum Z ⊂ S, with Raynaud extension 0 → T → G̃ → B → 0 over the formal completion
along Z (C4). For n ≥ 1, G[p^n] is a quasi-finite flat separated group scheme over S; over Z its
finite part G[p^n]^f sits in 0 → T[p^n] → G[p^n]^f → B[p^n] → 0 with T[p^n] of multiplicative type
of order p^{nr} and B[p^n] finite locally free of order p^{2n(g−r)}, so the order of G[p^n]^f drops
from p^{2ng} on the abelian locus to p^{n(2g−r)} on Z. On the generic fibre of a degeneration chart,
the Tate module of G is an extension 0 → T_pG̃ → T_pG → X ⊗ ℤ_p → 0 of the character-lattice term X
⊗ ℤ_p by the Tate module of the Raynaud extension. With the convention α_H: H(S) → ω_{H^D}
(T0/finite-hodge-tate-map), the Hodge–Tate map of the finite part vanishes on the toric piece T[p^n]
(its Cartier dual is étale, so ω_{T[p^n]^D} = 0) and induces α_{B[p^n]} on the abelian quotient;
dually, the Hodge–Tate map of the Cartier dual of T[p^n], an étale group, is an isomorphism onto
ω_{T[p^n]} (T0/multiplicative-hodge-tate-isomorphism), which is how the forms dt_i/t_i of the torus
appear in ω_G.

API:
  TauCeti.HodgeTate.semiAbelianTorsion [constructor] (not stated): G[p^n] for a semi-abelian G,
    quasi-finite flat, with its finite part on each stratum of constant torus rank.
  TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact [relation] (not stated): 0 → T[p^n] →
    G[p^n]^f → B[p^n] → 0 on a stratum Z of torus rank r.
  TauCeti.HodgeTate.semiAbelianTorsion_card [characterisation] (not stated): The finite part has
    order p^{n(2g−r)} on Z.
  TauCeti.HodgeTate.semiAbelianTateModule_extension [relation] (not stated): 0 → T_pG̃ → T_pG → X ⊗
    ℤ_p → 0 on the generic fibre of a degeneration chart.
  TauCeti.HodgeTate.semiAbelianHodgeTate_toric [compatibility] (not stated): α vanishes on the toric
    piece T[p^n], and the Hodge–Tate map of the dual of T[p^n] is the isomorphism of
    T0/multiplicative-hodge-tate-isomorphism onto ω_{T[p^n]}.

Unit tests:
  TauCeti.HodgeTate.semiAbelianTorsion_abelian [degenerate] (not stated): For r = 0 (G abelian) the
    construction is A[p^n], finite locally free of order p^{2ng}.
  TauCeti.HodgeTate.semiAbelianTorsion_torus [computation] (not stated): For G = 𝔾_m^g a split
    torus, G[p^n] = μ_{p^n}^g, of degree ng.
  TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height [non-example] (not stated): For the Tate
    curve over ℤ_p[[q]], E[p] is not finite over q = 0: its finite part there has order p, not p²; a
    constant-height p-divisible group over the chart does not exist.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant (construction): The Hasse invariant of a semi-abelian scheme

Let S be an 𝔽_p-scheme and G a semi-abelian scheme of relative dimension g over S, with ω_G =
e*Ω¹_{G/S} (locally free of rank g) and det ω_G its Hodge line. Let G^{(p)} be the pullback of G
along the absolute Frobenius of S. The Verschiebung V: G^{(p)} → G (the Verschiebung of the smooth
commutative group, compatible with Frobenius and multiplication by p; on the abelian locus it can
also be constructed by duality, and on degeneration charts through the Raynaud extension) induces
V*: ω_G → ω_{G^{(p)}} ≅ ω_G^{(p)}, and Ha(G/S) := det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)}). For G = A
abelian this is Scholze's Ha(A/S), and it equals FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2's
Hasse invariant Ha(A[p]) of the BT₁ A[p] under ω_{A[p]} = ω_A/p. On a split torus 𝔾_m^g, V* is an
isomorphism and Ha is a unit; on a degeneration chart Ha(G) = Ha(B) ⊗ (unit of the torus part)
through det ω_G ≅ det ω_T ⊗ det ω_B.

API:
  TauCeti.HodgeTate.semiAbelianHasse [constructor] (not stated): Ha(G/S) = det V* ∈ H⁰(S, (det
    ω_G)^{⊗(p−1)}).
  TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse [compatibility] (not stated): For G = A abelian,
    Ha(A/S) = Ha(A[p]) of R07.2 under ω_{A[p]} = ω_A/p.
  TauCeti.HodgeTate.semiAbelianHasse_baseChange [functoriality] (not stated): Ha commutes with base
    change S′ → S.
  TauCeti.HodgeTate.semiAbelianHasse_torus [compatibility] (not stated): On a split torus Ha is a
    unit (det V* is an isomorphism on ω_T).
  TauCeti.HodgeTate.semiAbelianHasse_raynaud [relation] (not stated): On a degeneration chart, Ha(G)
    = Ha(B)·u with u a unit, through det ω_G ≅ det ω_T ⊗ det ω_B.
  TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff [characterisation] (not stated): Ha(G/S) is a unit
    iff every geometric fibre is ordinary (T0/hasse-invariant-ordinary-locus).

Unit tests:
  TauCeti.HodgeTate.semiAbelianHasse_tateCurve [computation] (not stated): For the Tate curve over
    𝔽_p((q)), Ha = 1 with respect to the canonical differential dt/t.
  TauCeti.HodgeTate.semiAbelianHasse_torus_test [degenerate] (not stated): For G = 𝔾_m^g over S,
    Ha(G/S) is a unit.
  TauCeti.HodgeTate.semiAbelianHasse_supersingular [non-example] (not stated): For a supersingular
    elliptic curve over 𝔽̄_p, Ha = 0: Ha is not a unit on every fibre, and Ha does not detect
    supersingularity only through the order of E[p](𝔽̄_p) without V.
  TauCeti.HodgeTate.semiAbelianHasse_bt1 [compatibility] (not stated): For A abelian, Ha(A/S) equals
    R07.2's Ha(A[p]).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus (theorem): The Hasse invariant is invertible exactly on the ordinary locus

Let S be an 𝔽_p-scheme and A → S an abelian scheme of dimension g. Then Ha(A/S) is invertible if and
only if A is ordinary, i.e. for every geometric point x̄ of S, A[p](x̄) has p^g elements. For a
semi-abelian G with abelian part B on a stratum, Ha(G/S) is invertible at x̄ iff B_x̄ is ordinary.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification (theorem): The Hasse invariant on toroidal and minimal compactifications

Let X be the Siegel moduli space of principally polarised abelian schemes of dimension g with level
K^p (prime to p, neat) over ℤ_(p), X^tor a toroidal and X* the minimal compactification
(ShimuraCompactifications C5). Then Ha ∈ H⁰(X_{𝔽_p}, ω^{⊗(p−1)}) extends to Ha ∈ H⁰(X^tor_{𝔽_p},
ω^{⊗(p−1)}) as the Hasse invariant of the universal semi-abelian scheme, and descends to Ha ∈
H⁰(X*_{𝔽_p}, ω^{⊗(p−1)}): for g ≥ 2 by Hartogs, the boundary of X* having codimension g, and for g =
1 by inspection at the cusps (Tate curve). At a point x of X* lying in the boundary stratum of genus
g′ < g, Ha(x) is the Hasse invariant of the abelian part of the Raynaud extension at any preimage of
x in X^tor (Lemma 3.3.2), so the ordinary locus of X* contains the whole boundary in characteristic
p's toric directions and is described by the abelian parts.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/hodge-tate-boundary-extension (theorem): The finite-level Hodge–Tate map over the toroidal boundary

On the normalised full-level p^n toroidal Siegel model, the map on the open abelian locus HT:
(ℤ/p^n)^{2g} → ω_A/p^n extends to the universal semi-abelian conormal sheaf. On a boundary chart its
carrier is the principally polarised one-motive [Y → G̃] attached to the degeneration, whose
p^n-torsion has lattice, torus and abelian pieces; it is not the Cartier dual of the whole quasi-
finite G[p^n]. Pilloni–Stroh Proposition 1.5 gives the extension and chart compatibility in the
Siegel case. For Hilbert and GSp₄/F data the intended extension requires the corresponding one-
motive charts and identification of ω/p^n as a formally canonical coefficient sheaf in Lan Theorem
8.7; those additional hypotheses are recorded as gaps.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration (theorem): The Hodge–Tate filtration of an abelian variety through its Raynaud extension

Let C be a complete algebraically closed extension of ℚ_p and A an abelian variety over C of
dimension g. After semistable reduction (NeronModelsAndSemistableAbelianVarieties R11.3), let 𝒢̃
over O_C be the Raynaud extension of the connected Néron model, 0 → T → 𝒢̃ → B → 0 with T a torus of
rank r and B an abelian scheme of dimension g − r, so that A^an = 𝒢̃^rig/Λ with Λ a lattice of rank
r. Then T_pA is an extension 0 → T_p(𝒢̃[p^∞]) → T_pA → Λ ⊗ ℤ_p → 0, Lie A = Lie 𝒢̃, and the
Hodge–Tate filtration of A is that of the p-divisible group 𝒢̃[p^∞] (height 2g − r, dimension g):
Lie A ⊗ C(1) = Lie 𝒢̃ ⊗ C(1) ⊂ T_p(𝒢̃[p^∞]) ⊗ C ⊂ T_pA ⊗ C. Dually, under the Weil pairing the
C-linear Hodge–Tate map T_pA^∨ ⊗ C → ω_A is computed on the dual Raynaud extension; the torus part
T_p(T) = ℤ_p(1)^r of T_pA lies in the Hodge–Tate filtration, and the lattice part Λ ⊗ ℤ_p maps
isomorphically onto the toric forms of the graded piece.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/harder-narasimhan-filtration (definition): The Harder–Narasimhan filtration of a finite flat group scheme

Let K, v be as in T0/fargues-degree and G ≠ 0 a finite flat commutative group scheme of p-power
order over O_K; 'subgroup' means closed finite flat subgroup scheme. G is semi-stable if μ(G′) ≤
μ(G) for every nonzero subgroup G′. Every such G has a unique filtration 0 = G₀ ⊊ G₁ ⊊ … ⊊ G_k = G
by subgroups with G_{i+1}/G_i semi-stable and μ(G_i/G_{i−1}) > μ(G_{i+1}/G_i); its Harder–Narasimhan
polygon HN(G) is the concave polygon from (0, 0) to (ht G, deg G) with slopes μ(G_i/G_{i−1}) of
multiplicity ht(G_i/G_{i−1}). For every subgroup G′, deg G′ ≤ HN(G)(ht G′), and HN(G) is the concave
envelope of the points (ht G′, deg G′). The filtration is Aut(G)-stable, compatible with valued
extensions (K henselian), its slope-1 step is the multiplicative part and its slope-0 quotient the
étale part, and Cartier duality exchanges the filtration of G^D with the orthogonals of the steps of
G, slopes λ ↦ 1 − λ.

API:
  TauCeti.HodgeTate.farguesSlope_le_of_semistable [characterisation] (not stated): G is semi-stable
    iff μ(G′) ≤ μ(G) for all nonzero subgroups G′, iff μ(G) ≤ μ(G/G′) for all proper nonzero G′.
  TauCeti.HodgeTate.harderNarasimhanFiltration [constructor] (not stated): The unique filtration
    with semi-stable graded pieces of strictly decreasing slopes.
  TauCeti.HodgeTate.harderNarasimhanPolygon [constructor] (not stated): HN(G): the concave polygon
    of the filtration.
  TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon [relation] (not stated): deg G′ ≤ HN(G)(ht G′)
    for every subgroup G′.
  TauCeti.HodgeTate.harderNarasimhanFiltration_dual [relation] (not stated): The filtration of G^D
    is formed by the Cartier duals of the quotients G/G_i, with slopes 1 − μ_i.
  TauCeti.HodgeTate.harderNarasimhanFiltration_aut [functoriality] (not stated): Every automorphism
    of G preserves the filtration; it commutes with valued field extensions.

Unit tests:
  TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary [computation] (not stated): For G = μ_p ×
    ℤ/p over O_K the filtration is 0 ⊂ μ_p ⊂ G with slopes 1 and 0.
  TauCeti.HodgeTate.harderNarasimhanFiltration_semistable [degenerate] (not stated): If G is semi-
    stable (e.g. G = E[p] for E supersingular with Ha(E) ≥ p/(p+1)) the filtration is 0 ⊂ G.
  TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale [non-example] (not stated): The HN
    filtration is not the connected–étale filtration: for E with Ha(E) < p/(p+1) the first step is
    the canonical subgroup, which is neither connected-étale nor multiplicative in general (deg C ∈
    (0, 1)).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T0/degree-different (lemma): The discriminant divisor is the different of the group algebra

Let A be a ring, t a regular element, and B a finite syntomic A-algebra étale over A[1/t]. Its trace
codifferent D^{-1}_{B/A} is an invertible fractional B-ideal, and its inverse D_{B/A} is Fitt₀^B
Ω¹_{B/A} (Fargues Proposition 1 calls this ideal Δ_{B/A}). The discriminant of the trace pairing
over A is its norm, rather than this B-ideal itself. For a finite locally free commutative
generically étale group G = Spec B over S = Spec A, D_{G/S} = f*δ_G, where δ_G = Fitt₀^A ω_G. Thus
e*D^{-1}_{G/S} = δ_G^{-1} as an invertible fractional A-module; it is not ω_G. In the monogenic
valuation-ring case B = O_K[T]/(f), f(0) = 0, ω_G = O_K/(f′(0)) and deg G = v(f′(0)) = Σ_{x≠0}v(x),
counting all geometric roots.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T1/abelian-relative-comparison (comparison): The relative de Rham comparison for abelian schemes

Let K be a complete discretely valued extension of ℚ_p with perfect residue field, X a smooth adic
space over K and f: A → X an abelian scheme of relative dimension g (the analytification of an
algebraic abelian scheme over a smooth K-variety, as in the Shimura-variety applications). Let 𝕃 =
(R¹f_*ℤ_p)^∨ ≅ T_pA, viewed as a ℤ_p-local system on X_proét, and ℋ = H¹_dR(A/X) with its
Gauss–Manin connection ∇ and Hodge filtration 0 → ω_A → ℋ → Lie(A^∨) → 0. Then there is a canonical
isomorphism of OB_dR-modules with connection and filtration R¹f_*ℤ_p ⊗ OB_dR ≅ ℋ ⊗_{O_X} OB_dR on
X_proét, compatible with Frobenius-free tensor operations (duals, tensor products, the Weil pairing
up to the twist ℤ_p(1)) and functorial in homomorphisms of abelian schemes. Taking gr⁰ gives the
relative Hodge–Tate sequence of HodgeTateAndCanonicalSubgroups T2. Conventions (pinned by
CohomologyComparisons CP.0 and ClassicalAdicEtaleCohomology H0): ℤ_p(1) = T_pμ_{p^∞}, C(i) = C ⊗
ℤ_p(1)^{⊗i}, the cyclotomic character has Hodge–Tate weight +1, Fil^r B_dR = t^r B_dR⁺ decreasing;
so V_pA = T_pA ⊗ ℚ_p has Hodge–Tate weights 0 and 1, the weight-1 part being Lie(A) ⊗ C(1). These
are the twist, weight and tensor-filtration conventions that HodgeTateAndCanonicalSubgroups
T6:comparison imports from this layer.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T1/hodge-tate-graded-comparison (comparison): The graded comparison is the Hodge–Tate map of T0

The rational Hodge–Tate quotient T_pA^∨ ⊗ C → ω_A for an abelian variety over a complete
algebraically closed C agrees with the linearisation of the finite-level character-differential map
through the Weil pairing. For good reduction this is the integral-to-rational compatibility
referenced in CS17 Remark 4.2.8; general reduction uses the Raynaud construction. In families the
quotient is obtained from the two B_dR^+-lattices M and M₀ of CS17 Theorems 2.2.3–2.2.5 and their
induced Hodge–Tate filtration. This is not the assertion that gr⁰ of the structural period sheaf
OB_dR is Ô_X on a positive-dimensional base.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison (theorem): Hodge tensors under the p-adic comparison

Let (G, X) be a Shimura datum of Hodge type with a symplectic embedding G ↪ GSp(V) and tensors (s_α)
⊂ V^⊗ cutting out G, and A → Sh_K the induced abelian scheme. The tensors s_α define absolute Hodge
cycles s_{α,dR} ∈ ℋ^⊗ and s_{α,ét} ∈ (V_pA)^⊗ (using homology, the dual of R¹f_*ℚ_p)
(AutomorphicBundles B1), and under the relative comparison of T1/abelian-relative-comparison,
s_{α,ét} ⊗ 1 ↦ s_{α,dR} ⊗ 1. Consequently the comparison isomorphism and its Hodge–Tate graded piece
are compatible with the G-structures, and the resulting rational frame torsors are G_{ℚ_p}-torsors.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/p-divisible-hodge-tate-sequence (theorem): The Hodge–Tate exact sequence of a p-divisible group over O_C

Let C be a complete algebraically closed extension of ℚ_p and G a p-divisible group over O_C of
height h and dimension d, with Cartier dual G^D. Then the sequence 0 → Lie(G) ⊗_{O_C} C(1) → T_pG
⊗_{ℤ_p} C → ω_{G^D} ⊗_{O_C} C → 0 is exact, where the second map is α_G ⊗ C (T0/p-divisible-hodge-
tate-map) and the first is the C-linearisation of the dual map α_{G^D}^∨ twisted by ℤ_p(1) through
the Cartier pairing T_pG × T_pG^D → ℤ_p(1). Integrally, α_G ⊗ 1: T_pG ⊗ O_C → ω_{G^D} has cokernel
killed by p^{1/(p−1)} (T0/fargues-hodge-tate-cokernel) and the composite of the two maps is zero.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence (theorem): The Hodge–Tate sequence of an abelian variety

Let C be a complete algebraically closed extension of ℚ_p and A an abelian variety over C of
dimension g. There is a canonical exact sequence 0 → Lie(A^∨)(1) → T_pA^∨ ⊗_{ℤ_p} C → ω_A → 0 (the
roadmap's convention, with Lie(A^∨)(1) := Lie(A^∨) ⊗ C(1)), functorial in A, compatible with
isogenies, with endomorphisms and with polarisations; for A defined over a complete discretely
valued K ⊂ C it is Gal(C/K)-equivariant. Dually, the Hodge–Tate filtration Lie A ⊗ C(1) ⊂ T_pA ⊗ C
is a Lagrangian subspace for the Weil pairing of any principal polarisation. For A with good
reduction it is the sequence of T2/p-divisible-hodge-tate-sequence for G = A^∨[p^∞]; in general it
is obtained through the Raynaud extension (T0/raynaud-hodge-tate-filtration).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence (theorem): The relative Hodge–Tate sequence on the pro-étale site

Let X be a smooth adic space over a complete algebraically closed C/ℚ_p and A → X an abelian scheme
(analytified). On X_proét there is a canonical exact sequence of Ô_X-modules 0 → Lie(A^∨) ⊗ Ô_X(1) →
T_pA^∨ ⊗_{ℤ_p} Ô_X → ω_A ⊗ Ô_X → 0, with T_pA^∨ the ℤ_p-local system of A^∨, specialising at every
rank-one point to T2/abelian-hodge-tate-sequence and compatible with pullback, isogenies,
endomorphisms, polarisations and (for Hodge type) the tensors s_α.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point (construction): The Hodge–Tate filtration as a point of the flag variety

Let Λ be a free ℤ_p-module of rank 2g with a perfect alternating pairing ψ (the Siegel case; Λ with
an 𝒪-action and hermitian or symplectic form in the PEL case), and Fl the Lagrangian Grassmannian of
rank-g quotients Λ ⊗ C ↠ W with Lagrangian kernel (Fl ⊂ Gr(g, Λ), Mathlib's Module.Grassmannian of
rank-g quotients). For an abelian variety A over C with a symplectic similitude trivialisation β: Λ
≅ T_pA^∨, the Hodge–Tate quotient T_pA^∨ ⊗ C ↠ ω_A defines π_HT(A, β) ∈ Fl(C). Fl carries the
Plücker coordinates s_J (J ⊂ {1, …, 2g}, |J| = g, J any g-element subset) and the
binomial(2g,g)-indexed affinoid charts Fl_J = {|s_{J′}| ≤ |s_J| for all J′}, which cover Fl. The
full GSp_2g(ℤ_p) action does not permute this finite chart family. The construction is functorial:
for γ ∈ GSp(Λ ⊗ ℚ_p) with γΛ ⊂ Λ, π_HT(A′, β′) = γ·π_HT(A, β) when (A′, β′) is the corresponding
isogenous pair.

API:
  TauCeti.HodgeTate.hodgeTateFlagPoint [constructor] (typed component: flagPointOfQuotient (ambient
    Grassmannian only)): π_HT(A, β) ∈ Fl(C), the Hodge–Tate quotient of T_pA^∨ ⊗ C transported by β.
  TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian [characterisation] (not stated): The kernel of
    the quotient is Lagrangian for ψ.
  TauCeti.HodgeTate.plucker [constructor] (not stated): The Plücker coordinates s_J of a rank-g
    quotient of Λ ⊗ C.
  TauCeti.HodgeTate.lagrangianChart [constructor] (not stated): Fl_J = {|s_{J′}| ≤ |s_J| ∀J′}, for
    every g-element subset J of {1,…,2g}.
  TauCeti.HodgeTate.lagrangianChart_cover [relation] (not stated): The binomial(2g,g)-indexed Fl_J
    cover Fl; no permutation action of the full integral symplectic group on this family is
    asserted.
  TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant [functoriality] (not stated): π_HT(A′, β′) =
    γ·π_HT(A, β) for the isogenous pair attached to γ.

Unit tests:
  TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic [computation] (not stated): For E with
    ordinary reduction and β adapted to the connected–étale sequence, π_HT(E, β) is a ℚ_p-rational
    point of ℙ¹.
  TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian [compatibility] (not stated): π_HT(A, β) is an
    element of Mathlib's Module.Grassmannian C (C^{2g}) g (rank-g quotients), lying in the
    Lagrangian locus.
  TauCeti.HodgeTate.lagrangianChart_count [computation] (not stated): The chart index set has
    cardinality binomial(2g,g), hence six for g = 2. Lagrangian relations may identify some indexed
    chart domains; cardinality here concerns indices.
  TauCeti.HodgeTate.hodgeTateFlagPoint_not_line [non-example] (not stated): For g = 1 the kernel
    line Lie(A^∨)(1) is its own symplectic orthogonal and determines exactly the same rank-one
    quotient point via its kernel. The tautological subbundle is Lie(A^∨)(1), whereas the
    tautological quotient bundle pulls back to ω_A; confusing these bundles gives the wrong twist.
  TauCeti.HodgeTate.lagrangianChart_not_permuted [non-example] (not stated): For g = 1, γ = (1 0; 1
    1) sends the unit-disc chart D₀ by z ↦ z/(z+1). Its image contains 0 and ∞ (images of 0 and −1),
    so it is neither D₀ nor D∞; the full integral group does not permute the two standard charts.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/pel-hodge-type-filtration (theorem): PEL and Hodge-type conditions on the Hodge–Tate filtration

(PEL) Let (B, *, V, ψ) be a PEL datum with order 𝒪_B and A an abelian variety over C with 𝒪_B-action
and polarisation of the corresponding type. Then the Hodge–Tate filtration Lie A ⊗ C(1) ⊂ T_pA ⊗ C
is 𝒪_B ⊗ C-stable and Lagrangian for ψ, so π_HT lies in the closed subvariety Fl_{G,μ} ⊂ Fl of 𝒪_B-
stable Lagrangian quotients with the Kottwitz determinant condition of the Hodge cocharacter μ.
(Hodge type) For (G, X) of Hodge type with tensors (s_α) and β: Λ ≅ T_pA^∨ carrying s_α to s_{α,ét},
π_HT(A, β) lies in Fl_{G,μ} = G/P_μ ⊂ Fl, the flag variety of filtrations of type μ preserved by the
tensors.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction (construction): The Hodge–Tate parabolic reduction and its Levi torsor

Let (G, X) be a Shimura datum of Hodge (or PEL) type, Sh_K → Spec E its Shimura variety at level K =
K_pK^p, 𝒮 the adic space over C of Sh_K, and A → 𝒮 the abelian scheme with tensors. On 𝒮_proét, the
sheaf of trivialisations β: Λ ⊗ ℚ_p ≅ V_pA^∨ respecting tensors (up to the similitude) is a
G(ℚ_p)-torsor 𝒫_ét, and the relative Hodge–Tate filtration (T2/relative-hodge-tate-sequence) defines
a reduction of 𝒫_ét ×^{G(ℚ_p)} G_{Ô} to the parabolic P_μ: the P_μ-torsor 𝒫_HT of trivialisations
sending the standard filtration of type μ to the Hodge–Tate filtration. Its Levi quotient ℳ_HT :=
𝒫_HT ×^{P_μ} M_μ is the Hodge–Tate Levi torsor. Both are functorial in K (finite-level Hecke maps),
in morphisms of data and in base change of C.

API:
  TauCeti.HodgeTate.etaleFrameTorsor [constructor] (not stated): 𝒫_ét is the G(ℚ_p)-torsor of
    rational tensor-preserving trivialisations Λ ⊗ ℚ_p ≅ V_pA^∨.
  TauCeti.HodgeTate.hodgeTateParabolicReduction [constructor] (not stated): 𝒫_HT is the P_μ-
    reduction of 𝒫_ét ×^{G(ℚ_p)} G_Ô defined by the relative Hodge–Tate filtration.
  TauCeti.HodgeTate.hodgeTateLeviTorsor [constructor] (not stated): ℳ_HT = 𝒫_HT ×^{P_μ} M_μ.
  TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke [functoriality] (not stated): Compatible with
    the finite-level Hecke maps Sh_{K′} → Sh_K and with prime-to-p Hecke correspondences.
  TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange [functoriality] (not stated): Compatible
    with base change C → C′ and with morphisms of Shimura data.

Unit tests:
  TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve [computation] (not stated): For GL₂ and the
    modular curve, ℳ_HT corresponds to the pair of line bundles (ω^{-1}(1), ω) ⊗ Ô.
  TauCeti.HodgeTate.hodgeTateParabolicReduction_torus [degenerate] (not stated): For a torus datum
    with μ central, P_μ = M_μ = T and 𝒫_HT = 𝒫_ét ×^{T(ℚ_p)} T_Ô.
  TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge [non-example] (not stated): The Hodge–Tate
    parabolic P_μ is opposite to the parabolic stabilising the Hodge filtration (AutomorphicBundles
    B0/hodge-parabolic-convention); using the Hodge filtration's parabolic gives a different
    reduction whose Levi torsor differs by the inverse of μ.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/de-rham-hodge-tate-levi-comparison (theorem): The de Rham and Hodge–Tate Levi torsors agree

In the situation of T2/hodge-tate-parabolic-reduction, let ℳ_dR be the M_μ-torsor obtained from the
Hodge filtration of H¹_dR(A/𝒮) with its tensors (the de Rham Levi torsor of AutomorphicBundles
B1/filtration-reduction), pulled back to 𝒮_proét and extended to Ô. Then there is a canonical
isomorphism of M_μ-torsors ℳ_dR ×^{M_μ} M_{μ,Ô} ≅ ℳ_HT, compatible with Hecke maps and morphisms of
data, given by the Tate-normalised graded relative comparison and equivariant descent (Caraiani–Scholze Lemma 2.3.8,
Proposition 2.3.9). Consequently the automorphic vector bundle 𝒱_ρ of a representation ρ of M_μ
satisfies 𝒱_ρ ⊗ Ô ≅ ℳ_HT ×^{M_μ} ρ.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T2/filtered-fibre-functor (definition): Filtered fibre functors and their type

Let G be a reductive group over a field E of characteristic 0, R an E-algebra and ω_R: Rep_E(G) →
Mod_R the fibre functor V ↦ V ⊗ R. An exact tensor filtration of ω_R is a functorial decreasing (or,
in Caraiani–Scholze's normalisation, ascending) filtration Fil^• of each V ⊗ R by direct summands,
compatible with tensor products, duals and exact sequences. Its type at a geometric point is the
conjugacy class of a cocharacter μ: 𝔾_m → G splitting it. Fpqc-locally on R (étale-locally when R is
a field extension, and pro-étale locally on Ô-modules of perfectoid spaces), an exact tensor
filtration of constant type μ is split by a cocharacter in the class of μ, so the frames
transforming the standard filtration Fil^•(μ) into Fil^• form a P_μ-torsor, P_μ the parabolic
stabilising Fil^•(μ). Exact tensor filtrations of type μ on ω_R are in bijection with R-points of
the flag variety G/P_μ.

API:
  TauCeti.HodgeTate.ExactTensorFiltration [structure] (not stated): Exact tensor filtrations of the
    fibre functor ω_R of Rep_E(G).
  TauCeti.HodgeTate.ExactTensorFiltration.type [projection] (not stated): The type: the conjugacy
    class of a splitting cocharacter (locally constant on Spec R).
  TauCeti.HodgeTate.ExactTensorFiltration.splitLocally [characterisation] (not stated): Fpqc-locally
    a filtration of type μ is Fil^•(gμg^{-1}) for some g.
  TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor [constructor] (not stated): The P_μ-torsor of
    frames carrying Fil^•(μ) to the given filtration.
  TauCeti.HodgeTate.ExactTensorFiltration.equivFlag [equivalence] (not stated): Filtrations of type
    μ ≅ (G/P_μ)(R).

Unit tests:
  TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian [compatibility] (not stated): For G = GL_n
    and μ of type (1^r, 0^{n−r}), filtrations of type μ are the elements of Mathlib's
    Module.Grassmannian R (R^n) (n − r).
  TauCeti.HodgeTate.ExactTensorFiltration.trivial [degenerate] (not stated): For μ central (e.g. G a
    torus) the only filtration of type μ is the one given by the weights of μ, and the frame torsor
    is the trivial G-torsor.
  TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration [non-example] (not stated): For G
    = GSp_{2g}, a filtration of the standard representation by a rank-g summand that is not
    Lagrangian is not an exact tensor filtration: it is not compatible with the symplectic form, an
    invariant tensor.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood (definition): The Hasse valuation and Hasse neighbourhoods

(Points) For a truncated Barsotti–Tate group G over O_K (K complete valued over ℚ_p, v(p) = 1), the
Hasse valuation is Ha(G) := min(v(Ha(G ⊗ O_K/p)), 1) ∈ [0, 1], where Ha(G ⊗ O_K/p) is the Hasse
invariant of the BT₁ G[p] ⊗ O_K/p (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2) computed in a
basis of det ω; it is independent of the basis and of valued extensions, and Ha(G) = Ha(G^D).
(Families) For R a p-adically complete flat ℤ_p^cycl-algebra (or O_K-algebra) and A/R an abelian (or
semi-abelian) scheme with reduction A₁/(R/p), A satisfies the Hasse condition of radius ε (0 ≤ ε <
1, ε ∈ v(ℤ_p^cycl)) if Ha(A₁) divides p^ε, i.e. there is u ∈ H⁰(Spf R, ω^{⊗(1−p)}) with u·Ha(A₁) =
p^ε in R/p. For a formal model 𝔛 of a Shimura variety with universal A, the Hasse neighbourhood 𝔛(ε)
is the formal scheme of pairs (f, u) as above modulo u ∼ u(1 + p^{1−ε}h); its generic fibre 𝒳(ε) is
the open {|Ha| ≥ |p|^ε} of the generic fibre, and 𝒳(ε) ⊂ 𝒳(ε′) for ε ≤ ε′.

API:
  TauCeti.HodgeTate.hasseValuation [constructor] (not stated): Ha(G) ∈ [0, 1] for a truncated BT
    group over O_K.
  TauCeti.HodgeTate.hasseValuation_dual [relation] (not stated): Ha(G^D) = Ha(G).
  TauCeti.HodgeTate.hasseValuation_eq_zero_iff [characterisation] (not stated): Ha(G) = 0 iff G is
    ordinary.
  TauCeti.HodgeTate.hasseNeighbourhood [constructor] (not stated): 𝔛(ε): pairs (f, u) with u·Ha =
    p^ε mod p, modulo u ∼ u(1 + p^{1−ε}h).
  TauCeti.HodgeTate.hasseNeighbourhood_generic [characterisation] (not stated): The generic fibre of
    𝔛(ε) is {|Ha| ≥ |p|^ε}.
  TauCeti.HodgeTate.hasseNeighbourhood_mono [relation] (not stated): 𝔛(ε) → 𝔛(ε′) is an open
    immersion on generic fibres for ε ≤ ε′.

Unit tests:
  TauCeti.HodgeTate.hasseValuation_ordinary [degenerate] (not stated): Ha(μ_{p^∞}[p] ⊕ ℚ_p/ℤ_p[p]) =
    0.
  TauCeti.HodgeTate.hasseValuation_le_one [characterisation] (not stated): 0 ≤ Ha(G) ≤ 1 for every
    BT₁ over O_K (truncation at 1, because it is computed in O_K/p).
  TauCeti.HodgeTate.hasseNeighbourhood_zero [computation] (not stated): 𝒳(0) is the ordinary locus
    {|Ha| = 1}.
  TauCeti.HodgeTate.hasseNeighbourhood_not_blowup [non-example] (not stated): 𝔛(ε) is not the full
    admissible blow-up of (H̃a, p^ε): the chart where p^ε generates is omitted.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/subgroup-lifting (theorem): Lifting subgroups modulo p with explicit error

Let R be a p-adically complete flat ℤ_p^cycl-algebra, G a finite locally free commutative group
scheme over R and C₁ ⊂ G ⊗_R R/p a finite locally free subgroup. If, for H = (G ⊗ R/p)/C₁,
multiplication by p^ε on the co-Lie complex ℓ̌_H is homotopic to 0 for some 0 ≤ ε < 1/2, then there
is a finite locally free subgroup C ⊂ G over R with C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/section-rigidity (lemma): Sections agreeing to high order are equal

Let R be a p-adically complete flat ℤ_p^cycl-algebra and X/R a scheme with Ω¹_{X/R} killed by p^ε, ε
≥ 0. If s, t ∈ X(R) agree in X(R/p^δ) for some δ > ε, then s = t.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup (definition): Weak and strong canonical subgroups of level m

Let R be a p-adically complete flat ℤ_p^cycl-algebra and A → Spec R an abelian scheme of dimension g
with reduction A₁ over R/p, and m ≥ 1. A has a weak canonical subgroup of level m if
Ha(A₁)^{(p^m−1)/(p−1)} divides p^ε for some ε < 1/2; it is then the unique closed subgroup C_m ⊂
A[p^m], finite locally free over R, with C_m ≡ ker F^m modulo p^{1−ε} (T3/canonical-subgroup-
theorem). If moreover Ha(A₁)^{p^m} divides p^ε, C_m is a (strong) canonical subgroup. In valuation
terms at a rank-one point, weak means Ha ≤ ε(p−1)/(p^m − 1) and strong means Ha ≤ ε/p^m. The same
definition applies to truncated Barsotti–Tate groups of level ≥ m over R, and to semi-abelian
schemes on the toroidal boundary through the finite part (T0/semi-abelian-torsion).

API:
  TauCeti.HodgeTate.canonicalSubgroup [constructor] (not stated): C_m ⊂ A[p^m] on the locus where
    Ha^{(p^m−1)/(p−1)} | p^ε, ε < 1/2.
  TauCeti.HodgeTate.canonicalSubgroup_modFrobenius [characterisation] (not stated): C_m ≡ ker F^m
    mod p^{1−ε}, and C_m is the unique closed finite locally free subgroup with this property.
  TauCeti.HodgeTate.canonicalSubgroup_points [characterisation] (not stated): C_m(R′) ⊇ {s ∈
    A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality for R′ integrally closed in R′[1/p]
    (corrected form of Scholze's Corollary 3.2.6, PAPER-SCHOLZE-15/E17).
  TauCeti.HodgeTate.canonicalSubgroup_degree [relation] (not stated): At a rank-one point with
    Ha(A[p^m]) < 1/(2p^{m−1}) (p ≥ 5), deg C_m = mg − ((p^m − 1)/(p − 1))·Ha.
  TauCeti.HodgeTate.canonicalSubgroup_isotropic [relation] (not stated): C_m is maximal totally
    isotropic for the Weil pairing of a principal polarisation.
  TauCeti.HodgeTate.canonicalSubgroup_baseChange [functoriality] (not stated): Formation of C_m
    commutes with base change R → R′ of p-adically complete flat algebras.
  TauCeti.HodgeTate.canonicalSubgroup_level [relation] (not stated): C_{m′} = C_m[p^{m′}] for m′ ≤ m
    (strong subgroups).

Unit tests:
  TauCeti.HodgeTate.canonicalSubgroup_ordinary [degenerate] (not stated): If Ha(A₁) is a unit, C_m =
    A[p^m]^0 (multiplicative).
  TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree [computation] (not stated): For E elliptic over
    O_C with Ha(E[p]) = w < 1/2 and p ≥ 5, deg C₁ = 1 − w and deg(E[p]/C₁) = w.
  TauCeti.HodgeTate.canonicalSubgroup_not_constant [non-example] (not stated): C_m is in general not
    isomorphic to the constant group (ℤ/p^m)^g over R: for A ordinary it is multiplicative,
    μ_{p^m}^g étale-locally; only its geometric generic points are (ℤ/p^m)^g.
  TauCeti.HodgeTate.canonicalSubgroup_points_strict [non-example] (not stated): The printed equality
    of Corollary 3.2.6 fails over non-normal R′: for R′ = {(a, b) ∈ O_C² | a ≡ b mod p^{1/(p−1)}}, A
    ordinary, ε = 0, s = (ζ_p, 1) ∈ C₁(R′) is not ≡ 0 mod p^{1/p}.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem (theorem): Existence, uniqueness and characterisations of canonical subgroups

(1) (Families, all p.) Let R be a p-adically complete flat ℤ_p^cycl-algebra and A/R an abelian
scheme with Ha(A₁)^{(p^m−1)/(p−1)} | p^ε, ε < 1/2. There is a unique closed subgroup C_m ⊂ A[p^m],
finite locally free over R, with C_m = ker F^m modulo p^{1−ε}; for every p-adically complete flat
R-algebra R′, C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}, with equality when R′ is
integrally closed in R′[1/p]. (2) (Points, p ≠ 2.) Let G be a truncated Barsotti–Tate group of level
n, height h and dimension d < h over O_C with Ha(G) < 1/(2p^{n−1}) if p ≥ 5 and Ha(G) < 1/3^n if p =
3. Then the Harder–Narasimhan filtration of G (Fargues 2010) has a step C with C(O_C) free of rank d
over ℤ/p^n; deg(G/C) = ((p^n − 1)/(p − 1))·Ha(G); for 1 ≤ k ≤ n, C_k := C[p^k] is the analogous step
of G[p^k] and C_k ⊗ O_C/p^{1−p^{k−1}Ha(G)} is the kernel of F^k; C(O_C) = ker α_{G,
n−((p^n−1)/(p−1))Ha(G)}, the kernel of the Hodge–Tate map of G reduced modulo
p^{n−((p^n−1)/(p−1))Ha(G)}; and C(O_C)^⊥ ⊂ G^D(O_C) is the corresponding step of G^D. When G =
A[p^n] for A as in (1) over R = O_C and both apply, the two subgroups coincide.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties (theorem): Levels, functoriality, duality and generic points of canonical subgroups

Let R be a p-adically complete flat ℤ_p^cycl-algebra and A, B abelian schemes over R; canonical
means strong (T3/canonical-subgroup). (i) If A has a canonical subgroup C_m of level m, it has one
of every level m′ ≤ m, and C_{m′} = C_m[p^{m′}] ⊂ C_m. (ii) If f: A → B is a homomorphism and both
have canonical subgroups of level m, then f(C_m) ⊂ D_m; in particular C_m is stable under
endomorphisms (e.g. an 𝒪_F-action). (iii) For a principal polarisation λ, C_m is maximal totally
isotropic for the Weil pairing on A[p^m], and pointwise C_m(O_C)^⊥ ⊂ A^∨[p^m](O_C) is the canonical
subgroup of A^∨ at every rank-one point (p ≠ 2: Fargues 2011, Proposition 11 and Corollaire 1). (iv)
If x̄ is a geometric point of Spec R[1/p], C_m(x̄) ≅ (ℤ/p^m)^g. (v) Formation of C_m commutes with
base change R → R′.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius (theorem): Quotients by canonical and anticanonical subgroups and the Hasse radius

(1) Let A/R have a canonical subgroup C_{m₁} of level m₁ (radius ε < 1/2). Then Ha(A/C_{m₁}) =
Ha(A)^{p^{m₁}} modulo p^{1−ε}, and B := A/C_{m₁} has a canonical subgroup D_{m₂} of level m₂ iff A
has one of level m = m₁ + m₂; then 0 → C_{m₁} → C_m → D_{m₂} → 0 is exact and compatible with 0 →
C_{m₁} → A → B → 0. (2) (Points, p ≠ 2.) For a BT₂ G over O_C with Ha(G) < 1/(p+1) and C its
canonical subgroup of level 1, Ha(p^{-1}C/C) = p·Ha(G); if 1/(p+1) ≤ Ha(G) < 1/2 then Ha(p^{-1}C/C)
≥ 1 − Ha(G). (3) (Anticanonical quotients.) If A′ has a weak canonical subgroup C′ of level 1 on
𝔛(ε), ε < 1/2, and D ⊂ A′[p] is a subgroup of order p^g with D ∩ C′ = 0, then A′/D has Hasse
valuation Ha(A′)/p, and (A′/D)/(A′[p]/D) ≅ A′: dividing by a canonical subgroup multiplies the Hasse
radius by p, dividing by an anticanonical subgroup divides it by p.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-hodge-tate (theorem): The Hodge–Tate map of the dual canonical subgroup

Let p ≥ 3, C/ℚ_p complete algebraically closed, and G/O_C a p-divisible group of dimension g with
Hodge height w in the Fargues–AIP level-n range. Set δ = ((p^n−1)/(p−1))w and let C_n be its
canonical subgroup. Fargues Theorem 6(7) identifies C_n(O_C) with the kernel of the Hodge–Tate map
truncated at n−δ. AIP15 Proposition 3.2.1 gives ω_{G[p^n]}/p^{n−δ} ≅ ω_{C_n}/p^{n−δ}, and the
linearised map C_n^D(O_C) ⊗ O_C → ω_{C_n} has cokernel of degree w/(p−1). It need not be surjective
when w > 0, and ω_{C_n} need not equal ω_G/p^n. An isomorphism from the dual canonical subgroup is
obtained after using the modified lattice and its smaller quotient, as in T5/integral-lattice-
properties. The family version needs the local-freeness and descent theorem of AIP, with explicit
formal-model hypotheses; it is not deduced solely by checking rank-one points and normality.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T3/hilbert-canonical-subgroup (theorem): Canonical subgroups of Hilbert–Blumenthal abelian schemes at arbitrary p

Let F be a totally real field of degree g, p any prime (possibly ramified in F, possibly 2), 𝒪_p =
𝒪_F ⊗ ℤ_p, and A a Hilbert–Blumenthal abelian scheme (𝒪_F-action, Rapoport or Deligne–Pappas
condition as in HilbertModularVarietiesAndShimuraCurves H2) over a p-adically complete flat
O-algebra R lying over the Hasse neighbourhood X(ε) for the total Hasse invariant. If ε ≤ p^{−(n+1)}
(a uniform sufficient radius for every p, used in the BHW formal construction), then A has a
canonical subgroup C_n ⊂ A[p^n] of level n (T3/canonical-subgroup); it is 𝒪_F-stable (T3/canonical-
subgroup-properties (ii)); its integral group scheme is finite locally free of rank p^{ng} over R
and in general not étale (its special fibre may be multiplicative); and at every geometric point x̄
of the generic fibre C_n(x̄) is a free 𝒪_F/p^n-module of rank one. The Hodge–Tate position bounds of
HodgeTateAndCanonicalSubgroups T4 use stronger bounds, recorded separately there.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci (definition): Canonical and anticanonical loci at Γ₀(p^n)-level

Let X be the Siegel, Hilbert or PEL Shimura variety at prime-to-p level with Hasse neighbourhoods
X(ε) (T3/hasse-neighbourhood), ε small enough that the universal (semi-)abelian scheme A over X(ε)
has a weak canonical subgroup C ⊂ A[p] of level 1 and, where needed, a canonical subgroup C_n of
level n (T3/canonical-subgroup). Let X_{Γ₀(p^n)} parametrise (A, D) with D ⊂ A[p^n] a totally
isotropic (𝒪_F-stable, for Hilbert data locally free of rank one over 𝒪_F/p^n on geometric points)
subgroup of the appropriate order, and X_{Γ₀(p^n)}(ε) the preimage of X(ε) under (A, D) ↦ A. The
canonical locus X_{Γ₀(p^n)}(ε)_c is the open and closed subspace where D = C_n; the anticanonical
locus X_{Γ₀(p^n)}(ε)_a is the open and closed subspace where D[p] ∩ C = 0. Both are defined on
generic fibres by these subgroup conditions, and on formal models through the integral C_n and the
schematic closure of D.

API:
  TauCeti.HodgeTate.canonicalLocus [constructor] (not stated): X_{Γ₀(p^n)}(ε)_c = {(A, D) : D =
    C_n}.
  TauCeti.HodgeTate.anticanonicalLocus [constructor] (not stated): X_{Γ₀(p^n)}(ε)_a = {(A, D) : D[p]
    ∩ C = 0}.
  TauCeti.HodgeTate.anticanonicalLocus_isClopen [characterisation] (not stated): Both loci are open
    and closed in X_{Γ₀(p^n)}(ε).
  TauCeti.HodgeTate.anticanonicalLocus_forget [functoriality] (not stated): The forgetful maps
    X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a, (A, D) ↦ (A, D[p^n]), give the anticanonical tower.
  TauCeti.HodgeTate.canonicalLocus_section [relation] (not stated): X(ε) → X_{Γ₀(p^n)}(ε)_c, A ↦ (A,
    C_n), is an isomorphism (T4/canonical-locus-isomorphism).

Unit tests:
  TauCeti.HodgeTate.anticanonicalLocus_ordinary [degenerate] (not stated): At ε = 0 (ordinary
    locus), the anticanonical locus parametrises D étale-locally complementary to A[p]^0, i.e. D ≅
    (ℤ/p^n)^g étale-locally.
  TauCeti.HodgeTate.canonicalLocus_modularCurve [computation] (not stated): For the modular curve
    and n = 1 the two loci partition X_{Γ₀(p)}(ε) into the canonical component (degree 1 over X(ε))
    and the anticanonical component (degree p over X(ε)).
  TauCeti.HodgeTate.anticanonicalLocus_not_complement [non-example] (not stated): For Hilbert data
    with several primes above p, 'D different from C' is not 'D ∩ C = 0': the anticanonical
    condition must be imposed at every prime above p.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/canonical-locus-isomorphism (theorem): The canonical locus is a section of the Γ₀(p^n)-cover

In the situation of T4/canonical-anticanonical-loci, A ↦ (A, C_n) defines an isomorphism X(ε) ≅
X_{Γ₀(p^n)}(ε)_c of adic spaces (and of formal models after normalisation), inverse to the forgetful
map; it is compatible with the forgetful maps in n, with prime-to-p Hecke correspondences and with
base change.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical (theorem): Atkin–Lehner identifies the anticanonical locus with a smaller Hasse neighbourhood

For n ≥ 1, ε ≥ 0 and ambient radius δ = p^nε < 1/2 in the Siegel case (in the Hilbert case require
the corresponding canonical-subgroup range at each quotient step), the map AL_n: X_{Γ₀(p^n)}(p^nε)_a
→ X(ε), (A, D) ↦ A/D, is an isomorphism; its inverse sends B ∈ X(ε) to (B/C_n(B), B[p^n]/C_n(B)) up
to the identification (B/C_n)/(B[p^n]/C_n) ≅ B. Equivalently X(p^{−n}ε) ≅ X_{Γ₀(p^n)}(ε)_a by A ↦
(A/C_n, A[p^n]/C_n). Under these isomorphisms the anticanonical tower … → X_{Γ₀(p^{n+1})}(ε)_a →
X_{Γ₀(p^n)}(ε)_a corresponds to the Frobenius tower … → X(p^{−n−1}ε) → X(p^{−n}ε) given by division
by the canonical subgroup of level 1, which reduces to the relative Frobenius modulo p^{1−δ}, δ =
((p+1)/p)ε. The radius changes by the factor p^n: dividing by C_n multiplies the Hasse valuation by
p^n, dividing by an anticanonical subgroup divides it by p^n (T3/quotient-hasse-radius).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/hodge-tate-coordinate (definition): The Hodge–Tate coordinate, the fractional-linear action and the factor cz + d

Let 𝒪_p = 𝒪_F ⊗ ℤ_p and Fl = Res_{F/ℚ}ℙ¹. Fix BHW’s kernel-line convention: π_HT(A,α) is the kernel
of the quotient 𝒪_p² ⊗ C → ω_A. On the chart where HT(α(e₁)) generates, this kernel has coordinates
(z:1), with z = −HT(α(e₂))/HT(α(e₁)). Convert the tower’s right action explicitly to the left
fractional-linear action z(γx) = (az+b)/(cz+d), and set j(γ,x) = cz+d. On chart intersections where
denominators are invertible, j(γδ,x) = j(γ,δx)j(δ,x). The associated quotient-line action is
det(γ)^{−1}γ; its pullback uses γ^∨ = det(γ)γ^{−1}. Thus the section given by the class of e₁
transforms by cz+d (BHW Lemma 3.19). Unit and analytic structure-group assertions on anticanonical
domains require the period estimates of T4/period-map-inclusions; they are not true at every point
of the affine chart. After splitting F these formulas hold componentwise and descend on the generic
fibre. Integral descent uses the chosen O⁺-lattice, not an identification of the ramified order with
its normalisation.

API:
  TauCeti.HodgeTate.hodgeTateCoordinate [constructor] (not stated): On the kernel-line chart (z:1),
    z = −HT(α(e₂))/HT(α(e₁)); HT(α(e₁)) is the quotient-line generator.
  TauCeti.HodgeTate.fractionalLinear_action [functoriality] (typed component: fractionalLinear
    (scalar formula only)): For the specified left action, z(γx) = (az+b)/(cz+d) on the domain where
    cz+d is invertible.
  TauCeti.HodgeTate.automorphyFactor [constructor] (typed component: automorphyFactor): j(γ, x) :=
    cz(x) + d.
  TauCeti.HodgeTate.automorphyFactor_cocycle [relation] (typed component: automorphyFactor_cocycle
    (scalar algebra only)): j(γδ,x) = j(γ,δx)j(δ,x) on common affine-chart domains with invertible
    denominators.
  TauCeti.HodgeTate.automorphyFactor_unit [relation] (not stated): For γ ∈ Γ₀(p), j(γ,x) is an
    O⁺-unit on the anticanonical period domains satisfying T4/period-map-inclusions; this uses that
    the coordinates are within radius < 1 of 𝒪_p.
  TauCeti.HodgeTate.hodgeTateCoordinate_descent [compatibility] (not stated): After splitting F, z =
    (z_σ)_σ and the generic formulas descend over F ⊗ ℚ_p. Integral descent requires the specified
    O⁺-lattice, not the false ramified product identification.

Unit tests:
  TauCeti.HodgeTate.automorphyFactor_identity [degenerate] (typed component: identity example): j(1,
    x) = 1.
  TauCeti.HodgeTate.fractionalLinear_upperTriangular [computation] (typed component: upper-
    triangular example): For γ = (a b; 0 d), z(γx) = (a z(x) + b)/d.
  TauCeti.HodgeTate.automorphyFactor_cocycle_test [characterisation] (typed component: lower-
    unipotent example): For γ = (1 0; c 1), δ = (1 0; c′ 1): j(γδ, x) = (c + c′)z + 1 = j(γ,
    δx)·j(δ, x).
  TauCeti.HodgeTate.automorphyFactor_not_rightAction [non-example] (not stated): With the right
    action x·γ the factor is cz + d for γ^{-1}, not for γ: the cocycle law fails for the naive
    formula j(γ, x) = cz + d with z(xγ) = (az + b)/(cz + d).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/flag-variety-balls (definition): Balls around the integral points of the Hilbert flag variety

For L a complete extension of ℚ_p, r ∈ (0, 1] ∩ |L^×| and x ∈ Res_{𝒪_F/ℤ}𝔾_a(𝒪_p), the ball B_r(x)
:= x + t·Res_{𝒪_F/ℤ}𝔾̂_a with |t| = r is an open affinoid subspace of Res_{𝒪_F/ℤ}ℙ¹ over L; B_0(𝒪_p
: 1) := 𝒪_p ⊂ ℙ¹(𝒪_p) via a ↦ (a : 1), and B_r(𝒪_p : 1) is the union of the balls of radius r around
the points of 𝒪_p; analogously B_r(𝒪_p^× : 1) and B_r(1 : p𝒪_p) (around the points (1 : pb)). On
C-points, B_r(𝒪_p : 1)(C) = 𝒪_p + t·(𝒪_p ⊗ O_C)^∼ inside 𝒪_p ⊗ C, where (𝒪_p ⊗ O_C)^∼ denotes the
integral closure (BHW's convention), so the definition is meaningful for p ramified in F.

API:
  TauCeti.HodgeTate.flagBall [constructor] (not stated): B_r(x) = x + t·Res 𝔾̂_a, |t| = r.
  TauCeti.HodgeTate.integralBall [constructor] (not stated): B_r(𝒪_p : 1), B_r(𝒪_p^× : 1), B_r(1 :
    p𝒪_p) as unions of balls.
  TauCeti.HodgeTate.integralBall_points [characterisation] (not stated): B_r(𝒪_p : 1)(C) = 𝒪_p +
    t(𝒪_p ⊗ O_C)^∼.
  TauCeti.HodgeTate.integralBall_mono [relation] (not stated): B_r ⊂ B_{r′} for r ≤ r′.
  TauCeti.HodgeTate.integralBall_gamma0 [functoriality] (not stated): For 0 ≤ r < 1, Γ₀(p) preserves
    B_r(𝒪_p:1) and B_r(1:p𝒪_p). The r = 1 assertion for the second chart is excluded.

Unit tests:
  TauCeti.HodgeTate.integralBall_one [degenerate] (not stated): B_1(ℤ_p : 1) is the closed unit disc
    {|z| ≤ 1} for F = ℚ.
  TauCeti.HodgeTate.integralBall_disjoint [computation] (not stated): For F = ℚ and r < 1, B_r(ℤ_p :
    1) and B_r(1 : pℤ_p) are disjoint.
  TauCeti.HodgeTate.integralBall_ramified [non-example] (not stated): For p ramified in F, 𝒪_p ⊗ O_C
    is not the integral closure: B_r must be defined with the integral closure, or the ball misses
    points of 𝒪_p ⊗ C of norm ≤ r.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions (theorem): Hodge–Tate images of the canonical and anticanonical loci (BHW Proposition 5.18)

Let 1 > r > 0, m ≥ 1 with p^{−m} ≤ r, and 0 ≤ ε ≤ 1/(c_p p^m) with c_p = 2 for p ≥ 5, c_p = 3 for p
= 3, c_p = 4 for p = 2. Then π_HT(X_{Γ(p^∞)}(ε)_c) ⊂ B_r(1 : p𝒪_p) and π_HT(X_{Γ(p^∞)}(ε)_a) ⊂
B_r(𝒪_p : 1). More precisely, with n = m + 1 and x = n − p^nε/(p−1), every point of the
anticanonical locus has π_HT ∈ B_{|p^x|}(𝒪_p : 1). The same ε serves all primes above p. The
inequalities are exactly what is needed to evaluate a locally analytic weight on cz + d.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison (theorem): The period estimates at primes ramified in F

Let p be ramified in F. In the situation of T4/period-map-inclusions, every point z of the
anticanonical locus X_{Γ(p^∞)}(ε)_a satisfies π_HT(z) ∈ B_{|p^x|}(𝒪_p : 1), x = m + 1 −
p^{m+1}ε/(p−1), with balls defined through the integral closure of 𝒪_F ⊗ O_C (T4/flag-variety-
balls); likewise for the canonical locus and B_{|p^x|}(1 : p𝒪_p). Consequently the conclusions of
BHW Proposition 5.18 hold for every rational prime p with the same constants c_p.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/igusa-torsor (construction): Igusa torsors of the dual canonical subgroup and the ordinary inverse tower

Let F be totally real of degree g (F = ℚ for the modular curve), m ≥ 1 and 0 ≤ ε ≤ ε_m^can :=
p^{−(m+1)}, so that the universal semi-abelian A over X(ε) has a canonical subgroup H_m ⊂ A[p^m],
étale-locally 𝒪_F/p^m on geometric generic points (T3/hilbert-canonical-subgroup). Its Cartier dual
H_m^∨ = A^∨[p^m]/H_m^⊥ is étale on the generic fibre. The Igusa torsor X_{Ig(p^m)}(ε) → X(ε) is the
finite étale (𝒪_F/p^m)^×-torsor representing 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨; these form a
tower in m with transition maps reduction modulo p^m, and over the ordinary locus ε = 0 the limit
X_{Ig(p^∞)}(0) = lim_m X_{Ig(p^m)}(0) is a pro-étale 𝒪_p^×-torsor parametrising 𝒪_p ≅ T_pH^∨ (H the
multiplicative p-divisible subgroup), with a finite étale formal model at each finite level (the
ordinary inverse tower). A partial Igusa trivialisation (of H_m^∨ only) is not a trivialisation of
the whole Tate module.

API:
  TauCeti.HodgeTate.igusaTorsor [constructor] (not stated): X_{Ig(p^m)}(ε) → X(ε), the
    (𝒪_F/p^m)^×-torsor of 𝒪_F-linear isomorphisms 𝒪_F/p^m ≅ H_m^∨.
  TauCeti.HodgeTate.igusaTorsor_transition [functoriality] (not stated): Reduction mod p^m gives
    X_{Ig(p^{m+1})}(ε′) → X_{Ig(p^m)}(ε′) for ε′ ≤ ε_{m+1}^can, equivariant for (𝒪_F/p^{m+1})^× →
    (𝒪_F/p^m)^×.
  TauCeti.HodgeTate.ordinaryIgusaTower [constructor] (not stated): X_{Ig(p^∞)}(0) = lim
    X_{Ig(p^m)}(0), a pro-étale 𝒪_p^×-torsor over X(0) with finite étale formal models.
  TauCeti.HodgeTate.igusaTorsor_universalTrivialisation [data] (not stated): The tautological
    isomorphism ψ_univ: 𝒪_F/p^m ≅ H_m^∨ over X_{Ig(p^m)}(ε).
  TauCeti.HodgeTate.igusaTorsor_baseChange [functoriality] (not stated): Compatible with base
    change, prime-to-p Hecke correspondences and the 𝒪_F^{×,+}-action on polarisations.

Unit tests:
  TauCeti.HodgeTate.igusaTorsor_degree [computation] (not stated): X_{Ig(p^m)}(ε) → X(ε) is finite
    étale of degree #(𝒪_F/p^m)^×; for F = ℚ, of degree p^{m−1}(p − 1).
  TauCeti.HodgeTate.igusaTorsor_cusp [degenerate] (not stated): At a cusp of the modular curve (Tate
    curve), H_m = μ_{p^m} and H_m^∨ = ℤ/p^m, so the torsor is trivial over the cusp neighbourhood.
  TauCeti.HodgeTate.igusaTorsor_not_fullLevel [non-example] (not stated): X_{Ig(p^m)}(ε) is not
    X_{Γ(p^m)}(ε): its fibres have #(𝒪_F/p^m)^× points, not #GL₂(𝒪_F/p^m); a partial Igusa
    trivialisation is not a Tate-module basis.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/igusa-full-level-comparison (comparison): Igusa trivialisations and the full p-level tower

For 0 ≤ ε ≤ ε_m^can, the anticanonical full-level tower with universal α: 𝒪_p² ≅ T_pA^∨ maps to the
Igusa torsor by the generator ψ: 𝒪_p/p^m → H_m^∨ obtained from α(e₁) followed by the dual canonical-
subgroup quotient. Anticanonicity makes ψ an isomorphism of finite 𝒪_p/p^m-modules. The resulting
map of spaces φ: X_{Γ(p^∞)}(ε)_a → X_{Ig(p^m)}(ε) is not claimed to be an isomorphism and does not
factor through Γ₀-level, which forgets the generator. Under the pullback-frame convention α′ = α ∘
γ^∨, diagonal γ = diag(a,d) multiplies ψ by d mod p^m. BHW Proposition 7.11 uses φ and Hodge–Tate
functoriality to lift the Igusa generator to the AIP torsor.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/integral-differential-lattice (construction): The modified integral lattice ω^int

Let m ≥ 1, 0 ≤ ε ≤ ε_m^can, and ω⁺ the integral structure on ω_A over X_{Ig(p^m)}(ε) (pushforward of
the conormal sheaf of the formal model; BHW Definition 4.2), Hdg the Hasse ideal (generated locally
by a lift of Ha) and I_m := p^m Hdg^{−(p^m−1)/(p−1)}, I′_m := p^m Hdg^{−p^m/(p−1)} ⊇ I_m. The map ψ:
𝒪_F/p^m → H_m^∨ → ω⁺_{H_m} → ω⁺/I_m ω⁺, 1 ↦ ψ(1), is the Hodge–Tate map of the dual canonical
subgroup composed with the universal Igusa trivialisation (T3/canonical-subgroup-hodge-tate). Then
ω^int ⊂ ω⁺ is the preimage of the 𝒪_F ⊗ O⁺-submodule of ω⁺/I_mω⁺ generated by ψ(1). Properties
(T5/integral-lattice-properties): ω^int is locally free of rank one over 𝒪_F ⊗ O⁺ (even at ramified
p, where ω⁺ need not be), Hdg^{1/(p−1)}ω⁺ ⊂ ω^int ⊂ ω⁺, and 1 ↦ ψ(1) induces HT′: 𝒪_F ⊗ O⁺/I′_m ≅
ω^int/I′_m ω^int.

API:
  TauCeti.HodgeTate.igusaHodgeTateClass [constructor] (not stated): ψ(1) ∈ ω⁺/I_mω⁺, the Hodge–Tate
    image of the universal Igusa generator.
  TauCeti.HodgeTate.integralDifferentialLattice [constructor] (typed component:
    integralDifferentialLattice): ω^int := preimage in ω⁺ of the 𝒪_F ⊗ O⁺-span of ψ(1).
  TauCeti.HodgeTate.integralDifferentialLattice_locallyFree [instance] (not stated): ω^int is
    locally free of rank one over 𝒪_F ⊗ O⁺.
  TauCeti.HodgeTate.integralDifferentialLattice_bounds [relation] (not stated): Hdg^{1/(p−1)}ω⁺ ⊂
    ω^int ⊂ ω⁺.
  TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate [characterisation] (not stated): HT′: 𝒪_F
    ⊗ O⁺/I′_m ≅ ω^int/I′_mω^int, 1 ↦ ψ(1).
  TauCeti.HodgeTate.integralDifferentialLattice_indep [compatibility] (not stated): For m′ ≥ m (and
    ε within both radii) the lattices defined at levels m and m′ agree.

Unit tests:
  TauCeti.HodgeTate.integralDifferentialLattice_ordinary [degenerate] (typed component:
    ordinary cyclic-module example): On the ordinary locus (ε =
    0), ω^int = ω⁺.
  TauCeti.HodgeTate.integralDifferentialLattice_colength [computation] (not stated): At a rank-one
    point of Hodge height w (F = ℚ), ω⁺/ω^int ≅ O_C/p^{w/(p−1)}.
  TauCeti.HodgeTate.integralDifferentialLattice_ne_plus [non-example] (not stated): At a non-
    ordinary point ω^int ≠ ω⁺ (its colength is w/(p−1) > 0), so ω^int is not the natural formal-
    model lattice; at ramified p, ω⁺ is not even locally free over 𝒪_F ⊗ O⁺.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/integral-lattice-properties (theorem): Local freeness, independence of level and cokernel estimates for ω^int

In the situation of T5/integral-differential-lattice: (1) ω^int is a locally free 𝒪_F ⊗ O⁺-module of
rank one on X_{Ig(p^m)}(ε); (2) the cokernel of ω^int ⊂ ω⁺ is annihilated by Hdg^{1/(p−1)}, so
ω^int/I_mω⁺ ⊂ ω⁺/I_mω⁺ is the 𝒪_F ⊗ O⁺-submodule generated by ψ(1); (3) 1 ↦ ψ(1) induces an
isomorphism HT′: 𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_m; (4) any lift w ∈ ω⁺ of ψ(1) ∈ ω⁺_{H_m} lies in ω^int
and satisfies w ≡ HT′(1) modulo I′_m; (5) ω^int is independent of m (for ε within the radii) and
compatible with the transition maps of the Igusa tower, base change and prime-to-p Hecke
correspondences; (6) on the formal model of the ordinary locus ω^int coincides with the natural
lattice ω⁺.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle (construction): The modified Hodge bundle ω^mod at full level p^n

Let 𝔛 = 𝔛_{K(p^n)} be the normalisation of the toroidal formal model of the Siegel, Hilbert–Siegel
(GSp₄ over F) or Hilbert variety in its full level-p^n generic fibre, with universal semi-abelian 𝒢
and the extended Hodge–Tate map HT: (𝒪_p/p^n)^{2g} ⊗ O_𝔛 → ω_𝒢/p^n (T0/hodge-tate-boundary-
extension). Let ω_𝒢^{mod} ⊂ ω_𝒢 be the subsheaf generated by p^{1/(p−1)}ω_𝒢 and local lifts of the
image of HT (equivalently, for n ≥ 1, the preimage of the image of HT); after normalising the blow-
up of the ideal locally generated by the minors of the Hodge–Tate matrix (the 2 × 2 minors at each v
| p for GSp₄/F; minors of sizes g, …, 1 for GSp_{2g}), giving 𝔛^mod → 𝔛, an isomorphism on generic
fibres, the torsion-free image of its pullback inside the pulled-back ω, denoted ω^mod, is locally
free (over 𝒪_F ⊗ O_{𝔛^mod} of rank 2 for GSp₄/F; of rank g for GSp_{2g}), p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω,
and HT factors through a surjection (𝒪_p/p^n)^{2g} ⊗ O_{𝔛^mod} → ω^mod/p^{n−1/(p−1)}.

API:
  TauCeti.HodgeTate.modifiedModel [constructor] (not stated): 𝔛^mod → 𝔛, the normalised blow-up of
    the minor ideal of the Hodge–Tate matrix.
  TauCeti.HodgeTate.modifiedHodgeBundle [constructor] (typed component: modifiedHodgeBundle
    (submodule only)): ω^mod ⊂ ω on 𝔛^mod, generated by p^{1/(p−1)}ω and lifts of the Hodge–Tate
    image.
  TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree [instance] (not stated): ω^mod is locally free
    (over 𝒪_F ⊗ O for Hilbert–Siegel data).
  TauCeti.HodgeTate.modifiedHodgeBundle_bounds [relation] (not stated): p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω (p
    ≥ 3).
  TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective [characterisation] (not stated): HT ⊗
    1: (𝒪_p/p^n)^{2g} ⊗ O → ω^mod/p^{n−1/(p−1)} is surjective.
  TauCeti.HodgeTate.modifiedModel_generic [compatibility] (not stated): 𝔛^mod → 𝔛 is an isomorphism
    on adic generic fibres.

Unit tests:
  TauCeti.HodgeTate.modifiedHodgeBundle_ordinary [degenerate] (not stated): Over the ordinary locus
    ω^mod = ω and 𝔛^mod = 𝔛.
  TauCeti.HodgeTate.modifiedHodgeBundle_colength [computation] (not stated): For g = 1 at a rank-one
    point with a canonical subgroup and Hodge height w, ω/ω^mod ≅ O_C/p^{w/(p−1)}.
  TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup [non-example] (not stated):
    Before the blow-up, the image sheaf is not locally free in general (it is generated by 2g
    sections with non-invertible minor ideal).
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model (construction): The modified minimal model and the descent of the Hodge–Tate determinant

Let 𝔛^*_{K(p^n)} be the Stein factorisation of 𝔛_{K(p^n)} → 𝔛^* (𝔛^* the minimal compactification,
ShimuraCompactifications C5/C6); it is a normal admissible formal scheme. The determinant Λ^{g}HT:
Λ^{g}((𝒪_p/p^n)^{2g}) → det ω/p^n of the Hodge–Tate map (for GSp₄/F, its O_F-direct factor ⊗_{v|p}
Λ²(𝒪_{F_v}/p^n)^4 → det ω/p^n) descends from 𝔛_{K(p^n)} to 𝔛^*_{K(p^n)}. Normalising the blow-up of
the ideal generated by the coefficients of local lifts of the descended map gives 𝔛^{*−mod}_{K(p^n)}
→ 𝔛^*_{K(p^n)}, an isomorphism on generic fibres, carrying an invertible det ω^mod ⊂ det ω with
p^{2[F:ℚ]/(p−1)} det ω ⊂ det ω^mod ⊂ det ω for GSp₄/F (p^{g/(p−1)} for GSp_{2g}), and Λ^gHT factors
through a surjection onto det ω^mod/p^{n − 2[F:ℚ]/(p−1)}. 𝔛^mod_{K(p^n)} maps to 𝔛^{*−mod}_{K(p^n)}
compatibly.

API:
  TauCeti.HodgeTate.minimalLevelModel [constructor] (not stated): 𝔛^*_{K(p^n)}, the Stein
    factorisation of 𝔛_{K(p^n)} → 𝔛^*.
  TauCeti.HodgeTate.hodgeTateDeterminant_descends [relation] (not stated): Λ^gHT is the pullback of
    a map on 𝔛^*_{K(p^n)}.
  TauCeti.HodgeTate.modifiedMinimalModel [constructor] (not stated): 𝔛^{*−mod}_{K(p^n)}, the
    normalised blow-up of the coefficient ideal of Λ^gHT.
  TauCeti.HodgeTate.modifiedDetHodge_bounds [relation] (not stated): p^{2[F:ℚ]/(p−1)} det ω ⊂ det
    ω^mod ⊂ det ω (GSp₄/F).
  TauCeti.HodgeTate.modifiedDetHodge_surjective [characterisation] (not stated): Λ^gHT ⊗ 1 surjects
    onto det ω^mod/p^{n−2[F:ℚ]/(p−1)}.

Unit tests:
  TauCeti.HodgeTate.modifiedMinimalModel_ordinary [degenerate] (not stated): Over the ordinary locus
    𝔛^{*−mod} = 𝔛^* and det ω^mod = det ω.
  TauCeti.HodgeTate.modifiedDetHodge_factor [computation] (not stated): For GSp₄/F each local factor
    Λ²_{𝒪_{F_v}/p^n}(𝒪_{F_v}/p^n)^4 has rank six over 𝒪_{F_v}/p^n. The determinant of the underlying
    rank-2[F:ℚ] module is obtained using restriction of scalars and the determinant/norm
    construction; a tensor of those rank-six modules must not be confused with that determinant
    line.
  TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal [non-example] (not stated): det ω^mod on
    𝔛^{*−mod} is not ω^mod's determinant pulled back from a toroidal model: it is constructed on the
    minimal side, where ω itself does not descend, only det ω does.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/modified-plus-sheaf (definition): The étale sheaf ω^{mod,+}

Over the analytic Siegel (or Hilbert–Siegel) variety 𝒳 at spherical level, ω_G^{mod,+} is the sheaf
of O⁺_𝒳-modules on 𝒳_ét whose sections over U → 𝒳 étale are the integral differentials at the origin
of G generated by the image of the Hodge–Tate period map over the full-level cover U ×_𝒳 𝒳(p^n),
descended; its pullback to 𝒳(p^n) for n ≥ 1 (n ≥ 2 if p = 2) is the generic-fibre incarnation of
ω^mod (T5/modified-hodge-bundle). It does not come from the analytic site of 𝒳 in general, and it
satisfies p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺ (p ≥ 3).

API:
  TauCeti.HodgeTate.modifiedPlusSheaf [constructor] (not stated): ω^{mod,+} on 𝒳_ét, the O⁺-span of
    Hodge–Tate images, descended from finite level.
  TauCeti.HodgeTate.modifiedPlusSheaf_pullback [compatibility] (not stated): Its pullback to 𝒳(p^n),
    n ≥ 1 (n ≥ 2 if p = 2), is the generic fibre of ω^mod.
  TauCeti.HodgeTate.modifiedPlusSheaf_bounds [relation] (not stated): p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺
    (p ≥ 3).
  TauCeti.HodgeTate.modifiedPlusSheaf_indep [compatibility] (not stated): Independent of the
    auxiliary level n used to define it.

Unit tests:
  TauCeti.HodgeTate.modifiedPlusSheaf_ordinary [degenerate] (not stated): ω^{mod,+} = ω⁺ over the
    ordinary locus.
  TauCeti.HodgeTate.modifiedPlusSheaf_rankOne [computation] (not stated): At a rank-one point of an
    elliptic curve with Hodge height w < 1/(p+1), ω⁺/ω^{mod,+} ≅ O_C/p^{w/(p−1)}.
  TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic [non-example] (not stated): ω^{mod,+} is not a
    sheaf on the analytic site of 𝒳 in general: its sections over an affinoid need not be determined
    by a single analytic formal model at spherical level.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/aip-torsor (construction): The Andreatta–Iovita–Pilloni torsor

In the situation of T5/integral-differential-lattice, let 𝔉_m := {w ∈ ω^int : w ≡ HT′(1) mod I′_m
ω^int}. Its analytic total space 𝔉_m(ε) → X_{Ig(p^m)}(ε) is a torsor for the analytic topology under
1 + I′_m·Res_{𝒪_F/ℤ}𝔾̂_a, and 𝔉_m(ε) → X(ε) is an étale torsor under B_m := 𝒪_p^×·(1 +
I′_m·Res_{𝒪_F/ℤ}𝔾̂_a) ⊂ Res_{𝒪_F/ℤ}𝔾_m; 𝔉_m(ε) → T(ω) (the total space of ω^×) is an open immersion.
Over X(ε) and for x := m − εp^m/(p − 1), B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a), with equality where |Ha| =
|p|^ε. The associated weight sheaf is constructed by OverconvergentAutomorphicForms O5 from this
torsor; this node supplies the torsor and its action.

API:
  TauCeti.HodgeTate.aipTorsor [constructor] (typed component: aipTorsor (congruence subset only)):
    𝔉_m(ε) := {w ∈ ω^int : w ≡ HT′(1) mod I′_m}, a torsor under 1 + I′_m Res 𝔾̂_a over
    X_{Ig(p^m)}(ε).
  TauCeti.HodgeTate.aipTorsor_structureGroup [structure] (not stated): 𝔉_m(ε) → X(ε) is an étale
    B_m-torsor, B_m = 𝒪_p^×(1 + I′_m Res 𝔾̂_a).
  TauCeti.HodgeTate.aipTorsor_openImmersion [characterisation] (not stated): 𝔉_m(ε) → T(ω) is an
    open immersion.
  TauCeti.HodgeTate.aipTorsor_bound [relation] (not stated): B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a) over
    X(ε), x = m − εp^m/(p−1).
  TauCeti.HodgeTate.aipTorsor_lift [relation] (not stated): Every lift in ω⁺ of ψ(1) ∈ ω⁺_{H_m} is a
    section of 𝔉_m (T5/integral-lattice-properties (4)).

Unit tests:
  TauCeti.HodgeTate.aipTorsor_ordinary [degenerate] (not stated): At ε = 0, B_m = 𝒪_p^×(1 + p^m Res
    𝔾̂_a) and 𝔉_m is the torsor of generators of ω⁺ congruent to the Igusa generator mod p^m.
  TauCeti.HodgeTate.aipSheaf_classical [compatibility] (not stated): The O5 sheaf associated to this
    torsor and an algebraic weight κ=x^k agrees with ω^{⊗k}; this is an imported consumer
    compatibility test, not a second construction of the weight sheaf.
  TauCeti.HodgeTate.aipTorsor_bound_direction [non-example] (not stated): The reverse inclusion
    𝒪_p^×(1 + p^x Res 𝔾̂_a) ⊂ B_m fails at points where |Ha| > |p|^ε, since there I′_m ⊊ p^xO⁺.
-/

/-
Node HodgeTateAndCanonicalSubgroups:T5/aip-hodge-tate-comparison (theorem): The AIP torsor and the Hodge–Tate trivialisation on the anticanonical tower

Let 0 ≤ ε ≤ ε_m^can and s: X_{Γ(p^∞)}(ε)_a → T(ω), s(A, α) := HT_A(α(1, 0)) ∈ ω_A, the Hodge–Tate
trivialisation on the anticanonical part of the infinite-level tower (the diamond of
PerfectoidShimuraVarieties S0, pulled back along T4/canonical-anticanonical-loci). Then s factors
through 𝔉_m(ε) (T5/aip-torsor), and for γ = (a b; c d) ∈ Γ₀(p) one has γ*s = j(γ, ·)·s with j = cz +
d (T4/hodge-tate-coordinate), j landing in B_m. Consequently, for a bounded smooth weight κ with ε ≤
ε_κ and every n ∈ ℤ_{≥0} ∪ {∞}, pullback along s̃ := s ∘ u_n (u_n the action of (p^n 0; 0 1))
induces a prime-to-p Hecke-equivariant isomorphism of invertible O⁺-modules between the perfectoid
sheaf ω^{κ,+}_n on X_{Γ₀(p^n)}(ε)_a (functions f with γ*f = κ^{-1}(cz + d)f) and the corresponding
pullback of ω^{κ,+}_AIP (using AL_n for finite positive n and the structural forgetful map for n =
∞); in particular ω^κ ≅ ω^κ_AIP. This is the substantive comparison consumed by
OverconvergentAutomorphicForms O5, not a redefinition of one sheaf as the other.
-/
