# REV-PKG-CompletedCohomologyAndLocalGlobalCompatibility

Completed by Codex, session codex-duSGPF, on 2026-10-20. Refs #10895. Verdict: accepted with in-place README fixes. The independent report and package review.json are the deliverables; Suggested.lean and metadata.toml required no edits. The author of the reviewed package was session codex-2jsUrj (PR #11073), not this reviewer.

## What is done

All 49 accepted targets were checked for mathematical fidelity, dependencies, prime/coefficient restrictions and negative controls. All 18 flagged source areas and a deterministic random 15 further locators were inspected. All 57 packet test names remain; the one removed packet API is the generic `TauCeti.DefiniteQuaternionCompleted.heckeClosure`, supplied by `Subalgebra.topologicalClosure`. The arithmetic Hecke image/limit comparisons remain.

The principal corrections are the faithful degree-one versus derived Hecke distinction, geometric cyclotomic powers, right Iwasawa-module convention for typed tensors, IHG.4 determinant-limit existence, Pan's rho_lambda(-1) factorisation and its separate isotypy argument, the sign in the Eichler–Shimura deviation relation, Shimura H0 vanishing source, and deformation-side density for R=T. The README now states the precise globalisation and DFG hypotheses, corrects Pan Lemma 3.6.14 and Nakamura's page range, aligns the exceptional-point criterion and adds meaningful good-weight, projector and typed patched-module controls.

The current duplication check used TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. It included the nine newer roadmaps, Completed roadmaps and structural searches in the representation library. Pinned declarations were separately read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. No upstream checkout was edited or built.

## Ownership and implementation follow-through

No new cross-roadmap ownership transfer was made by this review. Retain the package's existing downward moves: Pan's pro-modular primes and nice-prime conditions from the R32 consumer, and the global potentially crystalline non-crystabelline algebraic-vector result from the otherwise local R30 direction. Its consumers must use this roadmap's interfaces. The new determinant-limit citation imports the existing IHG.4 §4.2 theorem rather than replanning it.

The package is ready for the upstream draft. Formal implementation must discharge the explicitly stated supplier extensions: integral away-from-p dual fibres, coadmissible cancellation, dyadic boundary and ordinary-component results, unrestricted local-ring properties, Pan's Iwasawa dimension comparison, general definite-F adapter, prescribed CM character/weight occurrence and the stated globalisation inputs. The Pan/Tung determinant dictionary and global algebraic det^(b+1)/det^b comparison remain named prerequisites before transporting those formulas. These are planned mathematics, not deferred review repairs or claims of completed Lean work.

Boeckle's author-PDF download timed out; the indexed author-PDF text of pp. 3, 9 and 10 was read, together with the relevant EM11/NAK arguments. The report does not claim full proof verification of that paper or independent access to unpublished EM11 [42]. The exact required statements are retained as supplier targets. No cleared-library book was needed. No suspicious instructions were encountered or followed in sources or other authors' material.

## Checks and resumption

- `lean-check` on Suggested.lean: exit 0, only five `declaration uses sorry` warnings (lines 76, 111, 167, 205, 227). Checked at the prescribed Mathlib/TauCeti pins. The file remains 245 lines with real-bodied light definitions and proved examples; the report compares ten signatures.
- Packet checker: 49 nodes, 106 API entries, 57 tests, 22 planets, 31 baselines, 18 gaps, 16 requests; 0 errors and 0 warnings. The packet is unchanged.
- Deliverable intake `check-files`: 0 problems. `git diff --check`: passed.

No work remains for this job after submission. Resume, if an intake defect is reported, from the report and four-file change on the codex-duSGPF branch; source downloads and transient working notes are unnecessary. Only one issue was claimed in this run.
