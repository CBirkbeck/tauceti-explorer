# Independent package review, second round: PeriodsAndSpecialValues

Job `REV-PKG-PeriodsAndSpecialValues~2`, issue #11114. Claude (Opus 5.5), session `claude-GCiG4Y`, 2026-10-19. The claim bot confirmed this session's claim on the issue. Base commit `18a056bdf` (origin/main). I did none of the package jobs (`PKG-PeriodsAndSpecialValues`, session `claude-RbFn0X`; `PKG-PeriodsAndSpecialValues~2`, session `codex-LACvMs`), nor the first review or the fixing job. This is a completed review, not a checkpoint.

**Verdict: accepted, with the corrections below.** The package's own content is now complete: every target has its statement, hypotheses, locators, proof route, API and Checks. The last owned blocker (the quintic comparison, R6) is closed by a sourced proof route, and its open integral question is now an explicit predicate. The remaining items are requirements on four other roadmaps. Each is stated accurately at the targets that use it, is never claimed as supplied, and is listed in the last section. As in the accepted second review of ClassicalSerreModularity, acceptance concerns the roadmap and its elaborating signatures; it does not discharge supplier requirements. Under the tier rule in WORKERS.md, those suppliers go upstream first.

## The six earlier blockers

| ID | Earlier finding | Disposition in this round |
| --- | --- | --- |
| R1 | Elliptic second-kind class, cycles and pairing | Closed by the fixing job; rechecked here. The substitutions give B = [[2K,2J],[2iK,2iH]] and det B = 4iK(H−J), and the expansion of x, ω, η at infinity in s = x/y is correct. |
| R2 | Comparison for arbitrary algebraic pairs (PS.2.1) | This requirement belongs to MotivesAndAlgebraicCycles, not to this package. MC.5's node `completion-de-rham-interface` is exactly this input contract, and MC.5 records its own supplier gap ("Arbitrary-pair multiplicative de Rham comparison needs an owner"). It cannot be planned here, because MC.5 sits below PS.2 and needs it too. PS.2.1 now consumes MC.5's contract, lists the properties it uses with HMS-book locators, and no longer carries a construction plan for another roadmap. HMS Corollary 2.11 (very good pairs generate P_eff) is added. |
| R3 | Noncommutative virtual-object category (PS.3.1, PS.5.1) | Inherited the same way. NoncommutativeAndEquivariantIwasawa's packet asks GeneralAlgebraicKTheory:K.4 for Deligne's Picard category with Burns–Venjakob's properties. PS.3.1 and PS.5.1 now state the category's contract (BF §§2.1–2.5) under the GAK supplier entry and name NE as a co-consumer. Process wording ("unregistered extension", "request") is removed. The finite-prime gluing of PS.5.1 is this package's own and was rechecked. |
| R4 | LTXZZ arithmetic (PS.6.6–PS.6.7) | The accepted routing of PAPER-LIU-ETAL-22, through the SelmerIwasawaCohomologyPartII split, assigns this to ArithmeticLevelRaisingAndBipartiteEulerSystems. PS.6.7 states the imported theorems with every LTXZZ hypothesis and loss, re-checked against the source (below). The unregistered "AL.0–AL.4" labels, which collided with AutomorphicLFunctionsAndLocalFactors, are replaced by the roadmap name. |
| R5 | Geometric K3 lattice | Closed by the fixing job (K3SurfacesAndSymplecticBoundedness `K3.0/cycle-lattice`, which exists and is accepted). The process sentences about "atlas design dependency" are removed. |
| R6 | Quintic Dwork–crystalline comparison and integral lattice (PS.8.17) | **Closed for the rational statement.** PS.8.17 is rewritten as a theorem: Dwork's normalized Frobenius is the geometric Frobenius on the punctured disc, with constant 1, and at λ=0 it is the log-crystalline Frobenius in the basis e_i. The proof route: the explicit residue isomorphism of differential modules (step 3); uniqueness of Frobenius structures on an irreducible connection, Kedlaya Lemma 2.3.6, with all four hypotheses checked for the quintic (step 4); the constant fixed by Park Proposition 5.2 at one good fibre; and uniqueness of the extension with nilpotent residue, using Kedlaya Lemma 2.3.8 and a short coefficient argument (step 5). The integral claim, that the e_i span the integral log-crystalline lattice, has no source and is now the predicate `QuinticBoundaryLatticeIntegral`, used only as a hypothesis. That matches the accepted plan, which made this target conditional on its gap G1. The general affine exponential comparison (Wan–Zhang, Li–Zhang, Peigen Li) is no longer needed and its request is removed. |

## Corrections applied

1. **PS.8.17 rewritten** as described for R6. Changes: new references Kedlaya (K) and Burns–Greither (BG); WZ, LZ and PL removed from References; the predicate added to "Theorems and predicates"; cross-references in PS.8.13 and PS.8.14 updated. Five new Checks: uniqueness fails on the formal disc, where horizontal endomorphisms are the polynomials in N; the pairing alone leaves c = ±1; the exponents at ∞ in z and in λ; the p = 3 valuation bound; and the conifold points at p = 5.
2. **A wrong valuation in the new step 6, caught in the adversarial pass.** Integrality of p³·24Δ₃/25 gives v_p(Δ₃) ≥ −3 only for p ≥ 7. At p = 3, v₃(24) = 1 gives v₃(Δ₃) ≥ −4, and the README's own test value Δ₃ = 25/648 has valuation −4. Both cases are stated and a Check added.
3. **PS.5.4, the abelian Tate case.** The README claimed that IntegralIwasawaTheory I.7 supplies the finite-level ETNC of Burns–Greither. It does not: neither the I.7 packet nor any IntegralIwasawaTheory layer states it. `abelianTate_ETNC` is now an explicit target. Its statement is from BF Remark 10, p. 537 (G = Gal(L/ℚ) abelian, r ≤ 0, order ℤ[1/2][G]); the restriction to Gal(L/K) is BF Theorem 3.1(b), p. 531, with Theorem 4.1, p. 539. Its proof descends IntegralIwasawaTheory §11.7 `integralDeterminantMainConjecture`, with the CM twist of §11.1, using Burns–Greither's leading-term and trivial-zero analysis. The supplier entry now describes Layer 11 accurately.
4. **NeronModelsAndSemistableAbelianVarieties.** The README cited "R11.5, node `strict-compatible-system-export`, with an unresolved G-strict-compatibility input". The node is in stage R11.6. The accepted package states it as Layer 6, §6.10 `StrictCompatibleSystemExport` and builds the coefficient-prime trace comparison and Saito's base change there. Citation and text corrected.
5. **IntegralHeckeAndGaloisDeterminants is a Tau Ceti roadmap** (it is on TauCetiRoadmap main). Cited as TauCetiRoadmap IntegralHeckeAndGaloisDeterminants, Layer 0, §0.6 (Azumaya reduced-norm determinant) and added to the Tau Ceti boundary list.
6. **Package layer numbers.** BorelRegulators stages R.3, R.4 and R.7 are package Layers 3 (§3.12), 4 (§4.10) and 8 (§§8.4, 8.6); package Layer 7 is a different topic. MotivicEtaleKTheory stage M.8 is package Layer 12 (§12.7); package Layer 8 is the coniveau tower. All citations now use the package numbering. The boundary-list header no longer says "Tau Ceti roadmaps" for BorelRegulators and EllipticRegulators, which are atlas roadmaps.
7. **MotivesAndAlgebraicCycles contract.** The README presented as supplied some things the MC packets do not state: modular eigenprojector motives in MC.2, and the Adams K-theory comparison and framed motives in MC.4. Artin motives are in MC.6, not MC.2. The contract now separates what MC states from what PS.1.6, PS.9.8 and PS.9.15 additionally require.
8. **AL.3 and EllipticCurves wording.** AL.3 is the general GL_n × GL_m Rankin–Selberg theory, specialized in PS.6.6. EllipticCurves Layer 7's BSD quotient is a stretch milestone of that layer, defined assuming Sha finite, with the real period of the global minimal equation counting both components.
9. **Process language removed** throughout the README and the Suggested.lean closing comment: "unregistered", "unresolved", "request", "proposed owner", "remaining supplier gap", "atlas design dependency", "obligations". Each was replaced by a timeless statement of what is required and who owns it. Other roadmaps' objects (`relativePairIntegration`, `virtualPerfectDeterminant`, `rankinAdmissible`, …) no longer appear in the Lean file's list of this roadmap's targets.
10. **Locators.** Shapiro §§3.1–3.2 is on pp. 3–4, not pp. 2–4. Hartmann Propositions 4.21–4.25 are on PDF pp. 18–20, not 19–21. HMS-book "Examples 14.5.7" is on p. 279.
11. **Clarity.** In PS.8.5 the period row is a row vector multiplied on the right by G₀M_γG₀⁻¹. With that convention (i, −1, −2) goes to (4+i, −1, 30+16i) under γ_∞, as the Check states; the column convention gives a different point.
12. **Suggested.lean.** Removed two `example`s about library objects only, which the 2026-10-19 rule forbids: an interval integral of the constant 1, and the determinant of a permutation matrix. Updated one docstring and the closing comment. The README API list for PS.7.1 now includes `legendre_endpoint_integrable`, which the Lean file states.

## Checks of PACKAGE_REVIEW.md

| Check | Result |
| --- | --- |
| 1. Quality bar | Pass. Read the full README (78 targets, each with a Checks block) and the complete current TauCetiRoadmap IntegralLattices and EllipticCurves READMEs as models. Form and density match: summary, scope and boundaries, conventions, exact supplier contracts, ordered layers with prose targets, examples and dependencies, corrections to sources, references. No planning residue remains (searched for process vocabulary after the edits). |
| 2. Sources | Pass after three locator corrections. A reproducible random sample of 15 targets, plus every locator introduced by the second package revision, re-read in the public sources (table below). |
| 3. Gaps | Pass, except the inherited supplier requirements listed at the end, which are stated at their targets. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` ids. The roadmap has no assigned place in the Caraiani–Newton tier map, so tier ordering imposes no upward-citation constraint here. |
| 4. Unit tests | Pass. Every definition-bearing target keeps at least three discriminating Checks; the rewritten PS.8.17 has 15. |
| 5. Lean | Pass. `lean-check` exit 0, 725 lines, 44 warnings, all `declaration uses 'sorry'`, no errors, at Mathlib 082e2d37e8 and the pinned Tau Ceti build. No sorry'd data (`scripts/check_sorry_data.py` passes). Ten signatures spot-checked against the README: `comparisonMatrix_det_basisChange`, `realGammaRegular_iff`, `gammaℂ_eq_two_mul_gammaComplexBCGP`, `quarticA_recurrence`, `quarticMonodromy_product`, `quarticMirror_integral`, `quinticBoundary_horizontal`, `quinticBoundary_pairing`, `dworkSigma2_summable` (the index shift matches σ₂) and `zagier_evaluation` (the range shift matches ζ({2}^{n−r})). Mathlib's `Complex.Gammaℂ` is 2(2π)^{−s}Γ(s), as the conventions say. |
| 6. Own words | Pass. No verbatim passages or section-by-section summaries; the new PS.8.17 text paraphrases Kedlaya and Park with locators. |
| 7. Intake | `intake.py check-files` on the three package files: 0 problems. `git diff --check` clean. |

## Source verification

Sample: `random.Random(11114).sample(targets, 15)` over the 78 subsection headings in README order selects PS.0.5, PS.1.2, PS.1.5, PS.2.1, PS.3.1, PS.3.2, PS.3.3, PS.4.2, PS.4.3, PS.5.2, PS.7.3, PS.9.6, PS.9.16, PS.9.21 and PS.9.23. I read every locator of these targets. I also read the Park, Shapiro, Qian and Schwarz–Shapiro locators added by the second revision, the LTXZZ and Bloch–Kato locators of PS.6, the Hartmann locators of PS.8, and the new Kedlaya and BF citations. All PDFs were public, downloaded to scratch, hashed and deleted afterwards; no cleared-library book was needed. Accessed 2026-10-19.

| Source | Locators confirmed | SHA-256 (prefix) |
| --- | --- | --- |
| Deligne, Ghate–Beineke translation | §0.4 p.4; §3.1 pp.13–14 (2πi, (3.1.3)); §5.1 pp.15–16; §§5.2–5.3 pp.17–18. Table 5.3's real-place factors match PS.1.2, including Γ_ℝ(s+ε−p) on a (p,p) block with F∞ = (−1)^{p+ε}. §§6.3–6.7 pp.20–22. | 08fbc56b |
| BF, Documenta 6 | Printed page = PDF page + 500. §2.1 p.504; §2.4 Remark 1 p.508; §2.5 pp.508–509; §3.2 Conjecture 1 p.519; (19)–(24) pp.520–521; §3.4 and (29) p.526 (the displayed Ξ matches the README factor by factor); Lemma 5 pp.526–528; Lemma 6 p.528; Conjecture 4 pp.535–536; Conjectures 5–6 p.536; Remark 10 p.537 (ref. [12] Burns–Greither, r < 1, ℤ[1/2][G]); Theorem 3.1(a)–(c) p.531; Theorem 4.1 p.539. | d9caa725 |
| HMS, arXiv v5 | Definition 2.8 p.10; Remark 2.9 and Theorem 2.10 pp.10–11; Corollary 2.11 p.11; Lemmas 3.1–3.2 p.12; Theorem 3.3 and Corollary 3.4 p.13. | e55d85bf |
| HMS-book draft | Printed page = PDF page − 22. Definition 3.2.6 and Lemma 3.2.7 p.78; Proposition 3.3.5 p.82; Definition 3.3.6 and Proposition 3.3.7 p.83; Corollary 4.2.7 p.97; Proposition 4.2.10 p.98; Definition 5.3.1 p.101; Theorem 5.3.3 p.102; Definition 5.4.1 p.103; Lemma 5.4.2 p.104; Theorem 14.5.3 p.277; Corollary 14.5.4 p.278; Theorem 14.5.6 and Examples 14.5.7 p.279. | 5310c170 |
| BCGP, arXiv v3 | Conjecture 1.1.1 pp.3–4; §2.8 p.35; Proposition 2.8.1 p.36; (2.8.4)–(2.8.5) p.37, with Γ_ℂ = (2π)^{−s}Γ(s) and the abelian-surface factor Γ_ℂ(s)²; Conjecture 2.8.6 and Corollary 2.8.7 p.38. | 7c8d74b0 |
| Serre, DPP exposé 19 | PDF page 2 is printed 19-01. §§3.1–3.3 p.19-10; §4.1 p.19-11; (26) and the definition of A p.19-12. | 7ed71db9 |
| Tate, *Number theoretic background* | p.15 (image page): (3.4.3) ε(V,ψ,r dx) = r^{dim V}ε(V,ψ,dx), which PS.7.3 uses; (3.4.4)–(3.4.7), including the contragredient identity PS.1.7 uses. | a79bd282 |
| Johansson, arXiv v1 | §2 "Algorithm and implementation" pp.2–3. | 64abe78c |
| IKZ, Compositio 142 | Printed page = PDF page + 306. §2 and Proposition 1 p.309; (2.1)–(2.2) p.310, with A(u) and ρ as in PS.9.6; Theorem 1 p.310; Theorem 2 and Conjecture 1 pp.314–315. | 0f2ca065 |
| Zagier, Annals 175 | Theorem 1 p.981. Zagier's ascending H(a,b) coefficient, with a and b exchanged, is the README's descending c(a,b,r); (5) p.979. | 28a98d96 |
| Brown, arXiv v1 | Theorem 1.1 and Corollary 1.2 p.1; Theorem 2.4 p.6; Lemma 2.5 p.7; Theorem 3.3 p.9; Lemma 3.8 p.10; Theorem 4.3 and Corollary 4.4 p.12; Lemma 5.5 p.13; Definitions 5.8–5.9 p.15; Theorem 6.1 p.16; Lemma 7.1 p.17; Theorems 7.3–7.4 p.18; Corollary 7.5 p.19. | e795b842 |
| Park, Nagoya Math. J. 254 | Printed page = PDF page + 419. (1.1) p.423; Theorems 1.1–1.3 pp.425–427; Lemmas 2.2–2.3 and Proposition 2.4 pp.430–431; Definition 3.1 p.433 (its sign and factorial specialize to the README display); Definition 4.8 and Remark 4.9 p.442; Theorem 4.11 p.443; Corollary 4.12 p.445; Remark 4.13 p.446; Proposition 5.2 p.449 (qΦ intertwined with Fr by ρ_S). | 0812392b |
| Shapiro, arXiv v2 | §3 begins p.3 (corrected); Definitions 4.1, 4.2 and 4.4 p.5; Lemma 4.8 p.6, whose s-relation gives δu_s = −(s+1)u_s − u_{s+1} for u_s = π^s ω_{0…0s}; Lemma 4.12 pp.8–9; Theorem 5.13 p.13; Definition 6.1 and Lemma 6.2 p.14; Lemma 6.3 and §§6.1–6.4 pp.16–17. | cc57d22b |
| Qian, arXiv v1 | Theorem 1.6 p.4; Lemma 2.1 and Remark 2.2 pp.4–8; Theorem 3.2 pp.14–15. | 87c4ee84 |
| Schwarz–Shapiro (SG), arXiv v5 | Lemma 4.11 p.22; Lemmas 4.14–4.15 p.26; Theorems 4.16 and 4.18 p.27; Lemma 5.6 p.30. | 7d35766f |
| LTXZZ, Invent. Math. 228 (NSF PAR copy) | Printed page = PDF page + 106. Definition 1.1.3 p.110; Theorem 1.1.5 p.111; Theorem 1.1.9 p.112; Proposition 3.2.4 p.145; Definition 8.1.1 p.303 ((L1) ℓ > 4n and ℓ unramified in F through (L7), as listed in PS.6.7); Lemma 8.1.6 p.306; Theorem 8.2.2 pp.308–313; Conjecture 8.3.1 and Theorem 8.3.2 pp.315–316. | dd821abd |
| Bloch–Kato, Festschrift I | Printed page = PDF page + 332. Theorem 4.1 p.362; Proposition 5.4 p.370; Definition 5.5 p.371; 5.5.1 and (5.6) p.372; (5.7)–(5.8) and Definition 5.9 p.373; Lemma 5.10, (5.11)–(5.13) and Proposition 5.14 p.375; Conjecture 5.15 and Remark 5.15.2 p.376. | ec89c643 |
| Hartmann, arXiv v1 | Propositions 4.1–4.4 p.11; Propositions 4.6–4.7 pp.12–13; Theorem 4.8 p.13; Theorem 4.10 p.14; Theorem 4.12 p.15; Corollary 4.13 and Proposition 4.14 p.16; Proposition 4.21 p.18 (corrected range); Propositions 4.24–4.25 p.20; Proposition 4.26 and Example 4.27 p.21; Theorems 4.28–4.29 p.22; Proposition 4.30 p.23; Theorem 4.37 p.24; Proposition 4.38 p.25. | 11e54e5e |
| Kedlaya, arXiv:1912.13073v3 (new) | Definitions 2.3.2–2.3.3 p.3; Lemma 2.3.6 p.4 (uniqueness up to scalar under hypotheses (a)–(d)); Remark 2.3.7 p.4; Lemma 2.3.8 pp.4–5 (holomorphic extension across a regular point with exponents in ℤ_(p)); Proposition 3.1.11 pp.9–10; Theorem 4.1.2 p.16; Remark 4.1.3 p.17; Example 4.4.1 pp.20–21 (the quintic parameters, p ≠ 2, 5, diagonal 1, p, p², p³ at λ=0). | 0e8374f0 |

Upstream supplier texts read through the GitHub API: TauCetiRoadmap main at `2b35f48395` (2026-10-19), SchemeAndStackFoundations §§1.17, 1.23 and 4.11 and `finite_quotient_coarse`; GeneralAlgebraicKTheory at PR #1212 head `67c1f583`, §§4.15–4.17 and §6.19 `gilletWaldhausen_general`. The local read-only checkout is dated 2026-10-11 and predates the merges of PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion and SchemeAndStackFoundations. `research/blueprint/upstream/tauceti_status.json` records them as merged, so the "TauCetiRoadmap" labels stand.

## Supplier citation audit

A Sonnet subagent mechanically compared every supplier citation with the atlas packages, packets and upstream READMEs. I checked each discrepancy it flagged myself before acting on it. Corrected: Néron R11.5 to Layer 6 §6.10; IntegralIwasawaTheory I.7 to Layer 11 plus an owned target; BorelRegulators and MotivicEtaleKTheory numbering; IntegralHeckeAndGaloisDeterminants as a Tau Ceti roadmap; the MC.2/MC.4 overstatements; AL.3 and EllipticCurves wording. Rejected as false alarms after checking: SchemeAndStackFoundations §§1.17/1.23/4.11 (present upstream; the atlas package numbers differently) and GAK §6.19 (present at the cited PR head). All other citations resolve: D7, SelmerIwasawaCohomology L2–L4 subsections, AL.1/AL.4/AL.5, AG2.5–AG2.6, DPL 0.4, WC.1–WC.2, ER.5, P.1, NC.2, R13.3, C5.1/C5.2/C5.6/C5.7, CAC §§7.10/7.60, StableReduction Layer 4, IntegralLattices 5H/6A, PMIA §5.1, EllipticCurves Layers 1/2/4/6/7, ModularForms Layers 0/8, AlgebraicTopology Stage 6, CR.5–CR.7 and CR.6.3, RankZeroOneBSD 13.18–13.23, CN.4, RD.1.46/RD.1.63/RD.3/RD.4.x/RD.7.1, EDC.2:pairings, NE.7, DM.8, K3.0 and GGP.8 nodes.

## Duplication against current Tau Ceti

TauCetiRoadmap main (`2b35f48395`, 103 roadmaps) has about fifty roadmaps newer than the local checkout. I read the ones nearest this package: DiophantineApproximationAndTranscendence, Completed/HodgeStructures, HeightsAndUnits, PadicFunctionalAnalysis, NewtonPolygons, RigidAnalyticGeometry, ComplexTori, EtaleCohomologyFoundations and ComplexKahlerGeometry. I searched by mathematical object: multiple zeta values, shuffle/stuffle, formal periods and Nori motives, Deligne's conjecture, Bloch–Kato and Tamagawa numbers, Artin–Hasse and Dwork, hypergeometric, Picard–Fuchs, mirror maps and Gauss–Manin. None states a target of this package. DiophantineApproximationAndTranscendence has Schanuel's and Nesterenko's statements, which are different from the Kontsevich–Zagier period conjecture of PS.7.4. HodgeStructures supplies the Hodge-structure prerequisites, which are consistent with the `TauCeti.Hodge.tate` usage. In Tau Ceti at a91d3aaf, `Shuffle.lean` is the Eilenberg–Zilber map on singular chains, not the word shuffle algebra. No determinant line, Dwork or MZV development exists. No target is removed.

## Adversarial mathematics pass

The rows cover the statements this round changed, and spot checks across the layers. "Kept" means no defect was found.

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| PS.8.17 step 6 consequence of integrality | p=3 versus p≥7; Δ₃=25/648 | **Fixed**: v₃(24)=1, so the bound is −4 at p=3 and −3 for p≥7. A Check was added. |
| PS.8.17 step 4, uniqueness (Kedlaya 2.3.6) | (a) residue disc of a good point; (b) conifold points −ζ/5 for p≠5 and for p=5; (c) exponents 0 at 0; 0,1,1,2 at the conifold points, from Σβ−Σα−1=1; 1,2,3,4 at ∞; (d) irreducibility after the degree-5 pullback by Clifford, since 5∤4 | Kept. Formal-disc non-uniqueness (centralizer of N is 4-dimensional) and the c=±1 pairing ambiguity were added as Checks. |
| PS.8.17 step 5, uniqueness of the nilpotent extension | λA′=AN₂−N₁A, so n·a_n equals a nilpotent operator applied to a_n | Kept: the a_n with n≠0 vanish. |
| PS.8.17 step 3, residue map intertwines δ | u_s↦(−1)^s s!r_s with δu_s=−(s+1)u_s−u_{s+1} and δr_s=−(s+1)r_s+(s+1)r_{s+1} | Kept; both recursions regenerate D and R exactly. |
| PS.5.4 abelian Tate case | r=0 and r<0; restriction ℤ[1/2][G] → ℤ[1/2][Gal(L/K)]; the dyadic part | Restriction holds because the larger order is free over the smaller (BF Theorem 3.1(b)). The 2-part is not claimed. |
| PS.5.1 multiplier independence | x=3 with λ=1 or 2; λ=−1 in a Hamilton component | Kept (valuations 0 at 2 and 1 at 3 either way). |
| PS.5.2 predicted order | M=ℚ(1): order −1 from H_f⁰(ℚ(0))=ℚ | Kept. |
| PS.4.2–PS.4.4 | [O→O] by π³ in degrees 0,1 and −1,0; Tate cohomology of C₂ with trivial and sign action; ℚ_p(1) tangent space | Kept. |
| PS.3.1 | ζ_F^*(0)=−hR/w for real quadratic F decides the exponent of H_f¹(M^∨(1))^*; BF (29) read in the source | Kept. |
| PS.1.2–PS.1.4 | Γ_ℝ(2)=1/π; ζ(2)/(2πi)²=−1/24; ℚ(0) critical set; Table 5.3 (p,p) entry | Kept. |
| PS.1.7–PS.1.8 | εε^∨=N from applying the equation twice; Poincaré duality pairing Λ_{2g−i}(s) with Λ_i(1+g−s) | Kept. |
| PS.2.2 heap convention | PQ⁻¹R versus RQ⁻¹P | Kept (3/2,1;1,1 versus 1/2,1/2;1/2,3/2). |
| PS.6 | n=2,3 dimensions and twists; loss thresholds m>5 and m>12; 11a1 L/Ω=1/5; LTXZZ (L1)–(L7) against p.303 | Kept. |
| PS.7.1 | D_λ ≥ (1−λ)(1+u²)² (the difference is λ(1−u²)²); |f′| ≤ 8/(1−λ)^{3/2}; midpoint error L/(4N); λ=0 and λ=1/2 values | Kept. |
| PS.8.5 dual action | row versus column convention at p=i | Kept as row vector; the wording now says so. |
| PS.9 | 01⧢01; regularizations of [1,1] and [1,2]; ρ(T²), ρ(T³); Zagier coefficients; weight-5 determinant 5/2; Hartmann 4.12 counterexample in U⊕U⊕⟨−6⟩ | Kept. |

An exact-arithmetic script (Python `fractions`, run in scratch) independently confirmed 32 computations:
- the five monodromy matrices preserve G₀, their product is 1, and (M_∞−1)² ≠ 0 = (M_∞−1)³;
- the dual actions at p=i;
- A_n, g_n, h_n and the recurrence;
- the coefficients of q and Z through order 8, all integral;
- 1/j = q − 744q² + ⋯ from E₄³/Δ, and P(1/j, Z) = 0 through q⁸;
- D, R, det D = 1, det R = 12, and the ranks modulo 3 and 7;
- NF = pFN and FᵀJF = p³J for several p and C;
- B_n and B_p = 1/p! + 1/p for p = 3, 5, 7, and the pair weights;
- the Zagier coefficients, and d_N equal to the number of {2,3}-words for N ≤ 15;
- the hypergeometric linear coefficients 12, 24 and 1/32.

These are sanity checks of stated numbers, not proofs.

## Requirements on other roadmaps before upstream submission

These are not defects of this package, and each is stated at the target that uses it:

1. **MotivesAndAlgebraicCycles MC.5**, input contract `completion-de-rham-interface`: the de Rham–Betti comparison for arbitrary algebraic pairs, which MC.5 itself records as needing an owner beyond ComplexComparisonPartII C5 (PS.2.1).
2. **GeneralAlgebraicKTheory Layer 4**: Deligne's Picard category of virtual objects over a noncommutative ring and its determinant functor on perfect complexes, which NoncommutativeAndEquivariantIwasawa also asks GAK K.4 for (PS.3.1, PS.5.1).
3. **MotivesAndAlgebraicCycles MC.2 and MC.4**: the rank-two eigenprojector motive of a newform with its Betti–de Rham comparison (PS.1.6); the rational motivic-cohomology/Adams K-theory comparison for number fields and relative-cohomology framed motives (PS.9.8, PS.9.15). These are open requests of the accepted PS plan.
4. **ArithmeticLevelRaisingAndBipartiteEulerSystems**, routed by the accepted PAPER-LIU-ETAL-22 result and not yet designed: LTXZZ admissibility, the diagonal Abel–Jacobi class and Theorems 8.2.2 and 8.3.2 (PS.6.7).

Untrusted text: none of the fetched papers, the other packages or the handoff notes contained instructions; nothing suspicious to report.
