# FIX-PKG-KatoEulerSystems~adv — handoff

Issue #11543. Worker: Claude (Opus 5.5), session `claude-H833eD`, 2026-10-21. The claim bot
confirmed this session's claim before work began. Base: `origin/main` at `64824f2d6`, after the
round-2 package review (#11545, REV-PKG-KatoEulerSystems~2) merged at 03:49Z.

Deliverables changed: `research/blueprint/packages/KatoEulerSystems/README.md`, `Suggested.lean`,
`review.json`, and this note. No packet, reader, other package or `metadata.toml` was edited.

## Inputs

The stall detector created this job because `review.json` still held the first review's
`needs_changes` verdict (2026-10-10). The file `reviews/REV-PKG-KatoEulerSystems~adv.md` named in
the issue does not exist. The findings are therefore those of `reviews/REV-PKG-KatoEulerSystems.md`
(round 1) and `reviews/REV-PKG-KatoEulerSystems~2.md` (round 2, accepted with corrections, merged
during this job). Between the two, PKG-KatoEulerSystems~2 (#11534) rebuilt the package on
`PadicFamilies` §4.0.

## Finding → disposition

Round 1, the fourteen supplier rows. All are resolved in the files; I re-read each section.

| Row | Now |
| --- | --- |
| 1 Big-field reciprocity, (10.9.5) | `PadicFamilies` §4.0.2 (supplier contract; PR #1019 head `f9ad8cc` read) |
| 2 Early CM structure | `PadicFamilies` §4.0.3 elliptic-unit clauses; 4.1, 4.4 |
| 3 Nonsplit image | 4.1: admissible pairs; Kato 12.8.2 scope correction; statements assume admissibility |
| 4 Open-curve comparison | `ModularCurvesPartII` §§14.1–14.4, 14.8, 14.9a, 14.12, and 3.1 |
| 5 Full-level moment | `CompletedCohomologyAndLocalGlobalCompatibility` §2.6 (2.3) |
| 6 Global modular complex | `SelmerIwasawaCohomology` §3.15, targets 4.2a and 4.4 |
| 7 Parabolic injectivity | target 5.5 |
| 8 Twist/localization square | target 4.6 |
| 9 Period dictionary | target 6.3 |
| 10–11 De Rham and dyadic regulator | target 6.1 (all p), `PadicHodgeRegulators` §§9.31–9.35 |
| 12 Integral elliptic control | targets 7.5, 7.7 |
| 13 Full-algebra finite support | target 4.5 (both Lean statements checked true) |
| 14 Critical family | 6.5 is a conditional implication; nothing depends on it |

Round 1's seven applied corrections are present: separate prime sets (1.1 with the
`(2,3) → (6,9)` control), regular-scalar torsion-freeness (Conventions, 4.4 Check), the §13.1 /
Example 13.3 and Corollary A.5 locators (2.1, 5.4), the explicit-reciprocity source (now owned by
`PadicFamilies` §4.0.2), the 7.1 dependencies, and the Kummer-map attribution (supplier
contract).

Round 2's seventeen corrections were each found in the files: `M, N ≥ 2` in Layer 1; the explicit
`Y(Mℓ,Nℓ) → Y(M,N)` transfer in 1.2; `N^(−k)` forward and `N^(k−2)` inverse in 3.2 with the
composite Check; the p. 143 smoothed-F locator; the corrected Checks in 6.1 and 6.6; 4.2a against
`X_∞` up to finite modules; the contained-cyclotomic CM fields in 4.4; the Fricke pairing at
`AutomorphicGaloisRepresentations` §1.5; `EulerSystemsAndKolyvaginSystems` §§2.1 and 2.5 with
Shapiro in 4.3; `SelmerIwasawaCohomology` §2.12; p odd in 7.4 and 7.6; `ModularForms` Layer 9;
the Downstream consumers; the Lean over coefficient fields.

## Changes made by this fix (independent adversarial pass)

1. **4.2a, false Check.** It said the local `H²_Iw` terms vanish when the dual has no
   `G_(ℚ_v)`-invariants. By local duality `H²_Iw(ℚ_v,T)` is dual to the invariants of `T^∨(1)`
   under `G_(ℚ_v(μ_(p^∞)))`. Counterexample: for p odd and `T = ℤ_p(2)`, `(ℚ_p/ℤ_p)(−1)` has no
   `G_(ℚ_p)`-invariants, but `H²_Iw(ℚ_p, ℤ_p(2)) ≅ ℤ_p`. The Check now states the right
   condition with this counterexample.
2. **7.2, overstated local term.** Kato 12.5(3), p. 222, and its proof 13.13, pp. 233–234 (read
   on the page), say only that a nonzero local term forces (12.5.1), and that it then has length
   one. The README said the term has length one in every (12.5.1) case. Nonsplit multiplicative
   reduction is a counterexample: the unramified quadratic character of the Tate parametrization
   is nontrivial on `G_(ℚ_p(μ_(p^∞)))`, so the term is zero. The text and the counterexample are
   now in 7.2.
3. **4.2, wording.** "The other noncritical values follow by the functional equation" now says
   that the values at `r = 1` for `k ≥ 3`, for χ ramified at p, follow by the functional equation
   relating `L(f*,χ,1)` and `L(f,χ^(−1),k−1)`.
4. **Conventions, Frobenius witness.** The geometric-Frobenius normalization of `V(f)` is now
   stated with Kato (14.10.3) and (14.10.1), pp. 240–241. I derived the arithmetic-Frobenius
   polynomial from it and checked that it gives 2.1's factor after the twist `k − r`. The witness
   is `k = 2`, `ℓ = 3`, `a = 2`: the arithmetic polynomial is `1 − (2/3)t + (1/3)t²` and the
   geometric one `1 − 2u + 3u²`; confusing them turns 2.1's factor into `1 − 2X + 3X²`.
5. **7.4, generality at p = 2.** Kato Theorem 17.4(1)–(2), p. 273 (read on the page), has no
   parity condition. `PadicFamilies` §4.0.3 states the rational ordinary bound for every p. 7.4
   now records the good-ordinary `p = 2` case (torsion, and `char(Z_∞) | 2^t L_E Λ`) as the
   weight-two case of that supplier, with the passage between Δ-invariants and coinvariants and
   the period constant of 6.3. The multiplicative case and the exact divisibility at `p = 2`
   still have no supplier. The 7.4 *Needs* line gains 6.3, `PadicFamilies` §4.0.3 and
   `SelmerIwasawaCohomology` §4.26. The supplier contract for `PadicFamilies` §4.0.3 now says
   "every p" for the rational bound.
6. **New target 7.9, Kato §14.** The README excluded "the finiteness of Bloch–Kato Selmer groups
   of Kato's §14" and named no owner. A grep of every atlas package and packet, of TauCetiRoadmap
   main (`0d144d04`) and of the Tau Ceti library finds no owner of Kato 14.2–14.5. RankZeroOneBSD
   requests it from this roadmap as its `allPrimeRankZeroSelmer` contract. Kato §14 is Kato's
   own application of the zeta elements, and its proof (14.13) uses 12.5(3), which is 7.2 here,
   so it belongs in this roadmap. The new target 7.9 has five parts:
   - `blochKatoSelmer_finite` (Thm 14.2, p. 235), stated for pairs *admissible over K*. The
     admissibility of 4.1 passes to abelian K and to the twists. Almost-all vanishing is claimed
     only for non-CM forms; for CM forms it is Kato 15.23, p. 267, through Rubin's main
     conjecture, which this roadmap does not plan.
   - `abelianBlochKatoComparison` (Bloch–Kato Example 3.11; the abelian-variety form of
     `SelmerIwasawaCohomology` §4.26).
   - `modularAbelianVariety_selmer_finite` (Cor 14.3, pp. 235–236).
   - `modularAbelianVariety_cyclotomicFG` (Thm 14.4, p. 236). Its proof uses Ribet's torsion
     theorem, Rohrlich's nonvanishing (4.2(2)) and the descent of 7.3.
   - `katoTamagawaBound` (Thm 14.5, pp. 236–237).
   The proof sketch follows Kato 14.6, 14.11–14.14 and 14.16–14.22; every page locator was
   checked against the page headers of the Numdam text. Two source slips are recorded: 14.5(3)
   prints "(12.5.1) in Thm. 12.5 (4)" for the image condition (12.5.2), and 14.13, p. 242, writes
   the period of z as `L_({p})(f,k−r)γ^±`, while 12.5(1) gives `(2πi)^(r−1) L_({p})(f*,k−r)γ^±`
   (the same vanishing). 7.3 notes that it is the case `m = p` of 14.4, which also covers CM
   curves.

   Other places updated for 7.9:
   - the Summary, Scope ("owns" and "Not in this roadmap") and "How to read the build";
   - the supplier contracts: `SelmerIwasawaCohomology` §§2.12a, 4.9, 4.26;
     `AutomorphicGaloisRepresentations` §6.1; `ModularCurvesPartII` §16.2; and a new
     `HeightsRationalPointsAndObstructions` §1.7 (PR #1017) for Mordell–Weil of abelian
     varieties;
   - the Layer 7 Examples and Dependencies, the Downstream consumers and the References (Bloch–Kato
     1990, Fontaine–Messing 1987, Ribet 1981, Rohrlich 1984, Diamond–Shurman Thm 6.6.6, Ribet
     1980);
   - the Lean closing list.
7. **Lean.** The closing list names the five 7.9 targets; their carriers (Bloch–Kato Selmer
   groups) are not at the pins. The `ordinaryEulerFactor` docstring now says `α ≠ 0` and records
   the junk value 1 at `α = 0`. No declaration changed.

## Sonnet cross-check of the new and edited text

A Sonnet agent compared 7.9, the edited passages of 7.2 and 7.4 and the Conventions witness with
the Kato text (Numdam OCR plus page headers), with 7.9's internal references, and with the cited
supplier sections. It found no sign, exponent or page error in the new statements. I checked
each of its flags on the page and fixed the following:

- 7.9 now cites Lemma 14.7 (p. 238, homothety of all stable lattices for almost all λ), which
  the almost-all vanishing needs.
- 7.9 says that in (2) only the twist `f_χ` enters.
- 7.9 works with Kato's group `S(T) ⊃ Sel(T)` of 14.8 (pp. 238–239).
- 7.9 records that the Poitou–Tate sequences (14.9.1)–(14.9.4) (pp. 239–240) are exact only up
  to multiplication by 2 at `p = 2`, which does not affect finiteness.
- 7.9 now cites `SelmerIwasawaCohomology` §§2.19–2.20 with §4.9 for Poitou–Tate with Bloch–Kato
  conditions, instead of the finite-module `ArithmeticGaloisDuality` §R02.4.3.
- 7.9 says §4.9 gives the conditions at the finite places, and that the p^∞-Selmer group is the
  direct limit of the `[p^m]`-Selmer groups of §2.12a.
- The Conventions witness notes `ε(ℓ) = 0` for `ℓ | N`, and the (14.10.3) page is now p. 240.
- 12.5(3) is cited at p. 222, and 7.4 also cites 17.2 (pp. 272–273).

Its remark that the abelian-variety extension of §4.26 is "unverified" is the point of the
maintainer note below.

## Adversarial pass table (statements touched or re-derived)

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 2.1 Euler polynomial | geometric vs arithmetic Frobenius from (14.10.3); `k=2, ℓ=3, a=2, ε=1` | consistent | convention and witness added |
| 4.2 nonvanishing | `k=3,4`; `r = k−1` vs `r = 1`; FE `L(f*,χ,1) ↔ L(f,χ^(−1),k−1)` | sentence garbled | reworded |
| 4.2a Check 2 | `T = ℤ_p(2)`, p odd: no `G_(ℚ_p)`-invariants, but tower invariants are everything | false | replaced |
| 4.5 Lean statements | `μ = p`; dimension-one `ℤ/p`; height-one prime over μ and p is associated | true as written | none |
| 4.7 dyadic remark | `H¹(GL₂(ℤ/4),(ℤ/4)²)`, plain-Python cocycle count: `|Z¹| = 32`, `|B¹| = 16` | `ℤ/2`, remark correct | none |
| 7.2 local term | split vs nonsplit Tate curve over `ℚ_p(μ_(p^∞))` | nonsplit gives 0 | text corrected |
| 7.3 at p = 2 | ESKS §4.17(b),(c) hypotheses (any p under `Hyp(K,V)`) | supported | none |
| 7.4 at p = 2 | Kato 17.4(1)–(2) on the page; PF §4.0.3 text | rational bound holds | p = 2 sentence added |
| 7.9 local term at 𝔭 | `r = 2` gives `ker κ^(−2)`, which has the exceptional shape; (12.5.1) needs `k = 2`, hence `r = 1`, `ker κ^(−1)` | vanishes | argument written accordingly |
| 7.9 L-value | `r < k/2` ⇒ `k − r ≥ (k+1)/2`; `r = k/2` central with the hypothesis; Euler factor at p by purity | nonzero | none |
| 7.9 [M : z] | `M = O`, `z = p^(−1)` gives `[O : pO]^(−1) < 1`; torsion in M would spoil this, excluded by residual irreducibility | consistent | Check added |
| 7.9 at k = 2, 3 | positive-rank elliptic curve (`L(E,1) = 0`, infinite Selmer); weight three needs no hypothesis | consistent | Checks added |
| 7.9 cyclotomicFG | `m = 1` is Mordell–Weil; the Galois group of `ℚ(ζ_(m^∞))` is topologically finitely generated, so the e-th powers are open | consistent | Check added |
| Lean (8 milestones) | each re-derived: unipotent/diagonal fixed spaces, division-algebra kernel, antitone filtration, Bernoulli, Euler constant term, two finite-support statements | true | none |

## Notes for the maintainer

- **RankZeroOneBSD's four "KatoEulerSystems extension" contracts.**
  - `allPrimeRankZeroSelmer` is now met by 7.9 (`modularAbelianVariety_selmer_finite`), with
    `SelmerIwasawaCohomology` §4.26 identifying the Bloch–Kato and classical Selmer groups at
    every place. This gives finiteness at every p, including CM curves and `p = 2`, and vanishing
    for almost all p for non-CM curves. For CM curves the almost-all vanishing is Kato 15.23,
    through Rubin's main conjecture; that belongs to the CMAllPrimeMainConjectures direction, not
    here. RankZeroOneBSD's README (not a deliverable of this job) should point the contract at
    7.9.
  - `finiteLevelIntegralUpperBound` (JSW 7.2.1), `ordinaryBSTWComparison` (BSTW) and
    `wuthrichIntegralComparison` (Wüthrich) come from other papers, not from Kato's. They still
    need an owner decision; RankZeroOneBSD or a Part II is the natural home.
- **SelmerIwasawaCohomology §4.26** is stated for elliptic curves, but its proof is written with
  abelian-variety suppliers. If upstream generalizes it to abelian varieties,
  `abelianBlochKatoComparison` in 7.9 becomes a citation.
- **Still open from round 2:**
  - `PadicFamilies` §4.0.1 (PR #1019) states the Beilinson symbol for `M, N ≥ 1`; Kato needs
    `M, N ≥ 2`.
  - `PadicFamilies` §4.0.3 asserts the rational bound at every coefficient place; at places over
    a ramified place of Momose's algebra this rests on Kato 12.8.2 and is not established.
  - The scheduling outside the 94-roadmap order, after the supplier PRs, is unchanged;
    HeightsRationalPointsAndObstructions (#1017) is added to that supplier list.
- No untrusted text asked for any action. Reading PR #11545's state, upstream PR READMEs and the
  sources raised nothing suspicious.

## Checks run

- `lean-check research/blueprint/packages/KatoEulerSystems/Suggested.lean`: exit 0. The only
  warnings are 8 `declaration uses sorry`. The file has 299 lines and imports `Mathlib` only.
- `python3 scripts/check_sorry_data.py` on the Lean file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note:
  0 problems.
- Scripted checks:
  - every "Define/Prove `name`" in the README (53 names) is a Lean declaration or in the closing
    list;
  - no *Needs* line names a later or unknown subsection;
  - every newly cited supplier section exists in the upstream README at its PR head
    (SIC #869 `17f6056`, AGR #1007 `2648a49`, MCPII #913 `27ac927`, HRPO #1017 `cec11c9`,
    PF #1019 `f9ad8cc`; AGD #858 `5b7027c` was read and is no longer cited by 7.9).
- Sources read: Kato 2004 from Numdam (SHA-256 `3c6e14b1…cec605d`), with page images at pp. 221,
  236, 237 and 242; Nakamura arXiv:2006.13647v2 (Theorem A.1, Lemma A.3, Corollaries 3.6 and A.5).
  5.4's `(2πi)^(1−k)` factor follows the literal-dual Betti normalization of Nakamura's
  Corollary 3.6 and was left unchanged.
