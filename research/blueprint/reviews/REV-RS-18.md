# REV-RS-18 — review of the RS-18 restructuring (Algebraic K-theory of schemes and curves)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-a71f92`. This reviewer took no part in it.

**What was read.**
- `RS-18.json`: three members (EllipticKTheory, KTheoryLowDegrees, SchemeKTheoryOperations), no anchors, and 26 evidence records (13 unordered pairs).
- The proposal `RS-18.result.json` (36 layer entries, 223 links, 41 owners) and its report `RS-18.md`.
- The introductions of the EllipticKTheory and KTheoryLowDegrees documents.
- The original texts of E.2, E.5, Z.3 and Z.6 against their entries, and the entries for S.1, Z.1 and U.1.
- The Tau Ceti roadmap titles of EllipticCurves and GrothendieckEulerForms.
- The other proposals that touch these layers: RS-16 and RS-33 (unreviewed), and RS-17 and RS-25 through SF.5.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-18.result.json` reports `ok`.
- Every stage of the three members has an entry: 11 + 15 + 10 = 36.
- **Evidence.** Each of the 13 evidence pairs shares an owner entry, as owner or under `formerly`.
- **Forwarding (§15).** For each of the 18 narrowed layers, every atlas consumer receives a link from every supplier in `suppliedBy`. Nothing is missing.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. All 220 new links apply, none is skipped, and none ends at a stage an accepted proposal drops.

## 1. Duplication

The flagged pairs are the same objects built at three levels of generality:
- the scheme theory in SchemeKTheoryOperations;
- explicit rings and curves in KTheoryLowDegrees;
- the elliptic specialization in EllipticKTheory.

The owners resolve each pair:
- **Z.5 / E.2.** Z.5 owns the general regular-curve K₀ ≅ ℤ ⊕ Pic. E.2 owns only the elliptic specialization K₀(E) ≅ ℤ ⊕ ℤ ⊕ E(F), with its origin and descent hypotheses.
- **S.2, S.5 / E.5, Z.6.** S.2 owns pullback, proper-perfect pushforward and the projection formula. S.5 owns the projective-bundle and blow-up theorems. E.5 and Z.6 keep their specializations and the explicit change of basis for K₀(P¹).
- **S.3 / E.3, U.5.** S.3 owns localisation. E.3 and U.5 keep their curve and Dedekind applications.
- **S.4, S.6, S.7 / E.4, Z.3.** S.4 owns the coniveau filtration and S.6 the λ- and Adams operations. S.7 owns the γ-filtration. Z.3 keeps the degree-zero λ-ring and determinant, whose normalization its own text fixes ("Higher Adams operations belong to S, but their degree-zero normalisation is fixed here").

The owners agree with the neighbouring proposals:
- RS-16 names S.1 for arbitrary-ring affine perfection beyond the complete-local case, which RS-18's S.1 keeps.
- RS-33 names Z.1 for idempotent/splitting presentations and U.1 for stable GL and Whitehead identities, which RS-18 keeps in Z.1 and U.1.
- RS-17 and RS-25 name SF.5 for Chow/Chern/Gysin intersection theory, which RS-18 imports.

## 2. Nothing lost

**The narrowings.** In the sampled narrowings every original target is either kept or named with its supplier:
- **E.2** keeps the whole elliptic statement, including the tensor multiplication and the descent obstruction.
- **E.5** imports pullback and pushforward from S.2 and the P¹ formula from S.5. It keeps the [f_*O] form of the isogeny pull–push and the finite elliptic-curve K-group theorem.
- **Z.6** keeps the comparison with π₀K, the single Cartan map and all its tests.
- **S.1** and **Z.1** keep the scheme-specific and concrete ring constructions.

**Consumers.** The forwarding check covers every consumer of a narrowed layer.

## 3. Extensions, anchors, format

- **The two extensions.**
  - EllipticKTheory becomes "Elliptic curves, Part II: scheme K-theory and arithmetic symbol classes". The base Tau Ceti title is "Elliptic curves".
  - KTheoryLowDegrees becomes "Grothendieck groups, Cartan maps, and Euler forms, Part II: explicit ring and curve K₀ and stable-matrix K₁". The base title is exactly "Grothendieck groups, Cartan maps, and Euler forms".

  Both documents already describe themselves this way ("Scheme and K-theory Part II of EllipticCurves"; "Ring, scheme and arithmetic Part II of GrothendieckEulerForms"). Each starts where its base stops: at scheme K-theory of curves, and at ring and curve K₀ beyond the categorical K₀. Neither re-plans a Tau Ceti layer.
- **Anchors.** The family has none, and no Tau Ceti layer is changed.
- **Format.** The JSON follows PROTOCOL §15: two `extend` roadmaps, one `keep`, 18 narrowings each with `keeps` and `suppliedBy`, and 41 owners, each a single stage.

## Questions for the orchestrator

1. **EllipticKTheory is renamed.** Its roadmap title changes from "K-theory of curves and elliptic curves" to the Part II title. The general curve material (E.3's localisation for regular curves, and E.4 and E.5 in part) still lives in a roadmap now titled as an elliptic-curves sequel. Z.5 owns the general curve K₀ theorem, so this is only presentational, but readers looking for "K-theory of curves" should be pointed to KTheoryLowDegrees Z.5 and SchemeKTheoryOperations S.3.
2. **Many links.** 223 links, 220 of them new, is heavy for three roadmaps. Most are explicit supplier imports and the §15 forwarding of 18 narrowings. The blueprints should prune any a layer does not use.
