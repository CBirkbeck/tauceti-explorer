# PAPER-DOSPINESCU-LEBRAS-17: Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique

Gabriel Dospinescu and Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, [Annals of Mathematics (2) 186 (2017), no. 2, 321–411](https://doi.org/10.4007/annals.2017.186.2.1); arXiv [1509.00606](https://arxiv.org/abs/1509.00606).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1159). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-DOSPINESCU-LEBRAS-17.result.json](PAPER-DOSPINESCU-LEBRAS-17.result.json). It has:
- 92 items: 17 planned, 75 missing;
- 9 routes: four coalescences with pending proposals and five sources of existing layers;
- 13 prerequisite entries;
- 5 recorded misprints.

## Independent review (REV-PAPER-DOSPINESCU-LEBRAS-17)

The independent review (Claude Code, session cc-2aeb03, 23–24 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-DOSPINESCU-LEBRAS-17.md`; the counts in the sections below it are the earlier
ones and are superseded by these.

- **Items: 180** (21 planned, 159 missing), each missing item routed once.
  - 36 bundled items split, one numbered result per item; 88 items added for the split-off results and for definitions,
    constructions and cited inputs the proofs use.
  - 122 fields corrected: 52 statements, 36 locators, 30 names, 4 kinds. None removed.
- **Routes.** All nine stand; the briefs of routes 1–3 and the items of routes 5 and 7 carry the confirmed corrections.
- **Prerequisites.** The 13 entries checked, and 7 cited works the proofs use as black boxes added, among them Colmez's
  Astérisque 330 memoir.
- **Mistakes: 42 confirmed** (28 misprints, 9 gaps, 5 errors); 4 reach a stated result and 8 a proof.
  - **E1–E5** are confirmed; E2 is revised.
  - **E6–E42** are new, each checked independently. The main ones:
    - **E9:** Théorème 1.10 is false as printed (±1 on the two copies of Ω in Σ_0); it holds with conclusion
      f ∈ H^0_dR(Σ_n)·O(Ω), for components with trivial central character (E40).
    - **E19:** Proposition 7.7 b) is false for k ≥ 2; only k = 1 is used.
    - **E7, E12, E16, E22, E24, E27, E38, E41:** gaps in the uniqueness of Théorème 1.7, Lemme 3.3, Théorèmes 5.1, 8.3 and
      9.7, Propositions 8.4 a) and 11.10 and Remarque 11.13, all fillable.
  - Théorèmes 1.2, 1.4 and 1.7 stand.

## Sources read

- **arXiv v2** (28 April 2017, "Final version, to appear in the Annals of Math"), read in full: 76 pages. Item locators are v2's pages.
- **The published version** was used for the misprint checks. It is the Annals PDF (91 pages, pp. 321–411), freely downloadable from the journal site.
  - Every recorded misprint is also in the published text; the Annals page is given alongside v2's.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** all five misprints were checked on the page images of both versions.

## What the paper proves

**Set-up.**
- π is a supercuspidal representation of G = GL_2(Q_p) with trivial central character, and ρ = JL(π) its Jacquet–Langlands transfer to D^*.
- Σ_n is the n-th covering of the Drinfeld half-plane Ω over Q_p. Its Galois group over Σ_0 is O_D^*/(1 + p^nO_D), and it carries commuting G- and D^*-actions.
- V(π) is the set of unitary Banach representations Π with Π^lisse ≅ π. Via Colmez–Fontaine and Colmez–Dospinescu–Paškūnas it is parametrized by the lines ℒ ⊂ M_dR(π): the Hodge filtrations of the corresponding Galois representations.

**Main results.**
- **Theorem 1.2:** (O(Σ_n)^ρ)^* ≅ Π^an/Π^lisse for every Π ∈ V(π), unique up to scalar.
  - The right side is independent of Π (Colmez), and is written Π(π, 0).
- **Theorem 1.4: the Breuil–Strauch conjecture.** It concerns the de Rham complex of the tower:
  - H^1_dR(Σ_n)^ρ ≅ M_dR(π)^* ⊗ π^*;
  - the preimage of ℒ^⊥ ⊗ π^* in Ω^1(Σ_n)^ρ is the dual of Π_ℒ^an.
- **So the Hodge filtration can be read off the de Rham complex.** Π^an itself comes from geometry together with the choice of ℒ.

**How the proof goes.**
- **Global step.** It produces a nonzero Φ : Π(π, 0)^* → O(Σ_n)^ρ (Theorem 5.1), using:
  - Čerednik–Drinfeld uniformization;
  - a globalization of π with residually irreducible Galois representation;
  - Emerton's local–global compatibility, written out in an appendix for a definite quaternion algebra split at p.
- **Local step: an operator ∂ on Π(π, 0)^*.** Colmez's (φ, Γ)-module theory, Berger's differential equation N_rig and Colmez's Kirillov model give ∂ with a^+ − 1 = u^+∂. On O(Σ_n) the same relation characterises multiplication by z.
- **Local step: an O(Ω)-module structure.** With Morita duality, ∂ becomes an O(Ω)-module structure on Π(π, 0)^* in which z acts as ∂ (Theorem 1.7).
- **Surjectivity of Φ (Theorem 10.1)** uses:
  - Kohlhaase's equivalence between G-equivariant bundles on Ω and D^*-equivariant bundles on P^1;
  - a functional-analysis lemma on Stein spaces (Proposition 10.11).
- **Injectivity and Theorem 1.4** use:
  - Π(π, 2), the analogue of Ω^1(Σ_n);
  - Π(π, 2)^{u^+=0} ≅ π ⊗ M_dR(π) (Theorem 11.7).

**Corollaries.**
- Theorem 1.9: an Iwasawa-cohomology description of the (p, 0; 0, 1)-invariants.
- Theorem 1.10: an infinitely primitivable function on Σ_n comes from Ω.
- Proposition 12.2: D_dR(V) as a Hom in the derived category of coadmissible D(G)-modules.
- Remark 11.13: the conjecture as Breuil and Strauch formulated it, for the first cover.

**A conjecture.** Conjecture 12.4 identifies Colmez's sheaf U ↦ tN_rig(π) ⊠ U with the sheaf of boundary functions of Σ_n.

## What the atlas already has

**Planned (17 items).**
- p-adic local Langlands (PadicLocalLanglandsForGL2Qp):
  - the Banach and locally analytic categories, and the mod p correspondence (R30.2);
  - Colmez's D_rig(V) ⊠ P^1 (Theorem 7.1), and Colmez–Dospinescu's universal completions (R30.3);
  - Colmez–Dospinescu–Paškūnas on locally algebraic vectors (R30.4);
  - the family Π^univ (R30.5).
- p-adic Hodge theory (PadicHodgeTheory):
  - Colmez–Fontaine (R06.2);
  - Fontaine's Weil–Deligne functor and Berger's N_rig (R06.3).
- (φ, Γ)-modules: D_rig(V) (PhiGammaModulesAndIwasawaCohomology PG.2) and ψ (PG.4).
- Classical automorphic inputs (GL2AutomorphicRepresentationsAndTransfer):
  - classical local Langlands (R16.3);
  - local and global Jacquet–Langlands (R17.1, R17.3).
- Geometry: Drinfeld's theorem and Čerednik–Drinfeld uniformization (HilbertModularVarietiesAndShimuraCurves R18.5).
- Galois representations: Carayol's representations over Hecke algebras (AutomorphicGaloisRepresentations R19.6).

**Library.** Nothing: Mathlib and Tau Ceti have none of these objects.

**Pending proposals that this paper feeds.**
- `PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`, proposed by Colmez–Dospinescu–Nizioł (JAMS 2020) and extended by their 2023 paper. It plans the étale realisation of the correspondence in the Drinfeld tower. Its first paper quotes this one as its Proposition 2.9, the Breuil–Strauch conjecture.
- `ProetaleCohomologyOfPAdicCurvesAndTowers`, from the same authors. It plans:
  - the tower and the analysis of Stein curves;
  - the Steinberg descriptions of O(Ω) and Ω^1(Ω);
  - the global method by p-adic uniformisation.
- `LocallyAnalyticRepresentationsOfLocalGroups`, from Ding and extended by Colmez–Dospinescu–Nizioł. It plans Schneider–Teitelbaum theory.
- `TriangulineVarietyAndItsLocalModel`, from Breuil–Hellmann–Schraen, Ding and Newton–Thorne. It plans trianguline (φ, Γ)-modules.

## Routes

1. **Coalesced with `PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`** (42 missing). Its id, title, parent, area and brief are kept.
   - **Contents:** the main line of the paper:
     - V(π) and its parametrization;
     - the non-trianguline analysis (Lemma 6.3, Colmez's Proposition 6.4);
     - Dospinescu's infinitesimal action and Colmez's Kirillov model (§7);
     - Π(π, 0) (§8);
     - ∂ and the O(Ω)-module structure (§9);
     - Φ with its surjectivity and injectivity;
     - Π(π, 2) (§11);
     - Theorems 1.2, 1.4, 1.9 and 1.10, Remarks 11.12–11.13 and Proposition 12.2.
   - **Why coalesce:** the de Rham realisation is the first layer of that Part II, and its étale layer depends on it.
   - **Expectations, not targets:**
     - Conjecture 12.4;
     - Remark 1.11's announced result;
     - the GL_2(F) and GL_n(F) questions.
2. **Coalesced with `ProetaleCohomologyOfPAdicCurvesAndTowers`** (17 missing). Its id, title, area and brief are kept.
   - **Contents:** the analytic and de Rham geometry of the tower over Q_p:
     - the tower Σ_n;
     - Stein spaces and duality;
     - the local analyticity of O^{(k)}(Σ_n)^* and the smoothness of H^1_dR,c;
     - Theorem 4.1 (multiplicity 2 via Čerednik–Drinfeld and Hochschild–Serre);
     - the uniformisation reformulation, Theorem 5.7;
     - Morita duality;
     - Kohlhaase's bundles and the irreducibility of O(Σ_n)^ρ;
     - Proposition 10.11.
3. **Coalesced with `LocallyAnalyticRepresentationsOfLocalGroups`** (4 missing). Its id, title, area and brief are kept.
   - Schneider–Teitelbaum's Fréchet–Stein and coadmissible theory with the density of Π^an;
   - Frommer's description of D_h(G);
   - Lemma 5.9 (continuity of matrix-coefficient maps);
   - Lemma 5.10 (weak and strong convergence over a spherically complete field).
4. **Coalesced with `TriangulineVarietyAndItsLocalModel`** (1 missing): Colmez's two-dimensional trianguline representations and his eigenvector criterion. This is the roadmap's base case.
5. **Source of CompletedCohomologyAndLocalGlobalCompatibility [R31.1, R31.2, R31.4]** (7 missing).
   - **Contents:** the quaternionic version of Emerton's argument:
     - p-adic automorphic forms on B̄ and their classical specialisations;
     - the Hecke algebra and A;
     - Theorem 5.4 with the appendix's lemmas;
     - Theorem 5.5 with Lemma 5.6.
   - It is the zero-dimensional case of those layers.
6. **Source of PadicHodgeTheory [R06.3]** (1 missing, 1 planned). The Fontaine–Berger descriptions of D^+_dif, N^+_dif, N_rig and D_rig, and Berger's N_rig itself: the representation-to-differential-module bridge that R06.3 plans.
7. **Source of PhiGammaModulesAndIwasawaCohomology [PG.5]** (1 missing). Colmez's results:
   - D(Γ) ⊗ D^{ψ=1} ≅ D_rig^{ψ=1};
   - the Bloch–Kato-exponential description of (1 − φ)(tN_rig)^{ψ=1}.
8. **Source of PadicDifferentialEquationsAndRigidCohomology [RD.1]** (1 missing): Kedlaya's duality N/∂N ⊗ Ň^{∂=0} → L.
9. **Source of GL2AutomorphicRepresentationsAndTransfer [R16.2]** (1 missing): Henniart's unicity of types for GL_2.

## Source issues (`sourceIssues` E1–E5, all misprints)

All five are in both arXiv v2 and the published version, and none affects a stated result.

- **E1** (§1.2, pp. 9–10; Annals pp. 331–332): in the overview, Φ is written with target Ω^1(Σ_n) and quotient Ω^1(Σ_n)/d(O(Σ_n)^ρ). It should be Ω^1(Σ_n)^ρ, as §11.3 writes it.
- **E2** (proof of Lemma 5.6, p. 27; Annals p. 351): the Hecke character is χ, but the condition is printed "η̄_p = ω_2^{r+1}". It should be a condition on χ at p; η is undefined.
- **E3** (proof of Lemma 11.4, p. 59; Annals p. 391): "Ψ_V(v_1) = α_dif^{−1}(i_{V,α}(v))" should read ι_{V,α}, the embedding defined on the previous page. No i_{V,α} is defined.
- **E4** (proof of Proposition 11.6, p. 61; Annals p. 392): "Ainsi, F est équivariante" should read d; no F occurs in the proof.
- **E5** (proof of Theorem 11.7, p. 62; Annals p. 393): "Π(π, 0) ≃ Π(V_1)^an/Π(V_2)^lisse" should be Π(V_1)^an/Π(V_1)^lisse.

## Prerequisites not yet covered

Thirteen entries:
- Colmez (JEMS 2019, *changement de poids*);
- Colmez–Dospinescu;
- Colmez–Dospinescu–Paškūnas;
- Dospinescu (Math. Ann. 2012; Compositio 2015);
- Kohlhaase;
- Schneider–Teitelbaum (Invent. 2003);
- Berger (Invent. 2002);
- Schraen;
- Teitelbaum;
- Grosse-Klönne (JAG 2005);
- Lue Pan;
- Emerton's local–global compatibility preprint.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DOSPINESCU-LEBRAS-17.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`, and the Part II parent is an atlas roadmap.
