# BP-ClassicalSerreModularity--R26.1~2 — completed revision

Issue #6949. Agent: Codex, session codex-vmLqNQ. Date: 2026-10-08.

This revision completes the planning pass for R26.1–R26.6 and R27.1–R27.2. The packet remains `complete`, with all eight coverage records `planned`; no stage is closed and every implementation status remains `unchecked`. It contains 36 nodes (14 theorems, 13 lemmas, 7 applications, 2 definitions), 16 API entries, 11 definition tests, 7 planets, 8 baseline declarations, 20 open supplier requests, 7 source findings and 6 gaps. No node id, planet or ownership boundary was replaced.

The previous independent review object and all seven source-finding review objects are preserved exactly. Its `needs_changes` verdict is the historical verdict on the previous reader; the next independent reviewer must replace it. This revision does not certify its own acceptance.

## What changed

The actionable review request was to synchronize the stale reader with the corrected packet. The reader now contains every declaration statement, input condition, construction/proof step, prerequisite, acceptance condition, definition use, API entry and discriminating test from that packet. Its registers include all 20 requests, 7 findings, 10 source versions and 6 gaps. The suggested file's standard introduction now identifies the reader as definitive instead of saying synchronization is pending.

The following corrected contracts were checked against the primary files and carried into the reader:

| Review correction | Revision disposition |
| --- | --- |
| Copied hypotheses in ten prime, parity and terminal nodes | Kept each node's actual hypotheses. The five supports are {3,7}, {5,11}, {3,19}, {7,29}, {5,31}. P=29 uses j=16 or 14; only P=31 has the j=18 correction. |
| Local Frobenius polynomial | Kept the plus sign in β²+βγ(c−1)−ψ₀, the odd-prime simple-root check and the separating numerical example. |
| Compatible-system ramification | Retained each member's own coefficient-prime exception; clarified the good-dihedral preservation node's statement and first hypothesis to refer to fixed Weil–Deligne support. |
| Corollary 5.5 transport | Kept q≥k−1 for a fixed normalized weight, and the full-theorem requirement for part (ii). A bounded weight result alone is not used as its premise. |
| General crystalline weight-k lift | Kept the published Annals Theorem 3.3/Theorem 4.2(i) supplier, with the dihedral branch handled before a cyclotomic-irreducibility lifting theorem. |
| Residually degenerate branches | Kept reducible, bad-dihedral and cyclotomically absolutely irreducible solvable cases distinct. Solvability supplies no automatic ordinarity; a ramified foil uses the general normalized bad-dihedral weight lemma. |
| Breuil–Mézard and Savitt | Corrected the reader's false assertion that BM Proposition 6.1.1 was unobtained. Recorded its odd-prime, non-scalar principal-type and arbitrary-stable-lattice contract without an endomorphism premise; separated the scalar crystalline weight-two Proposition 4.1.1 case, including p=3. Savitt's lattice hypotheses remain. |
| KW dyadic recursion | Kept e≥4, r as conductor-prime count, the strict 176<208 example, the no-new-fixed-support justification at the foil, and the third system/final reduction to the predecessor prime. |
| Definitions and suggested interfaces | Kept the locally-good existential wrapper, its API/tests, both interval lower bounds and residue uniqueness. Arithmetic examples remain unproved suggestions. Missing canonical representation-valued interfaces remain named omissions, with no placeholder proposition fields. |
| Source findings and versions | Included E13/E14 and the BM version in the reader. E12 now specifies the exceptional characters and their equality in our own words; its old published version remains unavailable. |

Two small packet clarifications accompany synchronization. Rosser–Schoenfeld's theorem/corollary attribution was reversed: Theorem 2 gives (3.3)–(3.4), and Corollary 1 gives (3.5)–(3.6), on printed p.69. The corrected prime-conductor statement has been rewritten in our own words, preserving its Duke-numbered supplier boundaries and CM-dihedral correction gap. No source passage or excerpt field is included in the deliverables.

## Ownership and red-team findings

RS-06 is accepted; its narrowed application contracts and unique suppliers remain in force.

- **RT-AREA-langlands-2/1:** the packet retains the proposed R27.1a early definition/image/Chebotarev prefix and R27.1b insertion split. Stable node ids remain unchanged. The sibling packet uniquely owns Lemma 8.2 and good-dihedral insertion. R26.6 remains the input to R27.3's W₁ base case. Repointing R27.1→R33.2/R33.3/R33.6 to the early prefix requires maintainer application; the live Atlas was not edited.
- **RT-AREA-langlands-2/7:** integral tame potentially Barsotti–Tate classification is requested from R07.5 after R07.4 descent, with the proposed R07.5→R24.6 consumer edge. R15.4 owns the integer Serre-weight recipe. The existing R07.5 packet does not yet provide the full Savitt/BM integral classification; the request is open rather than presumed satisfied.
- **RT-AREA-langlands-2/11:** R26.3 uniquely owns the odd auxiliary-prime estimate. R27.2 imports it and owns its dyadic next-prime application and fixed-r recursion. No duplicate analytic theorem was added.

A scratch graph simulation used every `data/atlas.json` stage prerequisite and every accepted RS-06 link. Before the split, R33.2 and R33.3 have R26.6→R27.1 paths, and R33.4/R33.5 inherit them. Replacing those three modern-consumer edges, assigning the early prefix only R01.4/R01.5, R15.4 and R24.5/R24.6, and adding R07.5→R24.6 leaves **no R26.x ancestor of any R33.1–R33.5 stage**. R33.1 already has none. Chebotarev Layer 10 is the upstream supplier outside that stage graph. The maintainer must apply the proposal and repeat this check; a successful simulation does not remove the sixth gap.

## Sources and baseline

All ten registered public files were re-fetched and matched their recorded SHA-256 hashes. The packet and reader give URLs, exact versions, theorem/section/page locators and this session's scoped reading boundaries. These cover Khare's level-one preprint, KW I, Böckle's appendix, corrected Savitt v3, Dieulefait–Pacetti v2, Ribet's semistable paper, Rosser–Schoenfeld's displayed bounds, BCDT's introductory conventions, the published KW Annals contracts and BM's relevant local propositions. Bibliographic titles identify sources; mathematical prose and source findings use our own words.

The unavailable published Khare Duke edition and Skinner's unpublished CM-dihedral correction remain unavailable. Savitt's older published lattice corner was checked only through the author's v3 correction. Rosser–Schoenfeld's analytic proof/verification tables and BM's integral calculations beyond the stated reading boundary are not certified as read. They remain the explicit source/supplier boundaries described below.

All eight cited Mathlib declarations were independently read at `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their nonzero and range hypotheses. Commit-qualified Tau Ceti reads at `f790474821cf4256814db967cb154e7af3d0c369` confirm that absolute Galois, modular-form and abelian-variety carriers already exist. The missing canonical interface is the assembled residual representation with local conductor, Serre weight and attached-newform witness. No replacement carrier was planned. The complete upstream Chebotarev and GlobalNumberFields reader documents were read; their existing constructions remain suppliers.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R26.1.json`: **0 errors, 0 warnings**.
- Exact comparison against the starting packet: all 36 ids and the top-level and source-finding review objects unchanged.
- Reader consistency: every packet statement, hypothesis, proof step, prerequisite, acceptance condition, API/test statement, request, finding, gap and source hash appears in the reader. No Lean code or local filesystem paths in the packet/reader.
- Independent sieve through 21,649: all **2,422** primes 5≤p≤21,591 pass with the least non-Fermat P, exact odd prime powers, ℓ≤p and the integer weight inequality; largest P is **21,599**. Every residue class in each selected half-open interval was checked, **3,979,274** in total, including uniqueness and both returned weights. All terminal-row cosets/weights, the sign counterexample, endpoint congruence non-example and strict dyadic example pass. Numerical logarithmic margins at 31 and 21,591 are positive. These external checks support the blueprint and are not formal proofs.
- Proposed stage graph: no R26.x ancestor of R33.1–R33.5 after the changes described above.
- Suggested Lean file: **compiled successfully with `lean-check`**, after the memory precheck, at the exact Mathlib pin. It imports only Mathlib. There were **32 expected `sorry` warnings and no errors**; it contains no proved implementation. The existing omission ledger names all unavailable canonical interfaces.
- `git diff --check`: clean. Only the four issue deliverables changed; no other packet, live roadmap, data, queue or review report was edited.

## Where follow-up work resumes

The next action is independent review of this completed revision, starting with the synchronized reader and its agreement with the packet. It should recheck the theorem/corollary attribution and the fixed-support clarification and replace the historical review object with its own verdict.

The six gaps remain: (1) the Khare preprint/published-edition crosswalk; (2) the exact Duke-numbered Theorem 5.1/6.1 lifting references in corrected Corollary 8.1; (3) Skinner's CM-dihedral correction; (4) the Rosser–Schoenfeld analytic/finite proof inputs and full Savitt/BM integral supplier calculations; (5) canonical Lean interfaces for representations, conductors, weights, local types, compatible systems and attached forms; (6) maintainer application of the early/late stage split and supplier edges. The packet's 20 open requests specify the outputs and consumer ids for this work.

R26.1 still needs its published source contracts; R26.2 its prescribed-lift and local comparison suppliers; R26.3 the analytic and certified finite prime bounds; R26.4 its ordinary/degenerate lifting suppliers; R26.5 all supplier-dependent terminal branches; R26.6 exact assembly, optimisation and finiteness interfaces; R27.1 the structural application and canonical local interface; R27.2 its system/lifting suppliers and representation-valued L/W/D interface. Each remains `planned`. No additional job was claimed during this run.
