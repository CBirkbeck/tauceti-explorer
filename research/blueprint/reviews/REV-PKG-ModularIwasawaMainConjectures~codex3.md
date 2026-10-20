# Review: ModularIwasawaMainConjectures package (round after FIX-PKG~adv2)

Independent fixing review for #11391, job `REV-PKG-ModularIwasawaMainConjectures~codex3`. Done by Claude (Anthropic), session `claude-dl12AL`, on 2026-10-20. I did not write or fix this package. Its authors were `codex-u80FTH`, `codex-N1Ksnd`, `claude-clBfiO` and `claude-ozKmzn`, and its earlier reviewers were `codex-zwwmND` and `codex-ufMbTp`.

**Verdict: accepted, with the corrections below applied in place.** The README and `Suggested.lean` now meet items 1–6 of the job. One question is left to the maintainer: where AutomorphicCongruences, PadicHodgeRegulators and GrossZagierAndArithmeticHeights sit in the supplier order (see "Supplier order"). It is a routing decision, not a defect of this package.

## What was checked

- **Rules read.** WORKERS, PROTOCOL §§5, 13 and 20, UPSTREAM_GUIDE, PACKAGE_REVIEW, the previous review `REV-PKG-ModularIwasawaMainConjectures.md` (R1–R7), the fix handoff `FIX-PKG-ModularIwasawaMainConjectures~adv2.md` and the accepted packet.
- **Read in full.** The README (1,858 lines before the review) and `Suggested.lean`.
- **Three Sonnet helpers**, each producing a table that I checked myself:
  - every cross-roadmap citation against the supplier packages, packets and TauCetiRoadmap `origin/main`, with a prerequisite-cycle search over all packets;
  - every Mathlib and Tau Ceti name against the pinned and current trees, Lean/README name alignment, and duplication by mathematical object against current Tau Ceti and TauCetiRoadmap;
  - a seeded random sample of 15 source locators (seed 11391), plus the prime ranges stated by FW, SU, Skinner, Kato and LLZ.
- **Public sources** downloaded to scratch and read. Locators below give printed pages.

| Source | SHA-256 prefix |
|---|---|
| FW arXiv:2107.13726v3 | `39cee6ce` |
| Skinner arXiv:1407.1093v1 | `02d176d8` |
| LLZ arXiv:0912.1263v3 | `5981c2f6` |
| RJW arXiv:2309.15692v2 | `efa1e101` |
| Kato, Astérisque 295 (Numdam) | `3c6e14b1` |
| Stein–Wuthrich offprint | `f6aa144e` |
| EPW arXiv:math/0404484v1 | `d2d3fa55` |
| BCS arXiv:2405.00270v2 | `bf87592c` |
| SU author copy | `f9faa40a` |
| Schneider, heights II (read from the page image, p.371) | `13b45366` |
| Colmez, Bourbaki 919 | `992f7a9f` |
| Rubin, *Euler systems* draft | `de47655d` |

No restricted library file was used.

## R1–R7 of the previous review

| Item | Claimed closure | Verified |
|---|---|---|
| R1 universal zeta morphism | AutomorphicCongruences L3.4/L3.7–L3.9 | Yes. AC's package has L3.4 "Fundamental lines over the deformation ring", L3.7 Nakamura's universal zeta morphism, L3.8 the specialisation to Kato's morphisms and L3.9 the zeta trivialisation, with the FW p=3 remark. |
| R2 heights and Schneider | §§3.7–3.9 own them | Yes, with one defect fixed (F1 below). SW (4.1), p.1770–1771, gives e₂=−12a/b, the 1/α eigenvector and ĥ_p=2log_p(e/σ_p); footnote 4 gives the factor 2 against MST; §4.2 gives Werner's split term. Schneider p.371 has Theorem 6 (⟨,⟩_κ=−(,)_κ) and Theorem 7 in the shape the README states. |
| R3 integral periods | §0.9 defect, `KatoPeriodDefectUnit`, §4.5 split | Yes. The scaling law and the homothety and good-pair computations are consistent (Checks recomputed). Every integral transfer either carries the named hypothesis or uses the elliptic §3.2 or the detection argument of §0.10. |
| R4 p=3 Hida approximation | §1.6 via EPW Theorem 2.1.2 | Yes. EPW fix an odd prime throughout and state freeness and control in Theorem 2.1.2 (pp.7–8). The README uses it only at tame level M≥2. |
| R5 Eisenstein infrastructure | Layer 6 formulations only | Yes. No Layer 6 output is a prerequisite of any earlier target. Process wording in the downstream-input paragraphs was removed (F9). |
| R6 ramification at 5 | §5.11 by level lowering | Yes. I recomputed a₂=−4, the discriminant −16≡5 (a nonsquare mod 7), μ(5)=−1, μ(5)·5⁻¹≡4 mod 7, and Serre weight 4 (exponent 3 strictly between 1 and 6). Mathlib `CuspForm.rank_eq_zero_of_weight_lt_twelve` exists at the pin. The overstated second Mathlib name was trimmed (F8). |
| R7 supplier order | bundle with AutomorphicCongruences | The package side holds: the cycle search found only the documented AC↔MIMC layer dependency, and no target-level cycle. See "Supplier order". |

The two package revisions were reconciled without loss: all 90 API names of the accepted packet are in the README, every Lean declaration is named in the README, and the 46 packet targets all have sections.

## Corrections made

**F1. §3.9 at split multiplicative p used the wrong Selmer group (mathematical error).**
- **The defect.** §3.9 took X_ord to be the dual of "Sel_{p^∞}(E/Q_∞) (§0.2, §3.3)". At a multiplicative prime, §0.2 means the inertia-kernel group. Stein–Wuthrich's Theorem 6.1 (p.1776), which §3.9 restates, uses Mazur's classical Selmer group. At split p that group is the strict group, Skinner's S, the kernel of (2.3.2) on p.9.
- **Why it is false as written.** By Skinner Proposition 2.3.2 (pp.9–10) and the local computation of §0.2, the inertia-kernel dual is an extension of X_ord by Λ/(γ−1). So for that group the order statement "ord = r iff the height is nondegenerate and Sha is finite" is off by one. This also contradicts §1.7's Check that (γ−1) divides both sides.
- **Supporting evidence.** Kato's own split bound in KatoEulerSystems §7.4 has the form J·char(Z_∞) | L_E, with the augmentation ideal J on Mazur's group.
- **Fix.** §3.9 now names Mazur's group and says which group it is at good ordinary, nonsplit and split p. A new Check derives char(X^{in})=(γ−1)(f_E), reconciling §3.9 with §§1.7 and 5.7.

**F2. Generality at p=2.** The README assumed p odd throughout. Kato states his main conjecture for every p (Conjecture 12.10, p.224), at p=2 only at height-one primes not containing 2. His Theorems 12.4(1)–(2) and 17.4(1)–(2), and the rational part of Conjecture 17.6, hold for every p. Only 12.4(3), 12.5(4), 17.4(3) and the integral part of 17.6 need p≠2. Every supplier used here (KatoEulerSystems, ModularSymbolsPadicLFunctions, SelmerIwasawaCohomology, PadicMeasuresIwasawaAlgebras) plans p=2. Changes:
- **Conventions.**
  - γ is chosen with κ(γ)=5 at p=2, and Δ=(ℤ/4)^×.
  - At p=2, Λ(G∞) is not the product of its components (Kato 12.1.2 and 12.1.4, pp.219–220).
  - A new "Range of primes" paragraph says which targets cover p=2 and gives, for every other target, the source range that excludes it: SU, Skinner and FW p≥3; BCS p>3; LLZ p odd (p.6); SW p odd from §3 on (p.1762).
- **§0.1** is now defined for every p, with a p=2 Check.
- **§0.6** now gives Kato 12.4 for every p, with freeness of H¹ only for p≠2.
- **§0.7** states KMC at p=2 in Kato's form, adds the interface change and a Check, and notes that KMC and KMC_Q coincide at p=2.
- **§0.10** now proves the comparison at height-one primes not containing p for every p, including p=2: (17.13.1) is exact up to 2 (p.279). The new interface item is `kmc_iff_ordinary_two`; integral consequences stay odd.

**p dividing the level.**
- §0.7 allows every reduction type at p, and §2.2 (FW Theorem 5.1) covers level Np^r.
- With trivial character, an ordinary form has p∤N, or p∥N in weight two, which is the multiplicative branch of §§0.2 and 1.7.
- So the ordinary formulations already cover every p dividing the level that the sources allow.

**F3. Tate's uniformisation theorem had no owner.**
- **The defect.** The supplier contract said EllipticCurves Layer 4 supplies, for a split multiplicative E, its parameter q_E. On TauCetiRoadmap main, Layer 4 only builds E_q from a given q, with its uniformisation, j(q), v(Δ)=v(q) and its split reduction. FiniteFlat R07.5.4 uses the converse inside a proof.
- **Fix.** `tateParameter_exists` is now a target in §1.1 (Layer 1, before its uses in §§1.1, 3.7, 3.9 and 5.5), stated over finite extensions of every ℚ_ℓ. Source: Silverman, ATAEC Theorem V.5.3; Stein–Wuthrich §4.2, p.1771. The ATAEC page is not given because the book is neither free nor cleared.
- **Also changed.** It comes with the proof of the inertia criterion `ResidualHyp.ramified_iff_not_pth_power`, Checks for 11a1/ℚ₁₁ and for nonsplit 14a1/ℚ₂, and updated contract and *Needs* lines.

**F4. Greenberg–Stevens had no owner.**
- **The defect.** The README cited PadicFamilies Layer 3 for the derivative formula. That layer contains critical-slope refinements and nothing on Greenberg–Stevens or Mazur–Kitagawa; RankZeroOneBSD only lists it as a request.
- **Fix.** `greenbergStevens_derivative` is now a target of §5.7. Source: Colmez Théorème 0.11 and the attribution on p.255; Skinner (2.4.3), p.15. Its proof uses PadicFamilies Layer 1 §§1.5–1.6, with Layers 0 and 4 for p≥5 and §1.6 for p=3.
- **Also changed.** I added a scope Check and updated the *Needs* lines and the Layer 5 dependencies.

**F5. Serre's SL₂(ℤ_p) lifting lemma had no owner.**
- **The defect.** ArithmeticGaloisRepresentations R01.6 (and the whole AGR package) does not state it, and no other roadmap does.
- **Fix.** `sl2Zp_closedSubgroup_eq_top` is now a target of §3.6, with a proof outline: Frattini quotient sl₂(F_p), irreducibility, and x^p≡1+p·n mod p² for p≥5.
- **Negative control.** The binary tetrahedral group of Hurwitz units inside SL₂(ℤ₃) maps onto SL₂(F₃), so p≥5 is needed.
- **Lean.** It is stated in `Suggested.lean` as a Layer 3 milestone. All its carriers are at the pin (Mathlib's topology on `SpecialLinearGroup`, `PadicInt.toZMod`).

**F6. Two KatoEulerSystems citations corrected.**
- L_f≠0 now cites §4.2 `analyticTwistNonvanishing` (Rohrlich, Jacquet–Shalika, Kato 13.5), not the non-torsion node 7.1.
- The Néron-normalised elliptic zeta element now cites §§6.4 and 7.4, not "Layer 7".

**F7. Upward or misdirected citations.**
- §5.9 cited AutomorphicPadicLFunctions Layer 5 in its *Needs*. Only the modular instance of the Coates–Perrin-Riou interpolation property is needed, so it is now stated directly (RJW B.2.1 Theorem B.1, pp.79–80; B.3(1), p.81). AutomorphicPadicLFunctions is now only a consumer.
- §3.9's abelian-variety statement now cites NeronModelsAndSemistableAbelianVarieties Layers 1–2 for Néron models and component groups, which TauCeti EllipticCurves explicitly excludes. The elliptic Tamagawa numbers stay with EllipticCurves Layer 4.

**F8. Locators and library claims.**
- §§2.3 and 4.3 cited FW "§1.1.2, p.7", which contains only Theorem 1.7; they now cite Theorem 1.7 (p.7; pp.7–8 for the discussion after it).
- §5.9 now cites RJW B.2.1 as well.
- §§0.12–0.13 now cite LLZ Corollary 3.33 and Remark 3.30 (the tilde functions and the k=2, a_p=0 case) alongside Corollary 3.29.
- The claim that `ModularForm.levelOne_weight_four_rank_one` "says the space is spanned by E₄" overstated a rank-one statement. Removed twice; `CuspForm.rank_eq_zero_of_weight_lt_twelve` alone suffices.
- §3.7's Bernardi σ is now defined by its normalisation (σ(O)=0, dσ/ω(O)=1, σ(−P)=−σ(P)) rather than as "the odd series" (SW p.1770).
- Scope and DiophantineApproximationAndTranscendence said the transcendence target is in §5.5; it is in §3.7.

**F9. Process wording removed.** These phrases are gone: "requested by", "currently assumes … records … gaps", "proposed L3m", "previously requested … are closed as follows", "not in the numbered Caraiani–Newton order", "go upstream together as one bundle", "routing decision", "its formal proof is requested from a Part II", "No atlas roadmap …". Each was replaced by a timeless statement of ownership.

**F10. `Suggested.lean` closing comment.**
- `tateParameter_transcendental` and `tateParameter_log_ne_zero` moved to Layer 3, where the README states them.
- Added `tateParameter_exists`, `ResidualHyp.ramified_iff_not_pth_power`, `kmc_iff_ordinary_two` and `greenbergStevens_derivative`.

## Supplier order

The issue asks that every supplier be ordered before this roadmap, and that HeegnerPointEulerSystems or anything later never be one.

**Upward citations.** No *Needs* line cites HeegnerPointEulerSystems, RankZeroOneBSD, GeneralizedHeegnerCycles, CMAllPrimeMainConjectures, RankOneConverse or AutomorphicPadicLFunctions. The last *Needs* entry of this kind was removed (F7). These roadmaps appear only as downstream consumers or as owners of downstream proof inputs.

**The four named roadmaps.** KatoEulerSystems is a supplier. EulerSystemsCyclotomicMainConjecture, IntegralIwasawaTheory and PhiGammaModulesAndIwasawaCohomology are not cited and are not needed. PhiGamma explicitly leaves Coleman maps to their owners.

**Suppliers whose position the maintainer must confirm:**
- **AutomorphicCongruences.** It cites MIMC L0/L1 and MIMC L1/L2/L4 cite it. The search over all packets found no target-level cycle, so it goes with this roadmap as a bundle. Its package has no review yet.
- **PadicHodgeRegulators.** Coleman maps and Wach bases (L3, L4). It is outside the 94-roadmap order and has packets only, no package. KatoEulerSystems §7.4 already depends on it, so it must precede Kato.
- **GrossZagierAndArithmeticHeights GZ.3.** Manin integrality. It is ordered before HeegnerPointEulerSystems (maintainer order of 2026-10-20). No path from GZ.3 reaches this roadmap.
- **ColemanIntegration L0.18.** The Iwasawa logarithm; TauCetiRoadmap PR #1043.

**Supplier packages still under review:** KatoEulerSystems, SelmerIwasawaCohomology and ArithmeticGaloisRepresentations are at needs_changes, and AutomorphicCongruences is unreviewed. Their cited sections exist with the stated content.

**Notions now owned here** (for the downstream plans to import):
- Tate's uniformisation theorem (§1.1). EllipticCurves Layer 4 has only the forward construction; FiniteFlat R07.5.4 can cite it.
- Greenberg–Stevens (§5.7). RankZeroOneBSD's request to PadicFamilies L3 should point here.
- Serre's SL₂(ℤ_p) lemma (§3.6).

## Adversarial pass on the statements touched

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §3.9 order and leading term | split p, r=0, E[p] irreducible; inertia-kernel vs strict group | For the inertia-kernel group, f has a forced zero at T=0 by Skinner Prop 2.3.2 and the L/O term of §0.2; Mazur's group has order r | Named Mazur's group; added the reconciling Check |
| Conventions at p=2 | κ(γ)=3 vs 5; idempotents (1±δ)/2 | 3∉1+4ℤ₂; 2 is not a unit, so there is no η-splitting over O | Added a p=2 convention and a Check |
| §0.7 KMC at p=2 | prime (ϖ)∋2 | Kato asserts nothing there | Length form at primes not containing 2 |
| §0.10 at p=2 | (17.13.1) exact up to 2 | An isomorphism after localising at primes not containing 2, not at (ϖ) | Rational equivalence only; Check added |
| `tateParameter_exists` | 11a1/ℚ₁₁ split, v(q)=5; 14a1/ℚ₂ nonsplit; |j|≤1 | Split gives a K-isomorphism; nonsplit only over the unramified quadratic extension; potentially good has no q | Hypotheses as stated; Checks added |
| `sl2Zp_closedSubgroup_eq_top` | p=3 binary tetrahedral group; p≥5 Frattini argument | Fails at 3 (24 Hurwitz units, torsion-free congruence kernel); holds at p≥5 since C(p,3)≡0 mod p | p≥5 retained; negative control added |
| `greenbergStevens_derivative` | nonsplit, good ordinary, split | Only split has α=1 and an ℒ-invariant | Scope Check added |
| §0.4 L_f≠0 | weight 2 vs k≥3 | Rohrlich in weight 2; Jacquet–Shalika and Kato 13.5 otherwise | Citation to Kato §4.2 |
| §5.11 R6 | ℓ=7: a₂=−4, discriminant 5, μ(5)=−1, eigenvalue 4, Serre weight 4 | All recomputed; S₄(SL₂ℤ)=0 | Mathlib overclaim trimmed |
| §§1.1, 1.2, 5.1, 5.5, 5.6, 3.9 Checks | 11a1 at 7 and 5, 14a1 at 13, 5 and 2; det(g−1)=−ϖ; 21/22 vs 9/11; 21/14; MTT 1/5; anomalous ε₅ | All values recomputed and correct | None |

## Validation

- **`lean-check`** on the final `Suggested.lean` (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0, six warnings, all `declaration uses sorry`, nothing else.
  - The file has 354 lines: six real-bodied definitions and eleven named theorems, five proved and six `sorry` targets, the new `sl2Zp_closedSubgroup_eq_top` among the latter. It also has eleven proved examples.
  - Before the review the same check gave exit 0 with five warnings.
- **`python3 scripts/check_sorry_data.py`** on the Lean file: exit 0.
- **Name alignment.** All 90 packet API names occur in the README, and all 17 Lean declarations are named in the README.
- **`python3 research/blueprint/intake.py check-files`** on the four package files: 0 problems. `git diff --check` is clean.
- **Size.** The README is 261 KB, within the 100–300 KB the 2026-10-12 shape section allows for a package with full Checks. `metadata.toml` is `topic = "math.NT"`.
- **Duplication.** Nothing in current Tau Ceti (a91d3aaf) or on TauCetiRoadmap main defines a main conjecture, p-adic L-function, zeta element, fundamental line, Coleman map, p-adic height, σ-function, ℒ-invariant, Hida family or Manin constant. `TauCeti.tateCurve`/`tateCurveAt` and `completedGroupAlgebra` exist only in current Tau Ceti and are cited as such. No removals were needed.

No untrusted text asked for any action.
