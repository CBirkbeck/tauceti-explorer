# BP-PrismaticCohomology~2 — blocked revision checkpoint

Issue [#10119](https://github.com/CBirkbeck/tauceti-explorer/issues/10119); Codex, session `codex-A1oqbT`; 2026-10-17. Claim comment 6233486235 was confirmed by the bot in comment 6233487445. Branch `codex-A1oqbT-prismatic-revision`. Only this job was claimed. This checkpoint records a new general-envelope proof; it does not complete the effective whole-roadmap assembly or independently review earlier work.

## Scope blocker

[WORKERS.md](../WORKERS.md), “Doing the work”, requires **“Edit only the files the issue names, plus your own scratch space.”** Issue #10119 names the top packet, reader, suggested Lean file and this handoff. Consolidating the retained canonical targets requires an assembly/part lifecycle in the checker and promotion/import machinery, outside those four files. Permission to extend the scope was requested in the session; no authorization had arrived when this checkpoint was prepared. No file outside the four deliverables was edited. This is a scope blocker, not exhaustion of the eight-hour allowance.

The independent review [REV-PrismaticCohomology](../reviews/REV-PrismaticCohomology.md), “Required revision and orchestrator decisions”, requires a serialized effective graph preserving the retained canonical IDs and metadata. `imports` is only provenance: promotion copies the top packet as it stands, and the importer reads its `nodes`. `check_blueprint.world()` visits the retained `--PR.0` and `--PR.8` packets before the top packet; the duplicate-ID check then rejects the union. Deleting retained parts is also rejected by the submission workflow. Renaming or omitting their IDs would not fix the mathematical artifact.

Fresh reproduction after this run's mathematical edits:

1. Load the top packet, then `PrismaticCohomology--PR.0.json` and `PrismaticCohomology--PR.8.json` from the packets directory.
2. In scratch only, union `nodes` by `id`, `sources` by `id` and `baseline.declarations` by `ref`, keeping top records first. Name the scratch candidate `PrismaticCohomology.json`.
3. Import `scripts/check_blueprint.py` and call `check(scratch_path, None, world())`. Inspect all errors; the CLI display is truncated.

Result: **379 nodes, 154 baseline declarations, 40 source records, 54 planets; 361 errors, all “also appears”, and zero other errors.** There are 282 duplicate reports against PR.0 and 79 against PR.8. Eight other inherited IDs resolve first to integrated decomposition nodes and escape this particular check. The diagnostic has 408 inherited metadata warnings. This first-record union deliberately does not reconcile all sourceIssue verdicts, requests, gaps or review history; it is a reproduction, not a submission candidate.

**Required maintainer action:** authorize a coherent assembly/part lifecycle and add its files to the issue scope. An explicit supersession relation should validate same-roadmap ownership, preserve every canonical target and historical review, and give checker, promotion and import the same effective precedence. Test legitimate supersession, unrelated duplicates, foreign-roadmap parts and dependency resolution. Submission/intake must admit the necessary paths. An isolated duplicate-check exception would leave promotion and provenance unresolved. No checker exception, part deletion or atlas data edit was made here.

## New mathematical progress: general envelopes

`PR.0/general-prismatic-envelope` now covers **any orientable base prism**, with arbitrary kernel, without assuming boundedness, complete flatness or a regular presentation. Its proof uses the existing `DerivedDeRhamCohomology:DD.1/derived-completeness` supplier instead of asserting discreteness of a derived completion. The detailed proof, hypotheses, five API entries and eight tests are in the packet and reader.

The construction is as follows, in our own words.

- For a discrete ring T, derived (p,d)-completeness is equivalent to bijectivity of the sequence operators Δ_f(x)_n=x_n−f·x_(n+1), for f=p,d. This is the DD.1 telescope criterion, not a new generic completeness definition.
- The inverse coordinates are countably-ary operations S_(f,n). Every A-map between complete rings preserves them by uniqueness. Subrings closed under all these operations are complete. Products are complete coordinatewise, and subrings/products preserve injectivity of multiplication by d.
- With κ=max(aleph_0,|A|,|B|), take λ=κ^aleph_0, so λ^aleph_0=λ and λ≥aleph_1. Given an admissible B→T, close its image and the unique quotients of all j∈J by d under ring operations, delta and every S_(f,n), for omega_1 stages. There are at most λ elements. Every countable tuple in the union occurs together before some earlier countable stage, so its solutions belong to the union. The resulting small subring is a target prism through which B→T factors.
- Take the product U of a set of representatives of all such small targets with their A- and B-maps. Inside U take the same closure of the diagonal image of B and its J/d quotients. This gives a discrete complete d-torsion-free delta-A-ring C. The prism relation comes from A. Product projections give maps C→every target, using the small factor just constructed.
- Any two delta-A-maps out of C agreeing on B agree on its unique d-quotients and preserve all solution operations. Induction on the generating closure proves uniqueness. Thus C has the full universal property, not only a weakly initial property. Orientation independence, functoriality and comparison with regular envelopes follow from that property.

The proof stays in ordinary rings and explicitly gives the cardinality bound and the reason for omega_1 rather than omega. It does not use a one-step torsion quotient/completion or assert that intermediate derived completions are discrete. It does not assert descent for a nonorientable base. It has not had independent review.

The old general-envelope realization gap and bounded-base restriction have been removed from the current target. R6 rows 5, 30 and 31 and the current reader gap list reflect this progress. **The effective consumer graph is still unmodified**, because assembly remains blocked. QRSP boundedness still requires a completely flat regular presentation and comparison with the regular envelope; that obligation is now named separately. General existence alone supplies neither flatness nor bounded output.

Four tests were added: identity over an unbounded base, the zero-parameter telescope, failure of injectivity for the unit parameter on Z, and the minus sign at parameter 2. The three elementary sequence computations are actual proved `example`s in the suggested Lean file. The envelope construction itself remains a reader target because its carriers are absent at the pins. No placeholder data, new axiom or sorry-bodied data definition was added.

## Sources and existing owners

Fresh reading for this argument:

- Koshikawa, *Logarithmic prismatic cohomology I*, arXiv:2007.14037v3, §3, Propositions 3.1–3.2, printed p.13; footnote 8, pp.13–14; Propositions 3.6–3.7 and setup/proofs, p.15. Proposition 3.1 has the orientable unbounded-base existence range. Proposition 3.2 has separate regularity/flatness/boundedness hypotheses. The small-solution-set proof above is this plan's alternative derivation, not a purported transcription of that source's proof.
- Bhatt, *Lecture V: The prismatic site*, §1 p.1 and Lemma 5.1/proof sketch p.6. These notes fix a bounded orientable base and sketch alternating torsion removal/completion. No unbounded-base proof is attributed to them.
- The Stacks Project, More on Algebra §15.93: Lemma 15.93.1(1),(6),(7), tag 091P and its two-term telescope proof; Lemma 15.93.2, tag 091Q; Definition 15.93.4, tag 091S. Read HTML and the More on Algebra PDF on 2026-10-17. PDF version ed88ff78, compiled 14 July 2026: Lemma 93.1 pp.261–262, Lemma 93.2 p.262 and Definition 93.4 p.263. Its printed numbering omits the HTML chapter prefix 15. These give the criterion already owned by DD.1; the packet records the exact version and hash.
- Bhatt–Lurie, arXiv:2201.06120v1, Proposition 3.2.8, Corollaries 3.2.9–3.2.10 and §3.3, pp.41–45. Retained the formal complete-module proof boundary. Corollary 3.2.9 is affineness; Corollary 3.2.10 is bounded transversal flatness. The historical review's prose reverses these numbers, but the current target uses the correct numbering.

PDF versions/hashes remain in the packet. Sources were read in place or downloaded as freely available papers into scratch; no source file, passage or section-by-section source summary was committed. No uncleared book was used.

Read the relevant AUDIT-38 prismatic library coverage; `data/library-coverage.json` has no top-level PrismaticCohomology entry. The current read-only upstream is TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AlgebraicVectorBundles already owns ordinary finite-projective/vector-bundle equivalence; AdicSpaces supplies its adic Fargues–Fontaine quotient, not the schematic bundle classification or GAGA. DGAInfinity does not provide formal complete-QCoh effectivity. No lake command was run in these read-only trees. The pinned shared sources contain no delta-ring, prism or general envelope carrier supplying this new target.

## Continuation after the scope decision

The 369 inherited targets, 54 planets, 91 sourceIssue verdicts and historical reviews still need preservation in an effective assembly. The independent top-level review applies to the earlier seven-node packet. All stages remain partial and all implementation statuses unchecked; this run did not mark anything independently reviewed or implemented.

1. Implement the authorized assembly lifecycle, then serialize the full effective graph. Reconcile source editions, review histories, sourceIssue verdicts, requests and gaps rather than taking only the first record. Strip inherited `excerpt` fields. The scratch union above is insufficient for this.
2. Check the new general-envelope proof independently and use it for R6 row 5. For initial-log-prism-qrsp, separately give the regular completely-flat presentation before invoking the bounded regular-envelope theorem. Do not restore the obsolete arbitrary-kernel regular-envelope replacement.
3. Finish or precisely delimit bounded-prism formal-QCoh effectivity for unbounded complexes and completed scalar/tensor coherence. SAG Theorem 8.3.4.4 is connective and cannot establish the unrestricted statement. BL22 p.43 gives the bounded-prism contract.
4. Preserve the earlier q-topology and convergence progress: explicit cofinal powers for (p,[p]_q), (p,q−1) and cyclotomic (p,ξ); the completed-coordinate construction under decay; standard polynomial/Laurent chart estimates; and the counterexample showing individual continuity does not give family decay. Verify quotient completeness and uniform division/decay for every inherited ind-étale or q-PD-envelope consumer before applying R2. Keep the generic operator-complex carrier with AI.1.
5. Apply only justified R1–R7 changes. Preserve the trace/prismatic syntomic and integral mixed-characteristic A_crys/de Rham interface gaps, plus schematic/analytic/Robba construction matching and FF classification/GAGA gaps. R6 row 27 retains DD.6's log-QRSP adapter; rows 37 and 40 are already resolved in the retained revision.
6. Recheck the full graph and compact suggested file before submitting the completed revision for independent review.

## Validation

- Packet checker against a fresh declaration index made by reading the existing pinned shared sources: **0 errors, 0 warnings**; 10 nodes, 55 API entries, 36 tests, 7 gaps, 7 requests and 9 baseline declarations. The 40-source diagnostic union is not the submitted packet.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: **exit 0**, 26 warnings, all declarations using `sorry`, with no other warnings or errors. The new three sequence examples are proved. Available memory was checked first: 92 GiB. The file is 348 lines.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PrismaticCohomology.lean`: passed.
- Intake file check: four deliverables, zero problems. `git diff --check`: passed. No retained part, workflow, checker or promoted data file was changed.

Scratch contains only diagnostic/source-reading material and is deleted after the checkpoint PR opens. Every continuation instruction needed from it is recorded here.
