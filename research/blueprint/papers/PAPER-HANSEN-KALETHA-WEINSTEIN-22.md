# PAPER-HANSEN-KALETHA-WEINSTEIN-22: extraction and routing

Issue #1391. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

David Hansen, Tasho Kaletha and Jared Weinstein, *On the Kottwitz conjecture for local shtuka spaces*, Forum Math. Pi 10 (2022), e13, 79 pp. (doi 10.1017/fmp.2022.7; arXiv 1709.06651).

The result has **126 items**:

- no library items;
- 22 planned items: the Fargues–Scholze foundations, geometric Satake, the six operations on diamonds, stable conjugacy and endoscopic data, and the GL_n comparison, all planned in the atlas;
- 104 missing items, routed as follows:
  - 50 to a **Part II of HeckeStacksAndLocalShtukas**, *the Lefschetz–Verdier trace formula and the Kottwitz conjecture* (area `langlands`);
  - 36 to a **Part II of VStackSheavesAndLisseCategories**, *decent v-stacks, cohomological correspondences and the Lefschetz–Verdier trace formula* (area `etale`);
  - 12 to a **Part II of SmoothRepresentationsOfLocalGroups**, *characters, trace Paley–Wiener and ℓ-adic lattices* (area `representations`);
  - 6 as **sources** of existing layers: ET.0 (4 items) and EDC.8 (2 items).

Fourteen mistakes are recorded under `sourceIssues`: thirteen misprints, and an error in the proof of Lemma 3.1.1 that does not affect the lemma.

## What the paper proves

Let F/Q_p be finite, G a connected reductive group over F, {μ} a conjugacy class of cocharacters, not necessarily minuscule, and b the basic class in B(G, μ). Scholze's local shtuka spaces Sht_{G,b,μ,K} carry commuting actions of G(F) and G_b(F), and their cohomology with Satake-sheaf coefficients defines, for each admissible ρ of G_b(F), a virtual representation Mant_{b,μ}(ρ) of G(F) × W_E.

1. **The Kottwitz conjecture on the elliptic locus (Theorem 1.0.2).** Assume Kaletha's refined local Langlands correspondence (Conjecture G). For a discrete parameter φ and ρ ∈ Π_φ(G_b), after forgetting W_E,
   Mant_{b,μ}(ρ) = Σ_{π∈Π_φ(G)} dim Hom_{S_φ}(δ_{π,ρ}, r_μ) π + err,
   where err has vanishing character on the elliptic locus. If Π_φ(G) is supercuspidal and the Fargues–Scholze parameter of ρ is supercuspidal, err = 0. This covers every μ, not only minuscule ones, and needs no global input.
2. **Inner forms of GL_n (Theorem 1.0.3).** The Fargues–Scholze parameter of any irreducible smooth representation of an inner form of GL_n is the usual semisimplified L-parameter.
3. **Hecke transfer (Section 3).** Related pairs (g, g') of strongly regular elements, with the isocrystal invariant inv[b](g, g'), form a space Rel_b that is a local homeomorphism onto open and closed subsets. The Hecke transfer maps T_{b,μ} are defined from it. Under Conjecture G, T^{G_b→G}_{b,μ}Θ_ρ = Σ_π dim Hom(δ_{π,ρ}, r_μ)Θ_π on elements that transfer (Theorem 3.2.9). The proof uses the endoscopic character identities and the sign identity e(G)e(G_b) = (−1)^{⟨2ρ_G,μ⟩}.
4. **A Lefschetz–Verdier trace formula for v-stacks (Section 4).**
   - It is built on Gulotta–Hansen–Weinstein's decent v-stacks and fine morphisms, which have genuine !-functors.
   - It follows Lu–Zheng's categorical traces in the 2-category of cohomological correspondences. A pair (X, A) is dualizable exactly when A is ULA.
   - The characteristic class cc_{X/S}(A) lives on the inertia stack and commutes with proper pushforward (Theorem 4.3.8 and Corollary 4.3.9).
   - Characteristic classes satisfy a Künneth formula over a base with smooth diagonal (Theorem 4.5.3).
   - On classifying stacks [S/G_S] they are trace distributions (Proposition 4.4.3). On [X/G] they are universal local terms (Theorem 4.6.1).
5. **Local terms on affine Grassmannians (Section 5).** At a fixed point x of a strongly regular g, the local term of the Satake sheaf S_V is (−1)^{⟨2ρ, ν_x⟩} rank V[ν_x] (Theorem 5.1.3). The proof:
   - shows that local terms depend only on the Schubert cell;
   - degenerates along the Beilinson–Drinfeld Grassmannian to the Witt vector Grassmannian, over which local terms are constant;
   - there computes Euler characteristics of semi-infinite orbits (Yu's integral Satake);
   - applies Varshavsky's theorem on true and naive local terms, extended to perfect schemes.
6. **Application to Hecke stacks (Section 6).**
   - Elliptic fixed points on the Hecke stack are admissible (Theorem 6.2.3), and their inertia is the relation space (Corollary 6.2.4).
   - The geometric transfer of distributions agrees with the Hecke transfer of orbital integrals (Propositions 6.3.3 and 6.3.5).
   - Hence the trace distribution of RΓ(G, b, μ)[ρ] on the elliptic locus is the transfer of Θ_ρ: first for representations with a Z̄_ℓ-lattice (Theorem 6.4.9), then in general (Theorem 6.5.2).
   - Mant_{b,μ} sends trace forms to trace forms (Theorem 6.5.4). This is Taylor's conjecture, by the trace Paley–Wiener theorem.
7. **Appendices.**
   - Appendix A: transfer factors of G and G_b differ by the isocrystal invariant, and the Kottwitz sign can be computed on the dual group.
   - Appendix B: homological algebra over R/𝔪^k, and sheaves on locally profinite sets.
   - Appendix C: non-elliptic virtual representations are combinations of parabolic inductions (van Dijk, Dat, Kazhdan). Standard modules of lattice-admitting representations generate the Grothendieck group, through Dat's ℓ-adic Langlands classification.

## Sources inspected

- **The published article** ([doi 10.1017/fmp.2022.7](https://doi.org/10.1017/fmp.2022.7)) is open access (CC BY). It was received 21 September 2017, revised 17 March 2022 and accepted 8 April 2022. The PDF (79 pages, SHA-256 `62d523a5…9e039e13`) was read in full. **Locators give the published numbering and pages.**
- **arXiv 1709.06651v4** (17 March 2022, the revision date of the published version) was read as a PDF (SHA-256 `d37e986e…bc0bd5c`) and in its TeX source (SHA-256 `ff665124…d60bdb4`).
  - The published PDF's text layer garbles formulas and ligatures, so the mathematics was read in the TeX.
  - Section 4 is `LefschetzVerdierRevised.tex`. The older `LefschetzVerdier.tex` in the tarball is not included by the main file.
  - Section and statement numbering agree with the published version. The published pages for every statement were found in its text layer.
  - Each source issue was checked in both texts. All fourteen are present in the published version.
- **Crossref** records no correction or update relation for the article.

All sources were accessed on 23 September 2026.

## Mistakes found (`sourceIssues`)

**Misprints (E1, E2 and E4–E14), each with reach "nothing":**

- **E1 (Section 1, p. 3).** "Groth(G_b(F)) … admissible representations of G(F)" should be representations of G_b(F).
- **E2 (Remark 2.4.4, p. 12).** H^{i,j}(G, b, μ)[ρ] is called "an admissible representation of G_b(F)". It is a G(F)-representation: the G_b(F)-action has been used up by Ext_{G_b(F)}(−, ρ).
- **E4 (Example 3.2.10, p. 16).** "T^{G→G_b} f(g') = −2f(g); setting f = Θ_ρ" should use T^{G_b→G}, which is the map in Theorem 3.2.9 and the only one that accepts Θ_ρ. With it, −2Θ_ρ(g') = 2Θ_π(g) gives the stated Jacquet–Langlands identity Θ_ρ(g') = −Θ_π(g).
- **E5 (equation (3.3.3), p. 18).** "ρ_G is the sum of the positive roots" should say 2ρ_G. Read literally, the exponent ⟨2ρ_G, μ⟩ would always be even and the sign trivial.
- **E6 (end of Section 3.4, p. 20).** The target of T̃^{G→G_b} is written with G(F)-coinvariants. It should be G_b(F)-coinvariants, as in Definition 6.3.2.
- **E7 (proof of Theorem 4.5.3, p. 41).** "In_S(T_1)" should be In_S(T). There is no T_1.
- **E8 (proof of Proposition 5.6.2, p. 52).** "R_1^perf = A" should be R_1^perf = R. A is the complex of sheaves.
- **E9 (proof of Proposition 5.2.4, p. 51).** The closure of S_ν is written "∪_{ν'≤ν} S_ν" instead of ∪ S_{ν'}. Also, "χ_c(U, S_V)" names an undefined U where X_ν is meant.
- **E10 (proof of Proposition 6.3.3, p. 59).** "rank V_μ[λ']" should be rank V_μ[λ]. The preceding line has already converted rank V_μ^∨[λ'] to rank V_μ[λ].
- **E11 (proof of Theorem 6.6.1, p. 69).** "[FS21, Theorem 1.9.6.viii–ix]" should be Theorem I.9.6. The proof cites Theorem I.9.6 correctly three lines earlier.
- **E12 (proof of Lemma B.1.1, pp. 72–73).** The induction is on k, with Λ = R/𝔪^k. "𝔪^{m−1}Λ" and "Λ/𝔪^{m−1}" use an undefined m.
- **E13 (Section 2.4, p. 11).** "G(Q_p) and G_b(Q_p)" should be G(F) and G_b(F).
- **E14 (Definition 4.3.4, p. 30).** The target of the tensor product of 1-morphisms is "(c_2 ×_S d_2)^!(A_2 ⊠ A'_2)". It should be (A'_1 ⊠_S A'_2).

**An error in a proof (E3, reach "nothing"):**

- **Where.** In the proof of Lemma 3.1.1, H^1(F, N(T, G)) is said to "classify conjugacy classes of F-rational tori", with T' ↦ [x^{-1}x^σ] a bijection.
- **What is true.** The image is exactly the kernel of H^1(F, N(T, G)) → H^1(F, G). When H^1(F, G) ≠ 1, for example G = PGL_2, the other classes record maximal tori of inner forms.
- **Why the lemma stands.** The proof only needs the map into this finite set to be well defined, injective and locally constant.

**Checked and found correct:**

- **Example 3.2.10:** d = 1, the two weights μ and wμ over inv[b](g, g'), and dim Hom = 2.
- **The sign identity (3.3.3):** it follows from Lemma A.2.1 once μ_2 − μ_1 = κ(b) = μ in X^*(Z(Ĝ_sc)^Γ).
- **The telescoping computation in Proposition 5.2.4.**

## What the atlas and the libraries already have

**Libraries.**

- Mathlib has 1-categorical duality: `CategoryTheory.ExactPairing` and `CategoryTheory.HasRightDual` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77`, `:236`). It has no traces in symmetric monoidal 2-categories. This is recorded on item 049.
- Neither library has diamonds, v-stacks, étale six functors, Bun_G, affine Grassmannians, geometric Satake, smooth representations of p-adic groups, characters or local Langlands. No item is a library item.

**The atlas plans the foundations (22 items):**

- **Local shtuka moduli and cohomology:**
  - B(G, μ) and inner forms: BunGAndNewtonStrata BG0–BG1 (006);
  - Bun_G strata and the Kottwitz invariant of modifications: BG2:uniformization and BG3 (092, 096);
  - shtuka spaces: HeckeStacksAndLocalShtukas HS2 (015);
  - their cohomology and its expression as a Hecke operator: HS3 (016, 109);
  - Hecke stacks and Hecke operators: HS0 and HS1 (093, 108).
- **Sheaves on Bun_G:** ULA objects and sheaves on basic strata: VStackSheavesAndLisseCategories VS4–VS5 (106).
- **Six operations on diamonds:** DiamondSixOperations S0–S3 and S4 (037, 038).
- **Scheme-level inputs:** the scheme Lefschetz–Verdier formalism at EtaleDualityAndPerverseSheaves EDC.8 (070); the perfect-scheme comparison at AdicCoefficientsAndComparisons L1–L2 (072).
- **Geometric Satake:** the B_dR^+ and Witt vector Grassmannians, Beilinson–Drinfeld degeneration, semi-infinite orbits and Satake at GeometricSatakeAndFusion GS0–GS4 (077, 078, 083, 088, 089).
- **Groups and endoscopy:** strongly regular and elliptic elements, transfer of elliptic tori and endoscopic data at EndoscopicTransferAndUnitaryTraceComparison ET.0 (019, 099, 116).
- **Parameters:** the GL_n comparison of Fargues–Scholze parameters at ExcursionOperatorsAndSpectralAction ES7:GLn-comparison (005).

**The atlas has none of the paper's own mathematics:**

- the Kottwitz conjecture, δ_{π,ρ}, or the Mantovan map;
- rigid inner forms and the refined LLC;
- the relation space and the Hecke transfer;
- decent v-stacks, cohomological correspondences, categorical traces and characteristic classes;
- local terms on Grassmannians;
- fixed points on Hecke stacks and the distribution transfer;
- Harish-Chandra characters, the trace Paley–Wiener theorem, and Dat's ℓ-adic tempered theory.

## Routes

1. **Part II of HeckeStacksAndLocalShtukas: "the Lefschetz–Verdier trace formula and the Kottwitz conjecture"** (50 items).
   - **What it covers.** HS stops at constructing shtuka cohomology as a functor. This continuation computes it, and exports Theorems 1.0.2, 1.0.3, 3.2.9, 5.1.3, 6.2.3, 6.5.2 and 6.5.4.
   - **Layers:** the objects of the conjecture; Hecke transfer; local terms on Grassmannians; Hecke stacks and fixed points; distribution transfer; trace distributions; and the main theorems.
   - **Imports** are by id, including the other two Part IIs.
   - **Tests:** the Lubin–Tate case, the GL_2 Jacquet–Langlands example, the GSp(4) and U(1, n−1) cases, and a non-minuscule μ.
2. **Part II of VStackSheavesAndLisseCategories: "decent v-stacks, cohomological correspondences and the Lefschetz–Verdier trace formula"** (36 items).
   - **Why a Part II.** VS0 builds Artin v-stacks and partial compact supports, and says its π-sharp is not an ordinary Rf_!. Everything in Section 4, Section 5.3 and Appendix B is general sheaf theory on v-stacks, and other consumers (Hecke and excursion operators) need it too.
   - **What the brief asks.** It requires the "straightforward but tedious" monoidality of ⊠ over a base (4.5.7–4.5.8) to be proved. It also flags the overlap with the Abe extraction's proposed EDC Part II on relative categorical traces, so that the generic 2-categorical trace interface has one home.
3. **Part II of SmoothRepresentationsOfLocalGroups: "characters, trace Paley–Wiener and ℓ-adic lattices"** (12 items).
   - **What it covers:** Harish-Chandra characters; the locally profinite space of regular semisimple classes; Haar measures on related tori; the stable Weyl integration formula; Bernstein–Deligne–Kazhdan; non-elliptic representations (Theorem C.1.1); and Dat's ν-tempered lattices (Appendix C.2, Lemma 6.5.5).
   - **Why a Part II.** SR.0–SR.3 own smooth representations but plan none of these.
4. **Source routes:**
   - **EndoscopicTransferAndUnitaryTraceComparison ET.0** (021–023, 119): Steinberg's lemma, the isocrystal invariant inv[b](g, g') and its properties, and the dual-group formula for the Kottwitz sign. ET.0 owns stable conjugacy and the parametrization of rational classes in a stable class.
   - **EtaleDualityAndPerverseSheaves EDC.8** (090–091): Varshavsky's theorem that true and naive local terms agree for finite-order automorphisms, and its perfect-scheme form. EDC.8 owns cohomological correspondences and local terms on schemes.

## Judgement calls for the reviewer

- **Rigid inner forms and the refined LLC (items 007–014)** stay in route 1. The Kaletha extraction proposes *EndoscopicTransferRigidInnerFormsPartII*, but it is still a proposal, so it is cited in the brief and not treated as planned. If it is accepted, these items should move there.
- **The generic 2-categorical trace (item 049)** is routed to the VStack Part II. The Abe extraction proposes the same interface for schemes in *EtaleDualityAndPerverseSheavesPartIIRelativeTraces*. The item note and the brief say to share one home.
- **Local terms on Grassmannians (items 079–087)** go to route 1, not to a GeometricSatakeAndFusion Part II. Their only consumer is the Hecke-stack computation, and they are proved from GS0–GS4 as imported black boxes.
- **Local shtuka spaces as fibres of the Hecke stack (item 095) and decency of Bun_G (094)** go to route 1. They could arguably be sources for HS2 and BG3.
- **Conjecture G is a hypothesis.** Item 009 records the refined LLC as a definition of the hypothesis, with Kaletha's four properties. Theorems 1.0.2 and 3.2.9 are stated conditionally, as in the paper.
- **Theorem 1.0.3** depends on ES7's GL_n comparison (item 005, planned) and on Jacquet–Langlands at ET.6. It is recorded as missing in route 1.

## Prerequisites not yet covered by the atlas

These are listed in the result with links:

- **Sheaf theory:**
  - Gulotta–Hansen–Weinstein (arXiv:2202.12467);
  - Lu–Zheng (Forum Math. Sigma 2022);
  - Varshavsky (arXiv:2003.06815).
- **Kaletha:**
  - LLC for non-quasi-split groups (2016);
  - Rigid inner forms (Ann. 2016) and Rigid inner forms vs isocrystals (JEMS 2018);
  - Supercuspidal L-packets via isocrystals (AJM 2014);
  - Genericity and contragredience (ANT 2013);
  - Regular supercuspidal representations (JAMS 2019), Supercuspidal L-packets, and Fintzen–Kaletha–Spice.
- **Kottwitz:** B(G) for all local and global fields (arXiv:1401.5728); Sign changes (TAMS 1983).
- **Harmonic analysis:**
  - Bernstein–Deligne–Kazhdan and Kazhdan (J. Analyse Math. 1986);
  - Dat (Duke 2005; Invent. 2000).
- **Geometry and prior cases:**
  - Yu, integral geometric Satake (arXiv:1903.11132);
  - Mieda (Crelle 2014; Lubin–Tate and GSp(4));
  - Rapoport–Viehmann (arXiv:1401.2849).
