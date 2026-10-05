# Independent review: commutative algebra and derived patching, P7

**Accepted as a complete planning pass with recorded gaps.** Reviewer: Codex — codex-rAusOU, 5 October 2026. Job `REV-DeformationAndDerivedPatchingAlgebra--P7`, [issue #142](https://github.com/CBirkbeck/tauceti-explorer/issues/142). This reviewer did not author the planning pass or its earlier continuations. The bot confirmed this session’s claim before work began.

The final packet has a top-level `review` with one verdict for every node: **389 verified, 89 corrected, zero added, zero unverifiable**. All 483 baseline citations are confirmed as declarations and as direct consumer inputs. No unresolved mathematical contradiction remains in the planned statements. Acceptance does not close the eight stages, certify the admitted proofs, or promote an implementation status.

This report supersedes the unfinished review boundaries in [#6165](https://github.com/CBirkbeck/tauceti-explorer/pull/6165) (codex-6GrZZA), [#6171](https://github.com/CBirkbeck/tauceti-explorer/pull/6171) (codex-81tv4x) and [#6176](https://github.com/CBirkbeck/tauceti-explorer/pull/6176) (codex-w6DEfO). Their evidence remains attributed in the archival `reviewCheckpoint` and immutable pull requests. The present session independently read every current node, every current API/test, every baseline statement with its ambient parameters, every cited source locator, and the full suggested file. Historical admission-free proofs and arithmetic receipts, including [#6086](https://github.com/CBirkbeck/tauceti-explorer/pull/6086), were not rerun or claimed as this session’s proofs.

## Counts and acceptance boundary

| Item | Final count |
| --- | ---: |
| Nodes | 478 |
| Definitions / constructions / lemmas / theorems | 11 / 66 / 385 / 16 |
| API entries / distinct names | 372 / 360 |
| Definition/construction test entries | 304 |
| Tests across all node kinds / distinct names | 398 / 380 |
| Baseline declarations: Mathlib / Tau Ceti | 472 / 11 |
| Sources / node citations | 96 / 694 |
| Planets / gaps / supplier requests | 13 / 15 / 2 |
| Nodes added or removed | 0 |

All 77 definitions and constructions retain at least three tests. Repeated API/test names are deliberate references to the same declaration from related nodes, not new carriers. The suggested file supplies those named statements/examples on native types. Tests range over actual quotients, modules, rings, series, polynomials and complexes, including failure and boundary cases.

| Stage | Coverage retained | Main follow-up |
| --- | --- | --- |
| P7 | partial | Derived tensor/RHom and K-flat comparison, closure/duality, completed infinite-rank minimality, geometric and routed-paper applications |
| P8 | not_read | Compatible finite-level complex systems, ultrapatching, continuous action and derived augmentation |
| P9 | not_read | Amplitude/dimension/support inequalities, integral torsion, specialized coefficient changes and derived-action localization |
| R03.1 | not_read | Complete-local coefficient categories, Artinian towers, continuous presentations and framed lifts |
| R03.2 | not_read | Schlessinger, hulls versus representability, tangent/obstruction interfaces |
| R03.3 | partial | General graded polynomial induction, support-degree/Artin–Rees/localization, depth and the remaining multiplicity comparisons |
| R03.4 | partial | Integral-point implementation, local-field topology, framed lifting and finite-over-subring criteria |
| R03.5 | not_read | Compatible inverse-limit module patching, uniform presentations, depth and exact support conclusions |

No stage claims `planned` or `closed`. The issue explicitly permits acceptance of a correct complete pass whose stage `remaining` lists and gaps are honest. The inherited 478-node pass already exceeds its later 300-node allowance; this review adds no nodes and preserves all IDs.

## Baseline and source checks

The exact pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements were read from the existing Git objects, including surrounding section variables, scalar towers and typeclass assumptions. Every baseline entry now has an independent confirmation and source-byte hash. The supplemental declaration screen resolves all **483** names in the stated modules; this screen was not used as a substitute for consumer matching.

The three cited Tau modules were read in full at the required pin. Their graded quotient uses the images of homogeneous pieces and a homogeneity hypothesis; direct-sum restriction and shifts keep their component/projection/injectivity assumptions; linear Hom uses the signed cochain differential. The packet reuses those interfaces. It introduces no second graded quotient, internal decomposition or Hom-complex carrier.

Three existing baseline descriptions were corrected, with no removals or replacement declarations:

- `Module.length_eq_one` requires a ring and additive commutative group, rather than the recorded arbitrary semiring/monoid context. Its actual consumers meet those hypotheses.
- `MvPowerSeries.monomial_pow` is in a commutative-semiring context. The consumers use commutative rings.
- `Polynomial.coeff_mul_invOneSubPow_eq_hilbertPoly_eval` was made precise about its characteristic-zero field and numerator-degree bound. It is a rational-series coefficient theorem, not general module Hilbert–Samuel existence.

Four native baselines were added: `AdicCompletion`, `AdicCompletion.isLocalRing_of_fg`, `AdicCompletion.maximalIdeal_eq_map`, and `rank_subsingleton`. Their full statements and hypotheses were checked. The first three supply the existing completion carrier/locality interface, not a new completion construction. The last records the pinned zero-ring rank convention needed to correct cancellation.

All **694** source locators and excerpts were checked against public texts and the mathematics using them. The supplemental excerpt screen has 684 literal matches and 694 matches after Unicode/markup normalization, with zero misses. Each source has a current locator-review receipt. Historical `readSections` retain their authorship; current receipts do not imply a fresh whole-paper reading. In particular the paper reads cover Khare–Wintenberger II pp. 45–46, the relevant Boxer–Pilloni passages, Iyengar–Khare–Manning v3 pp. 38–41, all five pages of Huneke–Yao’s author copy, and Goto’s printed pp. 1–5.

The immutable [finite-jet note](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md) and [curve postulation note](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md) were read for the cited mathematical deductions. Their finite computations are not proofs of the formal-series statements. Mathlib [PR #33220](https://github.com/leanprover-community/mathlib4/pull/33220) was independently checked as open, at head `70572cd62395e933e8f6476bcedcee366a5b5e82`; its complete proposed associated-graded file was read as unpinned design context. It supplies no baseline declaration or implementation proof.

## Corrections made

The packet changes 87 node objects, principally source citations. Two other nodes have prototype-only corrections, giving 89 corrected verdicts. The `review.checked` entries identify them individually.

1. Replaced the catenary/regular umbrella URL with the actual public tags 00NI, 02JE, 0ECF, 00NQ, 00NT and 00O7. Kept the direct saturated-chain argument, native regular-sequence quotient comparison, integrated depth/Auslander–Buchsbaum supplier and explicit regular-local-domain gap. Short excerpts now occur at their recorded URLs.
2. Corrected the opening KW non-nilpotence excerpt and the graded-module excerpts to the actual source notation. The finite-point proof retains its injectivity, finite separable extension and scalar-tower hypotheses; algebraic points do not discharge its topological/framed requests.
3. Moved the equation-piece finite-generation citation to `Module.Finite.of_surjective` in Finiteness/Basic, and its length citation to `IsLocalRing.length_restrictScalars` in LocalRing/Length. Concrete Isomorphisms and FiniteLength files replace two repository-directory URLs, with supporting pinned files recorded. Scalar-curve length adapters now cite the native length theorem; general-polynomial/coefficient deductions cite the credited curve checkpoint instead of quoting native names absent from Stacks. No mathematical adapter was falsely relabelled as a native declaration.
4. Corrected unit-pivot cancellation over arbitrary commutative rings. The two complement bases delete the chosen indices; the prototype now returns those bases, finite freeness, unchanged other degrees and contraction. Numerical rank drop requires `Nontrivial R`. Pinned `rank_subsingleton` gives rank and finrank **1** for every module over the zero ring, so an unqualified drop would give 2=1. The suggested regression proves this convention without admissions. Local rings automatically satisfy the nontrivial condition.
5. Strengthened minimal residual ranks to return the homology/term isomorphism, numerical equality, zero-term equivalence and homotopy-invariant residual rank, with termwise finite freeness. Strengthened associativity to return finite localized lengths before using their extended-natural `toNat`. The general derived-base-change and localization proofs stay open.
6. Added eight sample API entries to the existing reserved multiplicity key, five new admitted theorem signatures, seven key test entries and four new named native examples. Existing dimension-indexed additivity, associativity and plane-curve APIs are reused. The smooth/node/cusp examples already present are linked from the key. The new ordinary triple point is the reduced characteristic-zero equation xy(x−y), separate from the existing nonreduced x³ example.
7. Added the actual completion carrier/local-ring import, keeping Noetherian completion explicit rather than inferring an instance from documentation. Recorded its finite-module extension as a gap. Added the coherent-duality supplier reference without planning another dualizing-complex or exceptional-inverse-image definition.
8. Updated current gap/compiler descriptions, appended the final independent validation boundary, archived the earlier partial `reviewCheckpoint`, and supplied the final 478-row review and this report/handoff. All implementation statuses remain `unchecked`; planets, requests and stage statuses are preserved.

## Mathematical closure, API and ownership

The general multiplicity definition is still unique and general in finite modules and ideals of definition. The zero module has polynomial and multiplicity zero, with support dimension bottom. Intrinsic multiplicity is distinguished from extraction in a fixed upper dimension. Exact-sequence additivity uses that common dimension; lower-dimensional modules contribute zero there. The negative below-support coefficient example rules out treating every coefficient extraction as a positive multiplicity.

The regular and Nagata APIs retain different hypotheses. [Huneke–Yao](https://math.gsu.edu/yyao/eprint/regular.pdf) requires all associated primes of the completion to have full dimension. Checking just minimal primes is insufficient: the complete ring k[[x,y]]/(xy,y²) has an embedded associated prime, multiplicity one and no regularity. The key now states that actual associated-prime condition on `AdicCompletion`. Its non-routine proof remains a gap.

[Goto’s parameter notes](https://indico.ictp.it/event/a09150/material/0/1.pdf) give the parameter-ideal length bound and Cohen–Macaulay equality criterion under their positive-dimensional standing hypothesis. The prototype uses the native regularity of the specified parameter list. The dimension-zero empty-list case is a separate finite-length argument. DVR powers give equality; in Q[[x,y]]/(xy,y²), the parameter (x) has colength two and multiplicity one, so equality is not automatic. Associated-graded parameter maps and the converse descent proof require follow-up decomposition.

Finite-jet and homogeneous-component nodes retain exact finite order and no-zero-divisor assumptions where injectivity or the principal initial kernel needs them. Low indices, zero/unit equations, zero variables, positive characteristic, nonreduced equations and nilpotent coefficients remain separate cases. Cumulative curve polynomial agreement starts at n≥d−2 and graded agreement at n≥d−1. The low-level curve polynomial and later general-polynomial wrapper have different consumer roles: the latter transports the former through uniqueness and coefficient extraction, so they are not competing definitions.

General graded polynomial induction remains open beyond the zero-variable base case and the adic-specific adapters. Its recurrence includes the last-variable kernel correction and finite-length guards; neither a rational series nor the generator-count degree bound establishes support dimension. Degree/support, Artin–Rees leading-term comparison, finite top-dimensional localization and general associativity stay in their listed gaps.

P7’s representatives and residue functor use genuine complexes, homotopies and ordinary scalar extension. Identity disks and their locally finite family have concrete carriers. Those computations do not supply a generic derived tensor/RHom or Tor-amplitude predicate. Bounded-above K-flat comparison, completed infinite-rank minimality, triangle/summand closure and scheme globalization remain follow-up work. Unstateable generic signatures remain omitted with explicit obligations, rather than represented by opaque propositions.

All applicable reviewed library-audit rows and RS-08 ownership decisions were read. Existing prime filtrations, support dimension, regular sequences, adic completion, power series, derived categories and Tau graded APIs are reused. DDPA owns the missing local depth/CM/Auslander–Buchsbaum and local perfect algebra; ModularCurves 4D retains its completion/regularity/excellence and finite-map application interfaces. Generic ML/Milnor inputs and arithmetic patching applications remain with their stated owners. Neither module patching nor the complex/amplitude stages is silently certified by the current strands.

The external integrated depth/Auslander–Buchsbaum supplier statement was read and fits its nonzero finite Noetherian-local consumers. The accepted `SchemeAndStackFoundations:key/coherent-duality` statement was also read: its Noetherian geometric exceptional inverse image is cited for future geometric applications, not made a prerequisite of ordinary perfect-module duality or redefined here. Both supplier requests are precise about the missing integer-ring/topology comparison and compatible continuous Artinian lifts. The inherited missing LocalFieldsRamification dependency path remains a declared link-owner obligation.

The thirteen planets remain the key definitions and central theorems/constructions: six in P7, six in R03.3 and one in R03.4. No source locator, implementation helper or duplicate definition became a planet.

## Source issues

All five current source-issue entries have this review’s confirmation; source-byte hashes and reading boundaries are retained. Published-source mistakes are distinguished from the maintained key brief’s hypothesis wording.

| Entry | Independently confirmed correction | Scope |
| --- | --- | --- |
| E3, 0AZU Remark 43.15.6 | The five-condition equivalence needs the nonzero-module/proper-ideal boundary handled explicitly. For A=Q, I=0, M=0, the quotient length is zero but I+Ann(M)=A is not an ideal of definition. | Stated-result exception; earlier novelty search credited, not repeated |
| E4, 0AZY proof | The finite-difference induction summation binder/range is i=0,…,r. | Misprint; lemma statement unaffected |
| E5, 064U proof | The inductively constructed free term is F^(n−1), and the cycle kernel is ker(F^n→F^(n+1)); textual slips are also recorded. | Misprints; pseudo-coherent statement unaffected |
| E6, 0G8Q example | The final monomial factor uses t_n, from the stated variable family. | Misprint; presentation unaffected |
| E7, 0G8S proof | The final base-change map is P→R. | Known misprint; [Joseph Gunther’s official comment #1817](https://stacks.math.columbia.edu/tag/052P#comment-1817) credited |

For E5/E6, the bounded novelty checks covered official pages/comments, full tag histories, official repository issues including closed issues, and the atlas register/errata. They found no existing correction of those specific slips. E5’s July 2025 replacement and comment #9932 address the earlier cone argument, not the surviving indices. No universal novelty claim or external contact is made.

## Validation and orchestrator follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json` passes with zero errors and warnings. Final checks also cover exact review/node ID equality, unchanged IDs and statuses, source/baseline receipts, named API/test correspondence, valid JSON, whitespace and the deliverable allowlist.

The final **1,526-line Mathlib-only prefix** was checked with `lean-check` at the authorized suggested path, removing only the two Tau import lines and ending before the native Rees-quotient section. It exited zero with **zero errors and 166 admitted-proof warnings, no other warnings**. The full file was restored byte for byte. Prefix SHA-256: `5c34b3eb9d7653de0131814d6f33107bd9447fe6477a26f7e8c1a5f035fb4504`; full suggested SHA-256: `8daade1d45628f4355ebc4e716f4b35c8b7e343b7b142d6c2d37bf724caf820e`.

The current full-file `lean-check` stops at the missing compiled `TauCeti.RingTheory.GradedAlgebra.Homogeneous.Quotient` object. Shared Mathlib is exactly pinned; the shared Tau source checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required Tau pin. Exact-pin Tau source was read from existing objects. No shared checkout was changed, no library was built or updated, and no language server was started. The prefix receipt certifies admitted signatures only and does not cover the Tau-dependent tail or the new triple-point example. The full file is not certified as compiled.

The review job is finished. The following are scoped follow-ups, not unresolved packet contradictions or requests to restart this review:

1. Through an authorized reader update, mirror the current API/source/rank corrections and E3–E7 in the planning reader and historical handoff. Those files are outside this issue’s edit allowlist; the earlier E1 reference must not be mistaken for the current E3.
2. Correct the maintained multiplicity key brief’s identification of formal equidimensionality with unmixedness. Keep the all-associated-prime condition and embedded-prime counterexample.
3. Reconcile the inherited missing LocalFieldsRamification stage path through its supplier/link owner. The algebraic integral-point theorem does not depend on this topological extension.
4. Provide an existing compiled Tau build at the required pin before asserting full-file elaboration; this worker was not authorized to build libraries.
5. Route the confirmed source issues through normal intake, preserving E7’s known-report attribution and the bounded novelty scope of the others. Follow-up planning should discharge the precise eight-stage remaining lists and fifteen gaps without duplicating existing carriers or owners.
