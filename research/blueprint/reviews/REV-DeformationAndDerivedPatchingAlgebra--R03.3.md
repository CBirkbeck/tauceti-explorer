# Independent review of R03.3

**Verdict: accepted as a complete planning pass; coverage remains planned, not closed.**

Job: `REV-DeformationAndDerivedPatchingAlgebra--R03.3`, issue #6274. Reviewer:
Codex, session `codex-aauLVX`, 2026-10-10. The input was written by session
`codex-EQuxOZ` for #6322 and merged in #8587. This reviewer did not write it.

The packet's mathematical statements and its corrected prerequisite chains are
sound at the stated planning level. Acceptance does not close its eight recorded
gaps or four supplier requests. PROTOCOL sections 0 and 3 and this review issue
permit that distinction: every target is represented, and chains may terminate
in a precise recorded gap. No node is claimed to be implemented.

## Inventory and checks

| Item | Result |
| --- | --- |
| Nodes inspected individually | 57: 4 definitions, 49 lemmas, 4 theorems |
| Per-node review | 33 verified, 24 corrected, 0 added, 0 unverifiable |
| Original baseline citations | 55 confirmed at the pinned commit; 0 removed |
| Native prerequisites added and confirmed | 5; final baseline contains 60 declarations |
| Definition API | 17 entries, including 4 added in this review |
| Definition tests | 12, three per definition |
| Planets | 6 |
| Sources inspected | 6 public PDFs; hashes agree with the packet |
| Source issues | 2 independently confirmed misprints |
| Coverage | R03.3 planned; no closed stage |
| Open work | 8 gaps and 4 supplier requests |

Each node has its own finding in `review.checked`. All declarations retain
`implementationStatus: unchecked`. The existing fine-grained inventory was
checked rather than replaced with another decomposition.

`python3 scripts/check_blueprint.py` reports zero errors and zero warnings.
The source-issue field and source-version checks used by the submission checker
also report zero errors. `git diff --check` passes. The revised suggested file
elaborates through `lean-check` at the shared pinned build with exit code 0 and
only declaration-uses-`sorry` warnings. Its examples are planned mathematical
tests with placeholder proofs; elaboration does not prove those tests.

## Source verification and corrections

The inspected editions are recorded in `sources` and `sourceVersions`, with URLs,
inspection date and SHA-256. Stacks locators use chapter-prefixed numbering and
printed PDF pages. Calegari–Geraghty uses one-based PDF pages; Kisin uses printed
journal pages. Every statement and source description is in the workers' own
words.

The [Commutative Algebra PDF](https://stacks.math.columbia.edu/download/algebra.pdf)
supplies the regular-sequence, depth, finite-resolution, CM and dimension
arguments. The [More on Algebra PDF](https://stacks.math.columbia.edu/download/more-algebra.pdf)
supplies Koszul comparisons, Cohen lifting, completion and relative Tor inputs.
The [Divided Power Algebra PDF](https://stacks.math.columbia.edu/download/dpa.pdf)
supplies the Tate obstruction and absolute CI criteria. The following are
locator corrections, not errors in their mathematical statements:

| Node | Correction |
| --- | --- |
| `regular-generators-iff-dimension-drop` | Stacks10.104.2, tag02JN, is on p.250. |
| `finite-free-resolution` | The finite-free/projective resolution results are10.109.6–7, pp.262–263, rather than10.109.7–8. |
| `minimal-resolution-pd` | The minimal resolution endpoint result is10.109.8, tag065R, p.263, rather than10.109.9. |
| `regular-quotient-pd-change` | The former10.102.6 reference concerns rank. Replaced it with10.102.2, tag00MT, pp.243–244, and the common-regular-element reduction in the proof of10.111.1, tag090V, p.268. |
| `completion-depth` | The ring completion statement is15.44.2, tag07NW, p.111. Added the module formula10.163.1, tag0338, pp.452–453, and exact completion10.97.1–3, tags00MA–00MC, pp.226–227. |
| `regular-sequence-ideal-faithfully-flat` | Separated10.68.5, tag00LM, p.161, from the final descent step of23.7.6, tag09PX, pp.18–19; each now cites its own source document. |
| `depth-finite-action` | Separated Kisin's p.1159 argument from10.72.11, tag0AUK, p.174. |
| `support-dimension-finite-action` | Separated Kisin from10.112.4, tag00OK, p.269. |
| `ci-cohen-macaulay` | Separated23.8.5, tag09Q3, pp.21–22, from10.104.2, tag02JN, p.250, and10.163.3, tag045J, p.453. |
| `regular-local-graded-polynomial` | Added the precise relation-growth source10.58.10, tag00K3, pp.137–138; the formal comparison remains a gap. |

[Calegari–Geraghty, §6, Lemmas6.1–6.2, PDF pp.88–89](https://www.math.uchicago.edu/~fcale/papers/CG.pdf)
was checked for the finite ambient module in the submodule depth bound and the
regular-local projective-dimension argument. The packet retains that finiteness
hypothesis. Its edition is now identified as the author-hosted publisher-formatted
copy, DOI10.1007/s00222-017-0749-x.

[Kisin, §3.3, Lemma3.3.4, printed p.1159](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf)
was checked for both the equal-dimensional domain faithfulness statement and
the regular-ring projectivity statement. In the local completion argument the
factor over a target prime is a nonzero direct summand of a free module over the
completed base. Its faithful base action and the finite integral target then
give equality of local dimensions. Equality of global dimensions alone is not
used as an unexplained equality at arbitrary localizations.

[Khare–Wintenberger, §9.1.2, Proposition9.2(II)–(III), pp.82–83, and §9.1.3,
Proposition9.3(III), pp.88–89](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf)
was checked in the public author copy. Its regularity application after
inverting the residue characteristic does not establish integral regularity.
The packet keeps the domain and CM hypotheses needed for integral statements.

Both existing source findings are confirmed: the nonmathematical fourth item of
[23.8.3, tag09Q1, p.20](https://stacks.math.columbia.edu/tag/09Q1), and the mismatched
kernel-generator index in the completed quotient display of
[23.8.1, tag09PZ, p.19](https://stacks.math.columbia.edu/tag/09PZ). Their corrections
do not change the packet's hypotheses. No new source error was found; the native
associated-prime convention issue below is a translation issue in the plan.

## Baseline and mathematical corrections

All baseline statements were read, with their namespace and surrounding
variables, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti baseline
is `f790474821cf4256814db967cb154e7af3d0c369`. There were no missing or renamed
original declarations. One description was corrected:
`CategoryTheory.Abelian.hasProjectiveDimensionLT_iff` requires vanishing at all
Ext degrees at or above the bound, rather than a single chosen degree.

Five native declarations were added as direct prerequisites:

- `Module.FaithfullyFlat.lTensor_injective_iff_injective` and
  `Module.FaithfullyFlat.nontrivial_tensorProduct_iff_right` supply the two
  faithful reflection steps.
- `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot` and
  `Submodule.le_of_le_smul_of_le_jacobson_bot` supply the precise Nakayama inputs.
- `CategoryTheory.ProjectiveResolution.extAddEquivCohomologyClass` computes the
  endpoint Ext obstruction using the actual projective resolution.

The middle Ext exactness declaration was added to `depth-syzygy-strict`. Native
finite covers were made direct inputs of `syzygy-depth-bound`,
`regular-local-finite-pd` and `relative-flat-module-pd`. Native Nakayama was made
direct at the minimal-generator, conormal-lifting, nested-ideal, minimal-endpoint
and fibre-freeness uses. The conormal criterion is now a direct input of
`flat-local-ci`.

The important closure correction is in `syzygy-depth-bound`: its depth inequality
uses any finite initial segment of finite free covers and does not require
finite projective dimension. Removing the bounded-resolution prerequisite lets
the regular-local finite-pd proof terminate such a segment using SF.0's
parameter-induction freeness statement. It does not invoke the older P7
maximal-depth-freeness proof through a bundled AB theorem. The AB proof itself
uses induction on finite pd, a separate pd=1 case and residue-field Ext.

`associated-primes-scalar-restriction` now states the native radical-annihilator
convention explicitly. It agrees with the usual annihilator convention over a
Noetherian ring, but the base R in this result need not be Noetherian. The
previous empty-associated-set counterexample does not test the native
convention and was removed. The corrected justification uses minimal-prime
lifting over the cyclic S-annihilator, then association for the Noetherian cyclic
S-module and its injection into N. No finite-map or finite-module hypothesis is
silently added to the theorem.

Four APIs were added to the packet and suggested file: witness elimination for
`IsRegularSequenceIdeal`, and a surjective-presentation constructor plus
Noetherian and local structure projections for `HasRegularSequencePresentation`.
All four definitions can be used through their APIs. Their three tests each
distinguish properness, completion versus a prescribed presentation, absolute
versus relative CI, and local versus global predicates using actual rings and
maps. The field, dual-number, two-variable square-zero Artin and product examples
have the asserted mathematical behavior.

## Suppliers, boundaries and remaining work

The reviewed library audit was checked before treating these contracts as new.
Native regular sequences, support, associated primes, completion and categorical
projective dimension are reused. SF.0 owns depth and CM; AdicEtaleGeometry owns
Koszul complexes; R03.1 and R03.2 own the Cohen and completion extensions. P7 owns
the actual minimal representative and ordinary Rees-quotient grading. No new
depth predicate, substitute grading or relative lci definition is planned here.

The current read-only TauCetiRoadmap and Tau Ceti library were screened, including
the nine roadmaps newer than the atlas snapshot. Current ModularCurves4D
explicitly supplies completion regularity and dimension invariance. Its scheme
regularity definition and its regularity descent for the stated finite cover
hypotheses do not by themselves supply regularity of every prime localization
of a general regular local ring. The unjustified upstream prerequisite was
removed from `ci-localization`, the upstream request was narrowed, and an eighth
gap was recorded with Stacks10.110.6, tag0AFS, p.267. Its route needs the
finite-residue-pd characterization of regularity and its comparison with the
native regular-local class, not AB alone.

The other seven gaps remain exact: the Tate divided-power obstruction; polynomial
relation growth; unclosed SF.0 contracts; graded numerical-polynomial induction;
Hilbert–Samuel degree/leading-coefficient bridges; localized lengths for
multiplicity associativity; and finite-jet/formal tangent-cone proofs. The four
requests retain their precise consuming nodes. SF.0 currently has a
`needs_changes` review; its contracts are mathematical inputs awaiting repair,
not completed implementations. Inherited P7 proof leaves are preserved and
are not closed by the elaboration of this file.

For the orchestrator and assembly worker:

1. Reconcile the original reader's locators, native associated-prime convention,
   syzygy dependency and four added API entries with this accepted packet. The
   reader is outside this review's editable deliverables.
2. Establish an exact owner/supplier for the generic regular-local localization
   theorem before claiming closure. Do not widen the upstream4D citation to
   cover it without an explicit statement and proof route.
3. Redirect the P7 and R03.6 bundled AB/finite-pd consumers to the noncircular
   contracts during assembly, and verify repaired SF.0 statements before import.
4. Replace the suggested file's faithful supplier-definition snapshots with
   real imports when those packages exist. Preserve P7's actual Rees quotient,
   its grading and the Hilbert–Samuel indexing conventions.

No target ownership was moved and no supplier or reader file was edited in this
review. The handoff records these integration tasks without leaving this review
job unfinished.
