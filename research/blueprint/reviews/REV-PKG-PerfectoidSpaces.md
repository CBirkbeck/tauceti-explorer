# Independent package review: PerfectoidSpaces

**Verdict:** accepted after corrections.
**Reviewer:** independent-review-REV-PKG-PerfectoidSpaces.
**Agent:** Claude Code, session cc-1d39a9.
**Date:** 2026-10-09.

The package (README 196.9 KB, Suggested.lean 112 KB, metadata.toml) was written by session cc-3f6951 from
the plans `PerfectoidSpaces--P0.json` (P0–P7, review status needs_changes) and `PerfectoidSpaces--P8.json`
(accepted). This review checked it against the brief's checklist, the maintainer's rules of 2026-10-09
(duplication against the current Tau Ceti, sibling anchors, Suggested.lean form, no expansion into a longer
catalogue, every definition keeps ≥ 3 tests), fixed what it could in place and records the rest here.

## Required checks

| Check | Result |
| --- | --- |
| Quality bar and form | Pass after corrections. Scope, boundaries with a supplier table, conventions, sources with locators, ten layers in order, 201 numbered targets with statement, API/examples (definitions), sources and prerequisites, 197 folded supporting results. No planning vocabulary (packet, atlas, reviewer, optional, deferred, pending, "(removed)"), no local paths. The generated README had been condensed below the point of correctness: see "Content restored" below. |
| Sources | Pass after corrections. 15 sampled locators and the ten moved-down targets read against the public PDFs (section below): 4 locators wrong, 6 incomplete, 7 statements corrected or explicitly marked as beyond the source. Huber 1996, Illusie and Berkovich are not public and are marked as unverified where cited. |
| Gaps and upward citations | Pass after corrections. The handoff's seven moved-down targets exist (P0.19, P1.12, P1.24, P4.15, P7.1, P8.18, P9.1–P9.3). Two upward ids survived in prose and were re-pointed: `DerivedDeRhamCohomology:DD.0` (P0.20 → P0.19) and `ClassicalAdicEtaleCohomology:H0/…` (P7.2 → P7.1). No `FoundationsAndLibraryIntegration` or `UPSTREAM:` ids. SchemeAndStackFoundations (tier 2) and ModularCurves are lower-tier citations and stay. |
| Unit tests | Pass. All 85 definition and construction targets carry ≥ 3 named examples (checked by script); the 33 glosses that had been cut mid-sentence are restored in full from the plan tests. Nothing was removed. |
| Lean | Pass. `lean-check` on `Suggested.lean`: exit 0, 181 `declaration uses sorry` warnings, no other diagnostic (run before and after the edits below). No `True`, `Prop := sorry`, `lemma`, `#print`, `#eval`, `#synth`, `#check`, or process comments. Ten signatures spot-checked against the README: `IsPerfectoidTateRing` (uniform + ϖ^p ∣ p + bijective Φ, P1.1), `IsPerfectoidTateRing.of_surjective` (P1.2b), `tilt` (P1.4), `IsPrimitive`/`IsPrimitiveIdeal` (P1.19), `untilt` (P1.20), `spaTiltHomeomorph` (P2.2), `rationalLocalization.isPerfectoidTateRing_affinoid` with the unit-ideal hypothesis (P2.3), `IsInjection_affinoid` (P4.3), `IsStronglyZariskiClosed_affinoid` with the plus-ring clause (P4.13), `IsTildeLimit_affinoid` with both conditions (P7.1), `Huber.Pair.invariants` (P8.1): hypotheses present, nothing vacuous. The closing comment now lists by number the 24 README definitions that have no declaration (it previously named eight of them by description). |
| Own words | Pass. Statements are specifications with locators and Lean names; no verbatim passages, no section-by-section summaries. |
| Metadata and intake | Pass. `metadata.toml` is `topic = "math.AG"`. `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. |

## Content restored (the main defect)

The README had been generated from the plans with a byte budget that cut content rather than text: 101 of
201 headings and 184 of 197 supporting-result titles ended in "…"; 29 statements replaced their hypothesis
sentences by "[…]" and kept only the conclusion; 68 theorem and comparison statements kept only the
hypotheses and lost their conclusion (P1.25 read "Let R be a complete Hausdorff Tate ring and R⁺ a ring of
integral elements." and nothing else); 33 example glosses were cut mid-sentence. All were restored from the
plan statements (every README sentence is still a prefix or sentence-selection of the corresponding plan
statement, so the comparison stays mechanical): full titles; every hypothesis sentence up to and including
the first conclusion sentence and any enumerated continuation; full test glosses. The README grew from
196.9 KB to 258 KB. 76 statements still end in an ellipsis after their hypotheses and conclusion (the
plan holds the rest); 3 glosses are capped at 500 characters.

## Cross-package citations

The plan cited DiamondsAndVStacks, AdicEtaleGeometry and AdicSpacesPartII by node slug. The citations now use
the siblings' README anchors: DiamondsAndVStacks D0.7, D0.10, D0.13, D0.23, D5.3, D5.13, D6.1;
AdicEtaleGeometry T010, T015, T017, T024, T025, T029, T037, T052, T071, T072, T075, T129, T130, T136 (that
README keeps the slugs as item names, so the numbers are unambiguous); AdicSpacesPartII R0, R3 and R5 by
section name (that README has no target numbers); SchemeAndStackFoundations T113 (henselization of pairs).
One slug in a Suggested.lean docstring was mapped the same way.

## Source verification

Public PDFs read on 2026-10-09 (title and authors checked on page 1): ECD arXiv:1709.07343v4; Sch12
arXiv:1111.4914v1 (numbering agrees with the published version at the sampled points); BMS
arXiv:1602.03148v3; BS22 arXiv:1905.08229v4; Sch13 arXiv:1205.3463v2; GR arXiv:math/0201175v3; SW13
arXiv:1211.6357v2; Wedhorn arXiv:1910.05934v1; Bhatt's notes; Kedlaya's AWS notes; KL15 arXiv:1301.0792v5;
Stacks tags 08QX, 08QQ, 08S9, 08SP. Sample of 15 (by target): P0.2, P0.4, P0.9, P0.17,
P0.24, P1.21, P1.25, P1.28, P1.32, P2.1, P2.2, P2.6, P2.8, P3.21, P4.6.

Corrections made:

1. P0.2: ECD Definition 3.21 is on p. 19 and gives only the almost-zero criterion; the basic-setup clauses are
   GR (2.1.6) and Proposition 2.1.7(i), p. 8. Both now cited.
2. P0.17: GR (3.4.44) states the comparison with ordinary finite étale algebras only in the classical limit
   m = V; the entry now says that the general-setup comparison is proved here with no further source.
3. P1.25: BMS Lemma 3.20's converse needs R⁺ bounded in R; the hypothesis is restored in the title and the
   statement (which previously had no conclusion at all).
4. P1.28: Sch12 Theorem 5.2 proves the three equivalences over a perfectoid field; the general-base statement
   with the Λ-flatness condition (the P0-plan reviewer's correction) has no published source and the entry
   says so.
5. P1.32: ECD Remark 3.3 holds only the non-examples; Example 3.4, pp. 14–15, added.
6. P2.1, P2.2, P2.8, P3.21: the clauses not in the cited ECD theorem now carry their actual source (Sch12
   Theorem 6.3(i), Corollary 6.7(ii) with KL15 Theorem 3.6.14(b), Theorem 6.3(iv) and Proposition 6.14 with
   KL15 Theorem 3.6.15, Proposition 7.13).
7. P0.19 (moved down from DerivedDeRhamCohomology): Stacks tags for the verified clauses; the Illusie
   locators are marked as unverified (not public).
8. P7.1 (moved down from ClassicalAdicEtaleCohomology): the density condition now has Scholze–Weinstein
   Definition 2.4.1's affinoid form (the previous "all opens V ⊆ X_i" form was weaker); SW13 cited with pages,
   Huber 1996 marked not public.
9. P8.18 (moved down from PerfectoidQuotients): the clause "S⁺_perfd is the p-adic completion of a filtered
   colimit of integral perfectoid rings" is not in BS22 and was removed; the Tate-pair universality is marked
   as derived here (BS22 Remark 7.5 gives it only for semiperfectoid quotients); pages added.
10. P9.1–P9.3 (moved down from PadicHodgeTheory): the affinoid perfectoid basis is cited as Sch13 Proposition
    4.8 over a perfectoid field with Remark 4.11 for the general base; "Lemma 6.4" (nonexistent) replaced by
    Corollary 6.6, p. 36; the almost setting stated as Sch13's; the cohomology clause of P9.2(iii) marked as
    derived from P3.21 rather than Lemma 4.10; P9.3 restated to exactly Corollary 6.19's content (ν_*Ô = O_ét,
    the twisted vanishing and R¹ν_*Ô(1) ≅ Ω¹), dropping the unsourced "R^iν_*Ô ≅ Ω^i(−i) for all i".

Confirmed without change: P0.4, P0.9, P0.24, P1.21, P2.6, P4.6, P1.12 (AWS Lemma 1.5.21 and neighbours;
Berkovich not public), P1.24 (BMS Definition 3.5, Lemmas 3.9–3.10), P4.15 and P6.11 (ECD Theorem 5.8, BS22
Theorem 7.4, Remark 7.5, Corollary 7.3).

## The P0-plan review's objections

The plan P0–P7 is at review status needs_changes; its five mathematical corrections are present in the
package: the mod-ϖ category uses Λ = 𝔽_p[x^{1/p^∞}]/(x) with root-ideal almost flatness (P1.28); S⁺ = S° in
the p-finite convention is now stated in P2.8a (it had been dropped with the lemma's statement); the
inverse-Frobenius continuity of the absolute-product charts is proof-level and belongs to the plan (P2.18 states
the absolute product); the cardinal statements are restricted to uniformly κ-small spaces (conventions, P6.2)
and the cutoff cardinals are allowed to be singular; P6.10(c) uses non-full subcategories. The review's new
gap (equivalence of the almost-annihilator criterion with Λ-flatness over a general base) is the unsourced
part of P1.28 and is now marked as such.

## Duplication against Tau Ceti and the upstream roadmaps

Swept Tau Ceti a91d3aaf, the pinned Mathlib and the current upstream roadmaps by object (positive control
`IsTateRing`, 222 hits; `Completed/` does not exist in the roadmap checkout). No perfectoid predicate, tilt
of a ring, almost mathematics, Gelfand spectrum, integral perfectoid rings, henselian pairs, tilde-limits,
finite-group quotients of Huber pairs, Zariski closed immersions, pro-étale morphisms of adic spaces,
completed tensor products or Fontaine–Wintenberger exist there; none of the nine newer roadmaps touches
this material. The nine Tau Ceti declarations the README cites as library cores all exist at a91d3aaf
(`isAdicComplete_span_p_teichmuller`, `isHausdorff_span_p_teichmuller`,
`isHuberRing_adicTopology_span_p_teichmuller`, `spaCompletionHomeomorph`, `IsUniform.isReduced`,
`isSpectralMap_spaComap_of_isTateRing`, `HenselianRing.exists_isIdempotentElem_sub_mem`,
`isPowerBounded_of_isIntegral`, `IsTateRing.isQuotientMap`). Overlaps now named in the boundaries: Mathlib's
`Tilt` (tilt of a valued field, the P1.15 case), `BDeRhamPlus`/`BDeRham` (built from θ without a kernel
statement), and AdicSpaces Layer 5's quotient-pair closed immersions (of which P4's Zariski closed
immersions are the perfectoid case). Nothing removed beyond the three removals already recorded in the
author's handoff.

## Suggested.lean

Unchanged except: the sibling slug in the `IsTildeLimit.spectralSpace_affinoid` docstring (now
"DiamondsAndVStacks D0.10"), one docstring wording ("the prelude's completed tensor product" → the
completed tensor product declared above), and the closing comment, which now lists the 24 README
definitions without a declaration by target number. `lean-check` after the edits: exit 0, 181 `sorry`
warnings, nothing else.

## What remains

- 76 statements end in an ellipsis after their hypotheses and first conclusion; the full statements are in
  the plans. The README is 258 KB, above the usual 200 KB, because the missing content was restored; the
  maintainer's port-time rewrite into prose will reshape it.
- Huber 1996 (P7.1, P7.11), Illusie (P0.19) and Berkovich (P1.12) locators are not verifiable from public
  copies and are marked.
- The P0–P7 plan's review status is not changed by this package review.
