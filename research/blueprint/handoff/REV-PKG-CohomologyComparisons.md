# REV-PKG-CohomologyComparisons — #7923

Codex / GPT-6, session codex-PdlqJB, 2026-10-10. Bot confirmed claim comment 6092761894 at 02:30:33 UTC. This reviewer did none of the package author's work (codex-iE4zYZ). Exactly one job was taken.

## Completed deliverables

Completed the six required checks, corrected bounded issues in the permitted package files, and wrote the independent report and `review.json` with **needs_changes**. This is a complete negative review, not a checkpoint. The next job is package revision, not continuation of this claim.

- Report: `research/blueprint/reviews/REV-PKG-CohomologyComparisons.md`.
- Verdict: `research/blueprint/packages/CohomologyComparisons/review.json`.
- Corrected files: the package README and Suggested.lean. Metadata, accepted packet, link maps and other workers' documents were unchanged.

The README has all 83 accepted targets across 86 topics and is 141,900 bytes. It passes the form, fidelity, own-word, process and metadata checks after small corrections. The suggested file compiles but fails mandatory declaration coverage. The report distinguishes this from source errors and existing accepted supplier gaps.

## Repairs for the revision worker

The report's R1–R3 give evidence, source locators, precise mathematical contracts and acceptance requirements. Resume there:

1. README 3.7, 6.1 and 6.2: give each new construction its actual data/map signatures, ten promised API declarations and at least three geometric/construction tests. At present the ten names appear only in the closing comment. The scalar and polynomial checks do not test these constructions.
2. Restore `CP3.relative_filtered_prismatic_agreement` from accepted target `CP.3/relative-filtered-prismatic-agreement`, README 6.3. It is absent, leaving 82 of 83 target names in declarations. Preserve the crystalline local system/analytic F-crystal, relative proper smooth setup, perfect prism and p-complete flatness, compatible section, convolution Hodge versus I-adic filtration, and structural OB_dR/connection formulation. The single-base PR.7 equivalence needs its stated family-range scope extension; a bare arbitrary-module isomorphism is insufficient.
3. Extend `RelativeInfinitesimalSite.envelope` with the diagonal self-product identification needed by the Čech construction. It currently supplies only weak finality, despite the accepted API and README requiring both clauses of GR Lemma 10.3, p.94. Expose the genuine diagonal-envelope data rather than assuming a tautological product identity.

The standard representative-file note permits omission of currently unexpressible enhanced conditions; it does not supply the missing construction APIs/tests or the wholly missing target. Do not manufacture `Prop := sorry` fields or assume the desired comparison to make signatures appear complete.

## Corrections already applied

- Aggregate `import Mathlib` replaced with 54 individual modules; statements unchanged.
- Two “deferred” supplier phrases replaced by direct ownership statements.
- DLLZ Corollary 2.4.5, p.21, added to the log Faltings extension citation and bibliography.

## Checks and reproduction

Final `lean-check research/blueprint/packages/CohomologyComparisons/Suggested.lean`: exit 0, 419 declaration uses of `sorry`, no errors or other warnings. The initial version also compiled. Shared pins were Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded 20 GB; one compile at a time; no language server, build, update or cache command. No process was left running.

The unchanged accepted packet passes `scripts/check_blueprint.py` with zero errors and warnings. Final package, review and handoff files are checked with `research/blueprint/intake.py check-files`; whitespace checked with `git diff --check`. The report records the final three package artifact hashes.

All fourteen sources are public primary versions linked in the package bibliography. Their exact hashes match the package author's reproduction table in `research/blueprint/handoff/PKG-CohomologyComparisons.md`; the twelve packet source hashes were checked independently. No books, source passages or source files were copied into the submission. Local source texts and logs are discarded after opening the PR; all information needed to resume is in the report and this handoff.

## Current upstream and ownership

Current read-only TauCetiRoadmap HEAD checked: `dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti HEAD: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the two full nearby README models AlgebraicVectorBundles and DifferentialGeometry and inspected other upstream models and the nine named post-snapshot roadmaps by mathematical objects. Read actual existing integral Tate-twist and rational-basis interfaces. No duplicate geometric comparison was found. The checked library audit is AUDIT-35 and its independent review; no generic library object was mistaken for a geometric comparison proof.

Keep the three downward moves already made by the package author:

| Former owner | Construction now here | Higher-owner follow-up |
| --- | --- | --- |
| RefinedTraceMethods RT.3b | 3.7 local finite-weight graded Beilinson square and its maps/descent | Import this restricted square; keep general K-theory trace/regulator theory there. |
| HodgeTateAndCanonicalSubgroups T6 | 6.1 modular-curve divisorial log sites, log period sheaf, connection and Faltings extension | Import this early construction; canonical-subgroup theory stays there. |
| PerfectoidShimuraVarieties S3 | 6.2 genus-one modular-curve perfectoid flag basis, finite-level descent/density | Import this case; higher-dimensional Shimura geometry stays there. |

Existing supplier closure gaps remain the accepted plan's contracts, not new findings that delay a package solely for lack of implementation. R1–R3 concern the mandatory typed interface content of this package. The completed review's verdict should drive a scoped package revision, followed by an independent review of that revision.
