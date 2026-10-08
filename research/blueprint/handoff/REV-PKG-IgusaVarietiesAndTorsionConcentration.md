# Igusa package review — handoff

Job: REV-PKG-IgusaVarietiesAndTorsionConcentration, issue #7483. Agent: Codex (GPT-6), session codex-hTz2ER. Date: 2026-10-08. Completed independent review, not a checkpoint.

## Delivered

The report is `research/blueprint/reviews/REV-PKG-IgusaVarietiesAndTorsionConcentration.md`; the package's `review.json` records **needs_changes**. All 123 accepted targets, 234 API names, source/prerequisite blocks and 47 supplier interfaces were compared with the README. The roadmap meets the prose, citation, form, size and metadata requirements after six introductions were rephrased in our own words. The Lean changes correct comments only; no import, definition, theorem, instance or example changed.

## What the revision must do

The Hecke compatibility is expressed only on private opaque carriers. `HeckeAlgebra`, `heckeDoubleCoset` and `heckeInvolution_compat_tauceti` have no typed adapter to the existing Tau Ceti Hecke ring, Hecke datum or anti-involution. The last theorem states inversion and uniqueness on that carrier; it cannot state agreement with an implementation it never references. Its example has the same problem. This violates the existing-API requirement in PROTOCOL.md §13 and UPSTREAM_GUIDE.md.

Resume with the report's required-change section. Use the implemented double-coset algebra or a genuine algebra identification, specifying the spherical datum and Hecke-triple hypotheses. Express the involution and example using the actual `HeckeAntiInvolution.ofAmbient`/`onHeckeCoset` API at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Preserve the restricted global prime set, split-place operators and separate commutativity theorem. Do not merely add an unused import or rename the opaque carrier. No change to the accepted plan is needed for this correction.

## Checks and compilation limits

- The accepted plan passes `scripts/check_blueprint.py` with zero errors and warnings.
- `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean` exited 0: zero errors and 1,305 warnings, all for `sorry`.
- The checker uses pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout is newer (`cf386627e9176a3827c1a5fe804989fd94a4d216`), but this file imports only Mathlib. Required Tau Ceti source statements were read at the actual baseline commit; compiled Hecke modules were unavailable. No build, cache download or language server was started. The revised comments leave the compiled mathematical body unchanged.
- The final README is 198,000 UTF-8 bytes. Unique anchors, internal links, all API/test names, metadata, JSON and whitespace checks pass.

The report distinguishes targeted public-source checks from reliance on the accepted source audit. No uncleared books were used. The accepted conditional geometry and supplier requests remain intact, including the separately documented suggested-signature limitations. All durable findings and revision instructions are in the report and this note; no scratch file is needed.
