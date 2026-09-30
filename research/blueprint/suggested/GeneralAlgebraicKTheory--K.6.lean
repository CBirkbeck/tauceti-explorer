/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeneralAlgebraicKTheory--K.6.md` is definitive.
Review corrections are recorded in the packet and review report; the reader
document requires synchronization before the revised plan is accepted. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-GeneralAlgebraicKTheory--K.6: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Two naming decisions are fixed here.

* `IsFlasqueRing`, never `IsFlasque`. Both pinned trees already use `IsFlasque`
  for the SHEAF-theoretic predicate, which is a different notion. Karoubi's
  flasque rings of K.6 have nothing to do with it, and a formalisation that
  reused the name would produce statements that read as true and mean something
  else.
* `negativeK n R` for Bass's groups, with `n : ℕ` counting downwards, so that
  `negativeK 1` is what the literature writes as `K₋₁`. The nonconnective
  spectrum's homotopy is a separate name, `bassSpectrum`, and the agreement of
  the two is a theorem (`bassSpectrum_pi_neg`), not a definition.

Everything this layer needs from homotopy theory is a `variable`: neither pinned
library has spectra, homotopy colimits or connective covers. So is the K-theory
functor of rings itself, which the early ring node of GeneralAlgebraicKTheory
K.2:plus owns (`K.2/functorial-K-theory-of-a-ring`, with scalar extension, finite
products and filtered colimits) and which K.6 and K.7 import rather than restate;
and so is the first K-group, which is absent from both trees and which
K2SymbolsBrauer T.6 is asked for.

Revision (FIX-RT-AREA-ktheory-1, findings RT-AREA-ktheory-1/4, /17, /18, /19;
awaiting independent review; not compiled). The declarations this revision adds
are written as signature comments, in the form the K.1–K.5 file uses: the
objects they are stated about (the gluing category of the projective line over
a ring, the Nil category, the Bass spectrum, the K-theoretic pairing) are not in
either pinned library, and a statement that cannot yet be written is left as a
typed comment rather than replaced by a proposition. Older `True`-valued placeholders remain below, including in changed nodes;
they do not meet PROTOCOL §13 and are a recorded reason for needs_changes.
The Morita block is replaced by actual proposed signature comments below.
The scheme forms (Thomason's groups, the Fundamental Theorem for schemes,
negative G-theory of noetherian schemes, products of schemes) are
SchemeKTheoryOperations S.2, S.5 and S.6's, which import this file's ring
statements; nothing here depends on them.
-/
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Limits.Filtered
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.LinearAlgebra.TensorProduct.Defs
import Mathlib.RingTheory.Morita.Basic
import Mathlib.RingTheory.Morita.Matrix

noncomputable section

namespace TauCeti.NonconnectiveK

/-! ## K.6 -/

variable (R S : Type*) [Ring R] [Ring S]

/-- K.6/flasque-rings-and-the-swindle. Karoubi's notion: an `R`-bimodule `M`,
finitely generated projective on the right, with a bimodule isomorphism
`R ⊕ M ≅ M`. NOT `Mathlib`'s `IsFlasque`, which is about sheaves. -/
structure IsFlasqueRing where
  dummy : Unit

/-- The Eilenberg swindle: for every finitely generated projective `P` the
isomorphism `P ⊕ (P ⊗[R] M) ≅ P ⊗[R] M` kills the class of `P`. -/
theorem IsFlasqueRing.K0_eq_zero (h : IsFlasqueRing R) : True := by sorry

/-- A flasque ring whose bimodule is `R` itself as a right module. -/
structure IsInfiniteSumRing extends IsFlasqueRing R where
  dummy' : Unit

theorem IsInfiniteSumRing.isFlasque (h : IsInfiniteSumRing R) : IsFlasqueRing R := by sorry

/-- The cone ring: the row-and-column finite infinite matrices over `R`. -/
def coneRing : Type _ := by sorry

theorem coneRing_isInfiniteSumRing : True := by sorry

/-- Recorded so that the collision cannot be made by accident: the predicate of
this file is about bimodules, the pinned one about sheaves, and neither implies
the other. -/
theorem IsFlasqueRing.not_sheaf_flasque : True := by sorry

/-! ### Contracted functors -/

variable (F : Type → Type)

/-- K.6/contracted-functors. `LF R` is the cokernel of
`F R[t] ⊕ F R[t⁻¹] → F R[t,t⁻¹]`. -/
def contraction : Type → Type := by sorry

/-- The four-term sequence `0 → F R → F R[t] ⊕ F R[t⁻¹] → F R[t,t⁻¹] → LF R → 0`
is exact for every `R`. -/
def IsAcyclic : Prop := by sorry

/-- Acyclic, together with a splitting of the surjection onto `LF` that is
natural IN THE VARIABLE as well as in the ring. Naturality in the ring alone is
not enough for the iteration, and a formalisation must carry both. -/
structure IsContracted where
  acyclic : IsAcyclic F
  splitting : Unit

theorem IsContracted.sum : True := by sorry

theorem IsContracted.of_retract : True := by sorry

/-- The iterates `N L F` and `L² F`. -/
def contractionIterate (n : ℕ) : Type → Type := by sorry

/-! ### The negative groups -/

/-- K.6/negative-k-groups. `negativeK n R` is `K₋ₙ R`, defined by iterated
contraction starting from `K₀`. -/
def negativeK (n : ℕ) : Type := by sorry

instance (n : ℕ) : AddCommGroup (negativeK R n) := by sorry

theorem negativeK_functor (n : ℕ) (f : R →+* S) : True := by sorry

/-- The first negative group IS the contraction of `K₀`. -/
theorem negativeK_one_eq_contraction : True := by sorry

/-
`negativeK_eq_contraction_iterate` (K.6/negative-k-groups):
  theorem negativeK_eq_contraction_iterate (n : ℕ) :
    negativeK n ≅ contractionIterate n K₀   -- K₋ₙ = Lⁿ K₀, as functors on rings
The four-term decomposition `K₀ R[t,t⁻¹] ≅ K₀ R ⊕ K₋₁ R ⊕ NK₀ R ⊕ NK₀ R`
(III.3.7) moved to K.6/negative-k-groups-are-contracted below.
-/

theorem negativeK_flasque (h : IsFlasqueRing R) (n : ℕ) : True := by sorry

theorem negativeK_prod (n : ℕ) : True := by sorry

/-! ### The ring-level inputs of the Fundamental Theorem

Signature comments. `KSpace`, `KGroup`, `P R` (the finitely generated projective
right `R`-modules, `TauCeti.finiteProjectiveModules Rᵐᵒᵖ` with its split exact
structure) and scalar extension are the early ring node's
(`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`); the additivity,
resolution, approximation and fibration theorems are K.3's and K.4's.

K.6/projective-line-over-a-ring (construction). NOT a scheme: for a
noncommutative ring there is no scheme `ℙ¹` over `Spec R`.

  structure ProjectiveLine.Module (R : Type u) [Ring R] where
    plus  : ModuleCat.{u} (R[X])ᵐᵒᵖ                      -- M₊, a right R[t]-module
    minus : ModuleCat.{u} (R[X])ᵐᵒᵖ                      -- M₋, over R[t⁻¹] (a second copy)
    glue  : (M₊ ⊗ R[T;T⁻¹]) ≅ (M₋ ⊗ R[T;T⁻¹])       -- α, over the Laurent ring
  instance : Abelian (ProjectiveLine.Module R)       -- componentwise kernels/cokernels
  def ProjectiveLine.VectorBundle (R) : ObjectProperty (ProjectiveLine.Module R)
                                                     -- M₊, M₋ finitely generated projective
  def ProjectiveLine.KSpace (R) : BasedSpace         -- K of VB(ℙ¹_R), via K.1
  def ProjectiveLine.twist (n : ℤ) : ProjectiveLine.Module R ⥤ ProjectiveLine.Module R
                                                     -- F(n) = (M₊, M₋, t⁻ⁿ α), with X₀, X₁
  def ProjectiveLine.u (i : ℤ) : P R ⥤ VB(ℙ¹_R)      -- P ↦ (P[t], P[t⁻¹], tⁱ), exact
  theorem ProjectiveLine.u_twist (i n : ℤ) : u i ⋙ twist n ≅ u (i - n)
  theorem ProjectiveLine.koszul (F) : ShortExact (F(-2) ⟶ F(-1) ⊞ F(-1) ⟶ F)
  def ProjectiveLine.directImage : ProjectiveLine.Module R ⥤ ModuleCat Rᵐᵒᵖ   -- π_*, and R¹π_*
  def ProjectiveLine.map (f : R →+* R') : ProjectiveLine.Module R ⥤ ProjectiveLine.Module R'
  -- unit tests
  example : π_* (u 0 R) ≅ R ∧ R¹π_* (u 0 R) = 0          -- pi_u0
  example : π_* (u 1 R) = 0 ∧ R¹π_* (u 1 R) = 0          -- pi_u1 (so u 0 R ≇ u 1 R if Nontrivial R)
  example : R¹π_* (u 2 R) ≅ R ∧ π_* (u 2 R) = 0          -- R1pi_u2
  example : Contractible (ProjectiveLine.KSpace (0 : Type)) -- zero_ring
  example (i n : ℤ) : u i ⋙ twist n ≅ u (i - n)          -- u_twist_shift

K.6/projective-line-splitting (theorem, V.1.5.4):
  theorem ProjectiveLine.KSpace_equiv (R) :
    BasedHomotopyEquiv (KSpace.ofRing R ×ˢ KSpace.ofRing R) (ProjectiveLine.KSpace R)
                                                     -- induced by (u 0, u 1), natural in R
  theorem ProjectiveLine.u_relation (i : ℤ) :
    (u (i+1))_* + (u (i+1))_* = (u i)_* + (u (i+2))_*

The right-module convention above uses the opposite-ring duality of K.2 to compare
with the early left-module ring model. In the splitting proof, u_1(P) need not lie in MR:
for a nonzero field, H¹(O(−2)) is nonzero. Extend v_0,v_1 from K(MR) along its
equivalence with K(VB); compute on u_0,u_{−1}, then use u_1 = 2u_0 − u_{−1}.

K.6/nil-category-and-nil-groups (definition):
  structure NilCat (R) where
    obj : P R
    ν   : Module.End R obj
    nil : IsNilpotent ν
  instance : ExactStructure (NilCat R)               -- conflations exact on modules
  def NilCat.forget : NilCat R ⥤ P R                 -- exact
  def NilCat.zero   : P R ⥤ NilCat R                 -- exact, forget ∘ zero = id
  def nilGroup (R) (n : ℕ) : AddCommGroup           -- πₙ of hofib (K Nil R → K R)
  theorem KGroup.nilCat_decomposition (n : ℕ) : KGroup (NilCat R) n ≃+ KGroup R n × nilGroup R n
  def NilCat.equivTorsion : NilCat R ≌ H_{1,T}(R[t])  -- (P, ν) ↦ P with t acting by ν
  def nilGroup_map (f : R →+* R') (n : ℕ) : nilGroup R n →+ nilGroup R' n
  -- unit tests
  example (F) [Field F] : nilGroup F 0 = 0                         -- nil0_field
  example (k) [Field k] : nilGroup k[ε] 0 ≃+ Additive (1 + εt·k[t])ˣ  -- nil0_dual_numbers
  example : KGroup (NilCat R) 0 ≃+ KGroup R 0 × nilGroup R 0       -- K0_nil_split
  -- nilpotent_required: the class of (ℤ, 2) in the endomorphism group of ℤ is
  -- 1 − 2t ≠ 0, while nilGroup ℤ 0 = 0.

K.6/t-torsion-localisation-sequences (theorem, V.7.1 and Ex. V.7.5):
  theorem tTorsion_fibration (R) :
    HomotopyFibration (K H_{1,T}(R[t])) (KSpace.ofRing R[X]) (KSpace.ofRing R[T;T⁻¹])
  theorem tTorsion_projectiveLine_fibration (R) :
    HomotopyFibration (K H_{1,T}(R[t])) (ProjectiveLine.KSpace R) (KSpace.ofRing R[t⁻¹])
  -- the chart restriction maps the second to the first, identically on fibres

K.6/nil-groups-are-NK (theorem, V.8.1):
  theorem nilGroup_equiv_NK (R) (n : ℕ) : nilGroup R n ≃+ NK (n+1) R   -- natural in R

K.6/fundamental-theorem-positive-degrees (theorem, V.8.2 for n ≥ 1):
  theorem fundamental_theorem_pos (R) (n : ℕ) (hn : 1 ≤ n) :
    Exact [0, K_n R, K_n R[t] ⊕ K_n R[t⁻¹], K_n R[t,t⁻¹], K_{n-1} R, 0]

K.6/multiplication-by-t-splits-the-boundary (lemma, Ex. V.8.1). The product is
K.7's external pairing with the class of the unit `t` over ℤ:
  theorem boundary_mul_t (R) (n : ℕ) (x : K_n R) : ∂ ({t, x}) = x

K.6/negative-k-groups-are-contracted (theorem, III.3.6, III.3.7, III.4.1.2):
  theorem K1_isContracted : IsContracted K₁      -- L K₁ = K₀
  theorem K0_isContracted : IsContracted K₀      -- L K₀ = K₋₁
  theorem K0_laurent_decomposition (R) :
    K₀ R[t,t⁻¹] ≃+ K₀ R × K₋₁ R × NK₀ R × NK₀ R  -- dropping the NK₀ summands is only
                                                 -- legitimate when they vanish
  theorem negativeK_isContracted (n : ℕ) : IsContracted (negativeK n)
-/

/-! ### The Fundamental Theorem -/

/-- K.6/fundamental-theorem-with-nil-terms, assembled from the nodes above. The
splitting is multiplication by the class of `t` in `K₁ (ℤ[t,t⁻¹])`; a different
splitting changes the identification of the boundary. -/
theorem fundamental_theorem (n : ℤ) : True := by sorry

/- `K.6/nil-inclusion-is-forgetful`: intended signature, pending the gluing/Nil carriers:
  theorem NilCat.inclusion_map :
    KMap inclusion ≃ₕ (KMap (u 0) - KMap (u 1)) ∘ KMap forget
The natural resolution has chart maps t − ν and 1 − t⁻¹ν; the latter is invertible
by the finite geometric series. For ν = 0 this is the standard resolution; for ν² = 0
its inverse is 1 + t⁻¹ν. Nilpotence cannot be dropped (ν = 1 over ℤ).
This, rather than split injectivity alone, makes the reduced Nil map zero. -/

/-- `Nilₙ R ≅ NK_{n+1} R` for `n ≥ 0`: `nilGroup_equiv_NK` above
(K.6/nil-groups-are-NK). -/
theorem nil_eq_NK (n : ℕ) : True := by sorry

/- The scheme form (V.8.3) is SchemeKTheoryOperations S.5's, which imports this
ring theorem; the former placeholder `fundamental_theorem_scheme` is removed. -/

/-! ### The axioms -/

/-- K.6/axioms-for-negative-k-theory. A theory of negative K-theory for possibly
NON-UNITAL rings: the second axiom is stated for ideals and is weakened if the
rings are required to be unital. -/
structure NegativeKTheory where
  groups : ℕ → Type → Type
  boundary : Unit
  k0 : Unit
  exact_ideal : Unit
  flasque : Unit
  matrix : Unit

/-- Bass's groups satisfy all four, which is what makes the axioms non-vacuous. -/
def bassTheory : NegativeKTheory := by sorry

/-! ### Mayer–Vietoris and the spectrum -/

/-- K.6/mayer-vietoris-for-negative-k: for a Milnor square (a ring map carrying
an ideal bijectively onto an ideal), the K₁–K₀ sequence of K.5 continues through
every negative degree. The sequence does not terminate below; nothing is
asserted from K₂ up. -/
theorem mayer_vietoris_negative : True := by sorry

/-- Spectra are a `variable`: neither pinned library has them. -/
variable (Spectrum : Type) (KTheorySpectrum : ∀ (R : Type*) [Ring R], Spectrum)

/-- The data the K-theory construction consumes: a category with cofibrations AND
weak equivalences. Declared here because K.6's spectrum needs it and K.7's
comparison node is about which parts of it may be forgotten. -/
structure WaldhausenData where
  zero : Unit
  cofibrations : Unit
  weakEquivalences : Unit
  pushouts : Unit
  gluing : Unit

/-- K.6/nonconnective-spectrum. `LE R` is the homotopy cofiber of the map from
the homotopy pushout of `E R[t]` and `E R[t⁻¹]` over `E R` into `E R[t,t⁻¹]`;
the desuspension is its loop space. -/
def deloop : Spectrum → Spectrum := by sorry

theorem deloop_cofibration : True := by sorry

/-- `K R → Ω L K R` is the `(-1)`-connective cover. -/
theorem deloop_connective_cover : True := by sorry

/-- The homotopy colimit of the iterated desuspensions. -/
def bassSpectrum : Spectrum := by sorry

/-- K.6/bass-spectrum-homotopy-groups (promoted from the API of
K.6/nonconnective-spectrum): `πₙ K^B R ≅ Kₙ R` for `n ≥ 0`, naturally in `R`. -/
theorem bassSpectrum_pi_nonneg (n : ℕ) : True := by sorry

/-- K.6/bass-spectrum-homotopy-groups: `π₋ₙ K^B R ≅ K₋ₙ R = Lⁿ K₀ R`, naturally in
`R`, through multiplication by `x` as in Corollary IV.10.3. -/
theorem bassSpectrum_pi_neg (n : ℕ) : True := by sorry

/-
K.6/milnor-square-excision-in-nonpositive-degrees (theorem; the non-positive part
of Bass XII.8.3, which is what Clausen–Mathew–Morrow's Proposition 4.34 uses):
  structure MilnorSquare where
    f : R →+* S
    I : TwoSidedIdeal R
    bij : Set.BijOn f I (f '' I)        -- and f '' I is a two-sided ideal J of S
  def bassSpectrum.relative (R) (I) : Spectrum   -- hofib (K^B R → K^B (R ⧸ I))
  theorem milnorSquare_excision_nonpos (σ : MilnorSquare) (n : ℤ) (hn : n ≤ 0) :
    IsIso (π_ n (bassSpectrum.relative σ.R σ.I ⟶ bassSpectrum.relative σ.S σ.J))
  -- Degree one: only the CLASSICAL surjectivity K₁(R, I) → K₁(S, J) (GL/E relative
  -- groups) is recorded, from K.5/milnor-square-mayer-vietoris. The spectrum form
  --   Function.Surjective (π_ 1 (bassSpectrum.relative σ.R σ.I ⟶ bassSpectrum.relative σ.S σ.J))
  -- is KTheoryLowDegrees U.6's (handed over by request): it needs U.6's comparison
  -- of π₁ of the relative fibre with GL(I)/E(R, I), which lies downstream of K.6.
  -- Injectivity in degree one is NOT claimed (Swan's square), nor anything in degrees ≥ 2.
-/

theorem bassSpectrum_natural : True := by sorry

/-- Independence of the model: two naturally equivalent models of connective
K-theory give equivalent nonconnective spectra. This is what the stage text's
"independence of enlargement" asks for. -/
theorem bassSpectrum_independent : True := by sorry

/-! ### The second route: Frobenius pairs and the flasque envelope -/

/-- K.6/frobenius-pairs. An exact category with enough projectives and injectives
which COINCIDE; its stable category is triangulated. Absent from both pinned
trees. -/
structure FrobeniusCategory (C : Type*) [Category C] where
  dummy : Unit

def FrobeniusCategory.stable {C : Type*} [Category C] (h : FrobeniusCategory C) : Type _ := by sorry

/-- A fully faithful inclusion of small Frobenius categories preserving
projective-injectives. -/
structure FrobeniusPair where
  dummy : Unit

/-- The Verdier quotient of the two stable categories. -/
def FrobeniusPair.derived (A : FrobeniusPair) : Type _ := by sorry

/-- The standing example: bounded complexes over an exact category with
DEGREEWISE SPLIT conflations, and the homotopy-acyclic ones. -/
def FrobeniusPair.ofExact : FrobeniusPair := by sorry

theorem FrobeniusPair.derived_ofExact : True := by sorry

/-- K.6/frobenius-pairs-flasque-envelope-and-suspension. Objects are sequences of
inflations; `hom` is `lim_i colim_j`. -/
def countableEnvelope : Type _ := by sorry

/-- The swindle in functorial form: `T ⊕ id ≅ T`. This is Karoubi's flasqueness,
not the sheaf predicate. -/
theorem countableEnvelope_isFlasque : True := by sorry

def FrobeniusPair.enlarge (A : FrobeniusPair) : FrobeniusPair := by sorry

/-- The enlarged derived category has countable coproducts and is c-compactly
generated by the original, so the idempotent completion of the original is its
c-compact part. -/
theorem FrobeniusPair.enlarge_generates : True := by sorry

/-- The suspension: the enlargement, together with the objects killed in the
quotient. -/
def FrobeniusPair.suspension (A : FrobeniusPair) : FrobeniusPair := by sorry

theorem FrobeniusPair.derived_suspension : True := by sorry

/-! ### The axiomatic set-up -/

/-- K.6/schlichting-set-up. `IK₀ T = K₀` of the idempotent completion. -/
def IK0 : Type _ := by sorry

/-- Exact: the composite is zero, the first is fully faithful, and `B/A → C` is
COFINAL — not required to be an equivalence. -/
structure IsExactSequenceOfTriangulated where
  dummy : Unit

/-- Models with `F` (flasque) and `S` (suspension), and the three conditions. -/
structure NegativeKSetup where
  F : Unit
  S : Unit
  preserves_exact : Unit
  IK0_flasque_eq_zero : Unit
  seq_exact : Unit

/-- `IK₋ₙ M = IK₀ (Sⁿ M)`. -/
def negativeIK (n : ℕ) : Type _ := by sorry

theorem negativeIK_frobenius : True := by sorry

/-- For an idempotent complete exact category this is the usual `K₀`. -/
theorem IK0_eq_K0_of_idempotentComplete : True := by sorry

/-! ### Localisation, additivity and the IK-spectrum -/

/-- K.6/schlichting-set-up-and-negative-localization: the long exact sequence in
degrees `i ≤ 0`. -/
theorem negativeIK_localization : True := by sorry

/-- A cofinal derived functor — in particular an equivalence — gives isomorphisms
in all non-positive degrees. -/
theorem negativeIK_of_cofinal : True := by sorry

/-- `IK₋₁ M = 0` iff every relevant Verdier quotient of idempotent completions is
idempotent complete. -/
theorem negativeIK_one_eq_zero_iff : True := by sorry

/-- K.6/additivity-and-colimits-for-negative-K. -/
theorem negativeIK_additivity : True := by sorry

theorem negativeIK_filteredColimit : True := by sorry

/-- K.6/nonconnective-spectrum-and-derived-invariance. The Waldhausen structure:
cofibrations are the inflations, weak equivalences the maps inverted in the
derived category. -/
def FrobeniusPair.waldhausen (A : FrobeniusPair) : WaldhausenData := by sorry

def FrobeniusPair.KSpace (A : FrobeniusPair) : Type _ := by sorry

/-- The K-theory space of an enlargement is contractible, FUNCTORIALLY; that is
what the flasqueness lemma buys. -/
theorem FrobeniusPair.KSpace_enlarge_contractible : True := by sorry

def IKSpectrum (A : FrobeniusPair) : Spectrum := by sorry

theorem IKSpectrum_omega : True := by sorry

/-- Quillen's groups above zero, `K₀` of the idempotent completion in degree
zero, the negative groups below. -/
theorem IKSpectrum_pi : True := by sorry

/-- Localisation in EVERY degree, at the spectrum level. -/
theorem IKSpectrum_localization : True := by sorry

/-! ### Agreement and vanishing -/

/-- K.6/agreement-and-vanishing-of-negative-K. The two routes of this layer land
in the same groups, and in Bass's, Karoubi's, Pedersen–Weibel's and Thomason's. -/
theorem IK_eq_bass : True := by sorry

/- Agreement with Thomason's groups of a quasi-compact quasi-separated scheme,
and the vanishing of negative G-theory of a noetherian scheme, are
SchemeKTheoryOperations S.5's and S.2's (RT-AREA-ktheory-1/17); the former
placeholder `IK_eq_thomason` is removed. The ring clause `IK_eq_bass` is proved
through the additive-category clause and Karoubi's comparison with Bass's groups. -/

/-- `IK₋₁ E` is the monoid of idempotents of `D(E)` modulo the split ones. -/
theorem IK_neg_one_presentation : True := by sorry

theorem IK_neg_one_abelian_eq_zero : True := by sorry

theorem IK_neg_noetherian_abelian_eq_zero : True := by sorry

/-- Bass's vanishing theorem, DEDUCED: for a regular ring the projectives sit
inside the finitely generated modules as a derived equivalence, and that category
is abelian. -/
theorem IK_neg_regular_eq_zero : True := by sorry

/-- Stated by the source as a CONJECTURE, and recorded here as one. -/
theorem IK_neg_abelian_eq_zero_conjecture : True := by sorry

/-! ### Vanishing, and the inference that is not available -/

/-- K.6/vanishing-for-regular-noetherian-rings. -/
theorem negativeK_eq_zero_of_regular (n : ℕ) : True := by sorry

/-- The NON-EXAMPLE. The connective model has zero homotopy in negative degrees
for EVERY ring; that absence is a property of the model and proves nothing about
a singular ring. A proof of vanishing must come from `negativeK` or from
`bassSpectrum`. -/
theorem not_vanishing_from_connective : True := by sorry

/-! ## K.7 -/

/- K.7/morita-invariance — proposed signatures; KGroup and the ring-spectrum
model are suppliers' future interfaces, not declarations in the pinned libraries.

KTheory.moritaEquiv (h : IsMoritaEquivalent R S) (q : ℤ) :
  KGroup R q ≃+ KGroup S q
KTheory.moritaEquiv_matrix (n : ℕ) (hn : 0 < n) (q : ℤ) :
  KGroup (Matrix (Fin n) (Fin n) R) q ≃+ KGroup R q

For q < 0, derive this using Bass suspension and the comparison with the
nonconnective spectrum. For right modules use ModuleCat Rᵐᵒᵖ and the opposite
ring bridge, with compatible choices under corner embeddings.

A product comparison takes Morita equivalences on both inputs and the target,
and a natural isomorphism identifying their biexact pairing functors. It then
asserts eTarget (x * y) = eLeft x * eRight y with these typed pairings.
A unital internal ring equivalence requires unit-preserving monoidal data;
a bare Morita equivalence is insufficient. Regression: tensoring with a
nontrivial line bundle sends [R] to [L] and need not preserve the ring unit.
The matrix statement excludes n = 0. The underlying equivalence restricts to
finitely generated projectives; pinned Morita module statements alone are not
the missing spectrum-level theorem.
-/

/-! ### Derived invariance -/

/-- K.7/derived-morita-and-enhancements. The hypothesis is an equivalence of
ENHANCEMENTS — a quasi-equivalence of dg-categories, an equivalence of stable
∞-categories, or, in Schlichting's form, a map of Frobenius pairs inducing an
equivalence of derived categories (`FrobeniusPair.derived_equiv_KSpace` below).
The data K-theory consumes is `WaldhausenData`, declared in the K.6 section: a
category with cofibrations AND weak equivalences. -/
theorem FrobeniusPair.derived_equiv_KSpace : True := by sorry

theorem KTheory.of_exact_equivalence : True := by sorry

/-- The NON-EXAMPLE the stage text names. A bare triangulated equivalence of
homotopy categories does not induce an isomorphism on the higher K-groups: the
homotopy category forgets the weak equivalences, and mapping cones there are not
functorial. -/
theorem not_invariant_under_triangulated_equivalence : True := by sorry

/-- What DOES survive in degree zero, and is pinned:
`TauCeti.ExactK0.mapEquiv`. -/
theorem K0_invariant_under_equivalence : True := by sorry

/-! ### Colimits and products -/

/-- K.7/invariance-under-filtered-colimits-and-products: the NONCONNECTIVE
refinements (Bass's groups, `K^B`, Schlichting's `IK`). The connective statements
for rings, `n ≥ 0`, are the early ring node's `KGroup.ofRing_prod` and
`KGroup.ofRing_colimit` (K.2:plus) and are imported, not restated. -/
theorem KTheory.of_filtered_colimit (n : ℤ) : True := by sorry

theorem KTheory.of_prod (n : ℤ) : True := by sorry

/-- Claimed for FINITE products only. -/
theorem KTheory.not_of_infinite_prod : True := by sorry

/-! ### Products -/

/-- K.7/products-from-biexact-functors. A functor exact in each variable
separately induces a pairing. This node is the only owner of the K-theoretic
pairing `K A ∧ K B → K C` and of its coherence; the smash product of spectra is
StableHomotopyKTheory H.5:spectra's, and spectrum assembly (H.5:S-delooping)
needs no product. -/
def KTheory.biexactPairing : True := by sorry

/-
  theorem KTheory.biexactPairing_natural :   -- natural in exact functors and natural
    ...                                      -- transformations of each variable, so it
                                             -- maps fibration sequences to fibration sequences
  theorem KTheory.biexactPairing_K0 (F : A × B ⥤ C) (a : A) (b : B) :
    biexactPairing F ([a], [b]) = [F.obj (a, b)]   -- in degree zero
-/

def KTheory.externalProduct : True := by sorry

variable (A : Type*) [CommRing A]

def KTheory.mul : True := by sorry

/-- The coherence is DATA, transported from the tensor product's own coherence
isomorphisms; a formalisation that asserts these has not built the product. -/
theorem KTheory.mul_assoc : True := by sorry

theorem KTheory.mul_one : True := by sorry

theorem KTheory.mul_comm_graded : True := by sorry

/-- K.7/graded-commutativity: `x * y = (-1)^(p*q) * (y * x)`. -/
theorem KTheory.graded_comm (p q : ℕ) : True := by sorry

/-- In degree one this is the anticommutativity of the symbol. The first K-group
is absent from both pinned trees; `K2SymbolsBrauer:T.6` is asked for it. -/
theorem symbol_anticomm : True := by sorry

/-- The link back to K.6: multiplication by the class of `t` in `K₁ (ℤ[t,t⁻¹])`
is the splitting of the Fundamental Theorem (`boundary_mul_t`,
K.6/multiplication-by-t-splits-the-boundary). The scheme form of graded
commutativity is SchemeKTheoryOperations S.6's, which imports this node. -/
theorem mul_t_eq_splitting : True := by sorry

/-! ### Compatibilities and the two unit tests -/

/-- K.7/compatibility-with-relative-groups-and-transfers. Three separate
assertions, none of which follows from bilinearity. -/
theorem KTheory.mul_relative : True := by sorry

theorem KTheory.boundary_mul : True := by sorry

theorem KTheory.transfer_mul : True := by sorry

/-- K.7/unit-multiplication-and-K0-tensor-comparison, first test. The pinned
`TauCeti.SplitK0.of_mul_of` is exactly this for the split model; a comparison of
the split model with the exact-category model is still needed. -/
theorem K0_mul_eq_tensor : True := by sorry

/-- Second test: multiplication by the class `[u]` of a unit raises degree by one,
and since `[u⁻¹] = -[u]` in `K₁`, multiplication by `[u⁻¹]` is the NEGATIVE of
multiplication by `[u]` — not its inverse; neither is an automorphism of a
K-group. (Renamed from `mul_unit_bijective`, whose statement was false.) -/
theorem mul_unit_inv_eq_neg (u : Aˣ) : True := by sorry

end TauCeti.NonconnectiveK

/- REV-FIX-RT-AREA-ktheory-1: matrix Morita invariance requires n ≥ 1.
Arbitrary Morita equivalences are additive, not automatically monoidal;
product compatibility needs a natural isomorphism of the relevant biexact
functors, and an internal unital ring comparison needs compatible unit data.
Infinite-matrix corner embeddings are nonunital. Their continuity argument
requires the K.5 unitisation/fibre adapter and compatibility of the Morita
isomorphisms with those embeddings (packet gap), not unital continuity alone. -/
