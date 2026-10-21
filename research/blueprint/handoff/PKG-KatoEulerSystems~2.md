# PKG-KatoEulerSystems~2 — package revision, round 2

Issue #9178. Worker: Claude (Opus 5.5), session `claude-mQcYVT`, 2026-10-21. The claim bot
confirmed this session's claim before work began. This run takes no other job.

Deliverables changed: `research/blueprint/packages/KatoEulerSystems/README.md` and
`Suggested.lean`. `metadata.toml` (`topic = "math.NT"`) and `review.json` are unchanged; the
review object stays in place for the next reviewer. No packet, reader or other package was
edited. This revision starts from the package on main (`edefab064`); the two unmerged Codex
draft checkpoints (#9497, #10259) were not used as inputs.

## What changed, in one paragraph

Since the first package, the upstream port of `PadicFamilies` (TauCetiRoadmap PR #1019, tier 16
in the Caraiani–Newton order) has taken Kato's finite-level construction into its own §4.0:
theta unit, smoothed Siegel units, ordered Beilinson symbols with transfers and Chern images,
`modularZeta` with all its norm relations (§4.0.1), the three-branch explicit reciprocity law
including the comparison over the completed modular function field with finite p-basis, i.e.
Kato §10–11 and the square (10.9.5) (§4.0.2), and the rational cyclotomic bound for all
eigenforms with the CM case through elliptic units, its integral form under the `SL₂(ℤ_p)`
image, and the ordinary Selmer bound (§4.0.3). PROTOCOL §15 counts our open upstream roadmap
PRs as existing work, and KatoEulerSystems is outside the 94 (higher than PadicFamilies), so
this package now builds on PadicFamilies §4.0 instead of planning those targets again. Every
supplier row of the independent review is now either supplied by an exact section of an
existing roadmap (checked) or planned here as a target with sources; no supplier contract is
left as an unowned requirement.

## Targets removed (owned elsewhere) and their owners

| Old § | Old target | Now |
| --- | --- | --- |
| 0.1 | normalized theta unit | PadicFamilies §4.0.1 (`thetaUnit`) |
| 1.1 | Beilinson element | PadicFamilies §4.0.1 (ordered symbol, products, transfers) |
| 1.4 | Chern/Kummer normalization | PadicFamilies §4.0.1 (Chern image = Kummer cup) |
| 1.5 | étale Chern moment | PadicFamilies §4.0.1 (`modularZeta_moment`) |
| 1.6 | Hecke/diamond equivariance | PadicFamilies §4.0.1 (`modularZeta_hecke`) |
| 2.1 | S-integrality of the cyclotomic limit | SelmerIwasawaCohomology §3.5(iii) (universal norms unramified away from p) |
| 2.2 | geometric p-adic zeta classes | PadicFamilies §4.0.1 (`modularZeta`, `_norm`, `_trace`) |
| 3.4 | generalized explicit reciprocity | PadicFamilies §4.0.2 (`modularZeta_explicitReciprocity`, (10.9.5), finite p-basis) |
| 7.5 | ordinary modular Selmer divisibility | PadicFamilies §4.0.3 (`classicalOrdinarySelmer_torsion` and the good-period bound) |

## Renumbering (for consumers)

Old → new: 0.2→0.1, 0.3→0.2, 0.4→0.3, 0.5→0.4, 1.2→1.1, 1.3→1.2, 2.3→2.1, 2.4→2.2, 2.5→2.3,
3.1→3.1, 3.2→3.3, 3.3→3.4, 3.5→5.6, 4.1–4.4 unchanged, 5.1–5.4 unchanged, 6.1→6.2, 6.2→6.4,
6.3→6.5, 6.4→6.6, 7.1–7.4 unchanged, 7.6 unchanged, 7.7→7.8. New: 3.2, 4.2a, 4.5, 4.6, 4.7,
5.5, 6.1, 6.3, 7.5, 7.7. Consumers that must be repointed (atlas packages; no upstream PR cites
Kato): AutomorphicCongruences (§2.2 → PF §4.0.1; §3.4 → PF §4.0.2; §7.5 → PF §4.0.3; §2.4 → §2.2,
§2.5 → §2.3), ModularIwasawaMainConjectures (§2.4 → §2.2, §3.2 → §3.3, §3.4 → PF §4.0.2, §6.1 →
§6.2, §6.2 → §6.4, §7.5 → PF §4.0.3), RankZeroOneBSD (headings "Geometric p-adic zeta classes"
and "Generalized explicit reciprocity" → PF §§4.0.1–4.0.2; "Rank-zero upper bound for the elliptic
p-part" is now §7.8), HeegnerPointEulerSystems (L4/ordinary-selmer-divisibility → PF §4.0.3),
EllipticRegulators (§§0.1–0.5 → PF §4.0.1 and §§0.1–0.4 here; its cite of §7.6 for an Eisenstein
cusp-divisor fact was already wrong), CompletedCohomologyAndLocalGlobalCompatibility (L2 → §2.3),
EulerSystemsAndKolyvaginSystems (L4 → §§4.2–4.3), and the atlas PadicFamilies package (L1–L3 →
its own upstream §4.0).

## The review's fourteen rows

1. Big-local-field reciprocity / 10.9.5 — PadicFamilies §4.0.2 owns it (with the finite p-basis
   comparison). PadicHodgeRegulators "D.2" is the syntomic regulator (its Layer 4) and never
   contained it.
2. Early CM structure — PadicFamilies §4.0.3 (elliptic-unit argument, every eigenform). The
   atlas-only `CMAllPrimeMainConjectures` (draft) is not cited.
3. Nonsplit image — resolved mathematically, see "Source corrections": Kato 12.8.2 is false at
   coefficient places over ramified places of Momose's algebra B. New §4.1 defines *admissible*
   pairs (CM, or Kato 13.4(v)), proves admissibility at every λ over a split place of B (all
   but finitely many λ; every λ without inner twists; every p for elliptic curves), and the
   statements resting on Kato 12.4 assume admissibility. The theorem at a division place is
   not claimed.
4. Open-curve comparison — étale side: ModularCurvesPartII §§14.1–14.4, 14.8, 14.9a, 14.12
   (H² vanishing from §14.4 + §14.9a); the de Rham filtration identification is target 3.1
   (`modularFiltration_identify`, Kato 9.2–9.4 via §11.3–11.4); the modular dual exponential is
   PadicFamilies §4.0.2.
5. Full-level moment — CompletedCohomologyAndLocalGlobalCompatibility §2.6 (its third Check
   states the integral twisted map used here).
6. Global modular complex — étale/Galois model SelmerIwasawaCohomology §3.15 (via PF §4.0.1);
   strict H² kernel is new target 4.2a; rank one is 4.4 (SIC §3.13 for odd p, Tate's Euler
   characteristic rationally at 2).
7. Parabolic injectivity (Nakamura Lemma 3.4) — new target 5.5 (Fukaya–Kato route), with the
   admissibility of the newform constituents as hypothesis; the characterization moved to 5.6.
8. Global/local twist square — new target 4.6 (SIC §3.7 has the twist, not localization).
9. Period dictionary — new target 6.3 against ModularSymbolsPadicLFunctions §§1.1–1.3, 2.5.
10. De Rham/integral ordinary regulator — new target 6.1 (Kato 16.4, all p, de Rham), proof route
    via Kentaro Nakamura arXiv:1201.6475 Thm 1.5 and Colmez 1998 Thm 7, crystalline case PHR
    §9.35. The integral ordinary image (Kato 17.5–17.10) was only needed for old 7.5, now
    PadicFamilies §4.0.3.
11. Dyadic regulator — covered by 6.1 (all p) and PHR §§9.31–9.35 (allow p = 2).
12. Integral elliptic control — new targets 7.5 (formal-group universal norms) and 7.7 (control,
    divisibility by `(1 − α^(−1))²`); Greenberg's criterion is SIC §3.20.
13. Full-algebra finite support — new target 4.5 (two Lean milestones).
14. Critical arithmetic family — 6.5 is stated as a conditional implication; no endpoint depends
    on it.

Further requests in the plan: two-index K₂ transfers (target 1.1's `k2ProjectionFormulaNorm`,
Weibel K-book III 1.7.1 and Ex. 5.6, plus SKO §§2.2–2.4 and MCPII level maps); Kato's Eisenstein
series (new target 3.2 — ModularForms Layer 0 does not have `E^h_(α,β)`, `F^h_(α,β)`); the real
regulator and the operator-valued zeta function (target 3.4, defined explicitly as in Kato
2.5–2.10); elliptic Serre exports (new target 4.7).

## Source corrections recorded in the README

- Kato 12.8.2 (p. 223) is stated for every λ; at λ over a place where Momose's B is a division
  algebra, `ρ(H) ⊂ B^×` contains no nontrivial element with a fixed vector (Loeffler,
  arXiv:1411.1789, Thm 2.2.2; B can ramify above primes dividing `2N·disc`). Rubin's draft
  III.5.8 has the same scope for elliptic curves only, where it is correct.
- Kato Thm 2.6 (p. 127) is `reg(z_(M,N)) = lim s^(−1) Z_(M,N)(s) · 2πi · (δ_(M,N))^−`; the old README
  dropped `2πi` and the minus projection (checked on the page image).
- Kato 16.4(ii) (p. 270) writes `η′ ∈ D_crys(V_(F_λ)(f))`; it should be `D_crys(V*(1))`. Its Euler
  factor is `(1 − p^(r−1)φ^(−1))` (checked at 220 dpi; it matches 16.2(ii)).
- Round 1 printed the `r = k−1` zeta form as `E^(k−r′)_(1/M,0) F^(r′)_(0,1/N)`; Kato 4.2, p. 142
  (page image) has `E^(k−r′)_(1/M,0) E^(r′)_(0,1/N)`, which 3.3 now uses.
- Rubin's draft III.5.8 asserts `H¹(ℚ(E_(p^∞))/ℚ, E_(p^∞)) = 0` for surjective `ρ_(E,p)`; 4.7
  uses it only for odd p (round 1 recorded a nonzero class for `GL₂(ℤ/4)` at two).
- Nakamura's proof of his Theorem 5.2 cites Kato "Theorem 12.4(4)", which is 12.5(4); his
  Conjecture 5.1 is Kato's Conjecture 12.10.
- Kept from round 1: the square in Kato 1.9, the integral modules in 12.5(4) and Nakamura's
  `d²` (p. 267).

## Upstream notes for the maintainer

- PadicFamilies §4.0.3 (PR #1019) asserts the rational bound and module structure for every
  classical eigenform and every coefficient place; for non-CM forms at places over ramified
  places of B this rests on Kato 12.8.2 and is not established. It should carry the admissibility
  hypothesis of Kato §4.1 or an argument for elements outside H.
- PadicFamilies §4.0.2 cites `AlgebraicModularFormsAndSerreWeights` §R15.5A.1 for the filtered de
  Rham realization and `ModularForms` Layer 0 for Kato's normalized Eisenstein series; I found no
  §R15.5A in the atlas package, and ModularForms Layer 0 has only Eisenstein series with character.
  Kato §3.2 here now plans those series, but PadicFamilies (lower tier) cannot cite it.
- KatoEulerSystems is outside the 94 and must follow its suppliers upstream: PadicFamilies #1019,
  SelmerIwasawaCohomology #869, ArithmeticGaloisDuality #858, EulerSystemsAndKolyvaginSystems
  #1272, ModularCurvesPartII #913, SchemeKTheoryOperations #1229, K2SymbolsBrauer #1302,
  AutomorphicGaloisRepresentations #1007, ModularSymbolsPadicLFunctions #968,
  CompletedCohomologyAndLocalGlobalCompatibility #1270, CompletedCohomologyPartII #1035, and the
  atlas packages PadicHodgeRegulators and MotivicEtaleKTheory (the latter only for a remark in
  3.4).
- RankZeroOneBSD expects four "KatoEulerSystems extension" contracts (allPrimeRankZeroSelmer =
  Kato §14.2 at all λ incl. CM, finiteLevelIntegralUpperBound, ordinaryBSTWComparison,
  wuthrichIntegralComparison) that neither the plan nor this package contains; they need an
  owner decision. ModularIwasawaMainConjectures cites §§6.1–6.2/7.4 for supersingular `a_p = 0`
  data that they do not cover. AutomorphicCongruences' `katoIntegralBound_im` uses the integral
  clause of §4.3 (free rank-one τ-quotient), which this revision keeps.

## Checks run

- `lean-check research/blueprint/packages/KatoEulerSystems/Suggested.lean`: exit 0; the only
  warnings are 8 `declaration uses sorry`. 292 lines, 21 declarations (12 real-bodied
  definitions/theorems with proofs, 8 sorry'd milestones), 15 proved `example`s, `import Mathlib`
  only. The file was rewritten to the 2026-10-19 rules (no sorry'd examples, no stand-in maps).
- `python3 research/blueprint/intake.py check-files` on the three package files and this note:
  0 problems. `scripts/check_sorry_data.py`: no output. The gate's `mech_check.py`: README
  identifiers absent from Lean 0, round-named labels 0, empty sections 0.
- Sonnet cross-checks: supplier § citations (607 citations, 163 distinct sections, none missing;
  §§4.6–4.7 of MCPII trimmed as loose); two whole-README proofreads and an old→new fidelity diff
  of every kept target. Their findings were applied: restored hypotheses and locators that the
  rewrite had dropped, nine edits and the 16.4(ii) factor. The diff confirms that every kept
  target keeps its hypotheses and Checks, except where a statement now carries the admissibility
  hypothesis (4.4, 5.x, 7.1–7.2) by design.
- Script checks: no `*Needs:*` line cites a later target of this roadmap (4.3's use of the
  strict-H² kernel is why that target is numbered 4.2a).
- Sources read for this round: Kato 2004 (Numdam PDF, sha `3c6e14b1…`; pp. 121–143, 221–234,
  250–271 checked, page images for pp. 127–128, 130, 142, 163, 270); Nakamura arXiv:2006.13647 v2
  (Lemma 3.4, Cor. 3.6); Kentaro Nakamura arXiv:1201.6475 v2 (Thm 1.5); Loeffler arXiv:1411.1789;
  Rubin 1999 draft (III.5, pp. 49–54); Weibel K-book Ch. III (Cor. 1.7.1, Ex. 5.6).

## Where to resume

Nothing in the package is left as a requirement on an unnamed supplier. A reviewer should
check the new targets 3.2, 3.4, 4.1, 4.2a, 4.3 (the Kato→Rubin implication and the pro-p orbit
argument), 4.5, 4.6, 5.5, 6.1, 6.3, 7.5 and 7.7 against their sources, and decide whether the
PadicFamilies §4.0 ownership is to stand (if PR #1019 drops §4.0, the removed targets can be
restored from `git show edefab064:research/blueprint/packages/KatoEulerSystems/README.md`).
