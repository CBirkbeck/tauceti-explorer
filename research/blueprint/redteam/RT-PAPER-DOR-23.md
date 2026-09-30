# Red team: PAPER-DOR-23 (Gal Dor, *Exotic Monoidal Structures and Abstractly Automorphic Representations for GL(2)*)

Job `RT-PAPER-DOR-23` (issue #4228), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-DOR-23.result.json`, in the format of PROTOCOL section 17.

**Result:** 11 findings: 6 medium and 5 low.

- **The extraction.** It is careful: 59 items, 1 new route and 7 source issues.
  - The review corrected formulas against the page images, and I confirmed those corrections.
  - All 7 source issues stand.
  - The published paper has no correction, and arXiv has only v1 and v2.
- **Medium findings.**
  - A missed source issue in Remark 3.47, which the review copied into two items and into the E7 correction.
  - Three items routed to, or kept in, the new roadmap that have an existing or more natural owner: the Kirillov model, the positive-characteristic Weil representation, and ⊗_G. Mathlib already has ⊗_G.
  - A theorem the spherical part of the paper uses without saying so: the spherical Hecke algebra is the Bernstein centre.
  - A planned status that overclaims: the centre's transposition invariance.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-442dc5` (#1373, PR #2019, 22–23 September).
  - The review, REV-PAPER-DOR-23, is by `cc-39fac3` (#1374, PR #2304, 23 September).
  - These are the only session ids in the result, report, review JSON, review report and handoff note. `cc-f805bf` appears in none of them.
  - There is no errata file for this paper. Its seven REGISTER entries are attributed to the extraction and the review only.
- **Disclosure.**
  - This session wrote PAPER-LUST-STEVENS-20, which joined SmoothRepresentationsPartII.
  - It wrote FIX-RT-AREA-automorphic-1, whose fixes report proposes AL.3:global-inputs and the archimedean GL₂ cases for R16.2/R16.3.
  - It red-teamed Treumann–Venkatesh 16.
  - No finding routes anything to SmoothRepresentationsPartII or depends on those fixes. Finding 2 quotes R16.2's original text, and the fixes proposed no Kirillov-model stage.

## What was read

- **The version of record.** Forum Math. Pi 11 (2023) e20, open access, doi:10.1017/fmp.2023.18. Fetched from Cambridge Core on 30 September 2026.
  - Its SHA-256 differs from the recorded hashes, because Cambridge Core stamps every download.
  - I read all of it through pdftotext.
  - I checked these page images: p. 12 for (2.4), pp. 25–26 for Warning 3.25 and Remark 3.28, and p. 33 for Remark 3.47.
- **arXiv 2011.03313v2.**
  - Its hash is the extraction's.
  - Remark 3.47 reads the same there.
  - There is no v3.
  - Crossref lists no update or correction relation.
- **The repository.**
  - Every item, route, prerequisite and source issue, and the review report.
  - Every cited layer in the atlas and campaign text: SR.0–SR.6, R16.2 and R16.5, AL.0–AL.4, the MetaplecticAutomorphicForms scope and MP.0–MP.3, FA.2, GlobalShtukas GS.0–GS.7, and EnhancedDerivedSheaves E5.
  - The MP.0 and GlobalShtukas packets.
- **Neighbouring extractions.** Bushnell–Henniart 17, Lust–Stevens 20, Fintzen 21, Stevens 08, Gan–Savin 23, Venkatesh 19, Dospinescu–Le Bras 17, Beuzart-Plessis–Chaudouard 25, BCGP 21, Kisin–Pappas 18, Clozel–Thorne 17, He 21, Zhu 17, Scholze 26, and every extraction with a Weil-representation or theta item.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - I read every cited declaration.
  - I searched `declarations.tsv` for each topic of the paper.

## What holds up

- **Formulas, recomputed.**
  - (2.12) follows from (2.4) and (2.6).
  - Remark 2.24 follows from (2.4), (2.7) and (2.8), using diag(y,1)·w·diag(y⁻¹,1) = diag(y,y⁻¹)·w.
  - ⟨ξ,h⟩ = tr(adj(ξ)h) = tr(w⁻¹ξᵀwh).
  - Example 2.14 follows from (2.5) and (2.9).
  - Proposition 2.5 follows from Remark 2.21.
  - So do the review's diag(1, −π^ν) corrections to item 027.
- **Arguments, checked.**
  - The uniqueness step of Proposition 2.12: the abelianisation is ℤ/2.
  - Example 3.55's general principle.
  - Warning 3.25's orientation, against Remark 3.28's convention.
  - The proof of Proposition 4.19.
- **E1–E7.** All stand at their locators. E7 (Appendix A defines no global counit) is a real gap, but its correction inherits the defect of finding 1.
- **Library claims.**
  - Every cited Mathlib declaration exists at the line given.
  - Nothing in Tau Ceti bears on the paper. Its Hecke rings are Shimura's arithmetic ones for (GL_n(ℚ), SL_n(ℤ)).
- **Statuses.** Item 001 (library) and planned items 002, 004, 005, 052, 054 and 055 hold. Item 053 holds only in part (finding 4).
- **The route.** The one route is acyclic and routes each missing item once. Its design job has not started, so the fixes can still reach its brief.

## Findings

### Medium

1. **A missed source issue: Remark 3.47's condition cannot be met.**
   - **What the paper says.** Remark 3.47 allows any h with hKh⁻¹ ∩ U = ker θ.
   - **Why it fails.**
     - hKh⁻¹ ∩ U is compact, but ker θ is not unless F = ℚ_p.
     - Over F_q((t)), ker e contains c⁻¹t⁻ⁿ for all n ≥ 2, because Res(t⁻ⁿ dt) = 0.
     - Over an extension of ℚ_p of degree at least 2, ker e contains a ℚ_p-hyperplane.
     - The paper's own h = diag(1, −π^ν) gives hKh⁻¹ ∩ U = u(π^{−ν}O). By the definition of ν(e), that is the largest O-submodule on which e is trivial, which is what is meant.
   - **How it spread.** The review wrote "ker θ" into item 027, item 050 and the E7 correction. That correction is the design job's recipe for the global counit, and in Part II the condition fails at every place.
   - **Fix.**
     - Record E8 (misprint, affects the proof).
     - Replace ker θ by the conductor lattice in items 027 and 050 and in E7.
     - In E7, also require h_v to match Λ_v.
2. **The Kirillov model (item 003) has two owners.**
   - R16.2 owns GL₂ Whittaker models: "There is no second Whittaker model or local-factor carrier."
   - Dospinescu–Le Bras 17, accepted a day after this review, routed the supercuspidal Kirillov model to R16.2.
   - The route's reason still says SR.5/R16.2 plan the Kirillov model, while its brief says it is "built here".
   - **Fix.** Route item 003 to R16.2 by a source route, and have the new roadmap import it.
3. **No item for "Z_sph → Hom̲(E, E) is an isomorphism".**
   - p. 31 says: "It is clear that E is projective, that its restriction to each component is compact and that Z_sph → Hom(E, E) is an isomorphism."
   - The proof of Theorem 3.52 also needs "End(E) … covered by the center".
   - Concretely, E ≅ ⊕_η cInd_K(η∘det), and the claim is that the Bernstein centre of each spherical block is H(G//K), twisted by η. This is Bernstein's description of the centre plus Haines's centre-to-spherical isomorphism, not Satake alone.
   - SmoothRepresentationsPartIIParahoricCenters (Kisin–Pappas 18) owns that isomorphism. BCGP 21/20 sends the GL₂ Iwahori case to R16.2.
   - **Fix.** Add item 060, routed as a coalescing Part II with ParahoricCenters.
4. **Item 053 overclaims "planned".**
   - Remark 2.18 says the centre is fixed by g ↦ gᵀ. The proof of Lemma 2.17 says the centre acts on S(G) "the same way from both sides". Both come from the description of the centre as invariant distributions.
   - SR.3 plans the centre only as End(id), with invariance under *inner* isomorphisms. Transposition is an anti-automorphism.
   - Only the GS.7 packet node (equal characteristic, review pending) plans the distribution description.
   - **Fix.** Split out a missing item and route it to SR.3.
5. **The positive-characteristic Weil representation and function-field theta invariance (items 059, 006) belong in a MetaplecticAutomorphicForms Part II.**
   - The MP document names exactly this extension: "Positive-characteristic … covers require a separately sourced extension."
   - Its primary source is Weil 1964, the same source item 059 cites.
   - PROTOCOL §15 makes such an extension a Part II.
   - The exotic GL(2) roadmap should not be the atlas's only owner of these general tools.
   - **Fix.** Add a part-ii route for items 059 and 006, and have route 1 import it.
6. **⊗_G (item 056) is in Mathlib.**
   - `Rep.coinvariantsTensor` (Coinvariants.lean:410) is (A ⊗ B)_G ≅ A ⊗_{k[G]} B for any group.
   - Mathlib also has the coinvariants adjunction and (V ⊗ k[G])_G ≅ V.
   - Only the smooth statements are missing: S(G) ⊗_G N ≅ N, and smooth Tor with Lemma 2.20's spectral sequence.
   - Those belong with SR.2 and SR.0:derived-extension. Venkatesh 19 already routes derived smooth homological algebra there.
   - **Fix.** Mark the definition as library, split off the smooth part, and route that part to SR.

### Low

7. **Function-field automorphic functions (item 036).**
   - GlobalShtukas GS.0 and its node GS.0/cuspidal-automorphic-forms (merged 24 September, review pending) plan C_c(Bun_{G,N}(F_q)/Ξ) with constant terms.
   - S is their smooth colimit for GL₂.
   - **Fix.** Cite GS.0 and import it. Keep S, p and ℐ as missing.
8. **An implicit identification in Example 3.55.**
   - Theorem 2.2 is stated with Ṽ; Example 3.55 restates it with I_RL(V). The two agree only if Ṽ ≅ V∘(g ↦ g^{−T}).
   - For GL₂ this holds because w g w⁻¹ = det(g)·g^{−T} and Ṽ ≅ V ⊗ ω⁻¹. No item states it.
   - **Fix.** Add the item, planned at R16.2.
9. **The baseline note on Poisson summation.** It says "Poisson summation on R^n only", but the pinned Mathlib has `SchwartzMap.tsum_eq_tsum_fourier` on ℝ only.
10. **Remark 3.54 (item 032) names no import.** The presentable categories and Lurie tensor product it needs should come from EnhancedDerivedSheaves E5, where Scholze 26 routes dualizable categories.
11. **The report's opening is stale.** It still gives 51 items, 4 planned, 46 missing and one misprint, and still lists the Kirillov model as planned. The result file has 59 items and 7 source issues.

## Notes for the fixer and the design job

- Findings 2, 3 and 5–7 move items between routes.
- After applying them, recount the route and the summary, and rerun `scripts/check_paper.py`.
- Route 1's brief should then import the following, and not build them:
  - R16.2 (Kirillov model; the Ṽ ≅ V∘ι identification);
  - the ParahoricCenters Part II (Z_sph ≅ End E);
  - the new MP Part II (Weil representation in characteristic p; theta invariance);
  - SR.2 and SR.3 (⊗_G, smooth Tor, the centre as distributions);
  - GS.0 (automorphic function spaces);
  - E5 (presentable categories).
- What stays in the exotic roadmap is the paper's own mathematics:
  - the triality lift and the middle action;
  - ⊛, its unit and the weak symmetric monoidal structure;
  - degeneracy-free and spherical representations;
  - associativity and Theorem 3.52;
  - the global ⊛, μ, m and ℐ;
  - abstract automorphicity;
  - Appendix A.
