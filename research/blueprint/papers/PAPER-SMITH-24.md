# PAPER-SMITH-24 — Algebraic integers with conjugates in a prescribed distribution

Claude Code — session `cc-7b31c4`; issue #1081; read on 22 September 2026.

The 47-page paper has been extracted into 56 items. Three are in the pinned libraries, five are planned by existing
layers of the atlas, and the remaining 48 each have exactly one route: 38 form a new roadmap, **Logarithmic potential
theory and the distribution of conjugates of algebraic integers**
(`LogarithmicPotentialTheoryAndAlgebraicIntegers`), 2 become sources for
`GeometryOfNumbersAndQuadraticArithmetic:GN.1`, 4 for `ClassicalArithmeticCompletion:CA.3` and `CA.6`, and 4 for
`FaltingsFinitenessAndIsogenyTheorems:R28.4`. This is a paper inventory and routing proposal, not a proof blueprint:
the results quoted from Saff–Totik, Ransford, Fekete–Szegő, Robinson, Smyth, Serre, Honda and Tate, and
Banaszczyk–Litvak–Pajor–Szarek are recorded as items with their own prerequisite entries and are not decomposed here.

## What the paper proves

For an algebraic integer `α` with conjugates `α₁, …, α_n`, the counting measure `µ_P = (1/n)(δ_{α₁} + ⋯ + δ_{α_n})` of
its minimal polynomial records how its conjugates are distributed. Which probability measures arise as weak* limits of
such counting measures?

* **The main theorem (1.5).** Let `Σ ⊂ ℝ` be compact with at most countably many connected components and capacity
  strictly greater than 1, and let `µ` be a Borel probability measure on `Σ`. Then `∫_Σ log|Q| dµ ≥ 0` for every
  nonzero integer polynomial `Q` **if and only if** there are infinitely many distinct irreducible monic integer
  polynomials `R₁, R₂, …` with all roots in `Σ` and `µ_{R_k} → µ` weak*. The forward implication is Serre's and comes
  from the upper semicontinuity of `log|Q|` together with `log|res(R_k, Q)| ≥ 0`; the converse is new and occupies
  most of the paper. In other words, **the integrality of resultants is the only obstruction**.
* **Smyth's method is optimal (5.11).** For `Σ` and a continuous `F` obeying a growth condition at infinity, let
  `λ(Σ, F)` be the liminf of the mean values of `F` over the conjugates of algebraic integers with all conjugates in
  `Σ`, and let `λ_Smyth(Σ, F)` be the supremum of the `λ` admitting an auxiliary-polynomial inequality
  `F(x) ≥ λ + Σ a_i log|Q_i(x)|` on `Σ`. Then `λ(Σ, F) = λ_Smyth(Σ, F)`.
* **The trace problem (1.1).** The Schur–Siegel–Smyth constant satisfies `λ_SSS < 1.89831`: there are infinitely many
  totally positive algebraic integers with `tr(α) < 1.89831 · deg(α)`. Since Serre had shown that no
  auxiliary-polynomial inequality can hold for `λ > 1.89830…`, this follows from Theorem 5.11. The general consensus
  that `λ_SSS = 2` — the content of the Schur–Siegel–Smyth trace problem as codified by Borwein — is therefore wrong,
  and what had been read as a limitation of Smyth's method is a limitation of the constant. Smyth's own optimistic
  reading in 1999 is vindicated.
* **Abelian varieties (1.3).** Through Honda–Tate theory the same optimisation applies to `Σ = [−2√q, 2√q]` and
  `F(x) = log|q + 1 − x|`, giving, for every square prime power `q` beyond an absolute constant, infinitely many
  `F_q`-simple abelian varieties with `#A(F_q) ≥ (q + 2√q − 0.89831)^{dim A}` and infinitely many more with
  `#A(F_q) ≤ (q − 2√q + 2.89831)^{dim A}`, improving the prior records.
* **How the converse is proved.** Reduce, by convolution smoothing and "sweetening" with the equilibrium measure, to a
  Hölder measure on a compact finite union of intervals (Proposition 2.5). Use the geometry of numbers — Minkowski's
  second theorem for the polytope of real polynomials with weighted evaluation bounds (Proposition 3.4), and the
  flatness theorem (Theorem 3.2) — to produce squarefree integer polynomials of small weighted norm and to adjust
  coefficients. Use the coefficient-adjustment technique of Robinson and of Fekete–Szegő, through Chebyshev
  polynomials of `Σ`, pruned polynomials and complementary polynomials, to build a real monic `P_n` whose top
  `⌊B√n log n⌋` coefficients are already even integers and whose roots are separated by intervals inside `Σ` on which
  `|P_n|` is large (Proposition 4.1). Replace the remaining real coefficients by integers; the resulting `R_n` is
  Eisenstein at 2, has all its roots in `Σ`, and satisfies `‖w_µ^n R_n‖_Σ^{1/n} → 1`, so its counting measures
  converge to `µ`.

## The source actually read

`arXiv:2111.12660v2`, posted 16 March 2024, 47 pages, SHA-256
`99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9`, downloaded from
<https://arxiv.org/pdf/2111.12660v2> on 22 September 2026 and read completely: the introduction, §§2–5 and the
bibliography. The published article — *Annals of Mathematics* **200** (2024), no. 1,
[DOI 10.4007/annals.2024.200.1.2](https://doi.org/10.4007/annals.2024.200.1.2) — is paywalled and was not consulted,
so every locator names a section, theorem, lemma or equation number together with the page of the arXiv v2 PDF.
Version v1 is from 24 November 2021; the arXiv comment on v2 is simply "47 pages". Neither the arXiv abstract page,
which carries no journal reference, nor Crossref lists an erratum or corrigendum.

## Checks run on the paper's claims

The paper's only explicit numerics are in Example 5.16, and they were recomputed from the printed parameters
`a = 0.087353`, `b = 4.411076`, `γ = 0.215485` and `µ = γν_{[a,b]} + (1−γ)µ_{[a,b]}`.

* **The potential constant.** `C = −log((b−a)/4) + γ log((a + 2√(ab) + b)/4) = −1.28585…×10⁻⁷`, matching the printed
  `≈ −1.3·10⁻⁷`, and in particular negative, which is what Proposition 5.15 needs.
* **The logarithmic moment.** `∫log|x| dµ = −γ log((a + 2√(ab) + b)/(4ab)) + (1−γ) log((a + 2√(ab) + b)/4) =
  1.45128…×10⁻⁶`, matching the printed `≈ 1.5·10⁻⁶`, and nonnegative, which is the hypothesis of Proposition 5.15 for
  `Q₁(z) = z`.
* **The trace.** `∫x dµ = γ√(ab) + (1−γ)(a+b)/2 = 1.8983031191782…`, which lies in the printed interval
  `(1.898303, 1.898304)` and is below `1.89831`, so Theorem 1.1 follows as claimed.
* **The abelian-variety constants.** Corollary 1.3's `−0.89831` and `+2.89831` are exactly `1 − 1.89831` and
  `1 + 1.89831`, so they agree with Proposition 5.13's `q + 2√q + 1 − λ_SSS − ε` and `q − 2√q + 1 + λ_SSS + ε` for
  small `ε`.
* **Internal consistency.** The exponents in Propositions 3.5 and 3.6 were checked against each other for `R = 1`,
  `n = m` (the lower bound `exp((½n² + ½n)I(µ))/(n+1)!` against the upper bound `n^{Cn}exp(½n²I(µ))`, consistent
  because `I(µ) ≤ 0`); the chain in the proof of Corollary 3.7, `0 ≤ ∫log|Q_n| dµ ≤ C log n + ½nI(µ) − nI(µ) =
  C log n − ½nI(µ)`, was verified from `log|Q_n| = log(w_µ^n|Q_n|) − nU^µ`; the total mass of a sweetened measure,
  `(β + γ − βγ) + (1−β)(1−γ) = 1`, was checked, as was the chain (5.8) using `β log κ = (1−β)B` and
  `U^{µ_Σ} ≤ −log κ`; and `U^{ν_{[a,b]}}(0) = log((a + 2√(ab) + b)/(4ab))` was checked in the degenerate limit
  `a = b`, where it reduces to `−log a`.

**No mistakes were found**, so `sourceIssues` is empty. The scope of that claim is exactly the checks above: the
arithmetic of Example 5.16, the internal consistency of the estimates named, and the cross-references between the
introduction and the body. The proofs were read for their structure and their inputs, not verified line by line.

## What the libraries and the atlas already have

Three items are in the pinned libraries: Gauss's lemma and primitive polynomials (`mathlib:Polynomial.IsPrimitive`,
`mathlib:Polynomial.content`, `mathlib:Polynomial.content_dvd_coeff`), Eisenstein's criterion
(`mathlib:Polynomial.IsEisensteinAt.irreducible`), which is what makes the constructed `R_n` irreducible, and Tonelli's
theorem with the monotone convergence theorem (`mathlib:MeasureTheory.lintegral_lintegral_swap`,
`mathlib:MeasureTheory.lintegral_prod`, `mathlib:MeasureTheory.lintegral_iSup`), which carry the layer-cake identity
(2.2) and Serre's semicontinuity argument.

Five items are planned and are imported rather than re-planned: Borel measures with the weak* topology and the
compactness of the space of probability measures on a compact set (`ArithmeticStatistics:ST.0` and layer 1 of the Tau
Ceti optimal-transport roadmap); algebraic integers, conjugates, minimal polynomials and resultants
(`ClassicalArithmeticCompletion:CA.3`, the Tau Ceti number-field arithmetic layer 3 and the polynomial-Galois layer 3);
Minkowski's convex-body and successive-minima theorems (`GeometryOfNumbersAndQuadraticArithmetic:GN.0`, `GN.1`); and
the Weil bound placing Frobenius eigenvalues in `[−2√q, 2√q]` (`WeightsInEtaleCohomology:R34.1`, `R34.2`,
`DeligneWeightsAndPurity:DWP.1`).

Three searches came back empty and determined the routing. A text search of every stage description in the atlas
extracts for **"capacity"**, **"equilibrium measure"**, **"logarithmic potential"** and **"transfinite diameter"**
returns **nothing at all**; the only hit for "potential theory" is the Tau Ceti PDE roadmap's lane on maximum
principles and harmonic functions, a different subject. **"Trace problem"**, **"Smyth"** and **"totally positive
algebraic integer"** return nothing. **"Honda–Tate"** and **"abelian varieties over finite fields"** return nothing,
and "Weil number" returns only the weight-theoretic layers `DWP.10` and `R34.1`. Chebyshev polynomials appear only as
an orthogonal basis of `L²([−1,1])` in the Tau Ceti completed roadmap on orthogonal bases, which is a different object
and gives none of the bounds Lemma 4.2 needs.

## The routes, and why each goes where it goes

**1. New roadmap `LogarithmicPotentialTheoryAndAlgebraicIntegers` — 38 items** (`algebraicnt`). The analytic core and
the two main theorems: potentials, energy, capacity and equilibrium measures; Hölder measures and the continuity of
their potentials; weights `w_µ = exp(U^µ)`, the weighted norms `‖w_µ^n P‖_Σ` and the convergence criterion of
Lemma 2.7; the approximating polynomial and its Vandermonde estimates; Chebyshev polynomials of a compact set; pruned
and complementary polynomials and the coefficient adjustment of Robinson and Fekete–Szegő; the smoothing measures
`ν_{[a,b]}` and the sweetening construction; Theorem 1.5, Theorem 5.11, Theorem 1.1, Proposition 5.15, Example 5.16 and
Proposition 5.17. A source route was rejected because the bulk of this material is analysis with no owner anywhere in
the atlas, and a Part II was impossible because there is no parent roadmap in this direction. The area is `algebraicnt`
(MSC 11C, 11E, 11H, 11R), which is where the paper's primary classification 11R06 and its geometry-of-numbers
neighbour 11H live; the potential theory (MSC 31A) is the machinery, not the target.

**2. Source for `GeometryOfNumbersAndQuadraticArithmetic:GN.1` — 2 items.** Proposition 3.4 is Minkowski's second
theorem for the polytope of real polynomials of degree at most `m` satisfying weighted bounds at `m + 1` distinct real
points, with the covolume computed by a Vandermonde determinant; Theorem 3.2 is a flatness-theorem statement, that
every real polynomial of degree at most `n − 1` differs from an integer polynomial by a combination
`Σβ_i Q(z)/(z − α_i)` with `Σ|β_i| ≪ n log 2n`. Both are independent of the arithmetic application and belong to the
layer that already plans Blichfeldt and Minkowski. Neither is planned: the only hit for "flatness theorem" or
"successive minima" in the atlas is GN.1's own title.

**3. Source for `ClassicalArithmeticCompletion:CA.3`, `CA.6` — 4 items.** CA.6, "Special algebraic numbers and Mahler
measure", plans the house, the Pisot and Salem classes and selected lower bounds — MSC 11R06, the same classification
as the trace problem — so it is the owner of the classical background: totally positive algebraic integers and the
trace ratio, the constant `λ_SSS` with the Schur, Siegel, Smyth and Wang–Wu–Wu bounds, the statement of the
Schur–Siegel–Smyth trace problem, and Smyth's auxiliary-polynomial method with the resultant argument. The new roadmap
then imports `λ_SSS` instead of defining it twice. Separately, Lemma 2.10 — a small nonnegative integral combination
of integer polynomials, divided by their gcd, is squarefree of the expected degree — is pure integer-polynomial
arithmetic and goes to CA.3.

**4. Source for `FaltingsFinitenessAndIsogenyTheorems:R28.4` — 4 items.** Honda–Tate theory, together with the
applications it carries: Proposition 5.12 expressing extreme normalised point counts in terms of `λ(Σ, F)`,
Proposition 5.13 in terms of `λ_SSS`, and Corollary 1.3. R28.4 already plans Tate's isogeny theorem, the semisimplicity
of the rational Tate module and the endomorphism algebra, and already imports the finite-field weight bounds from
`R34.2`; Honda–Tate is its immediate arithmetic successor and has no other candidate owner in the atlas. PROTOCOL.md
§15 asks that a missing general notion be planned once in its most foundational owner.

## Prerequisite papers the atlas does not yet cover

Fourteen entries. Saff–Totik's *Logarithmic Potentials with External Fields* and Ransford's *Potential Theory in the
Complex Plane* are the two sources for the potential theory itself, including the principle of domination, the
equilibrium measure of an interval, weak* compactness and balayage. Fekete–Szegő and Robinson supply the
coefficient-adjustment technique of §4 and Robinson's theorem that a real set of capacity greater than 1 contains
infinitely many complete sets of conjugates — which is also the only known case of Theorem 1.5 at capacity exactly 1.
Smyth's two 1984 papers give the auxiliary-polynomial method and the counting measure `µ_P`; Serre's 2019 Bourbaki
report gives the framework of limits of conjugate distributions and the easy implication of Theorem 1.5, and his 1998
letter to Smyth, reproduced as an appendix by Aguirre and Peral, contains the two-part integration argument and the
parameters that Example 5.16 rounds. Schur and Siegel give the original bounds, Wang–Wu–Wu the state of the art. Honda
and Tate supply the classification of isogeny classes over finite fields; Banaszczyk–Litvak–Pajor–Szarek and Gruber
the flatness theorem; Kadets and van Bommel–Costa–Li–Poonen–Smith the previous point-count records and the
construction that Lemma 4.5 follows; Peherstorfer the explicit equilibrium density of a union of intervals; and
Christiansen–Simon–Zinchenko, Totik and Widom the asymptotics of Chebyshev polynomials of subsets of `ℝ`.

## Mistakes found in the source

**None.** `sourceIssues` is `[]`. Every number in Example 5.16 reproduces, the internal consistency checks listed above
pass, and the cross-references between the introduction and the body match. The scope of this claim is exactly those
checks.

## What this extraction does not claim

Nothing here is formalised, and nothing is claimed to be. Four boundaries are worth naming. First, the results quoted
from other sources were checked against the statements given in this paper, but their own proofs were not read, which
is why they appear under prerequisites — in particular the potential theory of Saff–Totik and Ransford, which a
blueprint for the new roadmap will have to decompose rather than cite. Second, the two restrictions the paper cannot
remove are recorded as open, not as gaps in the extraction: capacity exactly 1, where by Proposition 5.7 the only
measure in question is the unweighted equilibrium measure and the answer is known only in Robinson's special cases,
and compact subsets of `ℂ` rather than `ℝ`, where Fekete–Szegő made partial progress. Third, Proposition 5.17 shows
that no fixed finite family of auxiliary polynomials reaches `λ_SSS`, so the roadmap should not promise the trace
problem's exact constant. Fourth, the claim that no mistakes exist means only that the checks listed above found none.
