# PAPER-BRESCIANI-24 continuation checkpoint

Codex, session codex-a71f92, issue #1233, 21 September 2026. Continues PR #1634 by codex-c83e7a. Status remains partial.

All 22 published pages were reread. Stable IDs /1–/135 preserved; 149 items now: 8 library, 8 planned, 133 missing. Exactly 132 missing items are routed once; /58 alone remains unrouted. Ten routes: six source, four Part II. No Lean implementation or compilation claimed.

## Completed in this continuation

- Closed /29's completion source gap with a self-contained replacement proof: the affine complex base has free fundamental group, the curve fiber group is finitely generated, and the extension splits abstractly. Characteristic finite-index cores give finite quotient extensions and injectivity of completed kernels. Universal properties give right exactness and extend the splitting.
- Added /136–/139 as actual baseline suppliers; /140–/146 belong to the new Profinite and pro-p groups, Part II: exactness of completion for split extensions. IG.1 owns the geometric application /29. No residual finiteness/goodness or finite generation of the quotient is assumed.
- Read Bekka CorollaryC, its proof, and Proposition6(ii) as independent corroboration; the report supplies the full direct proof rather than depending on unread representation theory. Anderson remains unread but is no longer a dependency of this replacement.
- Directly read Borne–Vistoli Definition3.4 and Propositions3.9–3.11 with proofs. Split /35, /147–/149 into the relative-gerbe criterion, canonical factorization, limit detection and cofinal finite-image presentation, all SF.1.
- Restated /77 as the valid nonsplit-boundary counterexample and routed it once as a negative acceptance theorem. This DOES NOT repair the downstream parabolic proof.
- Rechecked all eight library statements, parent scope, and relevant audit rows. Finite regression passed 81,671 assertions; full Python reproduction and source hashes are in the report.

## Resume here

1. **Parabolic proof repair remains unresolved.** The printed all-affine-parabolic-sections-are-cuspidal sentence fails for P1_Q minus V(T²−2). Repair the nonsplit degree-two-boundary branch of Lemma16 (/81) and the t-b.l.⇒quasi-t-b.l. assertion (/96), without using TheoremA circularly. No disproof of TheoremA is claimed. Passing to a splitting field and calling every section cuspidal does not descend a rational cusp; finite étale covers of a parabolic curve do not automatically become hyperbolic.
2. **/58 remains the only unrouted item.** Verify the Galois-equivariant band comparison and generalized Albanese torsor. A loop-provided section neutralizes the gerbe; it does not produce x∈X(k) or a point of the Albanese torsor. The proper pointed Jacobian roadmap does not settle this.
3. Read Stix book Proposition75/Lemma259, Tamagawa Proposition2.8(iv), and Koenigsmann's original theorem. The Stix publisher book PDF attempt returned HTML; do not report that file as a book PDF.
4. Finish Mattuck's analytic proof decomposition and exact existing logarithm/formal-group ownership. The inherited Theorem7 statement at p.114 and its finite-torsion consequence were checked, not the full proof.
5. Complete the other inherited source decompositions and final full coverage audit. Keep the integral/all-prime Faltings refinement separate from the rational R28.4 theorem.

Preserve A.23 (not A.18) for arbitrary gerbe base change; restricted power-completed products; the proper diagonal pro-open; nonconverse of constant-loop⇒unique specialization; disjoint iterative Corollary10 divisors; monic Lemma9 lifts; and omission of the associated point before Lemma26 cusp packets.

All durable details are in the three deliverables. Run scripts/check_paper.py and structure/scope checks. Submit Refs #1233, never Closes, and do not unclaim a submitted PR.
