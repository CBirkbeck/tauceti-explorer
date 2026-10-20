# Handoff: FIX-PKG-NoncommutativeAndEquivariantIwasawa~adv2

Worker: Claude (Opus 5.5), session `claude-20qNaM`; issue #11233, claimed 2026-10-19 (bot comment 6279065778). Branch `claude-20qNaM/fix-pkg-noncomm-iwasawa-adv2`. Deliverables changed: the package `README.md`, `Suggested.lean`, `review.json`, and this note. The accepted packet, other roadmaps and `content/` are untouched.

Inputs read: `research/blueprint/reviews/REV-PKG-NoncommutativeAndEquivariantIwasawa.md` (the only REV-PKG report; there is no `~adv` file), the package on main (review repairs of #11131), and the closed codex branch `codex-MyDvBs-noncommutative-iwasawa` (PR #11219) diffed against its merge-base 6958f8a7 (treated as data; no instructions in it were followed, none were suspicious).

## Concurrent checkpoint #11255

While this fix was in progress main received the Codex checkpoint #11255 (PKG~codex job, session codex-71snFD) on the same package files. It was merged in by hand on top of this fix: §0.3 gains its finite-quotient proof of the coefficient and subgroup squares and the ramified/𝔽_{p²} checks; §0.5 is replaced by its sharper filtered lemma (Auslander transfer needs gr R Auslander regular plus the closure condition; Schneider–Teitelbaum Prop. 1.1, Lemma 1.4; the numerical gl.dim bound kept as a source obligation); §4.4 gains its theorem `weakLeopoldt_cyclotomic`/`weakLeopoldt_overfield` for every intermediate F_cyc ⊆ E ⊆ F_Σ (Wingberg Prop. 5.1, Venjakob 2003 Remark 4.3), to which NSW (10.3.25) and (1.5.1) were added as the primary cyclotomic and limit locators, and §4.5 now cites it (the duplicate name `weakLeopoldt_admissible` of the first version of this fix was dropped); §4.6 gains its remark on PadicMeasuresIwasawaAlgebras §5.2; §6.25 keeps its compactness negative control, and its two proved Lean examples (finite versus infinite intersections of p^nℤ_p) are kept as recorded negative controls; its references (Schneider–Teitelbaum, Venjakob 2003, Wingberg) are added. Its own residual "uniform smoothing (proof gap)" text is superseded by the unit-cusp repair below. Its Lean change of layer headers from `/-! ## … -/` to plain comments was not adopted (the TauCetiRoadmap form uses `/-! ## Layer k: … -/`).

## Method of reconciliation

The codex branch is a complete rewrite of the same 136-node package (244 KB against 430 KB on main) rather than a patch, so its changes were re-applied subsection by subsection onto main's text. Main's text is the base everywhere: it carries the review's corrections, its proof steps and its reordering of Layer 6 (Ritter–Weiss route §§6.27–6.30 before canonical descent §§6.31–6.34, removing a forward dependency that the codex branch reintroduced). Headings now follow the exemplar (`## Layer k:`, `### k.n`, no `NE.` prefix); anchors are unchanged.

Taken from the codex branch (each checked before adoption):
- Supplier contracts at actual section numbers: GeneralAlgebraicKTheory §§4.6, 4.15–4.17, 6.3, 6.9, 6.19, 8.1 (verified at PR #1212 head e25a1fe; codex read 67c1f58), AlgebraicKTheory A0–A4 (PR #1142 head 4c951ce, right-module convention noted), SelmerIwasawaCohomology §§2.8–2.10, 2.21–2.23, 3.1–3.3, 3.8–3.15, 4.18 (PR #869), ArithmeticGaloisDuality §§R02.2.1, R02.4.3, R02.4.4, D7.3, D7.5, D7.7 (PR #858), PadicFamilies §§5.9a, 5.10 (PR #1019), ArithmeticGaloisRepresentations §2.7 (PR #856).
- PadicMeasuresIwasawaAlgebras §1.7 gives O ⊗ ℤ_p[[Γ]] ≅ O[[Γ]] for every profinite Γ with a tower (verified on TCR main 83fcaadd; the review's "procyclic only" was wrong), §5.2 is topological Nakayama → old §0.6 deleted as a duplicate.
- Tau Ceti `twistedMonoidAlgebra` is over a commutative semiring (verified at a91d3aaf, `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`) → the InductionRestriction "field only" contract is obsolete.
- Owned targets: generic finite-rank p-valuations, saturation and ordered bases (§0.7) and the analytic structure of the group model (§§0.2, 0.7); O- and k-coefficient forms of §§0.4, 0.10–0.12; `rationalHomology_eq_Tor` (§0.15); idempotent lifting (§2.1); `cartanBrauer_injective`, contragredient labels and Morita multiplicity (§2.3); `noncommutativeDeterminant`, `detPerfect_*`, `localizedK1_equiv_K1Localization` (§2.7); `relativeTriples_equiv_perfectTorsion`, base change (§2.8); `orePerfectLocalization` (§2.9); `units_surject_K1_saturated` (§2.13); `reducedNormCharacter` (§3.13); elliptic Greenberg specialization, control and CM inputs (§§4.1, 4.3); `iwasawaComplex_perfect_withPTorsion`, `iwasawaComplex_dualityTriangle` with the [−3] shift (§§4.5, 4.6); `realTateCorrection` (§4.8); the Deligne–Ribet construction and Wiles's theorem (§6.1); `finiteIntegralLog_exact` (§6.12); `cupTheta` (§7.1); Laurent order API (§7.5); `padicArtinL` (§7.11); `padicZeta_residue` (Colmez, §7.12); `cyclotomicHeight` (§7.17); period/regulator definitions (§7.18); `FittingOrder.integralClosure` (§7.19); Tau Ceti `fittingIdeal` comparison (§7.21).
- Checks: §0.3 (H = H′, index p), §0.4 (G = 1, C_p, C₂), §1.1 (p regular but not in S), §2.1, §2.3, §2.13, §3.3 (explicit −4/7 at p = 3), §4.2, §4.8, §5.1, §5.3 (complex conjugation does not give a p-adic equality; replaces main's claim that "the formalisation proves this agreement"), §5.5 (`wrong_sign` corrected: ζ⁻¹ has the opposite boundary and the reciprocal values), §6.1, §7.17.

Where the two sides touched the same statement, the stronger version was kept: main's ramified weighted graded ring (§0.8; codex restricted to unramified O), main's Layer 6 order, main's Γ*(−1) = −1 Lean example (codex replaced it by Γ*(−2), which does not test the residue sign), main's proved `of_sub_one_pow_char` (dropped by codex), and codex's correct `wrong_sign` and §5.3 checks. Codex's `grade_coefficientReduction` was not added: it is CompletedCohomologyPartII §5.5 (`iwasawa_grade_coefficient`, with finite-index invariance), now cited. Codex's 6.25 `rwUniformSmoothing` as an open obligation is replaced by the proof below. Nothing the review removed was restored (old §0.11 noetherianity stays deleted).

## Findings → changes

| Review defect | Change |
|---|---|
| 1. Noncommutative K-theory not supplied | §2.7 owns the Picard-valued determinant (virtual objects as π_{≤1} of the K-theory space of P(R), GeneralAlgebraicKTheory §§5.7, 5.10, 5.11, 6.19; Aut(1) = K₁ by §3.14 there and AlgebraicKTheory A2) with quasi-isomorphism, exactness, acyclicity, shift, cohomology and base-change properties, and proves the localized-K₁ comparison (Fukaya–Kato 1.3.7, cited via Burns–Venjakob p. 6). §2.8 proves the triple ↔ S-acyclic perfect complex comparison; §2.9 uses GeneralAlgebraicKTheory §4.17 (five-term exactness for any ring map, T dense up to summands) and proves the Ore verification of §6.3's hypotheses plus cofinality. §2.1 owns complete-ideal K₀ invariance by idempotent lifting. GeneralAlgebraicKTheory has no Ore theorem and no determinant functor (grep-verified). |
| 2. Homology / Euler characteristic / height | Compact homology, completed Tor, hyper-Tor and Shapiro are CompletedCohomologyPartII F.2 (PR #1035; verified); §0.15 adds the rational Tor and twist comparisons. §3.6 owns `gammaEulerChar` (proof by the structure theorem, PadicMeasuresIwasawaAlgebras §§4.2, 4.6) and `hochschildSerre_eulerChar`. §7.17 owns `cyclotomicHeight`, `cyclotomicHeight_eq_nekovar`, descent with the Υ-errors and `height_nondegenerate_iff_semisimple`. |
| 3. Weak Leopoldt | §4.4 `weakLeopoldt_overfield` (from #11255, with NSW added): for each finite L ⊂ E, L_cyc ⊆ E and NSW (10.3.25) p. 640 (with (10.3.22) p. 639 and the proof of (10.3.26) p. 641) gives H²(G(F_Σ/L_cyc), ℚ_p/ℤ_p) = 0; E = ∪ L_cyc and NSW (1.5.1) p. 45 pass to the limit. §4.5 applies it to E = F_∞; cd_p ≤ 2 kills H^{≥3}. |
| 4. Uniform smoothing | Ritter–Weiss Congruences II pick f from ε (§2, p. 6) and γ ≡ 1 mod f (Prop. 5), so g depends on ε (their p. 3 remark explains the special cusps avoid the U_β comparison at other cusps). Repair (§6.22 step 4, §6.24, §6.25, correction E41): take γ the unit idele (1 + p at p, 1 elsewhere); in Deligne–Ribet's decomposition M = M₁M₂ of diag(γ, γ⁻¹) (p. 262) the factor M₂ ∈ SL₂(O) can be taken ≡ diag(γ, γ⁻¹) mod f, so it lies in Γ₀(f), normalizes Γ₀₀(f) (a diamond operator) and commutes with U_β for β | f; hence U_β preserves the constant term at the cusp γ for every f, N((γ)) = 1, and Lemma 10's computation gives (4⋆) for the single g = Art(γ) (cyclotomic image (1+p)^{−[F:Q]}) and every ε. The same missing comparison underlies Kakde Props 113, 115–117 (E34 updated). **This is a new argument of this fix and the first thing the REV-FIX review should check**, in particular that U_β commutes with slashing by Γ₀(f) for DR's Γ₀₀(N; 𝔞, 𝔟) with β | f. |
| 5. Named contracts / tiers | Every cited roadmap is on TCR main or an open TCR PR (listed in Scope and References). Owned here (moved down): Deligne–Ribet rationality, Eisenstein series, q-expansion principle, Kummer congruences and pseudomeasure (§6.1 step 0, DR (0.4)–(0.5) p. 231, p. 232, §6 pp. 267–273); Wiles's theorem with its two divisibilities (§6.1; Wiles 1990 Thms 1.3–1.4 via Kakde p. 14); Σ-truncated Artin values at negative integers and inductivity (Layer 6 introduction, from AGR §2.7's finite-order Hecke functional equation and ANT Part I §2.18); Greenberg's p-adic Artin L-functions (§7.11); Colmez's residue formula (§7.12); finite Whitehead inputs `sk1_finite`, `sk1_semisimple_padic`, `dressWall_induction`, `sk1_vanish_p_elementary`, `k1_torsion_wall`, `k1_continuity` (§3.11, Oliver's numbers as Kakde cites them, pp. 19–28); p-valuations (§0.7); the Leopoldt statement is SelmerIwasawaCohomology §4.18; Weil–Deligne parameters are PadicHodgeTheory Layer 5. KTheoryLowDegrees (PR #1248) was checked: it has no SK₁/Oliver/Wall material. |
| 6. Source verification | Brumer (J. Algebra 4 (1966) 442–470; Deep Blue copy not downloadable) is cited through Venjakob 2002 §1.1 p. 5 (pd ℤ_p = cd_p G, gl.dim = cd_p G + 1) and proved in §0.11 for G without p-torsion (finite-index Ext comparison, Venjakob Thm 3.26 p. 18, and a Tor computation). Fukaya–Kato (not free) is cited only through Burns–Venjakob/Kakde restatements; each needed statement is an owned target (References paragraph). |

## Ownership moves for other planners

The following now live here and should be cited from here by higher roadmaps: Deligne–Ribet pseudomeasures and Wiles's normalized abelian theorem (§6.1) — AutomorphicPadicLFunctions L3 and IntegralIwasawaTheory I.5/I.9 should point here; Greenberg p-adic Artin L-functions and Colmez's residue (§§7.11–7.12); the noncommutative determinant functor (§2.7) — StableReduction's request; finite Whitehead inputs (§3.11) — KTheoryLowDegrees U.3/U.5 requests; p-valuations and the analytic structure (§§0.2, 0.7) — LocallyAnalyticDistributionsPartII ND.0; weak Leopoldt in cyclotomic overfields (§4.4). CompletedCohomologyPartII's packet references to NE noetherianity should point to its own §5.1 (unchanged recommendation of the review).

## Adversarial pass on touched statements

| Statement | Instances tried | Result |
|---|---|---|
| §0.2 analytic structure | finite G (U = 1, dim 0); ℤ_p; ∏ℕ C_p | analytic dims 0, 1; product excluded (no finite rank) |
| §0.4 radical/locality | G = 1; C_p; C₂ at odd p; C_ℓ, ℓ ≠ p | O local; (g−1)^p = 0 in k[C_p]; O×O not local; idempotent |
| §0.7 p-valuations | ℤ_p with 1 + v_p, 2 + v_p (odd p); p = 2 with 1 + v₂; element of order p; U = 1 | 1 + v_p saturated, 2 + v_p not (saturation p⁻¹ℤ_p); 1 + v₂ fails ω > 1; order p impossible; rank 0 |
| §0.11 gl.dim | G = 1 (dim 1); ℤ_p^d; ℤ_p × C_ℓ; C_p | 1; d+1; 2; ∞ excluded; Tor_{d+1}(𝔽_p,𝔽_p) ≠ 0 via two-row change-of-rings |
| §0.12 rational, O-coefficients | G = 1 (L, dim 0); ℤ_p | 0; 1 (not 0 of the fraction field) |
| §2.1 complete ideals | ℤ_p ⊃ pℤ_p; ℤ_p[C_ℓ]; ℤ_p[[T]] ⊃ (T); ℤ_(p)[T] ⊃ (T) | ℤ; ℤ^r; ℤ; excluded (I ⊄ Jac) |
| §2.8 triple ↔ complex | [Λ --s→ Λ]; its shift; P = Q, α = id | [Λ/Λs] = ∂s; negated; zero class |
| §3.6 Γ-Euler characteristic | Λ/(T−p); Λ/(T); Λ/(p); Λ/(p,T) | p; infinite (excluded); p = |p|⁻¹; 1 (pseudo-null, unit char.) |
| §3.11 SK₁ inputs | G abelian; cyclic P; D central division over ℚ_p | SK₁ = 1; 1; reduced-norm kernel = commutator subgroup |
| §4.5 weak Leopoldt | F_∞ = F_cyc; finite totally real L (excluded); X_Σ rank | NSW (10.3.25) directly; no claim; rank r₂ = 0 |
| §4.8 real correction | trivial ℤ₂ over ℝ; totally imaginary field; odd p | ℤ/2 in all even degrees (unbounded); empty sum; averaging kills positive degrees |
| §5.5 boundary sign | ζ vs ζ⁻¹ | opposite boundary, reciprocal values |
| §6.1 inputs | ℚ, Σ = {3}, k = 2; c = 1 smoothing; trivial character | L_Σ = 1/6, Eisenstein constant 1/12 (−1/24 untruncated); Δ₁ = 0; T-denominator kept |
| §6.22 unit cusp | γ = 1; γ ≡ 1 mod f; non-unit idele | standard cusp; RW special case M₂ = 1; not claimed |
| §6.24 uniform g | K = ℚ; growing conductors; RW's g_f | g acts by (1+p)⁻¹ at every level; RW's g_f → 1, so no compactness argument |
| §7.5 Laurent order | 3T⁻²(1+T); 1; T, T⁻¹; 0 | −2, 3; 0, 1; ±1, 1; excluded |
| §7.17 height | rank 0; rank 1 with b ≠ 0; rank 1 with b = 0 | det 1, r = 0; r = −1 / +1 after shift; degenerate, not semisimple |

## Sources read for this fix (all free; read as data)

NSW 2nd ed. electronic 2.3 (printed page = PDF − 26 near Chapter X, − 16 near Chapter I); Kakde arXiv:1008.0142v3 (Props 102, 111, 113, 115–117, Remark 112, pp. 19–28 Oliver citations); Ritter–Weiss arXiv:1001.2091v3 (whole paper); Deligne–Ribet scan from Ribet's page (printed = PDF + 225; pp. 231–232, 262 viewed as images); Venjakob arXiv:math/0106269v1 (§1.1 p. 5, Thms 3.26, 3.29, 3.30 pp. 18–20); Weibel K-book (III.3.2 is for central S only). Supplier READMEs fetched at the PR heads named above. Not obtained: Brumer 1966 (Deep Blue blocked), Fukaya–Kato 2006 and Oliver's book (not free) — cited only through restatements, as recorded in the README.

## Validation

- `lean-check research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/Suggested.lean`: exit 0, five `declaration uses sorry` warnings (lines 71, 96, 137, 162, 168), nothing else; 69 GB available. Lean changes: docstring and section renumbering, the closing inventory, and the two proved negative-control examples from #11255.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- Local README checks: layers have 15, 14, 15, 14, 8, 8, 36, 24 sequentially numbered subsections; every internal link resolves; no numbered *Needs:* line points forward; all 49 definition/construction subsections have at least three Checks; no `NE.` ids, local paths or placeholders remain.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: see the pull request.

## Residual risks for the REV-FIX review

1. The unit-cusp commutation (§6.22 step 4) — verify against Deligne–Ribet §5 (5.6)–(5.8) and the double-coset description of U_β.
2. The owned theorems of §§2.7–2.9 and §6.1 (Wiles) are stated with proof routes, not proofs; their routes use only the cited suppliers.
3. README size grew to about 470 KB because nothing from either side was dropped; the shape rule allows this.
