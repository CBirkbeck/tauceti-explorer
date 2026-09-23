# Handoff: PAPER-ANDRE-18-B

Issue: #2188. Continuing agent: **ChatGPT — cgpt-20260923-4c72a9**. Date: 2026-09-23. Continues Codex checkpoint #2210.

**Partial checkpoint, not a complete extraction or an independent review.** Keep `status: partial` until the outstanding source and supplier work below is finished. Do not infer that a theorem is formalized from an API contract or from this packet passing schema checks.

## Files and new work

- `research/blueprint/papers/PAPER-ANDRE-18-B.result.json`
- `research/blueprint/papers/PAPER-ANDRE-18-B.md`

All 76 prior mathematical item identities and the five routes are retained. The JSON serialization and explanatory notes were condensed, rather than adding a parallel extraction. There are now 83 items (11 library, 7 planned, 65 missing), 18 definition/construction APIs with 54 planning tests, and a selected acyclic dependency spine with 62 edges. The report includes a checkout script for these invariants; that full script was not locally run by this browser worker. Full repository checks are supplied by the PR workflow and must be read for their actual status.

The important additions are:

1. **E4: an explicit counterexample to Appendix A.3.1(c)⇒(b) in its printed zero-divisor generality.** Let A=k[[t]], K=k((t)), R=A⊕εA with ε²=0, S=A⊕εK, r=ε, and let the endomorphism substitute t² for t while fixing ε and k. R is local, r-adically separated, free of rank two over its endomorphism image, and the required intersection is exactly εR. The nonzero R-linear λ(a,b)=εa gives a nonzero dual. Every R-linear S→R kills ε because it is divisible by every t-power in S, while R is t-adically separated. Thus no retraction exists; reduction modulo t also disproves purity. S is even integral over R. The report verifies every assertion. E4 concerns a nonregular R and a nonfinite extension, not the main direct-summand theorem. **It awaits independent review; no author contact was made.**
2. A corrected sufficient criterion, item `functional-retraction-regular-r`, adds **r=0 or multiplication by r injective**. The report proves unique division of the functional, unit-coordinate extraction over the iterated endomorphism image, and the final semilinear composition. This repairs only the functional-to-retraction implication, not the separate local-duality branch.
3. The §3.4 retraction step is now checked against **Hochster 1973, p.30**. New adapters separate parameter-ideal cofinality, stabilization of retraction cosets in Artinian modules, countable compatible choice and reconstruction from the target inverse limit. Original retraction transitions need not be surjective, and finite length is not finite underlying cardinality. Completeness of B is not required for the final Hom/target-limit step.
4. Two exact pinned library suppliers were read in `Mathlib/CategoryTheory/CofilteredSystem.lean`: `CategoryTheory.Functor.surjective_toEventualRanges` and `CategoryTheory.Functor.toEventualRanges_nonempty`. The finite-type nonemptiness theorems in the same file are not substitutes over an infinite residue field.
5. Attribution of the unramified complete-local reduction is corrected: **André §0.2 cites Hochster 1983, Theorem 6.1**, not Hochster 1973 p.30. This reduction remains a real gap.

## Resume in this order

**First, independent mathematical review of E4.** An independent reviewer should inspect the printed hypotheses on pp.90–91 and test locality, freeness, the intersection equality, the extension of the endomorphism, R-linearity of λ, and the obstruction to a retraction. Review the corrected criterion separately. Do not let the authoring worker mark its own finding confirmed. E1–E3 remain unreviewed typographical issues; E2 does not fix E4.

**G3:** Read Hochster 1983 Theorem 6.1 and the actual regular-ring-to-unramified-complete-local reduction, including the perfect residue field step. The Artinian-retraction subproblem has been decomposed, but this global reduction has not. The fine library implementations of the elementary new adapters still belong to G7.

**G4:** Read Hochster 2002 Lemma 5.1 and Bartijn–Strooker Theorem 1.7. Specify the partial-module-modification carrier with its distinguished element, bounded denominator maps, filtered algebra construction, absence of a bad chain and balancing completion. Check the two-ring modification in 4.4.1. Do not multiply arbitrary module-valued polynomials or assume a stronger factorization through the original D.

**G1–G2:** Read the exact companion published passages 2.9.3, 3.6.1 and 5.2–5.3, Scholze 2012 6.4 and 6.7(i), and Gabber–Ramero 2.2.26 and 3.1.3. Split finite-stage tubular approximation, generic/special flatness, nonzero fibres, completed colimits and normalization/coherence adapters. Apply completion flatness over each Noetherian finite stage, not by treating A_∞0° as Noetherian.

**G5:** Check pure local completion for arbitrary finitely presented modules over the completed base. Extract coefficient-ring enlargement, normalization and product-flatness sources. Split compatible almost-CM data and final CM descent, retaining regular target and residue separability in 4.4.2.

**G6:** Do not try to prove the false printed zero-divisor implication. Its replacement is now explicit. The still-held work is the regular/integral (a)⇒(c) branch involving local duality for possibly noncomplete R and infinite integral S, and consequently the full claimed R→R+ application. The corrected (c)⇒(b) proof alone does not certify that application.

**G0/G7:** Complete introductory equivalences and homological consequences, easy cases, §1.2 Banach/Weierstrass facts, §2.4 spectral facts, §2.6.1 remarks and A.2.1 product stability. Finish declaration-level Ext/Tor, Artin–Rees, Krull, coherent-colimit, annihilator, parameter and completion adapters. Search actual pinned source statements and current ownership before classifying a supplier. Generic Mittag–Leffler infrastructure is already present; do not duplicate it.

## Inherited architecture and guardrails

Keep `DirectSummandsAndBigCohenMacaulay` for ordinary purity, splitting/Ext descent, reductions, Artinian retractions and big-CM modifications. Import the existing `DeformationAndDerivedPatchingAlgebra:R03.3` finite depth/CM substrate. Use `PerfectoidSpaces:P0` for almost foundations and the P1–P2 examples/models. Reuse the **same** proposed `PerfectoidRamification` Part II id/title from `PAPER-ANDRE-18`; do not invent a second root/Abhyankar project. `PerfectoidQuotients:Q3` is not a proved identification with André’s specified normalized extension.

Retain distinct valuation and ramified almost ideals, and distinguish module ! from algebra !!. The flat model has product roots (ϖg)^(1/p^h), not necessarily all g-roots. For §3.3 use m≥2 so pg remains nonzero modulo p^m; obtain m=1 by reduction. Preserve the p² choice in §4.2 rather than silently changing it to p. Do not replace infinite big-CM flatness by the finite-module Auslander–Buchsbaum formula. Use stage-level dependencies to avoid a coarse apparent cycle between ordinary purity and the later P0-consuming applications.

The existing missing items remain routed once. An API declaration name in a planning contract is not a claim that Lean currently has that declaration. The nine inherited positive library items and their statement checks are distinguished from the two newly checked eventual-range suppliers.

## Provenance and validation

Library pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The prior ownership snapshot is `9311f8ee5d78d9c02aee2deac5265940129cea31`. Predecessor source/declaration/upstream-PR checks are labelled as inherited rather than fabricated fresh checks.

The published article’s SHA-256 recorded by the predecessor is `34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`. Whole-paper reading and that downloaded-byte hash belong to #2210. This continuation read the cited passages and page images through the browser, but did not obtain a local PDF byte copy or hash. The local git clone failed because the container could not resolve github.com; the connected GitHub tools were used to read and commit the deliverables.

Actually executed in this continuation: **15,066** exact Laurent-polynomial/square-zero identity checks with seed 2188 over F₂, F₃ and F₅, and an additional rerun of the **3,646** retained finite diagnostics (2,269 annihilator, 728 pg and 649 diagonal-splitting cases). These are supporting diagnostics, not proofs of general theorems or infinite intersections. The report preserves runnable code and separates its unrun full JSON/graph section from the executed arithmetic diagnostics. No Lean was compiled. The actual PR swarm check is authoritative for repository schema/intake validation; passing it does not close G0–G7.
