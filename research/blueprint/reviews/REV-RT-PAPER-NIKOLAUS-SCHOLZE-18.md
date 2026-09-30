# REV-RT-PAPER-NIKOLAUS-SCHOLZE-18

**Complete: all eleven findings confirmed.** Most of the fixes need refinements, set out below.

- **Job:** Refs #4335.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-NIKOLAUS-SCHOLZE-18, session `cc-f805bf`) were all done by other sessions.
- **Verdicts:** they are in `research/blueprint/redteam/RT-PAPER-NIKOLAUS-SCHOLZE-18.review.json`, which `python3 scripts/check_redteam.py` reports `ok`.

## Evidence and scope

**Sources read.** All three files match the SHA-256 hashes the extraction records.
- The published Acta Math. 221 (2018), 203–409, in its corrected online form (the intlpress PDF, and the text the extraction read).
- The Acta correction, Acta Math. 222 (2019), 215–218.
- arXiv v2 and its LaTeX source.

**Division of work.** Three verifiers worked in parallel: one on findings 1–3, one on 4–6, and one on 7–8. The lead verifier checked findings 9–11 and read every verdict.

**What was read:**
- page images where a symbol mattered (pp. 266, 268–270, 276, 310, 351–354, 377–378, 389, 394–395);
- every cited item and route;
- the other extractions' routes and review verdicts (CMM-21, LMMT-24, FGV-22, AMMN-22);
- RS-33 and RT-AREA-ktheory-1;
- the libraries at the pinned commits.

## /1: confirmed, with refinements (medium)

The page images and the v2 TeX both use R_{F̄}, the right adjoint of the shifted-coalgebra functor F̄, where items /68–/70 and /74 write R_F.

Item /70 is false as written. Its conclusion, that the counit F R_F → id is an equivalence, is the lemma's own hypothesis (R_F fully faithful). The lemma's real conclusion, that F̄R_{F̄} → id is an equivalence, is lost, although p. 272 uses it. The hypothesis that F preserves pullbacks is needed, and Corollary II.5.5's induction uses it.

Refinements:
- "F colimit-preserving" follows from F having a right adjoint, so it need not be stated.
- /74 should cite Corollary II.5.5 and write F_n X.
- In /68, write both the right adjoint and ν with R_{F̄}.

A further misprint was found in passing: the display in Lemma II.5.11 (p. 276) reads R^k_{F_n}FX where R^k_{F_n}F_nX is meant. It affects nothing.

## /2: confirmed, with refinements (medium)

Integral genuine TC is Goodwillie's pullback over primes, diagram (1) on p. 266, not a limit over n. Two facts are proved there but have no item. Both were checked:
- the vertical maps of (1) are profinite completions;
- for bounded below cyclotomic X, TC(X)_p^∧ ≃ TC(X_p^∧) ≃ TC(X_p^∧, p).

Refinements:
- Record footnote 22: this is the corrected form of Goodwillie's definition, and [32] is Dundas–Goodwillie–McCarthy.
- State fact (b) for *cyclotomic* X. The paper's "p-cyclotomic" on p. 351 is a slip, since TC(X) is defined only for cyclotomic spectra.
- State explicitly that Z^{hT} ≃ Z^{hC_{p^∞}} for p-complete Z. That equivalence, not the profinite-completion conclusion, is what the proof of Theorem II.4.11 uses.
- The KTheoryFiniteLocalFields L.4 node the fix cites is in an unpromoted draft packet. It does not plan the result yet, so mention it in a note for the maintainer rather than as a status.

## /3: confirmed (medium)

The counterexample holds step by step.
- X = H(F_p[C_{p^∞}]) with translation is bounded below and p-complete.
- X^{tC_p} = 0, because F_p[C_{p^∞}] is free over F_p[C_p]. So φ_p = 0, and the zero lift is a Frobenius lift.
- No T-action extends the translation action, because a T-action acts trivially on homotopy (BT is simply connected).

So Proposition IV.3.4 and Lemma IV.3.5 are ill-posed on their stated hypotheses. The paper's claim that the C_{p^∞}-action extends automatically to T contradicts its own Remark II.1.3.

The Acta correction touches none of pp. 351–354, and v2 has the same text. The new source issue is therefore **new**, of kind error, and affects a stated result.

Right correction:
- **Proposition IV.3.4:** X p-complete and bounded below, with a T-action and a T-equivariant φ_p; equivalently, X is a p-complete bounded below cyclotomic spectrum. A C_{p^∞}-equivariant lift is then automatically T-equivariant, by Remark II.1.3.
- **Lemma IV.3.5:** X p-complete with a T-action and a T-equivariant φ̃_p.
- **The new entry:** it should say that Theorem IV.3.6 and the rest of the paper are unaffected, and quote the p. 351 sentence.

The fixes for findings 2 and 3 should use the same hypothesis, because both go back to that sentence.

## /4: confirmed, with a corrected fix (medium)

NS18 item /136, the functor X ↦ X^triv as left adjoint to TC, goes to RT.2 by its accepted route 1. The accepted CMM-21 extraction puts the same statement (its /021) in its Part II route, and that brief says to "Cover … trivial cyclotomic spectra and HF_p^triv". So the pending DESIGN-RefinedTraceMethodsPartII would plan them a second time.

RT.2 is the right single owner. Everything X^triv is built from goes there already: the cyclotomic sphere, TC as a mapping spectrum, and the presentability and symmetric monoidal structure of Cyc Sp.

Corrected fix:
- **Edit CMM-21 directly**, which the finding names: mark /021 planned in RT.2, remove it from the Part II's items, and rewrite that brief to import X^triv from RT.2. Leaving only a note for the maintainer is not enough.
- **Restate NS18 /136 in CMM's general form:** symmetric monoidal, colimit-preserving, with unit S^triv.
- **Drop the claimed overlap between /137 and CMM-21/022.** /022 concerns HF_p^triv, while /137 concerns HZ_p^triv and THH(F_p). The statement that really overlaps /137 is AMMN-22/8, whose extraction is still under revision. The two need one owner once AMMN-22 is revised.
- **A dating slip:** CMM-21 was accepted about 1.7 hours after NS18, not a day earlier.

## /5: confirmed, with corrected owners (medium)

None of the 162 items covers Sp, the smash product and sphere, Σ^∞_+ ⊣ Ω^∞, Eilenberg–MacLane spectra, truncations, bounded below spectra or p-completion, and neither library has spectra. Two accepted extractions (LMMT-24/1 and FGV-22/3) already give such items planned statuses.

Corrections to the fix:
- **Truncations and Eilenberg–MacLane spectra** belong to StableHomotopyKTheory H.5:spectra, per the accepted RS-33 and the confirmed RT-AREA-ktheory-1/16, not to E2. Postnikov convergence belongs to H.6.
- **The smash product** is H.5:spectra's after RS-33. `data/atlas.json` still shows the pre-RS-33 texts, so cite RS-33.
- **Add Mod_HZ(Sp) ≃ D(Z)**, planned in E5:spectra-comparison. It is used by /134, /138 and footnote 9.

**For the maintainer:** RT.2's prerequisites reach neither E5:presentability nor E5:spectra-comparison. The E5 packet says Sp is StableHomotopyKTheory's to build, but H.5:spectra plans only a concrete model. So the ∞-category Sp that RT.2 needs is no layer's explicit target.

## /6: confirmed, with corrected routing (low)

Footnote 9's argument holds for all HZ-modules with C_{p²}-action. /58 should add a note that Lemma II.4.1's proof uses only the conclusion of the Tate orbit lemma (p. 220). The rewording to "an E_2-ring map HF_p → A" is right.

Correction: do not send the new Mahowald–Hopkins item to L.5. The accepted LMMT-24 extraction assigns that theorem (its /78) to the new roadmap ChromaticHomotopyTheory, and the NS18 item should join that route. References [16] and [17] are the paper's sources for deducing Bökstedt periodicity, not for the theorem itself.

## /7: confirmed (low)

- **(a) /104.** Carrying Φ_p's degreewise equivalence to the naive realisation needs properness (Corollary B.16). The paper proves properness only under Lemma III.5.2's hypotheses: Remark III.5.3 declines to prove more, and footnote 4 makes the condition standing. Add that hypothesis, as /105 already does. No source issue is needed.
- **(b) /55.** It reverses the order in Definition II.3.6's top-left corner Φ^{C_n}_U(Φ^{C_m}_U X). The red team's formula matches the paper.
- **(c) /155.** B.19 applies to cyclic objects; paracyclic realisations carry only an R-action. The fix is right. The claim that "sd_p^* is only defined on cyclic objects" is too strong, since the paper also builds sd_p: Λ_∞ → Λ_∞ on p. 392, but the conclusion stands.

## /8: confirmed (low)

All five misprints are in the published text and in v2. The Acta correction touches none of their pages, and none is among E1–E25.

1. **p. 238:** Lemma I.2.6(ii) is cited for part (i).
2. **p. 310:** "H ⊊ V" twice, for H ⊊ C_p.
3. **p. 395:** "proper paracyclic" for "proper cyclic".
4. **Footnote 46, p. 389:** "successor" for "predecessor". This was checked with f(k/(n+1)) = (k−1)/n and f(0) = −1/n, and is separate from E17.
5. **p. 378:** the arrow "G′₁F → G′₀" is reversed. E23 covers only the typesetting of p. 377.

A further misprint was found in passing: C^{BZ} for C^{BT} in Proposition B.19(i), p. 394. The item /155 does not copy it.

Adjustments:
- Number the new entries after finding 3's E26 if that is applied.
- List in `searched` only the sources the fixer actually checks.

## /9: confirmed (low)

The Acta correction lists seven occurrences of "[?]": p. 240 line −9; p. 260 lines 7, 8, −15 and −3; p. 281 line 6; and p. 284 line 11. E22's current locator, written by the review, says "the five occurrences the correction lists" and that pp. 281 and 284 are not listed. Both statements are false. The extraction's original locator was right and should be restored.

## /10: confirmed (low)

The review's route reasons do not match the routes it accepted:
- **Route 1:** the reason says "22 planned items listed alongside", but route 1 lists 15 planned items; all routes together list 23.
- **Route 2:** the reason mentions "the cyclic bar construction … and the HKR comparison", but the route carries /127 (the HKR filtration) and /129 (HH(F_p)).
- **Route 3:** the reason names lax equalizers and coalgebras, but those items (/36, /37, /67–/70) are in route 1.

The routes and verdicts themselves are unaffected, but the reasons should be corrected, because design jobs read them.

## /11: confirmed (low)

- **Missing review blocks.** No source issue carries the `review` block that PROTOCOL §18 has the reviewer add, although REV-PAPER-NIKOLAUS-SCHOLZE-18 reports all 25 confirmed. As a result `research/errata/REGISTER.md` lists the paper's findings, E1 among them, under "New mistakes awaiting review".
- **Missing source versions.** There is no `sourceVersions` list, although E1 affects a stated result.
- **The fix is right.** Add the review blocks citing REV-PAPER-NIKOLAUS-SCHOLZE-18's confirmation. Add sourceVersions entries for the published text, the correction and arXiv v2, with the SHA-256 hashes this verification reproduced.

## For the fix job

Findings 1–5 are medium and become FIX-RT-PAPER-NIKOLAUS-SCHOLZE-18. Apply them with the refinements above:
- /3's hypothesis is shared with /2;
- /4 edits CMM-21 as well;
- /5 uses the post-RS-33 owners and raises the Sp-ownership question with the maintainer.
