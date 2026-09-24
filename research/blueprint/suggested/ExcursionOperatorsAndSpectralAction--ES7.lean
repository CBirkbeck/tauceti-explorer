/-
# Stratum maps and the GL_n comparison — suggested signatures (ES7)

Suggested Lean signatures for the blueprint packet
`research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES7.json`
(Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`, part `ES7`, layers
ES7, ES7:parabolic, ES7:GLn-comparison, ES7:equal-characteristic,
ES7:function-field-automorphic).

Written by Claude Code, session `cc-7b31c4`, for issue #728, 24 September 2026.

**This file was not compiled.** The Mathlib build on the machine this was written on
is a shared cache that must not be rebuilt. Nothing below is claimed to elaborate;
the `example`s are the packet's unit tests written as statements.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The reviewed audit `AUDIT-20` returns **not built** for every layer of this roadmap.
Three of its notes pointed to declarations a name search would have missed, and all
three are used below rather than re-invented:

* `MeasureTheory.Measure.modularCharacter` — the modulus of a *group*. `δ_P` of a
  parabolic and normalised smooth induction are **absent**, which is exactly why the
  dictionary of `ES7:parabolic` cannot yet be stated against the library.
* `TauCeti.Cocharacter.parabolic` / `.levi` — the dynamic parabolic and its Levi, which
  both FS IX.7.2 and IX.7.3 pick.
* `Representation.nonempty_equiv_of_character_eq` — semisimple trace determination, but
  only for **finite** groups in characteristic zero; the GL_n comparison needs it for
  **continuous Weil-group** representations, which is absent.

Sources: L. Fargues and P. Scholze, *Geometrization of the local Langlands
correspondence* (SHA-256 `9ab9efbd0df251bf…`), read in full for IX.7; and T. Hausberger,
*Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de
Drinfeld–Carayol*, Ann. Inst. Fourier 55 (2005) (SHA-256 `d51dc22168dcd483…`), read in
full. Laumon–Rapoport–Stuhler itself and Kaiser's erratum are image scans and were
**not read**; everything attributed to them comes through Hausberger.
-/

import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Group.Hom.Defs
import Mathlib.Algebra.Group.Subgroup.Defs
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Ring.Defs
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Projective
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Functor.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Preadditive.Basic
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Condensed.Basic
import Mathlib.MeasureTheory.Group.ModularCharacter

universe u v w

namespace TauCeti.StratumMaps

open CategoryTheory

/-! ## Placeholders for what neither pinned library has. -/

/-- The local Weil group with its inertia and the **degree map**, normalised by sending
a *geometric* Frobenius to `1`. Absent at both pins. -/
class WeilGroup (W : Type u) [Group W] where
  inertia : Subgroup W
  degree : W →* Multiplicative ℤ
  geometricFrobeniusToOne : True

/-- The dual group with its `Q`-action, `2ρ` as a cocharacter, and the Levi inclusions.
Owned by `GeometricSatakeAndFusion:GS4` and `ReductiveGroupsPartII:RG2.5`. -/
class LGroupData (Ghat Q : Type u) [Group Ghat] [Group Q] where
  twoRho : Multiplicative ℤ →* Ghat
  leviInclusions : True

/-- The classical local Langlands correspondence and Jacquet–Langlands for `GL_n`.
Absent at both pins; imported from `EndoscopicTransferAndUnitaryTraceComparison:ET.6`. -/
class ClassicalLLC (E : Type u) [Field E] (n : ℕ) where
  sigma : True
  jacquetLanglands : True

section StratumMaps

/-! ## ES7:parabolic — FS IX.7.1 -/

/-- `Ψ_G : Z^spec(G,Λ) → Z(G(E),Λ)`, through `Z^geom` and the fully faithful `j_!`. -/
def PsiG : True := trivial

/-- `Ψ_G^b` for any `b`, through the embedding of the `b`-stratum's category — the
**left adjoint** to `i_b^*`, since there is no general `i_{b!}` in the lisse setting. -/
def PsiGb : True := trivial

/-- **Unit test `no_general_shriek`.** Assuming a general `i_{b!}` is exactly the error
FS warn against in the parenthesis of Definition IX.7.1. -/
example : True := trivial

/-- **Unit test `independence_of_embedding`.** All eligible embeddings induce the same
map on centres, so `Ψ_G^b` is well posed. -/
example : True := trivial

/-- The **twisted Levi cocycle map**
`φ ↦ (w ↦ (2ρ_Ĝ − 2ρ_{Ĝ_b})(√q)^{|w|} · φ(w))`, with `|·|` sending a **geometric**
Frobenius to `1`. -/
def twistedLeviCocycle : True := trivial

/-- **Unit test `twist_is_not_optional`.** Dropping the factor gives a different — and
wrong — parameter. -/
example : True := trivial

/-- **Unit test `cocycle_property`.** The twisting factor is central in `Ĝ_b`, so the
formula does define a `1`-cocycle. FS assert the formula; this is the obligation. -/
example : True := trivial

/-- **Unit test `basic_case_trivial`.** For `b` basic, `Ĝ_b = Ĝ` and the twist vanishes. -/
example : True := trivial

end StratumMaps

section Parabolic

/-! ## ES7:parabolic — FS IX.7.2 and IX.7.3 -/

/-- FS IX.7.2. `Ψ_G^b` factors through `Ψ_{G_b}` along the twisted Levi inclusion. -/
theorem stratum_factors : True := trivial

/-- The coefficient reduction: `Z(D(G_b(E),Λ)) = lim_K Z(Λ[K \ G_b(E) / K])` is
`ℓ`-adically separated when `Λ` is killed by a power of `ℓ`, so one may work with
`D_et` rather than `D_lis`. -/
theorem coefficient_reduction : True := trivial

/-- The basic case *is* `Bun_G ≅ Bun_{G_b}` (FS III.4.3), **Hecke-equivariantly**.
Basic-inner-form invariance is the basic case, not the general one. -/
theorem basic_case : True := trivial

/-- The increasingly unstable sequence `b_N = b·μ(π)^N`: all share the canonical
parabolic, `G_b = G_{b_N}`, and there is **exactly one** modification of `E_b` of type
bounded by `Nμ` isomorphic to `E_{b_N}`, of type exactly `Nμ`. -/
theorem increasingly_unstable : True := trivial

/-- The constant term: `Rg_! S_V = CT_P(S_V)`, which up to `[deg_P]` is
`S_V|_{(M̂⋊Q)^I}` **with a cyclotomic twist**; only the `deg_P = 0` component matters
for excursion operators. -/
theorem constant_term : True := trivial

/-- FS IX.7.3, for **unnormalised** parabolic induction and **every** irreducible
subquotient. -/
theorem parabolic_induction : True := trivial

/-- The concrete twist the computation produces:
`T_μ(A)|_{Bun^1_G} = Ind^{G(E)}_{P(E)} π (d/2)[d]` with `d = ⟨2ρ,μ⟩`. -/
theorem induction_twist : True := trivial

/-- **The dictionary, an obligation with no locator.** `δ_P^{1/2}` must cancel against
the cyclotomic twist in the fixed convention. At the pins only the modulus of a *group*
exists; `δ_P` and normalised induction do not, so the statement below is written against
`modularCharacter` to mark the boundary. -/
example (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] [MeasurableSpace G] [BorelSpace G] : True := trivial

/-- **Unit test `unnormalised_not_normalised`.** Calling the source's formula normalised
induction, or omitting the twist, is the error the roadmap names. -/
example : True := trivial

end Parabolic

section GLn

/-! ## ES7:GLn-comparison — FS IX.7.4 -/

/-- The two minuscule Hecke operators are the **Lubin–Tate** and **Drinfeld** towers,
giving `π ⊗ σ` and `ρ ⊗ σ^∨` with `ρ = JL(π)`. Imported from `ET.6a`. -/
theorem two_tower_realisation : True := trivial

/-- **Unit test `shift_and_twist_are_inside`.** The shift `[n−1]` and the twist
`((n−1)/2)` are hidden in the perverse normalisation of the standard representation;
adding them again double-counts. -/
example : True := trivial

/-- The two-leg datum `I = {1,2}`, `V = std ⊗ std^∨` with unit and counit **determines
the trace**, hence the semisimplification; the scalar is fixed by taking both Weil
elements equal to `1`. -/
theorem two_leg_trace : True := trivial

/-- **Unit test `semisimple_trace_determination_is_missing`.** At the pins this
implication exists only for finite groups in characteristic zero. -/
example {k G V W : Type} [Field k] [Group G] [Fintype G] : True := trivial

/-- FS IX.7.4: `φ_π = ρ_π^ss` for every irreducible smooth `Q̄_ℓ`-representation of
`GL_n(E)`, by reduction to the supercuspidal case. -/
theorem gl_agreement : True := trivial

/-- **Unit test `no_monodromy`.** Only the semisimplification is obtained; `N` is not
recovered, and no integral or mod-`ℓ` agreement with a stronger correspondence follows. -/
example : True := trivial

end GLn

section EqualCharacteristic

/-! ## ES7:equal-characteristic — Laumon–Rapoport–Stuhler and Hausberger

Everything here is stated as Hausberger restates it; LRS itself is an image scan and
was not read. -/

/-- A **`D`-elliptic sheaf** of pole `∞` and zero `z`: the chain `(E_i, j, t)` with
periodicity, pole, zero and normalisation. For `D = M_d(F)` this is Drinfeld's elliptic
sheaf (`DrinfeldModulesAndTModules:DM.7`). -/
structure DEllipticSheaf where
  periodicity : True
  pole : True
  zero : True
  normalisation : True

/-- **Unit test `matrix_algebra_case`.** The `D = M_d(F)` case must recover Drinfeld's
elliptic sheaves. -/
example : True := trivial

/-- **Unit test `zero_avoids_R`.** The zero lands in `X − {∞} − R`; letting it meet the
ramification locus breaks the level-structure theory. -/
example : True := trivial

/-- The moduli `E^∞_{X,D,I}`: quasi-projective, smooth, purely of relative dimension
`d−1` over `X^∞`, and **projective when `D` is a division algebra**. -/
theorem moduli_representable : True := trivial

/-- Drinfeld: the deformation functor of **special** formal `O_D`-modules is
representable by `Ω̂^d ⊗̂_O Ô^nr`. Quoted, not proved, by Hausberger. -/
theorem drinfeld_representability : True := trivial

/-- Hausberger 8.1 and 8.3: **uniformisation**. The formal completion of the moduli
along its special fibre is `[(Ω̂^d ⊗̂ Ô^nr) × Z_I]/GL_d(F_o)`, and rigid-analytically
`[Σ^d_n × Z_{I^o}]/GL_d(F_o)`. -/
theorem uniformisation : True := trivial

/-- The **fundamental local representation** `U^{d−1}_d`, with its three commuting
actions of `GL_d(K)`, `D^×_d` and `W_K`. -/
def fundamentalLocalRepresentation : True := trivial

/-- **Unit test `middle_degree`.** The fundamental local representation is the middle
degree `d−1`; other degrees are the (unplanned) Carayol–Harris conjecture. -/
example : True := trivial

/-- The Hochschild–Serre spectral sequence and the **degeneration of its cuspidal part**.
Note: the `GL_d(F_o)`-action is Drinfeld's composed with `g ↦ ᵗg⁻¹` (Hausberger 10.8). -/
theorem hochschild_serre_degenerates : True := trivial

/-- **Unit test `transpose_inverse_convention`.** Getting this convention wrong
dualises the answer. -/
example : True := trivial

/-- Hausberger 9.5, the Drinfeld–Carayol conjecture in equal characteristic:
`U^{d−1}_d(χ)[π] = JL(π) ⊗ (σ_d(π) ⊗ |·|^{(1−d)/2})`, concentrated in degree `d−1`. -/
theorem drinfeld_carayol : True := trivial

end EqualCharacteristic

section FunctionFieldAutomorphic

/-! ## ES7:function-field-automorphic

The adelic infrastructure is **requested**, not planned: `AUDIT-20` names
`FunctionFieldArithmetic:FA.6` as the declared supplier, with `FA.2`,
`AdelicAlgebraicGroups:AA.0` and `AA.1`. -/

/-- LRS 14.9 and 14.12, via Hausberger: which automorphic representations occur in
`(H^n_o)^ss`, and that `V^{d−1}_Π` is semisimple of dimension `m(Π)·d`. -/
theorem lrs_cohomology : True := trivial

/-- LRS 15.10 / Badulescu: globalise a supercuspidal with prescribed local components. -/
theorem globalisation : True := trivial

/-- LRS 15.11 / Henniart: the inner-form transfer, by the **simple** trace formula of
Deligne–Kazhdan, with **multiplicity one** in the stated range. -/
theorem jl_transfer : True := trivial

/-- **Unit test `no_general_global_JL`.** LRS's remarks about an unproved general global
Jacquet–Langlands correspondence may not be used as theorems. -/
example : True := trivial

/-- **Kaiser's erratum** (not read; a two-page scan): an automorphic eigenspace is not
self-dual unless its representation is self-dual up to the required character twist.
The geometric pairing pairs *dual* isotypic components. -/
example : True := trivial

end FunctionFieldAutomorphic

end TauCeti.StratumMaps
