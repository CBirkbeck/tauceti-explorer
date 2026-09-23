# Review of PAPER-BROWNING-LEBOUDEC-SAWIN-23

**Job** REV-PAPER-BROWNING-LEBOUDEC-SAWIN-23 (issue #1096) · **Date** 2026-09-23 · Claude Code,
session `cc-7b31c4` · **Verdict: accept.** All eight routes accepted; all nineteen `sourceIssues`
confirmed; nothing corrected, rejected or deleted.

Paper: Tim Browning, Pierre Le Boudec and Will Sawin, *The Hasse principle for random Fano
hypersurfaces*, [Ann. of Math. **197** (2023), 1115–1203](https://doi.org/10.4007/annals.2023.197.3.3);
extracted from arXiv [2006.02356](https://arxiv.org/abs/2006.02356) v1, whose hash reproduces as
`210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb`. I re-extracted all 66 pages and
read at the locator of every item and finding named below.

## Structure

129 items: 120 missing, 5 library, 4 planned. Every missing item is routed **exactly once**, no
non-missing item is routed, no route names an unknown id, and `scripts/check_paper.py` passes.

The **seven source routes** name stages that all exist:
`GeometryOfNumbersAndQuadraticArithmetic` GN.0 (span, saturation, orthogonal quotients, duals) and
GN.4 (the quantitative counting of Lemmas 3.4–3.6 and 3.18–3.24); `ArithmeticStatistics` ST.0
(coefficient families and the Euclidean ordering), ST.2 (the local-density product and its tails),
ST.4 (Bhargava's plane cubics) and ST.5 (finite local moments and the gradient strata
`R^{(e)}(p^r)`); and `HeightsRationalPointsAndObstructions` RP.2 (the Brauer-vacuity comparison from
Colliot-Thélène's appendix to Poonen–Voloch). The division is the right one: GN.4's reason names the
ST.2 overlap and forbids duplicating it, and ST.4 is invoked only for what it really supplies —
p.3 reduces the cubic-surface case `(d,n) = (3,3)` of Corollary 1.2 to plane cubic curves by
restricting the points to a coordinate hyperplane, and that is where Bhargava's work enters.

The **Part II route** carries the title *Heights, rational points and obstructions, Part II: random
Fano hypersurfaces and least-point heights*. The prefix reproduces the parent's atlas title exactly,
the area `arithmeticgeometry` is a galaxy id, and the brief is 237 words. RP.0–RP.6 plan height and
obstruction foundations, not a density-one Hasse principle or the sharp typical least-point bound of
Theorem 2.2, so a Part II rather than another stage is right; the reason also separates the SS23
random-fibration proposal by method (prime-polynomial specialization, not these incidence lattices).

**Library and planned.** All six citations resolve at the Mathlib pin `082e2d3`:
`MvPolynomial.homogeneousSubmodule` (`RingTheory/MvPolynomial/Homogeneous.lean:89`), `IsZLattice`
(`Algebra/Module/ZLattice/Basic.lean:432`), `ZLattice.covolume`,
`ZLattice.covolume_eq_measure_fundamentalDomain` and `ZLattice.covolume_div_covolume_eq_relIndex'`
(`Covolume.lean:72, 84, 170`), and `LinearMap.BilinForm.dualSubmodule`
(`LinearAlgebra/BilinearForm/DualLattice.lean:37`). The four planned items resolve to RP.2, GN.1
twice (successive minima and Minkowski's second theorem) and the designed `GlobalQuadraticForms`
layer 5 for Hasse–Minkowski.

**Locators.** Of 72 name-and-page checks, 61 land on exactly the page given. I read all eleven
others and none is an error: Lemma 3.24 is stated on p.25 and proved on p.26, Lemma 4.8 is stated on
p.34 and proved through p.40, Lemma 5.7 is stated on p.56 with the Hensel lifting on p.57, Lemma
5.10 is stated on p.62 and proved on p.63, Proposition 4.1 is stated on p.26 and closed on p.50;
`hensel-level-lift` cites `[6, Lemma 3.3]`, an external input rather than this paper's Lemma 3.3;
and E19's locator deliberately names both the statement on p.2 and the three later places of use.

## The nineteen findings

Each is printed exactly as quoted. I checked the mathematics of each independently rather than
re-reading the extraction's reasoning.

**E16** is the one with a numerical certificate, and it recomputes exactly: for `d = 2, n = 3`,
`x = (2,2,−2,2)`, `y = (−3,2,3,−3)`, the Gram determinant is `72000` and the quadruple sum `415200`,
a ratio of `30/173 = 0.1734…`, below the printed `1/4`. The cause is the one given: for `d = 2` the
map `(i,j) ↦ X_iX_j` is two-to-one off the diagonal, so each unordered monomial pair is counted up
to four times in the ordered quadruple sum and the constant must be `1/8`. A search over small
integer pairs found no ratio below `1/8`. For `d ≥ 3` the map is injective and the printed `1/4` is
safe, as the correction says.

**E8** fails at `d = 2`, `u = (1,1,0,…)`: Definition 2.1 lists the monomials with no multinomial
weights, so `‖ν(u)‖² = 3 < 4 = ‖u‖^{2d}`. **E17** is homogeneity: `∇f_a` has degree `d−1`, the
witness of (5.30) satisfies `λ < ‖∇f_a(x′)‖ ≤ 2λ` on `S^n`, and `x = x′/2` therefore obeys
`λ/2^{d−1} < ‖∇f_a(x)‖ ≤ λ/2^{d−2}`, not the printed pair; only fixed constants downstream move.

**E2** and **E4** both turn on definition (5.28), where `I^loc_{d,n}` asks only for a **non-trivial
real point**. So `X_0^d` lies in it while every real zero is singular — it belongs to no stratum
`B^{(λ)}`, and (5.31) is false as an equality; and `f_a = X_0²+X_1²+X_2²` in four variables lies in
it by `(0,0,0,1)` while `f_a + tεX_3²` is positive definite for every `t > 0`, so the `max` defining
`M_a` on p.60 is a maximum over an empty set. Both counterexamples are as described.

**E5**: the assertion on p.23 that some coordinate takes at most four values on each fibre fails for
the quartic `t_1²t_2²`, which is independent of `t_3` and vanishes identically on the fibres
`t_1 = 0` and `t_2 = 0`. The proposed replacement — `O(H_1H_2)` grid zeros for a non-zero quartic in
a box with `H_1 ≥ H_2 ≥ H_3` — returns exactly the printed `N_c(Z;L) ≪ Z²/(s_1s_2)` of (3.31), since
`H_j ≍ Z/s_j`.

**E1** is a real degree mismatch: `M_{d−2,n}` is the set of monomials of degree `d−2` by Definition
3.10 and `L^{(x,y)}_{i,j,k}` is linear, so the left side of the p.18 display has degree `d−1`.
Raising the degree does not repair it either, since those products vanish on the whole line through
`x` and `y` and miss `X_0^{d−1}X_1`. The correction is what the proof actually does: `Ψ_P` multiplies
a degree-`(d−2)` monomial by the **quadratic** `⟨c, ν_{2,n}(X)⟩`, so the statement to prove is
`I_d = ℝ[X]_{d−2}·I_2` for the two-point ideal `(X_2,…,X_n, X_0X_1)`.

**E12**: `a` is introduced on p.16 as an arbitrary non-zero vector of `(Q_2(x,y)^⊥)^*`, and the
second case derives `d_3 ≤ ‖a‖·d_2`. The casewise displays (3.16) and (3.18) therefore bound `‖a‖`,
not `λ_1`; the minimum taken afterwards is the valid inference. **E14**: (3.25) prints
`s_1 ≤ s_2 ≤ max{Z,s_3}` while (3.31) argues "since `Z ≥ s_2`"; definition (3.23) restricts to
`‖x‖,‖y‖ ≤ Z`, so the lattices with `s_2 > Z` do not occur and the misprint costs nothing —
`affects: nothing` is right.

**E3**: at `Δ = 1` the printed `log Δ` vanishes while the counts do not, since `d_r(e_0) = 1`; the
same applies to Lemma 3.20 for `r ≥ 3`, where the exponent `2min{r−2,1}` is `2`, and to (3.24).
`log(2Δ)` repairs the endpoint and changes nothing for large `Δ`. **E6**: on the bad set
`gcd(G,Q)/G` can be as small as `1/G`, so inverting (4.56) is invalid; with `x = e_0`,
`y = e_0 + qe_1` for a prime `q > w(B)` and `ℓ = 1` the discrepancy is exactly `q`. Stating (4.57)
and (4.69) for the reciprocals is the fix, and that is the form the moment calculation consumes.

**E18**: Lemma 4.7 on p.32 does assume `A ≥ B^{4/5}`, whereas the partial summation at (4.71) needs
`Σ_{‖a_V‖≤t} N_V(B)` down to `t = 1`. The repair is drawn from inside the proof of Lemma 4.7, which
is the right place to look for it. **E19**: Poonen–Voloch order by the sup-norm of the coefficient
vector, this paper by the Euclidean ball `B_{N}(A)`; equivalent norms give comparable counts but not
the same limit, since the real-solubility locus is a cone whose proportion of a ball and of a cube
differ. Positivity survives by inscribing a box, which is all Propositions 5.2 and 5.3 need; the
existence of the limit asserted in Theorem 1.1 does not follow from the citation as given.

**E10** is the scale mismatch at the top of p.62: `a ∈ B^{(λ)}` gives a witness in `D_a(λ)`, while
the neighbourhood argument is run from `D_a(λ/2)`. **E15**: the Barroero–Widmer constant belongs to
a definable family indexed by the rank and the number `I` of angular bands, and the proof removes no
dependence on `I`; the paper only ever uses `I ≤ 2`. **E11**: `b_1, b_2` live in `R^{n+1}(p^r)`, so
the scalar of the case split must lie in `(Z/p^rZ)^×`; read that way the split is right, which is
why the reclassification to `affects: nothing` stands. **E9** is the same kind of slip twice, on
p.14 and p.18, writing a lattice as a direct sum of real lines. **E7** is `B_5(J)` for a ball that
must live in `ℝ^{70}`, since `V(L) = Span_Q(ν_{4,4}(L)) ∩ Z^{N_{4,4}}` by (3.33), and the count that
follows is the rank-15 one. **E13** is unused by the paper's own words on p.51 — "We shall use
neither of these facts in our work" — and the divergence for `X_0^d` is real.

## Version boundary

G1 stands, and this review does not lift it. arXiv still lists only v1 (3 June 2020) and
[Crossref](https://api.crossref.org/works/10.4007/annals.2023.197.3.3) records no erratum,
corrigendum or relation for the published article, whose 89-page text remains subscription-only.
Every verdict above, mine included, is a verdict about arXiv v1.
