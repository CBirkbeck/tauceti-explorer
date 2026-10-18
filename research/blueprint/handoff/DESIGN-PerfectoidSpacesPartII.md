# Handoff: DESIGN-PerfectoidSpacesPartII (issue #3480)

Worker: Claude (session claude-SuIpdS), 2026-10-18.

## What was done

Designed the new roadmap **Perfectoid rings and spaces, Part II: ramification and Riemann extension** (`PerfectoidSpacesPartII`, area `padic`, parent `PerfectoidSpaces`). Both paper routes of the brief were planned as one roadmap. They are the same direction: André's route (PAPER-ANDRE-18-B route 2) and Bhatt's quantitative Riemann extension (PAPER-BHATT-18 route 8), so no split was needed.

Deliverables:
- `research/blueprint/roadmaps/PerfectoidSpacesPartII.json`: six layers RA.0–RA.5 with their targets.
- `research/blueprint/packets/PerfectoidSpacesPartII.json`: target-level plan, status `complete`. It has 50 nodes (8 definitions, 10 constructions, 29 theorems, 2 lemmas, 1 application), 130 API items, 76 unit tests, 15 planets, 20 baseline declarations, 10 source issues and 3 restructure proposals; there are no gaps and no requests.
- `research/blueprint/readmes/PerfectoidSpacesPartII.md`: the reader document (about 28,000 words), generated from the packet together with hand-written introduction, scope, conventions and layer introductions, so the two agree.
- `research/blueprint/suggested/PerfectoidSpacesPartII.lean`: 280 lines.

Layers:
- RA.0: almost-pro-zero towers (Bhatt §3) and the amplitude-zero cone argument behind Bhatt Remark 4.3.
- RA.1: the annular tower and Bhatt's quantitative Riemann extension (Theorem 4.2, Remarks 4.3, 4.4, 1.7).
- RA.2: André's uniform Banach calculus. This covers p-root closure, the unit-ball dictionary, root saturation, Laurent and Weierstrass localisations, uniform limits and colimits, root algebras and tubular colimits.
- RA.3: the perfectoid coreflection, almost perfectoid algebras, André's perfectoid Riemann extension (Théorème 4.2.2), the largest perfectoid subalgebra, and the nested-systems theorem.
- RA.4: almost Galois extensions, annular envelopes, ramified almost purity (Théorème 5.2.1) and the perfectoid Abhyankar lemma (Théorème 0.3.1, corrected).
- RA.5: pure and almost pure maps, the Krull detection lemma, the normalized Kummer tower, André's flatness theorem (Théorème 2.5.2) with a repaired Noetherian step, purity of Kummer extensions (Corollaire 2.6.1), and ramified almost flatness modulo p^m (Théorème 3.2.1, Corollaire 3.2.2).

## Checks

- `TAUCETI_BASELINE=<pinned index> python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpacesPartII.json`: 0 errors, 0 warnings. Every baseline declaration was found in the pinned index and read in its Mathlib file.
- A dry atlas assembly with the packet, document and definition loaded as if promoted (`build.assemble`, nothing written) adds the 6 layers and their 15 planets and 40 stage links. It reports no skipped (cyclic) links.
- **The suggested Lean file compiled**: `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 elaborated it with no errors and `sorry` as the only warning (20 declarations).

## Stage coverage

All six stages are `planned`. Each `remaining` list names only lemma-level refinements: promoting API items to lemma nodes, splitting the dictionary and Laurent-localisation nodes, and splitting formulas (11)–(17) of André B. No stage has an open mathematical gap.

## Ownership decisions and moves (for the maintainer and later jobs)

- **André's flatness lemma** in Bhatt–Scholze's form is owned by `PerfectoidQuotients:Q3/andre-flatness-lemma` and is not replanned here. Bhatt's Theorem 2.3 is its weaker geometric form, routed to PerfectoidQuotients by PAPER-BHATT-18 route 2. RA.5 plans André's Théorème 2.5.2, a different statement about the normalized Kummer tower over W(k)⟦T⟧ that gives purity of Kummer extensions.
- **Moves down to this roadmap.** All three are recorded as `restructure` proposals in the packet, with an `upstreamNotes` entry for PerfectoidSpaces.
  1. *Almost-pro-zero towers* (Bhatt Definition 3.2, Lemmas 3.4–3.6) and *almost Galois extensions* (André A §1.9, with Lemmes 1.9.2–1.9.3). The accepted paper routes sent these to PerfectoidSpaces P0/P3, but the PerfectoidSpaces package (Tau Ceti PR #818) does not contain them. They are planned in RA.0 and RA.4.
  2. *Pure and almost pure maps* (André B Annexe A.1–A.2, A.4) and *André's Krull detection lemma* (Lemme 1.1.2). The brief of DirectSummandsAndBigCohenMacaulay (#3479) gives it an "early purity prefix", but RA.5 needs these for Corollaire 2.6.1 and Théorème 3.2.1, and DirectSummands builds on this roadmap. They are planned in RA.5. **DESIGN-DirectSummandsAndBigCohenMacaulay should import them from `PerfectoidSpacesPartII:RA.5/pure-map`, `/almost-pure-map` and `/krull-detection-lemma`, and import ramified almost flatness from `/ramified-kummer-almost-flatness`, the flat model from `/flat-integral-model`, and Bhatt's theorem from `PerfectoidSpacesPartII:RA.1/quantitative-riemann-extension-general` and `/quantitative-riemann-extension-derived`.**
  3. The characteristic-p Hebbarkeitssatz for arbitrary ideals stays in PerfectoidShimuraVarieties S1. RA.1 and RA.3 plan the principal case in all characteristics. No target moves.
- **Bhatt–Scholze Theorem 10.9** (almost purity along arbitrary ideals) belongs to the future Part II of Perfectoid quotients and is not cited. The brief suggested importing it for the Abhyankar application. That import would have made this roadmap depend on an unplanned roadmap above it, so the Abhyankar lemma is planned by André's own route (RA.3–RA.4).
- The André (2.18) complete integral closure (finitely generated modules) differs from Mathlib's `completeIntegralClosure` (multipliers from R⁰). The localised form is planned, and it is shown to be contained in Mathlib's when g ∈ R⁰.

## Source issues

The packet records 10 issues. Nine were already found by the paper extractions:
- PAPER-ANDRE-18: E13 (statement of Théorème 0.3.1(1)), E6, E16, E5, E11;
- PAPER-ANDRE-18-B: E15, E25, E10;
- PAPER-BHATT-18: E16.

The tenth is the gap in step (a) of the proof of André B Théorème 2.5.2 (PAPER-ANDRE-18-B/E26, which has no review verdict yet). It is **repaired** in `PerfectoidSpacesPartII:RA.5/noetherian-tube-faithful-flatness`: the integral tube model is torsion-free and complete with a free special fibre, so Bhatt's Proposition 5.1 (DD.1) gives faithful flatness without the polydisc argument.

## Suggested Lean file

The file states only what has carriers at the pins:
- RA.0: root systems, almost zero modules, `IsAlmostProZero`, `IsUniformlyAlmostProZero`, with the limit, linear-functor and product-root-system statements;
- RA.2: `pRootClosure`, `completeIntegralClosureAway` (a real-bodied `Set`), the algebraic `rootSaturation` and André's Remarque 2.5.6;
- RA.5: `Module.IsPure`, `Module.IsAlmostPure`, the Krull detection lemma, and purity of Kummer extensions of W(k)⟦T_1,…,T_n⟧ at level j = 0 (`TauCeti.KummerTower.isPure_kummer`).

Names agree with the packet's `suggestedDeclaration` and API names. Perfectoid, almost-module and uniform-Banach carriers are not at the pins, since PerfectoidSpaces and AdicSpacesPartII plan them. The theorems of RA.1, RA.3 and RA.4 and the Banach constructions of RA.2 are therefore README targets only. No data definition is sorry'd.

## Sources read (2026-10-18)

- Bhatt, arXiv:1608.08882v2, complete (sha256 08578ca1…).
- André, *Le lemme d’Abhyankar perfectoïde*, published Numdam copy (sha256 08752143…):
  - §§0–1.9 and the parts of §§2–3 listed in the packet's `readSections`;
  - §§4–5 complete.
- André, *La conjecture du facteur direct*, published Numdam copy (sha256 34da107d…): complete except §4 (big Cohen–Macaulay algebras, not a target here). The arXiv v1 copy was used for comparison; its numbering differs (Théorème 2.5.1 in v1 is the published 2.5.2).

Not read, and cited only through other roadmaps' nodes:
- Scholze, *Perfectoid spaces*, Lemma 6.4 and Corollary 6.7 (owned by PerfectoidSpaces P2);
- Gabber–Ramero, *Almost ring theory* (owned by PerfectoidSpaces P0);
- Mihara, Proposition 2.3 (closedness of (fU − 1)), cited through André A Lemme 2.6.1;
- Wintenberger's Ax–Sen–Tate theorem (only in an acceptance example).

## What a follow-up must do

- The independent review (REV-DESIGN-PerfectoidSpacesPartII) should check that the RA.2 Banach constructions do not duplicate AdicSpacesPartII R0 beyond what is imported. Uniform limits, uniform colimits and the root algebra are planned here; uniformization and uniform completed tensor products are imported.
- The review should also check the E26 repair and the two moves above.
- DESIGN-DirectSummandsAndBigCohenMacaulay (#3479) should build on RA.1 and RA.5 as listed above.
