# Independent review: HeegnerPointEulerSystems HE.8b

**Accepted**, as a complete target-level planning pass with HE.8b **planned**, not closed. The three supplier gaps remain explicit. This verdict certifies the corrected plan, not formal implementation or supplier proof closure.

Job: REV-HeegnerPointEulerSystems--HE.8b; issue #9389. Reviewer: Codex, session `codex-sbPb0y`, 14 October 2026. The predecessor and this packet were written by other sessions. The generated issue's HE.0 predecessor reference is stale: HE.0 now stops at HE.7. The actual thirteen imports come from HE.7s and its accepted final independent review, `REV-HeegnerPointEulerSystems--HE.7s~2`.

## Counts and verdicts

| Item | Result |
| --- | --- |
| Arithmetic nodes checked | 15: thirteen inherited targets and two new key comparisons |
| Node verdicts | 14 verified, 1 corrected, 0 added, 0 unverifiable |
| Audited HE.8b endpoints | All four mapped; rational and integral Heegner and Greenberg branches remain distinct |
| Positive baseline declarations | 7 confirmed at the exact Mathlib pin; 0 removed or replaced |
| New definitions, API items and definition tests | 0, 0, 0; this pass introduces no definition or construction |
| Suggested examples | 8 native algebra examples; no arithmetic carrier or data admission |
| Sources | 8 independently acquired PDF receipts, all hashes matched |
| Source findings | 2 independently confirmed; no additional finding added |
| Outstanding contracts | 3 explicit gaps, 8 precise requests, including one separate cyclotomic routing request |
| Planets | 0 new; 5 inherited |

The complete per-node verdict register is also in the packet's `review.checked`.

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| `primitive-greenberg-mu-vanishing` | corrected | BCS 4.2.2 and CGS 2.4.4/5 support the analytic projection, integrality and μ argument. Restated as an imported L5a/L3h proof contract with its HE.8b denominator-clearing consequence; removed the duplicate μ planet and corrected Rubin/HT ownership. No μ(J)=0 or individual integral equality is inferred. |
| `anticyclotomic-specialization-control` | verified | JSW 3.4.1/2 gives the imprimitive finite-error dual surjection and the stated containment direction. Primitive Euler-factor transport, exact local hypothesis range, completed coefficients and Fitting/reflexive closure remain explicit G1/R3/R4 obligations, not universal quotient identities. |
| `bdp-function-convention-comparison` | verified | BCS 1.2.1/1.2.4 and BCGS 1.2.1/1.2.10 use squared and root conventions respectively. Existing GZ.9 integral-unit gap is retained; a rational interpolation identity does not remove it. |
| `anticyclotomic-formulation-comparison` | verified | Published BCK 5.2 is integral at p>3 under H0=0; CGLS 4.2.1 is rational for odd p. Separate Theorem 5.1 hypotheses and the uncertified weak-torsion integral p=3 extension are not folded into the comparison. |
| `auxiliary-quadratic-field-verification` | verified | BCS 5.2.1/5.2.3 six conditions checked. Independently checked the fixed-K CRT prime construction, residual splitting-field avoidance, twist surjectivity and finite ramification needed by L5w’s narrow-class-field refinement; exact Fujiwara/minimal-lift inputs remain supplier obligations. |
| `anticyclotomic-euler-system-divisibility` | verified | BCS 4.2.1 and CGS v2 6.5.2 give the weak irreducible rational bound and the distinct surjective integral branch. ES.8’s generic Rubin exports cannot silently replace those hypotheses or the augmentation-inclusive refinement. |
| `anticyclotomic-reverse-product-divisibility` | verified | BCS 5.2, especially 5.2.1 and the anticyclotomic endpoint proof p.11, gives the product route. New μ/control dependency refinements are essential. The inherited locator’s trailing §5.3 is superfluous: the acquired v2 has §5.2. No completed L5b input is used. |
| `rational-heegner-main-conjecture` | verified | BCS 1.2.2(a) is rank-one equality in Λ[1/p] for p>3 and irr_GQ; fixed-K residual restriction is justified and no analytic-rank or class-number premise is added. |
| `integral-heegner-main-conjecture` | verified | BCS 1.2.2(b) adds residual GQ surjectivity. Exact regulator/local-control inputs remain requested; rational equality alone does not yield the integral assertion. |
| `rational-greenberg-bdp-main-conjecture` | verified | BCS 1.2.4(a) supplies torsionness and equality after p-inversion with completed unramified coefficients and the squared/root convention comparison. |
| `integral-greenberg-bdp-main-conjecture` | verified | BCS 1.2.4(b) integral surjective branch checked with the same primitive local conditions and coefficient ring; no arbitrary p-primary Selmer defect is erased by analytic μ=0. |
| `eisenstein-main-conjecture-adapter` | verified | CGS Theorem C and 6.5.3/4 supply the independent integral anticyclotomic branch with φ at Gp different from 1 and ω and no older (Sel) assumption. The dependency refinement imports the exact early BSD.7a node; accepted CM/analytic ownership routes repair R7/G3 without using cyclotomic Theorem A. |
| `split-kolyvagin-nonvanishing-branches` | verified | BCGS A, 1.2.13 and proof pp.15–16 retain separate Eisenstein, p>3 irreducible and p>3 surjective main-conjecture branches; κ1 may vanish and finite-system nonvanishing is still the conclusion. |
| `split-refined-kolyvagin-divisibility` | verified | BCGS B and proof pp.19–20 require p>3, residual surjectivity, integral main conjecture and p-optimal parametrization. The K-prime half-sum equals the rational Tamagawa sum because bad primes split. |
| `split-determinantal-heegner-main-conjecture` | verified | CS Theorem C, 3.2.3 and 3.4 require p>3, surjectivity and p-unit Manin constant; the split integral BCS equality gives the determinant basis. This chain supplies no inert main conjecture. |

## Corrections made in place

1. **Follow the confirmed elliptic-unit ownership decision.** RT-AREA-iwasawa-1/5's follow-up rejects a second imaginary-quadratic unit roadmap. Accepted PAPER-BURUNGALE-TIAN-26 route 7 and PAPER-CASTELLA-ETAL-22 route 8 already route elliptic units and Rubin to the pending CMAllPrimeMainConjectures Part II design, issue #1884. Replaced the obsolete HE.7s/BSD.7 proposal everywhere in this packet and reader. Kept Hida's Katz μ theorem with L3h and Hida–Tilouine Theorem 0.3 with the proposed AC L0c owner of confirmed RT /26. Exact proof exports remain missing; identifying an owner does not discharge G3.
2. **Import the shared analytic proof.** Confirmed RT /15 and /29–30 assign the BCS 4.1.3/4.1.4 comparison to proposed Kato L5, imported by L5a, and the Hsieh/CGS projection to L3h. L5a retains BCS 5.2.1 and 5.1.1/5.1.2. Changed the new primitive-μ node from a second theorem implementation to a comparison recording this input and its HE.8b denominator-clearing use; removed its duplicate planet. The mathematical statement and its precise coefficient/local hypotheses remain. No μ=0 conclusion for the Selmer characteristic ideal is inferred.
3. **Remove the artificial return edge.** Following confirmed RT /31, HE.8b and cyclotomic L5b independently consume the early L5a product engine. L5b also needs Kato L4. Corrected the reader's opening and acceptance checklist, packet request and restructuring proposal; no supplier or atlas edge was edited.
4. **Keep the integral Kato issue separate.** Wüthrich's distinguished-lattice refinement runs through Kato L4 to BSD.7a's cyclotomic consumer. It is not an additional premise of the independent early anticyclotomic CGS Theorem C. R8 now has an explicit routing-only interpretation.
5. **Respect supplier status.** The current PMA packet needs changes. Its planned characteristic-ideal interfaces are not certified imports. Accepted generic ES.8 Rubin machinery does not automatically provide the weak-residual, augmentation-inclusive Heegner bound or erase Howard's extra hypotheses. Recorded both limitations in gaps and reader.
6. **Check the fixed-K auxiliary-field step.** Expanded the existing proof, without adding a node: choose the auxiliary prime by CRT/Dirichlet with the prescribed odd-prime symbols and q congruent to 1 modulo 8 times the absolute discriminant; avoid the finite residual splitting-field exclusions. A prime dividing the nontrivial odd D_K stays ramified in FK/F, verifying the reviewed L5w narrow-Hilbert-class-field noncontainment. Absolute residual, local exceptional-type and minimal-lifting supplier checks remain open. Also checked residual restriction and twist surjectivity separately.
7. **Record the review.** Added all fifteen verdicts, source-issue confirmations, exact-pin declaration receipts, current-library/roadmap audit, counts and validation evidence. Brought the reader and Suggested comments into agreement. No source excerpt, new arithmetic Lean definition or predecessor edit was introduced.

## Sources, conventions and proof boundaries

Read the relevant statements and proof arguments in the eight versions linked in the packet's `sources` and `sourceVersionsChecked`. Locators above refer to those acquired versions; BCS v2 and its publisher-form PDF were collated. BCS Theorems 1.2.2/1.2.4 (v2 pp.2–3) distinguish rational residual-irreducibility conclusions from integral residual-surjectivity conclusions. Their endpoint proof in §5.2 (v2 pp.9–11) does not impose analytic rank. The inherited reverse-product locator's trailing §5.3 is superfluous in v2; §5.2 and its endpoint proof are the relevant text.

The new control contract uses JSW v1 Lemma 3.4.1 and Corollary 3.4.2 (pp.20–21): finite-error dual surjection, Fitting ideals and reflexive closure give the stated containment direction. That source is imprimitive. Primitive Euler factors, the exact admissible arithmetic hypotheses and completed-unramified coefficients remain G1, rather than a purported general quotient rule for characteristic ideals. The anticyclotomic torsion input is independent of the equality being proved.

Checked the BDP root/square convention and retained GZ.9's integral comparison-unit gap. Published BCK Theorem 5.2 (pp.1646–1647) has its own p>3 and H0 hypotheses; stronger conditions from Theorem 5.1 are not silently imported. CGLS Theorem 4.2.1 is the distinct rational comparison. CGS v2 Theorem C, Lemma 2.4.4, Proposition 2.4.5 and §6.5 keep early Eisenstein anticyclotomic integrality independent of the later cyclotomic result. Rubin/Hida–Tilouine congruence inputs survive removal of the older Selmer assumption. BCGS Theorems A/B and their proofs (v2 pp.15–16, 19–20) retain conditional finite-system nonvanishing, the separate residual branches and p-optimality for the refined equality. CS Theorem C and §§3.2–3.4 (v1 pp.4, 13–17) retain the p-unit Manin constant and determinant-lattice conditions. No inert-p main-conjecture conclusion is claimed.

Confirmed E11 at the three stated BCS publisher-form references (pp.11 and 13), where the theorem is misnamed as a proposition. Confirmed E12 in the projected product display (published p.12): both characteristic ideals before projection are over the two-variable ring. These are notation/reference slips, not changes to the intended containment. Both persist in the acquired v2 and published copies. E11 was already noticed in confirmed RT /29. Targeted author-page, arXiv and journal-listing checks found no linked published correction; this is not an exhaustive errata claim.

## Baseline, granularity and checks

Read the full declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `PowerSeries.coeff`, `constantCoeff`, `X`, `coeff_X_pow`, `map`, `coeff_map`, and `Ideal.span_singleton_le_span_singleton`. The packet records modules and exact lines. The series operations have the required semiring/ring hypotheses; the ideal theorem fixes the containment/divisibility direction. No citation was removed or fixed. Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` supplies no cited positive arithmetic declaration here; its explicit 2-descent Selmer group is not an ordinary Λ-adic Selmer carrier.

Read the reviewed HE.8b audit: all four endpoints are absent. Checked the pinned libraries, current library and current upstream roadmaps, including the post-snapshot roadmaps and nearby ProfiniteArithmetic/JacobianChallenge documents. No existing implementation or roadmap target is replanned. The stale audit comparison locator is explained in the packet. Fine supplier statements were inspected in SIC, PMA, GZ.9, BSD.7a, L5w and ES.8; their limitations feed G1–G3.

Target-level granularity is retained: no proof expansion into routine lemma nodes, and no new definitions needing APIs or three definition tests. Under the 2026-10-12 WORKERS shape, arithmetic targets whose carriers are absent remain full README statements. Suggested.lean contains eight concrete algebra convention checks, with honest proof admissions and no data admissions.

Validation on 14 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean`: exit 0 at the pinned shared build; 68 lines, exactly eight expected sorry warnings, no other warning.
- Independent source-receipt, source-issue/schema and version-coverage checks: passed; all fifteen roots have exactly one justified verdict.
- Applied both proposed dependency refinements for a traversal of packet fine-node prerequisites: 3,743 reachable nodes and 2,562 terminal references, no cycle and no completed L5b or late cyclotomic CGS equality input. The thirteen imported HE nodes were resolved explicitly to accepted HE.7s; no duplicate node collision occurs in the reachable set. Stage references are terminal contracts, so this traversal does not certify supplier proof closure.
- `git diff --check`: passed.

## Orchestrator follow-through

Accept this corrected pass. During normal assembly apply its two dependency refinements without replacing the thirteen stable imported IDs. Retain G1–G3 and R1–R8; route their exact contracts to the existing or proposed owners above. Apply the recorded restructuring through the maintainer, including removal of the artificial HE.8b→L5b edge. No upstream definition move or supplier file change is made by this review. There is no unfinished review question; supplier closure belongs to the named follow-ups.
