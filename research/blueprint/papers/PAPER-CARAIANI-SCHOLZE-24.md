# PAPER-CARAIANI-SCHOLZE-24: On the generic part of the cohomology of non-compact unitary Shimura varieties

Ana Caraiani and Peter Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*, [Annals of Mathematics (2) 199 (2024), no. 2, 483–590](https://doi.org/10.4007/annals.2024.199.2.1); arXiv [1909.01898](https://arxiv.org/abs/1909.01898).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1075). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-CARAIANI-SCHOLZE-24.result.json](PAPER-CARAIANI-SCHOLZE-24.result.json). It has:
- 70 items: 68 planned, 2 missing;
- 1 route, a source of an existing layer;
- 16 prerequisite entries;
- 12 recorded misprints.

## Sources read

- **arXiv v2** (22 November 2023, "90 pages, accepted version"), read in full. Item locators are v2 pages.
- **The published version** was not read. The Annals text (online 5 March 2024) is inside the journal's five-year moving wall. v2 postdates the revision of 8 March 2023, so it stands in for the published text.
- **arXiv v1** (4 September 2019) was not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Page images:** all twelve misprints were checked on the page images.

## What the paper proves

**Main theorem (Theorem 1.1).**
- The setting is X_K, the locally symmetric space of the quasi-split unitary group U(n, n) over a CM field F with F^+ ≠ Q, of complex dimension d.
- Take m a system of Hecke eigenvalues with ρ_m of length at most 2.
- Suppose some prime p splits completely in F, and ρ_m is unramified above p with no Frobenius eigenvalue ratio equal to p.
- Then:
  - H^i(X_K, F_ℓ)_m ≠ 0 only for i ≥ d;
  - H^i_c(X_K, F_ℓ)_m ≠ 0 only for i ≤ d.
- Remarks 1.5–1.6 give the Z_ℓ version and the boundary exact sequence. When ρ_m is absolutely irreducible, cohomology is concentrated in degree d. This is the vanishing input of the potential automorphy theorems of Allen et al. (Ann. of Math. 2023).

**The strategy: the compact paper's method (Caraiani–Scholze 2017), carried to the compactifications.**
- **§2** sets up:
  - the unitary similitude group and the Hasse principle;
  - the PEL moduli problem;
  - Igusa torsors over seminormal bases and completely slope divisible groups;
  - Serre–Tate for semi-abelian schemes;
  - Lan's compactifications;
  - the perfectoid minimal compactification and π*_HT.

  §2.8 then gives the whole argument in outline.
- **§3** constructs partial toroidal and minimal compactifications of central leaves and perfect Igusa varieties.
  - It uses Lan–Stroh's well-positioned subschemes and describes the boundary charts through Igusa cusp labels.
  - The partial minimal compactifications are affine (Theorem 3.3.2, via Nie and Boxer).
- **§4** identifies Ig^{X,*} and Ig^{X,tor} with the fibres of π*_HT and π^tor_HT, up to canonical compactification (Theorem 4.1.1).
  - It proves semiperversity of the nearby cycles on the good-reduction locus (Theorem 4.6.1).
  - The boundary is killed at ℓ^∞-level.
- **§5** attaches Galois representations to the constituents of Igusa cohomology (Theorem 5.1.2).
  - The tools are Shin's trace formula, base change and the twisted trace formula.
  - F^+ ≠ Q rules out cuspidal subsets (Lemma 5.5.3), so only the main term survives.
  - Genericity then forces the ordinary stratum (Corollary 5.1.3).
- **§6** proves a Pink formula for the boundary strata of Ig^{b,*} (Theorem 6.1.1). A failure of H_{c−∂} → H therefore forces ρ_m to have length at least 3 (Theorem 6.4.1).

## What the atlas already has

The atlas's **IgusaVarietiesAndTorsionConcentration** roadmap is planned from this paper.
- IG.0–IG.7 follow its sections closely and cite its theorem numbers.
- The trace-formula layers come from **EndoscopicTransferAndUnitaryTraceComparison**, which fixes this paper's normalizations.

**Planned (68 items).**
- §1 and the endgame: IG.0 (the datum), IG.7 (Theorem 1.1, Remarks 1.5–1.6).
- §2.1: IG.0 and PELModuli M1–M3.
- §§2.2–2.4: IG.0–IG.1.
- §2.5: ShimuraCompactifications C0, C4, C5.
- §§2.6–2.7:
  - PerfectoidShimuraVarieties S1–S3 and S6;
  - DiamondEtaleCohomology C0;
  - IG.3 for Proposition 2.6.4 and Theorem 2.7.2, with ClassicalAdicEtaleCohomology H1:formal-adic-comparison.
- §2.8: IG.2, IG.4–IG.7; the dual Hecke ideal with ArithmeticGaloisDuality R02.2 and EtaleDualityAndPerverseSheaves EDC.2:pairings.
- §3: IG.2.
- §4:
  - IG.3 (Theorems 4.1.1–4.5.1);
  - DiamondEtaleCohomology C4 (Lemma 4.4.2);
  - IG.4 (§4.6), with LefschetzPencilsAndVanishingCycles LPV.6.
- §5:
  - EndoscopicTransferAndUnitaryTraceComparison ET.1, ET.3–ET.6 and ET.7b;
  - AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2, AG2.5;
  - IG.5.
- §6: IG.6, with IntegralHeckeAndGaloisDeterminants IHG.2 for Newton–Thorne's Hecke algebras.
- The torsion Galois representations of §1 and §6.4: TorsionCohomologyInfrastructure TC.4 and IHG.2.

No source route to IgusaVarietiesAndTorsionConcentration is needed, because the roadmap already takes this paper as its source.

## Routes

1. **Source of BunGAndNewtonStrata [BG2, BG3]** (2 missing).
   - The Newton stratification of the flag variety of this datum (Theorem 2.7.3, recalled from [CS17, §3]): strata of dimension d − ⟨2ρ, ν_b⟩, with closed upper unions.
   - The ordinary stratum is the largest class and equals Fℓ(Q_p) (Wedhorn; Caraiani et al. 2020, Prop. 3.3.8).

   IG.3–IG.7 use "flag Newton strata" without constructing them. PAPER-CARAIANI-SCHOLZE-17 routes the general construction to the same stages.

## Source issues (`sourceIssues` E1–E12, all misprints)

None affects a stated result.

- **E1** (Proposition 2.1.2, p. 12): in the Hasse principle for G, "v runs over all places of F" should be places of Q.
- **E2** (p. 26): the definition of Z ≤ Z′ has its inclusions reversed.
  - Printed: Z_{−2} ⊂ Z′_{−2} and X^∨ ⊂ (X′)^∨, inducing X′ → X. Correct: Z′_{−2} ⊂ Z_{−2} and (X′)^∨ ⊂ X^∨, inducing X → X′.
  - Theorem 2.5.8(2) puts S_Z in the closure of S_{Z′} iff Z ≤ Z′; for n = 1 the cusps lie in the closure of the open stratum.
  - The printed surjection also contradicts the inclusion M_{Z′} ⊂ M_Z stated in the same sentence.
- **E3** (Theorem 2.5.9(4), p. 28): "via the inclusion M_Z ⊆ M_{Z′}" should be M_{Z′} ⊆ M_Z.
- **E4** (§5.1, p. 64): the double coset of T_{i,v} at the prime q runs over w | 𝔭; it should be w | 𝔮.
- **E5** (proof of Lemma 5.4.3, p. 71): norms from "𝔇_{M,l}(Q_p)", with 𝔇_{M,l} := Res_{F_0/Q_p}(…), should be at the bad place v (Q_v, F_{0,w}).
- **E6** (p. 72): "g^♯ = Φ_n⃗ ᵗg^c Φ_n⃗^{−1}" lacks an inverse; it should be Φ_n⃗ ᵗg^{−c} Φ_n⃗^{−1}.
  - As printed, θ would be an anti-automorphism, and its fixed points would not be G_n⃗.
  - The compact paper has the same formula (Ann. of Math. 186, p. 736). The PAPER-CARAIANI-SCHOLZE-17 extraction did not record it.
- **E7** (proof of Lemma 5.6.2, p. 75): "as in Section of [Shi11]" has lost its section number.
- **E8** (proof of Theorem 5.7.1, p. 77): "Theorem 5.5.3 of [CS17]" is arXiv v1 numbering. In the cited Annals version the result is Theorem 5.5.4.
- **E9** (p. 80): "X_P = Z_{b,−2}/Z_{b,−1}" should be Z_{b,−1}/Z_{b,−2}.
- **E10** (p. 81): "P_b(A^p_f) × G(A^p_f)-equivariant" should be P_b(Q_p) × P(A^p_f).
- **E11** (pp. 85, 87): the Levi "Res_{F/Q} GL_r × G_{n−r,Q}" should be G_{2(n−r)}.
- **E12** (p. 87): "Proposition 2.8.4 and Corollary 2.8.2" should be Lemma 2.8.4 and Proposition 2.8.2.

## Prerequisites not yet covered

Sixteen entries:
- Caraiani–Scholze (Ann. of Math. 2017);
- Scholze, "On torsion" (Ann. of Math. 2015) and "Étale cohomology of diamonds" (arXiv);
- Allen et al., potential automorphy over CM fields (Ann. of Math. 2023);
- Lan (Princeton 2013);
- Lan–Stroh (Forum Math. Sigma 2018; Compositio 2018);
- Newton–Thorne (Forum Math. Sigma 2016);
- Pink (Math. Ann. 1992);
- Boxer (thesis, arXiv);
- Nie (Math. Ann. 2015);
- Morel (Ann. of Math. Stud. 173);
- Shin (JIMJ 2010, Ann. of Math. 2011);
- Caraiani et al., level Γ_1(p^∞) (Compositio 2020);
- Koshikawa (arXiv).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-24.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
