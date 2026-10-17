# BP-PrismaticCohomology~2 — blocked revision checkpoint

Issue [#10119](https://github.com/CBirkbeck/tauceti-explorer/issues/10119); Codex, session `codex-pqU1gU`; 2026-10-17. Claim comment 6234129701 was confirmed by the bot in comment 6234130776. Branch `codex-pqU1gU-prismatic-revision`. Only this job was claimed. This checkpoint refines the formal-affine comparison on regular prism charts. It does not complete assembly or independently review the preceding checkpoints.

## Scope blocker

[WORKERS.md](../WORKERS.md), “Doing the work”, says **“Edit only the files the issue names, plus your own scratch space.”** The issue names only the top packet, reader, suggested Lean file and this handoff. The independent [REV-PrismaticCohomology](../reviews/REV-PrismaticCohomology.md), “Required revision and orchestrator decisions”, requires an effective serialized graph preserving the inherited canonical IDs and metadata. The checker rejects that graph while the retained parts exist. The importer does not assemble `imports`; promotion copies the packet as written. Removing parts is rejected by the submission workflow, and renaming their IDs would break the required preservation.

I requested authorization to extend this issue to checker, promotion, importer and submission scope rules through an asynchronous question. No answer had arrived when preparing this checkpoint. No out-of-scope repository file was edited. This is a scope blocker, not exhaustion of the eight-hour allowance. The existing independent `needs_changes` verdict is untouched.

Reproduction, freshly checked against the current scripts:

1. Load the top packet, `PrismaticCohomology--PR.0.json` and `PrismaticCohomology--PR.8.json`.
2. In scratch, union nodes by `id`, source records by `id` and baseline declarations by `ref`, keeping top records first. Name the diagnostic `PrismaticCohomology.json`.
3. Call `check_blueprint.check(scratch_path, None, check_blueprint.world())` and inspect the entire error list, not the truncated CLI display.

There are **380 nodes, 154 baseline references, 41 source IDs and 54 planets** after this checkpoint's new source. There are **361 errors, all canonical duplicate IDs**: 282 against PR.0 and 79 against PR.8; no other errors. Eight inherited IDs first resolve to integrated decomposition nodes, so do not trigger this check. The deliberately incomplete metadata union also has 408 warnings. It is a diagnostic, not a candidate packet: requests, gaps, source issues and provenance still require reconciliation.

## New mathematics: unbounded effectivity on regular charts

The refined target is `PR.5/formal-affine-complete-qcoh`, in the packet and the reader's PR.5 section. It still states Bhatt–Lurie's full bounded-prism target. Its proof now establishes the unbounded comparison when J=(p)+I has a finite regular generating sequence, including crystalline and transversal charts. The general bounded-prism case outside that range remains a precise gap. No claim that bounded torsion or weak proregularity alone proves that remaining case was added.

The proof is an explicit regular-ideal specialization of the mechanism in Bhatt–Scholze, *The pro-étale topology for schemes*, Lemmas 3.5.4–3.5.5 and 3.5.7(5), printed pp.25–26. Their surrounding setup is noetherian; the argument recorded here uses the following uniform Koszul calculation and does not import a noetherian assumption:

1. For a regular sequence f_1,...,f_r, use B_n=A/(f_1^n,...,f_r^n). These ideals are cofinal with powers of J; B_n is A-perfect of amplitude [-r,0]. For a derived scalar-compatible system M_n, put M=Rlim M_n. All its terms and its limit are derived J-complete.
2. For n>=k, the coefficient fibre E_(n,k)=fib(B_n tensor-derived over A with B_k -> B_k) has cohomology in [-r,-1], with degree -j equal to the j-th exterior power of B_k^r. Koszul transition maps multiply degree-one generators by f_i^(m-n), so kill all these groups when m-n>=k.
3. Restrict the finite chain of coefficient maps to the common source ring B_(n+rk). A composite of r cohomologically zero maps between objects supported in r degrees is zero: successively factor through target truncations <=b-1, <=b-2, and so on. Thus E_(n+rk,k)->E_(n,k) is zero **in the derived category of that source ring**, before tensoring. Merely proving pro-vanishing of individual Tor groups would not justify the next step for unbounded M_n.
4. Tensor with M_(n+rk) and use compatibility. The tower of fibres of M_n tensor-derived over A with B_k -> M_k is uniformly pro-zero, with lag rk, and has zero derived limit. B_k is perfect, so its tensor commutes with the inverse limit. This proves B_k tensor-derived over A with M is M_k without any truncation hypothesis on the system.
5. The unit on a complete M is DD.1's Koszul completion tower. The construction gives inverse enhanced functors and mapping spaces. Evaluation and derived scalar change supply the coherent completed tensor, pullback and colimit formulas in this range.
6. In a crystalline prism, p is regular and J=(p). For an oriented transversal prism, d is regular and p is regular on A/d, so (d,p) is regular. Local orientations are compatible by descent and the intrinsic reduction functor. No regularity claim for (d,p) on an arbitrary bounded prism is made.

Added `FormalAffineQCoh.regularReductions` to the API and two discriminating checks:

- `twoSidedUnbounded`: on the q-de Rham prism A=Z_p[[q-1]], B_n=A/(p^n,[p]_q^n), the single compatible system direct-sum_j B_n[j], over all integers j, reconstructs the zero-differential complex with A in every degree. Its cohomology is nonzero in every integer degree. Testing individual shifts alone would not establish this range.
- `principalTorTransition`: over Z_p, E_(n,k) is Z/p^k[1], and the transition from n+k to n is zero as a Z/p^(n+k)-linear map, although each finite-level Tor group is nonzero.

The existing DD.1 `koszul-complex` and `koszul-completion-tower` are now explicit prerequisites, alongside its completeness, reflector and exchange contracts. Their actual supplier statements were read. No second generic completion or Koszul definition was planned. The suggested file explains this reader-only target; the required enhanced carriers are absent at the pins, so no placeholder Lean carrier or data definition was added.

## Sources and library checks

Fresh source readings for this run, with paraphrases and numbered/page locators in the deliverables:

- Bhatt–Lurie, *Absolute prismatic cohomology*, arXiv:2201.06120v1, Proposition 3.2.8 and Corollaries 3.2.9–3.2.10, pp.41–43; §3.3 through Corollary 3.3.11, pp.43–44. The paragraph before Proposition 3.3.5 and Warning 3.3.6 give the full bounded-prism comparison and its boundary. Corollary 3.2.9 is affineness; Corollary 3.2.10 is transversal flatness. SHA-256 `0b1beeb20c29424ed8e330c14a66b36c0edcc84255edf5caa0ff9e235139a269`.
- Bhatt–Scholze, *The pro-étale topology for schemes*, arXiv:1309.1198v2, 17 December 2014, Lemmas 3.5.4–3.5.5 and 3.5.7(5), printed pp.25–26. Read in place in the maintainer-supplied author preprint; added source `BS15-PROETALE`. SHA-256 `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84`.
- Bhatt–Scholze, *Prisms and prismatic cohomology*, arXiv:1905.08229v4, §1.2 footnote 7, printed p.12. Its unbounded Koszul-completion comparison points to the method of BS15 Lemma 3.5.5, rather than an unrestricted ordinary-quotient inference from connective SAG. Read in place in the cleared author preprint. SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

No cleared library file or source passage was copied anywhere. No uncleared book was used. Existing source-issue verdicts and review scopes were not recertified.

Read the relevant reviewed AUDIT-38 prismatic records and review; `data/library-coverage.json` has no own PrismaticCohomology layer records. Reread all nine top baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `DerivedCategory`, `ModuleCat`, `Module.FaithfullyFlat`, `AlgEquiv`, `Algebra.FormallyEtale`, `KaehlerDifferential`, `ExteriorAlgebra`, `Ideal.span`, `AdicCompletion`. They supply ordinary carriers, not the missing enhanced comparison. The shared Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`.

Current read-only upstream commits: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read AlgebraicVectorBundles' ordinary QCoh/vector-bundle interfaces and AdicSpaces' Layer 6 again. Screened the suggested files of all nine newer roadmap families; OperatorTheory has eight split suggested files. No prism, delta-ring or formal derived-QCoh completion supplier was found there or in current Tau Ceti. Ordinary QCoh is imported, not replanned; the adic FF quotient is also imported, not treated as bundle classification or GAGA. No lake command ran in those trees.

## Concrete assembly proposal for the scope decision

This is a proposed implementation contract, not an implemented feature. The maintainer needs to authorize its paths and submission scope before a worker applies it.

- Add a pure shared resolver, for example `scripts/blueprint_assembly.py`, used by `check_blueprint.py` and `blueprints.py`. Its input is the set of named packet objects; its output is the effective set plus provenance and duplicate-resolution information. It must not infer precedence from filename order or treat every same-roadmap duplicate as acceptable.
- Introduce an explicit `assembly.supersedes` manifest on the whole packet. Each entry names one part's file stem, same roadmap ID, exact scope, sorted canonical node/planet/sourceIssue inventories and accepted review identity. Include a normalized payload hash and historical provenance so a changed part cannot silently be swallowed. Normalize source-excerpt removal consistently with promotion before hashing. Keep full historical review and sourceIssue records in the assembled packet, separately from its new review.
- In research validation, require each named part to exist, match that manifest and have an accepted historical review. The whole must contain every inherited canonical ID and planet, every sourceIssue with its verdict, and the sources/baseline references those records need. Reject foreign-roadmap parts, path traversal, scope loss, cycles or competing superseders. Allow a shared ID only for that validated whole/part relation. A retained historical part is checked in the same relation, not renamed or globally exempted.
- Promotion retains the existing independent-review gate. Validate the assembly before copying; preserve the parts as historical data. The atlas loader selects the accepted assembly and omits its named superseded parts from the effective set, rather than relying on per-node dictionary overwrite. Keep provenance readable. A source part not yet promoted, such as PR.8, must not prevent a complete accepted whole from being loaded: its checked inventory and preserved historical review travel with the whole. If a matching part is present in promoted data, verify it; reject a conflicting present version instead of silently choosing one. Source/promoted hash normalization and version policy need explicit tests.
- Test genuine same-roadmap supersession, unchanged ordinary packets, unrelated duplicates, a foreign-roadmap part, missing source part, canonical target/planet/sourceIssue loss, altered verdict, mismatched payload, ambiguous supersession, cycles, and a dependency on an inherited ID. Add a promotion/import round trip asserting all 380 nodes and 54 planets appear exactly once and that an unreviewed whole cannot hide accepted parts.
- Likely implementation paths are the new resolver, `scripts/check_blueprint.py`, `scripts/blueprints.py`, `scripts/promote.py`, their focused tests and the exact job-output/path handling in `research/blueprint/intake.py` and the submission workflow if required. Add these exact paths to this job's permitted outputs and apply a narrow explicit path rule; do not globally admit arbitrary scripts. A checker-only duplicate exception would leave importer precedence and historical provenance unresolved.

## Continuation

The top packet has 11 nodes, 6 gaps, 7 requests and no serialized inherited planets. Its 369 inherited targets, 54 planets and 91 sourceIssue verdicts remain in the accepted parts. All nine current coverage entries are partial; no implementation status or independent verdict was advanced.

1. Obtain the assembly scope decision and implement/test the agreed lifecycle. Then consolidate the actual graph and metadata; a first-record union loses provenance and is insufficient. Preserve every canonical ID. The independent review requires an effective graph, not a claim that `imports` assembles it.
2. Keep the prior general-envelope proof at `PR.0/general-prismatic-envelope` and bounded-base quotient proof at `PR.2/quasiregular-quotient-initial-prism`. They remain unreviewed additions. Their detailed hypotheses, proof steps, API, tests and source locators are in the packet/reader. The former uses the DD.1 telescope solution operations, a cardinal-bounded omega_1 closure and product/uniqueness construction over any orientable base prism. The latter uses perfected variables over an enlarged bounded prism and a natural idempotent to obtain initiality even for unbounded targets. Neither requires the original exactified kernel to be regular. Use the respective theorems for R6 rows 5/31 and row 30 after checking the log-to-ordinary adapter.
3. Check this run's regular-chart argument independently, especially its common-source-ring coefficient maps before tensoring and uniform lag rk. Finish or precisely retain the general bounded-prism effectivity gap. Do not cite connective SAG Theorem 8.3.4.4 as an unrestricted proof.
4. Preserve the previous q-topology/cofinal-powers and completed-coordinate decay work. The reader still requires quotient completeness and uniform division/decay for all inherited ind-etale/q-PD-envelope consumers before R2 can be applied. Individual continuity is insufficient for infinite summation. Keep the general operator-complex carrier with AI.1.
5. Apply only justified R1–R7 changes to serialized prerequisites and reader. Preserve trace/prismatic syntomic matching, integral mixed-characteristic A_crys/de Rham, schematic/analytic/Robba matching and FF classification/GAGA gaps. R6 row 27 retains DD.6's log-QRSP adapter; rows 37 and 40 are already resolved. No such consumer repointing was applied in this checkpoint.
6. Recheck the full graph and compact suggested file, then submit the completed revision for independent review. The node budget does not authorize discarding unresolved proof boundaries or historical verdicts.

## Validation

- Packet checker with a freshly generated declaration index from the existing pinned shared sources: **0 errors, 0 warnings**. Index: 70,802 Tau Ceti and 246,008 Mathlib declarations. Packet: 11 nodes, 6 constructions, 5 theorems, 9 baseline declarations, 6 gaps, 7 requests. All nodes together have 60 API entries and 42 tests; the checker counts the constructions' 56 API entries and 38 tests.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: **exit 0**, 26 warnings, all declarations using `sorry`, no other warnings or errors. Memory checked first: 90 GiB available. File: 368 lines. The three retained elementary sequence examples are proved; no sorry-bodied data was introduced.
- Sorry-data check, four-file intake check and `git diff --check`: passed.
- The scratch union's duplicate-ID failures are the documented blocker, not a passing assembly check. No checker, workflow, retained part, atlas data or review file changed.

Scratch is deleted after the checkpoint PR opens. All continuation information needed from it is recorded here.
