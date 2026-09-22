# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 — fourth checkpoint

**Status: partial; not ready for acceptance.**

Agent: ChatGPT Pro, session `cgp-0922-6e8b41`, 22 September 2026.
Issue: #1420. Continues merged checkpoints #1636, #1641 and #1650.
Branch: `cgp-0922-6e8b41-paper-1420`.

## What this checkpoint delivers

A detailed proof supplement in the paper report addresses the two obstacles called G1 and G2 in the third checkpoint:

1. A primitive-prefix lattice-basis construction gives the comparison at **every** index, including the last. The trace-weighted Euclidean metric makes 1 a shortest vector in the number-field integer lattice. Minkowski's second theorem then supplies the required product bound. The quadratic case is included. This is a direct replacement argument, **not** a claim to have read Siegel Lecture X.
2. Klüners–Wang, arXiv:2003.12161v2, Theorem 2.1, supplies a later-source quadratic rank estimate with **two** base-rank factors. An expanded proof uses `Cl(E)/2Cl(E)`, not an unjustified equivariant identification with `Cl(E)[2]`. Ramified real places and the everywhere-unramified case are included. Induction recovers the required degree-dependent torsion exponent without the unverified one-factor relative-genus assertion.

The report contains nine proposed stable-ID entries, precise statements, proof outlines, ownership, and API/tests for the two new constructions. The previously recorded mathematical work is retained below the new checkpoint notice.

**Machine synchronization is still pending.** This checkpoint intentionally leaves the 110-item `.result.json` unchanged rather than reconstructing that large file by hand and risking loss of its inherited statements, provenance and tests. Therefore its counts and G1/G2 descriptions are the third-checkpoint state, not a claim that the new entries have already been integrated. The new proof notes are not yet executable atlas routes. This is a research checkpoint, not completion of the paper job.

## Resume here: synchronize the extraction first

Use the report section “Fourth checkpoint: primitive bases and quadratic towers” as the specification. Preserve all 110 existing IDs and their unrelated statements, notes and source records. Add these nine IDs, each prefixed by `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/`:

- `trace-metric-normalization` — construction, missing.
- `primitive-prefix-extension` — theorem, missing.
- `reduced-basis-product` — theorem, missing.
- `hilbert-class-field-input` — theorem, planned at `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.
- `quadratic-coinvariant-extension` — construction, missing.
- `quadratic-relative-rank` — theorem, missing.
- `ramified-place-support` — theorem, missing.
- `quadratic-relative-torsion` — theorem, missing.
- `all-degree-torsion-induction` — theorem, missing.

Put the two generic lattice lemmas in a **source** route to `GeometryOfNumbersAndQuadraticArithmetic:GN.5`, consuming GN.0/GN.1. They are not a new lattice roadmap and do not need GN.3's mass/adelic reduction theory. Put the number-field specialization and quantitative quadratic-tower items in the already proposed `EffectiveBoundsClassGroupTorsion` Part II. Import the Hilbert class field from its existing upstream owner; do not route it as a new development.

Update the existing `reduced-integral-basis` item to state the trace metric explicitly, with ordinary-metric transport as a separate consequence; give it the EffectiveBounds Part-II route. Update `largest-minimum`, `two-torsion-general`, and the Part-II brief to use the new arguments. Keep `relative-genus-source-claim` as an **unrouted diagnostic**: the literal one-factor formula and its advertised stronger exponent are still unverified. Do not silently replace that historical source claim by a different theorem.

After precisely these changes, the expected counts are **119 items: 22 library, 8 planned, 89 missing**; 82 missing items routed and 7 missing items explicitly unrouted; six routes in total; 33 definition/construction items. These are expected post-integration counts, **not the contents of the present JSON**. Recompute them rather than trusting this note.

Append Klüners–Wang as a later auxiliary source, stating the v2 date (13 October 2020), selected Theorem 2.1/proof pages 3–4, and the fact that no byte hash was measured in this session. Preserve all inherited source hashes with their original attribution. Preserve the historical `verification` object under a history field or otherwise clearly attribute it to the earlier worker; do not attribute its successful checks to this session.

Then run the unmodified `scripts/check_paper.py` against the full current atlas/proposed-roadmap catalogue, the intake checks, stable-ID and unique-route checks, and definition API/test checks. This browser session could not acquire a local clone and did not run the repository checker. The finite proof-regression tests below are a different kind of check.

## Tests actually executed in this session

A local Python script, reproduced in the report, passed:

- exact rational recurrence `c_i=(3/2)^i` through 30 steps;
- the `Z/4 × Z/2` involution distinguishing the actions on 2-torsion and the quotient modulo 2;
- exhaustive square-zero matrices over F2 in dimensions 0 through 4, verifying `dim V ≤ 2 dim coker T`; counts were `[1, 1, 4, 22, 316]`;
- 99 exact comparisons of the exponent gain in a quadratic tower.

These are regression checks, not proofs of the arithmetic results and not Lean elaboration. No Lean artifact was requested or compiled. No independent review has occurred.

## What was read for the new work

- Current WORKERS, PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE, and expansion PROTOCOL.
- The previous extraction/report/handoff and issue discussion; all previous 110 IDs are retained in the unchanged JSON.
- Main paper's February 2017 author copy, selected §§2–4; the basis paragraph on printed page 5 was visually inspected. This session does not claim another full reading of every earlier auxiliary source.
- Klüners–Wang arXiv:2003.12161v2, Theorem 2.1 and its proof, with PDF pages 3–4 visually inspected.
- Full completed EffectiveBounds roadmap; GN atlas extract; relevant ClassFieldTheory purpose/ownership, Layers 12–13 and regression-test passages.
- Reviewed GN audit entries for covolumes, successive minima and reduction; accepted REV-AUDIT-03 for the Hilbert-class-field absence boundary.
- Actual Mathlib covolume statements at `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, lines 124–142. The unchanged extraction's other library declarations were verified by the earlier workers, not all reread by this session.

`data/library-coverage.json` returned empty content through the browser reader because of its size; the split reviewed audit and review records above were used instead. Current docs/search hits are not substituted for statements at the prescribed pins. The pinned Tau Ceti geometry-of-numbers directory has only the doubling files; this is consistent with, but not a substitute for, the reviewed missing-successive-minima/reduction audit.

## Remaining substantive gaps

- **G0:** final 2019-revised/2020 publisher text still not obtained; AMS retrievals returned 403. Bibliographic agreement is not a theorem-version comparison.
- **G1:** the direct proof is now written; machine extraction, primitive-prefix generic API audit and independent checking remain. No original Siegel-source verification is claimed.
- **G2:** the later-source replacement suffices for the main degree-dependent exponent; the literal one-factor source claim remains unverified and must not be used.
- **G3:** original Brumer–Kramer Proposition 7.1/remark, HV repulsion/packing/height interiors, uniform model changes and explicit/cohomological Selmer comparison.
- **G4:** torus transfer, adelic/Brauer–Siegel inputs, splitting-field discriminant comparison, resolvent orders/maximalization and reducible cases.
- **G5:** hyperelliptic curve-model local conditions versus étale-algebra discriminant, twists, leading coefficient and even degree.
- **G6:** del Pezzo height comparison uniform in the fibers, singular fibers, weighted representatives and the 2.87 optimization.
- **G7:** Bombieri–Pila integer rounding and exact constants; generic supplier audit.
- **G8:** Baily, Cohn, Bhargava–Shnidman and Cohen–Morra original field-count inputs; retain dependence on the fixed quadratic resolvent.
- **G9:** function-field determinant uniformity, epsilon loss and gonality, especially characteristic two/inseparable maps.
- **G10:** full proof-input closure and the new machine synchronization still prevent complete status.

Do not mark the job complete, approve its own work, merge the PR manually, or release a submitted claim with `/unclaim`.
