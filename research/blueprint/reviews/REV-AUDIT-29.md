# REV-AUDIT-29 — review of AUDIT-29

**Verdict: accepted.** 3 corrections, all enrichments; no claim I checked turned out to be wrong.

Batch: `K2SymbolsBrauer`, `K3BlochGroups`, `KTheoryFiniteLocalFields`, `KTheoryLowDegrees` —
38 layers, 199 target entries (177 distinct), 304 declaration citations, 75 duplicate claims.
Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What I checked

**Citations (all 304).** Every citation resolves in `declarations.tsv` at exactly the stated
library, file and line — zero mismatches. All 158 cited files exist in the pinned trees and none
contains a `sorry`. No axiom, structure field or `private` declaration is cited (kinds: 129 def,
100 theorem, 22 lemma, 17 abbrev, 16 class, 13 instance, 7 structure).

**Present and partial targets (44).** I opened each cited declaration, read its statement, the
enclosing `variable` lines and its hypotheses, and compared them with the target. All match,
including the generality caveats the audit records: `Small.{v} k` on `SplitK0.finrankEquiv`
(stated for any `DivisionRing k`); `FinitePresentation` + `Flat` on
`isLocallyConstant_rankAtStalk`, reached from projective by `Flat.of_projective` and
`finitePresentation_of_projective`; `IsDomain` on `ClassGroup.equivPic`;
`Finite (MaximalSpectrum R)` on `free_of_flat_of_finrank_eq`; `IsArtinianRing` on
`simpleClassBasis`; `IsDedekindDomain` on `integerClassGroupEquiv`; `IsIntegral`, `IsNoetherian`
and `coheight ≤ 1` on `classGroupToLineBundleClass_injective`; `[Ring R]` (any ring) on
`finiteProjectiveModulesExactStructure` and `cartanMap`. Frobenius and Verschiebung really are
defined on `𝕎 R` only and not on the truncations, as the L.5 note says.

**Absent and partial claims — independent re-search of every distinct target**, by concept and by
Mathlib naming convention, with `grep -rn -i` over both whole Lean trees and `grep -i -P` over
`declarations.tsv`. Confirmed absent from both libraries: Steinberg groups of a ring, Milnor
K-theory, Steinberg/tame/Dennis–Stein symbols, Matsumoto, Weil reciprocity, Bloch and pre-Bloch
groups, five-term relations, cross-ratios, dilogarithms, Suslin's sequence, configuration
complexes, homological stability, Hurewicz, the plus construction, Gabber/Suslin rigidity,
Bocksteins, Brauer lifting, Adams operations, λ-rings and γ-filtrations, topological K-theory and
Bott periodicity, Hochschild/THH/TR/TC, de Rham–Witt complexes, Hilbert symbols, a Brauer
invariant map, local Tate duality, Galois Tate twists `ℤ_p(j)`, unimodular rows, Mennicke symbols,
stable range, the Dieudonné determinant, Whitehead's lemma, `GL(A)` as a colimit and any block-sum
`GL_m × GL_n → GL_{m+n}`, Steinitz in rank ≥ 2, projectivity of exterior powers of projectives,
`det : K₀ → Pic`, the projective-bundle formula, perfect complexes of modules, and `K₀` of a
scheme. Neither library has `K_n` for `n ≥ 1`; Mathlib has no `K₀` or Grothendieck group of
modules at all, so every `K₀` in this batch is Tau Ceti's.

Three of the audit's judgement calls are worth recording because they are the ones most likely to
be wrong and are right:

* **Weil reciprocity (T.4).** Tau Ceti has built the whole apparatus — `Divisor.eval`,
  `eval_eq_prod_normResidue`, `exists_linearlyEquivalent_disjoint_support`, `degree_principal` —
  and names Weil reciprocity in three docstrings, but no declaration states
  `f(div g) = g(div f)`. "Not proved" is correct.
* **`Pic` of a scheme (Z.5).** Mathlib has only `CommRing.Pic`; Tau Ceti's `LineBundleClass X` is
  a `CommMonoid` whose docstring says inverses are deliberately not asserted. There is no group to
  map to, exactly as the note says.
* **The S-unit rank (U.4).** `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` proves finite
  generation only and says the rank refinement "is not here"; Mathlib's
  `DedekindDomain/SUnit.lean` (PR #40791) is not in the pin. "Partial" is correct.

**Duplicates (all 75).** Every cited layer id exists in the atlas, none belongs to the one retired
roadmap (`FoundationsAndLibraryIntegration`), and each claim matches the cited layer's description.
I then swept all ~1960 atlas layer descriptions for this batch's vocabulary and subtracted what the
audit already claims. Three near misses are correctly excluded: `EllipticKTheory:E.4` defines a
curve `SK₁` and says in terms to keep it distinct from U.3's stable-matrix `SK₁`;
`SpecialValuesBirchTate:B.3` consumes `K₂(ℤ) ≅ ℤ/2` rather than proving it;
`ArithmeticKTheory:N.3:ranks` only cautions that the `K₁` rank is the S-unit rank. Two were
missing and are added below.

**Verdicts.** Consistent with the targets everywhere: the five "partly built" layers (L.1, L.5,
Z.1, Z.2, Z.4) are exactly the five with at least one present and one missing target, and no layer
has every target present.

## Corrections

1. **`KTheoryLowDegrees:Z.1`**, target *Object-class induction and equality of classes by stable
   isomorphism* — added `Module.IsStablyFree` (`Mathlib/Algebra/Module/StablyFree/Basic.lean:33`)
   and `IsStablyFree.of_free_prod` as related, with a note saying they give the `Q` free case
   (`P ⊕ Rⁿ ≅ Rᵐ`) and not the `[P] = [Q] ↔ P ⊕ Rⁿ ≅ Q ⊕ Rⁿ` criterion the layer asks for.
   `IsStablyFree` is Mathlib's standard name for the notion the target is phrased in and belongs
   in the entry. Verdict unchanged (partial).
2. **`KTheoryLowDegrees:U.4`** — added duplicate `ArithmeticKTheory:N.1`, which states "Import Z
   and U to obtain `K₀(O_{F,S}) ≅ ℤ ⊕ Cl(O_{F,S})` and the determinant isomorphism
   `K₁(O_{F,S}) ≅ O_{F,S}ˣ`", i.e. U.4's target. The audit already listed N.1 as a duplicate of
   Z.4 for the `K₀` half.
3. **`K3BlochGroups:V.1`** — added duplicate `StableHomotopyKTheory:H.3`, which owns the plus
   construction this layer's target applies to `BSt(A)`; H.3's own acceptance test ("plus of a
   perfect group's classifying space is simply connected with the same integral homology; Hurewicz
   then computes its first nonzero homotopy group") is V.1's method. This follows the audit's own
   convention of listing an imported owner as a duplicate (RT.4:topological for L.1, CR.4 for L.5,
   RT.1–RT.3 for L.4).

## Most important finding

The audit is right that essentially nothing in these four roadmaps exists, and right about the two
places where it does: Tau Ceti's `K₀` of finitely generated projectives (with the universal
property, the Cartan map and `K₀ ≅ ℤ` for division rings) and Mathlib's locally constant
`rankAtStalk`, `Pic` with `ClassGroup.equivPic`, and Witt vectors. The single most consequential
check is the negative one it gets right for the right reason: **Tau Ceti has every ingredient of
Weil reciprocity (T.4) — divisor evaluation, the norm-residue product formula, disjoint-support
moving, `deg(div f) = 0` — and names the theorem in its docstrings, but never states it.** A
coarser audit would have read those file headers and marked T.4 built.
