# PAPER-ZAVYALOV-25: Mod-p Poincaré Duality in p-adic analytic geometry

Bogdan Zavyalov, *Mod-p Poincaré Duality in p-adic analytic geometry*, [Annals of Mathematics (2) 201 (2025), no. 3, 647–773](https://doi.org/10.4007/annals.2025.201.3.2); arXiv [2111.01830](https://arxiv.org/abs/2111.01830).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1063). Status: **complete**. Every missing item is routed once.

Reviewed by Claude Code, session `cc-d67081`, 23 September 2026 (issue #1064, job `REV-PAPER-ZAVYALOV-25`): **accepted**, all eight routes accepted, all twelve recorded mistakes confirmed at their locators. No correction was needed — no item, status, route or locator changed. See [REV-PAPER-ZAVYALOV-25.md](../reviews/REV-PAPER-ZAVYALOV-25.md).

The machine-readable extraction is [PAPER-ZAVYALOV-25.result.json](PAPER-ZAVYALOV-25.result.json). It has:
- 155 items: 14 planned, 141 missing;
- 8 routes: one new Part II and seven sources of existing layers;
- 10 prerequisite entries;
- 12 recorded misprints.

## Sources read

- **arXiv v3** (21 February 2024, "Major revision"), read in full: 101 pages. Item locators are v3's pages.
  - v3 postdates the journal's revision date (31 January 2024). Remark 3.5.6 records the referee's request to restrict Faltings' trace to nice models, so v3 is the refereed text.
- **The published version** (Annals, pp. 647–773, online 29 April 2025) is subscription-only and was not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** all twelve misprints were checked on v3's page images.

## What the paper proves

**Main theorem (Theorem 1.1.4 = 5.4.4).**
- Let X be smooth and proper of pure dimension d over a non-archimedean field K of mixed characteristic (0, p).
- There is a Galois-equivariant trace t_X : H^{2d}(X_K̂̄, F_p(d)) → F_p for which the cup-product pairing H^i × H^{2d−i}(d) → F_p is perfect in every degree.
- This answers Scholze's question in his rigid p-adic Hodge theory paper. Gabber announced a proof in 2015, but none appeared.
- It completes Huber's and Berkovich's ℓ-adic theorem (Theorem 1.1.3), which needs ℓ invertible in O_K. For ℓ = char K there is no duality (Remark 1.1.5).

**Other coefficients.**
- F_p-local systems (Theorem 5.4.5).
- Z/p^n, Z_p and Q_p (Theorems 5.5.2, 5.5.4 and 5.5.6).
- t_X is an isomorphism when X is geometrically connected (Theorem 5.4.2).

**How the proof goes.**
- **Reduction to almost duality.** By Scholze's primitive comparison, it suffices to prove almost duality for RΓ(X, O^+/p) over O_C/p (Theorems 5.1.1 and 5.2.5).
- **Choice of model.** Choose a formal model 𝔛 with reduced special fibre (Reduced Fibre Theorem). Then RΓ(X, O^+/p) = RΓ(𝔛_0, Rν_∗(O^+/p)), and almost Grothendieck duality on the special fibre 𝔛_0 reduces the problem to a local duality.
- **Faltings' trace** (§3) is a map Rν_∗(O^{+,a}/p) → ω^{•,a}_{𝔛_0}(−d)[−2d]. In top degree it is an honest map R^dν_∗Ô^+ → ω_𝔛(−d), glued from two pieces:
  - on the smooth locus, a Bhatt–Morrow–Scholze map, extended here to all admissible models;
  - on the generic fibre, Scholze's isomorphism Ω^d(−d) ≅ R^dµ_∗Ô.
- The pieces glue by a Hartogs property of the dualizing sheaf (Theorem 2.5.5), and they agree by Theorem 3.4.12, using Fontaine's theorem on dlog.
- **Local duality (Theorem 4.4.24).**
  - On polystable models it is proved by an explicit Z_p(1)^d perfectoid cover, a character decomposition and duality for continuous cohomology of Z_p^d (§§4.2–4.3).
  - It is then descended through rig-isomorphisms, finite group quotients and Zariski covers, using the author's local altered uniformization theorem (§4.4).
- **The étale trace.** t_X is Berkovich's trace, translated into adic language through Huber's comparison (§5.3, Appendix A).

**Foundations built on the way.**
- Grothendieck duality over universally coherent bases, such as rank-one valuation rings (§§2.1–2.3).
- Dualizing complexes of admissible formal schemes and their reflexivity (§§2.4–2.5).
- The coherent trace for proper smooth rigid spaces (§§2.6–2.7).
- Generic fibres of almost coherent sheaves (Appendix C).
- Pro-étale traces (Appendix D).

## What the atlas already has

**Planned (14 items).**
- Almost mathematics: PerfectoidSpaces P0.
- Rigid spaces as adic spaces: AdicEtaleGeometry A2, AdicSpacesPartII R2.
- The pro-étale site and Ô^+: A1 and AInfCohomology AI.3.
- Integral perfectoid rings: PerfectoidQuotients Q0.
- AInfCohomology:
  - the Breuil–Kisin twist O_C{1} (AI.0);
  - Lη (AI.1);
  - the toric perfectoid cover and its continuous cohomology (AI.3, with ArithmeticGaloisDuality D7);
  - BMS Theorem 8.3 (AI.4).
- Finite traces:
  - the finite étale trace of Definition 2.7.7 (AdicSpacesPartII R3);
  - the étale trace of Definition D.1 (ClassicalAdicEtaleCohomology H0, H3).
- Lütkebohmert–Temkin (Lemma B.1): AdicSpacesPartII F0.
- Partial properness and tautness: H3.
- SGA 4 Poincaré duality (Theorem 1.1.2): EtaleDualityAndPerverseSheaves EDC.2:pairings.

**Library.** Nothing: Mathlib and Tau Ceti have none of these objects.

**What nothing plans.**
- Duality for p-torsion étale cohomology of rigid spaces.
- Faltings' trace.
- Almost duality on formal models.
- Grothendieck duality beyond noetherian bases.

H3 plans Huber's trace and duality only for curves and only prime to p. No pending proposal goes in this direction.

## Routes

1. **New Part II `ClassicalAdicEtaleCohomologyPartIIModPPoincareDuality`** (96 missing).
   - Title: "The classical analytic cohomology inputs to diamonds, Part II: mod-p Poincaré duality for smooth proper rigid spaces". Parent: ClassicalAdicEtaleCohomology. Area: `padic`.
   - **Contents,** as six layers after the imported almost-coherent foundations:
     - duality on formal schemes (§§2.4–2.7, Appendix C);
     - Faltings' trace (§3, Appendix D);
     - polystable models (§4.2);
     - local duality for polystable models (§4.3);
     - descent (§4.4);
     - global and étale duality (§5).
   - **Why a Part II:** it continues H3 (traces and duality in Huber's theory) to p-torsion coefficients and all dimensions. The p-adic Hodge theory it uses is imported, not re-planned, and none of its suppliers depends on it.
2. **Source of AnalyticStacks [AS.1]** (19 missing). Grothendieck duality for universally coherent schemes:
   - f^!, base change, and the smooth and étale cases;
   - the relative dualizing complex and its amplitude (§2.2);
   - reflexivity of ω over a rank-one valuation ring (§2.3).

   AS.1 owns coherent duality. PAPER-BHATT-ETAL-23 and PAPER-HACON-WITASZEK-23 route their duality adapters there too.
3. **Source of AdicCoefficientsAndComparisons [L2]** (3 missing). The category of finitely presented compactifications and its cofilteredness (§2.1), next to L2's nonnoetherian Nagata theorem.
4. **Source of AdicSpacesPartII [R2, F0]** (7 missing).
   - Dimension of models.
   - Elkik's algebraization with pure relative dimension.
   - A = A°_K for reduced special fibre.
   - The finite Reduced Fibre Theorem and its universal property.
   - Good dense opens.
   - The Bosch–Lütkebohmert–Raynaud localization of reduced-fibre models (Theorem 2.7.1).
5. **Source of ClassicalAdicEtaleCohomology [H3]** (8 missing).
   - Berkovich's trace for smooth partially proper morphisms, for all torsion coefficients (Theorem 5.3.3, Lemma 5.3.2).
   - The étale Huber–Berkovich comparison (strict étale site, Theorem A.15, overconvergent sheaves, Lemma A.19).
   - Huber's and Berkovich's ℓ-adic duality in every dimension (Theorem 1.1.3).

   PAPER-GUO-REINECKE-24 routed the same trace here.
6. **Source of TropicalAndBerkovichArithmetic [TB.0]** (3 missing).
   - Huber's global equivalence between Berkovich spaces and taut adic spaces.
   - How the morphism classes correspond (Lemma A.8, Corollary A.11).
7. **Source of PadicHodgeTheory [P8]** (3 missing). Theorems of Scholze's rigid p-adic Hodge theory paper:
   - the primitive comparison theorem and finiteness;
   - pro-étale versus étale cohomology;
   - Ω^n(−n) ≅ R^nµ_∗Ô with coherence.

   This follows PAPER-BHATT-MORROW-SCHOLZE-18, which routes Scholze's finiteness theorem to P8.
8. **Source of AInfCohomology [AI.0]** (2 missing).
   - Fontaine's theorem that dlog identifies O_C(1) with (ζ_p − 1)O_C{1}.
   - Bhatt's computation of L̂_{O_C/Z_p} and the vanishing of cotangent complexes of perfectoids.

## Source issues (`sourceIssues` E1–E12, all misprints)

All twelve are in arXiv v3, and none affects a stated result.

- **E1** (Theorem 2.2.3, p. 11): "FPS_R" should be FPS_S; no R is introduced.
- **E2** (Lemma 2.2.7(2), p. 13): "f^! sends D^b_coh(X) to D^b_coh(Y)" has the categories reversed, since f : X → Y. Part (1) of the same lemma has the right direction.
- **E3** (proof of Lemma 2.7.3, p. 26): two different steps are both called "the third isomorphism". The last one is the fourth.
- **E4** (proof of Lemma 2.7.9, p. 29): "𝔘 = Spf B′° and 𝔣^{−1}(𝔘) = Spf A′°" swaps A′ and B′. The target, not X, is replaced by 𝔘_K.
- **E5** (proof of Lemma 3.4.8, p. 40, twice): "α(δ(X))" should be α(δ(T)); δ is the Kummer boundary of the unit T.
- **E6** (pp. 46–48): Lemma 2.3.5, the scheme statement, is cited three times. It should be Corollary 2.4.5 for flatness of ω_𝔛 of a formal scheme, and Lemma 2.2.13 for the degree bound on p. 47.
- **E7** (proof of Lemma 4.2.23, p. 55): "γ_i acts … by γ_j(χ̄) = ζ^{a_j}_{p^{m_j}}" mixes the indices i and j.
- **E8** (proof of Theorem 4.3.16, Step 2, p. 65): "≃ ω^a_{𝔛_0}(−d)[−d]" should be ω^a_𝔛(−d)[−d]. Theorem 4.2.30 gives the integral sheaf on 𝔛.
- **E9** (Construction 4.4.17, p. 70; Definition D.1, p. 95; Remark D.10, p. 97): O^+/p^n is paired with O^+/p within single maps. The mod-p trace is meant throughout.
- **E10** (Theorem 4.4.24, p. 74): the statement omits the reduced special fibre ("nice").
  - Faltings' pairing is defined only in that case.
  - Theorem 4.1.2, which announces the result, assumes it.
- **E11** (proof of Theorem 4.4.24, Step 3, p. 74): "𝔛′_i → 𝔛′" should be 𝔛′_i → 𝔛_i.
- **E12** (Definition 5.2.1, p. 75): the target "O^a_C/p(−d)[2d]" should be [−2d], as in the composition displayed below it.

## Prerequisites not yet covered

Ten entries:
- Zavyalov, the almost coherent memoir (Mem. EMS 2025), local altered uniformization (Israel J. Math. 2024) and quotients by finite groups (ANT 2024);
- Scholze, rigid p-adic Hodge theory (Forum Math. Pi 2013, with corrigendum);
- Berkovich (Publ. IHÉS 1993);
- Bosch–Lütkebohmert–Raynaud IV (Invent. 1995);
- Temkin (Math. Ann. 2000);
- Česnavičius–Koshikawa (Compositio 2019);
- Elkik (Ann. ENS 1973);
- Conrad (Ann. Inst. Fourier 1999).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ZAVYALOV-25.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`, except `AnalyticStacks:AS.1`. That id is a stage of the pending `research/blueprint/roadmaps/AnalyticStacks.json`, which the checker also reads. The Part II parent is an atlas roadmap.
