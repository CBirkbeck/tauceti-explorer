# BP-RankZeroOneBSD--BSD.9 handoff

Issue #10921. Worker: Claude (Opus 5.5), session claude-bl7IKH, 2026-10-19. This is a complete planning pass for
stage BSD.9, a follow-up of the accepted packet `RankZeroOneBSD--BSD.7` (review REV-RankZeroOneBSD--BSD.7). Nothing
is claimed formalised.

## Deliverables

- `research/blueprint/packets/RankZeroOneBSD--BSD.9.json`: status `complete`, scope BSD.9, coverage `planned`.
  It has 20 new nodes: 1 definition, 1 comparison, 3 lemmas, 7 theorems and 8 applications. It also has 6 API
  items, 5 unit tests, 4 planets, 25 baseline declarations (all read at the pins), 6 requests (TauCetiRoadmap
  EllipticCurves Layers 1, 2, 3, 4, 6, 7), no gaps and no source issues. It reuses no parent node id. The fields
  `continues`, `inheritedTargets`, `supersededNodes`, `partiallyRestatedNodes`, `refinementEdges`,
  `planetProposals` and `decisions` record how the parent's 30 BSD.9 nodes are treated.
- `research/blueprint/readmes/RankZeroOneBSD--BSD.9.md`: rendered from the packet, with front matter, group
  introductions, the inherited-node table and the acceptance tests of the layer.
- `research/blueprint/suggested/RankZeroOneBSD--BSD.9.lean`: elaborates with `lean-check` (Mathlib 082e2d3 build):
  exit 0, 11 `sorry` warnings and nothing else; `scripts/check_sorry_data.py` passes. It follows the
  2026-10-19 rule (commit df998dd): a single `import Mathlib`, and no admitted or numerical-trivia `example`s.
  - Typed: the coefficient bound for Mathlib's `WeierstrassCurve.LFunction`; the E₁ bounds and series, with E₁
    written as the integral; the criterion's sums and tails as five light real-bodied definitions with their
    positivity and monotonicity; the reduction statement behind rational p-torsion.
  - Everything that needs `ellipticL`, `analyticRank`, `bsdDefect`, Ш or the Heegner/modular-symbol carriers is
    listed in the closing comment.

`python3 scripts/check_blueprint.py` (with the baseline index) reports 0 errors and 0 warnings. A roadmap-wide check
over the RankZeroOneBSD packets finds no node cycle, and no earlier-stage node cites BSD.9.

## The reading of the remaining work (read this first)

The parent's remaining item was to "supply/replay all stated rigorous central-value enclosures and finite arithmetic,
local, period, saturation and whole-Sha certificates for the three fixtures; expose actual endpoint signatures". On
2026-10-16 the maintainer dropped ComputationalNumberTheory CN.4 and made the explicit modular-curve and 32a2 data
hypotheses of the final theorems, with no computation as a target (`upstream/drops.json`; the instructions of
FIX-PKG-RankZeroOneBSD~adv2, issue #10743; its open checkpoint PR #10884 rewrites the package's Layer 14 the same way).
A further rule from 2026-10-18 says to restate certificate soundness as the inequalities it proves. So this pass plans
the following, and replays nothing:

1. **Public endpoints.**
   - `prime-part-formula` defines `PrimePartFormula E h p :⇔ v_p(bsdDefect E) = 0`.
   - `ec-bsd-statement-compatibility` shows the roadmap's objects meet the EllipticCurves Layer 7 statement-only
     BSD milestone. It covers the analytic hypothesis via the identity theorem, the explicit-integral period, and
     the x-height regulator together with the 2^r factor at the Tau Ceti pin.
   - Four public endpoints: rank, Ш, one per prime-part branch, and the full formula from a certificate.
2. **Analytic mathematics behind the replays.**
   - `coefficient-bound`: |a_n| ≤ σ₀(n)√n ≤ 2n.
   - `exponential-integral-bounds`: DLMF 6.6.2 and 6.8.1–6.8.3. E₁ = Γ(0, ·) is imported from
     QSeriesPartitionsAndMockModularForms QM.3/upper-incomplete-gamma; that packet is not yet accepted
     (needs_changes), but it plans the function for every real s.
   - `explicit-nonvanishing-criterion`: if |S| > T then the analytic rank is 0 or 1, with an enclosure.
   - `manin-closing-the-path`: Cremona (2.8.7)–(2.8.10), with the denominator 2(1 + p − a_p). No other packet plans
     it.
   - `exact-rank-zero-quotient`: an exact L/Ω from the denominator and an enclosure, through the Manin constant
     (GZ.3).
3. **Side conditions.**
   - `rational-torsion-eisenstein-ordinary`: CGS is excluded for every p-isogeny and Keller–Yin applies.
   - `cm-branch-range`: a CM curve meets no BSD.6 branch. The proof uses Mathlib's
     `ModularForm.levelOne_weight_two_rank_zero` with R29.4, so every E/ℚ has a bad prime and Tate's theorem is not
     needed. For 32a2 no named branch applies at any prime.
   - `dyadic-branch-exclusion`: no branch reaches p = 2.
4. **Ш from the Heegner index.**
   - `odd-sha-from-heegner-index`: HE.6 clean descent or the HE.7 square-index bound, then BSD.1's odd
     decomposition.
   - `gross-37a-sha-vanishing`: Gross pp.236–237. This is the PAPER-KOLYVAGIN-90 route-5 item `g-example-37a`, now
     planned.
5. **Conditional applications** to 11a3, 37a1 and 32a2, with every datum a hypothesis.

## For the review and the assembly

- Superseded parent nodes:
  - `analytic-fixture-enclosures`, the only BSD.9 node citing ComputationalNumberTheory:CN.4.
  - `fixture-finite-arithmetic`.
- Parent nodes kept with their computational inputs restated as hypotheses: `fixture-11-good-five`,
  `fixture-32-cm-additive` and `full-bsd-example`.
- Coverage stays `planned` (not `closed`) only because an assembly must apply `supersededNodes` and
  `refinementEdges` to the parent packet. This job may not edit that packet.
- Planets: this packet adds 4. The parent's planet on the superseded `analytic-fixture-enclosures` leaves with it,
  so the layer shows 6.
- The parent's fixture-11, fixture-37, point-11 and point-37 nodes are kept as cited. The accepted package defers
  them to the upstream EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- Numerical diagnostics (not proofs), from scratch Python with point-count coefficients:
  - a_11(11a3) = 1 (split) and a_37(37a1) = −1 (nonsplit), so the signs are +1 and −1.
  - |a_n| ≤ σ₀(n)√n holds for n ≤ 60 on all three curves.
  - With M = 5 and the 2n coefficient bound: S₀ ≈ 0.25384 with T₀ ≈ 5.4·10⁻⁵ (11a3); S₁ ≈ 0.30544 with
    T₁ ≈ 2.0·10⁻³ (37a1); S₀ ≈ 0.65554 with T₀ ≈ 7.6·10⁻³ (32a2).
  - The full sums agree with L(11a,1) ≈ 0.253842, L′(37a,1) ≈ 0.305999 and L(32a,1) ≈ 0.655514.
- Kolyvagin's dyadic refinement for 37a (t_{E/K} = 1 when I_K is odd, reported by Gross) is not used. Kolyvagin's
  paper is not public and was not read, so the 2-primary part is a descent hypothesis.

## Sources read (all free; hashes in the packet)

- Cremona, *Algorithms for Modular Elliptic Curves*, Chapter II: §2.8 pp.29–31, §§2.11–2.13 pp.37–44.
- Gross, "Kolyvagin's work on modular elliptic curves": scanned pp.235–237, read as page images.
- Keller–Yin, arXiv:2402.12781v2: Theorem C and §0.3 p.5; Theorem 4.2.1 p.42.
- Castella–Grossi–Skinner, arXiv:2303.04373v2: Theorem A p.2; Theorem D pp.4–5.
- DLMF §§6.6 and 6.8.
- Current TauCetiRoadmap EllipticCurves README (main 34dcf0e): Layers 6–8 and the worked examples.

No restricted book was needed, and none is missing.
