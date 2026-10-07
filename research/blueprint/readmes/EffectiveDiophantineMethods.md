# Effective Diophantine methods and certified rational points

Mathlib and Tau Ceti prove that many Diophantine problems have finitely many solutions, and some
of the proofs are effective in principle. Tau Ceti has the Mordell–Weil theorem for elliptic curves
over number fields, the 2-Selmer group with the descent bound on the rank, canonical heights with a
bounded (but not explicit) difference from the naive height, and the finiteness of the groups
K(S, n) that receive the descent map. Mathlib has the p-adic numbers with Hensel's lemma, finite
abelian groups and quotient groups, Minkowski's convex-body theorem and ℤ-lattices, Liouville's
inequality, and the heights of points of projective space over a number field. What neither library
has is the passage from such theorems to a **finite, checkable argument that a given list of
solutions is complete**: certified isolation of algebraic numbers and their valuations, lattice
reduction that excludes every vector outside a box, explicit constants for linear forms in
logarithms turned into a finite search, descent and saturation computations that pin down a
Mordell–Weil group, Chabauty–Coleman computations with every residue disc treated, and the
Mordell–Weil sieve.

This roadmap builds that passage. Its endpoint, in every layer, is a **certificate together with
the theorem that makes the search exhaustive**: finite data, a check that a computer or a reader
can carry out, and a proved statement that a passing check implies the arithmetic conclusion
(the listed points are all the solutions, the listed points generate the Mordell–Weil group, the
curve has no rational point). The worked examples of ED.6 are complete instances: the
Tzanakis–de Weger Thue equations, de Weger's S-unit equations, elliptic rank and integral-point
computations, and the determination of the rational points of the split Cartan modular curve
X_s(13) by explicit quadratic Chabauty.

## Scope and boundaries

The roadmap is an application programme over other owners. It imports, and never re-plans:

- exact algebraic-number and p-adic carriers, the RAM cost model and generic certificate checking
  from ComputationalNumberTheory CN.0, and validated real, complex and p-adic arithmetic from CN.4;
- verified LLL reduction from GeometryOfNumbersAndQuadraticArithmetic GN.5;
- the logarithmic-form lower bounds (Baker, Matveev, Laurent–Mignotte–Nesterenko, Yu) from
  DiophantineApproximationAndTranscendence DT.3, and the equation-specific effective bounds for
  Thue, Thue–Mahler and S-unit equations from DT.4;
- heights from HeightsRationalPointsAndObstructions RP.0, and general abelian-variety descent and
  Mordell–Weil from RP.1;
- the elliptic two-descent, Selmer groups, Mordell–Weil theorem, reduction of points and point
  counts from the Tau Ceti EllipticCurves roadmap (Layers 3, 4, 6 and 7);
- Jacobians, abelian varieties and Abel–Jacobi maps from the Tau Ceti JacobianChallenge roadmap
  (Layers D, E and F), hyperelliptic models from Tau Ceti AlgebraicCurves Layer 10, and regular
  models from Tau Ceti StableReduction Layer 5;
- local primitives, the p-adic logarithm branches and Coleman integration from ColemanIntegration
  L0 and L1;
- Chabauty–Kim loci and quadratic Chabauty theory (depth-two quotients, p-adic heights and their
  local terms) from AnabelianGeometryAndNonabelianChabauty NC.4 and NC.5, and the generic
  certificate schemas of ComputationalNumberTheory CN.5.

What the roadmap owns is the certified layer on top: the Diophantine-facing isolating and valuation
adapters (ED.0), lattice exclusion certificates (ED.1), certified evaluation of the imported bounds
with exhaustive residual searches (ED.2), certified local images, saturation and rank certificates
(ED.3), the Chabauty–Coleman computation with its completeness theorem, together with Strassmann's
theorem for restricted power series over a complete nonarchimedean field (ED.4), the Mordell–Weil
sieve and its combination with Chabauty and height bounds (ED.5), and the worked examples (ED.6).
Its consumers are ArithmeticDynamics (DY.3 uses the ED.0 height enumeration and the ED.3 and ED.4
certificates for preperiodic points and cycles of quadratic polynomials) and ComputationalNumberTheory
CN.3 (which uses the ED.3 local-image and saturation service). ArithmeticDynamics DY.6 and
MordellLawrenceVenkatesh LV.3 import Strassmann's theorem from ED.4: ED.4 sits upstream of DY.3 and
hence of DY.6, so the theorem has its single owner here.

General effective Mordell, decidability of rational points on curves, and eventual termination of
the Mordell–Weil sieve are not assumed anywhere. They are open problems, and no theorem of the
roadmap depends on them.

## Conventions

- **Certificates.** A certificate is finite data (rational numbers, integers, integer matrices,
  polynomials with rational coefficients, finite lists) together with a decidable check. Every
  certificate format comes with a soundness theorem whose hypotheses are exactly the check and the
  stated arithmetic input; nothing in a certificate is trusted without its check.
- **Precision.** A real or complex approximation carries a rational error bound, and a p-adic
  approximation carries an absolute precision `n` (the value is known modulo `pⁿ`). Every
  approximate output is checked against its bound. Numerical agreement never proves an algebraic
  identity: equality of algebraic numbers is decided by exact arithmetic (CN.0), and only
  nonvanishing is certified by an enclosure excluding zero.
- **Heights.** Heights follow RP.0 and the Tau Ceti EllipticCurves conventions. On an elliptic curve
  the Tau Ceti canonical height is the height attached to the divisor (O), ĥ(P) = lim h_x(2ⁿP)/(2·4ⁿ),
  and the pairing is ⟨P, Q⟩ = ½(ĥ(P+Q) − ĥ(P) − ĥ(Q)), so ⟨P, P⟩ = ĥ(P). Sources that use the
  x-coordinate height without the factor ½ differ by a factor 2, and every imported constant is
  converted before use.
- **Ranks.** An algebraic rank certificate is a pair of certificates: an upper bound (descent) and a
  lower bound (independent points with a positive regulator enclosure). A rank obtained from the
  analytic rank, the Birch and Swinnerton-Dyer conjecture or any other conditional input is
  labelled conditional, and a theorem using it states the condition as a hypothesis.
- **Termination.** An algorithm states sufficient conditions for termination. A computation that has
  not terminated (a sieve with survivors, a residue disc with an unresolved zero) is an open
  computation, never an empty solution set.
- **Groups.** Mordell–Weil groups and finite groups of local points are written additively and may
  have torsion.


## Sources

- **Algorithms for Diophantine equations** — B. M. M. de Weger, CWI Tract 65, Centrum voor Wiskunde en Informatica, Amsterdam, 1989 (scan with OCR layer). <https://ir.cwi.nl/pub/13190>
- **On the practical solution of the Thue equation** — N. Tzanakis, B. M. M. de Weger, J. Number Theory 31 (1989) 99–132. <https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf>
- **How to explicitly solve a Thue–Mahler equation** — N. Tzanakis, B. M. M. de Weger, Compositio Math. 84 (1992) 223–288. <http://www.numdam.org/item/CM_1992__84_3_223_0/>
- **Improved methods for calculating vectors of short length in a lattice, including a complexity analysis** — U. Fincke, M. Pohst, Math. Comp. 44 (1985) 463–471. <https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/>
- **Computing algebraic numbers of bounded height** — J. R. Doyle, D. Krumm, Math. Comp. 84 (2015) 2867–2891; read as arXiv:1111.4963v4. <https://arxiv.org/abs/1111.4963>
- **An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers. II** — E. M. Matveev, Izvestiya: Mathematics 64:6 (2000) 1217–1269 (English translation, version of record from mathnet.ru; the downloaded file contains §§1–2 and the start of the proof). <https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng>
- **Linear forms in p-adic logarithms III** — Kunrui Yu, Compositio Math. 91 (1994) 241–276 (version of record, Numdam; formulas read on page images). <http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf>
- **The difference between the Weil height and the canonical height on elliptic curves** — Joseph H. Silverman, Math. Comp. 55 (1990), no. 192, 723–743; version of record (AMS PDF). <https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/>
- **Algorithms for modular elliptic curves, Chapter III: Elliptic curve algorithms** — J. E. Cremona, 2nd edition, Cambridge University Press 1997; author's online full text of Chapter III. <https://johncremona.github.io/book/fulltext/index.html>
- **Counterexamples to the Hasse principle** — W. Aitken, F. Lemmermeyer, arXiv:1108.6310v1 (31 August 2011; the only arXiv version); published Amer. Math. Monthly 118 (2011) 610–628 (not read). <https://arxiv.org/abs/1108.6310>
- **Cycles of quadratic polynomials and rational points on a genus-2 curve** — E. V. Flynn, Bjorn Poonen, Edward F. Schaefer, arXiv:math/9508211v1 (4 August 1995); published Duke Math. J. 90 (1997) 435–463 (not read). <https://arxiv.org/abs/math/9508211>
- **Rational 6-cycles under iteration of quadratic polynomials** — Michael Stoll, arXiv:0803.2836v2 (21 April 2009); published LMS J. Comput. Math. 11 (2008) 367–380 (not read). <https://arxiv.org/abs/0803.2836>
- **Explicit Chabauty over number fields** — Samir Siksek, arXiv:1010.2603v2; published Integers 13 (2013). <https://arxiv.org/abs/1010.2603>
- **Remarks and errata** — Bjorn Poonen, author's page, list dated 14 August 2025. <https://math.mit.edu/~poonen/papers/errata.pdf>
- **Saturation of Mordell–Weil groups of elliptic curves over number fields** — Martin Prickett, PhD thesis, University of Nottingham, 2004; repository copy (Type 3 fonts, read from rendered pages). <https://repository.nottingham.ac.uk/handle/123456789/50666>
- **The method of Chabauty and Coleman** — William McCallum and Bjorn Poonen, Author copy dated June 14, 2010 (pp. 1–17); published in Explicit methods in number theory, Panoramas et Synthèses 36 (2012), 99–117. Page numbers cited are those of the author copy.. <https://math.mit.edu/~poonen/papers/chabauty.pdf>
- **Quadratic points on modular curves with infinite Mordell–Weil group** — Josha Box, arXiv:1906.05206; published Math. Comp. 90 (2021), 321–343 (not read). <https://arxiv.org/abs/1906.05206>
- **On the modularity of elliptic curves over imaginary quadratic fields** — Ana Caraiani and James Newton, arXiv:2301.10509; arXiv v3 (27 March 2025) read, SHA-256 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3; v1 and v2 compared at §7.4. <https://arxiv.org/abs/2301.10509>
- **The complete classification of rational preperiodic points of quadratic polynomials over Q: a refined conjecture** — Bjorn Poonen, arXiv:math/9512217v1 (1995 preprint, 19 pp.); published Math. Z. 228 (1998), 11–29, not read. Poonen's 'Remarks and errata' (https://math.mit.edu/~poonen/papers/errata.pdf, dated August 14, 2025, SHA-256 d369e65f3af0c8304297de8b4a5c0fc3e72ff350c4b44b25a0ef83ee9c3a0377) read for this paper's entry.. <https://arxiv.org/abs/math/9512217v1>
- **Uniform bounds for the number of rational points on hyperelliptic curves of small Mordell–Weil rank** — Michael Stoll, arXiv:1307.1773v4; published J. Eur. Math. Soc. 21 (2019), 923–956 (not read). <https://arxiv.org/abs/1307.1773v4>
- **Uniform bounds for the number of rational points on curves of small Mordell–Weil rank** — Eric Katz, Joseph Rabinoff and David Zureick-Brown, arXiv:1504.00694v2; published Duke Math. J. 165 (2016), 3189–3240 (not read). <https://arxiv.org/abs/1504.00694v2>
- **Explicit Coleman integration for hyperelliptic curves** — Jennifer S. Balakrishnan, Robert W. Bradshaw and Kiran S. Kedlaya, arXiv:1004.4936v2; ANTS IX, Lecture Notes in Computer Science 6197 (2010) (not read). <https://arxiv.org/abs/1004.4936v2>
- **The Mordell–Weil sieve: proving non-existence of rational points on curves** — Nils Bruin and Michael Stoll, LMS Journal of Computation and Mathematics 13 (2010), 272–306; version of record, doi:10.1112/S1461157009000187. <https://doi.org/10.1112/S1461157009000187>
- **Explicit Chabauty–Kim for the split Cartan modular curve of level 13** — Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk, Annals of Mathematics 189 (2019), 885–944, doi:10.4007/annals.2019.189.3.6 (published version). <https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf>
- **Quadratic Chabauty for modular curves: algorithms and examples** — Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk, arXiv:2101.01862v4 (7 March 2023); published in Compositio Mathematica 159 (2023). <https://arxiv.org/abs/2101.01862v4>

## Layer overview

| Layer | Title | Declarations | Key definitions and theorems |
|---|---|---|---|
| ED.0 | Certified algebraic numbers and local precision | 9 | Embedding pinned by an isolating box; Hensel embedding certificate; Certified nonvanishing; Algebraic numbers of bounded height |
| ED.1 | Lattice reduction and integer relations | 11 | Approximation lattice; Distance lemma for reduced bases; p-adic approximation lattice; p-adic reduction step; Fincke–Pohst enumeration; Lattice exclusion certificate |
| ED.2 | Linear forms in logarithms and S-unit equations | 32 | Certified Matveev constant; p-adic discrete-logarithm lattice; Tzanakis–de Weger method for Thue equations; Prime ideal removing lemma; Thue–Mahler solution certificate; S-unit equation certificate |
| ED.3 | Descent, rank bounds and saturation | 29 | Certified 2-Selmer group; 2-descent rank bound; Descent via 2-isogeny; Silverman's height difference bound; Saturation by reduction; Mordell–Weil basis certificate |
| ED.4 | Classical Chabauty–Coleman | 26 | p-adic abelian logarithm; Annihilating differentials; Chabauty's theorem; Coleman's bound; Chabauty–Coleman certificate; Relative symmetric Chabauty |
| ED.5 | Mordell–Weil sieve and combination certificates | 41 | Mordell–Weil sieve classes; Sieve soundness; Jacobian reduction square; Chabauty–sieve combination; Relative symmetric Mordell–Weil sieve; Mordell–Weil sieve certificate |
| ED.6 | Explicit higher methods and reproducible examples | 39 | Certified solution set; Comparison of p-adic candidates with global points; Explicit Frobenius structure on A_Z; Quadratic Chabauty algorithm for modular curves; Rational points of X_s(13); Split Cartan case of Serre's uniformity |

Inside the roadmap the layers form two chains that meet in the sieve: ED.0 → ED.1 → ED.2 → ED.5 (numbers, lattices, logarithmic forms) and ED.0 → ED.3 → ED.4 → ED.5 (descent, Chabauty), followed by ED.6, which consumes all of them.

## ED.0. Certified algebraic numbers and local precision

This layer turns the exact algebraic-number presentations of ComputationalNumberTheory CN.0 into the Diophantine-facing objects that the other layers of this roadmap consume: embeddings of a number field pinned by an isolating box or by a Hensel certificate, enclosures of the images of field elements with an explicit rational error bound, certified nonvanishing and certified valuations, certified heights, and the complete enumeration of points of bounded height. Every approximate output of the layer carries a rational error bound that is checked by exact rational (or p-adic-valuation) arithmetic, and no numerical agreement is ever accepted as a proof of an algebraic identity.

**Scope boundary.** The layer uses CN.0 (exact isolated algebraic numbers, p-adic approximation records) and Mathlib only. It evaluates no analytic function: interval and ball arithmetic for analytic quantities, real and p-adic logarithms, `log |σ(α)|`, and propagated analytic error all belong to ED.2, which computes them through CN.4 from the exact enclosures produced here (ED.0 hands over rational enclosures of `|σ(α)|²` and p-adic enclosures of `σ_p(α)`). Mathlib supplies the number-field side: `PowerBasis`, `PowerBasis.lift`, `NumberField.InfinitePlace`, `NumberField.ComplexEmbedding`, `hensels_lemma`, `Padic.valuation`, `PadicInt.appr`, and the heights `Height.mulHeight₁`, `Height.logHeight` with Northcott's theorem `NumberField.finite_setOfPred_mulHeight₁_le`.

### Conventions

- A number field `K` of degree `d` is presented by a power basis `pb : PowerBasis ℚ K` with generator `θ` and minimal polynomial `f = minpoly ℚ θ`; an element `α` is given by its coordinates `pb.basis.repr α ∈ ℚ^d`, so `α = Σ_j a_j θ^j`. Where p-adic embeddings or bounded-height enumeration are used, `θ` is integral over `ℤ` and `f` is monic with integer coefficients.
- Heights are Mathlib's: `Height.mulHeight₁ x` is the **relative** multiplicative height of `x ∈ K` (the product over all places of `K` with the multiplicities of `NumberField.mulHeight₁_eq`), and `Height.logHeight` is the logarithmic height of a tuple, used on representatives of points of `ℙ¹(L) = Projectivization L (Fin 2 → L)`. The absolute height is `NumberField.absMulHeight₁`; the two differ by the power `[K : ℚ]`.
- Precision is absolute: a real or complex enclosure has precision `n` when its widths are at most `2^(−n)`; a p-adic enclosure `(c, N)` has precision `N`.
- Zero tests are exact: `α = 0` exactly when its coordinates vanish.

### Objects and constructions

- **Certified enclosures and the precision contract** (`ED.0/certified-enclosure`, `RealEnclosure`). A `RealEnclosure t` is a closed nonempty rational interval `[l, u]` (`NonemptyInterval ℚ`) with `l ≤ t ≤ u`; its rational error bound is `u − l`. A `ComplexEnclosure z` is a pair of rational intervals containing `Re z` and `Im z`. A `PadicEnclosure x` for `x ∈ ℚ_p` is a rational centre `c` and an integer `N` with `‖x − c‖ ≤ p^(−N)`; its canonical record is the CN.0 `PadicApproximation` `(N, v, s)` with `v = min(v_p(c), N)` and `s` the residue of `c·p^(−v)` modulo `p^(N−v)` (`s = 0` when `v = N`). API: `RealEnclosure.width`, `abs_sub_le` (every rational in the interval is within the width of `t`), `ofRat`, `widen`; `ComplexEnclosure.mem_box`, `normSq_le` (a rational upper bound for `|z|²`), `toRealEnclosure` (when the imaginary interval is `[0, 0]`); `PadicEnclosure.ofRat`, `toPadicApproximation`. Unit tests: `[141/100, 142/100]` encloses `√2` with width `1/100` (precision 6, not 7); `ofRat q` has width `0`; `([0,0],[1,1])` encloses `i`; the zero-centred ball `(0, 2)` at `p = 3` encloses `9 ≠ 0`; `[1, 2]` encloses both `1` and `2`, so a common enclosure proves no equality; at `p = 3` the enclosure `(5, 1)` has canonical record `(1, 0, 2)`.
- **Refinement of isolating intervals** (`ED.0/isolating-interval-refinement`, `RealRootIsolation`). A real isolating interval for `g ∈ ℚ[X]` is a rational interval containing exactly one real root of `g`. `refine I n` bisects exactly: pass to the squarefree part `g / gcd(g, g′)`, return a degenerate interval if an endpoint or midpoint is a root, and otherwise keep the half on which the sign changes; after `n` steps the width has been divided by `2^n` and the root is unchanged. A CN.0 certificate whose root is real gives a real isolation (`ofRealCertificate`). For the root `z` of an archimedean certificate, `Re z = (z + z̄)/2` and `Im z = (z − z̄)/(2i)` have CN.0 certificates built from those of `z`, of `z̄` (the conjugate box) and of `i` by CN.0's addition, multiplication and inversion certificates, so refining them refines the box of `z`. API: `root`, `refine`, `refine_root`, `refine_width`, `toEnclosure`, `ofRealCertificate`. Unit tests: for `X² − 2` on `[1, 2]`, `refine 3 = [11/8, 3/2]`; a degenerate isolation `[q, q]` of `X − q` stays degenerate; for `X − 1/2` on `[0, 1]` the first midpoint is the root; `[−2, 2]` is not an isolation for `X² − 2`.
- **Archimedean embeddings pinned by isolating boxes** (`ED.0/archimedean-embedding-certificate`, `ArchimedeanEmbeddingCertificate`). A certificate is a CN.0 `AlgebraicRootCertificate (f, R, I)` for the minimal polynomial `f` of `θ`: exactly one complex root `z` of `f` lies in `R × I`. Its embedding `σ_c = PowerBasis.lift pb z : K →+* ℂ` is the unique embedding with `σ_c(θ) = z` and the only one sending `θ` into the box. Every embedding has a certificate, and `[K : ℚ]` certificates with pairwise disjoint boxes contain every embedding. For a box of centre `w = w₁ + i w₂` and half-widths at most `r`, with `M = |w₁| + |w₂| + 2r`, the evaluation bound is `|σ_c(α) − Σ_j a_j w^j| ≤ 2r Σ_j j |a_j| M^(j−1)`, so the box with centre `Σ_j a_j w^j ∈ ℚ(i)` and that rational half-width encloses `σ_c(α)`; refining until the half-width is at most `2^(−n−1)` gives precision `n`. If the imaginary interval is symmetric about `0` the embedding is real. The infinite place is `InfinitePlace.mk σ_c`; two certificates give the same place exactly when their roots are equal or conjugate. API: `root`, `embedding`, `embedding_gen`, `eq_embedding_of_mem`, `exists_of_embedding`, `isReal_of_symmetric`, `infinitePlace_apply`, `norm_sub_eval_le`, `refine`, `complete_of_disjoint`, `evalEnclosure`, `evalEnclosure_width`. Unit tests: for `X² − 2` and `[1, 2] × [0, 0]`, `σ_c(θ) = √2` and the embedding is real; for `X − 1` the certificate fixes `ℚ`; `[−2, 2] × [0, 0]` is not a certificate for `X² − 2`; for `X² + 1` the boxes around `i` and `−i` give conjugate embeddings and one infinite place.
- **p-adic embeddings pinned by Hensel certificates** (`ED.0/padic-embedding-certificate`, `PadicEmbeddingCertificate`). For prime `p`, a certificate is an integer `a` with `f′(a) ≠ 0` and `v_p(f(a)) > 2 v_p(f′(a))`, an exact integer check. `hensels_lemma` gives the unique root `z ∈ ℤ_p` with `‖z − a‖ < ‖f′(a)‖`, and `σ_a = PowerBasis.lift pb z : K →+* ℚ_p` is the only embedding sending `θ` into that disc. Newton iteration gives integers `b` with `v_p(f(b)) ≥ N + v_p(f′(a))`, and then `z ≡ b (mod p^N)` by the exact-distance theorem below; for `α` with `e = max(0, −min_j v_p(a_j))`, `(Σ_j a_j b^j, N − e)` is a `PadicEnclosure` of `σ_a(α)`. Two certificates `a, a′` give different embeddings when `‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖)`. Embeddings `K → ℚ_p` correspond to the roots of `f` in `ℚ_p` (`PowerBasis.liftEquiv'`). API: `root`, `embedding`, `embedding_gen`, `eq_embedding_of_near`, `root_sub_mem`, `evalEnclosure`, `ne_of_far`, `embedding_algebraMap`. Unit tests: for `X² − 2` at `p = 7`, `a = 3` is a certificate and `σ_a(θ) ≡ 10 (mod 49)`; `a = 3` and `a = 4` give the two embeddings `ℚ(√2) → ℚ_7`; for `X − 1`, `a = 1` has root `1`; `X² − 2` has no certificate at `p = 5`; `σ_a` restricts to the canonical map on `ℚ`.
- **Certified valuations** (`ED.0/valuation-certificate`, `ValuationCertificate`). A valuation certificate for `α ∈ K^×` and `σ_a` is a `PadicEnclosure (c, N)` of `σ_a(α)` with `c ≠ 0` and `v_p(c) < N`: the precision exceeds the valuation, and then `Padic.valuation (σ_a α) = padicValRat p c`. Every `α ≠ 0` has one at each precision `N > v_p(σ_a(α))`. The prime `𝔭_a = {x ∈ 𝓞_K : ‖σ_a(x)‖ < 1}` has completion `ℚ_p`, so `e = f = 1` and `v_{𝔭_a}(α) = v_p(σ_a(α))`; in Mathlib's normalisation `HeightOneSpectrum.valuation K α = WithZero.exp(−v_p(σ_a(α)))`. Certificates multiply: `(c, N)` and `(c′, N′)` give `(cc′, min(v + N′, N + v′))`. API: `valuation_eq`, `ne_zero`, `exists_of_ne_zero`, `prime`, `adicValuation_eq`, `mul`. Unit tests: for `ℚ` and `p = 3`, `(18, 3)` certifies `v_3(18) = 2`; for `X² − 2` at `p = 7`, `a = 3`, the enclosure `(7, 2)` certifies `v_7(σ_a(θ − 3)) = 1`; `(1, 1)` certifies valuation `0`; a zero-centred enclosure is never a certificate.
- **Certified heights** (`ED.0/height-enclosure`, `heightEnclosure`). For `x ∈ K` let `P_x ∈ ℤ[X]` be the primitive integral multiple, with positive leading coefficient `a_x`, of the characteristic polynomial of multiplication by `x`. Then `Height.mulHeight₁ x = a_x · ∏_σ max(1, |σ(x)|)` over all `d` embeddings `σ : K →+* ℂ`: the non-archimedean part of the height is the integer `a_x`, and `mulHeight₁ x` is the Mahler measure `M(P_x)` (DT.0's `M(x) = absMulHeight₁(x)^(deg x)` together with `absMulHeight₁ = mulHeight₁^(1/[K:ℚ])`). `heightEnclosure x n` encloses `mulHeight₁ x` with width at most `2^(−n)` from the archimedean certificates of all embeddings, using only `|σ(x)|²`-enclosures, monotone products of nonnegative intervals and rational square-root brackets. API: `heightEnclosure_width`, `mulHeight₁_eq_mahlerMeasure_charpoly`, `mulHeight₁_eq_leadingCoeff_mul_prod_embeddings`, `heightEnclosure_rat` (over `ℚ` the height is `max(|num x|, den x)`). Unit tests: `mulHeight₁(1/2) = 2`; `mulHeight₁ √2 = 2` in `ℚ(√2)`; `mulHeight₁ 0 = 1`; the golden ratio has height `(1 + √5)/2` in `ℚ(√5)`; in `ℚ(√2)` the relative height of `√2` is `2` while its absolute height is `√2`.
- **Algebraic numbers of bounded height** (`ED.0/bounded-height-enumeration`, `boundedHeightPoints`). For a number field `L` with integral power-basis generator and a complete list of archimedean certificates, and rationals `D ≥ 1`, `τ ∈ (0, 1]`, the construction returns finite sets `S_<` and `S_≈` with: every `x` with `mulHeight₁ x ≤ D` lies in `S_< ∪ S_≈`; every `x ∈ S_<` has `mulHeight₁ x < D`; every `x ∈ S_≈` has `|mulHeight₁ x − D| < τ` (the output contract of Doyle–Krumm's Algorithm 4). On `ℙ¹(L)`, the set `T` of the points `[x : 1]` with `x ∈ S_< ∪ S_≈` together with `[1 : 0]` contains every point `P` with `Height.logHeight P.rep ≤ log D`. Candidates come from a denominator-and-box bound (as in Pethő–Schmitt, Doyle–Krumm Theorem 5.1): `c = natDenominator x ≤ D` (`NumberField.natDenominator_le_mulHeight₁`), `y = c·x` is integral with `|σ(y)| ≤ D²` for all `σ`, `disc(pb.basis)·y ∈ ℤ[θ]` (`Algebra.discr_mul_isIntegral_mem_adjoin`), and the power-basis coordinates of `y` are bounded through the Vandermonde inverse computed from the certificates; each candidate is then kept or discarded by a height enclosure of width below `τ`. API: `mem_boundedHeightPoints_of_mulHeight₁_le`, `mulHeight₁_lt_of_mem_lt`, `abs_mulHeight₁_sub_lt_of_mem_near`, `boundedHeightProjectivePoints`, `mem_boundedHeightProjectivePoints`, `boundedHeightPoints_superset` (the `toFinset` of Mathlib's Northcott set is contained in the output). Unit tests: for `ℚ`, `D = 2`, `τ = 1/2`: `S_< = {0, ±1}`, `S_≈ = {±2, ±1/2}`, and `T` has 8 points; for `ℚ(i)`, `D = 1`: `S_< = ∅`, `S_≈ = {0, ±1, ±i}`; restricting to integral candidates misses `1/2`; `[1 : 0] ∈ T`; for `ℚ` and `D = 3` the 15 elements of height at most 3 are listed.

### Theorems

- **Hensel's lemma with the exact distance** (`ED.0/hensel-root-distance`, `norm_sub_eq_of_hensel`). If `‖F(a)‖ < ‖F′(a)‖²` in `ℤ_p` and `z` is the Hensel root, then every `b` with `‖b − a‖ < ‖F′(a)‖` satisfies `‖F′(b)‖ = ‖F′(a)‖` and `‖z − b‖ = ‖F(b)‖/‖F′(a)‖`. Proof by Taylor expansion at `z` and the strict ultrametric inequality; it is the public, uniform form of Mathlib's private `soln_dist_to_a`. Acceptance: for `X² − 2`, `p = 7`, `a = 3`, `b = 10`: `F(10) = 98`, so `z ≡ 10 (mod 49)` and `z ≢ 10 (mod 343)`.
- **Certified nonvanishing** (`ED.0/certified-nonvanishing`, `ne_zero_of_enclosure`). (a) `α = 0` exactly when its coordinates vanish; identities `α = β` are decided only this way (or by CN.0's `algebraicEqual` for CN.0 presentations). (b) A complex enclosure of `σ_c(α)` whose box excludes `0` proves `α ≠ 0`, hence `τ(α) ≠ 0` for every ring homomorphism from `K` to a field. (c) A p-adic enclosure `(c, N)` of `σ_a(α)` with `c ≠ 0` and `v_p(c) < N` proves `α ≠ 0`. (d) The test is complete: for `α ≠ 0`, every precision-`n` complex enclosure with `2·4^(−n) < |σ_c(α)|²` excludes `0`, and every p-adic enclosure of precision above `v_p(σ_a(α))` has a nonzero centre of that valuation. (e) An enclosure containing `0` proves nothing. Acceptance: in `ℚ(√2)`, `α = 3363 − 2378θ` has `σ_c(α) = (1 − √2)^10 ≈ 1.4867·10^(−4)`; precision 10 cannot decide, precision 14 excludes `0`, and the coordinates `(3363, −2378)` prove `α ≠ 0` exactly.

### Dependencies

Inside the roadmap: ED.0 is the root of the stage graph; ED.1 uses `ED.0/certified-enclosure` for the rounding of lattice entries, and ED.2, ED.3 use all of the layer. Other roadmaps: `ComputationalNumberTheory:CN.0/algebraic-root-certificate`, `/rational-root-presentation`, `/algebraic-add-certificate`, `/algebraic-mul-certificate`, `/algebraic-inv-certificate`, `/algebraic-equality-check`, `/padic-approximation`; `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `/abs-mul-height-eq-rpow`, `/primitive-minimal-polynomial` (for the height identity; this adds the stage edge DT.0 → ED.0). Consumers outside the roadmap: `ArithmeticDynamics:DY.3/rational-preperiodic-enumeration-over-a-number-field` uses `ED.0/bounded-height-enumeration`.

### Acceptance

Every approximate output is a `RealEnclosure`, `ComplexEnclosure` or `PadicEnclosure` whose width or precision is a rational checked exactly; the Pell-unit test above shows that numerical agreement does not decide `α = 0`, which is decided from coordinates. The bounded-height enumeration over `ℚ` with `D = 2` returns exactly the 8 points of `ℙ¹(ℚ)` of height at most `2`.

## ED.1. Lattice reduction and integer relations

This layer supplies the reduction step of the Baker–Davenport–de Weger method: from a linear form in logarithms that is extremely small for every solution, together with an enormous a priori bound for the unknowns, it builds an approximation lattice, reduces it with the verified LLL algorithm of GeometryOfNumbersAndQuadraticArithmetic GN.5, and proves a lower bound that excludes every integer vector in a specified box, real or p-adic. It also supplies the Fincke–Pohst enumeration of all lattice vectors in an ellipsoid with its completeness theorem, used both as a second distance certificate and for the exhaustive residual enumeration of ED.2. LLL itself, exact Gram–Schmidt arithmetic, termination and the approximation factor are GN.5's and are not planned here.

### Conventions

- Unknowns `x_1, …, x_n` are indexed from `1` as in the sources, and in Lean by `Fin (k + 1)` with `n = k + 1`; the last index carries the linear form. Reduced bases follow GN.5's zero-based convention `c_0, …, c_{n−1}`, with `c_0` the first reduced vector.
- Lattice vectors live in `ℤ^n ⊂ ℝ^n` with the Euclidean norm; all bounds are stated for squared norms, so that every certificate check is a comparison of rationals.
- The rounding contract: the integer entries `φ_i` approximate `Cθ_i` with `|φ_i − Cθ_i| ≤ 1` (nearest-integer rounding of an enclosure's midpoint when `C·width ≤ 1`, or rounding toward zero as in Tzanakis–de Weger 1992 §16); the target entry `ψ` satisfies `|ψ − Cβ| ≤ 1`.
- `‖s‖` denotes the distance from `s ∈ ℝ` to the nearest integer, `min(fract s, 1 − fract s)`.
- The p-adic linear form is normalised as `Λ′(b) = b_n − β_0 − Σ_{j<n} b_jβ_j` with `β_j ∈ ℤ_p`, and `ord_p Λ′(b) ≥ m` is written `p^m ∣ Λ′(b)` in `ℤ_p`; `x^(m) = PadicInt.appr x m ∈ [0, p^m)`.

### Objects and constructions

- **The approximation lattice of a real linear form** (`ED.1/linear-form-lattice`, `linearFormLattice`). For `n ≥ 2`, reals `θ_1, …, θ_n` (and `β`), a positive rational `C`, positive integer weights `W_1, …, W_{n−1}` and integers `φ_i` (and `ψ`) satisfying the rounding contract with `φ_n ≠ 0`, the lattice `Γ = Aℤ^n` is spanned by the columns of the matrix `A` with rows `W_i e_i` (`i < n`) and last row `(φ_1, …, φ_n)`, so `Ax = (W_1x_1, …, W_{n−1}x_{n−1}, Σ x_iφ_i)` and `det A = W_1⋯W_{n−1}φ_n`. The inhomogeneous target is `y = (0, …, 0, −ψ)`. Identities: `‖Ax‖² = Σ_{i<n} W_i²x_i² + Λ̃(x)²`, `|Λ̃(x) − CΛ(x)| ≤ Σ|x_i|`, `‖Ax − y‖² = Σ_{i<n} W_i²x_i² + (Λ̃(x) + ψ)²`. The Gram matrix `AᵀA` is integral, the input format of GN.5's `exactLLL`. de Weger takes all `W_i = γ`; Tzanakis–de Weger 1989 take `W_i = 1`, `C = c_0`. API: `linearFormMatrix`, `linearFormMatrix_mulVec`, `linearFormMatrix_det`, `mem_linearFormLattice` (`v ∈ Γ` iff `W_i ∣ v_i` for `i < n` and `φ_n ∣ v_n − Σ (v_i/W_i)φ_i`), `linearFormMatrix_mulVec_injective`, `normSq_linearFormMatrix_mulVec`, `abs_linearForm_sub_le`, `linearFormTarget`, `roundOfEnclosure`, `linearFormMatrix_gram_integral`. Unit tests: `W_1 = 1`, `φ = (3, 7)` gives `A = [[1, 0], [3, 7]]`, `det A = 7`, `(1, 3) ∈ Γ`, `(0, 1) ∉ Γ`, and `v ∈ Γ ⇔ 7 ∣ v_2 − 3v_1`; unit weights and `φ_n = 1` give `Γ = ℤ^n`; `φ = (69314718, 109861229)` meets the contract for `θ = (log 2, log 3)`, `C = 10^8`; `φ_n = 0` is rejected (singular).
- **The approximation lattice of a p-adic linear form** (`ED.1/padic-linear-form-lattice`, `padicLatticeMatrix`). For prime `p`, `m ∈ ℕ`, `β_0, …, β_{n−1} ∈ ℤ_p` and positive weights `W_1, …, W_n`, the lattice `Γ_m` is spanned by the columns of the matrix `A_m` with rows `W_i e_i` (`i < n`) and last row `W_n(β_1^(m), …, β_{n−1}^(m), p^m)`; the target is `y_m = (0, …, 0, −W_nβ_0^(m))`. The characterisation (Tzanakis–de Weger 1992, Lemma 14) is `p^m ∣ Λ′(b) ⇔ (W_jb_j)_j + y_m ∈ Γ_m`, and then `‖(W_jb_j)_j‖` is the distance of that lattice vector from `y_m`; `det A_m = p^m ∏ W_j`. The sign of `y_m` is `−`: with `+β′^(μ)`, as printed in de Weger's Lemma 3.15, the translate describes a different residue class (see the source issues). The `β_j^(m)` are read from p-adic enclosures of precision at least `m` with `p`-integral centres. API: `padicLatticeMatrix`, `padicLatticeTarget`, `padicLinearForm`, `mem_padicLattice_iff`, `padicLatticeMatrix_det`, `padicLattice_antitone`, `apprOfEnclosure`. Unit tests: for `p = 3`, `m = 1`, `β_1 = 0`, `β_0 = 1`: `Γ_1 = ℤ × 3ℤ`, `y_1 = (0, −1)` and `b = (0, 1)` is admissible; the `+` sign characterises the wrong class; `m = 0` admits every `b`; for one unknown the condition is `b ≡ PadicInt.appr β_0 m (mod p^m)`.
- **Fincke–Pohst enumeration** (`ED.1/short-vector-enumeration`, `fpEnumeration`). For a symmetric rational matrix `G` (the Gram matrix of a lattice basis), a rational centre `t` and a rational bound `R`, quadratic completion gives rationals `q_ij` with `xᵀGx = Σ_i q_ii(x_i + Σ_{j>i} q_ijx_j)²`; all pivots `q_ii` are positive exactly when `G` is positive definite. `fpEnumeration G t R` runs the level-by-level recursion of Fincke–Pohst (2.8) with centre `t`: at level `k`, given the coordinates above `k`, `x_k` runs over the finitely many integers with `q_kk(x_k − t_k + U_k)² ≤ T_k`, decided by exact rational comparison, and `T_{k−1} = T_k − q_kk(x_k − t_k + U_k)²`. Unlike the printed algorithm, the output contains both `x` and `−x` and contains `0` when `t = 0` and `R ≥ 0`. API: `quadraticCompletion`, `quadraticCompletion_spec`, `quadraticCompletion_pivot_pos_iff`, `fpEnumeration_neg`, `fpEnumeration_of_neg`, `fpEnumeration_mono`. Unit tests: `G = I_2`, `R = 1` gives the five vectors `0, ±e_1, ±e_2`; `G = [[2, 1], [1, 2]]`, `R = 2` gives the seven vectors `0, ±(1, 0), ±(0, 1), ±(1, −1)`, while `(1, 1)` (value `6`) is excluded although it lies in the coordinate box; `n = 1`, `t = 1/2`, `R = 1/4` gives `{0, 1}`; `R < 0` gives `∅`.
- **Lattice exclusion certificates** (`ED.1/exclusion-certificate`, `RealExclusionCertificate`, `PadicExclusionCertificate`). A real certificate consists of the data of the real lattice (with the enclosures certifying the rounding contract), rational box bounds `X_i ≥ 0`, a margin `μ > 0`, a distance witness for `(A, y)` (with `y = 0` in the homogeneous case), and the rational inequality `L² ≥ Σ_{i<n} W_i²X_i² + (ε + Σ X_i + μ)²`, `ε = 1` (inhomogeneous) or `0` (homogeneous). A p-adic certificate consists of the p-adic lattice data, box bounds `X_j`, a distance witness for `(A_m, y_m)` and `L² > Σ W_j²X_j²`. A distance witness is either an **LLL witness** — a GN.5 unimodular certificate `(U, U^(−1))` with `AU` LLL-reduced at `δ = 3/4`, the exact rational coordinates `s = (AU)^(−1)y`, the last non-integral index `i_0`, and `L² = 2^(−(n−1))‖s_{i_0}‖²‖c_0‖²` (or `2^(−(n−1))‖c_0‖²` when `y = 0`) — or an **enumeration witness** — a rational `R ≥ 0` with `L²` the minimum of `R` and of `‖Ax − y‖²` over the Fincke–Pohst output (nonzero `x` when `y = 0`). All fields are finite exact data. API: `DistanceWitness`, `DistanceWitness.bound`, `DistanceWitness.sound`, `DistanceWitness.ofLLL`, `RealExclusionCertificate`, `PadicExclusionCertificate`, `RealExclusionCertificate.check`. Unit tests: the computed homogeneous certificate for `(log 2, log 3)`, `C = 10^8`, `X = (1000, 1000)`, `μ = 1000`, with `c_0 = (−1054, 4513)`; a zero box is excluded trivially; if `y ∈ Γ` every witness has bound `≤ 0`; the one-dimensional p-adic certificate `p = 3`, `m = 2`, `β_0 = 5`, `X_1 = 3`, `R = 15`.

### Theorems

- **Distance lemma for reduced bases** (`ED.1/reduced-basis-distance-lower-bound`, `sq_norm_sub_ge_of_reduced`). Let `c_0, …, c_{n−1}` be linearly independent with `‖c*_i‖² ≥ 2^(−(n−1))‖c_0‖²` for all `i` (Mathlib's `gramSchmidt`; true for LLL-reduced families by GN.5's growth lemma, de Weger (3.12)). (a) Nonzero lattice vectors have `‖v‖² ≥ 2^(−(n−1))‖c_0‖²` (de Weger Lemma 3.4). (b) For `y = Σ s_ic_i` with `i_0` the last index with `s_{i_0} ∉ ℤ`, every lattice vector has `‖v − y‖² ≥ 2^(−(n−1))‖s_{i_0}‖²‖c_0‖²` (Lemma 3.5). (c) For any index `i_0` (not necessarily the last non-integral one) with `‖s_i‖ ≤ δ_1` for `i > i_0` and `‖s_{i_0}‖ ≥ δ_2 > 0`, `‖v − y‖ ≥ 2^(−(n−1)/2)δ_2‖c_0‖ − (n − 1 − i_0)δ_1 max_{i>i_0}‖c_i‖` (Lemma 3.6). Acceptance: for `ℤ²` and `y = (1/2, 0)` the bound is `1/8` against the true `1/4`; Tzanakis–de Weger's `|b_1| > 1.092·10^4`, `‖s_3‖ > 0.143` give a distance above `780`.
- **Homogeneous reduction** (`ED.1/homogeneous-reduction`, `mul_abs_linearForm_ge_of_norm_ge`). If every nonzero vector of `Γ` has norm at least `L` and `L² ≥ Σ_{i<n} W_i²X_i² + (Σ X_i + μ)²`, then every nonzero `x` with `|x_i| ≤ X_i` satisfies `C|Λ(x)| ≥ μ`; hence `|Λ(x)| < c·exp(−δ max|x_i|)` forces `max|x_i| < (1/δ)log(cC/μ)`. de Weger's Lemma 3.7 (`ℓ(Γ) ≥ √((n+1)² + (n−1)γ²)X_1`) and Tzanakis–de Weger's Proposition 3.1 are special cases. Acceptance: for `θ = (log 2, log 3)`, `C = 10^8`, the reduced vector `c_0 = (−1054, 4513)` (`‖c_0‖² = 21478085`) gives `|x_1 log 2 + x_2 log 3| ≥ 10^(−5)` for all nonzero `|x_i| ≤ 1000`.
- **Inhomogeneous reduction** (`ED.1/inhomogeneous-reduction`, `mul_abs_inhomogeneousForm_ge_of_dist_ge`). If every lattice vector is at distance at least `L` from `y` and `L² ≥ Σ_{i<n} W_i²X_i² + (1 + Σ X_i + μ)²`, then every `x` with `|x_i| ≤ X_i` satisfies `C|β + Λ(x)| ≥ μ`, with the same exponential consequence. de Weger's Lemma 3.10 (`X_1 ≥ 1`) and Tzanakis–de Weger's Proposition 3.2 (whose constant `√(4q² + 3q − 3/4)K_3` is sufficient exactly when `K_3 ≥ 2`, the condition its proof uses) are special cases. Acceptance: Tzanakis–de Weger 1989 §III.2 — with `c_0 = 10^140`, `K_3 = 3.26·10^40`, `‖s_3‖ > 0.029`, `|b_1| > 3.247·10^46` the bound drops to `A ≤ 72`, and with `c_0 = 10^12`, `K_3 = 72`, `‖s_3‖ > 0.143`, `|b_1| > 1.092·10^4` to `A ≤ 10`.
- **p-adic reduction** (`ED.1/padic-reduction`, `not_dvd_padicLinearForm_of_dist_ge`). If every vector of `Γ_m` is at distance at least `L` from `y_m` (nonzero vectors of norm at least `L` when `y_m = 0`, e.g. when `β_0 = 0`) and `L² > Σ W_j²X_j²`, then every `b` with `|b_j| ≤ X_j` (nonzero when `y_m = 0`) has `ord_p Λ′(b) ≤ m − 1`; combined with `ord_p Λ(b) = κ + ord_p Λ′(b)` and `ord_p Λ(b) ≥ c_1 + c_2b_k` this bounds `b_k`. This is Tzanakis–de Weger 1992 Proposition 15 and de Weger Lemmas 3.14, 3.16. Acceptance: Tzanakis–de Weger 1992 §15E at `p = 2`, `m = 1152`, six unknowns bounded by `K_0 = 9.844·10^49`: `l(Γ_m, y) > 3.98541·10^56 > √6·K_0`, so `n_1 ≤ 1153`.
- **Completeness of the Fincke–Pohst enumeration** (`ED.1/short-vector-enumeration-complete`, `mem_fpEnumeration_iff`). For symmetric `G` with positive pivots, `x ∈ fpEnumeration G t R ⇔ (x − t)ᵀG(x − t) ≤ R`; for a nonsingular integer basis `A` with `G = AᵀA` and `t = A^(−1)y`, the lattice points `v` with `‖v − y‖² ≤ R` are exactly the `Ax` for `x` in the output. Corollaries: an empty output certifies `‖v − y‖² > R` for all `v ∈ Γ`, and the output `{0}` with `t = 0` certifies `‖v‖² > R` for all nonzero `v`. Acceptance: the hexagonal example above; `Γ = ℤ(1, 0) + ℤ(0, 10)`, `y = (0, −1)`, `R = 1/2` gives the empty output.
- **Residual enumeration** (`ED.1/short-vector-reduction`, `mem_fpEnumeration_or_lt_mul_abs`). With `K_0 ≥ ε + Σ X_i` and `R = Σ_{i<n} W_i²X_i² + K_0²`, every `x` in the box either lies in the Fincke–Pohst output for `(AᵀA, A^(−1)y, R)` or satisfies `C|β + Λ(x)| > K_0 − ε − Σ|x_i|` (de Weger Lemma 3.8 and the procedure after it). Acceptance: for `θ = (1, √2)`, `C = 100`, `φ = (100, 141)`, `X_i = 3`, `K_0 = 6`, the output for `R = 45` is `{0}` because the shortest nonzero vector `(−7, 5)` has squared length `74`.
- **Soundness of exclusion certificates** (`ED.1/exclusion-certificate-sound`, `RealExclusionCertificate.sound`). A checked real certificate gives `C|β + Λ(x)| ≥ μ` for every `x` in its box (nonzero whenever the target `y` is `0`, in particular when homogeneous), and a checked p-adic certificate gives `ord_p Λ′(b) ≤ m − 1` for every `b` in its box (nonzero whenever `y_m = 0`). The proof combines the soundness of the witness (the distance lemma with GN.5's growth lemma and unimodular certificate, or the Fincke–Pohst completeness theorem) with the homogeneous, inhomogeneous or p-adic reduction theorem. This is the stage's acceptance theorem. Acceptance: the two Tzanakis–de Weger 1989 certificates exclude `73 ≤ A < 3.26·10^40` and `11 ≤ A ≤ 72`; the Tzanakis–de Weger 1992 certificate at `p = 2` excludes `ord_2 Λ′ ≥ 1152`; the computed `(log 2, log 3)` certificate excludes `|x_1 log 2 + x_2 log 3| < 10^(−5)` for `0 < max|x_i| ≤ 1000`.

### Dependencies

Inside the roadmap: ED.1 uses `ED.0/certified-enclosure` (rounding of `φ_i`, `ψ`, `β_j^(m)`); ED.2 consumes every node of this layer for the reduction steps and residual enumerations of the Thue, S-unit and Thue–Mahler algorithms. Other roadmaps: `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `/lll-gram-schmidt-growth`, `/lll-short-vector-factor`, `/unimodular-basis-certificate`, `/lll-integer-potential`, `/lll-exact-reduction`, `/lll-original-lattice-verification`. Mathlib: `InnerProductSpace.gramSchmidt`, `gramSchmidt_orthogonal`, `Submodule.span`, `Matrix.det`, `Matrix.mulVec`, `PadicInt.appr`, `PadicInt.appr_spec`, `round`, `Int.fract`.

### Acceptance

A lattice basis, a certified reduction and a proved lower bound excluding all remaining integer vectors of a specified region: Tzanakis–de Weger 1989 §III.2 (`A ≤ 72`, then `A ≤ 10`, followed by enumeration of the box), Tzanakis–de Weger 1992 §15E (`n_1 ≤ 1153` at `p = 2`), and the computed `(log 2, log 3)` instance, each as a `RealExclusionCertificate` or `PadicExclusionCertificate` whose soundness is `ED.1/exclusion-certificate-sound`.

## ED.2. Linear forms in logarithms and S-unit equations

**Dependencies:** `EffectiveDiophantineMethods:ED.0` (enclosures, archimedean and p-adic embedding certificates, height enclosures, valuation certificates); `EffectiveDiophantineMethods:ED.1` (approximation lattices, real and p-adic reduction theorems, Fincke–Pohst enumeration); `DiophantineApproximationAndTranscendence:DT.3` (Matveev's and Yu's lower bounds, Lifting the Exponent); `DiophantineApproximationAndTranscendence:DT.4` (equation-specific bounds, Siegel's identity, divisor representatives, S-unit exponent bound); `DiophantineApproximationAndTranscendence:DT.0` (absolute height computed in a number field); `ComputationalNumberTheory:CN.4` (rational interval and box arithmetic, root isolation, outward rounding, logarithm and arctangent enclosures); `ComputationalNumberTheory:CN.2` (unit-group and prime-ideal certificates).

This layer turns the imported explicit bounds of transcendence theory into **checkable certificates that determine solution sets exactly**. The lower bounds themselves are owned by DT.3 and the equation-specific search regions by DT.4; nothing here re-proves them. What this layer owns is (a) the certified evaluation of the constants of those bounds in exact rational arithmetic, with every precision budget explicit; (b) exact p-adic congruence lattices for multiplicative forms; (c) chains of lattice reductions over the certificates of ED.1; and (d) for Thue equations, Thue–Mahler equations and S-unit equations over `ℚ`, a certificate format and a theorem stating that a valid certificate lists **all** solutions, so that no solution lies outside the enumerated box. The method papers are Tzanakis–de Weger, *On the practical solution of the Thue equation* (J. Number Theory 31 (1989)), Tzanakis–de Weger, *How to explicitly solve a Thue–Mahler equation* (Compositio Math. 84 (1992)), and de Weger, *Algorithms for Diophantine equations* (CWI Tract 65, 1989), Chapters 3 and 6. The archimedean source is Matveev, *An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers II* (Izv. Math. 64 (2000)), Corollary 2.3; the p-adic source is Yu, *Linear forms in p-adic logarithms III* (Compositio Math. 91 (1994)), §0.1. Both are registered as separate sources: **citing their names supplies no numerical constant**; every constant used is computed and checked in the certificate.

### Standing conventions

- **Logarithms.** `Real.log` on positive reals; the principal complex logarithm is Mathlib's `Complex.log z = Real.log ‖z‖ + i·Complex.arg z` with `Complex.arg z ∈ (−π, π]`. A logarithm of an algebraic number `α` in DT.3's sense is any `λ` with `exp λ = α`; the certificates always use principal logarithms plus explicit multiples of `πi` (as `2a₀·Complex.log(−1)`).
- **Heights.** `h(α)` is `NumberField.absLogHeight₁ α`. Upper bounds come from ED.0's certified enclosure of Mathlib's relative height `mulHeight₁` in a number field `K` (`ED.0/height-enclosure`) through `h = Real.log(mulHeight₁)/[K : ℚ]` (`DT.0/abs-mul-height-eq-rpow`), with `Height.logHeight₁_mul_le`, `Height.logHeight₁_inv`, `Height.logHeight₁_sub_le` and conjugate invariance (`DT.4/conjugate-invariance-of-degree-and-height`) for products, quotients and differences of conjugates.
- **Numbers.** Every number stored in a certificate is an integer or a rational. Real quantities enter only through rational enclosures (ED.0 `RealEnclosure`, CN.4 boxes); every check is an exact comparison of rationals, an exact polynomial identity, modular arithmetic, or a finite enumeration. An enclosure never proves an equality, and an enclosure containing `0` never proves vanishing; **nonvanishing of every linear form is proved structurally** (from `m ≠ 0`, `x − yθ^{(i)} ≠ 0`, unique factorisation), never read off a numerical value.
- **Valuations.** `padicValRat p` for rationals; `v_p` with `v_p(p) = 1` in extensions of `ℚ_p`.
- **Binary forms.** For `g ∈ ℤ[X]` of degree `n` with leading coefficient `f₀`, the form is `F := Polynomial.homogenize g n`, `F(x, y) = Σ_k g_k x^k y^{n−k}`, so `F(x, 1) = g(x)` (Tzanakis–de Weger's `f_i` is `g_{n−i}`). Real roots `ξ^{(1)}, …, ξ^{(s)}` come first, then the conjugate pairs `ξ^{(s+i)}, ξ^{(s+t+i)} = conj ξ^{(s+i)}`, in the order of the certified root boxes; `α^{(i)} := σ_i(α)` for the embedding `σ_i` sending `ξ` to `ξ^{(i)}`.

### Certified evaluation of the imported bounds

- **Logarithm and argument enclosures** (`ED.2/logarithm-enclosure`, `logAbsEnclosure`, `argEnclosure`). For an embedded algebraic number with an ED.0 archimedean embedding certificate (a rational box `B` containing `σ(α)`), `logAbsEnclosure(B, P)` is a rational interval containing `Real.log ‖σ(α)‖`, obtained by halving the CN.4 enclosures of `Real.log` at the exact rational minimum and maximum of `x² + y²` on the box, with outward dyadic rounding at precision `P`; it is `none` exactly when `0 ∈ B`. `argEnclosure(B, P)` encloses `Complex.arg σ(α)` from arctangent enclosures of the corner values (`arctan(y/x)` for `x > 0`, `sign(y)·π/2 − arctan(x/y)` for `y ≠ 0`, with `π/2 = 2·arctan 1` enclosed by the CN.4 arctangent enclosure), and is `none` when the box meets `(−∞, 0]` (the branch cut: near `−1` the argument jumps from `π` to `−π`). **Precision budget:** a box of diameter `w` with `‖z‖ ≥ ρ⁻ > 0` gives width less than `w/ρ⁻ + 3·2^{−P}` (and `(π/2)w/ρ⁻ + 5·2^{−P}` for the argument), so absolute error `ε` is met by refining to diameter `ρ⁻ε/4` and `2^{−P} ≤ ε/16`. API: `log_norm_mem_logAbsEnclosure`, `arg_mem_argEnclosure`, `logAbsEnclosure_width_le`, `logAbsEnclosure_ofRat`. Tests: the enclosure of `log 2` at `P = 30` lies in `[0.6931471, 0.6931472]`; the point `1` gives an interval around `0` of width `≤ 2^{1−P}`; the point `−1` and a box containing `0` give `none`; the point `i` gives an interval containing `π/2`.
- **Matveev's constant** (`ED.2/certified-linear-form-constant`, `MatveevConstantCertificate`; exported). For `n` logarithms and a degree bound `D`, a certificate consists of rationals `A_j ≥ 0.16`, `s⁺` with `(s⁺)² ≥ n`, `ℓ⁺ ≥ Real.log D` and `c` with `c ≥ Ĉ(n)·D²·(1 + ℓ⁺)·∏A_j`, where `Ĉ(n) := max(min(e⁺n/2·30^{n+3}n³s⁺, 2^{6n+20}), min(½(e⁺n/2)²·30^{n+3}n³s⁺, 2^{6n+20}))` and `e⁺ = 2.7182818286 > e` (`Real.exp_one_lt_d9`). `Ĉ(n)` dominates Matveev's `C₁(n, κ) = min{κ^{−1}(en/2)^κ 30^{n+3}n^{3.5}, 2^{6n+20}}` for both `κ = 1` and `κ = 2`, so the certificate does not need to know whether the field is real. It is **admissible** for `α_1, …, α_n` in a number field `K ⊆ ℂ` with `[K : ℚ] ≤ D` and nonzero logarithms `λ_j` when `A_j ≥ D·h(α_j)` and `A_j ≥ |λ_j|` are certified by the height and logarithm enclosures; a degree bound suffices because the bound and the admissibility conditions are monotone in `D`. API: `matveevBound`, `Admissible`, `matveevC1_le`, `admissible_of_le_degree`, `ofHeightBounds`. Tests: for `n = 2`, `D = 1`, `A = (0.7, 1.1)` (admissible for `2, 3`) the least admissible `c` is `≈ 7.83·10⁸`, so `8·10⁸` is accepted and `7·10⁸` rejected; `Ĉ(1) = e⁺/2·30⁴ ≈ 1.10·10⁶`; `A₁ = 0.1` is never admissible; for `n ≥ 2` the `κ = 2` value dominates.
- **Theorem (certified lower bound)** (`ED.2/certified-linear-form-lower-bound`). For an admissible certificate and `b ∈ ℤ^n` with `Λ = Σ b_jλ_j ≠ 0`: `Real.log |Λ| > −c·(1 + Real.log max_j|b_j|)`. In Tzanakis–de Weger's notation this is Lemma 2.3 with `C₇ = c`, `C₈ = 1`. Proof: `DT.3/matveev-corollary-linear-form-bound` with `B*`, and the certificate inequality.
- **Yu's constant** (`ED.2/certified-padic-linear-form-constant`, `YuConstantCertificate`). For `n ≥ 2`, a degree bound `d` and a prime `p`: rationals `h_j`, `0 < λ_p⁻ ≤ Real.log p` with `λ_p⁻ ≤ h_j`, `L⁺ ≥ Real.log(10ndh′)` and `Φ⁺ ≥ 22000·(9.5(n+1)d)^{2(n+1)}(λ_p⁻)^{−(n+1)}(p^d − 1)·h_1⋯h_n·L⁺`. This dominates Yu's `Φ` for every prime `𝔭 | p` (`f_𝔭 ≤ d`). Admissibility: `h_j ≥ h(α_j)`, `h_j ≥ |log α_j|/10` (Yu's `1/(10d)` replaced by `1/10`, admissible for every degree), `h_j ≥ log p`. API: `yuBound`, `Admissible`, `yuPhi_le`, `ofHeightBounds`. Tests: for `p = 5`, `α = (2, 3)`, `d = 1` the bound exceeds `10^{14}`; for `d = 1` the residue factor is `p − 1`; `h_j = log 2` is not admissible at `p = 5`; for rationals `C = 2Φ⁺ log p` gives the form of `DT.3/yu-p-adic-lower-bound`.
- **Theorem (certified p-adic bound)** (`ED.2/certified-padic-lower-bound`). For an admissible certificate, an embedding of `K` into a finite extension of `ℚ_p` and `b ≠ 0` with `α^b ≠ 1`: `v_p(α^b − 1) < Φ⁺·Real.log(d·max(|b_1|, …, |b_n|, 3))`. Proof: `DT.3/yu-explicit-p-adic-bound`, `v_p = ord_𝔭/e_𝔭 ≤ ord_𝔭`.

### Exact p-adic lattices and reduction chains

- **Discrete-logarithm certificates** (`ED.2/padic-discrete-logarithm-certificate`, `PadicDiscreteLogCertificate`). For units `γ_0, …, γ_n` of `ℤ_p` (or of the ring of integers `𝒪_L` of a finite extension, given exactly modulo `𝔓^t`), a certificate is `(e, g, M, ℓ)` with `g ≡ 1 (mod 𝔓)`, `g^{p^M} ≡ 1`, `g^{p^{M−1}} ≢ 1` and `γ_i^e ≡ g^{ℓ_i}` in `𝒪/𝔓^t`, all checked by modular exponentiation. Its lattice is `Γ = {b : Σ b_iℓ_i ≡ 0 (mod p^M)}` and its target coset `Γ_0 = {b : ℓ_0 + Σ b_iℓ_i ≡ 0 (mod p^M)}`. **Soundness:** if `ζγ_0∏γ_i^{b_i} ≡ 1 (mod 𝔓^t)` with `ζ^e = 1` (signs included when `e` is even), then `b ∈ Γ_0`. Standard data over `ℚ_p`: `g = 1 + p`, `t = M + 1`, `e = p − 1` for odd `p`, and `g = 5`, `t = M + 2`, `e = 2` for `p = 2`; the order conditions follow from Lifting the Exponent (`DT.3/p-adic-valuation-of-power-minus-one`). Presentation through ED.1: with `κ` the least `p`-adic valuation of `ℓ_1, …, ℓ_n`, attained at `k`, `Γ_0` is empty if `v_p(ℓ_0) < κ`, and otherwise is the lattice of `ED.1/padic-linear-form-lattice` at level `M − κ` for `β_i = −ℓ_i/ℓ_k` (de Weger's `μ_0` is `κ`). This replaces the approximation of p-adic logarithms by exact discrete logarithms; only the implication "congruence ⇒ lattice point" is used, which avoids the index statements of de Weger's Lemma 3.17(i) (two of which fail, see the errata). API: `lattice`, `mem_coset_of_congr`, `mem_of_padicValRat_le`, `standard`, `orderOf_one_add_prime`. Tests: `2⁴` is a power of `6` modulo `125` and `6` has order `25`; `26` has order `5` modulo `125` and is rejected as a level-2 generator; `5` has order `8` modulo `32`; if all `ℓ_i` vanish modulo `p^M` the lattice is everything.
- **Exponent reduction chains** (`ED.2/exponent-reduction-chain`, `ExponentReductionChain`). For a set `𝒮 ⊆ ℤ^q` of exponent vectors with weights `w_i ≥ 1` and weighted height `H_w(a) := max_i|a_i|/w_i`, a chain is a decreasing list of rational bounds `X_0 ≥ ⋯ ≥ X_k` with finite exceptional sets `E_j`, each step carrying the implication "`a ∈ 𝒮`, `H_w(a) ≤ X_{j−1}` ⇒ `H_w(a) ≤ X_j` or `a ∈ E_j`", certified by `ED.1/homogeneous-reduction` or `ED.1/inhomogeneous-reduction` (real forms with `|Λ| < K_1 exp(−K_2 H_w(a))`), by `ED.1/padic-reduction` (a coset excluded from the box), or by `ED.1/short-vector-enumeration-complete` (all remaining lattice points listed in `E_j` and tested exactly). **Soundness:** every `a ∈ 𝒮` with height `≤ X_0` has height `≤ X_k` or lies in some `E_j`. The initial bound comes from the imported logarithmic-form bound; the chain contains no analytic estimate. Tests: the empty chain ends at `X_0`; a chain `10^{40} ≥ 600 ≥ 70` without exceptions bounds every vector by `70`; a vector of height `9` beyond a final bound `5` must be an exception; decreasing bounds without step certificates do not form a chain.

### Thue equations (Tzanakis–de Weger 1989)

- **Definition** (`ED.2/thue-equation`, `thueForm`, `thueSolutions`, `ThueEquation`). A Thue equation is `F(x, y) = m` with `g` irreducible over `ℚ` of degree `n ≥ 3` and `m ≠ 0`; `thueSolutions g m` is the set of all integer pairs, with no coprimality and no sign normalisation. API: `thueForm_one` (`F(x, 1) = g(x)`), `thueForm_zero` (`F(x, 0) = f₀xⁿ`), `thueForm_smul` (`F(tx, ty) = tⁿF(x, y)`), `ThueEquation.finite_solutions` (from `DT.4/thue-equation-effective-bound`). Tests: `X³ − 2` gives `x³ − 2y³` with solutions `(1, 0)`, `(−1, −1)` of `m = 1`; `(2, 0)` solves `m = 8`; `x² − 2y² = 1` and `(x − y)³ = 1` have infinitely many solutions, which is why degree `≥ 3` and irreducibility are required.
- **Factor coverings** (`ED.2/thue-factor-covering`, `ThueFactorCovering`). For `s ≥ 1`: units `ε_1, …, ε_r` (`r = s + t − 1`) and a finite list `M ⊆ K^×` with **(U)** every unit of `𝓞_K` is `±∏ε_i^{a_i}`, and **(M)** for every solution, `f₀(X − Yξ)` is `f₀μ` times a unit for some `μ ∈ M`. Then `X − Yξ = ±μ∏ε_i^{a_i}`. These are input hypotheses of the certificate theorem; (U) is discharged by `CN.2/units-complete-of-regulator-bound`, and (M) by `DT.4/divisors-up-to-units` (`f₀(X − Yξ)` is an algebraic integer of norm `f₀^{n−1}m` dividing its norm) or by prime-ideal factorisation certificates (`CN.2/prime-ideal-factor-certificate`). Tzanakis–de Weger's phrase "nonassociates `μ_i` in `K` with `f₀N(μ_i) = m`" is read in this integral sense. Tests: for `x³ − 2y³ = 1` (fundamental unit `∛2 − 1`) the list `{1}` covers; for `m = 2` it misses `(0, −1)` (`X − Yξ = ∛2`); the square of the fundamental unit violates (U).
- **Certified constants** (`ED.2/thue-analytic-constants`, `ThueConstants`). Rational bounds `ĉ_1 ≥ C_1 = 2^{n−1}|m|/min_{i≤s}|g′(ξ^{(i)})|`, `0 < ĉ_2 ≤ C_2 = ½min|ξ^{(i)} − ξ^{(j)}|`, `ĉ_3 ≥ C_3 = max|ξ^{(i_1)} − ξ^{(i_2)}|/|ξ^{(i_1)} − ξ^{(i_3)}|`, the thresholds `Ŷ_0 ≥ Y_0`, `Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)})`, `Ŷ_1* ≥ max(Ŷ_1, (2ĉ_1ĉ_3/ĉ_2)^{1/n})`, and from the covering `μ̂_±`, `ĉ_4 ≥ (½ + max|ξ^{(i)} − ξ^{(j)}|)/μ_−`, `ĉ_5 ≥ C_5 = min((n − 1)·min_I N[U_I^{−1}], max_{i_0≤s} N[U_{I(i_0)}^{−1}])`, `ĉ_6 ≥ 1.39ĉ_1ĉ_3ĉ_4^n/ĉ_2`, `Ŷ_2′ ≥ max(Ŷ_1*, 2|m|^{1/n}, μ̂_+/ĉ_2)`. ⚠ **The matrix `U_I` has the entry `log|ε_i^{(h_l)}|` in row `l` (embedding) and column `i` (unit)**, as forced by `(log|β^{(h_l)}/μ^{(h_l)}|)_l = U_I·a`; Tzanakis–de Weger's sentence after the definition states the transposed orientation, which changes the row-sum norm (`U = ((2, 1), (0, 1))`: row-sum norms `1` and `3/2`). `N[U_I^{−1}]` is certified by an approximate inverse `V`: `‖1 − VU‖_∞ ≤ ρ < 1` on the interval matrix gives `‖U^{−1}‖_∞ ≤ ‖V‖_∞/(1 − ρ)` (`Units.oneSub`, `tsum_geometric_le_of_norm_lt_one`, `Matrix.linftyOpNormedRing`). Every inequality is checked by interval evaluation over the root boxes (`CN.4/certified-polynomial-root-isolation`, `ED.0/archimedean-embedding-certificate`) and by comparing integer powers for the `n`-th roots. Test: for `x³ − 2y³ = 1`, `C_1 ≈ 0.83995` and `Ŷ_1 = 4`.
- **Lemma 1.1** (`ED.2/thue-root-approximation`). If `|Y| > Ŷ_0` then `s ≥ 1` and there is a real `ξ^{(i_0)}` with `|X − Yξ^{(i_0)}| ≤ ĉ_1|Y|^{−(n−1)}` and `|X − Yξ^{(i)}| ≥ ĉ_2|Y|` otherwise; if `|Y| > Ŷ_1`, then `X/Y = Real.convergent ξ^{(i_0)} k` for some `k` (Legendre, `Real.exists_rat_eq_convergent`, using `den(X/Y) ≤ |Y|`). When `s = 0` every solution has `|Y| ≤ Ŷ_0`.
- **Lemma 1.2 and nonvanishing** (`ED.2/thue-linear-form`). With `(j, k)` real or a conjugate pair, `δ_μ = ((ξ^{(i_0)} − ξ^{(j)})/(ξ^{(i_0)} − ξ^{(k)}))·μ^{(k)}/μ^{(j)}`, Siegel's identity gives the unit equation (1.2); the real form `Λ = log|δ_μ| + Σ a_i log|ε_i^{(k)}/ε_i^{(j)}|` or the complex form `Λ = Arg δ_μ + Σ a_i Arg(ε_i^{(k)}/ε_i^{(j)}) + 2πa_0` satisfies **`Λ ≠ 0`** (because `β^{(i_0)} ≠ 0`), `|Λ| < 1.39ĉ_1ĉ_3/ĉ_2·|Y|^{−n}` for `|Y| > Ŷ_1*`, and `|a_0| ≤ 1 + rA/2`; as a linear form in nonzero principal logarithms it has coefficients `(1, a, 2a_0)`, lives in `ℚ(ξ^{(i_0)}, ξ^{(j)}, ξ^{(k)})` of degree `≤ n(n − 1)(n − 2)`, and `B* ≤ (r + 2)max(1, A)`.
- **Lemmas 2.1–2.2** (`ED.2/thue-exponent-bound`): `A := max|a_i| < ĉ_5 log(ĉ_4|Y|)` and `|Λ| < ĉ_6 exp(−(n/ĉ_5)A)` for `|Y| > Ŷ_2′`.
- **Lemmas 2.3–2.4 with Matveev** (`ED.2/thue-initial-bound`): with `C_7 := c` from an admissible Matveev certificate and `Ĉ_8 ≥ 1 + log(r + 2)`, `A < a + b log A` for `a = (ĉ_5/n)(log ĉ_6 + C_7Ĉ_8)`, `b = ĉ_5C_7/n`, hence `A ≤ K_3 := max(1, 2a + 2b(log 2b − 1))` (`DT.4/log-linear-inequality-bound`).
- **Reduction and the bound for `|Y|`** (`ED.2/thue-reduced-bound`). For every real `i_0` and `μ ∈ M`, an exponent reduction chain from `K_3` (resp. `(r + 2)K_3/2` with `a_0` included, decay rate `2n/((r + 2)ĉ_5)` in the complex case) whose real steps are ED.1 reductions on the lattice of `ED.1/linear-form-lattice`; the precision budget is `|φ_i − Cθ_i| ≤ 1`, met by rounding midpoints of enclosures of width `≤ 1/C`. With `A ≤ A_red`, Pethő's bound `|Y| ≤ μ_+(E_{l_1}^A + E_{l_2}^A)/|ξ^{(l_1)} − ξ^{(l_2)}|` gives `|Y| ≤ C := max(Ŷ_2′, Ŷ_red)` for every solution not coming from an exceptional exponent vector (those are tested exactly).
- **Continued fractions** (`ED.2/thue-convergent-search`). With rational `ξ̃_i`, `|ξ̃_i − ξ^{(i)}| < 1/(6C²)`, every solution with `Ŷ_1 < |Y| ≤ C` is `(Zp, Zq)` with `p/q = Real.convergent ξ̃_i k`, `q ≤ C`, `Z^n | m`; the convergents of a rational are finitely many (`GenContFract.terminates_of_rat`). ⚠ Every such convergent is tested; Tzanakis–de Weger's filter (3.8) is proved for the partial quotients of `ξ^{(i_0)}` but applied to those of `ξ̃`, which can differ for the last convergents (see the errata), so it is not used.
- **Small solutions** (`ED.2/thue-small-solutions`, `thueSmallSolutions`): for `|y| ≤ Ŷ_1`, every integer root `x` of `F(X, y) − m` satisfies `|x| < cauchyBound` (`Polynomial.IsRoot.norm_lt_cauchyBound`), and the box is enumerated. Tests: `{(1, 0), (−1, −1)}` for `x³ − 2y³ = 1`, `|y| ≤ 1`; `(5, 4)` solves `x³ − 2y³ = −3` with `|x| > |m|`, so `|m|` is not a search bound.
- **Certificate** (`ED.2/thue-certificate`, `ThueCertificate`, `Valid`). Root boxes and constants; the covering; per `(i_0, μ)` a Matveev certificate, `K_3` and a reduction chain; `Ê_l`, `Ŷ_red`, `C`; the approximations `ξ̃_i`; the claimed list `L` = the solutions among the small-solution enumeration, the convergent candidates and the exceptional candidates. The four classes of Tzanakis–de Weger are: (I) `|Y| ≤ Ŷ_1`, enumerated; (II) `Ŷ_1 < |Y| ≤ C`, continued fractions; (III) larger `|Y|` with `A ≤ K_3`, excluded by reduction; (IV) `A > K_3`, excluded by the certified Matveev bound.
- **Theorem** (`ED.2/thue-certified-solution-set`, `ThueCertificate.solutions_eq`; exported). If `(g, m)` is a Thue equation, the certificate is valid and (U), (M) hold when `s ≥ 1`, then `thueSolutions g m = L`; every solution satisfies `|Y| ≤ C` or is one of the tested candidates obtained from the exceptional exponent vectors. Acceptance: for `x³ − 2y³ = 1` a valid certificate lists exactly `{(1, 0), (−1, −1)}`; the worked certificates belong to `EffectiveDiophantineMethods:ED.6`.

### Thue–Mahler equations (Tzanakis–de Weger 1992)

- **Definition** (`ED.2/thue-mahler-equation`, `thueMahlerSolutions`, `ThueMahlerEquation`). `F(X, Y) = c·p_1^{z_1}⋯p_v^{z_v}` with `g` irreducible of degree `≥ 3`, `c ≠ 0`, distinct primes `p_i ∤ c`; the normalised solution set consists of `(X, Y, z) ∈ ℤ² × ℕ^v` with `gcd(X, Y) = 1` and `gcd(Y, f₀) = 1` (Tzanakis–de Weger's (2); automatic when `f₀ = ±1`). Coprimality is essential: `(5^k, 0, 3k)` solves `x³ − 2y³ = 5^z` for every `k`. With `x = f₀X`, `y = Y`, `θ = f₀ξ` (a root of `integralNormalization g`), `N(x − yθ) = f₀^{n−1}c∏p_i^{z_i}`. Tests: `(3, 1, 2)` solves `x³ − 2y³ = 5^z`; the case `v = 0` is the coprime part of the Thue equation `F = c`.
- **Prime Ideal Removing Lemma** (`ED.2/prime-ideal-removing-lemma`). For `G = G_1⋯G_m` over `ℚ_p` and coprime `x, y`: for `i ≠ j` at most one of `𝔭_i, 𝔭_j` has `ord(x − yθ) > max(e_i, e_j)·ord_p(θ_i^{(k)} − θ_j^{(l)})`; a prime with `d_i > 1` or `e_i > 1` satisfying it has `ord ≤ e_i·ord_p(θ_i^{(k)} − θ_i^{(l)})`; at most one `𝔭_i` has `ord > ½e·ord_p(D_θ)`, and then `d_i = e_i = 1`; if `p ∤ D_θ`, at most one prime above `p` divides `x − yθ`. Hence the ideal equations `(x − yθ) = 𝔞𝔟𝔭_1^{u_1}⋯𝔭_v^{u_v}`.
- **S-unit coverings** (`ED.2/thue-mahler-s-unit-covering`, `ThueMahlerCovering`). Units of an order containing `θ` and finitely many cases `(α, π_i, h_i, s′_i, t′_i)` with `(π_i) = 𝔭_i^{h_i}` such that (U) the units generate with the roots of unity of `K` (`±1` when `s ≥ 1`) and (C) every solution has `x − yθ = ±α∏ε^a∏π^n`, `z_i = n_ih_i + s′_i + t′_i`. Discharged by the Prime Ideal Removing Lemma, CN.2's factorisation and unit certificates; `DT.4/s-integral-divisor-representation` shows that finitely many cases suffice. The class number is not needed.
- **Initial bounds** (`ED.2/thue-mahler-initial-bounds`). The p-adic step: with `λ = δ_1∏(π_i^{(k)}/π_i^{(j)})^{n_i}∏(ε_i^{(k)}/ε_i^{(j)})^{a_i} − 1`, `ord_{p_l}(λ) = ord(δ_2) + n_lh_l` (Lemmas 2–4), and the certified Yu bound gives `N ≤ c_13(log H + c_14)`. The archimedean step: Proposition 7 `A < c_18 + c_17N` (with the corrected `c′_17 = Σ_i max(0, max_j log(p_i^{h_i}/|π_i^{(j)}|))`, `c″_17 = Σ_i max(0, log ⌈π_i⌉)`, see the errata) or Case 3, a nonzero linear form `Λ_0` bounded below by the certified Matveev bound. Combined with `DT.4/log-linear-inequality-bound`: `H = max(N, A) ≤ K_0`.
- **Reduction** (`ED.2/thue-mahler-reduced-bounds`). p-adic steps: a solution with `e_L(n_lh_l + ord δ_2) ≥ t` lies in the target coset of a discrete-logarithm certificate for `δ_1` and the unit ratios (in `ℤ_{p_l}` when the three conjugates are `ℚ_{p_l}`-rational; in the norm-one subgroup of the quadratic extension in TdW's second special case), and ED.1 excludes the coset from the box; real steps: Proposition 16 through `ED.1/inhomogeneous-reduction`. Iteration is an exponent reduction chain with final box `n_i ≤ N_i`, `|a_i| ≤ A_fin`.
- **Sieve** (`ED.2/auxiliary-prime-sieve`). For three degree-one primes `𝔮_1, 𝔮_2, 𝔮_3` above an auxiliary prime `q`, Siegel's identity modulo `q` gives the congruence `(m_2 − m_3)A_1P_1 + (m_3 − m_1)A_2P_2 ≡ (m_2 − m_1)A_3P_3` for the residues of `θ`, `α` and the products `∏π^n∏ε^a`: a necessary condition, used only to discard tuples before the exact test.
- **Certificate and theorem** (`ED.2/thue-mahler-certificate`, `ED.2/thue-mahler-certified-solution-set`; exported). The covering, constants and Yu/Matveev certificates, reduction chains, residual boxes, sieve primes and the claimed list; every residual tuple is either sieved out or tested exactly (`±α∏ε^a∏π^n = x − yθ` with `x, y ∈ ℤ`, `f₀ | x`, coprimality, and `F(X, Y) = c∏p_i^{z_i}`). A valid certificate with (U), (C) satisfies `thueMahlerSolutions g c p = L`. Acceptance: for `x³ − 2y³ = 5^z` the list contains `(1, 0, 0)`, `(−1, −1, 0)`, `(3, 1, 2)`.

### S-unit equations over `ℚ` (de Weger 1989, Chapter 6)

- **Definition** (`ED.2/s-unit-equation`, `sUnitSolutions`). For a finite set `S` of primes, `sUnitSolutions S = {(x, y) : x, y ∈ U_S, x + y = 1}` with `U_S` the rational S-units of `DT.4/rational-s-unit-group` (signs included). The coprime form `u + v = w` (`DT.4/s-unit-equation-coprime-reduction`) is de Weger's `x + y = z`; the six maps `(x, y) ↦ (y, x), (1/x, −y/x), …` permute the solutions. **Scoped exponential equations** are instances: for `a, b, c ∈ U_S`, the solutions of `ax′ + by′ = c` are `(cx/a, cy/b)`, and equations such as `2^α + 3^β = 5^γ` are read off from the solutions with prescribed supports. Tests: `(3, −2)`, `(1/2, 1/2)`, `(4/3, −1/3)` for `S = {2, 3}`; no solutions for `S = ∅`; `(5, −4)` is not an S-unit solution for `{2, 3}`.
- **Initial bound** (`ED.2/s-unit-initial-bounds`). For `|S| ≥ 2` and Yu certificates at each `p ∈ S` for `(−1, (q)_{q≠p})` with `d = 1`, `C_p := 1.1·Φ⁺_p·log p` satisfies the hypothesis of `DT.4/s-unit-equation-exponent-bound` (`log max(B, 3) ≤ 1.1(1 + log max(1, B))`), so every exponent is at most `X_0 ≥ max(1, (2C/log 2) log(2C/log 2))`. For `|S| ≤ 1` all exponents are at most `1`. The sign `−1` must be part of the family.
- **p-adic reduction** (`ED.2/s-unit-padic-reduction`). If `p ∤ uv` and `v_p(w) ≥ t`, then `−u/v ≡ 1 (mod p^t)` and the exponent vector `(v_q(u) − v_q(v))_{q≠p}` lies in the lattice of a discrete-logarithm certificate for the primes `q ∈ S ∖ {p}`; an ED.1 certificate excluding nonzero lattice points from the box (or enumerating them) gives `v_p(w) ≤ t − 1` apart from `(1, 1, 2)` and listed vectors. By symmetry this bounds `v_p(uvw)`.
- **Certificate and theorem** (`ED.2/s-unit-certificate`, `ED.2/s-unit-certified-solution-set`; exported). Yu certificates and `X_0`; a chain of p-adic steps lowering per-prime bounds to `f(p)`; exceptional solutions from enumeration steps; the claimed list. Validity requires the exhaustive test of the residual box `{x = ±∏p^{a_p}, |a_p| ≤ f(p)}` (`2∏(2f(p) + 1)` elements). A valid certificate satisfies `sUnitSolutions S = L`, and every solution has `|v_p(x)|, |v_p(y)| ≤ f(p)` or is exceptional. Acceptance: for `S = {2}` the list is `{(2, −1), (−1, 2), (1/2, 1/2)}`; for `S = {2, 3}` the solutions come from `1 + 1 = 2`, `1 + 2 = 3`, `1 + 3 = 4`, `1 + 8 = 9` under the six symmetries. De Weger's results (545 coprime triples for `{2, 3, 5, 7, 11, 13}`, Theorem 6.3; 63 for `{2, 3, 5, 7}`, Lemma 7.3) are the kind of statement certified; the worked `S = {2, 3, 5, 7}` certificate belongs to `EffectiveDiophantineMethods:ED.6`.

### Mistakes in the sources (recorded in the packet)

- Tzanakis–de Weger 1989, Lemma 2.1: the orientation of `U_I` is stated transposed (misprint; the intended orientation follows from (2.1) and is used in their 1992 Lemma 6).
- Tzanakis–de Weger 1989, (3.8): the partial-quotient test is applied to the approximation `ξ̃` but proved for `ξ^{(i_0)}` (gap; testing all convergents avoids it).
- de Weger 1989, Lemma 3.17(i): "if `p = 2` they are all equal" fails for `Γ#_μ` (`α = (3, 5)`), and the index formulas for `p ≥ 3` fail when all `α_i ≡ 1 (mod p)` (error; Chapter 6 avoids it by choosing a primitive root).
- Tzanakis–de Weger 1992, proof of the second corollary of Lemma 1: "1st Corollary (ii)" should be "(i)" (misprint).
- Tzanakis–de Weger 1992, Proposition 7: `c′_17`, `c″_17` require each factor `p_i^{h_i}/|π_i^{(k)}|`, `|π_i^{(k)}|` to be at least `1` (gap; corrected constants above).

### Remaining refinements

- Reduction of Thue–Mahler solutions with `gcd(Y, f₀) > 1` to normalised instances.
- Exact models of `𝒪_L/𝔓^t` for the extension of `ℚ_{p_l}` generated by an irreducible factor of `G` (Hensel factorisation), extending `ED.0/padic-embedding-certificate` beyond embeddings into `ℚ_p`, for the second special case of Tzanakis–de Weger 1992 §14; discrete-logarithm certificates with several generators where the relevant subgroup is not cyclic.
- A certified constant for the Laurent–Mignotte–Nesterenko two-logarithm bound (`DT.3/laurent-mignotte-nesterenko-two-logarithms`) as a sharper input for two-term forms.

## ED.3. Descent, rank bounds and saturation

This layer turns the elliptic 2-descent and the abstract Selmer machinery that Tau Ceti provides
(EllipticCurves Layers 6 and 7) into finite, certified computations, and adds the two descent
algorithms the literature actually runs on examples: descent via a rational 2-isogeny, and the
x − T descent on Jacobians of genus-two curves. It certifies the three inputs a Mordell–Weil
computation needs — an upper bound for the rank, independent points, and saturation of the subgroup
they generate — and packages them as the finite-index subgroup certificate that the Chabauty layer
(ED.4) and the Mordell–Weil sieve (ED.5) consume. The general Kummer and isogeny descent for
abelian varieties, finite generation of J(ℚ), and the cohomological reading of Selmer and
Tate–Shafarevich groups belong to `HeightsRationalPointsAndObstructions:RP.1` and to EllipticCurves
Layer 7; this layer cites them and never restates them.

**Dependencies.** `EffectiveDiophantineMethods:ED.0` (certified p-adic and archimedean embeddings,
valuation certificates, bounded-height enumeration); `HeightsRationalPointsAndObstructions:RP.1`;
EllipticCurves Layers 3, 4, 6 and 7; JacobianChallenge Layer D (J(K) = Pic⁰ points);
`ComputationalNumberTheory:CN.2` (certified class groups, units, prime factorisations, Newton-polygon
irreducibility); `ComputationalNumberTheory:CN.4` (interval arithmetic, real root isolation, logarithm
enclosures); `HeightsRationalPointsAndObstructions:RP.0` (Néron local heights, for the explicit
height bound).

### Conventions (pinned)

- **Curves.** An elliptic curve over ℚ is a Mathlib `WeierstrassCurve ℚ` with `IsElliptic`. The
  2-descent is stated in Tau Ceti's characteristic-≠-2 normal form `IsCharNeTwoNF`: a₁ = a₃ = 0,
  y² = f(x) with f = X³ + a₂X² + a₄X + a₆ (`WeierstrassCurve.Affine.f`), and a₂, a₄, a₆ ∈ ℤ for every
  certificate. A = ℚ[X]/(f) is `W.A`, M = A^×/A^{×2} is `W.M`, and μ : E(ℚ) → M is Tau Ceti's x − T
  map `WeierstrassCurve.Affine.μ` (the class of x − T, corrected at the 2-torsion). Its kernel is
  exactly 2E(K) over every field K (`ker_μ_eq`).
- **Places.** Finite places are primes of ℤ, with completions ℚ_p and |p|_p = p^{-1}; the real place
  is ℝ. Tau Ceti's `selmerGroup₂` is taken with R = 𝓞 ℚ and the auxiliary family consisting of ℝ alone.
  The bad set is Tau Ceti's `W.badPrimes`: primes dividing 2 or Δ or a denominator of a₂, a₄, a₆.
- **Heights.** naiveHeight(P) = `Height.logHeight` of the projective x-coordinate (for x = a/b in
  lowest terms over ℚ this is log max(|a|, |b|)); over a number field K it is the relative height
  (d = [K:ℚ] times the absolute one). The canonical height is Tau Ceti's
  `WeierstrassCurve.Affine.Point.canonicalHeight`, ĥ(P) = lim naiveHeight(2ⁿP)/(2·4ⁿ): the height
  attached to the divisor (O), approximately ½h(x). The Néron–Tate pairing is
  ⟨P, Q⟩ = (ĥ(P+Q) − ĥ(P) − ĥ(Q))/2 (Tau Ceti `neronTatePairing`, so ⟨P, P⟩ = ĥ(P)), and the
  regulator is |det| of its Gram matrix on a basis of E(ℚ)/E(ℚ)_tors (Tau Ceti `regulator`).
  Silverman (Math. Comp. 1990) uses this normalisation; Cremona's book uses 2ĥ and the full h(x),
  and every constant imported from it is halved.
- **Certificates.** Every certificate carries exact rational data or certified enclosures; a
  floating-point value is never evidence. A rank upper bound is always an algebraic descent bound. An
  analytic or conjectural rank input (Birch–Swinnerton-Dyer, numerical L-values) is never a field of
  a certificate: a theorem that uses one states it as an explicit hypothesis.

### Local images

- **`ED.3/local-quotient-cardinality`** (`index_two_nsmul_padic`).
  For an elliptic curve over ℚ_p, [E(ℚ_p) : 2E(ℚ_p)] = |2|_p^{-1}·#E(ℚ_p)[2], that is #E(ℚ_p)[2] for
  odd p and 2·#E(ℚ_p)[2] for p = 2; over ℝ, 2·[E(ℝ) : 2E(ℝ)] = #E(ℝ)[2]. In normal form
  #E(K)[2] = 1 + #{roots of f in K} (Tau Ceti `card_ker_nsmul_two`). Proof: E(ℚ_p) contains a
  finite-index subgroup isomorphic to ℤ_p (reduction filtration and formal logarithm, Layer 4), and
  the quotient #(B/2B)/#B[2] is multiplicative in short exact sequences and trivial on finite groups;
  over ℝ, the sign vectors of (x − e_i) on E(ℝ) give the image directly. With `ker_μ_eq` these are
  the orders of the local images μ_v(E(K_v)). Tests: y² = x³ − x has index 4 over ℚ_3, 8 over ℚ_2,
  2 over ℝ; y² = x³ + 1 has index 1 over ℝ.
- **`ED.3/local-descent-image`** (`CertifiedLocalImage W v`). At a place v, a certified local image
  consists of a certified factorisation f = ∏ f_j over K_v (Hensel data for linear factors, Ore's
  Newton-polygon irreducibility for the others, real root isolation at ∞), so that
  A_v ≅ ∏ L_j; explicit square-class coordinates κ_v : M_v ≅ (ℤ/2)^{n_v} (valuation parity and
  residual quadratic characters, unit parts modulo 8 at p = 2, signs at ∞); rational abscissae
  x₁, …, x_k with f(x_i) a nonzero square in K_v, checked on the rational number f(x_i); and the
  coordinate vectors of the classes of x_i − T. The output H_v is their span. API: `span`, `coord`,
  `span_le_range` (H_v ≤ μ_v(E(K_v)) always), `span_eq_range_of_card`, `card_span` (#H_v = 2^r, r the 𝔽₂-rank of the coordinate vectors),
  `localCondition_eq_comap` (with Tau Ceti's `localCondition`). Points with rational abscissa
  suffice because μ_v is locally constant and such points are dense. Tests: at ∞ for y² = x³ − x
  the abscissae −1/2 and 2 give the complete image of order 2; with no points H_v is trivial; at the
  odd good prime 5 a complete image of y² = x³ − x has order 4; at p = 2 one abscissa cannot reach
  the required order 8.
- **`ED.3/local-image-completeness`** (`CertifiedLocalImage.span_eq_range_of_card`). If #H_v equals
  the number of `local-quotient-cardinality`, then H_v = μ_v(E(K_v)) and Tau Ceti's local condition
  at v is the preimage of H_v under `localRes`; a smaller H_v is never the local image. This size
  check is the completeness test of a local image.
- **`ED.3/good-place-local-image`** (`localCondition_eq_unramified_of_good`). At an odd prime not in
  `badPrimes` the local image is the subgroup of unramified classes with square norm (inclusion from
  Tau Ceti `range_μ_le_selmerGroupA` over ℤ_p, equality by counting: 2^{#factors − 1} =
  #E(ℚ_p)[2]). Hence the 2-Selmer group is cut out of A(S,2) ∩ ker N by the places of S ∪ {∞}
  alone; these are the primes a certificate must treat.

### The certified 2-Selmer group and the rank upper bound

- **`ED.3/two-selmer-certificate`** (`TwoSelmerCertificate W`). Data: a finite set S of primes
  containing `badPrimes`; for each irreducible factor f_j of f over ℚ, a certified generating set of
  L_j(S,2) (Mathlib's `IsDedekindDomain.selmerGroup` for the ring of integers of L_j = ℚ[X]/(f_j)):
  S-unit generators modulo squares and lifts of the 2-torsion of the S-class group, complete by the
  CN.2 class-and-unit certificate and Tau Ceti's exact sequence (`ker_toClassGroup`,
  `range_toClassGroup`); hence an 𝔽₂-basis of A(S,2) (which contains Tau Ceti's `selmerGroupA (𝓞 ℚ)`, the group for S = `badPrimes`, and equals it only for that S); the norm map on that
  basis and its kernel; and a complete certified local image at every place of S ∪ {∞}. The
  certified Selmer group is
  Sel(C) = {m ∈ A(S,2) ∩ ker N : localRes_v(m) ∈ H_v for all v ∈ S ∪ {∞}}, an explicit 𝔽₂-space of
  order 2^{s(C)}. API: `selmer`, `basis`, `card_selmer`, `mem_selmer_iff`, `range_μ_le`,
  `selmer_eq_selmerGroup₂`, `selmer_mono` (adding places with complete data changes nothing). Tests:
  for y² = x³ − x with S = {2}, #Sel(C) = 4, the image of E(ℚ)[2]; without the local conditions the
  group A(S,2) ∩ ker N has order 2⁴; Sel(C) equals Tau Ceti's `selmerGroup₂`; Sel(C) is not the image
  of μ in general (Cremona: 571a1 has n₂ = 4, n₁ = 1).
- **`ED.3/two-selmer-certificate-sound`.** For every certificate, Sel(C) = Tau Ceti's
  `selmerGroup₂` (R = 𝓞 ℚ, auxiliary family ℝ), im μ ≤ Sel(C), and Sel(C) is finite of order 2^{s(C)}.
  The inclusion ⊇ uses Tau Ceti's semilocal comparison (`mem_selmerGroupA_of_forall_localRes`); the
  inclusion ⊆ uses `good-place-local-image`.
- **`ED.3/rank-upper-bound`** (`rank_le_of_twoSelmerCertificate`). If #Sel(C) = 2^s and
  #E(ℚ)[2] = 2^t, then rank E(ℚ) ≤ s − t; more generally any finite subgroup containing im μ bounds
  2^{rank}·#E(ℚ)[2] (Tau Ceti `pow_rank_le_card_of_range_μ_le`, with Mordell–Weil
  `fg_point_of_numberField`). This is the only elliptic rank upper bound the layer certifies besides
  the 2-isogeny bound below: independent points prove lower bounds and never replace it.

### Quartic local solubility and descent via 2-isogeny

- **`ED.3/quartic-local-solubility`** (`quarticLocallySoluble g v`, with `zpSoluble` and fuel). For
  g ∈ ℤ[x] squarefree of degree 4: at ∞, true iff the leading coefficient is positive or g has a real
  root; at p, the recursive ℤ_p test on g and on the reversed quartic g* (points with x ∉ ℤ_p and at
  infinity), deciding at each residue class x_k mod p^k by the Birch–Swinnerton-Dyer Lemma 6 rules
  (odd p) or Lemma 7 rules (p = 2) exactly as in Cremona's pseudocode; the recursion depth is
  bounded by v_p(disc g) + 2. API: `quarticLocallySoluble_iff`, `quarticLocallySoluble_reverse`,
  `quarticLocallySoluble_scale` (multiplying g by a nonzero square), `zpSoluble_fuel`,
  `quarticLocallySoluble_of_good`. Tests: 2x⁴ − 34 is soluble at 2 and 17; −x⁴ − 1 fails at ∞ and
  is soluble at 3; a square leading coefficient gives solubility everywhere; 3x⁴ + 3 is not soluble
  at 3 although y² ≡ 3x⁴ + 3 (mod 3) has solutions.
- **`ED.3/quartic-local-solubility-correct`.** The test returns true iff y² = g(x) has a ℚ_v-point on
  its smooth projective model, and it returns true at every odd p ∤ disc g (an 𝔽_p-point of a smooth
  genus-one curve lifts by Hensel's lemma). For the even quartics d₁u⁴ + cu² + d₂,
  disc = 16·d₁d₂(c² − 4d₁d₂)², so only the places dividing 2d₁d₂(c² − 4d₁d₂) and ∞ need a test.
- **`ED.3/two-isogeny-descent-map`** (`twoIsogenyDescentMap c d`, with `twoIsogenyCurve`,
  `twoIsogeny`, `twoIsogenyDual`). For E : y² = x(x² + cx + d), c, d ∈ ℤ, d(c² − 4d) ≠ 0, and
  E′ : y² = x(x² − 2cx + c² − 4d): φ(x, y) = (y²/x², y(x² − d)/x²),
  φ′(x, y) = (y²/(4x²), y(x² − d′)/(8x²)), φ′ ∘ φ = [2]. The map α : E(ℚ) → ℚ^×/ℚ^{×2} sends O ↦ 1,
  (0, 0) ↦ d, (x, y) ↦ x. It is a homomorphism with kernel φ′(E′(ℚ)); its values are squarefree
  divisors d₁ of d for which H(d₁, c, d/d₁) : v² = d₁u⁴ + cu² + d/d₁ has a rational point, and the
  φ′-Selmer set is the set of d₁ for which it is everywhere locally soluble. API:
  `twoIsogenyDescentMap_some`, `twoIsogenyDescentMap_zero_zero`, `ker_twoIsogenyDescentMap`,
  `twoIsogenyDescentMap_mem_selmer`, `twoIsogeny_comp`. Tests: for E24 (c = −1, d = 1) the Selmer
  counts are n₂ = 1, n₂′ = 4; α(O) = 1; α(x, y) = 1 iff x is a square; α(0, 0) for y² = x³ − 68x is
  the class of −17, not 1.
- **`ED.3/two-isogeny-rank-bound`** (`rank_eq_of_twoIsogeny`). With n_i = 2^{e_i}:
  rank E(ℚ) = rank E′(ℚ) = e₁ + e₁′ − 2, so ẽ₁ + ẽ₁′ − 2 ≤ rank E(ℚ) ≤ e₂ + e₂′ − 2, where the
  lower bound counts classes with exhibited rational points and the upper bound counts everywhere
  locally soluble quartics. The two are combined only when both certificates exist; equality
  certifies the rank.

### Heights, independence and the index bound

- **`ED.3/explicit-height-difference-bound`** (`canonicalHeight_sub_half_naiveHeight_mem`;
  Silverman 1990, Theorem 1.1). For W over a number field K of degree d with integral coefficients,
  μ(E) = h(Δ)/12 + h_∞(j)/12 + h_∞(b₂/12)/2 + (log 2*)/2 (absolute heights; 2* = 2 if b₂ ≠ 0,
  else 1), every P ∈ E(K) satisfies
  −d·(h(j)/24 + μ(E) + 0.973) ≤ ĥ(P) − naiveHeight(P)/2 ≤ d·(μ(E) + 1.07). Over ℚ and for
  y² = x³ + Ax + B: −h(j)/8 − h(Δ)/12 − 0.973 ≤ ĥ(P) − h(x(P))/2 ≤ h(j)/12 + h(Δ)/12 + 1.07. It
  makes Tau Ceti's existential `abs_canonicalHeight_sub_naiveHeight_le` explicit. Cremona's
  Proposition 3.5.1 is the same bound in his doubled normalisation, with Bremner's sharper lower
  constant (0.961 after halving), which implies the one stated here.
- **`ED.3/canonical-height-enclosure`** (`canonicalHeightEnclosure W P n`, `pairingEnclosure`).
  Compute Q = 2ⁿP exactly; then ĥ(P) lies in [(λ⁻/2 − c⁻)/4ⁿ, (λ⁺/2 + c⁺)/4ⁿ], where [λ⁻, λ⁺]
  encloses log max(|a|, b) for x(Q) = a/b and c^± bound the two sides of the explicit bound. The
  width shrinks like 4^{−n}. API: `canonicalHeight_mem_canonicalHeightEnclosure`,
  `canonicalHeightEnclosure_width_le`, `canonicalHeightEnclosure_zero`,
  `canonicalHeightEnclosure_neg`, `neronTatePairing_mem_pairingEnclosure`. Tests: on y² = x³ + 1 the
  point (−1, 0) of order 2 gives [0, 0] for n ≥ 1; O gives [0, 0]; the enclosure contains Tau Ceti's
  ĥ, not 2ĥ; naiveHeight/2 alone is not an enclosure (the torsion point (2, 3) has ĥ = 0 but
  naiveHeight/2 = (log 2)/2).
- **`ED.3/regulator-lower-bound`** (`linearIndependent_of_det_enclosure_pos`). If the interval
  determinant of the enclosed Gram matrix of P₁, …, P_r has lower endpoint δ > 0, the P_i are
  independent modulo torsion, rank E(ℚ) ≥ r and det(⟨P_i, P_j⟩) ≥ δ (a dependence gives a kernel
  vector because the pairing vanishes on torsion).
- **`ED.3/height-lower-bound-by-search`** (`le_canonicalHeight_of_search`). Enumerate all points of
  naive height ≤ B (ED.0 bounded-height enumeration); with c⁻ the lower constant of the explicit
  bound, λ = min(B/2 − c⁻, lower enclosures of ĥ at the non-torsion points found) bounds ĥ from
  below on all non-torsion points when λ > 0 (Prickett, §6.1.1).
- **`ED.3/index-bound`** (`saturationIndex_le`). For P₁, …, P_r
  independent modulo torsion, with saturation L̄ of their span L and ĥ ≥ λ > 0 on non-torsion
  points, [L̄ : L] ≤ R^{1/2}(γ_r/λ)^{r/2}, R = det(⟨P_i, P_j⟩), for any γ_r with the Hermite
  property; Minkowski's convex-body theorem gives γ_r = (4/π)Γ(r/2 + 1)^{2/r} (Prickett,
  Theorem 6.1.6).

### Saturation and the certificates

- **`ED.3/p-saturated`** (`IsPSaturated G p`, `saturation`). G ≤ A is p-saturated if p·a ∈ G implies
  a ∈ G; equivalently A[p] ≤ G and G ∩ pA = pG; for finite index, iff p ∤ [A : G]. API:
  `isPSaturated_iff`, `isPSaturated_iff_not_dvd_index`, `isPSaturated_top`, `IsPSaturated.inf`,
  `index_eq_one_of_forall_isPSaturated`, `saturation`. Tests: 6ℤ ≤ ℤ is 5-saturated and neither
  2- nor 3-saturated; ⊤ is always saturated; for 6ℤ, p-saturated iff p ∤ 6; ℤ × 0 ≤ ℤ × ℤ/2 has
  G ∩ 2A = 2G but is not 2-saturated (the torsion condition is needed).
- **`ED.3/saturation-certificate`** (`isPSaturated_of_injective_reductions`). If homomorphisms
  ψ_i : A → C_i with pC_i = 0 induce an injective map G/pG → ∏ C_i and A[p] ≤ G, then G is
  p-saturated. The standard maps are reduction modulo good primes q followed by
  B_q → B_q/pB_q (B_q = Ẽ(𝔽_q) or J̃(𝔽_q)); for p = 2 on an elliptic curve, μ itself (kernel 2E(ℚ)).
- **`ED.3/reduction-rank-lower-bound`** (`le_finrank_of_reduction_image`). If the image of G in
  ∏ C_i (ℓC_i = 0) has 𝔽_ℓ-dimension k, then rank G ≥ k − dim A[ℓ]; with A torsion-free and
  explicit relations giving rank G ≤ k, G ≅ ℤ^k (Stoll, Lemma 4).
- **`ED.3/torsion-by-reduction`** (`torsion_eq_of_reduction_bounds`). Reductions injective on
  prime-to-q torsion bound each ℓ-part of the torsion by the ℓ-parts of the #B_i with q_i ≠ ℓ; an
  explicit subgroup attaining the bounds is the torsion subgroup. Over ℚ, Cremona's Lutz–Nagell
  enumeration (y = 0 or y² | Δ₀ on y² = x³ + b₂x² + 8b₄x + 16b₆) gives E(ℚ)_tors exactly.
- **`ED.3/finite-index-subgroup-certificate`** (`FiniteIndexSubgroupCertificate A primes`). For A
  finitely generated (A = E(ℚ), or A = J(ℚ) for the Jacobian of a curve over ℚ with a rational point,
  finite generation from RP.1) and a finite set of primes: generators of G; r with an algebraic
  certificate of rank A ≤ r and a certificate of rank G ≥ r; the torsion of A as an explicit list;
  and a p-saturation certificate for each listed prime. Then rank G = rank A = r, G has finite index,
  and [A : G] is coprime to every listed prime — the hypothesis of `ED.5/subgroup-covers-quotient`.
  API: `subgroup`, `finrank_eq`, `finiteIndex`, `coprime_index`, `torsion_eq`,
  `coprime_index_prod`, `ofMordellWeilBasis`. Tests: for C₀(5), ⟨[∞⁺ − ∞⁻]⟩ with r = 1 and
  primes {3}; a rank-zero group with G = A_tors; index ≤ N and saturation at every p ≤ N give G = A;
  independent points with no upper bound give no certificate.
- **`ED.3/mordell-weil-basis-certificate`** (`eq_top_of_mordellWeilBasisCertificate`). Torsion T
  certified, rank E(ℚ) ≤ r by descent, independence by a positive regulator enclosure, an index bound
  N from λ and Minkowski, and saturation of ⟨T, P₁, …, P_r⟩ at every prime p ≤ N give
  E(ℚ) = T ⊕ ℤP₁ ⊕ … ⊕ ℤP_r and the regulator.
- **`ED.3/genus-two-descent-rank-bound`** (`finrank_jacobian_le_of_xMinusT`). For C : y² = f(x),
  f ∈ ℤ[x] separable of degree 6 with C(ℚ) ≠ ∅ and L = ℚ[T]/(f): x − T is a homomorphism
  J(K) → L_K^×/(L_K^{×2}K^×) into the norm kernel; the image of J(ℚ) lies in the group H of classes
  unramified outside S and in its subgroup H′ cut out by the local images at S; [ker : 2J(K)] is 1
  or 2 by the Galois criterion on the roots; #J(ℚ_p)/2J(ℚ_p) = |2|_p^{-2}·#J(ℚ_p)[2]. Hence
  rank J(ℚ) ≤ dim H′ + log₂[ker : 2J(ℚ)] − dim J(ℚ)[2] (Flynn–Poonen–Schaefer §5).

### Worked examples and acceptance

- **`ED.3/lind-reichardt-torsor`** (the genus-one curve with a nontrivial torsor class). The curve
  2z² = x⁴ − 17y⁴ (v² = 2u⁴ − 34) is soluble over ℝ, ℚ₂ and ℚ₁₇, hence everywhere locally, and has no
  rational point (Aitken–Lemmermeyer: a solution would make 2 a fourth power modulo 17). It is the
  homogeneous space H(2, 0, −34) of the 2-isogeny descent of y² = x³ − 68x, so the class 2 is in the
  φ′-Selmer group (of order 8) but not in α(E(ℚ)). Its invariants are I = −816, J = 0, so its
  Jacobian is y² = x³ + 17x; with RP.1's identification it is a nonzero element of Ш[2] of that curve.
- **`ED.3/fermigier-rank-thirteen`** (an elliptic rank computation). For Cremona's example
  c = 36861504658225, d = 2¹⁵·3⁴·5²·7²·17·23·29·41·103·113·127·809, the local tests at the 17
  primes of 2dd′ give n₂ = 256 and n₂′ = 128, so rank ≤ 13; the explicit points on 7 + 6 homogeneous
  spaces that make the rank exactly 13 are a recorded gap.
- **`ED.3/rank-zero-curves`.** E15, E17, E24, E40 and Morton's Y² = 4X³ − 11X² + 8X have rank 0
  (n₂n₂′ = 4 in the 2-isogeny descent) and the listed torsion (ℤ/4, ℤ/4, ℤ/4, ℤ/4, ℤ/6) by Lutz–Nagell,
  so their rational points are exactly the listed ones. E11's torsion ℤ/5 is certified; its rank and
  the three genus-two curves modelling X₁(13), X₁(16), X₁(18) are recorded gaps.
- **`ED.3/fps-genus-two-mordell-weil`.** For C₀(5) : y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1:
  J(ℚ)_tors = 0 (#J(𝔽₃) = 9, #J(𝔽₅) = 41), rank ≤ 1 by the x − T descent (S = {2, 3701, ∞}, H′ = 0,
  index 2) and rank ≥ 1 because D = [∞⁺ − ∞⁻] ≠ 0, and ⟨[∞⁺ − ∞⁻]⟩ is 3-saturated since its reduction generates J(𝔽₃) ≅ ℤ/9: a finite-index
  subgroup certificate with primes {3}.
- **`ED.3/poonen-genus-two-mordell-weil`.** For C₁(3₂) : y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1: torsion
  trivial, rank ≥ 1, ⟨[∞⁺ − ∞⁻]⟩ 3-saturated; the rank upper bound is a recorded gap because the
  printed 743-adic point is not on the curve.
- **`ED.3/stoll-genus-four-subgroup`** (conditional input labelled). For X₀^dyn(6): J(ℚ) is
  torsion-free and the subgroup G of the ten known points is ≅ ℤ³ (certified). The bound
  rank J(ℚ) ≤ 3 rests on the weak Birch–Swinnerton-Dyer conjecture and analytic continuation of
  L(J, s); it appears only as an explicit hypothesis, under which G has finite index and J(ℚ) is
  its saturation.

**Acceptance.** A genus-one curve with a nontrivial torsor class: `ED.3/lind-reichardt-torsor`. An
elliptic rank computation: `ED.3/fermigier-rank-thirteen` (certified upper bound 13 from the
local tests) and `ED.3/rank-zero-curves` (rank 0 with torsion, hence the full point sets).
Conditional analytic-rank input is labelled separately from algebraic rank certification:
`ED.3/stoll-genus-four-subgroup`, and the certificate structure, whose rank bound field admits only
descent bounds.

**Consumers.** ED.4 takes the certified rank r < g and the subgroup G of
`ED.3/finite-index-subgroup-certificate`; ED.5 takes its index coprimality for the sieve modulus
and the local square-class coordinates of `ED.3/local-descent-image`; ComputationalNumberTheory CN.3
uses the certified Selmer computation as its descent service.

## ED.4. Classical Chabauty–Coleman

**Dependencies:** `EffectiveDiophantineMethods:ED.3` (finite-index subgroup, rank and saturation certificates); `EffectiveDiophantineMethods:ED.0` (certified valuations and p-adic embeddings); `ColemanIntegration:L0` and `ColemanIntegration:L1` (formal primitives, residue discs, Coleman integrals, Dwork's principle); `SchemeAndStackFoundations:SF.3` (curves, Riemann–Roch, specialisation of divisors, symmetric squares); Tau Ceti `JacobianChallenge` layers D, E and F (Jacobian, abelian varieties, Abel–Jacobi); `JacobianChallengePartII:JC1` (relative Jacobian of a smooth model); `NeronModelsAndSemistableAbelianVarieties:R11.1` (Néron models); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` (formal Lie groups); Tau Ceti `StableReduction` layer 5 (regular and minimal models); Tau Ceti `AlgebraicCurves` layer 10 (hyperelliptic models); `HeightsRationalPointsAndObstructions:RP.1` (Mordell–Weil); `DeligneWeightsAndPurity:DWP.1` (Frobenius of abelian varieties over finite fields).

**What this layer does.** For a smooth projective geometrically integral curve X of genus g ≥ 2 over ℚ with a rational point O, a Mordell–Weil subgroup of J(ℚ) of certified finite index and rank r < g, and a prime p of good reduction, the layer builds the p-adic abelian logarithm of J, abelian and Coleman integrals on X, the annihilating differentials, power-series expansions on residue discs, and zero bounds on every residue disc, including the exceptional ones. It ends in a certificate format whose validity proves that a finite list of rational points is all of X(ℚ). The number-field version (Siksek) and the bad-reduction version (McCallum–Poonen, Appendix A) are separate statements with their own hypotheses, and the symmetric-square criteria of Siksek and Box feed the relative sieve of ED.5. Library module: `TauCeti/NumberTheory/Diophantine/` (`AbelianLogarithm`, `ChabautyColeman`, `ColemanComparison`, `ResidueDiscZeros`, `ChabautyCertificate`, `NumberFieldChabauty`, `SymmetricChabauty`, `ChabautyExamples`), namespace `TauCeti.EffectiveDiophantine.ED4`.

### Conventions

- The p-adic valuation is normalised by v(p) = 1. "p is a prime of good reduction" means that a smooth projective model 𝒳 → Spec ℤ_p of X_{ℚ_p} is given as data; X̃ = 𝒳_{𝔽_p} is its special fibre and X̃(𝔽_p) is computed on that model.
- The Abel–Jacobi map is ι_O(P) = [P − O]. Lie(A) is the tangent space at 0, and a regular 1-form on an abelian variety is identified with the linear functional it induces on Lie(A) (Mathlib's `Module.Dual`). For a regular form ω on X, ω_J is the invariant form on J with ι_O*ω_J = ω; this does not depend on O.
- The integration pairing is ⟨x, ω⟩ := ω_J(log_J x), and ∫_Q^{Q'} ω := ⟨[Q' − Q], ω_J⟩. No other normalisation of p-adic integrals is used in ED.4; Coleman integrals are compared with it, not substituted for it.
- The disc Strassmann index of f = Σ a_i t^i with f' ∈ ℤ_p[[t]] is N_p(f) := the largest i minimising v(a_i) + i, i.e. the Strassmann index of f(pT).
- A conditional statement carries its hypothesis as a labelled input; a certificate whose rank input is such a hypothesis is called conditional, and so is every conclusion drawn from it.

### Objects

- **Good-reduction Chabauty datum** (`GoodReductionChabautyDatum`, node `ED.4/good-reduction-chabauty-datum`). Data: X/ℚ, O ∈ X(ℚ), p, and a smooth projective model 𝒳 over ℤ_p of X_{ℚ_p}. Derived: the reduction map red : X(ℚ_p) = 𝒳(ℤ_p) → X̃(𝔽_p), surjective by Hensel's lemma; residue discs D(x̃) = red⁻¹(x̃); local parameters t_x̃ mapping D(x̃) bijectively onto pℤ_p (and the O_K-points of the disc onto m_K for finite K/ℚ_p); the relative Jacobian 𝒥 = Pic⁰_{𝒳/ℤ_p} with reduction red_J and kernel J¹(ℚ_p), compatible with ι_O; and the good-reduction pair (𝒳, Ō) of `ColemanIntegration:L1/good-reduction-pair`. The same definition is made over O_v for a place v of a number field. API: `red`, `red_surjective`, `residueDisc`, `localParam_bijOn`, `redJ_comp_abelJacobi`, `toGoodReductionPair`. Tests: C₀(5) at p = 3 has the four discs ∞^±, (0, ±1); y² = x(x − 1)(x − 2)(x − 5)(x − 6) at p = 7 has eight discs; ℙ¹ has p + 1 discs; the model y² = x(x − 1)(x − 2)(x − 5)(x − 6) is not smooth over ℤ_5; residue discs agree with the tubes of ColemanIntegration.
- **The p-adic abelian logarithm** (`abelianLog`, node `ED.4/abelian-logarithm`). For an abelian variety A over a finite extension K of ℚ_p: with 𝒜 the Néron model, F̂ its g-dimensional formal group, A¹(K) = F̂(m_K) and N = #𝒜(k), log_A(x) := N⁻¹ log_F̂(s(N x)), where log_F̂ is the formal logarithm (formal primitives of the invariant differentials). Properties: a homomorphism independent of choices; kernel the finite group A(K)_tors; continuous with identity differential, an isomorphism F̂(m_K^n) ≅ (m_K^n)^g for n > e/(p − 1); functorial, log_B ∘ φ = dφ ∘ log_A, and compatible with finite extensions; the pairing A(K) × Ω_A → K is non-degenerate on the left with right kernel the torsion, and ⟨·, ω⟩ is the unique locally analytic homomorphism with differential ω. API: `abelianLog`, `abelianLog_eq_formalLog`, `abelianLog_nsmul`, `ker_abelianLog`, `abelianLog_map`, `abelianLog_baseChange`, `integrationPairing`, `integrationPairing_eq_zero_iff`, `abelianLog_unique`. Tests: for an elliptic curve it is the formal-group logarithm on E¹ (Mathlib's one-dimensional `FormalGroup`); torsion points have logarithm 0; the 5-torsion point (0, 0) of y² + y = x³ − x² over ℚ_5 shows that log is not injective; for the Jacobian of C₀(5), D' = 9·[∞⁺ − ∞⁻] ∈ J¹(ℚ_3) has formal logarithm ≡ (36, 3) (mod 3⁴) in Flynn's parameters; the left kernel of the pairing is zero. No other roadmap owns this logarithm; `PadicHodgeRegulators:L1/abelian-variety-logarithm` and the Gross–Zagier layers consume it. Elliptic formal groups themselves belong to Tau Ceti EllipticCurves layer 1.
- **Abelian integrals on X** (`abelianIntegral`, node `ED.4/abelian-integral`). ∫_D ω := ⟨[D], ω_J⟩ for Galois-stable degree-zero divisors D. Linear in ω, additive in D, zero exactly on torsion classes (so on principal divisors), base-point independent up to constants, compatible with finite extensions, with change of variables ∫_D ρ*ω = ∫_{ρ_*D} ω and the trace formula ∫_{ρ*E} ω = ∫_E Tr_ρ ω for finite ρ. API: `abelianIntegral`, `abelJacobi_pullback_bijective`, `abelianIntegral_add`, `abelianIntegral_eq_zero_iff`, `abelianIntegral_map`, `abelianIntegral_trace`, `abelianIntegral_baseChange`. Tests: on C₀(5), ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵); ∫_Q^Q = 0; on C₁(3₂), 2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω for the Weierstrass point W ≡ (1, 0) (mod 3); in genus one the integral is the elliptic logarithm; a nonzero torsion class has all integrals zero.
- **Annihilating differentials** (`annihilatingDifferentials`, node `ED.4/annihilating-differentials`). Ann_p(Γ) = {ω ∈ H⁰(X_{ℚ_p}, Ω¹) : ⟨γ, ω_J⟩ = 0 ∀ γ ∈ Γ}, the dual annihilator of span_{ℚ_p} log_J(Γ); the annihilating (vanishing) differentials of X are Ann_p(J(ℚ)). With a good-reduction datum, V = Ann_p(Γ) ∩ H⁰(𝒳, Ω¹) is saturated and its reduction Ṽ has 𝔽_p-dimension dim Ann_p(Γ). Properties: dimension g − r₀ ≥ g − rank Γ; equal for a finite-index subgroup, hence computable from any ED.3 finite-index certificate as the kernel of the matrix of integrals of a basis against generators; equal for the closure and the saturation; inclusion-reversing. API: `annihilatingDifferentials`, `mem_annihilatingDifferentials`, `annihilatingDifferentials_eq_dualAnnihilator`, `annihilatingDifferentials_of_finiteIndex`, `annihilatingDifferentials_antitone`, `finrank_annihilatingDifferentials`, `annihilatingDifferentials_saturation`, `annihilatingDifferentials_eq_ker`, `reducedAnnihilator`. Tests: C₀(5) at p = 3, Ann = ℚ_3(ε dx/y + x dx/y) with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴) and Ṽ = 𝔽_3·x dx/y; C₁(3₂) at p = 3, Ann = ℚ_3(α dx/y + x dx/y) with α ≡ 68 (mod 3⁴) and Ṽ = 𝔽_3·(x − 1)dx/y; Ann(0) is everything and Ann(J(ℚ_p)) = 0; the subgroup 0 of C₀(5), not of finite index, has dx/y in its annihilator although ∫_{(0,1)}^{(−3,1)} dx/y ≠ 0; agreement with Mathlib's `Submodule.dualAnnihilator`.
- **Residue-disc verdict** (`ResidueDiscVerdict`, node `ED.4/residue-disc-verdict`). For x̃ ∈ X̃(𝔽_p) and an annihilating ω of certified precision: a base point B of the disc with certified value c_B = η(B) (zero when B is rational), the expansion I_B of η = ∫_O ω on the disc, a certified bound N for its zeros, and a list of exactly N distinct zeros, split into verified rational points Z_rat and points Z_irr certified not rational and certified zeros. A valid verdict proves X(ℚ) ∩ D(x̃) = Z_rat; the empty verdict is N = 0. API: `zeros`, `Valid`, `rationalPoints_eq`, `ofKnownPoint`, `empty`, `card_le`, `changeBase`. Tests: the disc (0, 1) of C₀(5) with N = 2 and Z_rat = {(0, 1), (−3, 1)}; the Weierstrass disc (1, 0) of C₁(3₂) with N = 3, Z_rat = {S⁻, S⁺}, Z_irr = {W}; the empty verdict; a list of the known rational zeros without accounting for every zero is not a verdict; every rational point of a validly certified disc is listed.
- **Chabauty–Coleman certificate** (`ChabautyColemanCertificate`, node `ED.4/chabauty-coleman-certificate`). Data: X with explicit equations and O; a list L of verified rational points; an ED.3 finite-index subgroup certificate for G = ⟨D₁, …, D_r⟩ with rank J(ℚ) = r < g (or, in the conditional variant, a labelled hypothesis rank J(ℚ) ≤ r with unconditional independence of the D_j); a prime p with a good-reduction datum and its smoothness certificate; the complete list X̃(𝔽_p); annihilating differentials of certified precision; one valid verdict per point of X̃(𝔽_p). The prime may be ≤ 2g: exceptional discs are covered by certified Strassmann bounds. API: `points`, `Valid`, `verdict`, `discs_complete`, `rankInput`, `card_points_le`, `ofRankHypothesis`. Tests: the C₀(5) certificate with bounds 1, 1, 2, 2 and six points; rank 0 makes every differential annihilating; omitting one disc invalidates a certificate; no certificate exists when r₀ = g (McCallum–Poonen Example 4, y² = x⁶ + x² + 1); a certificate built from a rank hypothesis is labelled conditional.
- **Symmetric-square Chabauty datum** (`SymmetricSquareChabautyDatum`, node `ED.4/symmetric-square-chabauty-datum`). For X non-hyperelliptic of genus g ≥ 3 and a rational degree-two divisor ∞: X⁽²⁾ and its injective Abel–Jacobi map 𝒬 ↦ [𝒬 − ∞]; reduction of X⁽²⁾(ℚ); Ṽ; the matrix Ã(𝒬) of constant (and, for a double point, linear/2) coefficients of a basis of Ṽ at the reductions; in the relative case, ρ : X → C of degree 2 extending to smooth models, Ṽ₀ = reduction of Ann ∩ ker Tr, and the pullbacks ρ*C(ℚ). API: `abelJacobi`, `abelJacobi_injective`, `red`, `matrix`, `relativeVanishing`, `mem_pullback`. Tests: pairs of rational points; the diagonal matrix needs p odd; X₀(N), N ∈ {43, 53, 61, 65}, have infinitely many quadratic points despite r < g − 1; reduction commutes with Abel–Jacobi.

### Theorems

- **Tiny integrals** (`abelianIntegral_eq_primitive`, `ED.4/tiny-integral-expansion`). For an integral regular ω, ω = w(t)dt on D(x̃) with w ∈ ℤ_p[[t]] reducing to the expansion of ω̃; for Q, Q' in the disc (over any finite K/ℚ_p), ∫_Q^{Q'} ω = I(t(Q')) − I(t(Q)) with I the formal primitive of w (`ColemanIntegration:L0/formal-primitive`), the unique analytic primitive on the disc; for p odd and K unramified, ∫_Q^P ω = αz + βz² with α = w(0), β integral (Siksek Lemma 3.2). Proof: [P − Q] is a morphism from the formal disc into the formal group of 𝒥, and log_F̂ composed with it is a convergent primitive of ω.
- **Kernel-of-reduction evaluation** (`integrationPairing_eq_sum_tiny`, `ED.4/kernel-of-reduction-evaluation`). If x̃' = red P' is not a Weierstrass point of X̃, every D ∈ J¹(ℚ_p) is uniquely [Q₁ + ⋯ + Q_g − gP'] with all Q_j in the disc of P', and ⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_n λ_n s_n with s_n power sums computed from ∏(T − t(Q_j)) ∈ ℚ_p[T] (Stoll, Rational 6-cycles §3); the evaluation formula holds for any such representation.
- **Coleman integrals are abelian integrals** (`colemanIntegral_eq_abelianIntegral`, `ED.4/coleman-abelian-comparison`). For a good-reduction pair over O_K and a regular form ω on X, the Coleman integral of `ColemanIntegration:L1/coleman-integral` equals ⟨[y − x], ω_J⟩; it is independent of branch and Frobenius lift and extends to X(ℂ_p). Proof: the difference G of the two primitives is locally constant; P_Y(φ*) kills H¹ of the Frobenius datum, so P_Y(φ*)F is analytic up to a constant; P_J(π) = 0 for the Frobenius of J̃ makes P ↦ Σ c_i[φ^i P − φ^i x₀] an analytic map into the kernel of reduction, so P_J(φ*)η is analytic up to a constant; Dwork's principle (`ColemanIntegration:L1/dwork-principle` (c)) for Q = P_Y·P_J, whose roots are Weil numbers of weights 1 and 2, gives G constant. This is the comparison Katz–Rabinoff–Zureick-Brown prove for Berkovich–Coleman integrals (Corollary 3.18).
- **Constants of integration** (`eta_eq_const_add_tiny`, `ED.4/disc-integration-constant`). On a disc without known rational points, η(B) is certified by Wetherell's method (γ ∈ G with the same reduction as ι_O(B); then η(B) = ⟨ι_O(B) − γ, ω_J⟩ is a kernel-of-reduction value), by a torsion point in the residue class, or by Coleman integration through the comparison theorem, on a good-reduction pair whose étale divisor avoids the residue discs of O and B (McCallum–Poonen Remark 8.3).
- **The p-adic closure** (`dim_padicClosure_le_rank`, `ED.4/padic-closure-dimension`). For Γ ⊆ A(ℚ) finitely generated of rank r, log(Γ̄) = ℤ_p log Γ, r₀ = dim Γ̄ ≤ min(r, g), finite-index subgroups have the same ℚ_p-span, and index prime to p·#Ã(𝔽_p) gives the same closure (McCallum–Poonen Lemma 4.2, Remark 6.1).
- **Certified precision** (`annihilator_approx`, `ED.4/annihilator-precision`). If the g × r integration matrix is known modulo p^k and an r × r minor of the approximation has valuation δ with 2δ < k, then the rank is r, the annihilator has dimension g − r, and Cramer's rule gives annihilating differentials known modulo p^{k−2δ}.
- **Strassmann's theorem** (`strassmann_card_zeros_le`, `ED.4/strassmann-bound`). For K complete with a nonarchimedean absolute value and f = Σ a_n x^n ∈ K[[x]] nonzero with a_n → 0 (Mathlib's `PowerSeries.IsRestricted` at radius 1), let N be the last index with |a_N| = max_n |a_n| (supplied by Tau Ceti's `TauCeti.PowerSeries.exists_max_eq_gaussNorm_of_isRestricted`); then f has at most N zeros in the closed unit disc (Flynn–Poonen–Schaefer Theorem 4). Proof: induction on N, dividing out a zero α by f(x) = (x − α)g(x), whose last dominant index is N − 1. Acceptance: x − x² has N = 2 and two zeros; 1 + px has N = 0 and no zero in ℤ_p.
- **Zero bounds on residue discs** (`card_zeros_le_discStrassmannIndex`, `ED.4/residue-disc-zero-bound`). For f with f' ∈ ℤ_p[[t]]: (a) at most N_p(f) zeros in pℤ_p (Strassmann for f(pT)); (b) N_p(f) ≤ m + 1 when m = ord(f' mod p) < p − 2 (McCallum–Poonen Lemma 5.1); (c) also when the t^{p−1}-coefficient of f' lies in pℤ_p and m < 2p − 2 (Remark 5.2); (d) a certified index from finitely many coefficients known to finite precision, since v(a_i) ≥ −v_p(i); (e) exceptional discs (m ≥ p − 2) are bounded by (a) and (d), never by m + 1.
- **Chabauty's theorem** (`finite_rationalPoints_of_rank_lt_genus`, `ED.4/chabauty-finiteness`). If r₀ < g, in particular r < g, then ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite, and X(ℚ) is finite.
- **Coleman's bound** (`card_rationalPoints_le_coleman`, `ED.4/coleman-bound`). With ω annihilating, integral, ω̃ ≠ 0: at most m + 1 rational points in the disc of x̃ when m = ord_x̃ ω̃ < p − 2; and #X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2 when p > 2g (McCallum–Poonen Theorem 5.3). Acceptance: y² = x(x − 1)(x − 2)(x − 5)(x − 6), rank 1, p = 7 gives #X(ℚ) ≤ 10, attained.
- **Bad reduction** (`card_rationalPoints_le_badReduction`, `ED.4/bad-reduction-bound`). With 𝒳 the minimal proper regular model: residue classes are the fibres over 𝒳_s^sm(𝔽_p); per-class bound m + 1 on multiplicity-one components; Σ_C n_C ≤ 2g − 2 (Lemmas A.3, A.4, via K = H + V, H.𝒳_s = 2g − 2); #X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2 for p > 2g; finiteness at every p. Its hypotheses — regularity of the model and the relative canonical sheaf — are stated separately from the good-reduction case.
- **Hyperelliptic models** (`hyperelliptic_integralDifferentials_basis`, `ED.4/hyperelliptic-residue-discs`). For p odd and y² = f(x) with f of degree 2g + 1 or 2g + 2, unit leading coefficient and unit discriminant: the two-chart model is smooth, x^i dx/y (i < g) is a ℤ_p-basis of the integral differentials reducing to a basis, local parameters are x − x₀, y (Weierstrass points, with dx/y = 2dy/f'(x)), 1/x at the two points at infinity when deg f = 2g + 2, and v at the point at infinity when deg f = 2g + 1, and orders of zeros of reduced differentials are read off from c(x).
- **Completeness** (`ChabautyColemanCertificate.rationalPoints_eq`, `ED.4/chabauty-coleman-completeness`). A valid certificate gives X(ℚ) = L; a conditional one gives it under its label, and unconditionally every rational point with ι_O(P) in the saturation of G is listed.
- **Number fields** (`eq_singleton_of_rank_reducedMatrix`, `ED.4/number-field-chabauty-criterion`). Siksek's Theorem 2: for K of degree d, p odd and unramified in K, good reduction at all υ | p, and a basis of a free finite-index subgroup of J(K), rank d of the reduced matrix M̃_p(Q) implies C(K) ∩ B_p(Q) = {Q}.
- **Symmetric Chabauty** (`eq_of_rank_symmetricMatrix`, `ED.4/symmetric-chabauty`). Box Theorem 2.1: p > 2, p ≠ 3 when Q̃₁ is 𝔽_p-rational, rank Ã(𝒬) = 2 ⇒ 𝒬 is alone in its residue class of X⁽²⁾(ℚ).
- **Relative symmetric Chabauty** (`mem_pullback_of_relativeCriterion`, `ED.4/relative-symmetric-chabauty`). (a) Box Theorem 2.4: for 𝒬 ∈ ρ*C(ℚ), p > 2 when Q̃₁ is 𝔽_p-rational, and some ω ∈ Ṽ₀ with nonzero constant coefficient at Q̃₁, every point of X⁽²⁾(ℚ) in the class of 𝒬 is a pullback. (b) Caraiani–Newton Proposition 7.4.1: if red_{p_i}(x) ∈ red_{p_i}(L_i^good) for some i then x ∈ L ∪ ρ*C(ℚ). The sieve over the bad sets (Caraiani–Newton Theorem 7.4.2) is `ED.5/relative-symmetric-sieve`.

### Worked certificates (acceptance)

- **C₀(5)** (`C05_rationalPoints`, `ED.4/fps-quintic-cycle-curve`): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, J(ℚ) ≅ ℤ (`ED.3/fps-genus-two-mordell-weil`), G = ⟨[(−3, 1) − (0, 1)]⟩, p = 3, discs ∞^±, (0, ±1) with bounds 1, 1, 2, 2; X(ℚ) = {∞⁺, ∞⁻, (0, ±1), (−3, ±1)} unconditionally (McCallum–Poonen Proposition 8.2; Flynn–Poonen–Schaefer Theorem 6).
- **C₁(3₂)** (`C132_rationalPoints`, `ED.4/poonen-type-three-two-curve`): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, G = ⟨[S⁺ − S⁻]⟩, p = 3, ω̃ = (x − 1)dx/y; six discs with bound 1 and the exceptional Weierstrass disc (1, 0) with bound 3, zeros S⁻, W, S⁺, W not rational. X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞^±}, conditional on rank J(ℚ) ≤ 1, whose corrected descent is recorded as a gap in `ED.3/poonen-genus-two-mordell-weil`; unconditionally for points in the saturation of G. The Coleman version replaces Poonen's formal-group computation and needs no variant embedding.
- **X₀^dyn(6)** (`X0dyn6_rationalPoints_of_rank_le_three`, `ED.4/stoll-six-cycle-curve`): genus 4, G ≅ ℤ³ generated by the ten known points (`ED.3/stoll-genus-four-subgroup`), p = 5, ω̄ = w ω̄₀, bound 2 at (∞, −1), an explicit bound 1 at (∞, 0), bound 1 elsewhere. Conditional on rank J(ℚ) ≤ 3 (implied by analytic continuation of L(J, s) and weak BSD, Stoll Theorem 7); unconditionally the ten points are the only rational points in the saturation of G (Stoll Lemma 5).

### Boundaries

ED.4 does not compute Mordell–Weil groups, ranks, torsion or saturation (ED.3), does not run the Mordell–Weil sieve or combine primes (ED.5), and does not treat quadratic or nonabelian Chabauty (ED.6 consuming `AnabelianGeometryAndNonabelianChabauty:NC.5`). Strassmann's theorem over a complete nonarchimedean field is `ED.4/strassmann-bound` (the statement of `ArithmeticDynamics:DY.6/strassmann-theorem`, a stage downstream of ED.4 through DY.3); formal primitives, residue discs and Coleman integration to `ColemanIntegration`. The depth-one comparison of `AnabelianGeometryAndNonabelianChabauty:NC.4` can cite `ED.4/coleman-abelian-comparison` and `ED.4/abelian-logarithm`.

### Sources

McCallum–Poonen, "The method of Chabauty and Coleman" (author copy, §§4–9, Appendix A); Flynn–Poonen–Schaefer (arXiv:math/9508211, §§3, 7, 8); Stoll, "Rational 6-cycles" (arXiv:0803.2836v2, §§2–4); Siksek, "Explicit Chabauty over number fields" (arXiv:1010.2603v2, §§3–4); Box (arXiv:1906.05206, §2); Caraiani–Newton (arXiv:2301.10509, §7.4); Poonen (arXiv:math/9512217v1, §4, and his errata); Stoll, "Uniform bounds" (arXiv:1307.1773v4, §§3, 6); Katz–Rabinoff–Zureick-Brown (arXiv:1504.00694v2, §3); Balakrishnan–Bradshaw–Kedlaya (arXiv:1004.4936v2, §§1–2). In Poonen's preprint, p. 15, "R⁺ and R⁻ both reduce to the Weierstrass point (1, 0)" should read S⁺ and S⁻.

## ED.5. Mordell–Weil sieve and combination certificates

This layer turns a Mordell–Weil group, local information at finitely many places and a uniqueness or height input into a finite, checkable proof about the rational points of a curve: that there are none, that a given list is complete, that every point of bounded height is listed, or that every integral point is listed. Its source is Bruin–Stoll, *The Mordell–Weil sieve: proving non-existence of rational points on curves* (LMS J. Comput. Math. 13 (2010) 272–306; page numbers are those of the version of record), together with Box's relative symmetric sieve (Math. Comp. 90 (2021), §2.4) in the form of Caraiani–Newton Theorem 7.4.2, and McCallum–Poonen Theorem 5.3 for the residue-disc bound used in the Chabauty combination.

The layer has four parts: the finite sieve algebra on an abstract abelian group (twenty declarations); the geometric interface producing the sieve input from a curve, its Jacobian and its reductions; the proved algorithmic facts and transfers (coprime index, kernel level, exponent relevance, chains, GetSubgroup, bad and deep information); and the combinations with heights, integral points, Chabauty–Coleman and relative symmetric Chabauty, closed by a certificate and its soundness theorem. All declarations live in `TauCeti/NumberTheory/Diophantine/MordellWeilSieve`, namespace `TauCeti.MordellWeilSieve`.

**What the layer does not claim.** A sieve whose candidate set is nonempty and not covered by known points proves nothing: it is an open computation, not an empty solution set. No theorem here asserts that enlarging the set of primes or the modulus eventually empties the sieve; Bruin–Stoll's expected sizes `n(S, N)` and `n(L)`, the search `FindQSequence` with its thresholds `ε` and `ε₁`, the choice of `B`-smooth primes, Poonen's heuristic, Lemma 4.3, Conjectures 4.2 and 4.4, Lemma 8.1 and Box's prime-choosing heuristics guide the choice of input and never appear as hypotheses. A choice made by a heuristic affects the cost of a certificate, never its validity.

### Conventions

- Groups are written additively and may have torsion. `Γ` is the global group (the Mordell–Weil group `J(ℚ)`, or a subgroup of it), `S` a finite set of places, `φ_i : Γ → G_i` additive homomorphisms into abelian groups and `X_i ⊆ G_i` finite *allowed sets*. An allowed set is a set of values (the image of a curve), not a subgroup: `{1, 3} ⊆ ℤ/4` is a legitimate allowed set and replacing it by the subgroup it generates changes the sieve.
- For a subgroup `L ≤ Γ` with finite quotient, `q_L : Γ → Γ/L` is Mathlib's `QuotientAddGroup.mk' L`, `G_{L,i} = G_i/φ_i(L)` and `φ_{L,i} : Γ/L → G_{L,i}` is `QuotientAddGroup.map` along `AddSubgroup.le_comap_map`. The local quotient is by the *image* `φ_i(L)`, not by `L`.
- `NΓ` is the range of `nsmulAddMonoidHom N` (the additive companion of `powMonoidHom`); `[Γ : H]` is the native `AddSubgroup.index`, with an infinite index represented by `0` (which is coprime only to `1`).
- Surjectivity of `φ_i` and finiteness of `G_i` are not assumed by the finite-step theorems. Bruin–Stoll normalise `G_p := φ_p(J(ℚ))` and `X_p := X_p' ∩ G_p`; the layer states exactly which facts need that normalisation (only `top-initialization`).
- The canonical height is a ℤ-quadratic map `ĥ : Γ → ℝ` in Mathlib's `QuadraticMap ℤ Γ ℝ`, with `ĥ ≥ 0`. For elliptic curves this is Tau Ceti's `WeierstrassCurve.Affine.canonicalHeightQuadratic` (normalisation `ĥ(P) = lim naiveHeight(2ⁿP)/(2·4ⁿ)`, nonnegative, zero exactly on torsion); for Jacobians it is the Néron–Tate height requested from `HeightsRationalPointsAndObstructions:RP.0`.
- Classical decidability is used to state finite filters and images. An executable certificate replaces it by certified finite presentations of every finite group and map involved (a recorded gap below); finiteness of a native quotient is not an algorithm.

### The finite sieve algebra

**Admissible classes** (`ED.5/admissible-classes`, `admissibleClasses S L φ X`; Bruin–Stoll Definition 3.1, p.277). `A_S(L) = {a ∈ Γ/L : φ_{L,i}(a) ∈ q_{L,i}(X_i) for all i ∈ S}`, the filter of the finite enumeration of `Γ/L`. API: `admissibleClasses_eq_filter` (the defining filter), `mem_admissibleClasses`, `mk_mem_admissibleClasses`, `admissibleClasses_empty` (`A_∅(L) = Γ/L`), `admissibleClasses_congr`. Tests: `admissibleClasses_empty_index` (no places keep everything), `admissibleClasses_empty_local` (an empty local set kills everything), `admissibleClasses_mod_four` (`Γ = G = ℤ/4`, `φ = id`, `L = 0`, `X = {1, 3}` keeps both odd classes), `admissibleClasses_non_surjective` (`φ = 0 : ℤ/2 → ℤ/4`, `X = {1}`, `L = Γ`: empty although `X` is not), `admissibleClasses_top_nonempty` (`L = Γ = ℤ/4`, `X = {1}`: `{0}`).

The lemmas about it:

- `membership` (`mem_admissibleClasses`): membership is the conjunction of the local quotient tests.
- `representative-congruences` (`mk_mem_admissibleClasses`): `q_L(g) ∈ A_S(L)` iff for each `i ∈ S` some `x ∈ X_i` has `φ_i(g) − x ∈ φ_i(L)`; the witnesses may differ between places.
- `constraint-monotonicity` (`admissibleClasses_antitone`): `S ⊆ T` gives `A_T(L) ⊆ A_S(L)`.
- `local-overapproximations` (`admissibleClasses_mono`): `X_i ⊆ Y_i` gives `A_S(L; X) ⊆ A_S(L; Y)`, so emptiness computed from certified supersets of the true local images is a sound obstruction. The converse direction is never used: an unproved subset can discard a genuine point.
- `global-soundness` (`mk_mem_of_local_mem`): if `φ_i(g) ∈ X_i` for all `i ∈ S` then `q_L(g) ∈ A_S(L)`. **Planet: sieve soundness.**
- `empty-sieve-obstruction` (`no_global_element_of_empty`): `A_S(L) = ∅` excludes every globally compatible `g`. A nonempty set does not produce one: for `Γ = ℤ/2`, two identity maps with allowed sets `{0}` and `{1}` and `L = Γ`, the unique class survives and no element is both `0` and `1`.
- `top-initialization` (`admissibleClasses_top`): at `L = Γ`, if every selected `X_i` meets `im φ_i` then `A_S(Γ) = {0}`; this is Bruin–Stoll's initialisation `A(Γ) = {0}`, and it is false for non-surjective maps with unattainable local sets.
- `quotient-refinement` (`refinement_mem`): for `K ≤ L`, a surviving fine class projects to a surviving coarse class.

**Lifting.** For `K ≤ L` with projection `π : Γ/K → Γ/L`, a finite `B ⊆ Γ/L` and proposed lifts `σ : Γ/L → Γ/K`, the construction `coset-lift` (`refineClasses S K L σ B`; Lift, p.279) is the union over `a ∈ B` of `σ(a) + ker π`, filtered by the fine tests at `S`. API: `refineClasses_eq_biUnion`, `mem_refineClasses`, `refineClasses_empty`, `refineClasses_section_independent` (two lifts correct on `B` give the same result). Tests: `refineClasses_empty_input`, `refineClasses_identity` (`K = L`, `σ = id` gives `B ∩ A_S(L)`), `refineClasses_all_lifts` (no tests give all of `π⁻¹(B)`), `refineClasses_wrong_section` (on `ℤ/4` a constant wrong lift moves the result to the wrong fibre).

- `lift-membership` (`mem_refineClasses`): if `π(σ(a)) = a` on `B`, then `b` is returned iff `π(b) ∈ B` and `b ∈ A_S(K)`; this is completeness as well as soundness of the translated-kernel enumeration, with torsion.
- `lift-correctness` (`refineClasses_correct`): with a section correct on `A_S(L)`, `refineClasses(S, K, L, σ, A_S(L)) = A_S(K)`.
- `unchanged-local-image` (`unchanged_local_condition`): if `φ_i(K) = φ_i(L)`, the `i`-th fine test at `b` is the `i`-th coarse test at `π(b)`. Equality of image subgroups, not a small expected contribution, is what licenses omitting a test.
- `relevant-tests` (`refineClasses_relevant`): if `T ⊆ S` contains every place whose image subgroup changes, lifting with the tests in `T` alone computes `A_S(K)`. This is the role of Bruin–Stoll's sets `I_j`.
- `lift-cardinality` (`card_refineClasses_le`): the output has at most `|B|·|ker π|` classes, with no section assumption. It is a deterministic bound for one step; the source's survivor estimates are heuristics and are not used.

**Preparing steps.** `prepared-step-target` (`target_le_preparedStep`): for `D ≤ L`, `D ≤ L ∩ φ⁻¹(φ(D))`. `prepared-step-progress` (`preparedStep_lt`): if `φ(L) ⊄ φ(D)` the prepared subgroup is proper. With `D = N_kΓ` and surjective `φ`, `φ(D) = N_kG`, so the correct step uses the kernel of `Γ → G → G/N_kG`; the printed `L_{j−1} ∩ ker(φ_i)` can fall below the target (`Γ = ℤ`, `G = ℤ/4`, target `2ℤ`: the printed kernel is `4ℤ`), as recorded in source issue `EffectiveDiophantineMethods/E1`; the authors' implementation already uses the quotient target.

**What a subgroup of finite index permits.** `subgroup-covers-quotient` (`subgroup_covers_quotient`; p.272): if `NΓ ⊆ L` and `gcd([Γ:H], N) = 1` then `H → Γ/L` is onto. With `d = [Γ:H]`, `du + Nv = 1` and `dg ∈ H`, the element `u(dg)` represents `g`. Tests in its acceptance: `H = 2ℤ`, `L = 3ℤ` covers `ℤ/3`; `H = 2ℤ`, `L = 2ℤ` does not.

**Applying the obstruction.** `certified-map-obstruction` (`isEmpty_of_commuting_maps`; p.274): for any type `P` with `j : P → Γ` and maps `r_i : P → G_i` with `φ_i(j(p)) = r_i(p) ∈ X_i`, `A_S(L) = ∅` forces `P` to be empty. `known-points-completeness` (`mem_known_of_unique_fibres`; p.273): if every `j(p)` satisfies the local conditions, every class of `A_S(L)` is `q_L(j(w))` for some `w` in a finite `W`, and `p ↦ q_L(j(p))` is injective, then every `p` lies in `W`. The injectivity is an input; the sieve never provides it.

### The geometric interface

**Reduction data** (`ED.5/jacobian-reduction-data`, structure `JacobianReductionData P Γ C G`). **Planet: Jacobian reduction square.** Let `C/ℚ` be smooth, projective, geometrically integral of genus `g ≥ 1`, `J = Pic⁰_{C/ℚ}` its Jacobian (Tau Ceti JacobianChallenge Layers D–E) and `D₁` a rational divisor of degree one: `D₁ = P₀` for a rational point, or `D₁ = D − W` with `D` a rational divisor of degree three and `W` a canonical divisor, as in Bruin–Stoll §7 (p.299), where `ι(P) = [P + W − D]`. Put `ι(P) = [P − D₁]`. At a prime `p` where `C` has a smooth proper model `𝒞_p/ℤ_(p)` with geometrically connected fibres:

- `red_p : C(ℚ) → C̃_p(𝔽_p)` reduces a point through the section extending it (valuative criterion; models from StableReduction Layer 5);
- `ρ_p : J(ℚ) → J̃_p(𝔽_p)` is the specialisation of the Néron model of `J` over `ℤ_(p)`, which is the abelian scheme `Pic⁰_{𝒞_p/ℤ_(p)}` (requested from `NeronModelsAndSemistableAbelianVarieties:R11.4`; identified with the Néron model by `R11.1/abelian-scheme-model`);
- `ι_p(R) = [R − D̄₁]` with `D̄₁` the specialisation of `D₁` (closure in `𝒞_p`, restricted to the special fibre);
- the square `ρ_p(ι(P)) = ι_p(red_p(P))`, and more generally `ρ_p([E − d·D₁]) = [Ē − d·D̄₁]` for every rational effective divisor `E` of degree `d`, which gives the square on symmetric powers;
- the finite local image `X_p = ι_p(C̃_p(𝔽_p))`.

In genus one with `D₁ = O`, `ρ_p` is the reduction of points on a minimal Weierstrass model (EllipticCurves Layer 4), `ι_p` is the bijection with `Pic⁰` (AlgebraicCurves Layer 10), and `X_p` is the whole group: good places never obstruct elliptic curves. The Lean structure records the points, the groups, `aj`, `redPts`, `red`, `ajRes` and the field `red_aj` (the square). API: `localImage` (data), `mem_localImage`, `red_aj` (compatibility), `red_aj_mem_localImage`, `sieveSet` (the sieve set `A_S(L)` of the curve) with `sieveSet_eq`, `mapLocal` (compose the local data with homomorphisms `f_p`; with `f_p` the quotient by `N·J̃_p(𝔽_p)` this is Bruin–Stoll's `β_{N,p}`) with `mapLocal_red`. Tests: `localImage_mod_five` (two residue points with images `1, 2` in `ℤ/5`: `X = {1, 2}`), `sieveSet_no_places`, `localImage_genus_one` (surjective `ι_p` gives the whole group), `localImage_not_known_points` (the reductions of the known points alone are not the local image).

**Soundness for curves** (`ED.5/curve-sieve-soundness`, `JacobianReductionData.mk_aj_mem_admissibleClasses`, `isEmpty_of_admissibleClasses_eq_empty`; p.274). For any `L` with `Γ/L` finite and any finite `Y_p ⊇ X_p`, every rational point has `q_L(ι(P)) ∈ admissibleClasses(S, L, ρ, Y)`; an empty set proves `C(ℚ) = ∅`. With `L = NΓ` and the local data composed with `G_p → G_p/NG_p`, this is the inclusion of the image of `C(ℚ)` in Bruin–Stoll's `A(S, N)`.

**Local data at bad and deep places** (`ED.5/padic-quotient-sieve-datum`, `padicImageClasses incl U Y`; §§5–6). For any open subgroup `U ≤ J(ℚ_p)` of finite index — `J¹(ℚ_p)` (kernel of reduction for a given model), `J⁰(ℚ_p)`, or `Jⁿ(ℚ_p)`, the `pⁿℤ_p`-points of the formal group — put `G_U = Γ/(Γ ∩ U)` and `X_U` = the classes whose `U`-coset meets `ι(C(ℚ_p))`, or any certified finite superset. Every rational point satisfies the condition, so `(G_U, q, X_U)` is a valid local datum. Finiteness of the index comes from `ED.4/abelian-logarithm` (`[J(ℚ_p) : J¹(ℚ_p)] = #𝒩(𝔽_p)` and `log : Jⁿ ≅ (pⁿℤ_p)^g` for `p` odd). At a good prime with `U = J¹`, the datum is the good-reduction datum restricted to `ρ_p(Γ)`, Bruin–Stoll's normalisation of §3.1. API: `mem_padicImageClasses`, `mk_mem_padicImageClasses` (soundness), `padicImageClasses_mono`, `padicImageClasses_refine` (for `U′ ≤ U`, deeper information projects into shallower information). Tests: `padicImageClasses_top`, `padicImageClasses_empty_points`, `padicImageClasses_mod_four` (`U = 4ℤ`, `Y = {1}`), `padicImageClasses_coset_not_point` (`Y = {5}` keeps the class of `1`: the test is on cosets), `padicImageClasses_good_reduction` (with `U = ker ρ` the test is `ρ(g) ∈ ρ(Y)`).

### Transfers and proved algorithmic facts

**Coprime-index transfer** (`ED.5/coprime-index-transfer`; `inf_range_nsmul_eq_map_of_coprime`, `coprimeIndex_quotient_bijective`, `coprimeIndex_sieve_transfer`). This is the handoff from ED.3. `ED.3/finite-index-subgroup-certificate` gives generators of `H ≤ J(ℚ)` with certified rank and torsion and, through `ED.3/saturation-certificate`, an index prime to every prime of a given set; take `N` with all prime factors in that set. Then:

1. `H ∩ NΓ = NH` (from `dγ ∈ H` and `du + Nv = 1`);
2. `H/NH ≅ Γ/NΓ` (onto by `subgroup-covers-quotient`, injective by 1);
3. with `ψ_i = (G_i → G_i/NG_i) ∘ φ_i|_H` and `X̄_i` the image of `X_i`, every `γ ∈ Γ` satisfying the local conditions has an `h ∈ H` with `h − γ ∈ NΓ` whose class lies in `admissibleClasses(S, NH, ψ, X̄)`.

So the sieve is computed from the generators of `H` alone, testing modulo `NG_i` — the original `A(S, N)` of p.274 with targets `J(𝔽_p)/NJ(𝔽_p)` — and never needs `φ_i(Γ)`, which is not computable from `H` when `[Γ:H] > 1`. Example: `Γ = ℤ`, `H = 3ℤ`, `N = 2`, `G = ℤ/6`; non-example: `H = 2ℤ`, `N = 2`.

**Exactness below the kernels** (`ED.5/kernel-level-exactness`; `mk_mem_admissibleClasses_iff_of_le_ker`, `admissibleClasses_eq_empty_iff_of_le_ker`). If `L ≤ ker φ_i` for all `i ∈ S`, then `q_L(g) ∈ A_S(L)` iff `φ_i(g) ∈ X_i` for all `i`; the sieve set is the image of the globally compatible elements, and it is empty iff there are none. At `L = ⋂ ker φ_i` this is Box's intersection of unions of kernel cosets (Box Remark 2.8 works in `ℤⁿ` instead of finite quotients; the two agree).

**Relevant places** (`ED.5/exponent-relevance`, `range_nsmul_mul_eq_of_padicValNat_le`, `map_range_nsmul_mul_eq_of_padicValNat_le`; p.278). For an abelian group `A` of exponent `e ≠ 0`, a prime `q` and `M` with `v_q(e) ≤ v_q(M)`: `(qM)A = MA`, hence `φ(qMΓ) = φ(MΓ)` for every `φ : Γ → A`. With `unchanged-local-image`, only the places with `v_{q_k}(e_i) ≥ v_{q_k}(N_k)` are tested when lifting from `N_{k−1}Γ` to `N_kΓ`. Examples: `A = ℤ/4`, `q = 2`: `M = 4` gives `8A = 4A`; `M = 2` gives `4A ≠ 2A`. The exponent must be nonzero: `2ℤ ≠ ℤ`.

**The chain** (`ED.5/sieve-chain`, `siftChain S L hL φ X σ T j`; §§3.2–3.3). For `L_0 ≥ L_1 ≥ …` with finite quotients, lifts `σ_j` and test sets `T_j ⊆ S`: level `0` is `admissibleClasses(S, L_0, φ, X)` and level `j + 1` is `refineClasses(T_j, L_{j+1}, L_j, σ_j, level j)`. Bruin–Stoll's PrepareLift/Lift is the instance `L_0 = Γ`, the chain `N_kΓ` refined into prepared steps, `T_j = I_j`. API: `siftChain_zero`, `siftChain_succ`, `card_siftChain_succ_le`, `siftChain_eq_admissibleClasses`. Tests: `siftChain_level_zero`, `siftChain_no_places`, `siftChain_two_levels` (`ℤ/4`, `L_0 = Γ`, `L_1 = 0`, `X = {1}`: level 1 is `{1}`), `siftChain_omitted_changed_test` (the same with `T_0 = ∅`: four classes, not `{1}`).

**Correctness of the chain** (`ED.5/sieve-chain-correct`, `siftChain_eq_admissibleClasses`). If every `σ_j` is a section on `A_S(L_j)`, `T_j ⊆ S`, and every place outside `T_j` has `φ_i(L_{j+1}) = φ_i(L_j)`, then level `j` is `A_S(L_j)` for all `j`; by induction from `relevant-tests`. FindQSequence and PrepareLift's choice of the next subgroup affect cost only.

**GetSubgroup** (`ED.5/subgroup-from-membership-test`, `getSubgroup K b`; §5, pp.294–295). For a list `b` generating `Γ` and `K ≤ Γ` of finite index with decidable membership, processing `b_k` finds the least `j ≥ 1` with `j·b_k + a ∈ K` for a representative `a` of the image of `⟨b_1, …, b_{k−1}⟩` in `Γ/K`, records `g_k = j·b_k + a` and extends the representatives by `a + i·b_k`, `0 ≤ i < j`. The output lies in `K`, has length `r` and generates `K` (by induction, `K ∩ ⟨b_1..b_k⟩ = ⟨g_1..g_k⟩`); torsion is allowed. Bruin–Stoll use it for `K = J(ℚ) ∩ J⁰(ℚ_p)` with the test of Proposition 5.10. API: `closure_getSubgroup`, `getSubgroup_mem`, `length_getSubgroup`, `getSubgroup_top`. Tests: `getSubgroup_whole_group`, `getSubgroup_int_four` (`[1] ↦ [4]` for `4ℤ`), `getSubgroup_parity` (`[(1,0), (0,1)] ↦ [(2,0), (1,1)]` for the even-sum subgroup of `ℤ²`), `getSubgroup_naive_multiples` (`(2,0), (0,2)` generate a proper subgroup of it).

**Genus-two bad information** (`ED.5/genus-two-bad-information`; Theorem 5.11, Proposition 5.10, Corollaries 5.14–5.15). Over a complete DVR with residue characteristic `≠ 2`, for a squarefree sextic `F`, the origin component `J_{F̄}^0` of the smooth locus of the special fibre of the Cassels–Flynn model is a commutative algebraic group, its law being Cantor composition and reduction except when both `A` vanish at the same singular point (`φ(X², λXZ²) + φ(X², μXZ²) = φ(X², ((f₂ + λμ)/(λ + μ))XZ²)`, zero when `λ + μ = 0`); `P ∈ J_F^0` iff `δ(κ(P)) ≠ 0`; and if the model is regular and `F̄` is not a square, `0 → J_F¹(L) → J_F(L) → J_{F̄}^0(k) → 0` is exact. At an odd prime with a regular one-component model this computes the bad datum as at good primes; at other odd primes GetSubgroup with the test `v_p(δ(κ(P))) = 4v_p(κ(P))` finds `J(ℚ) ∩ J⁰(ℚ_p)`. Remark 5.16 (Néron model comparison) is stated without proof in the source and is not used. Remark 5.12 (orders of `J_F^0(𝔽_q)` by factorisation pattern) and the square case `F = H²` (three components, the non-identity ones principal homogeneous spaces) are its acceptance tests.

**Genus-two deep information** (`ED.5/genus-two-deep-information`; §6, Lemma 6.2). For `p` odd: `K_n = J(ℚ) ∩ Jⁿ(ℚ_p)` is the kernel of `K₁ → (pℤ_p/pⁿℤ_p)²`, `P ↦ log P`; and if `P₀ ∈ C(ℚ_p)`, `Q ∈ Jⁿ(ℚ_p)` and `(η₁ : η₂ : η₃ : η₄)` are normalised dual-Kummer coordinates of `P₀ + Q`, then `v_p(η₁η₃ − η₂²) ≥ n` and `v_p(η₄) ≥ 2n`. The classes of `J(ℚ)/K_n` whose chosen representative passes this test form a certified superset of the true local set, used through `local-overapproximations`. The test is one-sided. The incremental computation and the linear forms `ℓ_m` reduce cost only.

### Heights and integral points

**Separation of cosets** (`ED.5/height-coset-separation`, `eq_of_sub_mem_range_nsmul_of_height_le`; §4.2, p.281). Let `ĥ` be a nonnegative ℤ-quadratic map, `ĥ(x) ≥ m` on elements of infinite order, `N·x = 0` on torsion and `N²m > 4H′`. If `x − y ∈ NΓ` and `ĥ(x), ĥ(y) ≤ H′` then `x = y`: `ĥ(x − y) ≤ 2ĥ(x) + 2ĥ(y)` by the parallelogram law, and `x − y = Nz` with `z` of infinite order would give `ĥ ≥ N²m`. Examples: `Γ = ℤ`, `ĥ = x²`, `N = 3`, `H′ = 2`; the torsion condition fails for `Γ = ℤ/2 × ℤ`, `N = 1`.

**Points of bounded height** (`ED.5/height-bounded-points`, `mem_candidates_of_height_le`; §4.2). Given `ĥ(ι(P)) ≤ d·h(P) + δ` with `d ≥ 0`, `H′ = dH + δ`, and for each `a ∈ A_S(L)` a finite set `T_a` containing every element of the class `a` of height at most `H′` (a closest-vector certificate from `ED.1/short-vector-enumeration-complete`), every rational point with `h(P) ≤ H` has `ι(P) ∈ T_a` for some `a`; for `L ⊆ NΓ` each `T_a` has at most one such element. The minimal height `m` comes from `ED.3/height-lower-bound-by-search` (elliptic curves) or a short-vector certificate; the constants `d, δ` from `ED.3/explicit-height-difference-bound` (elliptic curves) or the genus-two height-comparison gap.

**Recognising curve points** (`ED.5/kummer-curve-test`; Lemma 4.1, corrected). For a genus-two curve `y² = F(x, z)`, `P₀ ∈ C(ℚ)` with `x(P₀) = (a : b)`, `ι(P) = [P − P₀]`, Kummer coordinates `(k₁ : k₂ : k₃ : k₄)` and `γ ≥ h − ĥ`: if distinct good primes satisfy `p₁⋯p_m > 3e^{H′+γ}max(|a|, |b|)²` and, when `P₀ ≠ P̄₀`, the primes separating `P₀` from its hyperelliptic conjugate `P̄₀` have product `> e^{H′+γ}`, then every `Q` with `ĥ(Q) ≤ H′` whose reductions lie in the reduced curve images is in `ι(C(ℚ))`. The printed hypothesis lacks the factor `3` (source issue `EffectiveDiophantineMethods/E12`), and the printed divisibility `k₁b² − k₂ab + k₃a²` has `a` and `b` interchanged (`EffectiveDiophantineMethods/E13`). The arithmetic core, `kummerLineValue_eq_zero`, says that an integer divisible by the distinct primes and bounded by `3B·max(|a|,|b|)² < ∏p_j` vanishes. The Kummer surface facts are the Cassels–Flynn gap.

**Siksek's step** (`ED.5/siksek-lattice-step`, `represents_of_siksek_step`; §4.3, pp.282–283). If `W` represents the image of the points in `Γ/L` (every `j(p) ∈ W + L`), `φ : Γ → A` sends every point into `Y`, `L′ = L ∩ ker φ`, `R` meets every nontrivial coset of `L′` in `L`, and `φ(w + r) ∉ Y` for all `w ∈ W`, `r ∈ R`, then `W` represents the image in `Γ/L′`. Only finitely many values `φ(w + r)` are computed; no discrete logarithm of the local image is needed.

**Integral points on hyperelliptic curves** (`ED.5/integral-points-completeness`, `mem_known_of_height_gap`; §4.3). For `f ∈ ℤ[x]` separable of degree `n ≥ 5`, the curve `y² = f(x)` of AlgebraicCurves Layer 10, its integral points `𝓘` and `ι` (base `∞` for odd degree), the covering map is the inclusion of `𝓘` into `C(ℚ)` followed by `ι`. Given (i) `ι(𝓘) ⊆ ι(W) + L` (sieve and Siksek steps), (ii) `ĥ ≥ μ` on `L ∖ {0}` (short vectors), (iii) `ĥ(ι(P)) ≤ d·log max(1, |x(P)|) + δ`, and (iv) `log max(1, |x|) ≤ B` on `𝓘` from `DiophantineApproximationAndTranscendence:DT.4/baker-superelliptic-theorem` (`n = 2`, `b = 1`: `B = (4N)^{2^{12}N⁴}e^{50N⁴h(f)}` with `h(f) = log max(1, |coefficients of f|)`) or any certified sharper bound: if `√w* < √μ` and `dB + δ < (√μ − √w*)²` with `w* = max_{w∈W} ĥ(ι(w))`, then `𝓘 = W`. The proof uses that `√ĥ` is a seminorm (Cauchy–Schwarz for nonnegative quadratic maps over ℤ). Bounds that do not cross give no conclusion; Bruin–Stoll report sieve moduli near `10^100` and second-stage indices up to `10^1800` against Baker-type bounds near `10^600`. The descent covering `x − α = κξ²` of Bugeaud–Mignotte–Siksek–Stoll–Tengely, which gives sharper bounds, is not used.

### Combination with Chabauty–Coleman

**Theorem** (`ED.5/chabauty-sieve-combination`; §4.4, pp.283–284; McCallum–Poonen Theorem 5.3(a)). **Planet: Chabauty–sieve combination.** Let `C` have genus `g ≥ 2` and rank `r < g`, `p₀ ≥ 3` a good prime with a nonzero `ω ∈ Ann_{p₀}(J(ℚ))` (`ED.4/annihilating-differentials`) integral with nonzero reduction `ω̄`, `Ū ⊆ C̃(𝔽_{p₀})` the residue classes in which `ED.4/residue-disc-zero-bound` allows at most one rational point (for instance `ω̄(R) ≠ 0`: `m = 0 < p₀ − 2`), and `L` of finite index with `L ⊆ ker ρ_{p₀}` (for instance `L ⊆ NJ(ℚ)` with `exp J̃(𝔽_{p₀}) | N`). Then:

1. `ι(P) − ι(P′) ∈ L` implies `red_{p₀}(P) = red_{p₀}(P′)`, because `ι_{p₀}` is injective (Abel–Jacobi is a closed immersion in genus `≥ 1`, JacobianChallenge Layer F);
2. `P ↦ q_L(ι(P))` is injective on the points reducing into `Ū`;
3. if the sieve with local set `ι_{p₀}(C̃(𝔽_{p₀}) ∖ Ū)` at `p₀` is empty, every point reduces into `Ū`; residue classes outside `Ū` can instead be settled one at a time by valid `ED.4/residue-disc-verdict`s, which list their rational points;
4. if the known list contains every point reducing outside `Ū` (for instance there is none) and every class of `A_S(L)` is the class of a known point, then `C(ℚ)` is the known list.

Lean: `injOn_mk_aj_of_residue_unique`, `redPts_mem_of_sieve_empty`, `mem_known_of_chabauty_sieve` in `JacobianReductionData`. While some class is not represented, the computation is open: `S` or `L` is refined and nothing is concluded. Bruin–Stoll's procedure (find `p`, choose `S` and `N` with `exp J(𝔽_p) | N`, compute `A(S, N)`, identify each element with a known point) is the acceptance test; without `L ⊆ ker ρ_{p₀}`, injectivity fails.

### The relative symmetric sieve

**Theorem** (`ED.5/relative-symmetric-sieve`, `JacobianReductionData.relative_symmetric_sieve` and `relative_symmetric_sieve_of_admissibleClasses`; Caraiani–Newton Theorem 7.4.2 = Box Theorem 2.6). **Planet: relative symmetric Mordell–Weil sieve.** Let `X/ℚ` be non-hyperelliptic of genus `g ≥ 3`, possibly with a degree-two map `π : X → C`; primes `p₁, …, p_r` of good reduction for `X` (and `C`, with `π` extending); `G = ⟨D₁, …, D_n⟩ ≤ J(ℚ)` of finite index with `I·J(ℚ) ⊆ G`; a finite `L ⊆ X^(2)(ℚ)` containing a rational degree-two divisor `∞`; and `L_i^good ⊆ L` certified at `p_i` by `ED.4/symmetric-chabauty` (alone in its residue class) or `ED.4/relative-symmetric-chabauty` (every point of the class comes from `C(ℚ)`). Put `ι(x) = I·([x] − ∞) ∈ G`, `ι_p(R) = I·([R] − ∞̃)` (the degree-two square of `jacobian-reduction-data`), and `M_i^bad = ι_{p_i}^{-1}(red_{p_i}(G)) ∖ red_{p_i}(L_i^good)`. If no `g ∈ G` has `red_{p_i}(g) ∈ ι_{p_i}(M_i^bad)` for every `i`, then `X^(2)(ℚ) = L ∪ π*C(ℚ)`. Proof: a point outside `L ∪ π*C(ℚ)` reduces into `M_i^bad` at every `p_i` (Caraiani–Newton Proposition 7.4.1, the second part of `ED.4/relative-symmetric-chabauty`), so `ι(x)` violates the hypothesis. By `kernel-level-exactness` the hypothesis is equivalent to an empty finite sieve at `⋂ ker(red_{p_i}|_G)`. Examples (reproduced in ED.6): Caraiani–Newton Proposition 7.4.5 for `X(s3, ns5)` over `X(ns3, ns5)` with `I = 10`; Box's `X₀(43)` with the primes `5, 7, 11`.

### The certificate

**Definition** (`ED.5/sieve-certificate`, structure `SieveCertificate P Γ C G`). **Planet: Mordell–Weil sieve certificate.** A certificate records:

1. jacobian reduction data: the curve, `D₁`, the places with their local groups, the local maps on generators and certified local sets (good data, or bad and deep data from `padic-quotient-sieve-datum`);
2. the Mordell–Weil input: generators of `H ≤ J(ℚ)` with the ED.3 certificates of rank, torsion and index prime to the primes of `N` (`ED.3/finite-index-subgroup-certificate`, `ED.3/saturation-certificate`), or `ED.3/mordell-weil-basis-certificate`; a rank resting on an analytic hypothesis (BSD) is a labelled hypothesis, not a field;
3. the modulus, the chain `L_0 ⊇ … ⊇ L_t`, the lifts and the test sets;
4. the exhaustive candidate set `candidates` = `siftChain` at level `t`;
5. the known points and the mode: emptiness, Chabauty (an annihilating differential at `p₀` with its certified residue classes, `L_t ⊆ ker ρ_{p₀}`), or height (`H`, separation data, short-vector certificates).

`Checked` is the conjunction of the verifier's finite checks: sections on the sieve sets, `T_j ⊆ S`, unchanged image subgroups at omitted places. API: `candidates`, `candidates_eq_siftChain`, `Checked`, `candidates_eq_sieveSet`, `mk_aj_mem_candidates`, `chain`. Tests: `candidates_no_steps` (no places, chain `⊤` on `ℤ/2`: the single class), `candidates_mod_four` (one place, `X = {1}`, chain `0` on `ℤ/4`: `{1}`), `candidates_nonempty_without_points` (`ℤ/2`, local images `{0}` and `{1}`, no points: the candidate set is nonempty, so a nonempty candidate set is not a point).

**Soundness** (`ED.5/sieve-certificate-sound`; `SieveCertificate.isEmpty_of_candidates_eq_empty`, `SieveCertificate.mem_known_of_chabauty`; p.273, p.280). For a checked certificate over `J(ℚ)` or over `H` transported by `coprime-index-transfer`: (a) empty candidates give `C(ℚ) = ∅`; (b) in Chabauty mode with every candidate represented, `C(ℚ)` is the known list; (c) in height mode every point of height at most `H` is among the candidates of `height-bounded-points`. Each conclusion carries the certificate's assumptions — index and saturation, the rank and its conditionality label (`ED.3/rank-upper-bound`), primes, local images, chain.

**Worked statement** (`ED.5/small-genus-two-nonexistence`, an application; §4.1, §8). The 1492 genus-two curves `y² = f(x)` with `deg f ∈ {5, 6}` and coefficients in `{−3, …, 3}` left undecided by point search, local solubility and 2-cover descent have no rational point; ranks at most two used good information only, ranks three and four also bad and deep information, and some cases rest on BSD for the rank and are conditional. §8's census (521 curves of rank one, 514 decided while collecting information; 772 of rank two; 152 of rank three; two of rank four) is its acceptance test. The individual certificates are ED.6 examples.

### Dependencies

Inside this roadmap: ED.1 (`short-vector-enumeration-complete` for closest vectors and minima), ED.3 (`finite-index-subgroup-certificate`, `saturation-certificate`, `mordell-weil-basis-certificate`, `rank-upper-bound`, `explicit-height-difference-bound`, `height-lower-bound-by-search`), ED.4 (`abelian-logarithm`, `annihilating-differentials`, `residue-disc-verdict`, `residue-disc-zero-bound`, `symmetric-chabauty`, `relative-symmetric-chabauty`). ED.6 consumes the certificate and its soundness.

Other roadmaps: Tau Ceti JacobianChallenge Layers D, E, F (Jacobian, abelian varieties, Abel–Jacobi injectivity), EllipticCurves Layer 4 (elliptic reduction), AlgebraicCurves Layer 10 (hyperelliptic models), StableReduction Layer 5 (smooth and regular models); `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model` and a request to `R11.4` (relative `Pic⁰` of a smooth proper curve over `ℤ_(p)` and specialisation of divisors); a request to `HeightsRationalPointsAndObstructions:RP.0` (Néron–Tate height on `J(ℚ)`); `DiophantineApproximationAndTranscendence:DT.4/baker-superelliptic-theorem` (integral-point bound). Mathlib: quotient groups, finite sets, `QuadraticMap`, `AddMonoid.exponent`, `padicValNat`, `AddSubgroup.closure`, `IsOfFinAddOrder`, `Real.sqrt`.

Recorded gaps: certified finite presentations (Mumford representation and Cantor's algorithm for `J(𝔽_p)`, a certified isomorphism with a product of cyclic groups, discrete logarithms, enumeration of `C(𝔽_p)`, Smith normal forms of the sieve quotients; natural owner CN.3); the Cassels–Flynn explicit model of genus-two Jacobians, Kummer and dual Kummer surfaces (`δ`, the biquadratic forms `A` and `B`, Lemma 6.1); genus-two height-comparison constants (`γ`, `d`, `δ`, height-pairing matrix); and the data of the small-curves experiment.

### Source issues

- `EffectiveDiophantineMethods/E1`: PrepareLift's printed `L_{j−1} ∩ ker(φ_i)` must be `L_{j−1} ∩ φ_i^{-1}(N_kG_i)` (p.279).
- `EffectiveDiophantineMethods/E12`: Lemma 4.1 needs `p₁⋯p_m > 3e^{H′+γ}max(|a|,|b|)²`; the printed proof bounds a sum of three terms by one of them (`(k₁, k₂, k₃) = (1, −1, 1)`, `a = b = 1` gives `3 > 1`).
- `EffectiveDiophantineMethods/E13`: in the proof of Lemma 4.1, `k₁b² − k₂ab + k₃a²` should be `k₁a² − k₂ab + k₃b²` for `x(P₀) = (a : b)`, by the paper's own convention of Lemma 5.3.
- `EffectiveDiophantineMethods/E14`: FindQSequence's success test `n < ε` should be `n < ε₁` (p.278), as the surrounding text and §7 require.

### Acceptance

The final certificate contains the index and saturation assumptions, the primes, the local images and the exhaustive candidate set, and a verifier re-runs its finite checks. A checked certificate with empty candidates proves `C(ℚ) = ∅`; one in Chabauty mode with every candidate represented by a known point proves the list complete; one whose candidate set is nonempty and not covered is an open computation and proves nothing. The ℤ/2 example with incompatible local sets `{0}`, `{1}` and the `ℤ/4` example of an omitted changed test are permanent regression tests.

## ED.6. Explicit higher methods and reproducible examples

This layer turns the methods of ED.2–ED.5 and the quadratic Chabauty theory of
`AnabelianGeometryAndNonabelianChabauty:NC.5` into certified, reproducible determinations of
solution sets. It owns three things: the certificate format and the comparison theorem that
every example ends with; the explicit formulas of Balakrishnan–Dogra–Müller–Tuitman–Vonk
(BDMTV 2019, Annals 189; BDMTV 2021, Compositio 159, read as arXiv:2101.01862v4) that turn the
quadratic Chabauty pair of NC.5 into finitely many power series on residue discs; and the
worked examples — two quartic Thue equations, the integral points of an elliptic curve, an
S-unit equation, a Thue–Mahler equation, the split Cartan curve X_s(13) with its consequences,
the exceptional curve X_S4(13) and the genus-three curves X_0^+(N). The general theory of
quadratic Chabauty pairs, nice correspondences, mixed extensions and p-adic heights is NC.5's
and is cited, never re-planned; the universal unipotent connections, Hadian's characterisation
of the Hodge filtration and Besser's Frobenius-equivariant path transport are NC.2's; Tuitman's
Frobenius algorithm and the Balakrishnan–Tuitman Coleman integrals are
`PadicDifferentialEquationsAndRigidCohomology:RD.7`'s; the analytic-rank-one theorems for
modular abelian varieties are `GrossZagierAndArithmeticHeights:GZ.8`'s with
`HeegnerPointEulerSystems:HE.7`; certified L-value enclosures are
`ComputationalNumberTheory:CN.4`'s. ED.6 certifies examples, not these suppliers.

Namespace `TauCeti.EffectiveDiophantine.ED6`; modules under
`TauCeti/NumberTheory/Diophantine/` (`Certificate`, `QuadraticChabauty/Explicit`,
`QuadraticChabauty/Algorithm`, `Examples/SplitCartan13`, `Examples/ModularCurves`,
`Examples/Classical`).

### Pinned conventions

- **Solution sets are exact.** Candidates are integers, rationals, rational points; a p-adic
  number enters only as an element of `ℚ_[p]` or `ℤ_[p]` known to an explicit absolute precision
  through `EffectiveDiophantineMethods:ED.0/padic-embedding-certificate`. Numerical agreement
  never proves an identity, and a positive lower endpoint of a certified interval is the only
  proof of nonvanishing of a real number.
- **Completeness labels.** A completeness statement carries the conjunction `H` of its
  unresolved or conditional inputs as an explicit parameter; `H = True` is the unconditional
  label. The analytic route to rk J_s(13)(ℚ) = 3 is unconditional; the descent route of
  BDMTV Remark 6.3 is conditional on the Generalised Riemann Hypothesis and keeps that label.
- **Basis and Tate classes.** In the explicit set-up the first g differentials
  ω_0, …, ω_{g−1} are holomorphic and the classes of ω_0, …, ω_{2g−1} form a symplectic basis
  (ω_i ∪ ω_{g+i} = 1). This holomorphy is required by BDMTV §4.5 although §4.1 omits it
  (`PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E4`; the bare labels E1–E8 in this section are that paper's errata, not the roadmap's EffectiveDiophantineMethods/E1–E16). A Tate class Z = Σ Z_ij ω_i ⊗ ω_j is recorded by
  its coefficient matrix; in this basis condition (b) is "the lower-right g × g block is zero",
  (c) is Σ_{i<g} Z_{i,g+i} = 0 and (d) is Zᵀ = −Z. The converse of BDMTV Lemma 4.7 is false
  (E5) and is never used.
- **Gauge sign.** At a point x at infinity, C_x = [[1,0,0],[Ω_x,1,0],[g_x,Ω_xᵀZ,1]] with
  dΩ_x = −ω and dg_x = Ω_xᵀ Z dΩ_x − η (BDMTV 2019 (29)), forced by the connection matrix
  Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]. The residue condition determining η is
  Res_x(Ω_xᵀ Z dΩ_x − η) = 0 (30), not the printed step (i) of §4.5 (E2). The 2021 restatement
  with dΩ_x = +ω and g_x a primitive of dΩ_xᵀ Z dΩ_x − η is not used (`EffectiveDiophantineMethods/E16`, `EffectiveDiophantineMethods/E15`).
- **Transport orientation.** The transport τ_{b,x} on A_Z^dR is v ↦ I(x_0, x) · v · I(b, b_0),
  left multiplication by I(x_0, x) and right multiplication by I(b, b_0); the printed product on
  BDMTV p.923 has the limits reversed (E3). In the algebra Q ⊕ V ⊕ Q(1) the product is
  (a, b, c)(a', b', c') = (aa', ab' + a'b, ac' + a'c + bᵀZb').
- **Precision.** A residue disc is parametrised by s ∈ ℤ_p with t = ps; balls are
  {‖s − c‖ ≤ p^(−n)}; valuations of input constants are certified by
  `EffectiveDiophantineMethods:ED.0/valuation-certificate`.

### Certificates and the comparison theorem

- **Certified solution set** (`CertifiedSolutionSet H P`; node `ED.6/certified-solution-set`,
  the ED.6 instance of the `ComputationalNumberTheory:CN.5` schema). For a predicate P on a
  type α and a proposition H: a finite set S with soundness (every element of S satisfies P,
  unconditionally) and completeness under H (H implies every solution lies in S). API:
  `mem_iff` and `coe_eq_setOf` (under H the set is exactly {x | P x}, hence finite),
  `solutions_eq` (two certificates agree when both hypotheses hold), `unconditional`
  (constructor with H = True), `mono` (strengthen H), `discharge` (prove H), `map` (transport
  along an equivalence). Tests: for x² = 4 over ℤ every certificate is {−2, 2}; for P = False
  it is ∅; {2} is sound but not complete; agreement with Mathlib's `Set.Finite.toFinset`; a
  certificate under H = False is vacuous. A CAS output, a database label or a list of verified
  solutions without a completeness proof is not a certificate.
- **Comparison of p-adic candidates with global points** (`eq_of_matched_or_excluded`; node
  `ED.6/padic-candidate-comparison`; this is the stage acceptance). Let R ⊆ Z ⊆ X, where R is
  the set of global solutions and Z the common zeros of the certified p-adic functions; let
  finitely many balls B_i cover Z with each Z ∩ B_i of at most one element; let L ⊆ R be a
  finite set of verified global solutions. If every ball is matched (contains an element of L)
  or excluded (R ∩ B_i = ∅ certified by a Mordell–Weil sieve,
  `EffectiveDiophantineMethods:ED.5/chabauty-sieve-combination`, a second function, or a local
  obstruction), then R = L. Without a decision for some ball only L ⊆ R ⊆ L ∪ (undecided
  candidates) holds and the computation is open. Uniqueness in each ball is indispensable:
  Z = {0, p^n} and one ball p^n ℤ_p matched by 0 is the counterexample. At depth one this is
  the comparison step of `EffectiveDiophantineMethods:ED.4/chabauty-coleman-completeness`.
- **Residue-disc certificate** (`QCDiscCertificate p ι`; node `ED.6/qc-disc-certificate`).
  Functions f_i : ℤ_p → ℚ_p (the determinants det T in the disc parameter, with coefficients
  known modulo p^N and the tail bound of `height-series-valuation-bound`), a finite set of
  centres, a precision n, a proof that every common zero is within p^(−n) of a centre, and a
  proof that each such ball contains at most one common zero. API: `exists_centre`,
  `eq_of_mem_ball`, `ncard_commonZeros_le` (at most #centres common zeros),
  `commonZeros_eq_empty`, `addFunction`. Tests: s − 1 with centre 1; the constant 1 with no
  centres; s(s − 17⁶) cannot be certified with one centre at precision 5; for a polynomial the
  count is bounded by `Polynomial.card_roots'`.
- **Soundness of a quadratic Chabauty certificate** (`rationalPoints_eq_of_qcCertificate`;
  node `ED.6/qc-certificate-sound`). Hypotheses: X/ℚ smooth projective of genus g ≥ 2 with
  r = g, log : J(ℚ) ⊗ ℚ_p ≅ H⁰(X_{ℚ_p}, Ω¹)^*, ρ(J) ≥ 2, p good; nice classes Z_j with their
  NC.5 pairs (θ_j, Υ_j) (BDMTV Lemma 3.7, using only κ(J(ℚ)) ⊗ ℚ_p as corrected in E8;
  Υ_j = {0} under potentially good reduction everywhere, Corollary 3.8); enough known points
  for the determinant criterion (Lemma 1.5, or its K-equivariant form). Given a disc certificate
  for every residue disc of X(𝔽_p) and a matching or exclusion for every centre, X(ℚ) is the
  known list. A missing disc leaves only "known ⊆ X(ℚ)".

### The explicit method of BDMTV 2019 §§4–5

- **Set-up** (`ExplicitSetup`; node `ED.6/explicit-setup`, item /39). X, an affine open Y with
  b ∈ Y(ℚ) integral at p, D = X ∖ Y with d points over a number field L, differentials
  ω_0, …, ω_{2g+d−2} on Y as in the conventions (third-kind ω_{2g}, …, ω_{2g+d−2} completing a
  basis of H¹_dR(Y)), V_dR(Y) = H¹_dR(Y)^* with dual basis T_i, and an admissible Tate class.
  The linear-algebra record `ExplicitSetup` holds the residue matrix of the third-kind
  differentials at D (columns sum to zero, rank d − 1), the cup product matrix
  `symplecticCupMatrix g` and an `AdmissibleTateMatrix g` (conditions (b)–(d); condition (a) is
  a property over ℚ_p supplied by the correspondence). API: `residue_injective`,
  `cupMatrix_eq`, `transpose_eq_neg`, `lowerRight_eq_zero`, `trace_cup_eq_zero`,
  `linearConditions`. Tests: Z1 of X_s(13) is admissible (antisymmetric, zero lower-right block,
  10 + 1 − 11 = 0); the zero matrix and the symmetric `fromBlocks 0 1 1 0` are not; the genus-one
  cup product matrix.
- **Connection of A_Z on Y** (node `ED.6/explicit-connection`, items /49, /51). In a
  trivialisation s_0 of A_Z(b)|_Y, ∇ = d + Λ with η in the span of the third-kind
  differentials (after the change T_i ↦ T_i + α_i S), and η is the unique such differential
  for which ∇ extends holomorphically to X: Σ_k c_k Res_x(ω_{2g+k}) = Res_x(Ω_xᵀ Z dΩ_x) at every
  x ∈ D, which has a unique solution (`ExplicitSetup.eta_existsUnique`). Inputs: Kim's
  universal connection and Corollary 4.4 (NC.2).
- **Gauge transformations** (`gaugeMatrix`; node `ED.6/gauge-transformation`, item /50).
  The unipotent matrix C_x above, with `connectionMatrix` for Λ. API: `gaugeMatrix_inv`
  (inverse [[1,0,0],[−Ω,1,0],[−g,−ΩᵀZ,1]] for antisymmetric Z), `gaugeMatrix_det` (= 1),
  `gaugeMatrix_gauge_iff` (C⁻¹ dC = Λ exactly when dΩ = −ω and dg = ΩᵀZdΩ − η),
  `gaugeMatrix_shift` (dependence on the constants of integration). Tests: the trivial gauge is
  the identity; an explicit genus-one inverse; the 2021 sign convention dΩ = +ω fails the gauge
  equation; C − 1 is nilpotent of order 3.
- **Hodge filtration** (`hodgeFiltration_basis`; node `ED.6/hodge-filtration-explicit`, item
  /52, BDMTV Theorem 4.11). With N = (0_g, 1_g)ᵀ: there are unique γ_Fil ∈ 𝒪(Y) and
  b_Fil ∈ ℚ^g with γ_Fil(b) = 0 and g_x + γ_Fil − b_FilᵀNᵀΩ_x − Ω_xᵀZNNᵀΩ_x regular at every
  x ∈ D; then Fil⁰A_Z|_Y has basis 1 + γ_Fil S, T_g + b_g S, …, T_{2g−1} + b_{2g−1} S, i.e.
  s_0⁻¹s^Fil = [[1,0,0],[0,1,0],[γ_Fil, β_Filᵀ, 1]] with β_Fil = (0, b_Fil). Uniqueness: a
  difference (γ, b) makes dγ + Σ b_i ω_i holomorphic, so Σ_{i≥g} b_i[ω_i] ∈ Fil¹ and b = 0, then
  γ is constant and zero. Existence (the Riemann–Roch argument the source omits): the principal
  parts define a class in H¹(X, 𝒪_X) ≅ H¹_dR(X)/Fil¹, which the primitives of ω_g, …, ω_{2g−1}
  span; Galois descent gives rationality. Extension over D and Hadian's three conditions (NC.2)
  identify the subbundle with Fil⁰.
- **Algorithm for the Hodge data** (`HodgeFiltrationData`; node
  `ED.6/hodge-filtration-algorithm`, item /53). Exact linear algebra over L: Laurent expansions
  to the largest pole order, η from (30), principal parts of g_x, then b_Fil and γ_Fil in a
  Riemann–Roch space. The output is certified by substitution into (30) and (32). API:
  `ResidueCondition`, `RegularCondition`, `ext_of_conditions`, `betaFil`, `smul`. Tests: the
  X_s(13) value β_Fil,Z1 = (0,0,0,0,1/2,1/2); Z = 0 gives zero data; the printed sign of step (i)
  gives −η; additivity in Z.
- **Transport matrices** (`leftMulMatrix`, `rightMulMatrix`, `transportMatrix`; node
  `ED.6/transport-matrices`, item /59). L(a,b,c) = [[a,0,0],[b,a,0],[c,bᵀZ,a]] and
  R(a,b,c) = [[a,0,0],[b,a,0],[c,−bᵀZ,a]] (44); φ_Z(b, x) = τ_{b,x} ∘ φ_Z(b_0, x_0) ∘ τ_{b,x}⁻¹
  (43). API: `leftMulMatrix_mul`, `rightMulMatrix_mul` (anti-multiplicative for antisymmetric
  Z), `leftMul_rightMul_comm`, `mulVec_leftMulMatrix`. Tests: the unit acts trivially; the
  products (1,(1,0),0)(1,(0,1),0) = (1,(1,1),1) and in the other order (1,(1,1),−1) for the
  standard form; the formula for R fails for symmetric Z; first-order parts of transported paths
  compose (∫_{x_0}^x + ∫_{b_0}^{x_0} + ∫_b^{b_0} = ∫_b^x).
- **Frobenius structure** (`frobeniusStructure_eq`; node `ED.6/frobenius-structure-matrix`,
  item /60). With an overconvergent lift φ, φ^*ω = Fω + df (f(b_0) = 0, RD.7), FᵀZF = pZ: the
  inverse Frobenius structure is G = [[1,0,0],[f,F,0],[h,gᵀ,p]] with dgᵀ = dfᵀZF and
  dh = ωᵀFᵀZf + dfᵀZf − gᵀω + φ^*η − pη, h(b_0) = 0, the unique solution of
  Λ_φ G + dG = GΛ sending 1 to 1 at b (Lemma 5.2, NC.2).
- **Frobenius-equivariant splitting** (`frobeniusSplitting_eq`; node
  `ED.6/frobenius-equivariant-splitting`, item /61). At a Teichmüller point,
  α = (I − F)⁻¹f(x_0) = ∫_{b_0}^{x_0} ω, β = gᵀ(F − p)⁻¹, γ = (gᵀα + h(x_0))/(1 − p); at general
  points multiply by L(I(x_0, x)) R(I(b, b_0)) (E3), so α_φ(b, x) = ∫_b^x ω.
- **Local height at p** (`localHeight`, `localHeight_eq`; node `ED.6/local-height-at-p`, item
  /64, Lemma 5.5). h_p(A_Z(b, x)) = χ_p(γ_φ − γ_Fil − β_φᵀ s_1(α_φ) − β_Filᵀ s_2(α_φ)), from
  the NC.5 height formula (17) and D_cris(A_Z(b, x)) ≅ x^*A_Z (Lemma 5.4); on each disc a
  convergent power series.
- **Base-point change** (`baseChange_splitting_eq`; node `ED.6/base-point-change`, item /65,
  Lemma 5.7). For b' in a disc without poles: β_Fil(b') = β_Fil(b),
  γ_Fil(b', x) = γ_Fil(b, x) − γ_Fil(b, b'), and s_0⁻¹s^φ(b', b') has (3,2) block
  β_φ(b, b)ᵀ + 2∫_b^{b'} ωᵀZ; this handles discs where the lift is not defined.
- **Coefficient valuations** (`valuation_coeff_ge`; node `ED.6/height-series-valuation-bound`,
  item /89 and BDMTV 2021 Proposition 4.6). For combinations of single and double integrals of
  p-integral series, v_p(c_n) ≥ min(input valuations) − 2⌊log_p n⌋; for the quadratic
  Chabauty function ρ, ord_p(ρ_i) ≥ −2⌊log_p i⌋ + c_1 + min{c_2, c_3} for i ≥ i_0.
- **Root determination** (`roots_determined_of_truncation`; node
  `ED.6/root-determination-precision`, BDMTV 2021 Lemma 4.7). If min_i(ord_p F_i + i) = k,
  ord_p F_i + i ≥ n for every i ≥ m (BDMTV 2021 print the weaker max{i : ord_p F_i + i = n} < m, which does not suffice: source issue E21) and F has at most d roots in ord_p(x) ≥ 1, the roots are
  determined with multiplicity to precision (n − k)/d by F_0, …, F_{m−1} mod p^n; d is bounded
  by `EffectiveDiophantineMethods:ED.4/residue-disc-zero-bound`.
- **Quadratic Chabauty for modular curves** (`qcAlgorithm`, `QCInput`, `QCOutput`,
  `QCFailure`; node `ED.6/qc-modular-algorithm`, BDMTV 2021 Algorithm 3.12). Inputs: certified
  rank r = g and ρ > 1 (inputs, not outputs), affine patches monic in y with p-integral
  coefficients satisfying Tuitman's Assumption 1 (June 2020 correction, RD.7), p good with T_p
  generating End⁰(J), local heights at the bad primes (NC.5, BDMTV 2021 Theorem 3.2), starting
  precision and a height bound. Steps (1)–(7) as in the source. Output: `fail` with one of
  `noIntegralSymplecticBasis`, `heightPairingUnsolved`, `precisionLoss`,
  `multipleRootAtKnownPoint`, or `candidates A n'` with every rational point of a covered disc
  reducing into A. Termination is unconditional; a FAIL is an open computation and is never the
  empty candidate set (`QCOutput.fail_ne_empty`); a candidate output becomes a certified set only
  through `QCOutput.toCertifiedSolutionSet` (matching and sieve exclusion). Tests: the ten points
  of X_0^+(97) at p = 5; no covered disc asserts nothing; FAIL is not candidates ∅; sieve
  compatibility.

### X_s(13) and the split Cartan classification

- **Model** (`baranQuartic`, `xs13Quartic`, `xs13Points`, `xs13_planeModel`; node
  `ED.6/xs13-plane-model`, item /85). X_s(13) ≅ X_0^+(169) (R13.4a); its canonical model is
  Baran's quartic B = (−Y − Z)X³ + (2Y² + YZ)X² + (−Y³ + Y²Z − 2YZ² + Z³)X + (2Y²Z² − 3YZ³),
  certified from the q-expansions of the three conjugate newforms and a Sturm bound in weight 8
  for Γ_0(169) (CN.3). Q(X − Y, X + Y, X + Z) = 16B for the model Q, monic in Y, of good reduction
  away from 2 and 13, smooth modulo 17 with 20 points; P0 = (1:1:1), P1 = (1:1:2), P2 = (0:0:1),
  P3 = (−3:3:2), P4 = (1:1:0), P5 = (0:2:1), P6 = (−1:1:0) have distinct reductions. Of the 20
  points of X(𝔽_17), 17 lie in U_1 = {Z ≠ 0, Q_y ≠ 0}; (1:±1:0) lie in U_2 = {X ≠ 0, Q_v ≠ 0};
  (1:1:1) lies in neither. D = {Z = 0} = {(1:±1:0), (1:±√5:0)}.
- **Endomorphisms** (`xs13_endAlgebra`; node `ED.6/xs13-endomorphism-algebra`, items /77, /3).
  S_2(Γ_0(169))^{w=+1} is one Galois orbit with field ℚ(α) = ℚ(ζ_7)^+, α³ + 2α² − α − 1 = 0; J ∼ A_f
  (ModularCurvesPartII R14.5), End(J) ⊗ ℚ ≅ ℚ(ζ_7)^+, J absolutely simple, ρ = 3. Chen's
  isogeny is context only.
- **Rank** (`xs13_analyticRank_eq_one`, `xs13_rank_eq_three`; nodes
  `ED.6/xs13-analytic-rank-certificate`, `ED.6/xs13-rank-three`, item /82). L(f^σ, 1) = 0 from
  the root number −1 and L'(f^σ, 1) > 0.6 for each of the three embeddings by CN.4 enclosures of
  width < 10^(−100); then rk J(ℚ) = 3 and Sha finite by GZ.8 (items /79, /97) and
  HE.7/admissible-rm-kolyvagin-logachev. The ℚ(ζ_7)^+-structure on J(ℚ) ⊗ ℚ makes one point with
  nonzero logarithm enough for log to be an isomorphism at a prime inert in ℚ(ζ_7)^+, such as 17. The descent route (three independent points by
  ED.3/reduction-rank-lower-bound and the Bruin–Poonen–Stoll descent bound under GRH) is labelled
  conditional.
- **Tate classes** (`xs13Z1`, `xs13Z2`, `xs13_tateClasses_admissible`; node
  `ED.6/xs13-tate-classes`, item /86). Z_q = (6A_q − tr(A_q)I)C⁻¹ for q = 7, 11, A_q the exact
  matrix of T_q on H¹_dR (Eichler–Shimura, ModularCurvesPartII R14.6/special-fibre-eichler-shimura; exactness certified by CN.3); the printed
  integer matrices satisfy (b)–(d) exactly and are independent; (a) holds because they are
  classes of the nice correspondences 6T_q − tr(T_q).
- **First chart data** (`xs13BetaFil`, `xs13GammaFil`, `xs13_hodgeData_conditions`; node
  `ED.6/xs13-first-chart-hodge-data`, item /86). On Y = {Z ≠ 0}, b = P2 = (0, 0), the six printed
  differentials (1, x, y, …)dx/Q_y; H⁰(X, 𝒪(2D)) = ⟨1, x, y, x², xy, y²⟩;
  η_{Z1} = −(44x² + (148/3)xy + 8y²)dx/Q_y, η_{Z2} = (−40x² + 148xy + 36y²)dx/Q_y,
  β_Fil,Z1 = (0,0,0,0,1/2,1/2), β_Fil,Z2 = (0,0,0,0,−1/2,−5/2), γ_Fil,Z1 = 5y/6 + 3x/2,
  γ_Fil,Z2 = −5y/6 − 15x/2, each certified by substitution into (30), (32).
- **Frobenius lift and heights** (`xs13FrobeniusLift`; node `ED.6/xs13-first-chart-frobenius`,
  item /87). Tuitman's lift with Φ(x) = x^17 on ]U_1[, P2 Teichmüller (∂Q/∂Y(0,0,1) = −16 is a
  17-adic unit), F and f from RD.7, θ_{Z1}, θ_{Z2} on the 17 discs. API: `xs13FrobeniusLift_y_congr`,
  `xs13_P2_teichmuller`, `xs13FrobeniusMatrix_cup` (FᵀCF = 17C), `xs13Theta`,
  `xs13FrobeniusMatrix_trace` (tr F = 17 + 1 − 20 = −2). Tests: ∂Q/∂Y vanishes at (1:1:1), so the
  disc of P0 is not in ]U_1[; Φ(y) = y^17 is not a lift (Q(2^(−17), 2^(−17)) ≠ 0 at P1).
- **The matrices T_i** (`detCriterionMatrix`, `xs13_det_T_eq_zero`; node
  `ED.6/xs13-equivariant-height-matrices`, item /88). With a_3 = −α² − 2α generating K and a
  K-equivariant splitting, E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^* has dimension 3; E_1(P5) ≠ 0 and the
  vectors E_1(P_k) ⊗ E_{2,Z1}(P_k), k = 1, 3, 5, form a basis (nonzero determinant at finite
  precision); T_i(x) has first row (θ_{Z_i}(x), Ψ_j(Z_i, x)) and rows (θ_{Z1}(P_k), Ψ_j(Z1, P_k));
  det T_i vanishes at rational points because the global pairing is common to Z1 and Z2.
- **Charts** (`xs13_points_firstChart`, `xs13_points_secondChart`, `xs13_points_P0Disc`; nodes
  `ED.6/xs13-first-chart-points`, `ED.6/xs13-second-chart-points`, `ED.6/xs13-p0-disc`, items
  /90–/92). On ]U_1[ the common zeros are P1, P2, P3, P5, all simple; on the discs of (1:±1:0),
  with Y' = {X ≠ 0}, b = P6 and Φ(u) = u^17, they are P4 and P6 (det T_2'(u), E7); on ](1:1:1)[
  base-point change to P0 and the Coleman integrals ∫_{P2}^{P0} ω (RD.7) leave only P0.
- **Theorem 1.1** (`xs13_rationalPoints`; node `ED.6/xs13-rational-points`, item /5).
  X_s(13)(ℚ) = {P0, …, P6}, an unconditional certified solution set: the cusp and six CM points
  of discriminants −3, −4, −12, −16, −27, −43 (the class-number-one orders in which 13 splits;
  CM.4/residual-cartan-normalizer and the R13.4a criterion, including the fibres over j = 0,
  1728).
- **Small primes** (`exists_nonCM_splitCartan_small`; node `ED.6/small-prime-split-cartan`,
  item /96). For ℓ ∈ {2, 3, 5, 7}, X_s(ℓ) ≅ X_0^+(ℓ²) has genus 0 (X_0(4), X_0(9), X_0(25) of
  genus 0; X_0(49) of genus 1 with h(−196) = 4 fixed points of w_49) and a rational cusp, so it
  is ℙ¹; rational points near the cusp give non-integral, hence non-CM (CM.3/integrality),
  j-values with split-Cartan image.
- **Theorem 1.2** (`splitCartan_primes_eq`; node `ED.6/split-cartan-classification`, items /6,
  /2). The primes with a non-CM E/ℚ of split-Cartan image are exactly {2, 3, 5, 7}: small primes
  above, ℓ = 13 from Theorem 1.1, and ℓ = 11, ℓ ≥ 17 from Bilu–Parent–Rebolledo, an input owned
  by no roadmap (recorded gap).
- **Corollary 1.3** (`xns13_rationalPoints_card`; node `ED.6/nonsplit-cartan-13`, items /7, /4).
  Baran's ℚ-isomorphism X_ns(13) ≅ X_s(13) (explicit models and a linear change of variables;
  its data are a recorded gap) gives #X_ns(13)(ℚ) = 7; the seven CM points of discriminants −7,
  −8, −11, −19, −28, −67, −163 (13 inert) exhaust it.
- **Class number one** (`classNumberOne`; node `ED.6/class-number-one`, item /8). If h(D) = 1 and
  |D| > 52, every prime below |D|/4 is inert, in particular 13, so j(𝒪_D) is a CM point of
  X_ns(13) and D ∈ {−67, −163}; |D| ≤ 52 is a finite CN.2 computation.

### BDMTV 2021 examples

- **X_S4(13)** (`xS4_13Quartic`, `xS4_13Points`, `xS4_13_rationalPoints`; node
  `ED.6/xs4-13-rational-points`). X_S4(13)(ℚ) = {(1:3:−2), (0:0:1), (0:1:0), (1:0:0)}, one CM point
  (D = −3) and three exceptional points, by the algorithm at p = 11 on two patches with cycles
  from T_11 and T_11²; the isogeny with J_s(13) and potential good reduction at 13 are a recorded
  gap.
- **X_0^+(N) of genus 3** (`x0plus97Quartic`, `x0plus97Points`,
  `x0plus_genusThree_rationalPoints`; node `ED.6/x0plus-genus-three-points`). For N ∈ {97, 109,
  113, 127, 139, 149, 151, 179, 239} the rational points are the cusp and CM points; for N = 97
  (p = 5) ten points. Rank by CN.4 and GZ.8/HE.7, trivial local heights at N from Xue's regular
  model (R13.5).

### Classical worked examples

- **Thue** (`tdwForm1`, `tdwForm2`, `tdw89_thue_solutions`; node `ED.6/thue-example-tdw89`).
  X⁴ − 4X³Y − 12X²Y² + 4Y⁴ = 1 has only ±(1, 0); X⁴ − 12X²Y² − 8XY³ + 4Y⁴ = 1 has only ±(1, 0),
  ±(1, −1), ±(1, 3), ±(3, −1). Certificate: K = ℚ(ϑ), ϑ⁴ − 12ϑ² − 8ϑ + 4 = 0, the order
  R = ℤ⟨1, ϑ, ϑ²/2, ϑ³/2⟩ with units 1 + ϑ, 3 + ϑ, ϑ²/2 (CN.2), eight inhomogeneous linear forms,
  initial bound 3.26·10⁴⁰ through `ED.2/certified-linear-form-constant`, reductions with
  c_0 = 10¹⁴⁰ to 72 and c_0 = 10¹² to 10 (`ED.1/inhomogeneous-reduction`), enumeration; packaged
  by `ED.2/thue-certified-solution-set`.
- **Elliptic curve** (`tdwCurve`, `tdw89_integralPoints`; node
  `ED.6/elliptic-integral-points-tdw89`). y² = x³ − 4x + 1 has exactly 22 integral points
  (x ∈ {−2, −1, 0, 2, 3, 4, 10, 12, 20, 114, 1274}); the triangular numbers that are products of
  three consecutive integers are T_3, T_15, T_20, T_44, T_608, T_22736. Certificate: ℤ[ψ],
  ψ³ − 4ψ + 1 = 0, of discriminant 229 and class number 1 with units ψ, 2 − ψ
  (CN.2/joint-class-unit-index-certificate), the factorisation x − ψ = ±ψ^i(2 − ψ)^j α², and the
  Thue example.
- **S-unit** (`deWegerS`, `deWeger_sUnit_solutions`; node `ED.6/s-unit-example-deweger`).
  x + y = z in {2,3,5,7,11,13}-smooth positive integers with gcd(x, y) = 1, x ≤ y: exactly 545
  solutions, the largest 91 + 1771470 = 1771561 = 11⁶. Certificate: initial bound 5.60·10²⁷,
  p-adic reductions to 606, 67, 56 (`ED.1/padic-reduction`), Fincke–Pohst enumeration
  (`ED.1/short-vector-enumeration-complete`); `ED.2/s-unit-certified-solution-set`.
- **Thue–Mahler** (`tdw92Form`, `tdw92_thueMahler_solutions`; node
  `ED.6/thue-mahler-example-tdw92`). x³ − 23x²y + 5xy² + 24y³ = ±2^a3^b5^c7^d, gcd(x, y) = 1: 72
  solutions up to sign, the largest (48632, −3729) with value 2¹⁸·5¹³; reduction 9.844·10⁴⁹ →
  4918 → 113 → 86, then a sieve; the final test of each tuple is exact evaluation;
  `ED.2/thue-mahler-certified-solution-set`.

### Dependencies

Inside the roadmap: ED.0 (p-adic and archimedean embedding and valuation certificates), ED.1
(reduction and enumeration), ED.2 (Thue, S-unit and Thue–Mahler certified solution sets), ED.3
(reduction rank lower bound, conditional route), ED.4 (abelian logarithm,
residue-disc zero bounds, Chabauty–Coleman completeness), ED.5 (sieve combination). Other
roadmaps: NC.5 and NC.2 (requests), CN.5 (schema request), CN.4, CN.3, CN.2, RD.7, GZ.8, HE.7,
ModularCurvesPartII R13.4a, R13.5, R14.5, ColemanIntegration L1, ComplexMultiplication CM.3 and
CM.4, ModularCurvesPartII R14.6. Recorded gaps: Bilu–Parent–Rebolledo; Baran's
X_ns(13) model and isomorphism; the X_S4(13) isogeny and reduction inputs.

### Acceptance

- Every algorithm states its termination conditions and its unresolved inputs: the BDMTV 2021
  algorithm returns FAIL for exactly four reasons, its rank and local-height inputs are
  hypotheses, and every example theorem lists its certificate data.
- A finite set of p-adic candidates is compared with global points by
  `eq_of_matched_or_excluded` before any completeness claim; X_s(13) is the model case (20
  residue discs, 7 matched balls, all others excluded by the second Tate class).
- The worked examples reproduce the published solution sets exactly: 8 + 2 Thue solutions,
  22 integral points, 545 S-unit solutions, 72 Thue–Mahler solutions, 7 points on X_s(13) and on
  X_ns(13), 4 on X_S4(13), 10 on X_0^+(97).

## Inputs requested from other roadmaps

Each item names the supplier layer and the exact statement this roadmap uses; the consuming declarations cite the supplier layer.

- **ComputationalNumberTheory:CN.4** (for ED.2/certified-linear-form-constant, ED.2/certified-padic-linear-form-constant, ED.2/logarithm-enclosure, ED.2/s-unit-initial-bounds): Certified elementary-function enclosures on rational inputs: a construction logEnclosure x P returning, for rational x > 0 and precision P ∈ ℕ, a closed rational interval containing Real.log x of width at most 2^{−P} (failure as data for x ≤ 0), and arctanEnclosure x P returning a closed rational interval containing Real.arctan x of width at most 2^{−P}, each with its soundness theorem (Real.log x ∈ logEnclosure x P, Real.arctan x ∈ arctanEnclosure x P) and the width bound; π is enclosed as 4·arctanEnclosure(1, P + 2), using Mathlib's Real.arctan_one.
- **HeightsRationalPointsAndObstructions:RP.1** (for ED.3/finite-index-subgroup-certificate, ED.3/genus-two-descent-rank-bound, ED.3/reduction-rank-lower-bound, ED.3/saturation-certificate, ED.3/torsion-by-reduction): For the Jacobian J of a smooth proper geometrically connected curve C over ℚ with C(ℚ) ≠ ∅ (J(ℚ) = Pic⁰ points as in JacobianChallenge Layer D): (a) J(ℚ) is a finitely generated abelian group; (b) for a prime q at which C has a smooth proper model, a reduction homomorphism J(ℚ) → J̃(𝔽_q) compatible with reduction of points and divisors, injective on torsion of order prime to q and on all torsion when q ≥ 3; (c) for an abelian variety A of dimension g over ℚ_p, A(ℚ_p) has an open subgroup of finite index isomorphic to ℤ_p^g, so #A(ℚ_p)/2A(ℚ_p) = |2|_p^{-g}·#A(ℚ_p)[2].
- **HeightsRationalPointsAndObstructions:RP.1** (for ED.3/lind-reichardt-torsor): For E : y² = x(x² + cx + d) over ℚ with the 2-isogeny φ : E → E′ (E′ : y² = x(x² − 2cx + c² − 4d)) and its dual φ′: the Kummer map E(ℚ)/φ′(E′(ℚ)) → H¹(ℚ, E′[φ′]) ≅ ℚ^×/ℚ^{×2} is (x, y) ↦ x (and (0,0) ↦ d); the φ′-Selmer group is the set of d₁ for which v² = d₁u⁴ + cu² + d/d₁ is everywhere locally soluble; and its quotient by the image of E(ℚ) is Ш(E′/ℚ)[φ′] (as defined in EllipticCurves Layer 7).
- **HeightsRationalPointsAndObstructions:RP.0** (for ED.3/explicit-height-difference-bound): Néron local heights on an elliptic curve E over a number field K: functions λ_v on E(K_v) ∖ {O} for each place v, with λ_v − ½log⁺|x|_v bounded, and ĥ(P) = [K:ℚ]^{-1} Σ_v n_v λ_v(P) for P ∈ E(K) ∖ {O}, where ĥ is Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight divided by [K:ℚ]; normalised as in Silverman, Math. Comp. 55 (1990) §3 (λ(2P) = 4λ(P) − log|ψ₂(P)|_v + ¼log|Δ|_v).
- **ComputationalNumberTheory:CN.4** (for ED.3/canonical-height-enclosure): Certified rational enclosures of log n for positive integers n (and log of positive rationals): for requested precision P, rational endpoints ℓ ≤ log n ≤ u with u − ℓ ≤ 2^{−P}, with directed error bounds and no floating-point trust.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1** (for ED.3/quartic-local-solubility-correct, ED.3/saturation-certificate): For an elliptic curve over a finite field 𝔽_q, the group Ẽ(𝔽_q) as a finite abelian group with its order, and Hasse's bound |#Ẽ(𝔽_q) − q − 1| ≤ 2√q, used for targets of reduction maps and for the existence of 𝔽_q-points on smooth genus-one quartic models via their Jacobian.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** (for ED.3/local-quotient-cardinality, ED.3/saturation-certificate): Over ℚ_p: the point-level reduction map E(ℚ_p) → Ẽ_ns(𝔽_p) on a minimal model as a group homomorphism on E₀(ℚ_p), the finite index of E₀(ℚ_p), and E₁(ℚ_p) ≅ Ê(pℤ_p) with the formal logarithm giving Ê(p^rℤ_p) ≅ ℤ_p for r ≥ 2.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii** (for ED.3/rank-upper-bound, ED.3/torsion-by-reduction): Mordell–Weil over ℚ (fg_point_of_numberField), the Lutz–Nagell integrality of torsion points on integral models, and injectivity of E(ℚ)_tors → Ẽ_ns(𝔽_p) at good odd primes p.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4** (for ED.3/lind-reichardt-torsor, ED.3/two-selmer-certificate-sound): The cohomological 2-Selmer group Sel₂(E/ℚ) and Ш(E/ℚ)[2] with the exact sequence 0 → E(ℚ)/2E(ℚ) → Sel₂ → Ш[2] → 0, and its comparison with the explicit étale-algebra group selmerGroup₂; for the 2-isogeny φ′ the same for Sel^{(φ′)} and Ш[φ′].
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme** (for ED.3/finite-index-subgroup-certificate, ED.3/genus-two-descent-rank-bound, ED.3/stoll-genus-four-subgroup): For a smooth proper geometrically connected curve C over ℚ with a rational point, J(K) = Pic⁰_{C}(K) for fields K ⊇ ℚ as an abelian group of degree-zero divisor classes, functorial in K, so that J(ℚ) → J(ℚ_p) and divisor-class arithmetic are available.
- **SchemeAndStackFoundations:SF.3** (for ED.4/abelian-integral, ED.4/coleman-bound, ED.4/good-reduction-chabauty-datum, ED.4/kernel-of-reduction-evaluation): For a smooth projective geometrically integral curve X of genus g over a field k with a rational point O and its Jacobian J (JacobianChallenge layers D–F): (i) the pullback ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) along P ↦ [P − O] is an isomorphism and does not depend on O; (ii) Riemann–Roch consequences: a nonzero regular differential has a divisor of degree 2g − 2, so Σ_{x ∈ X(k)} ord_x ω ≤ 2g − 2; and every degree-zero class D satisfies D + g·O ∼ E with E effective of degree g.
- **SchemeAndStackFoundations:SF.3** (for ED.4/bad-reduction-bound, ED.4/good-reduction-chabauty-datum, ED.4/kernel-of-reduction-evaluation): For a smooth projective curve 𝒳 over a discrete valuation ring R (in particular ℤ_p) with geometrically connected fibres: specialisation of effective divisors from the generic to the special fibre preserves degree and linear equivalence, and h⁰ of line bundles is upper semicontinuous; Hensel lifting of smooth points of the special fibre to R-points. For a regular proper model 𝒳 → Spec R (a local complete intersection morphism): the canonical sheaf ω_{𝒳/R}, its identification with Ω¹ on the smooth locus, and its compatibility with flat base change (Liu, Algebraic Geometry and Arithmetic Curves, Definition 6.4.7 and Theorem 6.4.9).
- **SchemeAndStackFoundations:SF.3** (for ED.4/symmetric-square-chabauty-datum): The symmetric square X⁽²⁾ of a smooth projective curve X over a field k as a smooth projective surface whose k-points are the Gal(k̄/k)-stable effective divisors of degree 2, with the morphism X⁽²⁾ → Pic² and its injectivity when X is not hyperelliptic.
- **HeightsRationalPointsAndObstructions:RP.1** (for ED.4/chabauty-finiteness, ED.4/padic-closure-dimension): The Mordell–Weil theorem for abelian varieties over number fields: for an abelian variety A over a number field K (in ED.4, the Jacobian of a smooth projective curve over ℚ), A(K) is a finitely generated abelian group.
- **DeligneWeightsAndPurity:DWP.1** (for ED.4/coleman-abelian-comparison): For an abelian variety A over 𝔽_q with q-Frobenius endomorphism π_A and characteristic polynomial P_{π_A} ∈ ℤ[X] (of degree 2 dim A): P_{π_A}(π_A) = 0 in End(A) (Cayley–Hamilton through the faithful action on V_ℓA), together with the Weil estimate already planned as DWP.1/weil-estimate-for-abelian-varieties.
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme** (for ED.5/jacobian-reduction-data, ED.5/relative-symmetric-sieve): Pic⁰ of a smooth proper geometrically connected curve over a field (ℚ, ℚ_p, 𝔽_p) as its Jacobian, with points the degree-zero divisor classes when the curve has a rational divisor of degree one; the Abel maps Sym^d X → Pic^d on symmetric powers.
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties** (for ED.5/jacobian-reduction-data, ED.5/padic-quotient-sieve-datum): The Jacobian over 𝔽_p and over ℚ_p as an abelian variety; J(𝔽_p) is a finite group.
- **tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property** (for ED.5/chabauty-sieve-combination, ED.5/jacobian-reduction-data): For a curve of genus at least one with a rational point x₀, the Abel–Jacobi morphism is a closed immersion (the Layer F acceptance criterion); in particular x ↦ [x − x₀] is injective on k-points, used over 𝔽_p.
- **tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models** (for ED.5/genus-two-bad-information, ED.5/jacobian-reduction-data): Regular proper models and smooth proper models of curves over ℤ_(p) or ℤ_p, with the reduction of rational points through sections, and the regularity notion of the hypothesis of Bruin–Stoll Corollary 5.15.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** (for ED.5/jacobian-reduction-data): The reduction map on points E(ℚ_p) → Ẽ(𝔽_p) for a minimal Weierstrass equation with good reduction, as a group homomorphism with kernel E₁(ℚ_p).
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves** (for ED.5/genus-two-bad-information, ED.5/integral-points-completeness, ED.5/jacobian-reduction-data, ED.5/kummer-curve-test): Hyperelliptic models y² = f(x) with f squarefree of degree 2g + 1 or 2g + 2, the genus formula, and the places at infinity (one for odd degree; two, or a conjugate pair, for even degree).
- **NeronModelsAndSemistableAbelianVarieties:R11.4** (for ED.5/jacobian-reduction-data): For a smooth proper curve 𝒞 over a discrete valuation ring R with geometrically connected fibres (in particular R = ℤ_(p)): Pic⁰ of 𝒞/R is an abelian scheme over R whose generic fibre is the Jacobian of 𝒞_K and whose special fibre is the Jacobian of 𝒞_k; and for a horizontal relative divisor 𝒟 of degree zero on 𝒞 the class of 𝒪(𝒟) in Pic⁰(R) restricts to [𝒟_K] and [𝒟_k]. This is the smooth case of R11.4's degree-zero Picard of a semistable curve, over a general DVR rather than a strictly henselian one.
- **HeightsRationalPointsAndObstructions:RP.0** (for ED.5/height-bounded-points, ED.5/integral-points-completeness): The Néron–Tate canonical height ĥ on A(K) for an abelian variety A over a number field K with a symmetric ample class (for Jacobians, the theta class): ĥ is a quadratic map over ℤ (ĥ(nx) = n²ĥ(x) and the parallelogram law), ĥ ≥ 0, ĥ(x) = 0 iff x is torsion, and ĥ − h is bounded for the naive height of a symmetric projective embedding.
- **AnabelianGeometryAndNonabelianChabauty:NC.5** (for ED.6/explicit-connection, ED.6/explicit-setup, ED.6/frobenius-structure-matrix, ED.6/hodge-filtration-explicit, ED.6/local-height-at-p, ED.6/qc-certificate-sound): From AnabelianGeometryAndNonabelianChabauty NC.5 (BDMTV 2019 items /11–/13, /20–/23, /32–/37, /46–/48, /62, /84): (a) quadratic Chabauty pairs and the determinant criterion (BDMTV §1.4 (5), Lemma 1.5), with the K-equivariant variant replacing E by H⁰(Ω¹)^* ⊗_{K⊗Q_p} H⁰(Ω¹)^* when the splitting of the Hodge filtration is K-equivariant (Remark 1.6, §1.7, Remark 3.9); (b) Lemma 3.7 and Corollary 3.8: for r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^* and a nice class Z, θ = h_p(A_Z(b, ·)) and Υ = {Σ_{v∈T_0} h_v(A_Z(b, x_v))} form a quadratic Chabauty pair with endomorphism induced by Z, constant [IA_Z(b)] and pairing the global height, using only κ(J(Q)) ⊗ Q_p (correction E8); Υ = {0} under potentially good reduction everywhere (Lemma 3.2); the zero set is independent of the splitting and of the idèle class character (Remarks 3.10, 3.12); (c) the filtered F-isocrystal A_Z (pushout of A_2^dR along Z, (25)), the comparison D_cris(A_Z(b, x)) ≅ x^*A_Z of filtered φ-modules (Lemma 5.4) and Nekovář's local height formula (17); (d) Theorem 2.3: r < g + ρ − 1 implies X(Q_p)_2 finite, with X(Q) ⊆ X(Q_p)_2 ⊆ X(Q_p)_{U_Z}; (e) the class of a nice correspondence satisfies (a)–(d) (forward direction of Lemma 4.7 only, E5), and 6T_q − tr(T_q) on a modular curve with absolutely simple Jacobian is nice; (f) BDMTV 2021 Theorem 3.2: local heights away from p via a regular semistable model.
- **AnabelianGeometryAndNonabelianChabauty:NC.2** (for ED.6/base-point-change, ED.6/explicit-connection, ED.6/explicit-setup, ED.6/frobenius-equivariant-splitting, ED.6/frobenius-structure-matrix, ED.6/hodge-filtration-explicit): From AnabelianGeometryAndNonabelianChabauty NC.2 (BDMTV 2019 items /40–/45, /54–/57, /93): Kim's universal pointed unipotent connection A_n^dR(Y) = ⊕_{i≤n} V_dR(Y)^{⊗i} ⊗ O_Y with ∇ as in (21) and its universal property for pointed objects with v in the fibre at b (Theorem 4.2 corrected as in E6); Corollary 4.4 (A_n^dR(X)|_Y is the maximal quotient extending holomorphically to X); path composition (Lemma 4.3); Hadian's characterisation of the Hodge filtration (Theorem 4.5); the Frobenius structure on A_n^rig(b), unique with 1 ↦ 1 (Lemma 5.2), and Chiarellotto–Le Stum (Theorem 5.3); Besser's identification of v ↦ I(x_0, x)·v·I(b, b_0) with the unique unipotent Frobenius-equivariant isomorphism between path spaces (41) (item /93); and for a smooth projective curve X/Q the description of H¹_dR(X/Q) by differentials of the second kind modulo exact ones on an affine open, with Fil¹ = H⁰(X, Ω¹) and H¹_dR(X)/Fil¹ ≅ H¹(X, O_X) realised by the principal parts of local primitives (Mittag-Leffler; Tau Ceti AlgebraicCurves Layer 4 repartitions are the natural input).
- **ComputationalNumberTheory:CN.5** (for ED.6/certified-solution-set): From ComputationalNumberTheory CN.5: the certificate schema for an explicit Diophantine example — pinned exact input data (polynomials, points, matrices over Q and number fields, lattice bases, exponent bounds), the arithmetic conventions, and a verification relation checked in Lean whose soundness theorem is the mathematical claim (a finite solution set with soundness and completeness under stated hypotheses, as in ED.6/certified-solution-set); CAS or database output enters only as data to verify.
- **ComputationalNumberTheory:CN.4** (for ED.6/x0plus-genus-three-points, ED.6/xs13-analytic-rank-certificate): From ComputationalNumberTheory CN.4: certified rational enclosures, of width < 10^(−100), of L(g, 1) and L'(g, 1) for a weight-two newform g of level N with coefficients in a totally real number field and for each real embedding of the coefficient field, using the functional equation with the Atkin–Lehner sign (the level-N and algebraic-coefficient refinements of CN.4/cusp-l-value-enclosure); instances: N = 169 with coefficient field Q(ζ_7)^+, and the newforms of the genus-three prime levels of x0plus-genus-three-points.
- **ComputationalNumberTheory:CN.3** (for ED.6/xs13-endomorphism-algebra, ED.6/xs13-plane-model, ED.6/xs13-tate-classes, ED.6/xs13-equivariant-height-matrices): From ComputationalNumberTheory CN.3: (a) the newforms of S_2(Γ_0(169))^{w_169 = +1}: one Galois orbit of dimension 3 with coefficient field Q(ζ_7)^+ and q-expansions to any requested precision, with certified Hecke data; (b) the Sturm bound for Γ_0(169) in weight 8 (a form vanishing at ∞ to order > 8·182/12 is zero), used to certify the quartic relation of Baran's model; (c) the exact rational matrices of the Hecke operators T_3, T_7, T_11 on H¹_dR(X_s(13)/Q) in the basis ω of BDMTV §6.4, certified either from q-expansions and cup-product duality or from Eichler–Shimura with Frobenius computed to a precision exceeding a proved height bound for the entries.
- **ComputationalNumberTheory:CN.2** (for ED.6/class-number-one, ED.6/thue-example-tdw89): From ComputationalNumberTheory CN.2: (a) the unit group of the order R = Z + Zϑ + Z(ϑ²/2) + Z(ϑ³/2) of Q(ϑ), ϑ⁴ − 12ϑ² − 8ϑ + 4 = 0, is {±1} × ⟨1 + ϑ, 3 + ϑ, ϑ²/2⟩ (certificate for an order: the unit group of the maximal order via CN.2/units-complete-of-regulator-bound and the index of R^× in it, or Billevič's criterion of Tzanakis–de Weger Appendix I); (b) the class numbers of the imaginary quadratic fields with |D| ≤ 52.
- **PadicDifferentialEquationsAndRigidCohomology:RD.7** (for ED.6/frobenius-structure-matrix, ED.6/qc-modular-algorithm, ED.6/xs13-first-chart-frobenius, ED.6/xs13-p0-disc, ED.6/xs13-second-chart-points, ED.6/xs13-tate-classes): From PadicDifferentialEquationsAndRigidCohomology RD.7 (BDMTV 2019 item /95): the certified Tuitman algorithm for a plane model monic in y satisfying Tuitman II Assumption 1 as corrected in June 2020 — an overconvergent Frobenius lift with Φ(x) = x^p, the matrix F of Frobenius on H¹_rig in a given basis of algebraic differentials, the overconvergent primitives f with Φ^*ω = Fω + df and the primitives g, h of (45), with proved precision.
- **GrossZagierAndArithmeticHeights:GZ.8** (for ED.6/x0plus-genus-three-points, ED.6/xs13-rank-three): From GrossZagierAndArithmeticHeights GZ.8 (BDMTV 2019 items /79, /97): for a weight-two newform f of level N with trivial character whose conjugates f^σ all have a simple zero at s = 1, rk A_f(Q) = dim A_f and Sha(A_f/Q) is finite, through an admissible imaginary quadratic field K with the required analytic rank of L(A_f/K, s), the non-torsion trace point (GZ.8/totally-real-trace-point-nontorsion with F = Q, B = M_2(Q)), HeegnerPointEulerSystems HE.7/admissible-rm-kolyvagin-logachev, and descent from K to Q; instances N = 169 and the genus-three prime levels.
- **ModularCurvesPartII:R13.4a** (for ED.6/class-number-one, ED.6/nonsplit-cartan-13, ED.6/small-prime-split-cartan, ED.6/split-cartan-classification, ED.6/xs13-plane-model, ED.6/xs13-rational-points): From ModularCurvesPartII R13.4a (BDMTV 2019 items /1, /71): (a) X_s(ℓ) ≅ X_0(ℓ²)/w_{ℓ²} over Q; (b) for H = C_s^+(ℓ) or C_ns^+(ℓ), a non-cuspidal x ∈ X_H(Q) with j(x) ∉ {0, 1728} corresponds to an elliptic curve E/Q with j(E) = j(x) and ρ_{E,ℓ}(G_Q) conjugate into H, and conversely; (c) X_s(ℓ) has a Q-rational cusp (the image of the cusps 0 and ∞ of X_0(ℓ²)); (d) for ℓ = 13 the fibres of X_s(13) above j = 0 and j = 1728 contain Q-rational points; (e) the genus of X_0(4), X_0(9), X_0(25) is 0, the genus of X_0(49) is 1, and w_49 has h(−196) = 4 fixed points on X_0(49).
- **ModularCurvesPartII:R13.5** (for ED.6/x0plus-genus-three-points, ED.6/xs13-equivariant-height-matrices, ED.6/xs13-rational-points): From ModularCurvesPartII R13.5 (BDMTV 2019 items /72–/76): X_s(13) has potentially good reduction at 13 (Corollary 6.7, with good reduction away from 13 taken from the first Baran model, E12); and for prime N, X_0^+(N) has a regular semistable model over Z_N with irreducible special fibre (BDMTV 2021 Lemma 5.2, Xue), so the local height at N is trivial.
- **ModularCurvesPartII:R14.5** (for ED.6/xs13-endomorphism-algebra): From ModularCurvesPartII R14.5: End(A_f) ⊗ Q ≅ K_f, and End(A_f ×_Q Q̄) ⊗ Q ≅ K_f when f has neither CM nor inner twists (Shimura Th. 7.14, Ribet Cor. 4.2), for the level-169 newform orbit of xs13-endomorphism-algebra; and Jac(X_0^+(N)) is isogenous to the product of the A_f for the newform orbits with w_N-eigenvalue +1.

## Inputs not yet supplied by any source read

These are recorded gaps: the declarations that need them state them as hypotheses or are marked as resting on them.

- **Rank of E11 = X₁(11)** (ED.3/rank-zero-curves). E11 : y² + y = x³ − x² has no rational 2-torsion; rank 0 needs a full 2-descent over the cubic field of x³ − 4x² + 16 (class group and units) or a 5-isogeny descent. No source read here prints that computation (Poonen cites Cremona's tables).
- **Genus-two rank-zero curves (models of X₁(13), X₁(16), X₁(18))** (ED.3/rank-zero-curves). The ArithmeticDynamics request lists y² = x⁶ + 2x⁵ + x⁴ + 2x³ + 6x² + 4x + 1, y² = x⁶ + 2x⁵ + 5x⁴ + 10x³ + 10x² + 4x + 1 and v² = u(u² + 1)(1 + 2u − u²) with their rational points. Poonen 1995 states these are modular curves whose points were computed earlier; no source read here gives the descent and torsion certificates, so J(ℚ) finite and the point lists are not certified.
- **Corrected 2-descent for the Jacobian of C₁(3₂)** (ED.3/poonen-genus-two-mordell-weil). The local computation at 743 in Poonen 1995 Proposition 1 uses the non-point (2, √33); the erratum says the 2-adic information completes the descent but does not print it. The local images at 2 and 743 for (x − T) on J(ℚ_2), J(ℚ_743) and the resulting H′ must be computed and certified.
- **Explicit points on Fermigier's homogeneous spaces** (ED.3/fermigier-rank-thirteen). Cremona reports rational points on 7 + 6 homogeneous spaces giving n₁ = 256, n₁′ = 128 but does not print them; the certified lower bound rank ≥ 13 needs them.
- **Certified finite presentations of Jacobians over finite fields and of sieve quotients** (ED.5/jacobian-reduction-data, ED.5/sieve-certificate, ED.5/genus-two-bad-information). Certified executable presentations: the Mumford representation of J(𝔽_p) for hyperelliptic models and the correctness of Cantor's composition and reduction (Bruin–Stoll cite Cantor 1987, not read); a certified isomorphism J(𝔽_p) ≅ ⊕ ℤ/n_iℤ; discrete logarithms (Pohlig–Hellman) for the local maps on generators and for the image of C(𝔽_p); enumeration of C(𝔽_p); Smith-normal-form presentations of Γ/L_j, of the kernels of Γ/L_{j+1} → Γ/L_j and of the image subgroups φ_i(L_j). Natural owner: ComputationalNumberTheory:CN.3 with CN.0 carriers. The ED.5 theorems take finite groups and maps as inputs and are proved without these; executing a certificate needs them. Non-hyperelliptic models (plane quartics, Box's models of X₀(N)) need the same for their own Jacobian arithmetic. Supersedes the existing gap 'ED.5 geometric reduction and certified input data' together with jacobian-reduction-data and the requests to NeronModels R11.4.
- **Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces** (ED.5/kummer-curve-test, ED.5/genus-two-bad-information, ED.5/genus-two-deep-information). Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).
- **Height comparison constants for genus-two Jacobians** (ED.5/height-bounded-points, ED.5/kummer-curve-test, ED.5/integral-points-completeness, ED.5/sieve-certificate-sound). For genus-two Jacobians: a certified bound γ ≥ h − ĥ between the naive Kummer height and the canonical height (Stoll 1999 and 2002, Bruin–Stoll references [25, 27], not read), the height-pairing matrix of the generators, and the comparison ĥ(ι(P)) ≤ d·h(P) + δ for the embedding (for ι(P) = [P − ∞] on an odd-degree model through the Kummer coordinates of [P − ∞]). The elliptic case is covered by Tau Ceti's canonical height and ED.3/explicit-height-difference-bound; the Néron–Tate height itself is requested from RP.0.
- **Data of the small genus-two curves experiment** (ED.5/small-genus-two-nonexistence). The list of the 1492 curves, their Mordell–Weil generators and ranks (with the BSD-conditional cases) and the local data, from Bruin–Stoll, 'Deciding existence of rational points on curves: an experiment', Experiment. Math. 17 (2008) 181–189, and the electronic appendix MWSieve-new.m; not read.
- **Bilu–Parent–Rebolledo theorem for X_s(ℓ), ℓ > 7, ℓ ≠ 13** (ED.6/split-cartan-classification). Bilu–Parent (Ann. Math. 2011) and Bilu–Parent–Rebolledo (Ann. Inst. Fourier 2013): for every prime ℓ > 7 with ℓ ≠ 13, X_s(ℓ)(Q) consists of cusps and CM points (Mazur's integrality method, available since J_0(ℓ) ≠ 0, combined with Runge's method). No roadmap owns this theorem; it is the input of BDMTV Theorem 1.2 for ℓ = 11 and ℓ ≥ 17 (BDMTV 2019 item /2).
- **Baran's model of X_ns(13) and the isomorphism with X_s(13)** (ED.6/nonsplit-cartan-13). Baran (2014) gives explicit smooth plane quartic models of X_ns(13) and X_s(13) and a projective linear isomorphism between them. The X_ns(13) model (from q-expansions of the corresponding forms) and the 3 × 3 matrix are not in the sources read; the certificate is the identity Q_ns ∘ M = c·Q_s together with the canonical-model certificate of X_ns(13) (BDMTV 2019 item /4).
- **X_S4(13): isogeny of the Jacobian with J_s(13) and potential good reduction at 13** (ED.6/xs4-13-rational-points). BDMTV 2021 §5.1 cites Banwait–Cremona for the model and for Jac(X_S4(13)) ∼ Jac(X_s(13)), and an MCLF computation for potential good reduction at 13. Neither is certified in a source read here; both are inputs of the rank, Picard number and local-height hypotheses of the quadratic Chabauty certificate.
- **Certified Coleman integrals between residue discs through ramified extensions** (ED.6/xs13-p0-disc). BDMTV 2019 §6.6 computes the single integrals ∫_b^{P0} ω on the residue disc of P0 = (1:1:1), where the Frobenius lift of the first chart is not defined, by overconvergence over highly ramified extensions (Balakrishnan–Tuitman 2017, Propositions 3.8 and 4.3). ED.6 owns the integration and precision certificate for this step (stage text: 'implement its integration/precision certificates'); its source, Balakrishnan–Tuitman, 'Explicit Coleman integration for hyperelliptic and general curves', was not read for this blueprint, so the precision bound of that computation is not decomposed. ColemanIntegration L1 supplies the Coleman integral itself; PadicDifferentialEquationsAndRigidCohomology RD.7 supplies only the Frobenius data.
