import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Data.ZMod.Basic

/-!
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/ArithmeticKTheory--N.5.md. These statements suggest Lean
forms so contributors and reviewers can converge on names and signatures.
Every proposed result remains unchecked; the placeholders below prove nothing.

This follow-up imports the seven accepted N.5 declarations by their packet ids;
it does not recreate their definitions or their API. In particular, it does not
introduce a second e-invariant, K-group carrier, Tate twist or coefficient theory.

The pinned libraries have no higher algebraic K-group, coefficient K-spectrum,
Suslin/descent comparison or continuous étale cohomology API on which to state
five of the six new signatures honestly. Their names and exact statements are in
the packet and reader. The omitted signatures are:
* primaryBockstein_localisation: needs genuine K_n and Q_ℓ/Z_ℓ coefficient maps;
* eInvariant_eq_descentEdge: needs Suslin's equivariant torsion identification and
  the geometric-point descent edge with its Bockstein;
* real_eInvariant_diagonalExtension: needs the actual e-map and real-place
  restriction maps; the theorem below states its group-theoretic input only;
* eInvariant_kernel_cokernel: needs those maps, not just group isomorphism types;
* etaleEdge_eInvariant_torsion: needs K-spectrum completion, continuous étale
  cohomology, coefficient triangles and the edge-normalised first Chern map.
No unstatable condition is replaced by a proposition-valued record or an opaque
surrogate for a K-group. The first Chern map is the Dwyer–Friedlander edge
normalisation; raw higher Chern classes retain their separate M.8 interface.
-/

namespace TauCeti.ArithmeticKTheory

/-- Group-theoretic input to the real-place extension theorem.

The maps form a short exact sequence. The lift relation is additional arithmetic
information obtained by restriction to every real place; exactness or equality
of cardinalities does not imply it. Positivity excludes `ZMod 0` and a zero
real-place kernel. The equivalence is an existence statement, not a splitting
of the displayed quotient map.
-/
theorem diagonalExtension_normalForm
    {E : Type*} [AddCommGroup E] (w r : ℕ)
    (hw : 0 < w) (hr : 0 < r) (hweven : 2 ∣ w)
    (ι : (Fin r → ZMod 2) →+ E) (p : E →+ ZMod w)
    (hι : Function.Injective ι) (hp : Function.Surjective p)
    (hexact : p.ker = ι.range)
    (x : E) (hx : p x = 1) (hdiag : w • x = ι (fun _ => 1)) :
    Nonempty (E ≃+ (ZMod (2 * w) × (Fin (r - 1) → ZMod 2))) ∧
      addOrderOf x = 2 * w ∧
      (∀ y : E, p y = 1 → w • y = ι (fun _ => 1)) ∧
      ¬ ∃ s : ZMod w →+ E, p.comp s = AddMonoidHom.id (ZMod w) := by
  sorry

/-- Acceptance: one real coordinate and quotient of order eight give order
sixteen, including the specified nonsplit quotient map. -/
example {E : Type*} [AddCommGroup E]
    (ι : (Fin 1 → ZMod 2) →+ E) (p : E →+ ZMod 8)
    (hι : Function.Injective ι) (hp : Function.Surjective p)
    (hexact : p.ker = ι.range)
    (x : E) (hx : p x = 1) (hdiag : 8 • x = ι (fun _ => 1)) :
    Nonempty (E ≃+ ZMod 16) ∧ addOrderOf x = 16 ∧
      ¬ ∃ s : ZMod 8 →+ E, p.comp s = AddMonoidHom.id (ZMod 8) := by
  sorry

/-- Acceptance: two real coordinates give the specified diagonal normal form.
The split group of the same cardinality has exponent at most eight. -/
example {E : Type*} [AddCommGroup E]
    (ι : (Fin 2 → ZMod 2) →+ E) (p : E →+ ZMod 8)
    (hι : Function.Injective ι) (hp : Function.Surjective p)
    (hexact : p.ker = ι.range)
    (x : E) (hx : p x = 1) (hdiag : 8 • x = ι (fun _ => 1)) :
    Nonempty (E ≃+ (ZMod 16 × ZMod 2)) ∧ addOrderOf x = 16 ∧
      (∀ y : ZMod 8 × (Fin 2 → ZMod 2), 8 • y = 0) ∧
      addOrderOf (1 : ZMod 16) = 16 := by
  sorry

/-- Acceptance: the actual cyclic quotient has no additive section. -/
example : ¬ ∃ s : ZMod 8 →+ ZMod 16,
    (ZMod.castHom (by decide : 8 ∣ 16) (ZMod 8)).toAddMonoidHom.comp s =
      AddMonoidHom.id (ZMod 8) := by
  sorry

end TauCeti.ArithmeticKTheory
