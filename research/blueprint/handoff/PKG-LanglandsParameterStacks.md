# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-MLFfva`, 10 October 2026.
Branch: `codex-MLFfva-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6094936904)
confirms this session's claim. The manager-priority list had no available issue;
this available focus package followed WORKERS' fallback order. Only this job
was claimed. This submission is an incomplete checkpoint, not a completed package.

## What changed and what must happen next

This session changes only this handoff. Independently verified the accepted LP
consumer, the actual IHG continuity supplier, current upstream SR.6 and IHG
interfaces, E0/E5 signatures and the actual E5 PR head. The authoritative LP
input and both package artifacts are unchanged. The previous checkpoint's
current-roadmap receipt is superseded: the supplied read-only upstream tree
is now at `cd03e06852a13216ad246d0623492c4beac39af2`, whose latest change types
SR's carriers and targets. Native Tau Ceti remains at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

**Resume after an authorized supplier/consumer repair, not another elaboration
of these unchanged artifacts.** The sufficient evidence for stopping is the
explicit unresolved mathematical contract G4, together with G1/G6's owner
registration and dependency reconciliation. Missing implementations of adequately
specified theorems are not a stopping condition. E5's missing faithful signatures
are an additional package-completeness deficit, not the sole reason to stop.

The issue authorizes the package's three files and this handoff, and explicitly
requires that plan mistakes be described here rather than changing a packet.
PROTOCOL sections 3, 13, 15 and 20 require exact suppliers, faithful signatures,
single ownership and a complete package. The owner extensions and LP prerequisite
reconciliation below require edits outside these four authorized paths. Repeating
them as LP foundations or asserting the desired result as an input does not
repair the owner contracts. No ownership move is made by this checkpoint.

### Verified continuity blocker and its repair contract

Read every field of LP's
`LP2:semisimple-characters/characteristic-zero-continuity`, G4 and its IHG request,
and the complete IHG `IHG.1/reductive-valued-continuity` node.

| Interface | Actual scope inspected | Missing output needed by LP |
| --- | --- | --- |
| Atlas IHG.1/reductive-valued-continuity | Split **connected** reductive H/Z; profinite source; algebraically closed characteristic-zero field with a rank-one valuation topology. | H-conjugation on J=H⋊Q with prescribed finite quotient, and preservation of locally finite-type Z_l coefficient modules for the relatively discrete condensed convention. |
| Current upstream IHG, README §0.7; `ReductivePseudocharacter.IsContinuous`, `continuous_ofRepresentation`, `continuous_dense_ext` in Suggested.lean | Continuity of invariant-coordinate evaluations; a continuous representation with continuous invariant evaluation yields a continuous pseudocharacter; dense equality extends with Hausdorff coefficients. | The converse reconstruction-continuity statement in the preceding row. The forward constructor cannot justify it. |
| FS Proposition VIII.3.8, printed p.290, with the coefficient convention in Chapter VIII/§VIII.1, pp.277–278 | The local classification requires maps of condensed sets with relatively discrete coefficients; its proof invokes finite anchors from Lafforgue. | A supplier contract implementing that coefficient argument, rather than replacing condensed continuity by arbitrary valuation continuity. |

An owner repair must export the following statement and its genuine coefficient
interface, then an authorized LP repair must replace the presently insufficient
supplier reference:

- Start from a split pinned H, finite Q acting through the specified algebraic
  automorphisms, J=H⋊Q, a prescribed source-to-Q map, and the actual invariant
  coordinate algebras for **H-conjugation**, not J-conjugation. Retain generalized
  reductive algebraic reconstruction as the algebraic input.
- From compatible relatively discrete condensed invariant evaluations, obtain
  the condensed semisimple parameter with that projection. On compact inertia,
  the finite-anchor coordinate lifting must preserve locally finite-type Z_l
  coefficient modules. The discrete Weil degree direction is handled by cosets
  and the crossed law. No finite image of the full Weil group is assumed.
- State the rank-one-valued specialization separately, with its actual topology;
  it cannot replace the previous coefficient conclusion. Include restriction,
  coefficient transport and conjugacy independence of the resulting maps.

Useful discriminating checks for that authorized repair are already required
by LP: Q=1 recovers the connected case; a nontrivial finite action retains the
prescribed Q projection and twisted gauge formula; infinite-image continuous
inertia characters into Z_l-units and unramified characters with infinite
cyclic Frobenius image remain permitted. These are repair requirements, not
newly proved results or new targets of this package.

Freshly fetched Lafforgue's *Chtoucas pour les groupes réductifs et
paramétrisation de Langlands globale*, arXiv:1209.5352v10. Proposition 11.7
starts on printed p.143 and its final continuity proof is on pp.146–147.
The proposition admits disconnected H with split neutral component, but uses
continuous functions valued in a finite extension E of Q_l. The proof obtains
coordinate surjectivity by a closed anchor orbit and reductivity of its
centralizer. This supplies the disconnected anchor argument; the ordinary
E-valued statement alone is not the requested general relatively discrete
condensed interface. FS's proof uses that argument in its local setting.
No source error or new erratum is asserted here.

## Enhanced signatures and current upstream ownership

Read the full E0 and E5 suggested files. E0's genuine replete/weakly-contractible
prefix expressly omits the infinity-category operations. E5's checked-in
`SymMonInftyCat` has True-valued projection, coCartesian and Segal fields;
`CAlg`/`AnimatedAlg` are Unit-valued. Its Ind, stable, presentability and
coherent-action sketches do not encode the corresponding conditions.

Freshly inspected [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009),
which remains open at `b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`.
Its `SymMonData` has an actual projection but only a homotopy-category Segal
comparison. `PresentableData` records cardinal/generator data without the full
accessibility and small-colimit conditions. `RightTensoredData` expressly omits
coherent-action and colimit-preservation axioms; module comparison is on
homotopy categories. `CoherentActionData` records a family without the needed
higher coherence. The head improves the quasicategory carriers but does not
supply the whole LP interface. This was dependency inspection, not an independent
review or a second claimed job.

Read FS Definition VIII.5.4, pp.294–295, and the definition and bar proof in
§VIII.5.2/Proposition VIII.5.8, pp.295–296. The good-filtration truncations act
on IndPerf and need not preserve Perf. The bar argument uses enhanced tensor,
module and duality operations. Keep dualizable quotient-stack perfect complexes
distinct from compact objects of its unrestricted derived category; they can
differ in positive characteristic. Ordinary bundle tensors and a triangulated
homotopy category do not express these interfaces.

Read current **ReductiveGroups** and **AlgebraicVectorBundles** READMEs in full,
and SR.6.1–SR.6.3 target statements. Read the actual native
`SheafOfModules.tensorProduct`/`tensorProductIso` and Hopf
`pointsFunctor`/`mapPoints` statements, plus pinned Mathlib
`SSet.Quasicategory` (the inner horn-filling predicate). The ordinary sheaf
tensor is sheafification of the presheaf tensor; the Hopf points functor is
coefficient-algebra functorial. Neither exports animated quotient-stack Perf
or a finite-Q condensed reconstruction theorem. The reviewed LP library audit
was read separately. A bounded search of the current native/upstream sources
found no replacement for the indicated enhanced carriers; this is not a full
library audit. No Lake command ran in the current read-only trees.

The existing SR.6 ownership table and the remaining seven-family signature
inventory below remain the continuation worklist. Current SR.6 imports its
arithmetic-Frobenius finite-wild model and specifies the ordinary cocycle scheme,
excursion algebra and invariant comparison. Preserve LP's continuous/condensed,
arbitrary-group and enhanced extensions; migrate the common ordinary work to
owner citations when an authorized plan repair reconciles the target inventory.
Do not reconstruct those current upstream targets inside LP.

## Fresh validation and receipts

- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`
  exited 0 with zero errors/warnings: 79 nodes, 140 API items, 90 tests,
  31 planets, 31 baseline declarations, five gaps, sixteen requests, eight
  planned stages and zero closed stages. Read the accepted review's actual
  notes: it accepts a target-level planning pass retaining those gaps.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`
  exited 0: zero errors, 276 warnings, all `declaration uses sorry`, and no
  other warnings. Available memory before compilation was 107 GB. The managed
  pinned build is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` /
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No check remains running.
  Elaboration checks only the signatures present, not missing targets or proofs.
- A fresh nested-comment/line-comment-stripped scan found none of the seven
  previously recorded target families' 35 API names or 23 test names in active
  Lean text. The exact inventory remains below. No complete signature audit
  is claimed by this limited scan.
- `python3 research/blueprint/intake.py check-files
  research/blueprint/handoff/PKG-LanglandsParameterStacks.md` passed with one
  file and zero problems. `git diff --check` passed. This submission changes
  only this handoff; metadata remains absent. Add
  `topic = "math.NT"` when a complete package can be submitted.

Source receipts for public files fetched/read on 2026-10-10:

| Source | URL | SHA-256 |
| --- | --- | --- |
| Fargues–Scholze | [Author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| Lafforgue, arXiv v10 | [arXiv PDF](https://arxiv.org/pdf/1209.5352) | `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295` |

The unchanged LP, package and E0/E5 artifact receipts match those in the retained
record below. The inspected atlas IHG packet has SHA-256
`1d06c30103ac2c17a0c2964e2c7721d66c5e939b6b9898f7441d9abdf01a782b`.
No baseline declaration, source-error verdict or independent review was changed.
The library index was read; no restricted source was needed or copied. All
mathematical descriptions here are in our own words. Everything needed by the
next worker is here and in the repository; scratch files are disposable.

---

# Retained predecessor record — codex-xhVuQP

This historical record preserves the exact omissions and all remaining work.
Its validation and current-upstream receipts describe that earlier session;
the fresh receipts and narrower audit claims above take precedence.

# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-xhVuQP`, 10 October 2026.
Branch: `codex-xhVuQP-langlands-parameter-stacks`.
[Bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6094628032)
confirms this session's [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6094627033).
None of the manager-priority issues was available when selected. There was no
available top job or finished-plan focus review; this available focus package
followed WORKERS' fallback order. Only this job was claimed.

## Outcome and resumption gate

**Incomplete; blocked by owner interfaces and accepted-plan reconciliation
outside this job's editable files.** This submission changes only this handoff.
The existing README and Suggested.lean are preserved. The freshly elaborated
Suggested.lean has zero errors and 276 warnings, all `declaration uses sorry`.
That result covers the signatures present, not the enhanced constructions missing
from the file. No proof or implementation is certified.

The next effective action is an authorized owner repair, followed by package
completion. Do not resume merely because a supplier PR merges or its review
status changes: check that the actual interfaces below have been exported.
No proof of an admitted supplier theorem is required before prototyping its
consumer. Faithful mathematical structures and signature contracts are required.

| Owner action | Minimum interface before the LP consumer can be completed |
| --- | --- |
| EnhancedDerivedSheaves E0/E3/E5 | Quasicategorical mapping/limit operations; symmetric monoidal structure with actual coCartesian and Segal conditions; stable structure and exact functors; enhanced Ind, compactness, presentable modules, coherent actions and animation. Homotopy-category equivalences alone do not express these contracts. |
| SchemeAndStackFoundations SF.1 and SchemeKTheoryOperations S.1 | Animated fpqc quotient-stack descent and enhanced QCoh/Perf, dualizability, perfect pullback, and compatible tensor/module comparisons. Ordinary finite locally free sheaves alone are insufficient. |
| Accepted LP plan | Import the targets now owned by current upstream SmoothRepresentationsOfLocalGroups SR.6.1–SR.6.3, preserving the LP extensions listed below; reconcile G1/G4/G6 owner exports and edges. |

Issue #7909 allows only the three package files and this handoff and explicitly
says “Change no packet; if the plan has a mistake, describe it in the handoff
note.” PROTOCOL §§13, 15 and 20 require faithful signatures, shared ownership
and agreement with the accepted plan. Defining the general enhanced foundations
again inside LP would break those boundaries. The stopping reason is the scope
boundary, not the eight-hour limit or missing proofs.

The accepted LP review explicitly accepts a target-level planning pass, with
its open gaps retained. The unchanged input has 79 nodes, 140 API items, 90 tests,
31 planets, 31 baseline declarations, eight `planned` stages, zero closed stages,
five gaps and sixteen requests. Its structural check passes; that does not close
those mathematical and signature gaps.

`metadata.toml` remains absent. The inspected `issues.deliverables_complete`
first requires every output path and has no additional package-coverage gate.
Adding the final path would classify this incomplete package as complete. Once
completion is justified, use `topic = "math.NT"`.

## Concrete missing signatures

This session read the statements, hypotheses, prerequisites, APIs and tests of
these seven targets and checked both package files. The README contains their
35 API names and 23 test names. Their root constructors and the corresponding
Lean declarations/examples remain absent from Suggested.lean. This is a
verified minimum deficit, not a full signature-fidelity audit of the file.

| Target | Missing API items | Missing tests | Required specialization |
| --- | ---: | ---: | --- |
| LP0 extended wild parameters | 4 | 3 | Admissible enhanced complex parameters, algebraic component-group denominator, wild restriction and naturality; RG2.5. |
| LP1 derived parameter stack | 5 | 3 | Animated mapping stack over BQ, framing, quotient descent and enhanced perfect pullback. |
| LP2 excursion presentation: categorical Hecke datum | 5 | 3 | Coherent finite-set exact monoidal functors, unit/fusion, equivariant endofunctors and enhanced operator centre. |
| LP3 good-filtration t-structure | 5 | 4 | Stable IndPerf, highest-weight tests, truncations and tensor compatibility. |
| LP3 induced perfect complexes | 5 | 4 | Enhanced quotient-stack Perf, stable retract closure, Ind and module comparison. |
| LP3 mapping approximation | 5 | 3 | Category-valued sifted left Kan extension from finite bases with Γ-torsors and enhanced linear tensor products. |
| LP4 universal representation bundles | 6 | 3 | Associated perfect bundles, coherent Weil action, exact tensor action, finite-set fusion and coefficient pullback. |

Exact names and tests to recover, grouped by accepted target:

- `LanglandsParameterStacks:LP0/extended-wild-parameters`. API: `ExtendedWildParameter`, `WildParameterClasses`, `restrictEnhancedParameter`, `ExtendedWildParameter.forget`. Tests: `extended_wild_unramified`, `extended_wild_conjugacy`, `extended_wild_forget`.

- `LanglandsParameterStacks:LP1/derived-parameter-stack`. API: `DerivedParameterStack`, `DerivedParameterStack.framed`, `DerivedParameterStack.forgetFraming`, `DerivedParameterStack.classicalPoints`, `DerivedParameterStack.perfectPullback`. Tests: `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge`.

- `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`. API: `CategoricalHeckeDatum`, `CategoricalHeckeDatum.unit`, `CategoricalHeckeDatum.reindex`, `CategoricalHeckeDatum.create`, `CategoricalHeckeDatum.annihilate`. Tests: `hecke_empty_set`, `hecke_fold`, `hecke_zero_category`.

- `LanglandsParameterStacks:LP3/good-filtration-t-structure`. API: `goodFiltrationTStructure`, `goodFiltrationTStructure.connective_iff`, `goodFiltrationTStructure.coconnective_iff`, `goodFiltrationTStructure.tensorConnective`, `goodFiltrationTStructure.homotopy`. Tests: `good_torus`, `good_zero`, `good_induced`, `good_shift_sign`.

- `LanglandsParameterStacks:LP3/induced-perfect-complexes`. API: `InducedPerfectComplexes`, `InducedPerfectComplexes.pullback`, `InducedPerfectComplexes.retract`, `InducedPerfectComplexes.moduleFunctor`, `InducedPerfectComplexes.minimal`. Tests: `induced_point`, `induced_trivial_group`, `induced_retract`, `induced_not_all_bad_prime`.

- `LanglandsParameterStacks:LP3/mapping-approximation`. API: `ParameterMappingApproximation`, `ParameterMappingApproximation.compare`, `ParameterMappingApproximation.finiteTorsor`, `ParameterMappingApproximation.leftKan`, `ParameterMappingApproximation.ind`. Tests: `approx_point`, `approx_coproduct`, `approx_bad_prime`.

- `LanglandsParameterStacks:LP4/rep-action-on-perf`. API: `UniversalRepresentationBundle`, `UniversalRepresentationBundle.unit`, `UniversalRepresentationBundle.tensor`, `UniversalRepresentationBundle.reindex`, `UniversalRepresentationBundle.act`, `UniversalRepresentationBundle.baseChange`. Tests: `rep_bundle_unit`, `rep_bundle_at_parameter`, `rep_bundle_tensor`.

For the good-filtration construction, connective means D^{≤0} on IndPerf;
truncations need not preserve Perf. Universal representation bundles exist
before, and without the prime restriction of, the good-prime generation theorem.
The mapping approximation is a category, not a newly represented stack: the
base set is finite but the total Γ-torsor need not be finite. Preserve the bad-prime
PGL_ℓ, Γ = ℤ exclusion of the unit skyscraper. For extended wild parameters,
restriction of the enhancement need not remain irreducible; an arbitrary
abstract quotient representation does not supply admissibility or its algebraic
identity-component denominator.

## Fresh supplier and source evidence

Read the entire checked-in E0 and E5 suggested files. E0 supplies its meaningful
repleteness/weak-contractibility prefix and expressly omits the other 66 node
signatures, including the general infinity-category operations. E3 is within
its E0–E4 scope; no separate E3 suggested file is provided. E5's `SymMonInftyCat`
uses `True` for its projection, coCartesian and Segal fields; `CAlg` and
`AnimatedAlg` are `Unit`. Its stability, compactness, Ind, presentability and
coherent-action predicates similarly do not express the required conditions.
The E5 packet describes genuine mathematical targets; these prototypes do not
export their faithful signatures.

Freshly inspected [PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
of owner issue #720: it is still open at head
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`. Read the actual head's definitions,
not just the preceding handoff. `SymMonData` has an actual projection but its
Segal field is an equivalence of homotopy categories. `PresentableData` records
a cardinal and generators without accessibility/all-colimit conditions.
`RightTensoredData` explicitly omits coherent action and preservation axioms;
module base change has a homotopy-category comparison. `CoherentActionData`
records a family but omits the higher coherence. Its genuine animated
quasicategory carrier improves on the checked-in file without filling all
these contracts. This is dependency inspection, not a second job or an
independent review of the owner.

Re-fetched Fargues–Scholze, [*Geometrization of the local Langlands
correspondence*](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
on 2026-10-10. SHA-256:
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Read Proposition VIII.2.1 and its proof, printed p.281, and the induced-perfect
construction and bar comparison in §VIII.5.2, Proposition VIII.5.8 and its proof,
pp.295–296. These use animated deformation theory and stable enhanced
quotient-stack perfect complexes, respectively. The bar proof needs geometric
realization, tensor products, duals and module-category comparisons. An ordinary
category of vector bundles cannot supply these structures. Also read the
surrounding t-structure warning, pp.295–296: replacing IndPerf by Perf changes
the truncation claim. No restricted source was needed; no source passage is
stored here.

Read current upstream ReductiveGroups and AlgebraicVectorBundles READMEs in
full, the SR.6.1–SR.6.3 target statements, and SR's crossed-cocycle Suggested.lean
block. Current read-only commits remain TauCetiRoadmap
`0a56d1b5303c26887a4042db834f46d9079ac593` and native Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Inspected the native `SheafOfModules.tensorProduct` and `tensorProductIso`
statements: they construct the sheafification of the ordinary presheaf tensor
product. They are useful imported infrastructure, not enhanced quotient-stack
Perf. A bounded search across current native Lean sources and upstream suggested
files for stable-infinity, animated and the missing carrier names found no
replacement interface. This is not an exhaustive library audit. Read the LP
entries of the reviewed `data/library-coverage.json` separately from these
current-tree checks. No new baseline declaration is asserted.

## Ownership reconciliation and work to preserve

The README already attributes the following common mathematics to current
upstream SR.6. Preserve that boundary when correcting the accepted LP plan and
migrating the ordinary local prototypes to owner imports.

| LP target or shared portion | Existing upstream supplier | LP addition that remains |
| --- | --- | --- |
| LP0 functorial cocycles | SR.6.1 crossed-cocycles | Restriction and continuous/condensed extensions beyond the imported API. |
| LP0 discretization/choice comparison | SR.6.1 finite-wild-discretization and ell-adic-extension | Relatively discrete comparisons; geometric degree negates arithmetic degree. No integral framed choice independence over ℤ[1/p]. |
| LP1 integral cocycle scheme | SR.6.1 finite-wild-representability | Specialization to the owner dual group and condensed/classical point comparisons. |
| LP2 excursion ring and coefficient identities | SR.6.3 excursion-algebra | Arbitrary-Γ extensions and enhanced Hecke-operator realization. |
| LP2 universal homeomorphism and integral invariant-ring comparison | SR.6.3 excursion-invariant-comparison | IndPerf colimit theorem, higher cohomology and stronger coefficient base change. |

SR.6.2 supplies fixed-depth wild strata and centralizer input. Its finite number
of strata is for one fixed cutoff, not all depths. It does not supply LP's
stable enhanced generation, t-structure, induced-perfect or universal-bundle
interfaces. AlgebraicVectorBundles owns ordinary vector-bundle operations;
SF.1/S.1/E5 retain the enhanced foundations. No ownership move is made here.

Preserve the existing ordinary Hopf-point, affine-scheme and free-cocycle
invariant-colimit work, keeping coaction invariants distinct from H(R)-point
invariants. Quotient descent needs P normal and contained in the action kernel.
Finite inertia image does not mean finite full Weil image. Wild restrictions
need an extending section with the prescribed projection and dual-group gauge
conjugacy. Keep the actual embedded invariant dual centre as the enhancement
denominator. The ordinary and split GL_n shadows must stay identified as such.
The existing geometric-degree adapter negates arithmetic degree and keeps the
same inertia kernel; its Tate character gives q at arithmetic Frobenius and
q⁻¹ at geometric Frobenius. It does not invert the source group or construct a
second Weil carrier.

## Remaining completion work

1. Supply the owner contracts above and reconcile the accepted LP packet with
   SR.6 ownership. Recover the seven demonstrated missing signature families,
   then inspect every remaining target/API/test for fidelity. Presence of a name
   or an elaborating shadow is not sufficient.
2. Preserve G1's structural reductive, admissible-complex and general
   highest-weight extensions. Highest-weight theory belongs to
   ReductiveGroupsIntegralRepresentationsPartII. General GIT needs one owner
   shared with the deformation-ring direction; do not invent RG2.6 as an owner.
3. Resolve G4's characteristic-zero finite-Q relatively discrete continuity
   contract. The finite-coordinate discrete argument and IHG's connected
   profinite theorem do not supply this extension. Do not use Quast Theorem 3.8
   without resolving the accepted IHG E13 compactness objection.
4. Resolve G6's external field-GIT/owner-edge reconciliation. Generic IHG
   reconstruction must not import all of LP3's good-prime generation branch;
   point it at the exact regular-function and unconditional field inputs.
5. Keep G2's boundary: FS proves discretization independence for the
   ℓ-torsion-free excursion quotient. Full torsion-sensitive independence at
   arbitrary bad primes is an open source question, not a theorem to invent.
6. Complete the remaining condensed coefficient, derived cochain/duality,
   cotangent/support, reductive parabolic/Levi, invariant quotient,
   pseudocharacter, good-filtration/generation, mapping/gerbe and LP4 module
   signatures. The Chapter X action/application targets remain owned by
   ExcursionOperatorsAndSpectralAction; generic reconstruction belongs to IHG.
7. Retain the package's two existing source/owner corrections: the
   characteristic-two swapping example obstructs the prime-to-characteristic
   order of P (FS VIII.5.18, p.308), and Lafforgue Proposition 10.8 needs
   pp.138–139. These are inherited corrections, not newly verified findings in
   this session.
8. Once the whole package meets §20, add metadata, run `lean-check` and the
   scoped submission checks, and submit the completed package for independent
   review.

## Validation in session codex-xhVuQP

- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`:
  exit 0, zero errors and zero warnings. The accepted packet is unchanged.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, zero errors, 276 warnings, all `declaration uses sorry`, and no other
  warnings. Available memory before compilation: 113 GB. The wrapper completed;
  no compilation remains running. Managed compilation baseline: Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- README and suggested file remain 182035 and 97247 bytes. The seven-family
  inventory above was freshly checked. This session does not claim a fresh
  verification of every pinned declaration, every source or every signature.
- Scoped intake `check-files`: one handoff file, zero problems.
  `git diff --check`: passed. Only the issue-authorized handoff changed.

SHA-256 receipts for unchanged inputs/artifacts, relative to
`research/blueprint`:

| File | SHA-256 |
| --- | --- |
| packets/LanglandsParameterStacks.json | `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087` |
| suggested/EnhancedDerivedSheaves--E0.lean | `81fa4b84036cb09987d5421e0c26f39533777b3ca1be14e605f0d4cacb4864c7` |
| suggested/EnhancedDerivedSheaves--E5.lean | `e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c` |
| packages/LanglandsParameterStacks/README.md | `b48575f35cafaf98bed09c34cb2d39fa082d6c7af8c183a94dfecf33c447b257` |
| packages/LanglandsParameterStacks/Suggested.lean | `5aac601d7d9418e78389b142acf509675639cbbdb4e30459ba422b54527c4d80` |

No packet, supplier, package or read-only-tree file was edited. No Lake build,
update/cache command or language server ran. All continuation information is
here and in the existing artifacts; no scratch file is needed.
