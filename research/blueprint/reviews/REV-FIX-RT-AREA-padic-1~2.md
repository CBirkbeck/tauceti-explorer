# REV-FIX-RT-AREA-padic-1~2

Scoped verdicts: **AdicEtaleGeometry accepted; AdicSpacesPartII accepted;
PerfectoidSpaces--P0 needs_changes.** The two accepted verdicts cover the
submitted A3 correction and pending sousperfectoid split proposal. They do not
mean that the maintainer has installed the proposed stage/edge changes.

Codex — `codex-rtOQ9t`; issue #5151; 2 October 2026.
Base: `8fb0d761c1520eda3f88f114fa0563f070bd02db`.
Reviewed Claude Code `cc-c2c06b`, FIX issue #5150,
[PR #5269](https://github.com/CBirkbeck/tauceti-explorer/pull/5269), merged
30 September as `00d456f76721d819e3f72d8de94c3f6996dd86f2`.
The bot-confirmed author-side claim belongs to that session; I did none of it.
I previously reviewed a different scoped padic-2 fix in #5537/PR #5636.
That prior role is disclosed and does not complete P0's older broad review.

Read the full round-two fixes report and all 32 original findings with their
verification reasons. FIX #5150 enumerates /1–/26 and authorizes the three
finished packets; its issue explicitly sends other owners' findings to their
blueprint/design jobs. This report distinguishes those handoffs from applied
corrections. It does not re-verify every source theorem in the excluded roadmaps.
Only the authorized packets, P0 suggested file and this review report change.
Historical reviews, including their complete checked-node lists, are archived
verbatim in `reviewHistory`.

## /5: optional deformation route and the untilt supplier

**Correct within the submitted scope, with a wording correction.** The mandatory
tilting equivalence uses the primitive-ideal untilt classification, including
its converse, plus rings and naturality. Fresh Berkeley 6.2.9–6.2.11 and ECD
3.13–3.17 reading confirms this construction without a perfectoid base field.
Kedlaya–Liu II 3.3.8 supplies the corresponding Fontaine-perfectoid equivalence.
The packet retains its general-base almost-category proof obligations; this
review does not declare them discharged by those source statements alone.

The FIX removes the deformation node from `perfectoid-mod-varpi-equivalence`'s
prerequisites and marks the comparison step optional. Neither mandatory P1
equivalence has either optional node in its prerequisite ancestry. The optional
cotangent lemma still feeds the optional deformation theorem. Corrected both
new hypotheses' literal claim that no packet node needs them to say that no node
outside this optional two-node route depends on them.

P0's own finite-étale lifting still reaches `P0/almost-deformation-theory`
through nilpotent lifting. Removing P1's mandatory dependence therefore does
not authorize erasing P0's almost cotangent/deformation work or its genuine
forwarding imports. The FIX report correctly leaves that RS-05 adjustment to
the maintainer, distinguishing P1-only links from P0's retained uses.

## /6: A3 does not import Q4

**Accepted.** The actual FIX diff removes the universal ECD 5.8 converse,
its Q4 prerequisite and its source citation. It retains the characteristic-p
comparison for the closed embedding explicitly constructed in A3: the map on
Tate rings is surjective, and the plus ring is the required integral closure.
The retained statement no longer asserts the general prismatic-perfectoidization
theorem. A scan of every A3/packet prerequisite finds no Q4 input.

Fresh ECD 6.4(iv), pp. 27–28, confirms the route: characteristic p, pseudocoherent
sheaves, a sousperfectoid relative ball, perturbation of its equations, and
étale-category tilting. ECD 5.8 is absent from that argument. The boundary in the
corrected node is appropriate. The suggested Q4 supplier comment is removed
and the reader's corresponding correction matches the packet.

Deleting the live Q4→A3 edge and requires entry remains a maintainer action.
This review does not claim that accepting the packet itself edits every
historical stage edge. AdicEtaleGeometry's previous full review and its existing
source-qualified gaps remain the prior evidence outside this scoped correction.

## /7: regular finite-flat towers

**Source statements correct; baseline and negative-test explanations corrected.**
Fresh Česnavičius v4 reading, Lemma 4.7 p. 8 and Lemmas 5.1–5.2 pp. 11–12,
including rendered pp. 11–12, checks both new P7 nodes. Lemma 5.1 preserves
completeness of the input, finite flatness, regularity and the separably closed
residue-field hypothesis for p-power ranks. Its algebraically closed-residue
colimit is not asserted complete. Lemma 5.2 preserves mixed characteristic and
perfect residue field, distinguishes both Cohen cases, and completes p-adically.
The ramified proof retains the unit multiple of p. Neither node constructs a
second primitive-ideal or tilting theory.

The FIX's claimed absence of regular local rings at the pin is false. I read
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
`Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`:
`IsRegularLocalRing` extends localness and noetherianity and equates the minimal
number of maximal-ideal generators with Krull dimension. The neighboring file
also contains ring-equivalence and cotangent-space characterizations; polynomial
regular-ring results exist in `RegularLocalRing/Polynomial.lean`.

Added the actual predicate to P0's baseline and both new nodes' prerequisites.
Corrected the absence hypothesis, narrowed the gap to the Cohen presentations
and the specific regularity/normality/tower comparisons, and added the genuine
Mathlib import to the suggested file. Its two theorem contracts now credit the
existing carrier. This is not a claim that the Cohen theorem or all completion
and filtered-colimit comparison theorems have already been formalized. Matsumura
was not read; its theorem numbers are Česnavičius's citations.

The new acceptance item said Frobenius fails to be surjective at every finite
stage of the ℤ_p root tower. At stage zero, ℤ_p/p=𝔽_p has bijective Frobenius.
Corrected the explanation: ℤ_p fails the required `(ϖ^p)=(p)` condition, since
`p·v_p(ϖ)=1` is impossible. For m≥1, the reduction is
`𝔽_p[T]/(T^{p^m})`; its Frobenius image has only exponents divisible by p, so
T is absent. These explanations now distinguish stage zero from positive stages
in the packet and suggested comments. The reader owner must synchronize both
this correction and the regular-local-ring baseline claim.

The local Lemma 4.7 argument remains an inline instance in the tower proof,
not a new general owner node; the existing Q0:integral-algebra routing is retained.
Its potential earlier shared supplier and the Cohen/tower interfaces remain
explicit planning obligations. The new theorem signatures remain comments,
not elaborated Lean theorems.

## /8: the marked-untilt owner

**Accepted within scope.** The new Berkeley source records at the P1 classification
node accurately cover the primitive ideal, nonzerodivisor and the two equivalence
functors, including the plus ring. Fresh printed pp. 46–47 match those records.
The FIX does not re-plan the statement in RelativeFarguesFontaine or install its
E-linear comparison: those consumer corrections and the RS-20 ownership entry
remain with their named owners. The p-typical and E-linear roles stay distinct.

## /9: the sousperfectoid prefix

**The pending split proposal is accepted; installation remains pending.** All
19 listed nodes exist in the current 42-node R5. Recursively following their
R5 prerequisites gives exactly those 19 nodes. Their external prerequisites are
R0, R3, A1, P1–P3 and the cited baseline carriers; no H0 premise appears in that
closure. The other 23 nodes carry the later family/coefficient work.

Fresh Berkeley 6.3.1–6.3.4, printed pp. 47–48 of the 27 March 2020 PDF, confirms
the split topological-module injection definition, rational/finite-étale/Tate
algebra stability and stable-uniform/sheafy conclusion. A perfectoid-times-smooth
product is not asserted perfectoid just from one perfectoid factor. The packet
retains the separate product proof and finite-étale interfaces.

The exact proposed `R5:sousperfectoid` stage is still absent from the current
atlas. Current valid node parents and IDs are therefore preserved; the proposal
says to reparent and add coverage only after installation. The prospective graph
replaces R5's early outgoing edges by prefix edges, adds its earlier inputs,
retains the coefficient branch, and is acyclic. H0 is not an ancestor of the
proposed prefix. The apparent P6 difference from the original finding is already
resolved by round one's inspected edit: replace the aggregate R5 edge with the
prefix edge, rather than retaining the aggregate edge.

The two packet/source versions of Berkeley have different historical hashes.
The freshly downloaded March 2020 PDF matches P0's hash. Its selected 6.3 content
was checked directly here; I do not claim to have reproduced AdicSpacesPartII's
older hash or freshly rechecked all its old locators. No historical source record
is silently replaced.

## Disposition of every assigned finding

“Handoff” below means an excluded-owner action, not an applied correction or a
fresh mathematical acceptance of that owner's whole blueprint. The issue's
explicit routing remains authoritative. The round-two report preserves these
boundaries; no excluded packet is changed.

| Finding | Review disposition |
| --- | --- |
| /1 | Handoff: Q5/general integral perfectoidization and J-almost purity; Q/ P8/Shimura owners. |
| /2 | Handoff: common perfectoid Abhyankar input for the ramification/direct-summand designs. |
| /3 | Handoff: pre-adic v-sheaves in D6 and their integral consumers. |
| /4 | Handoff: T6/S6 finite-level versus tower interface; retain the verifier's supplier/consumer qualification. |
| /5 | Applied optional-route correction; two wording corrections here; P0 deformation retained. |
| /6 | Applied A3 correction accepted; live graph installation remains with the maintainer. |
| /7 | Applied P7 nodes source-checked; baseline and stage-zero explanations corrected here; general supplier interfaces remain open. |
| /8 | P1 source addition accepted; RF/F4 consumer ownership edits are handoffs. |
| /9 | Applied 19-node split proposal accepted; sub-stage/reparenting installation pending. |
| /10 | Handoff: early Berkovich-spectrum supplier to D5, not a second general construction. |
| /11 | Handoff: choose canonical compactification owner and correct descent-stage references. |
| /12 | Handoff: enhanced sheaf statements cannot be assigned to ordinary D0. |
| /13 | Handoff: merged integral design briefs and D6:pre-adic imports; no claim of installing them here. |
| /14 | Excluded Zavyalov route edit; no corresponding new theorem is needed in these packets. |
| /15 | A0 analytic-locus node already present; RS-05 record correction is outside these deliverables. |
| /16 | Handoff: Div¹ uses E on Perf_Fq, with the unramified-completion presentation on the appropriate restricted base. |
| /17 | Handoff: later properness/smoothness consumer after its actual suppliers. |
| /18 | Handoff: RF0's missing crystalline end and the specified vector-bundle consumers. |
| /19 | Handoff: separate BKF full faithfulness from essential surjectivity; do not treat a handoff as a new proof. |
| /20 | Handoff: rational B_dR input and the relative completion comparison have distinct roles. |
| /21 | Handoff: evaluate the VB/RF order against the current RS-20 decision; the verifier did not certify an optimal split. |
| /22 | Handoff: HT map supplier/consumer interface, retaining the verifier's T2/S3 qualification. |
| /23 | Handoff: route completed-cohomology comparisons to actual comparison owners. |
| /24 | Handoff: early primitive and log-primitive comparison interfaces; no reverse CP.3/P8 cycle. |
| /25 | Handoff: local p-divisible classification belongs before its global consumers. |
| /26 | Handoff: shared BT₁ Hasse invariant, with specialized elliptic/Hilbert and boundary adapters. |

The low-severity /27–/32 are outside FIX #5150's enumerated list. They retain
individual owner actions: /27 direct-summand/derived-splitting routing; /28 P7
source locators; /29 obsolete AdicSpaces baseline claims/import boundaries;
/30 F0's anchor dependency; /31 early ramified-Witt supplier; /32 the T1 H0 link.
These are not silently added to the FIX's claimed completion. Reading their
verification records is not a new acceptance of their suggested source remedies.

## Remaining work and checks

P0 retains `needs_changes`: its older broad baseline/source/dependency/API/test/
planet review remains unfinished, and its general-base almost-category gaps are
still recorded. The latest review by `codex-5ebb6f` is preserved verbatim, as are
my earlier scoped padic-2 review and the original review history. Adding one
baseline carrier and checking two new nodes does not finish the older audit.
The reader is not an authorized deliverable here; its owner must synchronize
the regular-local-ring and stage-zero corrections. This review makes no general
claim that all 325 current P0 baseline citations were freshly read.

Fresh public source versions, 2 October:

- [Česnavičius v4](https://arxiv.org/pdf/1711.06456v4), pp. 8, 11–12:
  SHA-256 `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709`.
- [Berkeley Lectures](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf),
  printed pp. 46–48 (PDF pp. 56–58):
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- [ECD](https://arxiv.org/pdf/1709.07343), pp. 17–18, 24–25, 27–28:
  SHA-256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.
- [Kedlaya–Liu II v3](https://arxiv.org/pdf/1602.06899v3), Theorem 3.3.8,
  p. 60 and its proof:
  SHA-256 `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c`.

Relevant baseline statements read at the pins include `IsRegularLocalRing`,
`IsAdicComplete`, `Module.Flat`, `IsIntegrallyClosedIn` and `WittVector`.
No new source erratum is filed; the false stage-zero explanation and library
absence claim belong to the FIX, not to Česnavičius's source.

Validation: all three stock blueprint checkers pass with the pinned index,
**0 errors and 0 warnings**. They retain 326, 153 and 537 nodes respectively.
The reachable node graph, with stage inputs as boundary leaves, is acyclic:
1,123 vertices and 5,212 edges. The current assembled graph has 2,956 catalogued
stages, 3,007 endpoint vertices and 8,639 edges. The prospective split/edge
replacement graph has 3,008 endpoint vertices and 8,649 edges and is acyclic.
The exact optional-route ancestry, retained P0 supplier and 19-node closure
checks pass. Truncated-polynomial Frobenius checks distinguish m=0 from m≥1.
Historical reviews and all unchanged node/source/version data are preserved.
Intake and whitespace checks pass.

No Lean compiled: no existing build at both pinned commits was available. No
build, cache download or language server was started. The added import names a
real pinned module; this is not a claim that the complete prototype elaborates.
