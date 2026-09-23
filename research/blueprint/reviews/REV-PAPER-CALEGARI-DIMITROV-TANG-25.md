# Review of PAPER-CALEGARI-DIMITROV-TANG-25

**Job** REV-PAPER-CALEGARI-DIMITROV-TANG-25 (issue #1415) · **Date** 2026-09-23 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All nine routes accepted; all eleven `sourceIssues`
confirmed; nothing corrected, rejected or deleted.

Paper: Frank Calegari, Vesselin Dimitrov and Yunqing Tang, *The unbounded denominators conjecture*,
[J. Amer. Math. Soc. **38** (2025), 627–702](https://doi.org/10.1090/jams/1053). Both recorded
hashes reproduce: the publisher's offprint on the first author's page as
`867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e` and arXiv v4 as
`9bffb12953db37d237e75451ed659219d955bf57d55da8dbc09ad888f62956ad`.

## Reading the published text

The offprint is an encrypted PDF (standard security handler, RC4-128, `R = 3`), which is why a
direct extraction of it produces nothing at all. I implemented the handler — the padded
owner-password key, fifty MD5 rounds, then per-object RC4 keys — and read the published text, so
every page number below is the journal's and no part of this review depends on the arXiv pagination.
The offprint's first two PDF pages are in the order 628, 627; from there the printed page is the PDF
page plus 626, and I took the number from each running head rather than assuming that.

## Structure

148 items: 129 missing, 14 library, 5 planned. Every missing item is routed exactly once, no route
takes a planned or library item, and `scripts/check_paper.py` passes. All six source stage ids exist,
as do the planned layer ids, including the two Tau Ceti `FuchsianOrbifolds` layers and
`QSeriesPartitionsAndMockModularForms` QM.0–QM.1.

**Coverage.** 124 numbered environments appear in the published text and every one is cited by an
item. The five my checker flagged are artefacts of glued cross-references ("Theorem 2.0.1.1.1.7" and
the like), not declarations.

**Locators.** Of 158 name-and-page checks, 147 land on exactly the page given. All eleven others are
`proof of X, p.N` locators whose statement sits on p.N−1; I read them rather than assuming, and two
in particular: the proof of Lemma 2.1.2 does continue on p.638, and case (2) of the proof of Lemma
4.1.7, which E4 quotes, is on p.654.

**Library.** This is the best-grounded library list I have reviewed for a paper of this size: all 28
declarations behind the 14 library items resolve at the pins. `CongruenceSubgroup.Gamma`, `Gamma0`,
`Gamma1` and `IsCongruenceSubgroup`; `UpperHalfPlane.qExpansion` and `hasSum_qExpansion`;
`ModularForm.eta`, `discriminant`, `EisensteinSeries.E2` and `logDeriv_eta_eq_E2`;
`Int.Matrix.exists_ne_zero_int_vec_norm_le` (Siegel's lemma);
`Stirling.tendsto_stirlingSeq_sqrt_pi`; `MeromorphicOn.circleAverage_log_norm` and
`AnalyticOnNhd.circleAverage_log_norm` (Jensen); `eVariationOn`;
`WeakDual.isSeqCompact_closedBall` and `RealRMK.integral_rieszMeasure`; three `Chebyshev` bounds;
`Subgroup.goursat`; `groupCohomology.H1InfRes_exact`; four `Complex.Gamma`/`digamma` identities;
`ValueDistribution.proximity`; and Tau Ceti's `UpperHalfPlane.discCoordinateEquiv`.

## Routes

The three Part II titles reproduce their parents' atlas titles exactly — "Modular forms — Hecke
theory, newforms, and L-functions" (em dash included), "Diophantine approximation and transcendence"
and "Conformal mapping and the geometric theory of holomorphic functions" — and the areas
`automorphic`, `analytic` and `analysis` are galaxy ids. Two of the three parents are Tau Ceti
roadmaps, which PROTOCOL §15 says are never re-planned, so a Part II is the right form there. The
three proposed roadmap ids appear in no other extraction, so nothing is duplicated, and I checked
each source route against its layer's description: DT.5 does own E- and G-functions, R14.4 is "Ihara
and level-change statements", R15.2 is the q-expansion principle with integrality and finite
generation, D7 is the atlas's generic owner of the extensions of upstream `ProfiniteCohomology`,
NE.0 builds completed group rings and takes its homological input from Lazard, and G7's description
defines enormous image by, among other things, `H¹(H, ad⁰) = 0`, which is what route 9 sends there.

## The eleven findings

All are confirmed. Those that needed more than reading the page:

- **E1.** Lemma 4.5.11 prints `dim H¹(Γ(5), F₃)^{SL₂(F₅)} = 0`. As printed this is false: `SL₂(F₅)`
  is perfect, so `H¹(SL₂(F₅), F₃) = 0`, and inflation–restriction makes
  `H¹(SL₂(Z), F₃) = Hom(Z/12, F₃) = F₃` inject into the invariants. The case the proof of Theorem
  4.5.2 uses is `N = ℓ = 5`, so the coefficients should be `F₅` and nothing downstream moves.
- **E4.** With `A⁻¹BA = (a, b/p; cp, d)`, right multiplication by `diag(p, 1/p)` gives
  `(ap, b/p²; cp², d/p)` and by `diag(1/p, p)` gives `(a/p, b; c, pd) = C`. The printed factor is
  inverted; the display that follows is unaffected.
- **E6.** `E = ⟨−I⟩` by the convention on p.653, so `⟨E, Γ(N)⟩ = ±Γ(N)`. Since
  `SL₂(Z) → SL₂(Z/Np)` is onto, there is `x ≡ −I mod N`, `x ≡ I mod p`; it lies in
  `±Γ(N) ∩ Γ₀(p)` and in `ker π`, but not in `Γ(Np)` once `N > 2`. So the printed kernel is
  `⟨E, Γ(N)⟩ ∩ Γ(p)`, which contains `Γ(Np)` with index 2, and the repair — run Lemma 4.4.4 on
  `Γ(N) ∩ Γ₀(p)` — is the right one.
- **E7.** A real gap. The construction of `G_{2N}` on p.656 gives only Wohlfahrt level dividing
  `2N` (Lemma 4.1.3), while §4.3, four lines later, uses `G = G_{2N} ⊂ ⟨E, Γ(2N)⟩`. The basis
  elements of `R_{2N}` are invariant under groups of level dividing `2N`, and `λ` itself is only
  `Γ(2)`-invariant, so the containment must be arranged — as the recorded repair does, by
  intersecting with `⟨E, Γ(2N)⟩` before taking the normal core.
- **E10.** Recomputed. With `(2/π)K(16x) = Σ C(2n,n)² xⁿ` and
  `(2/π)E(16x) = Σ C(2n,n)² xⁿ/(1 − 2n)`, the corrected identity
  `(1 − 16x)(2/π)K + 8∫₀ˣ(2/π)K` has coefficients `−4, −12, −80` at `n = 1, 2, 3`, matching
  `4/(−1)`, `36/(−3)`, `400/(−5)`. The printed form is exactly its negative, as its value `−1` at
  `x = 0` against `E(0) = 1` already shows.
- **E11.** A genuine hole rather than a slip: Lemma 4.5.6 asserts `H¹(SL₂(Z_p), F_ℓ) = F_ℓ` for
  `p = ℓ ∈ {2,3}`, and its proof disposes of `ℓ ≠ p` and then writes "Assume that `p > 2`", after
  which it uses `p`-powerful groups. The missing case is repaired as recorded:
  `H₁(SL₂(Z_p), Z) ≅ Z/12 ⊗ Z_p` gives `SL₂(Z₂)^{ab} ≅ Z/4`, so `H¹(SL₂(Z₂), F₂) = F₂`.

E2, E3, E5, E8 and E9 are constant- and index-level slips, each printed as quoted: `+2γ` where
`ψ(1) = −γ` gives `−2γ` in (5.2.10); `ψ(k) − ψ(k+a)` for the series coefficient `ψ(k+1) − ψ(k+a)`;
`f ∈ R_{2Np}` where Theorem 4.3.1 needs `f ∈ R_{2N}`; `R := (1 − r)/2` where the display uses
`|z| = (1 + r)/2` and Lemma 6.1.7 needs `r < R`; and `S(M, N)` for its rotated copy `s·S(M, N)`,
which changes nothing because `s` is a rotation about the origin.

## What this review did not do

I did not read all 76 published pages line by line: I read the published text around each finding,
the statements of every result the routes cite, and the definitions those depend on. I add no finding
of my own. The extraction's comparison with arXiv v4 — the same mathematics, with §5.1 renumbered —
is recorded in its `source` block; I worked from the published text throughout and did not re-verify
that comparison item by item.
