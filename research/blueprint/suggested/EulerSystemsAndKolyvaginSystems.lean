/-
This suggested file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EulerSystemsAndKolyvaginSystems.md is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on
names and signatures; they are proposals, not implementations.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The bodies below preserve the two reviewed parts in order. The finite-level
algebraic prototypes and Iwasawa algebraic prototypes inhabit distinct namespaces.
They do not instantiate the missing arithmetic suppliers. In particular, many
arithmetic definitions, API items, tests and theorems remain comment inventories,
not typed signatures/examples. Compilation does not discharge PROTOCOL section 13.
See the reader's gaps and the assembly handoff before using a proposed name.
Missing hypotheses must not be represented by arbitrary Prop-valued placeholders.
-/

import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.ExteriorPower.Pairing
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.PowerSeries.Ideal
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Ideal.Height
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
import Mathlib.RingTheory.Polynomial.Eisenstein.Distinguished
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.TensorProduct.Basic

section FiniteLevelPrototype

noncomputable section

open Polynomial

universe u v w

namespace TauCeti.KolyvaginSystems

/-! ## ES.0: Selmer triples, conductors, cartesian conditions, the category of quotients -/

section SelmerTriple

/-- **`ES.0/selmer-triple`**: a Selmer triple over abstract cohomology modules: a global module,
local modules with localisation maps and local conditions, the finite set `Σ(F)`, and a set `P` of
primes disjoint from it. For `(T, F, P)`: `glob = H¹(K_{Σ}/K, T)`, `loc v = H¹(K_v, T)`. -/
structure SelmerTriple (R : Type u) [CommRing R] (Pl : Type v) where
  /-- The global cohomology module. -/
  glob : Type w
  [addCommGroupGlob : AddCommGroup glob]
  [moduleGlob : Module R glob]
  /-- The local cohomology modules. -/
  loc : Pl → Type w
  [addCommGroupLoc : ∀ q, AddCommGroup (loc q)]
  [moduleLoc : ∀ q, Module R (loc q)]
  /-- Localisation. -/
  res : ∀ q, glob →ₗ[R] loc q
  /-- The local conditions `H¹_F(K_q, T)`. -/
  cond : ∀ q, Submodule R (loc q)
  /-- The finite set `Σ(F)`. -/
  sigma : Finset Pl
  /-- The set `P` of primes. -/
  primes : Set Pl
  /-- `P` is disjoint from `Σ(F)`. -/
  disjoint : ∀ q ∈ primes, q ∉ sigma

attribute [instance] SelmerTriple.addCommGroupGlob SelmerTriple.moduleGlob
  SelmerTriple.addCommGroupLoc SelmerTriple.moduleLoc

namespace SelmerTriple

variable {R : Type u} [CommRing R] {Pl : Type v} (D : SelmerTriple.{u, v, w} R Pl)

/-- The Selmer module of the triple. -/
def selmer : Submodule R D.glob := ⨅ q, (D.cond q).comap (D.res q)

/-- API: `N(P)`, the squarefree products of primes of `P`, as finite subsets of `P`. -/
def conductors : Set (Finset Pl) := {n | (n : Set Pl) ⊆ D.primes}

/-- API: `1 ∈ N(P)`. -/
theorem one_mem_conductors : (∅ : Finset Pl) ∈ D.conductors := sorry

/-- API: `N(P)` is closed under divisors. -/
theorem conductors_dvd_closed {m n : Finset Pl} (hn : n ∈ D.conductors) (hmn : m ⊆ n) :
    m ∈ D.conductors := sorry

/-- API: restriction of the prime set. -/
def restrictPrimes (P' : Set Pl) (h : P' ⊆ D.primes) : SelmerTriple.{u, v, w} R Pl :=
  { D with primes := P', disjoint := fun q hq => D.disjoint q (h hq) }

/-- Test `SelmerTriple.conductors_empty`: for `P = ∅`, `N(P) = {1}`. -/
example (h : D.primes = ∅) : D.conductors = {∅} := sorry

/-- Test `SelmerTriple.disjoint_sigma`: no prime of `Σ(F)` divides an element of `N(P)`. -/
example {n : Finset Pl} (hn : n ∈ D.conductors) {q : Pl} (hq : q ∈ n) : q ∉ D.sigma := sorry

end SelmerTriple

end SelmerTriple

section Cartesian

variable {R : Type*} [CommRing R]

/-- **`ES.0/cartesian-condition`**: the cartesian square for one morphism `α_* : H¹(K_v, T₁) →
H¹(K_v, T₂)`: the condition on `T₁` is the inverse image of the condition on `T₂`. A local
condition is cartesian on `Quot_R(T)` when this holds for every injective morphism of that
category. -/
def IsCartesian {H₁ H₂ : Type*} [AddCommGroup H₁] [Module R H₁] [AddCommGroup H₂] [Module R H₂]
    (α : H₁ →ₗ[R] H₂) (L₁ : Submodule R H₁) (L₂ : Submodule R H₂) : Prop :=
  L₁ = L₂.comap α

/-- Test `isCartesian_strict_and_relaxed_field` (relaxed half): the relaxed conditions form a
cartesian square for every map. -/
example {H₁ H₂ : Type*} [AddCommGroup H₁] [Module R H₁] [AddCommGroup H₂] [Module R H₂]
    (α : H₁ →ₗ[R] H₂) : IsCartesian α ⊤ ⊤ := sorry

/-- The strict conditions form a cartesian square exactly for injective maps. -/
example {H₁ H₂ : Type*} [AddCommGroup H₁] [Module R H₁] [AddCommGroup H₂] [Module R H₂]
    (α : H₁ →ₗ[R] H₂) : IsCartesian α ⊥ ⊥ ↔ Function.Injective α := sorry

variable (T : Type*) [AddCommGroup T] [Module R T]

/-- **`ES.0/quotient-category`**, API `QuotCat.scalarHom`: for `r` with `r I ⊆ J`, multiplication
by `r` as a map `T/IT → T/JT`. -/
def QuotCat.scalarHom (I J : Ideal R) (r : R) (h : ∀ x ∈ I, r * x ∈ J) :
    (T ⧸ (I • (⊤ : Submodule R T))) →ₗ[R] (T ⧸ (J • (⊤ : Submodule R T))) :=
  Submodule.mapQ _ _ (r • LinearMap.id) sorry

/-- API `QuotCat.scalarHom_comp`. -/
theorem QuotCat.scalarHom_comp (I J L : Ideal R) (r s : R) (h : ∀ x ∈ I, r * x ∈ J)
    (h' : ∀ x ∈ J, s * x ∈ L) :
    (QuotCat.scalarHom T J L s h').comp (QuotCat.scalarHom T I J r h) =
      QuotCat.scalarHom T I L (s * r) sorry := sorry

end Cartesian

/-! ## ES.1: the quotient polynomial of the finite–singular comparison -/

section FiniteSingular

variable {R : Type*} [CommRing R]

/-- **`ES.1/finite-singular-comparison`**, API `fsQuotientPoly`: the polynomial `Q` with
`(X - 1) * Q = P`, for `P` with `P(1) = 0`; here `P = det(1 - Fr · X | T)`. -/
def fsQuotientPoly (P : R[X]) : R[X] := P /ₘ (X - C 1)

/-- API `fsQuotientPoly_spec`. -/
theorem fsQuotientPoly_spec (P : R[X]) (h : P.eval 1 = 0) : (X - 1) * fsQuotientPoly P = P :=
  sorry

/-- Uniqueness in `fsQuotientPoly_spec`. -/
theorem fsQuotientPoly_unique (P Q : R[X]) (h : (X - 1) * Q = P) : Q = fsQuotientPoly P := sorry

/-- Test `finiteSingular_cyclotomic`: for `P = 1 - X`, `Q = -1`. -/
example : fsQuotientPoly (1 - X : ℤ[X]) = -1 := sorry

/-- Test `finiteSingular_rank_two`: for `P = (1 - X)(1 - aX)`, `Q = -(1 - aX)`. -/
example (a : R) : fsQuotientPoly ((1 - X) * (1 - C a * X) : R[X]) = -(1 - C a * X) := sorry

/-- Algebraic part of test `finiteSingular_not_natural_inclusion`: the quotient polynomials
on a rank-one fixed line and on the fixed line in `diag(1,2)` have different values. The actual
finite–singular maps still require the arithmetic coefficient and local-cohomology carriers. -/
example :
    (fsQuotientPoly (1 - X : (ZMod 5)[X])).eval 1 = 4 ∧
    (fsQuotientPoly ((1 - X) * (1 - C 2 * X) : (ZMod 5)[X])).eval 1 = 1 := sorry

end FiniteSingular

/-! ## ES.3: the norm element and the Kolyvagin derivative operator -/

section Derivative

variable {Γ : Type*} [Group Γ]

/-- **`ES.3/derivative-operators`**, API `normElement`: `N_Γ = Σ_{γ} γ ∈ ℤ[Γ]`. -/
def normElement (Γ : Type*) [Group Γ] [Fintype Γ] : MonoidAlgebra ℤ Γ :=
  ∑ g : Γ, MonoidAlgebra.of ℤ Γ g

/-- API `kolyvaginDerivative`: `D_σ = Σ_{i < n} i σ^i`, `n` the order of `σ`. -/
def kolyvaginDerivative (σ : Γ) : MonoidAlgebra ℤ Γ :=
  ∑ i ∈ Finset.range (orderOf σ), (i : MonoidAlgebra ℤ Γ) * MonoidAlgebra.of ℤ Γ (σ ^ i)

/-- API `sub_one_mul_kolyvaginDerivative`: `(σ - 1) D_σ = |Γ| - N_Γ` for a generator `σ`. -/
theorem sub_one_mul_kolyvaginDerivative [Fintype Γ] (σ : Γ) (hσ : ∀ g : Γ, g ∈ Subgroup.zpowers σ) :
    (MonoidAlgebra.of ℤ Γ σ - 1) * kolyvaginDerivative σ =
      (Fintype.card Γ : MonoidAlgebra ℤ Γ) - normElement Γ := sorry

/-- The augmentation `ℤ[Γ] → ℤ`. -/
def augmentation (Γ : Type*) [Group Γ] : MonoidAlgebra ℤ Γ →ₐ[ℤ] ℤ :=
  MonoidAlgebra.lift ℤ ℤ Γ 1

/-- API `augmentation_kolyvaginDerivative`. -/
theorem augmentation_kolyvaginDerivative (σ : Γ) :
    2 * augmentation Γ (kolyvaginDerivative σ) = (orderOf σ : ℤ) * ((orderOf σ : ℤ) - 1) := sorry

theorem augmentation_normElement [Fintype Γ] :
    augmentation Γ (normElement Γ) = Fintype.card Γ := sorry

/-- API `kolyvaginDerivative_generator`: for `a a' ≡ 1 (mod n)`, `D_{σ^a} - a' D_σ ∈ n ℤ[Γ]`. -/
theorem kolyvaginDerivative_generator (σ : Γ) (a a' : ℕ) (h : a * a' ≡ 1 [MOD orderOf σ]) :
    ∃ x : MonoidAlgebra ℤ Γ,
      kolyvaginDerivative (σ ^ a) - (a' : MonoidAlgebra ℤ Γ) * kolyvaginDerivative σ =
        (orderOf σ : MonoidAlgebra ℤ Γ) * x := sorry

/-- API `normElement_eq_representation_norm`: `N_Γ` acts as Mathlib's `Representation.norm`. -/
theorem normElement_eq_representation_norm [Fintype Γ] {V : Type*} [AddCommGroup V] [Module ℤ V]
    (ρ : Representation ℤ Γ V) :
    MonoidAlgebra.lift ℤ (Module.End ℤ V) Γ ρ (normElement Γ) = ρ.norm := sorry

/-- Test `kolyvaginDerivative_order_two`: for `σ` of order two, `D_σ = σ`. -/
example (σ : Γ) (h : orderOf σ = 2) : kolyvaginDerivative σ = MonoidAlgebra.of ℤ Γ σ := sorry

/-- Test `kolyvaginDerivative_order_three`: for `σ` of order three, `D_σ = σ + 2σ²`. -/
example (σ : Γ) (h : orderOf σ = 3) :
    kolyvaginDerivative σ = MonoidAlgebra.of ℤ Γ σ + 2 * MonoidAlgebra.of ℤ Γ (σ ^ 2) := sorry

/-- Test `kolyvaginDerivative_trivial`: for the trivial element, `D = 0`. -/
example : kolyvaginDerivative (1 : Γ) = 0 := sorry

/-- Test `kolyvaginDerivative_not_norm_multiple`: `(σ - 1) D_σ ≠ 0` for a generator of a group of
order at least two. -/
example [Fintype Γ] (σ : Γ) (hσ : ∀ g : Γ, g ∈ Subgroup.zpowers σ) (h : 2 ≤ Fintype.card Γ) :
    (MonoidAlgebra.of ℤ Γ σ - 1) * kolyvaginDerivative σ ≠ 0 := sorry

end Derivative

/-! ## ES.4: sheaves on graphs -/

section GraphSheaf

/-- **`ES.4/selmer-sheaf`**, API `GraphSheaf`: a sheaf of `R`-modules on a simple graph: vertex
modules, edge modules and vertex-to-edge maps (Mazur–Rubin, Definition 3.1.1). -/
structure GraphSheaf (R : Type u) [CommRing R] {V : Type v} (X : SimpleGraph V) where
  /-- The stalk at a vertex. -/
  stalk : V → Type w
  [addCommGroupStalk : ∀ x, AddCommGroup (stalk x)]
  [moduleStalk : ∀ x, Module R (stalk x)]
  /-- The module at an edge. -/
  edge : X.edgeSet → Type w
  [addCommGroupEdge : ∀ e, AddCommGroup (edge e)]
  [moduleEdge : ∀ e, Module R (edge e)]
  /-- The vertex-to-edge map `ψ_v^e`, for `v` an endpoint of `e`. -/
  toEdge : ∀ (e : X.edgeSet) (x : V), x ∈ (e : Sym2 V) → stalk x →ₗ[R] edge e

attribute [instance] GraphSheaf.addCommGroupStalk GraphSheaf.moduleStalk
  GraphSheaf.addCommGroupEdge GraphSheaf.moduleEdge

namespace GraphSheaf

variable {R : Type u} [CommRing R] {V : Type v} {X : SimpleGraph V} (S : GraphSheaf.{u, v, w} R X)

/-- API `GraphSheaf.sections`: the module `Γ(S)` of global sections. -/
def sections : Submodule R (∀ x, S.stalk x) :=
  ⨅ (e : X.edgeSet) (x : V) (y : V) (hx : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)),
    LinearMap.eqLocus ((S.toEdge e x hx).comp (LinearMap.proj x))
      ((S.toEdge e y hy).comp (LinearMap.proj y))

/-- API `GraphSheaf.mem_sections`. -/
theorem mem_sections (κ : ∀ x, S.stalk x) :
    κ ∈ S.sections ↔ ∀ (e : X.edgeSet) (x y : V) (hx : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)),
      S.toEdge e x hx (κ x) = S.toEdge e y hy (κ y) := sorry

/-- **`ES.4/sheaf-monodromy`**, API `GraphSheaf.IsLocallyCyclic`. -/
structure IsLocallyCyclic : Prop where
  stalk_cyclic : ∀ x, (⊤ : Submodule R (S.stalk x)).IsPrincipal
  edge_cyclic : ∀ e, (⊤ : Submodule R (S.edge e)).IsPrincipal
  toEdge_surjective : ∀ e x hx, Function.Surjective (S.toEdge e x hx)

/-- A step of a surjective path from `x` to `y`: they span an edge whose map from `y` is
bijective. -/
def SurjStep (x y : V) : Prop :=
  ∃ (e : X.edgeSet) (_ : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)), x ≠ y ∧
    Function.Bijective (S.toEdge e y hy)

/-- API `GraphSheaf.IsHub`: every vertex is reached from `x` by a surjective path. -/
def IsHub (x : V) : Prop := ∀ y, Relation.ReflTransGen S.SurjStep x y

/-- API `GraphSheaf.IsPrimitive`: `κ_v` generates `S(v)` for every `v`. -/
def IsPrimitive (κ : S.sections) : Prop :=
  ∀ x, Submodule.span R {(κ : ∀ x, S.stalk x) x} = ⊤

/-- API `GraphSheaf.eval_injective_of_isHub` (Mazur–Rubin, Proposition 3.4.4(i)). -/
theorem eval_injective_of_isHub (hS : S.IsLocallyCyclic) {x : V} (hx : S.IsHub x) :
    Function.Injective fun κ : S.sections => (κ : ∀ x, S.stalk x) x := sorry

/-- API `GraphSheaf.Subsheaf`: submodules of the stalks and edge modules stable under the maps. -/
structure Subsheaf where
  /-- The submodule of each stalk. -/
  stalk : ∀ x, Submodule R (S.stalk x)
  /-- The submodule of each edge module. -/
  edge : ∀ e, Submodule R (S.edge e)
  map_le : ∀ e x hx, (stalk x).map (S.toEdge e x hx) ≤ edge e

/-- The sections of a subsheaf, as a submodule of `Γ(S)`: sections with values in the
substalks. -/
def Subsheaf.sections (S' : S.Subsheaf) : Submodule R (∀ x, S.stalk x) :=
  S.sections ⊓ Submodule.pi Set.univ S'.stalk

/-- Test `isPrimitive_zero_module`: if all stalks are zero, the zero section is primitive. -/
example (h : ∀ x, Subsingleton (S.stalk x)) : S.IsPrimitive 0 := sorry

end GraphSheaf

/-- API `conductorGraph`: the graph `X(P)` on finite sets of primes, `n` adjacent to `n ∪ {q}`. -/
def conductorGraph (Pl : Type v) [DecidableEq Pl] : SimpleGraph (Finset Pl) where
  Adj n m := ∃ q, (q ∉ n ∧ m = insert q n) ∨ (q ∉ m ∧ n = insert q m)
  symm := sorry
  loopless := sorry

/-- Test `conductorGraph_two_primes` (one edge): `1` is adjacent to `q`. -/
example (Pl : Type v) [DecidableEq Pl] (q : Pl) : (conductorGraph Pl).Adj ∅ {q} := sorry

/-- `1` is not adjacent to a product of two distinct primes. -/
example (Pl : Type v) [DecidableEq Pl] (q₁ q₂ : Pl) (h : q₁ ≠ q₂) :
    ¬ (conductorGraph Pl).Adj ∅ {q₁, q₂} := sorry

end GraphSheaf

end TauCeti.KolyvaginSystems

/-! ## ES.1 (error-tolerant inputs): exponents and orders -/

namespace TauCeti.ErrorTolerant

variable {O : Type*} [CommRing O] (ϖ : O) {M : Type*} [AddCommGroup M] [Module O M]

/-- **`ES.1/reducibility-depth`**, API `expAt`: `exp_λ(x, M) = min{d : λ^d x = 0}`. -/
def expAt (x : M) : ℕ∞ := ⨅ d ∈ {d : ℕ | ϖ ^ d • x = 0}, (d : ℕ∞)

/-- API `ordAt`: `ord_λ(x, M) = sup{d : x ∈ λ^d M}`. -/
def ordAt (x : M) : ℕ∞ :=
  ⨆ d ∈ {d : ℕ | x ∈ (Ideal.span {ϖ} ^ d) • (⊤ : Submodule O M)}, (d : ℕ∞)

/-- Test `expAt_zmod`: in `ℤ/p³`, `exp_p(p) = 2` (here `p = 3`). -/
example : expAt (3 : ℤ) (3 : ZMod 27) = 2 := sorry

/-- Test `expAt_zmod`, second half: `ord_p(p) = 1`. -/
example : ordAt (3 : ℤ) (3 : ZMod 27) = 1 := sorry

/-- Test `ordAt_top_iff`. -/
example (x : M) : ordAt ϖ x = ⊤ ↔ ∀ d : ℕ, x ∈ (Ideal.span {ϖ} ^ d) • (⊤ : Submodule O M) := sorry

end TauCeti.ErrorTolerant

/-! ## ES.2: the module of Euler systems of an abstract tower -/

namespace TauCeti.EulerSystems

section EulerPoly

variable {R : Type*} [CommRing R] {T : Type*} [AddCommGroup T] [Module R T] [Module.Free R T]
  [Module.Finite R T]

/-- **`ES.2/euler-polynomial`**, API `eulerPolyMR`: `det(1 - φ X | T)`, the reversal of the
characteristic polynomial; for `φ = Fr_q` this is the Mazur–Rubin Euler polynomial. -/
def eulerPolyMR (φ : T →ₗ[R] T) : R[X] := (LinearMap.charpoly φ).reverse

/-- API `eulerPoly`: Rubin's polynomial `det(1 - Fr_q⁻¹ X | Hom(T, O(1))) = det(1 - N⁻¹ φ X | T)`,
for `φ = Fr_q` and `N = N(q)` a unit of the coefficient ring. -/
def eulerPoly (φ : T →ₗ[R] T) (N : Rˣ) : R[X] := eulerPolyMR ((↑N⁻¹ : R) • φ)

/-- API `eulerPoly_coeff`. -/
theorem eulerPoly_coeff (φ : T →ₗ[R] T) (N : Rˣ) (i : ℕ) :
    (eulerPoly φ N).coeff i * (N : R) ^ i = (eulerPolyMR φ).coeff i := sorry

/-- API `eulerPoly_congr`: the two polynomials agree modulo `N - 1`. -/
theorem eulerPoly_congr (φ : T →ₗ[R] T) (N : Rˣ) (i : ℕ) :
    (eulerPoly φ N).coeff i - (eulerPolyMR φ).coeff i ∈ Ideal.span {(N : R) - 1} := sorry

/-- Test `eulerPoly_zp_one`: on `ℤ_p(1)` Frobenius acts by `N`; the Mazur–Rubin polynomial is
`1 - N X`. -/
example (N : Rˣ) : eulerPolyMR ((N : R) • (LinearMap.id : R →ₗ[R] R)) = 1 - C (N : R) * X := sorry

/-- Test `eulerPoly_zp_one`, second half: Rubin's polynomial is `1 - X`. -/
example (N : Rˣ) : eulerPoly ((N : R) • (LinearMap.id : R →ₗ[R] R)) N = 1 - X := sorry

/-- Test `eulerPoly_rank_zero`: for the zero endomorphism the polynomial is `1`. -/
example : eulerPolyMR (0 : T →ₗ[R] T) = 1 := sorry

end EulerPoly

/-- An abstract norm-compatible tower: modules `H F` (for `H¹(F, T)`) indexed by a preorder of
fields, corestriction maps and Euler-factor operators `∏_{q ∈ Σ(F'/F)} P(Fr_q⁻¹ | T^*; Fr_q⁻¹)`. -/
structure Tower (O : Type u) [CommRing O] (ι : Type v) [Preorder ι] where
  /-- The cohomology module at a field. -/
  H : ι → Type w
  [addCommGroupH : ∀ F, AddCommGroup (H F)]
  [moduleH : ∀ F, Module O (H F)]
  /-- Corestriction. -/
  cor : ∀ {F F' : ι}, F ≤ F' → H F' →ₗ[O] H F
  /-- The Euler factor attached to `F ≤ F'`. -/
  factor : ∀ {F F' : ι}, F ≤ F' → H F →ₗ[O] H F

attribute [instance] Tower.addCommGroupH Tower.moduleH

variable {O : Type u} [CommRing O] {ι : Type v} [Preorder ι] (𝒯 : Tower.{u, v, w} O ι)

/-- **`ES.2/euler-system-module`**, API `EulerSystem`: the submodule of `∏_F H¹(F, T)` cut out by
the corestriction relations. -/
def EulerSystem : Submodule O (∀ F, 𝒯.H F) :=
  ⨅ (F : ι) (F' : ι) (h : F ≤ F'),
    LinearMap.eqLocus ((𝒯.cor h).comp (LinearMap.proj F')) ((𝒯.factor h).comp (LinearMap.proj F))

/-- API `EulerSystem.eval`. -/
def EulerSystem.eval (F : ι) : EulerSystem 𝒯 →ₗ[O] 𝒯.H F :=
  (LinearMap.proj F).comp (EulerSystem 𝒯).subtype

/-- API `EulerSystem.cor_eval`. -/
theorem EulerSystem.cor_eval (c : EulerSystem 𝒯) {F F' : ι} (h : F ≤ F') :
    𝒯.cor h (EulerSystem.eval 𝒯 F' c) = 𝒯.factor h (EulerSystem.eval 𝒯 F c) := sorry

/-- API `EulerSystem.ext`. -/
theorem EulerSystem.ext (c c' : EulerSystem 𝒯)
    (h : ∀ F, EulerSystem.eval 𝒯 F c = EulerSystem.eval 𝒯 F c') : c = c' := sorry

/-- API `EulerSystem.lift`: the universal property of the equaliser. -/
def EulerSystem.lift {X : Type*} [AddCommGroup X] [Module O X] (f : ∀ F, X →ₗ[O] 𝒯.H F)
    (hf : ∀ {F F' : ι} (h : F ≤ F'), (𝒯.cor h).comp (f F') = (𝒯.factor h).comp (f F)) :
    X →ₗ[O] EulerSystem 𝒯 :=
  LinearMap.codRestrict _ (LinearMap.pi f) sorry

/-- Test `EulerSystem.zero_mem`. -/
example : (0 : ∀ F, 𝒯.H F) ∈ EulerSystem 𝒯 := Submodule.zero_mem _

/-- Test `EulerSystem.universal_norm` (abstract form): where the Euler factor is the identity,
classes are norm-compatible. -/
example (c : EulerSystem 𝒯) {F F' : ι} (h : F ≤ F') (hf : 𝒯.factor h = LinearMap.id) :
    𝒯.cor h (EulerSystem.eval 𝒯 F' c) = EulerSystem.eval 𝒯 F c := sorry

end TauCeti.EulerSystems

/-! ## ES.6: the exterior bidual -/

namespace TauCeti.ExteriorBidual

variable (R : Type*) [CommRing R] (X : Type*) [AddCommGroup X] [Module R X]

/-- **`ES.6/exterior-bidual`**, API `exteriorBidual`: `⋂^r_R X = Hom_R(⋀^r Hom_R(X, R), R)`. -/
abbrev exteriorBidual (r : ℕ) : Type _ :=
  Module.Dual R (⋀[R]^r (Module.Dual R X))

/-- API `toBidual`: the canonical map `ξ^r_X : ⋀^r X → ⋂^r X`. -/
def toBidual (r : ℕ) : ⋀[R]^r X →ₗ[R] exteriorBidual R X r :=
  (exteriorPower.pairingDual R (Module.Dual R X) r).comp
    (exteriorPower.map r (Module.Dual.eval R X))

/-- API `toBidual_ιMulti_ιMulti`. -/
theorem toBidual_ιMulti_ιMulti (r : ℕ) (x : Fin r → X) (φ : Fin r → Module.Dual R X) :
    toBidual R X r (exteriorPower.ιMulti R r x) (exteriorPower.ιMulti R r φ) =
      Matrix.det (Matrix.of fun i j => φ i (x j)) := sorry

/-- API `toBidual_bijective`. -/
theorem toBidual_bijective [Module.Finite R X] [Module.Projective R X] (r : ℕ) :
    Function.Bijective (toBidual R X r) := sorry

variable {R X}

/-- API `map`: functoriality of the exterior bidual. -/
def map {Y : Type*} [AddCommGroup Y] [Module R Y] (f : X →ₗ[R] Y) (r : ℕ) :
    exteriorBidual R X r →ₗ[R] exteriorBidual R Y r :=
  Module.Dual.transpose (exteriorPower.map r (Module.Dual.transpose (R := R) f))

theorem map_id (r : ℕ) : map (LinearMap.id : X →ₗ[R] X) r = LinearMap.id := sorry

theorem map_comp {Y Z : Type*} [AddCommGroup Y] [Module R Y] [AddCommGroup Z] [Module R Z]
    (g : Y →ₗ[R] Z) (f : X →ₗ[R] Y) (r : ℕ) : map (g.comp f) r = (map g r).comp (map f r) := sorry

/-- Compatibility of `map` with `ξ`. -/
theorem map_toBidual {Y : Type*} [AddCommGroup Y] [Module R Y] (f : X →ₗ[R] Y) (r : ℕ) :
    (map f r).comp (toBidual R X r) = (toBidual R Y r).comp (exteriorPower.map r f) := sorry

/-- Test `free_rank`: `⋂²(R³)` has rank three. -/
example : Module.finrank ℤ (exteriorBidual ℤ (Fin 3 → ℤ) 2) = 3 := sorry

/-- Test `zero_power`: `⋂⁰ X ≅ R`. -/
example : Nonempty (exteriorBidual R X 0 ≃ₗ[R] R) := sorry

/-- Test `torsion_killed`: for `X = ℤ/2` over `ℤ`, `ξ¹` is zero, hence not injective. -/
example : toBidual ℤ (ZMod 2) 1 = 0 := sorry

/-- API `one_equiv_bidual`: `⋂¹ X` is the double dual. -/
theorem one_equiv_bidual :
    Nonempty (exteriorBidual R X 1 ≃ₗ[R] Module.Dual R (Module.Dual R X)) := sorry

end TauCeti.ExteriorBidual

/-! ## ES.6: Stark systems as an inverse limit -/

namespace TauCeti.StarkSystems

/-- The inverse system of a Stark system: modules `Y n` (Mazur–Rubin's `Y_n`, or the exterior
biduals `⋂^{r+ν(n)} H¹_{F^n}`) indexed by conductors ordered by divisibility, with transition
maps `Ψ_{n,m}`. -/
structure InverseSystem (R : Type u) [CommRing R] (ι : Type v) [Preorder ι] where
  /-- The module at a conductor. -/
  Y : ι → Type w
  [addCommGroupY : ∀ n, AddCommGroup (Y n)]
  [moduleY : ∀ n, Module R (Y n)]
  /-- The transition map `Ψ_{n,m}` for `m ∣ n`. -/
  transition : ∀ {m n : ι}, m ≤ n → Y n →ₗ[R] Y m
  /-- Identity transitions, needed for an inverse system rather than arbitrary compatible maps. -/
  transition_id : ∀ n : ι, transition (le_refl n) = LinearMap.id
  transition_comp : ∀ {l m n : ι} (h : l ≤ m) (h' : m ≤ n),
    (transition h).comp (transition h') = transition (h.trans h')

attribute [instance] InverseSystem.addCommGroupY InverseSystem.moduleY

variable {R : Type u} [CommRing R] {ι : Type v} [Preorder ι] (𝒴 : InverseSystem.{u, v, w} R ι)

/-- **`ES.6/stark-systems`**, API `StarkSystem`: the inverse limit `lim_n Y_n`. -/
def StarkSystem : Submodule R (∀ n, 𝒴.Y n) :=
  ⨅ (m : ι) (n : ι) (h : m ≤ n),
    LinearMap.eqLocus ((𝒴.transition h).comp (LinearMap.proj n)) (LinearMap.proj m)

/-- Membership in the module of Stark systems. -/
theorem mem_starkSystem (ε : ∀ n, 𝒴.Y n) :
    ε ∈ StarkSystem 𝒴 ↔ ∀ (m n : ι) (h : m ≤ n), 𝒴.transition h (ε n) = ε m := sorry

/-- Basic equaliser check: the zero family is compatible. This does not test the arithmetic
identity for the conductor-one stalk requested by `stalk_one`. -/
example : (0 : ∀ n, 𝒴.Y n) ∈ StarkSystem 𝒴 := Submodule.zero_mem _

end TauCeti.StarkSystems

end


/-! ## The declarations of the packet, by layer

The inventory below mirrors the reviewed mathematical statements and proposed names. It remains
comments, not Lean declarations. `[prototype above]` points to an algebraic prototype that may
cover only part of the item, without the arithmetic Galois/Selmer carrier or specialization map.
All remaining signatures, API lemmas, named theorems and examples are a recorded gap; compilation
of this file does not discharge that gap or certify any arithmetic theorem.
-/


/-! ### Layer ES.0 -/


/-

**`ES.0/selmer-triple`** (definition): Selmer triples and squarefree conductors.

  Statement. Fix a number field K, a prime p and a coefficient ring R: a complete noetherian local
    ring with maximal ideal m and finite residue field k = R/m of characteristic p. A Selmer triple
    (T, F, P) consists of a free R-module T of finite rank with a continuous R-linear action of G_K
    unramified outside finitely many primes, a Selmer structure F on T (a finite set Σ(F) of places
    containing the archimedean places, the places above p and the primes where T is ramified, with
    an R-submodule H¹_F(K_v, T) ⊆ H¹(K_v, T) for v ∈ Σ(F), and the unramified condition elsewhere),
    and a set P of primes of K disjoint from Σ(F). N(P) is the set of squarefree products of primes
    of P, with 1 ∈ N(P), and ν(n) is the number of prime factors of n. Selmer data (T, F, P, r) add
    an integer r ≥ 1. The dual is T^* = Hom(T, μ_{p^∞}) with the dual structure F^*.

  Hypothesis. R is complete noetherian local with finite residue field of characteristic p

  Hypothesis. T is free of finite rank over R

  Hypothesis. P ∩ Σ(F) = ∅

  * `TauCeti.KolyvaginSystems.SelmerTriple` (structure) [prototype above]: The triple (T, F, P): a
    Selmer structure F on T together with a set P of primes disjoint from Σ(F).

  * `TauCeti.KolyvaginSystems.SelmerTriple.conductors` (data) [prototype above]: N(P): the
    squarefree products of primes of P, as finite subsets of P.

  * `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors` (simp) [prototype above]: 1 ∈ N(P).

  * `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed` (characterisation) [prototype
    above]: If n ∈ N(P) and m | n then m ∈ N(P).

  * `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes` (functoriality) [prototype above]: For P′
    ⊆ P, (T, F, P′) is a Selmer triple and N(P′) ⊆ N(P).

  * `TauCeti.KolyvaginSystems.SelmerTriple.dual` (constructor): The Cartier dual data (T^*, F^*, P)
    use the imported discrete Selmer carrier, with Σ(F^*) = Σ(F). For a DVR lattice T, T^* = Hom(T,
    μ_{p^∞}) is discrete torsion, not a finite free lattice and hence not an object of the same
    lattice-triple type. Over a principal artinian ring, the finite Cartier dual is free of the same
    rank after the coefficient duality identification.

  * test `SelmerTriple.conductors_empty` (degenerate) [prototype above]: For P = ∅, N(P) = {1}.

  * test `SelmerTriple.card_conductors_of_finite` (computation): If P has exactly two primes q₁, q₂
    then N(P) = {1, q₁, q₂, q₁q₂} has four elements, and ν takes the values 0, 1, 1, 2.

  * test `SelmerTriple.not_mem_conductors_of_sq` (non-example): For q ∈ P the ideal q² is not in
    N(P).

  * test `SelmerTriple.disjoint_sigma` (characterisation) [prototype above]: No prime of Σ(F)
    divides any n ∈ N(P); in particular T is unramified at every prime dividing n and no such prime
    lies above p.

  Acceptance. For P = ∅ one has N(P) = {1} and a Selmer triple is a Selmer structure.

  Acceptance. N(P) is closed under taking divisors, and n, nq ∈ N(P) with q prime implies q ∈ P and
    q ∤ n.

-/


/-

**`ES.0/quotient-category`** (definition): The category of quotients of T.

  Statement. Quot_R(T) is the category whose objects are the quotients T/IT for all ideals I of R,
    and whose morphisms from T/IT to T/JT are the scalar multiplications by elements r ∈ R with rI ⊆
    J. A local condition propagated from T to all quotients (images under T → T/IT) is functorial
    over Quot_R(T). For R principal artinian of length k with uniformiser π, the objects are T/m^iT
    for 0 ≤ i ≤ k, and multiplication by π^{j−i} is an injective morphism T/m^iT → T/m^jT for i ≤ j.

  Hypothesis. R as in selmer-triple; T an R[[G_K]]-module

  * `TauCeti.KolyvaginSystems.QuotCat` (structure): The category Quot_R(T): objects the ideals I of
    R (standing for T/IT), morphisms I → J the scalars r with rI ⊆ J acting T/IT → T/JT.

  * `TauCeti.KolyvaginSystems.QuotCat.scalarHom` (constructor) [prototype above]: For r ∈ R with r·I
    ≤ J, the G_K-equivariant R-linear map T/IT → T/JT induced by multiplication by r.

  * `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp` (functoriality) [prototype above]: scalarHom s
    ∘ scalarHom r = scalarHom (sr), and scalarHom 1 is the identity of T/IT.

  * `TauCeti.KolyvaginSystems.QuotCat.scalarHom_injective_iff` (characterisation): For T free and
    nonzero, multiplication by r : T/IT → T/JT is injective if and only if (J : r) = I.

  * `TauCeti.KolyvaginSystems.QuotCat.propagate_functorial` (compatibility): A local condition
    propagated to quotients is a subfunctor of H¹(K_v, −) on Quot_R(T).

  * test `QuotCat.field_objects` (degenerate): If R is a field, the objects of Quot_R(T) are T/0 = T
    and T/R·T = 0.

  * test `QuotCat.zmod_sq_mul_p_injective` (computation): For R = ℤ/p² and T = R, multiplication by
    p is a morphism T/pT → T and is injective with image pT.

  * test `QuotCat.not_hom_of_not_le` (non-example): For R = ℤ/p² the scalar 1 is not a morphism from
    T/pT to T, because 1·(p) ⊄ (0).

  Acceptance. Over a field R = k the category has the two objects 0 and T.

  Acceptance. For R = ℤ/p², the map p : T/pT → T is a morphism and is injective when T is free.

-/


/-

**`ES.0/cartesian-condition`** (definition): Cartesian local conditions.

  Statement. A local condition F at a place v, functorial over a category 𝒯 of R[[G_{K_v}]]-modules,
    is cartesian on 𝒯 if for every injective morphism α : T₁ → T₂ of 𝒯 the square formed by
    H¹_F(K_v, T₁) ⊆ H¹(K_v, T₁) and H¹_F(K_v, T₂) ⊆ H¹(K_v, T₂) is cartesian: H¹_F(K_v, T₁) is the
    inverse image of H¹_F(K_v, T₂) under α_*. A Selmer structure F on T is cartesian if for every q
    ∈ Σ(F) the condition at q, propagated to quotients, is cartesian on Quot_R(T).

  Hypothesis. F is functorial over 𝒯

  * `TauCeti.KolyvaginSystems.IsCartesian` (structure) [prototype above]: The predicate: for every
    injective morphism α of Quot_R(T), H¹_F(K_v, T₁) = α_*⁻¹(H¹_F(K_v, T₂)).

  * `TauCeti.KolyvaginSystems.isCartesian_iff_comap` (characterisation): F is cartesian iff for all
    i ≤ j the condition on T/m^iT is the inverse image of the condition on T/m^jT under π^{j−i} (R
    principal artinian).

  * `TauCeti.KolyvaginSystems.isCartesian_unramified` (example): The finite condition is cartesian
    on any category of unramified modules.

  * `TauCeti.KolyvaginSystems.isCartesian_of_field` (example): If R is a field every local condition
    on T is cartesian on Quot_R(T).

  * `TauCeti.KolyvaginSystems.isCartesian_of_torsionFree_quotient` (compatibility): R a discrete
    valuation ring and H¹(K_q, T)/H¹_F(K_q, T) torsion-free imply that the induced condition on
    T/m^kT is cartesian on Quot(T/m^kT) for every k.

  * `TauCeti.KolyvaginSystems.IsCartesian.quotient` (functoriality): If F is cartesian on Quot_R(T)
    then the induced condition is cartesian on Quot_{R/m^j}(T/m^jT).

  * test `isCartesian_strict_and_relaxed_field` (degenerate) [prototype above]: For R = 𝔽_p and T =
    𝔽_p the strict and the relaxed conditions are both cartesian.

  * test `isCartesian_unramified_zmod` (compatibility): For K_v = ℚ_ℓ, ℓ ≠ p, R = ℤ/p^k and T = R
    with trivial action, the unramified condition Hom(G_{𝔽_ℓ}, T/p^iT) is cartesian: a homomorphism
    to ℤ/p^i whose composite with p^{j−i} : ℤ/p^i → ℤ/p^j is unramified is unramified.

  * test `not_isCartesian_torsion_condition` (non-example): For R = ℤ/p², T = R with trivial action
    and H¹_F(K_v, T) = H¹(K_v, T)[p], the propagated condition on T/pT is 0 (a homomorphism killed
    by p has values in pT), while the inverse image of H¹_F(K_v, T) under p : T/pT → T is all of
    H¹(K_v, T/pT) = Hom(G_{K_v}, 𝔽_p) ≠ 0. So F is not cartesian.

  * test `isCartesian_iff_torsionFree_example` (characterisation): For R = ℤ_p and T = ℤ_p(1) over
    ℚ_ℓ, ℓ ≠ p, the condition ker(H¹(ℚ_ℓ, T) → H¹(ℚ_ℓ^{ur}, T ⊗ ℚ_p)) has torsion-free quotient, and
    its propagation to T/p^k is cartesian.

  Acceptance. The unramified condition on unramified modules is cartesian; over a field every
    condition is cartesian.

  Acceptance. A condition defined by an extension L/K_v need not be cartesian (Mazur–Rubin 2004,
    Remark 1.1.8); the non-example test below exhibits a failure.

-/


/-

**`ES.0/cartesian-length-linearity`** (lemma): Lengths of cartesian conditions grow linearly.

  Statement. Let R be principal artinian of length k and F a local condition on T at v, cartesian on
    Quot_R(T). Then there is an integer r such that length H⁰(K_v, T/m^iT) − length H¹_F(K_v,
    T/m^iT) = r·i for 0 < i ≤ k.

  Hypothesis. R principal artinian of length k

  Hypothesis. F cartesian on Quot_R(T)

  Hypothesis. T free of finite rank

  Acceptance. For the unramified condition on an unramified T one gets r = 0, since H¹_f(K_v, T) ≅
    T/(Fr − 1)T has the length of T^{Fr=1}.

-/


/-

**`ES.0/quotient-dual-propagation`** (lemma): Propagation commutes with local duality.

  Statement. Let F be a local condition on T at v and I an ideal of R. The two local conditions
    induced on T^*[I] = (T/IT)^* agree: the orthogonal complement of the condition propagated to the
    quotient T/IT, and the condition propagated to the submodule T^*[I] from the orthogonal
    complement F^* on T^*. Consequently, for a Selmer structure F, (F on T/IT)^* = (F^* on T^*[I]),
    and the same holds for the passages T → V and V → V/T of a lattice in its rational
    representation.

  Hypothesis. Local Tate duality for T and T^* = Hom(T, μ_{p^∞}) at v

  Acceptance. For F relaxed on T both constructions give the strict condition on T^*[I]; for F
    strict both give the relaxed condition.

  Acceptance. The condition on a quotient remembers T: H¹_{F_can}(ℚ_p, T/IT) is the image of H¹(ℚ_p,
    T), which can be smaller than H¹(ℚ_p, T/IT) (Mazur–Rubin 2004, Definition 3.2.1 and Lemma A.1).

-/


/-

**`ES.0/selmer-torsion-identification`** (lemma): Selmer modules of quotients and torsion submodules.

  Statement. Assume T̄^{G_K} = (T̄^*)^{G_K} = 0 for T̄ = T/mT (which follows from (H.1) and (H.3) of
    Mazur–Rubin 2004). (a) For every ideal I of R, T^*[I] → T^* induces an isomorphism H¹_{F^*}(K,
    T^*[I]) ≅ H¹_{F^*}(K, T^*)[I]. (b) If R is principal artinian of length k and F is cartesian,
    then for 0 < i ≤ k the injection π^{k−i} : T/m^iT → T induces isomorphisms H¹(K, T/m^iT) ≅ H¹(K,
    T)[m^i] and H¹_F(K, T/m^iT) ≅ H¹_F(K, T)[m^i], and H¹_F(K, T)[m^i] is the kernel of H¹_F(K, T) →
    H¹_F(K, T/m^{k−i}T).

  Hypothesis. (T/mT)^{G_K} = (T^*[m])^{G_K} = 0

  Hypothesis. for (b): R principal artinian, F cartesian on Quot_R(T)

  Acceptance. For T = μ_{p^k} ⊗ ρ^{-1} with ρ ≠ 1, ω, both identifications hold (Mazur–Rubin 2004,
    Lemma 6.1.5).

  Acceptance. Without the invariants hypothesis the statement fails: for T = ℤ/p² with G_K acting
    through a nontrivial character χ ≡ 1 (mod p), the connecting map (T/pT)^{G_K} → H¹(K, T/pT) is
    nonzero, so H¹(K, T/pT) → H¹(K, T)[p] is not injective.

-/


/-

**`ES.0/selmer-length-difference`** (theorem): The Euler characteristic formula for Selmer modules.

  Statement. Let T be a finite R[[G_K]]-module and F a Selmer structure on T. Then length H¹_F(K, T)
    − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v,
    T) − length H¹_F(K_v, T)), all lengths over R.

  Hypothesis. T finite

  Hypothesis. lengths taken over R (for R = ℤ/p^k these are p-adic valuations of orders)

  Acceptance. For K = ℚ, R = 𝔽_p, T = μ_p with the relaxed condition at p and strict at ∞ (p odd),
    the left side is dim (ℤ[1/p]^×/p) − dim H¹_{F^*}(ℚ, ℤ/p) = 1 − 0 and the right side is 0 − 1 −
    ((0 − 2) + (0 − 0)) = 1: the term at p is length H⁰(ℚ_p, μ_p) − length H¹(ℚ_p, μ_p) = 0 − 2 and
    the term at ∞ is 0 − 0.

-/


/-

**`ES.0/core-rank`** (definition): The core rank of a cartesian Selmer structure.

  Statement. Let R be principal artinian of length k, F a cartesian Selmer structure on T, and
    T^{G_K} = (T^*)^{G_K} = 0. There is a unique integer r such that H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕
    R^r if r ≥ 0 and H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*) if r ≤ 0 (noncanonically). Mazur–Rubin
    2016 Definition 3.4 calls the signed integer r the core rank. In the convention of Mazur–Rubin
    2004 Definition 4.1.11, the nonnegative core ranks are χ(T, F) = max(r, 0) and χ(T^*, F^*) =
    max(−r, 0); one of these is zero. Higher-rank systems use the signed r and require r ≥ 1. For R
    a discrete valuation ring and F cartesian, χ(T, F) is the common value of χ(T/m^kT, F) for k ≥
    1.

  Hypothesis. R principal artinian (or a discrete valuation ring)

  Hypothesis. F cartesian

  Hypothesis. (T/mT)^{G_K} = (T^*[m])^{G_K} = 0

  * `TauCeti.KolyvaginSystems.coreRankInt` (data): The integer r with length H¹_F(K, T) − length
    H¹_{F^*}(K, T^*) = r·k.

  * `TauCeti.KolyvaginSystems.coreRank` (data): χ(T, F) = max(r, 0) as a natural number; χ(T^*, F^*)
    = max(−r, 0).

  * `TauCeti.KolyvaginSystems.coreRank_mul_length` (characterisation): If χ(T) > 0 then length
    H¹_F(K, T) − length H¹_{F^*}(K, T^*) = k·χ(T); if χ(T) = 0 the difference is −k·χ(T^*).

  * `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual` (relation): χ(T, F) = 0 or χ(T^*, F^*) = 0.

  * `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free` (equivalence): If coreRankInt(T,F) = r ≥
    0, there is a noncanonical R-linear isomorphism H¹_F(K,T) ≃ H¹_{F^*}(K,T^*) × R^r. For r ≤ 0 the
    free factor occurs on the other side.

  * `TauCeti.KolyvaginSystems.coreRank_field` (example): For R = k a field, χ(T) − χ(T^*) = dim_k
    H¹_F(K, T) − dim_k H¹_{F^*}(K, T^*).

  * test `coreRank_cyclotomic_even` (computation): For K = ℚ, R = ℤ/p^k, ρ an even nontrivial
    character of order prime to p and T = μ_{p^k} ⊗ ρ^{-1} with the structure F of Mazur–Rubin 2004
    Definition 6.1.1, χ(T, F) = 1; for ρ odd with ρ ≠ ω, χ(T, F) = 0.

  * test `coreRank_elliptic_classical` (computation): For E/ℚ and p ≥ 5 with surjective mod-p
    representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and
    χ(T,F_can) = 1 for the structure propagated from T_pE.

  * test `coreRank_field_strict_relaxed` (degenerate): Over R = k, replacing F by the structure
    relaxed at one prime q ∈ P_1 (so that H¹_s(K_q, T) is one-dimensional) raises r by exactly 1.

  * test `coreRank_ne_rank` (non-example): For E/ℚ and p ≥ 5 with surjective mod-p representation, T
    = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the
    structure propagated from T_pE.

  Acceptance. χ(T, F) = 1 for T = μ_{p^k} ⊗ ρ^{-1} with ρ even and nontrivial and F the unit-root
    structure of Mazur–Rubin 2004 §6.1; χ = 0 for ρ odd, ρ ≠ ω.

  Acceptance. The core rank is not the R-rank of T: Under the hypotheses of example-elliptic, for T
    = E[p^k], a module of rank 2, χ(T, F_can) = 1 and χ(T, F) = 0 for the classical Selmer
    structure.

-/


/-

**`ES.0/core-rank-independence-of-modulus`** (theorem): The core rank is independent of the modulus.

  Statement. Let R be principal artinian of length k and F cartesian with the invariants hypothesis
    of core-rank. Then for 0 < i ≤ k the Selmer triple (T/m^iT, F, P) over R/m^i has χ(T/m^iT) =
    χ(T) and χ(T^*[m^i]) = χ(T^*), and H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i]) when
    χ(T) > 0. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈
    Σ(F), then rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*).

  Hypothesis. as in core-rank

  Acceptance. For T = T_pE and F_can, rank H¹_{F_can}(ℚ, T) − corank H¹_{F_can^*}(ℚ, E[p^∞]) = 1.

-/


/-

**`ES.0/canonical-selmer-structure`** (definition): The canonical and the unramified Selmer structures.

  Statement. Let R be the ring of integers of a finite extension of ℚ_p (or a discrete valuation
    ring as in Mazur–Rubin 2016). The canonical Selmer structure F_can on T has Σ(F_can) = {q : T
    ramified at q} ∪ {v | p} ∪ {v | ∞}; H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p))
    for q ∈ Σ(F_can), q ∤ p∞; and H¹_{F_can}(K_v, T) = H¹(K_v, T) for v | p∞. On T/IT it is the
    structure induced from T, which depends on T and not only on T/IT. The unramified structure F_ur
    of Mazur–Rubin 2016 has the same conditions away from p and, at 𝔭 | p, the saturation of the
    universal norm subgroup ∩_L Cor_{L/K_𝔭} H¹(L, T) over finite unramified L/K_𝔭.

  Hypothesis. R a discrete valuation ring, finite over ℤ_p for F_can

  * `TauCeti.KolyvaginSystems.canonicalStructure` (constructor): F_can: relaxed at v | p∞, and at
    ramified q ∤ p the kernel of H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p).

  * `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree` (characterisation): H¹(K_q,
    T)/H¹_{F_can}(K_q, T) is torsion-free for every q, so F_can is cartesian on quotients.

  * `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p` (compatibility): The dual structure
    F_can^* is strict at every v | p and equals the dual of the unramified-saturated condition
    elsewhere.

  * `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p` (relation): H¹_{F_can}(K_𝔭, T/IT) is
    the image of H¹(K_𝔭, T); it equals H¹(K_𝔭, T/IT) if H⁰(K_𝔭, T^*) is divisible.

  * `TauCeti.KolyvaginSystems.unramifiedStructure` (constructor): F_ur of Mazur–Rubin 2016,
    Definition 5.1.

  * `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical` (compatibility): If H⁰(K_𝔭, T^*) has
    finite length for every 𝔭 | p then F_ur = F_can.

  * test `canonicalStructure_unramified_place` (compatibility): At a prime q ∤ p where T is
    unramified, ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p)) = H¹_ur(K_q, T), so adding q to Σ(F_can)
    does not change the structure.

  * test `canonicalStructure_zp_one` (computation): For K = ℚ, T = ℤ_p(1), p odd: H¹_{F_can}(ℚ, T)
    is the p-adic completion of ℤ[1/p]^×, free of rank one over ℤ_p, generated by the class of p.

  * test `canonicalStructure_quotient_ne_relaxed` (non-example): Local counterexample: p odd, T =
    ℤ_p(1) ⊗ ψ^{-1}, with ψ unramified at p and ψ(Fr_p) = 1+p. Then H⁰(ℚ_p,T^*) ≅ ℤ/p is finite
    nondivisible, H²(ℚ_p,T)[p] ≠ 0, and the image of H¹(ℚ_p,T) in H¹(ℚ_p,T/pT) is proper. This is a
    local continuous character, not a finite-order character with ρ(p)=1.

  * test `canonicalStructure_elliptic` (computation): For T=T_pE over ℚ and p odd, F_can is the
    classical lattice Kummer structure relaxed at p, with F_can^* ≤ F ≤ F_can under the Weil-pairing
    dictionary. On E[p^k] use the image of H¹(ℚ_p,T_pE); it is the full local group when
    E(ℚ_p)[p^∞]=0 and may be proper otherwise.

  * test `canonicalStructure_quotient_finite_order_trivial_local` (computation): For T = ℤ_p(1) ⊗
    ρ^{-1} with ρ finite order prime to p, unramified at p, and ρ(p)=1, T^* is locally ℚ_p/ℤ_p. Its
    invariants are divisible, so the propagated canonical condition on T/p^kT is all H¹(ℚ_p,T/p^kT).
    The unit condition on the lattice remains proper.

  Acceptance. For T = ℤ_p(1) ⊗ ρ^{-1} with ρ(p) ≠ 1, F_can equals the unit structure F of
    Mazur–Rubin 2004 §6.1 (Lemma 6.1.2).

  Acceptance. H¹_{F_can}(ℚ_p, T/IT) = H¹(ℚ_p, T/IT) when H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and
    can be smaller otherwise.

-/


/-

**`ES.0/core-rank-formula`** (theorem): Core rank of the canonical and unramified structures.

  Statement. (a) (K = ℚ) For R the ring of integers of a finite extension of ℚ_p and T satisfying
    (H.0)–(H.3), χ(T^*, F_can^*) = 0 and χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*), where T^−
    is the minus part for a complex conjugation. (b) (K a number field, R a discrete valuation ring)
    χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*).

  Hypothesis. the invariants hypothesis of core-rank

  Hypothesis. for (a): K = ℚ and the hypotheses of Mazur–Rubin 2004 §5.2

  Acceptance. T = ℤ_p(1) ⊗ ρ^{-1}: χ(T, F_can) = 1 if ρ is even with ρ(p) ≠ 1; T = T_pE: χ(T, F_can)
    = 1.

  Acceptance. For an abelian variety A of dimension d over K with large image, χ(T_pA, F) = d[K : ℚ]
    (Mazur–Rubin 2016, Proposition 5.9): the core rank is not the analytic rank.

-/


/-

**`ES.0/hypotheses-mr2004`** (definition): The Mazur–Rubin 2004 hypotheses (H.0)–(H.6) over ℚ.

  Statement. For a Selmer triple (T, F, P) over K = ℚ: (H.0) T is free of finite rank over R. (H.1)
    T/mT is an absolutely irreducible k[G_ℚ]-representation. (H.2) There is τ ∈ G_ℚ with τ = 1 on
    μ_{p^∞} and T/(τ − 1)T free of rank one over R. (H.3) H¹(ℚ(T, μ_{p^∞})/ℚ, T/mT) = H¹(ℚ(T,
    μ_{p^∞})/ℚ, T^*[m]) = 0. (H.4) Either (H.4a) Hom_{𝔽_p[[G_ℚ]]}(T/mT, T^*[m]) = 0, or (H.4b) p >
    4. (H.5) P_t ⊆ P ⊆ P_1 for some t ≥ 1, with P_k the Kolyvagin primes of level k. (H.6) For every
    ℓ ∈ Σ(F) the local condition at ℓ is cartesian on Quot_R(T). Each is a separate proposition; the
    record has one field for each.

  Hypothesis. K = ℚ

  * `TauCeti.KolyvaginSystems.MR04Hypotheses` (structure): The record with fields irreducible (H.1),
    tau (H.2: an element τ with its two properties), h1Vanishing (H.3), homVanishingOrLarge (H.4),
    primes (H.5), cartesian (H.6).

  * `TauCeti.KolyvaginSystems.MR04Hypotheses.invariants_eq_bot` (characterisation): (H.3) implies
    S^{G_ℚ} = 0 for every subquotient S of T and of T^*.

  * `TauCeti.KolyvaginSystems.MR04Hypotheses.dual` (functoriality): If T satisfies (H.0)–(H.5) then
    so does T^* (for R principal artinian).

  * `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient` (functoriality): (H.0)–(H.4) pass to T ⊗_R R′
    for surjective R → R′; (H.6) passes to T/m^jT for R principal artinian.

  * `TauCeti.KolyvaginSystems.MR04Hypotheses.of_rank_one` (example): If rank_R T = 1 then (H.1)
    holds and (H.2) holds with τ = 1.

  * test `MR04Hypotheses.cyclotomic_twist` (computation): For p odd, ρ : G_ℚ → ℤ_p^× of finite order
    prime to p with ρ ≠ 1 and ρ ≠ ω, T = ℤ_p(1) ⊗ ρ^{-1} satisfies (H.0), (H.1), (H.2) with τ = 1,
    (H.3) and (H.4a).

  * test `MR04Hypotheses.elliptic` (computation): For E/ℚ with G_ℚ → Aut(E[p]) surjective and p ≥ 5,
    T = T_pE satisfies (H.0)–(H.3) and (H.4b).

  * test `MR04Hypotheses.not_trivial_character` (non-example): T = ℤ_p(1) (ρ = 1) does not satisfy
    (H.3): T^*[m] = Hom(μ_p, μ_p) is the trivial module 𝔽_p, so (T^*[m])^{G_ℚ} ≠ 0, contradicting
    the consequence S^{G_ℚ} = 0 of (H.3). Likewise ρ = ω fails because T/mT is trivial.

  * test `MR04Hypotheses.field_cartesian` (degenerate): If R is a field, (H.6) holds for every
    Selmer structure.

  Acceptance. The record is satisfied by T = ℤ_p(1) ⊗ ρ^{-1}, ρ ≠ 1, ω of order prime to p, with
    (H.4a); and by T = T_pE with surjective mod-p representation and p ≥ 5, with (H.4b).

  Acceptance. It is not satisfied by T = ℤ_p(1): (H.3) fails.

-/


/-

**`ES.0/hypotheses-mr2016`** (definition): The Mazur–Rubin 2016 hypotheses (H.1)–(H.7) over a number field.

  Statement. For Selmer data (T, F, P, r) over a number field K, let M be the smallest power of p
    with MR = 0 if R is artinian and M = p^∞ if R is a discrete valuation ring, H the Hilbert class
    field of K and H_M = H(μ_M, (O_K^×)^{1/M}). (H.1) T̄^{G_K} = (T̄^*)^{G_K} = 0 and T̄ is an
    absolutely irreducible k[[G_K]]-module. (H.2) There are τ ∈ Gal(K̄/H_M) and a finite Galois
    extension L of K in H_M such that T/(τ − 1)T is free of rank one over R and P(L, τ) ⊆ P, where
    P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K).
    (H.3) H¹(H_M(T)/K, T/mT) = H¹(H_M(T)/K, T^*[m]) = 0. (H.4) Either T̄ ≇ T̄^* as k[[G_K]]-modules,
    or p > 3. (H.5) F is cartesian. (H.6) r = χ(T) > 0. For R artinian only: (H.7) I_q = 0 for every
    q ∈ P.

  Hypothesis. K a number field

  Hypothesis. R principal artinian or a discrete valuation ring

  * `TauCeti.KolyvaginSystems.MR16Hypotheses` (structure): The record with fields
    invariantsAndIrreducible (H.1), tau (H.2: τ, L and the inclusion P(L, τ) ⊆ P), h1Vanishing
    (H.3), notSelfDualOrLarge (H.4), cartesian (H.5), coreRank (H.6).

  * `TauCeti.KolyvaginSystems.MR16Hypotheses.IsArtinianAdmissible` (structure): (H.7): I_q = 0 for
    all q ∈ P, for R artinian.

  * `TauCeti.KolyvaginSystems.MR16Hypotheses.quotient` (functoriality): The record for (T, F, P, r)
    gives the record for (T/m^kT, F, P, r) over R/m^k.

  * `TauCeti.KolyvaginSystems.MR16Hypotheses.artinianAdmissible_of_frobenius` (characterisation): If
    R is artinian and q ∈ P(H_M, τ) then I_q = 0; so (H.7) holds for P(H_M, τ).

  * `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04` (compatibility): For K = ℚ and p odd, a triple
    satisfying (H.0)–(H.4), (H.6) of 2004 with χ(T) = r > 0 and P ⊇ P(L, τ) for some finite L ⊆
    ℚ(μ_M) satisfies the 2016 record; here 2004 (H.4a) gives the first alternative of 2016 (H.4) and
    p > 4 is p > 3.

  * test `MR16Hypotheses.abelian_variety` (computation): For an abelian variety A of dimension d
    over K with image of G_K in Aut(A[p]) containing GSp_{2d}(𝔽_p) and p > 3, T = T_pA with the
    structure of Mazur–Rubin 2016 §5 satisfies (H.1)–(H.6) with r = d[K : ℚ].

  * test `MR16Hypotheses.not_coreRank_zero` (non-example): T = E[p^k] with the classical Selmer
    structure has χ = 0, so (H.6) fails for every r ≥ 1 although (H.1)–(H.5) can hold.

  * test `MR16Hypotheses.q_eq_HM` (degenerate): For K = ℚ and p odd, H_M = ℚ(μ_M), so (H.2) asks for
    τ trivial on μ_M, as in 2004 (H.2).

  * test `MR16Hypotheses.h4_prime_three` (non-example): For p = 3 and T̄ ≅ T̄^* (for example T̄ =
    E[3]) hypothesis (H.4) fails; p = 3 is allowed only when T̄ is not self-dual.

  Acceptance. Satisfied by T = T_pA for an abelian variety with large image and p > 3, with r = d[K
    : ℚ] (Mazur–Rubin 2016, §5).

  Acceptance. (H.6) excludes core rank zero: it is a hypothesis on (T, F), not a consequence of the
    others.

-/


/-

**`ES.0/hypotheses-implications`** (lemma): Implications between the hypothesis records.

  Statement. (a) (H.0)–(H.4) of 2004 are stable under R → R′ surjective, and (H.6) under T → T/m^jT.
    (b) For R a discrete valuation ring, torsion-freeness of H¹(K_q, T)/H¹_F(K_q, T) for q ∈ Σ(F)
    implies (H.6)/(H.5) for every T/m^kT. (c) 2004 (H.3) implies T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0, hence
    2016 (H.1) given (H.1) of 2004; 2004 (H.3) implies 2016 (H.3) for K = ℚ, because ℚ(T, μ_M) ⊆
    ℚ(T, μ_{p^∞}) and inflation is injective on H¹. (d) 2016 (H.1)–(H.6) for artinian R give (H.7)
    for the prime set P(H_M, τ). (e) Rubin's Hyp(K, T) (ES.4/rubin-hypotheses) gives residual
    irreducibility and a rank-one τ fixing the maximal p-Hilbert class extension K(1), cyclotomic
    p-power roots and p-power roots of units. It gives the τ of 2016 (H.2) only with the additional
    condition that this τ fixes the full Hilbert class field H (and the specified finite extension
    L); absolute residual irreducibility in 2016 (H.1) is also an additional condition; it does not
    give (H.3), whose failure is measured by Rubin's error terms n_W and n_W^*.

  Hypothesis. as in the two records

  Acceptance. For a rank-one twist the rank-one coinvariant condition alone holds with τ=1 in all
    three records. This checks that condition only; vanishing, absolute irreducibility and prime-set
    hypotheses still require their own verifications.

-/


/-

**`ES.0/example-cyclotomic-twist`** (application): Worked example: twists of ℤ_p(1) by characters of finite order.

  Statement. Let p be odd, ρ : G_ℚ → ℤ_p^× a character of finite order prime to p, L its field, R =
    ℤ/p^k (or ℤ_p) and T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1}). With H¹(ℚ, T) =
    (L^×/(L^×)^{p^k})^ρ, let F be the structure with H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ
    for all ℓ. Then: if ρ ≠ 1, ω, T satisfies (H.0)–(H.3), (H.4a), and F, F_can satisfy (H.6); χ(T,
    F) = 1 if ρ is even and ρ ≠ 1, and χ(T, F) = 0 if ρ is odd and ρ ≠ ω; F = F_can if ρ(p) ≠ 1; and
    there are exact sequences 0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0 with
    H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}.

  Hypothesis. p odd

  Hypothesis. ρ of order prime to p

  Acceptance. The computed core rank matches core-rank-formula: rank T^− + corank H⁰(ℚ_p, T^*) for
    F_can.

  Acceptance. For finite-order ρ unramified at p with ρ(p)=1, the propagated condition at p for
    F_can on T/p^k is all H¹(ℚ_p,T/p^k), since the dual invariants on the lattice are divisible
    (Lemma A.1). It differs from the unit structure F.

-/


/-

**`ES.0/example-elliptic`** (application): Worked example: the Tate module of an elliptic curve.

  Statement. Let E/ℚ be an elliptic curve and p ≥ 5 a prime with G_ℚ → Aut(E[p]) surjective, T =
    E[p^k] or T_pE, and F the classical Selmer structure (images of the local Kummer maps at the bad
    primes, p and ∞). Then F^* = F under the Weil pairing, H¹_F(ℚ, E[p^k]) is the p^k-Selmer group,
    T satisfies (H.0)–(H.4), F and F_can satisfy (H.6), χ(T, F) = 0 and χ(T, F_can) = 1, where on
    T_pE, F_can is F relaxed at p and F_can^* ≤ F ≤ F_can. On E[p^k], F_can is propagated from T_pE;
    its local condition at p is the image of H¹(ℚ_p,T_pE), which may be proper if E(ℚ_p)[p^∞] ≠ 0.

  Hypothesis. p ≥ 5

  Hypothesis. surjective mod-p representation

  Acceptance. Both structures on the same T have different core ranks, 0 and 1: the core rank
    depends on F.

  Acceptance. The analytic rank of E plays no role in either value.

-/


/-

**`ES.0/non-example-inadmissible`** (application): Worked non-example: the trivial and Teichmüller characters.

  Statement. For ρ = 1 the module T = ℤ_p(1) does not satisfy (H.3) of Mazur–Rubin 2004: T^*[m] =
    Hom(μ_p, μ_p) = 𝔽_p with trivial action, so (T^*[m])^{G_ℚ} ≠ 0 and H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) =
    Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0. For ρ = ω, T/mT = μ_p ⊗ ω^{-1} is trivial and (H.3) fails for
    the same reason. In both cases Lemma 3.5.2 (no invariants in subquotients), on which the
    definition of the core rank rests, is false, and no instance of the hypothesis record exists.
    Rubin's error-tolerant theorem still applies to T = ℤ_p(1) through Hyp(K, V), with the
    finiteness of S_{Σ_p}(K, W^*) equivalent to Leopoldt's conjecture for T = O.

  Hypothesis. p odd

  Acceptance. The record MR04Hypotheses has no term for T = ℤ_p(1): the field h1Vanishing is
    refutable.

  Acceptance. The failure is of (H.3), not of (H.1) or (H.2), which both hold for rank one.

-/


/-! ### Layer ES.1 -/


/-

**`ES.1/ray-class-tower`** (construction): The fields K(q), K(r) and their Galois groups.

  Statement. For a prime q of K not dividing p, K(q) is the maximal p-extension of K inside the ray
    class field of K modulo q, and K(1) is the maximal p-extension of K inside the Hilbert class
    field. K(q)/K(1) is unramified outside q, totally ramified above q and cyclic, with Γ_q =
    Gal(K(q)/K(1)) the maximal p-quotient of (O_K/q)^×/(O_K^× mod q). For a squarefree product r =
    q₁⋯q_k, K(r) = K(q₁)⋯K(q_k), Γ_r = Gal(K(r)/K(1)) ≅ ∏_{q | r} Γ_q with Γ_q the inertia group of
    q in Γ_r; for s | r, Γ_s is both a subgroup and a quotient of Γ_r. For K ⊆ F ⊆ K_∞ finite over
    K, F(r) = F·K(r) and Gal(F(r)/K(1)) ≅ Gal(F(1)/K(1)) × Γ_r when K_∞/K is unramified outside p.

  Hypothesis. q ∤ p

  Hypothesis. r squarefree and prime to p

  * `TauCeti.KolyvaginSystems.rayPExtension` (constructor): K(q) as an intermediate field of K̄/K,
    for q ∤ p; K(1) for the trivial modulus.

  * `TauCeti.KolyvaginSystems.gammaPrime` (data): Γ_q = Gal(K(q)/K(1)), a finite cyclic p-group.

  * `TauCeti.KolyvaginSystems.gammaPrime_equiv` (equivalence): Γ_q is the maximal p-quotient of
    (O_K/q)^×/(O_K^× mod q).

  * `TauCeti.KolyvaginSystems.gammaConductor_equiv_pi` (equivalence): Γ_r ≅ ∏_{q | r} Γ_q,
    compatibly with the inclusions and projections for s | r.

  * `TauCeti.KolyvaginSystems.card_gammaPrime_dvd` (relation): #Γ_q divides N(q) − 1.

  * `TauCeti.KolyvaginSystems.rayPExtension_ramification` (characterisation): K(q)/K(1) is
    unramified outside q and totally ramified at the primes above q.

  * test `gammaPrime_rat` (computation): For K = ℚ and p = 3, Γ_7 is cyclic of order 3 and Γ_5 is
    trivial; for p = 2, Γ_7 has order 1 because 6 = 2·3 and (ℤ/7)^×/{±1} has order 3.

  * test `gammaPrime_trivial_of_not_dvd` (degenerate): If p ∤ #((O_K/q)^×/im O_K^×) then K(q) = K(1)
    and Γ_q = 1.

  * test `gammaConductor_two_primes` (compatibility): For K = ℚ, p = 3: Γ_{7·13} ≅ ℤ/3 × ℤ/3, and
    the maximal 3-extension of ℚ of conductor 91 has this Galois group.

  * test `rayPExtension_ne_rayClassField` (non-example): For K = ℚ, p = 3, q = 13: the ray class
    field modulo 13 is ℚ(μ_13)^+, of degree 6, and ℚ(13) is its cubic subfield, a proper subfield.

  Acceptance. [K(q) : K(1)] divides N(q) − 1.

  Acceptance. K(r) is contained in, and in general not equal to, the maximal p-extension of K in the
    ray class field modulo r.

-/


/-

**`ES.1/conductor-ideal`** (definition): The ideals I_q, I_n and the groups G_q, G_n.

  Statement. Let (T, F, P) be a Selmer triple and q a prime with q ∤ p∞ and T unramified at q. G_q =
    Gal(K(q)_q/K_q), the Galois group of the completion of K(q) at q (for K = ℚ and in Mazur–Rubin
    2004: G_ℓ = 𝔽_ℓ^× = Gal(ℚ(μ_ℓ)/ℚ)). Over ℚ, I_ℓ is the ideal of R generated by ℓ − 1 and P_ℓ(1),
    where P_ℓ(x) = det(1 − Fr_ℓ x | T). Over K (R principal): I_q = R if q is not principal, and
    otherwise I_q is the largest power of m with [K(q)_q : K_q]R ⊆ I_q and T/((Fr_q − 1)T + I_qT)
    free of rank one over R/I_q. For n ∈ N(P): I_n = Σ_{q | n} I_q (I_1 = 0) and G_n = ⊗_{q | n} G_q
    (G_1 = ℤ). Then G_n ⊗ R/I_n is free of rank one over R/I_n, and I_q annihilates |𝔽_q^×|-torsion
    requirements for the finite–singular map on T/I_nT.

  Hypothesis. T free over R, unramified at q, q ∤ p∞

  * `TauCeti.KolyvaginSystems.conductorIdeal` (data): I_q ⊆ R for a prime q, and I_n = ⨆_{q | n} I_q
    for squarefree n.

  * `TauCeti.KolyvaginSystems.conductorIdeal_one` (simp): I_1 = ⊥.

  * `TauCeti.KolyvaginSystems.conductorIdeal_mono` (relation): m | n implies I_m ≤ I_n.

  * `TauCeti.KolyvaginSystems.tameGroup` (data): G_q = Gal(K(q)_q/K_q) and G_n = ⊗_{q | n} G_q, with
    G_1 = ℤ.

  * `TauCeti.KolyvaginSystems.tameGroup_tensor_free` (characterisation): G_n ⊗_ℤ R/I_n is a free
    R/I_n-module of rank one.

  * `TauCeti.KolyvaginSystems.conductorIdeal_rat` (compatibility): For K = ℚ and R principal, the
    2016 ideal I_ℓ is the largest power of m containing the 2004 ideal (ℓ − 1, P_ℓ(1)) for which the
    coinvariants are free of rank one.

  * test `conductorIdeal_zp_one` (computation): For K = ℚ, R = ℤ_p, T = ℤ_p(1): I_ℓ = (ℓ − 1)ℤ_p, so
    ℓ ∈ P_k iff ℓ ≡ 1 (mod p^k).

  * test `tameGroup_one` (degenerate): G_1 ⊗ R/I_1 = ℤ ⊗ R = R.

  * test `conductorIdeal_elliptic` (computation): For T = T_pE over ℚ: P_ℓ(1) = 1 − a_ℓ + ℓ and I_ℓ
    = (ℓ − 1, a_ℓ − 2).

  * test `conductorIdeal_not_only_norm` (non-example): Two primes ℓ, ℓ′ with ℓ ≡ ℓ′ ≡ 1 (mod p^k)
    can have I_ℓ ≠ I_ℓ′ for T = T_pE, since a_ℓ ≢ a_ℓ′ in general: I_ℓ is not a function of ℓ − 1
    alone.

  Acceptance. For T = ℤ_p(1) over ℚ: P_ℓ(x) = 1 − ℓx and I_ℓ = (ℓ − 1).

  Acceptance. I_n depends on Frobenius and on |G_q|, not only on n.

-/


/-

**`ES.1/kolyvagin-primes`** (definition): Kolyvagin primes: P_k, P(L, τ) and R_{F,M}.

  Statement. (a) Over ℚ: P_k is the set of primes ℓ ∉ Σ(F) with T/(m^kT + (Fr_ℓ − 1)T) free of rank
    one over R/m^k and I_ℓ ⊆ m^k; P_1 ⊇ P_2 ⊇ ⋯ and N_k = N(P_k). (b) Over K: P_k = {q ∈ P : I_q ⊆
    m^k}; for a finite Galois L/K and τ ∈ G_K, P(L, τ) is the set of primes q ∉ Σ(F) unramified in L
    with Fr_q conjugate to τ in Gal(L/K). (c) Rubin: for K ⊆ F ⊆ K_∞ finite and 0 ≠ M ∈ O, R_{F,M}
    is the set of r ∈ R(N) such that every prime q | r satisfies M | [K(q) : K(1)], M | P(Fr_q^{-1}
    | T^*; 1), and q splits completely in F(1)/K.

  Hypothesis. a Selmer triple; for (c) an ideal N divisible by p and the ramified primes

  * `TauCeti.KolyvaginSystems.kolyvaginPrimes` (data): P_k ⊆ P for k ≥ 1.

  * `TauCeti.KolyvaginSystems.kolyvaginPrimes_antitone` (relation): P_{k+1} ⊆ P_k.

  * `TauCeti.KolyvaginSystems.frobeniusPrimes` (data): P(L, τ), as Tau Ceti's frobeniusPrimeSet of
    the class of τ minus Σ(F).

  * `TauCeti.KolyvaginSystems.mem_kolyvaginPrimes_of_frobenius` (characterisation): If Fr_ℓ is
    conjugate to τ in Gal(ℚ(T/m^kT, μ_{p^d})/ℚ) and τ satisfies (H.2), then ℓ ∈ P_k.

  * `TauCeti.KolyvaginSystems.rubinPrimes` (data): R_{F,M} ⊆ R(N).

  * `TauCeti.KolyvaginSystems.mem_rubinPrimes_of_frobenius` (characterisation): Rubin's Lemma
    IV.1.3: Fr_q conjugate to τ on F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M) with T^{τ=1} ≠ 0 implies q ∈
    R_{F,M}.

  * `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite` (other): For the unrestricted 2004 P_k,
    (H.2) implies positive density and infinitude after removing a finite set. For the definition
    restricted to P, also require P to contain that Frobenius subset, as ensured by the stated
    (H.5)/(H.7) bounds.

  * test `kolyvaginPrimes_zp_one` (computation): For T = ℤ_p(1) over ℚ with Σ(F) = {p, ∞}: P_k = {ℓ
    ≠ p : ℓ ≡ 1 (mod p^k)}.

  * test `kolyvaginPrimes_inter` (degenerate): For R = ℤ_p and T = ℤ_p(1), ∩_k P_k = ∅: no prime is
    ≡ 1 modulo every power of p.

  * test `rubinPrimes_rat` (compatibility): For K = ℚ, F = ℚ, T = ℤ_p(1) and M = p^k, a prime ℓ ∤ N
    lies in R_{ℚ,M} iff ℓ ≡ 1 (mod p^k), since P(Fr_ℓ^{-1} | T^*; 1) = 1 − Fr_ℓ^{-1} acting on T^* =
    ℤ_p is 0 and [ℚ(ℓ) : ℚ] is the p-part of ℓ − 1.

  * test `not_mem_kolyvaginPrimes` (non-example): For T = T_pE and ℓ ≡ 1 (mod p) with a_ℓ ≢ 2 (mod
    p), ℓ ∉ P_1: I_ℓ = R.

  Acceptance. For ℓ ∈ P_k with R principal artinian of length k: H¹_f(ℚ_ℓ, T), H¹_s(ℚ_ℓ, T) and
    their duals are free of rank one and φ^fs_ℓ is an isomorphism (Lemma 3.5.6(ii)).

  Acceptance. All chosen primes avoid Σ(F) and any prescribed finite set.

-/


/-

**`ES.1/finite-singular-decomposition`** (lemma): Finite and singular parts at an unramified prime.

  Statement. Let K_v be nonarchimedean of residue characteristic ≠ p with residue field 𝔽, T a
    finitely generated R-module with unramified G_{K_v}-action and |𝔽^×|·T = 0. There are canonical
    functorial isomorphisms H¹_f(K_v, T) ≅ T/(Fr − 1)T (evaluate cocycles at Frobenius), H¹_s(K_v,
    T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1}), and H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}.

  Hypothesis. T unramified, of finite type

  Hypothesis. |𝔽^×|·T = 0

  Acceptance. For T = ℤ/p^k with trivial action and p^k | #𝔽^×: H¹_f ≅ ℤ/p^k and H¹_s ≅ Hom(𝔽^×,
    ℤ/p^k).

  Acceptance. The isomorphisms commute with maps T → T′ of such modules.

-/


/-

**`ES.1/transverse-condition`** (definition): The transverse local condition.

  Statement. In the situation of finite-singular-decomposition, fix a maximal totally tamely
    ramified abelian extension L/K_v (so Gal(L/K_v) ≅ 𝔽^×; for K_v = ℚ_ℓ take L = ℚ_ℓ(μ_ℓ); globally
    L is the completion of K(q) at q, of degree |G_q|, with T killed by |G_q|). The L-transverse
    condition is H¹_tr(K_v, T) = ker(H¹(K_v, T) → H¹(L, T)) = H¹(L/K_v, T^{G_L}). It projects
    isomorphically onto H¹_s(K_v, T), so H¹(K_v, T) = H¹_f(K_v, T) ⊕ H¹_tr(K_v, T), functorially in
    T. It is defined by restriction to the specified extension L, not by a choice of complement.

  Hypothesis. T unramified with |𝔽^×|·T = 0 (or |Gal(L/K_v)|·T = 0 for the p-part)

  Hypothesis. L/K_v totally tamely ramified abelian of maximal degree

  * `TauCeti.KolyvaginSystems.transverse` (constructor): H¹_tr(K_v, T) = ker(res : H¹(K_v, T) →
    H¹(L, T)).

  * `TauCeti.KolyvaginSystems.transverse_isCompl_finite` (characterisation): H¹_f(K_v, T) and
    H¹_tr(K_v, T) are complementary submodules of H¹(K_v, T).

  * `TauCeti.KolyvaginSystems.transverse_equiv_singular` (equivalence): The projection H¹_tr(K_v, T)
    → H¹_s(K_v, T) is an isomorphism.

  * `TauCeti.KolyvaginSystems.transverse_map` (functoriality): A map T → T′ of unramified modules
    killed by |𝔽^×| carries H¹_tr to H¹_tr.

  * `TauCeti.KolyvaginSystems.finitePart` (projection): c ↦ c_f and c ↦ c_tr, the two projections of
    the decomposition.

  * `TauCeti.KolyvaginSystems.transverse_eq_bot_iff` (simp): H¹_tr(K_v, T) = 0 iff T^{Fr=1} = 0.

  * test `transverse_zmod` (computation): For K_v = ℚ_ℓ, ℓ ≡ 1 (mod p^k), T = ℤ/p^k: H¹(ℚ_ℓ, T) =
    Hom(ℚ_ℓ^×, ℤ/p^k) ≅ (ℤ/p^k)², H¹_f is the homomorphisms trivial on ℤ_ℓ^×, and H¹_tr is the
    homomorphisms trivial on the norm group ⟨ℓ⟩ × (1 + ℓℤ_ℓ) of ℚ_ℓ(μ_ℓ), that is, those with f(ℓ) =
    0.

  * test `transverse_trivial` (degenerate): If T^{Fr=1} = 0 then H¹_s = 0 = H¹_tr and H¹ = H¹_f.

  * test `transverse_ne_arbitrary_complement` (non-example): In the example above, {f : f(ℓu) = 0},
    for a unit u ∈ ℤ_ℓ^× that is not a p-th power modulo ℓ, is another complement of H¹_f = {f :
    f(ℤ_ℓ^×) = 0}, and it is not H¹_tr = {f : f(ℓ) = 0}: the transverse condition is determined by L
    = ℚ_ℓ(μ_ℓ).

  * test `transverse_dual` (compatibility): H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal
    complements under the local Tate pairing.

  Acceptance. Different choices of L give different complements; all are transverse to H¹_f.

  Acceptance. The transverse condition does not in general propagate to subquotients as the
    transverse condition (Remark 1.1.8), but F(n) stays cartesian on quotients (Lemma 3.7.4).

-/


/-

**`ES.1/finite-singular-comparison`** (construction): The finite–singular comparison map.

  Statement. Let T be free of finite rank over R, unramified at v, with |𝔽^×|·T = 0 and det(1 − Fr |
    T) = 0. Put P(x) = det(1 − Fr x | T) and let Q(x) ∈ R[x] be the unique polynomial with (x −
    1)Q(x) = P(x). By Cayley–Hamilton Q(Fr^{-1})T ⊆ T^{Fr=1}, and φ^fs : H¹_f(K_v, T) ≅ T/(Fr − 1)T
    → T^{Fr=1} ≅ H¹_s(K_v, T) ⊗ 𝔽^× is induced by Q(Fr^{-1}). If R is artinian, |𝔽^×|R = 0 and T/(Fr
    − 1)T is free of rank one, then det(1 − Fr | T) = 0 automatically and Q(Fr^{-1}) and φ^fs are
    isomorphisms, so H¹_f and H¹_s are free of rank one. With the tensor factor 𝔽^× (globally G_q)
    retained the map involves no choice. A generator σ of the tame quotient gives Rubin's map
    φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q : H¹_f → H¹_s (α_q evaluation at σ, β_q evaluation
    at Frobenius), and φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ; for another generator σ^a one has φ^fs_{q,σ^a} =
    a^{-1}·φ^fs_{q,σ}, so the tensor-valued map is independent of the generator.

  Hypothesis. T free of finite rank, unramified

  Hypothesis. |𝔽^×|·T = 0

  Hypothesis. det(1 − Fr | T) = 0

  * `TauCeti.KolyvaginSystems.fsQuotientPoly` (data) [prototype above]: Q(x) with (x − 1)·Q(x) =
    det(1 − Fr·x | T), defined when det(1 − Fr | T) = 0.

  * `TauCeti.KolyvaginSystems.fsQuotientPoly_spec` (characterisation) [prototype above]: (X − 1) * Q
    = P and Q is unique.

  * `TauCeti.KolyvaginSystems.finiteSingular` (constructor): φ^fs : H¹_f(K_v, T) → H¹_s(K_v, T) ⊗
    𝔽^×, induced by Q(Fr^{-1}) : T/(Fr − 1)T → T^{Fr=1}.

  * `TauCeti.KolyvaginSystems.finiteSingular_bijective` (characterisation): If R is artinian, |𝔽^×|R
    = 0 and T/(Fr − 1)T is free of rank one, φ^fs is bijective and H¹_f, H¹_s are free of rank one.

  * `TauCeti.KolyvaginSystems.finiteSingular_map` (functoriality): The comparison is natural under
    equivariant maps compatible with the chosen quotient polynomials: f ∘ Q_T(Fr_T^{-1}) =
    Q_T′(Fr_T′^{-1}) ∘ f. In particular, for reductions of one fixed finite free lattice under R/I →
    R/J, characteristic and quotient polynomials reduce together, so φ^fs commutes with the
    coefficient-reduction maps. Arbitrary equivariant maps between representations with different
    characteristic polynomials need not commute.

  * `TauCeti.KolyvaginSystems.finiteSingular_generator` (compatibility): For a generator σ of the
    tame quotient, φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ with φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q
    Rubin's map; φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map does not depend on σ.

  * test `finiteSingular_cyclotomic` (computation) [prototype above]: R = ℤ/p^k, T = μ_{p^k}, ℓ ≡ 1
    (mod p^k): Fr = 1 on T, P(x) = 1 − x, Q(x) = −1, and φ^fs = −1 under H¹_f ≅ T, H¹_s ⊗ 𝔽_ℓ^× ≅ T.

  * test `finiteSingular_rank_two` (computation) [prototype above]: R = 𝔽_p, T with Fr = diag(1, a),
    a ≠ 1: P(x) = (1 − x)(1 − ax), Q(x) = −(1 − ax), Q(Fr^{-1}) = −diag(1 − a, 0), which maps T/(Fr
    − 1)T = 𝔽_p e₁ isomorphically onto T^{Fr=1} = 𝔽_p e₁.

  * test `finiteSingular_not_iso` (non-example): R = 𝔽_p, T = 𝔽_p² with Fr = 1: T/(Fr − 1)T has rank
    two, P(x) = (1 − x)², Q(x) = −(1 − x), and Q(Fr^{-1}) = 0: φ^fs is zero, not an isomorphism. The
    rank-one hypothesis is needed.

  * test `finiteSingular_quotient` (compatibility): For R=ℤ/p² and T=R with Fr=1, compare the
    finite–singular maps for T over R and T/pT over R/p: both quotient polynomials are Q=−1, and the
    maps on finite and singular terms commute with reduction.

  * test `finiteSingular_not_natural_inclusion` (non-example) [prototype above]: Over 𝔽₅ include the
    rank-one representation with Fr=1 into the first summand of Fr=diag(1,2). On the fixed line the
    source Q(1)=−1=4, whereas the target Q(1)=−(1−2)=1. Thus the induced inclusion does not commute
    with φ^fs; equivariance alone is insufficient.

  Acceptance. φ^fs commutes with the quotient maps T/I_nT → T/JT: both identifications and
    Q(Fr^{-1}) are functorial.

  Acceptance. For T = ℤ/p^k(1) and ℓ ≡ 1 (mod p^k): P(x) = 1 − ℓx ≡ 1 − x, Q = −1, and φ^fs is −1
    times the tautological identification of T/(Fr − 1)T = T with T^{Fr=1} = T.

-/


/-

**`ES.1/modified-selmer-structures`** (definition): The Selmer structures F_a^b(c).

  Statement. For a Selmer structure F and pairwise coprime a, b, c with c ∈ N(P) (and I_cT = 0 when
    needed for the transverse condition; in general one works on T/I_cT), F_a^b(c) has Σ = Σ(F) ∪ {q
    : q | abc} and local conditions: H¹_F(K_q, T) for q ∈ Σ(F), q ∤ ab; 0 for q | a (strict);
    H¹(K_q, T) for q | b (relaxed); H¹_tr(K_q, T) for q | c (transverse). One writes F(n) =
    F^1_1(n), F^n, F_n. Then F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n, and the dual is (F_a^b(c))^* =
    (F^*)_b^a(c).

  Hypothesis. a, b, c pairwise coprime; c ∈ N(P); T killed by I_c for the transverse places

  * `TauCeti.KolyvaginSystems.SelmerTriple.modify` (constructor): F_a^b(c): strict at a, relaxed at
    b, transverse at c.

  * `TauCeti.KolyvaginSystems.SelmerTriple.modify_le` (relation): If a′ | a, b | b′ and c = c′ then
    F_a^b(c) ≤ F_{a′}^{b′}(c′); in particular F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n.

  * `TauCeti.KolyvaginSystems.SelmerTriple.dual_modify` (compatibility): (F_a^b(c))^* =
    (F^*)_b^a(c).

  * `TauCeti.KolyvaginSystems.SelmerTriple.selmer_strict_eq_inf` (characterisation): H¹_{F_n}(K, T)
    = H¹_F(K, T) ⊓ H¹_{F(n)}(K, T).

  * `TauCeti.KolyvaginSystems.SelmerTriple.modify_isCartesian` (other): Under (H.2), R principal
    artinian of length k and n ∈ N_k, F cartesian implies F(n) cartesian.

  * test `modify_one` (degenerate): F_1^1(1) = F.

  * test `dual_modify_strict_relaxed` (compatibility): (F^n)^* = (F^*)_n and (F_n)^* = (F^*)^n.

  * test `modify_sandwich` (characterisation): F_n ≤ F(n) ≤ F^n, and the quotient H¹_{F^n}/H¹_{F_n}
    injects into ⊕_{q | n} H¹(K_q, T).

  * test `modify_transverse_ne_finite` (non-example): For q ∈ P_1 with H¹_s(K_q, T) ≠ 0, F(q) ≠ F
    and neither F(q) ≤ F nor F ≤ F(q).

  Acceptance. H¹_{F_n}(K, T) = H¹_F(K, T) ∩ H¹_{F(n)}(K, T).

  Acceptance. The dual of F(n) is F^*(n): the transverse condition is not replaced by its naive
    complement.

-/


/-

**`ES.1/transverse-duality`** (theorem): The transverse condition is self-dual.

  Statement. Let K_v be nonarchimedean of residue characteristic ≠ p, T unramified with |𝔽^×|·T = 0,
    and L/K_v totally ramified abelian of degree |𝔽^×|. Then H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are
    exact orthogonal complements under the local Tate pairing H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p,
    as are H¹_f(K_v, T) and H¹_f(K_v, T^*).

  Hypothesis. v ∤ p

  Hypothesis. T unramified

  Hypothesis. |𝔽^×|·T = 0

  Acceptance. Local orthogonality for the strict, relaxed and transverse modifications: (F_a^b(c))^*
    = (F^*)_b^a(c).

  Acceptance. For T = ℤ/p^k the pairing of a transverse character with a transverse Kummer class is
    0.

-/


/-

**`ES.1/chebotarev-nonvanishing`** (theorem): Simultaneous nonvanishing of localisations.

  Statement. Let R be principal artinian and (T, F, P) satisfy (H.0)–(H.5) of Mazur–Rubin 2004. If
    c₁, c₂ ∈ H¹(ℚ, T) and c₃, c₄ ∈ H¹(ℚ, T^*) are all nonzero, then for every k ≥ 1 there is a set S
    ⊆ P_k of positive density such that for every ℓ ∈ S the four localisations (c_i)_ℓ are nonzero.
    Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under
    Hypothesis 3.2): for nonzero c₁, …, c_s ∈ H¹(K, A) and c₁^*, …, c_t^* ∈ H¹(K, A^*(1)) with s + t
    < p, there is a set of primes q ∈ P of positive density with all localisations nonzero.

  Hypothesis. (H.0)–(H.5); this is the only place (H.4) is used

  Hypothesis. for the second form: Hypothesis 3.2 of Burns–Sakamoto–Sano II

  Acceptance. A single prime with Frobenius τ on ℚ(T, μ_{p^k}) does not suffice: the condition is on
    the larger field cut out by the classes.

  Acceptance. The primes may be chosen outside any finite set, in particular prime to Σ(F) and to a
    given n ∈ N.

-/


/-

**`ES.1/chebotarev-prescribed-kernels`** (theorem): Primes with prescribed localisation kernels.

  Statement. In the setting of chebotarev-nonvanishing, suppose the image of R → End(T) is contained
    in the image of ℤ_p[[G_ℚ]] → End(T). Fix a finite R-submodule C ⊆ H¹(ℚ, T), a homomorphism φ : C
    → R and k ≥ 1. (i) There is a set S ⊆ P_k of positive density with ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) =
    ker φ for all ℓ ∈ S. (ii) If also (H.4a) holds, D ⊆ H¹(ℚ, T^*) is a finite submodule and ψ : D →
    R a homomorphism, then S can be chosen with in addition ker(loc_ℓ on D) = ker ψ.

  Hypothesis. (H.0)–(H.5)

  Hypothesis. image of R in End(T) inside the image of ℤ_p[[G_ℚ]]

  Hypothesis. (H.4a) for (ii)

  Acceptance. Used with C = H¹_F(ℚ, T) and ker φ_i cutting out a submodule L to find leading
    vertices through L (ES.4/leading-vertices).

  Acceptance. Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur when T = T₀ ⊗ k
    (Remark 4.1.17).

-/


/-

**`ES.1/rubin-prime-selection`** (theorem): Rubin's selection of primes with large localisation.

  Statement. Let p > 2, let T satisfy Hyp(K, T) with its element τ, fix a power M of p, and let L/K
    be Galois with G_L acting trivially on W_M and W_M^*. (a) For κ ∈ H¹(K, W_M) and η ∈ H¹(K,
    W_M^*) there is γ ∈ G_L with order(κ(γτ), W_M/(τ − 1)W_M) ≥ order((κ)_L, H¹(L, W_M)) and the
    same for η. (b) For an Euler system c with derivative classes κ_{r,M} = κ_{K,r,M} and a finite
    subset C ⊆ H¹(K, W_M^*) with k = |C|, there are primes q₁, …, q_k of K such that, with r_i =
    q₁⋯q_i: q_i ∈ R_{K,M}; Fr_{q_i} is in the class of τ in Gal(K(W_M)/K);
    order((κ_{r_{i−1},M})_{q_i}, H¹_f(K_{q_i}, W_M)) ≥ order((κ_{r_{i−1},M})_Ω, H¹(Ω, W_M)); and
    every η ∈ C vanishing at all q_i lies in H¹(Ω/K, W_M^*). Under Hyp(K, V) alone the same holds
    with both orders lowered by a + 1 for a constant a (Lemma V.3.1).

  Hypothesis. Hyp(K, T) for (a), (b); Hyp(K, V) for the weakened form

  Hypothesis. Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})

  Acceptance. With H¹(Ω/K, W) = H¹(Ω/K, W^*) = 0 the selection has no loss, as in
    chebotarev-nonvanishing.

  Acceptance. The primes avoid N and all earlier q_j.

-/


/-

**`ES.1/reducibility-depth`** (definition): Exponents, orders and reducibility depth.

  Statement. Let O_λ be a discrete valuation ring with uniformiser λ. For an O_λ-module M and x ∈ M:
    exp_λ(x, M) = min{d ≥ 0 : λ^d x = 0} ∈ ℤ_{≥0} ∪ {∞} and ord_λ(x, M) = sup{d ≥ 0 : x ∈ λ^d M}.
    For a profinite group G and a torsion O_λ[G]-module R of finite type, the reducibility depth of
    R is the smallest integer r_R ≥ 0 such that (1) every G-stable O_λ-submodule R′ ⊆ R not
    contained in λR contains λ^{r_R}R, and (2) for every m ≥ 1, End_{O_λ[G]}(R̄^{(m)})/O_λ·id is
    annihilated by λ^{r_R}, where R̄^{(m)} = R/λ^mR. If R/λR is absolutely irreducible then r_R = 0.
    If R is a lattice with R ⊗ ℚ absolutely irreducible, there is r_R depending only on R bounding
    the reducibility depth of every R̄^{(m)}.

  Hypothesis. O_λ a discrete valuation ring with finite residue field

  Hypothesis. R of finite type

  * `TauCeti.ErrorTolerant.expAt` (data) [prototype above]: exp_λ(x, M) ∈ ℕ∞.

  * `TauCeti.ErrorTolerant.ordAt` (data) [prototype above]: ord_λ(x, M) ∈ ℕ∞.

  * `TauCeti.ErrorTolerant.expAt_add_ordAt_le` (relation): In a free O_λ/λ^n-module, exp_λ(x) +
    ord_λ(x) = n for x ≠ 0.

  * `TauCeti.ErrorTolerant.reducibilityDepth` (data): r_R for a torsion O_λ[G]-module R of finite
    type.

  * `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero` (example): If R/λR is absolutely irreducible
    then r_R = 0.

  * `TauCeti.ErrorTolerant.reducibilityDepth_bounded` (other): For a lattice R with R_ℚ absolutely
    irreducible, sup_m r_{R̄^{(m)}} < ∞.

  * test `expAt_zmod` (computation) [prototype above]: In M = ℤ/p³, exp_p(p) = 2 and ord_p(p) = 1.

  * test `reducibilityDepth_irreducible` (degenerate): For R = E[p^m] with E[p] absolutely
    irreducible, r_R = 0.

  * test `reducibilityDepth_reducible` (non-example): For R = ℤ/p² ⊕ ℤ/p² with G acting through the
    upper unipotent matrices (1, p·b; 0, 1), b ∈ ℤ/p, the submodule generated by e₁ is G-stable and
    not contained in pR but does not contain R, so r_R ≥ 1: r_R ≠ 0 although R is free.

  * test `ordAt_top_iff` (characterisation) [prototype above]: ord_λ(x, M) = ∞ iff x ∈ ∩_d λ^d M;
    for M of finite length this means x = 0.

  Acceptance. r_R measures the failure of residual irreducibility that Mazur–Rubin's (H.1) excludes;
    with r_R = 0 the error-tolerant statements reduce to the clean ones.

  Acceptance. exp and ord are the 'order' functions of Rubin's Chapter V.

-/


/-

**`ES.1/selmer-field-saturation`** (theorem): The field cut out by a Selmer module and saturation of θ_S.

  Statement. Fix m ≥ 1 and R free of finite rank over O_λ/λ^m with ρ : Γ_F → GL(R), F_ρ the field
    fixed by ker ρ and G = Gal(F_ρ/F). Restriction Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R) gives a
    pairing [ , ] : H¹(F, R) × Γ^{ab}_{F_ρ} → R. For a finitely generated submodule S ⊆ H¹(F, R),
    F_S/F_ρ is the finite abelian extension with Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}, and
    θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R) is injective and G-equivariant. (a) If Res_ρ is injective
    and S is free of rank r_S over O_λ/λ^m, the O_λ-span of the image of θ_S contains λ^{𝔣(r_S) r_R}
    Hom_{O_λ}(S, R), where 𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1) for r ≥ 2. (b) Res_ρ is
    injective if the image of Γ_F in GL(R̄) contains a nontrivial scalar, or if dim R̄ ≤ min{(ℓ +
    1)/2, ℓ − 3}, R̄ is semisimple and Hom_{Γ_F}(End(R̄), R̄) = 0.

  Hypothesis. R free over O_λ/λ^m

  Hypothesis. for (a): Res_ρ injective

  Acceptance. With r_R = 0 and r_S = 1 the image of θ_S spans Hom(S, R): the clean Chebotarev input
    of Mazur–Rubin's Proposition 3.6.1.

  Acceptance. (H.3) of Mazur–Rubin 2004 is the statement that Res is injective for the field ℚ(T,
    μ_{p^∞}).

-/


/-

**`ES.1/abundant-tuples`** (definition): γ-associated places and (S, γ)-abundant tuples.

  Statement. Setting of Liu–Tian–Xiao–Zhang–Zhu §2.6: F/F⁺ of degree ≤ 2, R a polarised lattice with
    reductions ρ̄^{(m)} and their extensions ρ̄₊^{(m)} to Γ_{F⁺}, fields F ⊆ F^{(m)} ⊆ F₊^{(m)}, an
    element γ in the image of ρ̄₊^{(m)} lying in the nontrivial coset, h_γ the first component of
    γ^{[F:F⁺]}, and S a finitely generated submodule of the Selmer module in H¹(F, R̄^{(m)}). A
    place w₊ of F₊^{(m)} is γ-associated if it is not above ∞ or ℓ, is unramified over F⁺, its place
    of F^{(m)} is unramified in F_S, and its Frobenius in Gal(F₊^{(m)}/F⁺) is γ. G_{S,γ} ⊆
    Gal(F_S/F^{(m)}) is the set of Frobenius elements Ψ_w of γ-associated places. Corrected Lemma
    2.6.4: if the order of γ is prime to ℓ then G_{S,γ} ⊆ θ_S^{-1} Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}),
    with equality when [F : F⁺] = 1; in general G_{S,γ} = q(N^α) for N the Galois group of the
    normal closure over F₊^{(m)}, α conjugation by a prime-to-ℓ lift of γ and q restriction to F_S.
    If S is free of rank r_S over O_λ/λ^{m−m₀}, an r_S-tuple (Ψ₁, …, Ψ_{r_S}) ∈ G_{S,γ}^{r_S} is (S,
    γ)-abundant if the image of S → ((R̄^{(m)})^{h_γ})^{⊕ r_S}, s ↦ (θ_S(Ψ_i)(s))_i, contains λ^{m₀
    + 𝔣(r_S) r_R}((R̄^{(m)})^{h_γ})^{⊕ r_S}.

  Hypothesis. the setting of §2.6 of the source

  Hypothesis. order of γ prime to ℓ

  * `TauCeti.ErrorTolerant.IsAssociatedPlace` (structure): The four conditions for a place of
    F₊^{(m)} to be γ-associated.

  * `TauCeti.ErrorTolerant.frobeniusSet` (data): G_{S,γ} ⊆ Gal(F_S/F^{(m)}).

  * `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed` (characterisation): θ_S(G_{S,γ}) ⊆
    Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), for γ of order prime to ℓ.

  * `TauCeti.ErrorTolerant.frobeniusSet_eq_image` (characterisation): G_{S,γ} = q(N^α); equality
    with the full preimage holds iff q : N^α → Gal(F_S/F^{(m)})^{h_γ} is surjective, in particular
    when [F : F⁺] = 1.

  * `TauCeti.ErrorTolerant.IsAbundant` (structure): The predicate on r_S-tuples of G_{S,γ}.

  * `TauCeti.ErrorTolerant.exists_isAbundant` (other): If Res is injective, R_ℚ is absolutely
    irreducible, (R̄^{(m)})^{h_γ} is free of rank one and q : N^α → K^{h} is surjective, an abundant
    r_S-tuple exists (corrected Proposition 2.6.6).

  * test `frobeniusSet_split_case` (compatibility): If F = F⁺ then G_{S,γ} = θ_S^{-1} Hom(S,
    (R̄^{(m)})^{h_γ}) with h_γ = γ: the printed lemma.

  * test `isAbundant_rank_one_irreducible` (degenerate): For r_S = 1, r_R = 0, m₀ = 0: Ψ is abundant
    iff θ_S(Ψ) : S → (R̄^{(m)})^{h_γ} is surjective.

  * test `frobeniusSet_proper` (non-example): For [F : F⁺] = 2 there are data with q(N^α) a proper
    subgroup of the h_γ-fixed part, so the printed equality of Lemma 2.6.4 fails; the corrected
    statement is the inclusion.

  * test `isAbundant_scaling` (characterisation): If (Ψ_i) is abundant for S free over O_λ/λ^{m−m₀},
    then it is abundant for λS over O_λ/λ^{m−m₀−1} with m₀ replaced by m₀ + 1.

  Acceptance. For [F : F⁺] = 1 the printed Lemma 2.6.4 holds as stated.

  Acceptance. Abundance is a property of actual Frobenius elements, not of arbitrary elements of
    Gal(F_S/F^{(m)}).

-/


/-! ### Layer ES.2 -/


/-

**`ES.2/euler-polynomial`** (definition): Euler polynomials and their conventions.

  Statement. Let T be a free module of finite rank over O (the ring of integers of a finite
    extension Φ of ℚ_p, or a coefficient order), with G_K-action unramified at a prime q ∤ p, Fr_q
    an arithmetic Frobenius, and T^* = Hom_O(T, O(1)). Rubin's Euler polynomial is P(Fr_q^{-1} |
    T^*; x) = det(1 − Fr_q^{-1}x | T^*) ∈ O[x]; it equals det(1 − N(q)^{-1}Fr_q x | T). Mazur–Rubin
    use P_q(x) = det(1 − Fr_q x | T). Burns–Sakamoto–Sano use P_q(x) = det(1 − Fr_q^{-1}x | T^*(1))
    with T^* = Hom_R(T, R), which is Rubin's polynomial. The operators entering norm relations are
    obtained by substituting x = Fr_q^{-1} (acting on cohomology through Gal(F/K)): P(Fr_q^{-1} |
    T^*; Fr_q^{-1}) for Rubin and P_q(Fr_q^{-1}) for Mazur–Rubin. The coefficients satisfy
    a_i^{Rubin} = N(q)^{-i} a_i^{MR}, so the two polynomials are congruent modulo N(q) − 1, hence
    modulo M whenever M | [K(q) : K(1)].

  Hypothesis. T unramified at q, q ∤ p

  Hypothesis. Fr_q arithmetic Frobenius; the dual is the Tate dual Hom(T, O(1))

  * `TauCeti.EulerSystems.eulerPoly` (data) [prototype above]: P(Fr_q^{-1} | T^*; x) = det(1 −
    Fr_q^{-1}·x | T^*) ∈ O[X], for T unramified at q.

  * `TauCeti.EulerSystems.eulerPoly_eq_det_twist` (characterisation): P(Fr_q^{-1} | T^*; x) = det(1
    − N(q)^{-1}·Fr_q·x | T).

  * `TauCeti.EulerSystems.eulerPolyMR` (data) [prototype above]: P_q(x) = det(1 − Fr_q·x | T), the
    Mazur–Rubin convention.

  * `TauCeti.EulerSystems.eulerPoly_coeff` (relation) [prototype above]: coeff_i(eulerPoly) · N(q)^i
    = coeff_i(eulerPolyMR).

  * `TauCeti.EulerSystems.eulerPoly_congr` (relation) [prototype above]: eulerPoly ≡ eulerPolyMR
    modulo (N(q) − 1)·O[X].

  * `TauCeti.EulerSystems.eulerPoly_aeval_annihilates` (characterisation): P(Fr_q^{-1} | T^*;
    N(q)Fr_q^{-1}) = 0 on T, and P(Fr_q^{-1} | T^*; Fr_q^{-1}) = 0 on W_M when M | [K(q) : K(1)].

  * `TauCeti.EulerSystems.eulerPoly_twist` (compatibility): For a character χ of finite order
    unramified at q: P(Fr_q^{-1} | (T ⊗ χ)^*; x) = P(Fr_q^{-1} | T^*; χ(Fr_q)x).

  * test `eulerPoly_zp_one` (computation) [prototype above]: For T = ℤ_p(1): eulerPoly = 1 − X and
    eulerPolyMR = 1 − N(q)X.

  * test `eulerPoly_elliptic` (computation): For T = T_pE, q = ℓ of good reduction: eulerPolyMR = 1
    − a_ℓX + ℓX² and eulerPoly = 1 − a_ℓ ℓ^{-1}X + ℓ^{-1}X²; at X = 1 they are (1 − a_ℓ + ℓ) and
    ℓ^{-1}(ℓ − a_ℓ + 1).

  * test `eulerPoly_ne_eulerPolyMR` (non-example): For T = ℤ_p(1) and N(q) ≠ 1 the two polynomials
    are different elements of O[X], although congruent modulo N(q) − 1.

  * test `eulerPoly_rank_zero` (degenerate) [prototype above]: For T = 0 both polynomials are 1.

  Acceptance. For T = ℤ_p(1): Rubin's polynomial is 1 − x (T^* = ℤ_p) and Mazur–Rubin's is 1 −
    N(q)x; they agree modulo N(q) − 1.

  Acceptance. The polynomials differ as elements of O[x]; systems for the two conventions are
    related by an explicit map, not equal (euler-factor-change).

-/


/-

**`ES.2/euler-system-module`** (definition): The module of Euler systems.

  Statement. Let 𝒦/K be an abelian extension and N an ideal of K divisible by p and by all primes
    where T is ramified. Write K ⊂_f F for finite subextensions F of 𝒦/K, and for F ⊆ F′ let Σ(F′/F)
    be the set of primes of K not dividing N that ramify in F′ but not in F. An Euler system for (T,
    𝒦, N) is a family c = (c_F)_F with c_F ∈ H¹(F, T) such that for all K ⊂_f F ⊂_f F′ ⊆ 𝒦,
    Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1})) c_F. The set ES(T, 𝒦, N) of
    such families is the O[[Gal(𝒦/K)]]-submodule of ∏_F H¹(F, T) cut out by these equations (an
    equaliser). (𝒦, N) is admissible in Rubin's sense if (i) 𝒦 ⊇ K(q) for every q ∤ N and (ii) 𝒦
    contains a ℤ_p^d-extension K_∞ of K, d ≥ 1, in which no finite prime splits completely. The
    definition itself does not require (i)–(ii); the theorems do. The zero family is an Euler
    system.

  Hypothesis. 𝒦/K abelian

  Hypothesis. p | N and N divisible by the primes where T is ramified

  * `TauCeti.EulerSystems.EulerSystem` (structure) [prototype above]: The submodule ES(T, 𝒦, N) ⊆
    ∏_{K ⊂_f F ⊆ 𝒦} H¹(F, T) of families satisfying the corestriction relations.

  * `TauCeti.EulerSystems.EulerSystem.eval` (projection) [prototype above]: c ↦ c_F, an O-linear map
    ES(T, 𝒦, N) → H¹(F, T).

  * `TauCeti.EulerSystems.EulerSystem.cor_eval` (relation) [prototype above]: Cor_{F′/F}(c_{F′}) =
    (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1}))·c_F.

  * `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq` (simp): If Σ(F′/F) = ∅ then
    Cor_{F′/F}(c_{F′}) = c_F.

  * `TauCeti.EulerSystems.EulerSystem.ext` (extensionality) [prototype above]: Two Euler systems
    with the same classes c_F for all F are equal.

  * `TauCeti.EulerSystems.EulerSystem.lift` (universal-property) [prototype above]: A family of
    O-linear maps f_F : X → H¹(F, T) satisfying the relations is the same as an O-linear map X →
    ES(T, 𝒦, N); it is determined by the f_F.

  * `TauCeti.EulerSystems.EulerSystem.restrictTower` (functoriality): For 𝒦′ ⊆ 𝒦, restriction of the
    index family is an O-linear map ES(T, 𝒦, N) → ES(T, 𝒦′, N); for an ideal N′ prime to p and 𝒦₀
    the maximal subextension of 𝒦 unramified at the primes dividing N′, it lands in ES(T, 𝒦₀, NN′).

  * `TauCeti.EulerSystems.IsAdmissibleTower` (structure): Rubin's conditions (i) and (ii) on (𝒦, N,
    K_∞).

  * test `EulerSystem.zero_mem` (degenerate) [prototype above]: The family c_F = 0 is an Euler
    system.

  * test `EulerSystem.cyclotomic_units` (computation): For K = ℚ, T = ℤ_p(1) and the Kummer images
    of the p-extended cyclotomic units c̃_m, the relation for ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp, is
    N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}: the factor is P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}.

  * test `EulerSystem.not_restriction` (non-example): A family with res_{F′/F}(c_F) = c_{F′} for all
    F ⊆ F′ and c_K ≠ 0 non-torsion is not an Euler system for a tower containing K_∞: corestriction
    would give [F′ : F]c_F = c_F for F′ ⊆ F K_∞.

  * test `EulerSystem.universal_norm` (characterisation) [prototype above]: For an admissible tower
    and F ⊆ F′ ⊆ F K_∞, c_F = Cor_{F′/F}(c_{F′}); hence c_F ∈ ∩_{F′} Cor_{F′/F} H¹(F′, T).

  Acceptance. ES is the equaliser of two maps ∏_F H¹(F, T) ⇉ ∏_{F ⊆ F′} H¹(F, T), so a morphism into
    ES is a compatible family of morphisms.

  Acceptance. The norm relation uses corestriction: replacing it by restriction or by equality
    c_{F′} = c_F gives a different (wrong) object.

-/


/-

**`ES.2/classes-unramified-outside-p`** (theorem): Euler-system classes are unramified away from p.

  Statement. Let c be an Euler system for an admissible tower (so 𝒦 ⊇ K_∞ with no finite prime
    splitting completely). Then for every F and every place w ∤ p of F, (c_F)_w ∈ H¹_ur(F_w, T);
    that is, c_F ∈ S^{Σ_p}(F, T), and c_F ∈ H¹_{F_can}(F, T). Hence c_F lies in H¹(O_{F,S(F)}, T)
    for S(F) = S ∪ S_ram(F/K), the cohomology of the maximal extension unramified outside S(F).

  Hypothesis. admissible tower

  Hypothesis. T finitely generated over ℤ_p

  Acceptance. Without condition (ii) the statement fails: c_K is then unconstrained
    (rigidity-variants).

-/


/-

**`ES.2/conductor-presentation`** (theorem): The conductor-indexed presentations.

  Statement. (a) For an admissible (𝒦, N), an Euler system is equivalent to a family c̃_m ∈ H¹(K[m]
    ∩ 𝒦, T) indexed by all generalised ideals m (K[m] the ray class field), with
    Cor_{K[mq]∩𝒦/K[m]∩𝒦}(c̃_{mq}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c̃_m if q ∤ mN and = c̃_m if q |
    mN: put c_F = Cor_{K[m]∩𝒦/F}(c̃_m) for m the conductor of F/K, and conversely c̃_m = ∏_q
    P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{K[m]∩𝒦}, the product over primes dividing m, not dividing N,
    unramified in (K[m] ∩ 𝒦)/K. (b) For 𝒦_min = K_∞·∏_{q ∤ N} K(q), an Euler system is determined
    by, and equivalent to, a family {c_{F(r)}} over squarefree r prime to N and K ⊂_f F ⊆ K_∞ with
    Cor_{F(rq)/F(r)}(c_{F(rq)}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{F(r)} when K(q) ≠ K(1), and
    Cor_{F′(r)/F(r)}(c_{F′(r)}) = c_{F(r)}; then c_L = Cor_{F(r)/L}(c_{F(r)}) for r, F minimal with
    L ⊆ F(r).

  Hypothesis. admissible (𝒦, N)

  Acceptance. The archimedean part of a generalised ideal is allowed in (a).

  Acceptance. The equivalence is an isomorphism of modules ES(T, 𝒦_min, N) ≅ {families (c_{F(r)})}.

-/


/-

**`ES.2/twisting`** (construction): Twisting Euler systems by characters of finite order.

  Statement. Let c be an Euler system for (T, 𝒦, N) and χ : Gal(𝒦/K) → O^× a character of finite
    order with conductor 𝔣 and field L = 𝒦^{ker χ}; let O_χ be free of rank one with generator ξ_χ
    and T ⊗ χ = T ⊗ O_χ. Define c^χ_F ∈ H¹(F, T ⊗ χ) as the image of c_{FL} under H¹(FL, T) → H¹(FL,
    T) ⊗ O_χ ≅ H¹(FL, T ⊗ χ) → H¹(F, T ⊗ χ), the last map being corestriction. Then {c^χ_F} is an
    Euler system for (T ⊗ χ, 𝒦, 𝔣N). If L ⊆ L′ ⊆ 𝒦 have the same conductor, the image of c^χ_F under
    Res then ⊗ξ_χ^{-1} in H¹(FL′, T) is Σ_{δ ∈ Gal(FL′/F)} χ(δ)δ c_{FL′}. Coefficient extension
    along O → O′ finite flat acts on families termwise when H¹(F, T) ⊗ O′ = H¹(F, T ⊗ O′), and is
    used to adjoin the values of χ.

  Hypothesis. χ of finite order on Gal(𝒦/K)

  Hypothesis. values of χ in O^× (after enlarging O)

  * `TauCeti.EulerSystems.EulerSystem.twist` (constructor): c ↦ c^χ : ES(T, 𝒦, N) → ES(T ⊗ χ, 𝒦,
    𝔣N), O-linear after fixing ξ_χ.

  * `TauCeti.EulerSystems.EulerSystem.twist_eval` (simp): (c^χ)_F = Cor_{FL/F}(c_{FL} ⊗ ξ_χ).

  * `TauCeti.EulerSystems.EulerSystem.twist_one` (simp): c^1 = c.

  * `TauCeti.EulerSystems.EulerSystem.res_twist` (relation): Res_{FL′/F}(c^χ_F) ⊗ ξ_χ^{-1} = Σ_{δ ∈
    Gal(FL′/F)} χ(δ)·δ·c_{FL′}.

  * `TauCeti.EulerSystems.EulerSystem.baseChange` (functoriality): For O → O′ finite flat, ES(T, 𝒦,
    N) ⊗_O O′ → ES(T ⊗ O′, 𝒦, N) is defined termwise and is injective.

  * test `EulerSystem.twist_trivial` (degenerate): For χ = 1, L = K and c^χ_F = c_F.

  * test `EulerSystem.twist_cyclotomic` (computation): For K = ℚ, T = ℤ_p(1), χ of conductor f: the
    image of c^χ_ℚ in H¹(L, T) is Σ_{δ ∈ Gal(L/ℚ)} χ(δ)δc_L, the χ^{-1}-component of the Kummer
    class of the cyclotomic unit of L.

  * test `EulerSystem.twist_conductor` (non-example): Twisting changes the defining bad modulus to
    f_χN. It is not guaranteed to satisfy the relations for N: for χ with a new ramified prime q,
    the construction proves the relation with that q excluded. The zero system does satisfy both
    sets of relations, so conductor enlargement is not a nonexistence assertion for every c.

  * test `EulerSystem.twist_inverse_norm` (characterisation): With compatible character generators,
    (c^χ)^{χ^{-1}}_F=Cor_{FL_χ/F}(c_{FL_χ})=∏_{q∈Σ(FL_χ/F)}P_q(Fr_q^{-1})c_F. This can differ from
    c_F when f_χ has primes outside N; no extra degree factor occurs.

  Acceptance. Twisting by the trivial character is the identity.

  Acceptance. Twisting is O-linear after choosing compatible generators. For finite-order χ,ψ, the
    iterated twist is obtained by corestriction from FL_χL_ψ, while the direct χψ-twist uses
    FL_{χψ}. Comparing these by the Euler relation introduces the Euler factors for primes ramifying
    in the former and not the latter outside N. In particular (c^χ)^{χ^{-1}}_F =
    Cor_{FL_χ/F}(c_{FL_χ}), after cancelling generators; this equals the applicable Euler-factor
    product times c_F and need not equal c_F. Both families are compared in the common conductor f_χ
    f_ψ N.

-/


/-

**`ES.2/euler-factor-change`** (theorem): Changing the Euler factors.

  Statement. (a) Let f_q, g_q ∈ O[x] (q ∤ N) with f_q ≡ g_q modulo N(q) − 1, and c̃ a family with
    Cor_{F′/F}(c̃_{F′}) = (∏_{q ∈ Σ(F′/F)} f_q(Fr_q^{-1})) c̃_F. Then there is a family c with the
    same relations for g_q, with c_F = c̃_F for every finite abelian F/K unramified outside N, and
    with Σ_γ χ(γ)γc_F = Σ_γ χ(γ)γc̃_F whenever χ is a character of Gal(F/K) of conductor 𝔣 and every
    prime ramified in F/K divides N𝔣; the construction is an explicit O-linear map c̃ ↦ c. (b) Units
    u_q ∈ O^× and a shift x ↦ x^d of the variable can be absorbed similarly. (c) In particular a
    family satisfying the relations with P(Fr_q^{-1} | T; Fr_q) gives an Euler system in the sense
    of Definition II.1.1, and the modules of Euler systems for the conventions of Rubin and of
    Mazur–Rubin are isomorphic. The change of factors is a map of systems, not an equality.

  Hypothesis. f_q ≡ g_q (mod N(q) − 1)

  Acceptance. Rubin's Example IX.6.2: K = ℚ, f_q = 1 − x and g_q = 1 − q^{-1}x.

  Acceptance. The map is the identity on classes over fields unramified outside N.

-/


/-

**`ES.2/universal-euler-system`** (construction): The universal Euler system.

  Statement. Fix N and K_∞/K as in an admissible tower, R(N) the squarefree products of primes not
    dividing N. For r ∈ R(N) and K ⊂_f F ⊆ K_∞, X_{F(r)} = Y_{F(r)}/Z_{F(r)}, where Y_{F(r)} is the
    free O[Gal(F(r)/K)]-module on symbols x_{F(s)}, s | r, and Z_{F(r)} is generated by σx_{F(s)} −
    x_{F(s)} (σ ∈ Gal(F(r)/F(s))), N_q x_{F(qs)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} (qs | r,
    K(q) ≠ K(1)) and x_{F(qs)} − x_{F(s)} (qs | r, K(q) = K(1)). The universal Euler system is X =
    colim_{F,r} X_{F(r)}; X_{∞,r} = lim_F X_{F(r)}. Sending x_{F(r)} ↦ c_{F(r)} gives
    G_K-equivariant maps X_{F(r)} → H¹(F(r), T) for every Euler system c. Structure: X_{F(r)} is a
    finitely generated free O-module, free over O[Gal(F(r)/K(r))] of rank [K(r) : K], X_{F(r)} ⊗ Φ
    is free of rank one over Φ[Gal(F(r)/K)], X_{F′(r)} ⊗ O[Gal(F(r)/K)] ≅ X_{F(r)}, X_{F(s)} ≅
    X_{F′(r)}^{Gal(F′(r)/F(s))}; X_{∞,r} is free of rank [K(r) : K] over O[[Gal(K_∞(r)/K(r))]]; and
    Ext¹_{(O/M)[G]}(X_{F(r)}/M, (O/M)[G]^k) = 0 for G = Gal(F(r)/K), with the analogue for X_{∞,r}.

  Hypothesis. N, K_∞ as in an admissible tower

  * `TauCeti.EulerSystems.Universal.X` (constructor): X_{F(r)} as a quotient of a free
    O[Gal(F(r)/K)]-module by the three families of relations.

  * `TauCeti.EulerSystems.Universal.gen` (data): The class x_{F(s)} ∈ X_{F(r)} for s | r.

  * `TauCeti.EulerSystems.Universal.norm_gen` (relation): N_q·x_{F(qs)} = P(Fr_q^{-1} | T^*;
    Fr_q^{-1})·x_{F(s)} when K(q) ≠ K(1), and x_{F(qs)} = x_{F(s)} otherwise.

  * `TauCeti.EulerSystems.Universal.lift` (universal-property): For an Euler system c, the unique
    O[G_K]-linear map X_{F(r)} → H¹(F(r), T) with x_{F(s)} ↦ res(c_{F(s)}).

  * `TauCeti.EulerSystems.Universal.free` (instance): X_{F(r)} is free of finite rank over O and
    free of rank [K(r) : K] over O[Gal(F(r)/K(r))].

  * `TauCeti.EulerSystems.Universal.ext_eq_zero` (other): Ext¹_{(O/M)[G]}(X_{F(r)}/M X_{F(r)},
    (O/M)[G]^k) = 0 for G = Gal(F(r)/K).

  * test `Universal.X_one` (degenerate): If K(1) = K then X_K is free of rank one over O on x_K.

  * test `Universal.rank_one_prime` (computation): For K = ℚ, F = ℚ, r = ℓ with Γ_ℓ of order n > 1:
    X_{ℚ(ℓ)} is the quotient of O[Γ_ℓ]x_ℓ ⊕ O[Γ_ℓ]x_1 by (σ − 1)x_1 and N_ℓx_ℓ − P(1)x_1, which is
    free over O of rank n + 1 − 1 = n; indeed rank_O = [K(r) : K] = n.

  * test `Universal.not_free_group_ring` (non-example): X_{F(r)} is not free over O[Gal(F(r)/K)] in
    general: only X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)].

  Acceptance. For r = 1 and F = K with K(1) = K: X_K = O·x_K.

  Acceptance. Hom_{G_K}(X_{∞,R}, colim_r lim_F H¹(F(r), T)) recovers Euler systems for 𝒦_min (Remark
    IV.2.4).

-/


/-

**`ES.2/rigidity-variants`** (definition): Variants: rigidity conditions, finite depth and anticyclotomic systems.

  Statement. (a) Rigidity. Without condition (ii) of an admissible tower the class c_K can be
    unconstrained: if K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for every q ∤ N and 𝒦 is the
    maximal abelian extension unramified at every prime dividing N, the only relations involving c_K
    are Cor_{F/K}c_F = ∏_{q ∈ Σ(F/K)} P(Fr_q^{-1} | T^*; 1)c_K = 0, and the family c_F = 0 (F ≠ K),
    c_K arbitrary is an Euler system. Condition (ii) is therefore replaced by (ii)′: at least one of
    (a) 𝒦 contains a ℤ_p^d-extension of K in which no finite prime splits completely; (b) c_{K(r)} ∈
    S^{Σ_p}(K(r), T) for every r, and there is γ ∈ G_K with γ = 1 on K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞})
    and γ − 1 injective on T; (c) c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, Fr_q^n − 1 is injective
    on T for every prime q ∤ N and every power n of p, and the family {c_{K(r)}} satisfies the
    congruence of Corollary IV.8.1. Under (ii)′ and T^{G_{K(1)}} = 0, Theorems II.2.2, II.2.3 and
    II.2.10 hold as stated. (b) Finite depth. For 0 ≠ M ∈ O an Euler system for W_M (of depth M) is
    a family as in the definition with c_F ∈ H¹(F, W_M). (c) Anticyclotomic. For a character χ of
    Gal(K′/K) of order d and an abelian extension 𝒦′/K′ on which Gal(K′/K) acts through χ, a
    χ-anticyclotomic Euler system for (T, 𝒦′, N) is a family c_F ∈ H¹(F, T), K′ ⊂_f F ⊆ 𝒦′, with the
    corestriction relations for primes q of K and one of the three rigidity conditions adapted to χ.
    (d) An Euler system is trivial at a finite set Σ of primes not dividing p if c_F ∈ S_Σ^{Σ_p}(F,
    T) for all F.

  Hypothesis. as in each variant

  * `TauCeti.EulerSystems.IsRigid` (structure): Condition (ii)′: one of the alternatives (a), (b),
    (c).

  * `TauCeti.EulerSystems.FiniteDepthEulerSystem` (structure): Euler systems for W_M.

  * `TauCeti.EulerSystems.EulerSystem.toFiniteDepth` (functoriality): ES(T, 𝒦, N) → ES(W_M, 𝒦, N) by
    reduction modulo M, compatible in M.

  * `TauCeti.EulerSystems.AnticyclotomicEulerSystem` (structure): χ-anticyclotomic Euler systems for
    (T, 𝒦′, N).

  * `TauCeti.EulerSystems.AnticyclotomicEulerSystem.of_trivial` (compatibility): For d = 1 (χ
    trivial) a χ-anticyclotomic Euler system is an Euler system.

  * `TauCeti.EulerSystems.EulerSystem.IsTrivialAt` (structure): c_F ∈ S_Σ^{Σ_p}(F, T) for every F.

  * test `IsRigid.of_admissible` (compatibility): An admissible tower satisfies (ii)′(a).

  * test `not_isRigid_isolated_class` (non-example): If K has class number one, P(Fr_q^{-1} | T^*;
    1) = 0 for all q ∤ N and 𝒦 is the maximal abelian extension of K unramified at every prime
    dividing N, the family c_K = x, c_F = 0 for F ≠ K is an Euler system for every x ∈ H¹(K, T); for
    x ∉ S^{Σ_p}(K, T) it satisfies none of (a), (b), (c).

  * test `AnticyclotomicEulerSystem.heegner_shape` (computation): For K = ℚ, χ the quadratic
    character of an imaginary quadratic field K′: d = 2 and the relation at a prime ℓ inert in K′
    uses P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1}) with Fr_ℓ ∈ G_ℚ, whose square is the Frobenius of the prime
    of K′ above ℓ.

  Acceptance. A system of infinite depth gives one of depth M for every M.

  Acceptance. The counterexample family (c_K arbitrary, others 0) satisfies none of (a), (b), (c)
    when c_K ∉ S^{Σ_p}.

-/


/-! ### Layer ES.3 -/


/-

**`ES.3/derivative-operators`** (definition): The norm and Kolyvagin derivative operators.

  Statement. Let Γ be a finite cyclic group of order n with generator σ. In ℤ[Γ] put N_Γ = Σ_{γ ∈ Γ}
    γ and D_σ = Σ_{i=0}^{n−1} i·σ^i. Then (σ − 1)D_σ = n − N_Γ. For a prime q ∤ p, with Γ_q =
    Gal(K(q)/K(1)) and the generator σ_q fixed through tame inertia (a generator ξ of lim μ_{p^n}
    and a prime of K̄ above q), write N_q = N_{Γ_q} and D_q = D_{σ_q}; for squarefree r, N_r = ∏_{q
    | r} N_q = Σ_{σ ∈ Γ_r} σ and D_r = ∏_{q | r} D_q ∈ ℤ[Γ_r], with N_r = N_sN_{r/s} and D_r =
    D_sD_{r/s} for s | r. Under the augmentation ε, ε(N_Γ) = n and ε(D_σ) = n(n − 1)/2. For another
    generator σ^a (a prime to n) and a′a ≡ 1 (mod n), D_{σ^a} − a′D_σ ∈ nℤ[Γ].

  Hypothesis. Γ finite cyclic with a chosen generator

  * `TauCeti.KolyvaginSystems.normElement` (data) [prototype above]: N_Γ = Σ_{γ ∈ Γ} γ ∈ ℤ[Γ] for a
    finite group Γ.

  * `TauCeti.KolyvaginSystems.kolyvaginDerivative` (data) [prototype above]: D_σ = Σ_{i < n} i·σ^i ∈
    ℤ[Γ] for σ of order n.

  * `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative` (relation) [prototype above]: (σ −
    1)·D_σ = n − N_Γ when σ generates Γ of order n.

  * `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative` (simp) [prototype above]: ε(D_σ) =
    n(n − 1)/2 and ε(N_Γ) = n.

  * `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod` (relation): For Γ = Γ₁ × Γ₂ and r = st: D_r
    = D_s·D_t and N_r = N_s·N_t in ℤ[Γ₁ × Γ₂].

  * `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator` (compatibility) [prototype above]: For
    a·a′ ≡ 1 (mod n): D_{σ^a} − a′·D_σ ∈ n·ℤ[Γ].

  * `TauCeti.KolyvaginSystems.normElement_eq_representation_norm` (compatibility) [prototype above]:
    For a representation ρ of Γ, the action of N_Γ is Mathlib's Representation.norm ρ.

  * test `kolyvaginDerivative_order_two` (computation) [prototype above]: For Γ = {1, σ}: D_σ = σ,
    N_Γ = 1 + σ and (σ − 1)σ = 2 − (1 + σ).

  * test `kolyvaginDerivative_order_three` (computation) [prototype above]: For n = 3: D_σ = σ + 2σ²
    and (σ − 1)(σ + 2σ²) = 3 − (1 + σ + σ²).

  * test `kolyvaginDerivative_trivial` (degenerate) [prototype above]: For Γ = 1: D = 0 and N = 1,
    and the identity reads 0 = 1 − 1.

  * test `kolyvaginDerivative_not_norm_multiple` (non-example) [prototype above]: D_σ is not
    annihilated by σ − 1 in ℤ[Γ] for n ≥ 2: (σ − 1)D_σ = n − N_Γ ≠ 0; it is invariant only modulo
    (n, N_Γ).

  Acceptance. For n = 2: D_σ = σ and (σ − 1)σ = 1 − σ = 2 − (1 + σ).

  Acceptance. The identity is the only property of D_q used in the invariance of derivative classes.

-/


/-

**`ES.3/derivative-invariance`** (lemma): Invariance of the derivative of the universal class.

  Statement. Let K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}. If N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)] restricts
    to Σ_{γ ∈ Gal(F(1)/F)} γ, then N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)},
    independently of the choice of N_{F(1)/F}. Consequently for an Euler system c the image of
    N_{F(1)/F}D_r c_{F(r)} in H¹(F(r), W_M) is fixed by Gal(F(r)/F).

  Hypothesis. r ∈ R_{F,M}

  Acceptance. For r = q: (σ_q − 1)D_q x_{F(q)} = |Γ_q|x_{F(q)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_F ∈
    M X_{F(q)}.

-/


/-

**`ES.3/lifting-to-induced-module`** (theorem): The induced module, the connecting map and lifts of an Euler system.

  Statement. Let 𝕎_M = Maps_cont(G_K, W_M) with (γf)(g) = f(gγ), containing W_M via t ↦ (g ↦ gt).
    (a) For K ⊂_f L ⊆ K_∞(r) there is a canonical δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M) with 0 →
    W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0 exact; δ_L(f) is represented by γ ↦ (γ
    − 1)f̂ for a lift f̂ ∈ 𝕎_M; and δ commutes with restriction and with norm/corestriction. (b) For
    an Euler system c and r ∈ R there is a family of O[G_K]-maps d_F : X_{F(r)} →
    (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞, with δ_{F(r)} ∘ d_F equal to x_{F(s)} ↦ c_{F(s)} (mod M)
    and compatible with norms N_{F′(r)/F(r)}; each d_F is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M).

  Hypothesis. an Euler system for an admissible tower

  Hypothesis. 0 ≠ M ∈ O

  Acceptance. If W^{G_{F(r)}} = 0 the lift is unnecessary: restriction H¹(F, W_M) → H¹(F(r),
    W_M)^{Gal(F(r)/F)} is an isomorphism.

-/


/-

**`ES.3/derivative-class`** (construction): Kolyvagin's derivative classes κ_{F,r,M}.

  Statement. For an Euler system c, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}, fix a lift d = d_F and
    put D_{r,F} = N_{F(1)/F}D_r. Then d(D_{r,F}x_{F(r)}) ∈ (𝕎_M/W_M)^{G_F} and κ_{F,r,M} =
    δ_F(d(D_{r,F}x_{F(r)})) ∈ H¹(F, W_M). It is independent of the choices of N_{F(1)/F} and d, and
    is represented by γ ↦ (γ − 1)f for any f ∈ 𝕎_M lifting d(D_{r,F}x_{F(r)}). Properties: (i)
    κ_{F,1,M} is the image of c_F in H¹(F, W_M); (ii) the restriction of κ_{F,r,M} to F(r) is the
    image of D_{r,F}c_{F(r)}; (iii) for M | M′ and r ∈ R_{F,M′}, κ_{F,r,M′} ↦ κ_{F,r,M} under H¹(F,
    W_{M′}) → H¹(F, W_M) and κ_{F,r,M} ↦ (M′/M)κ_{F,r,M′} under H¹(F, W_M) → H¹(F, W_{M′}). The
    class depends only on the images of c_{F(s)}, s | r, in H¹(F(r), W_M), so the construction
    applies to Euler systems of finite depth and to χ-anticyclotomic ones.

  Hypothesis. r ∈ R_{F,M}

  Hypothesis. an Euler system (or one of the variants of ES.2/rigidity-variants)

  * `TauCeti.KolyvaginSystems.derivativeClass` (constructor): κ_{F,r,M} ∈ H¹(F, W_M) for r ∈
    R_{F,M}; in intrinsic form an element of H¹(F, W_M) ⊗ G_r.

  * `TauCeti.KolyvaginSystems.derivativeClass_one` (simp): κ_{F,1,M} = image of c_F.

  * `TauCeti.KolyvaginSystems.res_derivativeClass` (characterisation): res_{F(r)/F}(κ_{F,r,M}) =
    image of D_{r,F}·c_{F(r)} in H¹(F(r), W_M).

  * `TauCeti.KolyvaginSystems.derivativeClass_reduction` (functoriality): For M | M′: reduction
    sends κ_{F,r,M′} to κ_{F,r,M}, and multiplication M′/M : W_M → W_{M′} sends κ_{F,r,M} to
    (M′/M)·κ_{F,r,M′}.

  * `TauCeti.KolyvaginSystems.derivativeClass_cocycle` (characterisation): κ_{F,r,M} is the class of
    γ ↦ (γ − 1)·f for any lift f of d(D_{r,F}x_{F(r)}).

  * `TauCeti.KolyvaginSystems.derivativeClass_linear` (structure): c ↦ κ_{F,r,M}(c) is O-linear in
    the Euler system.

  * `TauCeti.KolyvaginSystems.derivativeClass_generator` (compatibility): κ ⊗ (⊗_q σ_q) ∈ H¹(F, W_M)
    ⊗ G_r does not depend on the generators σ_q.

  * test `derivativeClass_conductor_one` (degenerate): For r = 1 and F = K with K(1) = K, κ_{K,1,M}
    = c_K mod M.

  * test `derivativeClass_cyclotomic_units` (computation): For K = ℚ, T = ℤ_p(1), M = p^k and ℓ ≡ 1
    (mod p^k): κ_{ℚ,ℓ,M} ∈ ℚ^×/(ℚ^×)^{p^k} is the unique class whose image in ℚ(ℓ)^×/p^k is D_ℓ
    applied to the cyclotomic unit of ℚ(ℓ) (here W^{G_{ℚ(ℓ)}} = 0 for p odd).

  * test `derivativeClass_zero` (degenerate): For the zero Euler system every κ_{F,r,M} is 0.

  * test `derivativeClass_not_cor` (non-example): κ_{F,r,M} is not Cor_{F(r)/F}(c_{F(r)}) = N_r c:
    corestriction gives the Euler-factor multiple of c_F, which is 0 modulo M for r ∈ R_{F,M} with r
    ≠ 1, while κ_{F,r,M} is in general nonzero.

  Acceptance. When W^{G_{F(r)}} = 0, κ_{F,r,M} is the unique class restricting to D_{r,F}c_{F(r)}.

  Acceptance. Scalar and quotient compatibility: κ(ac) = aκ(c), and (iii).

-/


/-

**`ES.3/derivative-local-properties`** (theorem): Local behaviour of derivative classes.

  Statement. Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O. (a) If r ∈ R_{F,M} and w is a
    place of F not dividing pr, then (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M); equivalently κ_{F,r,M} ∈
    S^{Σ_{pr}}(F, W_M). (b) If rq ∈ R_{F,M}, then the image of κ_{F,rq,M} in H¹_s(F_Q, W_M) is
    φ^fs_q of the localisation of κ_{F,r,M}: (κ_{F,rq,M})^s_q = φ^fs_q(κ_{F,r,M}). (c) If W_M/(Fr_q
    − 1)W_M is free of rank one over O/M, the order of (κ_{K,rq,M})^s_q in H¹_s(K_q, W_M) equals the
    order of (κ_{K,r,M})_q in H¹_f(K_q, W_M). (d) If c is trivial at a finite set Σ of primes not
    dividing p, then κ_{F,r,M} ∈ S_Σ^{Σ_{pr}}(F, W_M). For Euler systems of finite depth (b) holds
    and (a) holds after multiplying by a constant m independent of M.

  Hypothesis. an Euler system for an admissible tower (so the classes are universal norms)

  Hypothesis. r, rq ∈ R_{F,M}

  Acceptance. For r = 1 and q ∈ R_{K,M}: the singular part of κ_{K,q,M} at q is φ^fs_q(c_K mod M).

  Acceptance. Together (a) and (b) say that (κ_{K,r,M} ⊗ generators)_r is a weak Kolyvagin system
    for F_can relaxed at p.

-/


/-

**`ES.3/congruence`** (theorem): Kolyvagin's congruence.

  Statement. Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, q ∈ R prime and rq ∈ R. For every prime
    Q of F(rq) above q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)])
    (c_{F(r)})_Q in H¹(F(rq)_Q, T), where P_q(x) = P(Fr_q^{-1} | T^*; x) and (P_q(x) −
    P_q(N(q)x))/[K(q) : K(1)] ∈ O[x].

  Hypothesis. an Euler system for an admissible tower

  Acceptance. For T = ℤ_p(1) this is the classical congruence between cyclotomic units modulo the
    primes above q (Example IV.8.2).

  Acceptance. The congruence is a consequence of the definition for towers extending in the
    p-direction; it is an extra hypothesis in rigidity condition (c).

-/


/-

**`ES.3/kolyvagin-system-module`** (definition): Kolyvagin systems, weak Kolyvagin systems and their limits.

  Statement. For a Selmer triple (T, F, P): a Kolyvagin system is a family κ = (κ_n)_{n ∈ N(P)} with
    κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n such that for every prime q with nq ∈ N(P), (κ_{nq})_{q,s} =
    φ^fs_q(κ_n) in H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}, where the left side is localisation at q followed
    by projection to the singular quotient, and the right side is localisation, reduction modulo
    I_{nq} and φ^fs_q ⊗ 1. KS(T, F, P) is the R-module of Kolyvagin systems. A weak Kolyvagin system
    has κ_n ∈ H¹_{F^n}(K, T/I_nT) ⊗ G_n with the same relation. The generalised module is K̄S(T, F,
    P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j), with a natural map KS → K̄S; every κ̄ ∈ K̄S has a
    class κ̄_1 ∈ H¹_F(K, T). The order of vanishing of κ ≠ 0 is ord(κ) = min{ν(n) : κ_n ≠ 0}, and
    L(T) = {κ_1 : κ ∈ KS(T)} ⊆ H¹_F(K, T) is the module of L-values. The blind spot of κ̄ is the set
    of ideals I with zero image in K̄S(T/I).

  Hypothesis. a Selmer triple; for the relation, T/I_{nq}T satisfies the hypotheses of the
    finite–singular comparison at q

  * `TauCeti.KolyvaginSystems.KolyvaginSystem` (structure): The R-submodule KS(T, F, P) of ∏_{n ∈
    N(P)} H¹_{F(n)}(K, T/I_nT) ⊗ G_n defined by the finite–singular relations.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.eval` (projection): κ ↦ κ_n, R-linear.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.singular_eq_finiteSingular` (relation): (κ_{nq})_{q,s}
    = φ^fs_q(κ_n) for nq ∈ N(P).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.ext` (extensionality): κ = κ′ iff κ_n = κ′_n for all
    n.

  * `TauCeti.KolyvaginSystems.WeakKolyvaginSystem` (structure): Families in ∏_n H¹_{F^n}(K, T/I_nT)
    ⊗ G_n with the same relations; KS ≤ weak KS.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.map` (functoriality): Change of ring, of P, and of F
    as in Remark 3.1.4, each R-linear and compatible with eval.

  * `TauCeti.KolyvaginSystems.GeneralizedKolyvaginSystem` (constructor): K̄S(T, F, P) = lim_k
    colim_j KS(T/m^kT, F, P ∩ P_j), with toGeneralized : KS → K̄S and κ̄ ↦ κ̄_1 ∈ H¹_F(K, T).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.ord` (data): ord(κ) = min{ν(n) : κ_n ≠ 0} ∈ ℕ∞, with
    ord(0) = ⊤.

  * test `KolyvaginSystem.zero_mem` (degenerate): The zero family is a Kolyvagin system, of order ⊤.

  * test `KolyvaginSystem.eval_one` (characterisation): κ_1 ∈ H¹_F(K, T) ⊗ ℤ = H¹_F(K, T): the stalk
    at 1 has I_1 = 0, G_1 = ℤ and F(1) = F.

  * test `KolyvaginSystem.empty_primes` (degenerate): For P = ∅, KS(T, F, ∅) = H¹_F(K, T) via κ ↦
    κ_1.

  * test `WeakKolyvaginSystem.not_kolyvagin` (non-example): For T = ℤ_p(1), Σ(F) = {p, ∞} relaxed at
    p, the raw derivative classes of cyclotomic units form a weak Kolyvagin system whose finite
    parts (κ_n)_{ℓ,f}, ℓ | n, are not zero in general, so it is not a Kolyvagin system (Example
    3.1.10).

  Acceptance. The zero family is a Kolyvagin system; a system may have κ_1 = 0.

  Acceptance. For core rank one KS → K̄S is an isomorphism (ES.5); in general it is neither
    injective nor surjective.

-/


/-

**`ES.3/finite-part-formula`** (theorem): Derivative classes form a weak Kolyvagin system; their finite parts.

  Statement. Let K = ℚ, R the integers of a finite extension of ℚ_p, F = F_can and P a set of primes
    ℓ ≠ p, unramified for T, with T/(Fr_ℓ − 1)T cyclic and Fr_ℓ^{p^k} − 1 injective on T for all k ≥
    0. For an Euler system c for (T, P, 𝒦) with 𝒦 containing the maximal abelian p-extension
    unramified outside p and P, let κ_n = κ_{[ℚ,n,I_n]} ⊗ (generators) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, κ_1 =
    c_ℚ. (a) If H⁰(ℚ_p, T^*) is divisible, (κ_n) is a weak Kolyvagin system for (T, F_can, P); in
    general for each k and all large j the images κ_n^{(k)}, n ∈ N_j, form a weak Kolyvagin system
    for (T/m^kT, F_can, P_j). (b) For ℓ | n, (κ_n)_{ℓ,f} = Σ_{π ∈ S_1(n), π(ℓ) ≠ ℓ} (−1)^{ν(n/d_π)}
    (κ_{d_π})_{ℓ,f} ⊗ ⊗_{q | (n/d_π)} ρ_q(P_q(Fr_{π(q)}^{-1})), where S_1(n) is the set of
    permutations of the primes dividing n whose non-fixed primes form a single orbit, d_π =
    ∏_{π(ℓ)=ℓ} ℓ, and ρ_q : A_{q,I}/A_{q,I}² ≅ G_q ⊗ R/I is σ − 1 ↦ σ ⊗ 1 on the augmentation ideal
    A_{q,I} of (R/I)[G_q ⊗ R/I].

  Hypothesis. K = ℚ

  Hypothesis. the two conditions on the primes of P

  Hypothesis. 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P

  Acceptance. For n = ℓ: S_1(ℓ) has no π with π(ℓ) ≠ ℓ, so (κ_ℓ)_{ℓ,f} = 0.

  Acceptance. For n = ℓq the only π is the transposition, d_π = 1, and (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f}
    ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).

-/


/-

**`ES.3/euler-to-kolyvagin`** (construction): The map from Euler systems to Kolyvagin systems.

  Statement. In the setting of finite-part-formula, define for n ∈ N κ′_n = Σ_{π ∈ S(n)} sign(π)
    κ_{d_π} ⊗ ⊗_{ℓ | (n/d_π)} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, the sum over all
    permutations of the primes dividing n. Then (κ′_n) satisfies the finite–singular relations and
    (κ′_n)_{ℓ,f} = 0 for ℓ | n. Theorem (Mazur–Rubin 3.2.4): if 𝒦 contains the maximal abelian
    p-extension of ℚ unramified outside p and P, and (a) T/(Fr_ℓ − 1)T is cyclic and (b) Fr_ℓ^{p^k}
    − 1 is injective on T for all ℓ ∈ P, k ≥ 0, then c ↦ κ′ is a canonical G_ℚ-equivariant
    homomorphism ES(T) → K̄S(T, F_can, P) with κ̄_1 = c_ℚ; if moreover H⁰(ℚ_p, T^*) is divisible it
    is a homomorphism ES(T) → KS(T, F_can, P) with κ_1 = c_ℚ. Variant (3.2.7): if 𝒦 contains the
    maximal abelian p-extension unramified outside a cofinite set of primes containing P (no
    p-direction), c_F ∈ H¹_{F_can}(F, T) for all F, and there is γ ∈ G_ℚ with γ − 1 killing μ_{p^∞}
    and injective on T, the same conclusions hold. The output in K̄S is a generalised Kolyvagin
    system; the ordinary one needs the local divisibility condition at p. Over a number field K the
    rank-one case of ES.7/higher-kolyvagin-derivative gives the corresponding map.

  Hypothesis. K = ℚ, R the integers of a finite extension of ℚ_p

  Hypothesis. (a), (b) of Theorem 3.2.4; the Euler factors are P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 −
    Fr_ℓ x | T)

  * `TauCeti.KolyvaginSystems.correctedClass` (constructor): κ′_n = Σ_{π ∈ Perm(primes of n)}
    sign(π)·κ_{d_π} ⊗ ⊗_{ℓ | n/d_π} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})).

  * `TauCeti.KolyvaginSystems.correctedClass_one` (simp): κ′_1 = c_ℚ, and κ′_ℓ = κ_ℓ for a prime ℓ.

  * `TauCeti.KolyvaginSystems.correctedClass_finite_eq_zero` (characterisation): (κ′_n)_{ℓ,f} = 0
    for every ℓ | n.

  * `TauCeti.KolyvaginSystems.eulerToKolyvagin` (constructor): The R-linear, G_ℚ-equivariant map
    ES(T, P, 𝒦) → K̄S(T, F_can, P).

  * `TauCeti.KolyvaginSystems.eulerToKolyvagin_one` (characterisation): (eulerToKolyvagin c)_1 =
    c_ℚ.

  * `TauCeti.KolyvaginSystems.eulerToKolyvagin_ordinary` (other): If H⁰(ℚ_p, T^*) is divisible, the
    map factors through KS(T, F_can, P) → K̄S.

  * `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist` (compatibility): For ρ of finite order,
    eulerToKolyvagin(c^ρ) is the system for T ⊗ ρ, and systems for ρ ≡ ρ′ (mod m^k) agree in
    K̄S((T/m^k) ⊗ ρ).

  * test `correctedClass_prime` (computation): For n = ℓ: Perm = {id}, κ′_ℓ = κ_ℓ and (κ_ℓ)_{ℓ,f} =
    0 by the finite-part formula.

  * test `correctedClass_two_primes` (computation): For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗
    ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); the sign of the transposition is −1 and d_π = 1.

  * test `eulerToKolyvagin_zero` (degenerate): The zero Euler system maps to the zero Kolyvagin
    system.

  * test `eulerToKolyvagin_not_ordinary` (non-example): For T with H⁰(ℚ_p, T^*) not divisible,
    H¹_{F_can}(ℚ_p, T/IT) can be a proper submodule of H¹(ℚ_p, T/IT) (Lemma A.1), the classes κ′_n
    need not satisfy the condition at p, and the map is defined only into K̄S: the ordinary and the
    generalised outputs are different statements.

  Acceptance. κ′_1 = κ_1 = c_ℚ and κ′_ℓ = κ_ℓ.

  Acceptance. For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).

  Acceptance. Compatibility: with twisting (Remark 3.2.5), with scalars and with T → T/m^k.

-/


/-

**`ES.3/two-prime-test`** (application): The two-prime check of the correction terms.

  Statement. For distinct ℓ, q ∈ P and n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q) and (κ_{ℓq})_{q,s} =
    φ^fs_q(κ_ℓ); (ii) (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}));
    (iii) the corrected class κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})) has
    zero finite part at ℓ and at q and the same singular parts as κ_{ℓq} at ℓ and q, because the
    correction term κ_1 is unramified at ℓ and q; (iv) κ′_{ℓq} is symmetric in ℓ and q. Hence κ′
    satisfies both edge relations of the square 1 — ℓ — ℓq — q — 1.

  Hypothesis. the setting of euler-to-kolyvagin

  Acceptance. The sign in (iii) is −1 = sign of the transposition, opposite to the sign +1 =
    (−1)^{ν(ℓq)} in (ii): the two formulas are consistent.

  Acceptance. Omitting the correction leaves (κ_{ℓq})_{ℓ,f} ≠ 0 in general, so κ_{ℓq} ∉ H¹_{F(ℓq)}.

-/


/-

**`ES.3/anticyclotomic-derivative`** (theorem): Derivative classes of χ-anticyclotomic Euler systems.

  Statement. Let χ : G_K → ℤ_p^× have order d | p − 1, K′ the field cut out by χ, and c a
    χ-anticyclotomic Euler system for T. For a power M of p let R_{K′,M} be the squarefree ideals of
    K divisible only by primes q ∤ N with M | [K′(q)_χ : K′(1)_χ] and M | P(Fr_q^{-1} | T^*; 1). The
    construction of derivative-class gives κ_{K′,r,M} ∈ H¹(K′, W_M) for r ∈ R_{K′,M}, satisfying the
    analogues of derivative-local-properties (a) and (b): loc^s_q(κ_{K′,rq,M}) = φ^fs_q(κ_{K′,r,M}).
    The map φ^fs_q : H¹_f(K′_q, W_M) → H¹_s(K′_q, W_M) is not Gal(K′/K)-equivariant: it sends the
    χ^i-part into the χ^{i−1}-part.

  Hypothesis. d | p − 1

  Hypothesis. one of the rigidity conditions (a), (b), (c) of the anticyclotomic definition

  Acceptance. For d = 2 (Heegner points): the derivative classes for r with an even number of primes
    lie in the same eigenspace as c_{K′}, and with an odd number in the opposite one.

  Acceptance. The finite–singular relation with the tensor factor G_q retained is equivariant; the
    shift is the action of Gal(K′/K) on G_q through χ.

-/


/-! ### Layer ES.4 -/


/-

**`ES.4/selmer-sheaf`** (construction): The Selmer graph and the Selmer sheaf.

  Statement. A sheaf S of R-modules on a graph X assigns a module S(v) to each vertex, a module S(e)
    to each edge and a map ψ_v^e : S(v) → S(e) whenever v is an endpoint of e; a global section is a
    family (κ_v) with ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}; Γ(S) is the module
    of global sections. For a Selmer triple (T, F, P), X(P) is the graph with vertex set N(P) and an
    edge joining n and nq whenever n, nq ∈ N(P) with q prime. The Selmer sheaf ℋ = ℋ_{(T,F,P)} has
    ℋ(n) = H¹_{F(n)}(K, T/I_nT) ⊗ G_n; for the edge e joining n and nq, ℋ(e) = H¹_s(K_q, T/I_{nq}T)
    ⊗ G_{nq}; ψ_{nq}^e is localisation at q followed by projection to H¹_s; and ψ_n^e is
    localisation at q, reduction to T/I_{nq}T and φ^fs_q ⊗ 1. Then KS(T, F, P) = Γ(ℋ). The sheaf ℋ̂
    with ℋ̂(n) = H¹_{F^n}(K, T/I_nT) ⊗ G_n and the same edges has Γ(ℋ̂) the weak Kolyvagin systems,
    and ℋ ⊆ ℋ̂.

  Hypothesis. a Selmer triple

  * `TauCeti.KolyvaginSystems.conductorGraph` (constructor) [prototype above]: X(P): the simple
    graph on N(P) with n adjacent to m iff m = nq or n = mq for a prime q ∈ P.

  * `TauCeti.KolyvaginSystems.GraphSheaf` (structure) [prototype above]: Vertex modules, edge
    modules and vertex-to-edge maps on a simple graph.

  * `TauCeti.KolyvaginSystems.GraphSheaf.sections` (data) [prototype above]: Γ(S), the submodule of
    ∏_v S(v) of compatible families.

  * `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections` (characterisation) [prototype above]: κ ∈
    Γ(S) iff ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}.

  * `TauCeti.KolyvaginSystems.selmerSheaf` (constructor): ℋ_{(T,F,P)} on X(P).

  * `TauCeti.KolyvaginSystems.sections_selmerSheaf` (equivalence): Γ(ℋ) = KS(T, F, P) as submodules
    of ∏_n ℋ(n).

  * `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf` (structure) [prototype above]: Subsheaves:
    submodules of the stalks and edge modules stable under the maps; Γ of a subsheaf is a submodule
    of Γ.

  * test `conductorGraph_two_primes` (computation) [prototype above]: For P = {q₁, q₂}, X(P) is the
    4-cycle 1 — q₁ — q₁q₂ — q₂ — 1.

  * test `sections_one_vertex` (degenerate): For P = ∅ the graph has the single vertex 1 and Γ(ℋ) =
    ℋ(1) = H¹_F(K, T).

  * test `selmerSheaf_stalk_one` (compatibility): ℋ(1) = H¹_F(K, T) and ℋ̂(1) = H¹_F(K, T).

  * test `sections_ne_product` (non-example): For P = {q} with φ^fs_q ≠ 0 on the image of H¹_F(K,
    T), the pair (κ_1, 0) with φ^fs_q((κ_1)_q) ≠ 0 is not a global section: Γ(ℋ) is a proper
    submodule of ℋ(1) × ℋ(q).

  Acceptance. For P = {q}: X has two vertices and one edge, and Γ(ℋ) = {(κ_1, κ_q) : (κ_q)_{q,s} =
    φ^fs_q(κ_1)}.

  Acceptance. X(P) is the 1-skeleton of the cube on P; it is connected.

-/


/-

**`ES.4/sheaf-monodromy`** (definition): Locally cyclic sheaves, hubs, monodromy and primitive sections.

  Statement. Let S be a sheaf of R-modules on a graph X. S is locally free of rank r if all S(v),
    S(e) are free of rank r and all ψ_v^e are isomorphisms; locally cyclic if all S(v), S(e) are
    cyclic and all ψ_v^e are surjective. For S locally cyclic, a surjective path from v to w is a
    path (v = v₁, …, v_k = w) such that each ψ_{v_{i+1}}^{e_i} is an isomorphism; it induces a
    surjection ψ_P : S(v) → S(w). A vertex v is a hub if every vertex is reached from v by a
    surjective path. S has trivial monodromy if for surjective paths P, P′ from v to w, w′ joined by
    an edge e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}. A global section κ is primitive if κ_v generates
    S(v) for every v. Proposition: if S is locally cyclic and v is a hub, then Γ(S) → S(v), κ ↦ κ_v,
    is injective, and surjective iff S has trivial monodromy; Γ(S) is isomorphic to a submodule of
    the cyclic hub stalk S(v). It is isomorphic to an ideal of R if the hub stalk is free of rank
    one, or if R is principal artinian (every cyclic module is then isomorphic to an ideal). The
    ideal conclusion is false for a general complete noetherian local R; and if κ_u ≠ 0 generates
    m^iS(u) for some u then κ_w generates m^iS(w) for every w.

  Hypothesis. R local with maximal ideal m

  * `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic` (structure) [prototype above]: All stalks
    and edge modules cyclic, all vertex-to-edge maps surjective.

  * `TauCeti.KolyvaginSystems.GraphSheaf.IsHub` (structure) [prototype above]: v is a hub: every
    vertex is the end of a surjective path from v.

  * `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy` (structure): The compatibility of ψ_P
    along surjective paths.

  * `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub` (characterisation) [prototype
    above]: For S locally cyclic and v a hub, κ ↦ κ_v is injective on Γ(S).

  * `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff` (characterisation): For v a hub, κ ↦
    κ_v is surjective iff S has trivial monodromy.

  * `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive` (structure) [prototype above]: κ_v generates
    S(v) for all v.

  * `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates` (relation): If κ_u ≠ 0 generates
    m^i S(u) then κ_w generates m^i S(w) for all w (S locally cyclic with a hub).

  * test `isHub_of_locallyFree_connected` (compatibility): If S is locally free of rank one on a
    connected graph then every vertex is a hub.

  * test `sections_constant_sheaf` (computation): For the constant sheaf R with identity maps on a
    connected graph, Γ = R and every nonzero section generating at one vertex is primitive iff it is
    a unit.

  * test `monodromy_nontrivial_cycle` (non-example): On the triangle graph with all modules R = 𝔽₃
    and all maps the identity except one vertex-to-edge map equal to −1, the sheaf is locally free
    of rank one but has nontrivial monodromy, Γ = 0, and evaluation at a hub is not surjective.

  * test `isPrimitive_zero_module` (degenerate) [prototype above]: If all stalks are 0 the zero
    section is primitive.

  * test `sections_cyclic_not_ideal_dvr` (non-example): On the one-vertex graph, take R=ℤ_p and
    S(v)=ℤ_p/p. The vertex is a hub and monodromy is trivial, but Γ(S)=ℤ/p cannot be isomorphic to
    any ideal of the domain ℤ_p. Injectivity into S(v) does not identify S(v) with an ideal.

  Acceptance. A locally free sheaf of rank one on a connected graph is locally cyclic and every
    vertex is a hub.

  Acceptance. A locally cyclic sheaf with a hub has a primitive section iff it has trivial
    monodromy.

-/


/-

**`ES.4/vertex-step`** (lemma): Selmer lengths across an edge.

  Statement. Let R be principal artinian of length k and (T, F, P) satisfy (H.0)–(H.6) with P ⊆ P_k.
    Put λ(n, T) = length H¹_{F(n)}(ℚ, T) and λ(n, T^*) = length H¹_{F(n)^*}(ℚ, T^*). (a) λ(n, T) −
    λ(n, T^*) is independent of n ∈ N. (b) For nℓ ∈ N the four inclusions H¹_{F_ℓ(n)} ⊆ H¹_{F(n)},
    H¹_{F(nℓ)} ⊆ H¹_{F^ℓ(n)} have cyclic cokernels of lengths c, d, a, b with 0 ≤ a, b, c, d ≤ k, a
    + c = b + d, a ≥ d, b ≥ c, and dually a^* + a = b^* + b = c^* + c = d^* + d = k. (c) |λ(nℓ, T) −
    λ(n, T)| ≤ k; if H¹_{F(n)}(ℚ, T) → H¹_f(ℚ_ℓ, T) is surjective then H¹_{F(nℓ)^*}(ℚ, T^*) =
    H¹_{F^ℓ(n)^*}(ℚ, T^*); the images of m^{λ(n,T^*)}H¹_{F(n)} under φ^fs_ℓ ∘ loc_ℓ and of
    m^{λ(nℓ,T^*)}H¹_{F(nℓ)} under loc_ℓ in H¹_s(ℚ_ℓ, T) are equal; and if both localisations
    H¹_{F(n)}(ℚ, T)[m] → H¹_f(ℚ_ℓ, T) and H¹_{F(n)^*}(ℚ, T^*)[m] → H¹_f(ℚ_ℓ, T^*) are nonzero then
    λ(nℓ, T̄) = λ(n, T̄) − 1 and λ(nℓ, T̄^*) = λ(n, T̄^*) − 1.

  Hypothesis. (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

  Acceptance. For n a core vertex with λ(n, T^*) = 0 and surjective localisation at ℓ, nℓ is again a
    core vertex.

-/


/-

**`ES.4/core-vertices`** (definition): Core vertices and leading vertices.

  Statement. In the setting of vertex-step, a vertex n ∈ N is a core vertex if λ(n, T) = 0 or λ(n,
    T^*) = 0 (equivalently for T̄). Theorem: for every n there is a noncanonical isomorphism
    H¹_{F(n)}(ℚ, T) ⊕ R^r ≅ H¹_{F(n)^*}(ℚ, T^*) ⊕ R^s with r, s ≥ 0 independent of n and rs = 0; at
    a core vertex H¹_{F(n)}(ℚ, T) and H¹_{F(n)^*}(ℚ, T^*) are free, of ranks χ(T) and χ(T^*), which
    are the core ranks of ES.0/core-rank. With r₀ = min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)}:
    every core vertex has ν(n) ≥ r₀, there are core vertices in N_j with ν(n) = r₀ for every j ≥ k,
    and every m ∈ N_j divides a core vertex. If χ(T) > 0, a leading vertex is a core vertex with
    ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*). Over a number field with the 2016 hypotheses a core vertex is an
    n with λ(n) = length H¹_{F(n)^*}(K, T^*) = 0.

  Hypothesis. (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

  * `TauCeti.KolyvaginSystems.selmerLength` (data): λ(n, T) and λ(n, T^*) as elements of ℕ.

  * `TauCeti.KolyvaginSystems.IsCoreVertex` (structure): λ(n, T) = 0 or λ(n, T^*) = 0.

  * `TauCeti.KolyvaginSystems.isCoreVertex_iff_residual` (characterisation): n is a core vertex for
    T iff it is one for T̄ = T/mT.

  * `TauCeti.KolyvaginSystems.free_of_isCoreVertex` (characterisation): At a core vertex,
    H¹_{F(n)}(ℚ, T) is free of rank χ(T) and H¹_{F(n)^*}(ℚ, T^*) is free of rank χ(T^*).

  * `TauCeti.KolyvaginSystems.exists_isCoreVertex_dvd` (other): Every m ∈ N_j (j ≥ k) divides a core
    vertex in N_j, and there are core vertices with exactly r₀ prime factors.

  * `TauCeti.KolyvaginSystems.IsLeadingVertex` (structure): Core vertices with ν(n) = dim_k
    H¹_{F^*}(ℚ, T̄^*), for χ(T) > 0.

  * `TauCeti.KolyvaginSystems.selmerLength_sub` (relation): λ(n, T) − λ(n, T^*) = k·(χ(T) − χ(T^*))
    for every n.

  * test `isCoreVertex_one_iff` (characterisation): For χ(T) > 0, 1 is a core vertex iff H¹_{F^*}(ℚ,
    T^*) = 0.

  * test `isCoreVertex_field_coreRank_one` (computation): For R = k and χ(T) = 1, n is a core vertex
    iff dim H¹_{F(n)}(ℚ, T) = 1 iff H¹_{F(n)^*}(ℚ, T^*) = 0.

  * test `not_isCoreVertex_small` (non-example): If ν(n) < min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ,
    T̄^*)} then n is not a core vertex.

  * test `coreRank_at_core_vertex` (compatibility): rank H¹_{F(n)}(ℚ, T) at a core vertex equals
    ES.0's χ(T, F), defined from n = 1.

  Acceptance. If H¹_{F^*}(ℚ, T^*) = 0 then 1 is a core vertex and the only leading vertex.

  Acceptance. The core rank computed at any core vertex equals the integer of ES.0/core-rank
    computed at n = 1.

-/


/-

**`ES.4/leading-vertices`** (theorem): Leading vertices through a prescribed submodule.

  Statement. In the setting of core-vertices suppose χ(T) > 0, 1 is not a core vertex, (H.4a) holds
    and the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]]. If L ⊆ H¹_F(ℚ, T) satisfies
    dim_k L[m] = χ(T), there are infinitely many leading vertices n with L ⊆ H¹_{F(n)}(ℚ, T). For R
    = k and χ(T) = 1: for every line L in H¹_F(ℚ, T) there is a leading vertex n with κ_n generating
    L ⊗ G_n for any nonzero κ ∈ KS(T).

  Hypothesis. (H.0)–(H.6), (H.4a), image of R in End(T) inside that of ℤ_p[[G_ℚ]]

  Acceptance. Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur (Remark
    4.1.17).

-/


/-

**`ES.4/stub-sheaf`** (definition): The sheaf of stub Selmer modules.

  Statement. In the setting of core-vertices, the stub subsheaf ℋ′ ⊆ ℋ has ℋ′(n) = m^{λ(n,T^*)}ℋ(n)
    = m^{λ(n,T^*)}H¹_{F(n)}(ℚ, T) ⊗ G_n, ℋ′(e) the image of ℋ′(n) in ℋ(e) for e joining n and nℓ,
    and the restricted maps, which are surjective. ℋ′(n) = 0 if λ(n, T^*) ≥ k, and otherwise ℋ′(n)
    is free of rank χ(T) over R/m^{k−λ(n,T^*)}. Theorems: (Howard) Γ(ℋ′) → ℋ′(n) is surjective for
    every n; if χ(T) = 1, Γ(ℋ′) contains a free R-module of rank one, and if χ(T) > 1 it contains
    free modules of every rank. If χ(T) = 1, ℋ′ is locally cyclic, the core subgraph X⁰ (vertices
    the core vertices) is connected, every n with λ(n, T^*) = 0 is a hub, ℋ′ has trivial monodromy
    and Γ(ℋ′) is free of rank one. If χ(T) = 1, or R is a field, or (H.4a) holds with the End(T)
    condition, then Γ(ℋ′) = Γ(ℋ): every Kolyvagin system has κ_n ∈ ℋ′(n). If χ(T) = 0 then KS(T) =
    0.

  Hypothesis. (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

  * `TauCeti.KolyvaginSystems.stubSheaf` (constructor): ℋ′ as a subsheaf of ℋ, with ℋ′(n) =
    m^{λ(n,T^*)}·ℋ(n).

  * `TauCeti.KolyvaginSystems.stubSheaf_stalk_eq_bot` (simp): ℋ′(n) = 0 iff λ(n, T^*) ≥ k (for χ(T)
    > 0).

  * `TauCeti.KolyvaginSystems.stubSheaf_stalk_free` (characterisation): If λ(n, T^*) < k, ℋ′(n) is
    free of rank χ(T) over R/m^{k − λ(n,T^*)}.

  * `TauCeti.KolyvaginSystems.stubSheaf_isLocallyCyclic` (instance): For χ(T) = 1 the stub sheaf is
    locally cyclic and every vertex with λ(n, T^*) = 0 is a hub.

  * `TauCeti.KolyvaginSystems.sections_stubSheaf_eq` (equivalence): Γ(ℋ′) = Γ(ℋ) under any of the
    three conditions of Theorem 4.4.1.

  * `TauCeti.KolyvaginSystems.kolyvaginSystem_eq_bot_of_coreRank_zero` (other): χ(T) = 0 implies
    KS(T, F, P) = 0.

  * test `stubSheaf_core_vertex` (compatibility): If λ(n, T^*) = 0 then ℋ′(n) = ℋ(n).

  * test `stubSheaf_field` (computation): For R = k and χ(T) = 1: ℋ′(n) = ℋ(n) is one-dimensional if
    n is a core vertex and ℋ′(n) = 0 otherwise.

  * test `stubSheaf_ne_selmerSheaf` (non-example): If λ(n, T^*) > 0 and χ(T) = 1 then ℋ′(n) ≠ ℋ(n):
    the stalk ℋ(n) ≅ R ⊕ H¹_{F(n)^*}(ℚ, T^*) is not cyclic.

  * test `stubSheaf_zero_of_large` (degenerate): If λ(n, T^*) ≥ k then ℋ′(n) = 0 and every Kolyvagin
    system has κ_n = 0 (χ(T) = 1).

  Acceptance. At a core vertex with λ(n, T^*) = 0, ℋ′(n) = ℋ(n).

  Acceptance. For χ(T) > 1 the module KS(T) is not finitely generated (Remark 5.1.2), so the
    rank-one theory uses ℋ′.

-/


/-

**`ES.4/kolyvagin-bound`** (theorem): The Kolyvagin system bound.

  Statement. (a) (R principal artinian of length k, (H.0)–(H.6), and one of the conditions of
    Theorem 4.4.1, or κ sufficiently liftable.) For κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ sup{i : κ_1
    ∈ m^iH¹_F(ℚ, T)} ∈ ℕ∞ (∞ when κ_1=0). (b) (R a discrete valuation ring, (H.0)–(H.5), H¹(ℚ_ℓ,
    T)/H¹_F(ℚ_ℓ, T) torsion-free for ℓ ∈ Σ(F), P = P_1.) For κ ∈ KS(T) put ∂^{(0)}(κ) = max{j : κ_1
    ∈ m^jH¹_F(ℚ, T)} ≤ ∞. Then length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ); in particular if κ_1 ≠ 0 then
    H¹_{F^*}(ℚ, T^*) is finite. The same holds for κ̄ ∈ K̄S(T). The bound concerns the whole dual
    Selmer group H¹_{F^*}(ℚ, T^*) of the discrete module T^* = Hom(T, μ_{p^∞}), not a cotorsion
    quotient; for κ_1 = 0 it is vacuous (∂^{(0)} = ∞).

  Hypothesis. as stated in (a), (b)

  Acceptance. Kato's Kolyvagin system gives length Sel(E[p^∞]) ≤ the divisibility of the Kato class,
    under the hypotheses of §6.2.

  Acceptance. Over a DVR, scaling a nonzero initial class by π raises the bound by one; the zero
    system gives no information.

-/


/-

**`ES.4/rubin-hypotheses`** (definition): Rubin's hypotheses, index of divisibility and error terms.

  Statement. Let T be a p-adic representation of G_K over O, V = T ⊗ Φ, W = V/T, W_M = M^{-1}T/T, 𝔭
    the maximal ideal of O, k = O/𝔭, K(1) the maximal p-extension of K in the Hilbert class field.
    Hyp(K, T): (i) there is τ ∈ G_K acting trivially on μ_{p^∞}, on (O_K^×)^{1/p^∞} and on K(1),
    with T/(τ − 1)T free of rank one over O; (ii) T ⊗ k is an irreducible k[G_K]-module. Hyp(K, V):
    (i) there is such a τ with dim_Φ V/(τ − 1)V = 1; (ii) V is an irreducible Φ[G_K]-module. For an
    Euler system c, ind_O(c) = sup{n : c_K ∈ 𝔭^nH¹(K, T) + H¹(K, T)_tors} ≤ ∞. Ω =
    K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), and the error terms are n_W = ℓ_O(H¹(Ω/K, W) ∩ S^{Σ_p}(K,
    W)) and n_W^* = ℓ_O(H¹(Ω/K, W^*) ∩ S_{Σ_p}(K, W^*)), where S^{Σ_p} and S_{Σ_p} are the Selmer
    groups relaxed and strict at the primes above p. H¹(Ω/K, W) and H¹(Ω/K, W^*) are finite if T ≠ O
    and T ≠ O(1).

  Hypothesis. T a p-adic representation unramified outside finitely many primes

  * `TauCeti.EulerSystems.HypKT` (structure): Hyp(K, T): the element τ with its three triviality
    conditions and free rank-one coinvariants, and residual irreducibility.

  * `TauCeti.EulerSystems.HypKV` (structure): Hyp(K, V).

  * `TauCeti.EulerSystems.HypKT.toHypKV` (functoriality): Hyp(K, T) implies Hyp(K, V).

  * `TauCeti.EulerSystems.indexOfDivisibility` (data): ind_O(c) ∈ ℕ∞.

  * `TauCeti.EulerSystems.indexOfDivisibility_eq_top_iff` (characterisation): ind_O(c) = ∞ iff c_K ∈
    H¹(K, T)_tors.

  * `TauCeti.EulerSystems.errorTerm` (data): n_W and n_W^* ∈ ℕ∞, finite when T ≠ O, O(1) and V is
    irreducible.

  * `TauCeti.EulerSystems.indexOfDivisibility_smul` (relation): ind_O(π·c) = ind_O(c) + 1 for a
    uniformiser π.

  * test `HypKT.of_rank_one` (computation): If rank_O T = 1 then Hyp(K, T) holds with τ = 1.

  * test `indexOfDivisibility_zero_system` (degenerate): For the zero Euler system ind_O(c) = ∞ and
    the bounds say nothing.

  * test `errorTerm_infinite_trivial` (non-example): For T = O with trivial action, H¹(Ω/K, W) =
    Hom(Gal(Ω/K), Φ/O) is infinite: the finiteness statement excludes T = O and T = O(1).

  * test `errorTerm_cyclotomic` (computation): For K = ℚ, T = ℤ_p(1) ⊗ χ^{-1}, χ ≠ 1, ω of order
    prime to p: H¹(Ω/ℚ, W) = H¹(Ω/ℚ, W^*) = 0, so n_W = n_W^* = 0.

  Acceptance. For T = ℤ_p(1) ⊗ χ^{-1} with χ even nontrivial of order prime to p: n_W = n_W^* = 0.

  Acceptance. The two error terms are distinct; neither is assumed zero.

-/


/-

**`ES.4/rubin-bound`** (theorem): Rubin's bound with error terms.

  Statement. Let c be an Euler system for T (admissible tower). (a) If p > 2 and T satisfies Hyp(K,
    T), then ℓ_O(S_{Σ_p}(K, W^*)) ≤ ind_O(c) + n_W + n_W^*. (b) If V satisfies Hyp(K, V), T is not
    the one-dimensional trivial representation and c_K ∉ H¹(K, T)_tors, then S_{Σ_p}(K, W^*) is
    finite (any p). (c) Let H¹_f(K_v, V), H¹_f(K_v, V^*) be orthogonal complements for v | p and
    loc^s_{Σ_p} : S^{Σ_p}(K, T) → H¹_s(K_p, T) = ⊕_{v|p} H¹_s(K_v, T). If loc^s_{Σ_p}(c_K) ≠ 0:
    under the hypotheses of (b) and [H¹_s(K_p, T) : O·loc^s_{Σ_p}(c_K)] finite, S(K, W^*) is finite;
    under those of (a), ℓ_O(S(K, W^*)) ≤ ℓ_O(H¹_s(K_p, T)/O·loc^s_{Σ_p}(c_K)) + n_W + n_W^*. (d) If
    c is trivial at a finite set Σ of primes not above p, then under the hypotheses of (a),
    ℓ_O(S_{Σ_p}^Σ(K, W^*)) ≤ ind_O(c) + n_W + n_W^* with n_W = ℓ_O(H¹(Ω/K, W) ∩ S_Σ^{Σ_p}(K, W)) and
    n_W^* as before. The constants n_W, n_W^* are independent of the torsion exponent M, so the
    finite-level bounds are uniform in M before passing to W^* = colim W_M^*.

  Hypothesis. an Euler system for an admissible tower (or rigidity (ii)′ with T^{G_{K(1)}} = 0)

  Hypothesis. p > 2 and Hyp(K, T) for (a); Hyp(K, V) for (b)

  Acceptance. Cyclotomic units: with n_W = n_W^* = 0 the bound is the class-group divisibility of
    Rubin's Chapter III.

  Acceptance. Each of ind_O(c), n_W, n_W^* is retained; an application may drop an error term only
    after proving it vanishes.

  Acceptance. The bound is for S_{Σ_p}(K, W^*), strict at p, not for the Bloch–Kato Selmer group;
    (c) is the passage to S(K, W^*).

-/


/-

**`ES.4/variant-bounds`** (theorem): Bounds for the variants: finite depth and anticyclotomic systems.

  Statement. (a) (Finite depth.) Let 0 ≠ M ∈ O and c an Euler system for W_M. Suppose Hyp(K, T)
    holds, n_W = n_W^* = 0 and W_M^{G_K} = 0. Let m = sup_{q ∤ p} [W^{I_q} : (W^{I_q})_div] and n
    the order of m·c_K in H¹(K, W_M). Then n·S_{Σ_p}(K, W_M^*) = 0; in particular if m·c_K ≠ 0 then
    S_{Σ_p}(K, W^*) is finite for a compatible family. (b) (Anticyclotomic.) Let c be a
    χ-anticyclotomic Euler system for T with H¹(Ω′/K′, W) = H¹(Ω′/K′, W^*) = 0, T ⊗ k irreducible
    over G_{K′}, and τ ∈ G_K with ε_cyc(τ) = χ(τ), τ^d the identity on K′(1)_χ(μ_{p^∞},
    (O_{K′}^×)^{1/p^∞}) and T/(τ − 1)T free of rank one. Then for every i, 𝔭^{ind_O(c, χ^i)}
    S_{Σ_p}(K′, W^*)^{χ^{1−i}} = 0, where ind_O(c, χ^i) is the index of divisibility of the
    χ^i-component of c_{K′}. This bounds exponents of eigenspaces, not lengths.

  Hypothesis. as stated

  Acceptance. For d = 1, (b) is the exponent form of rubin-bound with zero error terms.

  Acceptance. For Heegner points (d = 2) the induction to a length bound uses T^* ≅ T and is carried
    out in ES.5/howard-dvr-theorem.

-/


/-

**`ES.4/abundant-localization`** (theorem): Localisation at abundant tuples with bounded loss.

  Statement. Setting of ES.1/abundant-tuples. (a) (Uniform annihilation.) Let R be a lattice with
    R_ℚ^𝔠 ≅ R_ℚ^∨(1), pure of weight −1 at every nonarchimedean place not above ℓ. For every finite
    set Σ of places there is m_Σ ≥ 1 such that for every saturated free submodule S of the
    Bloch–Kato Selmer module with images S^{(m)} modulo λ^m and every m > m_Σ, loc_w(λ^{m_Σ}S^{(m)})
    = 0 for every nonarchimedean w ∈ Σ not above ℓ. (b) (Corrected Proposition 2.6.7.) Let S be free
    of rank r over O_λ/λ^{m−m₀} and (Ψ₁, …, Ψ_r) an (S, γ)-abundant tuple realised by γ-associated
    places w_i. Put c = 𝔣(r)r_R and let A be the matrix of s ↦ (θ_S(Ψ_i)(s))_i in a basis e₁, …, e_r
    of S, after identifying the λ^{m−m₀}-torsion of (R̄^{(m)})^{h_γ} with O_λ/λ^{m−m₀}; abundance
    says that the image of A contains λ^c(O_λ/λ^{m−m₀})^r. Then there is an integral matrix C with
    AC = CA = λ^c·I in the finite coefficient ring, and the elements s_j = Ce_j ∈ S satisfy
    loc_{w_i}(s_j) = 0 for i ≠ j and exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ −
    𝔣(r)r_R; the s_j span a submodule containing λ^{𝔣(r)r_R}S and form a basis of S when 𝔣(r)r_R =
    0. For r = 2 and a primitive v ∈ S one can moreover choose a primitive t ∈ S with loc_{w₁}(t) =
    0 and exp_λ(loc_{w₂}(t)) ≥ m − m₀ − 𝔣(2)r_R after possibly interchanging the two places. The
    printed statement (a basis for every abundant tuple) is false when the loss is positive.

  Hypothesis. as in ES.1/abundant-tuples

  Hypothesis. for (a): the purity and polarisation hypotheses

  Acceptance. With r_R = 0: a basis of S diagonalising the localisations, with exp ≥ m − m₀: the
    clean statement.

  Acceptance. The linear-algebra step of the printed form fails when the loss is positive: for A =
    (λ, 1; 0, λ) over O_λ/λ^n with n ≥ 3, whose image contains λ²(O_λ/λ^n)², there is no basis s₁,
    s₂ with A(s_j) supported on the j-th coordinate, since that would write A = D·B with D diagonal
    and B invertible, and the second row (0, λ) forces det B ∈ λO_λ. The corrected statement uses
    the scaled inverse C = λ²A^{-1} = (λ, −1; 0, λ).

-/


/-

**`ES.4/howard-descent-with-errors`** (theorem): Self-dual descent with explicit error constants.

  Statement. (Castella–Grossi–Lee–Skinner, Theorem 3.2.1.) Let E/ℚ be an elliptic curve of conductor
    N, p ∤ 2N a prime of good ordinary reduction, K an imaginary quadratic field of discriminant
    prime to Np with E(K)[p] = 0, Γ the Galois group of the anticyclotomic ℤ_p-extension, R the
    integers of a finite extension Φ/ℚ_p, α : Γ → R^× a character with α ≠ 1, T_α = T_pE ⊗ R(α), A_α
    = T_α ⊗ Φ/R, and F_ord the ordinary Selmer structure. If κ_α ∈ KS(T_α, F_ord, 𝓛_E) has κ_{α,1} ≠
    0, then H¹_{F_ord}(K, T_α) has rank one and H¹_{F_ord}(K, A_α) ≅ (Φ/R) ⊕ M_α ⊕ M_α with M_α
    finite and length_R(M_α) ≤ length_R(H¹_{F_ord}(K, T_α)/R·κ_{α,1}) + E_α, where E_α ≥ 0 depends
    only on C_α, T_pE and rank_{ℤ_p}R. Here C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1} and 0
    otherwise, C_1 = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ im ρ_E|_{G_{K_∞}}}, C_2 is minimal with
    p^{C_2}End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ]), and e = rank_{ℤ_p}(R)(C_1 + C_2 + C_α). Inputs: (i) for c₁,
    c₂, c₃ ∈ H¹(K, T^{(k)}) with Rc₁ + Rc₂ ⊇ 𝔪^{d₁}R^{(k)} ⊕ 𝔪^{d₂}R^{(k)} there are infinitely many
    ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₃) ≥ ord(c₃) − e and R·loc_ℓc₁ + R·loc_ℓc₂ ⊇ 𝔪^{d₁+d₂+2e}(R^{(k)})²;
    (ii) if N ⊆ M are finitely generated torsion R-modules then their invariant factors satisfy
    d_i(N) ≤ d_i(M). When ρ_E|_{G_K} is surjective, E_α = 0 and the statement is
    ES.5/howard-dvr-theorem. Residual irreducibility is not assumed.

  Hypothesis. as stated; in particular α ≠ 1 and (h1) E(K)[p] = 0

  Acceptance. E_α = 0 when ρ_E is surjective on G_K.

  Acceptance. The bound is uniform in k: the constants C_1, C_2, C_α do not depend on the torsion
    exponent.

-/


/-! ### Layer ES.5 -/


/-

**`ES.5/divisibility-invariants`** (definition): Divisibility indices, elementary divisors and primitivity.

  Statement. Let (T, F, P) be a Selmer triple and κ ∈ KS(T). (a) R principal artinian of length k:
    ∂^{(r)}(κ) = min{k − length(Rκ_n) : n ∈ N, ν(n) = r} and e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for
    i ≥ 0. (b) R a discrete valuation ring: ∂^{(r)}(κ) = max{j : κ_n ∈ m^j H¹_{F(n)}(K, T/I_nT) ⊗
    G_n for every n ∈ N with ν(n) = r} ∈ ℕ ∪ {∞}, ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(K, T)}, e_i(κ)
    = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ ord(κ), and ∂^{(∞)}(κ) = min{∂^{(r)}(κ) : r ≥ 0}. κ is
    primitive if its image in KS(T/mT) is nonzero. In the DVR case, the index ∂^{(0)}(κ) is ∞ when
    κ_1=0. In the artinian case use the truncated definition k−length(Rκ_1), which equals k for
    κ_1=0, not ∞. The two conventions agree through limits for nonzero DVR systems under the
    rank-one admissibility hypotheses.

  Hypothesis. For the definitions: R principal artinian (length k) or a DVR, with its specified
    Kolyvagin-system carrier.

  Hypothesis. For monotonicity, scaling, elementary-divisor and order characterisations: the
    admissibility hypotheses of rank-one-module-theorem and χ(T)=1; use nonzero κ for DVR elementary
    divisors.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex` (data): ∂^{(r)}(κ) ∈ ℕ∞ for r ≥ 0.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero` (characterisation): ∂^{(0)}(κ) = sup{j
    : κ_1 ∈ m^j H¹_F(K, T)}; it is ⊤ iff κ_1 = 0 (R a discrete valuation ring, H¹_F torsion-free).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor` (data): e_i(κ) = ∂^{(i)}(κ) −
    ∂^{(i+1)}(κ), defined for i ≥ ord(κ).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty` (data): ∂^{(∞)}(κ) = inf_r ∂^{(r)}(κ).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive` (structure): The image of κ in KS(T/mT)
    is nonzero.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul` (relation): Under the rank-one
    admissibility hypotheses, over a DVR ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 with ∞+1=∞. Over a principal
    artinian ring of length k, ∂^{(r)}(πκ)=min(k,∂^{(r)}(κ)+1).

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul` (relation): π·κ is not
    primitive.

  * `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq` (characterisation): For nonzero κ under the
    rank-one admissibility hypotheses: over a DVR ord(κ)=min{r:∂^{(r)}(κ)<∞}; over a principal
    artinian ring ord(κ)=min{r:∂^{(r)}(κ)<k}. Set ord(0)=∞ in both cases.

  * test `divIndex_zero_system` (degenerate): For κ=0 over a DVR, ∂^{(r)}=∞ for all r; over a
    principal artinian ring of length k, ∂^{(r)}=k. In both cases ord(κ)=∞ and κ is not primitive.

  * test `divIndex_scaling` (computation): For a DVR rank-one admissible triple and primitive κ with
    ∂^{(0)}=3, ∂^{(0)}(π²κ)=5. Over an artinian ring of length k the value is min(k,5). If k=4 it
    equals 4 and (π²κ)_1=0. The scaled system is not primitive.

  * test `isPrimitive_field` (characterisation): For R = k a field, κ is primitive iff κ ≠ 0.

  * test `isPrimitive_ne_nonzero_initial` (non-example): Over a DVR, for primitive κ₀ with (κ₀)_1≠0,
    πκ₀ has nonzero initial class and is not primitive. In an artinian quotient the initial class
    can be killed by π, so nonvanishing must be checked separately.

  Acceptance. Over a DVR under rank-one admissibility, ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 and e_i(πκ)=e_i(κ)
    for their finite range. Over length-k artinian rings the values truncate at k, so elementary
    divisors need not remain unchanged.

  Acceptance. The order uses threshold ∞ over a DVR and k over an artinian ring.

-/


/-

**`ES.5/rank-one-module-theorem`** (theorem): Kolyvagin systems in core rank one.

  Statement. Let (T, F, P) satisfy (H.0)–(H.6) with χ(T) = 1. (a) R principal artinian of length k:
    KS(T) is free of rank one over R; for a core vertex n, κ ↦ κ_n is an isomorphism KS(T) ≅ ℋ(n);
    if κ_m ≠ 0 generates m^jℋ′(m) then κ_n generates m^jℋ′(n) for every n; for j ≥ k restriction
    KS(T, P) → KS(T, P ∩ P_j) is an isomorphism; for j ≤ k reduction KS(T) → KS(T/m^jT) is
    surjective; and KS(T) → K̄S(T) is an isomorphism. (b) R a discrete valuation ring, (H.0)–(H.5),
    torsion-free local quotients, P = P_1: KS(T) ≅ lim_k KS(T/m^kT, P_k) ≅ K̄S(T), and KS(T) is free
    of rank one, generated by a primitive κ. If χ(T) = 0 then KS(T) = 0 in both cases; if χ(T) ≥ 2
    and R is artinian, KS(T) contains free modules of every rank.

  Hypothesis. (H.0)–(H.6) (artinian), or (H.0)–(H.5) with torsion-free local quotients (discrete
    valuation ring)

  Hypothesis. χ(T) = 1 for the main statements

  Acceptance. For T = ℤ_p(1) ⊗ ρ^{-1}, ρ even nontrivial: KS(T) is free of rank one, generated up to
    a unit by the cyclotomic-unit system when that system is primitive.

  Acceptance. Reduction surjectivity: every Kolyvagin system modulo m^j lifts.

-/


/-

**`ES.5/structure-theorem`** (theorem): Structure of the dual Selmer group from a Kolyvagin system.

  Statement. Let χ(T) = 1 and 0 ≠ κ ∈ KS(T). (a) R = k a field: dim KS(T) = 1, κ_n ≠ 0 iff n is a
    core vertex, and dim_k H¹_{F^*}(ℚ, T^*) = ord(κ). (b) R principal artinian of length k, κ_1 ≠ 0:
    ∂^{(0)}(κ) ≥ ∂^{(1)}(κ) ≥ ⋯, e_0(κ) ≥ e_1(κ) ≥ ⋯ ≥ 0 and H¹_{F^*}(ℚ, T^*) ≅ ⊕_{i ≥ 0}
    R/m^{e_i(κ)}; if κ is primitive and κ_1 ≠ 0 then length H¹_{F^*}(ℚ, T^*) = k − length(Rκ_1) =
    max{i : κ_1 ∈ m^iH¹_F(ℚ, T)}, and if κ_1 = 0 then length H¹_{F^*}(ℚ, T^*) ≥ k. (c) R a discrete
    valuation ring: ∂^{(s)}(κ) is nonincreasing and finite for s ≥ ord(κ); the e_i(κ) are
    nonincreasing, nonnegative and independent of κ ≠ 0, as is ord(κ); corank_R H¹_{F^*}(ℚ, T^*) =
    ord(κ); H¹_{F^*}(ℚ, T^*)/(H¹_{F^*}(ℚ, T^*))_div ≅ ⊕_{i ≥ ord(κ)} R/m^{e_i(κ)}; its length is
    ∂^{(ord κ)}(κ) − ∂^{(∞)}(κ); and κ is primitive iff ∂^{(∞)}(κ) = 0. Hence: length H¹_{F^*}(ℚ,
    T^*) is finite iff κ_1 ≠ 0; length H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ) with equality iff κ is
    primitive; and length H¹_{F^*}(ℚ, T^*) = length(H¹_F(ℚ, T)/L(T)) for the module of L-values
    L(T).

  Hypothesis. the hypotheses of rank-one-module-theorem in each case

  Hypothesis. χ(T) = 1

  Acceptance. Three separate conclusions: κ_1 ≠ 0 gives finiteness and an upper bound; primitivity
    gives equality; an analytic formula needs in addition an identification of κ_1 with an L-value.

  Acceptance. The higher e_i give every elementary divisor of the dual Selmer group, not only its
    exponent or length.

-/


/-

**`ES.5/kolyvagin-dual-selmer`** (construction): The Kolyvagin-constructed dual Selmer group.

  Statement. Let S be a sheaf on X(P) with isomorphisms S(e_{n,nℓ}) ≅ S(e_ℓ) for all edges (for the
    Selmer sheaf with I_ℓ = 0 for all ℓ ∈ P, given by generators of the G_ℓ). For a vertex n let ψ_n
    : S(n) → ⊕_{ℓ | n} S(e_ℓ) be the sum of the vertex-to-edge maps. For a global section κ,
    Sel^*(κ; n) = (⊕_{ℓ | n} S(e_ℓ))/Σ_{d | n} ψ_d(Rκ_d) and Sel^*(κ) = colim_n Sel^*(κ; n). For the
    Selmer sheaf there is a canonical map H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p) with kernel ∩_n
    H¹_{(F^*)_n}(ℚ, T^*), the classes vanishing at every prime of P. Theorem: if χ(T) = 1, (H.4a)
    holds, the image of R → End(T) lies in that of ℤ_p[[G_ℚ]] and κ is primitive, this map is an
    isomorphism. For general (T, F, P), Sel^*_∞(κ) = lim_k Sel^*(κ^{(k)}).

  Hypothesis. I_ℓ = 0 for ℓ ∈ P (after reduction modulo m^k and restriction to P_k)

  * `TauCeti.KolyvaginSystems.kolyvaginDualSelmer` (constructor): Sel^*(κ; n) and Sel^*(κ) = colim_n
    Sel^*(κ; n).

  * `TauCeti.KolyvaginSystems.kolyvaginDualSelmer_map` (functoriality): For n | m the natural map
    Sel^*(κ; n) → Sel^*(κ; m).

  * `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual` (constructor): The canonical map
    H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p).

  * `TauCeti.KolyvaginSystems.ker_dualSelmerToKolyvaginDual` (characterisation): Its kernel is ⨅_n
    H¹_{(F^*)_n}(ℚ, T^*).

  * `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual_bijective` (other): Bijective when χ(T) = 1,
    (H.4a), the End(T) condition and κ primitive.

  * test `kolyvaginDualSelmer_one` (degenerate): Sel^*(κ; 1) = 0.

  * test `kolyvaginDualSelmer_zero_system` (computation): For κ = 0, Sel^*(κ; n) = ⊕_{ℓ | n} S(e_ℓ),
    free of rank ν(n) when the edge modules are free of rank one.

  * test `dualSelmerToKolyvaginDual_not_surjective` (non-example): For κ = πκ₀ with κ₀ primitive and
    H¹_{F^*}(ℚ, T^*) = 0, Sel^*(κ; ℓ) = S(e_ℓ)/πS(e_ℓ) ≠ 0 at a core edge, so the map from 0 is not
    surjective.

  Acceptance. The construction recovers the Pontryagin dual of the whole dual Selmer group, as a
    module, from the classes κ_n.

  Acceptance. For a non-primitive κ the map need not be surjective.

-/


/-

**`ES.5/sharpness-examples`** (application): Scaling, vanishing leading class and a non-primitive arithmetic system.

  Statement. (a) Scaling: for κ primitive with κ_1 ≠ 0 over a discrete valuation ring (χ(T) = 1),
    length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ); for κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length
    H¹_{F^*}(ℚ, T^*), the e_i are unchanged and κ′ is not primitive: the bound for κ′ is true and
    not sharp. (b) A nonzero Kolyvagin system with κ_1 = 0 is a valid element of KS(T); for it
    ∂^{(0)} = ∞, the bound is vacuous, and by the structure theorem H¹_{F^*}(ℚ, T^*) is infinite
    when χ(T) = 1. For κ=0 the bound remains vacuous and gives no finiteness conclusion. (c) Kato's
    Kolyvagin system for T_pE: if L(E, 1) ≠ 0, p satisfies the hypotheses of Mazur–Rubin 2004
    Theorem 6.2.4(ii) and p divides a Tamagawa factor c_ℓ for some ℓ ≠ p, then κ^{Kato} is not
    primitive: it is a Kolyvagin system for the finer structure F_u with unramified conditions away
    from p, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a
    length.

  Hypothesis. χ(T) = 1; for (c) the hypotheses of Theorem 6.2.4(ii) of the source

  Acceptance. A nonzero point or class is not automatically primitive.

  Acceptance. Sharpness is a property of the system, checked through reduction modulo m, not of the
    representation.

-/


/-

**`ES.5/howard-hypotheses`** (definition): Howard's self-dual Selmer triples and hypotheses H.0–H.5.

  Statement. Let K be an imaginary quadratic field, τ a complex conjugation, R a coefficient ring
    (complete noetherian local, finite residue field of characteristic p; in §1.5 principal
    artinian, in §1.6 a discrete valuation ring) and T an R-module with continuous G_K-action. 𝓛₀ is
    the set of rational primes ℓ inert in K (prime to p and to the ramification of T), λ the prime
    of K above ℓ; I_ℓ is the smallest ideal of R containing ℓ + 1 for which Fr_λ acts trivially on
    T/I_ℓT; 𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kR}; G_ℓ = k_λ^×/k_ℓ^×; I_n = Σ_{ℓ | n} I_ℓ and G_n = ⊗_{ℓ | n}
    G_ℓ. The transverse condition at λ is defined by the maximal p-subextension of K[ℓ]_λ/K_λ, K[ℓ]
    the ring class field of conductor ℓ. A Selmer triple (T, F, 𝓛) has 𝓛 ⊆ 𝓛₀ disjoint from Σ(F);
    Kolyvagin systems κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛), satisfy the finite–singular
    relations at every ℓ with nℓ ∈ N(𝓛). Hypotheses: H.0 T is free of rank two. H.1 T̄ is absolutely
    irreducible. H.2 there is a Galois extension F/ℚ containing K with G_F acting trivially on T and
    H¹(F(μ_{p^∞})/K, T̄) = 0. H.3 F is cartesian on Quot(T) at every v ∈ Σ(F). H.4 there is a
    perfect symmetric R-bilinear pairing ( , ) : T × T → R(1) with (s^σ, t^{τστ^{-1}}) = (s, t)^σ,
    and F is its own exact orthogonal complement under the induced pairings H¹(K_v, T) × H¹(K_{v̄},
    T) → R. H.5 (a) the action of G_K on T̄ extends to G_ℚ and τ splits T̄ into one-dimensional
    eigenspaces T̄^±; (b) F on T̄ is stable under G_ℚ; (c) the residual pairing satisfies (s^τ, t^τ)
    = (s, t)^τ.

  Hypothesis. K imaginary quadratic

  Hypothesis. p odd

  * `TauCeti.KolyvaginSystems.SelfDual.Hypotheses` (structure): The record H.0–H.5, one field for
    each hypothesis, with the pairing of H.4 as data.

  * `TauCeti.KolyvaginSystems.SelfDual.inertPrimes` (data): 𝓛_k(T) for k ≥ 0 and the ideals I_ℓ ∋ ℓ
    + 1.

  * `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify` (functoriality): (T, F(n), 𝓛(n)) satisfies
    H.0–H.5 when (T, F, 𝓛) does.

  * `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange` (functoriality): H.0–H.5 are stable
    under R → R′.

  * `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing` (example): T_pE over an imaginary
    quadratic field with the pairing (s, t) = e(s, t^τ) satisfies H.4, given the local conditions of
    Howard's Theorem 1.6.5.

  * test `SelfDual.conductorIdeal_inert` (computation): For T = T_pE and ℓ inert in K with ℓ ∤ pN:
    Fr_λ = Fr_ℓ² has characteristic polynomial X² − (a_ℓ² − 2ℓ)X + ℓ², and I_ℓ = (ℓ + 1, a_ℓ).

  * test `SelfDual.rank_two_local` (compatibility): For ℓ ∈ 𝓛_k and R = ℤ/p^k, H¹_f(K_λ, T) and
    H¹_tr(K_λ, T) are free of rank two, in contrast with rank one at Mazur–Rubin's primes.

  * test `SelfDual.not_mr04` (non-example): An inert prime ℓ ∈ 𝓛_k is not in Mazur–Rubin's P_k for
    K: T/(Fr_λ − 1)T is free of rank two, not one.

  * test `SelfDual.hypotheses_field` (degenerate): For R a field H.3 is automatic.

  Acceptance. These hypotheses differ from Mazur–Rubin's by the self-duality H.4 and by the absence
    of an analogue of (H.4a)/(p > 4): they are a separate record.

  Acceptance. With H.4, χ-type invariants are replaced by the parity ε ∈ {0, 1} of
    ES.5/cassels-structure.

-/


/-

**`ES.5/cassels-structure`** (theorem): The generalised Cassels pairing and the structure R^ε ⊕ M ⊕ M.

  Statement. Let R be principal artinian of length k and (T, F, 𝓛) satisfy H.1, H.3 and H.4 (with
    vanishing residual invariants). (a) For positive integers s, t with s + t ≤ k there is a pairing
    ( , )_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R whose left and right kernels are the
    images of H¹_F(K, T/m^{s+t}T) and of π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t]).
    (b) There are an R-module M and ε ∈ {0, 1} with H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M. (c) Under H.0–H.5 with
    𝓛 ⊆ 𝓛_k, for n ∈ N(𝓛) write H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n); then ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^−
    (mod 2), where ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±, and ε is independent of n: if loc_ℓ(H̄(n)^±) ≠ 0
    then ρ(nℓ)^± = ρ(n)^± − 1, and otherwise ρ(nℓ)^± = ρ(n)^± + 1.

  Hypothesis. H.1, H.3, H.4; R principal artinian

  Hypothesis. H.0–H.5 and 𝓛 ⊆ 𝓛_k for (c)

  Acceptance. For T = E[p^k] with the classical structure: Sel_{p^k} ≅ (ℤ/p^k)^ε ⊕ M ⊕ M.

  Acceptance. Self-duality replaces the core rank: ε is a parity, not a rank difference.

-/


/-

**`ES.5/howard-stub`** (theorem): Stub Selmer modules in the self-dual setting.

  Statement. In the setting of cassels-structure(c) put λ(n) = length M(n) and the stub Selmer
    module S(n) = m^{λ(n)}H¹_{F(n)}(K, T). Then for nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0 implies loc_ℓ(S(nℓ))
    = 0. Moreover, with a, b, δ ≥ 0 the lengths in Howard's Lemma 1.5.8 for the diamond of H_ℓ(n) ⊆
    H(n), H(nℓ) ⊆ H^ℓ(n), one has λ(nℓ) = λ(n) + k − a − b − δ.

  Hypothesis. H.0–H.5, R principal artinian of length k, 𝓛 ⊆ 𝓛_k

  Acceptance. This is the self-dual replacement for ES.4/vertex-step(c) and Lemma 4.2.1 of
    Mazur–Rubin.

-/


/-

**`ES.5/howard-dvr-theorem`** (theorem): Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring.

  Statement. Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer
    triple satisfying H.0–H.5 with 𝓛_s(T) ⊆ 𝓛 for s large, and A = T ⊗ D with the propagated
    structure. If there is a Kolyvagin system κ ∈ KS(T, F, 𝓛) with κ_1 ≠ 0, then H¹_F(K, T) is free
    of rank one over R and there is a finite R-module M with H¹_F(K, A) ≅ D ⊕ M ⊕ M and length_R(M)
    ≤ length_R(H¹_F(K, T)/R·κ_1). The conclusion is about the discrete module A: its corank is one
    and its cotorsion quotient is M ⊕ M, so its length is twice that of M, bounded by twice the
    index of κ_1. This is the single owner of the self-dual descent used for Heegner points and for
    generalised Heegner cycles; the Λ-adic version (Howard, Theorem 2.2.10) belongs to layer ES.8.

  Hypothesis. H.0–H.5

  Hypothesis. 𝓛_s(T) ⊆ 𝓛 for s ≫ 0

  Hypothesis. κ_1 ≠ 0

  Acceptance. For T = T_pE and the Heegner point Kolyvagin system: Kolyvagin's theorem, rank one and
    #Ш[p^∞] dividing the square of the index (Howard, Theorem 1.6.5).

  Acceptance. Distinct from the Mazur–Rubin equality under primitivity: here the bound is an
    inequality for M with H¹_F(K, A)_{/div} = M ⊕ M, and the factor two comes from self-duality, not
    from a general principle.

-/


/-! ### Layer ES.6 -/


/-

**`ES.6/exterior-bidual`** (definition): The exterior bidual.

  Statement. For a commutative ring R, an R-module X and r ≥ 0, with X^* = Hom_R(X, R), the r-th
    exterior bidual is ⋂^r_R X = Hom_R(⋀^r_R(X^*), R). There is a canonical map ξ^r_X : ⋀^r_R X →
    ⋂^r_R X, x ↦ (Φ ↦ Φ(x)), where Φ ∈ ⋀^r(X^*) acts on ⋀^r X by φ₁ ∧ ⋯ ∧ φ_r ↦ (x₁ ∧ ⋯ ∧ x_r ↦
    det(φ_i(x_j))). ξ^r_X is neither injective nor surjective in general, and is an isomorphism when
    X is finitely generated projective. ⋂^1_R X = X^{**}, and ⋂^0_R X = R. For Φ ∈ ⋀^r(X^*) and r ≤
    s the contraction ⋂^s_R X → ⋂^{s−r}_R X is the R-dual of Ψ ↦ Φ ∧ Ψ, and it is compatible with
    the contraction ⋀^s X → ⋀^{s−r} X under ξ. For an order R in a semisimple algebra 𝒬 over the
    fraction field of a Dedekind domain and X finitely generated, ⋂^r_R X is identified with the
    lattice {a ∈ 𝒬 ⊗_R ⋀^r_R X : Φ(a) ∈ R for all Φ ∈ ⋀^r_R(X^*)} (Rubin's lattice).

  Hypothesis. R commutative

  * `TauCeti.ExteriorBidual.exteriorBidual` (constructor) [prototype above]: ⋂^r_R X := Module.Dual
    R (⋀[R]^r (Module.Dual R X)).

  * `TauCeti.ExteriorBidual.toBidual` (constructor) [prototype above]: ξ^r_X : ⋀[R]^r X →ₗ[R] ⋂^r_R
    X.

  * `TauCeti.ExteriorBidual.toBidual_ιMulti_ιMulti` (simp) [prototype above]: ξ(x₁ ∧ ⋯ ∧ x_r)(φ₁ ∧ ⋯
    ∧ φ_r) = det(φ_i(x_j)).

  * `TauCeti.ExteriorBidual.toBidual_bijective` (characterisation) [prototype above]: ξ^r_X is
    bijective for X finitely generated projective.

  * `TauCeti.ExteriorBidual.map` (functoriality) [prototype above]: A linear map f : X → Y induces
    ⋂^r f : ⋂^r X → ⋂^r Y (dual of ⋀^r of the transpose), with map_id and map_comp, compatible with
    ξ.

  * `TauCeti.ExteriorBidual.contract` (constructor): For Φ ∈ ⋀^r(X^*) and r ≤ s, the map ⋂^s X →
    ⋂^{s−r} X dual to Ψ ↦ Φ ∧ Ψ.

  * `TauCeti.ExteriorBidual.contract_toBidual` (compatibility): contract Φ ∘ ξ^s = ξ^{s−r} ∘
    (contraction by Φ on ⋀^s X).

  * `TauCeti.ExteriorBidual.one_equiv_bidual` (equivalence) [prototype above]: ⋂^1_R X ≃ X^{**}; in
    particular ⋂^1 X ≃ X for X reflexive.

  * `TauCeti.ExteriorBidual.equivLattice` (equivalence): For an order R in a semisimple 𝒬 and X
    finitely generated: ⋂^r_R X ≃ {a ∈ 𝒬 ⊗ ⋀^r X : Φ(a) ∈ R ∀ Φ}.

  * test `TauCeti.ExteriorBidual.free_rank` (computation) [prototype above]: ⋂^2_R(R³) is free of
    rank 3, and ξ is an isomorphism.

  * test `TauCeti.ExteriorBidual.trivial_module_group_ring` (computation): R = ℤ[C₂], X = ℤ² with
    trivial action: X^* ≅ ℤ² generated by e_i ↦ N (N = 1 + σ), ⋀²(X^*) ≅ ℤ, ⋂²X ≅ ℤ generated by Φ ↦
    N, and ξ(e₁ ∧ e₂) is the functional with value N² = 2N, twice the generator: the image of ξ has
    index 2.

  * test `TauCeti.ExteriorBidual.zero_power` (degenerate) [prototype above]: ⋂^0_R X = Hom_R(R, R) =
    R for every X.

  * test `TauCeti.ExteriorBidual.torsion_killed` (non-example) [prototype above]: R = ℤ_p, X = ℤ_p ⊕
    ℤ/p: ⋂^1 X = X^{**} = ℤ_p while ⋀^1 X = X; ξ is not injective, so the bidual is not the exterior
    power for modules with torsion.

  * test `TauCeti.ExteriorBidual.not_surjective` (non-example): In the group-ring example ξ is
    injective and not surjective: replacing ⋂² by ⋀² loses the element ½·e₁ ∧ e₂.

  Acceptance. ⋂^r_R R^n ≅ ⋀^r_R R^n, free of rank (n choose r).

  Acceptance. For R = ℤ[G], G finite, and X = ℤ^r with trivial action (r ≥ 1): ⋂^r_R X =
    |G|^{-(r−1)}·⋀^r_ℤ X inside ℚ ⊗ ⋀^r X; for r ≥ 2 and G ≠ 1 the exterior power is a proper
    sublattice of index |G|^{r−1}.

-/


/-

**`ES.6/bidual-functoriality`** (theorem): Injectivity, rank reduction and base change for exterior biduals.

  Statement. (a) If ι : X → Y is injective and Ext¹_R(coker ι, R) = 0, then ⋂^r X → ⋂^r Y is
    injective for all r. (b) If Y is free of rank r + s and Y → R^s → Z → 0 is exact with components
    φ₁, …, φ_s, then Fitt⁰_R(Z) is generated by the images im(F) of the elements F in the image of
    ⋀_{i} φ_i : ⋂^{r+s} Y → ⋂^r Y. (c) If R is self-injective and 0 → X → Y → R^s is exact with
    components φ_i, then im(⋀_i φ_i : ⋂^{r+s} Y → ⋂^r Y) ⊆ ⋂^r X, so ⋀φ_i induces ⋂^{r+s} Y → ⋂^r X.
    (d) (Rank reduction.) If R is self-injective and Y ⊆ X, then ⋂^r Y = {x ∈ ⋂^r X : Φ(x) ∈ ⋂^1 Y =
    Y for all Φ ∈ ⋀^{r−1}X^*}. (e) If R is self-injective and f : X → R, then ⋂^r ker(f) = ker(f :
    ⋂^r X → ⋂^{r−1} X). (f) For a surjection R → S of self-injective rings, a free R-module F of
    finite rank, an R-module X with a map X → F and an S-module Y with an injection Y ↪ F ⊗_R S, in
    a commutative square with X → Y and the projection π : F → F ⊗_R S, there is a natural map ⋂^r_R
    X → ⋂^r_S Y for r ≥ 1. Over a self-injective ring Hom_R(−, R) is exact and finitely generated
    modules are reflexive.

  Hypothesis. R commutative noetherian; all modules in the duality/reflexivity assertions finitely
    generated.

  Hypothesis. R self-injective (zero-dimensional Gorenstein) for (c)–(f).

  Hypothesis. r≥1 in (d),(e); in (c) r≥0 and s≥1, with contraction from degree r+s to degree r.

  Acceptance. For R = k a field these are standard facts about exterior powers.

  Acceptance. The transition maps of Stark systems are instances of (c).

-/


/-

**`ES.6/stark-systems`** (definition): Stark systems.

  Statement. (a) (Mazur–Rubin 2016; R principal artinian of length k, Selmer data (T, F, P, r) with
    I_q = 0 for q ∈ P.) For n ∈ N put W_n = ⊕_{q | n} Hom(H¹_tr(K_q, T), R), free of rank ν(n), and
    Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n. For m | n the square of H¹_{F^m} ⊆ H¹_{F^n} with
    the transverse localisations is cartesian and induces Ψ_{n,m} : Y_n → Y_m, with Ψ_{n′,n″} ∘
    Ψ_{n,n′} = Ψ_{n,n″}. SS_r(T) = SS_r(T, F, P) = lim_{n ∈ N} Y_n. For R a discrete valuation ring,
    SS_r(T) = lim_k SS_r(T/m^kT, P_k). (b) (Burns–Sakamoto–Sano; R self-injective local with finite
    residue field, A free of finite rank.) SS_r(A, F) = lim_{n ∈ N} ⋂^{r+ν(n)}_R H¹_{F^n}(K, A) with
    transition maps v_{m,n} = ⋀_{q | m/n} v_q, where v_q : H¹_{F^m}(K, A) → H¹_{/f}(K_q, A) ≅ R,
    signs chosen so that v_{m′,n} = v_{m,n} ∘ v_{m′,m}. For ε ∈ SS_r(A, F) and i ≥ 0, I_i(ε) =
    Σ_{ν(n) = i} im(ε_n) ⊆ R, each ε_n being a homomorphism ⋀^{r+ν(n)}H¹_{F^n}(K, A)^* → R. For a
    local Gorenstein order R and T free over R, SS_r(T, F) = lim_m SS_r(T/p^mT, F) and I_i(ε) =
    lim_m I_i(ε^{(m)}).

  Hypothesis. as in (a) or (b)

  * `TauCeti.StarkSystems.stalk` (constructor): Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n
    (Mazur–Rubin), and ⋂^{r+ν(n)} H¹_{F^n}(K, A) (Burns–Sakamoto–Sano).

  * `TauCeti.StarkSystems.transition` (constructor): Ψ_{n,m} : Y_n → Y_m for m | n, and v_{m,n} on
    biduals.

  * `TauCeti.StarkSystems.transition_comp` (functoriality): Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″} and
    Ψ_{n,n} = id.

  * `TauCeti.StarkSystems.StarkSystem` (structure) [prototype above]: SS_r = the submodule of ∏_n
    Y_n of families with Ψ_{n,m}(ε_n) = ε_m.

  * `TauCeti.StarkSystems.StarkSystem.ideal` (data): I_i(ε) = Σ_{ν(n)=i} im(ε_n), an ideal of R;
    I_∞(ε) = ⋃_i I_i(ε).

  * `TauCeti.StarkSystems.StarkSystem.eval_one` (projection): ε ↦ ε_1 ∈ ⋀^r H¹_F(K, T) (resp. ⋂^r
    H¹_F(K, A)).

  * test `TauCeti.StarkSystems.stalk_one` (degenerate): Y_1 = ⋀^r H¹_F(K, T) ⊗ R,
    and ⋀^0 W_1 = R.

  * test `TauCeti.StarkSystems.rank_one_core_vertex` (computation): If H¹_{(F^*)_n}(K, T^*) = 0 and
    r = χ(T), then H¹_{F^n}(K, T) is free of rank r + ν(n) and Y_n is free of rank one.

  * test `TauCeti.StarkSystems.transition_one_prime` (computation): For n = q, m = 1, r = 1 and
    H¹_{F^q} free with basis c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁ up
    to the sign convention, an element of H¹_F(K, T).

  * test `TauCeti.StarkSystems.not_product` (non-example): A family (ε_n) with ε_1 ≠ 0 and ε_q = 0
    for a prime q is not a Stark system unless Ψ_{q,1}(0) = ε_1, i.e. it is not one.

  Acceptance. For n = 1: Y_1 = ⋀^r H¹_F(K, T), and ε_1 is the leading term of the Stark system.

  Acceptance. The zero family is a Stark system.

-/


/-

**`ES.6/stark-structure`** (theorem): Freeness of Stark systems and control of the dual Selmer group.

  Statement. (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) SS_r(T) is free of rank one
    over R, and the image of SS_r(T) → Y_n is Y′_n = m^{length H¹_{(F^*)_n}(K, T^*)} Y_n; for R a
    discrete valuation ring with (H.1)–(H.6), SS_r(T, P) is free of rank one, generated by ε with
    nonzero image in SS_r(T/mT), and SS_r(T, P) → SS_r(T/m^k, P_k) is surjective. With φ_ε(n) =
    max{j : ε_n ∈ m^jY_n}, ∂φ_ε(i) = min{φ_ε(n) : ν(n) = i}, ord(ε) = min{ν(n) : ε_n ≠ 0} and d_ε(i)
    = ∂φ_ε(i) − ∂φ_ε(i + 1): for R a discrete valuation ring and ε ≠ 0, corank H¹_{F^*}(K, T^*) =
    ord(ε), H¹_{F^*}(K, T^*)/div ≅ ⊕_{i ≥ ord ε} R/m^{d_ε(i)}, ε is primitive iff ∂φ_ε(∞) = 0, and
    length H¹_{F^*}(K, T^*) ≤ ∂φ_ε(0) = max{s : ε_1 ∈ m^s ⋀^r H¹_F(K, T)} with equality iff ε is
    primitive. (b) (Burns–Sakamoto–Sano; Hypothesis 4.2.) For n with H¹_{(F^*)_n}(K, A^*(1)) = 0,
    SS_r(A, F) → ⋂^{r+ν(n)}H¹_{F^n}(K, A) is bijective, so SS_r(A, F) is free of rank one; for all ε
    and i: I_i(ε) ⊆ I_{i+1}(ε), I_∞(ε) = R iff ε is a basis, and I_i(ε) =
    I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*). For a local Gorenstein order under Hypothesis 4.7 and
    Hypothesis 4.2 of fixed rank r for (T/p^mT,F,P_m) at every m≥1, SS_r(T, F) is free of rank one
    with I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨). The regulator and the ideals commute with
    the admissible scalar reductions R → R/(p^m) and R → S of bidual-functoriality(f).

  Hypothesis. (H.1)–(H.7) of ES.0/hypotheses-mr2016 for (a)

  Hypothesis. Hypothesis 4.2 (finite level) and 4.7 plus 4.2 for every T/p^mT with the same r
    (orders) of ES.6/bss-hypotheses for (b)

  Acceptance. For r = 1 and R a discrete valuation ring this recovers ES.5/structure-theorem through
    the regulator isomorphism.

  Acceptance. Over a non-domain order the statement is an equality of ideals, not a valuation
    formula.

-/


/-

**`ES.6/bss-hypotheses`** (definition): The Burns–Sakamoto–Sano hypotheses.

  Statement. Let (R, 𝔭) be a self-injective local ring with finite residue field k of characteristic
    p, A a free R-module of finite rank with continuous G_K-action, M = min{p^n : p^nR = 0}, K_M =
    K(μ_M, (O_K^×)^{1/M})K(1) and K(A)_M = K(A)K_M. Hypothesis 3.2: (i) A ⊗ k is an irreducible
    k[G_K]-module; (ii) there is τ ∈ G_{K_M} with A/(τ − 1)A ≅ R; (iii) H¹(K(A)_M/K, A) =
    H¹(K(A)_M/K, A^*(1)) = 0. Hypothesis 3.3: (A ⊗ k)^{G_K} = ((A ⊗ k)^*(1))^{G_K} = 0. The prime
    set P is the set of q ∉ S with Fr_q conjugate to τ in Gal(K(A)_M/K). Hypothesis 4.2: there is n
    ∈ N with H¹_{(F^*)_n}(K, A^*(1)) = 0 and H¹_{F^n}(K, A) free of rank r + ν(n). For a local
    Gorenstein O-order R and T free over R with T̄ = T/𝔭T, Hypothesis 4.7: (i) T̄ is an irreducible
    (R/𝔭)[G_K]-module; (ii) there is τ ∈ G_{K_{p^∞}}, K_{p^∞} = ⋃_m K_{p^m}, with T/(τ − 1)T ≅ R
    (the source prints G_{K(T)_{p^∞}}, a misprint recorded as source issue E1); (iii)
    H¹(K(T)_{p^∞}/K, T̄) = H¹(K(T)_{p^∞}/K, T̄^∨(1)) = 0. Hypothesis 4.7 implies 3.2 and 3.3 for
    every T/p^mT. These are properties of (T, F), proved in each application; they do not follow
    from R being Gorenstein. The structure theorems for Kolyvagin systems additionally require p >
    3.

  Hypothesis. R self-injective local, or a local Gorenstein order

  * `TauCeti.StarkSystems.BSSHypothesis32` (structure): Fields irreducible, tau, h1Vanishing.

  * `TauCeti.StarkSystems.BSSHypothesis33` (structure): Vanishing of the residual invariants of A
    and A^*(1).

  * `TauCeti.StarkSystems.BSSHypothesis42` (structure): A vertex n with vanishing strict dual Selmer
    module and H¹_{F^n} free of rank r + ν(n).

  * `TauCeti.StarkSystems.BSSHypothesis47` (structure): The three conditions for a Gorenstein order.

  * `TauCeti.StarkSystems.BSSHypothesis47.toFiniteLevel` (functoriality): Hypothesis 4.7 for T gives
    3.2 and 3.3 for T/p^mT for every m ≥ 1.

  * `TauCeti.StarkSystems.BSSHypothesis42.free_of_core` (characterisation): Under 4.2, H¹_{F^m}(K,
    A) is free of rank r + ν(m) whenever H¹_{(F^*)_m}(K, A^*(1)) = 0.

  * test `TauCeti.StarkSystems.bss32_of_mr16` (compatibility): For R principal artinian, (H.1)–(H.3)
    of ES.0/hypotheses-mr2016 give Hypotheses 3.2 and 3.3 with the same τ.

  * test `TauCeti.StarkSystems.bss42_rank_one_field` (computation): For R = k and χ(A) = r: any core
    vertex n has dim H¹_{F^n}(K, A) = r + ν(n), so 4.2 holds.

  * test `TauCeti.StarkSystems.not_bss33_trivial` (non-example): A = R with trivial action: (A ⊗
    k)^{G_K} = k ≠ 0, so Hypothesis 3.3 fails for every self-injective R.

  * test `TauCeti.StarkSystems.bss47_rank_one` (degenerate): If rank_R T = 1 then 4.7(i) holds and
    4.7(ii) holds with τ = 1.

  Acceptance. Satisfied by A = (ℤ/p^m)(1) ⊗ χ^{-1} ⊗ ℤ_p[Gal(F/K)] under the hypotheses of Theorem
    7.1.

  Acceptance. Not implied by the ring-theoretic hypotheses: for A with trivial residual
    representation 3.3 fails over every R.

-/


/-

**`ES.6/kolyvagin-systems-rank-r`** (definition): Kolyvagin systems of rank r and the regulator map.

  Statement. (a) (Mazur–Rubin 2016.) The rank-r Selmer sheaf on X(P) has stalks S(n) = ⋀^r
    H¹_{F(n)}(K, T/I_nT) ⊗ G_n, edge modules S(e) = H¹_tr(K_q, T/I_{nq}T) ⊗ ⋀^{r−1}H¹_{F_q(n)}(K,
    T/I_{nq}T) ⊗ G_{nq} for e = {n, nq}, and vertex-to-edge maps the contractions against loc^f_q
    (finite projection followed by φ^fs_q) from n and against loc^tr_q from nq. KS_r(T, F, P) =
    Γ(S); for r = 1 this is ES.3/kolyvagin-system-module. The stub subsheaf has S′(n) =
    m^{λ(n)}S(n), λ(n) = length H¹_{F(n)^*}(K, T^*), and KS′_r(T) = Γ(S′). (b)
    (Burns–Sakamoto–Sano.) KS_r(A, F) is the module of families κ_n ∈ ⋂^r_R H¹_{F(n)}(K, A) ⊗ G_n
    with v_q(κ_n) = φ^fs_q(κ_{n/q}) in ⋂^{r−1}_R H¹_{F_q(n/q)}(K, A) ⊗ G_n for q | n; with
    generators of the G_q fixed, I_i(κ) = Σ_{ν(n)=i} im(κ_n). For a Gorenstein order, KS_r(T, F) =
    lim_m KS_r(T/p^mT, F). (c) The regulator: Reg_r : SS_r(A, F) → KS_r(A, F), ε ↦ (⋀_{q | n} φ^fs_q
    (ε_n))_n; in Mazur–Rubin's setting Π : SS_r(T) → KS′_r(T), ε ↦ ((−1)^{ν(n)}Π_n(ε_n))_n.

  Hypothesis. as in ES.6/stark-systems

  * `TauCeti.StarkSystems.KolyvaginSystemRank` (structure): KS_r(T, F, P) = Γ of the rank-r Selmer
    sheaf; KS_r(A, F) in biduals.

  * `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv` (equivalence): KS_1(T, F, P) ≃ KS(T,
    F, P).

  * `TauCeti.StarkSystems.KolyvaginSystemRank.stub` (constructor): KS′_r(T) ≤ KS_r(T), sections of
    the stub subsheaf.

  * `TauCeti.StarkSystems.regulator` (constructor): Reg_r : SS_r → KS_r, R-linear.

  * `TauCeti.StarkSystems.regulator_eval_one` (simp): Reg_r(ε)_1 = ε_1.

  * `TauCeti.StarkSystems.KolyvaginSystemRank.ideal` (data): I_i(κ) = Σ_{ν(n)=i} im(κ_n).

  * test `TauCeti.StarkSystems.regulator_zero` (degenerate): Reg_r(0) = 0.

  * test `TauCeti.StarkSystems.kolyvaginSystemRank_one` (compatibility): For r = 1 the edge module
    is H¹_tr(K_q, T/I_{nq}T) ⊗ G_{nq} ≅ H¹_s ⊗ G_{nq} and the relation is (5) of Mazur–Rubin 2004.

  * test `TauCeti.StarkSystems.regulator_one_prime` (computation): For n = q: Reg_r(ε)_q =
    φ^fs_q(ε_q) ∈ ⋂^r H¹_{F(q)}(K, A) ⊗ G_q, and v_q(Reg_r(ε)_q) = φ^fs_q(ε_1).

  * test `TauCeti.StarkSystems.stub_ne_all` (non-example): For χ(T)>1 over a field, the rank-one
    module KS_1(T) is infinite-dimensional whereas the stub module KS′_χ(T)(T) is one-dimensional.
    They concern different exterior ranks; this is a comparison of two modules, not a claim that the
    latter is a proper submodule of the former. A same-rank strict-inclusion non-example needs a
    separate calculation.

  Acceptance. For r = 1: KS_1 = KS and Reg_1(ε)_1 = ε_1.

  Acceptance. Reg_r commutes with R → R/(p^m) and with restriction of P.

-/


/-

**`ES.6/regulator-isomorphism`** (theorem): The regulator isomorphism and structure of Kolyvagin systems of rank r.

  Statement. (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) There are core vertices; any
    two are joined by a path through core vertices along which all vertex-to-edge maps are
    isomorphisms; S′ is locally cyclic with every core vertex a hub and trivial monodromy; KS′_r(T)
    is free of rank one and κ ↦ κ_n is an isomorphism onto S′(n) at core vertices; Π : SS_r(T) →
    KS′_r(T) is an isomorphism. For R a discrete valuation ring ((H.1)–(H.6)), KS′_r(T, P) ≅ lim_k
    KS′_r(T/m^k, P_k) is free of rank one, and for 0 ≠ κ ∈ KS′_r(T) the conclusions of
    ES.6/stark-structure(a) hold with ε replaced by κ; in particular length H¹_{F^*}(K, T^*) ≤ max{s
    : κ_1 ∈ m^s ⋀^r H¹_F(K, T)}, with equality iff κ is primitive. (b) (Burns–Sakamoto–Sano;
    Hypotheses 3.2, 3.3, 4.2 and p > 3.) Reg_r : SS_r(A, F) → KS_r(A, F) is an isomorphism, so
    KS_r(A, F) is free of rank one; for κ ∈ KS_r(A, F) and n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K,
    A^*(1))^*), with equality if κ is a basis; and I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*), with
    equality if R is a principal ideal ring and κ is a basis. The same holds over a local Gorenstein
    order under Hypothesis 4.7, Hypothesis 4.2 of fixed rank r for every (T/p^mT,F,P_m), and p > 3
    for KS_r(T, F) and H¹_{F^*}(K, T^∨(1))^∨. The restriction p > 3 is part of the statements for
    Kolyvagin systems; it is not needed for Stark systems.

  Hypothesis. as stated; p > 3 in (b)

  Acceptance. For r = 1 over a discrete valuation ring: KS(T) free of rank one, as in
    ES.5/rank-one-module-theorem.

  Acceptance. Over a non-principal Gorenstein ring only the inclusion I_i(κ) ⊆ Fitt^i is asserted
    for i > 0.

-/


/-

**`ES.6/rubin-lattice`** (definition): T-modified S-units, the order map and Rubin's lattice.

  Statement. Let H/F be a finite abelian extension of number fields with group G, S ⊇ S_∞ ∪ S_ram
    and T finite sets of places with S ∩ T = ∅ and the T-modified units torsion-free, and v₁, …, v_r
    finite primes of F splitting completely in H with chosen primes w_j of H above v_j. In the
    normalisation of Dasgupta–Kakde §1.2, U_{S,T} = {u ∈ H_T^* : |u|_w = 1 for all finite primes w
    not above the v_j}, where H_T^* is the group of elements congruent to 1 modulo every prime above
    T, and ℚU_{S,T} = U_{S,T} ⊗ ℚ. The order map ord_G : ⋀^r_{ℚ[G]} ℚU_{S,T}^− → ℚ[G]^− is the
    ℚ[G]-linear map with ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_{σ ∈ G} [σ^{-1}] ord_{w_j}(σ(u_i)))_{i,j}; it
    is an isomorphism of ℚ[G]-modules. Rubin's lattice is 𝓛 = (⋀^r_{ℚ[G]} ℚU_{S,T}^−) ∩ ⋂^r_{ℤ[G]}
    U_{S,T}, where ⋂^r_{ℤ[G]} U_{S,T} is the set of u ∈ ⋀^r_{ℚ[G]} ℚU_{S,T} with φ(u) ∈ ℤ[G] for all
    φ₁, …, φ_r ∈ Hom_{ℤ[G]}(U_{S,T}, ℤ[G]), φ(u₁ ∧ ⋯ ∧ u_r) = det(φ_i(u_j)).

  Hypothesis. H/F abelian with H a CM field and F totally real for the minus parts

  Hypothesis. the v_j split completely in H

  * `TauCeti.RubinStark.modifiedUnits` (constructor): U_{S,T} as a ℤ[G]-module.

  * `TauCeti.RubinStark.ordG` (constructor): ord_G : ⋀^r_{ℚ[G]} ℚU_{S,T}^− → ℚ[G]^−.

  * `TauCeti.RubinStark.ordG_ιMulti` (simp): ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_σ [σ^{-1}]·ord_{w_j}(σ
    u_i)).

  * `TauCeti.RubinStark.ordG_bijective` (characterisation): ord_G is an isomorphism of ℚ[G]-modules.

  * `TauCeti.RubinStark.rubinLattice` (constructor): 𝓛 = (⋀^r ℚU^−) ⊓ ⋂^r_{ℤ[G]} U_{S,T}.

  * `TauCeti.RubinStark.rubinLattice_rank_one` (example): For r = 1, 𝓛 = U_{S,T}^−.

  * test `TauCeti.RubinStark.ordG_change_w` (characterisation): Replacing w_j by g·w_j multiplies
    ord_G by [g]^{±1} ∈ G (a unit of ℚ[G]); so 𝓛-membership statements do not depend on the w_j.

  * test `TauCeti.RubinStark.rubinLattice_trivial_group` (degenerate): For G = 1: ⋂^r_ℤ U = ⋀^r_ℤ U
    for U free, and 𝓛 = ⋀^r_ℤ U^−.

  * test `TauCeti.RubinStark.rubinLattice_ne_exteriorPower` (non-example): Algebraic minus-part
    test: let G=C₂=⟨σ⟩ act by −1 on X=ℤ². Then Hom_{ℤ[G]}(X,ℤ[G]) has values in ℤ(1−σ), and
    (1−σ)²=2(1−σ). Thus the determinant-integrality lattice in ⋀²_{ℚ[G]}ℚX is (1/2)⋀²_ℤX, strictly
    larger than the exterior-power image. This tests the minus-part normalization without claiming X
    is a specific arithmetic unit lattice.

  Acceptance. For r = 1, 𝓛 = U_{S,T}^− (U_{S,T} is reflexive), and membership of the element is the
    Brumer–Stark statement.

  Acceptance. For r ≥ 2 the lattice 𝓛 is in general strictly larger than the image of ⋀^r_{ℤ[G]}
    U_{S,T}^−.

-/


/-! ### Layer ES.7 -/


/-

**`ES.7/higher-rank-euler-systems`** (definition): Euler systems of rank r.

  Statement. Let R be a semilocal Gorenstein O-order in a finite-dimensional semisimple commutative
    algebra over a finite extension of ℚ_p, T a free R-module of finite rank with continuous
    R-linear G_K-action, S ⊇ S_∞ ∪ S_p ∪ S_ram(T) finite, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) for
    q ∉ S, 𝒦/K an abelian pro-p extension in which all archimedean places split completely, Ω(𝒦/K)
    the set of finite subextensions, S(F) = S ∪ S_ram(F/K) and 𝒢_F = Gal(F/K). Hypothesis 6.1: (i)
    H¹(O_{F,S(F)}, T) is a reflexive R[𝒢_F]-module for every F (equivalently free over O); (ii)
    H⁰(F, T) = 0 for every F. An Euler system of rank r for (T, 𝒦) is a family c_F ∈ ⋂^r_{R[𝒢_F]}
    H¹(O_{F,S(F)}, T), F ∈ Ω(𝒦/K), with Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1})) c_F
    in ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F′)}, T) for F ⊆ F′. ES_r(T, 𝒦) is the R[[Gal(𝒦/K)]]-module of such
    families. Hypothesis 6.7: 𝒦 contains K(q) for every q ∉ S and a ℤ_p^d-extension of K in which no
    finite place splits completely. For r = 1 on the common towers satisfying Hypothesis 6.7, under
    Hypothesis 6.1(i) and the universal-norm/unramified comparison, ⋂^1 H¹ = H¹ and ES_1(T, 𝒦) is
    ES.2/euler-system-module with coefficients R.

  Hypothesis. R a semilocal Gorenstein order

  Hypothesis. Hypothesis 6.1 for the comparison with rank one

  * `TauCeti.EulerSystems.HigherEulerSystem` (structure): ES_r(T, 𝒦) ≤ ∏_F ⋂^r_{R[𝒢_F]}
    H¹(O_{F,S(F)}, T), cut out by the corestriction relations.

  * `TauCeti.EulerSystems.HigherEulerSystem.eval` (projection): c ↦ c_F.

  * `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv` (equivalence): On common towers
    satisfying 6.7, under 6.1 and the universal-norm/unramified comparison, ES_1(T,𝒦)≃ES(T,𝒦,N),
    with N containing the finite primes of S. The comparison includes the transport from
    S(F)-ramified cohomology to global H¹ and the coefficient/Euler-polynomial dictionaries.

  * `TauCeti.EulerSystems.BSSHypothesis61` (structure): Reflexivity of H¹(O_{F,S(F)}, T) over R[𝒢_F]
    and H⁰(F, T) = 0, for all F.

  * `TauCeti.EulerSystems.BSSHypothesis61.iff_free` (characterisation): 6.1(i) holds iff every
    H¹(O_{F,S(F)}, T) is free over O.

  * `TauCeti.EulerSystems.HigherEulerSystem.cor_eval` (relation): Cor_{F′/F}(c_{F′}) = (∏_{q ∈
    S(F′)∖S(F)} P_q(Fr_q^{-1}))·c_F.

  * test `TauCeti.EulerSystems.HigherEulerSystem.zero_mem` (degenerate): The zero family is in
    ES_r(T, 𝒦).

  * test `TauCeti.EulerSystems.HigherEulerSystem.rank_one` (compatibility): For r = 1, R = O and
    Hypothesis 6.1: the relation is Rubin's, with P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) =
    P(Fr_q^{-1} | T^*; x) in Rubin's notation.

  * test `TauCeti.EulerSystems.not_BSSHypothesis61_mu_p` (non-example): For T = ℤ_p(1) and F ⊇ μ_p,
    H¹(O_{F,S(F)}, T) ⊇ μ_{p^∞}(F) has torsion, so Hypothesis 6.1(i) fails: reflexivity is not
    automatic.

  Acceptance. For R = O = ℤ_p, T = ℤ_p(1): Hypothesis 6.1(i) says the p-completion of O_{F,S(F)}^×
    is torsion-free for all F.

  Acceptance. The zero family is an Euler system of rank r.

-/


/-

**`ES.7/higher-kolyvagin-derivative`** (construction): The higher Kolyvagin derivative.

  Statement. Assume Hypotheses 6.1, 6.7 and 6.11 (Fr_q^{p^k} − 1 is injective on T for every q ∈ P
    and k ≥ 0). Fix a power M of p, a field E ∈ Ω(𝒦/K) unramified outside S with K(1) ⊆ E, and put
    R̄ = R/(M), ℛ = R̄[Gal(E/K)], A = Ind_{G_E}^{G_K}(T/MT), a free ℛ-module. For n ∈ N let E(n) =
    E·K(n), H_n = Gal(E(n)/E), B=T/MT (uninduced), c_n=c_{E(n)}, and c̄_n its image in
    ⋂^r_{R̄[Gal(E(n)/K)]} H¹(O_{E(n),S_n},B). The reduction is the map (9) of §6.3. The full Galois
    group ring is used; no splitting Gal(E(n)/K)≃Gal(E/K)×H_n is assumed. H_n-invariant descent
    identifies the resulting class with ⋂^r_ℛ H¹(O_{E,S_n},B), then with ⋂^r_ℛ H¹(O_{K,S_n},A) by
    Shapiro. Then D_n·c̄_n is H_n-invariant and defines the Kolyvagin derivative κ′(c_n) = D_n·c̄_n
    ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). With 𝓘_n the augmentation ideal of ℤ[H_n] and G_n ≅ ⟨∏_{q | n}(σ_q −
    1)⟩ ⊆ 𝓘_n^{ν(n)}/𝓘_n^{ν(n)+1}, write P_q^m for the image of P_q(Fr_q^{-1}) in R̄⊗𝓘_m/𝓘_m² when
    q∤m. For m=q₁⋯q_t define Δ_m=det(B_m), where (B_m)_{ij}=0 if i=j and P_{q_j}^{q_i} otherwise;
    put Δ_1=1 (empty determinant) and Δ_q=0. Define κ(c)_n=Σ_{d|n}(κ′(c_d)⊗∏_{q|d}(σ_q−1))Δ_{n/d},
    transporting κ′(c_d) to S_n and multiplying the disjoint augmentation factors. This is the
    explicit correction formula of §6.4, p.41; and Theorem: κ(c)_n ∈ ⋂^r_ℛ H¹_{F_can(n)}(K, A) ⊗
    ⟨∏_{q | n}(σ_q − 1)⟩ and v_q(κ(c)_n) = φ^fs_q(κ(c)_{n/q}) for every q | n; so κ(c) ∈ KS_r(A,
    F_can). For a subfield F of E/K and A_F = Ind_{G_F}^{G_K}(T/MT) this gives the canonical
    homomorphism D_r = D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can), independent of E and of the generators
    σ_q, with D_r(c)_1 = c_F (mod M).

  Hypothesis. Hypotheses 6.1, 6.7, 6.11

  Hypothesis. M a power of p

  * `TauCeti.EulerSystems.rawHigherDerivative` (constructor): κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ
    H¹(O_{K,S_n}, A).

  * `TauCeti.EulerSystems.higherDerivative` (constructor): D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can).

  * `TauCeti.EulerSystems.higherDerivative_one` (characterisation): D_r(c)_1 = c_F modulo M, under
    ⋂^r_{R[𝒢_F]} H¹(O_{F,S}, T/M) ≅ ⋂^r_{R̄[𝒢_F]} H¹(O_{K,S}, A_F).

  * `TauCeti.EulerSystems.higherDerivative_singular` (relation): v_q(D_r(c)_n) =
    φ^fs_q(D_r(c)_{n/q}) for q | n.

  * `TauCeti.EulerSystems.higherDerivative_indep` (compatibility): D_r^F does not depend on the
    auxiliary field E nor on the generators σ_q.

  * `TauCeti.EulerSystems.higherDerivative_rank_one` (compatibility): For r = 1 and K = ℚ the map
    agrees with eulerToKolyvagin modulo M after the Euler-factor dictionary.

  * test `TauCeti.EulerSystems.higherDerivative_zero` (degenerate): D_r(0) = 0.

  * test `TauCeti.EulerSystems.rawHigherDerivative_one` (computation): For n = 1: κ′(c_1) = c̄_E,
    the image of c_E.

  * test `TauCeti.EulerSystems.higherDerivative_needs_611` (non-example): For T=O with trivial
    action, Fr_q−1=0 is not injective and 6.11 fails (6.1(ii) also fails). The determinant
    expression still exists as an expression in the raw classes; Theorem 6.12 cannot be invoked to
    prove the local Kolyvagin relations. In particular its zero expression is well-defined.

  * test `TauCeti.EulerSystems.higherDerivative_one_prime` (computation): For n = q: κ(c)_q =
    κ′(c_q) ⊗ (σ_q − 1), with singular part φ^fs_q(c_F mod M) at q.

  * test `TauCeti.EulerSystems.higherDerivative_two_primes` (computation): For n=q₁q₂,
    Δ_n=−P_{q₂}^{q₁}P_{q₁}^{q₂} and Δ_{q_i}=0. Hence
    κ(c)_n=κ′(c_n)⊗(σ_{q₁}−1)(σ_{q₂}−1)−κ′(c_1)⊗P_{q₂}^{q₁}P_{q₁}^{q₂}. This detects both the sign
    and the missing rank-r correction.

  Acceptance. For r = 1, K = ℚ, R = O, E = ℚ: D_1 is the map of ES.3/euler-to-kolyvagin reduced
    modulo M, after the dictionary P_q(Fr_q^{-1}) between the conventions
    (ES.2/euler-factor-change).

  Acceptance. D_r is R[[Gal(𝒦/K)]]-semilinear through Gal(𝒦/K) → Gal(F/K).

-/


/-

**`ES.7/fitting-bounds`** (theorem): Fitting-ideal control from higher-rank Euler systems.

  Statement. Let p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F a subfield of E/K and A_F =
    Ind_{G_F}^{G_K}(T/MT). Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for A_F and
    F_can, and let κ(c) = D_r^F(c). Then (i) for n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K,
    A_F^*(1))^*); in particular im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*); (ii) for every i
    ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*). In (i), equality holds whenever κ(c)
    is a basis of KS_r, without a principal-ring assumption. For the higher I_i in (ii), equality
    for a basis is asserted when R̄[𝒢_F] is a principal ideal ring. These are containments of ideals
    of the group ring R̄[𝒢_F], which is not a domain: they are not valuation formulas and do not
    reduce to orders of underlying groups.

  Hypothesis. p > 3

  Hypothesis. Hypotheses 6.1, 6.7, 6.11; 3.2, 3.3, 4.2 for A_F

  Acceptance. For the Rubin–Stark setting (Theorem 7.1): im(η^χ_{L/K,S}) ⊆ Fitt⁰_O((ℤ_p ⊗
    Cl(O_L))^χ), conditionally on the Rubin–Stark conjecture.

  Acceptance. For r = 1 over a discrete valuation ring this is the bound of ES.4/kolyvagin-bound in
    Fitting-ideal form.

-/


/-

**`ES.7/rubin-brumer-stark`** (construction): The Rubin–Brumer–Stark element and Rubin's conjecture.

  Statement. In the setting of ES.6/rubin-lattice let Θ_{S,T} ∈ ℚ[G]^− be the Stickelberger element
    for S ⊇ S_∞ ∪ S_ram and T. The Rubin–Brumer–Stark element is the unique u_RBS ∈ ⋀^r_{ℚ[G]}
    ℚU_{S,T}^− with ord_G(u_RBS) = Θ_{S,T}. It depends on the choice of the w_j only up to
    multiplication by an element of G. Rubin's conjecture is the proposition u_RBS ∈ 𝓛; its validity
    is independent of the w_j. It is stated here as a proposition and is a hypothesis of any
    application of the higher-rank machinery to these elements: a conjectural Rubin–Stark element is
    an Euler system of rank r only once its integrality (membership in the bidual lattices) and its
    norm relations along Ω(𝒦/K) are proved. The prime-to-2 part of the conjecture is a theorem of
    Dasgupta–Kakde, owned by IntegralIwasawaTheory I.7.

  Hypothesis. as in ES.6/rubin-lattice

  Hypothesis. Θ_{S,T} ∈ ℚ[G]^− defined by the partial zeta values at 0

  * `TauCeti.RubinStark.rubinBrumerStark` (constructor): u_RBS = ord_G⁻¹(Θ_{S,T}).

  * `TauCeti.RubinStark.ordG_rubinBrumerStark` (simp): ord_G(u_RBS) = Θ_{S,T}.

  * `TauCeti.RubinStark.rubinBrumerStark_change_w` (relation): For another choice of the w_j, u_RBS
    changes by multiplication by an element of G.

  * `TauCeti.RubinStark.RubinConjecture` (structure): The proposition u_RBS ∈ 𝓛, with no instance
    provided.

  * `TauCeti.RubinStark.rubinConjecture_indep` (characterisation): RubinConjecture does not depend
    on the choice of the w_j.

  * test `TauCeti.RubinStark.rubinBrumerStark_rank_one` (compatibility): For r = 1, u_RBS is the
    element of ℚU_{S,T}^− with Σ_σ [σ^{-1}] ord_w(σu) = Θ_{S,T}: the Brumer–Stark unit, and
    RubinConjecture is u ∈ U_{S,T}.

  * test `TauCeti.RubinStark.rubinBrumerStark_zero` (degenerate): If Θ_{S,T} = 0 then u_RBS = 0 and
    RubinConjecture holds trivially.

  * test `TauCeti.RubinStark.rubinConjecture_not_exteriorPower` (non-example): RubinConjecture is
    not the statement u_RBS ∈ image of ⋀^r_{ℤ[G]} U_{S,T}^−: exterior-bidual integrality can be
    weaker when r≥2. Use the explicit minus-part lattice computation of rubin-lattice as an
    algebraic witness; strictness is not asserted for every arithmetic unit lattice.

  Acceptance. For r = 1: u_RBS is the Brumer–Stark unit and Rubin's conjecture is the Brumer–Stark
    conjecture.

  Acceptance. Conditional application: Burns–Sakamoto–Sano II, Theorem 7.1(iii) assumes the
    Rubin–Stark conjecture for LF/K for each F.

-/


/-

**`ES.7/rank-one-comparison`** (comparison): Rank-one specialisation of the higher-rank theory.

  Statement. On common admissible towers satisfying 6.7, under Hypothesis 6.1 and the
    universal-norm/unramified comparison, ES_1(T, 𝒦) is the module of ES.2/euler-system-module with
    coefficients R, with the dictionary P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = Rubin's P(Fr_q^{-1}
    | T^*; x); KS_1(A, F) is ES.3/kolyvagin-system-module for A; D_1 is the map of
    ES.3/euler-to-kolyvagin modulo M (over ℚ) and supplies that map over a general number field K
    under Hypotheses 6.1, 6.7 and 6.11; and for R a discrete valuation ring the bound I_0(κ) ⊆ Fitt⁰
    is length H¹_{F^*} ≤ ∂^{(0)}(κ) of ES.4/kolyvagin-bound. The conventions differ in two places,
    both explicit: the Euler factor (ES.2/euler-polynomial) and the identification G_q ≅ ⟨σ_q − 1⟩ ⊆
    𝓘/𝓘² (Mazur–Rubin's ρ_q).

  Hypothesis. Hypotheses 6.1 and 6.7 on a common tower, plus the cohomology/unramified and
    coefficient dictionaries.

  Hypothesis. Hypothesis 6.11 for the derivative comparison; rank-one admissibility and a DVR for
    the length/Fitting comparison.

  Acceptance. For T = ℤ_p(1) ⊗ χ^{-1} over ℚ both constructions give the cyclotomic-unit Kolyvagin
    system modulo M.

-/

end FiniteLevelPrototype

section IwasawaPrototype

noncomputable section

open scoped TensorProduct

namespace TauCeti

/-! ## Stand-ins for the Iwasawa-algebra supplier (PadicMeasuresIwasawaAlgebras L4) -/

namespace EulerSystem

section Supplier

variable (Λ : Type*) [CommRing Λ]

/-- Rubin's pseudo-null modules (*Euler systems*, Chapter II §3): annihilated by an ideal of
height at least two. For `Λ = O⟦ℤ_p^d⟧` with `d ≥ 2` such modules need not be finite. -/
def IsPseudoNull (M : Type*) [AddCommGroup M] [Module Λ M] : Prop :=
  ∃ I : Ideal Λ, 2 ≤ I.height ∧ ∀ a ∈ I, ∀ m : M, a • m = 0

/-- A pseudo-isomorphism: a Λ-linear map with pseudo-null kernel and cokernel. -/
def IsPseudoIso {M N : Type*} [AddCommGroup M] [Module Λ M] [AddCommGroup N] [Module Λ N]
    (f : M →ₗ[Λ] N) : Prop :=
  IsPseudoNull Λ (LinearMap.ker f) ∧ IsPseudoNull Λ (N ⧸ LinearMap.range f)

/-- Stand-in for `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
(`TauCeti.Iwasawa.charIdeal`): the characteristic ideal of a finitely generated module, with
Rubin's convention that it is `0` for a non-torsion module. -/
def charIdeal (M : Type*) [AddCommGroup M] [Module Λ M] : Ideal Λ := sorry

end Supplier

/-! ## `ES.8/admissible-zp-d-extension` -/

section Tower

variable (p : ℕ) [Fact p.Prime] (P : Type*)

/-- **`ES.8/admissible-zp-d-extension`** (prototype carrier). A `ℤ_p^d`-extension `K∞/K`, recorded
through `Γ ≅ ℤ_p^d` (written additively as `Fin d → ℤ_[p]`) and, for each finite prime `v ∈ P`
of `K`, its decomposition and inertia subgroups. The Galois-theoretic structure (an abelian
extension `K∞ ⊂ K̄` with a topological isomorphism `Gal(K∞/K) ≅ ℤ_p^d`) replaces this carrier. -/
structure ZpdExtension where
  /-- the rank `d ≥ 1` -/
  d : ℕ
  one_le_d : 1 ≤ d
  /-- the decomposition group `D_v ⊂ Γ` -/
  decomp : P → AddSubgroup (Fin d → ℤ_[p])
  /-- the inertia group `I_v ⊂ D_v` -/
  inertia : P → AddSubgroup (Fin d → ℤ_[p])
  inertia_le_decomp : ∀ v, inertia v ≤ decomp v

namespace ZpdExtension

variable {p P}

/-- No finite prime splits completely in `K∞/K`. -/
def NoSplitPrimes (E : ZpdExtension p P) : Prop :=
  ∀ v, E.decomp v ≠ ⊥

/-- `NoSplitPrimes ↔` every decomposition group is infinite (`ℤ_p^d` has no nonzero finite
subgroups; Rubin, Remark II.1.2). -/
theorem noSplitPrimes_iff_infinite_decompositionGroup (E : ZpdExtension p P) :
    E.NoSplitPrimes ↔ ∀ v, Infinite (E.decomp v) := sorry

/-- If `K∞ ⊂ K∞'` and the projection `Γ' ↠ Γ` maps `D'_v` onto `D_v`, admissibility of `K∞/K`
gives admissibility of `K∞'/K`. -/
theorem noSplitPrimes_mono (E E' : ZpdExtension p P)
    (π : (Fin E'.d → ℤ_[p]) →+ (Fin E.d → ℤ_[p]))
    (hπ : ∀ v, (E'.decomp v).map π = E.decomp v) (h : E.NoSplitPrimes) :
    E'.NoSplitPrimes := sorry

/-- The Iwasawa algebra `Λ = O[[Γ]] ≅ O⟦T₁, …, T_d⟧`; a stand-in for the completed group ring of
`PadicMeasuresIwasawaAlgebras` L1, through Mathlib's `MvPowerSeries`. -/
abbrev iwasawaAlgebra (O : Type*) [CommRing O] (E : ZpdExtension p P) : Type _ :=
  MvPowerSeries (Fin E.d) O

/-- The finite layers `F` correspond to the open subgroups `U ⊂ Γ`, of `p`-power index. -/
theorem layer_finite (E : ZpdExtension p P) (U : AddSubgroup (Fin E.d → ℤ_[p]))
    (hU : IsOpen (U : Set (Fin E.d → ℤ_[p]))) : ∃ n : ℕ, U.index = p ^ n := sorry

/- Suggested signatures awaiting the arithmetic carrier (number field `K`, the Galois group of
`K∞/K`, its primes):
* `TauCeti.EulerSystem.ZpdExtension.unramified_of_not_dvd_p : ¬ v ∣ p → E.inertia v = ⊥`
* `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_of_cyclotomic_le :
    K^cyc ≤ K∞ → E.NoSplitPrimes` (the cyclotomic tower from `IsCyclotomicExtension`)
* test `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes`: `Q∞/Q` is admissible
  (see the `example` on the Frobenius of `ℓ` below)
* test `TauCeti.EulerSystem.ZpdExtension.anticyclotomic_not_noSplitPrimes`: for `K = ℚ(√-7)`,
  `p = 3`, the prime `5` splits completely in the anticyclotomic `ℤ_3`-extension. -/

/-- Test `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes` (arithmetic core): the
Frobenius of `ℓ ≠ p` acts on `μ_{p^∞}` by `ℓ ∈ ℤ_p^×`, which has infinite order. -/
example (ℓ : ℕ) (hℓ : 1 < ℓ) (n : ℕ) (hn : 0 < n) : ((ℓ : ℤ_[p]) ^ n) ≠ 1 := sorry

/-- Test `TauCeti.EulerSystem.ZpdExtension.split_iff_decompositionGroup_trivial`. -/
example (E : ZpdExtension p P) (v : P) : E.decomp v = ⊥ ↔ Finite (E.decomp v) := sorry

/-- Test `TauCeti.EulerSystem.ZpdExtension.trivial_excluded`: `d ≥ 1`. -/
example (E : ZpdExtension p P) : E.d ≠ 0 := Nat.one_le_iff_ne_zero.mp E.one_le_d

end ZpdExtension

end Tower

/-! ## `ES.8/iwasawa-large-image-hypotheses` and `ES.8/leopoldt-tower-hypothesis` -/

section Hypotheses

variable (O : Type*) [CommRing O] [IsLocalRing O] (G : Type*) [Group G]
  (T : Type*) [AddCommGroup T] [Module O T] (ρ : Representation O G T)

/-- **`ES.8/iwasawa-large-image-hypotheses`**: the part of Rubin's `Hyp(K∞, T)` statable over the
pinned Mathlib, for `G = G_{K∞}` acting on `T` through `ρ`: an element `τ` with `T/(τ - 1)T`
free of rank one over `O`, and irreducibility of `T/𝔪T` (every `G`-stable `O`-submodule between
`𝔪T` and `T` is one of them). The conditions that `τ` fixes `μ_{p^∞}`, `(𝒪_K^×)^{1/p^∞}` and
`K(1)` need the arithmetic carrier and are omitted, not replaced by a placeholder. -/
structure IwasawaHypT where
  τ : G
  free : Module.Free O (T ⧸ LinearMap.range (ρ τ - LinearMap.id))
  rank_one : Module.finrank O (T ⧸ LinearMap.range (ρ τ - LinearMap.id)) = 1
  irreducible : ∀ W : Submodule O T, (∀ g, ∀ x ∈ W, ρ g x ∈ W) →
    (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T) ≤ W →
      W = (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T) ∨ W = ⊤

variable (Φ : Type*) [Field Φ] (V : Type*) [AddCommGroup V] [Module Φ V]
  (σ : Representation Φ G V)

/-- **`ES.8/iwasawa-large-image-hypotheses`**: the statable part of `Hyp(K∞, V)`:
`dim_Φ V/(τ - 1)V = 1` and `V` irreducible under `G`. -/
structure IwasawaHypV where
  τ : G
  finrank_coinvariants : Module.finrank Φ (V ⧸ LinearMap.range (σ τ - LinearMap.id)) = 1
  irreducible : ∀ W : Submodule Φ V, (∀ g, ∀ x ∈ W, σ g x ∈ W) → W = ⊥ ∨ W = ⊤

variable {O G T ρ}

/-- `Hyp(K∞, T)` holds with `τ = 1` when `T` has rank one. -/
def IwasawaHypT.of_rank_one [Module.Free O T] (h : Module.finrank O T = 1)
    [IsSimpleModule O (T ⧸ (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T))] :
    IwasawaHypT O G T ρ := sorry

/- Suggested signatures awaiting the base change `V = T ⊗ Φ` of representations and the
arithmetic conditions on `τ`:
* `TauCeti.EulerSystem.IwasawaHypT.toHypV : IwasawaHypT O G T ρ → IwasawaHypV Φ G (Φ ⊗[O] T) ρ_Φ`
* `TauCeti.EulerSystem.IwasawaHypT.toBase : Hyp(K∞, T) → Hyp(K, T)` (ES.4's record)
* `TauCeti.EulerSystem.IwasawaHypV.dual : dim V*/(τ - 1)V* = 1`
* `TauCeti.EulerSystem.IwasawaHypT.twist_iff : Hyp(K∞, T ⊗ ρ) ↔ Hyp(K∞, T)` for `ρ` a character
  of `Γ` (restriction to `G_{K∞}` is unchanged)
* `TauCeti.EulerSystem.IwasawaHypT.aTau_eq_one : a_τ = 1` (see `ES.8/iwasawa-evaluation-maps`)
* tests `rank_one_example`, `elliptic_surjective`, `cm_fails`, `irreducible_K_not_Kinf`
  (`TauCeti.EulerSystem.IwasawaHypT.*`, `TauCeti.EulerSystem.IwasawaHypV.*`). -/

/-- Test `TauCeti.EulerSystem.IwasawaHypV.cm_fails` (linear-algebra core): a unipotent-free
element of `SL₂` with trace `0` has no eigenvalue `1` (outside characteristic `2`), so
`dim V/(τ - 1)V = 0` for it. -/
example {F : Type*} [Field F] (h2 : (2 : F) ≠ 0) (a b : F) (h : -(a * b) = 1) :
    LinearMap.range (Matrix.toLin' !![0, a; b, 0] - LinearMap.id) = ⊤ := sorry

/-- **`ES.8/leopoldt-tower-hypothesis`**: Rubin's `Hyp(K∞/K)`, as a predicate on its arithmetic
inputs: `rankΓ = rank_{ℤ_p} Γ`, whether `G_{K∞}` acts on `V` trivially or by the cyclotomic
character, whether `K` is totally real with Leopoldt's conjecture, and whether `K` is imaginary
quadratic. -/
def LeopoldtTowerHyp (rankΓ : ℕ) (scalarAction totallyRealLeopoldt imagQuadratic : Prop) : Prop :=
  rankΓ = 1 → scalarAction → totallyRealLeopoldt ∨ imagQuadratic

theorem LeopoldtTowerHyp.of_two_le_rank {r : ℕ} (hr : 2 ≤ r) (s t i : Prop) :
    LeopoldtTowerHyp r s t i := fun h => absurd h (by omega)

theorem LeopoldtTowerHyp.of_action_not_scalar (r : ℕ) {s : Prop} (hs : ¬ s) (t i : Prop) :
    LeopoldtTowerHyp r s t i := fun _ h => absurd h hs

theorem LeopoldtTowerHyp.rat (r : ℕ) (s : Prop) (i : Prop) : LeopoldtTowerHyp r s True i :=
  fun _ _ => Or.inl trivial

theorem LeopoldtTowerHyp.imaginaryQuadratic (r : ℕ) (s t : Prop) : LeopoldtTowerHyp r s t True :=
  fun _ _ => Or.inr trivial

/- Suggested signatures awaiting the arithmetic carrier:
* `TauCeti.EulerSystem.LeopoldtTowerHyp.twist_iff` (invariance under characters of `Γ`)
* `TauCeti.EulerSystem.LeopoldtTowerHyp.of_totallyReal_abelian` (Brumer–Ax)
* tests `rat_cyclotomic_Zp1`, `pure_cubic_fails`, `Zp2_vacuous`, `elliptic`. -/

/-- Test `TauCeti.EulerSystem.LeopoldtTowerHyp.Zp2_vacuous`. -/
example (s t i : Prop) : LeopoldtTowerHyp 2 s t i := LeopoldtTowerHyp.of_two_le_rank le_rfl s t i

/-- Test `TauCeti.EulerSystem.LeopoldtTowerHyp.pure_cubic_fails`: rank one, cyclotomic action,
`K = ℚ(∛2)` neither totally real nor imaginary quadratic. -/
example : ¬ LeopoldtTowerHyp 1 True False False := fun h => by simpa using h rfl trivial

end Hypotheses

/-! ## `ES.8/lambda-index`: Rubin's `ind_Λ` -/

section LambdaIndex

variable {Λ : Type*} [CommRing Λ] {H H' : Type*} [AddCommGroup H] [Module Λ H]
  [AddCommGroup H'] [Module Λ H']

/-- **`ES.8/lambda-index`** (Rubin, Definition II.3.1): `ind_Λ(x) = {φ(x) : φ ∈ Hom_Λ(H, Λ)}`,
an ideal that need not be principal. For an Euler system `c`, `ind_Λ(c) = ind_Λ(c_{K,∞})` with
`H = H¹_∞(K, T)`. -/
def lambdaIndex (Λ : Type*) [CommRing Λ] {H : Type*} [AddCommGroup H] [Module Λ H] (x : H) :
    Ideal Λ :=
  Ideal.span (Set.range fun φ : Module.Dual Λ H => φ x)

theorem apply_mem_lambdaIndex (φ : Module.Dual Λ H) (x : H) : φ x ∈ lambdaIndex Λ x :=
  Ideal.subset_span ⟨φ, rfl⟩

@[simp] theorem lambdaIndex_smul (a : Λ) (x : H) :
    lambdaIndex Λ (a • x) = Ideal.span {a} * lambdaIndex Λ x := sorry

theorem lambdaIndex_eq_bot_iff [IsDomain Λ] [IsNoetherianRing Λ] [Module.Finite Λ H] (x : H) :
    lambdaIndex Λ x = ⊥ ↔ x ∈ Submodule.torsion Λ H := sorry

theorem lambdaIndex_of_rank_one [IsDomain Λ] (e : (H ⧸ Submodule.torsion Λ H) ≃ₗ[Λ] Λ) (x : H) :
    lambdaIndex Λ x = Ideal.span {e (Submodule.Quotient.mk x)} := sorry

/-- For a free module of coordinates, `ind_Λ(a) = (a₁, …, a_r)`; a principal ideal `(f)` contains it
iff `f` divides every coordinate, i.e. iff `(f)` contains Mazur–Rubin's `Ind`. -/
theorem lambdaIndex_le_span_iff {r : ℕ} (a : Fin r → Λ) (f : Λ) :
    lambdaIndex Λ a ≤ Ideal.span {f} ↔ ∀ i, f ∣ a i := sorry

theorem lambdaIndex_twist (τ : Λ ≃+* Λ) (e : H →ₛₗ[(τ : Λ →+* Λ)] H')
    (he : Function.Bijective e) (x : H) :
    lambdaIndex Λ (e x) = Ideal.map (τ : Λ →+* Λ) (lambdaIndex Λ x) := sorry

theorem lambdaIndex_map_le (f : H →ₗ[Λ] H') (x : H) : lambdaIndex Λ (f x) ≤ lambdaIndex Λ x :=
  Ideal.span_le.mpr (by rintro _ ⟨φ, rfl⟩; exact Ideal.subset_span ⟨φ ∘ₗ f, rfl⟩)

/-- Test `TauCeti.EulerSystem.lambdaIndex_free_rank_one`. -/
example (f : Λ) : lambdaIndex Λ (H := Λ) f = Ideal.span {f} := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_not_principal`: in `ℤ_p⟦X⟧`, `X = γ - 1`, the vector
`(p, X)` has `ind_Λ = (p, X)`, which is not principal. -/
example (p : ℕ) [Fact p.Prime] :
    lambdaIndex (PowerSeries ℤ_[p])
        (![(p : PowerSeries ℤ_[p]), PowerSeries.X] : Fin 2 → PowerSeries ℤ_[p]) =
      Ideal.span {(p : PowerSeries ℤ_[p]), PowerSeries.X} ∧
    ¬ (lambdaIndex (PowerSeries ℤ_[p]) (![(p : PowerSeries ℤ_[p]), PowerSeries.X] :
      Fin 2 → PowerSeries ℤ_[p])).IsPrincipal := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_torsion`. -/
example [IsDomain Λ] (x : H) (hx : x ∈ Submodule.torsion Λ H) : lambdaIndex Λ x = ⊥ := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_dvd_iff_Ind`. -/
example {r : ℕ} (a : Fin r → Λ) (f : Λ) :
    lambdaIndex Λ a ≤ Ideal.span {f} ↔ Ideal.span (Set.range a) ≤ Ideal.span {f} := sorry

end LambdaIndex

end EulerSystem

/-! ## `ES.8/lambda-adic-ind`: Mazur–Rubin's principal index -/

namespace KolyvaginSystem

section Ind

variable {Λ : Type*} [CommRing Λ] {H : Type*} [AddCommGroup H] [Module Λ H] {r : ℕ}

/-- **`ES.8/lambda-adic-ind`** (Mazur–Rubin, Definition 5.3.8, with `Ind(0) = 0`): for a
pseudo-isomorphism `ψ : H → Λ^r`, `Ind(c)` is the smallest principal ideal containing the
coordinates of `ψ c`, that is the ideal generated by their gcd over a factorial `Λ`. -/
def ind (ψ : H →ₗ[Λ] (Fin r → Λ)) (c : H) : Ideal Λ :=
  ⨅ (f : Λ) (_ : Ideal.span (Set.range (ψ c)) ≤ Ideal.span {f}), Ideal.span {f}

@[simp] theorem ind_zero (ψ : H →ₗ[Λ] (Fin r → Λ)) : ind ψ 0 = ⊥ := sorry

theorem ind_eq_char [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ)) (hψ : EulerSystem.IsPseudoIso Λ ψ)
    (c : H) (hc : c ∉ Submodule.torsion Λ H) :
    ind ψ c = EulerSystem.charIdeal Λ (Submodule.torsion Λ (H ⧸ Λ ∙ c)) := sorry

@[simp] theorem ind_smul [IsDomain Λ] [UniqueFactorizationMonoid Λ]
    (ψ : H →ₗ[Λ] (Fin r → Λ)) (a : Λ) (c : H) :
    ind ψ (a • c) = Ideal.span {a} * ind ψ c := sorry

theorem exists_finiteIndex_mul_mem [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ))
    (hψ : EulerSystem.IsPseudoIso Λ ψ) (c : H) :
    ∃ B : Ideal Λ, Finite (Λ ⧸ B) ∧ ∀ b ∈ B, b • c ∈ (ind ψ c) • (⊤ : Submodule Λ H) := sorry

theorem lambdaIndex_le_ind [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ))
    (hψ : EulerSystem.IsPseudoIso Λ ψ) (c : H) :
    EulerSystem.lambdaIndex Λ c ≤ ind ψ c ∧
      ∀ f : Λ, (EulerSystem.lambdaIndex Λ c ≤ Ideal.span {f} ↔ ind ψ c ≤ Ideal.span {f}) := sorry

/-- `Ind(κ) = Ind(κ₁)` for a Λ-adic Kolyvagin system, through its bottom class. -/
def indKS {M : Type*} [AddCommGroup M] [Module Λ M] (bottomClass : M →ₗ[Λ] H)
    (ψ : H →ₗ[Λ] (Fin r → Λ)) (κ : M) : Ideal Λ :=
  ind ψ (bottomClass κ)

/-- Test `TauCeti.KolyvaginSystem.ind_free_rank_one`. -/
example (f : Λ) : ind (LinearMap.id : (Fin 1 → Λ) →ₗ[Λ] (Fin 1 → Λ)) (fun _ => f) =
    Ideal.span {f} := sorry

/-- Test `TauCeti.KolyvaginSystem.ind_rank_two`: `Ind((p, X)) = Λ` in `ℤ_p⟦X⟧`. -/
example (p : ℕ) [Fact p.Prime] :
    ind (LinearMap.id : (Fin 2 → PowerSeries ℤ_[p]) →ₗ[PowerSeries ℤ_[p]] _)
      ![(p : PowerSeries ℤ_[p]), PowerSeries.X] = ⊤ := sorry

/-- Test `TauCeti.KolyvaginSystem.ind_zero_convention`: `Ind(0) = 0`, whereas the printed formula
`char((H/Λ·0)_tors)` would give `Λ` for torsion-free `H` (source issue E801). -/
example (ψ : H →ₗ[Λ] (Fin r → Λ)) : ind ψ 0 = ⊥ := ind_zero ψ

/-- Test `TauCeti.KolyvaginSystem.ind_pseudoIso_invariant`. -/
example [IsDomain Λ] (ψ ψ' : H →ₗ[Λ] (Fin r → Λ)) (hψ : EulerSystem.IsPseudoIso Λ ψ)
    (hψ' : EulerSystem.IsPseudoIso Λ ψ') (c : H) : ind ψ c = ind ψ' c := sorry

end Ind

/-! ## `ES.8/blind-spot-and-lambda-primitivity` and its lemma -/

section BlindSpot

variable {Λ : Type*} [CommRing Λ] {M : Type*} [AddCommGroup M] [Module Λ M]
  (N : Ideal Λ → Type*) [∀ I, AddCommGroup (N I)] [∀ I, Module Λ (N I)]
  (red : ∀ I, M →ₗ[Λ] N I)

/-- **`ES.8/blind-spot-and-lambda-primitivity`**: the blind spot of `κ` for the reduction maps
`red I : KS‾(𝐓) → KS‾(𝐓/I𝐓)` (Mazur–Rubin, Definition 3.1.6). The modules `N I` are ES.4's
generalized Kolyvagin-system modules; here they are parameters. -/
def blindSpot (κ : M) : Set (Ideal Λ) := {I | red I κ = 0}

/-- **Λ-primitivity** (Mazur–Rubin, Definition 5.3.9): no height-one prime is in the blind spot. -/
def IsLambdaPrimitive (κ : M) : Prop :=
  ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime → 𝔓.height = 1 → 𝔓 ∉ blindSpot N red κ

/-- `I` is outside the blind spot iff some `𝔪^k`-level component survives at every depth `j`,
when `KS‾(𝐓/I𝐓) = lim_k colim_j KS(𝐓/(I, 𝔪^k), P ∩ P_j)` is presented by maps `redk`. -/
theorem mem_blindSpot_iff (Nk : Ideal Λ → ℕ → ℕ → Type*) [∀ I k j, AddCommGroup (Nk I k j)]
    [∀ I k j, Module Λ (Nk I k j)] (redk : ∀ I k j, M →ₗ[Λ] Nk I k j)
    (hlim : ∀ I κ, red I κ = 0 ↔ ∀ k, ∃ j, redk I k j κ = 0) (I : Ideal Λ) (κ : M) :
    I ∉ blindSpot N red κ ↔ ∃ k, ∀ j, redk I k j κ ≠ 0 := sorry

theorem blindSpot_zero : blindSpot N red 0 = Set.univ := by
  ext I; simp [blindSpot]

theorem blindSpot_smul (a : Λ) (κ : M) :
    blindSpot N red κ ⊆ blindSpot N red (a • κ) ∧
      ((∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0) → ∀ I, a ∈ I → I ∈ blindSpot N red (a • κ)) := sorry

theorem not_isLambdaPrimitive_smul [IsDomain Λ] [IsNoetherianRing Λ]
    [UniqueFactorizationMonoid Λ] (hΛ : ¬ IsField Λ) (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0)
    (a : Λ) (ha : ¬ IsUnit a) (κ : M) : ¬ IsLambdaPrimitive N red (a • κ) := sorry

/-- **`ES.8/residual-primitivity-implies-lambda-primitivity`**: if reduction to `𝔪` factors
through every height-one `𝔓` and `κ` survives modulo `𝔪`, then `κ` is Λ-primitive. -/
theorem IsLambdaPrimitive.of_isPrimitive [IsLocalRing Λ]
    (hfac : ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime →
      ∃ π : N 𝔓 →ₗ[Λ] N (IsLocalRing.maximalIdeal Λ),
        red (IsLocalRing.maximalIdeal Λ) = π ∘ₗ red 𝔓)
    (κ : M) (h : red (IsLocalRing.maximalIdeal Λ) κ ≠ 0) : IsLambdaPrimitive N red κ := by
  intro 𝔓 h𝔓 _ hmem
  obtain ⟨π, hπ⟩ := hfac 𝔓 h𝔓
  have hmem' : red 𝔓 κ = 0 := hmem
  exact h (by rw [hπ, LinearMap.comp_apply, hmem', map_zero])

/- Suggested signature awaiting the specialization of ES.4's Kolyvagin systems to `S_𝔓`:
* `TauCeti.KolyvaginSystem.specialize_ne_zero_of_not_mem_blindSpot :
    𝔓 ∉ blindSpot κ → specialize 𝔓 κ ≠ 0` (Mazur–Rubin, Lemma 5.3.20)
* test `TauCeti.KolyvaginSystem.cyclotomic_isLambdaPrimitive` (Büyükboduk, Proposition 4.1). -/

/-- Test `TauCeti.KolyvaginSystem.augmentation_mul_not_primitive`: multiplying by a generator of a
height-one prime (for instance `γ - 1`) destroys Λ-primitivity. -/
example (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0) (g : Λ) (hg : (Ideal.span {g}).IsPrime)
    (hh : (Ideal.span {g}).height = 1) (κ : M) : ¬ IsLambdaPrimitive N red (g • κ) :=
  fun hκ => hκ _ hg hh ((blindSpot_smul N red g κ).2 hann _ (Ideal.mem_span_singleton_self g))

/-- Test `TauCeti.KolyvaginSystem.free_rank_one_primitive_iff`. -/
example [IsLocalRing Λ] [IsDomain Λ] [IsNoetherianRing Λ] [UniqueFactorizationMonoid Λ]
    (hΛ : ¬ IsField Λ) (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0)
    (hfac : ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime →
      ∃ π : N 𝔓 →ₗ[Λ] N (IsLocalRing.maximalIdeal Λ),
        red (IsLocalRing.maximalIdeal Λ) = π ∘ₗ red 𝔓)
    (κ₀ : M) (hfree : ∀ κ : M, ∃! a : Λ, κ = a • κ₀)
    (hprim : red (IsLocalRing.maximalIdeal Λ) κ₀ ≠ 0) (a : Λ) :
    IsLambdaPrimitive N red (a • κ₀) ↔ IsUnit a := sorry

/-- Test `TauCeti.KolyvaginSystem.zero_not_primitive`. -/
example (h : ∃ 𝔓 : Ideal Λ, 𝔓.IsPrime ∧ 𝔓.height = 1) : ¬ IsLambdaPrimitive N red (0 : M) := by
  obtain ⟨𝔓, h𝔓, hh⟩ := h
  exact fun hκ => hκ 𝔓 h𝔓 hh (by simp [blindSpot])

end BlindSpot

/-! ## `ES.8/exceptional-height-one-primes` -/

section Exceptional

variable (p : ℕ) (Λ : Type*) [CommRing Λ] (H2g H2l : Type*) [AddCommGroup H2g] [Module Λ H2g]
  [AddCommGroup H2l] [Module Λ H2l]

/-- **`ES.8/exceptional-height-one-primes`** (Mazur–Rubin, Definition 5.3.12): the height-one
primes `𝔓` with `H²(ℚ_Σ/ℚ, 𝐓)[𝔓]` or `H²(ℚ_p, 𝐓)[𝔓]` infinite, together with `pΛ`. The two
`H²` modules are parameters, supplied by `SelmerIwasawaCohomology` L3. Mazur–Rubin take
`Λ = ℤ_p⟦Γ⟧`; over `O⟦Γ⟧` with `O` ramified the prime `ϖΛ` replaces `pΛ`. -/
def exceptionalSet : Set (Ideal Λ) :=
  {𝔓 | 𝔓.IsPrime ∧ 𝔓.height = 1 ∧ (Infinite (Submodule.torsionBySet Λ H2g (𝔓 : Set Λ)) ∨
      Infinite (Submodule.torsionBySet Λ H2l (𝔓 : Set Λ)))} ∪ {Ideal.span {(p : Λ)}}

theorem exceptionalSet_finite [IsDomain Λ] [IsNoetherianRing Λ] [IsLocalRing Λ]
    [Finite (IsLocalRing.ResidueField Λ)] (hdim : ringKrullDim Λ = 2)
    [Module.Finite Λ H2g] [Module.Finite Λ H2l] : (exceptionalSet p Λ H2g H2l).Finite := sorry

@[simp] theorem p_mem_exceptionalSet : Ideal.span {(p : Λ)} ∈ exceptionalSet p Λ H2g H2l :=
  Or.inr rfl

theorem mem_exceptionalSet_iff [IsDomain Λ] (𝔓 : Ideal Λ) (h𝔓 : 𝔓 ≠ Ideal.span {(p : Λ)}) :
    𝔓 ∈ exceptionalSet p Λ H2g H2l ↔ 𝔓.IsPrime ∧ 𝔓.height = 1 ∧
      EulerSystem.charIdeal Λ (Submodule.torsion Λ H2g) *
        EulerSystem.charIdeal Λ (Submodule.torsion Λ H2l) ≤ 𝔓 :=
  sorry

theorem exceptionalSet_twist (τ : Λ ≃+* Λ) (hτ : τ (p : Λ) = p) (H2g' H2l' : Type*)
    [AddCommGroup H2g'] [Module Λ H2g'] [AddCommGroup H2l'] [Module Λ H2l']
    (eg : H2g →ₛₗ[(τ : Λ →+* Λ)] H2g') (hg : Function.Bijective eg)
    (el : H2l →ₛₗ[(τ : Λ →+* Λ)] H2l') (hl : Function.Bijective el) (𝔓 : Ideal Λ) :
    𝔓 ∈ exceptionalSet p Λ H2g' H2l' ↔ Ideal.comap (τ : Λ →+* Λ) 𝔓 ∈ exceptionalSet p Λ H2g H2l :=
  sorry

/- Tests awaiting the arithmetic carrier: `TauCeti.KolyvaginSystem.exceptionalSet_Zp1`
(`J ∈ Σ_Λ` for `T = ℤ_p(1)`), `TauCeti.KolyvaginSystem.exceptionalSet_not_blindSpot`. -/

/-- Test `TauCeti.KolyvaginSystem.p_mem_exceptionalSet_test`. -/
example : Ideal.span {(p : Λ)} ∈ exceptionalSet p Λ H2g H2l := p_mem_exceptionalSet p Λ H2g H2l

/-- Test `TauCeti.KolyvaginSystem.exceptionalSet_free_H2`: finite `H²` give `Σ_Λ = {pΛ}`. -/
example [Finite H2g] [Finite H2l] : exceptionalSet p Λ H2g H2l = {Ideal.span {(p : Λ)}} := sorry

end Exceptional

/-! ## `ES.8/height-one-specialization` -/

section Specialization

variable {Λ : Type*} [CommRing Λ] (𝔓 : Ideal Λ) [𝔓.IsPrime]

/-- **`ES.8/height-one-specialization`**: `S_𝔓`, the integral closure of `Λ/𝔓` in its fraction
field. -/
abbrev specRing : Type _ := integralClosure (Λ ⧸ 𝔓) (FractionRing (Λ ⧸ 𝔓))

instance specRing.algebraBase : Algebra Λ (specRing 𝔓) :=
  ((algebraMap (Λ ⧸ 𝔓) (specRing 𝔓)).comp (Ideal.Quotient.mk 𝔓)).toAlgebra

/-- `T ⊗ S_𝔓 = 𝐓 ⊗_Λ S_𝔓`. -/
abbrev specRep (T : Type*) [AddCommGroup T] [Module Λ T] : Type _ := specRing 𝔓 ⊗[Λ] T

theorem specRing_isDiscreteValuationRing [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ] (hdim : ringKrullDim Λ = 2)
    (h : 𝔓.height = 1) : IsDiscreteValuationRing (specRing 𝔓) := sorry

theorem specRing_finite [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ] (h : 𝔓.height = 1) :
    Module.Finite (Λ ⧸ 𝔓) (specRing 𝔓) := sorry

/-- The perturbations `𝔓_N = (g + p^N)` of `𝔓 = (g)` (Mazur–Rubin, proof of Theorem 5.3.10). -/
def perturb (p : ℕ) (g : Λ) (N : ℕ) : Ideal Λ := Ideal.span {g + (p : Λ) ^ N}

/-- For `g` distinguished and `N` large, `𝔓_N` is a height-one prime with `Λ/𝔓 ≅ Λ/𝔓_N`
(Hensel's lemma). -/
theorem perturb_quotient_equiv {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (p : ℕ)
    (hp : (p : O) ∈ IsLocalRing.maximalIdeal O)
    (g : Polynomial O) (hg : g.IsDistinguishedAt (IsLocalRing.maximalIdeal O))
    (hirr : Irreducible g) :
    ∀ᶠ N in Filter.atTop, (perturb p (g : PowerSeries O) N).IsPrime ∧
      Nonempty ((PowerSeries O ⧸ Ideal.span {(g : PowerSeries O)}) ≃+*
        (PowerSeries O ⧸ perturb p (g : PowerSeries O) N)) := sorry

/- Suggested signatures awaiting ES.3/kolyvagin-system-module and ES.4's Selmer sheaf:
* `TauCeti.KolyvaginSystem.specialize : KS‾(𝐓, F_Λ) →ₗ[Λ] KS‾(specRep 𝔓 𝐓, F_can)`
* `TauCeti.KolyvaginSystem.specialize_bottomClass`, `specialize_augmentation`,
  `specialize_twist` (see the packet). -/

variable (p : ℕ) [Fact p.Prime]

/-- Test `TauCeti.KolyvaginSystem.specRing_augmentation`: `Λ/(γ - 1) = ℤ_p`. -/
example : Nonempty ((PowerSeries ℤ_[p] ⧸ Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p])}) ≃+*
    ℤ_[p]) := sorry

/-- Test `TauCeti.KolyvaginSystem.specRing_twist`: `Λ/(γ - (1 + p)) = ℤ_p`, the twist by
`γ ↦ 1 + p`. -/
example : Nonempty ((PowerSeries ℤ_[p] ⧸
    Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])}) ≃+* ℤ_[p]) :=
  sorry

/-- Test `TauCeti.KolyvaginSystem.specRing_not_quotient`: `𝔓 = (X² - p³)` is prime and `Λ/𝔓` is
not integrally closed. -/
example :
    (Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2 - (p : PowerSeries ℤ_[p]) ^ 3}).IsPrime ∧
    ¬ IsIntegrallyClosed (PowerSeries ℤ_[p] ⧸
      Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2 - (p : PowerSeries ℤ_[p]) ^ 3}) :=
  sorry

/-- Test `TauCeti.KolyvaginSystem.perturb_height_one`. -/
example (N : ℕ) (hN : 2 ≤ N) :
    (perturb p ((PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])) N).IsPrime ∧
      perturb p ((PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])) N ≠
        Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])} := sorry

end Specialization

/-! ## `ES.8/lambda-adic-selmer-structure` -/

section LambdaSelmer

variable (Λ : Type*) [CommRing Λ] (P : Type*)

/-- **`ES.8/lambda-adic-selmer-structure`**: the Λ-adic representation `𝐓 = T ⊗_O Λ`. The Galois
action (on both factors, through the tautological character on `Λ`) is part of the
`SelmerIwasawaCohomology` L3 carrier; here only the module is recorded. -/
abbrev lambdaRep (O : Type*) [CommRing O] (T : Type*) [AddCommGroup T] [Module O T]
    [Algebra O Λ] : Type _ :=
  Λ ⊗[O] T

/-- A Selmer structure over `R = Λ`: places `Σ`, global and local cohomology modules with
restriction maps, and local conditions (Mazur–Rubin, Definition 2.1.1, with `R = Λ`). The
cohomology modules are parameters supplied by `SelmerIwasawaCohomology` L2–L3. -/
structure LambdaSelmerStructure (Hglob : Type*) [AddCommGroup Hglob] [Module Λ Hglob]
    (Hloc : P → Type*) [∀ v, AddCommGroup (Hloc v)] [∀ v, Module Λ (Hloc v)] where
  places : Set P
  res : ∀ v, Hglob →ₗ[Λ] Hloc v
  cond : ∀ v, Submodule Λ (Hloc v)

namespace LambdaSelmerStructure

variable {Λ P} {Hglob : Type*} [AddCommGroup Hglob] [Module Λ Hglob]
  {Hloc : P → Type*} [∀ v, AddCommGroup (Hloc v)] [∀ v, Module Λ (Hloc v)]

/-- The Selmer module `H¹_{F_Λ}(K, 𝐓)`. -/
def selmer (F : LambdaSelmerStructure Λ P Hglob Hloc) : Submodule Λ Hglob :=
  ⨅ v ∈ F.places, (F.cond v).comap (F.res v)

/-- Mazur–Rubin's canonical structure (Definition 5.3.2): the full local cohomology. -/
def canonical (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v) :
    LambdaSelmerStructure Λ P Hglob Hloc :=
  ⟨places, res, fun _ => ⊤⟩

/-- Howard's ordinary structure (Definition 2.2.6): the image of the cohomology of `Fil_v 𝐓`
(at the places above `p`; the unramified condition elsewhere is part of `fil`). -/
def ordinary (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v)
    (Hfil : P → Type*) [∀ v, AddCommGroup (Hfil v)] [∀ v, Module Λ (Hfil v)]
    (fil : ∀ v, Hfil v →ₗ[Λ] Hloc v) : LambdaSelmerStructure Λ P Hglob Hloc :=
  ⟨places, res, fun v => LinearMap.range (fil v)⟩

@[simp] theorem canonical_selmer_eq (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v) :
    (canonical places res).selmer = ⊤ := by
  simp [selmer, canonical]

/-- The structure induced on a quotient `𝐓/I𝐓` by propagation along maps of cohomology. -/
def quotient (F : LambdaSelmerStructure Λ P Hglob Hloc) {Hglob' : Type*} [AddCommGroup Hglob']
    [Module Λ Hglob'] {Hloc' : P → Type*} [∀ v, AddCommGroup (Hloc' v)] [∀ v, Module Λ (Hloc' v)]
    (res' : ∀ v, Hglob' →ₗ[Λ] Hloc' v) (q : ∀ v, Hloc v →ₗ[Λ] Hloc' v) :
    LambdaSelmerStructure Λ P Hglob' Hloc' :=
  ⟨F.places, res', fun v => (F.cond v).map (q v)⟩

end LambdaSelmerStructure

/- Suggested signatures awaiting the Galois-cohomology carriers of `SelmerIwasawaCohomology`:
* `TauCeti.KolyvaginSystem.lambdaRep_cohomologyEquiv :
    H^i(K, lambdaRep Λ O T) ≃ₛₗ[ι] lim_n H^i(K_n, T)` (Shapiro; semilinear for the involution `ι`
    of `Λ` when `G_K` acts on `Λ` through `Ψ`, with `Γ` acting on the limit by conjugation)
* `TauCeti.KolyvaginSystem.LambdaSelmerStructure.dualX :
    X = Hom(H¹_{F_Λ*}(K, 𝐓*), ℚ_p/ℤ_p)`
* `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_X_eq : X ≃ₛₗ[ι] Rubin's X∞` (`K = ℚ`;
    so `charIdeal X = ι (charIdeal X∞)`)
* tests `TauCeti.KolyvaginSystem.canonical_rat_selmer`, `canonical_unramified_away_from_p`,
  `quotient_not_full`, `ordinary_selfOrthogonal`. -/

end LambdaSelmer

/-! ## Λ-adic Kolyvagin systems and the theorems of Mazur–Rubin §5.3, Howard §2.2 and
Castella–Grossi–Lee–Skinner §3.4

The general Kolyvagin-system module and its coefficient functoriality belong to
ES.3/kolyvagin-system-module; ES.4/selmer-sheaf identifies systems with global sections.
Until the arithmetic carrier exists, the suggested signatures are recorded here under the
packet's names.

* **`ES.8/lambda-adic-kolyvagin-systems`**: `TauCeti.KolyvaginSystem.lambdaKS`,
  `lambdaKSBar`, `lambdaKS_toBar`, `bottomClass`, `lambdaKS_baseChange`,
  `lambdaKS_restrictPrimes`, `lambdaKS_ext`, `bottomClass_zero`; tests `zero_mem`,
  `relation_required`, `cyclotomic_free_rank_one`, `bottomClass_specialize`.
* `euler_to_lambdaKS` — **`ES.8/euler-to-lambda-adic-kolyvagin`** (Mazur–Rubin, Theorem 5.3.3):
  `theorem euler_to_lambdaKS : (∀ ℓ ∈ P, IsCyclic (T/(Fr_ℓ - 1)T)) →
    (∀ ℓ ∈ P, ∀ k, Injective (Fr_ℓ^{p^k} - 1)) → ∃ ψ : ES(T, 𝒦, P) →ₗ KS‾(𝐓, F_Λ, P),
    ∀ c, bottomClass (ψ c) = (c_{ℚ_n})_n`.
* `specializationControl` — **`ES.8/specialization-control`** (Mazur–Rubin, Lemma 5.3.13,
  Proposition 5.3.14; Howard,
  Lemma 2.2.7, Proposition 2.2.8): injectivity of `π_𝔓` and the bounds on `coker π_𝔓`,
  `ker π*_𝔓`, `coker π*_𝔓` for `𝔓 ∉ exceptionalSet`, uniform in `[S_𝔓 : Λ/𝔓]`.
* `genericCoreRank` — **`ES.8/generic-core-rank`** (Lemma 5.3.16): `χ(T ⊗ S_𝔓, F_can) = rank T⁻` for
  `𝔓 ∉ exceptionalSet`.
* `weakLeopoldt_of_lambdaKS` — **`ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`** (Theorem
  5.3.6, Corollary 5.3.19):
  `bottomClass κ ≠ 0 → Module.IsTorsion Λ X∞`.
* `charIdeal_dvd_ind` — **`ES.8/mazur-rubin-lambda-adic-main-theorem`** (Theorem 5.3.10):
  `(i) ind ψ (bottomClass κ) ≤ charIdeal Λ X∞`;
  `(ii) χ = 1 → bottomClass κ ≠ 0 → 𝔓 ∉ blindSpot κ → ord_𝔓 (charIdeal Λ X∞) = ord_𝔓 (Ind κ)`;
  `(iii) χ = 1 → bottomClass κ ≠ 0 → IsLambdaPrimitive κ → charIdeal Λ X∞ = Ind κ`.
* `howard_selfDual_bound` — **`ES.8/self-dual-lambda-adic-kolyvagin-bound`** (Howard, Theorem
  2.2.10): rank one,
  `X ∼ Λ ⊕ M ⊕ M` with `char M = ι (char M)`, and `char M ∣ char(H¹_{F_Λ}(K, 𝐓)/Λκ₁)`.
* `cgls_errorTolerant_bound` — **`ES.8/error-tolerant-self-dual-lambda-adic-bound`**
  (Castella–Grossi–Lee–Skinner, Theorem 3.4.1, Corollary 3.4.2): the same divisibility in
  `Λ[1/p, 1/(γ - 1)]`, resp. `Λ[1/p]`. -/

end KolyvaginSystem

/-! ## Rubin's Iwasawa theory of Euler systems (Chapters II §3, VI, VII) -/

namespace EulerSystem

section RubinLemma

/-- Rubin's Lemma VII.1.8 (in the proof of `ES.8/characteristic-ideal-bound-with-error`): for `G`
finite abelian, `R` a principal ideal domain and `B` a finitely generated `R[G]`-module without
`R`-torsion, if every functional value `ψ(b)` lies in `f R[G]` for a non-zero-divisor `f`, then
`b ∈ f B`. -/
theorem mem_smul_of_forall_dual_mem {R G : Type*} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] [CommGroup G] [Finite G] {B : Type*} [AddCommGroup B]
    [Module (MonoidAlgebra R G) B] [Module R B] [IsScalarTower R (MonoidAlgebra R G) B]
    [Module.Finite (MonoidAlgebra R G) B] [NoZeroSMulDivisors R B]
    (f : MonoidAlgebra R G) (hf : f ∈ nonZeroDivisors (MonoidAlgebra R G)) (b : B)
    (h : ∀ ψ : Module.Dual (MonoidAlgebra R G) B, ψ b ∈ Ideal.span {f}) : ∃ b', b = f • b' :=
  sorry

end RubinLemma

/- Suggested signatures awaiting the carriers of `SelmerIwasawaCohomology` L2–L3 (Galois
cohomology of the finite layers `F` of `K∞/K`, restricted and true Selmer groups) and of ES.2
(Euler systems). In each, `E : ZpdExtension p P` is admissible, `Λ = iwasawaAlgebra O E`,
`H¹∞ = H¹_∞(K, T)` and `X∞ = Xinf`.

* **`ES.8/restricted-iwasawa-selmer-module`**: `restrictedSelmerInf`, `Xinf`,
  `restrictedSelmerInf.res`, `Xinf_coinvariants`, `Xinf_finitelyGenerated`, `Xinf_twist`,
  `Xinf_eq_mazurRubin` (an `ι`-semilinear identification with Mazur–Rubin's `X∞`); tests
  `Xinf_rat_Zp1`, `Xinf_coinvariants_rank_one`,
  `Xinf_not_true_selmer`, `Xinf_contragredient`.
* **`ES.8/iwasawa-class-of-an-euler-system`**: `iwasawaClass : ES(T, 𝒦, N) →ₗ H¹∞`,
  `iwasawaClassAt`, `iwasawaClass_proj`, `iwasawaClass_smul`, `iwasawaClass_zero`,
  `iwasawaClass_mem_unramified`, `iwasawaClass_twist`, `iwasawaClass_eq_kappaOne`; tests
  `iwasawaClass_zero_index`, `iwasawaClass_norm_coherent`, `iwasawaClass_proj_base`,
  `iwasawaClass_cyclotomic`.
* **`ES.8/true-iwasawa-selmer-and-singular-quotient`**: `trueSelmerInf`, `singularLocalInf`,
  `locSingularInf`, `restrictedSelmerInf_le_true`, `compatible_cor_iff_res`,
  `singularLocal_torsionFree`, `singularLocalInf_eq_zero_of_full`; tests
  `singularLocalInf_full_condition`, `singularLocal_strict_condition`,
  `singularLocalInf_cyclotomic`, `singularLocal_not_torsion`.
* **`ES.8/twisting-by-characters-of-gamma`**: `twistGamma`, `twistGamma_eulerRelation`,
  `twistGamma_twistGamma`, `twistGamma_of_finiteOrder`, `iwasawaCohomologyTwistEquiv`,
  `selmerTwistEquiv`, `exists_good_twist`, `twistGamma_tate`; tests `twistGamma_one`,
  `twistGamma_eulerFactor_rank_one`, `twistGamma_not_pointwise`,
  `twistGamma_finiteOrder_agrees`.
* **`ES.8/iwasawa-evaluation-maps`**: `evalStar`, `eval`, `evalAt`, `aTau`, `aTau_eq_one`,
  `groupRingDualEquiv`, `eval_frobenius_derivative`, `eval_pairing`, `eval_semilinear`; tests
  `aTau_rank_one`, `aTau_unipotent_lower_bound`, `evalStar_wellDefined`,
  `eval_not_Lambda_linear`.
* **`ES.8/unramified-at-split-primes-condition`**: `UnramifiedAtSplitPrimes`,
  `unramifiedAtSplitPrimes_of_noSplitPrimes`, `unramifiedAtSplitPrimes_mem`,
  `splitPrimes_density_zero`, `weakLeopoldt_of_unramifiedAtSplitPrimes`,
  `unramifiedAtSplitPrimes_kummer`; tests `unramifiedAtSplitPrimes_vacuous`,
  `unramifiedAtSplitPrimes_anticyclotomic`, `unramifiedAtSplitPrimes_kummer_example`,
  `unramifiedAtSplitPrimes_not_selmer_limit`.

Named theorems:
* `twistingInvariance` (**`ES.8/twisting-invariance-of-iwasawa-theorems`**, Theorem VI.4.1):
  `charIdeal Λ (Xinf (T ⊗ ρ)) = (charIdeal Λ (Xinf T)).map Tw_ρ⁻¹` and
  `lambdaIndex Λ (iwasawaClass c^ρ) = (lambdaIndex Λ (iwasawaClass c)).map Tw_ρ⁻¹`.
* `restrictionControl` (**`ES.8/restriction-control-over-the-tower`**, Proposition VII.3.4).
* `Xinf_fg` (**`ES.8/x-infinity-finitely-generated`**, Lemma VII.4.1):
  `Module.Finite Λ Xinf`.
* `weakLeopoldt` (**`ES.8/weak-leopoldt-from-an-euler-system`**, Theorem II.3.2):
  `IwasawaHypV … → iwasawaClass c ∉ Submodule.torsion Λ H¹∞ → Module.IsTorsion Λ Xinf`.
* `rankOneLeopoldt` (**`ES.8/rank-one-leopoldt-case`**, Lemma VII.3.7).
* `kolyvaginSequenceInduction` (**`ES.8/kolyvagin-sequence-induction`**, Propositions VII.1.4,
  VII.1.6).
* `charIdeal_dvd_aTau_pow_mul` (**`ES.8/characteristic-ideal-bound-with-error`**, Theorem
  VII.1.9): `(aTau : Λ) ^ (5 * r) • lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `rubinDivisibility` (**`ES.8/rubin-iwasawa-divisibility`**, Theorem II.3.3):
  `IwasawaHypT … → LeopoldtTowerHyp … → lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `rubinRationalDivisibility` (**`ES.8/rubin-rational-iwasawa-divisibility`**, Theorem II.3.4):
  `∃ t, (p : Λ) ^ t • lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `iwasawaPoitouTate` (**`ES.8/iwasawa-poitou-tate-sequence`**, Proposition II.3.7): the exact
  sequence `0 → singularLocalInf / range locSingularInf → dual (trueSelmerInf) → Xinf → 0`.
* `trueSelmerDivisibility` (**`ES.8/true-selmer-iwasawa-divisibility`**, Theorem II.3.8). -/

end EulerSystem

end TauCeti

end -- noncomputable section

end IwasawaPrototype


/-
ES.8 packet-synchronized arithmetic inventory.

This records the exact fully qualified API/test names, statements and hypotheses
for the Iwasawa nodes. The abbreviations in earlier comments refer to this
inventory; their displayed formula fragments do not omit the hypotheses here.
These comments are not Lean declarations, theorem signatures or examples, and
do not discharge the missing arithmetic-signature work.
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension — definition
Z_p^d-extensions in which no finite prime splits completely
Statement: Let K be a number field and p a prime. A Z_p^d-extension of K is an abelian extension K∞/K, inside a fixed algebraic closure K̄, together with the profinite group Γ = Gal(K∞/K) and a topological isomorphism Γ ≅ Z_p^d for some d ≥ 1. It is admissible (Rubin's standing hypothesis of Definition II.1.1(ii) and of Chapter II §3) when no finite prime of K splits completely in K∞/K; equivalently, for every finite prime v of K the decomposition group D_v ⊂ Γ is infinite. The finite subextensions K ⊂_f F ⊂ K∞ form a directed set; for a complete discrete valuation ring O finite over Z_p put Λ_F = O[Gal(F/K)] and Λ = O[[Γ]] = lim_F Λ_F (the completed group ring of PadicMeasuresIwasawaAlgebras L1), with the O-algebra involution ι induced by γ ↦ γ^{-1} (Rubin's η ↦ η^•).
Hypotheses:
- d ≥ 1; the trivial extension is excluded.
- Admissibility is a property of K∞/K alone, not of any representation.
- It fails for the anticyclotomic Z_p-extension of an imaginary quadratic field, where every rational prime inert in K splits completely; that tower is handled by Howard's Λ-adic Kolyvagin systems (self-dual-lambda-adic-kolyvagin-bound) or by Rubin's condition (*) (unramified-at-split-primes-condition), never by this definition.
Proposed API (untyped inventory):
TauCeti.EulerSystem.ZpdExtension [constructor]: A Z_p^d-extension of K: an abelian extension K∞ ⊂ K̄ with a topological group isomorphism Gal(K∞/K) ≅ Z_p^d, d ≥ 1.
TauCeti.EulerSystem.ZpdExtension.NoSplitPrimes [data]: The predicate that no finite prime of K splits completely in K∞/K.
TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_iff_infinite_decompositionGroup [characterisation]: NoSplitPrimes holds iff the decomposition group D_v ⊂ Γ is infinite for every finite prime v of K.
TauCeti.EulerSystem.ZpdExtension.unramified_of_not_dvd_p [other]: K∞/K is unramified at every finite prime v not above p.
TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_of_cyclotomic_le [compatibility]: If K∞ contains the cyclotomic Z_p-extension of K (built from Mathlib's IsCyclotomicExtension tower), then NoSplitPrimes holds.
TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_mono [functoriality]: If K∞ ⊂ K∞' are Z_p^d- and Z_p^{d'}-extensions of K and K∞/K is admissible then so is K∞'/K, since decomposition groups surject.
TauCeti.EulerSystem.ZpdExtension.iwasawaAlgebra [data]: Λ = O[[Γ]] = lim_F O[Gal(F/K)] over the finite subextensions F, with projections Λ → Λ_F and the involution ι.
TauCeti.EulerSystem.ZpdExtension.layer_finite [other]: Every finite subextension F has Gal(F/K) a finite abelian p-group, and the F form a cofinal directed system indexed by the open subgroups of Γ.
Unit tests (untyped inventory):
TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes [computation]: For p odd, the cyclotomic Z_p-extension Q∞/Q is admissible: the Frobenius of a prime ℓ ≠ p maps to the image of ℓ in Z_p^×/μ_{p−1} ≅ Z_p, which has infinite order, and p is totally ramified.
TauCeti.EulerSystem.ZpdExtension.anticyclotomic_not_noSplitPrimes [non-example]: For K = Q(√−7), p = 3 and K∞ the anticyclotomic Z_3-extension of K, the prime 5 is inert in K and splits completely in K∞/K: a Frobenius of 5 lies in the coset of Gal(K∞/Q) acting on Γ by inversion, so its square, the Frobenius of 5O_K, is trivial.
TauCeti.EulerSystem.ZpdExtension.split_iff_decompositionGroup_trivial [characterisation]: For every finite prime v, v splits completely in K∞/K iff D_v = 1 iff D_v is finite.
TauCeti.EulerSystem.ZpdExtension.trivial_excluded [degenerate]: The trivial extension K/K is not a Z_p^d-extension (d ≥ 1 is required); in it every prime splits completely, so no admissibility statement is made about it.
Acceptance:
- For K = Q, p odd, the cyclotomic Z_p-extension is admissible.
- For K = Q(√−7), p = 3 and K∞ the anticyclotomic Z_3-extension, the prime 5 (inert in K) splits completely, so this K∞/K is not admissible.
Prerequisites:
- PadicMeasuresIwasawaAlgebras:L1
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses — definition
Rubin's hypotheses Hyp(K∞, T) and Hyp(K∞, V)
Statement: Let K∞/K be admissible, T a free O-module of finite rank with a continuous action of G_K unramified outside finitely many primes, V = T ⊗_O Φ, k = O/ϖ, and K(1) the maximal p-extension of K inside the Hilbert class field. Hyp(K∞, T): (i) there is τ ∈ G_{K∞} acting trivially on μ_{p^∞}, on (O_K^×)^{1/p^∞} and on K(1), such that T/(τ−1)T is free of rank one over O; (ii) T ⊗ k is an irreducible k[G_{K∞}]-module. Hyp(K∞, V): (i) there is such a τ with dim_Φ V/(τ−1)V = 1; (ii) V is an irreducible Φ[G_{K∞}]-module. These are the hypotheses Hyp(K, T), Hyp(K, V) of EulerSystemsAndKolyvaginSystems ES.4 (Rubin's Theorem II.2.2) with G_K replaced by G_{K∞}, and Hyp(K∞, T) ⇒ Hyp(K∞, V), Hyp(K∞, T) ⇒ Hyp(K, T), Hyp(K∞, V) ⇒ Hyp(K, V).
Hypotheses:
- Irreducibility is required over G_{K∞}, not over G_K: irreducibility over G_K is strictly weaker.
- τ is an element of G_{K∞}; Rubin's Chapter VII fixes it once and for all.
- These are Rubin's hypotheses; Mazur–Rubin's (H.0)–(H.6) and Kato's hypotheses (i)–(v) of his Theorem 13.4 are different records, related to these by implication lemmas proved by their owners (ES.0 and KatoEulerSystems L4).
Proposed API (untyped inventory):
TauCeti.EulerSystem.IwasawaHypT [structure]: The record Hyp(K∞, T): an element τ of G_{K∞} with the three triviality conditions, a proof that T/(τ−1)T is free of rank one over O, and irreducibility of T ⊗ k over G_{K∞}.
TauCeti.EulerSystem.IwasawaHypV [structure]: The record Hyp(K∞, V): τ ∈ G_{K∞} with the triviality conditions and dim_Φ V/(τ−1)V = 1, and irreducibility of V over G_{K∞}.
TauCeti.EulerSystem.IwasawaHypT.toHypV [relation]: Hyp(K∞, T) implies Hyp(K∞, V) with the same τ.
TauCeti.EulerSystem.IwasawaHypT.toBase [relation]: Hyp(K∞, T) implies ES.4's Hyp(K, T), and Hyp(K∞, V) implies Hyp(K, V).
TauCeti.EulerSystem.IwasawaHypV.dual [other]: Under Hyp(K∞, V)(i), dim_Φ V*/(τ−1)V* = 1 for V* = Hom(V, Φ(1)).
TauCeti.EulerSystem.IwasawaHypT.of_rank_one [example]: If rank_O T = 1 then Hyp(K∞, T) holds with τ = 1.
TauCeti.EulerSystem.IwasawaHypT.twist_iff [compatibility]: For a character ρ of Γ, Hyp(K∞, T⊗ρ) ⇔ Hyp(K∞, T) and Hyp(K∞, V⊗ρ) ⇔ Hyp(K∞, V), because G_{K∞} acts on T⊗ρ as on T.
TauCeti.EulerSystem.IwasawaHypT.aTau_eq_one [other]: Under Hyp(K∞, T) the constant a_τ of iwasawa-evaluation-maps equals 1 (Rubin, Lemma VII.1.3(ii)).
Unit tests (untyped inventory):
TauCeti.EulerSystem.IwasawaHypT.rank_one_example [example]: For T = O_{χ^{-1}}(1) with χ a finite-order character, Hyp(Q∞, T) holds with τ = 1.
TauCeti.EulerSystem.IwasawaHypT.elliptic_surjective [computation]: For E/Q with ρ_{E,p}: G_Q → GL_2(Z_p) surjective and p odd, Hyp(Q∞, T_pE) holds: take τ ∈ G_{Q(μ_{p^∞})} with ρ(τ) = (1 1; 0 1), so det ρ(τ) = 1, τ fixes μ_{p^∞} and the p-power roots of ±1, K(1) = Q, T/(τ−1)T ≅ Z_p, and E[p] is irreducible over G_{Q∞} because ρ̄(G_{Q∞}) ⊇ SL_2(F_p).
TauCeti.EulerSystem.IwasawaHypV.cm_fails [non-example]: For E/Q with complex multiplication and p odd, no τ ∈ G_{Q(μ_{p^∞})} has dim V_pE/(τ−1)V_pE = 1: on the Cartan part τ has eigenvalues u, u^{-1}, both 1 or neither; off it, det ρ(τ) = 1 and trace 0 force eigenvalues ±√−1. So Hyp(Q∞, V_pE)(i) fails.
TauCeti.EulerSystem.IwasawaHypV.irreducible_K_not_Kinf [non-example]: For p odd, K' the first layer of K∞/K and ψ a character of G_{K'} with ψ^σ ≠ ψ for a generator σ of Gal(K'/K), V = Ind_{K'}^{K} ψ is irreducible over G_K, but V restricted to G_{K∞} is a sum of characters, so Hyp(K∞, V)(ii) fails while Hyp(K, V)(ii) holds.
Acceptance:
- Rank one: for rank_O T = 1 both hypotheses hold with τ = 1.
- Elliptic curves: for E/Q with ρ_{E,p} surjective onto GL_2(Z_p), p odd, and K∞ = Q∞, Hyp(Q∞, T_pE) holds with ρ(τ) unipotent.
- CM elliptic curves fail Hyp(Q∞, V_pE)(i).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
- EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple
- EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis — definition
Rubin's hypothesis Hyp(K∞/K)
Statement: For an admissible Z_p^d-extension K∞/K and V = T ⊗ Φ: Hyp(K∞/K) holds unless rank_{Z_p} Γ = 1, G_{K∞} acts on V either trivially or by the cyclotomic character, and K is neither a totally real field satisfying Leopoldt's conjecture (the p-adic completion of O_K^× injects into (O_K ⊗ Z_p)^×) nor an imaginary quadratic field. Equivalently: if rank_{Z_p} Γ = 1 and G_{K∞} acts on V trivially or by ε_cyc, then K is totally real with Leopoldt's conjecture, or K is imaginary quadratic.
Hypotheses:
- The condition rules out a very special family of bad cases, all of rank one: by Hyp(K∞, V)(ii) the action of G_{K∞} on V can be scalar only if dim V = 1.
- It holds for K = Q (O_Q^× is finite, so Leopoldt's conjecture is trivially true).
Proposed API (untyped inventory):
TauCeti.EulerSystem.LeopoldtTowerHyp [data]: The predicate Hyp(K∞/K) on (K, K∞, V).
TauCeti.EulerSystem.LeopoldtTowerHyp.of_two_le_rank [example]: If rank_{Z_p} Γ ≥ 2 then Hyp(K∞/K) holds vacuously.
TauCeti.EulerSystem.LeopoldtTowerHyp.of_action_not_scalar [example]: If G_{K∞} acts on V neither trivially nor by ε_cyc (in particular if dim V ≥ 2 and Hyp(K∞, V)(ii) holds) then Hyp(K∞/K) holds.
TauCeti.EulerSystem.LeopoldtTowerHyp.rat [example]: For K = Q, Hyp(K∞/K) holds for every V.
TauCeti.EulerSystem.LeopoldtTowerHyp.imaginaryQuadratic [example]: For K imaginary quadratic, Hyp(K∞/K) holds for every V.
TauCeti.EulerSystem.LeopoldtTowerHyp.twist_iff [compatibility]: Hyp(K∞/K) holds for V iff it holds for V ⊗ ρ, ρ a character of Γ.
TauCeti.EulerSystem.LeopoldtTowerHyp.of_totallyReal_abelian [compatibility]: For K totally real and abelian over Q, Hyp(K∞/K) holds, by Leopoldt's conjecture for abelian fields (Brumer–Ax) as imported by the cyclotomic owner.
Unit tests (untyped inventory):
TauCeti.EulerSystem.LeopoldtTowerHyp.rat_cyclotomic_Zp1 [computation]: K = Q, K∞ = Q∞, T = Z_p(1): Hyp(Q∞/Q) holds, since Q is totally real and O_Q^× = {±1} is finite.
TauCeti.EulerSystem.LeopoldtTowerHyp.pure_cubic_fails [non-example]: K = Q(∛2), which has one real and one complex place, K∞ its cyclotomic Z_p-extension and T = Z_p(1): G_{K∞} acts on V by ε_cyc, rank Γ = 1, and K is neither totally real nor imaginary quadratic, so Hyp(K∞/K) fails.
TauCeti.EulerSystem.LeopoldtTowerHyp.Zp2_vacuous [degenerate]: K imaginary quadratic and K∞ its Z_p²-extension: rank_{Z_p} Γ = 2, so the hypothesis is vacuous.
TauCeti.EulerSystem.LeopoldtTowerHyp.elliptic [example]: For T = T_pE with Hyp(K∞, V) and dim V = 2, G_{K∞} cannot act by a scalar character, so Hyp(K∞/K) holds for every K.
Acceptance:
- K = Q with its cyclotomic Z_p-extension satisfies the hypothesis for every T.
- A cubic field with one complex place, with its cyclotomic Z_p-extension and T = Z_p(1), does not.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module — construction
The Iwasawa module X∞ of the restricted Selmer groups
Statement: Let K∞/K be admissible, W* = Hom(T, μ_{p^∞}) and D = Φ/O. For K ⊂_f F ⊂ K∞ let S_{Σp}(F, W*) ⊂ H¹(F, W*) be Rubin's restricted Selmer group: classes whose localisation is 0 at every prime above p and lies in H¹_f(F_w, W*) at every other place (the Selmer module of SelmerIwasawaCohomology L2 with the strict condition on Σ_p). Define S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*) along restriction, a discrete Λ-module, and X∞ = Hom_O(S_{Σp}(K∞, W*), D) with the contragredient action (γφ)(s) = φ(γ^{-1}s), a compact Λ-module. Together with the Iwasawa cohomology H¹_∞(K, T) = lim_F H¹(F, T) along corestriction (SelmerIwasawaCohomology L3) this is Rubin's Definition II.3.1.
Hypotheses:
- X∞ is built from the restricted Selmer groups (strict at p). The true Selmer group, with chosen local conditions at p, is true-iwasawa-selmer-and-singular-quotient; the two are related by Proposition II.3.7.
- The Λ-action on X∞ is the contragredient one; with the other convention every characteristic ideal is replaced by its image under ι.
Proposed API (untyped inventory):
TauCeti.EulerSystem.restrictedSelmerInf [constructor]: S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*), a discrete Λ-module.
TauCeti.EulerSystem.Xinf [data]: X∞ = Hom_O(S_{Σp}(K∞, W*), D) with (γφ)(s) = φ(γ^{-1}s), a compact Λ-module.
TauCeti.EulerSystem.restrictedSelmerInf.res [projection]: The restriction maps S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{Gal(K∞/F)}.
TauCeti.EulerSystem.Xinf_coinvariants [characterisation]: For every F, X∞ ⊗_Λ Λ_F ≅ Hom_O(S_{Σp}(K∞, W*)^{Gal(K∞/F)}, D); for F = K this is X∞/JX∞.
TauCeti.EulerSystem.Xinf_finitelyGenerated [other]: X∞ is a finitely generated Λ-module (x-infinity-finitely-generated).
TauCeti.EulerSystem.Xinf_twist [compatibility]: For ρ: Γ → O^×, X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ as Λ-modules (Rubin, Proposition VI.2.1(ii) and proof of Theorem VI.4.1).
TauCeti.EulerSystem.Xinf_eq_mazurRubin [compatibility]: For K = Q and K∞ = Q∞, Shapiro's lemma identifies X∞ with Mazur–Rubin's X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p) for the canonical Λ-adic Selmer structure of lambda-adic-selmer-structure: at ℓ ≠ p the conditions H¹_f vanish in the colimit because every ℓ ≠ p has infinite decomposition group. The identification is semilinear for the involution ι: with G_Q acting on Λ through Ψ and Λ acting on a Pontryagin dual by (λφ)(x) = φ(λx), Mazur–Rubin's X∞ is this X∞ with Λ acting through ι, so its characteristic ideal is ι(char X∞).
Unit tests (untyped inventory):
TauCeti.EulerSystem.Xinf_rat_Zp1 [computation]: For K = Q, p odd, K∞ = Q∞ and T = Z_p(1) (so W* = Q_p/Z_p), S_{Σp}(Q_n, Q_p/Z_p) is the dual of the Galois group of the maximal abelian p-extension of Q_n unramified everywhere and split completely at p; since p is totally ramified in Q∞/Q and h(Q) = 1, the class numbers of the Q_n are prime to p and X∞ = 0.
TauCeti.EulerSystem.Xinf_coinvariants_rank_one [characterisation]: For d = 1, X∞/(γ − 1)X∞ is the Pontryagin dual of S_{Σp}(K∞, W*)^Γ, for γ a topological generator of Γ.
TauCeti.EulerSystem.Xinf_not_true_selmer [non-example]: X∞ is not in general the dual of the true Selmer group: for T = T_pE (E/Q) with H¹_f(F_w, V) = 0 at p, the kernel H¹_{∞,s}(Q_p, T)/loc^s(H¹_∞(Q, T)) of Proposition II.3.7 has Λ-rank at least 2 − 1 = 1, since H¹_∞(Q_p, T) has Λ-rank 2 by the local Euler characteristic formula while rank_Λ H¹_∞(Q, T) = rank T^- = 1 once X∞ is torsion (Mazur–Rubin, Remark 5.3.18); so Hom(S(Q∞, W*), D) is not torsion although X∞ is.
TauCeti.EulerSystem.Xinf_contragredient [compatibility]: If X∞ ≅ Λ/fΛ with the contragredient action, then with the naive action (γφ)(s) = φ(γs) the same group is Λ/ι(f)Λ; the two conventions agree on characteristic ideals iff char(X∞) = ι(char(X∞)).
Acceptance:
- For K = Q, K∞ = Q∞ and T = Z_p(1), X∞ = 0.
- Twisting T by a character ρ of Γ replaces X∞ by X∞ ⊗ ρ.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
- SelmerIwasawaCohomology:L2/selmer-kernel
- SelmerIwasawaCohomology:L2/pontryagin-dual
- SelmerIwasawaCohomology:L2/selmer-limits
- SelmerIwasawaCohomology:L3/iwasawa-cohomology
- mathlib:PontryaginDual
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system — construction
The Λ-adic class c_{K,∞} of an Euler system
Statement: Let c be an Euler system for (T, 𝒦, N) in the sense of EulerSystemsAndKolyvaginSystems ES.2 (Rubin, Definition II.1.1), with K∞ ⊂ 𝒦 admissible. For K ⊂_f F ⊂_f F' ⊂ K∞, no prime outside N ramifies in F'/F, so the Euler relation reads Cor_{F'/F}(c_{F'}) = c_F. Hence c_{K,∞} = (c_F)_{K ⊂_f F ⊂ K∞} ∈ H¹_∞(K, T), and more generally c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T) = lim_F H¹(LF, T) for K ⊂_f L ⊂ 𝒦. The map ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞}, is O[[Gal(𝒦/K)]]-linear, Gal(𝒦/K) acting on H¹_∞(K, T) through Γ, and c_{K,∞} lies in lim_F S^{Σp}(F, T) (classes unramified at every v ∤ p).
Hypotheses:
- The Euler factors at primes of N do not intervene because N is divisible by p and by every prime where T is ramified (Rubin, discussion after Remark II.1.2).
- The unramifiedness of c_{K,∞} away from p uses admissibility (infinite decomposition groups); without it Rubin's condition (*) is needed (unramified-at-split-primes-condition).
Proposed API (untyped inventory):
TauCeti.EulerSystem.iwasawaClass [constructor]: The map ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞} = (c_F)_F.
TauCeti.EulerSystem.iwasawaClassAt [constructor]: For K ⊂_f L ⊂ 𝒦, c ↦ c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T).
TauCeti.EulerSystem.iwasawaClass_proj [projection]: The image of c_{K,∞} under the projection H¹_∞(K, T) → H¹(F, T) is c_F; for F = K it is c_K.
TauCeti.EulerSystem.iwasawaClass_smul [structure]: c ↦ c_{K,∞} is linear over O[[Gal(𝒦/K)]], acting on H¹_∞(K, T) through Gal(𝒦/K) → Γ.
TauCeti.EulerSystem.iwasawaClass_zero [simp]: The zero Euler system maps to 0.
TauCeti.EulerSystem.iwasawaClass_mem_unramified [other]: c_{K,∞} lies in lim_F S^{Σp}(F, T).
TauCeti.EulerSystem.iwasawaClass_twist [compatibility]: For ρ: Γ → O^× and the twisted Euler system c^ρ of twisting-by-characters-of-gamma, (c^ρ)_{K,∞} is the image of c_{K,∞} ⊗ ξ_ρ under H¹_∞(K, T) ⊗ ρ ≅ H¹_∞(K, T ⊗ ρ).
TauCeti.EulerSystem.iwasawaClass_eq_kappaOne [compatibility]: For K = Q, K∞ = Q∞, the Euler-system-to-Kolyvagin-system map of euler-to-lambda-adic-kolyvagin sends c to κ with κ_1 = (c_{Q_n})_n = c_{Q,∞}.
Unit tests (untyped inventory):
TauCeti.EulerSystem.iwasawaClass_zero_index [degenerate]: For the zero Euler system c_{K,∞} = 0, and hence ind_Λ(c) = 0: Theorems II.3.2–II.3.4 say nothing (Rubin, Remark II.2.8).
TauCeti.EulerSystem.iwasawaClass_norm_coherent [characterisation]: For K ⊂ F ⊂ F' ⊂ K∞, Cor_{F'/F}(c_{F'}) = c_F. A family built with restriction maps (res_{F'/F}(c_F) = c_{F'}) is not an element of the corestriction limit and fails this test.
TauCeti.EulerSystem.iwasawaClass_proj_base [compatibility]: The projection of c_{K,∞} to H¹(K, T) is c_K, the class whose index ind_O(c) ES.4 uses.
TauCeti.EulerSystem.iwasawaClass_cyclotomic [computation]: For the cyclotomic-unit Euler system for T* = O_{χ^{-1}}(1) over Q∞ (EulerSystemsCyclotomicMainConjecture L0), the component of c_{Q,∞} at Q_n is the Kummer image of the χ-part of the norm of the cyclotomic p-units of L_n, so Λc_{Q,∞} corresponds to C_{∞,χ} (Rubin, Proposition III.2.6(i)).
Acceptance:
- Its projection to H¹(K, T) is c_K.
- The zero Euler system maps to 0.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
- EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module
- SelmerIwasawaCohomology:L3/iwasawa-cohomology
- SelmerIwasawaCohomology:L3/universal-norms-unramified
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/lambda-index — definition
The Λ-adic index of divisibility ind_Λ
Statement: For x ∈ H¹_∞(K, T) let ind_Λ(x) = {φ(x) : φ ∈ Hom_Λ(H¹_∞(K, T), Λ)}, an ideal of Λ; for an Euler system c, ind_Λ(c) = ind_Λ(c_{K,∞}) (Rubin, Definition II.3.1). For an ideal 𝔞 and a finitely generated torsion Λ-module B, 'char(B) divides 𝔞' means 𝔞 ⊂ char(B); ind_Λ(c) need not be principal.
Hypotheses:
- H¹_∞(K, T) is a finitely generated Λ-module (SelmerIwasawaCohomology L3), so Hom_Λ(H¹_∞(K, T), Λ) is finitely generated and ind_Λ(x) is a finitely generated ideal.
- ind_Λ is the Λ-analogue of ES.4's ind_O (Rubin, Definition II.2.1); it is not Mazur–Rubin's principal ideal Ind (lambda-adic-ind), though divisibility by a principal ideal is the same for both.
Proposed API (untyped inventory):
TauCeti.EulerSystem.lambdaIndex [data]: ind_Λ(x) = Ideal.span {φ x | φ ∈ Module.Dual Λ H¹_∞(K, T)}.
TauCeti.EulerSystem.lambdaIndex_smul [simp]: ind_Λ(λx) = λ · ind_Λ(x).
TauCeti.EulerSystem.lambdaIndex_eq_bot_iff [characterisation]: ind_Λ(x) = 0 iff x ∈ H¹_∞(K, T)_{Λ-tors}.
TauCeti.EulerSystem.apply_mem_lambdaIndex [constructor]: For every φ ∈ Hom_Λ(H¹_∞(K, T), Λ), φ(x) ∈ ind_Λ(x).
TauCeti.EulerSystem.lambdaIndex_of_rank_one [example]: If H¹_∞(K, T)/torsion ≅ Λ via ψ then ind_Λ(x) = (ψ(x)).
TauCeti.EulerSystem.lambdaIndex_le_span_iff [compatibility]: For d = 1 and f ∈ Λ, ind_Λ(x) ⊂ (f) iff f divides Mazur–Rubin's Ind(x) of lambda-adic-ind computed in the same module (across the ι-semilinear Shapiro identification with H¹(Q, 𝐓), apply ι); so char(B) | ind_Λ(x) iff char(B) | Ind(x).
TauCeti.EulerSystem.lambdaIndex_twist [compatibility]: Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c) for ρ: Γ → O^× (Rubin, proof of Theorem VI.4.1).
TauCeti.EulerSystem.lambdaIndex_map_le [functoriality]: For a Λ-linear f: H¹_∞(K, T) → H′, ind_Λ(f x) ⊂ ind_Λ(x) (every functional on H′ pulls back).
Unit tests (untyped inventory):
TauCeti.EulerSystem.lambdaIndex_free_rank_one [computation]: If H¹_∞(K, T) ≅ Λ with c_{K,∞} ↦ f, then ind_Λ(c) = fΛ.
TauCeti.EulerSystem.lambdaIndex_not_principal [non-example]: If H¹_∞(K, T) ≅ Λ² (d = 1) and x ↦ (p, γ − 1), then ind_Λ(x) = (p, γ − 1), the maximal ideal of Z_p[[Γ]] when O = Z_p, which is not principal; a definition as char(H¹_∞/Λx) gives 0 (the quotient has rank one) and is wrong.
TauCeti.EulerSystem.lambdaIndex_torsion [degenerate]: If x is Λ-torsion, ind_Λ(x) = 0.
TauCeti.EulerSystem.lambdaIndex_dvd_iff_Ind [compatibility]: For d = 1 and x ↦ (a_1, …, a_r) in a free reflexive hull, (f) ⊇ ind_Λ(x) iff f | gcd(a_1, …, a_r), the generator of Mazur–Rubin's Ind(x).
Acceptance:
- H¹_∞ ≅ Λ with x ↦ f gives ind_Λ(x) = (f).
- H¹_∞ ≅ Λ² with x ↦ (p, γ − 1) gives the non-principal ind_Λ(x) = (p, γ − 1).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- SelmerIwasawaCohomology:L3/iwasawa-descent
- PadicMeasuresIwasawaAlgebras:L4/reflexive-free-over-regular-local
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal
- mathlib:Module.Dual
- mathlib:Ideal.span
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/true-iwasawa-selmer-and-singular-quotient — construction
The true Iwasawa Selmer group and the singular local term at p
Statement: Suppose that for every K ⊂_f F ⊂ K∞ and every w | p there are subspaces H¹_f(F_w, V) ⊂ H¹(F_w, V) and H¹_f(F_w, V*) ⊂ H¹(F_w, V*) that are orthogonal complements under the local Tate pairing, with Cor_{F'_{w'}/F_w} H¹_f(F'_{w'}, V) ⊂ H¹_f(F_w, V) and Res_{F'_{w'}/F_w} H¹_f(F_w, V*) ⊂ H¹_f(F'_{w'}, V*) for F ⊂ F', w' | w. Propagate them to T and W* (SelmerIwasawaCohomology L2) and put H¹_s = H¹/H¹_f, H¹(F_p, ·) = ⊕_{w|p} H¹(F_w, ·). Define S(K∞, W*) = colim_F S(F, W*), H¹_{∞,s}(K_p, T) = lim_F H¹_s(F_p, T), and loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T) the localisation (Rubin, Remark II.3.6).
Hypotheses:
- The two compatibility inclusions are equivalent, by the local pairing and orthogonality.
- The construction depends on the chosen H¹_f at p; ordinary, Bloch–Kato and unit conditions are supplied by the consumers (SelmerIwasawaCohomology L2 and L4, KatoEulerSystems, EulerSystemsCyclotomicMainConjecture).
Proposed API (untyped inventory):
TauCeti.EulerSystem.trueSelmerInf [constructor]: S(K∞, W*) = colim_F S(F, W*) for compatible orthogonal conditions at p.
TauCeti.EulerSystem.singularLocalInf [data]: H¹_{∞,s}(K_p, T) = lim_F ⊕_{w|p} H¹_s(F_w, T).
TauCeti.EulerSystem.locSingularInf [projection]: loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T), Λ-linear.
TauCeti.EulerSystem.restrictedSelmerInf_le_true [other]: S_{Σp}(K∞, W*) ⊂ S(K∞, W*).
TauCeti.EulerSystem.compatible_cor_iff_res [characterisation]: Corestriction-stability of H¹_f(·, V) is equivalent to restriction-stability of H¹_f(·, V*).
TauCeti.EulerSystem.singularLocal_torsionFree [other]: Each H¹_s(F_w, T) is O-torsion-free.
TauCeti.EulerSystem.singularLocalInf_eq_zero_of_full [example]: If H¹_f(F_w, V) = H¹(F_w, V) for all w | p, then H¹_{∞,s}(K_p, T) = 0 and S(K∞, W*) = S_{Σp}(K∞, W*).
Unit tests (untyped inventory):
TauCeti.EulerSystem.singularLocalInf_full_condition [degenerate]: With H¹_f(F_w, V) = H¹(F_w, V) at all w | p, H¹_f(F_w, V*) = 0, the propagated condition on W* is 0, so S(K∞, W*) = S_{Σp}(K∞, W*) and H¹_{∞,s}(K_p, T) = 0.
TauCeti.EulerSystem.singularLocal_strict_condition [computation]: With H¹_f(F_w, V) = 0 at all w | p, H¹_f(F_w, T) is the torsion of H¹(F_w, T) and H¹_s(F_w, T) = H¹(F_w, T)/H¹(F_w, T)_tors.
TauCeti.EulerSystem.singularLocalInf_cyclotomic [computation]: For T* = O_{χ^{-1}}(1) over Q∞ with the unit condition, H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ, which is O if χ(p) = 1 and 0 otherwise (Rubin, Proposition III.2.6(ii)).
TauCeti.EulerSystem.singularLocal_not_torsion [non-example]: H¹(F_w, T) can have nonzero O-torsion (e.g. H⁰(F_w, W) ≠ 0 gives torsion in H¹(F_w, T)), but H¹_s(F_w, T) never does: a definition of H¹_s as H¹(F_w, T) modulo the image of H¹_f(F_w, V) without saturation fails this.
Acceptance:
- If H¹_f(F_w, V) = H¹(F_w, V) at every w | p, then H¹_{∞,s}(K_p, T) = 0 and S(K∞, W*) = S_{Σp}(K∞, W*).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- SelmerIwasawaCohomology:L2/condition-propagation
- SelmerIwasawaCohomology:L2/dual-selmer-structure
- SelmerIwasawaCohomology:L2/selmer-kernel
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma — construction
Twisting Euler systems by characters of infinite order
Statement: Let c be an Euler system for (T, 𝒦, N) with K∞ ⊂ 𝒦 admissible, and ρ: Gal(𝒦/K) → O^× a continuous character factoring through a finite extension of K∞ (for instance a character of Γ, possibly of infinite order). Write T ⊗ ρ = T ⊗_O O_ρ, fix a generator ξ_ρ of O_ρ, and let Tw_ρ: Λ → Λ be the O-algebra automorphism induced by γ ↦ ρ(γ)γ. (a) For K ⊂_f L, the cocycle map induces isomorphisms H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ) and S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ) for every finite Σ ⊇ Σ_p (Rubin, Proposition VI.2.1). (b) Choose L ⊂ 𝒦 finite over K with ρ factoring through Gal(LK∞/K) and LK∞/K ramified only at N, ∞ and the conductor of ρ. For K ⊂_f F ⊂ 𝒦 let c^ρ_F be the image of c_{FL,∞} ⊗ ξ_ρ under H¹_∞(FL, T) ⊗ ρ ≅ H¹_∞(FL, T ⊗ ρ) → H¹(FL, T ⊗ ρ) → H¹(F, T ⊗ ρ), the last map being Cor_{FL/F}. Then c^ρ is an Euler system for (T ⊗ ρ, 𝒦, fN), f the finite prime-to-p part of the conductor of ρ, independent of L (Definition VI.3.1, Remark VI.3.2, Theorem VI.3.5).
Hypotheses:
- ρ must factor through a finite extension of K∞; if needed one enlarges K∞ to the compositum of all Z_p-extensions of K in 𝒦 (Rubin, Definition VI.3.1).
- There is in general no map H¹(L, T) → H¹(L, T ⊗ ρ) (Rubin, Remark VI.2.2): the construction must pass through H¹_∞.
Proposed API (untyped inventory):
TauCeti.EulerSystem.twistGamma [constructor]: c ↦ c^ρ, an Euler system for (T ⊗ ρ, 𝒦, fN).
TauCeti.EulerSystem.twistGamma_eulerRelation [characterisation]: The Euler factors of c^ρ are P(Fr_q^{-1}|(T⊗ρ)*; x) = P(Fr_q^{-1}|T*; ρ(Fr_q)x).
TauCeti.EulerSystem.twistGamma_twistGamma [relation]: (c^ρ)^{ρ'} = c^{ρρ'} when every divisor of f_ρ f_{ρ'} divides f_{ρρ'}N; in particular (c^ρ)^{ρ^{-1}} = c when f_ρ | N.
TauCeti.EulerSystem.twistGamma_of_finiteOrder [compatibility]: For ρ of finite order, c^ρ is ES.2's finite-order twist (Rubin, Definition II.4.1).
TauCeti.EulerSystem.iwasawaCohomologyTwistEquiv [equivalence]: H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ), semilinear for Tw_ρ.
TauCeti.EulerSystem.selmerTwistEquiv [equivalence]: S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ) for finite Σ ⊇ Σ_p, and the same for W*.
TauCeti.EulerSystem.exists_good_twist [other]: (Rubin, Lemma VI.1.3) (i) For B free of finite rank over O and subgroups J_1, …, J_k of G_K with infinite image in Γ, the ρ ∈ Hom(Γ, O^×) with (B ⊗ ρ)^{J_i^{p^n}} = 0 for all i, n contain an open dense subset; (ii) for B a finitely generated torsion Λ-module, the ρ with (B ⊗ ρ) ⊗_Λ Λ_F finite for every F are dense.
TauCeti.EulerSystem.twistGamma_tate [compatibility]: For K∞ the cyclotomic Z_p-extension, twisting by ω^{-n}ε_cyc^n agrees with SelmerIwasawaCohomology L3's twist of Iwasawa cohomology by Tate twists (Rubin, Chapter VI §5.1).
Unit tests (untyped inventory):
TauCeti.EulerSystem.twistGamma_one [degenerate]: For ρ = 1, c^ρ = c.
TauCeti.EulerSystem.twistGamma_eulerFactor_rank_one [computation]: For T = O(1), T* = O and P(Fr_q^{-1}|T*; x) = 1 − x; for T ⊗ ρ the Euler factor is 1 − ρ(Fr_q)x.
TauCeti.EulerSystem.twistGamma_not_pointwise [non-example]: For ρ nontrivial on G_F, c^ρ_F is not obtained from c_F alone: H¹(F, T) has no natural map to H¹(F, T ⊗ ρ) (Rubin, Remark VI.2.2); the definition through c_{FL,∞} is needed.
TauCeti.EulerSystem.twistGamma_finiteOrder_agrees [compatibility]: For ρ of finite order with L the field cut out by ρ, c^ρ equals the twist of Rubin's Definition II.4.1 owned by ES.2.
Acceptance:
- ρ = 1 gives c^1 = c.
- For rank-one T = O(1) the Euler factor of c^ρ at q is 1 − ρ(Fr_q)x.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.2/twisting
- EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial
- SelmerIwasawaCohomology:L3/iwasawa-cohomology
- PadicMeasuresIwasawaAlgebras:L1
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems — theorem
Invariance of the Iwasawa-theoretic statements under twisting
Statement: Let c be an Euler system for (T, K∞) and ρ: Γ → O^× a character, with c^ρ the twisted Euler system of twisting-by-characters-of-gamma. Then X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ, Tw_ρ(char X∞(T ⊗ ρ)) = char X∞(T), Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c), and Hyp(K∞, T), Hyp(K∞, V), Hyp(K∞/K) hold for T iff they hold for T ⊗ ρ. Consequently Theorems II.3.2, II.3.3 and II.3.4 for (T, c) are equivalent to the same theorems for (T ⊗ ρ, c^ρ).
Hypotheses:
- ρ is a character of Γ = Gal(K∞/K), so G_{K∞} acts on T ⊗ ρ as on T.
- The equalities of characteristic ideals use that Tw_ρ preserves heights of ideals of Λ.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Twisting by ρ and then by ρ^{-1} returns the original statements (for f_ρ | N).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-index
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis
- PadicMeasuresIwasawaAlgebras:L4
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower — theorem
Kernels and cokernels of restriction along the tower
Statement: Let N be the ideal of an Euler system for (T, K∞) and assume, after twisting by a character of Γ (twisting-invariance-of-iwasawa-theorems), that for every prime λ | N the decomposition group of λ in G_K contains γ_λ with T^{γ_λ^{p^n}=1} = (T*)^{γ_λ^{p^n}=1} = 0 for all n ≥ 0. Define the ideals A_glob = Ann_Λ(W^{G_{K∞}}) if rank Γ > 1 and Ann_Λ(W^{G_{K∞}}/(W^{G_{K∞}})_div) if Γ ≅ Z_p, the local A_v (v | p, using K_{∞,w}; v ∤ p, using inertia), A_N = ∏_{v|N} A_vΛ, and A*_glob, A*_N with W* in place of W (Rubin, Definition VII.3.1); these ideals have height at least two. Then for K ⊂_f F ⊂ K∞ and M a power of p: (i) ker(H¹(F, W) → H¹(K∞, W)^{G_F}) is finite and killed by A_glob; (ii) ker(H¹(F, W_M) → H¹(F, W)_M) is finite, bounded independently of M, and killed by Ann_Λ(W^{G_{K∞}}); (iii) coker(S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{G_F}) is finite and killed by A*_glob A*_N; (iv) if S_{Σp}(K∞, W*)^{G_F} is finite, then for every power M ≥ M_F of p, A*_glob A*_N kills coker(S_{Σp}(F, W*_M) → S_{Σp}(K∞, W*)^{G_F}); (v) coker(S_{Σp}(F, W*_M) → S_{Σp}(F, W*)_M) is finite and bounded independently of M (Rubin, Proposition VII.3.4). Moreover H^i(K∞/F, W^{G_{K∞}}), H^i(K∞/F, (W*)^{G_{K∞}}) and the local H^i(K_{∞,w}/F_w, (W*)^{G_{K_{∞,w}}}) (w | p) are finite and killed by A_glob, A*_glob, A*_v respectively, for i ≥ 1 (Lemma VII.3.3).
Hypotheses:
- The twist assumption (5) is available by Lemma VI.1.3(i) applied to T ⊕ T*; Lemma VII.3.7 is proved without it.
- Pseudo-nullity here means annihilated by an ideal of height at least two; for d ≥ 2 a pseudo-null module need not be finite, but every error term in this theorem is moreover finite.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Every error ideal has height ≥ 2, so the errors never affect characteristic ideals.
- For T = Z_p, so W* = μ_{p^∞}, the cokernel in (iii) for F = K is finite even though the twist assumption (5) fails for W, because it holds for W* (the case used in the proof of Lemma VII.3.7).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma
- ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence
- SelmerIwasawaCohomology:L2/lattice-passage
- SelmerIwasawaCohomology:L2/finite-unramified-comparison
- SelmerIwasawaCohomology:L2/selmer-limits
- mathlib:Ideal.height
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated — lemma
X∞ is finitely generated over Λ
Statement: For every admissible K∞/K and every T, the Λ-module X∞ = Hom_O(S_{Σp}(K∞, W*), D) is finitely generated (Rubin, Lemma VII.4.1).
Hypotheses:
- No large-image hypothesis is needed.
- Rubin's proof uses Proposition VII.3.4(iii), stated after the twist (5); the twist does not change finite generation, since X∞(T⊗ρ) ≅ X∞(T) ⊗ ρ.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- For X∞ = 0 (T = Z_p(1) over Q∞) the statement is trivial; for T = O_{χ^{-1}}(1) over Q∞, X∞ is the χ-part of the Iwasawa module of the p-split unramified extension, a finitely generated torsion Λ-module.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower
- EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems
- SelmerIwasawaCohomology:L2/selmer-limits
- PadicMeasuresIwasawaAlgebras:L5
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps — construction
Rubin's evaluation maps and the constant a_τ
Statement: Assume Hyp(K∞, V) and fix τ ∈ G_K as in Hyp(K∞, V)(i), fixing K(1), K∞, μ_{p^∞} and (O_K^×)^{1/p^∞}. Fix θ*: W*/(τ−1)W* ≅ D. Let Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), Ω∞ = K∞Ω and Ω∞^{⟨τ⟩} the fixed field of τ. The evaluation map Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D) is Ev*(σ)([c]) = θ*(c(σ)). With q_τ(x) = det(1 − τx | T)/(x − 1) ∈ O[x], the dual θ: (W^{τ=1})_div ≅ D of θ* (extended to W^{τ=1}) and θ̄ = θ ∘ q_τ(τ^{-1}): W/(τ−1)W ↠ D, the map Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D) is Ev(σ)([c]) = θ̄(c(σ)); for q ∈ R_{F,M,τ} (primes whose Frobenius is conjugate to τ in Gal(FΩ_M/K)), Ev_q(c) = θ(c(σ_q)). Their Λ_{F,M}-valued forms Ev~ are the images under the O-isomorphism Hom_O(B, O/M) ≅ Hom_Λ(B, Λ_{F,M}), ψ ↦ Σ_η ψ(ηb)η^{-1}. Finally a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|}, where Z (resp. Z*) is the largest G_{K∞}-stable submodule of (τ−1)W (resp. (τ−1)W*) (Rubin, Definitions VII.1.1, 1.2, 2.1–2.5).
Hypotheses:
- The extension of θ to W^{τ=1} is not unique; two choices differ by an element of Hom(W^{τ=1}/(W^{τ=1})_div, D), which a_τ kills.
- Ev and Ev* are not Λ-module maps: G_{Ω∞} is not a Λ-module. They are equivariant only for an action of Z_p[[Γ_0]] on Gal(L/Ω∞), Γ_0 ⊂ Γ of finite index, twisted by characters χ, χ* (Rubin, Proposition VII.5.1).
Proposed API (untyped inventory):
TauCeti.EulerSystem.evalStar [constructor]: Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D), σ ↦ ([c] ↦ θ*(c(σ))).
TauCeti.EulerSystem.eval [constructor]: Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D), σ ↦ ([c] ↦ θ̄(c(σ))).
TauCeti.EulerSystem.evalAt [constructor]: Ev_q: H¹(F, W)_M → D for q ∈ R_{F,M,τ}, c ↦ θ(c(σ_q)).
TauCeti.EulerSystem.aTau [data]: a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|} ∈ Z_{>0}.
TauCeti.EulerSystem.aTau_eq_one [simp]: Under Hyp(K∞, T), a_τ = 1.
TauCeti.EulerSystem.groupRingDualEquiv [equivalence]: Hom_O(B, O/MO) ≅ Hom_Λ(B, Λ_{F,M}) as O-modules, ψ ↦ (b ↦ Σ_η ψ(ηb)η^{-1}), with (σψ)~ = σ^{-1}ψ~.
TauCeti.EulerSystem.eval_frobenius_derivative [relation]: Ev~(Fr_q)(κ_{F,r,M}) = Ev~_q(κ_{F,rq,M}) for r ∈ R_{F,M} and q ∈ R_{F,M,τ} prime to r (Rubin, Theorem VII.2.6).
TauCeti.EulerSystem.eval_pairing [relation]: a_τ Ev~_q(S^{Σ_prq}(F, W_M)) · Ev*_{S_{Σ_pr}(F, W*_M)}(Fr_q) = 0, and a_τ Ev~(γ)(κ_{F,r,M}) Ev*(γ) = 0 for γ ∈ τG_{Ω∞} (Rubin, Theorem VII.2.7, Corollary VII.2.8).
TauCeti.EulerSystem.eval_semilinear [other]: There are Γ_0 ⊂ Γ of finite index, characters χ, χ*: Γ_0 → O^× and an abelian L ⊃ Ω∞ such that Ev, Ev* factor through Gal(L/Ω∞) and Ev(γ^η) = χ(η)η(Ev(γ)), Ev*(γ^η) = χ*(η)η(Ev*(γ)) (Rubin, Proposition VII.5.1).
Unit tests (untyped inventory):
TauCeti.EulerSystem.aTau_rank_one [degenerate]: For rank_O T = 1 and τ = 1: W^{τ=1} = W is divisible and (τ−1)W = 0, so a_τ = 1.
TauCeti.EulerSystem.aTau_unipotent_lower_bound [computation]: For T = O² with τ acting by the matrix (1 ϖ^m; 0 1), m ≥ 1: W^{τ=1} = D ⊕ D[ϖ^m], (W^{τ=1})_div = D ⊕ 0, so [W^{τ=1} : (W^{τ=1})_div] = |k|^m divides a_τ; here T/(τ−1)T ≅ O ⊕ O/ϖ^m is not free, so Hyp(K∞, T)(i) fails although dim V/(τ−1)V = 1.
TauCeti.EulerSystem.evalStar_wellDefined [characterisation]: Ev*(σ) does not depend on the cocycle representing [c]: changing c by a coboundary changes c(σ) by (σ−1)w ∈ (τ−1)W* = ker θ*.
TauCeti.EulerSystem.eval_not_Lambda_linear [non-example]: Ev is not Λ-linear for the naive action: for η ∈ Γ_0, Ev(γ^η) = χ(η)η(Ev(γ)) with the character χ of Proposition VII.5.1, which is nontrivial when the centre of Gal(K(W)/K) acts on W by a nontrivial scalar.
Acceptance:
- Rank one with τ = 1: a_τ = 1.
- For T = O² with τ acting by (1 ϖ^m; 0 1), m ≥ 1, |k|^m divides a_τ.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes
- EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-class
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties
- EulerSystemsAndKolyvaginSystems:ES.3/congruence
- SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system — theorem
Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)
Statement: Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V). If c_{K,∞} does not belong to the Λ-torsion submodule of H¹_∞(K, T), then X∞ is a torsion Λ-module.
Hypotheses:
- No hypothesis on p (p = 2 allowed) and no Hyp(K∞/K) are needed.
- The conclusion is the weak Leopoldt conjecture for T (Rubin, Remark II.3.5).
- Non-torsion of c_{K,∞} is a hypothesis to be proved by each application (for instance Kato's Proposition 13.7 in KatoEulerSystems L4); this roadmap does not supply it.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- For the cyclotomic-unit Euler system for O_{χ^{-1}}(1) over Q∞, χ even, nontrivial and of finite order prime to p (Rubin, Chapter III §2.2), the hypothesis holds and X∞ is torsion.
- The zero Euler system does not satisfy the hypothesis, and the theorem says nothing about it.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps
- EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-class
- EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses
- ArithmeticGaloisDuality:R02.1/rationalization
- mathlib:Module.IsTorsion
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case — lemma
The rank-one exceptional actions (Rubin, Lemma VII.3.7)
Statement: Suppose Γ ≅ Z_p and either K is imaginary quadratic or K is totally real and Leopoldt's conjecture holds for K, and that Hyp(K∞, V) holds. (i) If G_{K∞} acts trivially on T, then X∞/Ann_Λ(T)X∞ is finite. (ii) If G_{K∞} acts trivially on T(−1) = T ⊗ O(ε_cyc^{-1}), then X∞/Ann_Λ(T(−1))X∞ is finite.
Hypotheses:
- These are exactly the cases singled out by Hyp(K∞/K).
- Hyp(K∞, V)(ii) forces rank_O T = 1 in both cases, with T a twist of O or O(1) by a character of Γ.
- The lemma is proved without the twist assumption (5) of restriction-control-over-the-tower, which may fail for W = Q_p/Z_p; it holds for W* and Proposition VII.3.4(iii) is still available.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- K = Q, K∞ = Q∞, T = Z_p(1): X∞ = 0, so the quotient is 0.
- Without Hyp(K∞/K) (a field with r_2 ≥ 1 not imaginary quadratic, T = Z_p(1)) the quotient X∞/JX∞ can be infinite, since K has a Z_p²-extension in which the primes above p are not infinitely split.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower
- EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems
- SelmerIwasawaCohomology:L4
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction — theorem
Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6)
Statement: Assume Hyp(K∞, V) and Hyp(K∞/K), c an Euler system for (T, K∞) with c_{K,∞} not Λ-torsion, so X∞ is torsion (weak-leopoldt-from-an-euler-system), and assume after twisting (twisting-invariance-of-iwasawa-theorems) that X∞ ⊗ Λ_F and Λ_F/char(X∞)Λ_F are finite for every F (Rubin's (1)) and that the twist assumption (5) of restriction-control-over-the-tower holds. Fix an injective pseudo-isomorphism ⊕_{i=1}^{r} Λ/f_iΛ → X∞ with f_{i+1} | f_i, so char(X∞) = ∏ f_iΛ. (a) There are z_1, …, z_r ∈ X∞ and ideals g_1 ⊂ … ⊂ g_r of Λ with z_k ∈ Ev*(τG_{Ω∞}), a_τ g_k ⊂ f_kΛ, split exact sequences 0 → Σ_{i<k} Λz_i → Σ_{i≤k} Λz_i → Λ/g_k → 0, and a_τ(X∞/Σ_i Λz_i) pseudo-null (Proposition VII.1.4). (b) With Z∞ = Σ Λz_i, a Selmer sequence of length k is (σ_1, …, σ_k) in τG_{Ω∞} with Ev*(σ_i) − z_i ∈ 𝔐Z∞; for M a power of p, L_{F,M} is the fixed field of the common kernel of S_{Σp}(F, W*_M) restricted to FΩ_M, and a Kolyvagin sequence for F, M is (Q_1, …, Q_k) with Q_i over q_i ∈ R and Fr_{Q_i} = σ_i on L_{F,M}; Ψ(k, F, M) ⊂ Λ_{F,M} is the ideal generated by all ψ(κ_{F,r(π),M}), π of length k, ψ ∈ Hom_Λ(Λ_{F,M}κ_{F,r(π),M}, Λ_{F,M}) (Definition VII.1.5). (c) There is h ∈ Λ prime to char(X∞) and, for every F, a power N_F of p such that h a_τ^5 Ψ(k, F, MN_F)Λ_{F,M} ⊂ f_{k+1}Ψ(k+1, F, M) for every power M ≥ N_F of p and 0 ≤ k < r (Proposition VII.1.6).
Hypotheses:
- Kolyvagin sequences exist by the Chebotarev density theorem applied to the finite extensions L_{F,M}/K (EulerSystemsAndKolyvaginSystems ES.1); r(π) ∈ R_{F,M} (Lemma IV.1.3).
- In the common special case Hyp(K∞, T), O = Z_p and H¹(Ω∞/K∞, W*) = 0, (a) holds with g_i = f_iΛ and any z_i realising the pseudo-isomorphism (Rubin, §6, first paragraph).
- Pseudo-null means annihilated by an ideal of height at least two; for d ≥ 2 such modules need not be finite.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Rank one, Hyp(K∞, T), O = Z_p and H¹(Ω∞/K∞, W*) = 0: g_i = f_iΛ and a_τ = 1.
- r = 0 (X∞ pseudo-null): nothing to induct; char(X∞) = Λ.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps
- EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower
- EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems
- EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case
- EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-class
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties
- EulerSystemsAndKolyvaginSystems:ES.3/congruence
- PadicMeasuresIwasawaAlgebras:L4/pseudo-null
- PadicMeasuresIwasawaAlgebras:L4/torsion-structure-normal-domain
- PadicMeasuresIwasawaAlgebras:L4
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error — theorem
The error-tolerant Iwasawa bound char(X∞) | a_τ^{5r} ind_Λ(c) (Rubin, Theorem VII.1.9)
Statement: Let K∞/K be admissible, c an Euler system for (T, K∞), and assume Hyp(K∞, V) and Hyp(K∞/K). Let r be the number of elementary divisors of X∞ (with r = 0 if X∞ is pseudo-null) and a_τ the constant of iwasawa-evaluation-maps. Then char(X∞) divides a_τ^{5r} ind_Λ(c), that is, a_τ^{5r} ind_Λ(c) ⊂ char(X∞).
Hypotheses:
- If c_{K,∞} is Λ-torsion then ind_Λ(c) = 0 and there is nothing to prove; otherwise X∞ is torsion by weak-leopoldt-from-an-euler-system and r is finite.
- The error a_τ^{5r} is an explicit integer: this is the Iwasawa-theoretic counterpart of ES.4's error-tolerant interface, and it disappears exactly when a_τ = 1, e.g. under Hyp(K∞, T).
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Under Hyp(K∞, T), a_τ = 1 and the bound is char(X∞) | ind_Λ(c) (rubin-iwasawa-divisibility).
- In the example of iwasawa-evaluation-maps with τ = (1 ϖ^m; 0 1), a_τ is divisible by |k|^m, so the bound char(X∞) | a_τ^{5r} ind_Λ(c) is a divisibility only up to a power of p that is at least |k|^{5mr}.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-index
- EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-class
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal
- SelmerIwasawaCohomology:L3/universal-norms-unramified
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility — theorem
Rubin's Iwasawa divisibility char(X∞) | ind_Λ(c) (Theorem II.3.3)
Statement: Let K∞/K be admissible and c an Euler system for (T, K∞). If T satisfies Hyp(K∞, T) and Hyp(K∞/K), then char(X∞) divides ind_Λ(c), i.e. ind_Λ(c) ⊂ char(X∞).
Hypotheses:
- Rubin's convention: char(X∞) = 0 when X∞ is not torsion; if c_{K,∞} is torsion both sides are 0.
- Integral divisibility needs Hyp(K∞, T); under only Hyp(K∞, V) one gets rubin-rational-iwasawa-divisibility.
- Valid for every d ≥ 1 and also for p = 2 (Rubin, after Corollary III.2.4, as used in EulerSystemsCyclotomicMainConjecture); for d ≥ 2 divisibility of characteristic ideals ignores pseudo-null modules, which need not be finite.
- This is a divisibility only; equality needs the separately sourced primitivity or main-conjecture arguments of the consumers.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Cyclotomic units (EulerSystemsCyclotomicMainConjecture L2): T* = O_{χ^{-1}}(1) satisfies Hyp(Q∞, T*) with τ = 1 and Hyp(Q∞/Q) since K = Q.
- Scaling c by λ ∈ Λ multiplies ind_Λ(c) by λ, so the divisibility for λc is weaker; it cannot certify more than for c.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-index
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility — theorem
Divisibility up to a power of p (Rubin, Theorem II.3.4)
Statement: Let K∞/K be admissible and c an Euler system for (T, K∞). If V satisfies Hyp(K∞, V) and Hyp(K∞/K), then there is an integer t ≥ 0 such that char(X∞) divides p^t ind_Λ(c).
Hypotheses:
- t is effective: t can be taken with p^t = a_τ^{5r} up to a unit (Theorem VII.1.9).
- At height-one primes 𝔓 ≠ ϖΛ (the only height-one prime containing p) this gives length_{Λ_𝔓}((X∞)_𝔓) ≤ ord_𝔓(ind_Λ(c)), the form in which KatoEulerSystems L4 states its imported bound.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- With Hyp(K∞, T), t = 0 recovers Theorem II.3.3.
- For T = O² with τ = (1 ϖ^m; 0 1), V irreducible over G_{K∞} and Hyp(K∞/K), the theorem applies although Hyp(K∞, T) fails.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence — theorem
The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7)
Statement: With the data of true-iwasawa-selmer-and-singular-quotient there is an exact sequence of Λ-modules 0 → H¹_{∞,s}(K_p, T)/loc^s_{Σp}(H¹_∞(K, T)) → Hom_O(S(K∞, W*), D) → X∞ → 0.
Hypotheses:
- No hypothesis on T or on an Euler system is needed.
- It uses that H¹_∞(K, T) = lim_F S^{Σp}(F, T), which needs admissibility (every v ∤ p has infinite decomposition group).
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- If H¹_f = H¹ at p, the left term vanishes and Hom(S(K∞, W*), D) = X∞.
- For T* = O_{χ^{-1}}(1) over Q∞ with the unit condition, the left term is a quotient of Y∞^χ/U∞^χ, which is O if χ(p) = 1 and 0 otherwise.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/true-iwasawa-selmer-and-singular-quotient
- EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module
- SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate
- SelmerIwasawaCohomology:L3/universal-norms-unramified
- mathlib:PontryaginDual
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility — theorem
Divisibility for the true Selmer group (Rubin, Theorem II.3.8)
Statement: Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V) and Hyp(K∞/K), with local conditions at p as in true-iwasawa-selmer-and-singular-quotient. If loc^s_{Σp}(c_{K,∞}) ∉ H¹_{∞,s}(K_p, T)_{Λ-tors} and H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞}) is a torsion Λ-module, then Hom_O(S(K∞, W*), D) is a torsion Λ-module and (i) for some t ≥ 0, char(Hom_O(S(K∞, W*), D)) divides p^t char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})); (ii) if T satisfies Hyp(K∞, T), char(Hom_O(S(K∞, W*), D)) divides char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})).
Hypotheses:
- The right-hand side is principal, so the divisibility is between principal ideals.
- The torsion hypothesis on H¹_{∞,s}(K_p, T)/Λ loc^s(c_{K,∞}) is the rank-one condition at p; it is verified by each application (Coleman maps and explicit reciprocity in KatoEulerSystems and PadicHodgeRegulators).
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Cyclotomic units with the unit condition at p do not satisfy the hypotheses: H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ is O or 0, hence Λ-torsion, so loc^s(c_{Q,∞}) is torsion. EulerSystemsCyclotomicMainConjecture L2 therefore derives char(A∞^χ) | J² char(E∞^χ/C_{∞,χ}) from rubin-iwasawa-divisibility and iwasawa-poitou-tate-sequence directly (Rubin, proof of Theorem III.2.7), not from this theorem.
- If H¹_f = H¹ at p the hypotheses fail (H¹_{∞,s} = 0 makes loc^s(c_{K,∞}) torsion), so the theorem does not apply; Theorems II.3.3–II.3.4 must be used instead.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence
- EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility
- EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-index
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-3
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/unramified-at-split-primes-condition — definition
Rubin's condition (*) at completely split primes
Statement: Let K∞/K be a Z_p^d-extension, not necessarily admissible, and c a collection satisfying all conditions of an Euler system for (T, 𝒦, N) except possibly the no-complete-splitting clause of Definition II.1.1(ii). Condition (*): for every prime q of K that splits completely in K∞/K and every finite extension F of K in 𝒦, (c_F)_q ∈ H¹_ur(F_q, T). Under (*), Theorems II.3.2, II.3.3 and II.3.4 hold without the assumption that no finite prime splits completely in K∞/K.
Hypotheses:
- Rubin gives the replacement argument as a remark (Chapter IX §2): (*) replaces the use of non-splitting in Proposition IV.6.1 and Corollary B.3.4, and the completely split primes, a set of density zero, are removed from the set R of auxiliary primes.
- Proposition II.3.7 is not claimed under (*): at a completely split prime the local Iwasawa cohomology is not unramified, so H¹_∞(K, T) ≠ lim S^{Σp}(F, T) in general.
Proposed API (untyped inventory):
TauCeti.EulerSystem.UnramifiedAtSplitPrimes [data]: The predicate (*) on a collection c and a Z_p^d-extension K∞/K.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_of_noSplitPrimes [example]: If K∞/K is admissible, (*) holds for every collection.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_mem [projection]: Under (*), (c_F)_q ∈ H¹_ur(F_q, T) for every prime q of K and every F (combining with SelmerIwasawaCohomology L3 at primes with infinite decomposition group).
TauCeti.EulerSystem.splitPrimes_density_zero [other]: The set of primes of K splitting completely in K∞/K has Dirichlet density zero.
TauCeti.EulerSystem.weakLeopoldt_of_unramifiedAtSplitPrimes [other]: Under (*) in place of admissibility, the conclusions of weak-leopoldt-from-an-euler-system, rubin-iwasawa-divisibility and rubin-rational-iwasawa-divisibility hold.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer [example]: Kummer images of points of an abelian variety with good reduction at q ∤ p satisfy (*) at q.
Unit tests (untyped inventory):
TauCeti.EulerSystem.unramifiedAtSplitPrimes_vacuous [degenerate]: For the cyclotomic Z_p-extension of Q no prime splits completely, so (*) holds for every collection.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_anticyclotomic [computation]: For K = Q(√−7), p = 3 and the anticyclotomic Z_3-extension, (*) is a genuine condition at the prime 5O_K, which splits completely.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer_example [example]: For an elliptic curve E/K with good reduction at q ∤ p and points P_F ∈ E(F), the Kummer classes c_F = δ(P_F) ∈ H¹(F, T_pE) satisfy (*) at q.
TauCeti.EulerSystem.unramifiedAtSplitPrimes_not_selmer_limit [non-example]: At a completely split prime q ∤ p with T ramified at q, lim_F H¹(F_q, T) contains ramified classes, so (*) is not automatic for norm-coherent families and Proposition II.3.7's identity H¹_∞(K, T) = lim S^{Σp}(F, T) can fail.
Acceptance:
- If K∞/K is admissible, (*) is vacuous.
- Kummer classes of points of an abelian variety with good reduction at q ∤ p are unramified at q, so (*) holds at such completely split q.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- SelmerIwasawaCohomology:L3/universal-norms-unramified
- SelmerIwasawaCohomology:L2/unramified-condition
- EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes
- EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure — construction
The Λ-adic representation 𝐓 = T ⊗ Λ and its Selmer structures
Statement: Let K∞/K be a Z_p-extension (d = 1) with Γ = Gal(K∞/K), Λ = O[[Γ]], Ψ: G_K ↠ Γ ⊂ Λ^× the tautological character, and T a free O-module of finite rank with a continuous G_K-action unramified outside a finite set. Put 𝐓 = T ⊗_O Λ with G_K acting on both factors (on Λ through Ψ), so that Shapiro's lemma gives H^i(K, 𝐓) ≅ lim_n H^i(K_n, T) along corestriction (SelmerIwasawaCohomology L3, iwasawa-shapiro, which pins the twist), and 𝐓* = Hom(𝐓, μ_{p^∞}). A Λ-adic Selmer structure F_Λ on 𝐓 is a Selmer structure over R = Λ (SelmerIwasawaCohomology L2, dual-selmer-structure): a finite set Σ(F_Λ) of places containing ∞, the primes above p and the primes where T ramifies, and Λ-submodules H¹_{F_Λ}(K_v, 𝐓) ⊂ H¹(K_v, 𝐓), v ∈ Σ(F_Λ); F_Λ* is its dual on 𝐓* and X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p). Two instances: (a) the canonical structure (Mazur–Rubin, Definition 5.3.2, K = Q, K∞ = Q∞): H¹_{F_Λ}(K_v, 𝐓) = H¹(K_v, 𝐓) for all v ∈ Σ, so H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓); (b) the ordinary structure (Howard, Definition 2.2.6; Castella–Grossi–Lee–Skinner §3.4): given Fil_v T ⊂ T at v | p, H¹_{F_Λ}(K_v, 𝐓) = image of H¹(K_v, Fil_v T ⊗ Λ), and the unramified (Howard) or full (Castella et al.) condition at v ∤ p. F_Λ induces Selmer structures on the quotients 𝐓/I𝐓 by propagation.
Hypotheses:
- For the canonical structure, every v ∤ p must have infinite decomposition group in K∞/K (true for the cyclotomic Z_p-extension), so that H¹(K_v, 𝐓) = H¹_ur(K_v, 𝐓) and the structure does not depend on Σ (Mazur–Rubin, Lemma 5.3.1(ii)).
- The induced structure on a quotient 𝐓/I𝐓 is in general smaller than the full local cohomology: at v = p its defect is H²(K_p, 𝐓)[I].
- Conventions for the character through which G_K acts on Λ vary between sources (Castella et al. print α_𝔓 = Ψ^{-1} mod 𝔓, corrected to Ψ mod 𝔓 in PAPER-CASTELLA-ETAL-22/E29); this node pins the action through Ψ and the Shapiro isomorphism, and each source is read through it.
- With G_K acting on Λ through Ψ, the Shapiro isomorphism H¹(K, 𝐓) ≅ lim_n H¹(K_n, T) is semilinear for the involution ι: multiplication by γ ∈ Γ on 𝐓 corresponds to the conjugation action of γ^{-1} on lim_n H¹(K_n, T) (SelmerIwasawaCohomology L3, iwasawa-shapiro: 𝓕_Γ(M)^ι ≅ (M ⊗ R̄)⟨1⟩). Comparisons with Rubin's H¹_∞(K, T), ind_Λ and X∞ in the first part of this layer therefore pass through ι; both sides of every divisibility are transported together, so the theorems agree.
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.lambdaRep [constructor]: 𝐓 = T ⊗_O Λ with the diagonal G_K-action through Ψ.
TauCeti.KolyvaginSystem.lambdaRep_cohomologyEquiv [equivalence]: H^i(K, 𝐓) ≅ lim_n H^i(K_n, T) and H^i(K_v, 𝐓) ≅ lim_n ⊕_{w|v} H^i(K_{n,w}, T), semilinear for ι: λ ∈ Λ acting on 𝐓 corresponds to ι(λ) acting through the conjugation action of Γ on the limits.
TauCeti.KolyvaginSystem.LambdaSelmerStructure [structure]: A Selmer structure over R = Λ on 𝐓: Σ(F_Λ) and Λ-submodules of local cohomology.
TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical [constructor]: The canonical structure: full local cohomology at every v ∈ Σ.
TauCeti.KolyvaginSystem.LambdaSelmerStructure.ordinary [constructor]: The ordinary structure attached to filtrations Fil_v T at v | p.
TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_selmer_eq [simp]: For the canonical structure, H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓) = H¹(K_Σ/K, 𝐓).
TauCeti.KolyvaginSystem.LambdaSelmerStructure.quotient [functoriality]: The induced structure on 𝐓/I𝐓 for an ideal I ⊂ Λ, by propagation.
TauCeti.KolyvaginSystem.LambdaSelmerStructure.dualX [data]: X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p), a finitely generated Λ-module.
TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_X_eq [compatibility]: For K = Q, K∞ = Q∞ and the canonical structure, X is Rubin's X∞ of restricted-iwasawa-selmer-module with Λ acting through ι (the duals carrying (λφ)(x) = φ(λx)), so char X = ι(char X∞).
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.canonical_rat_selmer [computation]: For K = Q, K∞ = Q∞ and the canonical structure, H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T) = lim_n H¹(Q_Σ/Q_n, T).
TauCeti.KolyvaginSystem.canonical_unramified_away_from_p [characterisation]: For ℓ ≠ p, H¹(Q_ℓ, 𝐓) = H¹_ur(Q_ℓ, 𝐓) (Mazur–Rubin, Lemma 5.3.1(ii)); a definition requiring the unramified condition at ℓ ∈ Σ therefore gives the same structure.
TauCeti.KolyvaginSystem.quotient_not_full [non-example]: For T = Z_p(1) over Q∞ and I = J the augmentation ideal, H²(Q_p, 𝐓) ≅ Z_p with trivial Γ-action, so the induced condition H¹_{F_Λ}(Q_p, Z_p(1)) has cokernel H²(Q_p, 𝐓)[J] ≅ Z_p in H¹(Q_p, Z_p(1)); the induced structure on 𝐓/J𝐓 = Z_p(1) is not the full local cohomology.
TauCeti.KolyvaginSystem.ordinary_selfOrthogonal [compatibility]: For T = T_pE with E ordinary at v | p and Fil_v T = ker(T_pE → T_pẼ), the ordinary conditions on 𝐓 and 𝐀 are exact orthogonal complements under e_Λ (Howard, §2.2).
Acceptance:
- For the canonical structure over Q∞, H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T).
- For T = Z_p(1) and I = J the augmentation ideal, H¹_{F_Λ}(Q_p, Z_p(1)) ⊊ H¹(Q_p, Z_p(1)).
Prerequisites:
- SelmerIwasawaCohomology:L3/iwasawa-shapiro
- SelmerIwasawaCohomology:L3/iwasawa-cohomology
- SelmerIwasawaCohomology:L3/universal-norms-unramified
- SelmerIwasawaCohomology:L2/dual-selmer-structure
- SelmerIwasawaCohomology:L2/condition-propagation
- EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems — construction
Λ-adic Kolyvagin systems
Statement: For a Λ-adic Selmer structure F_Λ on 𝐓 and a set P of auxiliary primes disjoint from Σ(F_Λ) (with the finite–singular comparison maps φ^fs_ℓ and ideals I_ℓ of EulerSystemsAndKolyvaginSystems ES.1), KS(𝐓, F_Λ, P) is the Λ-module of Kolyvagin systems of ES.4 over R = Λ: collections κ = {κ_n ∈ H¹_{F_Λ(n)}(K, 𝐓/I_n𝐓) ⊗ G_n : n ∈ N(P)} with (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) in H¹_s(K_ℓ, 𝐓/I_{nℓ}𝐓) ⊗ G_{nℓ} (Mazur–Rubin, Definition 3.1.3). The generalized module is KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j), P_j the primes with 𝐓/(𝔐^j𝐓 + (Fr_ℓ − 1)𝐓) free of rank one over Λ/𝔐^j and I_ℓ ⊂ 𝔐^j (Definition 3.1.6), with the natural map KS → KS‾. Elements of either are Λ-adic Kolyvagin systems; the bottom class is κ_1 ∈ H¹_{F_Λ}(K, 𝐓) (for KS‾, κ̄_1 ∈ lim_k H¹_{F_Λ}(K, 𝐓/𝔐^k𝐓) = H¹_{F_Λ}(K, 𝐓)).
Hypotheses:
- KS → KS‾ need be neither injective nor surjective (Mazur–Rubin, Definition 3.1.6); the statements of this layer hold for both modules (Remark 5.3.11), and Euler systems land in KS‾ (euler-to-lambda-adic-kolyvagin).
- Over Λ the ideals I_n are generally of finite index, so each κ_n is a class with coefficients in a finite quotient of 𝐓 (Mazur–Rubin, proof of Theorem 5.3.3).
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.lambdaKS [constructor]: KS(𝐓, F_Λ, P), the Λ-module of Kolyvagin systems over R = Λ.
TauCeti.KolyvaginSystem.lambdaKSBar [constructor]: KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j).
TauCeti.KolyvaginSystem.lambdaKS_toBar [projection]: The natural map KS(𝐓) → KS‾(𝐓).
TauCeti.KolyvaginSystem.bottomClass [projection]: κ ↦ κ_1 ∈ H¹_{F_Λ}(K, 𝐓), Λ-linear, compatible with KS → KS‾.
TauCeti.KolyvaginSystem.lambdaKS_baseChange [functoriality]: For a ring map Λ → R', KS(𝐓, F_Λ) ⊗_Λ R' → KS(𝐓 ⊗_Λ R', F_Λ ⊗ R'), compatible with composition; in particular reductions to 𝐓/I𝐓.
TauCeti.KolyvaginSystem.lambdaKS_restrictPrimes [functoriality]: For P' ⊂ P, the restriction KS(𝐓, P) → KS(𝐓, P').
TauCeti.KolyvaginSystem.lambdaKS_ext [extensionality]: Two Λ-adic Kolyvagin systems are equal iff all their components κ_n agree.
TauCeti.KolyvaginSystem.bottomClass_zero [simp]: The zero system has κ_1 = 0.
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.zero_mem [degenerate]: The zero collection is a Λ-adic Kolyvagin system, with κ_1 = 0; it satisfies every relation and certifies nothing.
TauCeti.KolyvaginSystem.relation_required [characterisation]: A family of raw Kolyvagin derivative classes satisfying only the weak relation of Rubin's Chapter IV is not an element of KS(𝐓) until corrected as in Mazur–Rubin's Appendix A; a definition omitting the finite–singular relation (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) accepts it and is wrong.
TauCeti.KolyvaginSystem.cyclotomic_free_rank_one [computation]: For T = O(1) ⊗ ρ^{-1}, ρ an even character of prime-to-p order with ρ(p) ≠ 1 and ρ unramified at p, the cyclotomic-unit Λ-adic Kolyvagin system generates the free rank-one module KS‾(T ⊗ Λ, F_can, P) (Büyükboduk, Proposition 4.1).
TauCeti.KolyvaginSystem.bottomClass_specialize [compatibility]: The image of κ_1 under H¹(Q, 𝐓) → H¹(Q, 𝐓/J𝐓) = H¹(Q, T) is the bottom class of the reduction of κ to KS(T); for κ coming from an Euler system c it is c_Q.
Acceptance:
- The zero system is allowed and has κ_1 = 0.
- For T = O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, KS‾(T ⊗ Λ, F_can, P) is free of rank one, generated by the cyclotomic-unit system (Büyükboduk, Theorem 3.23 and Proposition 4.1).
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal
- EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison
- EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures
- EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module
- PadicMeasuresIwasawaAlgebras:L1
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin — theorem
From Euler systems to Λ-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3)
Statement: Let K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ with the canonical structure F_Λ, P a set of primes ℓ ≠ p at which T is unramified, and 𝒦 an abelian extension of Q containing the maximal abelian p-extension of Q unramified outside p and P. Suppose (a) T/(Fr_ℓ − 1)T is a cyclic O-module for every ℓ ∈ P, and (b) Fr_ℓ^{p^k} − 1 is injective on T for every ℓ ∈ P and every k ≥ 0. Then there is a canonical homomorphism ES(T, 𝒦, P) → KS‾(𝐓, F_Λ, P) sending c to κ with κ_1 = {c_{Q_n}}_n ∈ lim_n H¹(Q_n, T) = H¹(Q, 𝐓).
Hypotheses:
- Mazur–Rubin's Euler systems use the factors P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 − Fr_ℓ x | T) (their Definition 3.2.2), not Rubin's P(Fr_q^{-1}|T*; Fr_q^{-1}); ES.2's normalization dictionary transports between them (Mazur–Rubin, Remark 3.2.3; Rubin §IX.6).
- This is the rank-one map over the cyclotomic tower of Q; over other bases and for the anticyclotomic tower the Λ-adic Kolyvagin systems of the applications are constructed by their owners (HeegnerPointEulerSystems HE.8 for Heegner points).
- Mazur–Rubin state the theorem inside §5.3, whose standing assumptions are (H.0)–(H.4) and P = P_1; their proof (Appendix A, as for Theorem 3.2.4) uses only (a), (b) and the containment of the ray-class tower in 𝒦, so the statement here carries only those.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- The cyclotomic-unit Euler system for O(1) ⊗ ρ^{-1}, modified as in Rubin §IX.6, gives κ^{ρ,∞} (Büyükboduk, §4.1.1).
- The zero Euler system maps to the zero Kolyvagin system.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module
- EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial
- EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-class
- EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties
- EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula
- EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes — definition
The exceptional set Σ_Λ of height-one primes
Statement: For K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ and Σ ⊇ {p, ∞, primes where T ramifies}: Σ_Λ = {𝔓 : H²(Q_Σ/Q, 𝐓)[𝔓] is infinite} ∪ {𝔓 : H²(Q_p, 𝐓)[𝔓] is infinite} ∪ {pΛ}, a set of height-one primes of Λ (Mazur–Rubin, Definition 5.3.12, with Λ = Z_p[[Γ]]; for Λ = O[[Γ]] with O ramified over Z_p, pΛ is replaced by the prime ϖΛ). It is finite. For a number field K and a Z_p-extension the same definition with H²(K_Σ/K, 𝐓) and H²(K_v, 𝐓), v | p, is used; for the ordinary structure of Howard the exceptional set is the finite set of his Proposition 2.2.8, defined by the failure of the control bounds.
Hypotheses:
- Σ_Λ depends only on T and the tower, not on any Kolyvagin system; the blind spot (blind-spot-and-lambda-primitivity) depends on κ.
- Finiteness needs H²(Q_Σ/Q, 𝐓) and H²(Q_p, 𝐓) finitely generated over Λ (Mazur–Rubin, Lemma 5.3.4; requested from SelmerIwasawaCohomology L3).
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.exceptionalSet [data]: Σ_Λ as a set of height-one primes of Λ.
TauCeti.KolyvaginSystem.exceptionalSet_finite [other]: Σ_Λ is finite.
TauCeti.KolyvaginSystem.p_mem_exceptionalSet [simp]: pΛ ∈ Σ_Λ.
TauCeti.KolyvaginSystem.mem_exceptionalSet_iff [characterisation]: For 𝔓 ≠ pΛ, 𝔓 ∈ Σ_Λ iff 𝔓 divides char(H²(Q_Σ/Q, 𝐓)_tors) · char(H²(Q_p, 𝐓)).
TauCeti.KolyvaginSystem.exceptionalSet_twist [compatibility]: For ρ: Γ → O^×, Σ_Λ(T ⊗ ρ) = Tw_ρ^{-1}(Σ_Λ(T)), since 𝐓 ⊗ ρ ≅ 𝐓 with Λ acting through Tw_ρ.
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.exceptionalSet_Zp1 [computation]: For T = Z_p(1) over Q∞, H²(Q_p, 𝐓) ≅ lim_n H²(Q_{n,p}, Z_p(1)) ≅ Z_p with trivial Γ-action, so H²(Q_p, 𝐓)[J] = Z_p is infinite and J ∈ Σ_Λ.
TauCeti.KolyvaginSystem.p_mem_exceptionalSet_test [degenerate]: pΛ ∈ Σ_Λ for every T, by definition, whatever the cohomology.
TauCeti.KolyvaginSystem.exceptionalSet_not_blindSpot [non-example]: Σ_Λ is not the blind spot: for the cyclotomic-unit system κ^{ρ,∞} of Büyükboduk's Proposition 4.1 (ρ(p) ≠ 1) the blind spot contains no height-one prime, while pΛ ∈ Σ_Λ.
TauCeti.KolyvaginSystem.exceptionalSet_free_H2 [example]: If H²(Q_Σ/Q, 𝐓) and H²(Q_p, 𝐓) are finite, then Σ_Λ = {pΛ}.
Acceptance:
- pΛ ∈ Σ_Λ always.
- For T = Z_p(1), H²(Q_p, 𝐓) ≅ Z_p with trivial action, so the augmentation ideal J lies in Σ_Λ.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- SelmerIwasawaCohomology:L3
- PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem
- PadicMeasuresIwasawaAlgebras:L4/height-one-primes
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization — construction
Specialization of Λ-adic Kolyvagin systems at height-one primes
Statement: For a height-one prime 𝔓 of Λ let S_𝔓 be the integral closure of Λ/𝔓; it is a discrete valuation ring, [S_𝔓 : Λ/𝔓] is finite, and 𝐓 ⊗_Λ S_𝔓 = T ⊗_O S_𝔓 with G_K acting on S_𝔓 through Ψ mod 𝔓. Give T ⊗ S_𝔓 the canonical Selmer structure F_can of Mazur–Rubin's Definition 3.2.1 (or, in the ordinary setting, Howard's F_𝔓 of his Definition 2.1.2). The inclusion 𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓 induces maps H¹_{F_Λ}(K_v, 𝐓/𝔓𝐓) → H¹_{F_can}(K_v, T ⊗ S_𝔓) for every v, hence a specialization map KS(𝐓, F_Λ) → KS(𝐓/𝔓𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can), κ ↦ κ^{(𝔓)} (Mazur–Rubin, Corollary 5.3.15), and similarly on KS‾. For 𝔓 = (g) ≠ pΛ with g a distinguished polynomial, the perturbations 𝔓_N = (g + p^N)Λ satisfy Λ/𝔓 ≅ Λ/𝔓_N as rings for N large (Hensel's lemma).
Hypotheses:
- The ring isomorphism Λ/𝔓 ≅ Λ/𝔓_N is not Λ-linear, and the Galois actions on T ⊗ S_𝔓 and T ⊗ S_{𝔓_N} differ.
- The bounds of specialization-control depend on [S_𝔓 : Λ/𝔓], which is why S_𝔓 rather than Λ/𝔓 carries the DVR theory of ES.4–ES.5.
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.specRing [data]: S_𝔓 = integral closure of Λ/𝔓, a DVR with [S_𝔓 : Λ/𝔓] < ∞.
TauCeti.KolyvaginSystem.specRep [constructor]: T ⊗ S_𝔓 = 𝐓 ⊗_Λ S_𝔓 with its canonical (or ordinary) Selmer structure.
TauCeti.KolyvaginSystem.specialize [constructor]: κ ↦ κ^{(𝔓)}: KS(𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can), and the same on KS‾.
TauCeti.KolyvaginSystem.specialize_bottomClass [simp]: κ^{(𝔓)}_1 is the image of κ_1 under H¹(K, 𝐓) → H¹(K, 𝐓/𝔓𝐓) → H¹(K, T ⊗ S_𝔓).
TauCeti.KolyvaginSystem.specialize_augmentation [example]: For 𝔓 = J, S_J = O, T ⊗ S_J = T and κ^{(J)} is the reduction of κ to KS(T).
TauCeti.KolyvaginSystem.specialize_twist [compatibility]: For 𝔓 = (γ − u), u ∈ 1 + pO, Λ/𝔓 = O and T ⊗ S_𝔓 = T ⊗ ρ_u with ρ_u(γ) = u.
TauCeti.KolyvaginSystem.perturb [constructor]: For 𝔓 = (g) ≠ pΛ with g distinguished, 𝔓_N = (g + p^N); for N ≫ 0, 𝔓_N is a height-one prime and Λ/𝔓 ≅ Λ/𝔓_N as rings.
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.specRing_augmentation [computation]: For 𝔓 = J = (γ − 1), Λ/J = O = S_J and T ⊗ S_J = T.
TauCeti.KolyvaginSystem.specRing_twist [computation]: For O = Z_p and 𝔓 = (γ − (1 + p)), Λ/𝔓 = Z_p and T ⊗ S_𝔓 is the twist of T by the character γ ↦ 1 + p of Γ.
TauCeti.KolyvaginSystem.specRing_not_quotient [non-example]: For O = Z_p and 𝔓 = (X² − p³), X = γ − 1: X² − p³ is distinguished and irreducible, Λ/𝔓 ≅ Z_p[p^{3/2}] is not integrally closed, and S_𝔓 = Z_p[p^{1/2}] with [S_𝔓 : Λ/𝔓] = p; using Λ/𝔓 instead of S_𝔓 loses the DVR theory.
TauCeti.KolyvaginSystem.perturb_height_one [characterisation]: For 𝔓 = (X − p) in Z_p[[X]], 𝔓_N = (X − p + p^N) is prime with Λ/𝔓_N ≅ Z_p, and the 𝔓_N are pairwise distinct and distinct from 𝔓.
Acceptance:
- 𝔓 = J, the augmentation ideal: S_J = O and 𝐓 ⊗ S_J = T.
- 𝔓 = (X² − p³) in Z_p[[X]] (O = Z_p, X = γ − 1): Λ/𝔓 ≅ Z_p[p^{3/2}] ⊊ S_𝔓 = Z_p[p^{1/2}], of index p.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- PadicMeasuresIwasawaAlgebras:L4/height-one-primes
- PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local
- mathlib:IsIntegralClosure
- mathlib:IsDiscreteValuationRing
- mathlib:Polynomial.IsDistinguishedAt
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/specialization-control — theorem
Control of Selmer groups at height-one specializations
Statement: (Mazur–Rubin, canonical structure, K = Q, K∞ = Q∞, T satisfying (H.0)–(H.4).) For every height-one prime 𝔓 of Λ and every place v, the inclusion 𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓 induces H¹_{F_Λ}(Q_v, 𝐓/𝔓𝐓) → H¹_{F_can}(Q_v, T ⊗ S_𝔓) and H¹_{F_can*}(Q_v, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q_v, (𝐓/𝔓𝐓)*), whose kernels and cokernels, for 𝔓 ∉ Σ_Λ, are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Lemma 5.3.13). Globally, π_𝔓: H¹(Q, 𝐓)/𝔓H¹(Q, 𝐓) ↪ H¹_{F_can}(Q, T ⊗ S_𝔓) is injective for every 𝔓, and π*_𝔓: H¹_{F_can*}(Q, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q, 𝐓*)[𝔓] is defined; for 𝔓 ∉ Σ_Λ, coker π_𝔓, ker π*_𝔓 and coker π*_𝔓 are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Proposition 5.3.14). (Howard, ordinary structure, T = T_pE over the anticyclotomic tower.) The same holds for every height-one 𝔓 ≠ pΛ locally (Lemma 2.2.7, bounds depending only on [S_𝔓 : Λ/𝔓]) and, outside a finite set Σ_Λ, globally for H¹_{F_Λ}(K, 𝐓)/𝔓 → H¹_{F_𝔓}(K, 𝐓_𝔓) and H¹_{F_𝔓}(K, 𝐀_𝔓) → H¹_{F_Λ}(K, 𝐀)[𝔓] (Proposition 2.2.8).
Hypotheses:
- (H.3) of Mazur–Rubin §3.5 (ES.0) gives H⁰(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓))) = 0 (their Lemma 3.5.2), used for injectivity.
- The uniformity of the bounds in [S_𝔓 : Λ/𝔓] is essential: along the perturbations 𝔓_N of height-one-specialization this index is constant, so the error is O(1) as N grows.
- Howard's local proof at v | p uses that the residue field points Ẽ(F_v)[p^∞] are finite and that K∞,v/K_v is totally ramified; the generic statement for another ordinary representation must re-verify these inputs.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- For 𝔓 = J and T with H²(Q_p, 𝐓)[J] finite, H¹(Q, 𝐓)/JH¹(Q, 𝐓) ↪ H¹(Q, T) with finite cokernel.
- The bounds are uniform along 𝔓_N = (g + p^N), N ≫ 0.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004
- EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification
- SelmerIwasawaCohomology:L3
- SelmerIwasawaCohomology:L2/finite-condition-lattice-duality
- ArithmeticGaloisDuality:R02.4/poitou-tate
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank — theorem
The generic core rank χ(𝐓) (Mazur–Rubin, Lemma 5.3.16)
Statement: For K = Q, K∞ = Q∞ and every height-one prime 𝔓 ∉ Σ_Λ, the core Selmer rank of (T ⊗ S_𝔓, F_can) is χ(T ⊗ S_𝔓, F_can) = rank_{Z_p} T^-, where T^- is the (−1)-eigenspace of a complex conjugation. The common value χ(𝐓) := rank_{Z_p} T^- is the generic core rank of 𝐓.
Hypotheses:
- Core rank is ES.0's notion (Mazur–Rubin, Definition 4.1.11), with the formula χ(T ⊗ S) = rank (T ⊗ S)^- + corank H⁰(Q_p, (T ⊗ S)*) of their Theorem 5.2.15 for the canonical structure.
- By Perrin-Riou's Proposition 1.3.2, if the weak Leopoldt conjecture holds for T then rank_Λ H¹(Q, 𝐓) = χ(𝐓) (Mazur–Rubin, Remark 5.3.18).
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- T = T_pE: rank T^- = 1, so χ(𝐓) = 1.
- T = O(1) ⊗ ρ^{-1}, ρ even: complex conjugation acts by −1 on O(1) and trivially through ρ^{-1}, so χ(𝐓) = 1.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.0/core-rank
- EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula
- SelmerIwasawaCohomology:L3
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity — definition
The blind spot and Λ-primitive Kolyvagin systems
Statement: Let κ ∈ KS‾(𝐓, F_Λ, P). The blind spot of κ is the set of ideals I ⊂ Λ such that the image of κ under KS‾(𝐓) → KS(𝐓/I𝐓) → KS‾(𝐓/I𝐓) is zero; equivalently, I is not in the blind spot iff for some k ≥ 1 the image of κ in KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j) is nonzero for every j (Mazur–Rubin, Definition 3.1.6). The blind spot of KS‾(𝐓) is the intersection of the blind spots of its elements. κ is Λ-primitive if its blind spot contains no height-one prime of Λ (Definition 5.3.9). It is residually primitive (primitive, Definition 4.5.5, owned by ES.5) if its image in KS‾(T̄) = KS‾(𝐓/𝔐𝐓) is nonzero, i.e. 𝔐 is not in its blind spot; when χ(T̄) = 1 the map KS(T̄) → KS‾(T̄) is an isomorphism (Mazur–Rubin, Corollary 4.5.3) and this is nonvanishing in KS(T̄).
Hypotheses:
- Residual primitivity implies Λ-primitivity (residual-primitivity-implies-lambda-primitivity); the two are different conditions and Theorem 5.3.10(iii) needs only Λ-primitivity.
- A nonzero κ, even with κ_1 ≠ 0, need not be Λ-primitive.
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.blindSpot [data]: The set of ideals I ⊂ Λ with κ ↦ 0 in KS‾(𝐓/I𝐓).
TauCeti.KolyvaginSystem.mem_blindSpot_iff [characterisation]: I ∉ blindSpot κ iff ∃ k, ∀ j, the image of κ in KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j) is nonzero.
TauCeti.KolyvaginSystem.IsLambdaPrimitive [data]: κ is Λ-primitive iff no height-one prime of Λ lies in blindSpot κ.
TauCeti.KolyvaginSystem.IsLambdaPrimitive.of_isPrimitive [relation]: A residually primitive κ is Λ-primitive (residual-primitivity-implies-lambda-primitivity).
TauCeti.KolyvaginSystem.specialize_ne_zero_of_not_mem_blindSpot [other]: If 𝔓 ∉ blindSpot κ then κ^{(𝔓)} ≠ 0 in KS‾(T ⊗ S_𝔓) (Mazur–Rubin, Lemma 5.3.20).
TauCeti.KolyvaginSystem.blindSpot_smul [simp]: blindSpot κ ⊂ blindSpot (λκ), and every ideal containing λ lies in blindSpot (λκ).
TauCeti.KolyvaginSystem.not_isLambdaPrimitive_smul [other]: If λ ∈ Λ is not a unit then λκ is not Λ-primitive (λ lies in a height-one prime, Λ being factorial).
TauCeti.KolyvaginSystem.blindSpot_zero [simp]: The blind spot of 0 is every ideal.
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.cyclotomic_isLambdaPrimitive [computation]: For T = O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, the cyclotomic-unit system κ^{ρ,∞} is Λ-primitive (Büyükboduk, Proposition 4.1).
TauCeti.KolyvaginSystem.augmentation_mul_not_primitive [non-example]: For any κ, (γ − 1)κ has κ_1 possibly nonzero but J = (γ − 1) in its blind spot, so it is not Λ-primitive: a definition of Λ-primitivity as 'κ_1 ≠ 0' fails this.
TauCeti.KolyvaginSystem.free_rank_one_primitive_iff [characterisation]: If KS‾(𝐓) is free of rank one on a residually primitive κ_0, then λκ_0 is Λ-primitive iff λ ∈ Λ^× iff λκ_0 is residually primitive.
TauCeti.KolyvaginSystem.zero_not_primitive [degenerate]: The zero system has every ideal in its blind spot and is not Λ-primitive.
Acceptance:
- The cyclotomic-unit Λ-adic system for O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, is Λ-primitive (Büyükboduk, Proposition 4.1).
- (γ − 1)κ is never Λ-primitive.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants
- EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem
- EulerSystemsAndKolyvaginSystems:ES.0/core-rank
- PadicMeasuresIwasawaAlgebras:L4/height-one-primes
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/residual-primitivity-implies-lambda-primitivity — lemma
Residual primitivity implies Λ-primitivity
Statement: If κ ∈ KS‾(𝐓) has nonzero image in KS‾(𝐓/𝔐𝐓) = KS‾(T̄) (equivalently, when χ(T̄) = 1, in KS(T̄)), then κ is Λ-primitive.
Hypotheses:
- The converse fails in general: Λ-primitivity concerns only height-one primes, primitivity the maximal ideal (Mazur–Rubin, Definition 5.3.9).
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Applied to the cyclotomic-unit system for O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, which is primitive by Mazur–Rubin's Remark 6.1.8, it gives Λ-primitivity.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind — definition
Mazur–Rubin's principal index Ind(c)
Statement: For K = Q, K∞ = Q∞ and c ∈ H¹(Q, 𝐓), which is finitely generated and Λ-torsion-free, fix a pseudo-isomorphism ψ: H¹(Q, 𝐓) → Λ^r and write ψ(c) = (a_1, …, a_r); Ind(c) is the principal ideal generated by gcd(a_1, …, a_r), so Ind(0) = 0. For c ≠ 0 this equals char((H¹(Q, 𝐓)/Λc)_tors) (Mazur–Rubin, Definition 5.3.8, with the convention of this packet's source issue E801 at c = 0). For κ ∈ KS‾(𝐓), Ind(κ) = Ind(κ_1).
Hypotheses:
- Ind(c) is principal; Rubin's ind_Λ (lambda-index) need not be, but a principal ideal contains ind_Λ(c) iff it contains Ind(c), both computed in the same Λ-module H¹(Q, 𝐓). Transported along the Shapiro identification H¹(Q, 𝐓) ≅ H¹_∞(Q, T), which is ι-semilinear (lambda-adic-selmer-structure), Ind(c_{Q,∞}) is the image under ι of the smallest principal ideal containing Rubin's ind_Λ(c).
- There is an ideal B of finite index in Λ with Bc ⊂ Ind(c)H¹(Q, 𝐓) (Mazur–Rubin, after Definition 5.3.8).
Proposed API (untyped inventory):
TauCeti.KolyvaginSystem.ind [data]: Ind(c), the principal ideal generated by the gcd of the coordinates of c in a free pseudo-isomorphic module.
TauCeti.KolyvaginSystem.ind_zero [simp]: Ind(0) = 0.
TauCeti.KolyvaginSystem.ind_eq_char [characterisation]: For c ≠ 0, Ind(c) = char((H¹(Q, 𝐓)/Λc)_tors).
TauCeti.KolyvaginSystem.ind_smul [simp]: Ind(λc) = λ Ind(c).
TauCeti.KolyvaginSystem.exists_finiteIndex_mul_mem [other]: There is an ideal B of finite index in Λ with Bc ⊂ Ind(c)H¹(Q, 𝐓).
TauCeti.KolyvaginSystem.lambdaIndex_le_ind [compatibility]: ind_Λ(c) ⊂ Ind(c), and for f ∈ Λ, ind_Λ(c) ⊂ (f) iff Ind(c) ⊂ (f).
TauCeti.KolyvaginSystem.indKS [data]: Ind(κ) = Ind(κ_1) for κ ∈ KS‾(𝐓).
Unit tests (untyped inventory):
TauCeti.KolyvaginSystem.ind_free_rank_one [computation]: If H¹(Q, 𝐓) ≅ Λ and c ↦ f ≠ 0, then Ind(c) = fΛ = char(Λ/fΛ).
TauCeti.KolyvaginSystem.ind_rank_two [non-example]: If H¹(Q, 𝐓) ≅ Λ² and c ↦ (p, γ − 1), then Ind(c) = Λ, while Rubin's ind_Λ(c) = (p, γ − 1) is not principal: the two definitions differ as ideals but give the same divisibility by principal ideals.
TauCeti.KolyvaginSystem.ind_zero_convention [degenerate]: Ind(0) = 0; the literal formula char((H¹/Λ·0)_tors) = char(0) = Λ would give Λ and make Theorem 5.3.10(i) false for κ_1 = 0 (source issue E801).
TauCeti.KolyvaginSystem.ind_pseudoIso_invariant [compatibility]: Ind(c) does not change if H¹(Q, 𝐓) is replaced by a module pseudo-isomorphic to it carrying c to the image of c.
Acceptance:
- H¹ ≅ Λ, c ↦ f: Ind(c) = (f).
- H¹ ≅ Λ², c ↦ (p, γ − 1): Ind(c) = Λ while ind_Λ(c) = 𝔐.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-index
- SelmerIwasawaCohomology:L3
- PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal
- mathlib:UniqueFactorizationMonoid
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin — theorem
Weak Leopoldt from a Λ-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6)
Statement: Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4) of Mazur–Rubin §3.5, and κ ∈ KS‾(𝐓, F_Λ, P) with κ_1 ≠ 0 (F_Λ canonical). Then for all but finitely many height-one primes 𝔓 the class κ^{(𝔓)}_1 ∈ H¹(Q, T ⊗ S_𝔓) is nonzero (Corollary 5.3.19), and H¹_{F_Λ*}(Q, 𝐓*) is a co-torsion Λ-module, i.e. X∞ is Λ-torsion (Theorem 5.3.6).
Hypotheses:
- Theorem 5.3.6 is stated for KS(𝐓) and holds with the same proof for KS‾(𝐓) (Remark 5.3.11).
- This is the Kolyvagin-system counterpart of weak-leopoldt-from-an-euler-system; for κ from an Euler system c, κ_1 = c_{Q,∞}.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- For the cyclotomic-unit system κ^{ρ,∞}, X∞ is torsion.
- For κ = 0 nothing is asserted.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/specialization-control
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound
- EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004
- SelmerIwasawaCohomology:L3
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem — theorem
The Λ-adic Kolyvagin-system bound and its equality criterion (Mazur–Rubin, Theorem 5.3.10)
Statement: Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4), F_Λ canonical, X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p), and κ ∈ KS‾(𝐓, F_Λ, P). (i) char(X∞) divides Ind(κ). (ii) If χ(𝐓) = 1, κ_1 ≠ 0 and 𝔓 is a height-one prime not in the blind spot of κ, then ord_𝔓 char(X∞) = ord_𝔓 Ind(κ). (iii) If χ(𝐓) = 1, κ_1 ≠ 0 and κ is Λ-primitive, then char(X∞) = Ind(κ).
Hypotheses:
- (i) is a divisibility only; equality needs all three conditions of (iii): generic core rank one, nonvanishing bottom class and Λ-primitivity. Nonvanishing alone does not give equality.
- With Ind(0) = 0 (lambda-adic-ind), (i) is trivial when κ_1 = 0.
- For κ coming from an Euler system c via euler-to-lambda-adic-kolyvagin, Ind(κ) = Ind(c_{Q,∞}) and (i) is consistent with rubin-iwasawa-divisibility.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- Cyclotomic units with ρ(p) ≠ 1: κ^{ρ,∞} is Λ-primitive and χ = 1, so char(X∞) = Ind(κ^{ρ,∞}) (Büyükboduk, Proposition 4.1, citing this theorem).
- Replacing κ by (γ − 1)κ keeps (i) but makes Ind larger by (γ − 1) and destroys Λ-primitivity, so (iii) cannot be applied: a false sharpness claim is excluded.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind
- EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity
- EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank
- EulerSystemsAndKolyvaginSystems:ES.8/specialization-control
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound
- EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem
- PadicMeasuresIwasawaAlgebras:L4
- PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound — theorem
The self-dual Λ-adic Kolyvagin bound (Howard, Theorem 2.2.10)
Statement: Let K be imaginary quadratic, K∞/K its anticyclotomic Z_p-extension, Λ = O[[Γ]] with the involution ι, 𝐓 = T ⊗ Λ, 𝐀 = Hom(𝐓, μ_{p^∞}) with the perfect pairing e_Λ: 𝐓 × 𝐀 → μ_{p^∞}, e_Λ(λt, a) = e_Λ(t, λ^ι a), and F_Λ a Λ-adic Selmer structure whose local conditions on 𝐓 and 𝐀 are exact orthogonal complements; X = Hom(H¹_{F_Λ}(K, 𝐀), Q_p/Z_p). Assume: (A) H¹_{F_Λ}(K, 𝐓) is Λ-torsion-free; (B) specialization-control holds for (𝐓, F_Λ) with a finite exceptional set Σ_Λ; (C) for every height-one 𝔓 ≠ pΛ (and the perturbed 𝔔 = (g + p^m)) outside Σ_Λ, the specialized Selmer triple (T_𝔓, F_𝔓, L_s) satisfies Howard's hypotheses H.0–H.5, so that ES.5's self-dual DVR theorem (Howard, Theorem 1.6.1, Proposition 2.1.3) applies; (D) char(X_tors) = char(X_tors)^ι. If for some s there is κ ∈ KS(𝐓, F_Λ, L_s) with κ_1 ≠ 0, then (a) H¹_{F_Λ}(K, 𝐓) is torsion-free of rank one; (b) there is a torsion Λ-module M with char(M) = char(M)^ι and a pseudo-isomorphism X ∼ Λ ⊕ M ⊕ M; (c) char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1). For T = T_pE, E/Q ordinary at p with surjective ρ̄_{E,p} and Howard's standing hypotheses on (E, K, p), with the ordinary structure, (A)–(D) are verified by the consumer HeegnerPointEulerSystems HE.8 (Howard, Proposition 2.1.3, Lemma 2.2.7, Proposition 2.2.8, Lemma 2.2.9, and Nekovář's functional equation char(X_tors) = char(X_tors)^ι), and the theorem then is Howard's Theorem 2.2.10.
Hypotheses:
- The anticyclotomic tower is not admissible (inert primes split completely), so Rubin's Theorem II.3.3 does not apply; this theorem works directly with Kolyvagin systems.
- (c) is a divisibility, with the factor two of the self-dual structure built into X ∼ Λ ⊕ M ⊕ M; it is not a universal formula for every T.
- The nonvanishing κ_1 ≠ 0 is an input; for Heegner points it is the Cornut–Vatsal nonvanishing proved in HeegnerPointEulerSystems HE.8, never derived here.
- Howard writes the theorem for T_pE; the abstraction (A)–(D) lists exactly the inputs his proof uses.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- For E/Q ordinary at p with surjective ρ̄ and the Heegner Kolyvagin system (HE.8), this is Howard's Theorem B.
- Scaling κ by λ multiplies char(H¹/Λκ_1) by λ and weakens (c) accordingly.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.8/specialization-control
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure
- EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses
- EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure
- EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem
- EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison
- EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal
- PadicMeasuresIwasawaAlgebras:L4
- PadicMeasuresIwasawaAlgebras:L4/structure-theorem-regular-dimension-two
- PadicMeasuresIwasawaAlgebras:L4/pseudo-isomorphism
-/

/-
EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound — theorem
The error-tolerant self-dual Λ-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1)
Statement: Generic form: in the setting of self-dual-lambda-adic-kolyvagin-bound, replace (C) and (D) by (C'): at the height-one primes 𝔔 ∉ Σ_Λ the finite-level error-tolerant theorem of ES.4 holds, H¹_{F_𝔔}(K, T_𝔔) free of rank one, H¹_{F_𝔔}(K, A_𝔔) ≅ D_𝔔 ⊕ M_𝔔 ⊕ M_𝔔 with M_𝔔 finite and length M_𝔔 ≤ length(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) + E_𝔔, where for every height-one 𝔓 outside a finite set Σ' the errors E_𝔔 at 𝔔 = (g + p^m) are bounded as m varies. Then H¹_{F_Λ}(K, 𝐓) has rank one, X ∼ Λ ⊕ M ⊕ M with M torsion, and char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) after inverting the primes of Σ', i.e. ord_𝔓 char(M) ≤ ord_𝔓 char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) for every height-one 𝔓 ∉ Σ'. Instance (Castella–Grossi–Lee–Skinner): E/Q of conductor N, p ∤ 2N good ordinary, K imaginary quadratic with D_K prime to Np and E(K)[p] = 0 (residual irreducibility not assumed), 𝐓 = T_pE ⊗ Λ with the ordinary structure (relaxed away from p on 𝐓), L = L_E, 𝔓_0 = (γ − 1): if κ ∈ KS(𝐓, F_Λ, L_E) has κ_1 ≠ 0, then H¹_{F_Λ}(K, 𝐓) has Λ-rank one and X ∼ Λ ⊕ M ⊕ M with char_Λ(M) | char_Λ(H¹_{F_Λ}(K, 𝐓)/Λκ_1) in Λ[1/p, 1/(γ − 1)] (Theorem 3.4.1); if moreover H¹_F(K, E[p^∞]) has Z_p-corank one, the divisibility holds in Λ[1/p] (Corollary 3.4.2).
Hypotheses:
- The finite-level error-tolerant theorem (Castella et al., Theorem 3.2.1, with error E_α depending on C_α, T_pE and rank R) is owned by ES.4; this node owns only its Iwasawa variation.
- Near 𝔓_0 the constant C_α of the specializations is unbounded, hence the localization at γ − 1; Corollary 3.4.2 removes it using control at 𝔓_0, which the source does not prove: the node uses the control statement rank_{Z_p} X/𝔓_0X = corank_{Z_p} H¹_F(K, E[p^∞]) recorded as PAPER-CASTELLA-ETAL-22/E32 (from E(K∞)[p] = 0 and finiteness of the local terms); this control theorem is requested from SelmerIwasawaCohomology L3, which owns Iwasawa control.
- In Z_p-lengths the error at 𝔔 is f_𝔔·E_{α_𝔔}, f_𝔔 the residue degree of S_𝔔 (PAPER-CASTELLA-ETAL-22/E29); the character α_𝔓 is Ψ mod 𝔓 in the convention of lambda-adic-selmer-structure.
- Consumers: RankZeroOneBSD BSD.7a uses the instance for the Eisenstein branch with HE.8's Heegner classes; the divisibility away from p is all it provides.
Proposed API (untyped inventory):
Unit tests (untyped inventory):
Acceptance:
- When ρ_E|G_K is surjective, Theorem 3.2.1 holds with E_α = 0 and the statement reduces to Howard's.
- At 𝔓_0 the method gives nothing without the corank-one hypothesis.
Prerequisites:
- EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound
- EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems
- EulerSystemsAndKolyvaginSystems:ES.8/specialization-control
- EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization
- EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors
- PadicMeasuresIwasawaAlgebras:L4
- PadicMeasuresIwasawaAlgebras:L4/structure-theorem-regular-dimension-two
- SelmerIwasawaCohomology:L3
-/
