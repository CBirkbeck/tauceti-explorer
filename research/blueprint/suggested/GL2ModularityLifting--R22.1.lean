import Mathlib.RingTheory.LocalRing.Defs
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Tactic.Ring

/-!
# Suggested Lean forms: GL₂ modularity lifting, R22.1–R22.4 (GL2ModularityLifting, part R22.1)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GL2ModularityLifting`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Nothing here claims to be
formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only; the
quaternionic forms and Hecke algebras (HilbertModularVarietiesAndShimuraCurves R18.3/R18.6),
Galois representations over Hecke algebras (AutomorphicGaloisRepresentations R19.6) and the
global deformation rings (GlobalGaloisDeformations R04.4–R04.6) are recorded in the comment
block below, not elaborated.

## Signatures (comment only)

```
-- R22.1/minimal-level-data
structure MinimalLevelData (ρbar : GaloisRep F 𝔽 2) where
  D : QuaternionAlgebra F; definite : IsTotallyDefinite D; ramified : RamifiedExactly D (Σ ∪ ∞)
  U : OpenCompactOrNot D; weight : WeightModule U; ψ : HeckeCharacter F 𝒪
  𝔪 : MaximalSpectrum (HeckeAlgebra D U ψ); nonEis : ¬ IsEisenstein 𝔪; residual : residualRep 𝔪 ≅ ρbar
-- R22.1/deformation-to-hecke-map and surjectivity
def defToHecke (d : MinimalLevelData ρbar) : d.kw.unframedRing →ₐ[𝒪] d.heckeAlgebra
theorem defToHecke_trace (v) (hv : v ∉ S) : d.defToHecke (trace (d.kw.univRep (Frob v))) = T v
theorem defToHecke_surjective : Function.Surjective d.defToHecke
-- R22.2/delta-freeness-at-taylor-wiles-level
theorem auxModule_free (Q : TaylorWilesDatum n) : Module.Free 𝒪[Δ Q] (auxModule d Q)
theorem auxModule_coinvariants (Q) : coinvariants (Δ Q) (auxModule d Q) ≃ₗ[𝒪] d.heckeModule
```
-/

namespace TauCeti.ModularityLifting.SuggestedTest

/-- `R22.2/auxiliary-hecke-algebra`: the Hecke polynomial at `v ∈ Q` factors as `(X − A)(X − B)` with
`A + B = T_v`, `AB = N(v)ψ(π_v)`; the factorisation identity itself. -/
example {R : Type*} [CommRing R] (A B x : R) : (x - A) * (x - B) = x ^ 2 - (A + B) * x + A * B := by
  ring

/-- `R22.2/dyadic-twists-of-forms`: a character of order two squares to one, so `χ(Nm z) = 1` on
`(𝔸_F^∞)^×` whenever `Nm z = z²` there. -/
example {M : Type*} [CommGroup M] (χ z : M) (h : χ ^ 2 = 1) : (χ * z) ^ 2 = z ^ 2 := by
  rw [mul_pow, h, one_mul]

/-- `R22.3/patched-support`: the dimension count `1 + d + (h + j − d) = 1 + h + j` for the power
series ring over the local ring (with `d ≤ h + j`). -/
example (d h j : ℕ) (hd : d ≤ h + j) : 1 + d + (h + j - d) = 1 + h + j := by omega

end TauCeti.ModularityLifting.SuggestedTest
