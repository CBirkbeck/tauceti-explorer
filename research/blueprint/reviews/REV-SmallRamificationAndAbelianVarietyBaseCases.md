# REV-SmallRamificationAndAbelianVarietyBaseCases — independent review

Reviewer: Claude Code, session cc-c2c06b, 1 October 2026 (issue #493; claim comment 5934534595, confirmed by the bot). The
work under review is BP-SmallRamificationAndAbelianVarietyBaseCases, checkpoints 1–4 (PRs #3812, #3814, #3819, #3821), by
Claude Code cc-fb70e5. I did not write or review it.

Disclosure: I reviewed the fixes to restructuring proposal RS-06 (PR #5283). RS-06 places this roadmap in the Serre
modularity family. None of the corrections below depends on that review.

**Verdict: accepted after corrections.**
- All 55 nodes were checked: 4 verified and 51 corrected. The corrections run from false statements down to locators and
  prerequisites.
- 4 nodes were added, for 59 in all.
- Source issues E1–E4 were confirmed, and E5–E11 were added.
- `check_blueprint.py --index` (the pinned declaration index) gives 0 errors and 0 warnings.
- The suggested Lean file now elaborates at the pinned baseline, with `sorry` as its only warning.

## What was checked

- **Sources.** Every cited source was downloaded at the cited version, and every SHA-256 reproduces the packet's:
  - Dieulefait–Pacetti arXiv v2;
  - Khare 2005;
  - Khare–Wintenberger arXiv 2004, together with the Annals version for collation;
  - Moon–Taguchi;
  - Jones;
  - Ghitza–Yamauchi;
  - Odlyzko 1990 and Odlyzko's 1976 tables;
  - Fesenko–Vostokov;
  - Schoof 2005;
  - Brumer–Kramer;
  - Snowden.

  Every excerpt was compared with the text at its locator, and formulas were checked on rendered page images. Fontaine 1985
  (same SHA as the FiniteFlatGroups packet's copy) was added as a source.
- **Mathematics.** Every statement, proof step, acceptance example and unit test was checked, with small cases computed
  independently:
  - local discriminants, e.g. δ(ℚ₃(ζ₃, ∛2, ∛3)) = 37/18 = 13/6 − 1/9, which shows the 3-adic bound is sharp at |P| = 9;
  - the Minkowski and Odlyzko–Poitou bounds, by quadrature: exp(P(24, 0, 13/2)/24) = 10.627 and exp(P(36, 0, 8)/36) = 12.478;
  - Odlyzko's explicit formula, checked numerically on ℚ and ℚ(i);
  - the ten degree-bound rows against Odlyzko's Table 2;
  - class numbers and ray class groups of Schoof's fields, with PARI;
  - Serre weights.
- **Baseline.** All 42 cited declarations were read in the pinned trees: 40 were confirmed and two were fixed (below). Every
  cross-roadmap prerequisite and all 27 requests were compared with the supplier stage's text in the atlas.
- **Lean.** The file was elaborated against Mathlib 082e2d3, with the Tau Ceti f790474 modules it imports compiled from the
  baseline source. A deliberately false example was rejected, which confirms that the check is live.

## Corrections

1. **R25.5/weight-fourteen-at-eleven-is-a-twist was false.**
   - **The counterexample.** Serre's niveau-1 recipe for non-split ρ̄|I_p ≅ (ω^a ∗; 0 ω^b) gives k = 1 + p·min(a, b) +
     max(a, b), plus (p − 1) only in the très ramifié and unramified cases (Serre 1987 §2.3, as transcribed in the
     AlgebraicModularFormsAndSerreWeights packet; Darmon's survey, p. 6). At p = 11, sub ω and quotient ω² gives weight 14.
     Its twists have weights 22, 10, …, never 2.
   - **The source.** Khare–Wintenberger's arXiv text asserts the twist (new E9). Their Annals version, Theorem 5.4, assumes
     p ≠ 11 when k(ρ̄) = 14.
   - **The fix.**
     - The node now states the four-case dichotomy and leaves case (d) open.
     - R25.5/small-weight-level-one-exclusion and table row 8 exclude (11, 14).
     - The R15.4 request now asks for the full recipe; its θ-shift claim was also false at k = p − 1.
2. **Degree bounds.** Three rows of R25.1/totally-complex-degree-bounds-for-schoof are not certified by the stated recipe.
   With γ > 0.5722 and the π bounds, the margins of rows (c), (d) and (j) are lost.
   - They now read n ≤ 19, 287 and 23. These still suffice for the l = 5 and l = 7 cases, whose texts were updated.
   - Row (d) needs a sharper γ or integral bound, which is now stated.
3. **Schoof's cases.**
   - **Class numbers.** In R25.4/class-number-one-certificates the ℚ(ζ₁₂) step was false: rd = 3.46 > 3 excludes nothing.
     Mathlib's `RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt` now gives h = 1 directly.
   - **The case l = 7, p = 3.** R25.4/simple-objects-l7-p3 claimed an abelian extension of K′ is a compositum with an
     extension of ℚ(ζ₃). This fails when Gal(L/K) ≅ A₄, so it was replaced by the units argument over K′.
   - **The Ext node.** It now identifies Ext¹ with the kernel rather than only injecting it.
4. **The Odlyzko–Poitou layer.**
   - **A false API item.** `poitouLowerBound_div_mono` was false at n = 0 and now assumes 0 < n and 0 < b.
   - **A hidden step.** The positive-definiteness of cosh(ax)/cosh(x/2) is not routine; it became a node.
   - **Quadrature.** The certified bounds on I₁ were split into their own node.
   - **Minor.** "983" was corrected to "982" and rd 4.61 to 4.62.
5. **Local bounds.**
   - **Attribution.** The 2-adic node credited δ ≤ 2 to Tate, whose bound (Jones p. 9) is 5/2 − 2/|P|. The title and planet
     now say it sharpens Tate's.
   - **The 3-adic node.** It no longer depends on the 2-adic theorem, through a new Borel normal-form node, and its
     undefined symbol a is defined.
   - **Locators.** Jones §2.2 was corrected to §2.3.
   - **A test.** A ℚ₂(ζ₁₂) test now separates e from [E : ℚ_p].
6. **Fontaine and group schemes.**
   - **"Special to ℚ".** Fontaine's acceptance item called his theorem special to ℚ, but his Corollaire 2 also covers
     ℚ(√−1), ℚ(√−3) and ℚ(√5).
   - **Nonzero.** Simple 2-group schemes over ℤ now carry "nonzero".
   - **Normalisation.** Fontaine's bound and its R07.6 request are now in the normalisation v(p) = 1.
   - **Prerequisites.** R07.1 prerequisites were added.
7. **GL₂-type and Snowden.**
   - **The definition.** It is now over a number field F, as the descent lemma needs. The freeness argument was repaired.
     E × E is of GL₂(K)-type for every quadratic K, which corrects an acceptance item.
   - **Snowden's realisation.** It assumes p odd.
   - **The level-one conclusion.** It needs local–global compatibility, so requests to R19.4 and R19.5 were added.
8. **Requests.**
   - **Re-addressed:**
     - oddness to R01.4;
     - the explicit formula to AN.4, since AN.3 precedes the Dedekind zeta function;
     - Hilbert and ray class fields to ClassFieldTheory Layer 13;
     - the global–local dictionary to NumberFieldArithmetic Layer 5.
   - **New requests:** R01.6 (Tate modules) and ProfiniteCohomology Layer 9 (Kummer theory with restricted ramification).
   - **Narrowed:** the unit-filtration request, now that the filtration exists in Tau Ceti, and the A2 and A6 requests,
     which now state exactly what is consumed.
   - **Prerequisites.** These were made to mirror the requests' `neededBy` lists.
9. **Library.**
   - **Already built.** Items the packet requested or re-derived but the pinned libraries already have are now cited:
     - `TauCeti.unitFiltration`;
     - the tame different exponent (`TauCeti.not_pow_ramificationIdx_dvd_differentIdeal` with
       `pow_sub_one_dvd_differentIdeal`);
     - `NumberField.finrank_eq_one_of_unramified`;
     - the discriminant in towers;
     - Tau Ceti's `IsIsogeny` and `AbelianVariety.End`;
     - the joint-eigenvector theorem;
     - `fourier_re_nonneg_of_posSemidef`.
   - **S₁₄ = 0.** This needs `ModularForm.rank_eq_one_add_rank_cuspForm` as well as `dimension_level_one`.

**Baseline citations.** Two were corrected:
- the `provides` text of `ModularForm.dimension_level_one`, which alone gives only dim M₁₄ = 1;
- `cartierDuality`, whose full name is `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`. The ref keeps
  the indexed form because of an indexer bug (question 3).

None was removed, and 38 were added, giving 80.

**Nodes added**, each marked `addedBy`:
- R25.1/wild-image-borel-normal-form;
- R25.1/cosh-ratio-positive-definite;
- R25.1/poitou-integral-upper-bounds;
- R25.5/class-number-one-imaginary-quadratic.

**Planets.**
- **Added:** Schoof's category D, and abelian varieties of GL₂-type.
- **Renamed:** the mean slope, the 2- and 3-adic root-discriminant bounds, the Khare–Wintenberger small-weight theorem, and
  Schoof's simple-objects criterion.

## Source issues

**The existing entries.** E1–E4 (Schoof) were confirmed. Two reasons were corrected:
- E2's reason overstated the p = 3 dependence;
- E4's v₂ refers to the quadratic field M_χ.

**The added entries:**

| Entry | Kind | Source and place | Correction |
| --- | --- | --- | --- |
| E5 | error | DP23, Thm 1.3 | "Solvable subgroups of PGL₂(F̄_p) are cyclic, dihedral, A₄ or S₄" omits the Borel subgroups; AGL₁(𝔽₅) is a counterexample. |
| E6 | misprint | Schoof p. 857 | "category C" should read "D". |
| E7 | misprint | Schoof p. 858 | "fourth condition" should read "third". |
| E8 | misprint | Schoof p. 858 | "unramified at 3" should read "outside 3". |
| E9 | error | KW04, Thm 4.3 | The case p = 11, k = 14 (above). |
| E10 | gap | KW04, Thm 4.3 | For p > 13, reducibility at 13 needs the weight computation of Berger–Li–Zhu. |
| E11 | misprint | DP23, Thm 1.7 | The residual hypotheses are printed for ρ. |

None of them refutes a main theorem.

## The suggested Lean file

**As submitted.** The file did not elaborate at the pinned baseline: there were 29 errors. Three placeholders had silently
lost their arguments, because section variables unused in a `sorry` body are dropped. Two `NumberField` instances were
missing, and there was a mis-inferred coefficient type.

**A silent bug.** `poitouLowerBound` did not parenthesise its integrals, so `∫ x in s, …` swallowed the later terms.

**Section 13.** About twenty conditions were `def … : Prop := sorry`, and 15 node declarations, 13 API items and 24 of the
29 tests were absent under their packet names.

**After revision.**
- All 138 packet names (declarations, API items and tests) appear, each test as an `example` whose docstring starts with
  its name and kind.
- Conditions stateable at the pinned baseline are now concrete definitions over Mathlib and Tau Ceti:
  - absolute irreducibility as no common eigenline over F̄;
  - oddness on complex conjugations;
  - unramifiedness through the kernel field's discriminant;
  - group-scheme predicates on Tau Ceti's finite locally free category;
  - End⁰ = ℚ ⊗ End.
- Twelve declarations whose conditions cannot yet be stated are recorded, with pseudo-Lean signatures, in the header. They
  need semistable reduction or the rational Tate module, which no pinned library has.
- Seven data placeholders remain, each naming its owner: six local ramification invariants and `serreWeight`.
- The file elaborates with 0 errors, and its only warnings are 130 "declaration uses `sorry`".

## Questions for the orchestrator

1. **The roadmap document.** `research/blueprint/readmes/SmallRamificationAndAbelianVarietyBaseCases.md` is outside this
   review's deliverables and still states corrected claims:
   - the weight-14 twist (lines 1474–1490 and 1512);
   - Tate's 2-adic bound (217–219);
   - the ℚ(ζ₁₂) step (1103);
   - the degree rows (498, 1197);
   - "special to ℚ" (915);
   - S₁₄ by `dimension_level_one` alone (1412);
   - 983 and 4.61 (287, 293).

   It goes live with the packet, so it should be regenerated from the corrected packet, by a fix job or the maintainer.
2. **Checker ordering.** `check_blueprint.py` matches `^(mathlib|tauceti):` before trying stage ids, so a Tau Ceti roadmap
   layer (`tauceti:TauCetiRoadmap/…#layer-…`) cannot be listed as a prerequisite. Such layers are recorded only in
   `requests`, and the nodes name them in prose.
3. **The declaration index.** `index_declarations.py` drops a namespace whose name is on the line after `namespace`, so
   `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` is indexed without its `TauCeti` prefix.
4. **R33.4's stage text.** The atlas text of ClassicalSerreModularity R33.4 says it constructs the weight-6 GL₂-type
   realisation and the characteristic-3 ordinary calculation. Its accepted packet instead imports these from R25.5, so only
   the stage text is out of date.
5. **ClassicalSerreModularity R26.5.** It consumes R25.5/small-weight-level-one-exclusion and R25.6/base-case-table-holds.
   Neither R26 nor R33 uses the excluded case (p, k) = (11, 14), whose type (d) has normalised weight 10 and is reached by
   Khare's weight reduction. R26.5's owner should confirm this.
