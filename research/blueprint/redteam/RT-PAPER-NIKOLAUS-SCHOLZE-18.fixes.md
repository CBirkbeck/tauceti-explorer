# RT-PAPER-NIKOLAUS-SCHOLZE-18: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5025, job FIX-RT-PAPER-NIKOLAUS-SCHOLZE-18).

- **Findings:** `RT-PAPER-NIKOLAUS-SCHOLZE-18.result.json`.
- **Verdicts:** `RT-PAPER-NIKOLAUS-SCHOLZE-18.review.json` and `reviews/REV-RT-PAPER-NIKOLAUS-SCHOLZE-18.md` (verifier `cc-48533a`). All eleven findings are confirmed: five medium (/1–/5) and six low (/6–/11).
- **What this job fixes:** the five medium findings, /1–/5, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-NIKOLAUS-SCHOLZE-18 (PR #4708).
  - It also wrote the red teams of the Land–Mathew–Meier–Tamme extraction (LMMT-24) and the Bhatt–Morrow–Scholze extraction (BMS-19).
  - It did not write the extraction, its review or this verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed or changed my own red-team fix, I applied its version. That happened in every finding:
    - /1: the hypotheses of /70, the wording of /68, and Corollary II.5.5 in /74;
    - /2: footnote 22, cyclotomic rather than p-cyclotomic, Z^{hT} ≃ Z^{hC_{p^∞}}, and the L.4 node only as a maintainer note;
    - /3: the two separate hypothesis sets, and the wording of E26;
    - /4: CMM-21 is edited directly, /136 takes the general form, and /137 names AMMN-22/8 instead of CMM-21/022;
    - /5: the post-RS-33 owners, and the extra item Mod_HZ ≃ D(Z).
- **Files changed. Only the deliverables:**
  - `papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json`;
  - `papers/PAPER-NIKOLAUS-SCHOLZE-18.md`. The edits cover the counts, the mistakes paragraph, "What the atlas has", route 1, E26, the item index and a closing section "Fixes after the red team";
  - `papers/PAPER-CLAUSEN-MATHEW-MORROW-21.result.json`, for /4 only. The edit covers item /021, route 1's items, and two lines of route 1's brief;
  - this report.
- **Result.** PAPER-NIKOLAUS-SCHOLZE-18 has 167 items (0 library, 36 planned, 131 missing), 26 source issues and 6 routes. PAPER-CLAUSEN-MATHEW-MORROW-21 has 122 items (1 library, 19 planned, 102 missing) and 9 routes.
- **Route positions.** The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`). No route was added, removed, reordered or retargeted in either file.
  - NS18's route 1 (source, RefinedTraceMethods:RT.2) gains the new missing item /163. Its target is unchanged, and it is the target that route 1's accepted verdict covers.
  - CMM-21's route 1 (part-ii, RefinedTraceMethodsPartIIHenselianPairs) loses item /021 and changes two lines of its brief. Its target is unchanged.
  - The new items /164–/167 are planned, so they need no route.
  - No new route was needed, so no route sits without a verdict.

## /1 (medium, error): R_{F̄} written as R_F in items 68, 69, 70 and 74: fixed

I followed the verifier's version.

- **Checked.** I checked the page images of pp. 270 and 276 in the corrected Acta PDF (SHA-256 `8b1856fa…`, as the extraction records).
  - Lemma II.5.4 reads "The functor R_{F̄}: CoAlg_F → CoAlg_F takes a coalgebra …", and "Moreover, the counit F̄R_{F̄} → id is an equivalence".
  - The standing hypotheses on p. 270 are that the counit F R_F → id_C is an equivalence ("equivalent to R_F being fully faithful") and that "F preserves pullbacks".
  - Lemma II.5.10 (p. 276) has the tower … → R_{F̄_n}² → R_{F̄_n} → id.
  - Corollary II.5.5 (p. 271) gives the underlying object of R_{F̄}^k X as R_F^k X ×_{R_F^k FX} R_F^{k−1}X × … ×_{R_F FX} X.
- **/68.** It now reads "F̄ has a right adjoint R_{F̄}: CoAlg_F → CoAlg_F with ν: R_{F̄} → id (adjoint to µ)".
- **/69.** The tower is written in R_{F̄}, with the maps R_{F̄}²ν, R_{F̄}ν and ν, as a limit of endofunctors of CoAlg_F. The statement says that R_{F̄} is not R_F: C → C.
- **/70.** It is renamed "Formula for R_{F̄}" and restated.
  - Hypotheses: C presentable; F has a right adjoint R_F with invertible counit (equivalently, R_F is fully faithful) and unit η; F preserves pullbacks. As the verifier noted, "F preserves colimits" follows from the right adjoint, so it is not stated separately.
  - Conclusion: R_{F̄} sends φ: X → FX to Y = X ×_{R_F FX} R_F X, with structure map Y → X ≃ F R_F X ≃ FY, and the counit F̄R_{F̄} → id is an equivalence.
  - It adds the Corollary II.5.5 formula for R_{F̄}^k X, and says that R_{F̄}^k X → R_{F̄}^{k−1}X forgets the first factor.
  - The note says that F R_F ≃ id is the hypothesis, that F̄R_{F̄} ≃ id is what p. 272 uses, and why pullbacks are needed.
  - **The mathematics, checked.** The triangle identity ε_{FX} ∘ Fη_X = id and the invertibility of ε make Fη_X an equivalence. F preserves the pullback, so FY → F R_F X is an equivalence. Hence FY ≃ F R_F X ≃ X.
- **/74.** The tower and the iterate are written in R_{F̄_n}, and R_{F_n} is kept for the fully faithful right adjoint of F_n on C.
  - The formula cites Corollary II.5.5, with subscripts R_{F_n}^j F_n X.
  - The note records the verifier's misprint: Lemma II.5.11's display has R^k_{F_n}FX for R^k_{F_n}F_nX. It affects nothing, and no source issue is added (that would be /8's low-severity scope).

## /2 (medium, error): integral TC^gen and the p-completion of TC: fixed

I followed the verifier's version.

- **Checked.** I read p. 266 of the Acta text. It has Goodwillie's pullback (1), TC^gen(X) = X^{hT} ×_{∏_p (X_p^∧)^{hT}} ∏_p TC^gen(X, p)_p^∧, and the paragraph after it on profinite completions. Footnote 22 reads "This is not the definition initially given by Goodwillie, but it is equivalent to the corrected version of Goodwillie's definition as we learned from B. Dundas". Reference [32] is Dundas–Goodwillie–McCarthy (bibliography, p. 407).
- **/60.**
  - The last clause is replaced by the pullback (1), citing [32, Lemma 6.4.3.2]. It no longer says "diagram (1) over all n".
  - The locator adds "diagram (1) and footnote 22, p. 266".
  - A new note records footnote 22 and [32], says the construction is a pullback over primes, and points to /163.
  - I did not split /60, which the verifier left optional.
- **New item /163, "p-completion of TC"** (theorem, missing, route 1, locator "§II.4, after diagram (1), p. 266; §IV.3, pp. 351–352"). It states:
  - (a) Z^{hT} ≃ Z^{hC_{p^∞}} for p-complete Z, stated explicitly, and that fixed points commute with p-completion. Hence both vertical maps of (1) are profinite completions.
  - (b) For bounded below **cyclotomic** X: X_p^∧ is cyclotomic with φ_ℓ = 0 for ℓ ≠ p, and TC(X)_p^∧ ≃ TC(X_p^∧) ≃ TC(X_p^∧, p).
  - The note says what /66 and /124 use, gives the proof of (b), and explains why "p-cyclotomic" on p. 351 is not copied (E26).
- **The mathematics of (b), checked.**
  - Each (X^{tC_ℓ})^{hT} is ℓ-complete (Lemma II.4.2), so its p-completion vanishes for ℓ ≠ p. p-completion is exact and commutes with products, because S/p^k is finite.
  - X^{tC_p} ≃ (X_p^∧)^{tC_p} (Lemma I.2.9, read on p. 224).
  - (X_p^∧)^{tC_ℓ} = 0 for ℓ ≠ p, and X_p^∧ is bounded below.
  - (a) identifies T-fixed points with C_{p^∞}-fixed points.
- **KTheoryFiniteLocalFields:L.4/integral-and-p-typical-tc-agree-after-completion.** The node exists in `packets/KTheoryFiniteLocalFields.json`, whose status is `partial`, and `data/decompositions/` has no KTheoryFiniteLocalFields file. It is named only in /163's note and under "For the maintainer". The draft packet is not edited.

## /3 (medium, error): Proposition IV.3.4 and Lemma IV.3.5 need a T-action: fixed

I followed the verifier's version.

- **Checked.** I read pp. 351–353 in the Acta text and in arXiv v2, which have the same wording.
  - The Frobenius lift is "a C_{p^∞}-equivariant factorization".
  - Proposition IV.3.4 and Lemma IV.3.5 are stated for p-cyclotomic X and use X^{hT}, ΣX_{hT} and tr.
  - The proof of Lemma IV.3.5 starts from "the T ≅ T/C_p-equivariant map φ̃_p".
  - The sentence "the C_{p^∞}-action on X_p^∧ extends automatically to a T-action" is on p. 352.
  - Remark II.1.3 (pp. 240–241) says "not every C_{p^∞}-action on a p-complete spectrum extends to a T-action".
- **The counterexample, checked.** Take X = H(F_p[C_{p^∞}]) with translation.
  - X is an HF_p-module, so p·id = 0 and X is p-complete. It is bounded below.
  - C_{p^∞} is a free C_p-set, so F_p[C_{p^∞}] is a free F_p[C_p]-module and its Tate cohomology vanishes. Then X^{tC_p} = 0, φ_p = 0, and φ̃_p = 0 is a C_{p^∞}-equivariant lift.
  - BT is simply connected, so a T-action acts trivially on π_*. Translation acts non-trivially on π_0.
- **Item /124** is restated with the verifier's two hypothesis sets:
  - (IV.3.4) X p-complete and bounded below, with a T-action and a T ≅ T/C_p-equivariant φ_p, that is, a p-complete bounded below cyclotomic spectrum, and a T-equivariant lift. The conclusion is TC(X, p) ≃ TC(X) and the pullback with tr: ΣX_{hT} → X.
  - (IV.3.5) X p-complete with a T-action and a T ≅ T/C_p-equivariant φ̃_p.

  The note explains why a C_{p^∞}-equivariant lift is automatically T-equivariant here, and that Theorem IV.3.6 (/125) is unaffected.
- **The automatic equivariance, checked.** The mapping spectra into the p-complete X^{hC_p} and X^{tC_p} are p-complete. For p-complete Z, Z^{hT} ≃ Z^{hC_{p^∞}}, because BC_{p^∞} → BT is an F_p-homology equivalence into a simply connected space. So the spaces of T- and C_{p^∞}-equivariant factorisations agree.
- **New source issue E26** (error, affects a stated result, known new). It is the next free number.
  - It quotes p. 351 (the Frobenius-lift definition, and the sentence "if X is a p-cyclotomic spectrum which is bounded below, then TC(X)_p^∧ = …"), p. 352 (the "extends automatically" sentence and Proposition IV.3.4) and p. 353 (Lemma IV.3.5).
  - The correction is "assume a T-action and a T-equivariant lift", with both hypothesis sets.
  - The reason includes the HF_p[C_{p^∞}] example. It says that the results are ill-posed on their stated hypotheses rather than false, and that Theorem IV.3.6 is unaffected.
  - `searched` lists only what I checked:
    - the Acta correction (SHA-256 `0b98fb63…`), whose entries touch none of pp. 351–354;
    - arXiv v2, the latest version (the arXiv listing shows v1 and v2), which has the same text;
    - Crossref, which registers no update for 10.4310/ACTA.2018.v221.n2.a1.
  - E26 has no `review` block. PROTOCOL §18 leaves that block to the reviewer of this fix.
- **The summary field and the report** mention E26.

## /4 (medium, duplicate): −^triv had two owners: fixed, including the CMM-21 edit

I followed the verifier's version, which edits CMM-21 directly and drops the claimed /137–CMM-21/022 overlap.

- **NS18 /136** is restated in CMM's general form:
  - −^triv: Sp → Cyc Sp is the unique symmetric monoidal colimit-preserving functor;
  - it sends S to S^triv, the cyclotomic sphere and the unit of Cyc Sp (/35);
  - it is left adjoint to TC = map_{Cyc Sp}(S^triv, −) (/40).

  A new note gives the paper's colimit argument (p. 363, read). It says that Corollary IV.4.16 uses the monoidality, and that PAPER-CLAUSEN-MATHEW-MORROW-21/021 imports the item from RT.2, the single owner. The item stays missing on route 1 (RT.2).
- **NS18 /137.** Its note now names PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/8 as the real overlap, as the "in other words" form of Corollary IV.4.16. It says that the overlap sits in AMMN-22's accepted route 2, in an extraction whose verdict is "revise". L.5 should stay the single owner.
  - Checked: AMMN-22/8 is in its route 2 (RT.1, RT.2, RT.3, RT.3b, RT.6), route 2's verdict is accept, and the overall verdict is revise.
  - No note on CMM-21/022 was added.
- **CMM-21, exactly as the verifier authorised:**
  - /021 becomes `planned` with `planned: ["RefinedTraceMethods:RT.2"]` and a one-sentence note citing NS18/136. Its statement is unchanged.
  - /021 is removed from route 1's items (84 → 83).
  - Route 1's brief bullet "trivial cyclotomic spectra and HF_p^triv, with Lemma 2.10 (Frobenius kills x)" becomes "HF_p^triv, with Lemma 2.10 (Frobenius kills x), importing −^triv, its symmetric monoidal structure and its adjunction with TC from RT.2".
  - The brief's "Import, never re-plan" RT.2 entry adds "trivial cyclotomic spectra −^triv with their symmetric monoidal structure and their adjunction with TC".
  - Nothing else in CMM-21 changed.
- **Cycle test.** RT.2 → RefinedTraceMethodsPartIIHenselianPairs is the Part II's existing first-prerequisite direction, so the import adds no new stage edge.

## /5 (medium, missing): the ∞-category of spectra had no items: fixed

I followed the verifier's owners, not the red team's E2.

- **Checked.**
  - The paper uses these notions: p. 205 ("an E_1-algebra in the ∞-category of spectra Sp in the language of [71]"; "we write ⊗_S for the symmetric monoidal tensor product of spectra"), p. 211 (Theorem 1.7's bounded below and p-completion), Lemma I.2.6 on p. 222 (τ_{≤n} and τ_{≥−n}), and footnote 9 on p. 219 ("for all chain complexes").
  - The stage texts of H.5:spectra, H.6 and E5:spectra-comparison are in `research/blueprint/atlas/roadmaps/`.
  - RS-33 narrows H.5:spectra to keep "Eilenberg-Mac Lane spectra from chain complexes, … and functorial truncations" and "the generic concrete smash product", and H.6 to keep "the actual E/p^r tower and homotopy limit" (`data/restructure/RS-33.result.json`).
- **New planned items**, each with a note saying that NS18 uses the ∞-categorical version:
  - **/164**, the ∞-category of spectra: Sp with its presentably symmetric monoidal structure, ⊗_S, the unit S and Σ^∞_+ ⊣ Ω^∞. It is planned at StableHomotopyKTheory:H.5:spectra and EnhancedDerivedSheaves:E5:spectra-comparison. The note records that the ∞-category Sp itself is no layer's explicit target, and makes the request below.
  - **/165**, Eilenberg–MacLane spectra and Postnikov truncations: planned at H.5:spectra, with Postnikov convergence (the input to Lemma I.2.6, /18) at H.6. The note says that E2 is not the owner. It cites Mathlib's `DerivedCategory.TStructure.t` (Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:34, read at 082e2d3) as a near miss that is not what the paper uses.
  - **/166**, bounded below spectra and p-completion: planned at H.6.
  - **/167**, "HZ-modules are chain complexes", Mod_{HZ}(Sp) ≃ D(Z) with the HZ_p variant: planned at E5:spectra-comparison. It is used by /134, /138 and footnote 9.
- **The request.** An extraction has no `requests` field, so, as the verifier said, the request is in /164's note and under "For the maintainer". H.5:spectra should export the symmetric monoidal presentable ∞-category of its model early, and RT.2 should import it from the start, with an edge E5:presentability → RT.2.
- **The report and summary.** "What the atlas has" in the report lists the four items and their owners, and flags the ordering. The summary field mentions them.
- **Cycle test.** Read-only, on the atlas that `scripts/build.py` assembles in memory (2,840 stages, 8,258 stage edges).
  - RT.2 reaches none of E5:presentability, E5:spectra-comparison, H.5:spectra, H.5 and H.6.
  - So each of the edges E5:presentability → RT.2, E5:spectra-comparison → RT.2 and H.6 → RT.2 would be acyclic.
  - H.5:spectra already reaches RT.2.

## /6 (low, missing): not applied

This is a low finding, recorded only. The verifier's fix:
- record footnote 9, that Lemma II.4.1's proof uses only the conclusion of the Tate orbit lemma (a note on /58), and the rewording to "an E_2-ring map HF_p → A";
- route the new Mahowald–Hopkins item to LMMT-24's accepted ChromaticHomotopyTheory route (its /78), not to L.5.

## /7 (low, error): not applied

This is a low finding, recorded only. The verifier's fix:
- /104 gets Lemma III.5.2's properness hypothesis, as /105 has;
- /55 gets the order Φ^{C_n}_U(Φ^{C_m}_U X), as the red team gave it;
- /155 applies B.19 only to cyclic objects.

## /8 (low, missing): not applied

This is a low finding, recorded only. The verifier confirmed five misprints: p. 238 (Lemma I.2.6(ii) for (i)); p. 310 (H ⊊ V for H ⊊ C_p); p. 395 ("proper paracyclic"); footnote 46 on p. 389 ("successor"); and p. 378 (the reversed arrow G′₁F → G′₀). It found two more in passing: C^{BZ} for C^{BT} in Proposition B.19(i), p. 394, and the R^k_{F_n}FX of Lemma II.5.11 noted under /1. The new entries should be numbered after E26.

## /9 (low, error): not applied

This is a low finding, recorded only. E22's locator, as the review rewrote it, says the correction lists five occurrences of "[?]". The correction lists seven: p. 240 line −9; p. 260 lines 7, 8, −15 and −3; p. 281 line 6; and p. 284 line 11. I read the correction and confirmed these lines. The extraction's original locator should be restored, and the report's E22 paragraph with it.

## /10 (low, other): not applied

This is a low finding, recorded only. The route reasons in `PAPER-NIKOLAUS-SCHOLZE-18.review.json` (routes 1–3) do not match the routes. The file is a dated review record and is not a deliverable of this job.

## /11 (low, other): not applied

This is a low finding, recorded only. The verifier's fix:
- add `review` blocks to E1–E25, citing REV-PAPER-NIKOLAUS-SCHOLZE-18's confirmation;
- add `sourceVersions` entries for the published text (`8b1856fa…`), the correction (`0b98fb63…`) and arXiv v2 (`12b6cdbd…`). I reproduced all three hashes on 30 September 2026.

`scripts/check_errata.py` still reports the missing `sourceVersions`, as it did before this fix.

## For the maintainer

These changes lie outside this job's deliverables.

- **The ∞-category Sp (/5).** RT.2 needs Sp as a presentably symmetric monoidal stable ∞-category from NS18's first chapter on. At present:
  - H.5:spectra plans only a concrete model and its stable homotopy category;
  - E5:spectra-comparison is a late return;
  - the E5 packet node E5:spectra-comparison/late-realisation leaves the construction of Sp to StableHomotopyKTheory. That packet is still a draft.

  Decide the owner of the ∞-category Sp. Ask H.5:spectra to export it early, for example by the symmetric monoidal Dwyer–Kan localisation of NS18/140. Add the edges E5:presentability → RT.2 and, for p-completion, H.6 → RT.2. Both are acyclic on the assembled atlas.
- **KTheoryFiniteLocalFields L.4 (/2).** When the KTheoryFiniteLocalFields packet is next reviewed, L.4/integral-and-p-typical-tc-agree-after-completion should cite PAPER-NIKOLAUS-SCHOLZE-18/163 (and RT.2) for TC(X)_p^∧ ≃ TC(X_p^∧, p).
- **CMM-21's report and design job (/4).** `papers/PAPER-CLAUSEN-MATHEW-MORROW-21.md` is not a deliverable. It should read "122 items: 1 library, 19 planned and 102 missing", with route 1 at 83 items (its lines 7, 9 and 90). Its "Planned" list should include /021 at RT.2. `PAPER-CLAUSEN-MATHEW-MORROW-21.review.json` says "84 items" for route 1, and it is a dated record.
  - DESIGN-RefinedTraceMethodsPartII is pending in `queue.json`, and its issue (#3387) was generated from the old brief. Regenerate it, so that the design imports −^triv from RT.2 rather than planning it again.
- **AMMN-22 (/4).** When PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22 is revised, THH(F_p) ≃ τ_{≥0}HZ_p^{tC_p} (its /8, NS18's /137) should keep a single owner, KTheoryFiniteLocalFields:L.5.
- **E26 needs a verdict (/3).** The reviewer of this fix should add E26's `review` block. Only then does `scripts/errata.py` list it as confirmed.
- **Low findings.** /6–/11 are recorded above with the verifier's fixes, for a later round or the next review of the extraction.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NIKOLAUS-SCHOLZE-18.result.json research/blueprint/papers/PAPER-CLAUSEN-MATHEW-MORROW-21.result.json`: ok, ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- **Assembled atlas.** `scripts/build.py`'s `assemble()` runs read-only with both edited papers: every planned stage id exists. The cycle tests are above.
- **Formatting and edits.** The JSON files keep their formatting: NS18 indent 2, CMM-21 indent 1, non-ASCII characters written literally, final newline. I checked before editing that re-serialising each file gives it back unchanged.
  - One script per JSON file applied the edits. Each asserted that the replaced text occurred exactly once in its field, or that the whole field equalled its old value.
  - A further script edited the report under the same assertion.
- **Sources.** Each was read on 30 September 2026, and its hash matches the one the extraction records:
  - the Acta PDF (`8b1856fa…`), with page images of pp. 270 and 276;
  - the correction (`0b98fb63…`);
  - arXiv v2 (`12b6cdbd…`).
- **Citations.** Every stage and node id cited was checked against `research/blueprint/atlas/`, `research/blueprint/packets/` or the assembled atlas. The one library declaration cited was read at Mathlib 082e2d3 and found in the baseline `declarations.tsv`.
- No Lean was run.
