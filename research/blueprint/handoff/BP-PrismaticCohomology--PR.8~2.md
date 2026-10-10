# BP-PrismaticCohomology--PR.8~2 — checkpoint

Issue #7002; agent Codex; session `codex-HLYsBR`; 10 October 2026.
Branch: `codex-HLYsBR-prismatic-log-revision`.

This is a **blocked checkpoint**, not a completed blueprint or an acceptance decision. The packet and PR.8 coverage remain `partial`; the previous independent `needs_changes` review is preserved exactly. All 76 reviewed node IDs and all six planets are retained. No implementation is claimed, and every node remains `unchecked`.

## Why the pass cannot finish

The full Inoue–Koshikawa–Yao corrigendum is required to establish the current Laurent equivalence and its consequences. Its DOI is [10.1016/j.aim.2026.111223](https://doi.org/10.1016/j.aim.2026.111223), Advances in Mathematics 503 (2026), 111223. The readable institutional/publisher metadata identifies published Theorems 7.35–7.36 as needing correction, but gives no corrected hypotheses. Matching those numbers to preprint Theorems 7.36–7.37 also requires the published article.

Access was retried in this run. ScienceDirect's article and PDF routes returned HTTP 403. Elsevier's FULL text/XML and PDF API routes returned HTTP 401 requiring an API key; metadata-only replies did not contain the correction, and subsequent canonical routes returned 429. Crossref supplied metadata and API links only. The [Keio institutional record](https://keio.elsevierpure.com/en/publications/corrigendum-to-logarithmic-prismatic-cohomology-ii-adv-math-479-2/) supplied the abstract only. The checked Harvard/UCSB/Keio faculty or author pages supplied no correcting PDF, and arXiv 2306.00364 remained v1. No corrected theorem was inferred from the abstract. Nodes `laurent-f-crystals-local-systems` and `smooth-proper-pushforward` now state this source gate locally as well as in the gap register.

The missing source blocks completion, rather than merely making the job long. The independent algebraic and reader corrections described below were carried through before submitting this checkpoint. A future run still has substantial signature and supplier work to do; resolving the source gate alone will not make this packet complete.

## Changes completed

The reader is synchronized with every packet statement, hypothesis, proof sketch, prerequisite, API item, unit test and source locator. Its former complete/planned header is replaced by the actual partial/checkpoint state. The independent review's mathematical repairs are now visible in the reader and suggested-file ledger, including algebraic exactification and its integrality direction, Hodge–Tate rather than unreduced weak base change, the map from ordinary to log differentials, the free-envelope weak-final object, the q-PD ideal condition, the corrected A_inf/A_crys/B_dR period diagram, the log cotangent criterion, integrality in descent, the Nygaard index range, saturation's direction, zero-valued log charts, quasi-pro-Kummer cancellation and finite-cover pushforward rank.

The power-tower correction is retained: torsion-free groupification is required for the stated power-map construction. The finite group monoid `Z/2Z` with the square map misses a component of its group algebra over Q_p, and log association cannot repair this since its chart values are units. None of the nine source findings is discarded. Source corrections are written in our own words; no source passages or excerpt fields are added.

The typed core now includes the actual Z_(p) coefficient carrier and identity-Frobenius delta, the computation at the unit 1+p, the canonical monoid-algebra Frobenius/delta, the free polynomial model on x and y_i with its defining Frobenius formulas, its evaluation/uniqueness contracts and algebraic-independence non-example. The Breuil–Kisin test computes the chosen rank-one power lift on the chart monoid itself; it does not impose the false log-ring hypothesis on the N chart. The full prelog prism carrier includes invertibility of the ideal, derived completeness and p-membership, with genuine underlying-prism projection, boundedness, zero-log and non-prism tests. Perfectness uses this carrier and requires boundedness. Ordinary fixtures stay owned by PR.0/DD.1 and are not additional targets.

The suggested file contains **54 typed API/test forms among 336 packet names**; the prior review counted 40 among 332. Four explicit API contracts were added for the rank-one monoid lift and the one-generator evaluation/uniqueness interface. The remaining **282 forms** are documentation-only obligations, clearly marked in both the reader and the Lean ledger. Constructor forms and tagged anonymous examples are included in the count. This does not count unrelated helper declarations or mathematical statements found only in comments. The generic non-rank-one Frobenius test still needs its promised concrete completed-free example.

## Supplier reconciliation and ownership

Exact current prerequisites replace obsolete requests where the owning packet is sufficient:

- CR.5 basic prelog, associated-log and integral/characteristic monoid exports;
- DD.6 Gabber cotangent, functoriality, Cartier, derived de Rham, homological log-flat and descent exports;
- T6 general locally noetherian fs log adic spaces, Kummer site and higher direct images;
- PR.4 arbitrary p-adic formal/affine étale comparison and coefficient compatibility;
- PR.7 ordinary Laurent/perfect-complex comparison and crystal descent;
- AI.2 BKF theory and AI.5 period finiteness/p-local-freeness criteria.

DD.6 already owns the log quasisyntomic site and QRSP definitions. The accepted PR.8 node IDs are kept as consumer adapters, with supplier ownership stated explicitly. No notion was moved to a new owner in this run, and no supplier packet was edited or contacted. All requests are recorded locally.

Still insufficient are the non-fine, relatively coherent Koshikawa formal smoothness/completion interface; the completed untilt and condensed module coefficients on general diamonds; the proper Cartier-type O_C crystalline/Hyodo–Kato range beyond semistable DVR models; and the commuting-endomorphism cochain Koszul carrier through AI.1/DD.1. AI.1's present scalar décalage export requests a general carrier; DD.1's homological linear-form/scalar complex is not yet the log q-derivative interface in degrees [0,r]. PR.8 must use an owner-supplied carrier rather than build another generic Koszul theory.

PR.7's perfect F_p/lisse Riemann–Hilbert target is a near miss for KY Lemma 8.5: the latter uses algebraic Frobenius Witt modules obtained by colimit perfection, constructible coefficients and extension by zero. The modules need not be perfect ring-modules. The stronger correspondence and the arc-descent input of KY Theorem 7.25 remain explicit gaps. Pending RS-01 corrections do not authorize treating their proposed ownership changes as accepted.

The read-only upstream/environment revisions checked were TauCetiRoadmap `0a56d1b5303c26887a4042db834f46d9079ac593` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant Lean searches found no existing log-prismatic, δ_log or arc-descent declaration. AdicSpaces and ProfiniteArithmetic supplied reader/signature patterns, while their ordinary coefficient constructions and arithmetic Kummer characters were checked as near misses. Nothing in those repositories was edited or built. The formalisation pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources and validation

The packet retains the original extraction and independent review's reading-range provenance. This revision inspected the same public K1 v3, KY v1, CK v3 and Kato II PDFs; it rechecked selected K1 §2 free/delta calculations and §3 prism conditions, the K1 Theorem 8.5/CK Proposition 6.8 correction, and KY Lemma 8.5's proof. It does not claim another full reading of all previously listed sections. The source hashes remain in the packet and reader. The Ogus public-draft evidence is retained from the independent review; no restricted book copy was used. The corrigendum's full text and the affected published theorem text remain missing.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology--PR.8.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomology--PR.8.lean`: successful pinned elaboration, with only admitted-proof warnings. No warning suppression, Lean server or Lake build/update was used.
- `git diff --check`: clean.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: zero problems.
- Local consistency checks preserve the exact prior review and all 76 IDs, keep every implementation status unchecked, and find all 336 API/test names and every statement/proof sketch in the synchronized reader and name ledger.

Final inventory: 18 definitions, 14 constructions, 8 lemmas, 35 theorems and 1 application; 206 API items; 130 tests; 6 planets; 14 baseline declarations; 5 gaps; 14 supplier requests. PR.8 is partial.

## Where to resume

1. Obtain and read the full corrigendum and affected published theorem text. Record the exact corrected hypotheses, numbers and pages, then revise the Laurent equivalence, its tests and dependent pushforward. Do not certify the preprint target from metadata.
2. Work through the explicit signature deficit in the suggested file: every outstanding entry carries its stable packet name. Provide actual supplier-based declarations and examples, and replace the remaining conditional example with the promised concrete completed-free computation. Comments do not discharge PROTOCOL §13.
3. Resolve the precise supplier scope gaps and the stronger Witt/constructible Riemann–Hilbert and arc-descent inputs. Import genuine owner exports where they now exist, keeping PR.8 adapters and accepted IDs stable.
4. Complete the target-level proof-closure pass, including KY Lemmas 4.18, 4.20, 6.6, 6.9–6.10, 6.17–6.18, 8.5–8.6 and Proposition 2.47 as proof-interior dependencies. Keep small lemmas in the sketches rather than creating a declaration inventory.
5. Synchronize all three deliverables again, rerun the packet checker and pinned `lean-check`, and leave the retained review unchanged for an independent decision.

No second issue was claimed. The scratch notes and source files are disposable; everything needed to resume is recorded here and in the deliverables.
