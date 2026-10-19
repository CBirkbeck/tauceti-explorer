# FIX-RT-PAPER-NGODAC-21

**Complete.** Codex, session **codex-CkQxH4**, 19 October 2026.
Refs [issue #5687](https://github.com/CBirkbeck/tauceti-explorer/issues/5687).
All **17 confirmed findings** are addressed in the
[extraction](../papers/PAPER-NGODAC-21.result.json) and
[reader report](../papers/PAPER-NGODAC-21.md). Finding /17 was rejected by the
[verifier](RT-PAPER-NGODAC-21.review.json) and is not treated as a defect.
Only this issue's three deliverables were edited. Cross-file owner changes
are recorded below for the maintainer, as required by the deliverable boundary.
This is a completed extraction fix, not a roadmap implementation or a new
independent review.

## Per-finding changes

Numbers refer to [RT-PAPER-NGODAC-21](RT-PAPER-NGODAC-21.result.json).
The verifier's refinements take precedence over conflicting alternative fixes
within the original findings.

1. **Factorials and small power sums.** Deleted the DM.6 route. `gamma` and
   `small-power-sum` now source the existing Part II, at MZ.3 and MZ.0
   respectively. Tuple factorials share the current Anderson–Thakur target;
   the fixed-degree small-power-sum formula overlaps Im–Kim–Le's
   `thakur-power-sums-s-le-q`, while the truncated q−1 formula is an explicit
   refinement. The brief/report import no factorial or power-sum input from
   DM.6. Six routes become five; see the positional review mapping below.

2. **One owner for shared mathematics.** Corrected the claim that sibling
   routes already agree. `ownershipAlignment`, route 5's brief and the report
   map specialized E, Ω, CPY denominators and Carlitz products to their chosen
   base owners. Im–Kim–Le's ordinary Tate interface was already split to an
   upstream import; only the specialized E part of its bundled item is moved.
   Likewise only the [k],D_k component of its AT item is base arithmetic.
   Numerical periods, factorials and renaming retain their distinct owners.
   Accepted positional reviews and unreviewed later sibling routes are
   explicitly distinguished. Other job files were not modified.

3. **Theorem D's proof inputs.** Route 5's brief now derives D from A,
   Theorem 6.2 and Lemma 6.1 for q>2, and from Corollary C for q=2.
   A+B alone gives C through weight q. The q=3,w=4 example distinguishes the
   five small-entry indices from six Thakur indices. The theorem item already
   had the correct separate inputs; its report and route now agree with it
   (HAL pp. 3–4, 22–24).

4. **Acyclic algebraic and analytic suppliers.** Added `algebraic-twist` at
   DM.4: positive coefficient q-power fixes t over any characteristic-p field,
   and inverse twisting requires perfectness. `dual-motive` uses that item,
   without analytic twisting. `twist`, E and Ω use DM.8. Added the explicit
   `carlitz-period-product` at DM.2 and made `period-power` use it, with the
   numerical root/product valuation proof. Thus the former Ω dependency is
   replaced by an actual lower-layer supplier. Checked transitive dependencies
   for every item assigned to DM.0, DM.2 and DM.4: none imports DM.8 or Part II.
   The currently accepted DM.2/omega target still requires the coordinated
   maintainer relocation below; the extraction does not pretend that the
   assembled external graph has already changed.

5. **Scalar descent owner.** Moved `monic-frobenius-descent` and
   `theta-degree-bound` to Part II MZ.4 beside `integral-monic-quotient` and
   the two-row system. They use the algebraic coefficient action, with no
   DM.8 prerequisite. Compared their hypotheses to Im–Kim–Le /33 and
   Chang–Chen–Mishiba /33–34: character scaling, forcing polynomials and
   localized-rational starting points differ. The accepted stable-subring
   polynomial descent is reused; the forcing-G degree estimate is retained
   as a refinement. No newly read Kuan–Lin proof is claimed.

6. **Canonical products and dominance in the dependency graph.** Added all
   requested inputs to the two revision nodes and all requested consumer
   edges to products, B/C operations, BC support and reductions. The canonical
   construction now has an API for its specified finite F_p recursion,
   all-integer realization equations and support/depth bounds, plus four
   tests including the requested q=2/q=3 examples. Rebuilt the DAG over all
   current items, rather than retaining the old 106-item order. Fresh exact
   arithmetic diagnostics also exercise the recursive realizations.

7. **Period normalization.** `C-infinity`, `omega`, `AT-interpolation`,
   `L-theta`, both relevant base route reasons and the Part II brief now
   distinguish π_N=1/Ω(θ) from π_P=−1/Ω(θ), for the same selected root.
   Weight-w denominator transport contributes (−1)^w. The root/product item
   proves π_N=−π_P; tests distinguish odd characteristic and the
   characteristic-2 collapse. Eulerian membership and homogeneous relations
   are invariant. This records a convention adapter, not a source error
   (HAL §4.2 p. 17; Chang (3.1.3) p. 7; Papanikolas §3.3.4 p. 12).

8. **Integral AT polynomials.** Added α_n,H_n∈A[t] to the exported statement,
   the integral-coefficient API and q=2 test α_3=θ+t², H_3=t+θ².
   The proof outline uses the cited integral polynomial theorem, with the
   index shift made explicit, as permitted by the verifier. `AT-bound` now
   names Anderson–Thakur (3.7.3), as cited in HAL p. 17. Chang v4 Theorem
   5.5.1 p. 18 supplies the integral H polynomials, bound and interpolation;
   original proof reading remains G4.

9. **Prefix/suffix closure.** Connected the closure theorem to
   `index-families` and its three specified consumers: prefix elimination,
   `nonq-tail` and Theorem 6.2. Kept the distinction between the closed I^0/I′
   families and the non-prefix-closed I^T family. Its (q,1)/(q) test remains
   visible (HAL Remark 5.1 and Lemma 6.1(2), p. 22).

10. **Actual analytic constants.** Connected the analytic fixed-field theorem
    to twisting, the restricted carrier and Gauss norms. Added it to
    `trivialization-uniqueness` and `twist-fixed`, with the latter stated as
    a corollary. The former requires Frac(T)^σ=F_q(t), not merely the
    algebraic rational-function fixed field. Current DM.8 is now complete
    with an accepted review and an explicit `analytic-fixed-fields` target;
    the old partial-packet caveat is identified as historical. Planned
    evidence still does not assert that the analytic proof or C∞ adapter is
    implemented (Papanikolas Lemma 3.3.2 p. 12; §4.1.6 p. 22).

11. **Inventory and report.** Replaced the stale report, summary and current
    validation inventory with **116 items: 7 library, 92 planned, 17 missing;
    305 internal edges; five routes; 16 source issues**. Four explicit input
    items were added. The status change also reflects the now-existing
    accepted base and Part II packets: each planned item has a checked exact
    packet-node reference and a scope caveat. Historical validation and
    reading records remain clearly labelled as historical.

12. **Chen coefficient test.** Corrected the actual test field to
    Δ_2(2,2)=1 in F_3 and S_d(2)^2=S_d(4)+S_d(2,2). The note records the
    earlier review correction without leaving a contradictory test.

13. **B's sufficient condition.** Replaced the asserted converse by the
    sufficient condition from Corollary 2.7 p. 9. Equal head exponents in
    characteristic 2 can cancel the Chen corrections outside the stated
    range; q=2 with heads 2,2 is an explicit example.

14. **Binary-relation boundary.** Replaced the unsupported “strictly weaker”
    claim by the d=−1 computation β_(w)=0. R₁ satisfies it because its
    shifted index (1,q−1) has depth two. The boundary note explains why the
    nonnegative equations and Chang's weight separation also force this
    coefficient to vanish for the stated positive-weight K-coefficient
    families (Chang Theorem 2.2.1 p. 5).

15. **Existing norms and completeness.** Added `gauss-norm` as a library
    item with the six exact pinned declarations for the radius-one norm,
    boundedness, inequality, polynomial comparison and multiplicativity.
    Connected `AT-bound` and `L-entire` to it. Following the verifier's
    qualification, also added the existing generic Huber restricted-series
    completeness theorem as `restricted-completeness`, read with its
    complete uniform nonarchimedean commutative-base assumptions, and
    connected it to `L-entire`. G5 and the report now request the C∞
    instances and one-variable Gauss/Huber topology comparison, importing
    upstream AdicSpaces Layer 0 §§0.4–0.5. They do not re-plan generic
    completeness. Current Weierstrass preparation/unit/PID results already
    imported by DM.8 are also identified as existing library work.

16. **Linear independence in prefix elimination.** The third proof step of
    `prefix-difference-zero` and the report now use K̄-linear independence
    after q^N-th roots, from the lower-weight induction and MZ-descent.
    Algebraic independence is not asserted. The empty prefix remains a
    separate L(∅)=1 case (HAL (5.2)–(5.5), pp. 20–21).

17. **Rejected finding.** No missing-algebraicity defect is claimed. Ω∈E
    was already part of the exported assertion and E already included the
    algebraic-coefficient and finite-field-degree conditions. The owner
    clarification for /4 is applied, but no optional coefficient-recursion
    proof is required and no reverse `entire-from-equation` dependency is
    introduced.

18. **Proof-gap ownership.** The brief and report assign G3 to Part II's
    nonvanishing/valuation input and G4 to its Carlitz/AT interpolation
    inputs. G5 concerns the DM.2/DM.8 analytic suppliers and upstream
    comparisons; G6/G7 belong to the proof of DM.8's imported ABP theorem.
    The existing Riemann–Roch theorem is not re-planned in Part II. G8 is
    source-version reconciliation, explicitly not a mathematical proof leaf.

## Current-plan reconciliation and maintainer handoff

The fix inspected atlas main `62a49cc812f1af71fbabbb92ce92b3a841bc06c9`.
The current DM.0 packet, DM.8 packet and six-stage
`DrinfeldModulesAndTModulesPartII` packet are complete with accepted reviews.
Older absence/partial observations in the source extraction and verifier are
snapshot-specific. This fix cites those accepted targets and converts the
old new-Part-II proposal into a source route. The source refinements remain
visible rather than being treated as completed mathematics.

The read-only upstream roadmap check used
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pinned library evidence still uses
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No build was run in those trees.

The following changes concern other jobs' files and must be coordinated by
the maintainer. This report and the JSON's `ownershipAlignment` preserve them
without editing beyond this issue's authorized paths.

| Other target or bundled component | Chosen common owner / action |
| --- | --- |
| Im–Kim–Le `anderson-thakur-polynomials`: [k],D_k only | Import DM.0/carlitz-products; keep factorials and AT polynomials at Part II MZ.3 |
| Im–Kim–Le `tate-algebra-E-and-a-of-t`: specialized E only | Import DM.8/entire-series; keep elementary renaming in Part II and the existing ordinary-Tate upstream import |
| Current DM.2/omega and Im–Kim–Le `omega-and-carlitz-period`: analytic Ω component | Relocate to DM.8, including E membership, twist and zeros; update all analytic consumers; retain numerical DM.2/carlitz-period |
| Im–Kim–Le `cpy-common-denominator` | Import DM.8/constant-denominator |
| Im–Kim–Le factorial and `thakur-power-sums-s-le-q` components | Shared Part II MZ.3 / MZ.0; no DM.6 input |
| Im–Kim–Le /33 and Chang–Chen–Mishiba /33–34 | Shared Part II MZ.4; compare forcing, character and localization hypotheses before specialization |

In particular, the current DM.8 `carlitz-group` and Part II `deformation-series`
imports of DM.2/omega need updating when the analytic node moves. The numerical
period should not be defined through the relocated analytic node. Preserve
π_N/π_P transport at the comparison point. No reverse DM.8→DM.2/DM.4 or
base→Part II dependency should be introduced.

Im–Kim–Le's positional routes 1/2 have accepted verdicts, but its route 1
still conflicts with the chosen specialized owners. Chang–Chen–Mishiba's
recorded review covers routes 1/2; later routes 3/4 have no matching accepted
positional verdict and are leads. These records do not establish owner
agreement for the revised extraction.

A new fix review must judge **all five revised source routes**. Old route
verdicts cannot be reused blindly after deletion/renumbering:

| Old position | Revised position | Change |
| --- | --- | --- |
| 1 | 1 | DM.0 products, refreshed current-plan evidence |
| 2 | 2 | DM.2 numerical period supplier; Ω removed |
| 3 | 3 | DM.4 gains the algebraic coefficient-action interface |
| 4 | Deleted | Factorials and small power sums join route 5 |
| 5 | 4 | DM.8 gains Ω; scalar Part II lemmas removed |
| 6 | 5 | Existing Part II source, corrected theorem logic and gap ownership |

## Validation and limits

The paper checker, intake `check-files` for the three deliverables and
`git diff --check` pass. A fresh full-inventory diagnostic verifies:

- 116 unique item ids, 305 valid internal edges, an acyclic order containing
  every item, and exact-once coverage of all 17 missing items;
- all 92 planned references point to actual nodes in the three current
  accepted packets; all five source routes name existing owners;
- every verifier-requested supplier/consumer edge and the transitive
  lower-layer ownership checks;
- 40 family-count/block-bijection cases for q=2,3,4,5 and weights 1–10;
- 294 formal recursion-support cases and 1,176 exact rational-function
  realization identities over F_2(θ),F_3(θ), for both input weights 1–3 and
  cutoffs −1,0,1,2;
- the corrected Chen coefficient, characteristic-2 cancellation, boundary
  behavior, AT q=2 coefficient and normalization parity examples.

Fresh source hashes/read sections and pinned declaration-file hashes are
recorded in the result. Source issues E1–E16 retain their prior independent
verdicts and version scope; their descriptions are paraphrases, not source
passages. Earlier broader diagnostics are historical, not re-executed checks.
The finite diagnostics are not proofs. No Lean deliverable was authorized or
elaborated, and no implementation or closed external proof is claimed.
