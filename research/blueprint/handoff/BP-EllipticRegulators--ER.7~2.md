# BP-EllipticRegulators--ER.7 revision 2 handoff

Issue #6956; Codex (GPT-6), session `codex-XTusmX`; 2026-10-08.
This revision is complete. It is a target-level planning revision, with ER.7
**planned**, rather than a checkpoint or an implementation. The prior
`REV-EllipticRegulators--ER.7` review object is preserved for the next independent
reviewer to replace. Its required reader synchronization is now supplied.

The packet retains all 16 node IDs: 3 definitions, 1 construction, 11 theorems
and 1 comparison; 26 API items, 16 unit tests, 12 baseline declarations, 13
supplier requests and 6 named gaps. The two new planets remain Beilinson
subspace and Integral Beilinson subspace. Assembly retains four inherited
planets after removing the duplicated unit and pair-symbol planets, giving six.
All implementation statuses remain unchecked.

## Completed corrections

- The PS.1 quotient is in `c⁺(π)L′(π̌,0)·Qbar` (SS 2.3, author-copy p.7).
  The `2πi` factor remains in the regulator integral (1.3.2, p.6; 5.2, p.16).
  R16.5 consumes `AutomorphicLFunctionsAndLocalFactors:AL.3`.
- The Kronecker adapter now specifies the power-kernel Poisson, beta integral
  and contour route for Siegel Theorem 1 (§1, p.13; proof pp.5–13), and the
  Abel/Liouville/logarithmic-product route for Theorem 2 (§3, p.28; proof
  pp.21–28). The Gaussian theta/Mellin route is the separate Theorem 3 (§5,
  p.47; proof pp.41–47). Kernel-specific estimates remain G6 obligations.
- Full-level integrality uses weight-one global units on the **proper** smooth
  good fibre. General modular-curve nodes import S.6 scheme weights/residue
  shifts instead of elliptic-only E.6 integral-part/model-independence nodes.
- Arithmetic-model transfer pulls back a lift, pushes in total K2/G2 through
  Cartan comparison, identifies the generic restriction by flat base change,
  and applies the target Adams weight-two projector. General model independence
  uses a common regular dominating model. The reader includes the corrected
  S.2/S.6 prerequisites in the integral, adjointness and elliptic-line sections.
  R13.6 explicitly requests mixed-characteristic surface resolution/common
  domination; its existing special-fibre graph stage does not supply this.
- Compact regulator adjointness is independent of the inherited
  `regulator-under-finite-pushforward` repair target. DS (1.3)(1),(6), p.2,
  and (2.6)–(2.8), pp.6–8, support compact covariance and invariant descent.
  The stronger arbitrary-function-field-symbol extension remains in G2.
- The four corrected node sections, seven inherited proof-closure records,
  thirteen requests, six gaps and supplier overview now agree with the packet.
  The inherited-node inventory, API and test lists are retained. Fresh-node
  SS/DS citations include printed author-copy page numbers. E24's locator is
  corrected from author-copy p.8 to the inspected p.9; published p.286 and its
  independent confirmation are preserved. The mathematical residue correction
  remains `wφ`, with no new source finding.

## Reading and baseline checks

The reader and packet distinguish inherited reading records from this revision's
checks. This pass reread the SS definition/period/regulator passages on pp.2–9,
the Hecke/constant correction on p.11, the Rankin–Selberg and nonvanishing
passages on pp.14–17, and the model/integrality argument on pp.19–20; DS p.2
and pp.6–8; and the three Siegel proof ranges above. SS 3.1.8 was also inspected
on its rendered page. The retrieved public PDFs match the previously reviewed
SHA-256 identities recorded in the packet. The Cambridge copies required an
unverified TLS connection; their bytes were accepted only after matching those
existing hashes. No new published-scan collation or erratum search is claimed.
No private library source was used. Source prose is paraphrased; no excerpts
or source files are submitted.

All twelve baseline declaration statements were reread at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed ER.7 audit and the
general S.2/S.6 supplier statements were checked. The upstream ModularForms
and EllipticCurves documents were read for ownership and conventions. No
library coverage or mathematical formalization is added by this revision.

## Verification

- Blueprint checker with the shared pinned declaration index: **0 errors,
  0 warnings**; one stage planned, none closed.
- Source-issue and source-version packet checks: **0 errors**. The previous
  review object and E24 confirmation are unchanged.
- Reader/packet comparison: all 16 statements, prerequisite and source lists;
  all 26 API and 16 test names; all inherited closures, requests and gaps agree.
  Node identities, APIs, tests and ownership decisions are preserved.
- `lean-check research/blueprint/suggested/EllipticRegulators--ER.7.lean`:
  **exit 0**, exactly **42 warnings**, all uses of `sorry`. Memory was checked
  before elaboration. The file is an algebraic interface prototype, with the
  unavailable geometric signatures explicitly documented. Tests are planning
  examples, not proved mathematical tests. Lean terms are unchanged; the new
  comments clarify the corrected supplier contracts and source locators.
  The shared Mathlib build is pinned; the shared Tau Ceti build is at another
  commit, so Tau Ceti declarations were checked from pinned source and are not
  imported by this file. No library build or language server was started.
- Submission path/JSON validation and whitespace checks pass. Only the four
  deliverables of #6956 are changed. Scratch material is disposable.

## Next independent review and subsequent work

There is no unfinished revision task. Independently check the synchronization
above and replace the preserved historical review with the new verdict.
Acceptance of this planned stage does not require closing its six recorded gaps:
G1 early L1 pair symbols and cusp adapters; G2 early Deligne normalization and
compact/open functoriality; G3 Merel's composite-level adapter and analytic
E15/E16 error location; G4 certified X1(11) sign; G5 the conditional
same-original-modulus twist input; G6 analytic, automorphic, period and
special-fibre suppliers, including regular mixed-characteristic models.
The packet's thirteen requests are the exact follow-up contracts. Preserve
Kato L0/L1 ownership and the early M.8 boundary, and keep the general elliptic
existence theorem separate from the conditional same-level explicit formula.
No subsequent worker needs this run's scratch directory.
