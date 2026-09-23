# Review of PAPER-BHARGAVA-GROSS-WANG-17

**Job** REV-PAPER-BHARGAVA-GROSS-WANG-17 (issue #1437) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with two corrections made in place. All six routes accepted; all
five `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Manjul Bhargava, Benedict H. Gross and Xiaoheng Wang (appendix by Tim and Vladimir
Dokchitser), *A positive proportion of locally soluble hyperelliptic curves over ℚ have no point
over any odd degree extension*, [J. Amer. Math. Soc. **30** (2017), 451–493](https://doi.org/10.1090/jams/863);
read in arXiv [1310.7692](https://arxiv.org/abs/1310.7692) v2, whose hash reproduces as
`8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2`. The JAMS text was not obtained,
so every verdict below is a verdict about v2.

## Structure

56 items: 50 missing, 5 planned, 1 library before this review. Every missing item is routed exactly
once, no route takes a planned or library item, and `scripts/check_paper.py` passes.

**Coverage.** The paper declares 49 numbered environments — Theorems 1–44 and A.1–A.8, with their
Propositions, Lemmas, Corollaries, Definitions and Remark 4. I extracted that list mechanically from
the text and every one of them appears in an item. Nothing on the way to Theorems 1, 2, 6 and 7 is
missing.

**Locators.** Of 66 name-and-page checks, 65 land on exactly the page given. The single exception is
right as well: item 13 cites p.34 for the Dembo–Poonen–Shao–Zeitouni bound, and the proof of Theorem
7 begins on p.33 and reaches that citation ("fewer than log n/log log n real roots is O(n^{−b+o(1)})")
on p.34.

**Stages and layers.** All eight stage ids named by the routes exist in `data/atlas.json`
(`ArithmeticStatistics` ST.0, ST.1, ST.2, ST.4; `HeightsRationalPointsAndObstructions` RP.1, RP.3;
`NeronModelsAndSemistableAbelianVarieties` R11.4; `SchemeAndStackFoundations` SF.3), as do the five
planned layer ids. Route 1's two load-bearing cross-claims check out: RS-07 keeps ST.1 as
"source-scoped number-ring/genus-one integral orbit bijections, inverses, degenerate/irreducible
cases, stabilizers and local-solubility comparisons", and `PAPER-BHARGAVA-SHANKAR-WANG-22` does route
its SO_n-representation item (its item 15) to ST.0/ST.1 — so sending the hyperelliptic
pencil-of-quadrics parametrization there extends an existing direction to all genera rather than
opening a new one. That is why no Part II is needed for the pencils.

## Correction 1: the Kummer identification is planned, not library

Item 21 stated that the Kummer map identifies `K^×/K^{×2}` with `H¹(K, μ_2)` and was marked
`library`. Neither library has that at the pins.

- Tau Ceti's `kummerClassMap_injective` (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:298` at
  `f790474`) gives the **injection** `Kˣ ⧸ (Kˣ)ⁿ ↪ H¹(G_K, μₙ)`. Its own docstring is explicit:
  "surjectivity, which needs Hilbert 90, is what would upgrade it to the Kummer isomorphism".
- Mathlib's `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`
  (`RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84` at `082e2d3`) is Hilbert 90
  for a **finite** Galois extension. Getting surjectivity from it needs `H¹(G_K, (Kˢ)ˣ) = 0` for the
  absolute Galois group and the long exact sequence of the Kummer sequence, neither of which is in
  either tree; a name search over both pinned trees for Kummer, `H1` and Hilbert 90 declarations
  found nothing stronger.

The paper needs the identification itself — p.8 prints "the image of the group `H¹(D, μ_2)` in
`H¹(K, μ_2) = K^×/K^{×2}`". The Tau Ceti `ProfiniteCohomology` roadmap plans exactly this in Layer 9
("the Galois interface: Hilbert 90 and Kummer theory"), whose milestones are Hilbert 90 for `G_K`
and then "the Kummer sequence and isomorphism", with the coefficient module `KummerCoeff K n` fixed
once. So the item is now `planned` at that layer, with both declarations and what they do supply
kept in its note. The cited Tau Ceti name is also corrected: the declaration is
`TauCeti.kummerClassMap_injective` — `FieldTheory` is part of the file path, not of the namespace,
which opens at line 73 and closes at line 302.

This changes no route: planned items are not routed.

## Correction 2: a sign in E1's correction

E1's correction described the failing pairing in the Weierstrass case as `+1`. Its own `reason` says
`−1`, and so does the computation below. The clause now reads `−1` for `g ≥ 2` and `h_1(x_0)` for
`g = 1`. The proposed replacements themselves were already right and are unchanged.

## The five findings

**E1 (error, the proof) — confirmed.** I rebuilt the two forms of p.18 from their definitions,
`⟨(λ,a,b),(μ,a′,b′)⟩_{A′} = [β^{n−1}](αλμ) + aa′` and
`⟨(λ,a,b),(μ,a′,b′)⟩_{B′} = [β^{n−1}](αβλμ) + ab′ + a′b`, in my own implementation of
`L = K[x]/f(x,1)`, and computed the Gram matrices of the printed `(g+1)`-planes for `g = 1, 2, 3`
with random `f`. Both planes are isotropic for `A′` and fail for `B′`, in a single entry:

- `z_0 ≠ 0`: `⟨(β^{g−1},0,0), (β^g,1,−c)⟩_{B′} = [β^{2g+1}]((x_0−β)β^{2g}) = −1`;
- `z_0 = 0`, `g ≥ 2`: the same `−1`, between `((β−x_0)^{g−1},0,0)` and `((β−x_0)^g,1,−c)`;
- `z_0 = 0`, `g = 1`: `h_1(x_0)`, between `(h_1(β)−h_1(x_0),0,0)` and `(β−x_0,1,−c)`.

Each of the three proposed replacements makes both Gram matrices vanish identically, so the repair
works and Theorem 28 stands. The third coordinate is what carries it: `A′` does not see `b`, so the
change costs nothing there, while `a′b` in `B′` cancels the `−1` exactly.

**E2 (misprint, nothing) — confirmed, recomputed.** The printed curve `y² + xy = x³ − x² − 929x −
10595` has discriminant `700673120 = 2⁵·5·7·79·7919`; 571 does not divide it, so its conductor is not
571 (the extraction's `43792070 = 2·5·7·79·7919` is the radical, as reported). The corrected curve
`y² + y = x³ − x² − 929x − 10595` has discriminant `−571`, prime, hence conductor 571. It is
isomorphic over ℚ to the Jacobian `y² = x³ − 27Ix − 27J` of the printed quartic: with `I = 44608`
and `J = 18842960` the `c₄` and `c₆` ratios are `1296 = 6⁴` and `46656 = 6⁶`, and both curves have
`j = −88764284403712/571`. The paper's other numbers are right — the quartic's discriminant is
`−2⁸·571`.

**E3 (gap, a stated result) — confirmed.** Theorem 44 (pp.34–35) imposes local conditions only at `p`
and `q`, but the only proof available is Theorem A.3 (p.36), which needs `C(K_𝔭) ≠ ∅` and good
reduction at **every** `𝔭 ≠ 𝔭_0` with a unique prime above it in `F`, and, for the 2-Selmer
conclusion, points on all four twists at every such `𝔭`. For `F = ℚ(√p, √q)` those primes are `p` and
`q` — which is what the non-residue hypothesis buys — and `2` exactly when `2` ramifies in one
quadratic subfield and is inert in another, i.e. when one of `p, q` is `≡ 3 mod 4` and the other
`≡ 5 mod 8`. `(p,q) = (5,3)` satisfies that and the non-residue hypothesis, since `(5/3) = (3/5) = −1`.
No other prime qualifies: an unramified decomposition group in a Klein four extension is cyclic of
order at most 2, so at least two primes lie above. Both alternatives in the correction also work —
for `p ≡ q ≡ 1 mod 4` the prime 2 is unramified in `F`, and if the prime `≡ 1 mod 4` is `≡ 1 mod 8`
then 2 splits in that subfield and the decomposition group again has order at most 2. Theorem 44
carries no proof of its own, so this is a gap in a stated result.

**E4 (misprint, nothing) — confirmed.** Theorem 33 (p.25) and Theorems 40 and 41 (pp.31, 33) print
`16^n ℤ`; the proof on p.26 reads "Given one such `f(x,y) = f_0x^n + f_1x^{n−1}y + ⋯ + f_ny^n` with
coefficients in `16ℤ`, then `2^{4i} | f_0^{i−1}f_i`", which is Proposition 34's hypothesis and is
immediate, since `16 | f_j` for all `j` gives `16^i = 2^{4i}` dividing `f_0^{i−1}f_i`. Theorem 15
(p.5) claims `κ = 4`, that is `κ² = 16`; with `16^n` the same argument would give `κ = 4^n`.

**E5 (misprint, nothing) — confirmed, all four.** The p.26 display prints
`g(x,y) = x^n + f_1x^{n−1}y + f_0f_2x^{n−2}y + ⋯`, where homogeneity needs `y²`; with `y²` one gets
`g(f_0x, y) = f_0^{n−1}f(x,y)`, the identity the proof uses. The p.37 sentence prints "at least
`q + 1 − n√q > n` rational points", while the points to avoid — those whose `x`-coordinate is a root
of `f`, plus the points at infinity — number up to `2n + 2`. Both reference slips are printed as
quoted on pp.41–42, and Crossref confirms the corrections: Stoll's *Finite descent obstructions and
rational points on curves* is Algebra & Number Theory **1** (2007), 349–391
([10.2140/ant.2007.1.349](https://doi.org/10.2140/ant.2007.1.349)), and Skorobogatov's *Torsors and
Rational Points* is a 2001 Cambridge University Press monograph
([10.1017/CBO9780511549588](https://doi.org/10.1017/CBO9780511549588)); its Cambridge Tracts number
144 is not in the Crossref record, which lists no series.

## What this review did not do

I did not read the published JAMS article: it returns 403 to scripted access, as the extraction also
records. Crossref still shows no correction or update relation for `10.1090/jams/863`, and arXiv
still lists v2 as the latest version. I did not re-read all 42 pages line by line; I read §§2, 5–9
around the findings and the items I checked (pp.8, 11–12, 18–19, 22–26, 31, 33–37, 41–42), the
statements of every result cited by the routes, and the appendix through Theorem A.3. No new mistake
was found in what I read, and none is added.
