# RT-AREA-padic-1: fixes, round 3

Codex — `codex-NIfClf`; 7 October 2026; issue #5703;
job `FIX-RT-AREA-padic-1~3`. Base commit:
`15e35f7f1a5f8a46c6cc08dc7d0e06a2db537851`.

This completes the scoped revision requested by
[REV-FIX-RT-AREA-padic-1~2](../reviews/REV-FIX-RT-AREA-padic-1~2.md).
It synchronizes the P0 reader with that review's corrections and the already
recorded general-base almost-category qualifications, and clarifies the
alternative P1 route in the suggested file. The accepted A3 correction and
pending R5 split proposal are retained. This is an author revision, not a new
independent verdict. All three packets' review objects and review histories are
preserved verbatim. P0's older broad review and its mathematical gaps remain
open; the scoped fix does not declare that audit complete.

Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue, all 32 original findings
and verification reasons, both earlier fixes reports, and the round-two review.
The unwritten owners' actions remain with the jobs listed below, as the issue
requires. No excluded packet, paper extraction, restructuring file, atlas data
or campaign document is changed.

## Changes in this round

### /5: mandatory tilting and the retained deformation route

The reader's two alternative-route hypotheses now match the packet: no node
**outside the two-node route** depends on them. The alternative deformation
theorem still uses the alternative cotangent lemma. The reader's declaration
index also loses its stale deformation prerequisite at
`P1/perfectoid-mod-varpi-equivalence`; the body already omitted it.

Both mandatory equivalences have no alternative-route node in their
prerequisite ancestry. The tilting equivalence proceeds through primitive
ideals and marked untilts; the mod-ϖ comparison additionally uses the
characteristic-p Frobenius inverse limit. P0's finite-étale lifting continues
to reach `P0/almost-deformation-theory` through nilpotent lifting, so its almost
cotangent/deformation work and genuine DD.0 imports are retained. The suggested
file now states these roles explicitly, without changing any Lean signature.
Keeping this alternative route follows the verifier's specific qualification
for /5; it is not a new optional branch added by this revision.

The reader also contained an older, inconsistent account of the general mod-ϖ
category. Its two relevant contracts now match the packet: the coefficient ring
is the truncated root ring over 𝔽_p, the intended flatness is root-ideal almost
flatness, and the mod-ϖ statement keeps ϖ^p dividing p. The identification with
the annihilator criterion, invariance under almost elements, and comparison
with the field-base category remain declaration-level proof obligations.
The reader now shows the packet's root-annihilator gap and P1's `partial`
coverage instead of `source_decomposed`.

The ECD Proposition 9.3 acceptance item keeps the totally disconnected base
and Proposition 7.23's flatness input. The reader's historical E8 diagnosis is
moved under **Rejected source diagnosis**, reflecting its existing independent
rejection. It is not presented as a proven source error or as a completed
general-base comparison. The original diagnosis and rejection remain unchanged
in the packet's source-issue history.

### /7: regular finite-flat towers

The reader now credits pinned Mathlib `IsRegularLocalRing` in its boundary,
both tower nodes' prerequisites and declaration-index entries. Its absence
hypothesis is replaced by the packet's supplier qualification. The gap is
limited to the Cohen presentations and the particular regularity/normality,
power-series, quotient and filtered-colimit interfaces; it no longer says
that regular local rings themselves are missing.

The finite-stage negative example is corrected in the reader:

- At m = 0, R₀ = ℤ_p and Frobenius on ℤ_p/p = 𝔽_p is bijective. The obstruction
  is the required equality (ϖ^p) = (p): p·v_p(ϖ) = 1 has no integral solution.
- At m ≥ 1, R_m/p is 𝔽_p[T]/(T^{p^m}). Frobenius produces only exponents
  divisible by p, so T is outside its image.

The packet already had these corrected contracts, the actual Mathlib baseline
record, and both prerequisites; the suggested file already had the real import
and corrected tower comments. Those are retained. The only packet edit removes
the now-completed reader-synchronization instruction from the Cohen/tower gap.
Its mathematical supplier obligations remain unchanged.

Fresh Česnavičius Lemmas 4.7, 5.1 and 5.2 reading confirms the inherited source
boundaries: preserve completeness of the original regular local input, the
separably closed residue-field condition for p-power ranks, and the perfect
residue-field and mixed-characteristic assumptions of the perfectoid tower.
The residue-field colimit is not asserted complete; the perfectoid tower uses
p-adic completion and retains the ramified unit-multiple step. Matsumura was
not read, and its theorem numbers remain Česnavičius's citations. No new general
Cohen or perfectoid-criterion owner is manufactured here.

### /6, /8, /9 and /15: retained corrections

- **/6:** the accepted A3 node retains only the characteristic-p strongly closed
  comparison for its explicitly constructed embedding. It has no Q4 premise or
  universal ECD 5.8 converse. Fresh ECD 6.4(iv) reading confirms the separate
  sousperfectoid/pseudocoherent/perturbation/étale-tilting route. The packet,
  reader and suggested boundary already agree, so they are unchanged.
- **/8:** the P1 marked-untilt node retains the Berkeley 6.2.9–6.2.11 source
  records, including the primitive ideal, nonzerodivisor, converse, functors
  and plus ring. Fresh reading agrees. E-linear consumer comparisons remain
  with RF/F4's owners.
- **/9:** the pending `R5:sousperfectoid` proposal retains exactly 19 nodes.
  Their prerequisite closure inside the 42-node R5 is exactly that set; the
  other 23 nodes remain the family/coefficient branch. External node inputs
  lie in R0, R3, A1 and P1–P3, with baseline carriers, and no H0 input occurs.
  Fresh Berkeley 6.3.1–6.3.4 reading agrees with the split topological-module
  injection, its stability properties, and the stable-uniform/sheafy
  conclusion. The proposed stage is still absent from the atlas. Current
  valid IDs and parents are retained until the maintainer installs it. The
  packet's proposal already says to reparent and add coverage afterward.
- **/15:** `A0/analytic-locus-restriction` is already present and retained.
  Correcting RS-05's omission is outside these deliverables.

## Disposition of every finding

“Handoff” means an action assigned to an excluded owner by the issue. It is
neither an applied change nor a fresh acceptance of that owner's mathematics.
Round one's exact-edit report and round two's review remain the detailed
starting evidence; the qualifications below prevent treating their proposals
as already installed.

| Finding | What changed, or why not |
| --- | --- |
| /1 | Handoff: general integral perfectoidization and J-almost purity to the PerfectoidQuotients direction, with its P8/Shimura imports. Classical P3 almost purity is not a substitute. No new node belongs in these three packets. |
| /2 | Handoff: a common perfectoid Abhyankar supplier for the ramification/direct-summand designs. Preserve the verifier's additional BHATT-18 proposal and the rejected ANDRE-18 route's inability to supply planned work. |
| /3 | Handoff: early pre-adic v-sheaves and the formal/non-Tate integral consumers. These packets supply adic inputs, not the missing D6 construction. |
| /4 | Handoff: resolve the T6→S6 finite-level/tower interface. Preserve the verifier's supplier/consumer qualification rather than treating them as independent competing owners. |
| /5 | Applied reader and suggested-comment synchronization described above; mandatory P1 route remains independent, P0 deformation remains, general-base almost-category gap stays visible. RS-05/link installation remains with the maintainer. |
| /6 | Inherited accepted A3 correction retained and checked; deletion of the live Q4→A3 edge and A3 requires/text entry remains a maintainer action. |
| /7 | Applied regular-local baseline and finite-stage explanation synchronization; both inherited P7 nodes retained. Shared Cohen/tower suppliers and the Q0 route reconciliation remain open owner actions. |
| /8 | Inherited P1 source addition retained and checked. RF2/F4 ownership and E-linear adapters remain handoffs. |
| /9 | Inherited accepted 19-node split proposal retained and its closure rechecked. Stage creation, graph replacement and reparenting await maintainer installation. |
| /10 | Handoff: the early Berkovich-spectrum supplier and D5 comparison, rather than a second general spectrum construction. |
| /11 | Handoff: reconcile canonical compactification ownership at C4 and correct the descent-stage references. No change to these packets supplies that construction. |
| /12 | Handoff: enhanced sheaf statements /58–/61 cannot be assigned to ordinary D0. Resolve their consumers together to preserve dependency order. |
| /13 | Not enumerated in #5703, but retained from the original findings and prior review as a handoff: reconcile both integral Part II ID collisions, including HeckeStacksAndLocalShtukasIntegralPartII, and import the pre-adic supplier. No excluded brief is edited. |
| /14 | Excluded Zavyalov extraction-route edit: the R2-only routing does not require a new theorem in these packets. |
| /15 | Existing A0 analytic-locus node retained; the RS-05 decision-record correction is outside scope. |
| /16 | Handoff: Div¹ uses Spd(E)/φ^ℤ on Perf_Fq; the unramified-completion presentation requires the restricted algebraically closed residue base. |
| /17 | Handoff: properness/cohomological smoothness must follow C4/S5's actual suppliers, without putting those prerequisites before RF2's early untilt construction. |
| /18 | Handoff: RF0's crystalline end and its specified vector-bundle/AI consumers; these adic packets do not own the period-ring construction. |
| /19 | Handoff: separate BKF full faithfulness from essential surjectivity and its curve/classification inputs. No new equivalence proof is claimed here. |
| /20 | Handoff: rational B_dR ownership and the relative completion comparison, respecting the distinction of their roles and coefficient cases. |
| /21 | Handoff: evaluate the VB/RF ordering against the current RS-20 decision. The verifier confirmed the blocker, not the optimality of the suggested split. |
| /22 | Handoff: preserve the T2→S3 supplier/consumer interface and the cycle qualification in round one's corrected arrangement; do not blindly install the original ownership reversal. |
| /23 | Handoff: completed/coherent-cohomology comparisons to TC.2 and HigherHidaAndColemanTheory's actual comparison routes. T4–T6's existing subjects do not supply them. |
| /24 | Handoff: primitive and log-primitive comparison interfaces. Preserve round one's corrected ordering relative to P8:local-rational; no reverse CP.3→P8→CP.3 cycle is installed. |
| /25 | Handoff: local p-divisible classification before its global consumers, reconciling the shared prismatic Dieudonné Part II proposal instead of creating a second owner. |
| /26 | Handoff: general BT₁ Hasse/LF/Hodge–Tate input at the early FiniteFlat supplier, with the specialized elliptic, Hilbert and boundary adapters. |

The low-severity /27–/32 are outside this fix job's assigned list. They retain
their individual owner actions: direct-summand/derived-splitting routing, older
P7 source locators, obsolete adic baseline claims, F0's anchor dependency, the
early ramified-Witt supplier and T1's dangling H0 reference. They are not
counted as completed corrections by this report.

## Jobs carrying the excluded-owner actions

These are the issue's explicit destinations, unchanged. No packet is written
for an unwritten owner in this run.

| Job | Findings |
| --- | --- |
| BP-AInfCohomology--AI.0 | /19 |
| BP-AlgebraicModularFormsAndSerreWeights | /26 |
| BP-CohomologyComparisons | /24 |
| BP-DiamondEtaleCohomology--C0 | /11 |
| BP-DiamondSixOperations | /11 |
| BP-DiamondsAndVStacks | /3, /10, /11, /12 |
| BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4 | /25 |
| BP-FarguesFontaineDiamonds | /8 |
| BP-GeometricSatakeAndFusion--GS0 | /3 |
| BP-HilbertModularVarietiesAndShimuraCurves--H0 | /26 |
| BP-HodgeTateAndCanonicalSubgroups--T0 | /22, /23, /25, /26 |
| BP-HodgeTateAndCanonicalSubgroups--T6 | /4, /23, /24 |
| BP-IgusaVarietiesAndTorsionConcentration | /24 |
| BP-PadicHodgeTheory--P7 | /20, /24 |
| BP-PerfectoidQuotients | /1, /6, /7 |
| BP-PerfectoidShimuraVarieties | /1, /4, /22 |
| BP-PerfectoidSpaces--P8 | /1 |
| BP-RelativeFarguesFontaine--RF0 | /3, /8, /16, /17, /18, /20 |
| BP-RelativeFarguesFontaine--RF4 | /19 |
| BP-ShimuraCompactifications--C6 | /26 |
| BP-TorsionCohomologyInfrastructure | /24 |
| BP-TropicalAndBerkovichArithmetic | /10 |
| BP-VectorBundlesAndIsocrystals--VB0 | /21 |
| BP-VectorBundlesAndIsocrystals--VB3 | /21 |
| DESIGN-DirectSummandsAndBigCohenMacaulay | /2 |

The remaining maintainer actions for the authorized packets are precise:
retain P0's genuine DD.0 deformation imports while removing P1-only forwarding
obligations; delete A3's live Q4 input; install the R5 prefix and replace its
early outgoing aggregate edges as in round one's /9 edits; identify the shared
Cohen/tower interfaces while reusing the regular-local predicate. Acceptance
of a packet does not by itself assert that all these stage-record edits have
already happened.

## Fresh evidence and validation

Public sources read on 7 October 2026:

- [Česnavičius v4](https://arxiv.org/pdf/1711.06456v4), Lemma 4.7, printed
  p. 8; Lemmas 5.1–5.2 and their proofs, pp. 11–12. SHA-256:
  `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709`.
- [Berkeley Lectures](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf),
  27 March 2020 PDF, §§6.2.9–6.2.11 and 6.3.1–6.3.4, printed pp. 46–48.
  SHA-256:
  `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343),
  Proposition 6.4(iv) and its proof, printed pp. 27–28; Proposition 7.23 and
  its proof, pp. 38–39; Proposition 9.3 and its proof, p. 44. SHA-256:
  `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.

These downloaded hashes match the round-two review's corresponding copies.
AdicSpacesPartII's historically different Berkeley version record is
unchanged; this revision does not claim to have reproduced its old hash or
checked every historical locator.

Read the actual pinned
[IsRegularLocalRing declaration](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RegularLocalRing/Defs.lean#L51)
and neighboring characterizations: it extends localness and noetherianity and
equates the maximal ideal's minimal generator count with Krull dimension.
The reviewed coverage audit contains no layer entries for these three
roadmaps; that absence is not evidence that the carrier is missing. This is a
focused baseline check, not a fresh audit of every inherited citation.

Validation:

- The stock blueprint checker, with the pinned declaration index, reports
  **0 errors and 0 warnings** for all three packets: 326, 153 and 537 nodes.
- The combined three-packet prerequisite graph is acyclic: 1,016 planned
  nodes and 1,852 vertices including external node/stage/baseline leaves.
  This treats inputs outside these packets as boundary leaves; it is not a
  fresh audit of the entire assembled atlas graph.
- Mandatory-route ancestry, the retained P0 deformation input, absence of Q4
  prerequisites in AEG, the 19-node R5 closure and retained valid parents,
  and presence of the A0 analytic-locus node all pass.
- Six affected P1/P7 reader contracts match the packet's statements,
  hypotheses, proof steps, acceptance items and index prerequisites. P1's
  partial coverage and root-annihilator gap are visible. Packet nodes,
  baselines, coverage, source-issue histories and all independent review
  objects/histories are unchanged.
- Intake file checks and `git diff --check` pass.

All three suggested files were attempted sequentially with the mandated
`lean-check` runner; the modified P0 file was checked again after its
comment-only clarification. Each stops before elaboration at a missing shared
Tau Ceti object file: P0 and ASII at
`TauCeti.AlgebraicGeometry.AdicSpace.ResidueField`, AEG at
`TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic`. **No successful Lean
compilation is claimed.** No build, cache download, Lake update or language
server was started. The P7 entries remain mathematical contracts in comments,
not elaborated theorem signatures or tests.

P0's inherited `needs_changes` verdict remains in place for the separate broad
baseline/source/dependency/API/test/planet audit and recorded general-base
almost-category obligations. The reader synchronization requested by the
round-two fix review is complete. The next independent scoped verdict belongs
to `REV-FIX-RT-AREA-padic-1~3`.
