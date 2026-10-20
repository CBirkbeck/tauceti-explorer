# Fix handoff: ModularIwasawaMainConjectures (adv2)

Job `FIX-PKG-ModularIwasawaMainConjectures~adv2`, issue #11322, done by Claude (Anthropic), session `claude-ozKmzn`, on 2026-10-20, branch `claude-ozKmzn-mimc-fix-adv2`. This is a completed fix, not a checkpoint. I did not write the package, the package review, the earlier fix (`codex-N1Ksnd`, #11000) or the package revision on branch `claude-clBfiO-mimc-package-2` (`claude-clBfiO`, closed PR #11060).

The findings input named by the issue, `reviews/REV-PKG-ModularIwasawaMainConjectures~adv.md`, does not exist; as in the earlier fix, the findings are R1–R7 of the package review [REV-PKG-ModularIwasawaMainConjectures.md](../reviews/REV-PKG-ModularIwasawaMainConjectures.md) and the residue recorded in [FIX-PKG-ModularIwasawaMainConjectures~adv.md](FIX-PKG-ModularIwasawaMainConjectures~adv.md). The deliverables are the package `README.md`, `Suggested.lean`, `review.json` and this note; `metadata.toml`, the packet and every other roadmap are unchanged.

## Reconciliation

Two revisions had changed the package independently since the reviewed version (merge base `1610cdf0d`): main's checkpoint fix (#11000), which kept R1–R5 open as requested supplier extensions, and the revision on `claude-clBfiO-mimc-package-2`, which closed them by routing and new targets. The package now contains both. I three-way merged the two texts, resolved the nine README and six Lean conflicts by hand, and then read each auto-merged hunk of both sides against the other for contradictions. Where both sides touched the same statement:

| Statement | Kept | Why |
| --- | --- | --- |
| Universal zeta morphism (§§0.6, 4.1, suppliers) | Branch: AutomorphicCongruences L3.4/L3.7–L3.9; main's paragraph on FW Assumptions 2.1 and 3.5 added to §4.1 | AC's package has `fundamental-line`, `nakamura-universal-zeta-morphism`, `nakamura-specialization-theorem` and `zeta-trivialization` with the FW p=3 remark. Main's "required KatoEulerSystems extension" asked for something that already has an owner. |
| PadicFamilies / Hida approximation (suppliers, §§1.6–1.7) | Branch's §1.6 target, with main's precision: r_m versus m, lattice and ordinary-line congruence, Skinner's unit u_m, Σ convention | Branch is stronger (plans p=3); main's details are correct and were missing from it. EPW wording corrected (below). |
| Eisenstein inputs (suppliers, §6.2) | Branch's routing (downstream proof); main's Keller–Yin/CM and Hida μ paragraphs kept as the contract the downstream proof must meet; main's caution about §5.1 kept as a §6.2 check | Branch removes the upward citation; main's mathematics is correct and is not lost. |
| "Required extensions" table (main) | Replaced by a "Named hypotheses carried by the targets" table and a routing paragraph | Every row is now closed or is a named hypothesis; see R1–R7. |
| §4.5 Kobayashi/Pollack | Branch's corrected/principal split; main's sentence that the isomorphism need not preserve the ambient lattice | Both correct; branch's normalisation wording fixed (below). |
| §5.8 | Branch's derivation through §3.9; main's two checks (s-coordinate coefficient a_r c^r, the unit ratio −α(1−p/α)) | Both. |
| §5.11 ramification at 5 | Branch's unconditional proof, under main's target name `etaProduct_residualRamifiedAtFive`; main's caution kept as a check | Suppliers verified (below). |
| §1.1 and Suggested.lean | Branch's file and proofs, plus main's four named boundary targets | See "Lean". `not_rankOneCoinvariants_uniformizer` (main) and `not_hasRankOneCoinvariants_upper_uniformizer` (branch) are the same statement; the branch name is kept. |

No repair of either side was dropped.

## Finding → change

| Finding | Change | Disposition |
| --- | --- | --- |
| R1 universal zeta morphism | §§0.6, 4.1, 4.2 and the AC supplier contract cite AC L3 (`fundamental-line`, `nakamura-universal-zeta-morphism`, `nakamura-specialization-theorem`, `zeta-trivialization`); FW Assumptions 2.1/3.5 retained. | **Closed.** Checked in AC's package README (L3.4, L3.7–L3.9) that these exist with the p=3 remark of FW Thm 3.6. |
| R2 height and Schneider | §§3.7–3.9 own the cyclotomic σ-height, its normalisations and Schneider's theorem; `schneiderFlatGaloisComparison` is a named step of §3.9; §§5.6, 5.8 use them. | **Closed.** Corrections to the branch text: SW's split multiplicative height has the extra term −log_p(u)²/log_p(q_E) (SW §4.2, p.1772), now included; Schneider's Theorem 6 says ⟨,⟩_κ = −(,)_κ (p.371), so "agree" became "agree up to sign" (`schneiderHeight_sign`); MST's normalisation is stated exactly (h = −ĥ_p/(2p)). Generality: §3.9 now states Schneider's Theorem 2′/7 for an abelian variety over a number field, ordinary above p (`schneider_leading_term_abelianVariety`), with the elliptic theorem as its specialisation. |
| R3 integral periods | §0.9 period defect u_p(f) with `KatoPeriodDefectUnit`; §0.10 KMC ⟺ char(X)=(u_p L_f) and detection; §3.2 elliptic case; §4.5 corrected forms need no unit, principal forms need `pollackMultiplierUnit`. | **Closed** by exact statements: no unit is claimed where none is proved; each conditional integral form carries a named hypothesis (table in Exact supplier contracts). §4.5 no longer cites the good-ordinary §3.2 for a supersingular curve; it uses the Néron-differential normalisation of §3.1, in which Kobayashi works (LLZ p.3). |
| R4 p=3 family | §1.6 owns the Hida approximation for every p≥3. | **Closed.** EPW Theorem 2.1.2 (arXiv v1 p.8) states Hida's control theorem for every odd p and every tame level; the branch's "Mp≥4" was not in EPW and was replaced by "used only at tame level M≥2". Σ convention aligned with §0.4 (Skinner's sets contain p). |
| R5 Eisenstein infrastructure | Layer 6 states formulations and transfers only; the elliptic-unit, μ and Hida–Tilouine inputs are recorded as requirements on the downstream proof. | **Closed for this roadmap.** No target here depends on them. Added the negative control 11a1 at p=5 (hypothesis of §5.1 fails). |
| R6 ramification at 5 | §5.11 proves `etaProduct_residualRamifiedAtFive`. | **Closed.** Read SerreWeightAndLevelOptimisation §2.9 (Mazur's principle, ℓ≥5, q≢1 mod ℓ), §3.1 (Edixhoven's ordinary local form, 2≤k≤p+1), §3.9 (Ribet's four sets, ℓ≥5), AlgebraicModularFormsAndSerreWeights R15.4 (the recipe); exponent 3 avoids the peu/très ramifiée case; S₄(SL₂(ℤ))=0 is Mathlib `CuspForm.rank_eq_zero_of_weight_lt_twelve` (and `ModularForm.levelOne_weight_four_rank_one`), both present at Mathlib 082e2d3. |
| R7 supplier order | Routing paragraph in Exact supplier contracts. | **Package side closed; one maintainer action.** A script over all packets found no cycle between this roadmap's and AutomorphicCongruences's targets (AC cites only L0 targets and `L1/fw-ordinary-theorem` here; no L0 target here cites AC), and none of KatoEulerSystems, SelmerIwasawaCohomology (+Part II), PadicFamilies, ModularSymbolsPadicLFunctions, PadicHodgeRegulators, CrystallineCohomology, ColemanIntegration, SerreWeightAndLevelOptimisation, AlgebraicModularFormsAndSerreWeights, EllipticCurveModularity, GrossZagierAndArithmeticHeights, ArithmeticGaloisRepresentations, PadicMeasuresIwasawaAlgebras, AutomorphicGaloisRepresentations or DiophantineApproximationAndTranscendence reaches a target of this roadmap. **Maintainer:** record the bundle ModularIwasawaMainConjectures + AutomorphicCongruences in `upstream/CaraianiNewton.md`. |
| New F1: false supplier attribution | The package cited DiophantineApproximationAndTranscendence DT.5 for ℒ_p(E)≠0. DT.5 (atlas packet) and §5.6 of the upstream roadmap state only Nesterenko's complex theorem; nothing in the atlas or in Tau Ceti states the p-adic Barré-Sirieix–Diaz–Gramain–Philibert theorem. Now `tateParameter_transcendental` and `tateParameter_log_ne_zero` are stated in §3.7 (needed there for the split height and in §§3.9, 5.5, 5.7). | **Fixed.** Source: Waldschmidt, Séminaire Bourbaki 824, Théorème 2, p.108 (ℂ means ℂ or ℂ_p, p.106), consequence for log_p q on p.110; BDGP, Invent. Math. 124 (1996). **Request:** a Part II of DiophantineApproximationAndTranscendence should own the general theorem (complex and p-adic J(q)); §3.7 then cites it. |

Notion moves recorded for other plans: RankZeroOneBSD and HeegnerPointEulerSystems should cite §§3.7–3.9 here for heights and Schneider's theorem, §3.7 for ℒ_p≠0, and §0.9 for Kato/canonical period transfer. PadicFamilies, if it extends Layer 0 to p=3, can take over §1.6's control input.

## Lean

`Suggested.lean` (332 lines): six real-bodied definitions; ten named theorems, of which five are proved (`invariants_comp_subtype_eq_top`, `FWAuxiliaryCondition.isRamifiedAt`, `not_fwAuxiliary_bot`, `localExclusion_one_iff`, `not_hasRankOneCoinvariants_id`) and five are `sorry` targets (`fwAuxiliary_independentCharacters`, `hasRankOneCoinvariants_of_unipotent`, `not_hasRankOneCoinvariants_upper_uniformizer`, `hasRankOneImage_fullAutomorphismGroup`, `associated_of_eq_away_of_mu_eq`); eleven proved examples, at most two per definition, plus the review's negative control for the μ theorem. The closing comment lists the README targets without carriers at the pins, including the new ones. `lean-check` (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0, five warnings, all `declaration uses sorry`, no other output; 80 GB were available.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result |
| --- | --- | --- |
| §0.9 defect | ω→ϖω; (ω,γ)→(cω,cγ); b⁺=1,b⁻=ϖ; f=ϖω_B; N<4 at p=3 | Scaling law uniform by Kato 16.3(2), sign-by-sign derived from 16.2(i) and 16.3(1) (attribution corrected); defect well defined only because T_B is fixed; p>3 or N≥4 retained. |
| §0.10, §1.5, §2.3 | u_p=ϖ; L_f=0; rational form | KMC ⟺ char=(u_pL_f); detection needs L_f≠0; rationally no defect. |
| §1.6 | p=3, M=1 (excluded by q∥M), M=2; Σ containing p; generators X versus X+ϖ^m; residual congruence only | Σ convention fixed; ideals not generators; m=1 residual data insufficient; EPW scope corrected. |
| §3.7 | r=0; split p with u=1+p; q_E=ζp^n; p=3 convergence (ord t ≥ 1 > 1/2); MST normalisation | Missing correction term added; transcendence needed for the denominator; MST pairing is ⟨,⟩_p/p. |
| §3.8 | rank one; inverse coordinate; sign of Schneider's heights | ⟨,⟩_κ=−(,)_κ; determinants differ by (−1)^r; Reg_γ versus Reg_p by log_p κ(γ)^r. |
| §3.9 | 11a1/7 (Sha[7^∞]=1); 11a1/5 shape and anomalous ε_5; degenerate height; split r=0; A=E torsion square; nonsplit component counts | Tamagawa numbers, not geometric component counts; unit ratio −α(1−p/α) reconciles #Ẽ(F_p)² with ε_p; abelian-variety form specialises correctly. |
| §4.5 | a⁻=p·u; supersingular normalisation | Corrected forms unconditional; principal forms need `pollackMultiplierUnit`; no ordinary-only citation. |
| §5.5, §5.7 | q=p local; E/ℚ | ℒ≠0 only for E/ℚ via §3.7. |
| §5.11 | ℓ=2,3; weight 12; exponent 1 versus 3 | ℓ=3 outside Mazur's principle in general weight; S₁₂≠0 shows the weight matters; exponent 3 avoids the peu/très case. |
| §6.2 | 11a1 at p=5 | T*≅E[5^∞] has rational 5-torsion, so §5.1's hypothesis fails; the downstream proof needs its own Euler-factor comparison. |
| Lean predicates | trivial group; F₂ characters; zero ring; rank one; D=I; equal characteristic DVR | `IsRamifiedAt ρ ⊥` false; over F₂ all unit characters coincide and `localExclusion_one_iff` still holds; zero ring excluded by `Nontrivial`; dimension-one counterexample to `isRamifiedAt` recorded in its docstring; μ theorem over any DVR. |

## Sources read for this fix (public copies; SHA-256 prefixes of the downloaded files)

EPW arXiv:math/0404484v1 (`d2d3fa55`), §2.1 and Thm 2.1.2, pp.6–8; Skinner arXiv:1407.1093v1 (`02d176d8`), §2.6 and §3.1, pp.16–20; Stein–Wuthrich offprint (`f6aa144e`), (3.2) p.1765, §4 pp.1769–1774, Conj. 5.1 p.1774, Thm 6.1 p.1776; Mazur–Stein–Tate (`76f3ed4d`), pp.578–580; Schneider II scan (`13b45366`), §2 p.341, Thm 2′ p.342, Thms 6–7 p.371 (read from page images; the text layer is unusable); Kato, Astérisque 295 (`3c6e14b1`), 16.2–16.3 p.269, 17.4–17.5 pp.273–274; Skinner–Urban author copy, §3.3.3 p.28; LLZ arXiv:0912.1263v3 (`5981c2f6`), p.3 and p.40; Waldschmidt, Bourbaki 824 (Numdam), pp.105–110. No restricted library file was used. Repository text is in my own words with locators.

## Checks run

- `lean-check` as above.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularIwasawaMainConjectures.json`: 0 errors, 0 warnings (packet unchanged; 46 nodes, 90 API items, 49 tests); all 90 packet API names occur in the README; all 16 Lean declarations are named in the README.
- `python3 scripts/check_sorry_data.py` on the Lean file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. `git diff --check`: clean.
- A Sonnet helper cross-checked every internal § reference, the layer order of the *Needs* lines and merge artifacts: no broken reference, no later-layer prerequisite, no leftover marker or removed name. It also flagged an ambiguous "§4.6" (now "Fouquet–Wan §4.6") and three interface items restated word for word as Checks in §§0.5, 0.12 and 3.2; those were already in the reviewed package and are left as they are.
- `mech_check` and `depcheck` are not present in this clone, so they were not run.

## For the next worker

Nothing remains inside the package. Outside it: the maintainer records the MIMC + AutomorphicCongruences bundle (R7); a DiophantineApproximationAndTranscendence Part II should take the p-adic BDGP theorem; the downstream BSD and Heegner plans should point at §§0.9, 3.7–3.9. No untrusted text asked for any action.
