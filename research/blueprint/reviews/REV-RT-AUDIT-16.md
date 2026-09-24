# REV-RT-AUDIT-16

**All three high-severity findings are confirmed.** Each omitted condition makes its displayed target false. The fixes restore hypotheses and indexing; they do not upgrade the existing library classifications or require replacement implementations.

Verifier: **Codex — codex-hjdg0j**, independent of AUDIT-16, REV-AUDIT-16 and RT-AUDIT-16. The red team is Codex — codex-7e92bd; its report attributes the original audit and review to claude2/2 and claude6/2. Issue [#1581](https://github.com/CBirkbeck/tauceti-explorer/issues/1581); [claim 5807324041](https://github.com/CBirkbeck/tauceti-explorer/issues/1581#issuecomment-5807324041) confirmed by [bot 5807326005](https://github.com/CBirkbeck/tauceti-explorer/issues/1581#issuecomment-5807326005). The full issue was reread after confirmation.

Repository evidence: `b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea`. Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. All source links below use these fixed revisions.

## Scope

I read the [red-team result](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/research/blueprint/redteam/RT-AUDIT-16.result.json), its [report](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/research/blueprint/redteam/RT-AUDIT-16.md), the three disputed records in the [accepted audit](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/research/blueprint/audit/AUDIT-16.result.json), the relevant sections of its [review](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/research/blueprint/reviews/REV-AUDIT-16.md), the named roadmap passages, and the pinned definitions/theorems needed to check each counterexample. All three incorrect target texts still match their copies in `data/library-coverage.json`; these are not stale findings already fixed elsewhere.

The red team's target numbers are **one-based**: Construction A target 3 is `targets[2]`; graphon target 2 is `targets[1]`; oldspace target 5 is `targets[4]`. A fixer should identify the stage and target text as well as the index.

## /1 — odd-modulus evenness and empty coordinates

**Confirmed.** The audit says “odd m never even.” The [standing convention](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/AlgebraicCodingTheory/README.md#L39) permits any finite coordinate type and [defines](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/AlgebraicCodingTheory/README.md#L79)

\[
P_m(C)=\rho_m^{-1}(C),\qquad B_m(x,y)=\frac{\sum_i x_i y_i}{m},\qquad m\ge2.
\]

Take `m=3`, an empty coordinate type and its unique additive code. The word space and inverse-image lattice both consist of the zero vector. Its only norm is zero, an even integer. This is already an integral lattice, so the counterexample does not evade an integrality hypothesis.

For a nonempty coordinate type, choose `i`. The vector `m e_i` lies in every `P_m(C)` because it reduces to zero, and

\[
B_m(m e_i,m e_i)=m.
\]

That proves the intended obstruction for odd `m`. The source roadmap [already states nonempty coordinates](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/AlgebraicCodingTheory/README.md#L347), so it needs no change.

The quadratic residue form has its own condition. Changing one integer lift from `a` to `a+mb` changes its half-norm by

\[
\frac{(a+mb)^2-a^2}{2m}=ab+\frac{mb^2}{2}.
\]

This is integral for even `m`. For odd `m`, the lifts `0` and `m` of the zero residue in a nonempty coordinate change it by `m/2`, which is nonzero modulo ℤ. Consequently the general lift-independent `q_m` and the criterion `q_m|C=0` must retain the even-modulus premise. The empty-coordinate case remains trivial; no claim that it has a nontrivial lift ambiguity is intended.

**Corrected target fragment:** for even `m`, define the lift-independent `q_m` and prove the stated evenness criterion; for odd `m` and nonempty coordinates, prove non-evenness. Explicitly retain the zero-dimensional exception, `m≥2`, and the integral/self-orthogonal context of unimodularity. Keep the complete target `absent`, the layer `not built`, and its related gluing reuse notes. The source's Type II and binary specializations are unaffected.

## /2 — finite-graph graphon compatibility

**Confirmed.** The constructor is total at zero host size; positivity is a theorem hypothesis, not an implicit typing requirement.

| Pinned statement read | Relevant content |
| --- | --- |
| [`finiteGraphGraphon`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/StepGraphon/FiniteGraph/Basic.lean#L89) | Defined for every `SimpleGraph (Fin m)`, without `0<m`. |
| [`finiteGraphGraphon_eq_const_zero`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/StepGraphon/FiniteGraph/Basic.lean#L116) | At `m=0` the graphon is the constant-zero graphon on the unit interval. |
| [`homDensity_finiteGraphGraphon`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/StepGraphon/FiniteGraph/Basic.lean#L205) | Requires `(hm : 0 < m)` and identifies graphon density with finite homomorphism density. |
| [`homDensity` and `homDensity_def`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/HomDensity/Basic.lean#L160) | Integral of the edge product over the product probability space. |
| [`homDensity_const`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/HomDensity/Basic.lean#L204) | For a constant graphon, the value is `p ^ F.edgeFinset.card`. |
| [`homDensityFin`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/DenseGraphLimits/HomDensity/Finite.lean#L99) | `Nat.card (F →g G) / |V(G)|^|V(F)|`, as a real number with total division. |

Take `F` to be the edgeless graph on one vertex and `G` the empty host. On the graphon side the edge product is 1 and its probability integral is 1, equivalently `0^0=1` in the constant-graphon formula. On the finite side there is no vertex map from a singleton to the empty set, so the value is `0/0=0`. Thus the unqualified equality fails. If the pattern is empty too, there is one empty assignment and both densities are 1; the counterexample specifically uses a nonempty edgeless pattern.

**Correction:** add `|V(G)|>0` directly to the finite-graph compatibility clause (or an unambiguous attached note), and record the exception. The [roadmap signatures](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/DenseGraphLimits/README.md#L613) and [reviewer checklist](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/DenseGraphLimits/README.md#L819) already retain `0<m`. Preserve the actual library theorem, its citation, the `tauceti` target classification and the `built` layer verdict. This fixes the audit's transcription, not a missing library theorem.

## /3 — the fixed-character oldspace sum

**Confirmed.** The preceding roadmap bullet says proper divisor levels, but the displayed formula [at line 509](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/content/tau-ceti/ModularForms/README.md#L504) omits that condition and calls its indexing exact. The audit reproduces the unrestricted formula.

For every positive `N`, it permits `M=N`, `d=1`, and the descended character is then `χ_N=χ`. The term `V_1 S_k(N,χ)` is the entire character cusp space. The pinned [`levelRaise_one_apply` and root `CuspForm.levelRaise_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Degeneracy.lean#L413) confirm that `V_1` is identity on functions and restriction on forms. Therefore the faulty sum always fills the whole ambient character space.

The implemented oldspace is correct: [`TauCeti.cuspFormsOld`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L99) takes `d*M ∣ N` **and** `M ≠ N`. Its introduction rule keeps both, and [`cuspFormsOld_one`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L146) proves the oldspace at level one is bottom.

A concrete contradiction occurs at level 1, weight 12 and trivial character. The faulty sum contains all level-one weight-12 cusp forms. Mathlib proves [that space has rank one](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean#L159), with the discriminant spanning it, so it is nonzero. The [Gamma1 membership congruences](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L129) impose no conditions modulo 1; [the level-one principal group is all of SL₂(ℤ)](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L57). The [trivial-character range description](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean#L143) also identifies that component with the ordinary level-one cusp space. This comparison is a mathematical consequence of the read definitions/theorems, not a new Lean elaboration.

The corrected intended indexing is

\[
S_k(N,\chi)^{\mathrm{old}}
=\sum_{\substack{M\mid N,\ M\ne N\\ \operatorname{cond}(\chi)\mid M}}
  \ \sum_{d\mid N/M}V_d S_k(M,\chi_M),\qquad N>0.
\]

With `M|N` and `N>0`, the added condition is equivalently `M<N`. Preserve the conductor restriction, the descended character and level/character transport maps. Merely removing `d=1` would incorrectly remove genuine lower-level restriction maps.

The audit remains `partial`, and the layer remains `partly built`. The existing [fixed-character complement/decomposition theorems](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean#L147) do not prove the conductor-indexed formula. The [character transport theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Degeneracy.lean#L784) explicitly separates character preservation from oldness, which additionally requires `M≠N`; the [supported-form range theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/AtkinLehner.lean#L162) does not choose the descended source character.

**Maintainer correction note:** correct the audit's target and record the same exact `M≠N` insertion for the existing upstream roadmap formula. Also flag the [unproved-formula docstring](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Nebentypus.lean#L35), which repeats the omitted restriction while expressly saying the formula is not proved there. This is a documentation correction; the actual oldspace definition already has the condition. Respect [PROTOCOL §15](https://github.com/CBirkbeck/tauceti-explorer/blob/b9c0f1fd7120b6a8c99ec99232b3f08fae0c62ea/research/blueprint/PROTOCOL.md#L470): retain the existing Tau Ceti owner rather than creating a second oldspace definition or replanning its roadmap. This review does not edit upstream files or pinned library code.

## Integration, validation and limits

Correct the three audit targets in `research/blueprint/audit/AUDIT-16.result.json`, keeping their current statuses and layer verdicts, and let normal audit integration regenerate `data/library-coverage.json`. No generated data were edited here. Only the two review deliverables change.

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-16.result.json research/blueprint/redteam/RT-AUDIT-16.review.json`.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-16.review.json research/blueprint/reviews/REV-RT-AUDIT-16.md`.
- Exact one-to-one coverage of /1–/3; each disputed target and its original note checked directly; all three original target texts reproduced in generated coverage.
- Each counterexample was independently derived from the stated definitions and hypotheses. These are mathematical checks, not executed Lean proofs. No Lean file changed or compiled.
- The pinned library reads used complete source trees whose Lean-file Git blob hashes were independently matched against the pinned GitHub trees in this worker session (8,482 Mathlib files and 5,477 Tau Ceti files). No absence conclusion rests on a name search here.

This is a verification of three findings, not a repetition of the red team's 203-target/460-citation audit or all 49 ownership checks. I do not endorse its broader clean claims, the full primary-source literature, or unrelated library verdicts merely by confirming these corrections. No new formalization is claimed.
