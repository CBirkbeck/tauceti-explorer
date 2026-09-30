# FIX-RT-PAPER-DITTMANN-POP-23

Agent: Codex. Session: `codex-rtOQ9t`. Date: 2026-09-30.
Refs #4978. Both confirmed findings in [the verification](RT-PAPER-DITTMANN-POP-23.review.json) are applied to the extraction and its reader. This is a routing and library-accounting correction, not a Lean implementation.

## Finding 1 — foundational owner for height-one intersection

Route 7 retains its position and its three items, and now targets `DeformationAndDerivedPatchingAlgebra:R03.3`. This is the associated-prime and support-algebra owner in accepted RS-08. `krull-intersection` becomes **missing**, with its former `planned` field removed: R03.3's existing text does not explicitly plan this theorem. The two associated-prime lemmas stay missing. This follows the verifier's corrected disposition, rather than the original red-team suggestion to preserve every status or choose either of two owners.

Route 3's import, route 4's design brief, DP23-G5's remaining work, the ownership paragraph and the reader's route/item entries agree. The general theorem retains the normal, noetherian, domain hypotheses, the DVR localization conclusion and the empty-intersection field case. The associated-localization detection statement still applies to any module over a noetherian ring; no finite-generation hypothesis was added.

At checkout `1e5f5fb`, `scripts.build.assemble(require_distances=False)` gives 2,840 stages and 8,258 edges. Traversing dependency edges gives 869 predecessor vertices for AutomorphicCongruences:L4, versus five for R03.3 (R03.1, R03.2 and three ModularCurves anchors). None of the three consumers listed below has a path into R03.3, so the proposed supplier imports introduce no cycle. These are freshly computed figures, not the verifier's older graph counts.

Maintainer follow-through, outside this issue's file scope:

- AutomorphicCongruences:L4 imports the general theorem from R03.3 and keeps its zeta-element descent application.
- PadicMeasuresIwasawaAlgebras:L4's `bidual-intersection` imports the same theorem.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1's `tate-generic-fibre-theorem` imports the same theorem for its reduction to height-one localizations.

The old route-7 verdict in `PAPER-DITTMANN-POP-23.review.json` is superseded by the confirmed verification; that historical review is not rewritten. The route remains in position 7 so positional review/intake matching is preserved.

## Finding 2 — credit the finite-chart fundamental identity

`function-field-fundamental-equality` stays **planned**, with exactly its previous AlgebraicCurves Layer 6 owner. Its library list now credits the pinned finite-chart equality and general inequality. The note distinguishes these from the separable global wrapper. The second proof step applies the existing finite-chart equality instead of planning a new derivation of the algebra identity and place/prime comparisons.

For Lemma 3.6 take the integral closures of `k_1(u)[u_d]` in `K_s` and `K`; `finite-normalization-generic` supplies finite models, which are Dedekind, and makes the upper model finite over the lower one. The reciprocal chart covers infinity. These inputs permit the existing equality without a separability hypothesis. The finite-model requirement remains explicit: the global equality is not inferred for arbitrary non-Japanese DVRs. Route 3's contradictory assignment of the equality to A0-extension is removed; its import from AlgebraicCurves remains. The stale reader appendix entry is replaced by the current statement, status, library credit and proof steps.

## Evidence read

- Dittmann–Pop, [arXiv:2012.01307v2](https://arxiv.org/pdf/2012.01307v2), 19-page final author version: Lemma 3.6, page 10, and Proposition 5.1, page 16, freshly read. SHA-256 `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`, matching the extraction and verifier. The Annals typeset version was not read during this fix; no new source mistake or publication collation is claimed.
- [Stacks 031T](https://stacks.math.columbia.edu/tag/031T), parts 1–2 and proof, and [Stacks 0311](https://stacks.math.columbia.edu/tag/0311), statement and proof: the retained general height-one and associated-prime contracts.
- Reviewed library coverage for R03.3 (AUDIT-17) and L4 (AUDIT-23), R03.3's atlas stage, accepted RS-08's narrowing, and the two other consumer packet entries named above.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `IsDedekindDomain.HeightOneSpectrum.iInf_localization_eq_bot`, `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:564`, is the Dedekind-domain special case; `Subring.eq_iInf_of_isIntegrallyClosedIn`, `Mathlib/RingTheory/Valuation/LocalSubring.lean:199`, intersects all containing valuation rings. Neither declaration supplies arbitrary-dimensional normal-noetherian height-one intersection.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank`, `TauCeti/FieldTheory/FunctionField/AffineModel/Extension.lean:293`, with its section variables and comparison lemmas. It assumes Dedekind models, the fraction-field and scalar-tower structures, `Algebra.IsIntegral F F'` and `Module.Finite R S`, with no separability instance.
- At the same pin, `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_le_finrank`, `Place/Extension/Fibre.lean:300` (under `TauCeti/FieldTheory/FunctionField/`), has `FiniteDimensional F F'` and the stated place/tower structures. The global equality `sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`, `Place/Extension/Fundamental.lean:77`, additionally assumes `Algebra.IsSeparable F F'` and integral extension of the constant fields. Statements and ambient variables were read directly at the pin.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DITTMANN-POP-23.result.json`.
- `python3 research/blueprint/intake.py check-files` on the three deliverables.
- Structural guards: identical 154 item IDs and statements; all other item statuses and all other items unchanged; current totals 29 library, 6 planned, 119 missing; every missing item routed once; all seven route positions and item lists retained; original source records, source issues, review objects and unrelated fields unchanged.
- `make_queue.accepted_routes` returns all seven routes, with route 7 targeting R03.3; graph ancestry/cycle check as above; `git diff --check`.

No Lean deliverable is requested or changed, and no Lean compilation was run. This submission claims neither completed proofs nor completed blueprint closure. Only the three authorized deliverables are changed.
