/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex — codex-jToARl; independent review Codex — codex-HBL6zX
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RepresentationTheory.Homological.GroupHomology.Shapiro

/-!
# Suggested declarations for ArithmeticKTheory N.6

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.6.md` is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures; they claim no implementation. Every packet node is unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The numerical function is an actual total function. The generic map interface
below is a genuine construction on additive homomorphisms; it does not declare
those groups to be K-groups. Instantiating it requires the supplier's actual
completion/cohomological maps. No arbitrary type, opaque constant or proposition
field is substituted for a missing higher K- or étale-cohomology carrier.

Missing-carrier boundaries: K and coefficient K from GeneralAlgebraicKTheory
and StableHomotopyKTheory H.6; finite local comparisons from L.6/L.7;
ordinary/modified/positive arithmetic cohomology from M.2 and R02;
dyadic motivic/spectral maps from M.7; cyclotomic fields and decomposition maps
from I.1/I.2; strict Selmer construction from L2. Their mathematical signatures
are recorded below by exact packet name until those actual carriers exist.
G1 and G2 remain proof gaps, not assumed fields in a structure.

Independent review REV-ArithmeticKTheory--N.6: the mathematical comments below
are not actual Lean signatures or examples. Declaration coverage is incomplete
under PROTOCOL §13, and the packet review is needs_changes. Its precise revision
list also requires the definitive reader to reject the alleged p.20 misprint:
the author preprint already says cokernel.
-/

namespace TauCeti.ArithmeticKTheory.N6

/-- Numerical table only: positive even degrees have the arithmetic theorem. -/
def evenTwoRank (r s t j n : ℕ) : ℕ :=
  if n % 8 = 2 then r + s + t - 1
  else if n % 8 = 4 ∨ n % 8 = 6 then j + s + t - 1
  else if n % 8 = 0 then s + t - 1
  else 0

theorem evenTwoRank_residue_two (r s t j n : ℕ) (h : n % 8 = 2) :
    evenTwoRank r s t j n = r + s + t - 1 := by sorry

theorem evenTwoRank_residue_four (r s t j n : ℕ) (h : n % 8 = 4) :
    evenTwoRank r s t j n = j + s + t - 1 := by sorry

theorem evenTwoRank_residue_six (r s t j n : ℕ) (h : n % 8 = 6) :
    evenTwoRank r s t j n = j + s + t - 1 := by sorry

theorem evenTwoRank_residue_zero (r s t j n : ℕ) (h : n % 8 = 0) :
    evenTwoRank r s t j n = s + t - 1 := by sorry

theorem evenTwoRank_periodic (r s t j n : ℕ) :
    evenTwoRank r s t j (n + 8) = evenTwoRank r s t j n := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_rational
example : (evenTwoRank 1 1 0 0 2, evenTwoRank 1 1 0 0 4,
    evenTwoRank 1 1 0 0 6, evenTwoRank 1 1 0 0 8) = (1, 0, 0, 0) := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_real_defect
example : (evenTwoRank 2 1 0 1 2, evenTwoRank 2 1 0 1 4,
    evenTwoRank 2 1 0 1 6, evenTwoRank 2 1 0 1 8) = (2, 1, 1, 0) := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_extra_prime
example (r s t j n : ℕ) (hs : 1 ≤ s) (hn : Even n) :
    evenTwoRank r (s + 1) t j n = evenTwoRank r s t j n + 1 := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_odd_totalisation
example (r s t j : ℕ) : evenTwoRank r s t j 1 = 0 := by sorry

section GenericMapInterface
universe u v w
variable {A : Type u} [AddCommGroup A] {ι : Type v}
  {B : ι → Type w} [∀ v, AddCommGroup (B v)]

/-- Joint map into a product; finite support is a separate theorem. -/
def localSymbolFamily (localMap : ∀ v, A →+ B v) : A →+ ∀ v, B v where
  toFun x v := localMap v x
  map_zero' := by sorry
  map_add' := by sorry

theorem localSymbolFamily_apply (localMap : ∀ v, A →+ B v) (x : A) (v : ι) :
    localSymbolFamily localMap x v = localMap v x := by sorry

theorem localSymbolFamily_map_zero (localMap : ∀ v, A →+ B v) :
    localSymbolFamily localMap 0 = 0 := by sorry

theorem localSymbolFamily_map_add (localMap : ∀ v, A →+ B v) (x y : A) :
    localSymbolFamily localMap (x + y) =
      localSymbolFamily localMap x + localSymbolFamily localMap y := by sorry

theorem localSymbolFamily_ext (f g : ∀ v, A →+ B v) :
    localSymbolFamily f = localSymbolFamily g ↔ ∀ v, f v = g v := by sorry

/-- The actual symbol kernel after the supplier maps are supplied. -/
def symbolWildKernel (localMap : ∀ v, A →+ B v) : AddSubgroup A :=
  (localSymbolFamily localMap).ker

theorem symbolWildKernel_mem (localMap : ∀ v, A →+ B v) (x : A) :
    x ∈ symbolWildKernel localMap ↔ ∀ v, localMap v x = 0 := by sorry

/-- Universal kernel lift; the maps and their vanishing condition are actual data. -/
def symbolWildKernel_lift {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) : C →+ symbolWildKernel localMap := by sorry

theorem symbolWildKernel_lift_coe {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) (c : C) :
    (symbolWildKernel_lift localMap f hf c : A) = f c := by sorry

theorem symbolWildKernel_lift_unique {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) (g : C →+ symbolWildKernel localMap)
    (hg : ∀ c, (g c : A) = f c) :
    g = symbolWildKernel_lift localMap f hf := by sorry

end GenericMapInterface

-- Compatibility boundary used by twistedResidueNormTest: full units only.
example (K L : Type*) [Field K] [Field L] [Algebra K L] [Finite L] :
    Function.Surjective (Units.map (Algebra.norm K (S := L))) := by sorry

-- Arithmetic order evidence cannot be replaced by the number of generators.
example : Nat.card (ZMod 2) ≠ Nat.card (ZMod 4) := by sorry

end TauCeti.ArithmeticKTheory.N6

/-!
## Mathematical signature inventory at missing-carrier boundaries

This is an inventory, not a declaration of missing K/cohomology carriers.
Only the numerical evenTwoRank and the generic localSymbolFamily/symbolWildKernel
interfaces and their marked API/examples elaborate above. All other entries
require genuine suppliers. The review does not count these comments as Lean
declarations or as the examples required by PROTOCOL §13.

TauCeti.ArithmeticKTheory.N6.arithmeticModTwoDimensions [application]; ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions
Let R=O_{F,S} contain 1/2 and let r₁>0, r₂, s=|S|, t=dim Pic(R)/2 and u=dim Pic⁺(R)/2. With j=u−t the imported Selmer signature defect, dim H¹_et(R,F₂)=r₁+r₂+s+t, dim H²_et(R,F₂)=r₁+s+t−1, the image of restriction α¹ to the r₁ real places has dimension r₁−j, and α² is surjective. Here S consists of the finite primes inverted in R, not the finite primes remaining in Spec R.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/signature-defect, ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence, MotivicEtaleKTheory:M.2, ArithmeticKTheory:N.2/S-unit-and-class-group-sequence.

TauCeti.ArithmeticKTheory.N6.modifiedModTwoDimensions [application]; ArithmeticKTheory:N.6/modified-mod-two-dimensions
In the preceding setting define H̃¹ and H̃² using M.2’s real-restriction kernels and its exact sequence, as in VI.9.6.3. Then dim H̃¹_et(R,F₂)=r₂+s+u=r₂+s+t+j and dim H̃²_et(R,F₂)=s+t−1. These are modified groups, not totally positive Hⁿ₊ and not ordinary Hⁿ.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions, MotivicEtaleKTheory:M.2.

TauCeti.ArithmeticKTheory.N6.modTwoCoefficientOrders [comparison]; ArithmeticKTheory:N.6/mod-two-coefficient-orders
For n>0, R as above, let a=r₁+r₂+s+t, b=r₁+s+t−1, c=r₂+s+t+j, d=s+t−1. The finite group K_n(R;Z/2) has order 2^e, with e=d+1,a,b+1,r₁−1+a,j+b,r₁−1+c,j+d,c in residues n≡0,1,2,3,4,5,6,7 modulo 8 respectively. Keep the filtrations and the stated splittings of VI.9.7 in the M.7 supplier. An extension of elementary 2-groups need not be elementary; e is a log₂ cardinality, not necessarily an F₂ dimension.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions, ArithmeticKTheory:N.6/modified-mod-two-dimensions, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.evenTwoRank [construction]; ArithmeticKTheory:N.6/even-two-rank-function
For nonnegative integers r,s,t,j,n define evenTwoRank(r,s,t,j,n) by r+s+t−1 if n≡2 mod 8, j+s+t−1 if n≡4 or 6 mod 8, and s+t−1 if n≡0 mod 8. It is a numerical function, with value zero on odd residues as a totalisation convention; no K-theoretic meaning is assigned at odd n or n=0. The arithmetic application requires n>0, n even, r=r₁>0, S containing the dyadic primes, t the ordinary class-group two-rank and j the Selmer signature defect.
Hypotheses: r,s,t,j,n are arbitrary nonnegative integers; subtraction is natural subtraction. The separate arithmetic theorem assumes n>0 even, r=r₁>0, S containing all dyadic primes and the specified class/signature invariants.
Suppliers / direct prerequisites: mathlib:ZMod.
The generic or numerical interface is elaborated above; its arithmetic specialisation still requires genuine suppliers.
TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_two [simp]: If n mod 8=2, the value is r+s+t−1. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_four [simp]: If n mod 8=4, the value is j+s+t−1. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_six [simp]: If n mod 8=6, the value is j+s+t−1. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_zero [simp]: If n mod 8=0, the value is s+t−1. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.evenTwoRank_periodic [compatibility]: evenTwoRank(r,s,t,j,n+8)=evenTwoRank(r,s,t,j,n). (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.rankTable_rational [example / computation]: For (r,s,t,j)=(1,1,0,0), the values at n=2,4,6,8 are 1,0,0,0. (Elaborating numerical example above.)
TauCeti.ArithmeticKTheory.N6.rankTable_real_defect [example / computation]: For (2,1,0,1), the values at n=2,4,6,8 are 2,1,1,0. (Elaborating numerical example above.)
TauCeti.ArithmeticKTheory.N6.rankTable_extra_prime [example / compatibility]: For s≥1 and even n, replacing s by s+1 increases the value by one. (Elaborating numerical example above.)
TauCeti.ArithmeticKTheory.N6.rankTable_odd_totalisation [example / degenerate]: The value at n=1 is zero by the totalisation convention, with no claim about K₁. (Elaborating numerical example above.)

TauCeti.ArithmeticKTheory.N6.evenTwoRanks [theorem]; ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic
For R=O_{F,S} containing 1/2, r₁>0 and every positive even n, dim_F₂ K_n(R)/2 = evenTwoRank(r₁,|S|,t,j,n). Thus the ranks are r₁+s+t−1, j+s+t−1, j+s+t−1, s+t−1 in residues 2,4,6,0 mod 8. This gives the number of dyadic cyclic factors, not their orders. The theorem is independent of the undetermined extension rank ρ in the integral 8k+4 row.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/even-two-rank-function, ArithmeticKTheory:N.6/mod-two-coefficient-orders, ArithmeticKTheory:N.5/the-real-case-modulo-eight, StableHomotopyKTheory:H.6.

TauCeti.ArithmeticKTheory.N6.finiteCoefficientDivisibilityKernel [comparison]; ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel
Let R=O_{F,S}, n>0 even, T=K_n(R) embedded in K_n(F) by Soulé, and m≥2 annihilate the finite group T. Under the universal coefficient injection T=T/m→K_n(R;Z/m), the kernel of K_n(R;Z/m)→K_n(F;Z/m) is exactly div K_n(F). In particular this kernel is contained in the integral subgroup T. The modulus m is an annihilator, not an arbitrary prime; the statement does not identify every finite-coefficient K-group with an integral quotient.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/divisible-subgroup, ArithmeticKTheory:N.5/soule-theorem, ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain, ArithmeticKTheory:N.3/finiteness-and-ranks-combined, StableHomotopyKTheory:H.6, KTheoryFiniteLocalFields:L.1/quillen-k-groups, ArithmeticKTheory:N.5/soule-mod-l-surjectivity.

TauCeti.ArithmeticKTheory.N6.primaryKernelsStabilise [application]; ArithmeticKTheory:N.6/stabilisation-of-primary-kernels
For a prime ℓ, let T=K_{2i}(O_F){ℓ} embedded in K_{2i}(F). The subgroups N_ν=ker(T→K_{2i}(F)/ℓ^ν) decrease and eventually stabilise. Their intersection and stable value equal (div K_{2i}(F)){ℓ}. This gives a finite stopping statement, but not a computable bound for ν solely from |T|.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/divisible-subgroup, ArithmeticKTheory:N.5/soule-theorem, ArithmeticKTheory:N.3/finiteness-and-ranks-combined, ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel.

TauCeti.ArithmeticKTheory.N6.positiveEvenK [definition]; ArithmeticKTheory:N.6/positive-even-k-subgroup
Define K⁺_{2i}(F) as the kernel of the map to the finite real symbol groups (Z/2)^{r₁} when i≡1 mod 4, and as K_{2i}(F) otherwise. Define K⁺_{2i}(O_{F,S}) by inverse image under the field map. This is the paper’s positive K-group, not positive étale cohomology.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.5/the-real-case-modulo-eight, MotivicEtaleKTheory:M.7.
TauCeti.ArithmeticKTheory.N6.positiveEvenK_mem [characterisation]: x∈K⁺ iff all real symbols of x vanish. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.positiveEvenK_of_no_real_places [simp]: For a totally imaginary field K⁺=K. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.positiveEvenK_ring_comap [compatibility]: The ring positive subgroup is the comap of the field positive subgroup. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.positiveEvenK_of_other_residue [simp]: If i mod 4≠1, K⁺=K. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.positiveK_rational_symbol [example / non-example]: The class {−1,−1} in K₂(Q) is outside K₂⁺(Q). (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.positiveK_imaginary [example / degenerate]: K₂⁺(Q(i))=K₂(Q(i)). (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.positiveK_degree_four [example / compatibility]: K₄⁺(F)=K₄(F), including fields with real places. (Actual arithmetic example pending.)

TauCeti.ArithmeticKTheory.N6.localSymbolFamily [construction]; ArithmeticKTheory:N.6/local-symbol-family
For each finite place v construct λ_{i,v}:K_{2i}(F)→K_{2i}(F_v)→D_i(F_v), where D_i(F_v)=⊕_ℓ H²(F_v,Z_ℓ(i+1)) is the finite local quotient. Its order is w_i(F_v); the paper writes it as μ^{⊗i}(F_v) after cyclic-group identifications. Add the real Z/2 symbols only for i≡1 mod 4. The joint map initially lands in a product over all places; on K⁺ its finite support is a theorem of the Moore sequence. Cohomological corestriction is not silently equated with the ordinary norm on a twisted root module.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: KTheoryFiniteLocalFields:L.7/completion-map, KTheoryFiniteLocalFields:L.7/etale-chern-class-completion, KTheoryFiniteLocalFields:L.6/even-integral-k-groups, KTheoryFiniteLocalFields:L.6/even-completed-k-groups-are-h2, ArithmeticKTheory:N.4/the-w-invariant, MotivicEtaleKTheory:M.7.
The generic or numerical interface is elaborated above; its arithmetic specialisation still requires genuine suppliers.
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_apply [projection]: The v-component is the completion map followed by the local finite quotient. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_restriction [functoriality]: Restriction to E/F commutes with each local component at w|v. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_transfer [functoriality]: The v-component of transfer equals the sum of the local corestrictions over w|v. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_degree_two [compatibility]: At i=1 this is the full Hilbert-symbol map after Matsumoto’s identification. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_map_zero [simp]: The joint additive symbol map sends zero to zero in the product of local targets. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_map_add [simp]: The joint symbol of x+y is the sum of the joint symbols of x and y. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.localSymbolFamily_ext [extensionality]: Two joint symbol maps are equal exactly when all their component homomorphisms are equal. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.localSymbols_rational_minus_one [example / computation]: At the real place and at 2 the symbol of {−1,−1} is nonzero. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.localSymbols_no_real_term [example / degenerate]: For i=2 the real finite symbol target is zero. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.localSymbols_unramified_residue [example / compatibility]: Away from ℓ, the ℓ-primary finite component is the Soulé boundary followed by the finite-field identification. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.localSymbols_dyadic_degree_four [example / computation]: For F_v=Q₂ and i=2, |D_i(F_v)|=24 and |D_i(F_v){2}|=8; for i=1 the full order is 2. A quotient keeping only the dyadic component fails this test. (Actual arithmetic example pending.)

TauCeti.ArithmeticKTheory.N6.symbolWildKernel [definition]; ArithmeticKTheory:N.6/symbol-wild-kernel
Define WK^sym_{2i}(F)=ker λ_i, where λ_i is the product of the finite local symbols and the applicable real symbols. It is a subgroup of K⁺_{2i}(F). This is Weibel Definition 0.2. The parent tame-and-wild-kernels node defines WK^raw by vanishing in the full completion K-groups; keep both names until the comparison is proved.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/local-symbol-family, ArithmeticKTheory:N.6/positive-even-k-subgroup.
The generic or numerical interface is elaborated above; its arithmetic specialisation still requires genuine suppliers.
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_mem [characterisation]: x belongs iff every finite and real symbol vanishes. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_le_positive [structure]: WK^sym≤K⁺. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_restriction [functoriality]: Restriction carries WK^sym(F) into WK^sym(E). (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_transfer [functoriality]: Transfer carries WK^sym(E) into WK^sym(F). (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_degree_two [compatibility]: WK₂^sym(F)=WK₂^raw(F). (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift [universal-property]: If f:C→K_{2i}(F) is an additive homomorphism and every local symbol of f(c) vanishes, f has a unique additive lift to WK^sym whose composite with the subgroup inclusion is f. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift_coe [simp]: The subgroup inclusion composed with symbolWildKernel_lift is the given f, elementwise. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift_unique [universal-property]: Any additive lift whose composite with the subgroup inclusion is f equals symbolWildKernel_lift. (Generic/numerical interface above.)
TauCeti.ArithmeticKTheory.N6.symbolWild_rational [example / computation]: WK₂^sym(Q)=0. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.symbolWild_tame_nonexample [example / non-example]: K₂(Z) has the nonzero class {−1,−1}, while WK₂^sym(Q) does not. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.symbolWild_special_minus_fourteen [example / non-example]: For F=Q(√−14), {−1,−1} lies in WK₂^sym(F) and is outside div K₂(F). (Actual arithmetic example pending.)

TauCeti.ArithmeticKTheory.N6.globalMooreSequence [theorem]; ArithmeticKTheory:N.6/global-moore-sequence
For i≥1 there is an exact sequence 0→WK^sym_{2i}(F)→K⁺_{2i}(F)→⊕_{v finite}D_i(F_v)→D_i(F)→0. Here D_i(F)=H⁰(F,Q/Z(−i))^D, a finite cyclic group of order w_i(F), and the last map is the sum of local invariant/corestriction maps. K⁺ can be replaced by K when F is totally imaginary or i mod 4≠1. The finite local symbols of each element have finite support.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/symbol-wild-kernel, ArithmeticKTheory:N.6/positive-even-k-subgroup, ArithmeticKTheory:N.6/local-symbol-family, ArithmeticGaloisDuality:R02.4/poitou-tate, ArithmeticGaloisDuality:R02.1/tate-inverse-limit, MotivicEtaleKTheory:M.2, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.primarySIntegerMooreSequence [theorem]; ArithmeticKTheory:N.6/primary-s-integer-moore-sequence
Let ℓ be prime. There is an exact sequence 0→WK^sym_{2i}(F){ℓ}→K⁺_{2i}(O_F){ℓ}→⊕_{v|ℓ}D_i(F_v){ℓ}→D_i(F){ℓ}→0. Equivalently write K_{2i}(O_F){ℓ} in the middle and include the real symbol groups (only if ℓ=2 and i≡1 mod 4) among the local terms. Replacing O_F by O_{F,S}, with S consisting of the primes above ℓ, preserves its ℓ-primary even K-group. Enlarging S beyond those primes introduces extra residue terms and is not claimed to preserve it.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/global-moore-sequence, ArithmeticKTheory:N.5/soule-theorem, KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility, KTheoryFiniteLocalFields:L.7/unramified-chern-class-reduction, KTheoryFiniteLocalFields:L.1/quillen-k-groups.

TauCeti.ArithmeticKTheory.N6.symbolWildOrder [application]; ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels
In the preceding sequence all groups are finite. The cardinality identity is |WK^sym{ℓ}|·∏_{v|ℓ}|D_i(F_v){ℓ}|=|K⁺_{2i}(O_F){ℓ}|·|D_i(F){ℓ}|. In the alternative formulation use K_{2i}(O_F){ℓ} and multiply the local product by 2^{r₁} exactly when ℓ=2 and i≡1 mod 4. Thus the order comes from an exact arithmetic diagram, not from imposing an analytic value.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/primary-s-integer-moore-sequence, ArithmeticKTheory:N.3/finiteness-and-ranks-combined, ArithmeticKTheory:N.6/certificate-driven-computation.

TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel [definition]; ArithmeticKTheory:N.6/cohomological-wild-kernel
For ℓ prime and S containing the places above ℓ, define Sha²_{i,ℓ}(F)=ker(H²_et(O_{F,S},Z_ℓ(i+1))→∏_{v∈S∪S∞}H²(F_v,Z_ℓ(i+1))). Define finite-level kernels with μ_{ℓ^ν}^{⊗(i+1)} separately. This is the specialisation of SelmerIwasawaCohomology L2’s kernel construction, with strict zero local conditions. It is independent of S after the unramified comparisons are proved. Passage from the finite kernels to the continuous kernel uses the supplied finite-cohomology inverse-limit theorem; ordinary, modified and positive H² are distinct carriers.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: SelmerIwasawaCohomology:L2/selmer-data, SelmerIwasawaCohomology:L2/selmer-kernel, SelmerIwasawaCohomology:L2/selmer-functoriality, ArithmeticGaloisDuality:R02.3/h1-finite, ArithmeticGaloisDuality:R02.1/tate-inverse-limit, ArithmeticGaloisDuality:R02.4/poitou-tate, MotivicEtaleKTheory:M.2.
TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_mem [characterisation]: A class belongs iff every specified localisation vanishes. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_change_S [equivalence]: Enlarging S gives the canonical identification via unramified localisation. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_inverse_limit [compatibility]: Sha² with continuous coefficients identifies with the inverse limit of the compatible finite-level kernels under the proved finiteness/limit hypotheses. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_selmer [compatibility]: It is the L2 strict Selmer kernel in degree two for the twist Z_ℓ(i+1). (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_functoriality [functoriality]: A morphism of the global and local degree-two coefficient cohomology modules commuting with all localisation maps sends the strict kernel into the strict kernel; the induced maps respect identities and composition, by the imported selmer-functoriality node. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.cohomWild_no_real_odd_prime [example / degenerate]: For ℓ odd, omitting the archimedean factors does not change the kernel. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.cohomWild_real_odd_i [example / compatibility]: For ℓ=2 and i odd, the ordinary real H² terms are Z/2 at each real place. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.cohomWild_real_even_i [example / compatibility]: For ℓ=2 and i even, the ordinary real H² terms with Z₂(i+1) are zero, even though finite-level real terms can occur. (Actual arithmetic example pending.)

TauCeti.ArithmeticKTheory.N6.symbolCohomologicalComparison [comparison]; ArithmeticKTheory:N.6/symbol-cohomological-comparison
For every odd prime ℓ, and for ℓ=2 when F is totally imaginary or i mod 4≠2, the arithmetic comparison induces WK^sym_{2i}(F){ℓ}≅Sha²_{i,ℓ}(F). For ℓ=2, F real and i≡2 mod 4, it instead induces an exact sequence 0→C_{F,i}→WK^sym{2}→Sha²_{i,2}(F)→0, where C_{F,i} is the kernel of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)) and has order 2^ρ as in the parent integral table. The map and kernel must be retained. Here S contains all primes above 2.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs. In each dyadic S-integer comparison, S contains every finite prime above 2, so 1/2 is a unit in O_{F,S}. The signature defect j is the cokernel dimension of real restriction; the author preprint already uses this convention after (8.2).
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/primary-s-integer-moore-sequence, ArithmeticKTheory:N.6/cohomological-wild-kernel, ArithmeticKTheory:N.6/even-groups-at-odd-primes, ArithmeticKTheory:N.6/the-two-primary-corrections, MotivicEtaleKTheory:M.2, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.SpecialAtTwo [definition]; ArithmeticKTheory:N.6/special-number-fields
A number field F is special if it is exceptional in the parent N.4 sense and for every dyadic prime v there is a 2-primary root of unity ζ, in compatible algebraic closures, with ζ+ζ⁻¹∈F_v but ζ+ζ⁻¹∉F. Equivalently the maximal dyadic roots of F_v(√−1) properly exceed those of F(√−1). The witnesses may depend on v. Exceptionality alone is insufficient.
Hypotheses: F is a number field. The definition has no degree parameter; the decomposition characterisation separately assumes odd i≥1 and sufficiently large dyadic m.
Suppliers / direct prerequisites: ArithmeticKTheory:N.4/exceptional-fields-at-two, IntegralIwasawaTheory:I.1.
TauCeti.ArithmeticKTheory.N6.specialAtTwo_exceptional [projection]: A special field is exceptional. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_local_witness [projection]: At every dyadic prime a root witness exists. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_iff_decomposition [characterisation]: Assume F is exceptional. For odd i and every sufficiently large 2-power m (so the splitting extension is nontrivial), F is special iff every dyadic decomposition subgroup is proper in Gal(F(μ_m^{⊗i})/F). (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_transport [functoriality]: The predicate is preserved and reflected by a number-field isomorphism. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_iff [constructor]: F is special iff F is exceptional and, at each dyadic place, a compatible 2-primary root witness has ζ+ζ⁻¹ in the completion but outside F; witnesses are allowed to vary with the place. (Actual arithmetic signature pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_rational [example / non-example]: Q is exceptional but is not special. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_gaussian [example / degenerate]: Q(i) is nonexceptional and is not special. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_minus_fourteen [example / computation]: Q(√−14) is special. (Actual arithmetic example pending.)
TauCeti.ArithmeticKTheory.N6.specialAtTwo_quadratic [example / characterisation]: For square-free d≠0,1, Q(√d) is special iff d≡−1 mod 8 with d≠−1, or d≡±2 mod 16 with d≠±2. (Actual arithmetic example pending.)

TauCeti.ArithmeticKTheory.N6.specialDyadicDecomposition [theorem]; ArithmeticKTheory:N.6/special-dyadic-decomposition
Let i be odd, F exceptional and m=2^ν sufficiently large so E=F(μ_m^{⊗i}) is nontrivial and contains √−1. Put G=Gal(E/F), M=μ_m^{⊗i}, and Z_v the decomposition group at v|2. F is special iff every Z_v is proper in G. In that case ρ₁:⊕_{v|2}H₁(Z_v,M)→H₁(G,M)≅Z/2 is zero. If F is not special, some Z_v=G and ρ₁ is a split surjection. This is the obstruction map in the symbol-kernel comparison.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/special-number-fields, IntegralIwasawaTheory:I.1, MotivicEtaleKTheory:M.2, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers, mathlib:groupHomology.indIso.

TauCeti.ArithmeticKTheory.N6.twistedResidueNormTest [application]; ArithmeticKTheory:N.6/twisted-residue-norm-test
Let k=F_q, m=2^ν≥4 with q odd and i≥1, E=k(μ_m^{⊗i}), G cyclic generated by Frobenius acting on M=μ_m^{⊗i} as multiplication by q^i. The norm M_G→M^G is an isomorphism exactly when q^i≢−1 mod m; when q^i≡−1 it is zero and the invariant target has order two. For odd prime powers m the norm on this faithful cyclic module is always onto. This tests a norm on a root-twist module, not surjectivity of Eˣ→kˣ.
Hypotheses: k is a finite field of odd cardinality q; i≥1; m=2^ν≥4 in the dyadic test. For the odd-primary assertion m is an odd prime power coprime to q and the cyclic action is faithful on Z/m.
Suppliers / direct prerequisites: mathlib:FiniteField.unitsMap_norm_surjective, mathlib:FiniteField.algebraMap_norm_eq_pow, MotivicEtaleKTheory:M.2, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers.

TauCeti.ArithmeticKTheory.N6.hilbertLocalNormCertification [application]; ArithmeticKTheory:N.6/hilbert-local-norm-certification
Let L=F_v be a finite completion and m≥2 with μ_m⊂L. For a,b∈Lˣ the Hilbert symbol (a,b)_{L,m}=1 iff b lies in N_{L(a^{1/m})/L}(L(a^{1/m})ˣ). Thus a proposed K₂ symbol class has trivial finite local m-component exactly when these local norm conditions hold. Norm membership uses the range of Units.map(Algebra.norm L), with uniformiser valuation and the unit filtration checked separately. Include the real sign test at real places. Higher K-groups use their twist-cohomology local conditions, rather than an unproved analogous Hilbert-symbol formula.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: K2SymbolsBrauer:T.7/classical-local-symbols, KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion, mathlib:Algebra.norm, tauceti:TauCeti.unitFiltration, tauceti:TauCeti.unitFiltration_zero, tauceti:TauCeti.unitFiltration_one, ArithmeticKTheory:N.6/local-symbol-family, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity.

TauCeti.ArithmeticKTheory.N6.cyclotomicClassGroupDescent [comparison]; ArithmeticKTheory:N.6/cyclotomic-class-group-descent
Let m be a prime power, E=F(μ_m^{⊗i}), G=Gal(E/F), and S be finite containing the primes dividing m and ramified primes of E/F. Set T to the places of E above S (thus S=T/G). Over totally imaginary E, where the twist is trivial and m≠2, the Kummer/Brauer sequence is 0→Pic(O_{E,T})⊗μ_m^{⊗i}→H²(O_{E,T},μ_m^{⊗(i+1)})→M⁰→0, where M⁰ is the kernel of the sum of the local invariant targets to the global target. Its coinvariant long exact sequence has segment H₁(G,M⁰)→(Pic(O_{E,T})(i)/m)_G→H²(O_{F,S},μ_m^{⊗(i+1)})→M⁰_G→0 when the H² descent hypothesis holds. For real fields use Pic⁺ and totally positive H²₊ instead, as in §§6.8–6.9, and retain the comparison to ordinary H².
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs. Choose S as a finite set of finite places of F containing all primes dividing m and any ramified primes of E/F. Let T be exactly the set of places of E over S, so T is G-stable and S=T/G. For the totally positive dyadic variant take m=2^ν>2.
Suppliers / direct prerequisites: MotivicEtaleKTheory:M.2, IntegralIwasawaTheory:I.1, IntegralIwasawaTheory:I.2, ArithmeticGaloisDuality:R02.4/poitou-tate, ArithmeticKTheory:N.6/special-dyadic-decomposition, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers, mathlib:groupHomology.indIso.

TauCeti.ArithmeticKTheory.N6.cyclotomicDivisibleImage [theorem]; ArithmeticKTheory:N.6/cyclotomic-divisible-image
For m=ℓ^ν sufficiently large, E=F(μ_m^{⊗i}), the image of the twisted Picard coinvariants (Pic(O_E[1/ℓ])(i)/m)_G in K_{2i}(O_F){ℓ} is (div K_{2i}(F)){ℓ} in the cohomological-dimension-two cases (ℓ odd, or ℓ=2 and F totally imaginary). For real dyadic fields its image in H²_M(F,Z_(2)(i+1)) is div of that motivic group, using the ordinary Picard localisation diagram. The exceptional odd dyadic case is conditional on the corrected cyclotomic localisation input recorded as gap G2; unrestricted Lemma 4.4 is not an admissible prerequisite.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/stabilisation-of-primary-kernels, ArithmeticKTheory:N.6/cyclotomic-class-group-descent, MotivicEtaleKTheory:M.2, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.imaginaryEqualityCases [theorem]; ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison
If F is totally imaginary and either i is even or F is not special, div K_{2i}(F)=WK^sym_{2i}(F). At odd primes this equality holds for every number field. The odd-prime argument is the same finite cyclotomic class-group image argument; it does not require a separately assumed Schneider theorem.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/cyclotomic-divisible-image, ArithmeticKTheory:N.6/cyclotomic-class-group-descent, ArithmeticKTheory:N.6/primary-s-integer-moore-sequence, ArithmeticKTheory:N.6/special-dyadic-decomposition, ArithmeticKTheory:N.6/twisted-residue-norm-test.

TauCeti.ArithmeticKTheory.N6.imaginarySpecialObstruction [theorem]; ArithmeticKTheory:N.6/imaginary-special-obstruction
If F is totally imaginary and special and i is odd, there is an exact sequence 0→div K_{2i}(F)→WK^sym_{2i}(F)→Z/2→0. The last map is the cyclotomic homology obstruction induced by ρ₁=0 and H₁(G,M)=Z/2; it is surjective. A splitting is not asserted in general.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/cyclotomic-divisible-image, ArithmeticKTheory:N.6/cyclotomic-class-group-descent, ArithmeticKTheory:N.6/special-dyadic-decomposition, ArithmeticKTheory:N.6/primary-s-integer-moore-sequence.

TauCeti.ArithmeticKTheory.N6.realMotivicObstruction [theorem]; ArithmeticKTheory:N.6/real-motivic-obstruction
Let F have real places and i≥1. In H²_M(F,Z_(2)(i+1)), the subgroup div is contained in Sha²_{i,2}(F), using the finite S-integer injection and the motivic/continuous comparison. The quotient is zero if i is even or F is nonspecial, and is Z/2 if i is odd and F is special. In the even case retain the exact real-corrected sequence of Proposition 7.6; in the odd case the quotient is the homology defect of (7.7).
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/cohomological-wild-kernel, ArithmeticKTheory:N.6/cyclotomic-divisible-image, ArithmeticKTheory:N.6/cyclotomic-class-group-descent, ArithmeticKTheory:N.6/special-dyadic-decomposition, MotivicEtaleKTheory:M.2, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.hiddenRealClassesDivisible [theorem]; ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible
For F with real places and i≡2 mod 4, the kernel C_{F,i} of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)), of order 2^ρ, lies in div K_{2i}(F). In particular the image of K⁽M⁾₄(F) in K₄(F) is divisible in the ambient field group. No claim is made that the finite subgroup C itself is a divisible group. Here S contains all primes above 2.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs. In each dyadic S-integer comparison, S contains every finite prime above 2, so 1/2 is a unit in O_{F,S}. The signature defect j is the cokernel dimension of real restriction; the author preprint already uses this convention after (8.2).
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/the-two-primary-corrections, ArithmeticKTheory:N.6/stabilisation-of-primary-kernels, MotivicEtaleKTheory:M.7, IntegralIwasawaTheory:I.1.

TauCeti.ArithmeticKTheory.N6.weibelSymbolDivisibility [theorem]; ArithmeticKTheory:N.6/weibel-symbol-divisibility-theorem
For every number field F and i≥1, div K_{2i}(F)⊆WK^sym_{2i}(F) with quotient Z/2 if F is special and i is odd, and zero otherwise. This assembles Theorem A for the paper’s symbol kernel. Its proof depends on the corrected localisation input G2; the parent’s raw completion-kernel version further depends on G1.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison, ArithmeticKTheory:N.6/imaginary-special-obstruction, ArithmeticKTheory:N.6/real-motivic-obstruction, ArithmeticKTheory:N.6/symbol-cohomological-comparison, ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible.

TauCeti.ArithmeticKTheory.N6.rawSymbolKernelBoundary [comparison]; ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary
Always WK^raw_{2i}(F)⊆WK^sym_{2i}(F), since symbols factor through completion. Equality holds at i=1, by torsion of K₂(F) and Moore’s uniquely divisible local kernel, including the real comparison. For higher i, equality follows if every global torsion class with zero local finite symbols has zero image in the divisible part of every completion, and the analogous real finite-part detection holds. The existing local structure allows divisible residue-characteristic torsion, so global torsion alone does not prove this hypothesis. The unqualified higher equality remains G1.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/tame-and-wild-kernels, ArithmeticKTheory:N.6/symbol-wild-kernel, KTheoryFiniteLocalFields:L.3/moore-theorem, KTheoryFiniteLocalFields:L.6/even-integral-k-groups, KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion, MotivicEtaleKTheory:M.7.

TauCeti.ArithmeticKTheory.N6.arithmeticCertificateEvidence [application]; ArithmeticKTheory:N.6/arithmetic-evidence-for-certificates
Instantiate the parent order-certificate and certificate-driven-computation nodes using the arithmetic cohomology tables, exact local maps and class-group data above. A finite presentation supplies a proved surjection P→K_{2i}(O_S), while the cohomological and local computations supply an independently proved lower bound. Their matching cardinalities certify an isomorphism. Two-rank data certify only the number of two-primary factors; full order requires the complete H² cardinality and, for real n≡4 mod 8, ρ. The extension determines the group structure, while exactness already gives its cardinality as 2^ρ·|H²|. A wild-kernel certificate uses the symbol maps and the Moore exact sequence; a higher raw-kernel certificate requires G1.
Hypotheses: F is a number field; i ≥ 1; S is finite whenever O_S occurs.
Suppliers / direct prerequisites: ArithmeticKTheory:N.6/order-certificate, ArithmeticKTheory:N.6/certificate-driven-computation, ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic, ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels, ArithmeticKTheory:N.6/hilbert-local-norm-certification, ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary.

-/
