# Independent review of FIX-RT-RS-23

**Verdict: accepted.** Codex, session `codex-J6LwjP`, 2 October 2026. I did not write RS-23, its earlier review, RT-RS-23, its verification or the fixes by Claude Code (`cc-c2c06b`). This review follows `independent-review-REV-RS-23` of 29 September and the finding confirmation in `RT-RS-23.review.json`. Input: commit `5a4909b`.

## RT-RS-23/1 — generic algebraic-forms ownership

**Fixed; no substantive correction needed.** The verified finding explicitly permits the existing AF.5 with an exact export contract. The revised R18.3 decision is `narrow`, names `AutomorphicFormsOnReductiveGroups:AF.5` in `suppliedBy`, and specifies the coefficient-function, Hecke and change-of-level API. The new owner record and AF.5 → R18.3 edge encode the same boundary. It does not cite the earlier proposed `AF.5:algebraic-forms` prefix, which is still absent.

I compared the full confirmed finding and fix report with the decision, owner record and edge, the member's R18.3 text, the AF stage contracts and the reviewed AUDIT-13/AUDIT-15 rows. AF.4 provides the coefficient lattices and already precedes AF.5. The general Hecke infrastructure is an AF.0/AF.2 input to the dictionary, rather than another quaternionic construction. AF.5 retains its GL1/GL2 and other dictionary work; the proposal exports only the required algebraic-forms contract.

The definite quaternionic specialization over a totally real field, class set, stabilizer computations and level-dependent finiteness remain in R18.3. So do Taylor–Wiles freeness under its actual hypotheses and KW II's dyadic twisting. The explicit warning that finiteness does not imply group-ring freeness survives. The GL2 comparison remains an application of R17.3: its RS-21 supplier edge is present in fresh assembly. No second global Jacquet–Langlands theorem is commissioned. The proposal does not assert that all central-unit stabilizers are finite or that an arbitrary integral coefficient module is free.

The fix report correctly distinguishes an owner contract from a completed AF.5 blueprint. AF.5's detailed generic integral construction, precise admissibility conditions, API and tests must still be developed there. This restructuring acceptance does not certify an uninspected Gross formula or discharge supplier proofs. No new definition node or pinned Lean declaration was added, so there is no new node API/test or declaration-statement claim to validate. The audit's historical absence descriptions are evidence of the overlap, not a fresh exhaustive absence search.

## Dependency and preservation checks

- All 20 layer decisions, 15 links and 10 owner records resolve. Both roadmaps remain; no stage is dropped or moved.
- Fresh assembly plus the proposal is acyclic: 2,581 incident vertices and 8,635 distinct edges, including both explicit stage edges and `requires`. AF.4 → AF.5 and R17.3 → R18.3 are direct edges.
- Adding every proposed restructuring, link-map and packet link gives an acyclic union of 2,650 vertices and 8,889 edges. There is no reverse R18.3 → AF.5 path.
- The earlier H0/H1/M5/M6 decisions are untouched. In particular, M5's unitary consumers and M6's Hodge-line/descent exports and nonemptiness tests remain as corrected by the previous review.
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-23.result.json`: passes. Intake path/content checks and `git diff --check`: pass. No packet or standalone link map is a deliverable of this job.

Only the top-level review object was replaced. No mathematical correction was needed. No Lean file was changed or compiled; no build, cache download or language server was started.

## Sources and limits

The directly read public ownership sources are [AF contracts](https://github.com/CBirkbeck/tauceti-explorer/blob/5a4909b/content/campaign/AutomorphicFormsOnReductiveGroups/README.md), [quaternionic contracts](https://github.com/CBirkbeck/tauceti-explorer/blob/5a4909b/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), [reviewed library audit](https://github.com/CBirkbeck/tauceti-explorer/blob/5a4909b/data/library-coverage.json), and [RS-21](https://github.com/CBirkbeck/tauceti-explorer/blob/5a4909b/research/blueprint/restructure/RS-21.result.json). The [confirmed finding](https://github.com/CBirkbeck/tauceti-explorer/blob/5a4909b/research/blueprint/redteam/RT-RS-23.review.json) supplies the allowed repair and explicitly excludes certification of the earlier Gross formula. This is a review of that ownership correction, not a new extraction of Gross or Khare–Wintenberger.
