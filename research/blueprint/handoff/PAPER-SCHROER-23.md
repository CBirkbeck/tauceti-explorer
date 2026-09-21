# PAPER-SCHROER-23 handoff

Status: partial. Codex, session codex-a71f92. Issue #1087. Date: 2026-09-21.

## Saved

The entire public third-revision main paper was read. The result contains 171 stable items: 13 library, 3 planned, 155 missing. Six routes own 154 missing items exactly once; **/63 is intentionally unrouted**. The report contains provenance, exact source-precision findings, two proposed proof repairs and the complete reproducible 4,949-assertion regression script.

Sources: author PDF dated19 July2022 and arXiv2004.07025v3, body text compared. Hashes are in result.source. Do not substitute v1/v2: their two-section proof was revised. Published63-page PDF not obtained.

## Resume in this order

1. Resolve **/63**, Proposition5.5's canonical-cover comparison at2. Local canonical covers differ by torsors; show that the global cover over Z[1/2] can be chosen to have the required unramified local good reduction without losing odd-prime good reduction. This is an unverified obligation, not a counterexample to the theorem. Keep5.1 dependent on it; do not merely route an assumed lemma.
2. Acquire Lang2000 in full and verify classification cases and minimal-resolution/Kodaira computations behind /115 and /117. The eleven invariant checks do not prove exhaustiveness.
3. Read Ekedahl–Shepherd-Barron math/0405510v2, the original Cossec–Dolgachev1989 theorem locators, and Lang1983's Enriques Reducibility Theorem. Preserve both integral two-section possibilities R²=0 and R²=−2 in §12.
4. Complete recursive inputs to Schröer2021 Theorems2.5,6.1,7.2; Fontaine1993 Theorem1 plus remark(a); Oort–Tate classification; and LLR6.6's component/Lie/discriminant inputs. The result records exactly which passages were read. The2018 LLR corrigendum's introduction/corrected statements were checked; its full proof was not.
5. Review the proposed repairs to /94 (use Tsen only over algebraically closed constants) and /97 (dual of the projection image, not a pairing-preserving projection).
6. Visually recheck every diagram in §§11–14 and independently close each contradiction branch. Pages14,29,33,41,43 were visually checked already; all main text was read. Add missing atomic objects: genus-one and quasielliptic model construction, tame/wild criterion, Minkowski π₁(Spec Z), Brauer(Z)=0, and the exact cohomology-supplier contracts.
7. Obtain the typeset published version before attributing any preprint correction to the published paper.
8. Re-screen current roadmaps/accepted routes for ownership changes; keep the built IntegralLattices theory imported. Its half-norm modZ convention needs conversion to the paper's full-norm mod2Z, including negative-definite signs.

## Checks

- python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHROER-23.result.json — passed.
- Report's Python regression — 4,949 exact assertions passed.
- Structural route/API/test checks — passed: unique171 IDs,154 singly routed missing items, only /63 unrouted,25 definitions/constructions with API and three tests, valid galaxy IDs, no local filesystem paths.
- Lean: not applicable to this paper deliverable; no compilation or formalization claim.

Only the two named paper deliverables and this handoff are submitted. No source PDFs or scratch files are included. Keep IDs stable; append new items. Remain partial until recursive source coverage, the cover comparison, remaining diagrams and every missing item's unique route are genuinely closed.
