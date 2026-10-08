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

This roadmap plans that passage. Its endpoint, in every layer, is a **certificate together with
the theorem that makes the search exhaustive**: finite data, a check that a computer or a reader
can carry out, and a proved statement that a passing check implies the arithmetic conclusion
(the listed points are all the solutions, the listed points generate the Mordell–Weil group, the
curve has no rational point). The worked examples of ED.6 are targets for complete certificate instances: the
Tzanakis–de Weger Thue equations, de Weger's S-unit equations, elliptic rank and integral-point
computations, and the determination of the rational points of the split Cartan modular curve
X_s(13) by explicit quadratic Chabauty.

The plan contains 175 targets, 481 API entries, 324 test contracts, 40 planets and 27 recorded gaps. All seven stages are `planned`; none is `closed`, and every implementation status is `unchecked`. The definitions/constructions account for 454 API entries and 317 tests in the structural checker. The 69 exact omission records specify the mathematical contracts whose actual supplier carriers or finite producers remain unavailable. Supporting semantic summaries and algebraic helpers have distinct names. No Lean compilation or complete replay of the large numerical examples is asserted.

Independent review on 8 October2026 (`REV-EffectiveDiophantineMethods~3`) records **needs_changes**:158 nodes verified,8 corrected and9 unverifiable at original primary locators. All197 baseline declarations were read at the pins. The inaccessible originals are Fincke–Pohst1985, Matveev2000 and Silverman1990; inherited read metadata does not constitute this review’s verification. The rational Cremona height bound and the de Weger lattice route were independently checked. All36 inherited source findings were confirmed within the inspected version scope and seven more added. The validator reports0 errors and one stale-index warning; `lean-check` stops at the first missing Tau Ceti import, so the suggested file’s body has not been elaborated in this review.

The four corrections address an empty complete Thue covering before representative extrema, a direct two-isogeny rank dependency, the McCallum–Poonen good-reduction locator and unsupported claims of ED.6 replay. Exact arithmetic checked the quartic substitution, selected rational memberships, the20 smooth F17 points and all31 large S-unit triples. It did not replay the545-,72-,1492- or full modular-curve completeness computations. See [the independent review](../reviews/REV-EffectiveDiophantineMethods~3.md) for coverage and outstanding primary checks.

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
  polynomials with rational coefficients, finite lists) together with a decidable check. Every planned
  numerical certificate format requires a soundness theorem whose hypotheses are exactly the check and the
  stated arithmetic input; nothing in a certificate is trusted without its check.
- **Precision.** A real or complex approximation carries a rational error bound, and a p-adic
  approximation carries an absolute precision `n` (the value is known modulo `pⁿ`). Every
  approximate output is checked against its bound. Numerical agreement never proves an algebraic
  identity: equality of algebraic numbers is decided by exact arithmetic (CN.0), and only
  nonvanishing is certified by an enclosure excluding zero.
- **Heights.** General heights are supplied by RP.0. Elliptic heights use the pinned Tau Ceti declarations; the upstream EllipticCurves reader uses the doubled convention, recorded in upstreamNotes. On an elliptic curve
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

The packet records the exact retrieved versions, read dates and scoped reading evidence. A source listed here is not a claim that every result in it has been verified.

- **[Algorithms for Diophantine equations](https://ir.cwi.nl/pub/13190)** — B. M. M. de Weger. CWI Tract 65, Centrum voor Wiskunde en Informatica, Amsterdam, 1989 (scan with OCR layer)
- **[On the practical solution of the Thue equation](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf)** — N. Tzanakis, B. M. M. de Weger. J. Number Theory 31 (1989) 99–132
- **[How to explicitly solve a Thue–Mahler equation](http://www.numdam.org/item/CM_1992__84_3_223_0/)** — N. Tzanakis, B. M. M. de Weger. Compositio Math. 84 (1992) 223–288
- **[Improved methods for calculating vectors of short length in a lattice, including a complexity analysis](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/)** — U. Fincke, M. Pohst. Math. Comp. 44 (1985) 463–471
- **[Computing algebraic numbers of bounded height](https://arxiv.org/abs/1111.4963)** — J. R. Doyle, D. Krumm. Math. Comp. 84 (2015) 2867–2891; read as arXiv:1111.4963v4
- **[An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers. II](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng)** — E. M. Matveev. Izvestiya: Mathematics 64:6 (2000) 1217–1269 (English translation, version of record from mathnet.ru; the downloaded file contains §§1–2 and the start of the proof)
- **[Linear forms in p-adic logarithms III](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf)** — Kunrui Yu. Compositio Math. 91 (1994) 241–276 (version of record, Numdam; formulas read on page images)
- **[The difference between the Weil height and the canonical height on elliptic curves](https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/)** — Joseph H. Silverman. Math. Comp. 55 (1990), no. 192, 723–743; version of record (AMS PDF)
- **[Counterexamples to the Hasse principle](https://arxiv.org/abs/1108.6310)** — W. Aitken, F. Lemmermeyer. arXiv:1108.6310v1 (31 August 2011; the only arXiv version); published Amer. Math. Monthly 118 (2011) 610–628 (not read)
- **[Explicit Chabauty over number fields](https://arxiv.org/abs/1010.2603)** — Samir Siksek. arXiv:1010.2603v2; published Algebra & Number Theory 7 (2013), 765–793
- **[Remarks and errata](https://math.mit.edu/~poonen/papers/errata.pdf)** — Bjorn Poonen. author's page, list dated 14 August 2025
- **[The method of Chabauty and Coleman](https://math.mit.edu/~poonen/papers/chabauty.pdf)** — William McCallum and Bjorn Poonen. Author copy dated June 14, 2010 (pp. 1–17); published in Explicit methods in number theory, Panoramas et Synthèses 36 (2012), 99–117. Page numbers cited are those of the author copy.
- **[Quadratic points on modular curves with infinite Mordell–Weil group](https://arxiv.org/abs/1906.05206)** — Josha Box. arXiv:1906.05206; published Math. Comp. 90 (2021), 321–343 (not read)
- **[On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/abs/2301.10509)** — Ana Caraiani and James Newton. arXiv:2301.10509; arXiv v3 (27 March 2025) read, SHA-256 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3; v1 and v2 compared at §7.4
- **[The complete classification of rational preperiodic points of quadratic polynomials over Q: a refined conjecture](https://arxiv.org/abs/math/9512217v1)** — Bjorn Poonen. arXiv:math/9512217v1 (1995 preprint, 19 pp.); published Math. Z. 228 (1998), 11–29, not read. Poonen's 'Remarks and errata' (https://math.mit.edu/~poonen/papers/errata.pdf, dated August 14, 2025, SHA-256 d369e65f3af0c8304297de8b4a5c0fc3e72ff350c4b44b25a0ef83ee9c3a0377) read for this paper's entry.
- **[Uniform bounds for the number of rational points on hyperelliptic curves of small Mordell–Weil rank](https://arxiv.org/abs/1307.1773v4)** — Michael Stoll. arXiv:1307.1773v4; published J. Eur. Math. Soc. 21 (2019), 923–956 (not read)
- **[Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/abs/1504.00694v2)** — Eric Katz, Joseph Rabinoff and David Zureick-Brown. arXiv:1504.00694v2; published Duke Math. J. 165 (2016), 3189–3240 (not read)
- **[Explicit Coleman integration for hyperelliptic curves](https://arxiv.org/abs/1004.4936v2)** — Jennifer S. Balakrishnan, Robert W. Bradshaw and Kiran S. Kedlaya. arXiv:1004.4936v2; ANTS IX, Lecture Notes in Computer Science 6197 (2010) (not read)
- **[The Mordell–Weil sieve: proving non-existence of rational points on curves](https://doi.org/10.1112/S1461157009000187)** — Nils Bruin and Michael Stoll. LMS Journal of Computation and Mathematics 13 (2010), 272–306; version of record, doi:10.1112/S1461157009000187
- **[Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf)** — Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. Annals of Mathematics 189 (2019), 885–944, doi:10.4007/annals.2019.189.3.6 (published version)
- **[Quadratic Chabauty for modular curves: algorithms and examples](https://arxiv.org/abs/2101.01862v4)** — Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. arXiv:2101.01862v4 (7 March 2023); published in Compositio Mathematica 159 (2023)
- **[Corrections to “How to explicitly solve a Thue–Mahler equation”](https://numdam.org/item/CM_1993__89_2_241_0.pdf)** — N. Tzanakis and B. M. M. de Weger. Compositio Mathematica 89 (1993), 241–242; published corrigendum
- **[Chabauty for symmetric powers of curves](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf)** — Samir Siksek. Version of record, Algebra & Number Theory 3(2009),209–236; Theorem3.2 is the published numbering (Box cites preprint Theorem1).
- **[Quadratic Chabauty for modular curves: algorithms and examples](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf)** — Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. Compositio Mathematica159(2023),1111–1152,version of record
- **[Algorithms for modular elliptic curves, Chapter III: Elliptic curve algorithms](https://johncremona.github.io/book/fulltext/index.html)** — J. E. Cremona. 2nd edition, Cambridge University Press 1997; author's online full text of Chapter III
- **[Cycles of quadratic polynomials and rational points on a genus-2 curve](https://arxiv.org/abs/math/9508211)** — E. V. Flynn, Bjorn Poonen, Edward F. Schaefer. arXiv:math/9508211v1 (4 August 1995); published Duke Math. J. 90 (1997) 435–463 (not read)
- **[Rational 6-cycles under iteration of quadratic polynomials](https://arxiv.org/abs/0803.2836)** — Michael Stoll. arXiv:0803.2836v2 (21 April 2009); published LMS J. Comput. Math. 11 (2008) 367–380 (not read)
- **[Saturation of Mordell–Weil groups of elliptic curves over number fields](https://repository.nottingham.ac.uk/handle/123456789/50666)** — Martin Prickett. PhD thesis, University of Nottingham, 2004. The rendered-page reading is inherited history; the primary PDF remained unavailable in this revision. All five required saturation proof routes now cite the independently read Siksek1995 author preprint. Further Tate–Lichtenbaum refinements require primary recovery and verification.
- **[Infinite descent on elliptic curves](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf)** — Samir Siksek. Author preprint dated5 February1995; source PDF pagination1–25 (not published journal pagination)
- **[Cremona elliptic-curve data: 571a1](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999)** — John Cremona. Author-maintained ecdata allcurves table; downloaded2026-10-07; content pinned by SHA256

## Layer overview

| Layer | Title | Targets | Key definitions and theorems |
|---|---|---|---|
| ED.0 | Certified algebraic numbers and local precision | 9 | Embedding pinned by an isolating box; Hensel embedding certificate; Certified nonvanishing; Algebraic numbers of bounded height |
| ED.1 | Lattice reduction and integer relations | 11 | Approximation lattice; Distance lemma for reduced bases; p-adic approximation lattice; p-adic reduction step; Fincke–Pohst enumeration; Lattice exclusion certificate |
| ED.2 | Linear forms in logarithms and S-unit equations | 32 | Certified Matveev constant; p-adic discrete-logarithm lattice; Tzanakis–de Weger method for Thue equations; Prime ideal removing lemma; Thue–Mahler solution certificate; S-unit equation certificate |
| ED.3 | Descent, rank bounds and saturation | 29 | Certified 2-Selmer group; 2-descent rank bound; Descent via 2-isogeny; Cremona's height difference bound; Saturation by reduction; Mordell–Weil basis certificate |
| ED.4 | Classical Chabauty–Coleman | 26 | p-adic abelian logarithm; Annihilating differentials; Chabauty's theorem; Coleman's bound; Chabauty–Coleman certificate; Relative symmetric Chabauty |
| ED.5 | Mordell–Weil sieve and combination certificates | 29 | Mordell–Weil sieve classes; Sieve soundness; Jacobian reduction square; Chabauty–sieve combination; Relative symmetric Mordell–Weil sieve; Mordell–Weil sieve certificate |
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

- **Certified enclosures and the precision contract** (`ED.0/certified-enclosure`, `RealEnclosure`). A `RealEnclosure t` is a closed nonempty rational interval `[l, u]` (`NonemptyInterval ℚ`) with `l ≤ t ≤ u`; its rational error bound is `u − l`. A `ComplexEnclosure z` is a pair of rational intervals containing `Re z` and `Im z`. A `PadicEnclosure x` for `x ∈ ℚ_p` is a rational centre `c` and an integer `N` with `‖x − c‖ ≤ p^(−N)`; its canonical record is the CN.0 `PadicApproximation` `(N, v, s)` with `(v, s) = (N, 0)` for `c = 0`; otherwise `v = min(v_p(c), N)` and `s` the residue of `c·p^(−v)` modulo `p^(N−v)` (`s = 0` when `v = N`). API: `RealEnclosure.width`, `abs_sub_le` (every rational in the interval is within the width of `t`), `ofRat`, `widen`; `ComplexEnclosure.mem_box`, `normSq_le` (a rational upper bound for `|z|²`), `toRealEnclosure` (when the imaginary interval is `[0, 0]`); `PadicEnclosure.ofRat`, `toPadicApproximation`. Unit tests: `[141/100, 142/100]` encloses `√2` with width `1/100` (precision 6, not 7); `ofRat q` has width `0`; `([0,0],[1,1])` encloses `i`; the zero-centred ball `(0, 2)` at `p = 3` encloses `9 ≠ 0`; `[1, 2]` encloses both `1` and `2`, so a common enclosure proves no equality; at `p = 3` the enclosure `(5, 1)` has canonical record `(1, 0, 2)`, and `(0, 2)` has record `(2, 2, 0)` despite totalized `padicValRat 3 0 = 0`.
- **Refinement of isolating intervals** (`ED.0/isolating-interval-refinement`, `RealRootIsolation`). A real isolating interval for `g ∈ ℚ[X]` requires `g ≠ 0` and is a rational interval containing exactly one real root of `g`; the zero polynomial is rejected even on a singleton. `refine I n` bisects exactly: pass to the squarefree part `g / gcd(g, g′)`, return a degenerate interval if an endpoint or midpoint is a root, and otherwise keep the half on which the sign changes; after `n` steps the width has been divided by `2^n` and the root is unchanged. A CN.0 certificate whose root is real gives a real isolation (`ofRealCertificate`). For the root `z` of an archimedean certificate, `Re z = (z + z̄)/2` and `Im z = (z − z̄)/(2i)` have CN.0 certificates built from those of `z`, of `z̄` (the conjugate box) and of `i` by CN.0's addition, multiplication and inversion certificates, so refining them refines the box of `z`. API: `root`, `refine`, `refine_root`, `refine_width`, `toEnclosure`, `ofRealCertificate`. Unit tests: for `X² − 2` on `[1, 2]`, `refine 3 = [11/8, 3/2]`; a degenerate isolation `[q, q]` of `X − q` stays degenerate; for `X − 1/2` on `[0, 1]` the first midpoint is the root; `[−2, 2]` is not an isolation for `X² − 2`.
- **Archimedean embeddings pinned by isolating boxes** (`ED.0/archimedean-embedding-certificate`, `ArchimedeanEmbeddingCertificate`). A certificate is a CN.0 `AlgebraicRootCertificate (f, R, I)` for the minimal polynomial `f` of `θ`: exactly one complex root `z` of `f` lies in `R × I`. Its embedding `σ_c = PowerBasis.lift pb z : K →+* ℂ` is the unique embedding with `σ_c(θ) = z` and the only one sending `θ` into the box. Every embedding has a certificate, and `[K : ℚ]` certificates with pairwise disjoint boxes contain every embedding. For a box of centre `w = w₁ + i w₂` and half-widths at most `r`, with `M = |w₁| + |w₂| + 2r`, the evaluation bound is `|σ_c(α) − Σ_j a_j w^j| ≤ 2r Σ_j j |a_j| M^(j−1)`, so the box with centre `Σ_j a_j w^j ∈ ℚ(i)` and that rational half-width encloses `σ_c(α)`; refining until the half-width is at most `2^(−n−1)` gives precision `n`. If the imaginary interval is symmetric about `0` the embedding is real. The infinite place is `InfinitePlace.mk σ_c`; two certificates give the same place exactly when their roots are equal or conjugate. API: `root`, `embedding`, `embedding_gen`, `eq_embedding_of_mem`, `exists_of_embedding`, `isReal_of_symmetric`, `infinitePlace_apply`, `norm_sub_eval_le`, `refine`, `complete_of_disjoint`, `evalEnclosure`, `evalEnclosure_width`. Unit tests: for `X² − 2` and `[1, 2] × [0, 0]`, `σ_c(θ) = √2` and the embedding is real; for `X − 1` the certificate fixes `ℚ`; `[−2, 2] × [0, 0]` is not a certificate for `X² − 2`; for `X² + 1` the boxes around `i` and `−i` give conjugate embeddings and one infinite place.
- **p-adic embeddings pinned by Hensel certificates** (`ED.0/padic-embedding-certificate`, `PadicEmbeddingCertificate`). For prime `p`, a certificate is an integer `a` with `f′(a) ≠ 0` and either `f(a)=0` or `v_p(f(a)) > 2 v_p(f′(a))`, an exact integer check. The zero branch is separate because pinned totalized `padicValRat p 0=0`. `hensels_lemma` gives the unique root `z ∈ ℤ_p` with `‖z − a‖ < ‖f′(a)‖`, and `σ_a = PowerBasis.lift pb z : K →+* ℚ_p` is the only embedding sending `θ` into that disc. Newton iteration gives integers `b` with `v_p(f(b)) ≥ N + v_p(f′(a))`, and then `z ≡ b (mod p^N)` by the exact-distance theorem below; for `α` with `e = max(0, −min_j v_p(a_j))`, `(Σ_j a_j b^j, N − e)` is a `PadicEnclosure` of `σ_a(α)`. Two certificates `a, a′` give different embeddings when `‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖)`. Embeddings `K → ℚ_p` correspond to the roots of `f` in `ℚ_p` (`PowerBasis.liftEquiv'`). API: `root`, `embedding`, `embedding_gen`, `eq_embedding_of_near`, `root_sub_mem`, `evalEnclosure`, `ne_of_far`, `embedding_algebraMap`. Unit tests: for `X² − 2` at `p = 7`, `a = 3` is a certificate and `σ_a(θ) ≡ 10 (mod 49)`; `a = 3` and `a = 4` give the two embeddings `ℚ(√2) → ℚ_7`; for `X − 1`, `a = 1` has root `1`; `X² − 2` has no certificate at `p = 5`; `σ_a` restricts to the canonical map on `ℚ`.
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
- **Fincke–Pohst enumeration** (`ED.1/short-vector-enumeration`, `fpEnumeration`). For a symmetric rational matrix `G` (the Gram matrix of a lattice basis), a rational centre `t` and a rational bound `R`, quadratic completion gives rationals `q_ij` with `xᵀGx = Σ_i q_ii(x_i + Σ_{j>i} q_ijx_j)²`; all pivots `q_ii` are positive exactly when `G` is positive definite. `fpEnumeration G t R` adapts the Cholesky/backtracking algorithm read in de Weger §3.6, pp.51–53, Figure 2 to exact rational LDL and centre `t`: at level `k`, given the coordinates above `k`, `x_k` runs over the finitely many integers with `q_kk(x_k − t_k + U_k)² ≤ T_k`, decided by exact rational comparison, and `T_{k−1} = T_k − q_kk(x_k − t_k + U_k)²`. Fincke–Pohst(2.8), p.465, outputs both signs and excludes zero. De Weger’s Figure2 omits the −x output before zero termination (E25); its literal pseudocode is repaired accordingly. The ED.1 adaptation scans the full integer intervals and retains the boundary and zero translate; when `t = 0`, the output contains `−x` whenever it contains `x`, and it contains `0` when additionally `R ≥ 0`. API: `quadraticCompletion`, `quadraticCompletion_spec`, `quadraticCompletion_pivot_pos_iff`, `fpEnumeration_neg`, `fpEnumeration_of_neg`, `fpEnumeration_mono`. Unit tests: `G = I_2`, `R = 1` gives the five vectors `0, ±e_1, ±e_2`; `G = [[2, 1], [1, 2]]`, `R = 2` gives the seven vectors `0, ±(1, 0), ±(0, 1), ±(1, −1)`, while `(1, 1)` (value `6`) is excluded although it lies in the coordinate box; `n = 1`, `t = 1/2`, `R = 1/4` gives `{0, 1}`; `R < 0` gives `∅`.
- **Lattice exclusion certificates** (`ED.1/exclusion-certificate`, `RealExclusionCertificate`, `PadicExclusionCertificate`). A real certificate consists of the data of the real lattice (with the enclosures certifying the rounding contract), rational box bounds `X_i ≥ 0`, a margin `μ > 0`, a distance witness for `(A, y)` (with `y = 0` in the homogeneous case), and the rational inequality `L² ≥ Σ_{i<n} W_i²X_i² + (ε + Σ X_i + μ)²`, `ε = 1` (inhomogeneous) or `0` (homogeneous). A p-adic certificate consists of the p-adic lattice data, box bounds `X_j`, a distance witness for `(A_m, y_m)` and `L² > Σ W_j²X_j²`. A distance witness is either an **LLL witness** — a GN.5 unimodular certificate `(U, U^(−1))` with `AU` LLL-reduced at `δ = 3/4`, the exact rational coordinates `s = (AU)^(−1)y`, the last non-integral index `i_0`, and `L² = 2^(−(n−1))‖s_{i_0}‖²‖c_0‖²` (or `2^(−(n−1))‖c_0‖²` when `y = 0`) — or an **enumeration witness** — a rational `R ≥ 0` with `L²` the minimum of `R` and of `‖Ax − y‖²` over the Fincke–Pohst output (nonzero `x` when `y = 0`). The proof-bearing `DistanceWitness` and exclusion records state semantic conditions. The separate raw schemas below contain finite exact data and computable checks. API: `DistanceWitness`, `DistanceWitness.bound`, `DistanceWitness.sound`, `DistanceWitness.ofLLL` (requires `A.det ≠ 0`), `RealExclusionCertificate`, `PadicExclusionCertificate`, `RealExclusionCertificate.check` (the final numerical inequality only; the semantic record already carries its distance proof). Unit tests: the computed homogeneous certificate for `(log 2, log 3)`, `C = 10^8`, `X = (1000, 1000)`, `μ = 1000`, with `c_0 = (−1054, 4513)`; a zero box is excluded trivially; if a nonzero target `y ∈ Γ`, no positive distance lower bound exists; the homogeneous zero target excludes the zero vector; the one-dimensional p-adic certificate `p = 3`, `m = 2`, `β_0 = 5`, `X_1 = 3`, `R = 15`.

### Theorems

- **Distance lemma for reduced bases** (`ED.1/reduced-basis-distance-lower-bound`, `sq_norm_sub_ge_of_reduced`). Let `c_0, …, c_{n−1}` be linearly independent with `‖c*_i‖² ≥ 2^(−(n−1))‖c_0‖²` for all `i` (Mathlib's `gramSchmidt`; true for LLL-reduced families by GN.5's growth lemma, de Weger (3.12)). (a) Nonzero lattice vectors have `‖v‖² ≥ 2^(−(n−1))‖c_0‖²` (de Weger Lemma 3.4). (b) For `y = Σ s_ic_i` with `i_0` the last index with `s_{i_0} ∉ ℤ`, every lattice vector has `‖v − y‖² ≥ 2^(−(n−1))‖s_{i_0}‖²‖c_0‖²` (Lemma 3.5). (c) For any index `i_0` (not necessarily the last non-integral one) with `‖s_i‖ ≤ δ_1` for `i > i_0` and `‖s_{i_0}‖ ≥ δ_2 > 0`, `‖v − y‖ ≥ 2^(−(n−1)/2)δ_2‖c_0‖ − (n − 1 − i_0)δ_1 max_{i>i_0}‖c_i‖` (Lemma 3.6). Acceptance: for `ℤ²` and `y = (1/2, 0)` the bound is `1/8` against the true `1/4`; Tzanakis–de Weger's `|b_1| > 1.092·10^4`, `‖s_3‖ > 0.143` give a distance above `780`.
- **Homogeneous reduction** (`ED.1/homogeneous-reduction`, `mul_abs_linearForm_ge_of_norm_ge`). If every nonzero vector of `Γ` has norm at least `L` and `L² ≥ Σ_{i<n} W_i²X_i² + (Σ X_i + μ)²`, then every nonzero `x` with `|x_i| ≤ X_i` satisfies `C|Λ(x)| ≥ μ`; hence `|Λ(x)| < c·exp(−δ max|x_i|)` forces `max|x_i| < (1/δ)log(cC/μ)`. de Weger's Lemma 3.7 (`ℓ(Γ) ≥ √((n+1)² + (n−1)γ²)X_1`) and Tzanakis–de Weger's Proposition 3.1 are special cases. Acceptance: for `θ = (log 2, log 3)`, `C = 10^8`, the reduced vector `c_0 = (−1054, 4513)` (`‖c_0‖² = 21478085`) gives `|x_1 log 2 + x_2 log 3| ≥ 10^(−5)` for all nonzero `|x_i| ≤ 1000`.
- **Inhomogeneous reduction** (`ED.1/inhomogeneous-reduction`, `mul_abs_inhomogeneousForm_ge_of_dist_ge`). If every lattice vector is at distance at least `L` from `y` and `L² ≥ Σ_{i<n} W_i²X_i² + (1 + Σ X_i + μ)²`, then every `x` with `|x_i| ≤ X_i` satisfies `C|β + Λ(x)| ≥ μ`, with the same exponential consequence. de Weger's Lemma 3.10 (`X_1 ≥ 1`) and Tzanakis–de Weger's Proposition 3.2 (whose constant `√(4q² + 3q − 3/4)K_3` is sufficient exactly when `K_3 ≥ 2`, the condition its proof uses) are special cases. Acceptance: Tzanakis–de Weger 1989 §III.2 — with `c_0 = 10^140`, `K_3 = 3.26·10^40`, `‖s_3‖ > 0.029`, `|b_1| > 3.247·10^46` the bound drops to `A ≤ 72`, and with `c_0 = 10^12`, `K_3 = 72`, `‖s_3‖ > 0.143`, `|b_1| > 1.092·10^4` to `A ≤ 10`.
- **p-adic reduction** (`ED.1/padic-reduction`, `not_dvd_padicLinearForm_of_dist_ge`). If every vector of `Γ_m` is at distance at least `L` from `y_m` (nonzero vectors of norm at least `L` when `y_m = 0`, e.g. when `β_0 = 0`) and `L² > Σ W_j²X_j²`, then every `b` with `|b_j| ≤ X_j` (nonzero when `y_m = 0`) has `ord_p Λ′(b) ≤ m − 1`; combined with `ord_p Λ(b) = κ + ord_p Λ′(b)` and `ord_p Λ(b) ≥ c_1 + c_2b_k` this bounds `b_k`. This is Tzanakis–de Weger 1992 Proposition 15 and de Weger Lemmas 3.14, 3.16. Acceptance: Tzanakis–de Weger 1992 §15E at `p = 2`, `m = 1152`, with six unknowns bounded by `K_0 = 9.844·10^49`, gives `l(Γ_m, y) > 3.98541·10^56 > √6·K_0`, hence `n_1 ≤ 1153`. This initial bound is justified by the 1993 corrigendum’s Baker–Wüstholz route. The corrected Appendix A3 route starts at `1.511·10^50`; the same first p-adic lattices still give `N_1 = 1153`, and the adjusted real step gives `H ≤ 4919` before rejoining the earlier reduction route (E29).
- **Completeness of the Fincke–Pohst enumeration** (`ED.1/short-vector-enumeration-complete`, `mem_fpEnumeration_iff`). For symmetric `G` with positive pivots, `x ∈ fpEnumeration G t R ⇔ (x − t)ᵀG(x − t) ≤ R`; for a nonsingular integer basis `A` with `G = AᵀA` and `t = A^(−1)y`, the lattice points `v` with `‖v − y‖² ≤ R` are exactly the `Ax` for `x` in the output. Corollaries: an empty output certifies `‖v − y‖² > R` for all `v ∈ Γ`, and the output `{0}` with `t = 0` certifies `‖v‖² > R` for all nonzero `v`. Acceptance: the hexagonal example above; `Γ = ℤ(1, 0) + ℤ(0, 10)`, `y = (0, −1)`, `R = 1/2` gives the empty output.
- **Residual enumeration** (`ED.1/short-vector-reduction`, `mem_fpEnumeration_or_lt_mul_abs`). With `K_0 ≥ ε + Σ X_i` and `R = Σ_{i<n} W_i²X_i² + K_0²`, every `x` in the box either lies in the Fincke–Pohst output for `(AᵀA, A^(−1)y, R)` or satisfies `C|β + Λ(x)| > K_0 − ε − Σ|x_i|` (de Weger Lemma 3.8 and the procedure after it). Acceptance: for `θ = (1, √2)`, `C = 100`, `φ = (100, 141)`, `X_i = 3`, `K_0 = 6`, the output for `R = 45` is `{0}` because the shortest nonzero vector `(−7, 5)` has squared length `74`.
- **Soundness of exclusion certificates** (`ED.1/exclusion-certificate-sound`, `RealExclusionCertificate.sound`). A checked real certificate gives `C|β + Λ(x)| ≥ μ` for every `x` in its box (nonzero whenever the target `y` is `0`, in particular when homogeneous), and a checked p-adic certificate gives `ord_p Λ′(b) ≤ m − 1` for every `b` in its box (nonzero whenever `y_m = 0`). The proof combines the soundness of the witness (the distance lemma with GN.5's growth lemma and unimodular certificate, or the Fincke–Pohst completeness theorem) with the homogeneous, inhomogeneous or p-adic reduction theorem. This is the stage's acceptance theorem. Acceptance: the two Tzanakis–de Weger 1989 certificates exclude `73 ≤ A < 3.26·10^40` and `11 ≤ A ≤ 72`; the Tzanakis–de Weger 1992 certificate at `p = 2` excludes `ord_2 Λ′ ≥ 1152`; the computed `(log 2, log 3)` certificate excludes `|x_1 log 2 + x_2 log 3| < 10^(−5)` for `0 < max|x_i| ≤ 1000`.

### Dependencies

Inside the roadmap: ED.1 uses `ED.0/certified-enclosure` (rounding of `φ_i`, `ψ`, `β_j^(m)`); ED.2 consumes every node of this layer for the reduction steps and residual enumerations of the Thue, S-unit and Thue–Mahler algorithms. Other roadmaps: `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `/lll-gram-schmidt-growth`, `/lll-short-vector-factor`, `/unimodular-basis-certificate`, `/lll-integer-potential`, `/lll-exact-reduction`, `/lll-original-lattice-verification`. Mathlib: `InnerProductSpace.gramSchmidt`, `gramSchmidt_orthogonal`, `Submodule.span`, `Matrix.det`, `Matrix.mulVec`, `PadicInt.appr`, `PadicInt.appr_spec`, `round`, `Int.fract`.

### Acceptance

A lattice basis, a certified reduction and a proved lower bound excluding all remaining integer vectors of a specified region: Tzanakis–de Weger 1989 §III.2 (`A ≤ 72`, then `A ≤ 10`, followed by enumeration of the box), Tzanakis–de Weger 1992 §15E (`n_1 ≤ 1153` at `p = 2`), and the computed `(log 2, log 3)` instance, each as a `RealExclusionCertificate` or `PadicExclusionCertificate` whose soundness is `ED.1/exclusion-certificate-sound`.

### Finite residue and distance replay

`RawPadicExclusionCertificate` is the finite counterpart of the mathematical
`PadicExclusionCertificate`. It stores a natural prime candidate `p`, a level `m`,
positive integer weights, canonical natural residues `r₀,r₁,…,rₖ<p^m`, rational
coordinate bounds `X`, and the integer matrix, rational inverse, target, radius,
distance bound and finite coordinate cap of `RawDistanceCertificate`. Actual
p-adic numbers and proofs do not occur in these fields.

The check verifies primality, the residue ranges, positive weights, nonnegative
bounds, the exact weighted triangular matrix, and the target
`y=(0,…,0,−Wₙr₀)`. It replays the two rational inverse identities, the inverse-row
coordinate bound and every eligible integer vector in the finite cube, then
checks the strict inequality `Σ(WᵢXᵢ)²<L²`. The cube bound is justified by the
rational inverse: every vector at distance below the recorded radius lies in
that cube. Thus a successful check certifies a distance bound for the entire
lattice.

If an integer vector `b` in the box satisfied
`bₙ−r₀−Σⱼbⱼrⱼ≡0 mod p^m`, then `Wb+y=Aa` for an integer vector `a`.
The certified distance would give `L²≤‖Aa−y‖²=Σ(Wᵢbᵢ)²<L²`.
When `r₀=0`, the soundness theorem requires `b≠0`, as the homogeneous
distance estimate excludes the zero vector. The p-adic conclusion uses only
the independently certified equalities `PadicInt.appr βᵢ m=rᵢ`:
`appr_spec` and `pow_p_dvd_int_iff` identify the integer congruence with
divisibility of the actual linear form. Exact zero is excluded by
nondivisibility, without applying an integer-valued valuation at zero.

The six small regression contracts distinguish the checks. For `p=3,m=2`,
`A=(9),y=−5,A⁻¹=(1/9),B=4,L²=15,D=1` and `X=3`, the checked cube is
`{-1,0,1}`, with squared distances `16,25,196`. Changing only the target
sign, the inverse, or the prime base to `9` rejects. With `X=4,L²=16`,
strict separation rejects, correctly preserving the congruent integer `−4`.
The homogeneous zero box passes only with its stated exclusion of `b=0`.
These finite rational computations do not certify a large logarithmic-form
instance; its coefficient enclosures and complete transcript remain necessary.


## ED.2. Linear forms in logarithms and S-unit equations

**Dependencies:** `EffectiveDiophantineMethods:ED.0` (enclosures, archimedean and p-adic embedding certificates, height enclosures, valuation certificates); `EffectiveDiophantineMethods:ED.1` (approximation lattices, real and p-adic reduction theorems, Fincke–Pohst enumeration); `DiophantineApproximationAndTranscendence:DT.3` (Matveev's and Yu's lower bounds, Lifting the Exponent); `DiophantineApproximationAndTranscendence:DT.4` (equation-specific bounds, Siegel's identity, divisor representatives, S-unit exponent bound); `DiophantineApproximationAndTranscendence:DT.0` (absolute height computed in a number field); `ComputationalNumberTheory:CN.4` (rational interval and box arithmetic, root isolation, outward rounding, logarithm and arctangent enclosures); `ComputationalNumberTheory:CN.2` (unit-group and prime-ideal certificates).

This layer turns the imported explicit bounds of transcendence theory into **checkable certificates that determine solution sets exactly**. The lower bounds themselves are owned by DT.3 and the equation-specific search regions by DT.4; nothing here re-proves them. What this layer owns is (a) the certified evaluation of the constants of those bounds in exact rational arithmetic, with every precision budget explicit; (b) exact p-adic congruence lattices for multiplicative forms; (c) chains of lattice reductions over the certificates of ED.1; and (d) for Thue equations, Thue–Mahler equations and S-unit equations over `ℚ`, a certificate format and a theorem stating that a valid certificate lists **all** solutions, so that no solution lies outside the enumerated box. The method papers are Tzanakis–de Weger, *On the practical solution of the Thue equation* (J. Number Theory 31 (1989)), Tzanakis–de Weger, *How to explicitly solve a Thue–Mahler equation* (Compositio Math. 84 (1992)), and de Weger, *Algorithms for Diophantine equations* (CWI Tract 65, 1989), Chapters 3 and 6. The archimedean source is Matveev, *An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers II* (Izv. Math. 64 (2000)), Corollary 2.3; the p-adic source is Yu, *Linear forms in p-adic logarithms III* (Compositio Math. 91 (1994)), §0.1. Both are registered as separate sources: **citing their names supplies no numerical constant**; every constant used is computed and checked in the certificate.

### Standing conventions

- **Logarithms.** `Real.log` on positive reals; the principal complex logarithm is Mathlib's `Complex.log z = Real.log ‖z‖ + i·Complex.arg z` with `Complex.arg z ∈ (−π, π]`. A logarithm of an algebraic number `α` in DT.3's sense is any `λ` with `exp λ = α`; the certificates always use principal logarithms plus explicit multiples of `πi` (as `2a₀·Complex.log(−1)`).
- **Heights.** `h(α)` is `NumberField.absLogHeight₁ α`. Upper bounds come from ED.0's certified enclosure of Mathlib's relative height `mulHeight₁` in a number field `K` (`ED.0/height-enclosure`) through `h = Real.log(mulHeight₁)/[K : ℚ]` (`DT.0/abs-mul-height-eq-rpow`), with `Height.logHeight₁_mul_le`, `Height.logHeight₁_inv`, `Height.logHeight₁_sub_le` and conjugate invariance (`DT.4/conjugate-invariance-of-degree-and-height`) for products, quotients and differences of conjugates.
- **Numbers.** Every numerical field of a raw transcript described below is an integer or a rational. Its checks use exact rational comparisons, polynomial identities, modular arithmetic and finite enumeration; real quantities enter through rational enclosures. The separately named semantic records may contain actual field or real objects and proof-bearing data, and their validity predicates are not claimed to be computably decidable. An enclosure never proves an equality, and an enclosure containing `0` never proves vanishing; **nonvanishing of every linear form is proved structurally** (from `m ≠ 0`, `x − yθ^{(i)} ≠ 0`, unique factorisation), never read off a numerical value.
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
- **Exponent reduction chains** (`ED.2/exponent-reduction-chain`, `ExponentReductionChain`). For S⊆ℤ^q, a chain has nonnegative rational vectors X_j, antitone in each coordinate, and finite exceptions E_j. A step sends every a∈S in the componentwise box |a_i|≤X_{j,i} into the next box or E_j. Finite induction proves the final box-or-exception conclusion. `nil`, `append`, `final`, `step` and `sound` expose this API. Tests: empty chain; (100,10)→(2,10) retains (2,9); (100,10)→(2,5) without exceptions cannot cover (2,9). `WeightedExponentReductionChain` separately specializes to X_{j,i}=w_i X_j and serves the scalar Thue bounds; S-unit chains use the vector carrier directly.

### Thue equations (Tzanakis–de Weger 1989)

A factor covering uses exactly `Units.rank K` generators (`rank_eq` in the Lean record). Full generation then implies independent logarithmic images by the pinned `Units.isMaxRank_iff_closure_finiteIndex`. Redundant families such as `(ε, ε)` are excluded: cancelling exponent pairs would invalidate the exponent bound. The `covering_redundant_units` test checks this requirement.

- **Definition** (`ED.2/thue-equation`, `thueForm`, `thueSolutions`, `ThueEquation`). A Thue equation is `F(x, y) = m` with `g` irreducible over `ℚ` of degree `n ≥ 3` and `m ≠ 0`; `thueSolutions g m` is the set of all integer pairs, with no coprimality and no sign normalisation. API: `thueForm_one` (`F(x, 1) = g(x)`), `thueForm_zero` (`F(x, 0) = f₀xⁿ`), `thueForm_smul` (`F(tx, ty) = tⁿF(x, y)`), `ThueEquation.finite_solutions` (from `DT.4/thue-equation-effective-bound`). Tests: `X³ − 2` gives `x³ − 2y³` with solutions `(1, 0)`, `(−1, −1)` of `m = 1`; `(2, 0)` solves `m = 8`; `x² − 2y² = 1` and `(x − y)³ = 1` have infinitely many solutions, which is why degree `≥ 3` and irreducibility are required.
- **Factor coverings** (`ED.2/thue-factor-covering`, `ThueFactorCovering`). For `s ≥ 1`: units `ε_1, …, ε_r` (`r = s + t − 1`) and a finite list `M ⊆ K^×` with **(U)** every unit of `𝓞_K` is `±∏ε_i^{a_i}`, and **(M)** for every solution, `f₀(X − Yξ)` is `f₀μ` times a unit for some `μ ∈ M`. Then `X − Yξ = ±μ∏ε_i^{a_i}`. These are input hypotheses of the certificate theorem; (U) is discharged by `CN.2/units-complete-of-regulator-bound`, and (M) by `DT.4/divisors-up-to-units` (`f₀(X − Yξ)` is an algebraic integer of norm `f₀^{n−1}m` dividing its norm) or by prime-ideal factorisation certificates (`CN.2/prime-ideal-factor-certificate`). The source’s finite representative claim is interpreted for the integral elements `f₀μ`, with `f₀N(μ)=m`, rather than as a finite norm family in the whole field. Tests: for `x³ − 2y³ = 1` (fundamental unit `∛2 − 1`) the list `{1}` covers; for `m = 2` it misses `(0, −1)` (`X − Yξ = ∛2`); the square of the fundamental unit violates (U).
- **Certified constants** (`ED.2/thue-analytic-constants`, `ThueConstants`). In the real-root branch `s ≥ 1` with `M.Nonempty`, the target finite `ThueConstants` format records rational bounds `ĉ_1 ≥ C_1 = 2^{n−1}|m|/min_{i≤s}|g′(ξ^{(i)})|`, `0 < ĉ_2 ≤ C_2 = ½min|ξ^{(i)} − ξ^{(j)}|`, `ĉ_3 ≥ C_3 = max|ξ^{(i_1)} − ξ^{(i_2)}|/|ξ^{(i_1)} − ξ^{(i_3)}|`, the thresholds `Ŷ_0 ≥ Y_0`, `Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)})`, `Ŷ_1* ≥ max(Ŷ_1, (2ĉ_1ĉ_3/ĉ_2)^{1/n})`, and from the covering `μ̂_±`, `ĉ_4 ≥ (½ + max|ξ^{(i)} − ξ^{(j)}|)/μ_−`, `ĉ_5 ≥ C_5 = min((n − 1)·min_I N[U_I^{−1}], max_{i_0≤s} N[U_{I(i_0)}^{−1}])`, `ĉ_6 ≥ 1.39ĉ_1ĉ_3ĉ_4^n/ĉ_2`, `Ŷ_2′ ≥ max(Ŷ_1*, 2|m|^{1/n}, μ̂_+/ĉ_2)`. ⚠ **The matrix `U_I` has the entry `log|ε_i^{(h_l)}|` in row `l` (embedding) and column `i` (unit)**, as forced by `(log|β^{(h_l)}/μ^{(h_l)}|)_l = U_I·a`; Tzanakis–de Weger's sentence after the definition states the transposed orientation, which changes the row-sum norm (`U = ((2, 1), (0, 1))`: row-sum norms `1` and `3/2`). `N[U_I^{−1}]` is certified by an approximate inverse `V`: `‖1 − VU‖_∞ ≤ ρ < 1` on the interval matrix gives `‖U^{−1}‖_∞ ≤ ‖V‖_∞/(1 − ρ)` (`Units.oneSub`, `tsum_geometric_le_of_norm_lt_one`, `Matrix.linftyOpNormedRing`). Root constants are checked using the certified root boxes and exact integer-power comparisons. The representative bounds `μ̂_±` and the unit-dependent constants additionally require the complete factor covering, representative embedding enclosures, a complete-unit certificate, unit-logarithm interval matrices and their approximate-inverse transcripts. The full constructor remains an explicit same-name omission; the supporting `ThueBoundParameters` record checks only its displayed root and threshold inequalities and does not by itself certify those covering-dependent parameters. If `s > 0` and the complete covering has `M = ∅`, `ThueFactorCovering.solutions_eq_empty` certifies an empty answer before any representative minimum or maximum is formed. When `s = 0`, the finite format instead uses complete root isolation, the certified `Y₀` bound and bounded small-solution search; it forms no minimum over real roots, unit matrix, `C₁` or `C₅`. Test: for `x³ − 2y³ = 1`, `C_1 ≈ 0.83995` and `Ŷ_1 = 4`.
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
- **Prime Ideal Removing Lemma** (`ED.2/prime-ideal-removing-lemma`). For `G = G_1⋯G_m` over `ℚ_p` and coprime `x, y`: for `i ≠ j` at most one of `𝔭_i, 𝔭_j` has `ord(x − yθ) > max(e_i, e_j)·ord_p(θ_i^{(k)} − θ_j^{(l)})`; whenever `d_i > 1` or `e_i > 1`, one has `ord_{𝔭_i}(x − yθ) ≤ e_i·ord_p(θ_i^{(k)} − θ_i^{(l)})` for every distinct root pair `k ≠ l` in the factor; at most one `𝔭_i` has `ord > ½e·ord_p(D_θ)`, and then `d_i = e_i = 1`; if `p ∤ D_θ`, at most one prime above `p` divides `x − yθ`. Hence the ideal equations `(x − yθ) = 𝔞𝔟𝔭_1^{u_1}⋯𝔭_v^{u_v}`.
- **S-unit coverings** (`ED.2/thue-mahler-s-unit-covering`, `ThueMahlerCovering`). Units of an order containing `θ` and finitely many cases `(α, π_i, h_i, s′_i, t′_i)` with `(π_i) = 𝔭_i^{h_i}` such that (U) the units generate with the roots of unity of `K` (`±1` when `s ≥ 1`) and (C) every solution has `x − yθ = ±α∏ε^a∏π^n`, `z_i = n_ih_i + s′_i + t′_i`. Discharged by the Prime Ideal Removing Lemma, CN.2's factorisation and unit certificates; `DT.4/s-integral-divisor-representation` shows that finitely many cases suffice. The class number is not needed. The Lean record uses exactly `Units.rank K` units and nonzero `α, π_i`. An inactive prime has `h_i=0, π_i=1, s′_i=0`, and its exponent can be normalized to zero; active primes have `h_i>0` and `s′_i<h_i`. The `tmCovering_redundant_units` regression rejects extra unit coordinates.
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

### Finite certificates and their mathematical interpretation

The names `ThueConstants`, `ThueCertificate`, `ThueMahlerCertificate` and
`SUnitCertificate` refer to the finite formats described above. Their complete
Lean carriers, checks and soundness interfaces are explicitly recorded under
those names in the omission register. The companion's
`SemanticThueCertificate`, `SemanticThueMahlerCertificate` and
`SemanticSUnitCertificate` retain useful conditional mathematics. Their
`Valid` predicates contain actual real inequalities and statements about all
solutions; they have no claimed finite decision procedure. The corresponding
semantic `solutions_eq` theorems cannot substitute for a theorem about a raw
checked transcript.

The distinction determines the required inputs. A complete Thue constant
constructor receives the equation, its certified number-field/root
presentation, a complete factor covering, exactly `rank(K)` fundamental units,
all root and representative enclosures, the unit-logarithm interval matrices,
their chosen embedding index sets and rational approximate inverses. For each
matrix it verifies the uniform interval estimate `‖1−VU‖∞≤ρ<1`; the bound is
`‖V‖∞/(1−ρ)`, with rows indexed by embeddings and columns by units. This
certifies `c₄,c₅,μ₋,μ₊` as well as the root constants and every coupled
threshold. The supporting `ThueBoundParameters` record certifies only its
displayed root/threshold inequalities; its unit and representative parameters
still need the explicit hypotheses of the scalar lemmas. Its
`ThueConstants.weakenC1Bound` weakens only `c₁`. The full `mono` interface
must check every coupled inequality for all changed constants.

The branch with no real roots has a different input: complete root isolation,
the certified `Y₀` bound and the bounded small-solution search. It forms no
unit matrix, no minimum over real roots and no `C₁` or `C₅`. This branch is
part of the required finite format, rather than an assumption that an
inapplicable matrix exists.

For either equation type, a finite number-field presentation uses rational
power-basis coordinates and checked integral-basis conversion matrices.
The raw covering data include complete prime-ideal decompositions, bounded
valuation choices, principal generators or checked nonprincipality, class
remainders, torsion units and a complete-unit certificate. The checked finite
index set must account for every bounded ideal choice; its mathematical
soundness derives the covering conditions `(U),(M)` or `(U),(C)`. A field
asserting that an arbitrary list already covers all solutions is not this
finite input. Generic ideal, class-group, unit and analytic arithmetic stays
with CN.2 and CN.4; ED.2 combines their outputs for the equation.

The initial-bound transcript records the precise Matveev or Yu formula,
degree, nonvanishing and logarithm-branch data, all height/logarithm
enclosures and the rational comparisons that imply the initial bound.
Certified zero logarithms are removed before applying a theorem requiring
nonzero logarithms. Reduction rows record successive nonnegative
componentwise boxes, their exact linear forms and residues, the applicable
reduction lemma, its raw ED.1 exclusion or complete enumeration data, and
all exceptions. Soundness derives the implication for genuine solutions
from those checks; no universally quantified solution implication is a raw
field.

The residual transcript covers **every bounded tuple**, including tuples
which are not solutions. For Thue equations this includes every small-search
pair, every convergent in the finite Euclidean-algorithm trace with denominator
at most `C`, every signed divisor `Z` with `Z^n|m`, and every exceptional
unit-exponent tuple. Exact field coordinates determine whether the latter
has the form `x−yξ` with integral `x,y`; exact polynomial evaluation supplies
the accepting or rejecting outcome.

For Thue–Mahler equations the rows are indexed by
`(case,sign,n,a)` in each box `[0,N₁]×…×[0,Nᵥ]×[-A,A]^r`, together with
all exceptions. A row contains either a checked sieve rejection or the
exact power-basis evaluation of `±α∏εᵢ^{aᵢ}∏πᵢ^{nᵢ}`. The check tests
the higher coordinates, integrality, divisibility by the leading coefficient,
both coprimality conditions and the final equation. The claimed list is
exactly the accepted output set. Omitting even a rejecting row invalidates
the transcript.

For rational S-units, the final domain is
`{±1}×∏_{p∈S}[-f(p),f(p)]`. Every row computes the reduced rationals
`x=±∏p^{a_p}` and `1−x`, rejects zero, and removes the primes of `S` from
the absolute numerator and positive denominator of `1−x`; both remainders
must be `1`. Exceptional boxes receive the same treatment. For `S={2}`
there are six rows, three accepted, giving `(2,−1),(−1,2),(1/2,1/2)`.
For `S=∅`, both rows reject. These finite examples test residual arithmetic;
the full bound and reduction transcripts are still required for a general
certificate.

### The complete prime-removing target and the five cases

The full prime-removing theorem includes the ramified pairwise and
within-factor bounds. With `vᵢ=ord_{𝔭ᵢ}(x−yθ)` and
`ord_p(p)=1`, its proof identifies `vᵢ/eᵢ` with
`ord_p(x−yθᵢ,k)` in a common local splitting field. For different factors,
at most one of `vᵢ,vⱼ` exceeds
`max(eᵢ,eⱼ)ord_p(θᵢ,k−θⱼ,l)`; when `eᵢfᵢ>1`,
`vᵢ≤eᵢord_p(θᵢ,k−θᵢ,l)` for every distinct root pair in that factor.
The discriminant then bounds all but a possible degree-one unramified
prime, giving a finite enumeration of bounded ideal factors. Absolute
ideal norms use `|f₀^{n−1}c|`, including the negative-sign equation.
The companion's `prime_ideal_removing_unramified` is only the
squarefree-mod-`p` uniqueness corollary. The full theorem and its finite
factorization consequence have a separate exact omission.

For the example `G=T³−23T²+5T+24`, put
`ω=(2+θ−θ²)/5`, with primes ordered `(2,3,5,7)`, and

| Generator | Element of the cubic field |
|---|---|
| `π₂₁` | `22+25θ+6ω` |
| `π₃₁` | `31−41θ+47ω` |
| `π₅₁` | `133+150θ+36ω` |
| `π₅₂` | `89+100θ+24ω` |
| `π₅₃` | `111−90θ−16ω` |
| `π₇₁` | `1−θ` |

The regression states equality with the actual five records on
Tzanakis–de Weger1992, p.234. In each case `hᵢ=1,sᵢ=0`, the other
prime generators are `π₂₁,π₃₁,π₇₁`, and all other `tᵢ` are zero:

| Case | `α` | Free generator above `5` | `t₃` |
|---|---|---|---|
| I | `1` | `π₅₁` | `0` |
| II | `1` | `π₅₂` | `0` |
| III | `π₅₃` | `π₅₂` | `1` |
| IV | `1` | `π₅₃` | `0` |
| V | `π₅₂` | `π₅₃` | `1` |

The specific missing-Case-III regression still needs a certified principal-ideal
factorization. Integer arithmetic verifies
`F(399,302)=−3^13·5³`; proving that its ideal has `5`-part
`𝔭₅₂²𝔭₅₃`, and hence cannot be represented by the other four cases,
requires the actual ideal data. The omission register states that precise
test. A nonempty-list theorem does not supply it.

### The published correction to the initial bound

The [1993 corrigendum](https://numdam.org/item/CM_1993__89_2_241_0.pdf),
pp.241–242, changes the use of the original Appendix A3 estimate. The
constant `c₇` must be multiplied by `m^{2m+1}`. For the example `m=7`,
this gives `c₇=1.08672·10^46` and an initial bound `1.511·10^50`.
The authors show that the same first p-adic lattices still give `N₁=1153`,
and the adjusted real step gives `H≤4919`, after which the earlier
reduction route applies. Their alternative Baker–Wüstholz estimate uses
`c₇=2.2044·10^38,c₈=0,c₁₆=10^(−9)` and recovers the original
`9.844·10^49` initial bound. Thus the latter number is used only with
that corrected proof route. The final list of72 solutions is unchanged.
The additional printed corrections concern the p-adic norm subscripts,
the Appendix A3 parameter equalities, and `2.289·10^33` in place of
`2.289·10³`; these are recorded separately in the source-issue register.


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
  and every constant imported from it is halved. Siksek1995 also uses full x-height: its canonical lower bound is halved, and an r-by-r regulator is divided by 2ʳ; the index bound is unchanged.
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
  the orders of the local images μ_v(E(K_v)); the Lean adapters `card_localDescentImage_padic` and `two_mul_card_localDescentImage_real` name the actual pinned μ on W.Point. The finite-index reduction/formal-logarithm comparison is still the Layer4 supplier obligation. Tests: y² = x³ − x has index 4 over ℚ_3, 8 over ℚ_2,
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
  `badPrimes` the local image is the subgroup of unramified classes with square norm. The named Lean statement now takes an actual elliptic normal-form W over ℚ_p and W.badPrimes ℤ_p=∅, and concludes W.μ.range=W.selmerGroupA ℤ_p⊓W.normM.ker, with no assumed cardinalities (inclusion from
  Tau Ceti `range_μ_le_selmerGroupA` over ℤ_p, equality by counting: 2^{#factors − 1} =
  #E(ℚ_p)[2]). Hence the 2-Selmer group is cut out of A(S,2) ∩ ker N by the places of S ∪ {∞}
  alone; these are the primes a certificate must treat.

The pinned factorwise definition uses the actual irreducible factors of W.f and their integral closures. The unramified unit-square norm count is a theorem proof obligation; it is not input certificate data.

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
  bounded by v_p(disc g) + 2. The reciprocal reverses all five coefficient positions: for `X⁴+X` it is `X³+1`, even though its degree drops. The public reversal equality assumes a nonzero constant coefficient; zero constant coefficient gives the rational point `(0,0)` directly. Places are restricted to ∞ or primes, and fuel correctness assumes degree four and nonzero discriminant. API: `quarticLocallySoluble_iff`, `quarticLocallySoluble_reverse`,
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

The named test `twoSelmer_not_image` is a precise §13 omission: use Cremona571a1, [0,−1,1,−929,−10595], transport by (x,y)↦(4x,8y+4) to y²=x³−4x²−14864x−678064, and certify the actual μ-image order1 and Selmer order4 from its complete descent data. The supporting abstract cardinality example does not implement this regression.

### Heights, independence and the index bound

- **`ED.3/explicit-height-difference-bound`** (`canonicalHeight_sub_half_naiveHeight_mem`;
  Cremona III Proposition 3.5.1, p.77). For a nonsingular integral standard Weierstrass
  equation W over ℚ, set log⁺t=log max(1,|t|), 2*=1 if b₂=0 and 2 otherwise, and
  μ_C=((log|Δ|+log⁺j)/6+log⁺(b₂/12)+log(2*))/2. Every P∈W(ℚ), including O, satisfies
  −h(j)/24−μ_C−961/1000 ≤ P.canonicalHeight−P.naiveHeight/2 ≤ μ_C+107/100.
  Cremona's height is twice the pinned Tau Ceti value: halve μ and both constants 1.922,
  2.14, as well as the entire difference. Footnote 3 records Bremner's correction to 1.922.
  CN.4 supplies outward rational enclosures of these real constants. The general-number-field
  Silverman Theorem1.1, p.725, was reported read in the preceding revision; this reviewer could not recover the primary PDF. Its precise weighted number-field interface is recorded in the omission register, but independent primary verification and the Lean carrier remain outstanding.
- **`ED.3/canonical-height-enclosure`** (`canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺`, `pairingEnclosure`).
  Compute Q = 2ⁿP exactly; then ĥ(P) lies in [(λ⁻/2 − c⁻)/4ⁿ, (λ⁺/2 + c⁺)/4ⁿ], where [λ⁻, λ⁺]
  encloses log max(|a|, b) for x(Q) = a/b and c^± bound the two sides of the explicit bound. The
  width is at most ((λ⁺−λ⁻)/2+c⁺+c⁻)/4ⁿ, exactly so when Q≠O. The four rational inputs are explicit; containment requires their certified log/error inequalities, and the width theorem requires λ⁻≤λ⁺ and c⁻,c⁺≥0. Fix the error bounds and use log intervals of uniformly bounded width before increasing n. Pairing data are three log intervals ordered P+Q,P,Q. API: `canonicalHeight_mem_canonicalHeightEnclosure`,
  `canonicalHeightEnclosure_width_le`, `canonicalHeightEnclosure_zero`,
  `canonicalHeightEnclosure_neg`, `neronTatePairing_mem_pairingEnclosure`. Tests: on y² = x³ + 1 the
  point (−1, 0) of order 2 gives [0, 0] for n ≥ 1; O gives [0, 0]; the enclosure contains Tau Ceti's
  ĥ, not 2ĥ; naiveHeight/2 alone is not an enclosure (the torsion point (2, 3) has ĥ = 0 but
  naiveHeight/2 = (log 2)/2). A quantitative regression with log width1/8 and errors2,3 gives width≤81/(16·4ⁿ).
- **`ED.3/regulator-lower-bound`** (`linearIndependent_of_det_enclosure_pos`). If the interval
  determinant of the enclosed Gram matrix of P₁, …, P_r has lower endpoint δ > 0, the P_i are
  independent modulo torsion, rank E(ℚ) ≥ r and det(⟨P_i, P_j⟩) ≥ δ (a dependence gives a kernel
  vector because the pairing vanishes on torsion).
- **`ED.3/height-lower-bound-by-search`** (`le_canonicalHeight_of_search`). Enumerate all points of
  naive height ≤ B (ED.0 bounded-height enumeration); with c⁻ the lower constant of the explicit
  bound, λ = min(B/2 − c⁻, lower enclosures of ĥ at the non-torsion points found) bounds ĥ from
  below on all non-torsion points when λ > 0 (Siksek1995, author preprint §5 Example5.1 p.19; convert its full-height convention). Printed decimal examples still require certified outward rounding and complete search replay.
- **`ED.3/index-bound`** (`saturationIndex_le`). For P₁, …, P_r
  independent modulo torsion, with saturation L̄ of their span L and ĥ ≥ λ > 0 on non-torsion
  points, [L̄ : L] ≤ R^{1/2}(γ_r/λ)^{r/2}, R = det(⟨P_i, P_j⟩), for any γ_r with the Hermite
  property; Minkowski's convex-body theorem gives γ_r = (4/π)Γ(r/2 + 1)^{2/r} (Siksek1995, author preprint §3 equation(27), Lemmas3.1–3.2 and Theorem3.1, pp.14–16). The source states the full-rank case with a strict lower bound; the same lattice proof on the saturated rational span gives the stated version, and only λ≤ĥ is used. Assume r≥1 here.

### Saturation and the certificates

- **`ED.3/p-saturated`** (`IsPSaturated G p`, `saturation`). G ≤ A is p-saturated if p·a ∈ G implies
  a ∈ G; equivalently A[p] ≤ G and G ∩ pA = pG; for finite index and p prime, iff p ∤ [A : G]. Siksek §4 p.17 gives the free-lattice criterion; the general additive-group/torsion extension follows by the p-torsion of A/G. API:
  `isPSaturated_iff`, `isPSaturated_iff_not_dvd_index`, `isPSaturated_top`, `IsPSaturated.inf`,
  `index_eq_one_of_forall_isPSaturated`, `saturation`. Tests: 6ℤ ≤ ℤ is 5-saturated and neither
  2- nor 3-saturated; ⊤ is always saturated; for 6ℤ, p-saturated iff p ∤ 6; ℤ × 0 ≤ ℤ × ℤ/2 has
  G ∩ 2A = 2G but is not 2-saturated (the torsion condition is needed).
- **`ED.3/saturation-certificate`** (`isPSaturated_of_injective_reductions`). If homomorphisms
  ψ_i : A → C_i with pC_i = 0 induce an injective map G/pG → ∏ C_i and A[p] ≤ G, then G is
  p-saturated. The standard maps are reduction modulo good primes q followed by
  B_q → B_q/pB_q (B_q = Ẽ(𝔽_q) or J̃(𝔽_q)); for p = 2 on an elliptic curve, μ itself (kernel 2E(ℚ)). Siksek §4.1 pp.17–18 includes torsion modulo p and explains the reduction sieve; arbitrary p-primary targets require B_q/pB_q. No claim is made that reductions always suffice.
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
  E(ℚ) = T ⊕ ℤP₁ ⊕ … ⊕ ℤP_r and the regulator (Siksek §4 opening p.17 and the elementary finite-index criterion; no §4.2 numerical recognition is used). Rank0 uses the algebraic upper bound and complete torsion directly, without a γ₀ index formula.
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
  rank J(ℚ) ≤ 3 rests on the weak Birch–Swinnerton-Dyer conjecture, analytic continuation of
  L(J, s), and certified nonvanishing of L‴(J,1). Stoll’s numerical value alone does not certify that last input; it appears only as an explicit hypothesis, under which G has finite index and J(ℚ) is
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


R3 now has actual local-curve signatures and the exact quantitative height API; the local geometric proofs and concrete descent producers remain planned. R7 uses independently downloaded Siksek1995 primary passages for every former Prickett proof citation. The Prickett access history is retained; its Tate–Lichtenbaum refinements still require primary recovery and verification.

## ED.4. Classical Chabauty–Coleman

**Dependencies:** `EffectiveDiophantineMethods:ED.3` (finite-index subgroup, rank and saturation certificates); `EffectiveDiophantineMethods:ED.0` (certified valuations and p-adic embeddings); `ColemanIntegration:L0` and `ColemanIntegration:L1` (formal primitives, residue discs, Coleman integrals, Dwork's principle); `SchemeAndStackFoundations:SF.3` (curves, Riemann–Roch, specialisation of divisors, symmetric squares); Tau Ceti `JacobianChallenge` layers D, E and F (Jacobian, abelian varieties, Abel–Jacobi); `JacobianChallengePartII:JC1` (relative Jacobian of a smooth model); `NeronModelsAndSemistableAbelianVarieties:R11.1` (Néron models); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` (formal Lie groups); Tau Ceti `StableReduction` layer 5 (regular and minimal models); Tau Ceti `AlgebraicCurves` layer 10 (hyperelliptic models); `HeightsRationalPointsAndObstructions:RP.1` (Mordell–Weil); `DeligneWeightsAndPurity:DWP.1` (Frobenius of abelian varieties over finite fields).

**What this layer does.** For a smooth projective geometrically integral curve X of genus g ≥ 2 over ℚ with a rational point O, a Mordell–Weil subgroup of J(ℚ) of certified finite index and rank r < g, and a prime p of good reduction, the layer builds the p-adic abelian logarithm of J, abelian and Coleman integrals on X, the annihilating differentials, power-series expansions on residue discs, and zero bounds on every residue disc, including the exceptional ones. It ends in a certificate format whose validity proves that a finite list of rational points is all of X(ℚ). The number-field version (Siksek) and the bad-reduction version (McCallum–Poonen, Appendix A) are separate statements with their own hypotheses, and the symmetric-square criteria of Siksek and Box feed the relative sieve of ED.5. Library module: `TauCeti/NumberTheory/Diophantine/` (`AbelianLogarithm`, `ChabautyColeman`, `ColemanComparison`, `ResidueDiscZeros`, `ChabautyCertificate`, `NumberFieldChabauty`, `SymmetricChabauty`, `ChabautyExamples`), namespace `TauCeti.EffectiveDiophantine.ED4`.

### Conventions

- The p-adic valuation is normalised by v(p) = 1. "p is a prime of good reduction" means that a smooth projective model 𝒳 → Spec ℤ_p of X_{ℚ_p} is given as data; X̃ = 𝒳_{𝔽_p} is its special fibre and X̃(𝔽_p) is computed on that model.
- The Abel–Jacobi map is ι_O(P) = [P − O]. Lie(A) is the tangent space at 0, and a regular 1-form on an abelian variety is identified with the linear functional it induces on Lie(A) (Mathlib's `Module.Dual`). For a regular form ω on X, ω_J is the invariant form on J with ι_O*ω_J = ω; this does not depend on O.
- The integration pairing is ⟨x, ω⟩ := ω_J(log_J x), and ∫_Q^{Q'} ω := ⟨[Q' − Q], ω_J⟩. No other normalisation of p-adic integrals is used in ED.4; Coleman integrals are compared with it, not substituted for it.
- The disc Strassmann index of f = Σ a_i t^i with f' ∈ ℤ_p[[t]] is N_p(f) := the largest i minimising v(a_i) + i, i.e. the Strassmann index of f(pT). Here v(0)=∞, zero coefficients cannot attain the minimum, and the zero series has no finite zero-bound index. The regression f(T)=T has index1.
- A conditional statement carries its hypothesis as a labelled input; a certificate whose rank input is such a hypothesis is called conditional, and so is every conclusion drawn from it.

### Objects

The original `abelianLog`, `integrationPairing`, `abelianIntegral` API families and their geometric regression names are reserved for the actual abelian-variety, curve, divisor and differential constructions just described. Their exact same-name §13 omissions contain the full target contracts. The companion instead calls its supporting algebra `formalLogExtension`, `formalLogPairing` and `formalLogIntegral`, on the supplied `FormalLogDatum` and dual-space identifications; its regressions have corresponding abstract names. In particular `residueConstantDifference_eq_zero_of_frobeniusRelation` assumes the local-constancy and Frobenius identities. The original `colemanIntegral_eq_abelianIntegral` remains the omitted geometric comparison, which must derive those identities from the actual Coleman and cohomology suppliers. These renamings preserve the supporting algebra; they do not identify it with the missing geometric construction.

- **Good-reduction Chabauty datum** (`GoodReductionChabautyDatum`, node `ED.4/good-reduction-chabauty-datum`). Data: X/ℚ, O ∈ X(ℚ), p, and a smooth projective model 𝒳 over ℤ_p of X_{ℚ_p}. Derived: the reduction map red : X(ℚ_p) = 𝒳(ℤ_p) → X̃(𝔽_p), surjective by Hensel's lemma; residue discs D(x̃) = red⁻¹(x̃); local parameters t_x̃ mapping D(x̃) bijectively onto pℤ_p (and the O_K-points of the disc onto m_K for finite K/ℚ_p); the relative Jacobian 𝒥 = Pic⁰_{𝒳/ℤ_p} with reduction red_J and kernel J¹(ℚ_p), compatible with ι_O; and the good-reduction pair (𝒳, Ō) of `ColemanIntegration:L1/good-reduction-pair`. The same definition is made over O_v for a place v of a number field. API: `red`, `red_surjective`, `residueDisc`, `localParam_bijOn`, `redJ_comp_abelJacobi`, `toGoodReductionPair`. Tests: C₀(5) at p = 3 has the four discs ∞^±, (0, ±1); y² = x(x − 1)(x − 2)(x − 5)(x − 6) at p = 7 has eight discs; the valid genus-one curve y²=x³−x at p=3 has four special-fibre points (the chart construction is an omitted geometric test); the model y² = x(x − 1)(x − 2)(x − 5)(x − 6) is not smooth over ℤ_5; residue discs agree with the tubes of ColemanIntegration.
- **The p-adic abelian logarithm** (`abelianLog`, node `ED.4/abelian-logarithm`). For an abelian variety A over a finite extension K of ℚ_p: with 𝒜 the Néron model, F̂ its g-dimensional formal group, A¹(K) = F̂(m_K) and N = #𝒜(k), log_A(x) := N⁻¹ log_F̂(s(N x)), where log_F̂ is the formal logarithm (formal primitives of the invariant differentials). Properties: a homomorphism independent of choices; kernel the finite group A(K)_tors; continuous with identity differential, an isomorphism F̂(m_K^n) ≅ (m_K^n)^g for n > e/(p − 1); functorial, log_B ∘ φ = dφ ∘ log_A, and compatible with finite extensions; passing to their union gives points over the algebraic closure of ℚ_p, while extension to completed ℂ_p requires the separate analytic/continuity construction, not a direct-limit identification; the point-first pairing A(K) × Ω_A → K has left kernel A(K)_tors and right kernel zero, and ⟨·, ω⟩ is the unique locally analytic homomorphism with differential ω. API: `abelianLog`, `abelianLog_eq_formalLog`, `abelianLog_nsmul`, `ker_abelianLog`, `abelianLog_map`, `abelianLog_baseChange`, `integrationPairing`, `integrationPairing_eq_zero_iff`, `abelianLog_unique`. Tests: for an elliptic curve it is the formal-group logarithm on E¹ (Mathlib's one-dimensional `FormalGroup`); torsion points have logarithm 0; the 5-torsion point (0, 0) of y² + y = x³ − x² over ℚ_5 shows that log is not injective; for the Jacobian of C₀(5), D' = 9·[∞⁺ − ∞⁻] ∈ J¹(ℚ_3) has formal logarithm ≡ (36, 3) (mod 3⁴) in Flynn's parameters; for the differential-first order Ω_A×A(K), the left kernel is zero and the right kernel is torsion (Siksek pairing (4) misprints both; E22). No other roadmap owns this logarithm; `PadicHodgeRegulators:L1/abelian-variety-logarithm` and the Gross–Zagier layers consume it. Elliptic formal groups themselves belong to Tau Ceti EllipticCurves layer 1.
- **Abelian integrals on X** (`abelianIntegral`, node `ED.4/abelian-integral`). ∫_D ω := ⟨[D], ω_J⟩ for Galois-stable degree-zero divisors D. Linear in ω, additive in D, zero exactly on torsion classes (so on principal divisors), base-point independent up to constants, compatible with finite extensions, with change of variables ∫_D ρ*ω = ∫_{ρ_*D} ω and the trace formula ∫_{ρ*E} ω = ∫_E Tr_ρ ω for finite ρ. API: `abelianIntegral`, `abelJacobi_pullback_bijective`, `abelianIntegral_add`, `abelianIntegral_eq_zero_iff`, `abelianIntegral_map`, `abelianIntegral_trace`, `abelianIntegral_baseChange`. Tests: on C₀(5), ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵); ∫_Q^Q = 0; on C₁(3₂), 2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω for the Weierstrass point W ≡ (1, 0) (mod 3); in genus one the integral is the elliptic logarithm; a nonzero torsion class has all integrals zero.
- **Annihilating differentials** (`annihilatingDifferentials`, node `ED.4/annihilating-differentials`). Ann_p(Γ) = {ω ∈ H⁰(X_{ℚ_p}, Ω¹) : ⟨γ, ω_J⟩ = 0 ∀ γ ∈ Γ}, the dual annihilator of span_{ℚ_p} log_J(Γ); the annihilating (vanishing) differentials of X are Ann_p(J(ℚ)). With a good-reduction datum, V = Ann_p(Γ) ∩ H⁰(𝒳, Ω¹) is saturated and its reduction Ṽ has 𝔽_p-dimension dim Ann_p(Γ). Properties: dimension g − r₀ ≥ g − rank Γ; equal for a finite-index subgroup, hence computable from any ED.3 finite-index certificate as the kernel of the matrix of integrals of a basis against generators; equal for the closure and the saturation; inclusion-reversing. API: `annihilatingDifferentials`, `mem_annihilatingDifferentials`, `annihilatingDifferentials_eq_dualAnnihilator`, `annihilatingDifferentials_of_finiteIndex`, `annihilatingDifferentials_antitone`, `finrank_annihilatingDifferentials`, `annihilatingDifferentials_saturation`, `annihilatingDifferentials_eq_ker`, `reducedAnnihilator`. Tests: C₀(5) at p = 3, Ann = ℚ_3(ε dx/y + x dx/y) with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴) and Ṽ = 𝔽_3·x dx/y; C₁(3₂) at p = 3, Ann = ℚ_3(α dx/y + x dx/y) with α ≡ 68 (mod 3⁴) and Ṽ = 𝔽_3·(x − 1)dx/y; Ann(0) is everything and Ann(J(ℚ_p)) = 0; the subgroup 0 of C₀(5), not of finite index, has dx/y in its annihilator although ∫_{(0,1)}^{(−3,1)} dx/y ≠ 0; agreement with Mathlib's `Submodule.dualAnnihilator`.
- **Residue-disc verdict** (`ResidueDiscVerdict`, node `ED.4/residue-disc-verdict`). For a genuine geometric Chabauty datum, a residue disc D(x̃), a certified nonzero differential annihilating a finite-index Mordell–Weil subgroup, and η(P)=∫_O^Pω, a ResidueDiscVerdict is finite raw data with a terminating checker, not a record containing a universal bound on unknown points. It contains: (i) exact curve/base-point/local-parameter identifiers and a certified integration constant; (ii) finite coefficient residue tables for scaled pullback series F(u)=p^sη(φ(p(a+p^k u))) in each encoded ball, where φ is the inverse geometric parameter chart and the finite integers a,k describe the ball (the root uses a=k=0), common absolute precision, a certified nonzero leading coefficient and a last dominant index; (iii) a finite tail-bound transcript whose soundness follows from integral differential coefficients or the CN.4 certified analytic supplier; (iv) either the whole disc as one leaf or a finite full residue-subdivision tree, with all p children at each internal ℤ_p-ball and disjoint leaves covering the root; (v) exact rational/algebraic zero records, their embeddings in ℚ_p via isolating balls, checks of the curve equation and geometric vanishing relation, rationality/nonrationality certificates and distinctness; (vi) for each leaf, the number of distinct recorded zeros equals its checked Strassmann upper bound. Zero-root leaves have bound0 and no point records. Valid means that every finite arithmetic, identifier, covering, disjointness and exact algebraic check succeeds. Under separately stated geometric interpretation and supplier-soundness hypotheses this proves X(ℚ)∩D(x̃)=Z_rat. No list of approximate roots, semantic all-point validity predicate or asserted bound is a raw certificate. API: `zeros`, `Valid`, `rationalPoints_eq`, `ofKnownPoint`, `empty`, `card_le`, `changeBase`, `rawData`, `check`. Existing C₀(5)/C₁(3₂) exact-example tests are preserved as geometric factory obligations, not proved by arbitrary sets with the right cardinality. Added rejection tests cover an all-zero precision table, a non-strict tail, a missing p=3 subdivision child and a duplicate exact root.
- **Chabauty–Coleman certificate** (`ChabautyColemanCertificate`, node `ED.4/chabauty-coleman-certificate`). Data: X with explicit equations and O; a list L of verified rational points; an ED.3 finite-index subgroup certificate for G = ⟨D₁, …, D_r⟩ with rank J(ℚ) = r < g (or, in the conditional variant, a labelled hypothesis rank J(ℚ) ≤ r with unconditional independence of the D_j); a prime p with a good-reduction datum and its smoothness certificate; the complete list X̃(𝔽_p); annihilating differentials of certified precision; one valid verdict per point of X̃(𝔽_p). The prime may be ≤ 2g: exceptional discs are covered by certified Strassmann bounds. API: `points`, `Valid`, `verdict`, `discs_complete`, `rankInput`, `card_points_le`, `ofRankHypothesis`. Tests: the C₀(5) certificate with bounds 1, 1, 2, 2 and six points; rank 0 makes every differential annihilating; omitting one disc invalidates a certificate; no certificate exists when r₀ = g (McCallum–Poonen Example 4, y² = x⁶ + x² + 1); a certificate built from a rank hypothesis is labelled conditional.
- **Symmetric-square Chabauty datum** (`SymmetricSquareChabautyDatum`, node `ED.4/symmetric-square-chabauty-datum`). For X non-hyperelliptic of genus g ≥ 3 and a rational degree-two divisor ∞: X⁽²⁾ and its injective Abel–Jacobi map 𝒬 ↦ [𝒬 − ∞]; reduction of X⁽²⁾(ℚ); Ṽ; the matrix Ã(𝒬) of constant (and, for a double point, linear/2) coefficients of a basis of Ṽ at the reductions; in the relative case, ρ : X → C of degree 2 extending to smooth models, Ṽ₀ = reduction of Ann ∩ ker Tr, and the pullbacks ρ*C(ℚ). API: `abelJacobi`, `abelJacobi_injective`, `red`, `matrix`, `relativeVanishing`, `mem_pullback`. Tests: pairs of rational points; the diagonal matrix needs p odd; X₀(N), N ∈ {43, 53, 61, 65}, have infinitely many quadratic points despite r < g − 1; reduction commutes with Abel–Jacobi.

### Theorems

- **Tiny integrals** (`abelianIntegral_eq_primitive`, `ED.4/tiny-integral-expansion`). For an integral regular ω, ω = w(t)dt on D(x̃) with w ∈ ℤ_p[[t]] reducing to the expansion of ω̃; for Q, Q' in the disc (over any finite K/ℚ_p), ∫_Q^{Q'} ω = I(t(Q')) − I(t(Q)) with I the formal primitive of w (`ColemanIntegration:L0/formal-primitive`), the unique analytic primitive on the disc; for p odd and K unramified, ∫_Q^P ω = αz + βz² with α = w(0), β integral (Siksek Lemma 3.2). Proof: [P − Q] is a morphism from the formal disc into the formal group of 𝒥, and log_F̂ composed with it is a convergent primitive of ω.
- **Kernel-of-reduction evaluation** (`integrationPairing_eq_sum_tiny`, `ED.4/kernel-of-reduction-evaluation`). If x̃' = red P' is not a Weierstrass point of X̃, every D ∈ J¹(ℚ_p) is uniquely represented by an effective degree-g ℚ_p-rational divisor E−gP'; the geometric support points Q_j may be conjugate or repeated and lie in the disc of P', and ⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_n λ_n s_n with s_n power sums computed from ∏(T − t(Q_j)) ∈ ℚ_p[T] (Stoll, Rational 6-cycles §3, pp.9–10); equivalently sum multiplicities times field traces from the closed-point residue fields. Uniqueness is of the effective divisor, not its ordering, and follows from the stated h⁰=1 specialisation/Riemann–Roch argument. The evaluation formula holds for any such representation.
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
- **Number fields** (`eq_singleton_of_rank_reducedMatrix`, `ED.4/number-field-chabauty-criterion`). Siksek's Theorem 2: for K of degree d, p odd and unramified in K, good reduction at all υ | p, and a basis of a free finite-index subgroup of J(K), rank d of the reduced matrix M̃_p(Q) implies C(K) ∩ B_p(Q) = {Q}. The necessary dimension condition is `h≥d` for the certified kernel dimension `h`; `r≤d(g−1)` follows only when the logarithm matrix has full column rank.
- **Symmetric Chabauty** (`eq_of_rank_symmetricMatrix`, `ED.4/symmetric-chabauty`). Box Theorem 2.1: p > 2, p ≠ 3 when Q̃₁ is 𝔽_p-rational, rank Ã(𝒬) = 2 ⇒ 𝒬 is alone in its residue class of X⁽²⁾(ℚ). The original proof is Siksek2009 published Theorem3.2, pp.217–222 (Box cites its preprint Theorem1): pass to a common finite extension containing both divisor supports, retain every multiplicity, and use the first d_j power sums and Newton identities (Lemmas3.3–3.4). Comparison points need not lie in ℚ_p(Q₁). The matrix is over the appropriate support residue field/algebraic closure; an arbitrary matrix over 𝔽_p is not the full datum.
- **Relative symmetric Chabauty** (`mem_pullback_of_relativeCriterion`, `ED.4/relative-symmetric-chabauty`). (a) Box Theorem 2.4: for 𝒬 ∈ ρ*C(ℚ), p > 2 when Q̃₁ is 𝔽_p-rational, and some ω ∈ Ṽ₀ with nonzero constant coefficient at Q̃₁, every point of X⁽²⁾(ℚ) in the class of 𝒬 is a pullback. (b) Caraiani–Newton Proposition 7.4.1: if red_{p_i}(x) ∈ red_{p_i}(L_i^good) for some i then x ∈ L ∪ ρ*C(ℚ). The sieve over the bad sets (Caraiani–Newton Theorem 7.4.2) is `ED.5/relative-symmetric-sieve`.

### Worked certificates (acceptance)

- **C₀(5)** (`C05_rationalPoints`, `ED.4/fps-quintic-cycle-curve`): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, J(ℚ) ≅ ℤ (`ED.3/fps-genus-two-mordell-weil`), G = ⟨[(−3, 1) − (0, 1)]⟩, p = 3, discs ∞^±, (0, ±1) with bounds 1, 1, 2, 2; X(ℚ) = {∞⁺, ∞⁻, (0, ±1), (−3, ±1)} unconditionally (McCallum–Poonen Proposition 8.2; Flynn–Poonen–Schaefer Theorem 6).
- **C₁(3₂)** (`C132_rationalPoints`, `ED.4/poonen-type-three-two-curve`): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, G = ⟨[S⁺ − S⁻]⟩, p = 3, ω̃ = (x − 1)dx/y; six discs with bound 1 and the exceptional Weierstrass disc (1, 0) with bound 3, zeros S⁻, W, S⁺, W not rational. X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞^±}, conditional on rank J(ℚ) ≤ 1, whose corrected descent is recorded as a gap in `ED.3/poonen-genus-two-mordell-weil`; unconditionally for points in the saturation of G. The Coleman version replaces Poonen's formal-group computation and needs no variant embedding.
- **X₀^dyn(6)** (`X0dyn6_rationalPoints_of_rank_le_three`, `ED.4/stoll-six-cycle-curve`): genus 4, G ≅ ℤ³ generated by the ten known points (`ED.3/stoll-genus-four-subgroup`), p = 5, ω̄ = w ω̄₀, bound 2 at (∞, −1), an explicit bound 1 at (∞, 0), bound 1 elsewhere. Conditional on rank J(ℚ) ≤ 3, with separate analytic continuation, certified nonzero derivative and weak-BSD inputs in the analytic route (Stoll Theorem 7); unconditionally the ten points are the only rational points in the saturation of G (Stoll Lemma 5).

### Boundaries

ED.4 does not compute Mordell–Weil groups, ranks, torsion or saturation (ED.3), does not run the Mordell–Weil sieve or combine primes (ED.5), and does not treat quadratic or nonabelian Chabauty (ED.6 consuming `AnabelianGeometryAndNonabelianChabauty:NC.5`). Strassmann's theorem over a complete nonarchimedean field is `ED.4/strassmann-bound` (the statement of `ArithmeticDynamics:DY.6/strassmann-theorem`, a stage downstream of ED.4 through DY.3); formal primitives, residue discs and Coleman integration to `ColemanIntegration`. The depth-one comparison of `AnabelianGeometryAndNonabelianChabauty:NC.4` can cite `ED.4/coleman-abelian-comparison` and `ED.4/abelian-logarithm`.

### Geometric signatures and the finite disc verifier

The named divisor-evaluation, p-adic-closure, Chabauty-finiteness, Coleman/bad-reduction, number-field and absolute symmetric-square results have exact same-name §13 omissions in the suggested file. Their full statements above and in the packet are mathematical contracts on actual curves, effective divisors, regular differentials, p-adic Lie groups and regular models. `sum_pairing_eq_sum_discEval`, `finrank_logSpan_le_card`, the finite-fibre counting lemmas and `eq_singleton_of_rank_and_congruences` are separately named supporting algebra. They neither construct nor assert these geometric hypotheses. The old generic symmetric-space carrier is removed; the exact datum/API/tests remain an explicit geometric omission, including conjugate degree-two points and the doubled divisor2P.

The closure is the closure in A(ℚ_p)'s natural analytic topology. Continuity and compactness identify its log image with the closed ℤ_p span of the finite generating family; the local analytic logarithm identifies Lie dimension. Finite-index groups have the same ℚ_p span but need not have the same closure unless the stated index condition is supplied. The p-prime-to-reduction-order condition is checked on the actual reduction group. The generic finite-span inequality is only one algebraic step of this argument.

For the raw disc verifier, fix a root chart t=pu and choose s≥0 so F(u)=p^sI(pu) has integral coefficients. Its coefficient table consists of finite residues b₀,…,b_(K−1) modulo p^M. To certify last dominant index N with minimum valuation m, check M>m, N<K, every coefficient has valuation at least m, the Nth has valuation exactly m, and all later recorded coefficients have valuation greater than m. A separate sound tail certificate proves the same strict inequality for every n≥K. A sufficient integral-derivative rule is v_p([u^n]F)≥s+n−v_p(n); K≥2(m+1) then works, since v_p(n)≤n/2 for n≥2. The constant coefficient requires its own certified enclosure. An all-zero residue table cannot certify nonvanishing. This finite integer fragment is `RawDiscCoefficientWitness` with `check` and `dominant_of_check`. It is supporting arithmetic; it does not identify the table with the actual Coleman primitive. Its named tests accept [1,0] with N=0 and [0,1] with N=1 at p=3, precision1, and reject the later tie[1,1], too-short table[1], and unknown all-zero table[0,0].

A finite subdivision tree represents u=a+p^k v by residue prefixes. Each internal vertex must have every child0,…,p−1 exactly once, so its leaves are an exhaustive disjoint cover. Each leaf has a sound substituted-series coefficient/tail table and a checked bound, plus exact algebraic point descriptors with chosen ℚ_p embeddings. Exact curve/group identities establish zero status; rationality or nonrationality is certified independently. Merely isolating an analytic zero does not classify it as rational or irrational. Distinctness is proved exactly or by disjoint isolating balls. A leaf closes only when its number of distinct certified zeros equals the bound; multiplicity is not fabricated by repeating the same point. The full checker and its geometric soundness/point producers are explicitly omitted under their packet names until these exact supplier interfaces exist.

`SemanticDiscZeroData` preserves the earlier conditional zero-count argument under an honest supporting name. Its universally quantified `Valid` predicate is semantic and is not `ResidueDiscVerdict.Valid`, a raw verifier or an executable completeness certificate. The accepted abstract `ChabautyColemanCertificate` consumes this semantic supporting carrier; its already recorded genuine factory omission remains. ED.5's finite sieve is unchanged.

### Sources

McCallum–Poonen, "The method of Chabauty and Coleman" (author copy, §§4–9, Appendix A); Flynn–Poonen–Schaefer (arXiv:math/9508211, §§3, 7, 8); Stoll, "Rational 6-cycles" (arXiv:0803.2836v2, §§2–4); Siksek, "Chabauty for symmetric powers of curves", Algebra & Number Theory3(2009),209–236, version of record §3 pp.216–222 (the original absolute criterion and proof now read); Siksek, "Explicit Chabauty over number fields" (arXiv:1010.2603v2, §§3–4); Box (arXiv:1906.05206, §2); Caraiani–Newton (arXiv:2301.10509, §7.4); Poonen (arXiv:math/9512217v1, §4, and his errata); Stoll, "Uniform bounds" (arXiv:1307.1773v4, §§3, 6); Katz–Rabinoff–Zureick-Brown (arXiv:1504.00694v2, §3); Balakrishnan–Bradshaw–Kedlaya (arXiv:1004.4936v2, §§1–2). In Poonen's preprint, p. 15, "R⁺ and R⁻ both reduce to the Weierstrass point (1, 0)" should read S⁺ and S⁻.


The general relative theorem in Siksek2009 is not certified by the recovered absolute proof. Source issue E31 records the published Theorem4.3 condition `v_p(i+1)<i/N′` for all `i≥0`: at zero it is `0<0`, and its proof repeats the corresponding `1<1` norm claim. Positive indices are the evident intended range for the higher terms. The author-linked 2008 preprint repeats the slip; the bounded publisher and author search found no correction. The existing Box degree-two relative target and its geometric omission remain separate.

The soundness theorem also requires each rescaled series to be restricted: its coefficients tend to zero. Integral derivative bounds prove this for the root chart; the affine-substitution or analytic supplier proves it for its outputs. A uniform strict tail bound by itself is not a convergence certificate.

## ED.5. Mordell–Weil sieve and combination certificates

This layer turns a Mordell–Weil group, local information at finitely many places and a uniqueness or height input into a finite, checkable proof about the rational points of a curve: that there are none, that a given list is complete, that every point of bounded height is listed, or that every integral point is listed. Its source is Bruin–Stoll, *The Mordell–Weil sieve: proving non-existence of rational points on curves* (LMS J. Comput. Math. 13 (2010) 272–306; page numbers are those of the version of record), together with Box's relative symmetric sieve (Math. Comp. 90 (2021), §2.4) in the form of Caraiani–Newton Theorem 7.4.2, and McCallum–Poonen Theorem 5.3 for the residue-disc bound used in the Chabauty combination.

The layer has four parts: the finite sieve algebra on an abstract abelian group (twenty declarations); the geometric interface producing the sieve input from a curve, its Jacobian and its reductions; the proved algorithmic facts and transfers (coprime index, kernel level, exponent relevance, chains, GetSubgroup, bad and deep information); and the combinations with heights, integral points, Chabauty–Coleman and relative symmetric Chabauty, ending in conditional certificate soundness targets. The geometric and finite numerical suppliers remain explicit gaps. All declarations live in `TauCeti/NumberTheory/Diophantine/MordellWeilSieve`, namespace `TauCeti.MordellWeilSieve`.

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

The following routine lemmas are API entries of `admissible-classes`; `global-soundness`, `empty-sieve-obstruction` and `quotient-refinement` retain their target nodes:

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

**Preparing steps (lifting API).** `prepared-step-target` (`target_le_preparedStep`): for `D ≤ L`, `D ≤ L ∩ φ⁻¹(φ(D))`. `prepared-step-progress` (`preparedStep_lt`): if `φ(L) ⊄ φ(D)` the prepared subgroup is proper. With `D = N_kΓ` and surjective `φ`, `φ(D) = N_kG`, so the correct step uses the kernel of `Γ → G → G/N_kG`; the printed `L_{j−1} ∩ ker(φ_i)` can fall below the target (`Γ = ℤ`, `G = ℤ/4`, target `2ℤ`: the printed kernel is `4ℤ`), as recorded in source issue `EffectiveDiophantineMethods/E1`; the authors' implementation already uses the quotient target.

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

**Theorem** (`ED.5/relative-symmetric-sieve`, `JacobianReductionData.relative_symmetric_sieve` and `relative_symmetric_sieve_of_admissibleClasses`; Caraiani–Newton Theorem 7.4.2 = Box Theorem 2.6). **Planet: relative symmetric Mordell–Weil sieve.** Let `X/ℚ` be non-hyperelliptic of genus `g ≥ 3`, possibly with a degree-two map `π : X → C`; primes `p₁, …, p_r` of good reduction for `X` (and `C`, with `π` extending); `G = ⟨D₁, …, D_n⟩ ≤ J(ℚ)` of finite index with `I·J(ℚ) ⊆ G`; a finite `L ⊆ X^(2)(ℚ)` containing a rational degree-two divisor `∞`; and `L_i^good ⊆ L` certified at `p_i` by `ED.4/symmetric-chabauty` (alone in its residue class) or `ED.4/relative-symmetric-chabauty` (every point of the class comes from `C(ℚ)`). Put `ι(x) = I·([x] − ∞) ∈ G`, `ι_p(R) = I·([R] − ∞̃)` (the degree-two square of `jacobian-reduction-data`), and `M_i^bad = ι_{p_i}^{-1}(red_{p_i}(G)) ∖ red_{p_i}(L_i^good)`. If no `g ∈ G` has `red_{p_i}(g) ∈ ι_{p_i}(M_i^bad)` for every `i`, then `X^(2)(ℚ) = L ∪ π*C(ℚ)`. Proof: a point outside `L ∪ π*C(ℚ)` reduces into `M_i^bad` at every `p_i` (Caraiani–Newton Proposition 7.4.1, the second part of `ED.4/relative-symmetric-chabauty`), so `ι(x)` violates the hypothesis. By `kernel-level-exactness` the hypothesis is equivalent to an empty finite sieve at `⋂ ker(red_{p_i}|_G)`. Source acceptance examples (their complete transcripts are not replayed in ED.6): Caraiani–Newton Proposition 7.4.5 for `X(s3, ns5)` over `X(ns3, ns5)` with `I = 10`; Box's `X₀(43)` with the primes `5, 7, 11`.

### The certificate

**Definition** (`ED.5/sieve-certificate`, structure `SieveCertificate P Γ C G`). **Planet: Mordell–Weil sieve certificate.** A certificate records:

1. jacobian reduction data: the curve, `D₁`, the places with their local groups, the local maps on generators and certified local sets (good data, or bad and deep data from `padic-quotient-sieve-datum`);
2. the Mordell–Weil input: generators of `H ≤ J(ℚ)` with the ED.3 certificates of rank, torsion and index prime to the primes of `N` (`ED.3/finite-index-subgroup-certificate`, `ED.3/saturation-certificate`), or `ED.3/mordell-weil-basis-certificate`; a rank resting on an analytic hypothesis (BSD) is a labelled hypothesis, not a field;
3. the modulus, the chain `L_0 ⊇ … ⊇ L_t`, the lifts and the test sets;
4. the exhaustive candidate set `candidates` = `siftChain` at level `t`;
5. the known points and the mode: emptiness, Chabauty (an annihilating differential at `p₀` with its certified residue classes, `L_t ⊆ ker ρ_{p₀}`), or height (`H`, separation data, short-vector certificates).

`Checked` for the supporting semantic record quantifies only over `j < length`; it is the conjunction of the stored prefix conditions: sections on the sieve sets, `T_j ⊆ S`, unchanged image subgroups at omitted places. The raw `RawSieveStep` separately checks finite projection and allowed-class tables; transport from actual CN.3 quotient presentations remains an explicit gap. API: `candidates`, `candidates_eq_siftChain`, `Checked`, `candidates_eq_sieveSet`, `mk_aj_mem_candidates`, `chain`. Tests: `candidates_no_steps` (no places, chain `⊤` on `ℤ/2`: the single class), `candidates_mod_four` (one place, `X = {1}`, chain `0` on `ℤ/4`: `{1}`), `candidates_nonempty_without_points` (`ℤ/2`, local images `{0}` and `{1}`, no points: the candidate set is nonempty, so a nonempty candidate set is not a point).

**Soundness** (`ED.5/sieve-certificate-sound`; `SieveCertificate.isEmpty_of_candidates_eq_empty`, `SieveCertificate.mem_known_of_chabauty`; p.273, p.280). For a checked certificate over `J(ℚ)` or over `H` transported by `coprime-index-transfer`: (a) empty candidates give `C(ℚ) = ∅`; (b) in Chabauty mode with every candidate represented, `C(ℚ)` is the known list; (c) in height mode every point of height at most `H` is among the candidates of `height-bounded-points`. Each conclusion carries the certificate's assumptions — index and saturation, the rank and its conditionality label (`ED.3/rank-upper-bound`), primes, local images, chain.

**Worked statement** (`ED.5/small-genus-two-nonexistence`, an application; §4.1, §8). The 1492 genus-two curves `y² = f(x)` with `deg f ∈ {5, 6}` and coefficients in `{−3, …, 3}` left undecided by point search, local solubility and 2-cover descent have no rational point; ranks at most two used good information only, ranks three and four also bad and deep information, and some cases rest on BSD for the rank and are conditional. §8's census (521 curves of rank one, 514 decided while collecting information; 772 of rank two; 152 of rank three; two of rank four) is its acceptance test. The individual certificates are an unreplayed data obligation; ED.6 does not contain these1492 instances.

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
  (`PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/E4`; the bare labels E1–E8 in this section are that paper's errata, not the roadmap's EffectiveDiophantineMethods/E1–E28). A Tate class Z = Σ Z_ij ω_i ⊗ ω_j is recorded by
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
- **Semantic residue-disc certificate** (`SemanticQCDiscCertificate p ι`; node `ED.6/qc-disc-certificate`).
  Functions f_i : ℤ_p → ℚ_p (the determinants det T in the disc parameter, with coefficients
  known modulo p^N and the tail bound of `height-series-valuation-bound`), a finite set of
  centres, a precision n, a proof that every common zero is within p^(−n) of a centre, and a
  proof that each such ball contains at most one common zero. API: `exists_centre`,
  `eq_of_mem_ball`, `ncard_commonZeros_le` (at most #centres common zeros),
  `commonZeros_eq_empty`, `addFunction`. Tests: s − 1 with centre 1; the constant 1 with no
  centres; s(s − 17⁶) cannot be certified with one centre at precision 5; for a polynomial the
  count is bounded by `Polynomial.card_roots'`. These are proof-bearing semantic records. The numerical target `QCDiscCertificate` must instead take finite coefficient/tail data, a complete residue-ball tree and certified root multiplicities; its exact supplier-bound omission is listed below.
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
  The supporting linear-algebra record `ExplicitSetupLinearData` holds the residue matrix of the third-kind
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
  x ∈ D, which has a unique solution (the supporting `ExplicitSetupLinearData.eta_existsUnique`; the actual theorem retains `ExplicitSetup.eta_existsUnique` in the exact omission register). Inputs: Kim's
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
  to certified orders for all products of primitives and principal parts, η from (30), principal parts of g_x, then b_Fil and γ_Fil in a
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
  α = (I − F)⁻¹f(x_0) = ∫_{b_0}^{x_0} ω, β = gᵀ(F − p)⁻¹, γ = (gᵀα + h(x_0))/(1 − p); the intertwining identity is GS=S diag(1,F,p), so actual Frobenius G⁻¹ has
  graded matrix diag(1,F⁻¹,p⁻¹); at general
  points multiply by L(I(x_0, x)) R(I(b, b_0)) (E3), so α_φ(b, x) = ∫_b^x ω.
- **Local height at p** (`localHeight`, `localHeight_eq`; node `ED.6/local-height-at-p`, item
  /64, Lemma 5.5). h_p(A_Z(b, x)) = χ_p(γ_φ − γ_Fil − β_φᵀ s_1(α_φ) − β_Filᵀ s_2(α_φ)), from
  the NC.5 height formula (17) and D_cris(A_Z(b, x)) ≅ x^*A_Z (Lemma 5.4); on each disc a
  convergent power series.
- **Base-point change** (`baseChange_splitting_eq`; node `ED.6/base-point-change`, item /65,
  Lemma 5.7). For b' in a disc without poles: β_Fil(b') = β_Fil(b),
  γ_Fil(b', x) = γ_Fil(b, x) − γ_Fil(b, b'), and s_0⁻¹s^φ(b', b') has (3,2) block
  β_φ(b, b)ᵀ + 2∫_b^{b'} ωᵀZ; this handles discs where the lift is not defined.
- **Coefficient valuations** (`valuation_coeff_ge`; node `ED.6/height-series-valuation-bound`). For the actual QC function ρ=h−h_p on D⊂X(Q_p)∩]U[, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of ω,ωᵀZ; fixed End(J)-equivariant Hodge splitting), choose t at x1∈D, t(D)⊂pZ_p and Teichmüller x0. Use ord_p(0)=∞; for matrices/vectors use the minimum of entry valuations, including the diagonal1 of λφ so c1≤0. Certify c1=ord_p(λφ(x1)) by Frobenius evaluation and path-transport precision, v_spl=min valuation of the splitting coefficients, b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}, and c3=min_j ord_p(d_j) for the genuine global-height expansion h=Σd_jΨ_j. Let d_i(η) be certified lower bounds for the actual degree i−1 coefficient of η (all coefficient/coordinate changes included); the source uses a finite polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the actual model. With ℓ_i=⌊log_p i⌋ for i≥1 put φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}. The branches are φ(i)=d_i(η)−ℓ_i if d_i(η)<−ℓ_i, otherwise φ(i)=−2ℓ_i; the λφ coefficients have lower bound φ(i)+c1. Explicitly certify i0≥1 such that for every i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b and 2(−ℓ_i)≤a−c2 (the floor-half inequalities on publishedp1136). Then ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3} for i≥i0 (Proposition4.6). Coefficients0≤i<i0 require their own finite valuation certificates; all-zero βFil,γFil or global-height coefficients use∞ and omit vacuous comparisons instead of assigning integer0. The actual coordinate/differential estimates and algebraic cancellations proving this height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933 retain the separate helper iteratedIntegral_valuation_coeff_ge. The source notation φ in preprintv4p24 has an extra+c1 corrected in publishedp1136; use publishedφ and addc1 once to the splitting bound. This is Proposition4.6, not Proposition4.1; the latter evaluates G(P).
- **Root determination** (`roots_determined_of_truncation`; node
  `ED.6/root-determination-precision`, BDMTV 2021 Lemma4.7). For nonzero restricted
  F(pT), put k=min_i(v(F_i)+i), interpreting v(0)=∞. Require n−k>0 and a positive bound d
  for the closed-disc roots counted with multiplicity. The certified tail satisfies
  v(F_i)+i≥n for i≥m; the printed equality condition is insufficient (E21).
  Normalize G(T)=p^(−k)F(pT). An actual polynomial H over ℚ_p with
  Gauss norm ‖G−H‖≤p^(−(n−k)) has the same nonzero reduction and Weierstrass degree D≤d.
  Newton/Weierstrass perturbation must match their root multisets over completed ℂ_p
  within radius p^(−(n−k)/d); transport the balls by x=pT. A residue class solving a
  polynomial congruence supplies neither an actual root nor a lift multiplicity.
  The suggested helper `root_satisfies_truncation_congruence` gives only a necessary
  congruence for an existing root; the stronger target is omitted exactly in the register.
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
  width < 10^(−100), as a proposed numerical certificate. Central vanishing and the identified newform are separate inputs; positive derivative intervals alone prove neither. The rank-three target additionally needs an exact modular rank-one theorem over ℚ: GZ.8 and HE.7 require an admissible imaginary quadratic field, twist factorisation/nonvanishing, the Gross–Zagier trace and descent back to ℚ. The existing request names this missing interface; stage labels alone do not supply it. The ℚ(ζ_7)^+-structure on J(ℚ) ⊗ ℚ makes one point with
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


The full genus-three application uses the following models and source point lists.
Coordinates are projective classes; in each ordered list the first point is the cusp and
the other points have the listed CM discriminants in that order. Polynomial substitution
and distinct projective representatives are finite checks; they are not a completeness proof.

| N | QC prime | Homogeneous quartic Q_N (equation Q_N=0) |
| --- | --- | --- |
| 97 | 5 | zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y² |
| 109 | 29 | zx³+(zy+z²)x²+(−y³−zy²−z³)x−zy³−3z²y²−2z³y |
| 113 | 17 | zx³+(−y²−z²)x²+(y³+z³)x−2z²y²+z³y |
| 127 | 11 | zx³+(−y²−3z²)x²+(y³−z²y+4z³)x+2zy³−3z²y²+3z³y−2z⁴ |
| 139 | 19 | zx³+(−y²+zy)x²+(−y³−2zy²−3z²y−z³)x+y⁴+zy³+z²y²+z³y |
| 149 | 11 | zx³−y²x²+(y³+zy²−2z²y−z³)x−y⁴+zy³+z²y²−z³y |
| 151 | 19 | zx³+(−2zy+z²)x²+(−y³+2zy²)x−zy³+3z²y²−z³y−2z⁴ |
| 179 | 17 | zx³+(−2zy−z²)x²+(−y³−zy²−2z²y−z³)x−zy³+z³y |
| 239 | 13 | zx³+(−y²+zy+z²)x²+(−y³−zy²−z²y)x+y⁴+3zy³+2z²y²+z³y |

| N | Ordered rational points | CM discriminants after the cusp |
| --- | --- | --- |
| 97 | (1:0:0), (-2:1:1), (-1:0:1), (0:0:1), (0:1:0), (0:-1:1), (1:0:1), (1:1:1), (-1:1:0), (5:3:2) | -3, -4, -8, -11, -12, -16, -27, -43, -163 |
| 109 | (1:0:0), (-2:1:2), (0:-2:1), (0:-1:1), (0:1:0), (0:0:1), (-1:-1:1), (-2:1:1), (1:-1:1) | -3, -4, -7, -12, -16, -27, -28, -43 |
| 113 | (1:0:0), (2:2:1), (0:1:0), (1:1:1), (1:1:0), (0:0:1), (0:1:2), (5:3:1) | -4, -7, -8, -11, -16, -28, -163 |
| 127 | (1:0:0), (5:3:2), (2:1:1), (1:1:0), (1:0:1), (0:1:1), (0:1:0), (4:2:1) | -3, -7, -12, -27, -28, -43, -67 |
| 139 | (1:0:0), (4:-3:1), (0:0:1), (0:-1:1), (1:-1:1), (1:0:1), (-1:0:1) | -3, -8, -12, -19, -27, -43 |
| 149 | (1:0:0), (-1:0:1), (0:1:1), (1:0:1), (0:0:1), (0:-1:1), (2:2:1) | -4, -7, -16, -19, -28, -67 |
| 151 | (1:0:0), (-2:-2:1), (0:1:0), (0:2:1), (1:1:1), (2:3:2), (1:0:1), (3:2:1) | -3, -7, -12, -27, -28, -67, -163 |
| 179 | (1:0:0), (0:-1:1), (0:1:0), (0:0:1), (0:1:1), (-2:2:1) | -7, -8, -11, -28, -163 |
| 239 | (1:0:0), (-1:0:1), (0:0:1), (1:-2:1), (1:-1:1) | -7, -19, -28, -43 |

The quotient X0+(N) parametrizes unordered N-isogenous pairs. The j-map on X0(N)
does not generally descend to this quotient; cusp/CM labels use that quotient interpretation.

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
  solutions up to sign, the largest (48632, −3729) with value 2¹⁸·5¹³; the 1993 corrigendum first corrects c7 to1.08672·10⁴⁶ and B<1.511·10⁵⁰;
  the same first lattices give N1=1153 and H≤4919, below the old initial bound,
  so the original later reductions to113 and86 and the sieve apply. Alternatively
  the corrigendum’s Baker–Wüstholz constants restore9.844·10⁴⁹ directly (E29); the final test of each tuple is exact evaluation;
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

### Actual geometric signatures and supporting algebra

The pin does not supply the identified QC curve, mixed-connection, overconvergent bundle,
Frobenius/path, and Nekovář-height carriers required by these declarations. Following §13,
the exact original names below are omitted with their full mathematical inputs and outputs;
they are not implemented as arbitrary types with the target conclusion as a field.
The suggested file separately retains the finite-set and matrix arguments under narrower
names. Numerical zero tables, Hodge truncations, Tuitman data and root multiplicities remain
proof obligations even after these interfaces have been specified.

- **`ExplicitSetup`, `ExplicitSetup.residue_injective`, `ExplicitSetup.cupMatrix_eq`, `ExplicitSetup.functionField`, `ExplicitSetup.tateFrobenius`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Outputs are these actual identified geometric data, residue injectivity for the third-kind span and the displayed actual cup pairing; the separate ExplicitSetupLinearData only stores matrices.

- **`ExplicitSetup.eta_existsUnique`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Import NC.2 universal pointed A²_dR and NC.5 its pushout A_Z along V_dR⊗²→Q(1), factoring through coker(cup*). Construct s0:(Q⊕V_dR⊕Q(1))⊗O_Y≅A_Z|Y and the unique η in span(ω_{2g},…,ω_{2g+d−2}) such that ∇=d−[[0,0,0],[ω,0,0],[η,ωᵀZ,0]] extends nonsingularly over X. For dΩ_x=−ω, its actual residue conditions are Res_x(Ω_xᵀZ dΩ_x−η)=0. Existence uses the universal quotient extending over X and total-residue/cup compatibility; the sum-zero matrix solver alone proves only uniqueness/linear solvability. The result includes the geometric extension, trivialization and η, with gauges C_x and g_x in L((t_x)), dg_x=Ω_xᵀZ dΩ_x−η.

- **`hodgeFiltration_basis`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. With the actual gauges of the mixed connection, use the principal-parts exact sequence 0→L→Γ(Y_L,O)→⊕_{x∈D(L)} L((t_x))/L[[t_x]]→H¹(X_L,O)→0 and H¹_dR(X_L)/Fil¹≅H¹(X_L,O). The principal parts of the primitives of ω_g,…,ω_{2g−1} map to a basis of the last group. For N=(0,I)ᵀ prove existence and uniqueness of γ∈Γ(Y,O), b_Fil∈Q^g with γ(b)=0 and g_x+γ−b_FilᵀNᵀΩ_x−Ω_xᵀZNNᵀΩ_x regular at every boundary point. Descend from L by uniqueness. Prove that the subbundle spanned by1+γS,T_g+b_gS,…,T_{2g−1}+b_{2g−1}S extends over X and satisfies Hadian’s transversality, exact-sequence and pointed-identity conditions; hence it equals Fil⁰A_Z. Return the actual filtered isomorphism sFil with βFil=(0,b_Fil), not just a solution to a Laurent linear system.

- **`frobeniusStructure_eq`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Over Q_p take an actual strict neighborhood of the tube ]U[ in Y^an, its overconvergent structure sheaf, an overconvergent Frobenius lift φ reducing to p-power Frobenius, and a Teichmüller b0 in b’s disc. In the s0 coordinates of A_Z^rig, compute φ*ω=Fω+df with f(b0)=0, and FᵀZF=pZ. Define g0=−FᵀZf, ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω, and use actual rigid-cohomology reduction ξ=cᵀω+dh, h(b0)=0, to put g=g0+c. Identify the resulting G=[[1,0,0],[f,F,0],[h,gᵀ,p]] with Φ_Z⁻¹: ΛφG+dG=GΛ, and normalization1↦1 at b0. Uniqueness is among the graded-compatible morphisms of the actual pointed universal quotient. For the actual Frobenius Φ_Z the graded matrix is diag(1,F⁻¹,p⁻¹), while G has graded matrix diag(1,F,p). RD.7 must return coefficient, exactness and precision certificates for these actual overconvergent sections.

- **`frobeniusSplitting_eq`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. On the actual fibre x0* A_Z at a Teichmüller point x0, prove that the unique Frobenius-compatible unipotent splitting S=s0⁻¹sφ has α=(I−F)⁻¹f(x0), βᵀ=g(x0)ᵀ(F−pI)⁻¹, γ=(g(x0)ᵀα+h(x0))/(1−p). Its precise intertwining identity is G(x0)S=S diag(1,F,p), equivalently Φ_Z(x0)S=S diag(1,F⁻¹,p⁻¹). Weil weights prove invertibility of I−F,F−pI,1−p. For actual fibres at general b,x, Besser path transport gives S(b,x)=L(I(x0,x))R(I(b,b0))S(b0,x0); hence α(b,x)=∫_b^xω. The tuple solver alone does not identify any fibre or Coleman integral.

- **`localHeight`, `localHeight_eq`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Fix the actual NC.5 mixed extension A_Z(b,x), idèle class character χ with chosen p-adic logarithm branch, its additive factor χ_p on Q_p after the logarithm, and a splitting s of V_dR/Fil⁰V_dR with complementary projectors s1,s2. Use the cycle-compatible filtered φ-module comparison D_cris(A_Z(b,x))≅x* A_Z. For the actual Hodge and Frobenius splittings prove Nekovář h_p(A_Z(b,x))=χ_p(γφ−γFil−βφᵀs1(αφ)−βFilᵀs2(αφ)). Identify this locally analytic function with θ_Z in NC.5 and its actual convergent residue-disc expansion. The expression and quotient-coordinate helper are not a definition of the geometric height.

- **`baseChange_splitting_eq`**: Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. For b′∈X(Q_p) in a pole-free residue disc, use the actual NC.2/Besser path isomorphism v↦I(b,b′)vI(b′,b). On A_Z obtain βFil(b′)=βFil(b), γFil(b′,x)=γFil(b,x)−γFil(b,b′), and S(b′,b′)=[[1,0,0],[0,I,0],[0,βφ(b,b)ᵀ+2∫_b^{b′}ωᵀZ,1]]. These identities together with Coleman integrals and tiny integrals compute the local height on the b′ disc even when the original Frobenius lift is absent there. Global rational-point/NC.5 comparisons require rational b′ and transport of the endomorphism, Chow–Heegner constant and away-from-p height data; do not claim equality of the individual scalar height functions for different base points. Assert invariance of the underlying identified Chabauty–Kim locus, supplied by NC.5, rather than invariance of every auxiliary zero set.

- **`rationalPoints_eq_of_qcCertificate`**: Let X/Q be a smooth projective geometrically connected curve of genus g ≥ 2 with b ∈ X(Q), Jacobian J of rank r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*, ρ(J) ≥ 2, and p a prime of good reduction. Let Z_1, …, Z_k be nice classes and (θ_j, Υ_j) the quadratic Chabauty pairs of NC.5 with endomorphism E_j, constant c_j and pairing B_j (BDMTV Lemma 3.7, with Υ_j = {0} under potentially good reduction everywhere, Corollary 3.8). Suppose given: (a) a finite set L ⊆ X(Q) of verified rational points containing b and points P_1, …, P_m such that AJ_b(P_i) ⊗ (E_j(AJ_b(P_i)) + c_j) span E (or E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^* when the heights are K-equivariant); (b) for every x̄ ∈ X(F_p) and every choice (α_1, …, α_k) ∈ Υ_1 × ⋯ × Υ_k, a qc-disc-certificate on ]x̄[ for the family (det T_{j,α_j})_{j ≤ k} of the determinant criterion, whose power-series coefficients are computed by local-height-at-p and Coleman integration to the precision certified by height-series-valuation-bound; (c) for every centre of every disc certificate, a matching with an element of L or an exclusion. Then X(Q) = L, an unconditional certified solution set given the stated rank and Picard hypotheses (which are themselves certified inputs). If (b) or (c) fails for some disc, only L ⊆ X(Q) is asserted. The rational-point carrier is Hom_Q(Spec Q,X) and its injective image in Hom_Qp(Spec Q_p,X_Qp); residue discs are fibres of reduction from the chosen smooth proper Z_p-model. Require chart identifications with Z_p, actual NC.5 height/cycle/logarithm semantics for every determinant series, complete choices of away-from-p height values, finite coefficient/tail/tree certificates whose check_sound yields covers/uniqueness, and genuine geometric matching/sieve exclusions. If rank or supplier assertions remain conditional, the conclusion retains their conjunction as its label. QCRun.rational_eq_of_matched is only the final set-theoretic implication.

- **`xs13_tateClasses_admissible`**: For the actual Q-curve X_s(13) identified with xs13Quartic=0, its Jacobian J, the actual symplectic de Rham basis of the first chart and actual Hecke correspondences T7,T11 defined overQ, certify their exact matrices A7,A11. The trace-zero symmetric correspondences6T_q−tr(A_q)Id have zero cup contraction; construct their actual tensor cycle classes Z_q=(6A_q−tr(A_q)I)C⁻¹ and identify them entrywise with xs13Z1,xs13Z2. Prove these classes are nonzero, independent, in Fil¹, antisymmetric and cup-trivial and satisfy F_pᵀZ_qF_p=pZ_q after crystalline comparison at every prime of good reduction, in particular p=17. Exact Hecke reconstruction requires CN.3 bounds or q-expansion/duality certification; a finite p-adic approximation and the b–d checks alone do not supply condition(a).

- **`valuation_coeff_ge`, `qcValuation_lowDegree`, `qcValuation_branchBoundary`, `qcValuation_zeroCoefficient`**: For the actual QC function ρ=h−h_p on D⊂X(Q_p)∩]U[, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of ω,ωᵀZ; fixed End(J)-equivariant Hodge splitting), choose t at x1∈D, t(D)⊂pZ_p and Teichmüller x0. Use ord_p(0)=∞; for matrices/vectors use the minimum of entry valuations, including the diagonal1 of λφ so c1≤0. Certify c1=ord_p(λφ(x1)) by Frobenius evaluation and path-transport precision, v_spl=min valuation of the splitting coefficients, b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}, and c3=min_j ord_p(d_j) for the genuine global-height expansion h=Σd_jΨ_j. Let d_i(η) be certified lower bounds for the actual degree i−1 coefficient of η (all coefficient/coordinate changes included); the source uses a finite polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the actual model. With ℓ_i=⌊log_p i⌋ for i≥1 put φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}. The branches are φ(i)=d_i(η)−ℓ_i if d_i(η)<−ℓ_i, otherwise φ(i)=−2ℓ_i; the λφ coefficients have lower bound φ(i)+c1. Explicitly certify i0≥1 such that for every i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b and 2(−ℓ_i)≤a−c2 (the floor-half inequalities on publishedp1136). Then ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3} for i≥i0 (Proposition4.6). Coefficients0≤i<i0 require their own finite valuation certificates; all-zero βFil,γFil or global-height coefficients use∞ and omit vacuous comparisons instead of assigning integer0. The actual coordinate/differential estimates and algebraic cancellations proving this height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933 retain the separate helper iteratedIntegral_valuation_coeff_ge. The source notation φ in preprintv4p24 has an extra+c1 corrected in publishedp1136; use publishedφ and addc1 once to the splitting bound. This is Proposition4.6, not Proposition4.1; the latter evaluates G(P). Regression contracts: qcValuation_lowDegree rejects applying the tail formula to i<i0; qcValuation_branchBoundary identifies both formulas at d_i(η)=−floor(log_p i); qcValuation_zeroCoefficient uses∞ and does not call Padic.valuation(0).

- **`xs13_rationalPoints`**: On X_s(13)(Q)=Hom_Q(Spec Q,X_s(13)), use the certified R13.4a isomorphism to the smooth projective quartic xs13Quartic=0 in P²_Q. Let P_i be the projective classes of xs13Points(i), i=0,…,6. Prove X_s(13)(Q)={P_i}, with all seven distinct, by the actual seventeen first-chart discs, two second-chart discs and P0 disc at17, using the named geometric factory results. Through the actual modular j-map the set is one cusp and six CM points of discriminants−3,−4,−12,−16,−27,−43 and j-values0,1728,54000,287496,−12288000,−884736000. Require the j=0,1728 special-fibre moduli comparisons; no point-by-point matching of P_i to discriminants is claimed without the explicit j-map. The final mathematical theorem is unconditional; until rank/model/path/zero-table suppliers are discharged, its certificate carries their explicit conjunction. The arbitrary three-set union lemma is only the assembly argument.

- **`xns13_rationalPoints_card`**: For the actual modular Q-curve X_ns(13) and its rational-point carrier Hom_Q(SpecQ,X_ns(13)), construct Baran’s Q-isomorphism to X_s(13) from the certified two quartic models and projective GL3(Q) coordinate change. Transport the seven-point theorem to get #X_ns(13)(Q)=7. Through its own modular j-map, independently construct the seven CM points above discriminants−7,−8,−11,−19,−28,−67,−163; prove their distinctness and exhaustiveness. These have j-values−3375,8000,−32768,−884736,16581375,−147197952000,−262537412640768000 respectively. Do not give Baran’s isomorphism a modular interpretation or assert it preserves j. The unconstructed X_ns quartic/map and CM/moduli comparison remain supplier obligations, not an arbitrary finite-type equivalence hypothesis.

- **`xS4_13_rationalPoints`**: For the actual modular curve X_S4(13), identified with the smooth projective quartic xS4_13Quartic=0, prove its Q-points are exactly the four projective classes xS4_13Points: (1:3:−2),(0:0:1),(0:1:0),(1:0:0). The point(0:0:1) is CM of discriminant−3; the other three have projective mod13 imageS4, with the three j-values stated in this node. Inputs to the proof are the genuine isogeny to J_s(13), potential-good-reduction result, actual two affine patches from BDMTVv4§5.1p26, p=11,T11 andT11² classes, four-point height pairing, and certified complete common-zero/matching tables on every disc. The final theorem is unconditional; missing supplier proofs and unreplayed computations are recorded gaps. An arbitrary QCRun whose output is already assumed complete is not the application.

- **`x0plus_genusThree_rationalPoints`**: For each N∈{97,109,113,127,139,149,151,179,239}, let X=X0(N)/⟨w_N⟩ be the actual coarse smooth projective Q-curve and identify it with the corresponding explicit plane quartic in BDMTVv4 Examples5.7–5.15pp31–32. Prove equality of its Hom_Q(SpecQ,X) with exactly the projective classes in the following ordered source lists, with cusp/CM identification through the quotient modular interpretation (not a single descended j-map on X0+(N)). The exact nine quartics and ordered point/CM lists are in the tables above. The source counts are10,9,8,8,7,7,8,6,5 respectively. Require genuine rank/logarithm, endomorphism, model/reduction, local-height and two-cycle coefficient/zero/matching certificates for each N. Retain the modular rank-overQ and numerical replay gaps; do not generalize the ten-point97 helper to every level.

### Acceptance

- Every algorithm states its termination conditions and its unresolved inputs: the BDMTV 2021
  algorithm returns FAIL for exactly four reasons, its rank and local-height inputs are
  hypotheses, and every example theorem lists its certificate data.
- A finite set of p-adic candidates is compared with global points by
  `eq_of_matched_or_excluded` before any completeness claim; X_s(13) is the model case (20
  residue discs, 7 matched balls, all others excluded by the second Tate class).
- The worked-example targets require complete transcripts reproducing the published solution sets: 8 + 2 Thue solutions,
  22 integral points, 545 S-unit solutions, 72 Thue–Mahler solutions, 7 points on X_s(13) and on
  X_ns(13), 4 on X_S4(13), 10 on X_0^+(97).

## Inputs requested from other roadmaps

Each request gives the owning stage and the exact input needed. A requested stage is not an existing declaration. Fine node references are used when the retrieved supplier packet contains the required statement.

### 1. ComputationalNumberTheory:CN.4

Certified elementary-function enclosures on rational inputs: a construction logEnclosure x P returning, for rational x > 0 and precision P ∈ ℕ, a closed rational interval containing Real.log x of width at most 2^{−P} (failure as data for x ≤ 0), and arctanEnclosure x P returning a closed rational interval containing Real.arctan x of width at most 2^{−P}, each with its soundness theorem (Real.log x ∈ logEnclosure x P, Real.arctan x ∈ arctanEnclosure x P) and the width bound; π is enclosed as 4·arctanEnclosure(1, P + 2), using Mathlib's Real.arctan_one.

**Consumers:** `EffectiveDiophantineMethods:ED.2/certified-linear-form-constant`, `EffectiveDiophantineMethods:ED.2/certified-padic-linear-form-constant`, `EffectiveDiophantineMethods:ED.2/logarithm-enclosure`, `EffectiveDiophantineMethods:ED.2/s-unit-initial-bounds`.

### 2. HeightsRationalPointsAndObstructions:RP.1

For the Jacobian J of a smooth proper geometrically connected curve C over ℚ with C(ℚ) ≠ ∅ (J(ℚ) = Pic⁰ points as in JacobianChallenge Layer D): (a) J(ℚ) is a finitely generated abelian group; (b) for a prime q at which C has a smooth proper model, a reduction homomorphism J(ℚ) → J̃(𝔽_q) compatible with reduction of points and divisors, injective on torsion of order prime to q and on all torsion when q ≥ 3; (c) for an abelian variety A of dimension g over ℚ_p, A(ℚ_p) has an open subgroup of finite index isomorphic to ℤ_p^g, so #A(ℚ_p)/2A(ℚ_p) = |2|_p^{-g}·#A(ℚ_p)[2].

**Consumers:** `EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate`, `EffectiveDiophantineMethods:ED.3/genus-two-descent-rank-bound`, `EffectiveDiophantineMethods:ED.3/reduction-rank-lower-bound`, `EffectiveDiophantineMethods:ED.3/saturation-certificate`, `EffectiveDiophantineMethods:ED.3/torsion-by-reduction`.

### 3. HeightsRationalPointsAndObstructions:RP.1

For E : y² = x(x² + cx + d) over ℚ with the 2-isogeny φ : E → E′ (E′ : y² = x(x² − 2cx + c² − 4d)) and its dual φ′: the Kummer map E(ℚ)/φ′(E′(ℚ)) → H¹(ℚ, E′[φ′]) ≅ ℚ^×/ℚ^{×2} is (x, y) ↦ x (and (0,0) ↦ d); the φ′-Selmer group is the set of d₁ for which v² = d₁u⁴ + cu² + d/d₁ is everywhere locally soluble; and its quotient by the image of E(ℚ) is Ш(E′/ℚ)[φ′] (as defined in EllipticCurves Layer 7).

**Consumers:** `EffectiveDiophantineMethods:ED.3/lind-reichardt-torsor`.

### 4. HeightsRationalPointsAndObstructions:RP.0

Néron local heights on an elliptic curve E over a number field K: functions λ_v on E(K_v) ∖ {O} for each place v, with λ_v − ½log⁺|x|_v bounded, and ĥ(P) = [K:ℚ]^{-1} Σ_v n_v λ_v(P) for P ∈ E(K) ∖ {O}, where ĥ is Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight divided by [K:ℚ]; normalised as in Silverman, Math. Comp. 55 (1990) §3 (λ(2P) = 4λ(P) − log|ψ₂(P)|_v + ¼log|Δ|_v).

**Consumers:** `EffectiveDiophantineMethods:ED.3/explicit-height-difference-bound`.

### 5. ComputationalNumberTheory:CN.4

Certified rational enclosures of log n for positive integers n (and log of positive rationals): for requested precision P, rational endpoints ℓ ≤ log n ≤ u with u − ℓ ≤ 2^{−P}, with directed error bounds and no floating-point trust.

**Consumers:** `EffectiveDiophantineMethods:ED.3/canonical-height-enclosure`.

### 6. tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

For an elliptic curve over a finite field 𝔽_q, the group Ẽ(𝔽_q) as a finite abelian group with its order, and Hasse's bound |#Ẽ(𝔽_q) − q − 1| ≤ 2√q, used for targets of reduction maps and for the existence of 𝔽_q-points on smooth genus-one quartic models via their Jacobian.

**Consumers:** `EffectiveDiophantineMethods:ED.3/quartic-local-solubility-correct`, `EffectiveDiophantineMethods:ED.3/saturation-certificate`.

### 7. tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Over ℚ_p: the point-level reduction map E(ℚ_p) → Ẽ_ns(𝔽_p) on a minimal model as a group homomorphism on E₀(ℚ_p), the finite index of E₀(ℚ_p), and E₁(ℚ_p) ≅ Ê(pℤ_p) with the formal logarithm giving Ê(p^rℤ_p) ≅ ℤ_p for r ≥ 2.

**Consumers:** `EffectiveDiophantineMethods:ED.3/local-quotient-cardinality`, `EffectiveDiophantineMethods:ED.3/saturation-certificate`.

### 8. tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Mordell–Weil over ℚ (fg_point_of_numberField), the Lutz–Nagell integrality of torsion points on integral models, and injectivity of E(ℚ)_tors → Ẽ_ns(𝔽_p) at good odd primes p.

**Consumers:** `EffectiveDiophantineMethods:ED.3/rank-upper-bound`, `EffectiveDiophantineMethods:ED.3/torsion-by-reduction`.

### 9. tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

The cohomological 2-Selmer group Sel₂(E/ℚ) and Ш(E/ℚ)[2] with the exact sequence 0 → E(ℚ)/2E(ℚ) → Sel₂ → Ш[2] → 0, and its comparison with the explicit étale-algebra group selmerGroup₂; for the 2-isogeny φ′ the same for Sel^{(φ′)} and Ш[φ′].

**Consumers:** `EffectiveDiophantineMethods:ED.3/lind-reichardt-torsor`, `EffectiveDiophantineMethods:ED.3/two-selmer-certificate-sound`.

### 10. tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

For a smooth proper geometrically connected curve C over ℚ with a rational point, J(K) = Pic⁰_{C}(K) for fields K ⊇ ℚ as an abelian group of degree-zero divisor classes, functorial in K, so that J(ℚ) → J(ℚ_p) and divisor-class arithmetic are available.

**Consumers:** `EffectiveDiophantineMethods:ED.3/finite-index-subgroup-certificate`, `EffectiveDiophantineMethods:ED.3/genus-two-descent-rank-bound`, `EffectiveDiophantineMethods:ED.3/stoll-genus-four-subgroup`.

### 11. SchemeAndStackFoundations:SF.3

For a smooth projective geometrically integral curve X of genus g over a field k with a rational point O and its Jacobian J (JacobianChallenge layers D–F): (i) the pullback ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) along P ↦ [P − O] is an isomorphism and does not depend on O; (ii) Riemann–Roch consequences: a nonzero regular differential has a divisor of degree 2g − 2, so Σ_{x ∈ X(k)} ord_x ω ≤ 2g − 2; and every degree-zero class D satisfies D + g·O ∼ E with E effective of degree g.

**Consumers:** `EffectiveDiophantineMethods:ED.4/abelian-integral`, `EffectiveDiophantineMethods:ED.4/coleman-bound`, `EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation`.

### 12. SchemeAndStackFoundations:SF.3

For a smooth projective curve 𝒳 over a discrete valuation ring R (in particular ℤ_p) with geometrically connected fibres: specialisation of effective divisors from the generic to the special fibre preserves degree and linear equivalence, and h⁰ of line bundles is upper semicontinuous; Hensel lifting of smooth points of the special fibre to R-points. For a regular proper model 𝒳 → Spec R (a local complete intersection morphism): the canonical sheaf ω_{𝒳/R}, its identification with Ω¹ on the smooth locus, and its compatibility with flat base change (Liu, Algebraic Geometry and Arithmetic Curves, Definition 6.4.7 and Theorem 6.4.9).

**Consumers:** `EffectiveDiophantineMethods:ED.4/bad-reduction-bound`, `EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation`.

### 13. SchemeAndStackFoundations:SF.3

The symmetric square X⁽²⁾ of a smooth projective curve X over a field k as a smooth projective surface whose k-points are the Gal(k̄/k)-stable effective divisors of degree 2, with the morphism X⁽²⁾ → Pic² and its injectivity when X is not hyperelliptic.

**Consumers:** `EffectiveDiophantineMethods:ED.4/symmetric-square-chabauty-datum`.

### 14. HeightsRationalPointsAndObstructions:RP.1

The Mordell–Weil theorem for abelian varieties over number fields: for an abelian variety A over a number field K (in ED.4, the Jacobian of a smooth projective curve over ℚ), A(K) is a finitely generated abelian group.

**Consumers:** `EffectiveDiophantineMethods:ED.4/chabauty-finiteness`, `EffectiveDiophantineMethods:ED.4/padic-closure-dimension`.

### 15. DeligneWeightsAndPurity:DWP.1

For an abelian variety A over F_q, construct its degree-2 dim(A) integral Frobenius characteristic polynomial P and the faithful Tate-realization comparison proving P(pi_A)=0 in End(A). Prove the Weil estimate that every complex embedding of each Frobenius eigenvalue has absolute value sqrt(q), with explicit Tate-module versus dual H^1 and arithmetic/geometric Frobenius conventions. The read DWP.1 stage owns the polarized-Rosati proof and these realization comparisons. There is no current fine node named DWP.1/weil-estimate-for-abelian-varieties in the frozen packet, decomposition or reserved-ID catalogs; this is an exact stage request, not an existing declaration.

**Consumers:** `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`.

### 16. tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Pic⁰ of a smooth proper geometrically connected curve over a field (ℚ, ℚ_p, 𝔽_p) as its Jacobian, with points the degree-zero divisor classes when the curve has a rational divisor of degree one; the Abel maps Sym^d X → Pic^d on symmetric powers.

**Consumers:** `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`, `EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve`.

### 17. tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties

The Jacobian over 𝔽_p and over ℚ_p as an abelian variety; J(𝔽_p) is a finite group.

**Consumers:** `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`, `EffectiveDiophantineMethods:ED.5/padic-quotient-sieve-datum`.

### 18. tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property

For a curve of genus at least one with a rational point x₀, the Abel–Jacobi morphism is a closed immersion (the Layer F acceptance criterion); in particular x ↦ [x − x₀] is injective on k-points, used over 𝔽_p.

**Consumers:** `EffectiveDiophantineMethods:ED.5/chabauty-sieve-combination`, `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`.

### 19. tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

Regular proper models and smooth proper models of curves over ℤ_(p) or ℤ_p, with the reduction of rational points through sections, and the regularity notion of the hypothesis of Bruin–Stoll Corollary 5.15.

**Consumers:** `EffectiveDiophantineMethods:ED.5/genus-two-bad-information`, `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`.

### 20. tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

The reduction map on points E(ℚ_p) → Ẽ(𝔽_p) for a minimal Weierstrass equation with good reduction, as a group homomorphism with kernel E₁(ℚ_p).

**Consumers:** `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`.

### 21. tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves

Hyperelliptic models y² = f(x) with f squarefree of degree 2g + 1 or 2g + 2, the genus formula, and the places at infinity (one for odd degree; two, or a conjugate pair, for even degree).

**Consumers:** `EffectiveDiophantineMethods:ED.5/genus-two-bad-information`, `EffectiveDiophantineMethods:ED.5/integral-points-completeness`, `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`, `EffectiveDiophantineMethods:ED.5/kummer-curve-test`.

### 22. NeronModelsAndSemistableAbelianVarieties:R11.4

For a smooth proper curve 𝒞 over a discrete valuation ring R with geometrically connected fibres (in particular R = ℤ_(p)): Pic⁰ of 𝒞/R is an abelian scheme over R whose generic fibre is the Jacobian of 𝒞_K and whose special fibre is the Jacobian of 𝒞_k; and for a horizontal relative divisor 𝒟 of degree zero on 𝒞 the class of 𝒪(𝒟) in Pic⁰(R) restricts to [𝒟_K] and [𝒟_k]. This is the smooth case of R11.4's degree-zero Picard of a semistable curve, over a general DVR rather than a strictly henselian one.

**Consumers:** `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`.

### 23. HeightsRationalPointsAndObstructions:RP.0

The Néron–Tate canonical height ĥ on A(K) for an abelian variety A over a number field K with a symmetric ample class (for Jacobians, the theta class): ĥ is a quadratic map over ℤ (ĥ(nx) = n²ĥ(x) and the parallelogram law), ĥ ≥ 0, ĥ(x) = 0 iff x is torsion, and ĥ − h is bounded for the naive height of a symmetric projective embedding.

**Consumers:** `EffectiveDiophantineMethods:ED.5/height-bounded-points`, `EffectiveDiophantineMethods:ED.5/integral-points-completeness`.

### 24. AnabelianGeometryAndNonabelianChabauty:NC.5

From AnabelianGeometryAndNonabelianChabauty NC.5 (BDMTV 2019 items /11–/13, /20–/23, /32–/37, /46–/48, /62, /84): (a) quadratic Chabauty pairs and the determinant criterion (BDMTV §1.4 (5), Lemma 1.5), with the K-equivariant variant replacing E by H⁰(Ω¹)^* ⊗_{K⊗Q_p} H⁰(Ω¹)^* when the splitting of the Hodge filtration is K-equivariant (Remark 1.6, §1.7, Remark 3.9); (b) Lemma 3.7 and Corollary 3.8: for r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^* and a nice class Z, θ = h_p(A_Z(b, ·)) and Υ = {Σ_{v∈T_0} h_v(A_Z(b, x_v))} form a quadratic Chabauty pair with endomorphism induced by Z, constant [IA_Z(b)] and pairing the global height, using only κ(J(Q)) ⊗ Q_p (correction E8); Υ = {0} under potentially good reduction everywhere (Lemma 3.2); the zero set is independent of the splitting and of the idèle class character (Remarks 3.10, 3.12); (c) the filtered F-isocrystal A_Z (pushout of A_2^dR along Z, (25)), the comparison D_cris(A_Z(b, x)) ≅ x^*A_Z of filtered φ-modules (Lemma 5.4) and Nekovář's local height formula (17); (d) Theorem 2.3: r < g + ρ − 1 implies X(Q_p)_2 finite, with X(Q) ⊆ X(Q_p)_2 ⊆ X(Q_p)_{U_Z}; (e) the class of a nice correspondence satisfies (a)–(d) (forward direction of Lemma 4.7 only, E5), and 6T_q − tr(T_q) on a modular curve with absolutely simple Jacobian is nice; (f) BDMTV 2021 Theorem 3.2: local heights away from p via a regular semistable model.

**Consumers:** `EffectiveDiophantineMethods:ED.6/explicit-connection`, `EffectiveDiophantineMethods:ED.6/explicit-setup`, `EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix`, `EffectiveDiophantineMethods:ED.6/hodge-filtration-explicit`, `EffectiveDiophantineMethods:ED.6/local-height-at-p`, `EffectiveDiophantineMethods:ED.6/qc-certificate-sound`, `EffectiveDiophantineMethods:ED.6/qc-modular-algorithm`, `EffectiveDiophantineMethods:ED.6/xs13-equivariant-height-matrices`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`.

### 25. AnabelianGeometryAndNonabelianChabauty:NC.2

From AnabelianGeometryAndNonabelianChabauty NC.2 (BDMTV 2019 items /40–/45, /54–/57, /93): Kim's universal pointed unipotent connection A_n^dR(Y) = ⊕_{i≤n} V_dR(Y)^{⊗i} ⊗ O_Y with ∇ as in (21) and its universal property for pointed objects with v in the fibre at b (Theorem 4.2 corrected as in E6); Corollary 4.4 (A_n^dR(X)|_Y is the maximal quotient extending holomorphically to X); path composition (Lemma 4.3); Hadian's characterisation of the Hodge filtration (Theorem 4.5); the Frobenius structure on A_n^rig(b), unique with 1 ↦ 1 (Lemma 5.2), and Chiarellotto–Le Stum (Theorem 5.3); Besser's identification of v ↦ I(x_0, x)·v·I(b, b_0) with the unique unipotent Frobenius-equivariant isomorphism between path spaces (41) (item /93); and for a smooth projective curve X/Q the description of H¹_dR(X/Q) by differentials of the second kind modulo exact ones on an affine open, with Fil¹ = H⁰(X, Ω¹) and H¹_dR(X)/Fil¹ ≅ H¹(X, O_X) realised by the principal parts of local primitives (Mittag-Leffler; Tau Ceti AlgebraicCurves Layer 4 repartitions are the natural input).

**Consumers:** `EffectiveDiophantineMethods:ED.6/base-point-change`, `EffectiveDiophantineMethods:ED.6/explicit-connection`, `EffectiveDiophantineMethods:ED.6/explicit-setup`, `EffectiveDiophantineMethods:ED.6/frobenius-equivariant-splitting`, `EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix`, `EffectiveDiophantineMethods:ED.6/hodge-filtration-explicit`, `EffectiveDiophantineMethods:ED.6/transport-matrices`.

### 26. ComputationalNumberTheory:CN.5

From ComputationalNumberTheory CN.5: the certificate schema for an explicit Diophantine example — pinned exact input data (polynomials, points, matrices over Q and number fields, lattice bases, exponent bounds), the arithmetic conventions, and a verification relation checked in Lean whose soundness theorem is the mathematical claim (a finite solution set with soundness and completeness under stated hypotheses, as in ED.6/certified-solution-set); CAS or database output enters only as data to verify.

**Consumers:** `EffectiveDiophantineMethods:ED.6/certified-solution-set`.

### 27. ComputationalNumberTheory:CN.4

From ComputationalNumberTheory CN.4: certified rational enclosures, of width < 10^(−100), of L(g, 1) and L'(g, 1) for a weight-two newform g of level N with coefficients in a totally real number field and for each real embedding of the coefficient field, using the functional equation with the Atkin–Lehner sign (the level-N and algebraic-coefficient refinements of CN.4/cusp-l-value-enclosure); instances: N = 169 with coefficient field Q(ζ_7)^+, and the newforms of the genus-three prime levels of x0plus-genus-three-points.

**Consumers:** `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`, `EffectiveDiophantineMethods:ED.6/xs13-analytic-rank-certificate`.

### 28. ComputationalNumberTheory:CN.3

From ComputationalNumberTheory CN.3: (a) the newforms of S_2(Γ_0(169))^{w_169 = +1}: one Galois orbit of dimension 3 with coefficient field Q(ζ_7)^+ and q-expansions to any requested precision, with certified Hecke data; (b) the Sturm bound for Γ_0(169) in weight 8 (a form vanishing at ∞ to order > 8·182/12 is zero), used to certify the quartic relation of Baran's model; (c) the exact rational matrices of the Hecke operators T_3, T_7, T_11 on H¹_dR(X_s(13)/Q) in the basis ω of BDMTV §6.4, certified either from q-expansions and cup-product duality or from Eichler–Shimura with Frobenius computed to a precision exceeding a proved height bound for the entries.

**Consumers:** `EffectiveDiophantineMethods:ED.6/xs13-endomorphism-algebra`, `EffectiveDiophantineMethods:ED.6/xs13-plane-model`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`, `EffectiveDiophantineMethods:ED.6/xs13-equivariant-height-matrices`.

### 29. ComputationalNumberTheory:CN.2

From ComputationalNumberTheory CN.2: (a) the unit group of the order R = Z + Zϑ + Z(ϑ²/2) + Z(ϑ³/2) of Q(ϑ), ϑ⁴ − 12ϑ² − 8ϑ + 4 = 0, is {±1} × ⟨1 + ϑ, 3 + ϑ, ϑ²/2⟩ (certificate for an order: the unit group of the maximal order via CN.2/units-complete-of-regulator-bound and the index of R^× in it, or Billevič's criterion of Tzanakis–de Weger Appendix I); (b) the class numbers of the imaginary quadratic fields with |D| ≤ 52.

**Consumers:** `EffectiveDiophantineMethods:ED.6/class-number-one`, `EffectiveDiophantineMethods:ED.6/thue-example-tdw89`.

### 30. PadicDifferentialEquationsAndRigidCohomology:RD.7

From PadicDifferentialEquationsAndRigidCohomology RD.7 (BDMTV 2019 item /95): the certified Tuitman algorithm for a plane model monic in y satisfying Tuitman II Assumption 1 as corrected in June 2020 — an overconvergent Frobenius lift with Φ(x) = x^p, the matrix F of Frobenius on H¹_rig in a given basis of algebraic differentials, the overconvergent primitives f with Φ^*ω = Fω + df and the primitives g, h of (45), with proved precision.

**Consumers:** `EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix`, `EffectiveDiophantineMethods:ED.6/qc-modular-algorithm`, `EffectiveDiophantineMethods:ED.6/xs13-first-chart-frobenius`, `EffectiveDiophantineMethods:ED.6/xs13-p0-disc`, `EffectiveDiophantineMethods:ED.6/xs13-second-chart-points`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`.

### 31. GrossZagierAndArithmeticHeights:GZ.8

From GrossZagierAndArithmeticHeights GZ.8 (BDMTV 2019 items /79, /97): for a weight-two newform f of level N with trivial character whose conjugates f^σ all have a simple zero at s = 1, rk A_f(Q) = dim A_f and Sha(A_f/Q) is finite, through an admissible imaginary quadratic field K with the required analytic rank of L(A_f/K, s), the non-torsion trace point (GZ.8/totally-real-trace-point-nontorsion with F = Q, B = M_2(Q)), HeegnerPointEulerSystems HE.7/admissible-rm-kolyvagin-logachev, and descent from K to Q; instances N = 169 and the genus-three prime levels. The read HE.7 export requires End_F(A)=O_L; for a nonmaximal endomorphism order, provide the fixed isogeny and local degree comparisons stated by that supplier before application. The admissible field/level, nonzero integral Hecke quotient, Hodge normalization, no-CM condition, non-torsion trace and descent from K to Q all remain explicit; the supplier rank over K alone is not the asserted rank over Q.

**Consumers:** `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`, `EffectiveDiophantineMethods:ED.6/xs13-rank-three`.

### 32. ModularCurvesPartII:R13.4a

From ModularCurvesPartII R13.4a (BDMTV 2019 items /1, /71): (a) X_s(ℓ) ≅ X_0(ℓ²)/w_{ℓ²} over Q; (b) for H = C_s^+(ℓ) or C_ns^+(ℓ), a non-cuspidal x ∈ X_H(Q) with j(x) ∉ {0, 1728} corresponds to an elliptic curve E/Q with j(E) = j(x) and ρ_{E,ℓ}(G_Q) conjugate into H, and conversely; (c) X_s(ℓ) has a Q-rational cusp (the image of the cusps 0 and ∞ of X_0(ℓ²)); (d) for ℓ = 13 the fibres of X_s(13) above j = 0 and j = 1728 contain Q-rational points; (e) the genus of X_0(4), X_0(9), X_0(25) is 0, the genus of X_0(49) is 1, and w_49 has h(−196) = 4 fixed points on X_0(49).

**Consumers:** `EffectiveDiophantineMethods:ED.6/class-number-one`, `EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13`, `EffectiveDiophantineMethods:ED.6/small-prime-split-cartan`, `EffectiveDiophantineMethods:ED.6/split-cartan-classification`, `EffectiveDiophantineMethods:ED.6/xs13-plane-model`, `EffectiveDiophantineMethods:ED.6/xs13-rational-points`.

### 33. ModularCurvesPartII:R13.5

From ModularCurvesPartII R13.5 (BDMTV 2019 items /72–/76): X_s(13) has potentially good reduction at 13 (Corollary 6.7, with good reduction away from 13 taken from the first Baran model, E12); and for prime N, X_0^+(N) has a regular semistable model over Z_N with irreducible special fibre (BDMTV 2021 Lemma 5.2, Xue), so the local height at N is trivial.

**Consumers:** `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`, `EffectiveDiophantineMethods:ED.6/xs13-equivariant-height-matrices`, `EffectiveDiophantineMethods:ED.6/xs13-rational-points`.

### 34. ModularCurvesPartII:R14.5

From ModularCurvesPartII R14.5: End(A_f) ⊗ Q ≅ K_f, and End(A_f ×_Q Q̄) ⊗ Q ≅ K_f when f has neither CM nor inner twists (Shimura Th. 7.14, Ribet Cor. 4.2), for the level-169 newform orbit of xs13-endomorphism-algebra; and Jac(X_0^+(N)) is isogenous to the product of the A_f for the newform orbits with w_N-eigenvalue +1. The actual weight-two construction must identify A_f as the Hecke-ideal quotient of J_1(N), and of J_0(N) in the trivial-character branch; prove dim A_f=[K_f:Q], the differential/newform comparison and the precise quotient/isogeny maps. These are requested from the existing R14.5 stage: the inherited fine identifiers modular-quotient, modular-quotient-dimension and trivial-character-J0 do not occur in the frozen catalog. No higher-weight Jacobian quotient is asserted.

**Consumers:** `EffectiveDiophantineMethods:ED.6/xs13-endomorphism-algebra`, `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`.

### 35. ComputationalNumberTheory:CN.2

Finite raw companions of the existing integral-basis, prime-ideal-factor, class-relation-quotient and certified-class-unit-completeness contracts: exact integral-basis multiplication and ideal-coordinate matrices; primality/residue-field and complete ideal-product checks; principal fractional-ideal generators and class-remainder enumeration; a complete factor base/relation quotient with its surjection; exactly Units.rank K independent units plus all torsion units; rational regulator and analytic class-number bounds with proved remainders, sufficient for the strict index<2 stopping inequality. Return finite records and their check/soundness bridge to the native ideals, class group and unit group. Existing proof-bearing mathematical records and completeness theorems do not themselves provide a raw finite replay interface. ED.2 only combines these suppliers into equation-specific coverings and bound/reduction/search transcripts.

**Consumers:** `EffectiveDiophantineMethods:ED.2/thue-factor-covering`, `EffectiveDiophantineMethods:ED.2/thue-analytic-constants`, `EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering`, `EffectiveDiophantineMethods:ED.2/thue-certificate`, `EffectiveDiophantineMethods:ED.2/thue-mahler-certificate`.

### 36. ComputationalNumberTheory:CN.0

For ED.4 finite residue-disc verification, extend the exact algebraic-root/equality presentation to finite number-field points together with a chosen embedding into ℚ_p certified by a polynomial and isolating p-adic ball. Supply finite exact equality/distinctness, rationality or nonrationality witnesses, and sound evaluation of finite polynomial/group-relation transcripts. Existing CN.0/algebraic-root-certificate isolates in ℂ and CN.0/padic-approximation only denotes a ball; neither alone supplies a compatible ℚ_p embedding or proves that an analytic zero is algebraic. No generic p-adic root is assumed to have such a presentation.

**Consumers:** `EffectiveDiophantineMethods:ED.4/residue-disc-verdict`.

### 37. ComputationalNumberTheory:CN.4

For ED.4 finite residue-disc verification, supply terminating finite p-adic coefficient-enclosure arithmetic for affine substitutions t=p(a+p^k u), with sound common-precision residue tables and a finite transcript validating a strict tail bound. The source-owned geometric primitive/coefficient interpretation remains ED.4/ColemanIntegration. The basic ED.4 integral-derivative root-tail rule v_p(b_n)≥s+n−v_p(n), n≥1, supplies one explicit constructor; general analytic tails or subdivision transformations require their own soundness theorem. Existing CN.4/padic-normalization, /padic-add, /padic-mul and /padic-inverse provide scalar ball arithmetic, not this series or tail interface. Also certify restrictedness of the rescaled series; a uniform strict tail bound alone does not imply coefficient convergence.

**Consumers:** `EffectiveDiophantineMethods:ED.4/residue-disc-verdict`.

### 38. ModularCurvesPartII:R14.6

Construct the special-fibre Eichler-Shimura correspondence identity, with actual Hecke correspondences, Frobenius/dual conventions, smooth or semistable model and the comparison with the Jacobian/de Rham or crystalline realization used here. Supply the bad-prime patching and cusp/Abel-Jacobi compatibilities under the stated level hypotheses. R14.6 is an existing owning stage; the inherited fine identifier special-fibre-eichler-shimura is absent from the frozen packet/decomposition/reserved catalog. The QC algorithm and its T7/T11 Tate classes require the actual identity and comparison, not merely a matrix that satisfies a linear relation.

**Consumers:** `EffectiveDiophantineMethods:ED.6/qc-modular-algorithm`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`.

### 39. ModularCurvesPartII:R13.4a

Construct the actual algebraic coarse modular curves and finite quotient morphisms for X_0(N)/<w_N>, N in {97,109,113,127,139,149,151,179,239}, and for the exceptional subgroup whose projective mod-13 image is S4. Use the existing R13.4a coarse-space program on the genuine modular stack presentations, with finite inertia, properness/normality and required base-change hypotheses. Return smooth projective Q-curves with the quotient maps and their defining moduli problems. This is an explicitly open extension of the existing Cartan request, not a claim that these fine models have a current blueprint node or pinned declaration. ED.6 combines this algebraic object with CN.3 exact q-expansion/model reconstruction to certify the particular printed plane quartics.

**Consumers:** `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`, `EffectiveDiophantineMethods:ED.6/xs4-13-rational-points`.

### 40. ModularCurvesPartII:R13.4b

For the R13.4a Cartan, exceptional S4(13), and X_0(N)/<w_N> coarse curves, supply the generic-fibre/moduli/correspondence comparison, components and determinant data, cusp fields and the geometric identification of the listed cusp and CM fibres. In the X_0(N)/<w_N> case the interpretation is an unordered N-isogenous pair; the function j on X_0(N) does not generally descend to one j-map on the quotient. For S4(13) certify the actual modular j-map and its three non-CM projective-S4 fibres together with the CM fibre. Use the true coarse moduli fibres also at j=0 and1728. The R13.4b stage exists but these explicit comparisons remain supplier obligations.

**Consumers:** `EffectiveDiophantineMethods:ED.6/xs13-rational-points`, `EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13`, `EffectiveDiophantineMethods:ED.6/xs4-13-rational-points`, `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`.

## Declaration APIs and test contracts

This register fixes the proposed names and mathematical behavior of every API and test in the packet. The Lean companion gives prototypes or the exact omission listed below. Tests are contracts for discriminating examples; their presence does not assert that Lean has checked them.

### ED.0/certified-enclosure

Certified enclosures and the precision contract

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.RealEnclosure` | structure | A rational interval [l, u] together with proofs l ≤ t and t ≤ u in ℝ. |
| `TauCeti.EffectiveDiophantine.ED0.RealEnclosure.width` | data | The rational error bound u − l; it is nonnegative. |
| `TauCeti.EffectiveDiophantine.ED0.RealEnclosure.abs_sub_le` | characterisation | For every rational q with l ≤ q ≤ u, \|t − q\| ≤ width. |
| `TauCeti.EffectiveDiophantine.ED0.RealEnclosure.ofRat` | constructor | For q ∈ ℚ the degenerate interval [q, q] encloses (q : ℝ) with width 0, hence every precision. |
| `TauCeti.EffectiveDiophantine.ED0.RealEnclosure.widen` | other | An interval containing a RealEnclosure's interval is again a RealEnclosure of the same number. |
| `TauCeti.EffectiveDiophantine.ED0.ComplexEnclosure` | structure | A pair of rational intervals (R, I) with Re z ∈ R and Im z ∈ I. |
| `TauCeti.EffectiveDiophantine.ED0.ComplexEnclosure.mem_box` | characterisation | z belongs to the box {w : Re w ∈ R, Im w ∈ I}. |
| `TauCeti.EffectiveDiophantine.ED0.ComplexEnclosure.normSq_le` | characterisation | \|z\|² ≤ max(l_R², u_R²) + max(l_I², u_I²), a rational upper bound for \|z\|². |
| `TauCeti.EffectiveDiophantine.ED0.ComplexEnclosure.toRealEnclosure` | projection | When I = [0, 0], R is a RealEnclosure of Re z. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEnclosure` | structure | A rational centre c and an integer N with ‖x − c‖ ≤ p^(−N). |
| `TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.ofRat` | constructor | For q ∈ ℚ and every N, (q, N) encloses (q : ℚ_[p]). |
| `TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.toPadicApproximation` | compatibility | The canonical CN.0 PadicApproximation record of (c, N) denotes the closed ball of radius p^(−N) about c, which contains x. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.centre_ball_mem` | characterisation | The certified value lies in the rational-centred closed ball of radius p^(-N). This is supporting membership, not the CN.0 carrier adapter. |

| Test | Kind | Required behavior |
|---|---|---|
| `realEnclosure_sqrt_two` | computation | [141/100, 142/100] is a RealEnclosure of √2 with width 1/100; since 1/100 ≤ 2^(−6) it has absolute precision 6 but not 7. |
| `realEnclosure_ofRat_width` | degenerate | RealEnclosure.ofRat q has width 0 for every rational q. |
| `complexEnclosure_I` | computation | ([0, 0], [1, 1]) is a ComplexEnclosure of Complex.I. |
| `padicEnclosure_nine` | non-example | At p = 3, the zero-centred ball (0, 2) encloses 9 although 9 ≠ 0: a zero-centred enclosure does not certify vanishing. |
| `realEnclosure_overlap` | non-example | [1, 2] is a RealEnclosure of both 1 and 2, so a common enclosure does not prove equality. |
| `padicEnclosure_normalize_five` | compatibility | At p = 3 the enclosure (5, 1) has canonical CN.0 record (N, v, s) = (1, 0, 2): the balls of radius 1/3 about 5 and about 2 coincide. |
| `padicEnclosure_normalize_zero` | degenerate | At p = 3, centre c = 0 and precision N = 2, the canonical CN.0 record is (N, v, s) = (2, 2, 0). The pinned totalized padicValRat 3 0 = 0 must not select v = 0: a v &lt; N record requires a nonzero residue prime to p. |

### ED.0/isolating-interval-refinement

Refinement of isolating intervals by exact bisection

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation` | structure | A nonzero rational polynomial g and a rational interval containing exactly one real root of g; the record stores polynomial_ne_zero : g ≠ 0. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.root` | projection | The isolated real root. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.root_spec` | characterisation | g(I.root) = 0 and I.root lies in I.interval. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.root_unique` | extensionality | Any real root u of g lying in I.interval equals I.root. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.refine` | data | The bisection refinement after n steps. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.refine_root` | simp | (refine I n).root = I.root. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.refine_width` | other | The width of refine I n is at most 2^(−n) times the width of I. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.toEnclosure` | coercion | An isolation is a RealEnclosure of its root. |
| `TauCeti.EffectiveDiophantine.ED0.RealRootIsolation.ofRealCertificate` | constructor | A CN.0 certificate (h, R, I) whose root is real yields the isolation (h, R). |

| Test | Kind | Required behavior |
|---|---|---|
| `refine_sqrt_two` | computation | For X² − 2 and [1, 2], refine 3 is [11/8, 3/2]. |
| `refine_exact_rational` | degenerate | For X − q and [q, q], refine n is [q, q] for every n. |
| `refine_midpoint_root` | computation | For X − 1/2 and [0, 1], refine 1 is [1/2, 1/2]. |
| `isolation_two_roots` | non-example | [−2, 2] is not an isolating interval for X² − 2: it contains ±√2. |
| `refine_toEnclosure` | compatibility | (refine I n).toEnclosure is a RealEnclosure of I.root of width at most 2^(−n)·width(I). |
| `isolation_zero_polynomial` | non-example | RealRootIsolation (0 : ℚ[X]) is empty, including for a singleton interval: the polynomial must be nonzero. |

### ED.0/archimedean-embedding-certificate

Archimedean embeddings pinned by isolating boxes

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate` | structure | The data (R, I) and a proof that exactly one complex root of minpoly ℚ pb.gen lies in the box. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.root` | projection | The unique root z in the box. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.embedding` | data | σ_c = PowerBasis.lift pb z as a ring homomorphism K →+* ℂ. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.embedding_gen` | simp | σ_c(pb.gen) = z. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.eq_embedding_of_mem` | extensionality | If σ : K →+* ℂ sends pb.gen into the box then σ = σ_c. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.exists_of_embedding` | constructor | Every σ : K →+* ℂ is σ_c for some certificate c. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.isReal_of_symmetric` | characterisation | If I = [−b, b] then ComplexEmbedding.IsReal σ_c. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.infinitePlace_apply` | compatibility | InfinitePlace.mk σ_c α = ‖σ_c α‖. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.norm_sub_eval_le` | characterisation | \|σ_c(α) − Σ_j a_j w^j\| ≤ 2r·Σ_j j\|a_j\|M^(j−1) for the box centre w and M = \|w_1\| + \|w_2\| + 2r. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.refine` | constructor | A certificate with box widths at most 2^(−n) and the same root, from ED.0/isolating-interval-refinement. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.complete_of_disjoint` | characterisation | A family of [K : ℚ] certificates with pairwise disjoint boxes contains every embedding K →+* ℂ. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.evalEnclosure` | data | A ComplexEnclosure of σ_c(α) of absolute precision n, computed from a refined certificate. |
| `TauCeti.EffectiveDiophantine.ED0.ArchimedeanEmbeddingCertificate.evalEnclosure_width` | other | Both widths of evalEnclosure α n are at most 2^(−n). |

| Test | Kind | Required behavior |
|---|---|---|
| `archimedean_sqrt_two` | computation | For minpoly ℚ θ = X² − 2 and the box [1, 2] × [0, 0], σ_c(θ) = √2 and σ_c(1 + θ) = 1 + √2. |
| `archimedean_sqrt_two_real` | characterisation | The box [1, 2] × [0, 0] is symmetric about the real axis, so σ_c is a real embedding. |
| `archimedean_degree_one` | degenerate | For minpoly ℚ θ = X − 1 the box [1, 1] × [0, 0] is a certificate and σ_c(α) = α for α ∈ ℚ. |
| `archimedean_ambiguous_box` | non-example | For X² − 2 the box [−2, 2] × [0, 0] contains two roots, so it is not a certificate. |
| `archimedean_conjugate_place` | compatibility | For minpoly X² + 1 the boxes [0, 0] × [1, 1] and [0, 0] × [−1, −1] give conjugate embeddings with the same InfinitePlace.mk. |

### ED.0/padic-embedding-certificate

p-adic embeddings pinned by Hensel certificates

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate` | structure | An integer a with f′(a) ≠ 0 and either f(a) = 0 or v_p(f(a)) &gt; 2·v_p(f′(a)) for f = minpoly ℚ pb.gen. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.root` | data | The Hensel root z ∈ ℤ_p of f with ‖z − a‖ &lt; ‖f′(a)‖. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.embedding` | data | σ_a = PowerBasis.lift pb z : K →+* ℚ_p. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.embedding_gen` | simp | σ_a(pb.gen) = z. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.eq_embedding_of_near` | extensionality | If σ : K →+* ℚ_p satisfies ‖σ(pb.gen) − a‖ &lt; ‖f′(a)‖ then σ = σ_a. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.root_sub_mem` | characterisation | For an integer b with ‖b − a‖ &lt; ‖f′(a)‖ and either f(b) = 0 or v_p(f(b)) ≥ N + v_p(f′(a)), ‖z − b‖ ≤ p^(−N). |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.evalEnclosure` | data | The PadicEnclosure (Σ_j a_j b^j, n) of σ_a(α) of absolute precision n. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.ne_of_far` | relation | ‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖) implies σ_a ≠ σ_a′. |
| `TauCeti.EffectiveDiophantine.ED0.PadicEmbeddingCertificate.embedding_algebraMap` | compatibility | σ_a restricted to ℚ is the canonical map ℚ → ℚ_p. |

| Test | Kind | Required behavior |
|---|---|---|
| `padic_sqrt_two_seven` | computation | For minpoly ℚ θ = X² − 2, p = 7 and a = 3 the check v_7(7) = 1 &gt; 0 = 2·v_7(6) holds, and σ_a(θ) ≡ 10 (mod 49). |
| `padic_sqrt_two_two_roots` | characterisation | For X² − 2 at p = 7 the certificates a = 3 and a = 4 define the two different embeddings ℚ(√2) → ℚ_7. |
| `padic_degree_one` | degenerate | For minpoly ℚ θ = X − 1, a = 1 is a certificate (f(1) = 0) and σ_a(α) = α for α ∈ ℚ. |
| `padic_no_root_five` | non-example | For X² − 2 at p = 5 no integer a is a certificate: v_5(a² − 2) = 0 for every a since 2 is not a square modulo 5. |
| `padic_embedding_rat` | compatibility | σ_a(algebraMap ℚ K q) = (q : ℚ_[p]) for every certificate a and q ∈ ℚ. |

### ED.0/valuation-certificate

Certified valuations from p-adic enclosures

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate` | structure | A PadicEnclosure (c, N) of σ_a(α) with c ≠ 0 and padicValRat p c &lt; N. |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.valuation_eq` | characterisation | Padic.valuation (σ_a α) = padicValRat p c. |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.ne_zero` | other | A valuation certificate exists only for α ≠ 0. |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.exists_of_ne_zero` | constructor | Every α ≠ 0 has a valuation certificate at every precision N &gt; v_p(σ_a(α)). |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.prime` | data | The height-one prime 𝔭_a = {x ∈ 𝓞_K : ‖σ_a(x)‖ &lt; 1}. |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.adicValuation_eq` | compatibility | HeightOneSpectrum.valuation K α at 𝔭_a equals WithZero.exp(−v_p(σ_a(α))). |
| `TauCeti.EffectiveDiophantine.ED0.ValuationCertificate.mul` | functoriality | Certificates for α and β give a certificate for αβ with valuation v_p(c) + v_p(c′). |

| Test | Kind | Required behavior |
|---|---|---|
| `valuation_rat_eighteen` | compatibility | For K = ℚ (minpoly X − 1, a = 1), p = 3 and α = 18, the enclosure (18, 3) certifies valuation 2 = padicValRat 3 18. |
| `valuation_sqrt_two_seven` | computation | For X² − 2 at p = 7 with a = 3, the enclosure (7, 2) of σ_a(θ − 3) certifies v_7(σ_a(θ − 3)) = 1. |
| `valuation_unit` | degenerate | The enclosure (1, 1) of σ_a(1) certifies valuation 0. |
| `valuation_zero_centre` | non-example | At p = 7 the enclosure (0, 2) of 49 is not a valuation certificate although 49 ≠ 0: its centre is 0. |

### ED.0/height-enclosure

Certified enclosures of the height of a number-field element

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.heightEnclosure` | data | A RealEnclosure of Height.mulHeight₁ x of absolute precision n. |
| `TauCeti.EffectiveDiophantine.ED0.heightEnclosure_width` | other | The width of heightEnclosure x n is at most 2^(−n). |
| `TauCeti.EffectiveDiophantine.ED0.mulHeight₁_eq_mahlerMeasure_charpoly` | compatibility | mulHeight₁ x equals the Mahler measure of the primitive part of the characteristic polynomial of x, mapped to ℂ[X]. |
| `TauCeti.EffectiveDiophantine.ED0.mulHeight₁_eq_leadingCoeff_mul_prod_embeddings` | characterisation | mulHeight₁ x = a_x · ∏_σ max(1, ‖σ x‖) over all embeddings σ : K →+* ℂ. |
| `TauCeti.EffectiveDiophantine.ED0.heightEnclosure_rat` | simp | For K = ℚ the enclosure contains max(\|num x\|, den x) (Mathlib's Rat.mulHeight₁_eq_max). |
| `TauCeti.EffectiveDiophantine.ED0.charpoly_leftMul_arbitrary` | compatibility | For any x∈K and any Q-basis b of K, charpoly(leftMulMatrix b x)=minpoly Q x ^ ([K:Q]/natDegree(minpoly Q x)). Identify Q(x) with the simple intermediate field, use a basis of K over Q(x), restriction of scalars and basis invariance; x need not generate K. |
| `TauCeti.EffectiveDiophantine.ED0.charpoly_leftMul_basis_independent` | compatibility | For two Q-bases b and b′ of K and any x, the left-multiplication characteristic polynomials agree by similarity. |

| Test | Kind | Required behavior |
|---|---|---|
| `height_half` | computation | For x = 1/2 ∈ ℚ, P_x = 2X − 1 and mulHeight₁ x = 2. |
| `height_sqrt_two` | computation | For θ = √2 in ℚ(√2), P = X² − 2 and mulHeight₁ θ = 2 (both archimedean factors equal √2). |
| `height_zero` | degenerate | mulHeight₁ 0 = 1 and every enclosure of it contains 1. |
| `height_golden` | computation | For the golden ratio φ in ℚ(√5), P = X² − X − 1 and mulHeight₁ φ = φ = (1 + √5)/2. |
| `height_relative_not_absolute` | non-example | For √2 ∈ ℚ(√2) the relative height is 2 while absMulHeight₁ √2 = √2: the enclosure is of the relative height. |

### ED.0/bounded-height-enumeration

Certified enumeration of points of bounded height

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED0.boundedHeightPoints` | data | The pair (S_&lt;, S_≈) of finite subsets of L. |
| `TauCeti.EffectiveDiophantine.ED0.mem_boundedHeightPoints_of_mulHeight₁_le` | characterisation | mulHeight₁ x ≤ D implies x ∈ S_&lt; ∪ S_≈. |
| `TauCeti.EffectiveDiophantine.ED0.mulHeight₁_lt_of_mem_lt` | characterisation | x ∈ S_&lt; implies mulHeight₁ x &lt; D. |
| `TauCeti.EffectiveDiophantine.ED0.abs_mulHeight₁_sub_lt_of_mem_near` | characterisation | x ∈ S_≈ implies \|mulHeight₁ x − D\| &lt; τ. |
| `TauCeti.EffectiveDiophantine.ED0.boundedHeightProjectivePoints` | data | The finite set T ⊆ ℙ¹(L) of [x : 1] for x ∈ S_&lt; ∪ S_≈ together with [1 : 0]. |
| `TauCeti.EffectiveDiophantine.ED0.mem_boundedHeightProjectivePoints` | characterisation | Height.logHeight P.rep ≤ log D implies P ∈ T, for every P ∈ ℙ¹(L). |
| `TauCeti.EffectiveDiophantine.ED0.boundedHeightPoints_superset` | compatibility | The toFinset of NumberField.finite_setOfPred_mulHeight₁_le L D is contained in S_&lt; ∪ S_≈. |

| Test | Kind | Required behavior |
|---|---|---|
| `bounded_height_rat_two` | computation | For L = ℚ, D = 2 and τ = 1/2: S_&lt; = {0, 1, −1} and S_≈ = {2, −2, 1/2, −1/2}; T has 8 points of ℙ¹(ℚ). |
| `bounded_height_gaussian_one` | degenerate | For L = ℚ(i), D = 1: S_&lt; = ∅ and S_≈ = {0, 1, −1, i, −i}, the elements of height exactly 1. |
| `bounded_height_integral_only` | non-example | Restricting step (4) to c = 1 misses x = 1/2 for L = ℚ and D = 2, so the denominators c ≤ D are needed. |
| `bounded_height_infinity` | characterisation | [1 : 0] ∈ T for every D ≥ 1, since Height.logHeight ![1, 0] = 0. |
| `bounded_height_superset` | compatibility | For L = ℚ and D = 3 the union S_&lt; ∪ S_≈ contains {x : ℚ \| mulHeight₁ x ≤ 3}, which has 15 elements (7 integers, 4 with denominator 2, 4 with denominator 3). |

### ED.1/linear-form-lattice

The approximation lattice of a real linear form

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED1.linearFormMatrix` | data | The n × n integer matrix A built from W and φ. |
| `TauCeti.EffectiveDiophantine.ED1.linearFormMatrix_mulVec` | simp | A x = (W_1x_1, …, W_{n−1}x_{n−1}, Σ_i x_iφ_i). |
| `TauCeti.EffectiveDiophantine.ED1.linearFormMatrix_det` | characterisation | det A = (∏_{i&lt;n} W_i)·φ_n. |
| `TauCeti.EffectiveDiophantine.ED1.linearFormLattice` | data | Γ = {A x : x ∈ ℤ^n} ⊆ ℤ^n. |
| `TauCeti.EffectiveDiophantine.ED1.mem_linearFormLattice` | characterisation | v ∈ Γ iff W_i ∣ v_i for i &lt; n and φ_n ∣ v_n − Σ_{i&lt;n}(v_i/W_i)φ_i. |
| `TauCeti.EffectiveDiophantine.ED1.linearFormMatrix_mulVec_injective` | structure | x ↦ A x is injective when φ_n ≠ 0, so the columns are a basis of Γ. |
| `TauCeti.EffectiveDiophantine.ED1.normSq_linearFormMatrix_mulVec` | simp | ‖A x‖² = Σ_{i&lt;n} W_i²x_i² + Λ̃(x)². |
| `TauCeti.EffectiveDiophantine.ED1.abs_linearForm_sub_le` | characterisation | \|Λ̃(x) − CΛ(x)\| ≤ Σ_i \|x_i\| when \|φ_i − Cθ_i\| ≤ 1. |
| `TauCeti.EffectiveDiophantine.ED1.linearFormTarget` | data | y = (0, …, 0, −ψ) and ‖A x − y‖² = Σ_{i&lt;n} W_i²x_i² + (Λ̃(x) + ψ)². |
| `TauCeti.EffectiveDiophantine.ED1.roundOfEnclosure` | constructor | From a RealEnclosure of θ_i with C·width ≤ 1, round(C·midpoint) satisfies \|φ_i − Cθ_i\| ≤ 1. |
| `TauCeti.EffectiveDiophantine.ED1.linearFormMatrix_gram_integral` | compatibility | The Gram matrix of the columns in Euclidean ℝ^n is AᵀA ∈ ℤ^(n×n), the input format of GN.5's exactLLL. |

| Test | Kind | Required behavior |
|---|---|---|
| `lfl_two_dim` | computation | n = 2, W_1 = 1, φ = (3, 7): A = [[1, 0], [3, 7]], det A = 7, (1, 3) ∈ Γ and (0, 1) ∉ Γ. |
| `lfl_unimodular` | degenerate | All W_i = 1 and φ_n = 1 give Γ = ℤ^n. |
| `lfl_log_rounding` | computation | θ = (log 2, log 3), C = 10^8: from enclosures of width 10^(−9) the rounding gives φ = (69314718, 109861229). |
| `lfl_singular` | non-example | φ_n = 0 gives det A = 0; the columns are not a basis and the construction is rejected. |
| `lfl_mem_iff` | characterisation | For W_1 = 1, φ = (3, 7): v ∈ Γ iff 7 ∣ v_2 − 3v_1. |

### ED.1/padic-linear-form-lattice

The approximation lattice of a p-adic linear form

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED1.padicLatticeMatrix` | data | The integer matrix A_m built from p, m, W and the β_j^(m). |
| `TauCeti.EffectiveDiophantine.ED1.padicLatticeTarget` | data | y_m = (0, …, 0, −W_nβ_0^(m)). |
| `TauCeti.EffectiveDiophantine.ED1.padicLinearForm` | data | Λ′(b) = b_n − β_0 − Σ_{j&lt;n} b_jβ_j ∈ ℤ_p. |
| `TauCeti.EffectiveDiophantine.ED1.mem_padicLattice_iff` | characterisation | p^m ∣ Λ′(b) iff (W_jb_j)_j + y_m ∈ Γ_m. |
| `TauCeti.EffectiveDiophantine.ED1.padicLatticeMatrix_det` | other | det A_m = p^m·∏_j W_j. |
| `TauCeti.EffectiveDiophantine.ED1.padicLattice_antitone` | other | With fixed data, Γ_{m+1} ⊆ Γ_m. |
| `TauCeti.EffectiveDiophantine.ED1.apprOfEnclosure` | constructor | From a PadicEnclosure (c, N) of β with N ≥ m and v_p(c) ≥ 0, the residue of c in [0, p^m − 1] equals PadicInt.appr β m. |

| Test | Kind | Required behavior |
|---|---|---|
| `plfl_three` | computation | p = 3, m = 1, n = 2, W = (1, 1), β_1 = 0, β_0 = 1: Γ_1 = ℤ × 3ℤ, y_1 = (0, −1), and b = (0, 1) has Λ′(b) = 0 and (b_1, b_2) + y_1 = (0, 0) ∈ Γ_1. |
| `plfl_sign` | non-example | In the same data, the translate with y = (0, +1) (the printed sign of de Weger's Lemma 3.15) characterises b_2 ≡ 2 (mod 3), not 3 ∣ Λ′(b) ⇔ b_2 ≡ 1 (mod 3). |
| `plfl_m_zero` | degenerate | m = 0: A_0 = diag(W_1, …, W_n) up to the last row W_n(0, …, 0, 1), Γ_0 = ⊕_j W_jℤ, and every b satisfies p^0 ∣ Λ′(b). |
| `plfl_one_dim` | compatibility | n = 1: Γ_m = W_1p^mℤ and the characterisation says b_1 ≡ β_0 (mod p^m), i.e. b_1 ≡ PadicInt.appr β_0 m. |

### ED.1/short-vector-enumeration

Fincke–Pohst enumeration of lattice points in an ellipsoid

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED1.quadraticCompletion` | data | The rational coefficients q_ij of Fincke–Pohst (2.3). |
| `TauCeti.EffectiveDiophantine.ED1.quadraticCompletion_spec` | characterisation | x ᵀGx = Σ_i q_ii(x_i + Σ_{j&gt;i} q_ij x_j)² for all x ∈ ℚ^n when all pivots are nonzero. |
| `TauCeti.EffectiveDiophantine.ED1.quadraticCompletion_pivot_pos_iff` | characterisation | All pivots q_ii are positive iff G is positive definite. |
| `TauCeti.EffectiveDiophantine.ED1.fpEnumeration` | data | The finite set of integer vectors produced by the recursion. |
| `TauCeti.EffectiveDiophantine.ED1.fpEnumeration_neg` | relation | With t = 0 the set is closed under x ↦ −x. |
| `TauCeti.EffectiveDiophantine.ED1.fpEnumeration_of_neg` | simp | If R &lt; 0 the set is empty. |
| `TauCeti.EffectiveDiophantine.ED1.fpEnumeration_mono` | other | R ≤ R′ implies fpEnumeration G t R ⊆ fpEnumeration G t R′. |

| Test | Kind | Required behavior |
|---|---|---|
| `fp_identity_one` | computation | G = I_2, t = 0, R = 1: the output is {0, ±e_1, ±e_2} (five vectors). |
| `fp_hexagonal` | computation | G = [[2, 1], [1, 2]], t = 0, R = 2: the output is {0, ±(1, 0), ±(0, 1), ±(1, −1)} (seven vectors); (1, 1) has value 6 and is excluded. |
| `fp_centre_half` | computation | n = 1, G = (1), t = 1/2, R = 1/4: the output is {0, 1}. |
| `fp_negative_bound` | degenerate | R = −1 gives the empty set for every G and t. |
| `fp_box_non_example` | non-example | For G = [[2, 1], [1, 2]] and R = 2 the box \|x_i\| ≤ 1 contains (1, 1), which is not in the output: bounding each coordinate separately overcounts. |

### ED.1/exclusion-certificate

Lattice exclusion certificates for linear forms

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED1.DistanceWitness` | structure | An LLL witness or an enumeration witness for a nonsingular integer matrix A and target y, with its rational lower bound L². |
| `TauCeti.EffectiveDiophantine.ED1.DistanceWitness.bound` | projection | The rational number L² certified by the witness. |
| `TauCeti.EffectiveDiophantine.ED1.DistanceWitness.sound` | characterisation | Every v ∈ Aℤ^n satisfies ‖v − y‖² ≥ L² (v ≠ 0 when y = 0). |
| `TauCeti.EffectiveDiophantine.ED1.RealExclusionCertificate` | structure | Lattice data, box, margin μ, distance witness and the inequality (iv) for a real linear form. |
| `TauCeti.EffectiveDiophantine.ED1.PadicExclusionCertificate` | structure | p-adic lattice data, box, distance witness and L² &gt; Σ W_j²X_j². |
| `TauCeti.EffectiveDiophantine.ED1.RealExclusionCertificate.check` | other | Supporting Boolean evaluation on an already validated semantic record; the raw all-fields verifier is RawRealExclusionCertificate.check. |
| `TauCeti.EffectiveDiophantine.ED1.DistanceWitness.ofLLL` | constructor | Build an LLL witness from the output of GN.5's exactLLL applied to the columns of A. Requires A.det ≠ 0 so the rational target coordinates in AU exist. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate` | structure | Raw A,y, rational inverse, radius B, squared lower bound and integer coordinate cap D; no proof fields. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.box` | constructor | The product finite set [-D,D]^n over integer coordinates. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.normSq` | data | The exact rational sum Σ_i((Ax-y)_i)^2. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.check` | other | Decide both inverse identities, rational radius and row inequalities, and the finite box comparisons. No Classical real decision or oracle. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.sound` | characterisation | If check=true, the squared lower bound applies to every integer vector, excluding x=0 when y=0. |
| `TauCeti.EffectiveDiophantine.ED1.RawRealExclusionCertificate` | structure | Proof-free C,W,φ,ψ, homogeneous flag, rational interval endpoints for each θ_i and β, nonnegative coordinate bounds, positive margin and raw distance data. |
| `TauCeti.EffectiveDiophantine.ED1.RawRealExclusionCertificate.check` | other | Finite rational endpoint-rounding, positivity, nonnegative coordinate bounds, homogeneous zero data, matrix/target matching, raw distance replay and final separation checks. No universal real predicate occurs in the raw input. |
| `TauCeti.EffectiveDiophantine.ED1.RawRealExclusionCertificate.sound` | characterisation | Given check=true and independently certified membership of θ_i and β in the raw rational intervals, every eligible integer vector in the box satisfies margin≤C\|β+Σx_iθ_i\|. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.ofMatrix` | constructor | Complete fallback: from an integer nonsingular matrix, target and positive rational radius compute inverse row caps, exhaust the integer cube and take min(B², all eligible squared distances). The result may have lower bound0; this is not failure of soundness. |
| `TauCeti.EffectiveDiophantine.ED1.RawDistanceCertificate.ofMatrix_check` | characterisation | The producer passes check and preserves the supplied matrix and target. |
| `TauCeti.EffectiveDiophantine.ED1.RawRealExclusionCertificate.ofEnclosures` | constructor | From actual ED.0/CN.4 certified intervals, choose rational rounding fields and the raw distance replay; return some raw certificate only when all finite checks pass, otherwise none. |
| `TauCeti.EffectiveDiophantine.ED1.RawRealExclusionCertificate.ofEnclosures_check` | compatibility | Some output passes check and its endpoints still enclose the actual θ_i and β. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate` | structure | Proof-free p,m, integral weights, canonical integer coefficient residues, rational box and complete raw rational distance transcript; no p-adic or proof fields. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.matrix` | data | The integer triangular matrix with diagonal W₁,…,W_{n−1},W_n p^m and last-row residue entries W_n r_j. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.target` | data | The integer target (0,…,0,−W_n r₀), using the negative constant residue. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.check` | other | Finite prime/residue/weight/box checks, exact matrix and target identity, inverse and all finite distance comparisons, and strict Σ(W_jX_j)²&lt;L². |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.not_congruent` | characterisation | If check=true, every b in the coordinate box, with b≠0 when r₀=0, fails b_n−r₀−Σ b_j r_j≡0 modulo p^m. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.check_sound` | characterisation | Given check=true and independently certified PadicInt.appr residue identities for the actual β₀,β_j∈Z_p, every eligible b in the box has p^m not dividing β-linear form b_n−β₀−Σb_jβ_j, including exclusion of the exact-zero form. |
| `TauCeti.EffectiveDiophantine.ED1.RawPadicExclusionCertificate.matrix_target_eq` | compatibility | Under those appr identities the raw matrix and target equal padicLatticeMatrix and padicLatticeTarget, not merely lattices with equal determinants. |

| Test | Kind | Required behavior |
|---|---|---|
| `exclusion_log23` | computation | θ = (log 2, log 3), C = 10^8, φ = (69314718, 109861229), U with AU = [c_0 c_1], c_0 = (−1054, 4513), y = 0, X = (1000, 1000), μ = 1000: L² = 21478085/2 ≥ 10^7, so the data form a homogeneous real certificate. |
| `exclusion_trivial_box` | degenerate | X_i = 0 for all i: the homogeneous region is empty and any witness with L² ≥ μ² certifies it. |
| `exclusion_integral_target` | non-example | If s = (AU)^(−1)y ∈ ℤ^n then y ∈ Γ, the LLL witness is rejected, and no positive lower bound for the distance exists. |
| `exclusion_padic_one_dim` | computation | p = 3, m = 2, n = 1, W_1 = 1, β_0^(2) = 5, enumeration witness R = 15 with E = ∅ (Γ_2 = 9ℤ, y = −5, distances ≥ 4² = 16 &gt; 15), X_1 = 3: L² = 15 &gt; 9 = X_1², a p-adic certificate. |
| `raw_distance_one` | computation | A=1,y=0,Ainv=1,B=L²=D=1 in dimension one passes: every nonzero integer has square at least one. |
| `raw_distance_bad_inverse` | non-example | Replacing Ainv by zero in that data fails the inverse check. |
| `raw_distance_integral_target` | non-example | A=1,y=1,Ainv=1,B=L²=1,D=2 fails: x=1 gives distance zero. |
| `raw_real_ten` | computation | C=W=1, φ=θ=10, β=ψ=0, X=margin=1, A=10, inverse=1/10, B=2, lower=4,D=1 passes the complete homogeneous finite check. |
| `raw_real_bad_endpoint` | non-example | Changing the upper θ endpoint from10 to12 rejects the rounding condition. |
| `raw_real_bad_distance` | non-example | Replacing the distance inverse1/10 by0 rejects the full raw check. |
| `raw_padic_one_dim` | computation | p=3,m=2,W=1,r₀=5,X=3,A=9,y=−5,Ainv=1/9,B=4,L²=15,D=1 passes. The complete checked cube is {−1,0,1}, with squared distances16,25,196. |
| `raw_padic_wrong_sign` | non-example | Changing only the target to+5 rejects the matrix/target matching, despite the same positive distance to9Z. |
| `raw_padic_bad_inverse` | non-example | Changing the inverse1/9 to0 rejects the full raw check. |
| `raw_padic_composite` | non-example | p=9,m=1 with otherwise identical modulus9 data is rejected by primality. |
| `raw_padic_strict_boundary` | non-example | X=4,L²=16 is rejected: separation is strict, and b=−4 actually satisfies b≡5 modulo9. |
| `raw_padic_zero_box` | degenerate | p=3,m=1,r₀=0,W=1,X=0,A=3,y=0,Ainv=1/3,B=L²=D=1 passes for the empty eligible homogeneous region; it never excludes b=0 without the nonzero hypothesis. |

### ED.2/logarithm-enclosure

Certified enclosures of logarithms and arguments of embedded algebraic numbers

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.logAbsEnclosure` | constructor | For a rational box B and a precision P, logAbsEnclosure B P : Option (NonemptyInterval ℚ), equal to none exactly when 0 ∈ B. |
| `TauCeti.EffectiveDiophantine.argEnclosure` | constructor | For a rational box B and a precision P, argEnclosure B P : Option (NonemptyInterval ℚ), equal to none exactly when B meets the closed half-line (−∞, 0]. |
| `TauCeti.EffectiveDiophantine.log_norm_mem_logAbsEnclosure` | characterisation | If z ∈ complexBoxSet B and logAbsEnclosure B P = some J then Real.log ‖z‖ ∈ J (as real numbers). |
| `TauCeti.EffectiveDiophantine.arg_mem_argEnclosure` | characterisation | If z ∈ complexBoxSet B and argEnclosure B P = some J then Complex.arg z ∈ J. |
| `TauCeti.EffectiveDiophantine.logAbsEnclosure_width_le` | other | If B has diameter w, 0 &lt; ρ⁻ ≤ ‖z‖ on B and logAbsEnclosure B P = some J, then the width of J is at most w/ρ⁻ + 3·2^{−P}. |
| `TauCeti.EffectiveDiophantine.logAbsEnclosure_ofRat` | compatibility | For a rational q &gt; 0 and the degenerate box [q, q] × [0, 0], logAbsEnclosure contains Real.log q and has width at most 2^{1−P}. |

| Test | Kind | Required behavior |
|---|---|---|
| `logAbsEnclosure_two` | computation | For the degenerate box [2, 2] × [0, 0] and P = 30 the enclosure is some J with J ⊆ [0.6931471, 0.6931472] (Real.log 2 = 0.69314718…). |
| `logAbsEnclosure_one` | degenerate | For the degenerate box [1, 1] × [0, 0] the enclosure contains 0 and has width at most 2^{1−P}. |
| `argEnclosure_neg_one` | non-example | For the degenerate box [−1, −1] × [0, 0] (the point −1, on the branch cut) argEnclosure returns none, although Complex.arg (−1) = π is defined; a wrong definition returning an interval around π would be unsound for nearby points below the axis, whose arguments are near −π. |
| `logAbsEnclosure_zero_box` | non-example | For the box [−1, 1] × [−1, 1], which contains 0, logAbsEnclosure returns none. |
| `arg_i` | compatibility | For the degenerate box [0, 0] × [1, 1] the argument enclosure contains Complex.arg I = π/2, agreeing with Mathlib's Complex.arg_I. |

### ED.2/certified-linear-form-constant

Certified evaluation of Matveev's constant

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate` | structure | Data n, D, A : Fin n → ℚ, s⁺, ℓ⁺, c with the rational inequalities of the statement as fields: 16/100 ≤ A j, n ≤ s⁺², Real.log D ≤ ℓ⁺, Ĉ(n)·D²·(1 + ℓ⁺)·∏ A j ≤ c. |
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate.matveevBound` | data | The rational c, used as C_7 in Tzanakis–de Weger's Lemma 2.3 with C_8 = 1. |
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate.Admissible` | relation | For K, σ, D-bounded degree, α : Fin n → Kˣ and λ : Fin n → ℂ with λ j ≠ 0 and Complex.exp (λ j) = σ (α j): D·absLogHeight₁ (α j) ≤ A j and ‖λ j‖ ≤ A j for all j. |
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate.matveevC1_le` | characterisation | For κ ∈ {1, 2}: min{κ⁻¹(exp 1·n/2)^κ·30^{n+3}·n^{3.5}, 2^{6n+20}} ≤ Ĉ(n). |
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate.admissible_of_le_degree` | other | Admissibility for a degree bound D implies admissibility for every D′ ≥ D after replacing A_j by D′A_j/D and c accordingly. |
| `TauCeti.EffectiveDiophantine.MatveevConstantCertificate.ofHeightBounds` | constructor | From height certificates h_j⁺, logarithm enclosures \|λ_j\|⁺ and a precision, the certificate with A_j := max(D·h_j⁺, \|λ_j\|⁺, 16/100) and the least dyadic c at the requested precision satisfying the inequality. |

| Test | Kind | Required behavior |
|---|---|---|
| `matveev_two_logs` | computation | For n = 2, D = 1, ℓ⁺ = 0, s⁺ = 1415/1000, A = (7/10, 11/10) (admissible for α = (2, 3) and real logarithms, since Real.log 2 &lt; 0.7 and Real.log 3 &lt; 1.1): c = 8·10⁸ is accepted and c = 7·10⁸ is rejected (the least admissible c is ≈ 7.83·10⁸). |
| `matveev_one_log` | degenerate | For n = 1, D = 1, ℓ⁺ = 0, s⁺ = 1: Ĉ(1) = e⁺/2·30⁴ ≈ 1.1009·10⁶ (the κ = 1 value dominates). |
| `matveev_small_A` | non-example | A family with A_1 = 1/10 (below Matveev's floor 0.16) is not a certificate. For the root of unity α_1 = exp(2πi/100) with λ_1 = 2πi/100 one has D·h(α_1) = 0 and \|λ_1\| &lt; 1/10, so a definition omitting the floor 16/100 ≤ A_j would accept A_1 = 1/10, where Corollary 2.3 does not apply. |
| `matveev_kappa` | compatibility | For n ≥ 2, (1/2)(en/2)² ≥ en/2, so Ĉ(n) equals the κ = 2 value: the certificate never undercuts Matveev's constant for non-real fields. |

### ED.2/certified-padic-linear-form-constant

Certified evaluation of Yu's p-adic constant

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.YuConstantCertificate` | structure | Data n, d, p, h : Fin n → ℚ, λ_p⁻, L⁺, Φ⁺ with the rational inequalities of the statement as fields. |
| `TauCeti.EffectiveDiophantine.YuConstantCertificate.yuBound` | data | The rational Φ⁺. |
| `TauCeti.EffectiveDiophantine.YuConstantCertificate.Admissible` | relation | For α : Fin n → K with [K : ℚ] ≤ d: absLogHeight₁ (α j) ≤ h j, ‖Complex.log (σ (α j))‖ ≤ 10·h j and Real.log p ≤ h j. |
| `TauCeti.EffectiveDiophantine.YuConstantCertificate.yuPhi_le` | characterisation | Yu's Φ for any prime 𝔭 of ℚ(α) above p, computed with the true degree, is at most Φ⁺. |
| `TauCeti.EffectiveDiophantine.YuConstantCertificate.ofHeightBounds` | constructor | From height certificates, logarithm enclosures and a precision, the certificate with h_j := max(h_j⁺, \|log α_j\|⁺/10, ℓ_p⁺) and the least dyadic Φ⁺ at that precision. |

| Test | Kind | Required behavior |
|---|---|---|
| `yu_rational_two_primes` | computation | For n = 2, d = 1, p = 5, α = (2, 3) and h = (ℓ₅⁺, ℓ₅⁺) with ℓ₅⁺ ≥ Real.log 5 (both heights log 2, log 3 are below log 5): Φ⁺ ≥ 22000·(28.5)^6·(log 5)^{−3}·4·(log 5)²·log(20·log 5) ≈ 1.017·10^{14}, and the certificate is rejected for Φ⁺ = 10^{14}. |
| `yu_degree_one` | degenerate | For d = 1 the residue factor is p − 1 (f_𝔭 = 1), so the certificate for rationals uses p − 1 and not p² − 1. |
| `yu_unit_requirement` | non-example | The certificate is not admissible with h_j = 7/10 (≥ Real.log 2) at p = 5 for α_j = 2: the condition h_j ≥ log p fails, and a definition omitting it would undercut Yu's hypothesis. |
| `yu_compat_rat` | compatibility | For rationals the certified Φ⁺ yields a constant C = 2Φ⁺ log p with \|α^b − 1\|_p ≥ (eB)^{−C}, the form of DiophantineApproximationAndTranscendence:DT.3/yu-p-adic-lower-bound. |

### ED.2/padic-discrete-logarithm-certificate

Discrete-logarithm certificates for p-adic multiplicative forms

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate` | structure | Data p, t, e, g, M, ℓ : Fin (n+1) → ℤ with the exact congruences of the statement as fields (in ZMod (p^t) for 𝒪 = ℤ_p). The prime hypothesis p.Prime and the ranges 0 ≤ ℓ_i &lt; p^M are fields. |
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate.lattice` | data | The congruence lattice Γ = {b : Σ b_iℓ_i ≡ 0 (mod p^M)} as an AddSubgroup of ℤ^n. |
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate.mem_coset_of_congr` | characterisation | If ζ^e = 1 and ζγ_0∏γ_i^{b_i} ≡ 1 (mod 𝔓^t) then ℓ_0 + Σ b_iℓ_i ≡ 0 (mod p^M). |
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate.mem_of_padicValRat_le` | compatibility | For rationals γ_i with padicValRat p γ_i = 0: if t ≤ padicValRat p (±γ_0∏γ_i^{b_i} − 1) then ℓ_0 + Σ b_iℓ_i ≡ 0 (mod p^M). |
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate.standard` | constructor | For odd p, rational p-adic units γ_i and M ≥ 1: the certificate with g = 1 + p, t = M + 1, e = p − 1 and ℓ_i the discrete logarithms; for p = 2 the analogue with g = 5, t = M + 2, e = 2. |
| `TauCeti.EffectiveDiophantine.PadicDiscreteLogCertificate.orderOf_one_add_prime` | other | For odd p: orderOf ((1 + p : ZMod (p^(M+1)))) = p^M; for p = 2: orderOf ((5 : ZMod (2^(M+2)))) = 2^M. |

| Test | Kind | Required behavior |
|---|---|---|
| `discreteLog_five_two` | computation | p = 5, M = 2, t = 3, e = 4, g = 6: modulo 125, 2⁴ = 16 ≡ 6^ℓ with ℓ ∈ [0, 25); the certificate stores this ℓ and 6^{25} ≡ 1, 6^5 ≢ 1 (mod 125). |
| `discreteLog_sign` | characterisation | With p = 5 and γ_0 = −1 (ℓ_0 = 0 since (−1)⁴ = 1): the vector b is in the coset Γ_0 for every solution of −∏γ_i^{b_i} ≡ 1 (mod 125), so the sign never needs a separate lattice. |
| `discreteLog_order_fail` | non-example | g = 1 + 5² = 26 modulo 125 has order 5, not 25: a certificate claiming M = 2 with g = 26 fails the check g^{5} ≢ 1, so lattices built from a non-generator are rejected. |
| `discreteLog_trivial` | degenerate | If every γ_i ≡ 1 (mod p^t) then all ℓ_i ≡ 0 and Γ = ℤ^n: the certificate gives no information, and a reduction step based on it cannot lower a bound. |
| `discreteLog_compat_two` | compatibility | p = 2, M = 3, t = 5: 5 has order 8 modulo 32 (5⁴ = 625 ≡ 17, 5⁸ ≡ 1), agreeing with Mathlib's orderOf in ZMod 32. |
| `discreteLog_composite_nonexample` | non-example | At the composite modulus parameter p = 6, g = 19 ≡ 1 mod 6 has order 2 modulo 36, so g^6 = 1 and g ≠ 1 do not imply order 6. No PadicDiscreteLogCertificate with p = 6 exists: p must be prime. |
| `discreteLog_zero_coefficient` | degenerate | At p = 5 and M = 2, ℓ = (0, 5, 0): κ = 1 with pivot ℓ_1 = 5 and the coset is {b : 5 ∣ b_1}, including b = 0. The zero coefficient is not a pivot and the zero constant does not make the coset empty. |

### ED.2/exponent-reduction-chain

Exponent reduction chains

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ExponentReductionChain` | structure | Bounds X : Fin (k+1) → (Fin q → ℚ) (componentwise antitone; the scalar weighted case is X_j·w), exceptions E : Fin k → Finset (Fin q → ℤ) and, for each step, the implication of the statement as a field. |
| `TauCeti.EffectiveDiophantine.ExponentReductionChain.final` | projection | The last componentwise bound X_k : Fin q → Q. |
| `TauCeti.EffectiveDiophantine.ExponentReductionChain.sound` | characterisation | Every a∈S in the initial componentwise box belongs to the final componentwise box or one E_j. |
| `TauCeti.EffectiveDiophantine.ExponentReductionChain.nil` | constructor | The chain with k = 0 (no step), whose final bound is X_0. |
| `TauCeti.EffectiveDiophantine.ExponentReductionChain.append` | constructor | Adding a step certified by an ED.1 reduction or enumeration certificate whose input bound is the current final bound. |
| `TauCeti.EffectiveDiophantine.InExponentBox` | characterisation | ∀i, \|(a_i:Q)\|≤X_i. |
| `TauCeti.EffectiveDiophantine.WeightedExponentReductionChain` | structure | Weighted scalar helper with decreasing rational X_j and the corresponding weightedHeight implications. Conversion requires positive weights; it does not represent independent per-prime updates. |
| `TauCeti.EffectiveDiophantine.WeightedExponentReductionChain.final` | projection | Weighted scalar helper with decreasing rational X_j and the corresponding weightedHeight implications. Conversion requires positive weights; it does not represent independent per-prime updates. |
| `TauCeti.EffectiveDiophantine.WeightedExponentReductionChain.sound` | characterisation | Weighted scalar helper with decreasing rational X_j and the corresponding weightedHeight implications. Conversion requires positive weights; it does not represent independent per-prime updates. |
| `TauCeti.EffectiveDiophantine.WeightedExponentReductionChain.nil` | constructor | Weighted scalar helper with decreasing rational X_j and the corresponding weightedHeight implications. Conversion requires positive weights; it does not represent independent per-prime updates. |
| `TauCeti.EffectiveDiophantine.WeightedExponentReductionChain.append` | constructor | Weighted scalar helper with decreasing rational X_j and the corresponding weightedHeight implications. Conversion requires positive weights; it does not represent independent per-prime updates. |

| Test | Kind | Required behavior |
|---|---|---|
| `chain_nil` | degenerate | For k = 0 soundness is the hypothesis itself: final = X_0 and the exception set is empty. |
| `chain_two_steps` | computation | A chain 10⁴⁰ ≥ 600 ≥ 70 with two real steps and no exceptions gives: every a ∈ 𝒮 with H(a) ≤ 10⁴⁰ has H(a) ≤ 70. |
| `chain_enumeration_step` | characterisation | A type (c) step with w = (1, 1), X_{j−1} = 10, X_j = 5 and E_j = {(7, −9)} forces every a ∈ 𝒮 with H(a) = 9 to equal (7, −9); any other vector of 𝒮 of height 9 contradicts the step. |
| `chain_missing_certificate` | non-example | A sequence of decreasing bounds without step implications is not a chain: 𝒮 = {(100)} with X_0 = 1000, X_1 = 10 satisfies no step implication, and a definition that drops the step field would make soundness false. |
| `box_chain_nil` | degenerate | The vector chain without steps has final=X₀. |
| `box_chain_per_prime` | computation | Starting at (100,10), final (2,10) preserves the vector (2,9). |
| `box_chain_missing_exception` | non-example | Starting at (100,10), final (2,5) cannot cover S={(2,9)} with no exceptional vector. |
| `chain_unit_weights` | compatibility | For scalar unit weights weightedHeight equals expHeight. |

### ED.2/thue-equation

Thue equations and their solution sets

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.thueForm` | constructor | thueForm g x y := MvPolynomial.eval ![x, y] (Polynomial.homogenize g g.natDegree) ∈ ℤ. |
| `TauCeti.EffectiveDiophantine.thueSolutions` | constructor | thueSolutions g m := {p : ℤ × ℤ \| thueForm g p.1 p.2 = m}. |
| `TauCeti.EffectiveDiophantine.thueForm_one` | simp | thueForm g x 1 = g.eval x. |
| `TauCeti.EffectiveDiophantine.thueForm_zero` | simp | thueForm g x 0 = g.leadingCoeff · x^{g.natDegree}. |
| `TauCeti.EffectiveDiophantine.thueForm_smul` | simp | thueForm g (t·x) (t·y) = t^{g.natDegree} · thueForm g x y. |
| `TauCeti.EffectiveDiophantine.ThueEquation` | structure | Bundled data g, m with 3 ≤ g.natDegree, irreducibility over ℚ and m ≠ 0. |
| `TauCeti.EffectiveDiophantine.ThueEquation.finite_solutions` | other | thueSolutions g m is finite (from DiophantineApproximationAndTranscendence:DT.4/thue-equation-effective-bound). |

| Test | Kind | Required behavior |
|---|---|---|
| `thueForm_cubic` | computation | For g = X³ − 2: thueForm g x y = x³ − 2y³, so (1, 0) and (−1, −1) lie in thueSolutions g 1. |
| `thueSolutions_scaling` | characterisation | For g = X³ − 2 and m = 8: (2, 0) ∈ thueSolutions g 8 since F(2, 0) = 8, illustrating that solutions need not be primitive. |
| `thue_pell_nonexample` | non-example | g = X² − 2 (degree 2) is not a Thue equation: x² − 2y² = 1 has infinitely many integer solutions (3, 2), (17, 12), …. |
| `thue_reducible_nonexample` | non-example | g = (X − 1)³ is excluded (reducible): (x − y)³ = 1 has the infinitely many solutions (t + 1, t). |
| `thueForm_homogenize` | compatibility | thueForm g x y agrees with Σ_{k ≤ n} g.coeff k · x^k · y^{n−k}, Mathlib's Polynomial.homogenize evaluated at (x, y). |

### ED.2/thue-factor-covering

Factor coverings: units and representatives for X − ξY

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ThueFactorCovering` | structure | Data: units ε : Fin r → (𝓞 K)ˣ, a Finset M of K; fields: units_generate (every unit is ±∏ ε_i^{a_i}) and covers (every solution's f_0(X − Yξ) is f_0μ times a unit, μ ∈ M). The field rank_eq : r = NumberField.Units.rank K fixes the number of generators. |
| `TauCeti.EffectiveDiophantine.ThueFactorCovering.exists_repr` | characterisation | For (X, Y) ∈ thueSolutions g m: ∃ μ ∈ M, ∃ a : Fin r → ℤ, ∃ s ∈ {±1}, X − Yξ = s·μ·∏ ε_i^{a_i}. |
| `TauCeti.EffectiveDiophantine.ThueFactorCovering.ofDivisorRepresentatives` | constructor | Construct the covering from the explicit irreducible degree/root/field-degree/nonzero-m hypotheses, complete divisor representatives and unit generation specified in the statement; derive the norm and divisibility bridge. The input unit family has exactly rank(K) generators. |
| `TauCeti.EffectiveDiophantine.ThueFactorCovering.ofRegulatorBound` | constructor | Condition (U) from CN.2's regulator certificate for ε. |
| `TauCeti.EffectiveDiophantine.ThueFactorCovering.mono` | other | Enlarge M only to a finite M′ all of whose representatives remain nonzero. |
| `ThueFactorCovering.isMaxRank` | other | After reindexing ε using rank_eq, its logarithmic images are linearly independent over ℝ; derive from full generation and the pinned finite-index criterion. |
| `TauCeti.EffectiveDiophantine.ThueFactorCovering.solutions_eq_empty` | characterisation | For a complete covering cov with cov.M = ∅, thueSolutions g m = ∅. No representative minimum or maximum is formed. |

| Test | Kind | Required behavior |
|---|---|---|
| `covering_unit_norm` | computation | For g = X³ − 2, m = 1 (f_0 = 1, K = ℚ(∛2), r = 1, fundamental unit ε = ∛2 − 1): M = {1} is a covering, since X − Y∛2 has norm 1 and is a unit. |
| `covering_missing_rep` | non-example | For g = X³ − 2 and m = 2, the list M = {1} is not a covering: the solution (0, −1) gives X − Yξ = ∛2, of norm 2, which is not a unit. |
| `covering_units_index` | non-example | With ε = (∛2 − 1)² (index 2 in the unit group modulo ±1) condition (U) fails: ∛2 − 1 is not ±ε^a. |
| `covering_degenerate` | degenerate | If m = ±1 and f_0 = ±1 then M = {1} (or {±1}) is a covering whenever (U) holds. |
| `covering_compat_fundSystem` | compatibility | For ε := NumberField.Units.fundSystem K, condition (U) is Mathlib's NumberField.Units.exist_unique_eq_mul_prod with torsion K = {±1}. |
| `covering_zero_representative` | non-example | No ThueFactorCovering admits 0∈M. |
| `covering_redundant_units` | non-example | If Units.rank K = 1, no covering can have r = 2, including a family (ε,ε). Such a redundant family admits arbitrary cancelling exponent pairs and cannot support the claimed exponent bound. |
| `covering_empty_solutions` | degenerate | A complete covering with M = ∅ forces thueSolutions g m = ∅ by its covers field; the constants pipeline must terminate with an empty answer before taking any extrema over M. |

### ED.2/thue-analytic-constants

Certified constants of the Tzanakis–de Weger method

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ThueConstants` | structure | The rational and integer fields of the statement with the certified inequalities as fields (for instance c₁_ge : C₁ g m ≤ ĉ₁). |
| `TauCeti.EffectiveDiophantine.ThueConstants.C₁` | data | The real scalar C1 from real roots; used only in the nonempty-real-root branch. The other scalar functions are separate named entries below. |
| `TauCeti.EffectiveDiophantine.ThueConstants.ofBoxes` | constructor | From complete root boxes, covering data and a precision, return failure or the tagged no-real-root, empty-covering, or nonempty-real-root constants branch. Only the last branch forms μ± and the unit-dependent constants. |
| `TauCeti.EffectiveDiophantine.ThueConstants.inv_norm_le` | other | If ‖1 − V U‖_∞ ≤ ρ &lt; 1 then U is invertible and ‖U⁻¹‖_∞ ≤ ‖V‖_∞/(1 − ρ). |
| `TauCeti.EffectiveDiophantine.ThueConstants.mono` | other | Replacing ĉ_1, ĉ_3, ĉ_4, ĉ_5, ĉ_6, μ̂_+ and the Ŷ's by larger and ĉ_2, μ̂_− by smaller positive rationals yields a certificate whenever the coupled inequalities ĉ_6 ≥ 1.39·ĉ_1ĉ_3ĉ_4^n/ĉ_2, Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)}), Ŷ_1* ≥ max(Ŷ_1, (2ĉ_1ĉ_3/ĉ_2)^{1/n}) and Ŷ_2′ ≥ max(Ŷ_1*, 2\|m\|^{1/n}, μ̂_+/ĉ_2) hold for the new values. |
| `TauCeti.EffectiveDiophantine.ThueConstants.C₂` | data | Half the minimum distance of distinct roots. |
| `TauCeti.EffectiveDiophantine.ThueConstants.C₃` | data | The maximum ratio of differences of three distinct roots. |
| `TauCeti.EffectiveDiophantine.ThueConstants.realY₀` | data | The real-root exclusion threshold from nonreal roots, with value1 when every root is real. |
| `TauCeti.EffectiveDiophantine.ThueConstants.C₄` | data | The root-separation bound divided by the minimum embedded representative modulus for the specified covering. |
| `TauCeti.EffectiveDiophantine.ThueConstants.C₅` | data | The inverse unit-log-matrix bound for the specified covering, with rows=embeddings and columns=units. |
| `TauCeti.EffectiveDiophantine.ThueConstants.μPlus` | data | The maximum modulus over every embedding of every covering representative. |
| `TauCeti.EffectiveDiophantine.ThueBoundParameters` | structure | Supporting root/threshold inequalities and scalar parameters, with c4,c5 and μp supplied to downstream covering bounds as explicit hypotheses. This is not the full omitted ThueConstants carrier. |
| `TauCeti.EffectiveDiophantine.ThueConstants.weakenC1Bound` | other | Weaken c1 alone in ThueBoundParameters, supplying the affected Y1,Y1* and c6 inequalities. It makes no claim to the omitted full coupled mono interface. |
| `TauCeti.EffectiveDiophantine.ThueConstants.invNormBound` | data | The supporting real expression \|\|V\|\|∞/(1−ρ). |

| Test | Kind | Required behavior |
|---|---|---|
| `thueConstants_cubic` | computation | For g = X³ − 2, m = 1 (s = 1, t = 1): g′(∛2) = 3·2^{2/3} ≈ 4.762, so C_1 = 4/4.762 ≈ 0.840 and Ŷ_1 ≥ ⌈4C_1⌉ = 4; the root separation gives C_2 = ½·min\|ξ^{(i)} − ξ^{(j)}\| = ½·√3·2^{1/3} ≈ 1.091. |
| `thueConstants_totally_complex` | degenerate | For s = 0 (no real root, e.g. g = X⁴ + X + 1) C_1 and C_5 are not formed; the certificate consists of Ŷ_0 only and every solution has \|Y\| ≤ Ŷ_0. |
| `thueConstants_orientation` | non-example | With U_I = ((2, 1), (0, 1)) (rows = embeddings), the row-sum norm of U_I^{−1} = ((1/2, −1/2), (0, 1)) is 1, while that of (U_I^T)^{−1} is 3/2: the transposed convention gives a different C_5, and the certificate fixes rows = embeddings as forced by (2.1). |
| `thueConstants_inverse_bound` | compatibility | For U = the 1×1 matrix (2) and its exact inverse V = (1/2): ρ = 0 and the bound ‖V‖/(1 − ρ) = 1/2 equals ‖U^{−1}‖, agreeing with Mathlib's Matrix.linfty_opNorm_def. |
| `thueBounds_totally_complex` | characterisation | Supporting semantic bound: a ThueBoundParameters record for X⁴+X+1 gives \|y\|≤Y0 for every solution. This does not construct the raw s=0 certificate. |

### ED.2/thue-small-solutions

Exhaustive enumeration of the solutions with small |Y|

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.thueSmallSolutions` | constructor | thueSmallSolutions g m Y₁ : Finset (ℤ × ℤ), defined by the enumeration of the statement. |
| `TauCeti.EffectiveDiophantine.mem_thueSmallSolutions` | characterisation | p ∈ thueSmallSolutions g m Y₁ ↔ p ∈ thueSolutions g m ∧ \|p.2\| ≤ Y₁. |
| `TauCeti.EffectiveDiophantine.thueSmallSolutions_mono` | other | Y₁ ≤ Y₁′ implies thueSmallSolutions g m Y₁ ⊆ thueSmallSolutions g m Y₁′. |
| `TauCeti.EffectiveDiophantine.abs_lt_cauchyBound_of_thue` | other | If F(x, y) = m then \|x\| &lt; cauchyBound(P_y). |

| Test | Kind | Required behavior |
|---|---|---|
| `thueSmall_cubic` | computation | For g = X³ − 2, m = 1, Y_1 = 1: thueSmallSolutions = {(1, 0), (−1, −1)} (y = 0: x³ = 1; y = 1: x³ = 3 has no integer root; y = −1: x³ = −1). |
| `thueSmall_zero` | degenerate | For Y_1 = 0 the set is {(x, 0) : f_0x^n = m}; for g = X³ − 2, m = 8 it is {(2, 0)}. |
| `thueSmall_bound_nonexample` | non-example | Bounding \|x\| by \|m\| instead of the Cauchy bound is wrong: for g = X³ − 2 and m = −3 the pair (5, 4) is a solution with \|x\| = 5 &gt; \|m\|, while \|5\| &lt; cauchyBound(X³ − 125) = 126. |
| `thueSmall_compat` | compatibility | For every y with \|y\| ≤ Y₁, the fibre {x \| (x, y) ∈ thueSmallSolutions g m Y₁} equals (P_y).roots.toFinset for Mathlib's Polynomial.roots of P_y ∈ ℤ[X] (Polynomial.mem_roots, P_y ≠ 0); for g = X³ − 2, m = 1, y = −1 both are {−1} (P_{−1} = X³ + 1). |

### ED.2/thue-certificate

Thue solution certificates

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ThueCertificate` | structure | The data (1)–(4) of the statement, with the claimed solutions as a Finset (ℤ × ℤ). |
| `TauCeti.EffectiveDiophantine.ThueCertificate.Valid` | relation | The conjunction of all exact checks of the statement (a decidable proposition). |
| `TauCeti.EffectiveDiophantine.ThueCertificate.solutions` | projection | The claimed list L. |
| `TauCeti.EffectiveDiophantine.ThueCertificate.searchBound` | projection | The integer C bounding \|Y\| for every solution that does not come from an exceptional exponent vector. |
| `TauCeti.EffectiveDiophantine.ThueCertificate.solutions_subset` | characterisation | Valid implies L ⊆ thueSolutions g m (every listed pair passed the exact test). |
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate` | structure | Supporting mathematical summary of the field/root, bounds, reductions and claimed list. It contains proof-bearing supplier/reduction data; not the raw finite certificate. |
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate.Valid` | relation | Semantic predicate including the actual real inequalities and solution implications. No finite-evaluation claim is made. |
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate.solutions` | projection | The list stored in the supporting semantic record. |
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate.searchBound` | projection | The search integer stored in the supporting semantic record. |
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate.solutions_subset` | characterisation | Semantic validity implies that every listed point satisfies the actual equation. |

| Test | Kind | Required behavior |
|---|---|---|
| `thueCert_soundness_only` | characterisation | For g = X³ − 2, m = 1, a valid certificate has L ⊇ {(1, 0), (−1, −1)}, since these pass the small-solution enumeration. |
| `thueCert_totally_complex` | degenerate | For s = 0 (g = X⁴ + X + 1, m = 1) the certificate is (Ŷ_0, thueSmallSolutions g 1 Ŷ_0): no units, no linear forms. |
| `thueCert_bad_box` | non-example | A certificate whose ξ̃_i misses the bound \|ξ̃_i − ξ^{(i)}\| &lt; 1/(6C²) is not valid, even if L happens to be correct; validity is about the checks, not the answer. |
| `thueCert_extra_pair` | non-example | A certificate listing (2, 1) for g = X³ − 2, m = 1 is not valid: F(2, 1) = 6 ≠ 1 fails the exact test. |
| `thueCert_compat` | compatibility | solutions_subset together with ED.2/thue-certified-solution-set gives the equality of Finset coerced to Set with the Set of solutions thueSolutions g m (ED.2/thue-equation). |
| `semantic_thueCert_contains_known_solutions` | characterisation | A valid semantic record for x³−2y³=1 contains (1,0),(−1,−1). |
| `semantic_thueCert_bad_box` | non-example | A real root outside all required approximation intervals contradicts semantic validity. |
| `semantic_thueCert_extra_pair` | non-example | Listing (2,1) for x³−2y³=1 contradicts semantic validity. |
| `semantic_thueCert_compat` | compatibility | A valid semantic record with the correct field/root has membership equivalent to F(x,y)=m. |

### ED.2/thue-certified-solution-set

Certified solution sets of Thue equations

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.SemanticThueCertificate.solutions_eq` | characterisation | The existing semantic validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not raw checker soundness. |

### ED.2/thue-mahler-equation

Thue–Mahler equations and their normalised solution sets

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.thueMahlerSolutions` | constructor | thueMahlerSolutions g c p : Set (ℤ × ℤ × (Fin v → ℕ)) as in the statement. |
| `TauCeti.EffectiveDiophantine.mem_thueMahlerSolutions` | characterisation | (X, Y, z) ∈ thueMahlerSolutions g c p ↔ IsCoprime X Y ∧ IsCoprime Y f_0 ∧ thueForm g X Y = c·∏ p_i^{z_i}. |
| `TauCeti.EffectiveDiophantine.thueMahlerSolutions_monic` | equivalence | (X, Y, z) is a solution iff (x, y) = (f_0X, Y) is coprime with N(x − yθ) = f_0^{n−1}c∏p_i^{z_i} and f_0 ∣ x. |
| `TauCeti.EffectiveDiophantine.ThueMahlerEquation` | structure | Bundled g, c, p with the hypotheses of the statement. |
| `TauCeti.EffectiveDiophantine.thueMahlerSolutions_finite` | other | The set is finite (DT.4/thue-mahler-effective-finiteness). |

| Test | Kind | Required behavior |
|---|---|---|
| `thueMahler_cubic` | computation | For g = X³ − 2, c = 1, p = (5): (X, Y, z) = (1, 0, 0) and (−1, −1, 0) are solutions, and (3, 1, 2) is one since 27 − 2 = 25 = 5². |
| `thueMahler_noncoprime` | non-example | (5, 0, ·) is not a solution for g = X³ − 2, c = 1, p = (5) although 5³ = 5³: gcd(5, 0) = 5 ≠ 1; dropping coprimality makes the set infinite ((5^k, 0, 3k)). |
| `thueMahler_v_zero_compat` | compatibility | The triples with z = 0 are exactly the coprime solutions (with gcd(Y, f_0) = 1) of the Thue equation F(X, Y) = c (ED.2/thue-equation). |
| `thueMahler_sign` | degenerate | For c = −1 the instance (g, −1, p) is a different equation; for g = X³ − 2 it contains (1, 1, 0) since 1 − 2 = −1. |
| `thueMahler_nonprimitive_zero_primes` | non-example | (2,0) solves X³−2Y³=8 but is excluded by coprimality in the zero-primes normalized equation. |

### ED.2/prime-ideal-removing-lemma

The Prime Ideal Removing Lemma

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.prime_ideal_removing_unramified` | other | Supporting third-corollary uniqueness only: for a primitive integral θ whose minimal polynomial is squarefree mod p and coprime x,y, the nonzero prime ideals above p containing x−yθ form a subsingleton. |

### ED.2/thue-mahler-s-unit-covering

Thue–Mahler S-unit coverings

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ThueMahlerCovering` | structure | Units, the finite list of cases, and the fields units_generate and covers of the statement. Also rank_eq, α_ne_zero, π_ne_zero and case_wellformed enforce the stated rank and case conventions. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCovering.exists_repr` | characterisation | Every normalised solution has a case and exponents (a, n) with x − yθ = ±α∏ε^a∏π^n and z_i = n_ih_i + s′_i + t′_i. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCovering.ofIdealFactorization` | constructor | From prime-ideal factorisation certificates, principal generators and a unit certificate, the covering of the statement. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCovering.toThue` | compatibility | For v = 0 (no primes) a covering is a factor covering of the Thue equation F(X, Y) = c restricted to coprime solutions. |

| Test | Kind | Required behavior |
|---|---|---|
| `tmCovering_example_cases` | computation | For G=X³−23X²+5X+24, θ a root in the degree-three field, ordered primes(2,3,5,7) and c=±1, set ω=(2+θ−θ²)/5; π21=22+25θ+6ω, π31=31−41θ+47ω, π51=133+150θ+36ω, π52=89+100θ+24ω, π53=111−90θ−16ω, π71=1−θ. The covering case list is exactly I:(α=1,π5=π51,t3=0), II:(1,π52,0), III:(π53,π52,1), IV:(1,π53,0), V:(π52,π53,1); all h_i=1,s_i=0, and the other π_i are π21,π31,π71 with other t_i=0. Equality of the five records, not merely list length, is asserted. This is a source-derived mathematical existence regression, not a replayed finite producer. |
| `tmCovering_no_degree_one` | degenerate | When no degree-one prime is active, π_i=1 and h_i=0: the complete covering representation can be chosen with n_i=0, and z_i=s_i+t_i. The test asserts zero, not merely an unspecified exponent identity. |
| `tmCovering_missing_case` | non-example | Dropping Case III (α = π_{53}, π_5 = π_{52}) from TdW's five cases loses the solution (x, y) = (399, 302), F(399, 302) = −3^{13}·5³, listed in Case III with n_3 = 2 (TdW 17Ex): 𝔭_{52}² 𝔭_{53} exactly divides its 5-part, and no other case has this shape (Cases I, II, IV omit 𝔭_{53} or 𝔭_{52}, Case V has 𝔭_{52} to the first power); the remaining list is not a covering. |
| `tmCovering_compat_units` | compatibility | For 𝒪 = 𝓞_K and ε = NumberField.Units.fundSystem K condition (U) is Mathlib's NumberField.Units.exist_unique_eq_mul_prod. |
| `tmCovering_redundant_units` | non-example | For Units.rank K=1, no covering has r=2; redundant unit generators cannot yield bounded exponent coordinates. |
| `tmCovering_nonempty_of_solution` | characterisation | A semantic covering with an actual normalized solution has a nonempty case list. This does not prove the named missing-Case-III arithmetic regression. |

### ED.2/thue-mahler-certificate

Thue–Mahler solution certificates

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ThueMahlerCertificate` | structure | The data of the statement with the claimed solutions as a Finset (ℤ × ℤ × (Fin v → ℕ)). |
| `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.Valid` | relation | The conjunction of all exact checks. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions` | projection | The claimed list L. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions_subset` | characterisation | Valid implies L ⊆ thueMahlerSolutions g c p. |
| `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.residualBox` | projection | For each case, the finite box of exponent tuples left after the reduction. |
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate` | structure | Supporting mathematical summary of the field/root, bounds, reductions and claimed list. It contains proof-bearing supplier/reduction data; not the raw finite certificate. |
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate.Valid` | relation | Semantic predicate including the actual real inequalities and solution implications. No finite-evaluation claim is made. |
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate.solutions` | projection | The list stored in the supporting semantic record. |
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate.solutions_subset` | characterisation | Semantic validity implies that every listed point satisfies the actual equation. |
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate.residualBox` | projection | The per-case residual exponent box stored in the supporting semantic record. |

| Test | Kind | Required behavior |
|---|---|---|
| `tmCert_listed_solution` | characterisation | For g = X³ − 2, c = 1, p = (5), a valid certificate lists (3, 1, 2), since F(3, 1) = 25 passes the exact test. |
| `tmCert_wrong_z` | non-example | A certificate listing (3, 1, 1) is invalid: F(3, 1) = 25 ≠ 5. |
| `tmCert_unsieved_tuple` | non-example | A certificate whose residual box contains a tuple neither eliminated by a listed congruence nor tested is invalid, even if that tuple is not a solution. |
| `tmCert_no_primes` | degenerate | For v = 0 the certificate has no p-adic steps and reduces to a Thue certificate for coprime solutions of F(X, Y) = c. |
| `tmCert_compat` | compatibility | solutions_subset with ED.2/thue-mahler-certified-solution-set gives equality of the Finset coerced to Set with thueMahlerSolutions g c p. |
| `semantic_tmCert_contains_known_solution` | characterisation | A valid semantic record for x³−2y³=5^z contains (3,1,2). |
| `semantic_tmCert_wrong_z` | non-example | Listing (3,1,1) for x³−2y³=5^z contradicts semantic validity. |
| `semantic_tmCert_missing_solution` | non-example | A true solution absent from the claimed list contradicts semantic validity; this does not test an omitted nonsolution row. |
| `semantic_tmCert_no_primes_listed` | degenerate | Every listed triple has F=c when v=0; this does not construct a raw no-p-adic-step transcript. |
| `semantic_tmCert_compat` | compatibility | The semantic list equals the actual normalized solution set under field/root hypotheses. |

### ED.2/thue-mahler-certified-solution-set

Certified solution sets of Thue–Mahler equations

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.SemanticThueMahlerCertificate.solutions_eq` | characterisation | The existing semantic validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not raw checker soundness. |

### ED.2/s-unit-equation

The S-unit equation x + y = 1 over ℚ and its solution set

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.sUnitSolutions` | constructor | sUnitSolutions S : Set (ℚ × ℚ) as in the statement. |
| `TauCeti.EffectiveDiophantine.mem_sUnitSolutions` | characterisation | (x, y) ∈ sUnitSolutions S ↔ x ≠ 0 ∧ y ≠ 0 ∧ (∀ q, q.Prime → q ∉ S → padicValRat q x = 0 ∧ padicValRat q y = 0) ∧ x + y = 1. |
| `TauCeti.EffectiveDiophantine.sUnitSolutions_swap` | other | (x, y) ∈ sUnitSolutions S → (y, x) ∈ sUnitSolutions S, and similarly for (1/x, −y/x). |
| `TauCeti.EffectiveDiophantine.sUnitExponentHeight` | data | m(x, y) = max over p ∈ S of \|padicValRat p x\| and \|padicValRat p y\|. |
| `TauCeti.EffectiveDiophantine.sUnitSolutions_finite` | other | sUnitSolutions S is finite (DT.4/s-unit-equation-effective-finiteness). |

| Test | Kind | Required behavior |
|---|---|---|
| `sUnit_two_three` | computation | For S = {2, 3}: (3, −2), (−2, 3), (1/2, 1/2), (2, −1), (4/3, −1/3) and (−1/3, 4/3) are in sUnitSolutions S (3 − 2 = 1, 1/2 + 1/2 = 1, 2 − 1 = 1, 4/3 − 1/3 = 1). |
| `sUnit_empty` | degenerate | sUnitSolutions ∅ = ∅: x, y ∈ {±1} and x + y ∈ {0, ±2}. |
| `sUnit_nonunit` | non-example | (5, −4) is not in sUnitSolutions {2, 3} since padicValRat 5 5 = 1 ≠ 0, although 5 − 4 = 1. |
| `sUnit_compat_coprime` | compatibility | For S = {2, 3} the solution (9/8, −1/8) corresponds under DT.4/s-unit-equation-coprime-reduction to (u, v, w) = (9, −1, 8). |

### ED.2/s-unit-certificate

S-unit solution certificates

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.SUnitCertificate` | structure | The data of the statement with the claimed solutions as a Finset (ℚ × ℚ). |
| `TauCeti.EffectiveDiophantine.SUnitCertificate.Valid` | relation | The conjunction of all exact checks. |
| `TauCeti.EffectiveDiophantine.SUnitCertificate.solutions` | projection | The claimed list L. |
| `TauCeti.EffectiveDiophantine.SUnitCertificate.finalBound` | projection | The final per-prime bounds f : S → ℕ. |
| `TauCeti.EffectiveDiophantine.SUnitCertificate.solutions_subset` | characterisation | Valid implies L ⊆ sUnitSolutions S. |
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate` | structure | Supporting mathematical summary of the field/root, bounds, reductions and claimed list. It contains proof-bearing supplier/reduction data; not the raw finite certificate. |
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate.Valid` | relation | Semantic predicate including the actual real inequalities and solution implications. No finite-evaluation claim is made. |
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate.solutions` | projection | The list stored in the supporting semantic record. |
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate.finalBound` | projection | The per-prime bounds stored in the supporting semantic record. |
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate.solutions_subset` | characterisation | Semantic validity implies that every listed point satisfies the actual equation. |

| Test | Kind | Required behavior |
|---|---|---|
| `sUnitCert_two` | computation | For S = {2} (\|S\| = 1, f(2) = 1) the residual box is {±1/2, ±1, ±2} and the valid list is {(2, −1), (−1, 2), (1/2, 1/2)}. |
| `sUnitCert_empty` | degenerate | For S = ∅ the box is {±1} and the valid list is empty. |
| `sUnitCert_missing` | non-example | For S = {2, 3}, final bounds f(2) = 3, f(3) = 1 are not the end of any valid chain whose exceptional list E omits (9/8, −1/8): (9/8, −1/8) ∈ sUnitSolutions S has padicValRat 3 (9/8) = 2 &gt; 1, so a step lowering f(3) to 1 without listing it contradicts soundness (at p = 3, M = 1 the lattice is 3ℤ and the vector b = ±3 of this solution is enumerated); a notion of validity that did not check the chain steps would accept a list missing (9/8, −1/8). |
| `sUnitCert_compat` | compatibility | solutions_subset with ED.2/s-unit-certified-solution-set gives equality with sUnitSolutions S, a finite set in agreement with DT.4/s-unit-equation-effective-finiteness. |
| `semantic_sUnitCert_two` | characterisation | Existence of a semantic certificate for S={2} with f(2)=1 and the three listed pairs; no raw evaluation is asserted. |
| `semantic_sUnitCert_empty` | degenerate | A valid semantic certificate for S=∅ lists no pairs. |
| `semantic_sUnitCert_missing` | non-example | A semantic final f(3)=1 for S={2,3} requires (9/8,−1/8) among exceptions. |
| `semantic_sUnitCert_compat` | compatibility | Semantic equality yields finiteness of sUnitSolutions S. |

### ED.2/s-unit-certified-solution-set

Certified solution sets of S-unit equations over ℚ

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.SemanticSUnitCertificate.solutions_eq` | characterisation | The existing semantic validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not raw checker soundness. |

### ED.3/local-quotient-cardinality

Size of E(ℚ_v)/2E(ℚ_v) at a finite or real place

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.card_localDescentImage_padic` | compatibility | For p prime and the actual W:WeierstrassCurve.Affine Q_p in elliptic characteristic-≠2 normal form, #range(W.μ)=(if p=2 then 2 else 1)·#ker([2]:W.Point→W.Point), using the pinned W.A, W.M and corrected W.μ. |
| `TauCeti.EffectiveDiophantine.ED3.two_mul_card_localDescentImage_real` | compatibility | For the actual elliptic W over R in characteristic-≠2 normal form, 2·#range(W.μ)=#ker([2]:W.Point→W.Point). |

### ED.3/local-descent-image

Certified local image of the 2-descent map

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.span` | data | The subgroup H_v ≤ M_v generated by the classes of x_i − T. |
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.coord` | projection | The certified isomorphism κ_v : M_v ≅ (ℤ/2)^{n_v}. |
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.span_le_range` | characterisation | H_v ≤ μ_v(E(K_v)) for every certificate, complete or not. |
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.span_eq_range_of_card` | characterisation | If #H_v = #(μ_v(E(K_v))) then H_v = μ_v(E(K_v)); promoted to local-image-completeness. |
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.card_span` | simp | #H_v = 2^{rank_{𝔽₂}(c_1,…,c_k)}. |
| `TauCeti.EffectiveDiophantine.ED3.CertifiedLocalImage.localCondition_eq_comap` | compatibility | For a complete certificate, Tau Ceti's W.localCondition K_v equals the preimage of H_v under W.localRes K_v. |
| `TauCeti.EffectiveDiophantine.ED3.ellipticLocalImage` | constructor | For the genuine affine curve W over Q_p in characteristic-ne-two normal form, use W.μ and W.M imported from Tau Ceti. Given the local square-class coordinate isomorphism and actual W.Point list, bundle their images. |
| `TauCeti.EffectiveDiophantine.ED3.ellipticLocalImage_span` | compatibility | The bundled span equals closure of W.μ applied to the actual listed local points; its local condition is comap along Tau Ceti W.localRes. |

| Test | Kind | Required behavior |
|---|---|---|
| `certifiedLocalImage_real_three_roots` | computation | For y² = x³ − x at ∞ with x₁ = −1/2, x₂ = 2, #H_∞ = 2 and H_∞ = μ_ℝ(E(ℝ)). |
| `certifiedLocalImage_empty` | degenerate | With k = 0 points, H_v = ⊥ (the trivial subgroup); it is complete only when \|2\|_v^{-1}#E(K_v)[2] = 1, e.g. at ∞ for y² = x³ + 1. |
| `certifiedLocalImage_odd_good_prime` | compatibility | For y² = x³ − x at p = 5 (good, odd), a complete H_5 equals the unramified classes of norm a square, of order #E(ℚ_5)[2] = 4. |
| `certifiedLocalImage_incomplete` | non-example | For y² = x³ − x at p = 2 the single abscissa x = 1/4 (f(1/4) = −15/64, of even 2-adic valuation with −15 ≡ 1 mod 8, so a nonzero square in ℚ_2) gives #H_2 ≤ 2 &lt; 8 = [E(ℚ_2):2E(ℚ_2)], so the certificate is not complete and does not determine the local condition. |

### ED.3/two-selmer-certificate

Certified 2-Selmer group of an elliptic curve over ℚ

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.selmer` | data | The subgroup Sel(C) ≤ W.M cut out by the computed conditions. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.basis` | projection | An explicit 𝔽₂-basis of Sel(C) as classes of units of A. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.card_selmer` | simp | #Sel(C) = 2^{s(C)} with s(C) the length of the basis. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.mem_selmer_iff` | characterisation | m ∈ Sel(C) ↔ m ∈ A(S,2), N(m) = 1 and localRes_v(m) ∈ H_v for every v ∈ S ∪ {∞}. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.range_μ_le` | relation | im μ ≤ Sel(C); promoted to two-selmer-certificate-sound. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.selmer_eq_selmerGroup₂` | compatibility | Sel(C) = Tau Ceti W.selmerGroup₂ with R = 𝓞 ℚ and the auxiliary family consisting of ℝ alone; promoted to two-selmer-certificate-sound. |
| `TauCeti.EffectiveDiophantine.ED3.TwoSelmerCertificate.selmer_mono` | other | Under A(S,2)≤A(S′,2) in the actual global square-class carrier and compatibility of all new local conditions, Sel(C)≤Sel(D). With complete sound local data both equal the true Selmer group. The abstract helper records inclusion, not the actual ambient or local factory. |

| Test | Kind | Required behavior |
|---|---|---|
| `twoSelmer_x3_minus_x` | computation | For y² = x³ − x with S = {2}: #Sel(C) = 4 and Sel(C) is the image of E(ℚ)[2] = {O, (0,0), (1,0), (−1,0)}. |
| `twoSelmer_no_places` | degenerate | Without the local conditions the group would be A(S,2) ∩ ker N; for y² = x³ − x (A ≅ ℚ³, each factor contributing ℚ({2},2) = ⟨−1, 2⟩) this group has order 4³/4 = 2⁴, larger than Sel(C). |
| `twoSelmer_eq_tauceti` | compatibility | Sel(C) = W.selmerGroup₂ (with R = 𝓞 ℚ and the auxiliary family consisting of ℝ alone) for every certificate with S ⊇ badPrimes. |
| `twoSelmer_not_image` | non-example | For the actual Cremona 571a1 model [0,−1,1,−929,−10595], transported to characteristic-≠2 normal form by (x,y)↦(4x,8y+4), certify #range μ=1 and #Sel₂=4 and conclude non-equality. This exact same-name regression is omitted under §13 pending its concrete descent/local-image factory; assumed dimensions do not implement it. |
| `twoSelmer_basis_length_two` | computation | For the abstract certificate and a supplied basis of length two, the Selmer summary has cardinality four. This does not construct the x³−x arithmetic factory. |
| `twoSelmer_le_unconditioned` | compatibility | For every abstract certificate, its Selmer summary is contained in the supplied unconditioned norm kernel. This proves no numerical order of an actual cubic square-class group. |
| `twoSelmer_eq_supplied_localIntersection` | compatibility | Given the explicit outside-place, unramified and membership hypotheses for an arbitrary subgroup sel, the abstract certificate summary equals sel. This does not identify sel with the actual pinned rational-curve Selmer group. |
| `twoSelmer_cardinality_gap` | non-example | Given abstract image order one and certificate Selmer order four, the image differs from the certificate summary. The actual 571a1 arithmetic regression is separately omitted. |

### ED.3/quartic-local-solubility

Certified local solubility test for y² = g(x)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.quarticLocallySoluble_iff` | characterisation | quarticLocallySoluble g v = true ↔ y² = g(x) has a point over ℚ_v on its smooth projective model (affine or at infinity); promoted to quartic-local-solubility-correct. |
| `TauCeti.EffectiveDiophantine.ED3.quarticLocallySoluble_reverse` | simp | For degree-four g with nonzero discriminant and g.coeff 0 ≠ 0, and v=∞ or a prime, quarticLocallySoluble g v = quarticLocallySoluble g* v. When g.coeff 0=0, g already has the rational point (0,0); the internal reciprocal chart still uses the fixed five-coefficient reversal. |
| `TauCeti.EffectiveDiophantine.ED3.quarticLocallySoluble_scale` | other | Replacing g(x) by u²g(x) with u ∈ ℤ ∖ {0} does not change the value. Assume degree four, nonzero discriminant and v=∞ or a prime. |
| `TauCeti.EffectiveDiophantine.ED3.zpSoluble_fuel` | other | Fuel v_p(disc g) + 2 suffices; larger fuel gives the same value. Assume degree-four g, g.discr ≠ 0 and p prime. |
| `TauCeti.EffectiveDiophantine.ED3.quarticLocallySoluble_of_good` | relation | For odd p ∤ disc g the value is true. |
| `TauCeti.EffectiveDiophantine.ED3.zpSoluble` | data | The recursive ℤ_p test ZpSoluble(g, x_k, k) of the statement (Lemma 6 rules for odd p, Lemma 7 rules for p = 2), with an explicit fuel argument bounding the recursion depth. |

| Test | Kind | Required behavior |
|---|---|---|
| `quartic_lind_reichardt_two` | computation | quarticLocallySoluble (2x⁴ − 34) 2 = true and quarticLocallySoluble (2x⁴ − 34) 17 = true. |
| `quartic_negative_definite` | degenerate | For g = −x⁴ − 1, the value at ∞ is false and the value at every odd p ∤ disc g is true. |
| `quartic_square_leading` | characterisation | If a is a nonzero square then the value is true at every v (points at infinity). |
| `quartic_not_mod_p_only` | non-example | Solubility modulo p alone is not the test: y² ≡ 3x⁴ + 3 (mod 3) has the solutions y = 0, yet quarticLocallySoluble (3x⁴ + 3) 3 = false, since 3x⁴ + 3 has odd 3-adic valuation for every x ∈ ℚ_3 and the leading coefficient 3 is not a square. |
| `quartic_reverse_zero_constant` | degenerate | The fixed quartic reversal of X⁴+X is X³+1 and its fixed reversal returns X⁴+X. Polynomial.reverse applied to X³+1 would return X³+1 instead. |

### ED.3/two-isogeny-descent-map

The descent map for a rational 2-isogeny

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyDescentMap` | constructor | α as an additive-to-multiplicative homomorphism E(ℚ) → (ℚ^×/ℚ^{×2}). |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyDescentMap_some` | simp | α(x, y) = class of x for x ≠ 0. |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyDescentMap_zero_zero` | simp | α(0, 0) = class of d. |
| `TauCeti.EffectiveDiophantine.ED3.ker_twoIsogenyDescentMap` | characterisation | ker α = φ′(E′(ℚ)). |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyDescentMap_mem_selmer` | relation | α(P) ∈ S^{(φ′)} = {d₁ : H(d₁, c, d/d₁) everywhere locally soluble}. |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogeny_comp` | compatibility | φ′ ∘ φ = nsmulAddMonoidHom 2 on E(ℚ), so 2E(ℚ) ≤ φ′(E′(ℚ)). |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyCurve` | data | The Weierstrass curve y² = x(x² + cx + d) over ℚ (a₂ = c, a₄ = d, other coefficients 0); E′ is the same construction for (−2c, c² − 4d). |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogeny` | data | φ : E(ℚ) → E′(ℚ), (x, y) ↦ (y²/x², y(x² − d)/x²), as a homomorphism of additive groups. |
| `TauCeti.EffectiveDiophantine.ED3.twoIsogenyDual` | data | φ′ : E′(ℚ) → E(ℚ), (x, y) ↦ (y²/(4x²), y(x² − d′)/(8x²)), as a homomorphism of additive groups. |

| Test | Kind | Required behavior |
|---|---|---|
| `twoIsogeny_E24` | computation | For c = −1, d = 1 (E24 : y² = x³ − x² + x): n₂ = 1 and n₂′ = 4 with S^{(φ)} = {±1, ±3}. |
| `twoIsogeny_identity` | degenerate | α(O) = 1 and α(P) = 1 for every P ∈ φ′(E′(ℚ)); for d a square, α(0,0) = 1. |
| `twoIsogeny_x_nonzero` | characterisation | For P = (x, y) with x ≠ 0, α(P) = 1 iff x is a rational square. |
| `twoIsogeny_not_x_coordinate_at_zero` | non-example | α(0,0) is the class of d, not of x(0,0) = 0: the naive rule x ↦ x is undefined there; for y² = x³ − 68x, α(0,0) = −17 ≠ 1. |

### ED.3/explicit-height-difference-bound

Cremona's rational height difference bound

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.cremonaMu` | data | μ_C=((log\|Δ\|+log⁺j)/6+log⁺(b₂/12)+log(2*))/2, with log⁺t=log max(1,\|t\|), for an integral standard equation over Q. |

### ED.3/canonical-height-enclosure

Certified enclosure of the canonical height by doubling

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.canonicalHeight_mem_canonicalHeightEnclosure` | characterisation | For the explicit λ⁻,λ⁺,c⁻,c⁺ with certified log/error inequalities and integral elliptic W, ĥ(P) lies in canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺. |
| `TauCeti.EffectiveDiophantine.ED3.canonicalHeightEnclosure_width_le` | other | For explicit λ⁻≤λ⁺ and c⁻,c⁺≥0, width(canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺)≤((λ⁺−λ⁻)/2+c⁺+c⁻)/4ⁿ, including the zero branch. No existential unspecified constant replaces this formula. |
| `TauCeti.EffectiveDiophantine.ED3.canonicalHeightEnclosure_zero` | simp | canonicalHeightEnclosure W 0 n λ⁻ λ⁺ c⁻ c⁺=[0,0] for arbitrary rational inputs. |
| `TauCeti.EffectiveDiophantine.ED3.canonicalHeightEnclosure_neg` | simp | With the same rational data on both sides, canonicalHeightEnclosure W (−P) n λ⁻ λ⁺ c⁻ c⁺=canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺. |
| `TauCeti.EffectiveDiophantine.ED3.neronTatePairing_mem_pairingEnclosure` | compatibility | With integral elliptic W, the three certified naive-height log intervals at 2ⁿ(P+Q),2ⁿP,2ⁿQ and the shared certified c⁻,c⁺, pairingEnclosure contains (ĥ(P+Q)−ĥ(P)−ĥ(Q))/2. |
| `TauCeti.EffectiveDiophantine.ED3.pairingEnclosure` | data | pairingEnclosure W P Q n bounds c⁻ c⁺ uses bounds:Fin3→Q×Q in order P+Q,P,Q, and forms [(I.lower−J.upper−L.upper)/2,(I.upper−J.lower−L.lower)/2] from their three height intervals with the shared error bounds. |

| Test | Kind | Required behavior |
|---|---|---|
| `enclosure_torsion` | computation | For y²=x³+1 and P=(−1,0) of order2, canonicalHeightEnclosure returns [0,0] for every n≥1 and every supplied rational endpoint/error input. |
| `enclosure_origin` | degenerate | At O the constructor returns [0,0] for every n and all four rational inputs. |
| `enclosure_contains_tauceti` | compatibility | On y²=x³+1, for any point and n, explicitly certified rational log/error inputs give containment of the pinned half-height canonicalHeight. |
| `enclosure_not_naive` | non-example | For P=(2,3) on y²=x³+1, ĥ(P)=0 while naiveHeight(P)/2=log(2)/2&gt;0. At n=0, certified rational λ⁻≤log2≤λ⁺ and c⁻,c⁺ give an interval containing0; the raw naive value alone fails. |
| `enclosure_width_budget` | computation | With log endpoints a,a+1/8 and error bounds2,3 the raw interval width is at most81/(16·4ⁿ), including the Q=O branch. This arithmetic regression distinguishes both the factor1/2 on the log width and the factor4ⁿ. |

### ED.3/height-lower-bound-by-search

Lower bound for the canonical height of non-torsion points by a certified search

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.heightCoordinatePoints` | constructor | For an actual group equivalence e:A≃(Z^r)×T with finite torsion T, enumerate all coordinates in [-D,D]^r and every t∈T, transporting through e⁻¹. |
| `TauCeti.EffectiveDiophantine.ED3.mem_heightCoordinatePoints` | characterisation | P is enumerated iff every free coordinate of e(P) has \|a_i\|≤D; the torsion coordinate is unrestricted. |
| `TauCeti.EffectiveDiophantine.ED3.heightCoordinatePoints_complete` | characterisation | Given λ&gt;0 with λΣa_i²≤height(P), and B&lt;λ(D+1)², every P of height≤B belongs to the enumerated list. The Jacobian supplier must derive this λ from its positive-definite Gram form. |

| Test | Kind | Required behavior |
|---|---|---|
| `heightCoordinates_rank_zero` | degenerate | For r=0 every point belongs to the sole finite torsion fibre; no positive-dimensional ball-volume theorem is used. |
| `heightCoordinates_torsion_fibres` | computation | For Z×Z/2 with D=0 the list has two elements, one for each torsion value. |
| `heightCoordinates_kernel_nonexample` | non-example | The zero form on Z has an infinite bounded set, so semidefiniteness alone cannot supply bounded enumeration. |

### ED.3/p-saturated

p-saturated subgroups

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.IsPSaturated` | constructor | IsPSaturated G p holds iff every a ∈ A with p·a ∈ G lies in G. |
| `TauCeti.EffectiveDiophantine.ED3.isPSaturated_iff` | characterisation | IsPSaturated G p ↔ A[p] ≤ G ∧ G ⊓ (p • ⊤) = p • G. |
| `TauCeti.EffectiveDiophantine.ED3.isPSaturated_iff_not_dvd_index` | characterisation | For G of finite index and p prime: IsPSaturated G p ↔ ¬ p ∣ G.index. |
| `TauCeti.EffectiveDiophantine.ED3.isPSaturated_top` | simp | ⊤ is p-saturated. |
| `TauCeti.EffectiveDiophantine.ED3.IsPSaturated.inf` | structure | The intersection of p-saturated subgroups is p-saturated. |
| `TauCeti.EffectiveDiophantine.ED3.index_eq_one_of_forall_isPSaturated` | relation | If G has finite index ≤ N and is p-saturated for every prime p ≤ N, then G = ⊤. |
| `TauCeti.EffectiveDiophantine.ED3.saturation` | data | The saturation Ḡ = {a : ∃ n ≥ 1, n • a ∈ G}, the smallest saturated subgroup containing G. |

| Test | Kind | Required behavior |
|---|---|---|
| `isPSaturated_six_int` | computation | In ℤ: (6ℤ) is 5-saturated, not 2-saturated, not 3-saturated. |
| `isPSaturated_top_any` | degenerate | ⊤ ≤ A is p-saturated for every p. |
| `isPSaturated_index_coprime` | compatibility | For G = (6ℤ) ≤ ℤ with AddSubgroup.index = 6: IsPSaturated G p ↔ ¬ p ∣ 6. |
| `isPSaturated_torsion_missing` | non-example | In A = ℤ × ℤ/2, G = ℤ × 0 has G ∩ 2A = 2G but is not 2-saturated, since A[2] ⊄ G: the injectivity of G/pG → A/pA alone is not p-saturation. |

### ED.3/finite-index-subgroup-certificate

Certified finite-index subgroup of a Mordell–Weil group

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.subgroup` | data | G = AddSubgroup.closure (range g). |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.finrank_eq` | projection | Module.finrank ℤ A = r. |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.finiteIndex` | instance | G.FiniteIndex. |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.coprime_index` | characterisation | For p ∈ Π, Nat.Coprime G.index p. |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.torsion_eq` | characterisation | The listed torsion is exactly the set of a ∈ A of finite order. |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.coprime_index_prod` | compatibility | Nat.Coprime G.index N for N a product of primes of Π: the hypothesis of ED.5/subgroup-covers-quotient. |
| `TauCeti.EffectiveDiophantine.ED3.FiniteIndexSubgroupCertificate.ofMordellWeilBasis` | constructor | A Mordell–Weil basis certificate gives a certificate with G = A for every Π. |

| Test | Kind | Required behavior |
|---|---|---|
| `finiteIndexCert_fps` | computation | For C₀(5): G = ⟨[∞⁺ − ∞⁻]⟩, r = 1, Π = {3}; coprime_index gives 3 ∤ [J(ℚ):G]. |
| `finiteIndexCert_rank_zero` | degenerate | If r = 0 and G = A_tors then G = A and the certificate holds for every Π. |
| `finiteIndexCert_index_one` | compatibility | If Π contains every prime ≤ N and [A:G] ≤ N then G = A, the Mordell–Weil basis certificate. |
| `finiteIndexCert_independent_points_only` | non-example | Independent points P₁,…,P_r without a rank upper bound do not give a certificate: for Stoll's X₀^dyn(6), G ≅ ℤ³ is certified but rank J(ℚ) ≤ 3 is only conditional, so finite index is not certified. |

### ED.4/good-reduction-chabauty-datum

Good-reduction Chabauty datum: curve, base point, smooth model and residue discs

| Declaration | Role | Mathematical contract |
|---|---|---|
| `GoodReductionChabautyDatum.red` | projection | red : X(ℚ_p) → X̃(𝔽_p), P ↦ reduction of the unique extension Spec ℤ_p → 𝒳 of P. |
| `GoodReductionChabautyDatum.red_surjective` | characterisation | red is surjective. |
| `GoodReductionChabautyDatum.residueDisc` | constructor | D(x̃) := red⁻¹(x̃); the residue discs over x̃ ∈ X̃(𝔽_p) partition X(ℚ_p). |
| `GoodReductionChabautyDatum.localParam_bijOn` | characterisation | For a local parameter t_x̃ the map P ↦ t_x̃(P) is a bijection D(x̃) → pℤ_p, with inverse given by power series in ℤ_p[[t]]. |
| `GoodReductionChabautyDatum.redJ_comp_abelJacobi` | compatibility | red_J(ι_O(P)) = ι_Õ(red P) for P ∈ X(ℚ_p); in particular ι_O(Q') − ι_O(Q) ∈ J¹(ℚ_p) when red Q = red Q'. |
| `GoodReductionChabautyDatum.toGoodReductionPair` | coercion | The good-reduction pair (𝒳, Ō) of ColemanIntegration:L1/good-reduction-pair, whose residue discs over 𝔽_p-points meet X(ℚ_p) in the D(x̃). |
| `TauCeti.EffectiveDiophantine.ED4.ReductionDiscData` | structure | Supporting abstract reduction maps, compatible set map to J, and chosen disc parameters; does not assert smooth curve or geometric Abel–Jacobi properties. |
| `TauCeti.EffectiveDiophantine.ED4.ReductionDiscData.baseResidueDisc` | projection | A residue label and its fibre as a set. This product is not the Coleman good-reduction pair. |

| Test | Kind | Required behavior |
|---|---|---|
| `datum_C05_three` | computation | For y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 and p = 3 the two-chart Weierstrass model is smooth over ℤ_3 and X̃(𝔽_3) = {∞⁺, ∞⁻, (0, 1), (0, −1)}: four residue discs. |
| `datum_MP_example_one` | computation | For y² = x(x − 1)(x − 2)(x − 5)(x − 6) and p = 7, X̃(𝔽_7) = {(0,0), (1,0), (2,0), (5,0), (6,0), (3,6), (3,−6), ∞}, eight residue discs. |
| `datum_elliptic_three` | degenerate | For y²=x³−x over F₃ the genus-one special fibre has four points including infinity. Full disc charts require the geometric factory; infinity is a full formal disc, never an isolated Option.none. |
| `datum_not_smooth_at_five` | non-example | The model y² = x(x − 1)(x − 2)(x − 5)(x − 6) over ℤ_5 is not a datum: its reduction y² = x²(x − 1)²(x − 2) is singular at (0, 0) and (1, 0). |
| `datum_residueDisc_eq_tube` | compatibility | D(x̃) equals the set of ℚ_p-points of the residue disc ]x̃[ of ColemanIntegration:L1/residue-disc-parametrisation for the pair (𝒳, Ō). |
| `datum_param_fibre` | compatibility | For supporting ReductionDiscData, the chosen param at a residue label is a bijection on its set-theoretic fibre. This does not identify a Coleman analytic tube. |

### ED.4/abelian-logarithm

The p-adic abelian logarithm and the integration pairing

| Declaration | Role | Mathematical contract |
|---|---|---|
| `abelianLog` | data | log_A : A(K) →+ Lie(A). |
| `abelianLog_eq_formalLog` | characterisation | On A¹(K) = F̂(m_K), log_A(x) = log_F̂(s(x)) for any choice of formal parameters s. |
| `abelianLog_nsmul` | simp | log_A(n • x) = n • log_A(x) for n ∈ ℤ. |
| `ker_abelianLog` | characterisation | log_A x = 0 ↔ x has finite order; A(K)_tors is finite. |
| `abelianLog_map` | functoriality | log_B(φ x) = dφ(log_A x) for a homomorphism φ : A → B; log_{id} = id and log respects composition. |
| `abelianLog_baseChange` | compatibility | For K'/K finite, log_{A_{K'}}(x) = log_A(x) ⊗ 1 for x ∈ A(K). |
| `integrationPairing` | constructor | ⟨x, ω⟩ := ω(log_A x) for x ∈ A(K), ω ∈ Ω_A = Module.Dual K Lie(A). |
| `integrationPairing_eq_zero_iff` | characterisation | ⟨x, ω⟩ = 0 for all ω iff x is torsion; ⟨x, ω⟩ = 0 for all x iff ω = 0. |
| `abelianLog_unique` | universal-property | A continuous homomorphism λ : A(K) → Lie(A) that agrees with log_F̂ on some open subgroup equals log_A. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension` | other | Supporting extension A→+T of a supplied homomorphism on a finite-index subgroup from FormalLogDatum; no abelian variety or analytic construction is encoded. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension_eq_formalLog` | other | The abstract extension restricts to the supplied subgroup homomorphism. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension_zsmul` | other | The abstract extension commutes with integer scalar multiplication. |
| `TauCeti.EffectiveDiophantine.ED4.ker_formalLogExtension` | other | The abstract extension has torsion kernel, using the supplied torsion-kernel hypothesis on the subgroup. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension_map` | other | Two abstract extensions commute with supplied group/linear maps when their restrictions satisfy the explicit compatibility hypothesis. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension_compatible_inclusion` | other | Abstract inclusion compatibility under the supplied restricted-map identity; this does not construct geometric scalar extension. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogPairing` | other | Evaluate a supplied linear functional on formalLogExtension; the dual is not identified with invariant differentials. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogPairing_eq_zero_iff` | other | Vanishing against every abstract linear functional is equivalent to finite additive order. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogExtension_unique` | other | A homomorphism extending the supplied finite-index subgroup homomorphism equals formalLogExtension. |

| Test | Kind | Required behavior |
|---|---|---|
| `abelianLog_elliptic` | compatibility | For an elliptic curve E over ℚ_p with good reduction and minimal Weierstrass model, log_E on E¹(ℚ_p) is the formal-group logarithm of the Weierstrass formal group in the parameter z = −x/y (dimension one, the case of Mathlib's FormalGroup). |
| `abelianLog_torsion` | degenerate | log_A(x) = 0 for every torsion point x; for dim A = 0 the logarithm is the zero map to the zero space. |
| `abelianLog_E11_five_torsion` | non-example | For E : y² + y = x³ − x² over ℚ_5 the point (0, 0) has order 5, so log_E(0, 0) = 0: log_A is not injective, and a definition requiring an inverse exponential on all of A(K) is wrong. |
| `abelianLog_C05_kernel_point` | computation | For the Jacobian of y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3, D' = [(0, −1) + (−3, 1) − ∞⁺ − ∞⁻] lies in J¹(ℚ_3) with Flynn's local parameters (s₁, s₂) = (−9/14, 426/49), and its formal logarithm is ≡ (36, 3) (mod 3⁴) (Flynn–Poonen–Schaefer p.22). |
| `integrationPairing_leftKernel` | characterisation | If ω ∈ Ω_A satisfies ⟨x, ω⟩ = 0 for all x ∈ A(K), then ω = 0. |
| `formalLogExtension_eq_formalLog_rankOne` | compatibility | For arbitrary FormalLogDatum with rank-one target, the extension agrees with its supplied subgroup homomorphism; this does not identify an elliptic formal group. |
| `formalLogExtension_torsion` | degenerate | A torsion element of the arbitrary additive group maps to zero. |
| `formalLogExtension_noninjective_of_fiveTorsion` | non-example | A supplied nonzero element killed by5 makes the extension noninjective; the elliptic curve and its torsion point are not constructed. |
| `formalLogExtension_preserves_threeAdicCongruence` | computation | A supplied subgroup element whose supplied formal logarithm is congruent to(36,3) modulo3^4 has the same congruence under the extension; no C₀(5) point or formal-group computation is supplied. |
| `formalLogPairing_rightKernel` | characterisation | If a linear functional vanishes on the entire abstract extension image, it is zero by the supplied spanning hypothesis (the right kernel in point-first order). |

### ED.4/abelian-integral

Abelian integrals of regular differentials on a curve

| Declaration | Role | Mathematical contract |
|---|---|---|
| `abelianIntegral` | constructor | ∫_D ω := ⟨[D], ω_J⟩ for a Galois-stable degree-zero divisor D and ω ∈ H⁰(X, Ω¹). |
| `abelJacobi_pullback_bijective` | equivalence | ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) is bijective and independent of O. |
| `abelianIntegral_add` | simp | ∫_{D+D'} ω = ∫_D ω + ∫_{D'} ω and ∫_D (aω + bω') = a∫_D ω + b∫_D ω'. |
| `abelianIntegral_eq_zero_iff` | characterisation | ∫_D ω = 0 for all ω iff [D] is torsion in J; in particular ∫_{div f} ω = 0. |
| `abelianIntegral_map` | functoriality | ∫_D ρ*ω = ∫_{ρ_*D} ω for a morphism ρ : X → Y. |
| `abelianIntegral_trace` | compatibility | ∫_{ρ*E} ω = ∫_E Tr_ρ ω for ρ finite and E of degree zero on Y. |
| `abelianIntegral_baseChange` | compatibility | Compatible with finite extensions K'/K. |
| `TauCeti.EffectiveDiophantine.ED4.pullback_basepoint_independent` | compatibility | For two actual base points O,O′ of X, the pullback maps H⁰(J,Ω¹)→H⁰(X,Ω¹) along their geometric Abel–Jacobi morphisms agree. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral` | other | Evaluate formalLogExtension using a supplied linear equivalence Ω≃Dual(T); this does not construct a curve, divisor class or regular differential. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral_add` | other | Additivity and scalar linearity of the supplied formal-log evaluation. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral_eq_zero_iff` | other | Formal-log evaluation vanishes against every element of the supplied Ω iff the abstract class is torsion. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral_map_of_pairingIdentity` | other | The change-of-variables equality follows from an explicitly supplied pairing identity; no geometric map or pullback is constructed. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral_trace_of_pairingIdentity` | other | The trace equality follows from an explicitly supplied pairing identity; no geometric divisor pullback or differential trace is constructed. |
| `TauCeti.EffectiveDiophantine.ED4.formalLogIntegral_compatible_inclusion_of_pairingIdentity` | other | The inclusion equality follows from an explicitly supplied pairing identity; no field-base-change construction is encoded. |
| `TauCeti.EffectiveDiophantine.ED4.suppliedDualEquiv_ext` | other | Extensionality for two supplied linear equivalences that agree pointwise. |

| Test | Kind | Required behavior |
|---|---|---|
| `abelianIntegral_C05_tiny` | computation | On y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3: ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ (mod 3⁵) and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵). |
| `abelianIntegral_self` | degenerate | ∫_Q^Q ω = 0 and ∫_D 0 = 0. |
| `abelianIntegral_weierstrass_half` | characterisation | On y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1 over ℚ_3 let W be the Weierstrass point with x(W) ≡ 1 (mod 3), S^± = (1, ±3); then 2W ∼ S⁺ + S⁻, so 2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω for every regular ω. |
| `abelianIntegral_genusOne` | compatibility | For X = E an elliptic curve and O its origin, ι_O is the identity of E = J and ∫_O^P ω = ⟨P, ω⟩ is the elliptic logarithm paired with ω. |
| `abelianIntegral_torsion_nonexample` | non-example | For E : y² + y = x³ − x² over ℚ_5, ∫_O^{(0,0)} ω = 0 for every ω although (0, 0) ≠ O: the integral sees divisor classes modulo torsion, not points. |
| `formalLogIntegral_seriesCongruences_of_primitiveIdentity` | computation | For supplied residue data, the displayed power-series square-root equation and an assumed primitive identity imply the two3-adic congruences; identification with actual C₀(5) points and forms is omitted. |
| `formalLogIntegral_zero` | degenerate | Evaluation of the zero abstract class is zero. |
| `formalLogIntegral_double_of_classRelation` | characterisation | A supplied relation2w=s in the abstract additive group gives twice the evaluation atw equal to that ats; no Weierstrass divisor relation is proved. |
| `formalLogIntegral_eq_pairing` | compatibility | The supplied Ω-to-dual equivalence identifies formalLogIntegral with formalLogPairing; no elliptic curve or genus hypothesis is encoded. |
| `formalLogIntegral_eq_zero_of_fiveTorsion` | non-example | A supplied class killed by5 has zero evaluation; the concrete elliptic point is not constructed. |

### ED.4/coleman-abelian-comparison

Coleman integrals of regular differentials are abelian integrals

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED4.residueConstantDifference_eq_zero_of_frobeniusRelation` | other | Algebraic uniqueness for a candidate function on ReductionDiscData: its difference from formalLogIntegral is constant on fibres, satisfies the supplied Frobenius-polynomial relation with P coprime to X^m−1 for every m≥1, and vanishes at the base point. No Coleman primitive or cohomological Frobenius relation is constructed. |

### ED.4/annihilating-differentials

Annihilating (vanishing) differentials of a Mordell–Weil subgroup

| Declaration | Role | Mathematical contract |
|---|---|---|
| `annihilatingDifferentials` | constructor | Ann_p(Γ) as a ℚ_p-subspace of H⁰(X_{ℚ_p}, Ω¹). |
| `mem_annihilatingDifferentials` | characterisation | ω ∈ Ann_p(Γ) ↔ ∀ γ ∈ Γ, ⟨γ, ω_J⟩ = 0. |
| `annihilatingDifferentials_eq_dualAnnihilator` | equivalence | Under ω ↦ ω_J, Ann_p(Γ) = (span_{ℚ_p} log_J Γ).dualAnnihilator. |
| `annihilatingDifferentials_of_finiteIndex` | characterisation | G ≤ Γ of finite index ⇒ Ann_p(G) = Ann_p(Γ). |
| `annihilatingDifferentials_antitone` | relation | Γ ≤ Γ' ⇒ Ann_p(Γ') ≤ Ann_p(Γ). |
| `finrank_annihilatingDifferentials` | other | dim Ann_p(Γ) = g − dim span log Γ ≥ g − rank Γ. |
| `annihilatingDifferentials_saturation` | relation | Ann_p(Γ) = Ann_p(Γ^sat) = Ann_p(closure of Γ). |
| `annihilatingDifferentials_eq_ker` | equivalence | For generators D₁, …, D_r of Γ and a basis ω₁, …, ω_g, Σ c_i ω_i ∈ Ann_p(Γ) ↔ Σ_i c_i ∫_{D_j} ω_i = 0 for all j. |
| `reducedAnnihilator` | projection | Ṽ := image of Ann_p(Γ) ∩ H⁰(𝒳, Ω¹) in H⁰(X̃, Ω¹); dim_{𝔽_p} Ṽ = dim Ann_p(Γ). |

| Test | Kind | Required behavior |
|---|---|---|
| `annihilator_C05_three` | computation | For C₀(5): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, p = 3 and G = ⟨[(−3,1) − (0,1)]⟩ (finite index in J(ℚ) ≅ ℤ), Ann_3(G) = ℚ_3·(ε dx/y + x dx/y) with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴), and Ṽ = 𝔽_3·x dx/y. |
| `annihilator_C132_three` | computation | For C₁(3₂): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, p = 3 and G = ⟨[S⁺ − S⁻]⟩, S^± = (1, ±3), Ann_3(G) = ℚ_3·(α dx/y + x dx/y) with α ≡ 68 (mod 3⁴), so Ṽ = 𝔽_3·(x − 1) dx/y (computed from ∫_{S⁻}^{S⁺} dx/y ≡ 174 and ∫_{S⁻}^{S⁺} x dx/y ≡ 75 (mod 3⁵), tiny integrals with parameter y + 3). |
| `annihilator_zero` | degenerate | Ann_p(0) = Ann_p(J(ℚ_p)_tors) = H⁰(X_{ℚ_p}, Ω¹), of dimension g. |
| `annihilator_top` | characterisation | Ann_p(J(ℚ_p)) = 0, by left non-degeneracy of the pairing. |
| `annihilator_small_subgroup_nonexample` | non-example | For C₀(5) and the subgroup 0 (not of finite index in J(ℚ) ≅ ℤ), dx/y ∈ Ann_3(0) but ∫_{(0,1)}^{(−3,1)} dx/y ≢ 0 (mod 3²): differentials annihilating a subgroup of smaller rank need not annihilate J(ℚ). |
| `annihilator_dualAnnihilator` | compatibility | Ann_p(Γ) corresponds to Mathlib's Submodule.dualAnnihilator of span_{ℚ_p}(log_J Γ) in Module.Dual ℚ_p Lie(J). |

### ED.4/hyperelliptic-residue-discs

Integral differentials and residue-disc parameters for good-reduction hyperelliptic models

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED4.hyperelliptic_chart_powerSeries` | other | Supporting local polynomial/power-series identity; the integral differential basis and its orders are omitted. |

### ED.4/residue-disc-verdict

Residue-disc verdicts: certified zero counts accounting for every zero

| Declaration | Role | Mathematical contract |
|---|---|---|
| `ResidueDiscVerdict.zeros` | data | Z_rat ∪ Z_irr, the listed zeros of η on D(x̃). |
| `ResidueDiscVerdict.Valid` | characterisation | The executable Boolean check on finite raw coefficient/tail/subdivision/point data succeeds; no quantifier over all curve points, coefficients of an unspecified infinite series or possible future roots occurs in this predicate. |
| `ResidueDiscVerdict.rationalPoints_eq` | characterisation | For the actual curve/differential/disc interpretation and sound imported finite arithmetic/analytic certificate producers, check=true implies X(ℚ)∩D(x̃)=Z_rat. Geometry, coefficient interpretation and tail soundness are explicit theorem hypotheses, not payload assertions. |
| `ResidueDiscVerdict.ofKnownPoint` | constructor | The verdict based at a listed rational point B (c_B = 0). |
| `ResidueDiscVerdict.empty` | constructor | The verdict with N = 0, proving X(ℚ) ∩ D(x̃) = ∅. |
| `ResidueDiscVerdict.card_le` | relation | #(X(ℚ) ∩ D(x̃)) ≤ N for a valid verdict. |
| `ResidueDiscVerdict.changeBase` | other | Recompute the affine-substitution coefficient tables, integration constant and certified tail/partition data at the new base point; prove that the recomputed accepted payload describes the same zeros. Arbitrarily changing a stored point is not validity preservation. |
| `ResidueDiscVerdict.rawData` | data | The finite integer/residue tables, ball-prefix tree, exact point descriptors and arithmetic relation transcripts; no ℚ_p value, infinite series or universal correctness proof is a raw field. |
| `ResidueDiscVerdict.check` | characterisation | Terminating finite checker; Valid iff check=true. Inadequate precision, a missing child, unresolved point identity or an unverified tail causes failure rather than a completeness verdict. |
| `RawDiscCoefficientWitness` | data | Supporting proof-free finite coefficient data: precision M, minimum-valuation claim m, last-index claim N, and a finite list of canonical natural-number residues modulo p^M. It does not store a p-adic series or a tail proof. |
| `RawDiscCoefficientWitness.check` | characterisation | Checks p≥2, M&gt;m, N&lt;list length, length≥2(m+1), canonical residues, divisibility of every residue by p^m, nondivisibility of residue N by p^(m+1), and divisibility of every later residue by p^(m+1). Only finite arithmetic is used. |
| `RawDiscCoefficientWitness.dominant_of_check` | compatibility | For prime p and an actual coefficient sequence b_n in ℚ_p, if all table congruences modulo p^M and the strict infinite tail bound beyond its length are independently proved, check=true implies \|b_N\|=p^(−m), all coefficients have norm≤p^(−m), and every coefficient after N has norm&lt;p^(−m). This is a coefficient theorem, not a curve or tail-construction theorem. |

| Test | Kind | Required behavior |
|---|---|---|
| `verdict_C05_disc_zero_one` | computation | For C₀(5), p = 3, x̃ = (0, 1): B = (0, 1), t = x, N = 2, Z_rat = {(0, 1), (−3, 1)}, Z_irr = ∅ is valid. |
| `verdict_C132_weierstrass` | computation | For C₁(3₂), p = 3, x̃ = (1, 0): B = S⁻ = (1, −3), t = y + 3, N = 3, Z_rat = {S⁻, S⁺}, Z_irr = {W} with W the Weierstrass point over ℚ_3 (x(W) a root of x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, which has no rational root; c_B = 0 and 2(ι_O(W) − ι_O(S⁻)) = [S⁺ − S⁻] ∈ G) is valid. |
| `verdict_empty` | degenerate | A valid verdict with N = 0 proves that D(x̃) contains no rational point. |
| `verdict_known_zeros_only` | non-example | For C₁(3₂) at x̃ = (1, 0), the tuple with N = 3, Z_rat = {S⁻, S⁺}, Z_irr = ∅ is not a verdict (#Z ≠ N): listing the known rational zeros without accounting for every zero proves nothing. |
| `verdict_rationalPoints_eq` | characterisation | If the verdict is valid and P ∈ X(ℚ) reduces to x̃, then P ∈ Z_rat. |
| `verdict_reject_unknown_dominant` | non-example | A coefficient table whose entries are all zero modulo the recorded precision does not certify a nonzero series or last dominant coefficient and is rejected. |
| `verdict_reject_tail_tie` | non-example | A tail bound permitting a coefficient beyond N at the same norm as the claimed dominant coefficient is rejected; a strict tail bound is required. |
| `verdict_reject_missing_child` | non-example | For p=3, subdividing a ball into only the residue children0 and1 omits child2 and is rejected even if both supplied leaves have valid zero counts. |
| `verdict_reject_duplicate_zero` | non-example | Counting the same exact zero twice, even with two different approximate coordinate strings, cannot saturate a bound2 and is rejected unless exact distinctness is certified. |
| `rawDiscCoefficient_constant` | computation | For p=3, M=1, m=N=0 and residues[1,0], the coefficient check is true; combined with its separate analytic interpretation and strict tail bound, Strassmann gives no zero. |
| `rawDiscCoefficient_linear` | computation | For p=3, M=1, m=0, N=1 and residues[0,1], the coefficient check is true. |
| `rawDiscCoefficient_reject_tie` | non-example | For p=3, M=1, m=N=0 and residues[1,1], the coefficient check is false because a later coefficient ties the claimed last dominant index. |
| `rawDiscCoefficient_reject_short_tail` | non-example | For p=3, M=1, m=N=0 and residues[1], the coefficient check is false: the sufficient automatic-tail cutoff requires at least2 coefficients. |
| `rawDiscCoefficient_reject_unknown` | degenerate | For p=3, M=1, m=N=0 and residues[0,0], the coefficient check is false because no dominant nonzero coefficient has been certified. |

### ED.4/chabauty-coleman-certificate

Chabauty–Coleman certificate

| Declaration | Role | Mathematical contract |
|---|---|---|
| `ChabautyColemanCertificate.points` | projection | The list L of rational points. |
| `ChabautyColemanCertificate.Valid` | characterisation | Validity: (1)–(6) hold. |
| `ChabautyColemanCertificate.verdict` | data | The verdict attached to each x̃ ∈ X̃(𝔽_p). |
| `ChabautyColemanCertificate.discs_complete` | structure | The verdicts are indexed by the complete list X̃(𝔽_p). |
| `ChabautyColemanCertificate.rankInput` | data | Either the ED.3 rank certificate or the labelled hypothesis rank J(ℚ) ≤ r. |
| `ChabautyColemanCertificate.card_points_le` | relation | #L ≤ Σ_{x̃} N_x̃. |
| `ChabautyColemanCertificate.ofRankHypothesis` | constructor | The conditional certificate built from a labelled rank hypothesis. |
| `TauCeti.EffectiveDiophantine.ED4.ChabautyColemanCertificate.withFiniteIndex` | constructor | Supporting semantic record with an already established finite-index input. This helper does not derive index from rank, independence or genus. |
| `TauCeti.EffectiveDiophantine.ED4.finiteIndex_of_rank_and_independent` | other | For finitely generated A, r independent generators modulo torsion and rank(A)≤r, their generated subgroup has finite index. This derives the abstract index rather than assuming it; actual J(Q) and the geometric annihilator remain supplier obligations. |

| Test | Kind | Required behavior |
|---|---|---|
| `certificate_C05` | computation | For C₀(5) with O = ∞⁺, G = ⟨[(−3,1) − (0,1)]⟩, r = 1, p = 3: four verdicts with N = 1, 1, 2, 2 at ∞⁺, ∞⁻, (0, 1), (0, −1), and L of size 6 = Σ N. |
| `certificate_rank_zero` | degenerate | If J(ℚ) is finite (r = 0), G = 0 is of finite index and every ω ∈ H⁰(𝒳, Ω¹) is annihilating. |
| `certificate_missing_disc` | non-example | For C₁(3₂) at p = 3, verdicts on the six discs other than (1, 0) do not form a valid certificate, even though each is valid: the list of discs must be all of X̃(𝔽_3). |
| `certificate_rank_ge_genus` | non-example | No certificate exists when rank J(ℚ) ≥ g and r₀ = g: then Ann_p(J(ℚ)) = 0 (McCallum–Poonen Example 4, y² = x⁶ + x² + 1 with r = r₀ = 2). |
| `certificate_conditional_label` | characterisation | A certificate built by ofRankHypothesis is conditional and its completeness theorem is stated under the labelled hypothesis. |
| `certificate_bound_sum_six` | characterisation | Supporting semantic inequality: C.Valid and the supplied total disc bound6 imply C.points.card≤6. It does not construct C05 or prove six distinct actual points. |
| `certificate_withFiniteIndex_points` | characterisation | Supporting equality: withFiniteIndex preserves the points field of the supplied semantic record. It neither constructs a certificate from a rank hypothesis nor tests its conditionality label. |

### ED.4/symmetric-square-chabauty-datum

Symmetric-square Chabauty datum: X⁽²⁾, its Abel–Jacobi map and reduced vanishing differentials

| Declaration | Role | Mathematical contract |
|---|---|---|
| `SymmetricSquareChabautyDatum.abelJacobi` | data | ι⁽²⁾(𝒬) = [𝒬 − ∞] ∈ J(ℚ) for 𝒬 ∈ X⁽²⁾(ℚ). |
| `SymmetricSquareChabautyDatum.abelJacobi_injective` | characterisation | ι⁽²⁾ is injective on X⁽²⁾(ℚ̄) for X non-hyperelliptic. |
| `SymmetricSquareChabautyDatum.red` | projection | Reduction X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p), compatible with red_J ∘ ι⁽²⁾. |
| `SymmetricSquareChabautyDatum.matrix` | constructor | Ã(𝒬) ∈ M_{k×2}(𝔽̄_p) as in (v). |
| `SymmetricSquareChabautyDatum.relativeVanishing` | projection | Ṽ₀ = reduction of Ann_p(J(ℚ)) ∩ ker Tr ∩ H⁰(𝒳, Ω¹). |
| `SymmetricSquareChabautyDatum.mem_pullback` | characterisation | 𝒬 ∈ ρ*C(ℚ) iff 𝒬 = ρ*(c) for some c ∈ C(ℚ). |

| Test | Kind | Required behavior |
|---|---|---|
| `symmetricSquare_rationalPairs` | computation | If P, Q ∈ X(ℚ) then {P, Q} ∈ X⁽²⁾(ℚ) and ι⁽²⁾({P, Q}) = [P + Q − ∞]; a rational point P ∉ ∞ gives the two points {P, P} and {P, P₀} for P₀ ∈ X(ℚ), at most one of which is a pullback from C (Box Remark 2.3). |
| `symmetricSquare_matrix_diagonal` | degenerate | For 𝒬 = {Q₁, Q₁} the second column of Ã is a₁(ω_i, t)/2, which requires p odd. |
| `symmetricSquare_infinite_nonexample` | non-example | For X₀(N), N ∈ {43, 53, 61, 65}, X⁽²⁾(ℚ) is infinite (a degree-two map to an elliptic curve of positive rank) although r &lt; g − 1, so finiteness of X⁽²⁾(ℚ) does not follow from two independent vanishing differentials. |
| `symmetricSquare_reduction_compat` | compatibility | red_J(ι⁽²⁾(𝒬)) = ι̃⁽²⁾(red 𝒬) in J̃(𝔽_p), the identity behind ι_p in Caraiani–Newton §7.4. |
| `symmetricSquare_conjugate_divisor` | compatibility | A genuinely quadratic point P together with its conjugate defines one rational effective divisor P+P^σ of degree2, although neither point is rational; 2Q at a rational point has degree2 and does not collapse to the singleton divisor Q. |

### ED.4/fps-quintic-cycle-curve

Chabauty–Coleman certificate for the 5-cycle curve C₀(5) at p = 3

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED4.six_points_of_complete_certificate` | other | Supporting set/cardinality consequence: for an arbitrary semantic ChabautyColemanCertificate with Valid and exactly 6 listed points, its recorded rational set equals that list and has cardinality 6. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses. |

### ED.4/poonen-type-three-two-curve

Chabauty–Coleman certificate for Poonen's curve C₁(3₂) at p = 3

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED4.eight_points_of_complete_certificate` | other | Supporting set/cardinality consequence: for an arbitrary semantic ChabautyColemanCertificate with Valid and exactly 8 listed points, its recorded rational set equals that list and has cardinality 8. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses. |

### ED.4/stoll-six-cycle-curve

Conditional Chabauty–Coleman certificate for Stoll's curve X₀^dyn(6) at p = 5

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED4.ten_points_of_complete_certificate` | other | Supporting set/cardinality consequence: for an arbitrary semantic ChabautyColemanCertificate with Valid and exactly 10 listed points, its recorded rational set equals that list and has cardinality 10. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses. |

### ED.5/admissible-classes

Admissible quotient classes

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.admissibleClasses_eq_filter` | characterisation | The construction equals the finite filter of Γ/L by all specified local quotient tests. |
| `TauCeti.MordellWeilSieve.mem_admissibleClasses` | characterisation | a belongs precisely when every φ_{L,i}(a) belongs to q_{L,i}(Xᵢ); promoted to membership. |
| `TauCeti.MordellWeilSieve.mk_mem_admissibleClasses` | compatibility | q_L(g) belongs precisely when for every selected i there is x∈Xᵢ with φᵢ(g)−x∈φᵢ(L); promoted to representative-congruences. |
| `TauCeti.MordellWeilSieve.admissibleClasses_empty` | simp | A_∅(L) is the entire finite quotient. |
| `TauCeti.MordellWeilSieve.admissibleClasses_congr` | extensionality | Replacing Xᵢ by an equal set at every selected index leaves A_S(L) unchanged; unselected indices do not matter. |
| `TauCeti.MordellWeilSieve.admissibleClasses_antitone` | other | Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If S⊆T then A_T(L)⊆A_S(L). The maps, subgroup and allowed sets are fixed. |
| `TauCeti.MordellWeilSieve.admissibleClasses_top` | other | Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). At L=Γ, suppose for each i∈S there is x∈Xᵢ∩im(φᵢ). Then A_S(Γ)={0}. For the source’s surjective maps this is precisely the requirement that every selected Xᵢ be nonempty. |
| `TauCeti.MordellWeilSieve.admissibleClasses_mono` | other | Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). If Xᵢ⊆Yᵢ for each i∈S, then A_S(L;X)⊆A_S(L;Y). Consequently emptiness computed using supersets of the true local images remains a sound obstruction. |

| Test | Kind | Required behavior |
|---|---|---|
| `admissibleClasses_empty_index` | degenerate | For arbitrary L, maps and local sets, A_∅(L)=Γ/L. |
| `admissibleClasses_empty_local` | degenerate | For the singleton index set and any φ:Γ→ℤ/4, X=∅ implies A(L)=∅. |
| `admissibleClasses_mod_four` | computation | For Γ=G=ℤ/4, φ=id, L=0 and X={1,3}, A(L)={q₀(1),q₀(3)}. |
| `admissibleClasses_non_surjective` | non-example | For Γ=ℤ/2, G=ℤ/4, φ=0, L=Γ and X={1}, A(L)=∅ although X is nonempty. |
| `admissibleClasses_top_nonempty` | computation | For Γ=G=ℤ/4, φ=id, L=Γ and X={1}, A(L)={0}. |

### ED.5/coset-lift

Finite coset lifting and filtering

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.refineClasses_eq_biUnion` | characterisation | The result is the finite union of translated kernel enumerations, filtered by the fine local conditions. |
| `TauCeti.MordellWeilSieve.mem_refineClasses` | characterisation | If σ lifts every a∈B correctly, b belongs exactly when π(b)∈B and b∈A_S(K); promoted to lift-membership. |
| `TauCeti.MordellWeilSieve.refineClasses_empty` | simp | An empty coarse input produces the empty fine result, without a section assumption. |
| `TauCeti.MordellWeilSieve.refineClasses_section_independent` | extensionality | Two sections correct on B produce the same result; their values outside B do not matter. |
| `TauCeti.MordellWeilSieve.unchanged_local_condition` | other | Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). Let K≤L, fix i and suppose φᵢ(K)=φᵢ(L). For every b∈Γ/K, the i-th fine local test at b is equivalent to the i-th coarse test at π(b). No surjectivity of φᵢ is needed. |
| `TauCeti.MordellWeilSieve.card_refineClasses_le` | other | Write q_L:Γ→Γ/L for the native quotient map, G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}, and φ_{L,i}:Γ/L→G_{L,i} for the native induced map. Write A_S(L) for admissibleClasses(S,L,φ,X). For any proposed lifts σ, the number of classes returned by refineClasses(S,K,L,σ,B) is at most \|B\|·\|ker π\|, with the kernel enumerated in Γ/K. This bound requires no section equation. |
| `TauCeti.MordellWeilSieve.target_le_preparedStep` | other | Let D≤L be subgroups of an abelian group Γ and φ:Γ→A an additive homomorphism. For the native subgroup L′=L∩φ⁻¹(φ(D)), one has D≤L′. The containment L′≤L is part of the native intersection operation. |
| `TauCeti.MordellWeilSieve.preparedStep_lt` | other | Let D,L≤Γ and φ:Γ→A. If φ(L) is not contained in φ(D), then L∩φ⁻¹(φ(D)) is a proper subgroup of L. |

| Test | Kind | Required behavior |
|---|---|---|
| `refineClasses_empty_input` | degenerate | For all data, refineClasses applied to B=∅ is ∅. |
| `refineClasses_identity` | compatibility | For K=L and σ=id, refineClasses(S,L,L,id,B)=B∩A_S(L). |
| `refineClasses_all_lifts` | characterisation | With no local tests and a section correct on B, the result is the whole inverse image π⁻¹(B), enumerated in Γ/K. |
| `refineClasses_wrong_section` | non-example | Take Γ=ℤ/4, K=L=0, B={q₀(0)}, no tests, and constant σ=q₀(1). The result is {q₀(1)}, not B. This σ fails the section condition. |

### ED.5/jacobian-reduction-data

Reduction data for a curve and its Jacobian

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.JacobianReductionData.localImage` | data | The finite local image X_p = ι_p(C̃_p(𝔽_p)) ⊆ J̃_p(𝔽_p). |
| `TauCeti.MordellWeilSieve.JacobianReductionData.mem_localImage` | characterisation | x ∈ X_p if and only if x = ι_p(R) for some residue point R. |
| `TauCeti.MordellWeilSieve.JacobianReductionData.red_aj` | compatibility | The commuting square ρ_p(ι(P)) = ι_p(red_p(P)) for all P and p (the structure field). |
| `TauCeti.MordellWeilSieve.JacobianReductionData.red_aj_mem_localImage` | compatibility | ρ_p(ι(P)) ∈ X_p for every rational point P and every p. |
| `TauCeti.MordellWeilSieve.JacobianReductionData.sieveSet` | data | The Mordell–Weil sieve set A_S(L) of the curve for L ≤ Γ with Γ/L finite. |
| `TauCeti.MordellWeilSieve.JacobianReductionData.sieveSet_eq` | characterisation | A_S(L) = admissibleClasses(S, L, ρ, X). |
| `TauCeti.MordellWeilSieve.JacobianReductionData.mapLocal` | functoriality | Composing ρ_p and ι_p with homomorphisms f_p: J̃_p(𝔽_p) → G′_p keeps the square; with f_p the quotient by N·J̃_p(𝔽_p) this gives Bruin–Stoll's β_{N,p}. |
| `TauCeti.MordellWeilSieve.JacobianReductionData.mapLocal_red` | simp | (mapLocal f).ρ_p = f_p ∘ ρ_p. |

| Test | Kind | Required behavior |
|---|---|---|
| `localImage_mod_five` | computation | One place, residue points r₀, r₁ with ι_p(r₀) = 1 and ι_p(r₁) = 2 in ℤ/5, Γ = ℤ, ι constant 1 and ρ the reduction ℤ → ℤ/5: X_p = {1, 2}. |
| `sieveSet_no_places` | degenerate | With S = ∅ the sieve set A_∅(L) is all of Γ/L. |
| `localImage_genus_one` | compatibility | If ι_p is surjective, as for an elliptic curve with D₁ = O where ι_p is the Mathlib/Tau Ceti class-group identification Ẽ(𝔽_p) ≅ Pic⁰, then X_p is the whole local group. |
| `localImage_not_known_points` | non-example | Points {0, 1}, Γ = ℤ, ι(n) = n, ρ the reduction to ℤ/2 and ι_p = id on ℤ/2: the reductions of the known point 0 form {0} ≠ X_p = {0, 1}. A local set built from known points only is not a local image. |

### ED.5/padic-quotient-sieve-datum

Local sieve data from finite quotients of J(ℚ_p)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.padicImageClasses` | data | The finite set X_U ⊆ Γ/(Γ ∩ U) of classes whose U-coset meets the local points Y. |
| `TauCeti.MordellWeilSieve.mem_padicImageClasses` | characterisation | c ∈ X_U iff some g with class c and some y ∈ Y have incl(g) − y ∈ U. |
| `TauCeti.MordellWeilSieve.mk_mem_padicImageClasses` | compatibility | If incl(g) ∈ Y then the class of g lies in X_U (soundness for global points). |
| `TauCeti.MordellWeilSieve.padicImageClasses_mono` | functoriality | Y ⊆ Y′ implies X_U(Y) ⊆ X_U(Y′). |
| `TauCeti.MordellWeilSieve.padicImageClasses_refine` | relation | For U′ ≤ U the projection Γ/(Γ ∩ U′) → Γ/(Γ ∩ U) maps X_{U′} into X_U: deeper information refines shallower information. |
| `TauCeti.MordellWeilSieve.mk_mem_admissibleClasses_iff_of_le_ker` | other | In the setting of admissible-classes suppose L ≤ ker φ_i for every i ∈ S. Then for every g ∈ Γ, q_L(g) ∈ A_S(L) if and only if φ_i(g) ∈ X_i for all i ∈ S. Hence A_S(L) is the image under q_L of the set of globally compatible elements, and A_S(L) = ∅ if and only if no g ∈ Γ satisfies all the local conditions. With L = ⋂_{i∈S} ker φ_i (of finite index when the G_i are finite) the finite set A_S(L) is Box's coset intersection ⋂_i φ_i^{-1}(X_i), read in Γ/L instead of in ℤⁿ. |

| Test | Kind | Required behavior |
|---|---|---|
| `padicImageClasses_top` | degenerate | With U the whole group and Y nonempty, X_U is the single class. |
| `padicImageClasses_empty_points` | degenerate | With Y = ∅, X_U = ∅. |
| `padicImageClasses_mod_four` | computation | Γ = A = ℤ, incl = id, U = 4ℤ, Y = {1}: X_U = {1 mod 4}. |
| `padicImageClasses_coset_not_point` | non-example | Γ = A = ℤ, U = 4ℤ, Y = {5}: the class of 1 lies in X_U although 1 ∉ Y; the test is membership of the coset, not of the point. |
| `padicImageClasses_good_reduction` | compatibility | With U = ker ρ for a homomorphism ρ: A → J̃, the class of g lies in X_U iff ρ(incl g) ∈ ρ(Y): the good-reduction test of jacobian-reduction-data. |

### ED.5/sieve-chain

The sieve along a descending chain of subgroups

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.siftChain` | data | The finite set at level j of the iterated sieve. |
| `TauCeti.MordellWeilSieve.siftChain_zero` | simp | Level 0 is admissibleClasses(S, L_0, φ, X). |
| `TauCeti.MordellWeilSieve.siftChain_succ` | simp | Level j + 1 is refineClasses(T_j, L_{j+1}, L_j, σ_j, level j). |
| `TauCeti.MordellWeilSieve.card_siftChain_succ_le` | other | \|A_{j+1}\| ≤ \|A_j\|·\|ker(Γ/L_{j+1} → Γ/L_j)\| (from lift-cardinality). |
| `TauCeti.MordellWeilSieve.siftChain_eq_admissibleClasses` | characterisation | Under the checks of sieve-chain-correct, level j equals A_S(L_j) (promoted to sieve-chain-correct). |
| `TauCeti.MordellWeilSieve.range_nsmul_mul_eq_of_padicValNat_le` | other | Let A be an abelian group of finite exponent e (for instance a finite local group G_i), q a prime and M a natural number with v_q(e) ≤ v_q(M). Then (qM)A = MA. Consequently φ(qMΓ) = φ(MΓ) for every homomorphism φ: Γ → A, so by unchanged-local-image the place gives the same test on Γ/qMΓ as on Γ/MΓ and is omitted when lifting from N_{k−1}Γ to N_kΓ = q_kN_{k−1}Γ: only places with v_{q_k}(e_i) ≥ v_{q_k}(N_k) are relevant. Surjectivity of φ is not needed. |

| Test | Kind | Required behavior |
|---|---|---|
| `siftChain_level_zero` | degenerate | Before any lifting the chain is the direct sieve at L_0. |
| `siftChain_no_places` | degenerate | With S = ∅, T_j = ∅ and correct lifts every class survives at every level. |
| `siftChain_two_levels` | computation | Γ = ℤ/4, L_0 = Γ, L_1 = 0, φ = id, X = {1}, lift of the class 0 equal to 1 and T_0 = S: level 1 is {1}. |
| `siftChain_omitted_changed_test` | non-example | Same data with T_0 = ∅: level 1 has 4 elements, not the direct sieve {1}; the omitted place has φ(L_1) = 0 ≠ φ(L_0). |

### ED.5/subgroup-from-membership-test

A finite-index subgroup from a membership test (GetSubgroup)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.getSubgroup` | data | The output list g_1, …, g_r. |
| `TauCeti.MordellWeilSieve.closure_getSubgroup` | characterisation | If b generates Γ then the output generates K. |
| `TauCeti.MordellWeilSieve.getSubgroup_mem` | other | Every output element lies in K. |
| `TauCeti.MordellWeilSieve.length_getSubgroup` | other | The output has the same length as the input. |
| `TauCeti.MordellWeilSieve.getSubgroup_top` | simp | For K = Γ the output is the input. |

| Test | Kind | Required behavior |
|---|---|---|
| `getSubgroup_whole_group` | degenerate | For K = Γ the output equals the input list. |
| `getSubgroup_int_four` | computation | Γ = ℤ, b = [1], K = 4ℤ: the output is [4]. |
| `getSubgroup_parity` | computation | Γ = ℤ², b = [(1,0), (0,1)], K = {(x, y) : x + y even}: the output is [(2,0), (1,1)]. |
| `getSubgroup_naive_multiples` | non-example | The doubled generators (2,0), (0,2) generate a proper subgroup of the even-sum subgroup K; multiplying each generator into K separately is wrong. |

### ED.5/sieve-certificate

Mordell–Weil sieve certificate

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.MordellWeilSieve.SieveCertificate.candidates` | data | The exhaustive candidate set: siftChain at the final level. |
| `TauCeti.MordellWeilSieve.SieveCertificate.candidates_eq_siftChain` | characterisation | candidates equals siftChain applied to the recorded data at level length. |
| `TauCeti.MordellWeilSieve.SieveCertificate.Checked` | other | The verifier's checks: sections on the sieve sets, T_j ⊆ S, unchanged image subgroups at omitted places. |
| `TauCeti.MordellWeilSieve.SieveCertificate.candidates_eq_sieveSet` | compatibility | For a checked certificate, candidates = A_S(L_t) of the reduction data. |
| `TauCeti.MordellWeilSieve.SieveCertificate.mk_aj_mem_candidates` | compatibility | For a checked certificate the class of ι(P) lies in candidates for every rational point P. |
| `TauCeti.MordellWeilSieve.SieveCertificate.chain` | projection | The recorded chain of subgroups L_j. |
| `TauCeti.MordellWeilSieve.RawSieveStep` | structure | Proof-free projection table Fin newSize→Fin oldSize, local allowed tables, old and next class sets. |
| `TauCeti.MordellWeilSieve.RawSieveStep.check` | other | Computable exhaustive check of next(b) iff old(project b) and all finite local allowed tests, for every b. |
| `TauCeti.MordellWeilSieve.RawSieveStep.sound` | characterisation | Passing the raw check gives exact equality with the finite lift/filter set. Geometric interpretation requires CN.3 presentation and table transport, not a claimed arbitrary-group algorithm. |

| Test | Kind | Required behavior |
|---|---|---|
| `candidates_no_steps` | degenerate | No places, length 0, L_0 = Γ = ℤ/2: candidates is the single class. |
| `candidates_mod_four` | computation | One place, identity map on ℤ/4, local image {1}, L_0 = 0, length 0: candidates = {1}. |
| `candidates_nonempty_without_points` | non-example | Γ = ℤ/2, two places with local images {0} and {1}, no points, L_0 = Γ, length 0: candidates is nonempty although there is no point; a nonempty candidate set is an open computation, not a point. |
| `rawSieve_mod_four` | computation | Lifting class1 mod2 to mod4 with no local tests keeps {1,3}. |
| `rawSieve_missing_lift` | non-example | Keeping only {1} fails; the other lift3 is required. |
| `rawSieve_empty` | degenerate | A false local test at the unique class gives an empty next set. |

### ED.6/certified-solution-set

Certified solution sets with completeness labels

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.mem_iff` | characterisation | If H holds then x ∈ c.solutions ↔ P x. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.coe_eq_setOf` | characterisation | If H holds then (c.solutions : Set α) = {x \| P x}; in particular {x \| P x} is finite. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.solutions_eq` | extensionality | Two certificates c₁ (under H₁) and c₂ (under H₂) for the same P have c₁.solutions = c₂.solutions whenever H₁ ∧ H₂ holds. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.unconditional` | constructor | From S, a soundness proof and an unconditional completeness proof, the certificate under H = True. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.mono` | compatibility | A certificate under H is a certificate under any H' with H' → H, with the same solutions. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.discharge` | other | From a certificate under H and a proof of H, the unconditional certificate with the same solutions. |
| `TauCeti.EffectiveDiophantine.ED6.CertifiedSolutionSet.map` | functoriality | Along an equivalence e : α ≃ β with P = Q ∘ e, the image certificate for Q has solutions S.map e; map along the identity is the identity and maps compose. |

| Test | Kind | Required behavior |
|---|---|---|
| `certifiedSolutionSet_sq_eq_four` | computation | For α = ℤ, P x := x ^ 2 = 4 and H = True, every certificate has solutions = {−2, 2}. |
| `certifiedSolutionSet_false` | degenerate | For the constantly false predicate P and any H, a certificate under H with H true has solutions = ∅. |
| `certifiedSolutionSet_sound_only` | non-example | For P x := x ^ 2 = 4 over ℤ there is no unconditional certificate with solutions = {2}: soundness holds but completeness fails at −2. |
| `certifiedSolutionSet_toFinset` | compatibility | If H holds then (Set.Finite.toFinset h) = c.solutions for the finiteness proof h of {x \| P x} given by coe_eq_setOf (agreement with Mathlib's Set.Finite.toFinset). |
| `certifiedSolutionSet_vacuous` | characterisation | For H = False every finite set of verified solutions is a certificate, so a conditional certificate asserts nothing until H is discharged. |

### ED.6/qc-disc-certificate

Residue-disc certificate for quadratic Chabauty functions

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.SemanticQCDiscCertificate.exists_centre` | projection | Every common zero s of the f_i has a centre c ∈ C with ‖s − c‖ ≤ p^(−n). |
| `TauCeti.EffectiveDiophantine.ED6.SemanticQCDiscCertificate.eq_of_mem_ball` | characterisation | Two common zeros within p^(−n) of the same centre are equal. |
| `TauCeti.EffectiveDiophantine.ED6.SemanticQCDiscCertificate.ncard_commonZeros_le` | characterisation | The set of common zeros is finite and has at most #C elements. |
| `TauCeti.EffectiveDiophantine.ED6.SemanticQCDiscCertificate.commonZeros_eq_empty` | simp | If C = ∅ the f_i have no common zero on the disc. |
| `TauCeti.EffectiveDiophantine.ED6.SemanticQCDiscCertificate.addFunction` | compatibility | Adding a further function to the family keeps covers and unique, with the same centres; removing a centre c is allowed when some f_i is certified nonzero on the ball around c. |

| Test | Kind | Required behavior |
|---|---|---|
| `qcDisc_linear` | computation | For p = 17, ι = Unit, f(s) = s − 1, C = {1}, n = 5, the structure exists and the common zero set is {1}. |
| `qcDisc_no_zero` | degenerate | For f ≡ 1 the empty set of centres gives a certificate, and there are no common zeros. |
| `qcDisc_close_roots` | non-example | For p = 17 and f(s) = s(s − 17^6) no certificate has C = {0} and n = 5, since the ball around 0 contains the two zeros 0 and 17^6. |
| `qcDisc_polynomial_roots` | compatibility | If ι = Unit and f is the evaluation of a nonzero polynomial F ∈ Z_p[X], the number of common zeros is at most Multiset.card F.roots ≤ natDegree F (Mathlib Polynomial.card_roots'). |

### ED.6/explicit-setup

The explicit set-up: affine chart, basis of differentials and Tate class

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.residue_injective` | characterisation | A combination Σ_k c_k ω_{2g+k} of the third-kind differentials with Res_x = 0 at every x ∈ D is zero; equivalently the residue matrix (Res_x ω_{2g+k}) has rank d − 1 and columns summing to zero. |
| `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.cupMatrix_eq` | data | The cup product matrix of ω_0, …, ω_{2g−1} is fromBlocks 0 1 (−1) 0 in the block decomposition (holomorphic, non-holomorphic). |
| `TauCeti.EffectiveDiophantine.ED6.AdmissibleTateMatrix.transpose_eq_neg` | projection | Zᵀ = −Z. |
| `TauCeti.EffectiveDiophantine.ED6.AdmissibleTateMatrix.lowerRight_eq_zero` | projection | Z_ij = 0 for i, j in the non-holomorphic block. |
| `TauCeti.EffectiveDiophantine.ED6.AdmissibleTateMatrix.trace_cup_eq_zero` | projection | Σ_{i&lt;g} Z_{i,g+i} = 0, equivalently trace(Z · Cᵀ) = 0 for the cup product matrix C. |
| `TauCeti.EffectiveDiophantine.ED6.AdmissibleTateMatrix.linearConditions` | structure | Matrices satisfying (b)–(d) form a Q-subspace of M_{2g}(Q); admissible classes are its nonzero elements meeting (a). |
| `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.functionField` | projection | The actual function field Q(X)=Frac Γ(Y,O_Y), with its induced boundary expansions into L((t_x)); the geometric projection is omitted with ExplicitSetup. |
| `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.tateFrobenius` | compatibility | The actual tensor class is identified through crystalline/de Rham comparison and satisfies FᵀZF=pZ at the chosen good prime; linear matrix conditions alone do not imply this. |

| Test | Kind | Required behavior |
|---|---|---|
| `admissibleTate_xs13_Z1` | computation | The 6×6 integer matrix Z1 of BDMTV p.931 satisfies (b), (c), (d): it is antisymmetric, its lower-right 3×3 block is zero and Z1(0,3) + Z1(1,4) + Z1(2,5) = 10 + 1 − 11 = 0. |
| `admissibleTate_zero` | degenerate | The zero matrix satisfies the linear conditions (b)–(d) but is excluded by nonzeroness. This test concerns the matrix carrier, not a construction of the geometric mixed extension. |
| `admissibleTate_symmetric` | non-example | The matrix fromBlocks 0 1 1 0 (symmetric, nonzero) fails (d). |
| `explicitSetup_cupMatrix_g1` | compatibility | For g = 1 the cup product matrix is the 2×2 matrix with rows (0, 1) and (−1, 0), the standard symplectic form, Matrix.fromBlocks 0 1 (−1) 0. |
| `explicitSetup_frobenius_nonexample` | non-example | A nonzero matrix satisfying only(b)–(d), together with F=I and p=17, fails FᵀZF=17Z and cannot supply an ExplicitSetup Tate class. The actual comparison is in the ExplicitSetup omission. |

### ED.6/gauge-transformation

Gauge transformations at the points at infinity

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.gaugeMatrix` | data | gaugeMatrix Ω g Z is the block matrix [[1,0,0],[Ω,1,0],[g,ΩᵀZ,1]] indexed by Unit ⊕ Fin (2g) ⊕ Unit. |
| `TauCeti.EffectiveDiophantine.ED6.gaugeMatrix_inv` | characterisation | For alternating Z (Zᵀ = −Z with zero diagonal; automatic over Q), the inverse of gaugeMatrix Ω g Z is [[1,0,0],[−Ω,1,0],[−g, −ΩᵀZ, 1]]. |
| `TauCeti.EffectiveDiophantine.ED6.gaugeMatrix_det` | simp | det (gaugeMatrix Ω g Z) = 1. |
| `TauCeti.EffectiveDiophantine.ED6.gaugeMatrix_gauge_iff` | characterisation | For a derivation D of a commutative ring R and antisymmetric Z with D-constant entries: gaugeMatrix⁻¹ · D(gaugeMatrix) = Λ(ω, η, Z) if and only if D Ω = −ω and D g = Ωᵀ Z (D Ω) − η. |
| `TauCeti.EffectiveDiophantine.ED6.gaugeMatrix_shift` | compatibility | gaugeMatrix (Ω + c) (g + cᵀZΩ + e) Z = unipotent(c, cᵀZ, e) · gaugeMatrix Ω g Z for constants c, e (the dependence on primitives). |
| `TauCeti.EffectiveDiophantine.ED6.connectionMatrix` | data | connectionMatrix ω η Z = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]. |

| Test | Kind | Required behavior |
|---|---|---|
| `gaugeMatrix_zero` | degenerate | gaugeMatrix 0 0 Z = 1 for every Z. |
| `gaugeMatrix_g1_inverse` | computation | For g = 1 (index Unit ⊕ Fin 2 ⊕ Unit), Z = [[0,1],[−1,0]], Ω = (a, b), g = c: gaugeMatrix Ω c Z * [[1,0,0],[−Ω,1,0],[−c,−ΩᵀZ,1]] = 1. |
| `gaugeMatrix_sign_convention` | non-example | With D Ω = +ω (the 2021 convention) and ω ≠ 0, gaugeMatrix⁻¹ · D(gaugeMatrix) ≠ Λ(ω, η, Z). |
| `gaugeMatrix_unipotent` | characterisation | gaugeMatrix Ω g Z − 1 is nilpotent of order 3. |

### ED.6/hodge-filtration-algorithm

Algorithm for the Hodge filtration data (η, b_Fil, γ_Fil)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData` | structure | A structure with fields etaCoeff : Fin (d − 1) → L, bFil : Fin g → L (rational in the application) and gammaFil in the coordinate ring A of Y. |
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.ResidueCondition` | characterisation | The predicate: for every x ∈ D, Σ_k etaCoeff k · Res_x(ω_{2g+k}) = Res_x(Ω_xᵀZdΩ_x), i.e. the residue matrix times etaCoeff equals the target residues. |
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.RegularCondition` | characterisation | The predicate: γ_Fil(b) = 0 and, for every x ∈ D, g_x + γ_Fil − b_FilᵀNᵀΩ_x − Ω_xᵀZNNᵀΩ_x has no terms of negative degree. |
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.ext_of_conditions` | extensionality | Two data satisfying both conditions are equal (hodge-filtration-explicit (i) and explicit-connection). |
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.betaFil` | data | β_Fil := (0, …, 0, b_g, …, b_{2g−1}) ∈ Q^{2g}. |
| `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.smul` | functoriality | Replacing Z by λZ (λ ∈ Q) replaces (η, b_Fil, γ_Fil) by (λη, λb_Fil, λγ_Fil). |

| Test | Kind | Required behavior |
|---|---|---|
| `hodgeData_xs13_Z1_beta` | computation | For X_s(13), Z1: betaFil = (0,0,0,0,1/2,1/2) and gammaFil = 5y/6 + 3x/2. |
| `hodgeData_zero` | degenerate | For Z = 0 the unique data are η = 0, b_Fil = 0, γ_Fil = 0. |
| `hodgeData_printed_step_nonexample` | non-example | Since Z is antisymmetric, the printed residue condition Res_x(dΩ_xᵀZΩ_x − η') = 0 gives η' = −η, which differs from η and violates ResidueCondition whenever some Res_x(Ω_xᵀZdΩ_x) ≠ 0. |
| `hodgeData_linear` | compatibility | The map Z ↦ (η, b_Fil, γ_Fil) is Q-linear: the data for Z1 + Z2 are the sums (agreement with the module structure of admissible matrices). |

### ED.6/transport-matrices

Left and right multiplication matrices and parallel transport

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.leftMulMatrix` | data | leftMulMatrix Z (a, b, c) = [[a,0,0],[b,a·1,0],[c,bᵀZ,a]] indexed by Unit ⊕ Fin n ⊕ Unit. |
| `TauCeti.EffectiveDiophantine.ED6.rightMulMatrix` | data | rightMulMatrix Z (a, b, c) = [[a,0,0],[b,a·1,0],[c,−bᵀZ,a]]. |
| `TauCeti.EffectiveDiophantine.ED6.leftMulMatrix_mul` | relation | leftMulMatrix Z (u * v) = leftMulMatrix Z u * leftMulMatrix Z v. |
| `TauCeti.EffectiveDiophantine.ED6.rightMulMatrix_mul` | relation | For antisymmetric Z, rightMulMatrix Z (u * v) = rightMulMatrix Z v * rightMulMatrix Z u. |
| `TauCeti.EffectiveDiophantine.ED6.leftMul_rightMul_comm` | relation | leftMulMatrix Z u and rightMulMatrix Z v commute (associativity). |
| `TauCeti.EffectiveDiophantine.ED6.transportMatrix` | constructor | transportMatrix Z Ixx Ibb := leftMulMatrix Z Ixx * rightMulMatrix Z Ibb, the matrix of v ↦ I(x_0,x)·v·I(b,b_0). |
| `TauCeti.EffectiveDiophantine.ED6.mulVec_leftMulMatrix` | simp | leftMulMatrix Z u acting on the coordinate vector of v is the coordinate vector of u * v. |

| Test | Kind | Required behavior |
|---|---|---|
| `leftMulMatrix_one` | degenerate | leftMulMatrix Z (1, 0, 0) = 1 and rightMulMatrix Z (1, 0, 0) = 1. |
| `leftMulMatrix_g1` | computation | For n = 2, Z = [[0,1],[−1,0]], u = (1, (1,0), 0) and v = (1, (0,1), 0): u * v = (1, (1,1), 1) and v * u = (1, (1,1), −1). |
| `rightMulMatrix_symmetric_nonexample` | non-example | For the symmetric Z = 1 (n = 1) and u = (1, 1, 0), right multiplication by u on (0, 1, 0) gives (0, 1, 1) while −bᵀZ predicts −1: the formula R(u) needs antisymmetry. |
| `transport_orientation` | characterisation | The (2,1) block of transportMatrix Z (1, ∫_{x_0}^x ω, ·) (1, ∫_b^{b_0} ω, ·) applied to (1, ∫_{b_0}^{x_0} ω, ·) is ∫_b^x ω (path composition, E3). |

### ED.6/root-determination-precision

Provable determination of roots in a residue disc

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.root_satisfies_truncation_congruence` | other | Supporting necessary congruence for an existing Q_p root, using the supplied tail valuation. No cluster existence, multiplicity or isolation conclusion. |

### ED.6/qc-modular-algorithm

Quadratic Chabauty for modular curves: algorithm with termination and failure conditions

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.QCInput` | structure | The input record: patches with their plane equations, the prime p, the precision n, the height bound B, the local height data away from p, and the rank certificate as a hypothesis. |
| `TauCeti.EffectiveDiophantine.ED6.QCFailure` | data | The four failure reasons: noIntegralSymplecticBasis, heightPairingUnsolved, precisionLoss, multipleRootAtKnownPoint. |
| `TauCeti.EffectiveDiophantine.ED6.QCOutput` | data | Either fail (r : QCFailure) or candidates (A : Finset of points to precision n') with n' ≤ n. |
| `TauCeti.EffectiveDiophantine.ED6.QCOutput.candidates_sound` | characterisation | If the output is candidates A then every rational point of X in a covered disc reduces modulo p^(n') to an element of A. |
| `TauCeti.EffectiveDiophantine.ED6.QCOutput.toCertifiedSolutionSet` | constructor | From a candidates output, matchings with X(Q)_known and exclusions, the certified solution set of padic-candidate-comparison. |
| `TauCeti.EffectiveDiophantine.ED6.QCOutput.fail_ne_empty` | other | A fail output yields no certificate: no theorem identifies it with the empty candidate set. |

| Test | Kind | Required behavior |
|---|---|---|
| `qcOutput_x0plus97` | computation | For X_0^+(97), p = 5, the output is candidates of ten points matching (1:0:0), (−2:1:1), (−1:0:1), (0:0:1), (0:1:0), (0:−1:1), (1:0:1), (1:1:1), (−1:1:0), (5:3:2). |
| `qcOutput_no_patch` | degenerate | If the patches cover no residue disc, candidates ∅ asserts nothing about X(Q) (the covered-disc condition is empty). |
| `qcOutput_fail_nonexample` | non-example | fail precisionLoss is not candidates ∅: it carries no soundness statement. |
| `qcOutput_sieve_compat` | compatibility | If every candidate not in X(Q)_known is excluded by an ED.5 sieve certificate, toCertifiedSolutionSet returns X(Q)_known. |

### ED.6/xs13-plane-model

Plane quartic model of X_s(13), its seven known points and the residue discs at 17

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.xs13_quartic_identity_and_points` | other | Supporting algebra only: The polynomial identity/point memberships do not identify the modular curve or prove good reduction. It has the narrower signature given in the suggested file. |
| `TauCeti.EffectiveDiophantine.ED6.xs13SpecialFibrePoints` | data | Finite set of all projective special-fibre points at17 using unique normalized representatives Z=1, Z=0/Y=1, and (1:0:0). |
| `TauCeti.EffectiveDiophantine.ED6.xs13_specialFibre_card` | characterisation | Exact enumeration gives20 distinct projective points. |
| `TauCeti.EffectiveDiophantine.ED6.xs13_specialFibre_smooth` | characterisation | At each enumerated F17 point one partial derivative is nonzero. This rational-point check alone does not prove geometric smoothness over F17-bar; the good-reduction model factory remains omitted. |

### ED.6/xs13-endomorphism-algebra

The endomorphism algebra and Picard number of J_s(13)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.finrank_of_xs13_cubic` | other | Supporting algebra only: A generated cubic field is not End(J)⊗Q or an NS-rank computation. It has the narrower signature given in the suggested file. |

| Test | Kind | Required behavior |
|---|---|---|
| `xs13_coeffField_inert_seventeen` | computation | The cubic t³+2t²−t−1 has no root modulo17 and hence is irreducible there. This supplies the residue-field inertness check once the actual coefficient field is identified. |

### ED.6/xs13-analytic-rank-certificate

Certified analytic rank one for the conjugates of f

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.xs13_derivative_ne_zero` | other | Supporting algebra only: Positive derivative intervals only imply derivative nonzero. It has the narrower signature given in the suggested file. |

### ED.6/xs13-rank-three

The Mordell–Weil rank of J_s(13) (BDMTV Proposition 6.2)

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.finrank_restrictScalars_three` | other | Supporting algebra only: Restriction-of-scalars dimension does not establish Q-rank1 over the RM field. It has the narrower signature given in the suggested file. |

### ED.6/xs13-first-chart-hodge-data

First chart of X_s(13): differentials and Hodge filtration data

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.xs13_hodgeData_base_conditions` | other | Supporting algebra only: Base normalization and zero holomorphic part omit Laurent residue/regularity and basis checks. It has the narrower signature given in the suggested file. |
| `TauCeti.EffectiveDiophantine.ED6.xs13AffineQuartic` | data | Q(x,y,1) in Q[x,y]. |
| `TauCeti.EffectiveDiophantine.ED6.Xs13AffineCoordinateRing` | structure | The actual quotient Q[x,y]/(Q(x,y,1)). |
| `TauCeti.EffectiveDiophantine.ED6.xs13GammaFilClass` | data | The two printed gamma expressions mapped to the coordinate-ring quotient. |

| Test | Kind | Required behavior |
|---|---|---|
| `xs13_coordinate_relation` | compatibility | The affine quartic maps to zero in its own quotient. |
| `xs13_hodge_nonconstant` | non-example | The first gamma class is nonzero in the quotient, so zero Hodge data cannot pass. |
| `xs13_gamma_class` | computation | The first gamma class is the image of 5y/6+3x/2 through the quotient map. |

### ED.6/xs13-first-chart-frobenius

First chart of X_s(13): Frobenius lift and the functions θ_{Z_i}

| Declaration | Role | Mathematical contract |
|---|---|---|
| `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusLift` | data | The Frobenius lift Φ on the dagger algebra of U_1 with Φ(x) = x^17 and Q(x^17, Φ(y)) = 0. |
| `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusLift_y_congr` | characterisation | Φ(y) ≡ y^17 modulo 17, and Φ(y) is the unique overconvergent solution of Q(x^17, ·) = 0 with this congruence. |
| `TauCeti.EffectiveDiophantine.ED6.xs13_P2_teichmuller` | characterisation | Φ(P2) = P2. |
| `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusMatrix_cup` | compatibility | Fᵀ C F = 17 C for the cup product matrix C, and Fᵀ Z_i F = 17 Z_i for i = 1, 2 (condition (a)). |
| `TauCeti.EffectiveDiophantine.ED6.xs13Theta` | data | For Z ∈ {Z1, Z2} and each residue disc of ]U_1[, the power series of θ_Z in the disc parameter with certified coefficients and tail bound. |
| `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusMatrix_trace` | simp | tr F = −2. |

| Test | Kind | Required behavior |
|---|---|---|
| `xs13_Qy_P2` | computation | ∂Q/∂Y at (0 : 0 : 1) equals −16, a 17-adic unit, so the disc of P2 lies in ]U_1[. |
| `xs13_Qy_P0` | degenerate | ∂Q/∂Y at (1 : 1 : 1) equals 0, so the disc of P0 is not in ]U_1[ and needs base-point-change. |
| `xs13_frob_trace` | compatibility | tr F = 17 + 1 − #X(F_17) = −2, agreeing with the point count of xs13-plane-model (Lefschetz trace formula). |
| `xs13_naive_lift_nonexample` | non-example | Φ(y) = y^17 does not define a lift: at the point P1 = (1/2, 1/2) of Y one has Q(t, t) = 16t(2t − 1)(t − 1), so Q(x^17, y^17) evaluated at P1 is Q(2^(−17), 2^(−17)) ≠ 0, whereas a lift must satisfy Q(Φ(x), Φ(y)) = 0. |

## Closure obligations

Every stage is planned and remains open for the following precisely stated work. Mathematical hypotheses and numerical completeness obligations remain visible in the corresponding target statements.

### EffectiveDiophantineMethods:ED.0

**Coverage:** `planned`.

- Embeddings of K into finite extensions of ℚ_p (primes of residue degree or ramification index above 1), with Hensel-type certificates over the extension and the corresponding valuation adapters; Thue–Mahler instances whose relevant primes do not split completely need them (Tzanakis–de Weger 1992, §3–§4).
- A faster candidate generator for bounded-height enumeration following Doyle–Krumm, Theorem 3.1 and Algorithm 4 (class-group representatives, certified fundamental units and elements of bounded norm from ComputationalNumberTheory:CN.2), producing the same output contract as ED.0/bounded-height-enumeration.
- An explicit precision sufficient for the nonvanishing test, from the size inequality DiophantineApproximationAndTranscendence:DT.3/liouville-size-inequality, in place of the existence statement of ED.0/certified-nonvanishing (d).
- Revision closure obligations: Prime-ideal valuation and completion adapters, Arbitrary-element characteristic polynomial bridge, Supplier-dependent signatures omitted under PROTOCOL §13. Exact unavailable signatures are in per-node suggestedOmissions.

### EffectiveDiophantineMethods:ED.1

**Coverage:** `planned`.

- The one-dimensional continued-fraction and Baker–Davenport reductions (de Weger, Lemmas 3.1–3.3) and the zero-dimensional p-adic digit reduction (Lemma 3.11), which the lattice theorems subsume for n = 2 and n = 1 respectively but which give sharper constants.
- The sublattices Γ*_μ, Γ#_μ of de Weger §3.13 (Lemma 3.17) that remove the multivaluedness of the p-adic logarithm.
- Tzanakis–de Weger 1989 case (iii): reduction when the θ_i are ℚ-linearly dependent, by passing to a maximal independent subset.
- Revision closure obligations: Raw finite certificate checkers and concrete producers. Exact unavailable signatures are in per-node suggestedOmissions.

### EffectiveDiophantineMethods:ED.2

**Coverage:** `planned`.

- Reduction of Thue–Mahler solutions with gcd(Y, f_0) > 1 to normalised instances (the certificate covers the normalised set of Tzanakis–de Weger's (2), which is everything when f_0 = ±1)
- Exact models of 𝒪_L/𝔓^t for the extension of ℚ_{p_l} generated by the roots of an irreducible factor of G over ℚ_{p_l} (Hensel factorisation), extending EffectiveDiophantineMethods:ED.0/padic-embedding-certificate beyond embeddings into ℚ_p, for the second special case of Tzanakis–de Weger 1992 §14; and discrete-logarithm certificates with several generators where the relevant subgroup of (𝒪_L/𝔓^t)^× is not cyclic
- A certified constant for the Laurent–Mignotte–Nesterenko two-logarithm bound (DiophantineApproximationAndTranscendence:DT.3/laurent-mignotte-nesterenko-two-logarithms) as a sharper input for two-term linear forms
- Revision closure obligations: Prime-ideal valuation and completion adapters, Raw finite certificate checkers and concrete producers, Supplier-dependent signatures omitted under PROTOCOL §13. Exact unavailable signatures are in per-node suggestedOmissions.
- Build the explicitly specified raw effective-bound transcripts and full prime-ideal valuation correspondence; same-name §13 omissions identify each carrier, API and test. Semantic summaries do not close these targets.

### EffectiveDiophantineMethods:ED.3

**Coverage:** `planned`.

- General 2-descent through quartics (Cremona Method 2: invariant reduction Prop. 3.6.1–3.6.2, the syzygy sieve, the equivalence test Prop. 3.6.3) as an alternative Selmer algorithm that avoids class groups of the cubic field.
- Practical canonical-height enclosures through Silverman's local heights (Cremona Prop. 3.4.1 and the real series with its truncation bound), once the RP.0 local-height decomposition exists.
- Develop sharper height-difference bounds and Tate–Lichtenbaum saturation maps after recovering and independently checking the required primary passages. The inherited Prickett §3.1/Theorem3.3.1 attribution remains unverified in this revision; none of the five retained R7 proof routes depends on it.
- Isogeny descents of odd prime degree and second descents (4-descent) for curves with nontrivial Ш[2].
- Number-field versions of the local images (complex places, ramified 2-adic fields) for ED.5's number-field sieve inputs.
- Revision closure obligations: Rank of E11 = X₁(11), Genus-two rank-zero curves (models of X₁(13), X₁(16), X₁(18)), Corrected 2-descent for the Jacobian of C₁(3₂), Explicit points on Fermigier's homogeneous spaces, Prime-ideal valuation and completion adapters, Raw finite certificate checkers and concrete producers, General Jacobian height and finite torsion fibres, General-number-field explicit height comparison interface, Supplier-dependent signatures omitted under PROTOCOL §13. Exact unavailable signatures are in per-node suggestedOmissions.
- R3 signature repair is complete: actual local W/μ/norm carriers, same-name 571a1 replay omission and explicit rational height/error data with exact width. Local proofs/factories remain planned. R7 proof-source access is resolved by Siksek1995 for all five nodes; Prickett Tate–Lichtenbaum refinements still require primary recovery.

### EffectiveDiophantineMethods:ED.4

**Coverage:** `planned`.

- Request to SchemeAndStackFoundations:SF.3 for the curve inputs (ι_O* isomorphism, Riemann–Roch consequences, specialisation of divisors over ℤ_p, the relative canonical sheaf of regular models, the symmetric square).
- Request to HeightsRationalPointsAndObstructions:RP.1 for the Mordell–Weil theorem and to DeligneWeightsAndPurity:DWP.1 for P_π(π) = 0.
- The application to C₁(3₂) is conditional on the rank input that ED.3/poonen-genus-two-mordell-weil records as a gap; the application to X₀^dyn(6) is conditional on rank J(ℚ) ≤ 3 by its source.
- Refinement: Stoll's bound #X(ℚ) ≤ #X̃(𝔽_p) + 2r (McCallum–Poonen Remark 5.5) and Coleman's bound for p ≤ 2g and over number fields (Remark 5.4) are not planned; their sources (Stoll 2006, Coleman 1985) were not read.
- The original absolute symmetric-power proof is now read in Siksek2009 version of record, Theorem3.2 and Lemmas3.3–3.4; constructing the actual Sym²/Picard/trace/local-expansion carriers remains with the named suppliers. The general relative Theorem4.3 is not imported from its printed strict i≥0 inequality (sourceIssueE31).
- Revision closure obligations: Geometric tiny-integral signature, Raw finite certificate checkers and concrete producers, Supplier-dependent signatures omitted under PROTOCOL §13. Exact unavailable signatures are in per-node suggestedOmissions.
- R4 is represented faithfully by exact same-name §13 omissions for the geometric divisor, topology, curve-counting, Siksek and symmetric-square interfaces. The finite raw residue-disc contract is explicit; constructing its actual chart/coefficient/tail/point producers and full checker remains open. Supporting finite arithmetic/linear algebra is labelled separately.

### EffectiveDiophantineMethods:ED.5

**Coverage:** `planned`.

- Close the Cassels–Flynn gap so that kummer-curve-test, genus-two-bad-information and genus-two-deep-information rest on planned explicit models; Lemma 6.1 (A from B) and the linear forms ℓ_m of §6 belong with it.
- Close the gap on certified finite presentations (Mumford representation, Cantor's algorithm, discrete logarithms, Smith normal forms) so that certificates can be executed; plane-quartic and other non-hyperelliptic models need their own Jacobian arithmetic.
- Close the genus-two height-comparison gap (γ, d, δ, height-pairing matrix) for the height and integral-point modes.
- Sharper integral-point bounds through the descent covering x − α = κξ² of Bugeaud–Mignotte–Siksek–Stoll–Tengely (source not read); the workflow here uses the DT.4 bound for the equation itself.
- Heuristic material is not planned and never a hypothesis: the expected sizes n(S, N) and n(L), FindQSequence and the thresholds ε, ε₁, the B-smooth choice of primes, Poonen's heuristic, Lemma 4.3, Conjectures 4.2 and 4.4, Lemma 8.1 and Box's prime-choosing heuristics. Termination of an unbounded sieve search is not claimed.
- Reproduce the small-curves certificates and the Box / Caraiani–Newton examples as ED.6 worked examples.
- Revision closure obligations: Certified finite presentations of Jacobians over finite fields and of sieve quotients, Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces, Height comparison constants for genus-two Jacobians, Data of the small genus-two curves experiment, Raw finite certificate checkers and concrete producers, General Jacobian height and finite torsion fibres. Exact unavailable signatures are in per-node suggestedOmissions.

### EffectiveDiophantineMethods:ED.6

**Coverage:** `planned`.

- The BDMTV 2021 examples not planned as nodes: the genus-two curves X_0^+(N) (N = 67, 73, 103, 107, 167, 191, with the Mordell–Weil sieve), the two Program B curves X_H of level 25, the curves C188, C161 with nontrivial local heights at bad primes (§5.4), and X_ns^+(17) of genus 6 (Theorem 1.2 of BDMTV 2021).
- The precision analysis of BDMTV 2021 §4.2 (Frobenius-equivariant splitting at Teichmüller and general points, Lemmas 4.2–4.4) is consumed through height-series-valuation-bound as one statement; the full constants and branches are specified in revision3, while actual coefficient transports and finite evaluation precision proofs remain open.
- The certificate data of the X_s(13) and X_0^+(N) runs (Frobenius matrices, zero tables, second-chart basis) must be regenerated by certified runs; no such replay is claimed here; their exact formats follow the CN.5 schema once it exists.
- Three recorded gaps: Bilu–Parent–Rebolledo, Baran's X_ns(13) model and isomorphism, and the X_S4(13) isogeny and reduction inputs.
- Revision closure obligations: Bilu–Parent–Rebolledo theorem for X_s(ℓ), ℓ > 7, ℓ ≠ 13, Baran's model of X_ns(13) and the isomorphism with X_s(13), X_S4(13): isogeny of the Jacobian with J_s(13) and potential good reduction at 13, Certified Coleman integrals between residue discs through ramified extensions, Raw finite certificate checkers and concrete producers, Certified Hodge truncation and pole bounds, Root clusters and multiplicity under perturbation, Modular rank-one application over ℚ, Supplier-dependent signatures omitted under PROTOCOL §13. Exact unavailable signatures are in per-node suggestedOmissions.
- R5 mathematical interfaces are now represented by exact same-name §13 omissions; their actual geometric suppliers, coefficient semantics and proof closure remain open.
- R6 exact actual-model application signatures and all genus-three source point lists are now represented; supplier identification and numerical replay remain open.

### Recorded gaps

#### Rank of E11 = X₁(11)

E11 : y² + y = x³ − x² has no rational 2-torsion; rank 0 needs a full 2-descent over the cubic field of x³ − 4x² + 16 (class group and units) or a 5-isogeny descent. No source read here prints that computation (Poonen cites Cremona's tables).

**Needed by:** `EffectiveDiophantineMethods:ED.3/rank-zero-curves`.

#### Genus-two rank-zero curves (models of X₁(13), X₁(16), X₁(18))

The ArithmeticDynamics request lists y² = x⁶ + 2x⁵ + x⁴ + 2x³ + 6x² + 4x + 1, y² = x⁶ + 2x⁵ + 5x⁴ + 10x³ + 10x² + 4x + 1 and v² = u(u² + 1)(1 + 2u − u²) with their rational points. Poonen 1995 states these are modular curves whose points were computed earlier; no source read here gives the descent and torsion certificates, so J(ℚ) finite and the point lists are not certified.

**Needed by:** `EffectiveDiophantineMethods:ED.3/rank-zero-curves`.

#### Corrected 2-descent for the Jacobian of C₁(3₂)

The local computation at 743 in Poonen 1995 Proposition 1 uses the non-point (2, √33); the erratum says the 2-adic information completes the descent but does not print it. The local images at 2 and 743 for (x − T) on J(ℚ_2), J(ℚ_743) and the resulting H′ must be computed and certified.

**Needed by:** `EffectiveDiophantineMethods:ED.3/poonen-genus-two-mordell-weil`.

#### Explicit points on Fermigier's homogeneous spaces

Cremona reports rational points on 7 + 6 homogeneous spaces giving n₁ = 256, n₁′ = 128 but does not print them; the certified lower bound rank ≥ 13 needs them.

**Needed by:** `EffectiveDiophantineMethods:ED.3/fermigier-rank-thirteen`.

#### Certified finite presentations of Jacobians over finite fields and of sieve quotients

Certified executable presentations: the Mumford representation of J(𝔽_p) for hyperelliptic models and the correctness of Cantor's composition and reduction (Bruin–Stoll cite Cantor 1987, not read); a certified isomorphism J(𝔽_p) ≅ ⊕ ℤ/n_iℤ; discrete logarithms (Pohlig–Hellman) for the local maps on generators and for the image of C(𝔽_p); enumeration of C(𝔽_p); Smith-normal-form presentations of Γ/L_j, of the kernels of Γ/L_{j+1} → Γ/L_j and of the image subgroups φ_i(L_j). Natural owner: ComputationalNumberTheory:CN.3 with CN.0 carriers. The ED.5 theorems take finite groups and maps as inputs and are proved without these; executing a certificate needs them. Non-hyperelliptic models (plane quartics, Box's models of X₀(N)) need the same for their own Jacobian arithmetic. Supersedes the existing gap 'ED.5 geometric reduction and certified input data' together with jacobian-reduction-data and the requests to NeronModels R11.4.

**Needed by:** `EffectiveDiophantineMethods:ED.5/jacobian-reduction-data`, `EffectiveDiophantineMethods:ED.5/sieve-certificate`, `EffectiveDiophantineMethods:ED.5/genus-two-bad-information`.

#### Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces

Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).

**Needed by:** `EffectiveDiophantineMethods:ED.5/kummer-curve-test`, `EffectiveDiophantineMethods:ED.5/genus-two-bad-information`, `EffectiveDiophantineMethods:ED.5/genus-two-deep-information`.

#### Height comparison constants for genus-two Jacobians

For genus-two Jacobians: a certified bound γ ≥ h − ĥ between the naive Kummer height and the canonical height (Stoll 1999 and 2002, Bruin–Stoll references [25, 27], not read), the height-pairing matrix of the generators, and the comparison ĥ(ι(P)) ≤ d·h(P) + δ for the embedding (for ι(P) = [P − ∞] on an odd-degree model through the Kummer coordinates of [P − ∞]). The elliptic case is covered by Tau Ceti's canonical height and ED.3/explicit-height-difference-bound; the Néron–Tate height itself is requested from RP.0.

**Needed by:** `EffectiveDiophantineMethods:ED.5/height-bounded-points`, `EffectiveDiophantineMethods:ED.5/kummer-curve-test`, `EffectiveDiophantineMethods:ED.5/integral-points-completeness`, `EffectiveDiophantineMethods:ED.5/sieve-certificate-sound`.

#### Data of the small genus-two curves experiment

The list of the 1492 curves, their Mordell–Weil generators and ranks (with the BSD-conditional cases) and the local data, from Bruin–Stoll, 'Deciding existence of rational points on curves: an experiment', Experiment. Math. 17 (2008) 181–189, and the electronic appendix MWSieve-new.m; not read.

**Needed by:** `EffectiveDiophantineMethods:ED.5/small-genus-two-nonexistence`.

#### Bilu–Parent–Rebolledo theorem for X_s(ℓ), ℓ > 7, ℓ ≠ 13

Bilu–Parent (Ann. Math. 2011) and Bilu–Parent–Rebolledo (Ann. Inst. Fourier 2013): for every prime ℓ > 7 with ℓ ≠ 13, X_s(ℓ)(Q) consists of cusps and CM points (Mazur's integrality method, available since J_0(ℓ) ≠ 0, combined with Runge's method). No roadmap owns this theorem; it is the input of BDMTV Theorem 1.2 for ℓ = 11 and ℓ ≥ 17 (BDMTV 2019 item /2).

**Needed by:** `EffectiveDiophantineMethods:ED.6/split-cartan-classification`.

#### Baran's model of X_ns(13) and the isomorphism with X_s(13)

Baran (2014) gives explicit smooth plane quartic models of X_ns(13) and X_s(13) and a projective linear isomorphism between them. The X_ns(13) model (from q-expansions of the corresponding forms) and the 3 × 3 matrix are not in the sources read; the certificate is the identity Q_ns ∘ M = c·Q_s together with the canonical-model certificate of X_ns(13) (BDMTV 2019 item /4).

**Needed by:** `EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13`.

#### X_S4(13): isogeny of the Jacobian with J_s(13) and potential good reduction at 13

BDMTV 2021 §5.1 cites Banwait–Cremona for the model and for Jac(X_S4(13)) ∼ Jac(X_s(13)), and an MCLF computation for potential good reduction at 13. Neither is certified in a source read here; both are inputs of the rank, Picard number and local-height hypotheses of the quadratic Chabauty certificate.

**Needed by:** `EffectiveDiophantineMethods:ED.6/xs4-13-rational-points`.

#### Certified Coleman integrals between residue discs through ramified extensions

BDMTV 2019 §6.6 computes the single integrals ∫_b^{P0} ω on the residue disc of P0 = (1:1:1), where the Frobenius lift of the first chart is not defined, by overconvergence over highly ramified extensions (Balakrishnan–Tuitman 2017, Propositions 3.8 and 4.3). ED.6 owns the integration and precision certificate for this step (stage text: 'implement its integration/precision certificates'); its source, Balakrishnan–Tuitman, 'Explicit Coleman integration for hyperelliptic and general curves', was not read for this blueprint, so the precision bound of that computation is not decomposed. ColemanIntegration L1 supplies the Coleman integral itself; PadicDifferentialEquationsAndRigidCohomology RD.7 supplies only the Frobenius data.

**Needed by:** `EffectiveDiophantineMethods:ED.6/xs13-p0-disc`.

#### Geometric tiny-integral signature

Construct the actual smooth proper curve/Jacobian datum, identify Abel–Jacobi pullback on regular differentials and its formal completion with the named supplier carriers, and derive the geometric primitive identity and convergence. GoodReductionChabautyDatum and the geometric abelianIntegral_eq_primitive are precisely omitted. The separately named set-theoretic reduction/disc and finite-sum helpers have no regular-differential or analytic comparison. An arbitrary discontinuous map from pZ_p to the additive group Q_p with zero reduction cannot supply an analytic primitive.

**Needed by:** `EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/abelian-integral`, `EffectiveDiophantineMethods:ED.4/tiny-integral-expansion`, `EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation`, `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`.

#### Prime-ideal valuation and completion adapters

Identify the height-one-prime valuation K → ℤᵐ⁰ at the pinned Mathlib with additive ord_𝔭, the chosen completed local field and its normalisation ord_𝔭(p)=e_𝔭. Even the split ℚ_p embedding needs the e=f=1 identification. ED.0’s stated finite-extension remaining work is additional, not supplied by a bare Padic.valuation call or CN.2 prime decomposition.

**Needed by:** `EffectiveDiophantineMethods:ED.0/valuation-certificate`, `EffectiveDiophantineMethods:ED.2/certified-padic-lower-bound`, `EffectiveDiophantineMethods:ED.3/local-descent-image`.

#### Raw finite certificate checkers and concrete producers

ED.1 has proof-free rational inverse/cube-distance, real-enclosure and p-adic residue/lattice schemas with finite checks and separate soundness signatures. ED.4 has a finite coefficient-dominance checker fragment; its full geometric residue-disc verifier remains specified as an exact omission. ED.5 has the finite class-table checker, with SieveCertificate.Checked restricted to j<length. Construct actual CN.3 quotient presentations and table transport, geometric Chabauty genus/rank/nonzero-annihilator data, genuine descent local factors and point evaluations, and complete Thue/Thue–Mahler and QC example producers. Semantic proof-bearing records and universally quantified validity are supporting mathematics; they are not finite executable producers. The suggested signatures and independent small arithmetic checks do not constitute Lean elaboration or numerical replay of the large examples.

**Needed by:** `EffectiveDiophantineMethods:ED.1/exclusion-certificate`, `EffectiveDiophantineMethods:ED.2/thue-factor-covering`, `EffectiveDiophantineMethods:ED.3/local-descent-image`, `EffectiveDiophantineMethods:ED.3/two-selmer-certificate`, `EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate`, `EffectiveDiophantineMethods:ED.5/sieve-certificate`, `EffectiveDiophantineMethods:ED.6/qc-disc-certificate`, `EffectiveDiophantineMethods:ED.6/qc-modular-algorithm`.

#### Arbitrary-element characteristic polynomial bridge

The pinned charpoly_leftMulMatrix theorem identifies multiplication by a power-basis generator with its minimal polynomial. To justify χ_x=minpoly(x)^[K:ℚ(x)] for arbitrary x in the supplied K basis, supply the restriction-of-scalars/tower characteristic-polynomial identity and basis invariance, or cite an exact stronger supplier statement. The pinned generator theorem alone is insufficient.

**Needed by:** `EffectiveDiophantineMethods:ED.0/height-enclosure`.

#### General Jacobian height and finite torsion fibres

RP.0 supplies general heights, not a certified positive-definite canonical-height form on a Mordell–Weil group modulo its finite torsion subgroup. RP.1 and ED.5’s existing explicit genus-two height gap cover parts of the need but do not discharge it. Show positivity on the free quotient, construct torsion representatives and control finite torsion fibres of every bounded search; a semidefinite form on an arbitrary additive group does not imply finite enumeration.

**Needed by:** `EffectiveDiophantineMethods:ED.3/height-lower-bound-by-search`, `EffectiveDiophantineMethods:ED.3/index-bound`, `EffectiveDiophantineMethods:ED.5/height-bounded-points`, `EffectiveDiophantineMethods:ED.5/integral-points-completeness`.

#### Certified Hodge truncation and pole bounds

Derive sufficient Laurent truncation orders for ΩᵀZdΩ and ΩᵀZNNᵀΩ and a finite-dimensional function space containing γ_Fil. A bound by the largest individual differential pole order is unjustified because primitives are multiplied. State and certify the exact bound before claiming the general finite algorithm; the explicit X_s(13) space H⁰(X,O(2D)) is a separate concrete case.

**Needed by:** `EffectiveDiophantineMethods:ED.6/hodge-filtration-algorithm`.

#### Root clusters and multiplicity under perturbation

Give the Newton polygon/Weierstrass perturbation theorem over ℂ_p with multiplicity, restricted-series convergence, positive n−k, nonzero normalisation and a positive root bound. Polynomial.roots only enumerates actual roots in its coefficient field; it supplies neither roots modulo p^n nor clusters over ℂ_p. The suggested lemma proves only a necessary congruence for an existing root, and does not establish existence, lift counts or isolation.

**Needed by:** `EffectiveDiophantineMethods:ED.6/root-determination-precision`, `EffectiveDiophantineMethods:ED.6/qc-disc-certificate`.

#### Modular rank-one application over ℚ

GZ.8 gives the CM/quadratic-field Gross–Zagier trace formula and HE.7 gives a maximal-RM Heegner/Kolyvagin conclusion under admissibility hypotheses. Exhibit an admissible imaginary quadratic field, twisting/rank-one factorisation and the passage back to ℚ (or import a supplier theorem with exactly the ℚ modular rank-one conclusion). The existing request for this conclusion is not a proof of it. Also certify the nonzero analytic derivative numerically; assuming weak BSD alone does not certify a reported nonzero L-derivative.

**Needed by:** `EffectiveDiophantineMethods:ED.6/xs13-rank-three`, `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`.

#### General-number-field explicit height comparison interface

The preceding revision reported reading Silverman1990 Theorem1.1 and Remark1.2, p.725. The exact μ_S and absolute/relative conversion remain in the suggested omission register. In this independent review the AMS primary PDF was inaccessible: both independent primary verification and the actual weighted number-field Lean signature with discriminating tests remain outstanding.

**Needed by:** `EffectiveDiophantineMethods:ED.3/explicit-height-difference-bound`.

#### Supplier-dependent signatures omitted under PROTOCOL §13

The 69 exact omission records identify every unavailable advertised supplier-dependent signature, its mathematical domain, hypotheses, output, API and discriminating tests. Construct the specified supplier carriers, identifications and finite producers, then implement these signatures. The separately named semantic summaries and algebraic helpers do not construct the omitted geometry or raw certificates. An omission records a precise implementation boundary and does not establish the target theorem.

**Needed by:** `EffectiveDiophantineMethods:ED.0/certified-enclosure`, `EffectiveDiophantineMethods:ED.2/thue-analytic-constants`, `EffectiveDiophantineMethods:ED.2/thue-certificate`, `EffectiveDiophantineMethods:ED.2/thue-certified-solution-set`, `EffectiveDiophantineMethods:ED.2/prime-ideal-removing-lemma`, `EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering`, `EffectiveDiophantineMethods:ED.2/thue-mahler-certificate`, `EffectiveDiophantineMethods:ED.2/thue-mahler-certified-solution-set`, `EffectiveDiophantineMethods:ED.2/s-unit-certificate`, `EffectiveDiophantineMethods:ED.2/s-unit-certified-solution-set`, `EffectiveDiophantineMethods:ED.3/local-descent-image`, `EffectiveDiophantineMethods:ED.3/two-selmer-certificate`, `EffectiveDiophantineMethods:ED.3/explicit-height-difference-bound`, `EffectiveDiophantineMethods:ED.4/good-reduction-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/abelian-logarithm`, `EffectiveDiophantineMethods:ED.4/abelian-integral`, `EffectiveDiophantineMethods:ED.4/tiny-integral-expansion`, `EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation`, `EffectiveDiophantineMethods:ED.4/coleman-abelian-comparison`, `EffectiveDiophantineMethods:ED.4/padic-closure-dimension`, `EffectiveDiophantineMethods:ED.4/chabauty-finiteness`, `EffectiveDiophantineMethods:ED.4/coleman-bound`, `EffectiveDiophantineMethods:ED.4/bad-reduction-bound`, `EffectiveDiophantineMethods:ED.4/hyperelliptic-residue-discs`, `EffectiveDiophantineMethods:ED.4/residue-disc-verdict`, `EffectiveDiophantineMethods:ED.4/chabauty-coleman-certificate`, `EffectiveDiophantineMethods:ED.4/number-field-chabauty-criterion`, `EffectiveDiophantineMethods:ED.4/symmetric-square-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/symmetric-chabauty`, `EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty`, `EffectiveDiophantineMethods:ED.4/fps-quintic-cycle-curve`, `EffectiveDiophantineMethods:ED.4/poonen-type-three-two-curve`, `EffectiveDiophantineMethods:ED.4/stoll-six-cycle-curve`, `EffectiveDiophantineMethods:ED.5/kummer-curve-test`, `EffectiveDiophantineMethods:ED.5/genus-two-bad-information`, `EffectiveDiophantineMethods:ED.5/genus-two-deep-information`, `EffectiveDiophantineMethods:ED.5/small-genus-two-nonexistence`, `EffectiveDiophantineMethods:ED.6/qc-disc-certificate`, `EffectiveDiophantineMethods:ED.6/qc-certificate-sound`, `EffectiveDiophantineMethods:ED.6/explicit-setup`, `EffectiveDiophantineMethods:ED.6/explicit-connection`, `EffectiveDiophantineMethods:ED.6/hodge-filtration-explicit`, `EffectiveDiophantineMethods:ED.6/hodge-filtration-algorithm`, `EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix`, `EffectiveDiophantineMethods:ED.6/frobenius-equivariant-splitting`, `EffectiveDiophantineMethods:ED.6/local-height-at-p`, `EffectiveDiophantineMethods:ED.6/base-point-change`, `EffectiveDiophantineMethods:ED.6/height-series-valuation-bound`, `EffectiveDiophantineMethods:ED.6/root-determination-precision`, `EffectiveDiophantineMethods:ED.6/qc-modular-algorithm`, `EffectiveDiophantineMethods:ED.6/xs13-plane-model`, `EffectiveDiophantineMethods:ED.6/xs13-endomorphism-algebra`, `EffectiveDiophantineMethods:ED.6/xs13-analytic-rank-certificate`, `EffectiveDiophantineMethods:ED.6/xs13-rank-three`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`, `EffectiveDiophantineMethods:ED.6/xs13-first-chart-hodge-data`, `EffectiveDiophantineMethods:ED.6/xs13-first-chart-frobenius`, `EffectiveDiophantineMethods:ED.6/xs13-equivariant-height-matrices`, `EffectiveDiophantineMethods:ED.6/xs13-first-chart-points`, `EffectiveDiophantineMethods:ED.6/xs13-second-chart-points`, `EffectiveDiophantineMethods:ED.6/xs13-p0-disc`, `EffectiveDiophantineMethods:ED.6/xs13-rational-points`, `EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13`, `EffectiveDiophantineMethods:ED.6/xs4-13-rational-points`, `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`.

#### Raw effective-bound transcripts and prime-ideal valuation correspondence

The complete finite ThueConstants/ThueCertificate/ThueMahlerCertificate/SUnitCertificate carriers, their finite ideal/unit coverage, initial-bound derivations, step replay and total residual-row checks remain to be built. Exact same-name input/check/soundness contracts and raw test contracts are registered in suggestedOmissions. The Lean companion now uses separately named semantic summaries and a scoped unramified uniqueness helper; none discharges a raw or full prime-removing target. The actual five case records are stated, while the CaseIII ideal-factorization replay remains explicitly omitted. The full ramified root/prime-ideal valuation correspondence and its bounded finite-ideal enumeration remain open.

**Needed by:** `EffectiveDiophantineMethods:ED.2/thue-analytic-constants`, `EffectiveDiophantineMethods:ED.2/thue-certificate`, `EffectiveDiophantineMethods:ED.2/thue-mahler-certificate`, `EffectiveDiophantineMethods:ED.2/s-unit-certificate`, `EffectiveDiophantineMethods:ED.2/prime-ideal-removing-lemma`, `EffectiveDiophantineMethods:ED.2/thue-mahler-s-unit-covering`.

#### Geometric Chabauty and finite residue-disc verdicts

The nine R4 targets now have exact same-name suggestedOmissions, full geometric domains and source hypotheses, named API/tests and matching reader text. Supporting generic sum/rank/counting/congruence lemmas and semantic zero data are renamed and do not discharge these interfaces. The raw disc contract specifies finite coefficient residues, strict certified tails, exhaustive ball trees, exact algebraic zero/nonrationality certificates and a separate soundness theorem; only its finite integer coefficient-check fragment is prototyped. Construct the actual source-owned divisor/Picard, p-adic Lie topology, differential/model and certified CN.4 analytic interfaces, then implement the recorded signatures. The original absolute symmetric-power proof was recovered and read; no original-source access gap remains for that specialized proof. This is an honest supplier/implementation boundary, not an unresolved mismatch hidden in an abstract theorem.

**Needed by:** `EffectiveDiophantineMethods:ED.4/kernel-of-reduction-evaluation`, `EffectiveDiophantineMethods:ED.4/padic-closure-dimension`, `EffectiveDiophantineMethods:ED.4/chabauty-finiteness`, `EffectiveDiophantineMethods:ED.4/coleman-bound`, `EffectiveDiophantineMethods:ED.4/bad-reduction-bound`, `EffectiveDiophantineMethods:ED.4/residue-disc-verdict`, `EffectiveDiophantineMethods:ED.4/number-field-chabauty-criterion`, `EffectiveDiophantineMethods:ED.4/symmetric-square-chabauty-datum`, `EffectiveDiophantineMethods:ED.4/symmetric-chabauty`.

#### Explicit quadratic Chabauty comparisons and precision

Revision3 now records exact same-name geometric omissions for all ten named targets and gives the full Proposition4.6 constants/branches (the review’s Proposition4.1 locator is corrected). Remaining proof work: NC.2/NC.5/SF.3 actual geometric carriers and identifications, rigid-cohomology reduction/precision, all coefficient-bound transports and the Hecke-cycle comparison. These are not implemented by the supporting matrix helpers. The accepted Hodge truncation, root-cluster and raw QC tree gaps remain.

**Needed by:** `EffectiveDiophantineMethods:ED.6/qc-certificate-sound`, `EffectiveDiophantineMethods:ED.6/explicit-setup`, `EffectiveDiophantineMethods:ED.6/explicit-connection`, `EffectiveDiophantineMethods:ED.6/hodge-filtration-explicit`, `EffectiveDiophantineMethods:ED.6/frobenius-structure-matrix`, `EffectiveDiophantineMethods:ED.6/frobenius-equivariant-splitting`, `EffectiveDiophantineMethods:ED.6/local-height-at-p`, `EffectiveDiophantineMethods:ED.6/base-point-change`, `EffectiveDiophantineMethods:ED.6/height-series-valuation-bound`, `EffectiveDiophantineMethods:ED.6/xs13-tate-classes`.

#### Modular models and complete application certificates

Revision3 now specifies actual rational-point/model/carrier statements under all four exact application names, including all nine X0+(N) models and point lists. Missing Baran isomorphism, CM/moduli dictionaries, XS4 isogeny/reduction, modular rank-overQ, numerical coefficients and complete disc/root tables remain explicit supplier/proof gaps; no numerical replay or completed certificate is claimed.

**Needed by:** `EffectiveDiophantineMethods:ED.6/xs13-rational-points`, `EffectiveDiophantineMethods:ED.6/nonsplit-cartan-13`, `EffectiveDiophantineMethods:ED.6/xs4-13-rational-points`, `EffectiveDiophantineMethods:ED.6/x0plus-genus-three-points`.

#### ED.3 local geometric proofs and concrete descent replay

R3 now has actual local Weierstrass/μ/norm/even-valuation signatures and the exact height width. Proofs still require the existing Layer4 reduction/formal-logarithm comparison and the finite unramified factor/unit-square norm count. The actual local-image producers and x³−x/571a1 finite descent replays remain precise omissions, not arbitrary-cardinality implementations.

**Needed by:** `EffectiveDiophantineMethods:ED.3/local-quotient-cardinality`, `EffectiveDiophantineMethods:ED.3/good-place-local-image`, `EffectiveDiophantineMethods:ED.3/two-selmer-certificate`.

## Exact signature omissions under PROTOCOL §13

Every entry below is also attached to its target node and appears in the Lean omission register. These are the actual missing mathematical interfaces, including their data, hypotheses and conclusions. A separately named semantic record, finite algebra calculation or matrix identity supplies only its stated supporting result.

### 1. ED.0/certified-enclosure

**Names:** `TauCeti.EffectiveDiophantine.ED0.PadicEnclosure.toPadicApproximation`, `padicEnclosure_normalize_five`, `padicEnclosure_normalize_zero`.

**Boundary:** CN.0 PadicApproximation is planned but not a declaration at either pin.

**Required signature:** For e : PadicEnclosure p x, return a : CN.0 PadicApproximation p with a.N=e.precision and a.denotation={z : Q_p | ||z-e.centre||≤p^(-N)}; hence x∈a.denotation. At c=0 take (N,N,0); otherwise v=min(v_p(c),N), and if v<N choose the nonzero residue s prime to p. The (5,1) at p=3 test must return (1,0,2), not merely a ball-membership proof. The zero-centre regression must return (2,2,0) at p=3,N=2; ball-membership examples alone do not test either record constructor.

### 2. ED.2/thue-analytic-constants

**Names:** `TauCeti.EffectiveDiophantine.ThueConstants`, `TauCeti.EffectiveDiophantine.ThueConstants.ofBoxes`, `TauCeti.EffectiveDiophantine.ThueConstants.mono`, `thueConstants_totally_complex`.

**Boundary:** The complete covering-indexed constant and interval-inverse certificate carrier is not built; the former g,m,P producer was not its signature.

**Required signature:** The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. ThueConstants is indexed by the actual ThueEquation E, K, ξ and its complete factor covering, with explicit no-real-root, empty-covering and nonempty-real-root tags. ofBoxes receives the certified complete root boxes, covering M, exactly rank(K) fundamental units and complete unit certificate, compatible embedding evaluations of ξ, every μ and ε_i, log|ε_i| intervals, precision bounds, and the selected index sets I. It checks disjoint/simple roots, conjugate-pair labels, nonzero representative modulus lower bounds, and all root-distance/derivative bounds. For each chosen U_I it checks a rational approximate inverse V and a uniform interval bound ||1−VU||∞≤ρ<1, with rows=embeddings and columns=units. It returns all correctly oriented c1,…,c6,μ−,μ+,Y0,Y1,Y1*,Y2 inequalities, including c4≥C4(cov), c5≥C5(cov),0<μ−≤min|σμ|,max|σμ|≤μ+, and every coupled threshold. The s=0 branch stores only the root certificate and Y0 and proves all solutions have |y|≤Y0; it never forms C1,C5 or a covering. mono takes new upper/lower bounds in the stated directions, positivity and the complete finite checks of all coupled inequalities, returning a certificate for the same E,K,ξ,cov. The raw computational input, the finite check, and the semantic inequalities deduced from a successful check must be separate. The partial ThueBoundParameters record and weakenC1Bound are supporting semantic data only. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

### 3. ED.2/thue-certificate

**Names:** `TauCeti.EffectiveDiophantine.ThueCertificate`, `TauCeti.EffectiveDiophantine.ThueCertificate.Valid`, `TauCeti.EffectiveDiophantine.ThueCertificate.solutions`, `TauCeti.EffectiveDiophantine.ThueCertificate.searchBound`, `TauCeti.EffectiveDiophantine.ThueCertificate.solutions_subset`, `thueCert_soundness_only`, `thueCert_totally_complex`, `thueCert_bad_box`, `thueCert_extra_pair`, `thueCert_compat`.

**Boundary:** The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.

**Required signature:** The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueCertificate(E, certified K, ξ) is a tagged finite record. The no-real-root branch has a complete root isolation showing s=0, the certified Y0 threshold, a finite Cauchy-bounded search for each integer |y|≤Y0, and the exact accepted list. It forms no unit matrix or minimum over an empty real-root set. The nonempty-covering real-root branch has the complete covering, ThueConstants output, all (i0,μ) cases, explicit conjugate choices, Matveev constants, initial and reduction transcripts, Pethő bounds, and a search integer C≥Y2′. The root approximants are rationals enclosed within1/(6C²) of every real root. The transcript contains a finite Euclidean-algorithm trace for each rational approximant, ending at its exact finite continued fraction, and all signed nonzero divisors Z with Z^n|m. It checks every convergent with denominator≤C, every small-search pair and every exceptional exponent vector: exact power-basis arithmetic determines whether ±μ∏ε^a has the form x−yξ with integral x,y, and polynomial evaluation determines acceptance. All finite candidates, including nonsolutions, have an evaluated outcome; no unbounded convergent index or unbounded x,y search occurs. The listed Finset is exactly the union of accepted outputs. ThueCertificate.Valid c means c.check=true. Its solutions/searchBound projections are raw data, and solutions_subset/solutions_eq take the checked transcript and actual supplier-semantic identification, with irreducible deg(g)≥3,m≠0, ξ a root and [K:Q]=deg(g), and conclude L⊆/L=thueSolutions g m.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data. Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

### 4. ED.2/thue-certified-solution-set

**Names:** `TauCeti.EffectiveDiophantine.ThueCertificate.solutions_eq`.

**Boundary:** The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.

**Required signature:** The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueCertificate(E, certified K, ξ) is a tagged finite record. The no-real-root branch has a complete root isolation showing s=0, the certified Y0 threshold, a finite Cauchy-bounded search for each integer |y|≤Y0, and the exact accepted list. It forms no unit matrix or minimum over an empty real-root set. The nonempty-covering real-root branch has the complete covering, ThueConstants output, all (i0,μ) cases, explicit conjugate choices, Matveev constants, initial and reduction transcripts, Pethő bounds, and a search integer C≥Y2′. The root approximants are rationals enclosed within1/(6C²) of every real root. The transcript contains a finite Euclidean-algorithm trace for each rational approximant, ending at its exact finite continued fraction, and all signed nonzero divisors Z with Z^n|m. It checks every convergent with denominator≤C, every small-search pair and every exceptional exponent vector: exact power-basis arithmetic determines whether ±μ∏ε^a has the form x−yξ with integral x,y, and polynomial evaluation determines acceptance. All finite candidates, including nonsolutions, have an evaluated outcome; no unbounded convergent index or unbounded x,y search occurs. The listed Finset is exactly the union of accepted outputs. ThueCertificate.Valid c means c.check=true. Its solutions/searchBound projections are raw data, and solutions_subset/solutions_eq take the checked transcript and actual supplier-semantic identification, with irreducible deg(g)≥3,m≠0, ξ a root and [K:Q]=deg(g), and conclude L⊆/L=thueSolutions g m.  Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit. An s>0 empty-covering tag checks a complete covering transcript with M=∅ and derives thueSolutions g m=∅ from its soundness and covers field; it returns an empty answer before forming μ± or unit-dependent constants. The s>0 constants/search branch requires M.Nonempty.

### 5. ED.2/prime-ideal-removing-lemma

**Names:** `TauCeti.EffectiveDiophantine.prime_ideal_removing`.

**Boundary:** The correspondence between prime ideals, the factors over Q_p and normalized root valuations is not yet available as a faithful Lean carrier.

**Required signature:** For a primitive integral θ of degree n≥2 with K=Q(θ), a prime p, the complete monic irreducible factorization G=∏G_i over Q_p, corresponding prime ideals P_i⊂O_K, their e_i,f_i with deg(G_i)=e_i f_i, and the roots θ_i,k in an actual common finite extension of Q_p, normalize v_p(p)=1 and certify ord_{P_i}(x−yθ)=e_i v_p(x−yθ_i,k). For coprime x,y prove (i) for i≠j at most one v_i,v_j exceeds max(e_i,e_j)v_p(θ_i,k−θ_j,l); (ii) if e_i f_i>1, v_i≤e_i v_p(θ_i,k−θ_i,l) for all distinct k,l. Then with e=max e_i, at most one v_i>(e/2)v_p(disc G), and any such factor has e_i=f_i=1; if p does not divide disc G, any factor dividing x−yθ is the unique such degree-one unramified factor. For a normalized Thue–Mahler equation apply this to each p_i and the certified fixed-norm ideal factorization to enumerate finitely many (a,b,P_i) with (x−yθ)=a b∏P_i^u_i, absolute norm(a)=|f0^(n−1)c|, b supported above the p_i with every nonfree valuation bounded by the explicit pairwise/within-factor bounds, each free P_i of degree one, and u_i+v_{p_i}(norm b)=z_i after separating the fixed norm. Where no degree-one factor exists there is no free exponent. The output has completeness for every normalized solution, obtained from the valuation theorem, not supplied as a generic predicate. The present prime_ideal_removing_unramified signature gives only uniqueness in its squarefree-mod-p branch and does not stand for these conclusions.

### 6. ED.2/thue-mahler-s-unit-covering

**Names:** `TauCeti.EffectiveDiophantine.ThueMahlerCovering.ofIdealFactorization`.

**Boundary:** CN.2 certified ideal factorization/principal generator carriers are not yet built.

**Required signature:** For θ root of integralNormalization g, [K:Q]=deg g, normalized ThueMahlerEquation, verified primes above each p_i, complete valuations/divisor representatives, principal ideal generators, ideal class orders h_i and complete units, return the finite cases α,π,h,s,t with α and each active π nonzero, and covers. Class orders and degree-one factors determine when n_i is free; when no degree-one factor occurs use h_i=0,π_i=1,n_i=0. The current abstract unit-only helper is not this producer.

### 7. ED.2/thue-mahler-s-unit-covering

**Names:** `tmCovering_missing_case`.

**Boundary:** The specific principal-ideal factorization of the Case-III solution has not been replayed as certified finite ideal data.

**Required signature:** For the same explicitly ordered five cases as tmCovering_example_cases, with c=−1 and point(399,302), verify F(399,302)=−3^13·5^3 and its principal ideal has 5-part P52²P53 using the actual ideal generators and certified factorization. Delete exactly CaseIII, whose α=π53,π5=π52,t3=1,n3=2; prove the remaining four cases cannot represent that point, including either unit sign and every unit exponent. Thus the finite case-coverage checker rejects the shortened input before the solution-list comparison. A hypothesis already saying a solution has no representation, or merely a nonempty-list theorem, is not this test.

### 8. ED.2/thue-mahler-certificate

**Names:** `TauCeti.EffectiveDiophantine.ThueMahlerCertificate`, `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.Valid`, `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions`, `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions_subset`, `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.residualBox`, `tmCert_listed_solution`, `tmCert_wrong_z`, `tmCert_unsieved_tuple`, `tmCert_no_primes`, `tmCert_compat`.

**Boundary:** The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.

**Required signature:** The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueMahlerCertificate(E, certified K, θ) records the complete finite covering, all initial/reduction transcripts, final componentwise bounds N_i,A, the exact finite exception set, and labelled auxiliary-prime factorization/residue data. Residual rows are indexed by every (case,sign,n,a) in [0,N_1]×…×[0,N_v]×[-A,A]^r and by every exception tuple. A row either names a checked violated sieve congruence or contains the exact power-basis evaluation of ±α∏ε^a∏π^n. Coordinates outside span{1,θ}, nonintegral coefficients, f0∤x, failed coprimality, or failed F(x/f0,y)=c∏p_i^z_i are explicit rejecting outcomes for that row, where z_i=n_i h_i+s_i+t_i. Every bounded row must be covered even when it cannot be a solution; omitting such a row rejects the transcript. Duplicate accepted outputs are removed by Finset equality, and the claimed L is exactly the accepted set. ThueMahlerCertificate.Valid c means c.check=true. Its solutions/residualBox projections are raw finite data; solutions_subset/solutions_eq derive L⊆/L=thueMahlerSolutions from the actual normalized equation, θ a root of integralNormalization(g), [K:Q]=deg(g), checked supplier semantics and the initial/reduction/coverage soundness theorems.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data. Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit.

### 9. ED.2/thue-mahler-certified-solution-set

**Names:** `TauCeti.EffectiveDiophantine.ThueMahlerCertificate.solutions_eq`.

**Boundary:** The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.

**Required signature:** The finite representation is over a certified number-field presentation Q[T]/(G), with rational power-basis coordinates, integral-basis conversion matrices, an irreducibility certificate, labelled real/complex embeddings, and the actual algebraic root θ. Ideal, unit, root-isolation and logarithm data are outputs of the CN.0/CN.2/CN.4 suppliers already named by this packet. No new generic number-field algorithm is owned here. A raw transcript has no proof fields. All loops have explicit finite index sets or integer ranges; checking uses exact integer/rational arithmetic and modular exponentiation. Supplier soundness theorems identify a checked finite record with the actual field, ideals, roots, units and logarithms. This identification belongs to the soundness theorem and is not a Boolean comparison on R or an assumption that the claimed answer is complete. The covering transcript records the complete prime-ideal factorizations of the fixed norm ideal and of every p_i, finite bounded valuation vectors given by the full removing lemma, all ideal-class remainders, principal generators (or certified nonprincipality), torsion representatives and exactly Units.rank K independent units. It checks ideal products, norms, residue degrees, class-order relations, basis conversions and a complete-unit regulator/index certificate. The finite case index set is exactly the product of these bounded choices, modulo explicitly checked duplicates; an omitted combination rejects. Its soundness derives conditions (U),(M)/(C). A finite list with a proof field saying it covers all solutions is only the separate semantic covering, not this finite input. An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. ThueMahlerCertificate(E, certified K, θ) records the complete finite covering, all initial/reduction transcripts, final componentwise bounds N_i,A, the exact finite exception set, and labelled auxiliary-prime factorization/residue data. Residual rows are indexed by every (case,sign,n,a) in [0,N_1]×…×[0,N_v]×[-A,A]^r and by every exception tuple. A row either names a checked violated sieve congruence or contains the exact power-basis evaluation of ±α∏ε^a∏π^n. Coordinates outside span{1,θ}, nonintegral coefficients, f0∤x, failed coprimality, or failed F(x/f0,y)=c∏p_i^z_i are explicit rejecting outcomes for that row, where z_i=n_i h_i+s_i+t_i. Every bounded row must be covered even when it cannot be a solution; omitting such a row rejects the transcript. Duplicate accepted outputs are removed by Finset equality, and the claimed L is exactly the accepted set. ThueMahlerCertificate.Valid c means c.check=true. Its solutions/residualBox projections are raw finite data; solutions_subset/solutions_eq derive L⊆/L=thueMahlerSolutions from the actual normalized equation, θ a root of integralNormalization(g), [K:Q]=deg(g), checked supplier semantics and the initial/reduction/coverage soundness theorems.  Before applying Matveev, the finite logarithm list must delete certified zero terms or supply nonzero logarithms for every retained term, and certify the remaining linear form is nonzero; branch choices and the root-of-unity sign are explicit.

### 10. ED.2/s-unit-certificate

**Names:** `TauCeti.EffectiveDiophantine.SUnitCertificate`, `TauCeti.EffectiveDiophantine.SUnitCertificate.Valid`, `TauCeti.EffectiveDiophantine.SUnitCertificate.solutions`, `TauCeti.EffectiveDiophantine.SUnitCertificate.finalBound`, `TauCeti.EffectiveDiophantine.SUnitCertificate.solutions_subset`, `sUnitCert_two`, `sUnitCert_empty`, `sUnitCert_missing`, `sUnitCert_compat`.

**Boundary:** The actual raw covering/bound/reduction/search transcript type and its finite checker are not built; the former signatures expressed semantic validity.

**Required signature:** An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. SUnitCertificate(S) records the increasing list of distinct primes, certified Yu/logarithm initial-bound data (or the proved |S|≤1 branch), successive per-prime boxes and tagged raw p-adic reduction/enumeration steps, all exceptions, the final bounds f(p), and L. Its final search domain is exactly {±1}×∏_{p∈S}[-f(p),f(p)]. For every sign/exponent tuple, including nonsolutions, it computes x=±∏p^a and y=1−x as reduced rationals, rejects y=0, and strips the primes of S from the absolute numerator and positive denominator of y to certify that both remainders are1. Each exceptional exponent box is enumerated in the same way. All rows are present exactly once in a fixed enumeration, and L is exactly their accepted pairs. Valid c means c.check=true; solutions/finalBound are finite projections, and solutions_subset/solutions_eq take the checked raw record and certified logarithm semantics and conclude L⊆/L=sUnitSolutions S. A quantified real-log inequality or a proof that every true solution was tested is not a checker input.  The named tests use these raw types and evaluate the entire checker, including invalid enclosures, wrong output pairs and missing nonsolution rows. The S={2} and S=∅ tests instantiate all finite branches and compute the exact lists; larger named examples require their complete replay data.

### 11. ED.2/s-unit-certified-solution-set

**Names:** `TauCeti.EffectiveDiophantine.SUnitCertificate.solutions_eq`.

**Boundary:** The theorem is required over the actual omitted raw certificate; the surviving semantic implication has its own name.

**Required signature:** An initial-bound transcript records every logarithm/height enclosure, degree and nonvanishing input, the chosen Matveev/Yu source formula and all rounded rational constants; it verifies the finitely many rational inequalities of the DT.3/DT.4 bound derivation. A reduction transcript records successive nonnegative componentwise boxes, the exact real or p-adic form and its coefficient/residue identities, the raw ED.1 exclusion or complete enumeration data, and the exceptional exponent vectors. Each step is tagged with the applicable ED.1/ED.2 lemma and checks its complete finite numerical hypotheses. The theorem that all genuine solutions remain in the new box or exception set is derived from those checked records and the identified logarithms; it is never a proof field universally quantifying over the unknown solution set. SUnitCertificate(S) records the increasing list of distinct primes, certified Yu/logarithm initial-bound data (or the proved |S|≤1 branch), successive per-prime boxes and tagged raw p-adic reduction/enumeration steps, all exceptions, the final bounds f(p), and L. Its final search domain is exactly {±1}×∏_{p∈S}[-f(p),f(p)]. For every sign/exponent tuple, including nonsolutions, it computes x=±∏p^a and y=1−x as reduced rationals, rejects y=0, and strips the primes of S from the absolute numerator and positive denominator of y to certify that both remainders are1. Each exceptional exponent box is enumerated in the same way. All rows are present exactly once in a fixed enumeration, and L is exactly their accepted pairs. Valid c means c.check=true; solutions/finalBound are finite projections, and solutions_subset/solutions_eq take the checked raw record and certified logarithm semantics and conclude L⊆/L=sUnitSolutions S. A quantified real-log inequality or a proof that every true solution was tested is not a checker input. 

### 12. ED.3/local-descent-image

**Names:** `certifiedLocalImage_real_three_roots`, `certifiedLocalImage_odd_good_prime`.

**Boundary:** The finite local-factor factory and actual point evaluations have not been constructed.

**Required signature:** For W=y²=x³−x over R or Q_p, derive the decomposition of W.A, valuation parity and residue-unit square coordinates, construct W.M≃(Z/2)^n, lift each certified rational abscissa to a W.Point using real sign or p-adic Hensel certificates, evaluate actual W.μ, and prove the expected image cardinality using W.μ kernel and local quotient count. The abstract tests with hidx/hcard are only cardinality algebra.

### 13. ED.3/two-selmer-certificate

**Names:** `twoSelmer_x3_minus_x.factory`, `twoSelmer_no_places.factory`, `twoSelmer_x3_minus_x`, `twoSelmer_no_places`, `twoSelmer_eq_tauceti`.

**Boundary:** The abstract basis-length examples compute cardinality only after the desired basis length is supplied; the actual descent/local factor factory has not been replayed.

**Required signature:** For the actual curve W:y²=x³−x over Q, factor its étale cubic Q³, compute square classes at2 and infinity, apply the pinned μ with all exceptional points, form actual norm and local restriction matrices, and row-reduce to a two-dimensional Selmer kernel. Independently compute the four-dimensional unconditioned norm kernel. Return concrete certificates and prove their pass/cardinality results without input basis-length hypotheses. For the compatibility regression, identify every abstract carrier and map in the certificate with the actual pinned W.A, W.M, normM, local μ and localRes for the given rational Weierstrass curve W in characteristic-not-two normal form, with W.IsElliptic, W.IsCharNeTwoNF and S containing the actual bad primes. Prove C.selmer equals the actual W.selmerGroup₂ for the ring of integers of Q and the one-member real archimedean family: this is the subgroup of W.M cut out by normM.ker, every finite-completion localCondition and the real localCondition. Use certified complete local images at S and infinity, the actual outside-S good-place theorem and the local-to-global unramified comparison. A freely supplied subgroup sel together with its defining membership equivalence is only the supporting intersection lemma. The x³−x test must additionally identify the four classes with the image of the actual rational two-torsion points O,(0,0),(1,0),(−1,0). Transport any concrete Q_p coordinates through the isomorphism with the corresponding finite adic completion before comparing the local maps.

### 14. ED.3/two-selmer-certificate

**Names:** `twoSelmer_not_image`.

**Boundary:** The actual 571a1 descent, local-image and global norm-kernel certificate has not been replayed; an abstract assumed-cardinality inequality is only supporting algebra.

**Required signature:** For Cremona 571a1 W₀=[0,−1,1,−929,−10595], transport rational points by (x,y)↦(4x,8y+4) to W:y²=x³−4x²−14864x−678064. On this actual normal-form curve construct the cubic square classes, norm and local restriction matrices, complete local images and finite Selmer certificate; certify #W.μ.range=1 and #Sel₂(W)=4, hence W.μ.range≠Sel₂(W), without input image cardinality, basis length or non-equality. The original model is Cremona ecdata row571a1; the n₁=1,n₂=4 claim is Cremona III §3.6 p.91.

### 15. ED.3/explicit-height-difference-bound

**Names:** `TauCeti.EffectiveDiophantine.ED3.silvermanMu`, `canonicalHeight_sub_half_naiveHeight_mem.numberField`.

**Boundary:** The primary source is now independently verified; the weighted number-field height API has not yet been represented on the actual pinned carrier in Lean.

**Required signature:** Let d=[K:Q] and h∞(t)=d⁻¹ Σ(v archimedean) n_v log max(1,|t|_v), with n_v=[K_v:R]. For an integral nonsingular standard Weierstrass equation W/K put μ_S=h_abs(Δ)/12+h∞(j)/12+h∞(b₂/12)/2+log(2*)/2, where 2*=1 if b₂=0 and 2 otherwise. Define silvermanMu on this W and prove, for P in W.toAffine.Point including O, −h_abs(j)/24−μ_S−973/1000 ≤ P.canonicalHeight/d−P.naiveHeight/(2*d) ≤ μ_S+107/100. Both pinned heights are relative logarithmic heights; d converts them to the absolute heights of Silverman Theorem1.1. Unit-test b₂=0, K=Q and field-extension compatibility (local weights sum correctly).

### 16. ED.4/good-reduction-chabauty-datum

**Names:** `TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.geometricFactory`, `TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum.toGoodReductionPair`, `datum_residueDisc_eq_tube`, `TauCeti.EffectiveDiophantine.ED4.GoodReductionChabautyDatum`, `GoodReductionChabautyDatum.red`, `GoodReductionChabautyDatum.red_surjective`, `GoodReductionChabautyDatum.residueDisc`, `GoodReductionChabautyDatum.localParam_bijOn`, `GoodReductionChabautyDatum.redJ_comp_abelJacobi`, `GoodReductionChabautyDatum.toGoodReductionPair`.

**Boundary:** The smooth proper curve, relative Jacobian, analytic tubes and Coleman supplier carriers have not been identified.

**Required signature:** For actual X/Q smooth proper geometrically integral, genus g≥1, O∈X(Q) and smooth proper model over Z_p, construct point reduction, all special-fibre points, full formal disc charts, the geometric Abel–Jacobi morphism, its differential pullback isomorphism and completion at O, and return the ColemanIntegration good-reduction pair. Abstract ReductionDiscData and baseResidueDisc support set-theoretic disc partitioning only; a pair Xt×Set X is not the supplier model. All listed GoodReductionChabautyDatum APIs use this same actual geometric carrier. ReductionDiscData.red/residueDisc/param are only supporting set/group data. Its genus-one finite-field test has four special-fibre points; analytic chart construction is omitted.

### 17. ED.4/abelian-logarithm

**Names:** `TauCeti.EffectiveDiophantine.ED4.abelianLog`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_eq_formalLog`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_nsmul`, `TauCeti.EffectiveDiophantine.ED4.ker_abelianLog`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_map`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_baseChange`, `TauCeti.EffectiveDiophantine.ED4.integrationPairing`, `TauCeti.EffectiveDiophantine.ED4.integrationPairing_eq_zero_iff`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_unique`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_elliptic`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_torsion`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_E11_five_torsion`, `TauCeti.EffectiveDiophantine.ED4.abelianLog_C05_kernel_point`, `TauCeti.EffectiveDiophantine.ED4.integrationPairing_leftKernel`.

**Boundary:** Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.

**Required signature:** Let K be a finite extension of ℚ_p with ring of integers O_K, residue field k and ramification index e, and A an abelian variety of dimension g over K. Write Lie(A) for its tangent space at 0 (a K-vector space of dimension g) and Ω_A := H⁰(A, Ω¹) for its space of regular 1-forms, which are the translation-invariant forms; evaluation at 0 identifies Ω_A with the dual Module.Dual K Lie(A). The abelian logarithm log_A : A(K) → Lie(A) is the unique group homomorphism that agrees with the formal logarithm on some open subgroup, constructed as follows. Let 𝒜 be the Néron model of A over O_K (an abelian scheme when A has good reduction), F̂ its formal group, the completion of 𝒜 along the zero section, a g-dimensional commutative formal Lie group over O_K once formal parameters s = (s₁, …, s_g) are chosen, and A¹(K) := ker(𝒜(O_K) → 𝒜(k)) = F̂(m_K). Let log_F̂ ∈ (K[[s]])^g be the formal logarithm, the unique homomorphism of formal groups F̂ → Ĝ_a^g over K whose linear term is the identity; its coordinates are the formal primitives of a basis of invariant differentials and converge on m_K^g. Put N := #𝒜(k) = [A(K) : A¹(K)] and log_A(x) := N⁻¹ log_F̂(s(N x)), identifying K^g with Lie(A) by ds at 0. The integration pairing is ⟨x, ω⟩ := ω(log_A x) ∈ K for x ∈ A(K), ω ∈ Ω_A. Properties: (a) log_A is a homomorphism, independent of the choices of formal parameters and of N among multiples of the exponent of 𝒜(k); (b) ker log_A = A(K)_tors, which is finite; (c) log_A is continuous, its differential at 0 is the identity, and for n > e/(p − 1) it maps the subgroup F̂(m_K^n) isomorphically onto the lattice (m_K^n)^g; (d) for a homomorphism φ : A → B of abelian varieties over K, log_B ∘ φ = dφ ∘ log_A, i.e. ⟨φ(x), ω⟩ = ⟨x, φ*ω⟩; for a finite extension K'/K, log_{A_{K'}} restricts to log_A on A(K); (e) the pairing A(K) × Ω_A → K is ℤ-bilinear and K-linear in ω, its kernel in Ω_A, {ω : ⟨x, ω⟩ = 0 ∀x}, is 0 and its kernel in A(K) is A(K)_tors; for each ω, x ↦ ⟨x, ω⟩ is the unique locally analytic homomorphism A(K) → K whose differential at 0 is ω. The compatible logarithms over finite K'/K first define log_A on A(ℚ̄_p). Over ℂ_p use the analytic logarithm of the ℂ_p-Lie group, extending this map continuously; the union over finite extensions alone does not define it on all A(ℂ_p) (KRZB Definition 3.8 and Proposition 3.16). Hypotheses: K finite over ℚ_p; A an abelian variety over K. Good reduction is not assumed; when A has good reduction 𝒜 is the abelian scheme extending A and 𝒜(k) is the group of points of its special fibre. Normalisation: Lie(A) = T₀A and the pairing is evaluation of an invariant differential on a tangent vector; no sign or scaling is inserted. Original API contracts: abelianLog: log_A : A(K) →+ Lie(A). abelianLog_eq_formalLog: On A¹(K) = F̂(m_K), log_A(x) = log_F̂(s(x)) for any choice of formal parameters s. abelianLog_nsmul: log_A(n • x) = n • log_A(x) for n ∈ ℤ. ker_abelianLog: log_A x = 0 ↔ x has finite order; A(K)_tors is finite. abelianLog_map: log_B(φ x) = dφ(log_A x) for a homomorphism φ : A → B; log_{id} = id and log respects composition. abelianLog_baseChange: For K'/K finite, log_{A_{K'}}(x) = log_A(x) ⊗ 1 for x ∈ A(K). integrationPairing: ⟨x, ω⟩ := ω(log_A x) for x ∈ A(K), ω ∈ Ω_A = Module.Dual K Lie(A). integrationPairing_eq_zero_iff: ⟨x, ω⟩ = 0 for all ω iff x is torsion; ⟨x, ω⟩ = 0 for all x iff ω = 0. abelianLog_unique: A continuous homomorphism λ : A(K) → Lie(A) that agrees with log_F̂ on some open subgroup equals log_A. Original geometric regressions: abelianLog_elliptic: For an elliptic curve E over ℚ_p with good reduction and minimal Weierstrass model, log_E on E¹(ℚ_p) is the formal-group logarithm of the Weierstrass formal group in the parameter z = −x/y (dimension one, the case of Mathlib's FormalGroup). abelianLog_torsion: log_A(x) = 0 for every torsion point x; for dim A = 0 the logarithm is the zero map to the zero space. abelianLog_E11_five_torsion: For E : y² + y = x³ − x² over ℚ_5 the point (0, 0) has order 5, so log_E(0, 0) = 0: log_A is not injective, and a definition requiring an inverse exponential on all of A(K) is wrong. abelianLog_C05_kernel_point: For the Jacobian of y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3, D' = [(0, −1) + (−3, 1) − ∞⁺ − ∞⁻] lies in J¹(ℚ_3) with Flynn's local parameters (s₁, s₂) = (−9/14, 426/49), and its formal logarithm is ≡ (36, 3) (mod 3⁴) (Flynn–Poonen–Schaefer p.22). integrationPairing_leftKernel: If ω ∈ Ω_A satisfies ⟨x, ω⟩ = 0 for all x ∈ A(K), then ω = 0.

### 18. ED.4/abelian-integral

**Names:** `TauCeti.EffectiveDiophantine.ED4.abelianIntegral`, `TauCeti.EffectiveDiophantine.ED4.abelJacobi_pullback_bijective`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_add`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_eq_zero_iff`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_map`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_trace`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_baseChange`, `TauCeti.EffectiveDiophantine.ED4.pullback_basepoint_independent`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_C05_tiny`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_self`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_weierstrass_half`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_genusOne`, `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_torsion_nonexample`.

**Boundary:** Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.

**Required signature:** Let K be a finite extension of ℚ_p, X a smooth projective geometrically integral curve of genus g ≥ 1 over K and J its Jacobian. For any O ∈ X(K) the pullback ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) along ι_O(P) = [P − O] is an isomorphism of K-vector spaces that does not depend on O; for ω ∈ H⁰(X, Ω¹) write ω_J for the invariant form with ι_O*ω_J = ω. For a degree-zero divisor D = Σ n_i P_i on X_K̄ that is Gal(K̄/K)-stable, define ∫_D ω := ⟨[D], ω_J⟩ (pairing of ED.4/abelian-logarithm on J(K)), and for Q, Q' ∈ X(K) put ∫_Q^{Q'} ω := ∫_{Q' − Q} ω = ⟨ι_O(Q') − ι_O(Q), ω_J⟩. The continuous analytic abelian logarithm over ℂ_p defines the same formulas on X(ℂ_p); finite-extension formulas give only its restriction to algebraic points. Properties: (i) K-linear in ω and additive in D; ∫_Q^{Q'} + ∫_{Q'}^{Q''} = ∫_Q^{Q''}; (ii) ∫_D ω = 0 whenever [D] is torsion in J(K), in particular when D is principal, and conversely if ∫_D ω = 0 for all ω then [D] is torsion; (iii) η_{ω,O}(P) := ∫_O^P ω = ⟨ι_O(P), ω_J⟩, and changing O adds a constant; (iv) change of variables: for a nonconstant morphism ρ : X → Y of such curves over K and ω ∈ H⁰(Y, Ω¹), ∫_D ρ*ω = ∫_{ρ_*D} ω; (v) trace: for ρ finite and E a degree-zero divisor on Y, ∫_{ρ*E} ω = ∫_E Tr_ρ ω, where Tr_ρ : H⁰(X, Ω¹) → H⁰(Y, Ω¹) is the trace; (vi) base change: ∫ is compatible with finite extensions K'/K. Hypotheses: K finite over ℚ_p; X smooth projective geometrically integral of genus g ≥ 1 over K. The definition uses only the abelian logarithm of J; no reduction hypothesis is made. When X has good reduction this integral equals the Coleman integral (ED.4/coleman-abelian-comparison). Original API contracts: abelianIntegral: ∫_D ω := ⟨[D], ω_J⟩ for a Galois-stable degree-zero divisor D and ω ∈ H⁰(X, Ω¹). abelJacobi_pullback_bijective: ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹) is bijective and independent of O. abelianIntegral_add: ∫_{D+D'} ω = ∫_D ω + ∫_{D'} ω and ∫_D (aω + bω') = a∫_D ω + b∫_D ω'. abelianIntegral_eq_zero_iff: ∫_D ω = 0 for all ω iff [D] is torsion in J; in particular ∫_{div f} ω = 0. abelianIntegral_map: ∫_D ρ*ω = ∫_{ρ_*D} ω for a morphism ρ : X → Y. abelianIntegral_trace: ∫_{ρ*E} ω = ∫_E Tr_ρ ω for ρ finite and E of degree zero on Y. abelianIntegral_baseChange: Compatible with finite extensions K'/K. TauCeti.EffectiveDiophantine.ED4.pullback_basepoint_independent: For two actual base points O,O′ of X, the pullback maps H⁰(J,Ω¹)→H⁰(X,Ω¹) along their geometric Abel–Jacobi morphisms agree. Original geometric regressions: abelianIntegral_C05_tiny: On y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1 over ℚ_3: ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ (mod 3⁵) and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵). abelianIntegral_self: ∫_Q^Q ω = 0 and ∫_D 0 = 0. abelianIntegral_weierstrass_half: On y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1 over ℚ_3 let W be the Weierstrass point with x(W) ≡ 1 (mod 3), S^± = (1, ±3); then 2W ∼ S⁺ + S⁻, so 2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω for every regular ω. abelianIntegral_genusOne: For X = E an elliptic curve and O its origin, ι_O is the identity of E = J and ∫_O^P ω = ⟨P, ω⟩ is the elliptic logarithm paired with ω. abelianIntegral_torsion_nonexample: For E : y² + y = x³ − x² over ℚ_5, ∫_O^{(0,0)} ω = 0 for every ω although (0, 0) ≠ O: the integral sees divisor classes modulo torsion, not points.

### 19. ED.4/tiny-integral-expansion

**Names:** `TauCeti.EffectiveDiophantine.ED4.abelianIntegral_eq_primitive`.

**Boundary:** The actual regular differential, geometric Abel–Jacobi and convergent formal disc supplier identifications are missing; the earlier abstract primitive statement was false.

**Required signature:** For a genuine smooth proper curve over K with good reduction, integral regular differential ω and a formal parameter t on one full residue disc, construct the integral coefficient series w(t), its convergent formal primitive I, and derive ∫_Q^Q′ω=I(t(Q′))−I(t(Q)) for points in that disc over finite extensions. Obtain this from the differential pullback of the actual Abel–Jacobi morphism and its completed formal group; do not assume the equality as a field.

### 20. ED.4/kernel-of-reduction-evaluation

**Names:** `TauCeti.EffectiveDiophantine.ED4.integrationPairing_eq_sum_tiny`.

**Boundary:** Actual effective-divisor/Picard, smooth-model specialization, regular-differential and finite-extension integration carriers are unavailable.

**Required signature:** Let (X, O, p, 𝒳) be a good-reduction Chabauty datum of genus g, and P' ∈ X(ℚ_p) whose reduction x̃' satisfies dim H⁰(X̃, O(g·x̃')) = 1 (x̃' is not a Weierstrass point of X̃). Then every D ∈ J¹(ℚ_p) = ker(red_J) is uniquely represented as D = [Q₁ + ⋯ + Q_g − g·P'] with Q₁ + ⋯ + Q_g an effective divisor defined over ℚ_p (a Galois-stable geometric multiset, allowing repeated points) whose points Q_j ∈ X(ℚ̄_p) all reduce to x̃'. Independently of the Weierstrass hypothesis, whenever D = [Q₁ + ⋯ + Q_g − g·P'] with all Q_j in the residue disc of x̃', and ω ∈ H⁰(X_{ℚ_p}, Ω¹) has expansion w(t) dt at x̃' in a parameter t with t(P') = 0, and λ := primitive(w) = Σ_{n ≥ 1} λ_n t^n, then ⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_{n ≥ 1} λ_n s_n, where s_n = Σ_j t(Q_j)^n ∈ ℚ_p are the power sums of the roots of ∏_j (T − t(Q_j)) ∈ ℚ_p[T], computed from its coefficients by Newton's identities. In particular ⟨D, ω_J⟩ is computable to any p-adic precision from an effective representative of D + g·P'. Equivalently write E=Σ_x m_x[x] over closed points of X_{ℚ_p}: Σ_x m_x[κ(x):ℚ_p]=g and the value is Σ_x m_x Tr_{κ(x)/ℚ_p}(λ(t(x))). The representative is unique as an effective divisor, not as an ordering of geometric points. The characteristic polynomial and trace include every multiplicity. Hypotheses: Good-reduction datum; x̃' not a Weierstrass point of X̃ (h⁰(g x̃') = 1). For g = 1 every point qualifies and the statement is the formal-group description of E¹.

### 21. ED.4/coleman-abelian-comparison

**Names:** `TauCeti.EffectiveDiophantine.ED4.colemanIntegral_eq_abelianIntegral`.

**Boundary:** Actual abelian-variety/Néron-formal-group, regular-differential, curve/divisor or Coleman-cohomology carriers have not been identified. Separately renamed abstract helpers do not realize these geometric signatures.

**Required signature:** Let K be a finite extension of ℚ_p with residue field 𝔽_q, (𝒳, D) a good-reduction pair over O_K (ColemanIntegration:L1/good-reduction-pair) with generic fibre X of genus g ≥ 1, Y = 𝒳 − D, a ∈ ℂ_p a branch of the logarithm and (φ, ω•, M, g•) a Frobenius-structured datum on (𝒳, D) (L1/good-reduction-datum-exists). For every ω ∈ H⁰(X, Ω¹) ⊂ Ω⁺(Y) and all x, y ∈ ]Y_k[(ℂ_p), the Coleman integral of ColemanIntegration:L1/coleman-integral equals the abelian integral: ∫^{Col}_x^y ω = ∫_x^y ω = ⟨[y − x], ω_J⟩ (ED.4/abelian-integral over ℂ_p). Consequently the Coleman integral of a regular differential does not depend on the branch a or on the Frobenius lift, extends to all of X(ℂ_p), takes values in K' on points of X(K') for K' ⊆ ℂ_p finite over K, and vanishes on every degree-zero divisor whose class is torsion. Hypotheses: (𝒳, D) a good-reduction pair over O_K, K finite over ℚ_p; ω a regular differential on the proper curve X (not merely on Y). The Frobenius-structured datum exists by ColemanIntegration:L1/good-reduction-datum-exists; its Frobenius matrix M has characteristic polynomial P_Y ∈ K[t] whose roots are Weil q-numbers of weights 1 and 2. Original API contracts:  Original geometric regressions:  Derive local primitive equality and Frobenius compatibility from the actual Coleman/cohomology suppliers and the Weil polynomial; a function supplied with the desired identities is only supporting algebra.

### 22. ED.4/padic-closure-dimension

**Names:** `TauCeti.EffectiveDiophantine.ED4.dim_padicClosure_le_rank`.

**Boundary:** Actual abelian variety point topology, continuous geometric logarithm and p-adic Lie subgroup carriers are unavailable.

**Required signature:** Let A be an abelian variety of dimension g over ℚ, p a prime, Γ ⊆ A(ℚ) ⊆ A(ℚ_p) a finitely generated subgroup of rank r and Γ̄ its closure in A(ℚ_p). Then (a) log_A(Γ̄) = ℤ_p·log_A(Γ) inside Lie(A_{ℚ_p}) ≅ ℚ_p^g; (b) the p-adic Lie subgroup Γ̄ has dimension r₀ := rank_{ℤ_p} ℤ_p·log_A(Γ) = dim_{ℚ_p} ℚ_p·log_A(Γ), and r₀ ≤ min(r, g); (c) if G ⊆ Γ has finite index then ℚ_p·log_A(G) = ℚ_p·log_A(Γ) and Ḡ has finite index in Γ̄; if moreover [Γ : G] is prime to p·#Ã(𝔽_p) for a prime p of good reduction, then Ḡ = Γ̄. Inequality r₀ < r can occur, and r₀ ≤ g always. Hypotheses: A abelian variety over ℚ (in ED.4, the Jacobian J of X); Γ finitely generated (Mordell–Weil theorem for Γ = J(ℚ), requested from HeightsRationalPointsAndObstructions:RP.1). Closure is taken in the natural p-adic analytic topology on A(ℚ_p); the logarithm is the continuous geometric abelian logarithm, a local analytic isomorphism with finite torsion kernel. In the last clause A has good reduction and #Ã(𝔽_p) is the actual order of its reduced point group.

### 23. ED.4/chabauty-finiteness

**Names:** `TauCeti.EffectiveDiophantine.ED4.finite_rationalPoints_of_rank_lt_genus`.

**Boundary:** The smooth projective curve/Jacobian, regular differential, geometric residue charts and analytic pullback/identity theorem are unavailable.

**Required signature:** Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with a rational point O, J its Jacobian, p a prime and r₀ the dimension of the p-adic closure of J(ℚ) in J(ℚ_p) (ED.4/padic-closure-dimension). If r₀ < g, in particular if r := rank J(ℚ) < g, then ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite; hence X(ℚ) is finite. Moreover, for p of good reduction its cardinality is at most Σ_{x̃ ∈ X̃(𝔽_p)} N_p(I_x̃) for any nonzero ω ∈ Ann_p(J(ℚ)) normalised to be integral with nonzero reduction, where I_x̃ is the expansion of η = ∫_O ω on D(x̃). Hypotheses: g ≥ 2; O ∈ X(ℚ); J(ℚ) finitely generated (Mordell–Weil, requested from RP.1). For p of bad reduction the residue classes are those of the minimal regular model (ED.4/bad-reduction-bound).

### 24. ED.4/coleman-bound

**Names:** `TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_coleman`.

**Boundary:** Actual smooth proper reduction, nonzero integral annihilator differential and canonical-divisor degree2g−2 comparison are unavailable.

**Required signature:** Let (X, O, p, 𝒳) be a good-reduction Chabauty datum with g ≥ 2 and r₀ < g, and ω ∈ Ann_p(J(ℚ)) nonzero, scaled so that ω ∈ H⁰(𝒳, Ω¹) with nonzero reduction ω̃ ∈ H⁰(X̃, Ω¹). (a) For x̃ ∈ X̃(𝔽_p) with m := ord_x̃ ω̃, the number of P ∈ X(ℚ) with red P = x̃ is at most the number of zeros of η on D(x̃), hence at most N_p of the disc expansion, and at most m + 1 if m < p − 2. (b) If p > 2g, then #X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2. Hypotheses: Good reduction at p; rank condition r₀ < g (in particular r < g); ω annihilates J(ℚ), which may be certified from any finite-index subgroup (ED.4/annihilating-differentials (b)).

### 25. ED.4/bad-reduction-bound

**Names:** `TauCeti.EffectiveDiophantine.ED4.card_rationalPoints_le_badReduction`.

**Boundary:** Actual minimal regular model, relative canonical sheaf, component multiplicities and horizontal/vertical intersection theory are unavailable.

**Required signature:** Let X be a smooth projective geometrically integral curve of genus g ≥ 2 over ℚ with O ∈ X(ℚ), J its Jacobian with r₀ < g at the prime p, 𝒳 → Spec ℤ_p the minimal proper regular model of X_{ℚ_p} (StableReduction layer 5), 𝒳_s its special fibre, 𝒳^sm the smooth locus of 𝒳 → Spec ℤ_p and 𝒳_s^sm its special fibre. Residue classes are the fibres of red : X(ℚ_p) = 𝒳(ℤ_p) = 𝒳^sm(ℤ_p) → 𝒳_s^sm(𝔽_p); each class lies on a single component C of multiplicity 1 and is parametrised by pℤ_p through a local parameter. Let ω ∈ Ann_p(J(ℚ)) be nonzero. (1) For a multiplicity-one component C scale ω by a power of p so that its restriction ω̃_C to C^sm := C ∩ 𝒳^sm is a nonzero 1-form; for Q̃ ∈ C^sm(𝔽_p) with m := ord_Q̃ ω̃_C < p − 2, at most m + 1 points of X(ℚ) reduce to Q̃ (and at most N_p of the class expansion in general). (2) If n_C denotes the number of zeros of ω̃_C on C^sm(𝔽_p) counted with multiplicity, then Σ_{C of multiplicity 1} n_C ≤ 2g − 2. (3) If p > 2g, then #X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2. (4) For every prime p with r₀ < g the set ι_O⁻¹(closure of J(ℚ)) ∩ X(ℚ_p) is finite. Hypotheses: Separately stated hypotheses: 𝒳 is the minimal proper regular model over ℤ_p (regularity is what makes X(ℚ_p) = 𝒳^sm(ℤ_p) and the intersection theory available); no smoothness of 𝒳 is assumed. The scaling in (1) depends on C: ω_C = p^{k_C} ω with C absent from the divisor of ω_C as a section of the relative dualising sheaf. The relative canonical sheaf ω_{𝒳/ℤ_p} of the local complete intersection 𝒳 → Spec ℤ_p, with ω_{𝒳/ℤ_p} ≅ Ω¹ on the smooth locus and compatibility with base change (Liu Proposition 6.4.9), is requested from SchemeAndStackFoundations:SF.3.

### 26. ED.4/hyperelliptic-residue-discs

**Names:** `TauCeti.EffectiveDiophantine.ED4.hyperelliptic_integralDifferentials_basis`.

**Boundary:** The generic polynomial and disc algebra does not provide an integral regular-differential module.

**Required signature:** For a smooth good-reduction hyperelliptic model y²=f(x), 2 invertible and degree 2g+1 or2g+2, prove dx/y,x dx/y,…,x^(g−1)dx/y form the integral basis and compute orders in each affine/infinity chart. State and derive smoothness/discriminant and infinity charts on the actual model.

### 27. ED.4/residue-disc-verdict

**Names:** `TauCeti.EffectiveDiophantine.ED4.ResidueDiscVerdict`, `ResidueDiscVerdict.zeros`, `ResidueDiscVerdict.Valid`, `ResidueDiscVerdict.rationalPoints_eq`, `ResidueDiscVerdict.ofKnownPoint`, `ResidueDiscVerdict.empty`, `ResidueDiscVerdict.card_le`, `ResidueDiscVerdict.changeBase`, `ResidueDiscVerdict.rawData`, `ResidueDiscVerdict.check`, `verdict_C05_disc_zero_one`, `verdict_C132_weierstrass`, `verdict_empty`, `verdict_known_zeros_only`, `verdict_rationalPoints_eq`, `verdict_reject_unknown_dominant`, `verdict_reject_tail_tie`, `verdict_reject_missing_child`, `verdict_reject_duplicate_zero`.

**Boundary:** The exact point/field-embedding, curve/chart/series interpretation and certified analytic tail interfaces needed by the full raw verifier are unavailable. The finite coefficient-check fragment and renamed semantic zero data do not supply them.

**Required signature:** For a genuine geometric Chabauty datum, a residue disc D(x̃), a certified nonzero differential annihilating a finite-index Mordell–Weil subgroup, and η(P)=∫_O^Pω, a ResidueDiscVerdict is finite raw data with a terminating checker, not a record containing a universal bound on unknown points. It contains: (i) exact curve/base-point/local-parameter identifiers and a certified integration constant; (ii) finite coefficient residue tables for scaled pullback series F(u)=p^sη(φ(p(a+p^k u))) in each encoded ball, where φ is the inverse geometric parameter chart and the finite integers a,k describe the ball (the root uses a=k=0), common absolute precision, a certified nonzero leading coefficient and a last dominant index; (iii) a finite tail-bound transcript whose soundness follows from integral differential coefficients or the CN.4 certified analytic supplier; (iv) either the whole disc as one leaf or a finite full residue-subdivision tree, with all p children at each internal ℤ_p-ball and disjoint leaves covering the root; (v) exact rational/algebraic zero records, their embeddings in ℚ_p via isolating balls, checks of the curve equation and geometric vanishing relation, rationality/nonrationality certificates and distinctness; (vi) for each leaf, the number of distinct recorded zeros equals its checked Strassmann upper bound. Zero-root leaves have bound0 and no point records. Valid means that every finite arithmetic, identifier, covering, disjointness and exact algebraic check succeeds. Under separately stated geometric interpretation and supplier-soundness hypotheses this proves X(ℚ)∩D(x̃)=Z_rat. No list of approximate roots, semantic all-point validity predicate or asserted bound is a raw certificate. Raw shape, finite checks, soundness hypotheses and all tests are exactly the associated hypotheses/API/proofSteps/tests. No universal semantic Valid is advertised as executable. Hypotheses: G of finite index in J(ℚ), so that ω also annihilates J(ℚ) (ED.4/annihilating-differentials (b)); without the finite-index certificate a verdict proves only that the rational points of D(x̃) whose image lies in the saturation of G are listed. Distinct points of Z_rat ∪ Z_irr have distinct parameters t; points are compared exactly, not to finite precision. Interpretation is external to the raw payload: a proved chart identifies every encoded ball with its geometric subdisc, the certified differential has integral derivative in the recorded coordinate, the integration constant and coefficient congruences are sound, and the imported tail producer certifies all omitted coefficients. These are theorems of the actual curve/integration and arithmetic suppliers, not arbitrary Prop fields stored in the certificate. Each nonrational zero is specified by exact algebraic coordinates/defining polynomials and a chosen ℚ_p embedding, with an exact nonrationality certificate. A Hensel-isolated analytic root alone does not prove rationality or nonrationality. Distinct zeros consume one unit of the distinct-zero bound; multiplicity is never inferred from rounded equality. One sufficient root-disc tail rule is: for F(u)=p^s I(pu), s≥0, I′ integral and I≠0, v_p([u^n]F)≥s+n−v_p(n) for n≥1. If the chosen minimum coefficient valuation is m≥0, a cutoff K≥2(m+1) gives every n≥K valuation≥m+1. The constant coefficient is certified separately. The finite table modulo p^M must have M>m and must verify the last coefficient at valuation m. This rule is sufficient, not necessary; refinement may be needed. The interpreted rescaled series must be restricted (coefficients tend to zero), proved by the integral-derivative estimate or a separate analytic supplier theorem, before applying Strassmann.

### 28. ED.4/chabauty-coleman-certificate

**Names:** `TauCeti.EffectiveDiophantine.ED4.ChabautyColemanCertificate.ofRankHypothesis`, `certificate_conditional_label.geometric`, `certificate_C05.factory`.

**Boundary:** Finite index, genus/rank and a nonzero geometric annihilator are not derived by the abstract record.

**Required signature:** Given actual J(Q) finitely generated, g≥1, rank J(Q)≤r<g, r certified independent generators modulo torsion, show their subgroup has full rank and finite index by the FG free quotient. Its p-adic log span has dimension≤r, so construct nonzero ω∈H⁰(X_Qp,Ω¹) annihilating it; only then construct all analytic disc verdicts. Conditional rank labels must be recorded; withFiniteIndex is merely a semantic helper. C05 factory must build rank/differential/four-disc data rather than receive Valid and a bound sum.

### 29. ED.4/chabauty-coleman-certificate

**Names:** `certificate_C05`.

**Boundary:** The current example is only a weaker semantic consequence, renamed separately. The exact geometric factory/conditional-label regression remains unavailable.

**Required signature:** For C₀(5) with O = ∞⁺, G = ⟨[(−3,1) − (0,1)]⟩, r = 1, p = 3: four verdicts with N = 1, 1, 2, 2 at ∞⁺, ∞⁻, (0, 1), (0, −1), and L of size 6 = Σ N. Use the actual curve and rank-labelled geometric constructor ChabautyColemanCertificate.ofRankHypothesis, together with the required genuine rank, annihilator and complete raw disc-verdict data. For C05, construct the exact six distinct rational points and the four discs with bounds1,1,2,2; verify the list and equality, not only an upper bound from an assumed sum.

### 30. ED.4/chabauty-coleman-certificate

**Names:** `certificate_conditional_label`.

**Boundary:** The current example is only a weaker semantic consequence, renamed separately. The exact geometric factory/conditional-label regression remains unavailable.

**Required signature:** A certificate built by ofRankHypothesis is conditional and its completeness theorem is stated under the labelled hypothesis. Use the actual curve and rank-labelled geometric constructor ChabautyColemanCertificate.ofRankHypothesis, together with the required genuine rank, annihilator and complete raw disc-verdict data. Check that the stored conditional label is precisely the rank hypothesis and that the soundness/completeness result still requires that hypothesis. Equality of the points field under withFiniteIndex alone is insufficient.

### 31. ED.4/number-field-chabauty-criterion

**Names:** `TauCeti.EffectiveDiophantine.ED4.eq_singleton_of_rank_reducedMatrix`.

**Boundary:** Actual number-field curve/Jacobian, all local completions and integral differential bases, integration matrices and certified kernel/Hermite construction are unavailable.

**Required signature:** Let K be a number field of degree d, C a smooth projective geometrically integral curve over K of genus g ≥ 2 with Jacobian J, D₁, …, D_r a basis of a free subgroup of finite index in J(K), and p a rational prime such that (p1) p is odd, (p2) p is unramified in K, (p3) every prime υ | p of K is a prime of good reduction for C (a good-reduction datum over O_υ, ED.4/good-reduction-chabauty-datum). Fix ℤ_p-bases θ_{υ,1}, …, θ_{υ,d_υ} of O_υ and O_υ-bases ω_{υ,1}, …, ω_{υ,g} of H⁰(𝒞_υ, Ω¹). For ω ∈ H⁰(𝒞_υ, Ω¹) let τ_j = ∫_{D_j} ω = Σ_i t_{ij} θ_{υ,i} (t_{ij} ∈ ℚ_p), T_{υ,ω} = (t_{ij}), T_υ the stack of the T_{υ,ω_{υ,l}} and T the stack over υ | p (a gd × r matrix over ℚ_p). For Q ∈ C(K), a well-behaved uniformiser t_Q at Q (a local coordinate at Q̃ shifted to vanish at Q) and α = (ω/dt_Q)(Q) ∈ O_υ, let A_{υ,ω} be the d_υ × d_υ matrix of multiplication by α in the basis θ, A_υ the stack over ω_{υ,l} and A the block-diagonal matrix of the A_υ (gd × d over ℤ_p). Choose a ≥ 0 with p^a T integral and a unimodular U with U(p^a T) in Hermite normal form with h zero rows; let M_p(Q) be the last h rows of U A. If the reduction M̃_p(Q) ∈ M_{h×d}(𝔽_p) has rank d, then C(K) ∩ B_p(Q) = {Q}, where B_p(Q) = ∏_{υ|p} B_υ(Q) is the p-unit ball of points reducing to Q̃ at every υ | p. The rank of M̃_p(Q) does not depend on U; the necessary dimension condition is h ≥ d. The familiar r ≤ d(g − 1) condition follows when rank(T)=r, hence h=gd−r; without this full-rank assumption it is a sufficient dimension heuristic, not a necessary condition. Hypotheses: Separately stated hypotheses of the number-field variant: (p1) p odd; (p2) p unramified in K; (p3) good reduction at every υ | p; D₁, …, D_r a basis of a free finite-index subgroup of J(K) (its finite index requires an unconditional rank certificate, ED.3). Finite approximations alone generally certify all h kernel rows only in the full-rank case h=max(gd−r,0), using annihilator-precision. Exact dependencies or another certified kernel construction may also certify a larger h; r≤d(g−1) is not a universal necessity.

### 32. ED.4/symmetric-square-chabauty-datum

**Names:** `TauCeti.EffectiveDiophantine.ED4.SymmetricSquareChabautyDatum`, `SymmetricSquareChabautyDatum.abelJacobi`, `SymmetricSquareChabautyDatum.abelJacobi_injective`, `SymmetricSquareChabautyDatum.red`, `SymmetricSquareChabautyDatum.matrix`, `SymmetricSquareChabautyDatum.relativeVanishing`, `SymmetricSquareChabautyDatum.mem_pullback`, `symmetricSquare_rationalPairs`, `symmetricSquare_matrix_diagonal`, `symmetricSquare_infinite_nonexample`, `symmetricSquare_reduction_compat`, `symmetricSquare_conjugate_divisor`.

**Boundary:** Actual Sym² of the curve, Galois-stable effective divisors with multiplicity, Abel–Jacobi/Picard map, trace on regular differentials and reduced coefficient matrices over their residue fields are unavailable.

**Required signature:** Let X be a smooth projective non-hyperelliptic curve of genus g ≥ 3 over ℚ with Jacobian J, ∞ a rational effective divisor of degree 2 (for example 2O or O + O'), and p a prime with a good-reduction datum 𝒳 (ED.4/good-reduction-chabauty-datum, with the base point replaced by ∞). The symmetric square X⁽²⁾ parametrises effective divisors of degree 2; X⁽²⁾(ℚ) consists of the pairs {P, P^σ} of a quadratic point and its conjugate and the pairs {P, Q} of rational points, including the doubled divisor 2P. Braces denote a multiset/effective divisor, never a Finset that loses repeated points. The datum consists of: (i) ι⁽²⁾ : X⁽²⁾ → J, 𝒬 ↦ [𝒬 − ∞], injective because X is not hyperelliptic; (ii) the reduction X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p) and its residue classes; (iii) the integral vanishing lattice V = Ann_p(J(ℚ)) ∩ H⁰(𝒳, Ω¹) and its reduction Ṽ (ED.4/annihilating-differentials); (iv) for 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ), a prime v of ℚ(Q₁) above p, uniformisers t_{Q̃_j} at the reductions and the expansions ω_i = (a₀(ω_i, t_{Q̃_j}) + a₁(ω_i, t_{Q̃_j}) t + ⋯) dt for a basis ω₁, …, ω_k of Ṽ; (v) the matrix Ã(𝒬): the k × 2 matrix (a₀(ω_i, t_{Q̃₁}), a₀(ω_i, t_{Q̃₂})) when Q₁ ≠ Q₂, and (a₀(ω_i, t_{Q̃₁}), a₁(ω_i, t_{Q̃₁})/2) when Q₁ = Q₂; (vi) in the relative case, a degree-two morphism ρ : X → C to a curve C with good reduction at p, extending to ρ : 𝒳 → 𝒞, the trace Tr : H⁰(X, Ω¹) → H⁰(C, Ω¹), V₀ := V ∩ ker Tr and its reduction Ṽ₀, and the set ρ*C(ℚ) ⊆ X⁽²⁾(ℚ) of pullbacks of rational points. Hypotheses: X non-hyperelliptic of genus g ≥ 3 (so ι⁽²⁾ is an embedding); p of good reduction for X; p odd wherever the diagonal matrix (v) is used (and for C in the relative case, with ρ extending to the smooth models). The symmetric square of a curve and its points as effective divisors are requested from SchemeAndStackFoundations:SF.3. The reduced matrix has entries in the residue field generated by the support (or its algebraic closure), not necessarily 𝔽_p. Its two columns retain geometric multiplicities; arbitrary injective coordinates or an assumed Abel–Jacobi injection are not this geometric datum.

### 33. ED.4/symmetric-chabauty

**Names:** `TauCeti.EffectiveDiophantine.ED4.eq_of_rank_symmetricMatrix`.

**Boundary:** The actual effective-divisor and common-finite-extension local expansions with certified multiplicity/ramification bounds are unavailable.

**Required signature:** In a symmetric-square Chabauty datum (ED.4/symmetric-square-chabauty-datum) for X/ℚ non-hyperelliptic of genus g ≥ 3 and a prime p of good reduction, let 𝒬 = {Q₁, Q₂} ∈ X⁽²⁾(ℚ) and ω₁, …, ω_k a basis of Ṽ. Suppose p > 2, and p ≠ 3 when [𝔽_p(Q̃₁) : 𝔽_p] = 1. If rank Ã(𝒬) = 2, then 𝒬 is the unique point of X⁽²⁾(ℚ) in its residue class modulo p. Two independent vanishing differentials exist when r < g − 1; the criterion can fail even then. Derive the power-sum valuation contradiction from Siksek2009 Theorem3.2 and Lemmas3.3–3.4; do not assume a generic injectivity or linear-congruence criterion as a geometric factory. Hypotheses: Hypotheses of Box Theorem 2.1: p > 2; p ≠ 3 when Q̃₁ is 𝔽_p-rational; X non-hyperelliptic of genus ≥ 3 with good reduction at p. Ṽ is the reduction of the integral annihilator of J(ℚ) (ED.4/annihilating-differentials); computing it from a finite-index subgroup suffices.

### 34. ED.4/relative-symmetric-chabauty

**Names:** `TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion.geometric`, `TauCeti.EffectiveDiophantine.ED4.mem_pullback_of_relativeCriterion`.

**Boundary:** The abstract symmetric-space test receives the Box criterion as an assumption. The supporting set-cover implication has a distinct name and cannot stand for the geometric theorem.

**Required signature:** Use actual Sym²X, the degree-two Abel–Jacobi map and relative cover X→C, regular differential trace kernel, all divisors and local parameters; derive Box rank/vanishing criterion then membership in the pullback locus. Caraiani–Newton §7.4 is its relative application, not a new general owner.

### 35. ED.4/fps-quintic-cycle-curve

**Names:** `TauCeti.EffectiveDiophantine.ED4.C05_rationalPoints`.

**Boundary:** The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.

**Required signature:** Let X = C₀(5) be the smooth projective genus-2 curve y² = f(x), f = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, birational to the curve of quadratic polynomials with a marked 5-cycle. Then X(ℚ) = {∞⁺, ∞⁻, (0, 1), (0, −1), (−3, 1), (−3, −1)}. Certificate (ED.4/chabauty-coleman-certificate): O = ∞⁺; rank input J(ℚ) ≅ ℤ (Flynn–Poonen–Schaefer Theorem 3, a 2-descent with trivial torsion, certified by ED.3/fps-genus-two-mordell-weil); G = ⟨[(−3, 1) − (0, 1)]⟩, of finite index since its generator is nonzero in the torsion-free group J(ℚ) ≅ ℤ; p = 3 with the two-chart model, smooth since f has unit leading coefficient and is squarefree mod 3 (ED.4/hyperelliptic-residue-discs); X̃(𝔽_3) = {∞⁺, ∞⁻, (0, 1), (0, −1)}; annihilating differential ω = ε dx/y + x dx/y with ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴), from ∫_{(0,1)}^{(−3,1)} dx/y ≡ 2·3 + 3⁴ and ∫_{(0,1)}^{(−3,1)} x dx/y ≡ 2·3² + 2·3³ (mod 3⁵), so ω̃ = x dx/y; verdicts: at ∞^±, m = 0 < p − 2, N = 1, Z_rat = {∞^±}; at (0, 1), t = x, m = 1 and the coefficient of t² in w vanishes mod 3, N = 2, Z_rat = {(0, 1), (−3, 1)}; at (0, −1), by the hyperelliptic involution, N = 2, Z_rat = {(0, −1), (−3, −1)}. Hypotheses: Rank input: J(ℚ) ≅ ℤ, an unconditional 2-descent (FPS Theorem 3), supplied as an ED.3 finite-index and rank certificate (ArithmeticDynamics request to ED.3). Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  The actual six-point theorem is unconditional once the specified unconditional rank and geometric suppliers are proved.

### 36. ED.4/poonen-type-three-two-curve

**Names:** `TauCeti.EffectiveDiophantine.ED4.C132_rationalPoints`.

**Boundary:** The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.

**Required signature:** Let X = C₁(3₂) be the smooth projective genus-2 curve y² = g(x), g = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, classifying z² + c with a rational point of preperiodic type 3₂. Then X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞⁺, ∞⁻}. The certificate is conditional on the rank input rank J(ℚ) ≤ 1 (Poonen Proposition 1), whose corrected 2-descent ED.3/poonen-genus-two-mordell-weil records as a gap; unconditionally, the eight points are the only rational points P with ι_O(P) in the saturation of G in J(ℚ_3). Certificate: O = ∞⁺; rank input as just stated, with J(ℚ)_tors = 0 and rank J(ℚ) ≥ 1 certified; G = ⟨[S⁺ − S⁻]⟩ with S^± = (1, ±3), of finite index; p = 3 with the two-chart model (g mod 3 squarefree, leading coefficient 1); X̃(𝔽_3) = {∞⁺, ∞⁻, (0, ±1), (2, ±1), (1, 0)}, seven points; annihilating differential ω = α dx/y + x dx/y with ∫_{S⁻}^{S⁺} ω = 0, computed in the disc of the Weierstrass point (1, 0) with the parameter t = y + 3, giving α ≡ 68 (mod 3⁴) and ω̃ = (x − 1) dx/y; verdicts: on the six discs other than (1, 0), ω̃ does not vanish, so N = 1 with Z_rat the unique known point ((−1, ±1) reduce to (2, ±1)); on the disc of (1, 0), m = 2 ≥ p − 2 (exceptional disc), the certified disc Strassmann bound of ∫_{S⁻} ω is N = 3, Z_rat = {S⁻, S⁺} (t = 0, 6) and Z_irr = {W}, the Weierstrass point of X(ℚ_3) with x(W) ≡ 1 (mod 3) (t = 3), which is not rational because g has no rational root and is a zero because 2[W − S⁻] = [S⁺ − S⁻] ∈ G. Hypotheses: Conditionality label: 'conditional on rank J(ℚ) ≤ 1'. Poonen's printed 2-descent uses the point (2, √33), which is not on C; his errata replace it by (−2, √33) and the 2-adic information without printing the corrected computation, and ED.3/poonen-genus-two-mordell-weil records this as a gap. Torsion is trivial since #J(𝔽_3) = 27 and #J(𝔽_5) = 43. The Coleman-integral certificate replaces Poonen's formal-group computation; its numerical values (α, the disc Strassmann indices) are computed in this blueprint from the tiny-integral expansions and are not printed in the source. Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  Preserve the conditional rank label and the separate unconditional saturation statement; an assumed Valid record is not a proof of the rank hypothesis.

### 37. ED.4/stoll-six-cycle-curve

**Names:** `TauCeti.EffectiveDiophantine.ED4.X0dyn6_rationalPoints_of_rank_le_three`.

**Boundary:** The actual curve/Jacobian/model, rank and geometric disc-certificate construction is unavailable in the suggested file. The renamed cardinality implication is supporting only.

**Required signature:** Let X = X₀^dyn(6) be the genus-4 curve given by the smooth model G(u, w) = w²(w + 1)u³ − (5w² + w + 1)u² − w(w² − 2w − 7)u + (w + 1)(w − 3) = 0 of bidegree (3, 3) in ℙ¹ × ℙ¹, with the ten rational points P₀, …, P₉ of Stoll's table. Unconditionally: J(ℚ) has trivial torsion, the subgroup G generated by differences of the P_i is ≅ ℤ³, and the P_i are the only rational points P with [P − P₁] in the saturation of G. Conditionally on the labelled hypothesis rank J(ℚ) ≤ 3 (which follows from analytic continuation and the standard functional equation of L(J, s), a certified nonvanishing L'''(J,1)≠0 (Stoll’s value 0.836… is numerical, and his reported lower-derivative vanishings are only to working precision), and the weak Birch and Swinnerton-Dyer conjecture for J; Stoll §4 and Theorem 7), X(ℚ) = {P₀, …, P₉}. Certificate: O = P₁; G with generators of G ∩ J(ℚ_5)¹ given by D₁ = P₇ − P₉, D₂ = P₀ − 6P₁ + 2P₅ + P₇ + P₈ + P₉, D₃ = P₀ − 3P₁ + 2P₂ + P₄ + P₆ − P₇ − P₈; p = 5 (the model has good reduction away from 2 and 8029187); the annihilating differential ω, computed by ED.4/kernel-of-reduction-evaluation at P₁ = (0, −1) with parameter u, has reduction ω̄ = ω̄₂ = w ω̄₀; verdicts: at (∞, −1), m = 1 < p − 2 = 3, N = 2, Z_rat = {P₇, P₉}; at (∞, 0), where ω̄ also vanishes, the explicit expansion λ = γτ(1 − (2 + O(5))5τ + O(5²)) gives N = 1, Z_rat = {P₃}; at every other point of X̃(𝔽_5), ω̄ does not vanish and N = 1, and each such disc contains one of the P_i (the reduction map on {P₀, …, P₉} is onto X̃(𝔽_5)). Hypotheses: Conditionality label: 'conditional on rank J(ℚ)≤3'. An analytic derivation additionally needs certified analytic order≤3, along with analytic continuation/functional equation and weak BSD; Stoll’s numerical evidence is not that certificate. The unconditional statement concerns the saturation of G. ED.3/stoll-genus-four-subgroup supplies the unconditional part of the rank input (G ≅ ℤ³, trivial torsion) and labels the analytic rank bound; under rank J(ℚ) = 3 the Chabauty step uses the saturation of G directly, so no p-saturation certificate is needed. Use the actual smooth projective curve and Hom_Q(Spec Q,X), its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete semantic certificate or assume its point cardinality.  Preserve the conditional rank label and the separate unconditional saturation statement; an assumed Valid record is not a proof of the rank hypothesis.

### 38. ED.5/kummer-curve-test

**Names:** `TauCeti.MordellWeilSieve.GenusTwo.mem_range_aj_of_kummer_reductions`.

**Boundary:** Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x). Height comparison constants for genus-two Jacobians: For genus-two Jacobians: a certified bound γ ≥ h − ĥ between the naive Kummer height and the canonical height (Stoll 1999 and 2002, Bruin–Stoll references [25, 27], not read), the height-pairing matrix of the generators, and the comparison ĥ(ι(P)) ≤ d·h(P) + δ for the embedding (for ι(P) = [P − ∞] on an odd-degree model through the Kummer coordinates of [P − ∞]). The elliptic case is covered by Tau Ceti's canonical height and ED.3/explicit-height-difference-bound; the Néron–Tate height itself is requested from RP.0.

**Required signature:** Let C: y² = F(x, z) be a genus-two curve over ℚ with integral binary sextic F, P₀ ∈ C(ℚ) with x(P₀) = (a : b) for coprime integers a, b, and ι(P) = [P − P₀]. For Q ∈ J(ℚ) let (k₁ : k₂ : k₃ : k₄) be its image on the Kummer surface with coprime integer coordinates and h(Q) = log max|k_j|; let γ ≥ h − ĥ on J(ℚ). Let p₁, …, p_m be distinct primes of good reduction with p₁⋯p_m > 3·e^{H′+γ}·max(|a|, |b|)², and, if P₀ ≠ P̄₀, such that the product of those p_j modulo which P₀ and its hyperelliptic conjugate P̄₀ remain distinct exceeds e^{H′+γ} (for instance, every p_j separates them). If Q ∈ J(ℚ) has ĥ(Q) ≤ H′ and the reduction of Q modulo every p_j lies in ι_{p_j}(C̃(𝔽_{p_j})), then Q ∈ ι(C(ℚ)). The factor 3 corrects the printed bound (source issue EffectiveDiophantineMethods/E12). The arithmetic core: if |k_j| ≤ B, every p_j divides k₁a² − k₂ab + k₃b², and ∏ p_j > 3B·max(|a|, |b|)², then k₁a² − k₂ab + k₃b² = 0. Hypotheses: C of genus two with integral sextic model; P₀ rational with x(P₀) = (a : b), gcd(a, b) = 1; ι(P) = [P − P₀]. γ ≥ h − ĥ on J(ℚ); distinct good primes with p₁⋯p_m > 3e^{H′+γ}max(|a|,|b|)²; if P₀ ≠ P̄₀, the p_j separating P₀ and P̄₀ have product > e^{H′+γ}. The prime condition on the separating primes corrects the gap EffectiveDiophantineMethods/E17 in the published proof. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

### 39. ED.5/genus-two-bad-information

**Names:** `TauCeti.MordellWeilSieve.GenusTwo.reduction_exact_of_regular`.

**Boundary:** Certified finite presentations of Jacobians over finite fields and of sieve quotients: Certified executable presentations: the Mumford representation of J(𝔽_p) for hyperelliptic models and the correctness of Cantor's composition and reduction (Bruin–Stoll cite Cantor 1987, not read); a certified isomorphism J(𝔽_p) ≅ ⊕ ℤ/n_iℤ; discrete logarithms (Pohlig–Hellman) for the local maps on generators and for the image of C(𝔽_p); enumeration of C(𝔽_p); Smith-normal-form presentations of Γ/L_j, of the kernels of Γ/L_{j+1} → Γ/L_j and of the image subgroups φ_i(L_j). Natural owner: ComputationalNumberTheory:CN.3 with CN.0 carriers. The ED.5 theorems take finite groups and maps as inputs and are proved without these; executing a certificate needs them. Non-hyperelliptic models (plane quartics, Box's models of X₀(N)) need the same for their own Jacobian arithmetic. Supersedes the existing gap 'ED.5 geometric reduction and certified input data' together with jacobian-reduction-data and the requests to NeronModels R11.4. Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).

**Required signature:** Let O be a complete discrete valuation ring with uniformiser π, residue field k with char k ≠ 2 and fraction field L, F ∈ O[X, Z] a squarefree binary sextic, C_F: Y² = F(X, Z) in weighted projective space, J_F ⊆ ℙ¹⁵ the Cassels–Flynn model of its Jacobian, J_F¹(L) = {P : P̄ = O} its kernel of reduction for this model, and J_{F̄}^0 the component of the smooth locus of the special fibre containing the origin. (a) (Theorem 5.11) J_{F̄}^0 is a commutative algebraic group whose law on Mumford pairs (A, B) is Cantor composition and reduction, except when both A vanish at the same singular point x = 0, where φ(X², λXZ²) + φ(X², μXZ²) = φ(X², ((f₂ + λμ)/(λ + μ))XZ²) and the sum is zero if λ + μ = 0. (b) (Proposition 5.10) P ∈ J_F lies in J_F^0 iff δ(κ(P)) ≠ 0. (c) (Corollaries 5.14–5.15) If C_F/O is regular and F̄ is not a square, then 0 → J_F¹(L) → J_F(L) → J_{F̄}^0(k) → 0 is exact, the map reducing the Mumford representation. For an odd prime p at which the given model is regular with one-component special fibre this computes the local datum of padic-quotient-sieve-datum with U = J¹(ℚ_p) as at good primes; at an odd prime where the model is not regular or the special fibre has several components, J(ℚ) ∩ J⁰(ℚ_p) is computed by subgroup-from-membership-test with the test v_p(δ(κ(P))) = 4v_p(κ(P)), and the image of C(ℚ_p) modulo J¹(ℚ_p) by the dual Kummer test of genus-two-deep-information with n = 1. Remark 5.16 (the regular model minus singular points is the Néron model) is stated without proof in the source and is not used. Hypotheses: O complete DVR, char k ≠ 2; F squarefree of degree six over O; for (c) the model C_F/O is regular and F̄ is not a square. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

### 40. ED.5/genus-two-deep-information

**Names:** `TauCeti.MordellWeilSieve.GenusTwo.dualKummer_valuation_of_mem_deep`.

**Boundary:** Cassels–Flynn explicit model of genus-two Jacobians and Kummer surfaces: Cassels–Flynn, Prolegomena (1996), Chapters 2–4 (not read): the embedding J_F ⊆ ℙ¹⁵ by 72 quadrics, the Kummer surface K_F ⊆ ℙ³ with its quartic, the duplication δ and the biquadratic forms B, the Kummer coordinates (1 : x₁+x₂ : x₁x₂ : β₀) of a degree-two divisor class, the dual Kummer surface (quotient of Pic¹ by the hyperelliptic involution) with the duality ξ·η = 0 iff P ∈ C ± Q and the forms A of Lemma 6.1; Bruin–Stoll Lemmas 5.2–5.4, 5.7 and Propositions 5.5, 5.10 rest on these. No atlas roadmap owns them; AlgebraicCurves Layer 10 stops at the models y² = f(x).

**Required signature:** Let C be a genus-two curve over ℚ with a Weierstrass model over ℤ_p, p odd, ι: C → J from a rational degree-one class, Jⁿ(ℚ_p) the pⁿℤ_p-points of the formal group (n ≥ 1) and log: J¹(ℚ_p) → (pℤ_p)² the formal logarithm. (a) For Γ = J(ℚ) and K_n = Γ ∩ Jⁿ(ℚ_p), K_n is the kernel of K₁ → (pℤ_p/pⁿℤ_p)² ≅ (ℤ/p^{n−1})², P ↦ log P mod pⁿ; so Γ/K_n is finite and computable from K₁ and logarithms to precision pⁿ. (b) (Lemma 6.2) If P₀ ∈ C(ℚ_p), Q ∈ Jⁿ(ℚ_p) and (η₁ : η₂ : η₃ : η₄) are coordinates of the image of P₀ + Q ∈ Pic¹ on the dual Kummer surface, normalised to minimal valuation zero, then v_p(η₁η₃ − η₂²) ≥ n and v_p(η₄) ≥ 2n. Hence the set Y_n of classes c ∈ Γ/K_n whose chosen representative g, translated to Pic¹ by g↦g+D₁ and to the dual Kummer surface, satisfies v_p(η₄) ≥ 2n and v_p(η₁η₃ − η₂²) ≥ n, contains every class whose coset meets ι(C(ℚ_p)); it is a certified superset for padic-quotient-sieve-datum with U = Jⁿ(ℚ_p). The necessary dual-Kummer congruences supply a superset only; actual membership in the curve embedded in Pic¹ must be checked separately. Translation Pic⁰→Pic¹ is defined on the whole Jacobian, unlike an inverse of the curve embedding. Hypotheses: p odd; Weierstrass model of C over ℤ_p; n ≥ 1; ι from a rational degree-one class. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

### 41. ED.5/small-genus-two-nonexistence

**Names:** `TauCeti.MordellWeilSieve.Examples.smallGenusTwo_noRationalPoints`.

**Boundary:** Data of the small genus-two curves experiment: The list of the 1492 curves, their Mordell–Weil generators and ranks (with the BSD-conditional cases) and the local data, from Bruin–Stoll, 'Deciding existence of rational points on curves: an experiment', Experiment. Math. 17 (2008) 181–189, and the electronic appendix MWSieve-new.m; not read.

**Required signature:** Among the genus-two curves y² = f(x) with f of degree five or six and coefficients in {−3, …, 3}, the 1492 isomorphism classes left undecided after a search for rational points, a check for local points and a 2-cover descent have no rational point. For Jacobians of rank at most two the proof used good information only, for ranks three and four also bad and deep information; for some curves the rank of J(ℚ) is used under the Birch–Swinnerton-Dyer conjecture, and those cases are conditional. Each of the 1447 curves that needed a sieve computation (§8, p.301) is an instance of sieve-certificate-sound (a) with an emptiness certificate; the other 45 had rank zero or were ruled out directly by information from the Birch–Swinnerton-Dyer conjecture, and the latter are conditional. Hypotheses: The curves, Mordell–Weil generators, ranks and local data of Bruin–Stoll's experiment (gap); the BSD-conditional cases are labelled. The finite 1492-case input list and all 1447 sieve transcripts must be supplied and independently checked, together with the remaining45 cases and their individual conditional labels. These complete per-curve transcripts remain an unreplayed data obligation. ED.6 does not contain these1492 instances.

### 42. ED.6/qc-disc-certificate

**Names:** `TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate`, `TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check`, `TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.check_sound`, `TauCeti.EffectiveDiophantine.ED6.QCDiscCertificate.ofRestrictedSeries`.

**Boundary:** Actual disc/function/precision suppliers and multiplicity-aware root isolation are not built.

**Required signature:** Input actual geometric disc chart and finitely many restricted F_i(pT), finite coefficients as residues modulo p^N, rational tail bounds derived from height-series-valuation-bound, finite residue-ball tree, root multiplicity/verifier data and centre representatives modulo p^n. Check finite coefficients, exhaustive tree cover/discard decisions and uniqueness/root counts by Newton/Weierstrass and derivative bounds; check=true plus supplier coefficient/tail semantics implies covers and unique. An arbitrary fn:Z_p→Q_p and universal covers proof is excluded from raw input; do not name the semantic record a numerical checker.

### 43. ED.6/qc-certificate-sound

**Names:** `TauCeti.EffectiveDiophantine.ED6.rationalPoints_eq_of_qcCertificate`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Let X/Q be a smooth projective geometrically connected curve of genus g ≥ 2 with b ∈ X(Q), Jacobian J of rank r = g with log : J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*, ρ(J) ≥ 2, and p a prime of good reduction. Let Z_1, …, Z_k be nice classes and (θ_j, Υ_j) the quadratic Chabauty pairs of NC.5 with endomorphism E_j, constant c_j and pairing B_j (BDMTV Lemma 3.7, with Υ_j = {0} under potentially good reduction everywhere, Corollary 3.8). Suppose given: (a) a finite set L ⊆ X(Q) of verified rational points containing b and points P_1, …, P_m such that AJ_b(P_i) ⊗ (E_j(AJ_b(P_i)) + c_j) span E (or E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^* when the heights are K-equivariant); (b) for every x̄ ∈ X(F_p) and every choice (α_1, …, α_k) ∈ Υ_1 × ⋯ × Υ_k, a qc-disc-certificate on ]x̄[ for the family (det T_{j,α_j})_{j ≤ k} of the determinant criterion, whose power-series coefficients are computed by local-height-at-p and Coleman integration to the precision certified by height-series-valuation-bound; (c) for every centre of every disc certificate, a matching with an element of L or an exclusion. Then X(Q) = L, an unconditional certified solution set given the stated rank and Picard hypotheses (which are themselves certified inputs). If (b) or (c) fails for some disc, only L ⊆ X(Q) is asserted. The rational-point carrier is Hom_Q(Spec Q,X) and its injective image in Hom_Qp(Spec Q_p,X_Qp); residue discs are fibres of reduction from the chosen smooth proper Z_p-model. Require chart identifications with Z_p, actual NC.5 height/cycle/logarithm semantics for every determinant series, complete choices of away-from-p height values, finite coefficient/tail/tree certificates whose check_sound yields covers/uniqueness, and genuine geometric matching/sieve exclusions. If rank or supplier assertions remain conditional, the conclusion retains their conjunction as its label. QCRun.rational_eq_of_matched is only the final set-theoretic implication.

### 44. ED.6/explicit-setup

**Names:** `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.residue_injective`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.cupMatrix_eq`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.functionField`, `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.tateFrobenius`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Outputs are these actual identified geometric data, residue injectivity for the third-kind span and the displayed actual cup pairing; the separate ExplicitSetupLinearData only stores matrices.

### 45. ED.6/explicit-connection

**Names:** `TauCeti.EffectiveDiophantine.ED6.ExplicitSetup.eta_existsUnique`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Import NC.2 universal pointed A²_dR and NC.5 its pushout A_Z along V_dR⊗²→Q(1), factoring through coker(cup*). Construct s0:(Q⊕V_dR⊕Q(1))⊗O_Y≅A_Z|Y and the unique η in span(ω_{2g},…,ω_{2g+d−2}) such that ∇=d−[[0,0,0],[ω,0,0],[η,ωᵀZ,0]] extends nonsingularly over X. For dΩ_x=−ω, its actual residue conditions are Res_x(Ω_xᵀZ dΩ_x−η)=0. Existence uses the universal quotient extending over X and total-residue/cup compatibility; the sum-zero matrix solver alone proves only uniqueness/linear solvability. The result includes the geometric extension, trivialization and η, with gauges C_x and g_x in L((t_x)), dg_x=Ω_xᵀZ dΩ_x−η.

### 46. ED.6/hodge-filtration-explicit

**Names:** `TauCeti.EffectiveDiophantine.ED6.hodgeFiltration_basis`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. With the actual gauges of the mixed connection, use the principal-parts exact sequence 0→L→Γ(Y_L,O)→⊕_{x∈D(L)} L((t_x))/L[[t_x]]→H¹(X_L,O)→0 and H¹_dR(X_L)/Fil¹≅H¹(X_L,O). The principal parts of the primitives of ω_g,…,ω_{2g−1} map to a basis of the last group. For N=(0,I)ᵀ prove existence and uniqueness of γ∈Γ(Y,O), b_Fil∈Q^g with γ(b)=0 and g_x+γ−b_FilᵀNᵀΩ_x−Ω_xᵀZNNᵀΩ_x regular at every boundary point. Descend from L by uniqueness. Prove that the subbundle spanned by1+γS,T_g+b_gS,…,T_{2g−1}+b_{2g−1}S extends over X and satisfies Hadian’s transversality, exact-sequence and pointed-identity conditions; hence it equals Fil⁰A_Z. Return the actual filtered isomorphism sFil with βFil=(0,b_Fil), not just a solution to a Laurent linear system.

### 47. ED.6/hodge-filtration-algorithm

**Names:** `TauCeti.EffectiveDiophantine.ED6.HodgeFiltrationData.geometricFactory`, `hodgeData_xs13_Z1_beta`.

**Boundary:** Actual function field, Laurent charts and sufficient truncation orders are missing; previous tests assumed the printed answer.

**Required signature:** Use the actual affine coordinate ring/function field, boundary points and uniformizers, exact Laurent expansions of ΩᵀZdΩ and ΩᵀZNNᵀΩ. Derive product/primitive pole bounds and the finite function space for γ; compute residues and solve finite linear systems, then verify conditions(30),(32) and base normalization. For xs13 use H⁰(O(2D)) with basis1,x,y,x²,xy,y² and replay actual principal parts, without href₁/href₂ assuming the Hodge answer. Largest individual differential pole alone is not enough.

### 48. ED.6/frobenius-structure-matrix

**Names:** `TauCeti.EffectiveDiophantine.ED6.frobeniusStructure_eq`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Over Q_p take an actual strict neighborhood of the tube ]U[ in Y^an, its overconvergent structure sheaf, an overconvergent Frobenius lift φ reducing to p-power Frobenius, and a Teichmüller b0 in b’s disc. In the s0 coordinates of A_Z^rig, compute φ*ω=Fω+df with f(b0)=0, and FᵀZF=pZ. Define g0=−FᵀZf, ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω, and use actual rigid-cohomology reduction ξ=cᵀω+dh, h(b0)=0, to put g=g0+c. Identify the resulting G=[[1,0,0],[f,F,0],[h,gᵀ,p]] with Φ_Z⁻¹: ΛφG+dG=GΛ, and normalization1↦1 at b0. Uniqueness is among the graded-compatible morphisms of the actual pointed universal quotient. For the actual Frobenius Φ_Z the graded matrix is diag(1,F⁻¹,p⁻¹), while G has graded matrix diag(1,F,p). RD.7 must return coefficient, exactness and precision certificates for these actual overconvergent sections.

### 49. ED.6/frobenius-equivariant-splitting

**Names:** `TauCeti.EffectiveDiophantine.ED6.frobeniusSplitting_eq`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. On the actual fibre x0* A_Z at a Teichmüller point x0, prove that the unique Frobenius-compatible unipotent splitting S=s0⁻¹sφ has α=(I−F)⁻¹f(x0), βᵀ=g(x0)ᵀ(F−pI)⁻¹, γ=(g(x0)ᵀα+h(x0))/(1−p). Its precise intertwining identity is G(x0)S=S diag(1,F,p), equivalently Φ_Z(x0)S=S diag(1,F⁻¹,p⁻¹). Weil weights prove invertibility of I−F,F−pI,1−p. For actual fibres at general b,x, Besser path transport gives S(b,x)=L(I(x0,x))R(I(b,b0))S(b0,x0); hence α(b,x)=∫_b^xω. The tuple solver alone does not identify any fibre or Coleman integral.

### 50. ED.6/local-height-at-p

**Names:** `TauCeti.EffectiveDiophantine.ED6.localHeight`, `TauCeti.EffectiveDiophantine.ED6.localHeight_eq`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. Fix the actual NC.5 mixed extension A_Z(b,x), idèle class character χ with chosen p-adic logarithm branch, its additive factor χ_p on Q_p after the logarithm, and a splitting s of V_dR/Fil⁰V_dR with complementary projectors s1,s2. Use the cycle-compatible filtered φ-module comparison D_cris(A_Z(b,x))≅x* A_Z. For the actual Hodge and Frobenius splittings prove Nekovář h_p(A_Z(b,x))=χ_p(γφ−γFil−βφᵀs1(αφ)−βFilᵀs2(αφ)). Identify this locally analytic function with θ_Z in NC.5 and its actual convergent residue-disc expansion. The expression and quotient-coordinate helper are not a definition of the geometric height.

### 51. ED.6/base-point-change

**Names:** `TauCeti.EffectiveDiophantine.ED6.baseChange_splitting_eq`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** Over Q, take a smooth projective geometrically connected curve X of genus g≥2, a nonempty reduced boundary divisor D of degree d=#D(Qbar) and affine open Y=X−D, b∈Y(Q), a good prime p and a smooth Z_p-model with integral b. Put A=Γ(Y,O_Y), K=Q(X)=Frac(A). Choose a finite Galois splitting field L for D and uniformizers t_x identifying completed local rings at x∈D(L) with L[[t_x]] and their fraction fields with L((t_x)); expansions must be the maps induced by K⊗L, not arbitrary Laurent-family maps. Choose ω_0,…,ω_{2g+d−2} in Ω¹(Y/Q) whose classes form a basis of H¹_dR(Y), the first2g of the second kind, the firstg a basis of H⁰(X,Ω¹), with cup matrix C=[[0,I],[-I,0]], and third-kind complement with residue map an isomorphism onto {(r_x):Σr_x=0}. Put V_dR=H¹_dR(X)^* with dual basis T_i. Take nonzero rational tensor Z with antisymmetry, lower-right g×g block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight p, in coordinates FᵀZF=pZ. For height applications additionally supply an actual nice correspondence whose cycle class is Z; do not infer a rational algebraic cycle from these linear/Frobenius conditions. For b′∈X(Q_p) in a pole-free residue disc, use the actual NC.2/Besser path isomorphism v↦I(b,b′)vI(b′,b). On A_Z obtain βFil(b′)=βFil(b), γFil(b′,x)=γFil(b,x)−γFil(b,b′), and S(b′,b′)=[[1,0,0],[0,I,0],[0,βφ(b,b)ᵀ+2∫_b^{b′}ωᵀZ,1]]. These identities together with Coleman integrals and tiny integrals compute the local height on the b′ disc even when the original Frobenius lift is absent there. Global rational-point/NC.5 comparisons require rational b′ and transport of the endomorphism, Chow–Heegner constant and away-from-p height data; do not claim equality of the individual scalar height functions for different base points. Assert invariance of the underlying identified Chabauty–Kim locus, supplied by NC.5, rather than invariance of every auxiliary zero set.

### 52. ED.6/height-series-valuation-bound

**Names:** `TauCeti.EffectiveDiophantine.ED6.valuation_coeff_ge`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_lowDegree`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_branchBoundary`, `TauCeti.EffectiveDiophantine.ED6.qcValuation_zeroCoefficient`.

**Boundary:** Actual geometric series/coefficient semantics and the full finite precision derivation are unavailable; a bound for arbitrary formal iterated integrals is only one supporting component.

**Required signature:** For the actual QC function ρ=h−h_p on D⊂X(Q_p)∩]U[, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of ω,ωᵀZ; fixed End(J)-equivariant Hodge splitting), choose t at x1∈D, t(D)⊂pZ_p and Teichmüller x0. Use ord_p(0)=∞; for matrices/vectors use the minimum of entry valuations, including the diagonal1 of λφ so c1≤0. Certify c1=ord_p(λφ(x1)) by Frobenius evaluation and path-transport precision, v_spl=min valuation of the splitting coefficients, b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}, and c3=min_j ord_p(d_j) for the genuine global-height expansion h=Σd_jΨ_j. Let d_i(η) be certified lower bounds for the actual degree i−1 coefficient of η (all coefficient/coordinate changes included); the source uses a finite polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the actual model. With ℓ_i=⌊log_p i⌋ for i≥1 put φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}. The branches are φ(i)=d_i(η)−ℓ_i if d_i(η)<−ℓ_i, otherwise φ(i)=−2ℓ_i; the λφ coefficients have lower bound φ(i)+c1. Explicitly certify i0≥1 such that for every i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b and 2(−ℓ_i)≤a−c2 (the floor-half inequalities on publishedp1136). Then ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3} for i≥i0 (Proposition4.6). Coefficients0≤i<i0 require their own finite valuation certificates; all-zero βFil,γFil or global-height coefficients use∞ and omit vacuous comparisons instead of assigning integer0. The actual coordinate/differential estimates and algebraic cancellations proving this height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933 retain the separate helper iteratedIntegral_valuation_coeff_ge. The source notation φ in preprintv4p24 has an extra+c1 corrected in publishedp1136; use publishedφ and addc1 once to the splitting bound. This is Proposition4.6, not Proposition4.1; the latter evaluates G(P). Regression contracts: qcValuation_lowDegree rejects applying the tail formula to i<i0; qcValuation_branchBoundary identifies both formulas at d_i(η)=−floor(log_p i); qcValuation_zeroCoefficient uses∞ and does not call Padic.valuation(0).

### 53. ED.6/root-determination-precision

**Names:** `TauCeti.EffectiveDiophantine.ED6.roots_determined_of_truncation`.

**Boundary:** The existing algebraic lemma supplies only a necessary congruence for an existing root.

**Required signature:** For nonzero restricted F(pT) over completed Cp, positive multiplicity bound d, finite coefficients modulo p^N and certified tail lower bounds, prove the Weierstrass/Newton perturbation theorem with n−k>0: a complete ball cover of every root, multiplicities, isolation and stability. Exact Polynomial.roots over Q_p is not a residue-root enumerator or a Cp root constructor. Zero coefficients have valuation∞; a zero dominant coefficient is rejected.

### 54. ED.6/qc-modular-algorithm

**Names:** `TauCeti.EffectiveDiophantine.ED6.QCOutput.geometricFactory`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** Construct NC.2/NC.5 connection/height objects, SF.3 curve/differential geometry, RP.1 Mordell–Weil data, CN.4 certified coefficients and actual RD.7 Frobenius. Only then run finite coefficient/tree checks and assemble all chart verdicts; semantic loci finiteness does not give the numerical output.

### 55. ED.6/xs13-plane-model

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_planeModel`.

**Boundary:** The polynomial identity/point memberships do not identify the modular curve or prove good reduction.

**Required signature:** Return the actual modular identification with X_s(13), smooth projective quartic/good reduction at17, complete20-point special fibre and all chart data from R13.4a/CN.3; the exact quartic identity and seven memberships are supporting.

### 56. ED.6/xs13-endomorphism-algebra

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_endAlgebra`.

**Boundary:** A generated cubic field is not End(J)⊗Q or an NS-rank computation.

**Required signature:** Construct the algebra isomorphism End(J_s(13))⊗Q≃Q(ζ₇)^+, prove no additional endomorphisms using supplier R14.5/newform/RM data, and identify Rosati-fixed NS rank3. The cubic field dimension helper alone does not prove this.

### 57. ED.6/xs13-analytic-rank-certificate

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_analyticRank_eq_one`.

**Boundary:** Positive derivative intervals only imply derivative nonzero.

**Required signature:** Use the correct three conjugate newform L-functions, certified analytic continuation, central vanishing L(f^σ,1)=0 and nonzero derivative enclosures. Conclude order of vanishing exactly1. Numerical enclosure, central vanishing and newform identity are separate certified inputs.

### 58. ED.6/xs13-rank-three

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_rank_eq_three`.

**Boundary:** Restriction-of-scalars dimension does not establish Q-rank1 over the RM field.

**Required signature:** Import exact admissible modular rank-one overQ theorem: exhibit imaginary quadraticK satisfying Heegner/Kolyvagin hypotheses, twist factorization and nonvanishing, admissible Gross–Zagier trace and passage back toQ, so dim_RM(J(Q)⊗Q)=1. Combine the genuine cubic RM action and its degree3 to obtain rank3; HE.7 and GZ.8 stage names alone do not supply this theorem.

### 59. ED.6/xs13-tate-classes

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_tateClasses_admissible`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** For the actual Q-curve X_s(13) identified with xs13Quartic=0, its Jacobian J, the actual symplectic de Rham basis of the first chart and actual Hecke correspondences T7,T11 defined overQ, certify their exact matrices A7,A11. The trace-zero symmetric correspondences6T_q−tr(A_q)Id have zero cup contraction; construct their actual tensor cycle classes Z_q=(6A_q−tr(A_q)I)C⁻¹ and identify them entrywise with xs13Z1,xs13Z2. Prove these classes are nonzero, independent, in Fil¹, antisymmetric and cup-trivial and satisfy F_pᵀZ_qF_p=pZ_q after crystalline comparison at every prime of good reduction, in particular p=17. Exact Hecke reconstruction requires CN.3 bounds or q-expansion/duality certification; a finite p-adic approximation and the b–d checks alone do not supply condition(a).

### 60. ED.6/xs13-first-chart-hodge-data

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_hodgeData_conditions`.

**Boundary:** Base normalization and zero holomorphic part omit Laurent residue/regularity and basis checks.

**Required signature:** On the actual quotient Q[x,y]/(Q(x,y,1)) and its function field, certify the six differential basis, cup product, boundary and Laurent replay of η,β,γ for Z1,Z2. The quotient relation is nonvacuous; elementary gamma/base checks are supporting only.

### 61. ED.6/xs13-first-chart-frobenius

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusLift.actualProducer`, `TauCeti.EffectiveDiophantine.ED6.xs13FrobeniusMatrix.actualProducer`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** RD.7 Tuitman plane-curve producer must return actual dagger Frobenius lift, the6×6 matrix and exact differentials/precision. Conditional Hensel uniqueness for a supplied lift does not construct these data; existing certified Kedlaya hyperelliptic output is insufficient.

### 62. ED.6/xs13-equivariant-height-matrices

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_equivariant_height_factory`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** Certify the actual E₁(P5) p-adic log vector, inert cubic coefficient field at17, correspondence action, height pairing and determinant. It is already a log vector; do not reject it because some global class could be torsion.

### 63. ED.6/xs13-first-chart-points

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_points_firstChart.factory`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** Construct actual matrices/functions/coefficient precision and every disc zero table from the source computations, not a supplied complete QCOutput. Distinguish affine domain excluding zeros of Q_y and its complement.

### 64. ED.6/xs13-second-chart-points

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_points_secondChart.factory`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** Construct and replay second-chart coordinate change, smoothness, Frobenius, height and every zero table, plus overlap agreement; do not accept the output certificate as input.

### 65. ED.6/xs13-p0-disc

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_points_P0Disc.factory`.

**Boundary:** The required concrete geometric/numerical input data have not been replayed at the supplier boundary.

**Required signature:** Replay the ramified-extension Coleman integration and overconvergent precision for P0 using Balakrishnan–Tuitman, then derive the unique common-zero verdict. This source/precision gap remains.

### 66. ED.6/xs13-rational-points

**Names:** `TauCeti.EffectiveDiophantine.ED6.xs13_rationalPoints`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** On X_s(13)(Q)=Hom_Q(Spec Q,X_s(13)), use the certified R13.4a isomorphism to the smooth projective quartic xs13Quartic=0 in P²_Q. Let P_i be the projective classes of xs13Points(i), i=0,…,6. Prove X_s(13)(Q)={P_i}, with all seven distinct, by the actual seventeen first-chart discs, two second-chart discs and P0 disc at17, using the named geometric factory results. Through the actual modular j-map the set is one cusp and six CM points of discriminants−3,−4,−12,−16,−27,−43 and j-values0,1728,54000,287496,−12288000,−884736000. Require the j=0,1728 special-fibre moduli comparisons; no point-by-point matching of P_i to discriminants is claimed without the explicit j-map. The final mathematical theorem is unconditional; until rank/model/path/zero-table suppliers are discharged, its certificate carries their explicit conjunction. The arbitrary three-set union lemma is only the assembly argument.

### 67. ED.6/nonsplit-cartan-13

**Names:** `TauCeti.EffectiveDiophantine.ED6.xns13_rationalPoints_card`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** For the actual modular Q-curve X_ns(13) and its rational-point carrier Hom_Q(SpecQ,X_ns(13)), construct Baran’s Q-isomorphism to X_s(13) from the certified two quartic models and projective GL3(Q) coordinate change. Transport the seven-point theorem to get #X_ns(13)(Q)=7. Through its own modular j-map, independently construct the seven CM points above discriminants−7,−8,−11,−19,−28,−67,−163; prove their distinctness and exhaustiveness. These have j-values−3375,8000,−32768,−884736,16581375,−147197952000,−262537412640768000 respectively. Do not give Baran’s isomorphism a modular interpretation or assert it preserves j. The unconstructed X_ns quartic/map and CM/moduli comparison remain supplier obligations, not an arbitrary finite-type equivalence hypothesis.

### 68. ED.6/xs4-13-rational-points

**Names:** `TauCeti.EffectiveDiophantine.ED6.xS4_13_rationalPoints`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** For the actual modular curve X_S4(13), identified with the smooth projective quartic xS4_13Quartic=0, prove its Q-points are exactly the four projective classes xS4_13Points: (1:3:−2),(0:0:1),(0:1:0),(1:0:0). The point(0:0:1) is CM of discriminant−3; the other three have projective mod13 imageS4, with the three j-values stated in this node. Inputs to the proof are the genuine isogeny to J_s(13), potential-good-reduction result, actual two affine patches from BDMTVv4§5.1p26, p=11,T11 andT11² classes, four-point height pairing, and certified complete common-zero/matching tables on every disc. The final theorem is unconditional; missing supplier proofs and unreplayed computations are recorded gaps. An arbitrary QCRun whose output is already assumed complete is not the application.

### 69. ED.6/x0plus-genus-three-points

**Names:** `TauCeti.EffectiveDiophantine.ED6.x0plus_genusThree_rationalPoints`.

**Boundary:** The actual geometric supplier carriers and comparison maps are unavailable at the pinned baseline. The separately named matrix/set helper does not state this theorem.

**Required signature:** For each N∈{97,109,113,127,139,149,151,179,239}, let X=X0(N)/⟨w_N⟩ be the actual coarse smooth projective Q-curve and identify it with the corresponding explicit plane quartic in BDMTVv4 Examples5.7–5.15pp31–32. Prove equality of its Hom_Q(SpecQ,X) with exactly the projective classes in the following ordered source lists, with cusp/CM identification through the quotient modular interpretation (not a single descended j-map on X0+(N)). N=97, p=5: Q_N=zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y²=0; ordered points (1:0:0),(-2:1:1),(-1:0:1),(0:0:1),(0:1:0),(0:-1:1),(1:0:1),(1:1:1),(-1:1:0),(5:3:2); first point is the cusp, remaining CM discriminants in order -3,-4,-8,-11,-12,-16,-27,-43,-163. N=109, p=29: Q_N=zx³+(zy+z²)x²+(−y³−zy²−z³)x−zy³−3z²y²−2z³y=0; ordered points (1:0:0),(-2:1:2),(0:-2:1),(0:-1:1),(0:1:0),(0:0:1),(-1:-1:1),(-2:1:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -3,-4,-7,-12,-16,-27,-28,-43. N=113, p=17: Q_N=zx³+(−y²−z²)x²+(y³+z³)x−2z²y²+z³y=0; ordered points (1:0:0),(2:2:1),(0:1:0),(1:1:1),(1:1:0),(0:0:1),(0:1:2),(5:3:1); first point is the cusp, remaining CM discriminants in order -4,-7,-8,-11,-16,-28,-163. N=127, p=11: Q_N=zx³+(−y²−3z²)x²+(y³−z²y+4z³)x+2zy³−3z²y²+3z³y−2z⁴=0; ordered points (1:0:0),(5:3:2),(2:1:1),(1:1:0),(1:0:1),(0:1:1),(0:1:0),(4:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-43,-67. N=139, p=19: Q_N=zx³+(−y²+zy)x²+(−y³−2zy²−3z²y−z³)x+y⁴+zy³+z²y²+z³y=0; ordered points (1:0:0),(4:-3:1),(0:0:1),(0:-1:1),(1:-1:1),(1:0:1),(-1:0:1); first point is the cusp, remaining CM discriminants in order -3,-8,-12,-19,-27,-43. N=149, p=11: Q_N=zx³−y²x²+(y³+zy²−2z²y−z³)x−y⁴+zy³+z²y²−z³y=0; ordered points (1:0:0),(-1:0:1),(0:1:1),(1:0:1),(0:0:1),(0:-1:1),(2:2:1); first point is the cusp, remaining CM discriminants in order -4,-7,-16,-19,-28,-67. N=151, p=19: Q_N=zx³+(−2zy+z²)x²+(−y³+2zy²)x−zy³+3z²y²−z³y−2z⁴=0; ordered points (1:0:0),(-2:-2:1),(0:1:0),(0:2:1),(1:1:1),(2:3:2),(1:0:1),(3:2:1); first point is the cusp, remaining CM discriminants in order -3,-7,-12,-27,-28,-67,-163. N=179, p=17: Q_N=zx³+(−2zy−z²)x²+(−y³−zy²−2z²y−z³)x−zy³+z³y=0; ordered points (1:0:0),(0:-1:1),(0:1:0),(0:0:1),(0:1:1),(-2:2:1); first point is the cusp, remaining CM discriminants in order -7,-8,-11,-28,-163. N=239, p=13: Q_N=zx³+(−y²+zy+z²)x²+(−y³−zy²−z²y)x+y⁴+3zy³+2z²y²+z³y=0; ordered points (1:0:0),(-1:0:1),(0:0:1),(1:-2:1),(1:-1:1); first point is the cusp, remaining CM discriminants in order -7,-19,-28,-43. The source counts are10,9,8,8,7,7,8,6,5 respectively. Require genuine rank/logarithm, endomorphism, model/reduction, local-height and two-cycle coefficient/zero/matching certificates for each N. Retain the modular rank-overQ and numerical replay gaps; do not generalize the ten-point97 helper to every level.

## Source corrections and qualifications

The source-issue register distinguishes misprints, proof issues and source-access qualifications. The packet records the source’s assertion in our own words, retaining mathematical formulas, precise locators and correction-search records; the mathematical effect is summarized here.

### E1: misprint

**Source and locator:** `bruin-stoll-2010` — Published §3.3, p.279, PrepareLift: the definition of Λ, with φᵢ as defined in §3.2, p.277.

**Correction or qualification:** At target D=NₖΓ use Lⱼ₋₁∩φᵢ⁻¹(φᵢ(D)); with the source’s surjective maps this is Lⱼ₋₁∩φᵢ⁻¹(NₖGᵢ). Equivalently, first replace Gᵢ by Gᵢ/NₖGᵢ and φᵢ by its composite into that quotient, then take its kernel. The required invariant is D≤Lⱼ≤Lⱼ₋₁.

**Reason:** Let Γ=ℤ, G=ℤ/4, φ reduction, Nₖ₋₁=1, qₖ=2 and Nₖ=2. The selected exponent test holds. The displayed original kernel produces L₁=4ℤ, which fails to contain D=2ℤ. The final assignment Lₜ=2ℤ then makes an ascending step, so the quotient Lₜ₋₁/Lₜ in Lift is not defined. The quotient-target kernel is 2ℤ and preserves the invariant. This is a defect of the literal printed notation, not a claim that the authors’ implementation has this bug.

**Effect:** the proof. **Existing correction or search outcome:** The authors’ MWSieve-new.m already performs the target quotient before taking Kernel(h): LiftInformation lines 2480–2493. URL https://www.mathe2.uni-bayreuth.de/stoll/magma/MWSieve-new.m; SHA-256 2e4b0cc03da645fdb3bcb554893a7dd736b97cae6b7ec1583942b12b0c31bd7f.

### E2: misprint

**Source and locator:** `de-weger-1989` — §3.12, definition of y before Lemma 3.15 and proof of Lemma 3.15, printed p. 65 (CWI Tract 65 scan)

**Correction or qualification:** y = (0, …, 0, −β′^(μ))^T, so that x − y = (x_1, …, x_{n−1}, x_n + β′^(μ))^T and Lemma 3.13 gives ord_p(x_n + β′^(μ) − Σ_{i<n} x_iθ′_i) ≥ μ, which is ord_p(Λ′) ≥ μ for Λ′ = β′ − Σ x_iθ′_i + x_n.

**Reason:** With the printed sign, Γ_μ + y is {x : ord_p(x_n − β′^(μ) − Σ x_iθ′_i) ≥ μ}. Example p = 3, μ = 1, n = 2, θ′_1 = 3 (so θ′_1^(1) = 0), β′ = 1: Γ_1 = ℤ × 3ℤ and Γ_1 + (0, 1) = {x_2 ≡ 1 (mod 3)}, while {x : ord_3(1 − 3x_1 + x_2) ≥ 1} = {x_2 ≡ 2 (mod 3)}. The proof also writes θ_i for θ′_i and '≥ p^μ' for '≥ μ'. Tzanakis–de Weger 1992, §15, Lemma 14 uses the corrected sign y = (0, …, 0, −W_{v+r}β_0^(m)).

**Effect:** a stated result. **Existing correction or search outcome:** new

### E3: misprint

**Source and locator:** `de-weger-1989` — §3.6, Figure 2 (The Fincke and Pohst Algorithm), step (4), printed p. 52

**Correction or qualification:** U_i := Σ_{j=i+1}^{n} q_ij·x_j (the lattice has dimension n in this section).

**Reason:** Everywhere else in §3.6 and Figure 2 the dimension is n (q_ij for 1 ≤ i ≤ j ≤ n, i := n); the upper limit m is copied from Fincke–Pohst (2.8), where the dimension is called m.

**Effect:** nothing. **Existing correction or search outcome:** new

### E4: misprint

**Source and locator:** `tzanakis-de-weger-1989` — §II.3, proof of Proposition 3.2, printed p. 115

**Correction or qualification:** The excluded inequality is |Λ|<K₁ exp(−K₂A), the first inequality of (3.1), on the stated range of A.

**Reason:** The argument shows c_0|Λ| ≥ qK_3 for every (a_i) with A ≤ X_0, which is incompatible with |Λ| < K_1 exp(−K_2A) when A ≥ (1/K_2)log(c_0K_1/(qK_3)); the inequality with '>' is the one that every such vector satisfies, not the one without solutions. Proposition 3.2 as stated is correct.

**Effect:** nothing. **Existing correction or search outcome:** new

### E5: misprint

**Source and locator:** `tzanakis-de-weger-1989` — §II.2, Lemma 2.1, p. 107 (definition of U_I) with (2.1), p. 108

**Correction or qualification:** l indicates a row and i a column: (U_I)_{l,i} = log|ε_i^{(h_l)}|, so that (2.1) (log|β^{(h_l)}/μ^{(h_l)}|)_l = U_I·(a_1, …, a_r)^T holds and a = U_I^{−1}(…) gives max|a_i| ≤ N[U_I^{−1}]·max_l|log|β^{(h_l)}/μ^{(h_l)}||.

**Reason:** With the printed orientation the l-th entry of U_I·a is Σ_i log|ε_l^{(h_i)}|·a_i, not log|β^{(h_l)}/μ^{(h_l)}| = Σ_i a_i log|ε_i^{(h_l)}|, so (2.1) would be false; the row-sum norm of the inverse of the transposed matrix differs in general (for U = ((2, 1), (0, 1)) the row-sum norms of U^{−1} and (U^T)^{−1} are 1 and 3/2). Tzanakis–de Weger's 1992 paper (Lemma 6, p. 239) displays U_I with rows indexed by the embeddings, as corrected here.

**Effect:** nothing. **Existing correction or search outcome:** new

### E6: error

**Source and locator:** `de-weger-1989` — §3.13, Lemma 3.17(i), p. 67

**Correction or qualification:** For p = 2 only Γ*_μ = Γ_μ holds in general; for p ≥ 3 the indices divide (p−1)/2, p−1 and 2 respectively, with equality when the residues of the α_i generate (ℤ/p)^× (as in Chapter 6, where p_0 is chosen to be a primitive root).

**Reason:** p = 2, α = (3, 5), μ = 0: ord_2(log_2 3) = ord_2(log_2 5) = 2 = μ_0, so Γ_0 = ℤ², but Γ#_0 = {x : 3^{x_1}5^{x_2} ≡ 1 (mod 4)} = {x_1 even}. p = 5, α = (6, 11), μ = 0: μ_0 = 1, Γ_0 = ℤ² and ξ ≡ 1 (mod 5) always, so Γ#_0 = Γ_0 and #(Γ_0/Γ#_0) = 1 ≠ 4.

**Effect:** a stated result. **Existing correction or search outcome:** new

### E7: gap

**Source and locator:** `tzanakis-de-weger-1989` — §II.3, (3.8) and the summary procedure, pp. 117–118

**Correction or qualification:** Condition (3.8), a_{k+1} > |q_k|^{n−2}/C_1 − 2, is proved for the partial quotient a_{k+1} of ξ^{(i_0)}; applied to the computed partial quotients b_{k+1} of ξ̃ it is not justified. Either test every convergent p_i/q_i of ξ̃ with q_i ≤ C directly (F(Zp_i, Zq_i) = m with Z^n ∣ m), or compute ξ^{(i_0)} precisely enough to determine a_{k+1}.

**Reason:** The proof shows that p_k/q_k is a convergent of both ξ^{(i_0)} and ξ̃, but the next partial quotients can differ: if |ξ̃ − ξ^{(i_0)}| is close to its allowed maximum 1/(6C²) and q_k is close to C, then |ξ̃ − p_k/q_k| ≈ 1/(6q_k²), which forces b_{k+1} ≤ 5, while a solution with Y = q_k makes a_{k+1} > q_k^{n−2}/C_1 − 2 large; a test of (3.8) with b_{k+1} would then discard that solution.

**Effect:** the proof. **Existing correction or search outcome:** new

### E8: misprint

**Source and locator:** `tzanakis-de-weger-1992` — §5, proof of the second corollary of Lemma 1, pp. 232–233

**Correction or qualification:** Use part (i) of the first corollary to obtain uniqueness of a prime ideal 𝔭_i above p satisfying (8).

**Reason:** Uniqueness of the prime ideal is the conclusion of part (i). Part (ii) addresses d_i>1 or e_i>1; the following sentence uses that second part to obtain d_i=e_i=1.

**Effect:** nothing. **Existing correction or search outcome:** new

### E9: gap

**Source and locator:** `tzanakis-de-weger-1992` — §9, Cases 1–2 and Proposition 7, pp. 240–241

**Correction or qualification:** c′_17 := Σ_i max(0, max_j log(p_i^{h_i}/|π_i^{(j)}|)) and c″_17 := Σ_i max(0, log ⌈π_i⌉), for which the two displayed inequalities hold since n_i ≤ N.

**Reason:** ∏_i x_i^{n_i} ≤ (∏_i x_i)^N with 0 ≤ n_i ≤ N needs every x_i ≥ 1; for v ≥ 2 a factor |p_i^{h_i}/π_i^{(k)}| or |π_i^{(k)}| can be below 1 (π_i has norm ±p_i^{h_i}, so one conjugate may exceed p_i^{h_i} while others are small); e.g. x_1 = 4, x_2 = 1/2, n_1 = N, n_2 = 0 gives 4^N > 2^N.

**Effect:** a stated result. **Existing correction or search outcome:** new

### E10: misprint

**Source and locator:** `aitken-lemmermeyer-2011` — Appendix B, p. 17, first lines (arXiv:1108.6310v1; the same sentence in the author's six-page version on his web page)

**Correction or qualification:** E is y² = x³ + 2⁴·17x, which is isomorphic over ℚ to y² = x³ + 17x.

**Reason:** The general formula four lines earlier, y² = x³ − 2bdx² + (b² − 4ac)d²x with (a, b, c, d) = (1, 0, −17, 2), gives (0 + 68)·4 = +272. Independently, the system is X⁴ − 17Y⁴ = 2Z², i.e. v² = 2u⁴ − 34, whose invariants I = −816, J = 0 give the Jacobian Y² = X³ + 22032X ≅ y² = x³ + 17x (22032 = 6⁴·17; Cremona (3.6.3)). y² = x³ − 17x is not isomorphic to it over ℚ, since −1 is not a fourth power.

**Effect:** nothing. **Existing correction or search outcome:** new

### E11: misprint

**Source and locator:** `poonen-1998` — §4, paragraph before Proposition 2, p. 15 of arXiv:math/9512217v1 (page rendered); the published Math. Z. version was not read

**Correction or qualification:** …except that S⁺ and S⁻ both reduce to the Weierstrass point (1, 0) ∈ C(𝔽_3).

**Reason:** R^± = (0, ±1) reduce to (0, ±1) ∈ C(𝔽_3), which are distinct and not Weierstrass points; S^± = (1, ±3) reduce to (1, 0), and g(1) = 9 ≡ 0 (mod 3) with g'(1) ≡ 1 (mod 3), so (1, 0) is a Weierstrass point. The proof of Proposition 2 treats S^± as the two points over (1, 0), in agreement with the correction.

**Effect:** nothing. **Existing correction or search outcome:** new

### E12: error

**Source and locator:** `bruin-stoll-2010` — Lemma 4.1 and its proof, published p.281 (same in arXiv v2 and the author copy)

**Correction or qualification:** |k1 b^2 − k2 ab + k3 a^2| ≤ (|k1| + |k2| + |k3|)·max{|a|,|b|}^2 ≤ 3e^{H′+γ}max{|a|,|b|}^2; the hypothesis should read p1 p2 · · · pm > 3e^{H′+γ} max{|a|, |b|}^2, under which the divisibility step gives k1 a^2 − k2 ab + k3 b^2 = 0 (the last step of the proof needs the further correction recorded as a separate gap).

**Reason:** With coprime Kummer coordinates (k1, k2, k3) = (1, −1, 1) and a = b = 1 the integer is 3, while max|kj|·max{|a|,|b|}^2 = 1; the claimed estimate only bounds each of the three terms separately.

**Effect:** the proof. **Existing correction or search outcome:** new

### E13: misprint

**Source and locator:** `bruin-stoll-2010` — Proof of Lemma 4.1, published p.281 (same in arXiv v2 and the author copy)

**Correction or qualification:** With x(P0) = (a : b) the divisibility is pj | k1 a^2 − k2 ab + k3 b^2: the quadratic k1 X^2 − k2 XZ + k3 Z^2, whose roots are the x-coordinates of the divisor of Q, is evaluated at (X : Z) = (a : b).

**Reason:** In the paper's own convention (Lemma 5.3, p.288) the Kummer point (x1 : x2 : x3 : x4) gives A(X, Z) = x1 X^2 − x2 XZ + x3 Z^2; vanishing at x(P0) = (a : b) is x1 a^2 − x2 ab + x3 b^2 = 0. The printed form evaluates at (b : a).

**Effect:** nothing. **Existing correction or search outcome:** new

### E14: misprint

**Source and locator:** `bruin-stoll-2010` — §3.2, FindQSequence, published p.278 (same in arXiv v2 and the author copy)

**Correction or qualification:** if n < ε1: // success?

**Reason:** Before the algorithm the required bound is n((∏q_k)Γ)<ε₁. The subsequent termination claim assumes an initial multiple M with n(MΓ)<ε₁, so it requires testing against ε₁ as well. The §7 choice of q-sequence confirms ε<ε₁<1.

**Effect:** nothing. **Existing correction or search outcome:** new

### E15: misprint

**Source and locator:** `bdmtv-2021` — Version of record, Compositio159 (2023), p.1129, item(3) after(4.2); same in arXiv:2101.01862v4 p.18.

**Correction or qualification:** g_x ∈ Q̄((t_x)) is a formal primitive of Ω_xᵀ Z dΩ_x − η, as in BDMTV 2019 (29).

**Reason:** By (d) Z is antisymmetric, so dΩ_xᵀ Z dΩ_x = Σ Z_ij ω_i ω_j vanishes identically (as a product of coefficient functions in t_x it is a quadratic form in an antisymmetric matrix). As printed, g_x would be −∫η, and (4.2) would no longer involve the quadratic term that the gauge equation C_x^(−1)dC_x = Λ produces. g_x has poles at x (it is determined only through its principal part), so it lies in Q̄((t_x)), not Q̄[[t_x]].

**Effect:** nothing. **Existing correction or search outcome:** new

### E16: misprint

**Source and locator:** `bdmtv-2021` — Version of record, Compositio159 (2023), p.1129, definition of Ω_x and(4.2); same in arXiv:2101.01862v4 p.18.

**Correction or qualification:** With the sign convention of BDMTV 2019 (29), dΩ_x = −ω; with dΩ_x = +ω the linear term of (4.2) must read + b_Filᵀ Nᵀ Ω_x (equivalently, keep (4.2) and use Ω_x := −∫ω).

**Reason:** The connection matrix Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]] printed on the same page is that of 2019 (27); expanding C_x^(−1)dC_x = Λ for C_x = [[1,0,0],[Ω_x,1,0],[g_x,Ω_xᵀZ,1]] forces dΩ_x = −ω. Replacing Ω_x by −Ω_x leaves the quadratic terms of (4.1)–(4.2) unchanged and changes the sign of b_FilᵀNᵀΩ_x, so (4.2) read with dΩ_x = +ω determines −b_Fil, and β_Fil enters h_p linearly in (3.2). The section states that it recalls the definitions of BDMTV 2019 §4, whose conventions are the intended ones; the Ω_x entries also have poles, so they lie in Q̄((t_x)).

**Effect:** nothing. **Existing correction or search outcome:** new

### E17: gap

**Source and locator:** `bruin-stoll-2010` — Lemma 4.1, last sentence of the proof, published p.281 (same in arXiv v2 and the author copy)

**Correction or qualification:** Require that the primes p_j separating P0 from P̄0 have product greater than e^{H′+γ} (for instance that every p_j separates them). At each separating prime the test then forces Q ≡ 0, so these primes divide k1, k2, k3, which are not all zero since Q ≠ 0: a contradiction.

**Reason:** For P ∈ C(ℚ) with P ≠ P̄0 and P ≡ P̄0 modulo p_{j0}, the class Q = [P − P̄0] = [P + P0 − W] reduces to 0 = ι(P̃0) modulo p_{j0}, so it passes the test there, and it passes at every p_j where P0 ≡ P̄0; yet Q ∉ ι(C(ℚ)), since P + P0 is the unique effective divisor in its class and Q = −ι(P̄). One separating prime does not distinguish the two cases.

**Effect:** the proof. **Existing correction or search outcome:** new

### E18: misprint

**Source and locator:** `tzanakis-de-weger-1989` — §III.2, p.123

**Correction or qualification:** (2.2) is equivalent to Norm(X − Yϑ) = 1 and (2.1) to Norm(X − Yφ) = 1.

**Reason:** Using ϑ⁴−12ϑ²−8ϑ+4=0 from the same page gives Norm(X−Yϑ)=X⁴−12X²Y²−8XY³+4Y⁴, which is form (2.2). The next sentence obtains the units ε₁=1+ϑ and ε₂=3+ϑ from known solutions of (2.2), agreeing with the corrected assignment.

**Effect:** nothing. **Existing correction or search outcome:** new

### E19: error

**Source and locator:** `tzanakis-de-weger-1989` — §II.1, proof of Lemma 1.2, p.106

**Correction or qualification:** |Λ| ≤ 2·(arcsin ¼)/(¼)·|sin Λ/2| = 4·arcsin(¼)·|e^{iΛ} − 1| ≤ 1.02·|e^{iΛ} − 1|: the factor (¼)/sin(¼) ≈ 1.01049 becomes 4·arcsin(¼) ≈ 1.01072, and the stated constant 1.02 still holds.

**Reason:** x/sin x increases on (0, π/2), so x ≤ (¼/sin ¼)·sin x holds only for 0 ≤ x ≤ ¼; the hypothesis |sin(Λ/2)| < ¼ allows |Λ/2| up to arcsin ¼ ≈ 0.2527, and at x = 0.2526 the printed inequality fails (x/sin x ≈ 1.01071 > 1.01049).

**Effect:** nothing. **Existing correction or search outcome:** new

### E20: misprint

**Source and locator:** `flynn-poonen-schaefer-1997` — End of the proof of Lemma 2, p.16 (arXiv:math/9508211)

**Correction or qualification:** subspace generated by u1 and u3 β1 β2, as in the statement of Lemma 2 and in Lemma 5.

**Reason:** The statement of Lemma 2 (same page) and the proof of Lemma 5 use u3β1β2; the norm of u3β1β3 is −3701⁴, not a square, so it cannot lie in the norm kernel described.

**Effect:** nothing. **Existing correction or search outcome:** new

### E21: error

**Source and locator:** `bdmtv-2021` — Version of record, Compositio159 (2023), Lemma4.7, p.1136; same in arXiv:2101.01862v4 p.25.

**Correction or qualification:** Require ord_p(F_i)+i≥n for every i≥m, equivalently max{i≥0:ord_p(F_i)+i<n}<m. This is the coefficient condition needed for the degree bound on G(x+α) modulo p^(n−k) used in the proof.

**Reason:** With G(x) = p^(−k)F(px), the coefficient G_i has valuation ord_p(F_i) + i − k, so G is a polynomial of degree < m modulo p^(n−k) exactly when ord_p(F_i) + i ≥ n for i ≥ m. The printed condition only restricts the indices with ord_p(F_i) + i = n. For F = p² − p·x and n = 5 the printed set is empty, so m = 1 is allowed, k = 2, and the lemma would determine the roots from F_0 = p² modulo p⁵; but F has the root x = p in the disc, which F_0 does not see.

**Effect:** a stated result. **Existing correction or search outcome:** new

### E22: misprint

**Source and locator:** `siksek-2010` — Algebra & Number Theory 7 (2013), version of record, p.770, immediately after pairing (4); also arXiv:1010.2603v2, §3.3, p.5.

**Correction or qualification:** For the displayed order Ω × J(K_v), the left kernel is 0 and the right kernel is J(K_v)_tors.

**Reason:** The right carrier is J(K_v), which contains its torsion, and the left carrier is a characteristic-zero vector space. Both the published p.770 and preprint p.5 reverse the kernels for pairing (4); the same paper correctly gives them for pairing (3) on published p.769/preprint p.4. Stoll arXiv:1307.1773v4 p.7 uses the correct Ω × J order.

**Effect:** nothing. **Existing correction or search outcome:** new; no correction found in the searches below (not a claim that no correction exists)

### E23: misprint

**Source and locator:** `flynn-poonen-schaefer-1997` — arXiv:math/9508211v1, p.23, proof of Theorem 6, θ₂ branch. Also printed in the Oxford repository author copy, p.15.

**Correction or qualification:** n = −1, 1

**Reason:** Lemma 8 on p.20 lists (0,−1) and (−3,1) in the two known-point expressions, giving n=−1,+1. The displayed θ₂ series modulo 81 is 36+27n+18n²+54n³+27n⁴; it is 0 at ±1 and 54 at −2. This repairs the named known roots in the proof; the two-root conclusion is unaffected.

**Effect:** the proof. **Existing correction or search outcome:** new; no correction found in the searches below (scoped to the preprint and author copy)

### E24: misprint

**Source and locator:** `bdmtv-2019` — Annals version of record, p.921, equation (40), final differential index.

**Correction or qualification:** ω_{2g+d−2}

**Reason:** The word alphabet and its differential substitution immediately below (40) both end at 2g+d−2. The basis has dimension 2g+d−1, so the extra d indices in the displayed expression are outside that basis. The packet already uses the correct range but incorrectly attributes it to the unrelated Bruin–Stoll E1.

**Effect:** nothing. **Existing correction or search outcome:** new; no correction found in the searches below

### E25: misprint

**Source and locator:** `de-weger-1989` — §3.6, Figure2, printed p.52, step(5), original CWI edition and author copy.

**Correction or qualification:** Print both x and −x before zero termination, as Fincke–Pohst(2.8); an affine adaptation instead scans all signed bounds and includes zero separately.

**Reason:** For n=1, B=(1), C=1, the printed scan outputs −1 and then stops at0, omitting +1. The paragraph on p.51 promises all short vectors. This is a missing sign in the displayed pseudocode; Fincke–Pohst itself prints both signs.

**Effect:** the proof. **Existing correction or search outcome:** new; no separate correction found in the bounded searches

### E26: misprint

**Source and locator:** `tzanakis-de-weger-1989` — §II.3, p.116, constants immediately below(3.5).

**Correction or qualification:** K₂′ = K₂/((q−p+1)D).

**Reason:** The preceding line gives A′≤(q−p+1)DA. Substitution in exp(−K₂A) therefore divides K₂ by that entire factor. For q=3,p=2,D=2,K₂=1 the required value is1/4; the literal printed expression gives1/2. The inequality is not justified with the printed stronger decay constant.

**Effect:** the proof. **Existing correction or search outcome:** new; no separate correction found in the bounded searches

### E27: misprint

**Source and locator:** `flynn-poonen-schaefer-1997` — arXiv:math/9508211v1, p.23, Theorem6 proof, θ₁ branch.

**Correction or qualification:** The linear coefficient has strictly smaller 3-adic valuation than the others (equivalently, larger 3-adic absolute value).

**Reason:** The displayed congruence is θ₁≡27n modulo81. The coefficient of n has valuation3 while all other nonzero coefficients have valuation≥4; zero coefficients have valuation∞. Strassmann singles out the maximal absolute value, hence the minimal valuation. This is a reversed word in the proof, and does not change the intended one-root conclusion.

**Effect:** the proof. **Existing correction or search outcome:** new for the inspected preprint; published edition not inspected

### E28: misprint

**Source and locator:** `bbk-2010` — arXiv:1004.4936v2, §2 opening, p.3, logarithm series.

**Correction or qualification:** log(x)=−Σ_{i≥1}(1−x)^i/i.

**Reason:** The printed series has derivative−1 at x=1, whereas the normalized logarithm has derivative+1. For p=3,x=4 the printed series is−3 modulo9 and the logarithm is+3 modulo9. Balakrishnan’s 2011 thesis explicitly identifies Chapter3 as material from BBK and prints the corrected minus on p.27.

**Effect:** the proof. **Existing correction or search outcome:** Known later author restatement: Balakrishnan2011 MIT thesis, Chapter3 §3.1, p.27, has the minus sign. This is not asserted to be a formal corrigendum.

### E29: error

**Source and locator:** `tzanakis-de-weger-1992` — 1992 version of record, Appendix A3, pp.283–284, definition of c7; the initial-bound example §11Ex and reductions §§15Ex–16Ex. Corrected in1993pp.241–242.

**Correction or qualification:** Multiply the displayed c7 lower bound by m^(2m+1). In the example m=7, the factor is7^15 and a valid rounded c7 is1.08672×10^46. With c16=0.6 the corrected initial bound is1.511×10^50; the same first p-adic reductions give N1=1153, and the adjusted real-step comparisons give H≤4919. Alternatively the corrigendum uses Baker–Wüstholz with c7=2.2044×10^38,c8=0,c16=10^(−9), recovering the original9.844×10^49 initial bound and its original reduction chain.

**Reason:** The authors confirm the missing factor in the imported BGMMS estimate and explicitly repair their example. 2.289×10^33·7^15<1.08672×10^46. The old numerical proof route cannot use the uncorrected constants; the final72-solution theorem is unchanged. No reduction matrix was recomputed in this revision.

**Effect:** the proof. **Existing correction or search outcome:** Tzanakis–de Weger1993 published corrigendum, Compositio89,241–242; https://numdam.org/item/CM_1993__89_2_241_0.pdf. This is an existing correction, not a new discovery.

### E30: misprint

**Source and locator:** `bdmtv-2021` — arXiv:2101.01862v4,p24,last sentence before Proposition4.6; already corrected in published Compositio159(2023),p1136

**Correction or qualification:** Here ϕ(i)=−2⌊log_p(i)⌋, without+c1. The coefficient bound for λφ adds c1 separately; the final Proposition4.6 bound keeps its stated+c1.

**Reason:** Equation(4.21) defines ϕ(i)=−floor(log_p i)+min(d_i(η),−floor(log_p i)); the i0 branch makes the second argument the minimum, so no c1 entersϕ. Publishedp1136 prints the corrected equality.

**Effect:** nothing. **Existing correction or search outcome:** Corrected in the published Compositio159(2023),p1136.

### E31: misprint

**Source and locator:** `siksek-symmetric-2009` — Version of record, Algebra & Number Theory3(2009), p.223, Theorem4.3 after equation(15); repeated in its proof p.225 after equation(17). Author-linked November26,2008 preprint symmetric7.pdf has the same condition in Theorem2 p.14 and proof p.15.

**Correction or qualification:** The strict inequality is required for positive integers i≥1; omit i=0 in both the hypothesis and the displayed strict higher-term norm consequence. This repairs the evident index slip; this entry does not certify every other step of the general relative theorem.

**Reason:** At i=0 the printed hypothesis becomes v_p(1)=0<0/N′=0, impossible for the positive ramification bound N′. The proof likewise claims |z^0/1|<1, which reads1<1. Its actual use concerns higher-degree terms (z+z′)/2,(z²+zz′+z′²)/3,…, indexed by i≥1 after factoring the linear difference. Thus the published conditional theorem is vacuous as literally printed; the intended index correction is visible in the proof. No counterexample to the intended geometric conclusion is asserted.

**Effect:** a stated result. **Existing correction or search outcome:** newly recorded in BP-EffectiveDiophantineMethods~3; no correction found in the bounded publisher/author search. The current author-linked preprint repeats the slip.

### E32: misprint

**Source and locator:** `tzanakis-de-weger-1992` — 1992 version of record, §4, p.228, the two displayed norm formulas near the bottom;1993p.242 first listed minor correction.

**Correction or qualification:** The norm values use the p-adic absolute value: |N_{K_P/Q_p}(x)|_p^(1/n_i) and |N_{L/Q_p}(x)|_p^(1/[L:Q_p]).

**Reason:** The norm lies in Q_p; the normalization immediately above is |p|_p=p^(−1), which the extension must preserve. The author corrigendum explicitly adds both p subscripts.

**Effect:** nothing. **Existing correction or search outcome:** Tzanakis–de Weger1993 published corrigendum, Compositio89,241–242; https://numdam.org/item/CM_1993__89_2_241_0.pdf. This is an existing correction, not a new discovery.

### E33: misprint

**Source and locator:** `tzanakis-de-weger-1992` — 1992 version of record, Appendix A3, p.283, the displayed choices a,ā,E,Ē,M̄ before the definition of Λ;1993p.242 second minor correction.

**Correction or qualification:** Use equality in all five displayed definitions, as the published corrigendum specifies. Any separately weakened certified constants require their own proved monotonicity argument.

**Reason:** These are the parameters in the imported lower-bound formula. The author corrigendum replaces every ≤ and ≥ on those two lines by =. The plan imports the corrected estimate or its independent Matveev supplier, not arbitrary inequality choices.

**Effect:** the proof. **Existing correction or search outcome:** Tzanakis–de Weger1993 published corrigendum, Compositio89,241–242; https://numdam.org/item/CM_1993__89_2_241_0.pdf. This is an existing correction, not a new discovery.

### E34: misprint

**Source and locator:** `tzanakis-de-weger-1992` — 1992 version of record, Appendix A3Ex, p.286, line defining c7 below the table;1993p.242 third minor correction.

**Correction or qualification:** The line should read c7=2.289×10^33, consistent with the maximum in the table. This is the pre-factor value; E29 additionally multiplies it by7^15 for the corrected BGMMS route.

**Reason:** The table on the same page prints2.289×10^33. The1993 corrigendum confirms the missing3 in the exponent, separately from the larger multiplicative correction.

**Effect:** the proof. **Existing correction or search outcome:** Tzanakis–de Weger1993 published corrigendum, Compositio89,241–242; https://numdam.org/item/CM_1993__89_2_241_0.pdf. This is an existing correction, not a new discovery.

### E35: misprint

**Source and locator:** `siksek-1995` — Exact author preprint infart2.pdf, printed/PDF p18, last line of Lemma4.1 proof on that page. Author-linked preprint dated February5,1995, 25 PDF/printed pages, SHA256 36b3079bb5277f819fbc0083d5020d774c8cb1cf6559fc82eebd5028510c31b3. Only this exact copy was visually verified; no assertion about the unread published version of record.

**Correction or qualification:** Replace n by m: υ(x₁′)≤−2m=υ(x₂′), where m was defined immediately above by υ(x₂′)=−2m. The multiplication integer n in P=nQ is a different parameter.

**Reason:** The proof defines the formal subgroup E′_m by υ(x′)≤−2m. Since Q′ lies in it and it is a subgroup, P′=nQ′ lies in the same subgroup. This supplies the corrected inequality; nothing identifies the formal depth m with the multiplication integer n. The lemma’s intended valuation conclusion is unchanged.

**Effect:** the proof. **Existing correction or search outcome:** Newly recorded here in the inspected author copy; no correction found in the bounded search. Author-linked preprint dated February5,1995, 25 PDF/printed pages, SHA256 36b3079bb5277f819fbc0083d5020d774c8cb1cf6559fc82eebd5028510c31b3. Only this exact copy was visually verified; no assertion about the unread published version of record.

### E36: error

**Source and locator:** `siksek-1995` — Exact author preprint infart2.pdf, printed/PDF p18, §4.2 projective representative conditions(1)–(2) before equation(41). Author-linked preprint dated February5,1995, 25 PDF/printed pages, SHA256 36b3079bb5277f819fbc0083d5020d774c8cb1cf6559fc82eebd5028510c31b3. Only this exact copy was visually verified; no assertion about the unread published version of record.

**Correction or qualification:** Write each vector as (b₁,…,b_(r+s)). For the computable surviving subspace V′_p, choose exactly one bounded integral lift of each one-dimensional subspace of V′_p; equivalently, every nonzero a∈V′_p has a unique representative b∈S_p with a=β(b mod p) for some β∈F_p^×. Then the required coverage also holds for V_p minus zero, since V_p⊆V′_p. Zero requires no projective representative; if V′_p={0}, take S_p empty. This states a sufficient corrected representative construction, not a claim that the full numerical point-recognition procedure is certified.

**Reason:** At a=0, every b∈S_p satisfies the printed congruence with β=0, so uniqueness fails whenever S_p has at least two elements; with S_p empty existence fails. Even when S_p has one element the zero clause does not express a projective class. For example a two-dimensional F₂ surviving space has three projective classes, all representing zero when multiplied by0. The missing nonzero scope is essential to the literal condition. The b_p notation is independently dimensionally inconsistent with Z^(r+s) and the r+s-term sum(41).

**Effect:** a stated result. **Existing correction or search outcome:** Newly recorded here in the inspected author copy; no correction found in the bounded search. Author-linked preprint dated February5,1995, 25 PDF/printed pages, SHA256 36b3079bb5277f819fbc0083d5020d774c8cb1cf6559fc82eebd5028510c31b3. Only this exact copy was visually verified; no assertion about the unread published version of record.

### E37: misprint

**Source:** `tzanakis-de-weger-1989`, Version of record, §II.3, p.116, K₃′ immediately below (3.5).

**Correction:** Use K₃′=(q−p+1)D K₃, just as A′≤(q−p+1)D A on the same page.

**Check:** For D=d=d12=2, p=1,q=2, K₃=3/2 and a1=a2=1, A=1<K₃ and the displayed transformed coefficients have A′=4. The bound without D is3; with D it is6. Both the exponential rate and the additive coefficient must use this same change of scale.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E38: error

**Source:** `flynn-poonen-schaefer-1997`, arXiv:math/9508211v1, Proposition6, p.15; scope is this preprint, not the unread Duke publication.

**Correction:** Require an odd prime for all torsion, or restrict to torsion of order prime to p. The actual reductions at3 and5 used in the example remain valid.

**Check:** On E:y²+xy=x³+4x²+x, discriminant225 is odd and P=(−1/4,1/8) is nonzero rational2-torsion. Its primitive projective representative[−2:1:8] reduces to[0:1:0] at2. Thus good reduction at2 does not suffice for full torsion injection.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E39: misprint

**Source:** `flynn-poonen-schaefer-1997`, arXiv:math/9508211v1, p.22, paragraph specifying s1 and s2 in the proof of Theorem6.

**Correction:** Their 3-adic absolute values are at most1/3; their additive valuations are respectively2 and1.

**Check:** The denominators are prime to3 and the numerator valuations are2 and1, respectively. The small-parameter series argument uses absolute values, not an upper bound on these positive valuations.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E40: misprint

**Source:** `poonen-1998`, arXiv:math/9512217v1, p.17, final point labels in the proof of Proposition2; unread Math.Z. publication is outside this finding.

**Correction:** Use P0=S−, P3=W and P6=S+ when the previously defined parameter is t=y+3. The integer n labels0,1,2 remain correct.

**Check:** The calculation on this page sets t=3n. Thus n=0,1,2 yields t=0,3,6 and y=−3,0,3; the subscript of P_t is t rather than n.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E41: error

**Source:** `cremona-1997`, Author online ChapterIII full text, §3.3, pp.70–71, torsion algorithm; https://johncremona.github.io/book/fulltext/chapter3.pdf.

**Correction:** For every positive y and resulting x, insert both (x,y) and its group inverse in the completed-square integral model; insert y=0 points only once and include O. Translate both points back to the original model.

**Check:** For y²=x³+1, the points(0,1) and(0,−1) are distinct rational points of order3: tangent doubling gives2(0,1)=(0,−1). A scan using positive y and inserting only that point cannot return the full torsion subgroup.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E42: error

**Source:** `tzanakis-de-weger-1992`, 1992 version of record, Proposition16, p.265, short-vector threshold and the logarithmic conclusion.

**Correction:** Use l(Γ)>sqrt(R²+S) for the finite logarithmic bound. At equality the exclusion estimate gives no positive denominator, so no finite bound follows from that expression.

**Check:** R=3,S=16,l=5 satisfies equality but gives sqrt(25−16)−3=0. The proposed finite logarithm is undefined. ED.1 uses the required strict inequality already; the actual source example margins are strict.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

### E43: misprint

**Source:** `de-weger-1989`, CWI Tract65(1989), Theorem6.3 p.123 and TableII p.130, row with z=28561 and summands22000,6561.

**Correction:** List(6561,22000,28561), interchanging the x and y valuation blocks too. The equation, coprimality, prime support and count remain unchanged.

**Check:** 22000>6561 contradicts the stated ordering convention. Exact integer checks confirm22000+6561=28561 and coprimality; the summands have the table’s supported prime factors. This is an ordering error, not an objection to the545 count.

Confirmed by `REV-EffectiveDiophantineMethods~3`. The bounded correction search is recorded in the packet.

## Stable identifiers and stage coordination

The following ED.5 identifiers remain durable aliases for API-level results in their owning nodes. They do not add target nodes or duplicate their proofs.

| Consolidated identifier | Owning node |
|---|---|
| `EffectiveDiophantineMethods:ED.5/membership` | `EffectiveDiophantineMethods:ED.5/admissible-classes` |
| `EffectiveDiophantineMethods:ED.5/representative-congruences` | `EffectiveDiophantineMethods:ED.5/admissible-classes` |
| `EffectiveDiophantineMethods:ED.5/constraint-monotonicity` | `EffectiveDiophantineMethods:ED.5/admissible-classes` |
| `EffectiveDiophantineMethods:ED.5/top-initialization` | `EffectiveDiophantineMethods:ED.5/admissible-classes` |
| `EffectiveDiophantineMethods:ED.5/unchanged-local-image` | `EffectiveDiophantineMethods:ED.5/coset-lift` |
| `EffectiveDiophantineMethods:ED.5/lift-membership` | `EffectiveDiophantineMethods:ED.5/coset-lift` |
| `EffectiveDiophantineMethods:ED.5/lift-cardinality` | `EffectiveDiophantineMethods:ED.5/coset-lift` |
| `EffectiveDiophantineMethods:ED.5/prepared-step-target` | `EffectiveDiophantineMethods:ED.5/coset-lift` |
| `EffectiveDiophantineMethods:ED.5/prepared-step-progress` | `EffectiveDiophantineMethods:ED.5/coset-lift` |
| `EffectiveDiophantineMethods:ED.5/exponent-relevance` | `EffectiveDiophantineMethods:ED.5/sieve-chain` |
| `EffectiveDiophantineMethods:ED.5/kernel-level-exactness` | `EffectiveDiophantineMethods:ED.5/padic-quotient-sieve-datum` |
| `EffectiveDiophantineMethods:ED.5/local-overapproximations` | `EffectiveDiophantineMethods:ED.5/admissible-classes` |

The owning-stage requests preserve RS-03: ED.0 uses CN.0 exact algebraic and local adapters; ED.1 consumes GN.5 reduction; ED.2 consumes DT.3/DT.4 bounds and CN.4 enclosures; ED.3 uses RP.1 and the existing elliptic-curve roadmap; ED.6 consumes the NC.5 quadratic-Chabauty theory and CN.5 certificate schema. No reverse CN.4-to-ED.0 dependency is introduced.
