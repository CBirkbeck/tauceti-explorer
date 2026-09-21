# PAPER-BURUNGALE-KOBAYASHI-OTA-21 — completed extraction

Author: Codex. Session: codex-a71f92. Refs #1117.
Date: 2026-09-21. Status: complete paper extraction, awaiting independent review.

## Continuity with the checkpoint

ChatGPT (GPT-6 Astra Pro), session astra-7c41e9, left the source-access
checkpoint merged in PR #1182. That worker verified publication metadata but
explicitly did not read the paper or submit an extraction. This continuation
preserves that attribution and resolves the access problem: the direct
Caltech published PDF downloaded successfully, its actual MD5 agrees with the
catalogue, and its SHA-256 and reading boundaries are in the report and JSON.

The present claim was confirmed for comment 5764064953 by bot comment
5764067086. The entire issue was reread after confirmation.

## Delivered

- Complete published-paper extraction: 110 items, with 6 library, 10 planned
  and 94 missing; every missing item routed exactly once.
- One source addition to CM.4 and four Part II design briefs: shared
  Lubin–Tate/quasi-canonical foundations, signed anticyclotomic local units,
  nonordinary CM special values/Rubin interpolation, and the inert CM signed
  main conjecture.
- Full source provenance, precise supporting-source reading boundaries,
  pinned declaration checks, atlas/audit ownership evidence and staged
  dependency instructions.

Primary source: published Annals 194 (2021), 943–966, DOI
10.4007/annals.2021.194.3.8.
SHA-256: 77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e.

No change to upstream roadmaps, atlas data, other workers' deliverables,
automation or labels. Only the two named deliverables and this handoff are
submitted.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`: passes.
- Supplemental scratch checks: unique IDs and expected counts, exactly-once
  missing routing, valid existing stages, exact Part II parent titles and
  first prerequisites, acyclic proposed design components, five source-PDF
  SHA-256 values, required numbered-result coverage and no local paths:
  passes.
- Six cited library source files match raw bytes at the recorded pins.
- Read all 109 atlas stage edges touching the four extension parents and
  matching link-map entries/overlaps.
- Full paper read; conjugation/sign-sensitive pages checked visually.

Lean: not applicable to this paper-extraction issue. No suggested Lean file
was required, created or compiled. Nothing here claims new formalization.

## Independent review and subsequent design

Check especially the π-adic generator, conductor/order parity, the inverse
character and conjugation in interpolation, same-parity formal points versus
opposite-parity unit kernels, and the exceptional-j fine-level cases.

BKO extends Agboola–Howard from E/Q/class number one to Gross Q-curves with
p∤h_K. This is an explicit future proof task, together with the coefficient
ring and CM-rank dictionaries and finite-level indexing. The extraction is
complete; it does not claim those proofs have been formalized or the eventual
blueprints are closed.

Several referenced proof sources are listed as unread. Later workers must
read them and decompose their precise inputs, rather than treating the named
interfaces as proved constants.

Coordinate the general elliptic-unit and two-variable CM input with the
pending CMAllPrimeMainConjectures direction from PAPER-BURUNGALE-TIAN-26.
It is not an existing supplier stage. Keep a single shared owner after review;
do not duplicate it in these application roadmaps.

Keep the analytic/local dependencies staged: early reciprocity and Finis
feed the optimal unit; local decomposition then feeds the late Rubin
L-function and the signed main conjecture. Never create a two-way dependency
between whole roadmaps. No remaining work is needed for this extraction
before independent review.
