# Independent review of topology fix round 2

Job `REV-FIX-RT-AREA-topology~2`, issue #5168. Codex, session
`codex-5ebb6f`, 2026-09-30. Reviewed #5166 / PR #5232, commit
`95281ad`, authored by Codex session `codex-rtOQ9t`. This review session
performed none of that fix. Sessions are distinct; the shared GitHub submission
account is not evidence of account independence. Review base: `d0016c7`.

**Verdicts:** HabiroNahmSeries **accepted** for this supplier fix;
Polylogarithms **needs_changes**, pending the exact reader-document correction
below. Both packets remain partial; acceptance does not assert source closure,
Lean elaboration, or implementation. Earlier independent reviews are retained
verbatim in each packet's `reviewHistory`.

## Finding-by-finding disposition

I read the claims, evidence and matching verifier reasons for /1–/21, and the
round-two dispositions. The authorized packet changes implement the supplier
sides of /7 and /11, with /21's supplier export contracts. Consumer blueprint
changes have separate owners and are not certified as completed by this review.

| Finding | Verdict on this round and remaining responsibility |
| --- | --- |
| /1 | Handoff is appropriate. QT.0 must import the framed-link/manifold suppliers and request a surgery-calculus extension; this review does not certify QT.0's plan. |
| /2 | Handoff is appropriate. QT.3 must choose admissible-link/Hoste invariance or Habiro's alternative RT route; ordinary Kirby moves do not preserve admissibility. |
| /3 | Handoff is appropriate. QT.1–QT.3 still own the completed quantum-group, bottom-tangle, integral-form, pairing and twist machinery. |
| /4 | Handoff is appropriate. QT.4 must supply the general-Lie-type quantum-group inputs and root-order hypotheses, or narrow its target. |
| /5 | Handoff is appropriate. QT.2 imports the Jones owner and proves the explicit normalization comparison. |
| /6 | Handoff is appropriate. QT.5 must correct its consumer inputs to P.1/P.2 and the algebraic and geometric suppliers. |
| /7 | **Needs changes after packet/comment corrections.** P.2 is the correct sole owner of the tetrahedron identity and Milnor/Lobachevsky proof. The fix overclaimed layer 7's ideal geometry and retained the wrong owner in coverage; corrected below. Its reader still carries those errors outside this issue's deliverables. QT.5's manifold comparison and RS-10 coordination remain separate handoffs. |
| /8 | Handoff is appropriate, with a newly explicit supplier-side boundary. The proposed GeometricTopology Part II needs an early ideal-geometry prefix before P.2, distinct from the later cusped-manifold/triangulation comparison consumed by QT.5. No new roadmap or fictional node is introduced here. |
| /9 | Handoff is appropriate. QT.5 owns the extended Bloch/Rogers/Chern–Simons construction; it cannot be silently imported into P.2's earlier real-volume theorem. |
| /10 | Handoff is appropriate. QT.6 must construct NZ data, DG series, their topological comparison and invariance, then apply HB.9 with its hypotheses. Habiro's formal matrix recipe does not discharge that bridge. |
| /11 | **Accepted supplier correction.** HB.10 records formal Nahm data, with no QT.6/QT.7 prerequisite or topological-invariance theorem. Six exact supplier nodes export the correctly restricted formal or analytic interfaces. Their consumer implementation remains QT.6's job. |
| /12 | Handoff is appropriate. QT.2/QT.7 must specify the Kashaev invariant and distinguish the volume conjecture from the cited proved cases. |
| /13 | Handoff is appropriate. Generic quantum-modular definitions/shared examples belong to QM.5; QT.7 imports them for knot statements. No quantum modularity follows from the accepted HB.10 interface. |
| /14 | Handoff is appropriate. QT.6 owns Faddeev/state-integral analysis and requests the common formal pentagon; HB.4's Gaussian operator is not that analysis. |
| /15 | Handoff is appropriate. QT.7 must source and define resurgence inputs or specify the target's boundary. |
| /16 | Handoff is appropriate. The QT coloured-Jones/relative-Habiro follow-up must import HR.1 and the Alexander supplier. |
| /17 | Handoff is appropriate. QT must supply q-holonomicity/A-polynomial inputs or an explicit boundary for the HQ example. |
| /18 | Handoff is appropriate. The rational-homology-sphere extension needs its sourced scope and modified coefficient completion. |
| /19 | Handoff is appropriate. QT's source-spine repair is not performed or independently verified by reading only the supplier papers here. |
| /20 | Maintainer handoff is appropriate. Extract regeneration must follow the accepted QT.0 prerequisite change; no generated atlas file is edited here. |
| /21 | **Accepted supplier exports; consumer rewiring remains open.** HB.4/HB.8 exact exports are listed and preserve their hypotheses. Replacing QT.4/HB.5a inputs in QT.6 is outside these deliverables. |

The result and verifier contain 123 matched, confirmed findings. /22–/123 are
102 historical upstream findings, accounted for in the fix report's maintainer
notices. Current WORKERS and PROTOCOL sections 10/17 exclude fixing or reviewing
Tau Ceti's own roadmap mathematics and upstream-to-upstream links. I checked
that these notices remain attributed and outside the applied supplier edits;
I do not issue fresh mathematical verdicts on them. This is not a claim that all
123 findings have been repaired.

## Corrections made in this review

In `Polylogarithms:P.2/hyperbolic-volume`, retained the cross-ratio/orientation
convention and P.2's sole ownership, but corrected the statement, second
hypothesis and fourth proof step. GeometricTopology layer 7 states Riemannian
volume, curvature and bundled hyperbolic metrics; layer 8 states the homogeneous
hyperbolic model and its isometry group. Neither contract states the ideal
boundary as the complex projective line, oriented geodesic ideal tetrahedra,
finite volume of those regions, or their isometry/permutation/subdivision
interface. Reading a supplier contract does not require re-auditing its
upstream mathematics.

Narrowed the layer-7 request accordingly and added a request to the existing
layer-8 model stage. Added one precise gap and one Part II coordination proposal
for the missing ideal geometry. The proposed prefix must precede P.2 and QT.5's
manifold comparison: importing the whole QT.5 would reintroduce a cycle. The
proposal names no invented stage id and does not redesign the upstream roadmap.
It coordinates the extension already called for by /8.

Corrected P.2's `coverage.remaining`: Milnor's formula is P.2's own proof
obligation, not GeometricTopology layer 7's. Added the separate geometric
interface to remaining coverage and clarified the existing Milnor gap. The
suggested Lean comments now give the same boundary. No geometric theorem
signature is invented in the absence of its required types and proof inputs.
No Habiro mathematical node needed correction in this review.

**Exact remaining reader handoff.** `research/blueprint/readmes/Polylogarithms.md`
is not an authorized deliverable of #5168. A follow-up job must synchronize its
P.2 coverage (line 243), hyperbolic-volume statement/hypothesis/proof step
(lines 1379, 1388, 1395), Milnor gap (4478), and layer-7 request (4819–4821),
then include the new ideal-geometry gap, layer-8 request and Part II proposal.
The packet is kept `needs_changes` until that reader agrees. The missing Milnor
proof itself is an existing acknowledged partial-coverage gap, not the reason
for rejecting this fix.

The fix's import-encoding limitation remains reproducible from
`scripts/check_blueprint.py`: its `BASE_REF` test runs before stage lookup,
misclassifying a `tauceti:TauCetiRoadmap/...` prerequisite as a Lean declaration.
Both exact suppliers are therefore retained in structured requests, rather than
fabricating `baseline.declarations` or asserting closed imports. The maintainer
must resolve known stage ids first and add the exact layer-7/layer-8 prerequisites
when the checker supports them. No checker is edited in this review.

Concurrent PR #5265 (`0ba7ef0`) changed P.5/P.6's early Deligne and Iwasawa
contracts after the topology fix. Those payloads are preserved exactly and
remain under their own independent review; the topology verdict does not
certify that unrelated fix.

## Sources, hypotheses and baseline

Fresh public PDFs accessed 2026-09-30:

| Source | Reading in this review | PDF SHA-256 |
| --- | --- | --- |
| [Goncharov, arXiv math/0207036v3](https://arxiv.org/pdf/math/0207036v3) | pp. 7 and 53: volume identity and cross-ratio convention; not the missing Section 7 proof | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| [Garoufalidis–Scholze–Wheeler–Zagier, arXiv 2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | pp. 14–17, Theorems 3–5 and the topology boundary; p. 48, Remark 4.2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Garoufalidis–Zagier, arXiv 1812.07690v1](https://arxiv.org/pdf/1812.07690v1) | pp. 2–5: analytic positive-definite datum, formal Gaussian operator, Theorem 3.1 root-order assumptions | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |

Rendered and inspected the GSWZ matrix display, GZ Theorem 3.1 and Goncharov's
volume display as well as extracted text. The three HB.10 matrices and the
conditional `I - B^{-1}A` recipe agree with Remark 4.2, including the condition
that an integral choice is possible. GSWZ's topological application requires
its own essential triangulation and suitable quad/NZ data; the formal theorem
does not guarantee those choices for all manifolds.

The accepted six-node export boundary preserves the following distinctions:
Euler–Maclaurin remainder estimates require their smoothness/integrability
hypotheses; the analytic radial theorem requires a positive-definite analytic
Nahm datum, admissible root order and the stated branches/remainders; formal
Gaussian integration is algebraic and the specialization needs a chosen
nondegenerate solution; module membership retains the coefficient extension,
Bloch-class index and excluded-prime/root-order restriction. Existing GZ/GSWZ
source corrections are preserved, not replaced by their misprinted versions.
This bounded review does not repeat the earlier full errata review.

Read reviewed library-audit records AUDIT-30 P.2 and AUDIT-14 HB.4/HB.8/HB.10.
No formal Gaussian knot-series theorem is supplied by the existing Gaussian
measure density. At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
`TauCeti/Probability/Distributions/Gaussian/Density.lean`, including the actual
`multivariateGaussian_eq_withDensity` statement with `S.PosDef`. It describes
Lebesgue density for a real finite-dimensional Gaussian probability measure,
not the formal all-orders operator or a topological comparison. Mathlib pin:
`082e2d37e8b0463410cdb532e111cd43d5a66174`. There are no new baseline citations
in either fix or this review.

## Validation and limits

- Packet checker with the pinned declaration index: Polylogarithms **0 errors,
  4 warnings**, HabiroNahmSeries **0 errors, 0 warnings**. The four retained
  warnings are the unwritten BorelRegulators R.4 regulator (three consumers)
  and R.3 rank theorem (one consumer); they are existing supplier gaps.
- Preserved all 75/109 node ids, 190/177 API items, 135/125 unit tests,
  baselines, source records, sourceIssues/sourceVersions, partial status and
  unchecked implementations. Review provenance is archived verbatim. Only the
  P.2 volume node changes mathematically in this review.
- `versions_checked` passes for both packets. `intake.py check-files` and
  `git diff --check` pass for the exact four changed deliverables. No link map
  or restructuring result file is under review, so their checker commands are
  inapplicable; the proposal above remains a packet coordination note.
- Recursive prerequisites reached from both packets: **1290 vertices, 2964
  distinct edges, acyclic**, with the two reserved Borel nodes exposed as leaves.
  Their raw stage coarsening is also acyclic. This check does not discharge
  recorded mathematical proof gaps or the requests absent from prerequisites.
- Read-only production assembly: **2868 stages, 8298 edges, acyclic**. Adding
  jointly the fix's seven prospective directions plus layer 8 → P.2 yields
  **8304 edges, acyclic**: HB.9 → QT.6 and QT.5 → HB.10 already exist; the other
  six are prospective. This is a simulation, not publication of any edge.
- Both corrected HB.10 reader statements and exact prerequisites agree with
  the packet; no QT.6/QT.7 reverse input is present. The exact figure-eight
  multiplication gives `[[1,1],[1,1]] (1,-1) = (0,0)`, so its matrix is not
  positive definite and HB.4's analytic theorem cannot justify that example.
- Suggested Lean non-comment lines are unchanged. Neither file was compiled:
  no matching pre-existing builds at the required pins are available. No Lake
  bootstrap/cache/build or language server was started.

No campaign, atlas, upstream, reader, other-job or promotion file is changed.
