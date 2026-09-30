# Kurinczuk–Skodlerack–Stevens, *Endo-parameters for p-adic classical groups*: extraction and routing

Job PAPER-KURINCZUK-SKODLERACK-STEVENS-21. Claude Code, session `cc-48533a`, 29 September 2026. The machine-readable extraction is `PAPER-KURINCZUK-SKODLERACK-STEVENS-21.result.json`:

- 413 items: 21 planned, 2 library, 390 missing;
- 4 routes;
- 10 prerequisite papers;
- 37 source issues.

**Version read.** arXiv:1611.02667v3 (31 August 2020), marked "to appear in Inventiones Mathematicae": 81 pages, SHA-256 `1cbcbb77…9d9092`. This is the accepted text of Invent. Math. 223 (2021), 597–723, doi:10.1007/s00222-020-00997-0. The published typesetting was not compared. Locators are v3 statement numbers and pages.

**How it was read.** Four readers read the paper in parallel:

- §§1–4;
- §§5–6;
- §§7–9;
- §§10–12, with Appendix A and the references.

The drafts were then merged:

- **Duplicates removed.** Sixty-one items were dropped. Most were the introduction's restatements of later theorems, definitions and the conjecture. The rest were outside results that two readers each listed; for example [39, Theorems 5.2, 6.16, 9.26, 10.2 and 10.3] and [38, Proposition 5.2].
- **Stages and declarations checked.** Every planned stage exists in `data/atlas.json`, and every cited declaration exists at the pins.
- **Stated-result issues checked.** The issues claiming an error in a stated result were checked again against the text.
- **DOIs checked.** The DOIs were confirmed on Crossref.

The extraction is complete, so no handoff is needed.

## What the paper proves

The setting throughout:

- F_o is a non-archimedean local field of odd residual characteristic p.
- F/F_o is an extension of degree at most 2, with its involution.
- (V,h) is an ε-hermitian space and G = U(V,h). G° = G in the unitary and symplectic cases, and G° = G ∩ SL_F(V) = SO(V,h) in the orthogonal case (§1.6).
- G° is a unitary, symplectic or special orthogonal group, and not SO(1,1).
- Representations are on vector spaces over an algebraically closed field C of characteristic ≠ p.

The results:

- **Theorem 11.9.** Two cuspidal types for G° that intertwine in G° are conjugate in G°. With the exhaustion theorem of Stevens and Kurinczuk–Stevens, this classifies the irreducible cuspidal C-representations of G° by conjugacy classes of cuspidal types.
- **Endo-classes (§§7–9).** The proof generalises Bushnell and Henniart's potential simple characters and endo-equivalence in two directions: to potential semisimple characters of GL_F(V), and to self-dual potential semisimple characters of classical groups. In both cases endo-equivalence is an equivalence relation, characterised through a unique matching of blocks and, in the self-dual case, through concordance of self-dual embeddings (Theorems 9.9 and 9.16, Corollary 9.17).
- **Preparation.** The endo-class theory rests on:
  - §3: ε-hermitian Witt groups, their transfer along self-dual extensions, and concordance;
  - §5: simple strata;
  - §§6, 8, 10 and Appendix A: intertwining and conjugacy of self-dual simple and semisimple characters, including the matching theorem.
- **Endo-parameters (§12).** Endo-parameters classify intertwining classes of full semisimple characters for GL_F(V) (Theorem 12.9). Self-dual endo-parameters EP(h,G) classify them for U(V,h) (Theorem 12.29), and EP(h,G°) for special orthogonal groups (Corollary 12.34).
- **Conjecture (§1.21).** The paper conjectures a bijection EP(h,G°) → Wild(G°), compatible with the local Langlands correspondence, whose target is the set of extended wild inertial parameters. It is recorded here as a conjecture and is not a target.

## What the atlas already has

The 21 planned items and 2 library items sit at the edges of the paper:

- **Local fields.** Norm groups and class field theory, the Weil group, inertia and wild inertia, in the Tau Ceti ClassFieldTheory and LocalFieldsRamification roadmaps.
- **ε-hermitian spaces.** Witt's theorem, the local classification and the Witt groups W^ε(F/F_o), in GeometryOfNumbersAndQuadraticArithmetic GN.2 and GN.6. The quadratic case is in the Tau Ceti QuadraticFormInvariants roadmap. GN.2 names its "hermitian variants" only at stage level, and Tau Ceti has only the quadratic-form case (Witt index, cancellation); the notes say so.
- **Representation theory.** The Mackey step of the proof of Theorem 11.9 (SmoothRepresentationsOfLocalGroups SR.2).
- **Local Langlands.** The correspondence for GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6), and Arthur's, Mok's and Kaletha–Mínguez–Shin–White's correspondence for classical groups (ModularityAndLanglandsExtensions ML.4), with the L-group.
- **Libraries.** Hensel's lemma for square roots (Tau Ceti), and the subalgebra F[β] ⊂ End_F(V) (Mathlib).

Nothing in the atlas, its packets, Mathlib or Tau Ceti plans any of the following:

- lattice sequences as used here;
- strata;
- simple or semisimple characters;
- the Glauberman correspondence;
- cuspidal types for classical groups;
- endo-classes and endo-parameters.

Two proposals come close. The accepted Part II proposed by PAPER-FINTZEN-21 plans Kim–Yu types and Yu's construction, under a bound on p and with complex coefficients. PAPER-BUSHNELL-HENNIART-17's branch on Bushnell–Kutzko simple characters and endo-classes for GL_n was rejected in review. The item notes record both.

## Routes

1. **Part II of SmoothRepresentationsOfLocalGroups** (369 items). It joins `SmoothRepresentationsPartII` ("types, depth and the construction of supercuspidal representations", proposed by PAPER-FINTZEN-21) as a separately scoped branch for p-adic classical groups: all odd p, and coefficients of characteristic ≠ p. It covers:
   - the §3 material on self-dual extensions, embeddings and concordance;
   - strata, simple and semisimple characters and their intertwining;
   - ps- and pss-characters and endo-equivalence;
   - cuspidal types and Theorem 11.9;
   - endo-parameters;
   - the conjecture, recorded but not a target.

   This follows the maintainer's note on the paper. make_queue plans every Part II of one parent as one roadmap, so a second types roadmap would duplicate work. The brief imports:
   - SR.0–SR.2;
   - ET.6 for GL_m type theory and the GL_m correspondence;
   - ReductiveGroupsPartII for buildings and parahorics;
   - GN.2 for hermitian forms;
   - the Tau Ceti local-field roadmaps;
   - ML.4 and LanglandsParameterStacks LP0 for the parameter side.

   It asks that the GL_N Bushnell–Kutzko material be planned once, together with the GL_n branch proposed by PAPER-BUSHNELL-HENNIART-17. It also asks for coordination with the extraction of Stevens's *The supercuspidal representations of p-adic classical groups* (PAPER-STEVENS-08, in progress), which constructs the types this branch classifies.
2. **Source: GeometryOfNumbersAndQuadraticArithmetic GN.2** (18 items). The hermitian local theory of §§3.1–3.5 that GN.2's "hermitian variants" call for:
   - norms from quadratic extensions;
   - U(V,h) and the twisted forms a^*(h);
   - the twisting isomorphisms of W^ε;
   - the transfer λ_* of ε-hermitian forms along a self-dual extension, with Propositions 3.13–3.15, which extend Scharlau's transfer of quadratic forms.
3. **Source: LanglandsParameterStacks LP0** (2 items). Wild inertial parameters, the groups S_ρ, Wild(G°) and the restriction map Res of §1.21, together with the centre computation (1.1). They are parameters restricted to wild inertia, which LP0 constructs.
4. **Source: ModularityAndLanglandsExtensions ML.4** (1 item). Extended Langlands parameters (ϱ, χ_ϱ) and the set Lang(G°): the parametrisation of L-packets used by the classification whose sources ML.4 owns.

## Source issues

There are 37 source issues: 26 misprints, 4 errors and 7 gaps. Three affect a stated result and eight affect a proof. The article has no erratum registered on Crossref, v3 is the latest arXiv version, and no atlas packet records issues for it.

**Stated results that need a correction:**

- **E32, Theorem 10.4.** The conclusion "θ is conjugate to θ′ by an element of G° ∩ P₋(Λ)" cannot hold when Λ′ ≠ Λ. The proof and Remark 10.5 give conjugacy by some y ∈ G° with yΛ = Λ′, and that is how Theorem 11.9 uses it.
- **E23, Corollary 8.19.** It prints C(Λ,r,β) = C(Λ′,r,β̃) and C(Λ,r,β′) = C(Λ′,r,β̃′); these are sets of characters of different groups. The proof gives C(Λ,r,β) = C(Λ,r,β̃) and C(Λ′,r,β′) = C(Λ′,r,β̃′).
- **E36, the counting formula after Theorem 12.29.** N(θ₋, G̃, G) = 2^{|I₀|−n₀} gives 1/2 when |I₀| − n₀ = −1, where the true count is 1. It should read 2^{max(|I₀|−n₀, 0)}.

**Errors and gaps in proofs:**

- **E30, Theorem 9.16 (ii)⇒(iii).** The proof never shows that the matching commutes with σ. It follows from uniqueness of matchings, as in Remark 8.9.
- **E17, Lemma 8.2.** The proof produces one l, where the lemma claims every large l; the fix is to run the argument along a subsequence.
- **E12 and E13, Lemmas 5.15 and 5.16.** These cite results whose hypotheses are not met. Lemma 3.31(ii)(b) and the element of Corollary 5.14 repair them.
- **E34, Lemma 12.32.** The proof cites Lemma 10.1, whose hypothesis fails when the blocks have different valuations; Theorem 10.2(ii) is what is needed.
- **Smaller slips:**
  - E10: Proposition 5.19's remark on null strata.
  - E11: Proposition 6.2 applies Lemma 5.3 to a stratum that is only pure.
  - E14: Lemma 6.6(ii) omits a citation of Proposition 5.19(i).
- **E35, the example after Theorem 12.29.** "−1 ∉ N_{E/E_o}(E)" does not follow from "−1 is not a square in F". Q₃(√−1)/Q₃ is a counterexample, since units are norms from an unramified extension. The example needs this as a hypothesis.

The misprints are missing primes and minus subscripts, swapped letters and wrong cross-references; each is listed with its correction.

## Prerequisite papers not yet covered by the atlas

1. Stevens, *Semisimple characters for p-adic classical groups* (Duke 2005), doi:10.1215/S0012-7094-04-12714-9.
2. Skodlerack–Stevens, *Intertwining semisimple characters for p-adic classical groups* (Nagoya 2020), doi:10.1017/nmj.2018.23.
3. Kurinczuk–Stevens, *Cuspidal ℓ-modular representations of p-adic classical groups* (Crelle 2020), doi:10.1515/crelle-2019-0009.
4. Bushnell–Kutzko, *The admissible dual of GL(N) via compact open subgroups* (Annals of Math. Studies 129, 1993), doi:10.1515/9781400882496.
5. Bushnell–Henniart, *Local tame lifting for GL(N) I: simple characters* (Publ. IHÉS 1996), doi:10.1007/BF02698646.
6. Broussous–Sécherre–Stevens, *Smooth representations of GL_m(D) V: endo-classes* (Doc. Math. 2012), doi:10.4171/dm/360.
7. Skodlerack, *Field embeddings which are conjugate under a p-adic classical group* (Manuscripta Math. 2014), doi:10.1007/s00229-013-0654-6.
8. Broussous–Stevens, *Buildings of classical groups and centralizers of Lie algebra elements* (J. Lie Theory 2009), doi:10.5802/jolt.541.
9. Stevens, *Intertwining and supercuspidal types for p-adic classical groups* (Proc. LMS 2001), doi:10.1112/plms/83.1.120.
10. Blondel–Henniart–Stevens, *Jordan blocks of cuspidal representations of symplectic groups* (Algebra Number Theory 2018), doi:10.2140/ant.2018.12.2327.

Stevens's 2008 *Inventiones* paper and Bushnell–Henniart's 2017 *Annals* paper are already in `papers.json`. None of these papers was read for this job.

## Corrections by the independent review (REV-PAPER-KURINCZUK-SKODLERACK-STEVENS-21)

Claude Code, session `cc-fb70e5`, 29 September 2026. The full report is `research/blueprint/reviews/REV-PAPER-KURINCZUK-SKODLERACK-STEVENS-21.md`.

- **Version of record read.**
  - Invent. Math. 223 (2021) 597–723 is CC BY 4.0. The review read it from the University of East Anglia repository (eprint 76674; SHA-256 `4098a4a1…122e`), and `sourceVersions` records it.
  - Print keeps the arXiv v3 numbering throughout, so the item locators still refer to v3. Printed page p is PDF page p − 596.
- **G°.** The setting said G° = G ∩ SL_F(V), which is SU(V,h) for a unitary group. The paper's G° (§1.6) is G in the unitary and symplectic cases and SO(V,h) in the orthogonal case. The setting above, the route 1 brief and the standing preamble of 75 items are corrected.
- **Corrected statements.** Items 308 (the §10.2 example, E48), 309 (Theorem 10.4, E32) and 376 (the counting formula, E36) now state the corrected results instead of the printed ones. Items 26, 94, 113, 160, 177, 244, 377 and 383 have smaller fixes.
- **Mistakes.**
  - All 37 findings are confirmed, and each locator now gives the printed page.
  - Print corrects E1, E20, E21, E28, E32 and E35, and their `known` fields say so. Print moves the slip of E37 without fixing it.
  - The `known` fields read "new: …", which the register files as corrected in print. They now read "new".
  - E2, E4 and E28 overlapped E25 and E27, and each place is now recorded once.
  - The review adds fourteen (E38–E51). Two of them, E40 and E44, are corrected in print. The substantive ones:
    - **E48:** the example opening §10.2 is false for r ≥ 1, with a split SO(2,2) counterexample.
    - **E40:** the self-dual †-construction gives a standard stratum only for even period.
    - **E41, E42, E47:** gaps in the proofs of Proposition 5.19 (and Lemma 6.11), in §6.2 and in Theorem 9.16. Each is repaired by a normalisation the paper makes elsewhere, and the results stand.
  - There are now 51 findings: 34 misprints, 11 gaps and 6 errors.
- **Routes.** All four routes are accepted. The route 1 brief places the counting formula in §12.4 and carries the §10.2 correction.
