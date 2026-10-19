# Topology fix review: scope synchronization required

Refs #6521. Codex, session `codex-nZ8NW8`, 19 October 2026.
Branch `codex-nZ8NW8-review-topology`, input `3e0797a48`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6263868470).
Only this job was claimed. **Blocked checkpoint; the queue-level job is unfinished.**

## Completed work

The [review report](../reviews/REV-FIX-RT-AREA-topology~4.md) gives a verdict and
reason for every one of the 27 assigned findings, with fresh public-source
checks for the three supplier interfaces, exact source locators/hashes and
current upstream ownership. The three issue-named packets now record this
session's bounded reviews: Polylogarithms and HabiroNahmSeries accepted;
QSeriesPartitionsAndMockModularForms needs_changes. Each previous complete
review is preserved once in reviewHistory. Semantic comparison confirms these
are the only packet changes. The P.2 same-vertex test and corrected Gaussian
and multiplier contracts are inherited work, independently checked here.
No suggested Lean, reader, queue, checker or upstream file changed.

The report also makes the outstanding reader corrections explicit: HB.4's
analytic comparison needs real positive-definite precision and density factor
det(Lambda)^(1/2), HB.8's Theorem 3 (38) locator is printed p.14, and QM.5's
Kontsevich statement/hypotheses/direct inputs need the corrected lower-boundary
multiplier. Readers are outside the live issue's edit scope. Those repairs can
remain needs_changes while this review job finishes.

## Blocker: four packet paths omitted from the issue

The live issue names seven outputs (report and three packet/suggested pairs).
The queue requires fifteen, including four more pairs. WORKERS.md limits edits
to issue-named files. Authorization for the four JSON paths below was requested
but had not arrived when this checkpoint was prepared. No excluded path was
edited. The actual unchanged `issues.deliverables_complete` returns false;
its only outstanding packet reviewer identities are the four listed below.

**Synchronize the issue's deliverables or authorize these four JSON paths
before dispatching another worker.** Their paths already satisfy queue-based
intake, which does not resolve the live work instruction. Do not relax the
completion predicate, change the queue, or repeat the three parent reviews to
try to resolve this discrepancy.

## Minimum continuation after authorization

The proposals below are bounded fix reviews, not repeated whole-plan audits.
All four input SHA-256 hashes matched this session. Preserve each previous
whole-plan review in full, including its checked entries (106/14/13/14), once in
reviewHistory. Install the current worker's verdict and provenance after
rechecking any changed input. The existing explicit mathematical gaps are
preserved; needs_changes is warranted for QT's omitted orientation transport,
not merely because planned gaps remain.

For `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, also insert
`Polylogarithms:P.2/hyperbolic-volume` immediately after
`Polylogarithms:P.2/bloch-wigner-descent` in prerequisites. Retain the negative
verdict until the statement identifies the odd vertex relabelling or
orientation reversal that transports P.2's signed formula. For identical
vertices (0,infinity,1,i), its supplier shape is -i and Neumann's is i.
No additional suggested-file edit is needed for this bounded continuation.

The HB.10 proposal preserves its positive conditional eta_R export: actual
coefficient-ring membership plus the HR.5/HR.6 comparison maps gives an H^0
class. It does not assert the stronger geometric comparison or knot invariance.

<!-- proposed-review-objects -->
```json
[
  {
    "path": "research/blueprint/packets/ArithmeticQuantumTopology.json",
    "sha256": "161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951",
    "previousReviewer": "independent-review-REV-ArithmeticQuantumTopology~2",
    "review": {
      "status": "needs_changes",
      "reviewer": "independent-review-REV-FIX-RT-AREA-topology~4",
      "date": "2026-10-19",
      "notes": "Independent bounded review by Codex, session codex-nZ8NW8, following independent-review-REV-ArithmeticQuantumTopology~2. Preserve that complete whole-plan review and its checked entries in reviewHistory. RT-AREA-topology/7 still needs an explicit orientation comparison at QT.5/volume-and-chern-simons: for identical ordered vertices, Neumann §3 pp.420-421 uses n with n(0,infinity,1,z)=z, whereas P.2 uses r=1/n and Vol_P(T)=D(r)=-D(n). State the carrier relabelling or orientation reversal before importing the signed volume formula; the missing direct Polylogarithms:P.2/hyperbolic-volume prerequisite is added separately. The existing figure-eight numerical test alone does not check this carrier conversion. G4/G5 being explicit planned gaps is not the rejection rationale; preserve all eight gaps, nineteen requests, conditional NZ/Habiro hypotheses, analytic-contour obligations and conjectural knot/matrix modularity. This is a bounded fix review, not a repeated 106-node source audit, closed coverage or implementation."
    }
  },
  {
    "path": "research/blueprint/packets/Polylogarithms--P.2.json",
    "sha256": "c7ec1779b6e7a5f682d5f55128681f8e9b45ec45b4578452625c4b60fc3d62d2",
    "previousReviewer": "independent-review-REV-Polylogarithms--P.2",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-topology~4",
      "date": "2026-10-19",
      "notes": "Independent bounded review by Codex, session codex-nZ8NW8, following independent-review-REV-Polylogarithms--P.2. Its complete preceding review, including checked entries, is retained in reviewHistory. Bounded review of RT-AREA-topology/7. The Milnor-angle node supplies the single P.2 tetrahedron formula under the stated curvature, orientation and angle conventions. It retains the ideal-boundary, measurable-region, signed-integration and exact regulator-calibration gaps. Zagier I.3 equation (5), p.11 and I.4 equations (7)-(9), pp.13-14 support this ownership boundary. This does not repeat the 14-node whole-plan audit or claim its gaps are closed."
    }
  },
  {
    "path": "research/blueprint/packets/HabiroNahmSeries--HB.4.json",
    "sha256": "187c929cbda6a18725271fb03e6d85e01c95d016829dbd8ddb329d6ae8cd6fa1",
    "previousReviewer": "independent-review-REV-HabiroNahmSeries--HB.4",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-topology~4",
      "date": "2026-10-19",
      "notes": "Independent bounded review by Codex, session codex-nZ8NW8, following independent-review-REV-HabiroNahmSeries--HB.4. Its complete preceding review, including checked entries, is retained in reviewHistory. Bounded review of RT-AREA-topology/11. The analytic branch uses symmetric positive-definite data, odd root orders coprime to the compatible denominator, chosen branches and cancellation-safe all-orders remainders. The formal Gaussian export has a different domain and supplies no analytic convergence for a singular knot matrix. GZ v1 datum pp.2-3 and Theorem 3.1 pp.5-6 support the analytic restrictions; retain the coefficientwise Kummer and rational-data arithmetic gaps and the existing 13-node audit."
    }
  },
  {
    "path": "research/blueprint/packets/HabiroNahmSeries--HB.10.json",
    "sha256": "207703d3de03ee9340436a98e1b0039b40305881bc9d6b35b8b426bebbbf6bad",
    "previousReviewer": "independent-review-REV-HabiroNahmSeries--HB.10",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-topology~4",
      "date": "2026-10-19",
      "notes": "Independent bounded review by Codex, session codex-nZ8NW8, following independent-review-REV-HabiroNahmSeries--HB.10. Its complete preceding review, including checked entries, is retained in reviewHistory. Bounded review of RT-AREA-topology/11. The quartic module export remains conditional on HB.9 gluing and finite-etale scalar change, with a specified noncanonical K3 lift, tame-kernel prime restrictions and orders prime to Delta. A restricted module element gives neither knot invariance nor an arbitrary geometric cohomology class. GSWZ v2 Theorem 5 p.14 supports the restricted formal membership boundary. Preserve the global-line, order-one freeness and geometric-comparison obligations and the separate 14-node audit. The explicit eta_R degree-zero export is retained: once an element has actually been shown to lie in the stated coefficient ring, the imported HR.5/HR.6 comparisons give an H^0 class. This is distinct from the requested higher-degree geometric comparison; this bounded review does not reject that existing coefficient-ring export or repeat its separate source audit."
    }
  }
]
```

## Validation

All seven repository packets and all four unapplied scratch candidates pass
`scripts/check_blueprint.py` against the supplied pinned declaration index:
zero errors and warnings. The actual unchanged completion function returns
false on the repository and true in a read-only projection using just those
four candidates. The projection is a continuation check, not completed work or
permission to apply it. No source PDF or passage is committed, and no excerpt
key occurs in any edited packet.

Independent diagnostics reproduce the reciprocal cross-ratios and vertex-swap
sign, inverse precision entry -1/3, singular figure-eight kernel (1,-1), finite
Kontsevich values 1, 3, 8-3i, and corrected/naive central multiplier products
1/-1 (the last up to floating-point roundoff). They check conventions rather
than prove the geometric integration or analytic transformation theorem.

Suggested files are unchanged, so no fresh Lean compile was needed or run.
Previous workers' compiler results are not claimed as this worker's checks.
No language server, build/update/cache process or background compiler ran.
File-intake (five files, zero problems), whitespace and scope checks pass for
the report, handoff and three parent packets only. No continuation depends on this session's
scratch files; the complete source URLs, locators, hashes and proposed reviews
are retained here and in the report.
