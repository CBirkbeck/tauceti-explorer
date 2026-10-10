# PKG-LanglandsParameterStacks — cutoff descent and supplier checkpoint

## Current result: 10 October 2026, codex-6oGNnX

Codex (GPT-6), session `codex-6oGNnX`, continued
[issue #7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909) after
the bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099401495).
The [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099400121)
used the prescribed session. The whole issue was reread after confirmation.
Branch: `codex-6oGNnX-langlands-parameter-package`. Starting atlas commit:
`c08922e6feb5c7703d9d427dfda4263121431fec`. Exactly one job was claimed.

**Blocked checkpoint; the package remains incomplete.** The current change
adds gauge invariance, maximality and source restriction for the existing
normal wild cutoff, with proved distinguishing examples. The enhanced
consumer signatures remain unspecified in their suppliers. Completing them
requires an authorized supplier/plan repair: the issue permits only this
package and its handoff, forbids packet changes, and PROTOCOL §§3, 13 and 15
forbid empty replacement conditions and duplicate shared constructions.
This is a specification and ownership obstruction, rather than waiting for
supplier proofs to be implemented. `metadata.toml` remains absent; otherwise
the intake's output-existence test would classify this incomplete package as
complete. No packet, supplier, reader or library file was changed.

### Work added in this run

For the fixed projection η:Γ→Q and crossed cocycle c for β∘η, the existing
cutoff is U=P∩ker(γ↦(c(γ),η(γ))) in H⋊Q. The new API states and proves:

- `NormalWildCutoff.subgroup_gauge`: changing framing leaves U unchanged.
  On ker(η), the twisted gauge formula becomes conjugation by h, preserving
  the identity value. The identity fibre of c alone need not be invariant.
- `NormalWildCutoff.le_subgroup_iff`: V≤U exactly when V≤P, V≤ker(η) and
  c is trivial on V. Thus U is the largest subgroup satisfying these three
  conditions, not an arbitrary smaller killing subgroup.
- `NormalWildCutoff.subgroup_restrict`: restriction along any homomorphism
  f:Δ→Γ, with projection η∘f and wild subgroup f⁻¹(P), gives f⁻¹(U).
  Injectivity is unnecessary.

The three new Lean examples also appear in the README:

- `cutoff_gauge_twisted`: S₃ acts on itself by conjugation, η=id and c=1.
  Gauge by (01) changes the value at (12) to a nonidentity permutation,
  while leaving the fixed-projection cutoff unchanged.
- `cutoff_nontrivial_kernel`: multiplication by two on ℤ/4ℤ, with trivial
  Q and P=Γ, retains 2 and excludes 1 from U.
- `cutoff_restrict_kernel`: pulling back the identity cutoff along the
  trivial map ℤ→{1} gives all of ℤ.

The `unit`, `gauge` and `restrict` crossed-cocycle constructors now have
proofs in place of their previous `sorry` bodies. The gauge proof explicitly
uses the global homomorphism inverse lemma to avoid the namespace's distinct
crossed-cocycle inverse lemma. This lets the isolated new API checks avoid
`sorryAx`. These are useful fixtures, not a claim that the roadmap has been
implemented.

### Independently rechecked restart gates

The LP packet has 79 nodes, 140 API items and 90 tests. Its accepted review
certifies a target-level planning pass with eight planned, unclosed stages,
retaining G1–G4/G6, sixteen requests and omitted enhanced Lean signatures.
The complete statements, hypotheses, prerequisites, APIs and tests of
`LP1/derived-parameter-stack` and `LP3/mapping-approximation` were read again.
Their required signatures remain absent from the package:

| Construction | Missing API | Missing examples |
| --- | --- | --- |
| LP1 derived stack | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback` | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP3 approximation | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind` | `approx_point`, `approx_coproduct`, `approx_bad_prime` |

LP1 needs animated fpqc mapping stacks over BQ, base-point framing, the
H-quotient and enhanced perfect pullback. LP3 needs a category-valued sifted
left Kan extension from finite bases equipped with torsors, comparison to
actual mapping-stack Perf, and Ind-completion. The torsor's total set need
not be finite. An arbitrary ordinary category, a `Unit` carrier or an
unrestricted proposition does not specify either construction.

The current E5 packet is partial (22 nodes, ten gaps, sixteen requests).
Its suggested file was read in full: `SymMonInftyCat` uses `True` for the
fibration/Segal requirements, `CAlg` and `AnimatedAlg` use `Unit`, and
`IndInfty` uses `True`; stability, presentability and coherent actions also
need genuine specifications. The proposed file in open
[PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009), head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`, was checked for these consumer
needs. `HEquiv` gives homotopy-category equivalences; `SymMonData` does not
supply cocartesian lifts or the required mapping-space coherence. It also
lacks the animated quotient-stack QCoh/Perf interface. The PR was still
open and unmerged at submission preparation. This is a scoped dependency
check, not a review of that job; its merger alone would not satisfy the gate.

Read all eight LP entries in the library audit and the current upstream
AlgebraicVectorBundles and ReductiveGroups READMEs in full. Ordinary scheme
sheaves, finite locally free bundles and relative Spec do not supply the
enhanced quotient-stack categories. The read-only current revisions were
TauCetiRoadmap `3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and native Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A bounded exact-name search for
`SymMonInftyCat`, `AnimatedAlg`, `IndInfty`, `DerivedParameterStack`,
`ParameterMappingApproximation` and `ParameterSingularities` found no
replacement there. This is not an exhaustive native-library audit. Neither
read-only tree was modified or built, and no ownership move was made.

The inherited identity-component invariant, continuity, highest-weight/GIT,
bad-prime and upstream-import gates remain in the detailed worklist below.
They were not all independently re-audited in this run and must not be
treated as discharged by the new cutoff API.

### Source receipts and plan-scope question

Fresh reading used the public
[Fargues–Scholze author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf):
Definition VIII.1.1 (p.278), Remark VIII.1.2 and the proof of VIII.1.3
(pp.279–280), Proposition VIII.2.1 (p.281), the coefficient setup of
VIII.5.2 (pp.293–294), and §VIII.5.4 with Proposition VIII.5.20
(pp.311–312). Accessed 10 October 2026; SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
The cleared-source index was read; no restricted book was used. All added
descriptions are in our own words; no source passage is stored in the repo.

An additional scope question needs plan repair: LP's mapping-approximation
statement and README LP3.18 specify reductive identity components without
stating a coefficient-field or component-order restriction. The construction
in §VIII.5.4 uses the algebraically closed characteristic-ℓ setup and assumes
|π₀G| prime to ℓ before proving the tensor comparison on finite generators;
VIII.5.20 retains that setup. This reading supports that restricted scope,
not the broader formulation by itself. An authorized repair should reconcile
it with the separate integral construction cited in §X.3, including the
scope of `approx_coproduct`. No claim is made here that a broader theorem is
false, and no packet or theorem statement was silently changed.

### Validation and where to resume

- Full package `lean-check`: exit 0, zero errors, 282 warnings, all uses of
  `sorry`, zero other warnings. Available memory before launch: 100 GB.
- Isolated new cutoff API and all three examples: exit 0, no errors or
  warnings. Axiom reports for `CrossedCocycle.gauge`, `subgroup_gauge`,
  `le_subgroup_iff` and `subgroup_restrict` list only `propext` and
  `Quot.sound`, without `sorryAx`.
- LP and E5 packet checkers: zero errors and zero warnings each.
- Permitted-file intake: three files, zero problems. `git diff --check` passed.

The managed driver pins Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The Mathlib revision was checked;
the driver's Tau Ceti source has no Git metadata. No Lean server was started.
Final current package hashes:

| File | SHA-256 |
| --- | --- |
| README.md | `27b00005196bb454858ee0f83e945641723ee437bc46c0281008b94f67eef972` |
| Suggested.lean | `e564d00fb7dea0e54d0f4b1ad474c01460061267cb6414f480588087e5765bf4` |

Resume after authorized supplier and plan repairs expose genuine enhanced
contracts and reconcile LP imports, source hypotheses and the inherited
owner gates. Then reconcile all 79 nodes, 140 API items and 90 tests against
the actual exports; preserve the distinguishing fixtures, finite-image
comparison and cutoff API; complete the package; add `topic = "math.NT"`
metadata; rerun Lean and intake checks. Reassigning the package without
changing these contracts does not resolve the obstruction.

The checkpoint merged from PR #8478 during this submission is preserved
below, including its restart worklist and further predecessor links. Statements
of fresh reading and validation below belong to that earlier session unless
independently checked above. The longer inherited worklist is available at the
[starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/c08922e6feb5c7703d9d427dfda4263121431fec/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
No scratch artifact is needed to resume.

## Previous checkpoint: codex-ptf9Mu, merged in PR #8478

**Blocked checkpoint; the package is incomplete.** Codex (GPT-6), session
`codex-ptf9Mu`, claimed [issue #7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909)
on 10 October 2026. The [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099242876)
identifies this session's [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099241012).
The whole issue was reread after confirmation. Branch:
`codex-ptf9Mu-langlands-parameter-package`; starting atlas commit:
`8747873f6`.

All forty manager-priority issues were checked directly through GitHub: none
was open and labelled `state:available`. The available swarm queue contained
727 issues and no eligible top job or focus plan/package review. This focus
package was the first eligible fallback under WORKERS.md. Exactly one job
was claimed; this run neither wrote nor reviewed the accepted LP plan.

This run independently verified the enhanced supplier obstruction, reread
the two affected LP constructions and their complete API/test obligations,
checked the current E5 repair proposal, and re-elaborated the inherited
package. **Only this handoff changed.** No new signature is asserted, no
missing mathematics has been disguised as a proposition, and no general
supplier construction has been duplicated in the package.

This is a scope/dependency checkpoint, not an elapsed-time checkpoint. The
issue's instruction to change no packet and to edit only the package outputs
and its handoff prevents repairing the shared owners here. PROTOCOL §§3,
13, 15 and 20 require those owners, faithful signatures and the complete
accepted plan. A successful elaboration of the existing ordinary prototypes
cannot certify the omitted enhanced signatures. Metadata remains unwritten
because the package has not reached that standard; the intake treats the
existing README and Suggested file without metadata as an incomplete job.

## Evidence independently checked

The LP packet remains an accepted **target-level pass**, not a closed plan:
79 nodes, 140 API items, 90 tests, eight planned stages, zero closed stages,
five gaps and sixteen requests. The review explicitly preserves G3's omitted
enhanced signatures. Both the packet and the review were inspected; this run
does not replace or re-review them.

The following are two concrete, sufficient obstructions. They are not an
exhaustive audit of the 79 targets.

| LP construction | Required contract | Missing package obligations |
| --- | --- | --- |
| `LP1/derived-parameter-stack` | Animated mapping stack over BQ with prescribed W→Q; framed fibre, quotient by H, classical points, fpqc QCoh/Perf descent and perfect pullback | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback`; tests `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| `LP3/mapping-approximation` | Category-valued sifted left Kan extension on anima over BΓ, from finite bases equipped with Γ-torsors; coherent comparison with actual Perf, and enhanced Ind completion | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind`; tests `approx_point`, `approx_coproduct`, `approx_bad_prime` |

Neither construction's family name nor any of those six test identifiers
occurs in the package Suggested file. Their mathematical targets remain in
the README. The relevant LP requests explicitly name
`EnhancedDerivedSheaves:E5:abstract`, `E5:animation` and
`E5:presentability`, together with SF.1 and S.1. Adding an arbitrary ordinary
category would not specify those requested structures.

The current E5 packet is partial: 22 nodes, ten gaps and sixteen requests.
Its entire Suggested file was read. At its current definitions:

- `SymMonInftyCat` has an SSet total space but `True` fields for the projection,
  cocartesian condition and Segal condition.
- `CAlg` and `AnimatedAlg` have `Unit` carriers.
- `IndInfty` is a proof of `True`.

These declarations cannot supply the LP constructions in the table. The
obstruction is missing mathematical specifications and their faithful
interfaces, not a demand that the supplier's `sorry` proofs be implemented.
A faithful supplier prototype with admitted proofs would be usable.

[E5 repair PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
remains open at head `b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`.
Its proposed Suggested file was read at that immutable revision. Its header
explicitly omits the cocartesian/operadic axioms and higher coherence.
`HEquiv` at line 37 is an equivalence of homotopy categories. `SymMonData`
at lines 91–99 uses that weaker equivalence in its Segal field and does not
require the projection to be a cocartesian fibration. Consequently this
proposal, as it stands, is not a sufficient LP restart gate. This is a scoped
consumer check, not a review or verdict on the E5 job.

## Source and library checks

Fresh reading of [Fargues–Scholze's author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf)
checked Proposition VIII.2.1 and its proof (p.281), and §VIII.5.4 with
Proposition VIII.5.20 and its proof (pp.311–313). The first uses the animated
moduli problem in its tangent argument. The second constructs a functor into
linear symmetric monoidal presentable stable infinity-categories by left Kan
extension, with a functorial comparison to the actual mapping category. Its
free-group proof uses Barr–Beck and module-category base change. These are
substantive enhanced inputs. A finite base carrying a Γ-torsor is distinct
from a torsor whose total set is finite. The approximation denotes a category,
not a claimed representing stack.

Receipt: accessed 10 October 2026; SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`,
matching the accepted plan's source. No source passages or source file are
included in the repository. The cleared-source index was inspected; no
restricted book was used.

Read all eight LP entries in the reviewed library audit. Read current upstream
AlgebraicVectorBundles and ReductiveGroups READMEs in full as roadmap models,
and checked the AlgebraicVectorBundles Suggested declarations. Its L0–L2
ordinary sheaf, finite locally free and relative-Spec interfaces do not provide
the animated quotient-stack Perf contract. ReductiveGroups provides algebraic
group foundations rather than the missing enhanced category contract.

Current read-only revisions:

- TauCetiRoadmap: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
- Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

An exact-name search through all current roadmap and Completed directories
and the current native library found no `SymMonInftyCat`, `AnimatedAlg`,
`IndInfty`, `DerivedParameterStack`, `ParameterMappingApproximation` or
`ParameterSingularities`. This is a bounded name check, not a claim that
alternative interfaces were comprehensively ruled out. The read-only trees
were never modified or built.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`SSet.Quasicategory` in `AlgebraicTopology/Quasicategory/Basic.lean` and
`CategoryTheory.Ind` in `CategoryTheory/Limits/Indization/Category.lean`.
The former supplies the inner-horn carrier. The latter takes an ordinary
category and constructs ordinary Ind objects in set-valued presheaves. Those
statements do not assert the enhanced linear and coherent interfaces above.
The managed driver identifies Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`; its Tau Ceti tree has no Git
metadata, so this run does not independently certify that revision.

## Restart worklist

1. Repair the **shared E5 interfaces and their suppliers**, outside this
   package job, to express stable symmetric monoidal infinity-categories,
   animation, enhanced Ind completion and coherent functors, together with
   quotient-stack QCoh/Perf descent from SF.1 and S.1. State the comparisons
   to the actual constructions; homotopy-category equivalences alone do not
   specify them. Preserve the distinction between framed and unframed
   parameters and between finite bases and finite total torsors.
2. Reconcile the LP plan's requests and signatures with those actual exports.
   Its accepted G1, G4 and G6 obligations also remain: highest-weight owner
   extensions, finite-Q relatively discrete reconstruction continuity, and
   unconditional field-GIT/identity-component invariant ownership. This run
   did not redo those separate supplier investigations.
3. Complete the package's signature/API/test inventory against all 79 targets,
   140 API entries and 90 tests; keep the mathematical README consistent with
   the reconciled plan. Supply metadata only with the complete package, then
   re-elaborate it and run the submission checks.

The detailed inherited obligations and preserved proof receipts are available
in the [preceding handoff at the starting atlas commit](https://github.com/CBirkbeck/tauceti-explorer/blob/8747873f6/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
That note contains the 42-name absence screens, seven enhanced-family
obligations, SR.6 imports, identity-component invariant counterexamples,
nonflat reduction comparison, finite-image calculation and normal wild cutoff.
All existing package code and prose, including those proved fixtures, remain
unchanged. Earlier workers' reading/proof receipts are not presented as fresh
checks by this run. No scratch artifact is needed to resume.

Reassigning this package while the supplier contracts remain unchanged cannot
resolve these obligations. The next productive action is an authorized
supplier/plan repair; no owner move was made here.

## Validation in this run

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, zero errors, 285 warnings, all uses of `sorry`, zero other warnings.
  Available memory before launch was 101 GB. This checks the existing
  signatures, not the absent enhanced constructions or tests.
- `python3 scripts/check_blueprint.py` on LP and E5: zero errors and zero
  warnings for both. Their explicit gaps are reported rather than rejected.
- Permitted-file intake and `git diff --check`: passed for this handoff.

No Lean server, library build, dependency update or cache download was started.
Only this job branch was created and will be committed/pushed. The PR is a
checkpoint and must not be described as a completed roadmap package.
