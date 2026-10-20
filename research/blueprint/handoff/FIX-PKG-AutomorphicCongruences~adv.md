# FIX-PKG-AutomorphicCongruences~adv

Issue #11458. Agent: Claude (Anthropic), session `claude-vkW0X8`. Date: 2026-10-20.
Branch: `claude-vkW0X8-fix-pkg-automorphic-congruences`.

**Status: complete; review.json set to accepted.** Every finding R1–R4 of
[REV-PKG-AutomorphicCongruences.md](../reviews/REV-PKG-AutomorphicCongruences.md) is resolved in the
package README and Suggested.lean, as recorded below. The file named in the issue,
`reviews/REV-PKG-AutomorphicCongruences~adv.md`, does not exist; the findings are those of the
independent review above, whose four residual defects the previous checkpoint
([FIX-PKG-AutomorphicCongruences~adv1](FIX-PKG-AutomorphicCongruences~adv1.md), #11424) left open.
Following the maintainer's instruction on this issue, every supplier that is already an open
TauCetiRoadmap pull request is now consumed, and every refinement that no supplier plans is a named
target here instead of a request to a nonexistent "Part II".

Two things remain for others, and neither is a defect of this package. The maintainer places the
roadmap in the upstream order (see R1). The original texts of Ikeda 1994, Ichino 2008 and Harris 1984
were out of reach, so a sources follow-up should compare them (see R4).

## Finding dispositions

| Finding | Change |
| --- | --- |
| R1: tier/bundle closure | New **Prerequisite order** paragraph in *Scope and ownership*. Every supplier is one of three kinds: (a) Mathlib, Tau Ceti and TauCetiRoadmap roadmaps (EllipticCurves, NumberFieldArithmetic, ProfiniteCohomology, IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups, PadicMeasuresIwasawaAlgebras); (b) twenty-one roadmaps that are open TauCetiRoadmap PRs, listed with their numbers from `upstream/tauceti_status.json`; (c) three atlas roadmaps not yet upstream: AutomorphicPadicLFunctions (L3h, L4, L4e, L5), KatoEulerSystems (Layers 0–7) and PadicHodgeRegulators (L3–L4). I checked that none of the three cites AutomorphicCongruences, and neither does any of PadicFamilies, SelmerIwasawaCohomology, IHG, MetaplecticAutomorphicForms or AutomorphicSpectralTheory. ModularIwasawaMainConjectures is a consumer only: this README names it only as the importer of L1, L2, L4 and L5b. The earlier claim, in MIMC's review, that AC cites MIMC L0/L1 no longer holds. So AC follows the three (c) roadmaps, and MIMC follows AC or travels with it as a bundle; there is no cycle. **Maintainer:** enter this position in the order. KatoEulerSystems' package is at needs_changes (2026-10-10) and AutomorphicPadicLFunctions' package has no review, so AC cannot go upstream before them. |
| R2: exact external refinements | Every request is now either consumed from an existing owner or owned here. (a) **Polarized lattice theorem** (IHG Part II request): L0.5 and L0.7 now state the SU lattice datum and lattice construction for H = G_{F,Σ} ⊃ G = G_{M,Σ}, with F totally real, M/F CM and middle rank n ≥ 1. The sources are SU §§4.3–4.5 for (ℚ, K) and every n, and Wan 2015 §9.2.1 Prop. 98 for totally real F and n = 2. L5w.8, the IHG.6 contract and the "From Layer L0" contract now apply L0.7. (b) **Yager module** (PadicHodgeRegulators Part II request; PHR's accepted package has no Yager module): new definition `yagerModule` with `yagerModule_free`, `normalBasis_iff_trace_unit` and `yagerTwist`, and three Checks, in L2.11 (FW §4.2.2, (4.2.2), pp. 43–44, after Loeffler–Zerbes §3.2). (c) **Analytic finite-slope comparison** (SelmerIwasawaCohomology request): the local analytic theory is consumed from PhiGammaModulesAndIwasawaCohomology §§4.4, 4.5 and 5.4 (PR #1310) and ArithmeticGaloisDuality D7 (PR #858). FW's global analytic Selmer-complex comparison is the target `fw_analyticSelmerComparison` of L2.12. (d) **Equal Satake parameters** (PadicFamilies request): the target `fw_pIrregular_comparison` of L2.12 (FW §4.7, Prop. 4.53 and the ratio G, pp. 66–67), with two new Checks. (e) **BSTW two-variable zeta element** (KatoEulerSystems Part II request): L5a.1 is now proved as `twoVariable_PR_Greenberg_equivalence` from the Beilinson–Flach class and its two reciprocity laws, which are the specialization of AC's own L2.7–L2.8 (CGS23 Thm 3.1.1 p. 17, Cor. 3.1.3 p. 18, Prop. 3.2.1 pp. 18–19, an alternative proof that BCS Thm 4.1.3 itself cites). (f) **Integral elliptic image condition**: Kato's integral theorem needs the SL₂(ℤ_p) condition (12.5.2) of Thm 12.5(4) (pp. 221–222, read in the Numdam copy), which is stronger than BCS's (im). L5b.7 now owns `katoIntegralBound_im`, proved by applying Rubin's Thm II.3.3 under Hyp(ℚ_∞, T), from EulerSystemsAndKolyvaginSystems Layers 8.2 and 8.37 (PR #1272), to Kato's Euler system. (g) The Paškūnas 2016 p = 3 extension that R30.5 lacks is the target `paskunas2016_projectiveEnvelope` (L3.5; used in L3.7–L3.8). The Hilbert period/control extension of L0 was already owned in L5w.2 and L5w.11. |
| R3: CM congruence/Katz comparison | L0.9 is rewritten as `cmCongruence_dvd_katz`, H(g) dividing h_K·L^Katz, in three sourced cases. (A) p ≥ 5 under Hid06's hypotheses: equality (Hid06 pp. 466–467; Wan-2020 §7.5 p. 64). (B) p ≥ 3, including p = 3: HT94 Thm 0.3 (p. 92, read from the page image) with Rubin's main conjecture, as CGS23 Lemma 1.4.4 (p. 9) does, integral when p ∤ φ(𝔫)∏_{𝔩|c″}(1+N𝔩) and the trivial-zero factor is controlled. (C) The same divisibility after ⊗ℚ without the unit condition. I verified the direction: HT93 Thm I (p. 192) and HT94 Thms 0.1–0.2 (p. 91) give the opposite divisibility, Katz dividing H, so they cannot give integrality. CLW assert integrality for every p ≥ 3 (Thm 8.2.1(2), p. 78), but their cited inputs do not cover p = 3 with 3 dividing φ(𝔫)∏(1+N𝔩). That case is the registered open target `cmCongruence_dvd_katz_residual`, which no endpoint uses. L2s.8(a) is stated integrally in cases (A) and (B) and after ⊗ℚ in case (C). L2s.8(b), the p-inverted containment that RankZeroOneBSD imports, keeps p = 3, because it needs only case (C). Its split-conductor hypothesis makes the factor ∏(1+N𝔩) empty. p = 3 is not removed from the endpoint. |
| R4: originals and general weight | **General weight.** L2.4 is now the theorem `fourierJacobi_twoFamily_avoidance` with a complete proof route. The CLW addendum's two-family argument (§§3–5, pp. 2–6) carries over to FW's weight k. Its nonvanishing inputs, addendum Thms 1.0.1–1.0.2, are stated for forms of any weight. The only weight-dependent factor in FW's evaluation is the archimedean triple-product integral, a fixed constant 1/(k−1) (FW p. 95). The variable-support property of L_{1,1} and L_{6,2} is as in addendum (4.0.2). The three earlier named steps remain, without "unresolved". The extension itself is unpublished, and the README says so. L2.6, L2.12 and L2.13 now cite this theorem instead of an "explicit gap". **Originals.** MetaplecticAutomorphicForms plans neither Ikeda's theorem nor Ichino's formula, and AutomorphicSpectralTheory does not plan Harris's CAP exclusion, so these are now targets here: `ikeda_fourierJacobi_denseImage` (L2.4), `ichinoTripleProduct` (L2s.4, with its normalization from Wan-2020 §8.4, pp. 79–80) and `harris_noHolomorphicKlingenCAP` (L2s.6, in the weight range of CLW pp. 79–80, SU Thm 7.3.1 and FW p. 97). I could not reach the originals (see below). Each statement rests on an accessible restatement with locators, and the README marks it so. HT94 had already been verified by the adv1 checkpoint and is used here with locators. |

## Adversarial pass on the touched statements

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| L0.5/L0.7 over (F, M), n ≥ 1 | F = ℚ, n = 2 (SU, CLW, FW); F totally real, n = 2 (Wan 98 characters on p. 87); n = 0; groups taken over ℚ when F ≠ ℚ; p inert in M | n = 0 excluded by the middle-constituent datum; a datum over ℚ when F ≠ ℚ has the wrong local subgroups (new Check); "every place above p splits" added, since the ordinary local data need it; residue-field size n+2, char ≠ 2 and the polarization sign kept. |
| `cmCongruence_dvd_katz` | p = 5 (A or B); p = 3 with 𝔫 = 5 (φ = 4, B applies); p = 3 with 𝔫 = 7 (φ = 6, residual); trivial-zero case χ(D) ⊂ μ_{p^∞}; H = 3 against Katz value 1 | The direction is fixed by a computed witness (u/3 is not integral); the localization case is its own Check; Hid06 is never used at p = 3. |
| L2s.8 (a), (b) | p = 3 with 𝔫 = 7; p = 3 with 𝔫 = 5; split conductor in (b) | (a) is rational only in the residual case; (b) holds for every p ≥ 3; c″ = 1 under (b)'s conductor condition. New Checks. |
| `fourierJacobi_twoFamily_avoidance` | k = 2 (1/(k−1) = 1, the addendum's case); k = 4 (constant 1/3); one data set only; values X and X²; specialization Y ↦ 0; β = 0 | Constants change no ideal of R ⊗ ℚ; one data set misses the primes containing L_{1,1}; the earlier Checks are kept and two added. |
| `yagerModule` | m = 0 with d_0 = p and d_0 = 1; x = 1 in degree-p unramified K_1 (trace p); f = 1 under the two U-actions | Three Checks added; generator ⇔ trace unit; the two actions are not confused. |
| `fw_analyticSelmerComparison`, `fw_pIrregular_comparison` | [A → A] by X over E⟨X⟩ at X = 0 (Tor₁ class); k = 2; α = β with vanishing LZ period | Comparison stated for complexes; p-irregular branch empty for k = 2; the comparison passes through G, not through the vanishing period. |
| `twoVariable_PR_Greenberg_equivalence` | E(K)[p] ≠ 0; Coleman map with cokernel that is not pseudo-null | Both break the proof; (irr_K) and the pseudo-null-cokernel clause retained as Checks. |
| `katoIntegralBound_im` | Borel image containing [[1,1],[0,1]] ((im) holds, SL₂ fails); p = 2 | (im) is weaker than (12.5.2); residual irreducibility kept as a separate hypothesis; p odd. |
| Prerequisite order | grep of the APLF, Kato, PHR, PadicFamilies, Selmer, IHG, MP and AST packages for "AutomorphicCongruences" | No citation: no cycle. |

No statement was weakened to remove a finding, and no target, Check or anchor was dropped. The
README keeps all 92 anchors; internal links resolve (91 references, 0 missing); Checks sections
went from 92 to 93 (the new definition in L2.11).

## Sources read for this fix (2026-10-20)

All descriptions are in my own words, with locators; no passage is committed.

| Source | Locations read |
| --- | --- |
| CLW, arXiv:2109.08375v1 | Thm 8.2.1, p. 78 (p ≥ 3); proof of (1) and (2), pp. 79–81, including Har84 Thm 2.5.6 on p. 80 and the HT93/HT94/Hid06 citations on p. 81. |
| CLW addendum (UCSB) | §1 Thms 1.0.1–1.0.2; §3 (3.0.1)–(3.0.3); Thm 4.0.1 with (4.0.2)–(4.0.5); Thms 5.0.1–5.0.2. |
| FW, arXiv:2107.13726v3 | §4.2.2, pp. 43–44 (Yager module); §4.7, pp. 66–67 (Prop. 4.53, G); §7.4.2, pp. 92–96 (Ikeda theory, Lemma 7.26, archimedean 1/(k−1), Props 7.27–7.29, Def. 7.30, Lemma 7.31, Thm 7.32). |
| Wan-2020, arXiv:1408.4044v5 | Thms 1.1–1.2, pp. 2–3 (p ≥ 5); §7.5, p. 64 (Hid06 Theorem p. 468 (F)); §8.4, pp. 79–80 (Ichino's formula as restated). |
| HT93 (Numdam) | Theorem I, p. 192; Theorem 7.1, p. 242; Theorem 8.2, p. 257. |
| HT94 (GDZ, LOG_0011) | Theorems 0.1–0.2, p. 91, and Theorem 0.3, p. 92, read from page images (PDF pp. 4–5). |
| CGS23, arXiv:2303.04373v1 | Lemma 1.4.4, p. 9; Thm 3.1.1, p. 17; Cor. 3.1.3, p. 18; Prop. 3.2.1, pp. 18–19. |
| BCS, arXiv:2405.00270v2 | Thm 1.1.2 and (im), p. 2; §1.5 (p = 3 remark); Thm 4.1.3 and Cor. 4.1.4, p. 8; (5.4), p. 10. |
| Kato, Astérisque 295 (Numdam) | Theorem 12.5(1)–(4) and (12.5.2), pp. 221–222. |

**Not reachable:** Ikeda 1994 (J. Math. Kyoto Univ. 34) and Ichino 2008 (Duke 145): the Project
Euclid PDF routes returned a challenge page, and the Kyoto repository result was a different paper.
Harris 1984 (Ann. of Math. 119): no open copy found. For each, the statement used is the one that FW,
CLW, SU and Wan-2020 all apply, and the README marks it as such. A sources job should compare the
originals' numbered statements and normalizations.

Nothing in the fetched sources or the issue comments contained instructions; nothing suspicious to report.

## Validation

- `lean-check research/blueprint/packages/AutomorphicCongruences/Suggested.lean`: exit 0, exactly
  one warning, `declaration uses sorry` for `factorSeparation` (line 90); four proved examples.
  80 GB of memory was available. Only the closing comment changed; it now lists the new README targets.
- `python3 scripts/check_blueprint.py` on `AutomorphicCongruences--L0.json` and `--L5b.json`:
  0 errors, 0 warnings each (packets unchanged).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- Internal-anchor check: 92 anchors, 91 distinct references, none missing. `git diff --check` clean.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems.

## Notes for owners of other roadmaps

- HeegnerPointEulerSystems HE.8b imports the L0.9 CM comparison. It now has to choose case (A) or (B),
  or use only the rational case (C); the p = 3 integral residual case is open.
- RankZeroOneBSD BSD.6a imports L2s.8(b), which is unchanged in content and keeps p = 3.
- ModularIwasawaMainConjectures' review records that AC cites MIMC L0/L1. AC no longer does, so MIMC
  can follow AC instead of being bundled with it.
- KatoEulerSystems: the integral bound under (im) is planned here (L5b.7) from EulerSystemsAndKolyvaginSystems
  Layers 8.2 and 8.37. Kato's own package keeps the SL₂(ℤ_p) form of Thm 12.5(4).
