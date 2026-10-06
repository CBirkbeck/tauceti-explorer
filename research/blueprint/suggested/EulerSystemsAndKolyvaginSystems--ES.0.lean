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

/-!
# Suggested declarations: Euler systems, Kolyvagin systems and higher-rank descent, layers ES.0–ES.7

This file is a prototype in the form of upstream's `Suggested.lean`. It is not the roadmap and is
not exhaustive: the roadmap document and the blueprint packet are definitive, and the statements
below only suggest Lean forms, so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`.

**What is typed.** The algebraic core, which the pinned Mathlib can already state:

* ES.0: Selmer triples over abstract cohomology modules (global module, local modules,
  localisation maps, local conditions, a set of primes), their conductors `N(P)`, the cartesian
  square of a local condition, and the scalar morphisms of the category `Quot_R(T)`;
* ES.1: the quotient polynomial `Q` with `(X - 1) * Q = P` behind the finite–singular comparison,
  and the exponent and order functions of the error-tolerant theory;
* ES.2: Euler polynomials of an endomorphism in the two conventions, and the module of Euler
  systems of an abstract norm-compatible tower, as an equaliser;
* ES.3: the norm element and the Kolyvagin derivative operator in a group ring, with the
  telescoping identity;
* ES.4: sheaves of modules on a graph, their global sections, locally cyclic sheaves, hubs and
  primitive sections;
* ES.6: the exterior bidual, the canonical map from the exterior power and functoriality, and
  Stark systems as the inverse limit of an abstract inverse system.

**What is recorded as comments.** The arithmetic statements are about continuous Galois
cohomology of `p`-adic representations with local conditions, Selmer structures and their duals.
Those carriers are planned in `SelmerIwasawaCohomology` L1–L3 and `ArithmeticGaloisDuality`
R02.1–R02.5 and are not in the pinned libraries, so the corresponding definitions, API items and
unit tests of the packet are listed by name with their statements in the last section of this
file, under the names the packet gives them. They are not replaced by `Prop`-valued fields or by
opaque stand-ins. Tau Ceti's corestriction `TauCeti.ContCohomology.explicitCor1` (for discrete
coefficients) is the map the Euler system relation uses; the abstract tower below takes the
corestriction maps as data.
-/

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

/-- Test `stalk_one` (abstract form): the zero family is a Stark system. -/
example : (0 : ∀ n, 𝒴.Y n) ∈ StarkSystem 𝒴 := Submodule.zero_mem _

end TauCeti.StarkSystems

end

/-! ## The declarations of the packet, by layer

Every definition, construction, API item, unit test and named theorem of the blueprint packet is
listed here under the name the packet gives it. An item marked `[typed above]` has a Lean
signature in the first part of this file. The others are statements about Galois cohomology of
`p`-adic representations, Selmer structures and their duals, whose carriers the pinned libraries
do not contain; they are recorded with their mathematical statements and become `theorem`s and
`example`s, each proved by `sorry`, once `SelmerIwasawaCohomology` L1–L3 and
`ArithmeticGaloisDuality` R02 supply those carriers.
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
  * `TauCeti.KolyvaginSystems.SelmerTriple` (structure) [typed above]: The triple (T, F, P): a
    Selmer structure F on T together with a set P of primes disjoint from Σ(F).
  * `TauCeti.KolyvaginSystems.SelmerTriple.conductors` (data) [typed above]: N(P): the squarefree
    products of primes of P, as finite subsets of P.
  * `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors` (simp) [typed above]: 1 ∈ N(P).
  * `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed` (characterisation) [typed above]:
    If n ∈ N(P) and m | n then m ∈ N(P).
  * `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes` (functoriality) [typed above]: For P′ ⊆
    P, (T, F, P′) is a Selmer triple and N(P′) ⊆ N(P).
  * `TauCeti.KolyvaginSystems.SelmerTriple.dual` (constructor): (T^*, F^*, P) is a Selmer triple,
    and Σ(F^*) = Σ(F).
  * test `SelmerTriple.conductors_empty` (degenerate) [typed above]: For P = ∅, N(P) = {1}.
  * test `SelmerTriple.card_conductors_of_finite` (computation): If P has exactly two primes q₁, q₂
    then N(P) = {1, q₁, q₂, q₁q₂} has four elements, and ν takes the values 0, 1, 1, 2.
  * test `SelmerTriple.not_mem_conductors_of_sq` (non-example): For q ∈ P the ideal q² is not in
    N(P).
  * test `SelmerTriple.disjoint_sigma` (characterisation) [typed above]: No prime of Σ(F) divides
    any n ∈ N(P); in particular T is unramified at every prime dividing n and no such prime lies
    above p.
-/

/-
**`ES.0/quotient-category`** (definition): The category of quotients of T.
  Statement. Quot_R(T) is the category whose objects are the quotients T/IT for all ideals I of R,
    and whose morphisms from T/IT to T/JT are the scalar multiplications by elements r ∈ R with rI ⊆
    J. A local condition propagated from T to all quotients (images under T → T/IT) is functorial
    over Quot_R(T). For R principal artinian of length k with uniformiser π, the objects are T/m^iT
    for 0 ≤ i ≤ k, and multiplication by π^{j−i} is an injective morphism T/m^iT → T/m^jT for i ≤ j.
  * `TauCeti.KolyvaginSystems.QuotCat` (structure): The category Quot_R(T): objects the ideals I of
    R (standing for T/IT), morphisms I → J the scalars r with rI ⊆ J acting T/IT → T/JT.
  * `TauCeti.KolyvaginSystems.QuotCat.scalarHom` (constructor) [typed above]: For r ∈ R with r·I ≤
    J, the G_K-equivariant R-linear map T/IT → T/JT induced by multiplication by r.
  * `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp` (functoriality) [typed above]: scalarHom s ∘
    scalarHom r = scalarHom (sr), and scalarHom 1 is the identity of T/IT.
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
-/

/-
**`ES.0/cartesian-condition`** (definition): Cartesian local conditions.
  Statement. A local condition F at a place v, functorial over a category 𝒯 of R[[G_{K_v}]]-modules,
    is cartesian on 𝒯 if for every injective morphism α : T₁ → T₂ of 𝒯 the square formed by
    H¹_F(K_v, T₁) ⊆ H¹(K_v, T₁) and H¹_F(K_v, T₂) ⊆ H¹(K_v, T₂) is cartesian: H¹_F(K_v, T₁) is the
    inverse image of H¹_F(K_v, T₂) under α_*. A Selmer structure F on T is cartesian if for every q
    ∈ Σ(F) the condition at q, propagated to quotients, is cartesian on Quot_R(T).
  * `TauCeti.KolyvaginSystems.IsCartesian` (structure) [typed above]: The predicate: for every
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
  * test `isCartesian_strict_and_relaxed_field` (degenerate) [typed above]: For R = 𝔽_p and T = 𝔽_p
    the strict and the relaxed conditions are both cartesian.
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
-/

/-
**`ES.0/cartesian-length-linearity`** (lemma): Lengths of cartesian conditions grow linearly.
  Statement. Let R be principal artinian of length k and F a local condition on T at v, cartesian on
    Quot_R(T). Then there is an integer r such that length H⁰(K_v, T/m^iT) − length H¹_F(K_v,
    T/m^iT) = r·i for 0 < i ≤ k.
-/

/-
**`ES.0/quotient-dual-propagation`** (lemma): Propagation commutes with local duality.
  Statement. Let F be a local condition on T at v and I an ideal of R. The two local conditions
    induced on T^*[I] = (T/IT)^* agree: the orthogonal complement of the condition propagated to the
    quotient T/IT, and the condition propagated to the submodule T^*[I] from the orthogonal
    complement F^* on T^*. Consequently, for a Selmer structure F, (F on T/IT)^* = (F^* on T^*[I]),
    and the same holds for the passages T → V and V → V/T of a lattice in its rational
    representation.
-/

/-
**`ES.0/selmer-torsion-identification`** (lemma): Selmer modules of quotients and torsion
    submodules.
  Statement. Assume T̄^{G_K} = (T̄^*)^{G_K} = 0 for T̄ = T/mT (which follows from (H.1) and (H.3) of
    Mazur–Rubin 2004). (a) For every ideal I of R, T^*[I] → T^* induces an isomorphism H¹_{F^*}(K,
    T^*[I]) ≅ H¹_{F^*}(K, T^*)[I]. (b) If R is principal artinian of length k and F is cartesian,
    then for 0 < i ≤ k the injection π^{k−i} : T/m^iT → T induces isomorphisms H¹(K, T/m^iT) ≅ H¹(K,
    T)[m^i] and H¹_F(K, T/m^iT) ≅ H¹_F(K, T)[m^i], and H¹_F(K, T)[m^i] is the kernel of H¹_F(K, T) →
    H¹_F(K, T/m^{k−i}T).
-/

/-
**`ES.0/selmer-length-difference`** (theorem): The Euler characteristic formula for Selmer modules.
  Statement. Let T be a finite R[[G_K]]-module and F a Selmer structure on T. Then length H¹_F(K, T)
    − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v,
    T) − length H¹_F(K_v, T)), all lengths over R.
-/

/-
**`ES.0/core-rank`** (definition): The core rank of a cartesian Selmer structure.
  Statement. Let R be principal artinian of length k, F a cartesian Selmer structure on T, and
    T^{G_K} = (T^*)^{G_K} = 0. There is a unique integer r such that H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕
    R^r if r ≥ 0 and H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*) if r ≤ 0 (noncanonically). The core rank
    is χ(T, F) = max(r, 0), and χ(T^*, F^*) = max(−r, 0); one of the two is zero. For R a discrete
    valuation ring and F cartesian, χ(T, F) is the common value of χ(T/m^kT, F) for k ≥ 1.
  * `TauCeti.KolyvaginSystems.coreRankInt` (data): The integer r with length H¹_F(K, T) − length
    H¹_{F^*}(K, T^*) = r·k.
  * `TauCeti.KolyvaginSystems.coreRank` (data): χ(T, F) = max(r, 0) as a natural number; χ(T^*, F^*)
    = max(−r, 0).
  * `TauCeti.KolyvaginSystems.coreRank_mul_length` (characterisation): If χ(T) > 0 then length
    H¹_F(K, T) − length H¹_{F^*}(K, T^*) = k·χ(T); if χ(T) = 0 the difference is −k·χ(T^*).
  * `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual` (relation): χ(T, F) = 0 or χ(T^*, F^*) = 0.
  * `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free` (equivalence): If χ(T) ≥ 0 there is an
    R-linear isomorphism H¹_F(K, T) ≃ H¹_{F^*}(K, T^*) × R^{χ(T)}.
  * `TauCeti.KolyvaginSystems.coreRank_field` (example): For R = k a field, χ(T) − χ(T^*) = dim_k
    H¹_F(K, T) − dim_k H¹_{F^*}(K, T^*).
  * test `coreRank_cyclotomic_even` (computation): For K = ℚ, R = ℤ/p^k, ρ an even nontrivial
    character of order prime to p and T = μ_{p^k} ⊗ ρ^{-1} with the structure F of Mazur–Rubin 2004
    Definition 6.1.1, χ(T, F) = 1; for ρ odd with ρ ≠ ω, χ(T, F) = 0.
  * test `coreRank_elliptic_classical` (computation): For T = E[p^k] with the classical Selmer
    structure (images of the Kummer maps), F^* = F under the Weil pairing and χ(T, F) = 0, while
    χ(T, F_can) = 1.
  * test `coreRank_field_strict_relaxed` (degenerate): Over R = k, replacing F by the structure
    relaxed at one prime q ∈ P_1 (so that H¹_s(K_q, T) is one-dimensional) raises r by exactly 1.
  * test `coreRank_ne_rank` (non-example): χ(T, F) is not rank_R T: T = E[p^k] has rank 2 and core
    rank 1 for F_can and 0 for the classical structure.
-/

/-
**`ES.0/core-rank-independence-of-modulus`** (theorem): The core rank is independent of the modulus.
  Statement. Let R be principal artinian of length k and F cartesian with the invariants hypothesis
    of core-rank. Then for 0 < i ≤ k the Selmer triple (T/m^iT, F, P) over R/m^i has χ(T/m^iT) =
    χ(T) and χ(T^*[m^i]) = χ(T^*), and H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i]) when
    χ(T) > 0. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈
    Σ(F), then rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*).
-/

/-
**`ES.0/canonical-selmer-structure`** (definition): The canonical and the unramified Selmer
    structures.
  Statement. Let R be the ring of integers of a finite extension of ℚ_p (or a discrete valuation
    ring as in Mazur–Rubin 2016). The canonical Selmer structure F_can on T has Σ(F_can) = {q : T
    ramified at q} ∪ {v | p} ∪ {v | ∞}; H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p))
    for q ∈ Σ(F_can), q ∤ p∞; and H¹_{F_can}(K_v, T) = H¹(K_v, T) for v | p∞. On T/IT it is the
    structure induced from T, which depends on T and not only on T/IT. The unramified structure F_ur
    of Mazur–Rubin 2016 has the same conditions away from p and, at 𝔭 | p, the saturation of the
    universal norm subgroup ∩_L Cor_{L/K_𝔭} H¹(L, T) over finite unramified L/K_𝔭.
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
  * test `canonicalStructure_quotient_ne_relaxed` (non-example): For T = ℤ_p(1) ⊗ ρ^{-1} with ρ(p) =
    1, H⁰(ℚ_p, T^*) is not divisible after reduction and H¹_{F_can}(ℚ_p, T/p^kT) ≠ H¹(ℚ_p, T/p^kT)
    in general: the structure on T/p^kT is not the relaxed one.
  * test `canonicalStructure_elliptic` (computation): For T = T_pE the structure F_can is the
    classical Selmer structure relaxed at p, and F_can^* ≤ F ≤ F_can.
-/

/-
**`ES.0/core-rank-formula`** (theorem): Core rank of the canonical and unramified structures.
  Statement. (a) (K = ℚ) For R the ring of integers of a finite extension of ℚ_p and T satisfying
    (H.0)–(H.3), χ(T^*, F_can^*) = 0 and χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*), where T^−
    is the minus part for a complex conjugation. (b) (K a number field, R a discrete valuation ring)
    χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*).
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
-/

/-
**`ES.0/hypotheses-mr2016`** (definition): The Mazur–Rubin 2016 hypotheses (H.1)–(H.7) over a number
    field.
  Statement. For Selmer data (T, F, P, r) over a number field K, let M be the smallest power of p
    with MR = 0 if R is artinian and M = p^∞ if R is a discrete valuation ring, H the Hilbert class
    field of K and H_M = H(μ_M, (O_K^×)^{1/M}). (H.1) T̄^{G_K} = (T̄^*)^{G_K} = 0 and T̄ is an
    absolutely irreducible k[[G_K]]-module. (H.2) There are τ ∈ Gal(K̄/H_M) and a finite Galois
    extension L of K in H_M such that T/(τ − 1)T is free of rank one over R and P(L, τ) ⊆ P, where
    P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K).
    (H.3) H¹(H_M(T)/K, T/mT) = H¹(H_M(T)/K, T^*[m]) = 0. (H.4) Either T̄ ≇ T̄^* as k[[G_K]]-modules,
    or p > 3. (H.5) F is cartesian. (H.6) r = χ(T) > 0. For R artinian only: (H.7) I_q = 0 for every
    q ∈ P.
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
-/

/-
**`ES.0/hypotheses-implications`** (lemma): Implications between the hypothesis records.
  Statement. (a) (H.0)–(H.4) of 2004 are stable under R → R′ surjective, and (H.6) under T → T/m^jT.
    (b) For R a discrete valuation ring, torsion-freeness of H¹(K_q, T)/H¹_F(K_q, T) for q ∈ Σ(F)
    implies (H.6)/(H.5) for every T/m^kT. (c) 2004 (H.3) implies T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0, hence
    2016 (H.1) given (H.1) of 2004; 2004 (H.3) implies 2016 (H.3) for K = ℚ, because ℚ(T, μ_M) ⊆
    ℚ(T, μ_{p^∞}) and inflation is injective on H¹. (d) 2016 (H.1)–(H.6) for artinian R give (H.7)
    for the prime set P(H_M, τ). (e) Rubin's Hyp(K, T) (ES.4/rubin-hypotheses) gives the τ of 2016
    (H.2) and irreducibility of T̄; it does not give (H.3), whose failure is measured by Rubin's
    error terms n_W and n_W^*.
-/

/-
**`ES.0/example-cyclotomic-twist`** (application): Worked example: twists of ℤ_p(1) by characters of
    finite order.
  Statement. Let p be odd, ρ : G_ℚ → ℤ_p^× a character of finite order prime to p, L its field, R =
    ℤ/p^k (or ℤ_p) and T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1}). With H¹(ℚ, T) =
    (L^×/(L^×)^{p^k})^ρ, let F be the structure with H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ
    for all ℓ. Then: if ρ ≠ 1, ω, T satisfies (H.0)–(H.3), (H.4a), and F, F_can satisfy (H.6); χ(T,
    F) = 1 if ρ is even and ρ ≠ 1, and χ(T, F) = 0 if ρ is odd and ρ ≠ ω; F = F_can if ρ(p) ≠ 1; and
    there are exact sequences 0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0 with
    H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}.
-/

/-
**`ES.0/example-elliptic`** (application): Worked example: the Tate module of an elliptic curve.
  Statement. Let E/ℚ be an elliptic curve and p ≥ 5 a prime with G_ℚ → Aut(E[p]) surjective, T =
    E[p^k] or T_pE, and F the classical Selmer structure (images of the local Kummer maps at the bad
    primes, p and ∞). Then F^* = F under the Weil pairing, H¹_F(ℚ, E[p^k]) is the p^k-Selmer group,
    T satisfies (H.0)–(H.4), F and F_can satisfy (H.6), χ(T, F) = 0 and χ(T, F_can) = 1, where F_can
    is F relaxed at p and F_can^* ≤ F ≤ F_can.
-/

/-
**`ES.0/non-example-inadmissible`** (application): Worked non-example: the trivial and Teichmüller
    characters.
  Statement. For ρ = 1 the module T = ℤ_p(1) does not satisfy (H.3) of Mazur–Rubin 2004: T^*[m] =
    Hom(μ_p, μ_p) = 𝔽_p with trivial action, so (T^*[m])^{G_ℚ} ≠ 0 and H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) =
    Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0. For ρ = ω, T/mT = μ_p ⊗ ω^{-1} is trivial and (H.3) fails for
    the same reason. In both cases Lemma 3.5.2 (no invariants in subquotients), on which the
    definition of the core rank rests, is false, and no instance of the hypothesis record exists.
    Rubin's error-tolerant theorem still applies to T = ℤ_p(1) through Hyp(K, V), with the
    finiteness of S_{Σ_p}(K, W^*) equivalent to Leopoldt's conjecture for T = O.
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
-/

/-
**`ES.1/kolyvagin-primes`** (definition): Kolyvagin primes: P_k, P(L, τ) and R_{F,M}.
  Statement. (a) Over ℚ: P_k is the set of primes ℓ ∉ Σ(F) with T/(m^kT + (Fr_ℓ − 1)T) free of rank
    one over R/m^k and I_ℓ ⊆ m^k; P_1 ⊇ P_2 ⊇ ⋯ and N_k = N(P_k). (b) Over K: P_k = {q ∈ P : I_q ⊆
    m^k}; for a finite Galois L/K and τ ∈ G_K, P(L, τ) is the set of primes q ∉ Σ(F) unramified in L
    with Fr_q conjugate to τ in Gal(L/K). (c) Rubin: for K ⊆ F ⊆ K_∞ finite and 0 ≠ M ∈ O, R_{F,M}
    is the set of r ∈ R(N) such that every prime q | r satisfies M | [K(q) : K(1)], M | P(Fr_q^{-1}
    | T^*; 1), and q splits completely in F(1)/K.
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
  * `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite` (other): Under (H.2), P_k minus any finite
    set is infinite, with positive density.
  * test `kolyvaginPrimes_zp_one` (computation): For T = ℤ_p(1) over ℚ with Σ(F) = {p, ∞}: P_k = {ℓ
    ≠ p : ℓ ≡ 1 (mod p^k)}.
  * test `kolyvaginPrimes_inter` (degenerate): For R = ℤ_p and T = ℤ_p(1), ∩_k P_k = ∅: no prime is
    ≡ 1 modulo every power of p.
  * test `rubinPrimes_rat` (compatibility): For K = ℚ, F = ℚ, T = ℤ_p(1) and M = p^k, a prime ℓ ∤ N
    lies in R_{ℚ,M} iff ℓ ≡ 1 (mod p^k), since P(Fr_ℓ^{-1} | T^*; 1) = 1 − Fr_ℓ^{-1} acting on T^* =
    ℤ_p is 0 and [ℚ(ℓ) : ℚ] is the p-part of ℓ − 1.
  * test `not_mem_kolyvaginPrimes` (non-example): For T = T_pE and ℓ ≡ 1 (mod p) with a_ℓ ≢ 2 (mod
    p), ℓ ∉ P_1: I_ℓ = R.
-/

/-
**`ES.1/finite-singular-decomposition`** (lemma): Finite and singular parts at an unramified prime.
  Statement. Let K_v be nonarchimedean of residue characteristic ≠ p with residue field 𝔽, T a
    finitely generated R-module with unramified G_{K_v}-action and |𝔽^×|·T = 0. There are canonical
    functorial isomorphisms H¹_f(K_v, T) ≅ T/(Fr − 1)T (evaluate cocycles at Frobenius), H¹_s(K_v,
    T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1}), and H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}.
-/

/-
**`ES.1/transverse-condition`** (definition): The transverse local condition.
  Statement. In the situation of finite-singular-decomposition, fix a maximal totally tamely
    ramified abelian extension L/K_v (so Gal(L/K_v) ≅ 𝔽^×; for K_v = ℚ_ℓ take L = ℚ_ℓ(μ_ℓ); globally
    L is the completion of K(q) at q, of degree |G_q|, with T killed by |G_q|). The L-transverse
    condition is H¹_tr(K_v, T) = ker(H¹(K_v, T) → H¹(L, T)) = H¹(L/K_v, T^{G_L}). It projects
    isomorphically onto H¹_s(K_v, T), so H¹(K_v, T) = H¹_f(K_v, T) ⊕ H¹_tr(K_v, T), functorially in
    T. It is defined by restriction to the specified extension L, not by a choice of complement.
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
  * `TauCeti.KolyvaginSystems.fsQuotientPoly` (data) [typed above]: Q(x) with (x − 1)·Q(x) = det(1 −
    Fr·x | T), defined when det(1 − Fr | T) = 0.
  * `TauCeti.KolyvaginSystems.fsQuotientPoly_spec` (characterisation) [typed above]: (X − 1) * Q = P
    and Q is unique.
  * `TauCeti.KolyvaginSystems.finiteSingular` (constructor): φ^fs : H¹_f(K_v, T) → H¹_s(K_v, T) ⊗
    𝔽^×, induced by Q(Fr^{-1}) : T/(Fr − 1)T → T^{Fr=1}.
  * `TauCeti.KolyvaginSystems.finiteSingular_bijective` (characterisation): If R is artinian, |𝔽^×|R
    = 0 and T/(Fr − 1)T is free of rank one, φ^fs is bijective and H¹_f, H¹_s are free of rank one.
  * `TauCeti.KolyvaginSystems.finiteSingular_map` (functoriality): For T → T′ equivariant between
    such modules, φ^fs commutes with the induced maps on H¹_f and H¹_s ⊗ 𝔽^×; in particular with T/I
    → T/J.
  * `TauCeti.KolyvaginSystems.finiteSingular_generator` (compatibility): For a generator σ of the
    tame quotient, φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ with φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q
    Rubin's map; φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map does not depend on σ.
  * test `finiteSingular_cyclotomic` (computation) [typed above]: R = ℤ/p^k, T = μ_{p^k}, ℓ ≡ 1 (mod
    p^k): Fr = 1 on T, P(x) = 1 − x, Q(x) = −1, and φ^fs = −1 under H¹_f ≅ T, H¹_s ⊗ 𝔽_ℓ^× ≅ T.
  * test `finiteSingular_rank_two` (computation) [typed above]: R = 𝔽_p, T with Fr = diag(1, a), a ≠
    1: P(x) = (1 − x)(1 − ax), Q(x) = −(1 − ax), Q(Fr^{-1}) = −diag(1 − a, 0), which maps T/(Fr −
    1)T = 𝔽_p e₁ isomorphically onto T^{Fr=1} = 𝔽_p e₁.
  * test `finiteSingular_not_iso` (non-example): R = 𝔽_p, T = 𝔽_p² with Fr = 1: T/(Fr − 1)T has rank
    two, P(x) = (1 − x)², Q(x) = −(1 − x), and Q(Fr^{-1}) = 0: φ^fs is zero, not an isomorphism. The
    rank-one hypothesis is needed.
  * test `finiteSingular_quotient` (compatibility): For R = ℤ/p², T free of rank one with Fr = 1 +
    p·u and I = (p): the map φ^fs on T/pT is the reduction of Q(Fr^{-1}) computed over R/p, and the
    square with T/pT → T/pT is commutative by functoriality.
-/

/-
**`ES.1/modified-selmer-structures`** (definition): The Selmer structures F_a^b(c).
  Statement. For a Selmer structure F and pairwise coprime a, b, c with c ∈ N(P) (and I_cT = 0 when
    needed for the transverse condition; in general one works on T/I_cT), F_a^b(c) has Σ = Σ(F) ∪ {q
    : q | abc} and local conditions: H¹_F(K_q, T) for q ∈ Σ(F), q ∤ ab; 0 for q | a (strict);
    H¹(K_q, T) for q | b (relaxed); H¹_tr(K_q, T) for q | c (transverse). One writes F(n) =
    F^1_1(n), F^n, F_n. Then F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n, and the dual is (F_a^b(c))^* =
    (F^*)_b^a(c).
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
-/

/-
**`ES.1/transverse-duality`** (theorem): The transverse condition is self-dual.
  Statement. Let K_v be nonarchimedean of residue characteristic ≠ p, T unramified with |𝔽^×|·T = 0,
    and L/K_v totally ramified abelian of degree |𝔽^×|. Then H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are
    exact orthogonal complements under the local Tate pairing H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p,
    as are H¹_f(K_v, T) and H¹_f(K_v, T^*).
-/

/-
**`ES.1/chebotarev-nonvanishing`** (theorem): Simultaneous nonvanishing of localisations.
  Statement. Let R be principal artinian and (T, F, P) satisfy (H.0)–(H.5) of Mazur–Rubin 2004. If
    c₁, c₂ ∈ H¹(ℚ, T) and c₃, c₄ ∈ H¹(ℚ, T^*) are all nonzero, then for every k ≥ 1 there is a set S
    ⊆ P_k of positive density such that for every ℓ ∈ S the four localisations (c_i)_ℓ are nonzero.
    Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under
    Hypothesis 3.2): for nonzero c₁, …, c_s ∈ H¹(K, A) and c₁^*, …, c_t^* ∈ H¹(K, A^*(1)) with s + t
    < p, there is a set of primes q ∈ P of positive density with all localisations nonzero.
-/

/-
**`ES.1/chebotarev-prescribed-kernels`** (theorem): Primes with prescribed localisation kernels.
  Statement. In the setting of chebotarev-nonvanishing, suppose the image of R → End(T) is contained
    in the image of ℤ_p[[G_ℚ]] → End(T). Fix a finite R-submodule C ⊆ H¹(ℚ, T), a homomorphism φ : C
    → R and k ≥ 1. (i) There is a set S ⊆ P_k of positive density with ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) =
    ker φ for all ℓ ∈ S. (ii) If also (H.4a) holds, D ⊆ H¹(ℚ, T^*) is a finite submodule and ψ : D →
    R a homomorphism, then S can be chosen with in addition ker(loc_ℓ on D) = ker ψ.
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
  * `TauCeti.ErrorTolerant.expAt` (data) [typed above]: exp_λ(x, M) ∈ ℕ∞.
  * `TauCeti.ErrorTolerant.ordAt` (data) [typed above]: ord_λ(x, M) ∈ ℕ∞.
  * `TauCeti.ErrorTolerant.expAt_add_ordAt_le` (relation): In a free O_λ/λ^n-module, exp_λ(x) +
    ord_λ(x) = n for x ≠ 0.
  * `TauCeti.ErrorTolerant.reducibilityDepth` (data): r_R for a torsion O_λ[G]-module R of finite
    type.
  * `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero` (example): If R/λR is absolutely irreducible
    then r_R = 0.
  * `TauCeti.ErrorTolerant.reducibilityDepth_bounded` (other): For a lattice R with R_ℚ absolutely
    irreducible, sup_m r_{R̄^{(m)}} < ∞.
  * test `expAt_zmod` (computation) [typed above]: In M = ℤ/p³, exp_p(p) = 2 and ord_p(p) = 1.
  * test `reducibilityDepth_irreducible` (degenerate): For R = E[p^m] with E[p] absolutely
    irreducible, r_R = 0.
  * test `reducibilityDepth_reducible` (non-example): For R = ℤ/p² ⊕ ℤ/p² with G acting through the
    upper unipotent matrices (1, p·b; 0, 1), b ∈ ℤ/p, the submodule generated by e₁ is G-stable and
    not contained in pR but does not contain R, so r_R ≥ 1: r_R ≠ 0 although R is free.
  * test `ordAt_top_iff` (characterisation) [typed above]: ord_λ(x, M) = ∞ iff x ∈ ∩_d λ^d M; for M
    of finite length this means x = 0.
-/

/-
**`ES.1/selmer-field-saturation`** (theorem): The field cut out by a Selmer module and saturation of
    θ_S.
  Statement. Fix m ≥ 1 and R free of finite rank over O_λ/λ^m with ρ : Γ_F → GL(R), F_ρ the field
    fixed by ker ρ and G = Gal(F_ρ/F). Restriction Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R) gives a
    pairing [ , ] : H¹(F, R) × Γ^{ab}_{F_ρ} → R. For a finitely generated submodule S ⊆ H¹(F, R),
    F_S/F_ρ is the finite abelian extension with Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}, and
    θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R) is injective and G-equivariant. (a) If Res_ρ is injective
    and S is free of rank r_S over O_λ/λ^m, the O_λ-span of the image of θ_S contains λ^{𝔣(r_S) r_R}
    Hom_{O_λ}(S, R), where 𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1) for r ≥ 2. (b) Res_ρ is
    injective if the image of Γ_F in GL(R̄) contains a nontrivial scalar, or if dim R̄ ≤ min{(ℓ +
    1)/2, ℓ − 3}, R̄ is semisimple and Hom_{Γ_F}(End(R̄), R̄) = 0.
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
  * `TauCeti.EulerSystems.eulerPoly` (data) [typed above]: P(Fr_q^{-1} | T^*; x) = det(1 −
    Fr_q^{-1}·x | T^*) ∈ O[X], for T unramified at q.
  * `TauCeti.EulerSystems.eulerPoly_eq_det_twist` (characterisation): P(Fr_q^{-1} | T^*; x) = det(1
    − N(q)^{-1}·Fr_q·x | T).
  * `TauCeti.EulerSystems.eulerPolyMR` (data) [typed above]: P_q(x) = det(1 − Fr_q·x | T), the
    Mazur–Rubin convention.
  * `TauCeti.EulerSystems.eulerPoly_coeff` (relation) [typed above]: coeff_i(eulerPoly) · N(q)^i =
    coeff_i(eulerPolyMR).
  * `TauCeti.EulerSystems.eulerPoly_congr` (relation) [typed above]: eulerPoly ≡ eulerPolyMR modulo
    (N(q) − 1)·O[X].
  * `TauCeti.EulerSystems.eulerPoly_aeval_annihilates` (characterisation): P(Fr_q^{-1} | T^*;
    N(q)Fr_q^{-1}) = 0 on T, and P(Fr_q^{-1} | T^*; Fr_q^{-1}) = 0 on W_M when M | [K(q) : K(1)].
  * `TauCeti.EulerSystems.eulerPoly_twist` (compatibility): For a character χ of finite order
    unramified at q: P(Fr_q^{-1} | (T ⊗ χ)^*; x) = P(Fr_q^{-1} | T^*; χ(Fr_q)x).
  * test `eulerPoly_zp_one` (computation) [typed above]: For T = ℤ_p(1): eulerPoly = 1 − X and
    eulerPolyMR = 1 − N(q)X.
  * test `eulerPoly_elliptic` (computation): For T = T_pE, q = ℓ of good reduction: eulerPolyMR = 1
    − a_ℓX + ℓX² and eulerPoly = 1 − a_ℓ ℓ^{-1}X + ℓ^{-1}X²; at X = 1 they are (1 − a_ℓ + ℓ) and
    ℓ^{-1}(ℓ − a_ℓ + 1).
  * test `eulerPoly_ne_eulerPolyMR` (non-example): For T = ℤ_p(1) and N(q) ≠ 1 the two polynomials
    are different elements of O[X], although congruent modulo N(q) − 1.
  * test `eulerPoly_rank_zero` (degenerate) [typed above]: For T = 0 both polynomials are 1.
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
  * `TauCeti.EulerSystems.EulerSystem` (structure) [typed above]: The submodule ES(T, 𝒦, N) ⊆ ∏_{K
    ⊂_f F ⊆ 𝒦} H¹(F, T) of families satisfying the corestriction relations.
  * `TauCeti.EulerSystems.EulerSystem.eval` (projection) [typed above]: c ↦ c_F, an O-linear map
    ES(T, 𝒦, N) → H¹(F, T).
  * `TauCeti.EulerSystems.EulerSystem.cor_eval` (relation) [typed above]: Cor_{F′/F}(c_{F′}) = (∏_{q
    ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1}))·c_F.
  * `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq` (simp): If Σ(F′/F) = ∅ then
    Cor_{F′/F}(c_{F′}) = c_F.
  * `TauCeti.EulerSystems.EulerSystem.ext` (extensionality) [typed above]: Two Euler systems with
    the same classes c_F for all F are equal.
  * `TauCeti.EulerSystems.EulerSystem.lift` (universal-property) [typed above]: A family of O-linear
    maps f_F : X → H¹(F, T) satisfying the relations is the same as an O-linear map X → ES(T, 𝒦, N);
    it is determined by the f_F.
  * `TauCeti.EulerSystems.EulerSystem.restrictTower` (functoriality): For 𝒦′ ⊆ 𝒦, restriction of the
    index family is an O-linear map ES(T, 𝒦, N) → ES(T, 𝒦′, N); for an ideal N′ prime to p and 𝒦₀
    the maximal subextension of 𝒦 unramified at the primes dividing N′, it lands in ES(T, 𝒦₀, NN′).
  * `TauCeti.EulerSystems.IsAdmissibleTower` (structure): Rubin's conditions (i) and (ii) on (𝒦, N,
    K_∞).
  * test `EulerSystem.zero_mem` (degenerate) [typed above]: The family c_F = 0 is an Euler system.
  * test `EulerSystem.cyclotomic_units` (computation): For K = ℚ, T = ℤ_p(1) and the Kummer images
    of the p-extended cyclotomic units c̃_m, the relation for ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp, is
    N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}: the factor is P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}.
  * test `EulerSystem.not_restriction` (non-example): A family with res_{F′/F}(c_F) = c_{F′} for all
    F ⊆ F′ and c_K ≠ 0 non-torsion is not an Euler system for a tower containing K_∞: corestriction
    would give [F′ : F]c_F = c_F for F′ ⊆ F K_∞.
  * test `EulerSystem.universal_norm` (characterisation) [typed above]: For an admissible tower and
    F ⊆ F′ ⊆ F K_∞, c_F = Cor_{F′/F}(c_{F′}); hence c_F ∈ ∩_{F′} Cor_{F′/F} H¹(F′, T).
-/

/-
**`ES.2/classes-unramified-outside-p`** (theorem): Euler-system classes are unramified away from p.
  Statement. Let c be an Euler system for an admissible tower (so 𝒦 ⊇ K_∞ with no finite prime
    splitting completely). Then for every F and every place w ∤ p of F, (c_F)_w ∈ H¹_ur(F_w, T);
    that is, c_F ∈ S^{Σ_p}(F, T), and c_F ∈ H¹_{F_can}(F, T). Hence c_F lies in H¹(O_{F,S(F)}, T)
    for S(F) = S ∪ S_ram(F/K), the cohomology of the maximal extension unramified outside S(F).
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
  * test `EulerSystem.twist_conductor` (non-example): c^χ is not an Euler system for (T ⊗ χ, 𝒦, N)
    when 𝔣 ∤ N: at q | 𝔣 the relation for F ⊆ F′ with q ramified in F′ but not F fails, which is why
    N is replaced by 𝔣N.
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
-/

/-
**`ES.2/universal-euler-system`** (construction): The universal Euler system.
  Statement. Fix N and K_∞/K as in an admissible tower, R(N) the squarefree products of primes not
    dividing N. For r ∈ R(N) and K ⊂_f F ⊆ K_∞, X_{F(r)} = Y_{F(r)}/Z_{F(r)}, where Y_{F(r)} is the
    free O[Gal(F(r)/K)]-module on symbols x_{F(s)}, s | r, and Z_{F(r)} is generated by σx_{F(s)} −
    x_{F(s)} (σ ∈ Gal(F(r)/F(s))), N_q x_{F(qs)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} (qs | r,
    K(q) ≠ K(1)) and x_{F(qs)} − x_{F(s)} (qs | r, K(q) = K(1)). The universal Euler system is X =
    colim_{F,r} X_{F(r)}; X_{∞,r} = lim_F X_{F(r)}. Sending x_{F(r)} ↦ c_{F(r)} gives G_K-
    equivariant maps X_{F(r)} → H¹(F(r), T) for every Euler system c. Structure: X_{F(r)} is a
    finitely generated free O-module, free over O[Gal(F(r)/K(r))] of rank [K(r) : K], X_{F(r)} ⊗ Φ
    is free of rank one over Φ[Gal(F(r)/K)], X_{F′(r)} ⊗ O[Gal(F(r)/K)] ≅ X_{F(r)}, X_{F(s)} ≅
    X_{F′(r)}^{Gal(F′(r)/F(s))}; X_{∞,r} is free of rank [K(r) : K] over O[[Gal(K_∞(r)/K(r))]]; and
    Ext¹_{(O/M)[G]}(X_{F(r)}/M, (O/M)[G]^k) = 0 for G = Gal(F(r)/K), with the analogue for X_{∞,r}.
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
-/

/-
**`ES.2/rigidity-variants`** (definition): Variants: rigidity conditions, finite depth and
    anticyclotomic systems.
  Statement. (a) Rigidity. Without condition (ii) of an admissible tower the class c_K can be
    unconstrained: if K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for every q ∤ N and 𝒦 is the
    maximal abelian extension unramified outside N, the only relations involving c_K are
    Cor_{F/K}c_F = ∏_{q ∈ Σ(F/K)} P(Fr_q^{-1} | T^*; 1)c_K = 0, and the family c_F = 0 (F ≠ K), c_K
    arbitrary is an Euler system. Condition (ii) is therefore replaced by (ii)′: at least one of (a)
    𝒦 contains a ℤ_p^d-extension of K in which no finite prime splits completely; (b) c_{K(r)} ∈
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
    1) = 0 for all q ∤ N and 𝒦 is the maximal abelian extension of K unramified outside N, the
    family c_K = x, c_F = 0 for F ≠ K is an Euler system for every x ∈ H¹(K, T); for x ∉ S^{Σ_p}(K,
    T) it satisfies none of (a), (b), (c).
  * test `AnticyclotomicEulerSystem.heegner_shape` (computation): For K = ℚ, χ the quadratic
    character of an imaginary quadratic field K′: d = 2 and the relation at a prime ℓ inert in K′
    uses P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1}) with Fr_ℓ ∈ G_ℚ, whose square is the Frobenius of the prime
    of K′ above ℓ.
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
  * `TauCeti.KolyvaginSystems.normElement` (data) [typed above]: N_Γ = Σ_{γ ∈ Γ} γ ∈ ℤ[Γ] for a
    finite group Γ.
  * `TauCeti.KolyvaginSystems.kolyvaginDerivative` (data) [typed above]: D_σ = Σ_{i < n} i·σ^i ∈
    ℤ[Γ] for σ of order n.
  * `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative` (relation) [typed above]: (σ − 1)·D_σ
    = n − N_Γ when σ generates Γ of order n.
  * `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative` (simp) [typed above]: ε(D_σ) = n(n −
    1)/2 and ε(N_Γ) = n.
  * `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod` (relation): For Γ = Γ₁ × Γ₂ and r = st: D_r
    = D_s·D_t and N_r = N_s·N_t in ℤ[Γ₁ × Γ₂].
  * `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator` (compatibility) [typed above]: For a·a′
    ≡ 1 (mod n): D_{σ^a} − a′·D_σ ∈ n·ℤ[Γ].
  * `TauCeti.KolyvaginSystems.normElement_eq_representation_norm` (compatibility) [typed above]: For
    a representation ρ of Γ, the action of N_Γ is Mathlib's Representation.norm ρ.
  * test `kolyvaginDerivative_order_two` (computation) [typed above]: For Γ = {1, σ}: D_σ = σ, N_Γ =
    1 + σ and (σ − 1)σ = 2 − (1 + σ).
  * test `kolyvaginDerivative_order_three` (computation) [typed above]: For n = 3: D_σ = σ + 2σ² and
    (σ − 1)(σ + 2σ²) = 3 − (1 + σ + σ²).
  * test `kolyvaginDerivative_trivial` (degenerate) [typed above]: For Γ = 1: D = 0 and N = 1, and
    the identity reads 0 = 1 − 1.
  * test `kolyvaginDerivative_not_norm_multiple` (non-example) [typed above]: D_σ is not annihilated
    by σ − 1 in ℤ[Γ] for n ≥ 2: (σ − 1)D_σ = n − N_Γ ≠ 0; it is invariant only modulo (n, N_Γ).
-/

/-
**`ES.3/derivative-invariance`** (lemma): Invariance of the derivative of the universal class.
  Statement. Let K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}. If N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)] restricts
    to Σ_{γ ∈ Gal(F(1)/F)} γ, then N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)},
    independently of the choice of N_{F(1)/F}. Consequently for an Euler system c the image of
    N_{F(1)/F}D_r c_{F(r)} in H¹(F(r), W_M) is fixed by Gal(F(r)/F).
-/

/-
**`ES.3/lifting-to-induced-module`** (theorem): The induced module, the connecting map and lifts of
    an Euler system.
  Statement. Let 𝕎_M = Maps_cont(G_K, W_M) with (γf)(g) = f(gγ), containing W_M via t ↦ (g ↦ gt).
    (a) For K ⊂_f L ⊆ K_∞(r) there is a canonical δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M) with 0 →
    W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0 exact; δ_L(f) is represented by γ ↦ (γ
    − 1)f̂ for a lift f̂ ∈ 𝕎_M; and δ commutes with restriction and with norm/corestriction. (b) For
    an Euler system c and r ∈ R there is a family of O[G_K]-maps d_F : X_{F(r)} →
    (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞, with δ_{F(r)} ∘ d_F equal to x_{F(s)} ↦ c_{F(s)} (mod M)
    and compatible with norms N_{F′(r)/F(r)}; each d_F is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M).
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
-/

/-
**`ES.3/congruence`** (theorem): Kolyvagin's congruence.
  Statement. Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, q ∈ R prime and rq ∈ R. For every prime
    Q of F(rq) above q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)])
    (c_{F(r)})_Q in H¹(F(rq)_Q, T), where P_q(x) = P(Fr_q^{-1} | T^*; x) and (P_q(x) −
    P_q(N(q)x))/[K(q) : K(1)] ∈ O[x].
-/

/-
**`ES.3/kolyvagin-system-module`** (definition): Kolyvagin systems, weak Kolyvagin systems and their
    limits.
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
-/

/-
**`ES.3/finite-part-formula`** (theorem): Derivative classes form a weak Kolyvagin system; their
    finite parts.
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
-/

/-
**`ES.3/two-prime-test`** (application): The two-prime check of the correction terms.
  Statement. For distinct ℓ, q ∈ P and n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q) and (κ_{ℓq})_{q,s} =
    φ^fs_q(κ_ℓ); (ii) (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}));
    (iii) the corrected class κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})) has
    zero finite part at ℓ and at q and the same singular parts as κ_{ℓq} at ℓ and q, because the
    correction term κ_1 is unramified at ℓ and q; (iv) κ′_{ℓq} is symmetric in ℓ and q. Hence κ′
    satisfies both edge relations of the square 1 — ℓ — ℓq — q — 1.
-/

/-
**`ES.3/anticyclotomic-derivative`** (theorem): Derivative classes of χ-anticyclotomic Euler
    systems.
  Statement. Let χ : G_K → ℤ_p^× have order d | p − 1, K′ the field cut out by χ, and c a
    χ-anticyclotomic Euler system for T. For a power M of p let R_{K′,M} be the squarefree ideals of
    K divisible only by primes q ∤ N with M | [K′(q)_χ : K′(1)_χ] and M | P(Fr_q^{-1} | T^*; 1). The
    construction of derivative-class gives κ_{K′,r,M} ∈ H¹(K′, W_M) for r ∈ R_{K′,M}, satisfying the
    analogues of derivative-local-properties (a) and (b): loc^s_q(κ_{K′,rq,M}) = φ^fs_q(κ_{K′,r,M}).
    The map φ^fs_q : H¹_f(K′_q, W_M) → H¹_s(K′_q, W_M) is not Gal(K′/K)-equivariant: it sends the
    χ^i-part into the χ^{i−1}-part.
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
  * `TauCeti.KolyvaginSystems.conductorGraph` (constructor) [typed above]: X(P): the simple graph on
    N(P) with n adjacent to m iff m = nq or n = mq for a prime q ∈ P.
  * `TauCeti.KolyvaginSystems.GraphSheaf` (structure) [typed above]: Vertex modules, edge modules
    and vertex-to-edge maps on a simple graph.
  * `TauCeti.KolyvaginSystems.GraphSheaf.sections` (data) [typed above]: Γ(S), the submodule of ∏_v
    S(v) of compatible families.
  * `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections` (characterisation) [typed above]: κ ∈ Γ(S)
    iff ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}.
  * `TauCeti.KolyvaginSystems.selmerSheaf` (constructor): ℋ_{(T,F,P)} on X(P).
  * `TauCeti.KolyvaginSystems.sections_selmerSheaf` (equivalence): Γ(ℋ) = KS(T, F, P) as submodules
    of ∏_n ℋ(n).
  * `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf` (structure) [typed above]: Subsheaves: submodules
    of the stalks and edge modules stable under the maps; Γ of a subsheaf is a submodule of Γ.
  * test `conductorGraph_two_primes` (computation) [typed above]: For P = {q₁, q₂}, X(P) is the
    4-cycle 1 — q₁ — q₁q₂ — q₂ — 1.
  * test `sections_one_vertex` (degenerate): For P = ∅ the graph has the single vertex 1 and Γ(ℋ) =
    ℋ(1) = H¹_F(K, T).
  * test `selmerSheaf_stalk_one` (compatibility): ℋ(1) = H¹_F(K, T) and ℋ̂(1) = H¹_F(K, T).
  * test `sections_ne_product` (non-example): For P = {q} with φ^fs_q ≠ 0 on the image of H¹_F(K,
    T), the pair (κ_1, 0) with φ^fs_q((κ_1)_q) ≠ 0 is not a global section: Γ(ℋ) is a proper
    submodule of ℋ(1) × ℋ(q).
-/

/-
**`ES.4/sheaf-monodromy`** (definition): Locally cyclic sheaves, hubs, monodromy and primitive
    sections.
  Statement. Let S be a sheaf of R-modules on a graph X. S is locally free of rank r if all S(v),
    S(e) are free of rank r and all ψ_v^e are isomorphisms; locally cyclic if all S(v), S(e) are
    cyclic and all ψ_v^e are surjective. For S locally cyclic, a surjective path from v to w is a
    path (v = v₁, …, v_k = w) such that each ψ_{v_{i+1}}^{e_i} is an isomorphism; it induces a
    surjection ψ_P : S(v) → S(w). A vertex v is a hub if every vertex is reached from v by a
    surjective path. S has trivial monodromy if for surjective paths P, P′ from v to w, w′ joined by
    an edge e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}. A global section κ is primitive if κ_v generates
    S(v) for every v. Proposition: if S is locally cyclic and v is a hub, then Γ(S) → S(v), κ ↦ κ_v,
    is injective, and surjective iff S has trivial monodromy; Γ(S) is isomorphic to an ideal of R;
    and if κ_u ≠ 0 generates m^iS(u) for some u then κ_w generates m^iS(w) for every w.
  * `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic` (structure) [typed above]: All stalks and
    edge modules cyclic, all vertex-to-edge maps surjective.
  * `TauCeti.KolyvaginSystems.GraphSheaf.IsHub` (structure) [typed above]: v is a hub: every vertex
    is the end of a surjective path from v.
  * `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy` (structure): The compatibility of ψ_P
    along surjective paths.
  * `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub` (characterisation) [typed above]:
    For S locally cyclic and v a hub, κ ↦ κ_v is injective on Γ(S).
  * `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff` (characterisation): For v a hub, κ ↦
    κ_v is surjective iff S has trivial monodromy.
  * `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive` (structure) [typed above]: κ_v generates S(v)
    for all v.
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
  * test `isPrimitive_zero_module` (degenerate) [typed above]: If all stalks are 0 the zero section
    is primitive.
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
-/

/-
**`ES.4/leading-vertices`** (theorem): Leading vertices through a prescribed submodule.
  Statement. In the setting of core-vertices suppose χ(T) > 0, 1 is not a core vertex, (H.4a) holds
    and the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]]. If L ⊆ H¹_F(ℚ, T) satisfies
    dim_k L[m] = χ(T), there are infinitely many leading vertices n with L ⊆ H¹_{F(n)}(ℚ, T). For R
    = k and χ(T) = 1: for every line L in H¹_F(ℚ, T) there is a leading vertex n with κ_n generating
    L ⊗ G_n for any nonzero κ ∈ KS(T).
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
-/

/-
**`ES.4/kolyvagin-bound`** (theorem): The Kolyvagin system bound.
  Statement. (a) (R principal artinian of length k, (H.0)–(H.6), and one of the conditions of
    Theorem 4.4.1, or κ sufficiently liftable.) For κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ max{i : κ_1
    ∈ m^iH¹_F(ℚ, T)}. (b) (R a discrete valuation ring, (H.0)–(H.5), H¹(ℚ_ℓ, T)/H¹_F(ℚ_ℓ, T)
    torsion-free for ℓ ∈ Σ(F), P = P_1.) For κ ∈ KS(T) put ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(ℚ, T)}
    ≤ ∞. Then length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ); in particular if κ_1 ≠ 0 then H¹_{F^*}(ℚ, T^*)
    is finite. The same holds for κ̄ ∈ K̄S(T). The bound concerns the whole dual Selmer group
    H¹_{F^*}(ℚ, T^*) of the discrete module T^* = Hom(T, μ_{p^∞}), not a cotorsion quotient; for κ_1
    = 0 it is vacuous (∂^{(0)} = ∞).
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
-/

/-
**`ES.4/variant-bounds`** (theorem): Bounds for the variants: finite depth and anticyclotomic
    systems.
  Statement. (a) (Finite depth.) Let 0 ≠ M ∈ O and c an Euler system for W_M. Suppose Hyp(K, T)
    holds, n_W = n_W^* = 0 and W_M^{G_K} = 0. Let m = sup_{q ∤ p} [W^{I_q} : (W^{I_q})_div] and n
    the order of m·c_K in H¹(K, W_M). Then n·S_{Σ_p}(K, W_M^*) = 0; in particular if m·c_K ≠ 0 then
    S_{Σ_p}(K, W^*) is finite for a compatible family. (b) (Anticyclotomic.) Let c be a
    χ-anticyclotomic Euler system for T with H¹(Ω′/K′, W) = H¹(Ω′/K′, W^*) = 0, T ⊗ k irreducible
    over G_{K′}, and τ ∈ G_K with ε_cyc(τ) = χ(τ), τ^d the identity on K′(1)_χ(μ_{p^∞},
    (O_{K′}^×)^{1/p^∞}) and T/(τ − 1)T free of rank one. Then for every i, 𝔭^{ind_O(c, χ^i)}
    S_{Σ_p}(K′, W^*)^{χ^{1−i}} = 0, where ind_O(c, χ^i) is the index of divisibility of the
    χ^i-component of c_{K′}. This bounds exponents of eigenspaces, not lengths.
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
    AC = λ^c·I, and the elements s_j = Ce_j ∈ S satisfy loc_{w_i}(s_j) = 0 for i ≠ j and
    exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ − 𝔣(r)r_R; the s_j span a submodule
    containing λ^{𝔣(r)r_R}S and form a basis of S when 𝔣(r)r_R = 0. For r = 2 and a primitive v ∈ S
    one can moreover choose a primitive t ∈ S with loc_{w₁}(t) = 0 and exp_λ(loc_{w₂}(t)) ≥ m − m₀ −
    𝔣(2)r_R after possibly interchanging the two places. The printed statement (a basis for every
    abundant tuple) is false when the loss is positive.
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
    d_i(N) ≤ d_i(M). When ρ_E|_{G_K} is surjective, E_α = 0 and the statement is ES.5/howard-dvr-
    theorem. Residual irreducibility is not assumed.
-/

/-! ### Layer ES.5 -/

/-
**`ES.5/divisibility-invariants`** (definition): Divisibility indices, elementary divisors and
    primitivity.
  Statement. Let (T, F, P) be a Selmer triple and κ ∈ KS(T). (a) R principal artinian of length k:
    ∂^{(r)}(κ) = min{k − length(Rκ_n) : n ∈ N, ν(n) = r} and e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for
    i ≥ 0. (b) R a discrete valuation ring: ∂^{(r)}(κ) = max{j : κ_n ∈ m^j H¹_{F(n)}(K, T/I_nT) ⊗
    G_n for every n ∈ N with ν(n) = r} ∈ ℕ ∪ {∞}, ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(K, T)}, e_i(κ)
    = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ ord(κ), and ∂^{(∞)}(κ) = min{∂^{(r)}(κ) : r ≥ 0}. κ is
    primitive if its image in KS(T/mT) is nonzero. The index of κ is ∂^{(0)}(κ), the divisibility of
    the initial class; it is ∞ when κ_1 = 0.
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex` (data): ∂^{(r)}(κ) ∈ ℕ∞ for r ≥ 0.
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero` (characterisation): ∂^{(0)}(κ) = sup{j
    : κ_1 ∈ m^j H¹_F(K, T)}; it is ⊤ iff κ_1 = 0 (R a discrete valuation ring, H¹_F torsion-free).
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor` (data): e_i(κ) = ∂^{(i)}(κ) −
    ∂^{(i+1)}(κ), defined for i ≥ ord(κ).
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty` (data): ∂^{(∞)}(κ) = inf_r ∂^{(r)}(κ).
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive` (structure): The image of κ in KS(T/mT)
    is nonzero.
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul` (relation): ∂^{(r)}(π·κ) = ∂^{(r)}(κ) +
    1 for a uniformiser π.
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul` (relation): π·κ is not
    primitive.
  * `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq` (characterisation): ord(κ) = min{r :
    ∂^{(r)}(κ) ≠ ⊤}.
  * test `divIndex_zero_system` (degenerate): For κ = 0: ∂^{(r)}(κ) = ⊤ for all r, ord(κ) = ⊤, and κ
    is not primitive.
  * test `divIndex_scaling` (computation): If κ is primitive with ∂^{(0)}(κ) = 3 then ∂^{(0)}(π²κ) =
    5 and π²κ is not primitive.
  * test `isPrimitive_field` (characterisation): For R = k a field, κ is primitive iff κ ≠ 0.
  * test `isPrimitive_ne_nonzero_initial` (non-example): κ_1 ≠ 0 does not imply primitivity: for a
    primitive κ₀ with (κ₀)_1 ≠ 0, the system πκ₀ has nonzero initial class and is not primitive.
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
-/

/-
**`ES.5/sharpness-examples`** (application): Scaling, vanishing leading class and a non-primitive
    arithmetic system.
  Statement. (a) Scaling: for κ primitive with κ_1 ≠ 0 over a discrete valuation ring (χ(T) = 1),
    length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ); for κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length
    H¹_{F^*}(ℚ, T^*), the e_i are unchanged and κ′ is not primitive: the bound for κ′ is true and
    not sharp. (b) A Kolyvagin system with κ_1 = 0 is a valid element of KS(T); for it ∂^{(0)} = ∞,
    the bound is vacuous, and by the structure theorem H¹_{F^*}(ℚ, T^*) is infinite when χ(T) = 1.
    (c) Kato's Kolyvagin system for T_pE: if L(E, 1) ≠ 0, p satisfies the hypotheses of Mazur–Rubin
    2004 Theorem 6.2.4(ii) and p divides a Tamagawa factor c_ℓ for some ℓ ≠ p, then κ^{Kato} is not
    primitive: it is a Kolyvagin system for the finer structure F_u with unramified conditions away
    from p, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a
    length.
-/

/-
**`ES.5/howard-hypotheses`** (definition): Howard's self-dual Selmer triples and hypotheses H.0–H.5.
  Statement. Let K be an imaginary quadratic field, τ a complex conjugation, R a coefficient ring
    (complete noetherian local, finite residue field of characteristic p; in §1.5 principal
    artinian, in §1.6 a discrete valuation ring) and T an R-module with continuous G_K-action. 𝓛₀ is
    the set of rational primes ℓ inert in K (prime to p and to the ramification of T), λ the prime
    of K above ℓ; I_ℓ is the smallest ideal of R containing ℓ + 1 for which Fr_λ acts trivially on
    T/I_ℓT; 𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kℤ_p}; G_ℓ = k_λ^×/k_ℓ^×; I_n = Σ_{ℓ | n} I_ℓ and G_n = ⊗_{ℓ |
    n} G_ℓ. The transverse condition at λ is defined by the maximal p-subextension of K[ℓ]_λ/K_λ,
    K[ℓ] the ring class field of conductor ℓ. A Selmer triple (T, F, 𝓛) has 𝓛 ⊆ 𝓛₀ disjoint from
    Σ(F); Kolyvagin systems κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛), satisfy the finite–singular
    relations at every ℓ with nℓ ∈ N(𝓛). Hypotheses: H.0 T is free of rank two. H.1 T̄ is absolutely
    irreducible. H.2 there is a Galois extension F/ℚ containing K with G_F acting trivially on T and
    H¹(F(μ_{p^∞})/K, T̄) = 0. H.3 F is cartesian on Quot(T) at every v ∈ Σ(F). H.4 there is a
    perfect symmetric R-bilinear pairing ( , ) : T × T → R(1) with (s^σ, t^{τστ^{-1}}) = (s, t)^σ,
    and F is its own exact orthogonal complement under the induced pairings H¹(K_v, T) × H¹(K_{v̄},
    T) → R. H.5 (a) the action of G_K on T̄ extends to G_ℚ and τ splits T̄ into one-dimensional
    eigenspaces T̄^±; (b) F on T̄ is stable under G_ℚ; (c) the residual pairing satisfies (s^τ, t^τ)
    = (s, t)^τ.
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
-/

/-
**`ES.5/cassels-structure`** (theorem): The generalised Cassels pairing and the structure R^ε ⊕ M ⊕
    M.
  Statement. Let R be principal artinian of length k and (T, F, 𝓛) satisfy H.1, H.3 and H.4 (with
    vanishing residual invariants). (a) For positive integers s, t with s + t ≤ k there is a pairing
    ( , )_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R whose left and right kernels are the
    images of H¹_F(K, T/m^{s+t}T) and of π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t]).
    (b) There are an R-module M and ε ∈ {0, 1} with H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M. (c) Under H.0–H.5 with
    𝓛 ⊆ 𝓛_k, for n ∈ N(𝓛) write H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n); then ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^−
    (mod 2), where ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±, and ε is independent of n: if loc_ℓ(H̄(n)^±) ≠ 0
    then ρ(nℓ)^± = ρ(n)^± − 1, and otherwise ρ(nℓ)^± = ρ(n)^± + 1.
-/

/-
**`ES.5/howard-stub`** (theorem): Stub Selmer modules in the self-dual setting.
  Statement. In the setting of cassels-structure(c) put λ(n) = length M(n) and the stub Selmer
    module S(n) = m^{λ(n)}H¹_{F(n)}(K, T). Then for nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0 implies loc_ℓ(S(nℓ))
    = 0. Moreover, with a, b, δ ≥ 0 the lengths in Howard's Lemma 1.5.8 for the diamond of H_ℓ(n) ⊆
    H(n), H(nℓ) ⊆ H^ℓ(n), one has λ(nℓ) = λ(n) + k − a − b − δ.
-/

/-
**`ES.5/howard-dvr-theorem`** (theorem): Howard's bound for self-dual Kolyvagin systems over a
    discrete valuation ring.
  Statement. Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer
    triple satisfying H.0–H.5 with 𝓛_s(T) ⊆ 𝓛 for s large, and A = T ⊗ D with the propagated
    structure. If there is a Kolyvagin system κ ∈ KS(T, F, 𝓛) with κ_1 ≠ 0, then H¹_F(K, T) is free
    of rank one over R and there is a finite R-module M with H¹_F(K, A) ≅ D ⊕ M ⊕ M and length_R(M)
    ≤ length_R(H¹_F(K, T)/R·κ_1). The conclusion is about the discrete module A: its corank is one
    and its cotorsion quotient is M ⊕ M, so its length is twice that of M, bounded by twice the
    index of κ_1. This is the single owner of the self-dual descent used for Heegner points and for
    generalised Heegner cycles; the Λ-adic version (Howard, Theorem 2.2.10) belongs to layer ES.8.
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
  * `TauCeti.ExteriorBidual.exteriorBidual` (constructor) [typed above]: ⋂^r_R X := Module.Dual R
    (⋀[R]^r (Module.Dual R X)).
  * `TauCeti.ExteriorBidual.toBidual` (constructor) [typed above]: ξ^r_X : ⋀[R]^r X →ₗ[R] ⋂^r_R X.
  * `TauCeti.ExteriorBidual.toBidual_ιMulti_ιMulti` (simp) [typed above]: ξ(x₁ ∧ ⋯ ∧ x_r)(φ₁ ∧ ⋯ ∧
    φ_r) = det(φ_i(x_j)).
  * `TauCeti.ExteriorBidual.toBidual_bijective` (characterisation) [typed above]: ξ^r_X is bijective
    for X finitely generated projective.
  * `TauCeti.ExteriorBidual.map` (functoriality) [typed above]: A linear map f : X → Y induces ⋂^r f
    : ⋂^r X → ⋂^r Y (dual of ⋀^r of the transpose), with map_id and map_comp, compatible with ξ.
  * `TauCeti.ExteriorBidual.contract` (constructor): For Φ ∈ ⋀^r(X^*) and r ≤ s, the map ⋂^s X →
    ⋂^{s−r} X dual to Ψ ↦ Φ ∧ Ψ.
  * `TauCeti.ExteriorBidual.contract_toBidual` (compatibility): contract Φ ∘ ξ^s = ξ^{s−r} ∘
    (contraction by Φ on ⋀^s X).
  * `TauCeti.ExteriorBidual.one_equiv_bidual` (equivalence) [typed above]: ⋂^1_R X ≃ X^{**}; in
    particular ⋂^1 X ≃ X for X reflexive.
  * `TauCeti.ExteriorBidual.equivLattice` (equivalence): For an order R in a semisimple 𝒬 and X
    finitely generated: ⋂^r_R X ≃ {a ∈ 𝒬 ⊗ ⋀^r X : Φ(a) ∈ R ∀ Φ}.
  * test `TauCeti.ExteriorBidual.free_rank` (computation) [typed above]: ⋂^2_R(R³) is free of rank
    3, and ξ is an isomorphism.
  * test `TauCeti.ExteriorBidual.trivial_module_group_ring` (computation): R = ℤ[C₂], X = ℤ² with
    trivial action: X^* ≅ ℤ² generated by e_i ↦ N (N = 1 + σ), ⋀²(X^*) ≅ ℤ, ⋂²X ≅ ℤ generated by Φ ↦
    N, and ξ(e₁ ∧ e₂) is the functional with value N² = 2N, twice the generator: the image of ξ has
    index 2.
  * test `TauCeti.ExteriorBidual.zero_power` (degenerate) [typed above]: ⋂^0_R X = Hom_R(R, R) = R
    for every X.
  * test `TauCeti.ExteriorBidual.torsion_killed` (non-example) [typed above]: R = ℤ_p, X = ℤ_p ⊕
    ℤ/p: ⋂^1 X = X^{**} = ℤ_p while ⋀^1 X = X; ξ is not injective, so the bidual is not the exterior
    power for modules with torsion.
  * test `TauCeti.ExteriorBidual.not_surjective` (non-example): In the group-ring example ξ is
    injective and not surjective: replacing ⋂² by ⋀² loses the element ½·e₁ ∧ e₂.
-/

/-
**`ES.6/bidual-functoriality`** (theorem): Injectivity, rank reduction and base change for exterior
    biduals.
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
  * `TauCeti.StarkSystems.stalk` (constructor): Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n
    (Mazur–Rubin), and ⋂^{r+ν(n)} H¹_{F^n}(K, A) (Burns–Sakamoto–Sano).
  * `TauCeti.StarkSystems.transition` (constructor): Ψ_{n,m} : Y_n → Y_m for m | n, and v_{m,n} on
    biduals.
  * `TauCeti.StarkSystems.transition_comp` (functoriality): Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″} and
    Ψ_{n,n} = id.
  * `TauCeti.StarkSystems.StarkSystem` (structure) [typed above]: SS_r = the submodule of ∏_n Y_n of
    families with Ψ_{n,m}(ε_n) = ε_m.
  * `TauCeti.StarkSystems.StarkSystem.ideal` (data): I_i(ε) = Σ_{ν(n)=i} im(ε_n), an ideal of R;
    I_∞(ε) = ⋃_i I_i(ε).
  * `TauCeti.StarkSystems.StarkSystem.eval_one` (projection): ε ↦ ε_1 ∈ ⋀^r H¹_F(K, T) (resp. ⋂^r
    H¹_F(K, A)).
  * test `TauCeti.StarkSystems.stalk_one` (degenerate) [typed above]: Y_1 = ⋀^r H¹_F(K, T) ⊗ R, and
    ⋀^0 W_1 = R.
  * test `TauCeti.StarkSystems.rank_one_core_vertex` (computation): If H¹_{(F^*)_n}(K, T^*) = 0 and
    r = χ(T), then H¹_{F^n}(K, T) is free of rank r + ν(n) and Y_n is free of rank one.
  * test `TauCeti.StarkSystems.transition_one_prime` (computation): For n = q, m = 1, r = 1 and
    H¹_{F^q} free with basis c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁ up
    to the sign convention, an element of H¹_F(K, T).
  * test `TauCeti.StarkSystems.not_product` (non-example): A family (ε_n) with ε_1 ≠ 0 and ε_q = 0
    for a prime q is not a Stark system unless Ψ_{q,1}(0) = ε_1, i.e. it is not one.
-/

/-
**`ES.6/stark-structure`** (theorem): Freeness of Stark systems and control of the dual Selmer
    group.
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
    I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*). For a local Gorenstein order under Hypothesis 4.7,
    SS_r(T, F) is free of rank one with I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨). The
    regulator and the ideals commute with the admissible scalar reductions R → R/(p^m) and R → S of
    bidual-functoriality(f).
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
  * test `TauCeti.StarkSystems.stub_ne_all` (non-example): For core rank χ(T) > 1 over a field,
    KS_r(T) for r = 1 is infinite-dimensional while KS′_χ(T) is one-dimensional: the stub systems
    are a proper submodule of all sections.
-/

/-
**`ES.6/regulator-isomorphism`** (theorem): The regulator isomorphism and structure of Kolyvagin
    systems of rank r.
  Statement. (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) There are core vertices; any
    two are joined by a path through core vertices along which all vertex-to-edge maps are
    isomorphisms; S′ is locally cyclic with every core vertex a hub and trivial monodromy; KS′_r(T)
    is free of rank one and κ ↦ κ_n is an isomorphism onto S′(n) at core vertices; Π : SS_r(T) →
    KS′_r(T) is an isomorphism. For R a discrete valuation ring ((H.1)–(H.6)), KS′_r(T, P) ≅ lim_k
    KS′_r(T/m^k, P_k) is free of rank one, and for 0 ≠ κ ∈ KS′_r(T) the conclusions of ES.6/stark-
    structure(a) hold with ε replaced by κ; in particular length H¹_{F^*}(K, T^*) ≤ max{s : κ_1 ∈
    m^s ⋀^r H¹_F(K, T)}, with equality iff κ is primitive. (b) (Burns–Sakamoto–Sano; Hypotheses 3.2,
    3.3, 4.2 and p > 3.) Reg_r : SS_r(A, F) → KS_r(A, F) is an isomorphism, so KS_r(A, F) is free of
    rank one; for κ ∈ KS_r(A, F) and n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K, A^*(1))^*), with
    equality if κ is a basis; and I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*), with equality if R is a
    principal ideal ring and κ is a basis. The same holds over a local Gorenstein order under
    Hypothesis 4.7 and p > 3 for KS_r(T, F) and H¹_{F^*}(K, T^∨(1))^∨. The restriction p > 3 is part
    of the statements for Kolyvagin systems; it is not needed for Stark systems.
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
  * test `TauCeti.RubinStark.rubinLattice_ne_exteriorPower` (non-example): For G of order 2 acting
    trivially on a rank-two lattice the bidual is ½·⋀² (ES.6/exterior-bidual tests): 𝓛 is not the
    image of the exterior power in general.
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
    finite place splits completely. For r = 1 under Hypothesis 6.1(i), ⋂^1 H¹ = H¹ and ES_1(T, 𝒦) is
    ES.2/euler-system-module with coefficients R.
  * `TauCeti.EulerSystems.HigherEulerSystem` (structure): ES_r(T, 𝒦) ≤ ∏_F ⋂^r_{R[𝒢_F]}
    H¹(O_{F,S(F)}, T), cut out by the corestriction relations.
  * `TauCeti.EulerSystems.HigherEulerSystem.eval` (projection): c ↦ c_F.
  * `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv` (equivalence): Under Hypothesis 6.1(i),
    ES_1(T, 𝒦) ≃ ES(T, 𝒦, N) for N the product of the primes of S.
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
-/

/-
**`ES.7/higher-kolyvagin-derivative`** (construction): The higher Kolyvagin derivative.
  Statement. Assume Hypotheses 6.1, 6.7 and 6.11 (Fr_q^{p^k} − 1 is injective on T for every q ∈ P
    and k ≥ 0). Fix a power M of p, a field E ∈ Ω(𝒦/K) unramified outside S with K(1) ⊆ E, and put
    R̄ = R/(M), ℛ = R̄[Gal(E/K)], A = Ind_{G_E}^{G_K}(T/MT), a free ℛ-module. For n ∈ N let E(n) =
    E·K(n), H_n = Gal(E(n)/E), c_n = c_{E(n)} and c̄_n its image in ⋂^r_{ℛ[H_n]} H¹(O_{E(n),S_n},
    A)-coefficients. Then D_n·c̄_n is H_n-invariant and defines the Kolyvagin derivative κ′(c_n) =
    D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). With 𝓘_n the augmentation ideal of ℤ[H_n] and G_n ≅ ⟨∏_{q |
    n}(σ_q − 1)⟩ ⊆ 𝓘_n^{ν(n)}/𝓘_n^{ν(n)+1}, the corrected classes κ(c)_n are obtained from the
    κ′(c_d), d | n, by the determinant/permutation correction, and Theorem: κ(c)_n ∈ ⋂^r_ℛ
    H¹_{F_can(n)}(K, A) ⊗ ⟨∏_{q | n}(σ_q − 1)⟩ and v_q(κ(c)_n) = φ^fs_q(κ(c)_{n/q}) for every q | n;
    so κ(c) ∈ KS_r(A, F_can). For a subfield F of E/K and A_F = Ind_{G_F}^{G_K}(T/MT) this gives the
    canonical homomorphism D_r = D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can), independent of E and of the
    generators σ_q, with D_r(c)_1 = c_F (mod M).
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
  * test `TauCeti.EulerSystems.higherDerivative_needs_611` (non-example): For T = O with trivial
    action Fr_q − 1 = 0 is not injective: Hypothesis 6.11 fails, and the correction terms of the
    construction are not defined.
  * test `TauCeti.EulerSystems.higherDerivative_one_prime` (computation): For n = q: κ(c)_q =
    κ′(c_q) ⊗ (σ_q − 1), with singular part φ^fs_q(c_F mod M) at q.
-/

/-
**`ES.7/fitting-bounds`** (theorem): Fitting-ideal control from higher-rank Euler systems.
  Statement. Let p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F a subfield of E/K and A_F =
    Ind_{G_F}^{G_K}(T/MT). Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for A_F and
    F_can, and let κ(c) = D_r^F(c). Then (i) for n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K,
    A_F^*(1))^*); in particular im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*); (ii) for every i
    ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*). Equalities hold for a basis of KS_r
    when R̄[𝒢_F] is a principal ideal ring. These are containments of ideals of the group ring
    R̄[𝒢_F], which is not a domain: they are not valuation formulas and do not reduce to orders of
    underlying groups.
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
    not the statement u_RBS ∈ image of ⋀^r_{ℤ[G]} U_{S,T}^−: for r ≥ 2 the lattice 𝓛 is larger, and
    the stronger statement is not what is conjectured.
-/

/-
**`ES.7/rank-one-comparison`** (comparison): Rank-one specialisation of the higher-rank theory.
  Statement. Under Hypothesis 6.1, ES_1(T, 𝒦) is the module of ES.2/euler-system-module with
    coefficients R, with the dictionary P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = Rubin's P(Fr_q^{-1}
    | T^*; x); KS_1(A, F) is ES.3/kolyvagin-system-module for A; D_1 is the map of ES.3/euler-to-
    kolyvagin modulo M (over ℚ) and supplies that map over a general number field K under Hypotheses
    6.1, 6.7 and 6.11; and for R a discrete valuation ring the bound I_0(κ) ⊆ Fitt⁰ is length
    H¹_{F^*} ≤ ∂^{(0)}(κ) of ES.4/kolyvagin-bound. The conventions differ in two places, both
    explicit: the Euler factor (ES.2/euler-polynomial) and the identification G_q ≅ ⟨σ_q − 1⟩ ⊆ 𝓘/𝓘²
    (Mazur–Rubin's ρ_q).
-/
