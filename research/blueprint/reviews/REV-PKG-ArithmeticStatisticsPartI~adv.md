# Independent package review: ArithmeticStatisticsPartI

**Verdict: accepted with the fixes in this review.** Reviewer: Codex, session
`codex-e9iaNz`, 2026-10-17. Job: #10273,
`REV-PKG-ArithmeticStatisticsPartI~adv`. This session did not author, package or
previously review the input. Acceptance means the roadmap is ready for an
upstream draft; its proposed theorems are not formalized proofs.

## Scope and preservation

Read the complete Part I README, Suggested.lean and metadata, the assembled
ArithmeticStatistics packet and its ST.0 packet, the previous package/fix
handoffs, WORKERS, PACKAGE_REVIEW, PROTOCOL §§5, 13 and 20, expansion PROTOCOL,
UPSTREAM_GUIDE and the library-coverage audit. There is no separate Part I
packet: the maintainer's split retained the assembled plan as the input.
The upstream models read were GlobalNumberFields and JacobianChallenge,
including their Suggested.lean files.

Part I contains the common Layer 0, §§0.1–0.24. All 89 original named target
blocks and their APIs remain. All 92 original nonbibliographic anchors remain;
the added bundle-geometry contract has one new anchor. Comparing the accepted
pre-split README at `270eb2332^` with the eight current parts found all 744
nonbibliographic anchors exactly once, with none missing or duplicated.
The review changes no packet and removes no target or valid Check. The two
false Checks about the unrestricted squareclass constant and the fixed
acceptability presentation are corrected in place. Other negative controls
are additions. `metadata.toml` remains `topic = "math.NT"`.

Cross-part and analytic links were checked against the actual split packages.
Part I has no dependency on a later ArithmeticStatistics part.
AnalyticNumberTheoryPartI/PartII supply arithmetic statistics, without the
reverse dependency. ModularityAndLanglandsExtensions remains a downstream
consumer only.

## Repairs

1. The unrestricted rational squareclass height counts both signs. Its leading
   constant is `12/π²`; `6/π²` applies after imposing the positive real-place
   condition. The height-one witness is `[1],[-1]`, versus `[1]` in the
   positive subfamily. The support-ideal, Selmer-fiber and positive-residue
   requirements remain explicit; Northcott alone proves no asymptotic.
2. Replaced obsolete analytic index links with the exact anchors in
   AnalyticNumberTheoryPartII §§5.4–5.7, 5.21, 5.28 and 5.29. The squareclass
   denominator now names AnalyticNumberTheoryPartI §§2.3–2.5,
   GlobalNumberFields Layer 3 and ArithmeticDirichletSeries Layer 9's
   `wienerIkehara`. Its nonnegative coefficients, half-plane summation,
   nonnegative residue and separate continuous boundary remainder are retained.
   The arithmetic squarefree expansion and residue computation stay here.
3. Added the missing rank-two projective-line splitting, bundle index, finite
   double-cover pushforward, degree, section and involution contracts. The
   existing Jacobian cohomology section does not itself supply splitting.
   These targets use AlgebraicVectorBundles' carriers and JacobianChallenge's
   curve theory, and feed the natural bundle law, finite joint mass and theta
   tails. The supporting contract gives its proof route and three computed
   Checks, including the pointless curve.
4. The binary-discriminant added-root identity starts at degree one. At degree
   zero and `f=2`, the stipulated `Δ₁(2x)=1` differs from `Δ₀(2)·2²=4`.
   Homogeneity of degree `2n−2` is explicitly scoped to `n≥2` in the refinement
   API. Leading-zero specializations still use the fixed-degree polynomial.
5. Corrected coefficient reversal: its determinant is `−1`, whose fourth,
   sixth and twelfth powers are all one. It preserves `I,J,Δ`. Both
   `x⁴+xy³` and its reversal have `J=−27`, recorded in README and Lean.
6. The quartic twisted action over an arbitrary ring descends to the projective
   matrix quotient `GL₂(R)/Rˣ`. This is distinguished from all ring-valued points
   of the quotient group scheme; the distinction disappears over fields and Z.
7. A fixed local square-indicator presentation is also nonacceptable relative
   to the reference polynomial `f=1`: nonsquare units have weight zero off the
   empty bad locus. Changing the weights to `1_{f(v) is square}` with `f=1`
   instead gives the acceptable constant-one presentation.
8. Removed the unnecessary infinite-ambient hypothesis from Lean's density
   multiplication theorem to match the README. Empty self-density is zero
   under `0/0=0`, while singleton self-density is one; both are Lean examples.
   Added the empty tower and height-rescaling controls (`c=0` fails Northcott;
   `c=2` counts two naturals below cutoff three).
9. The universal binary Stickelberger argument now precedes specialization to
   an associated order. That order requires degree at least three, nonzero
   leading coefficient and nonzero discriminant; the universal theorem also
   covers degree two and leading-zero forms. A square modulo four polynomial
   depends only on coefficients modulo two, establishing strong divisibility
   at two. Corrected the supporting Appendix A locator to pp.54–55.
10. Replaced forward references for hypersurface coordinates/local residues
    and exact quadratic slices by their local §§0.10 and 0.20 anchors. Added
    the imaginary `q=3,n=2` count `18`, contrasted with the two-squareclass
    count `36`, and the excluded real `n=0` split algebra.
11. Root-of-unity comparison now explicitly retains good admissible type,
    tameness, characteristic coprime to the group order in positive
    characteristic, and the marked reduced cover/infinity data. The
    predicted distribution is marked conjectural. Added `C₄` torsion at
    `q=3,5` and a tame-subfamily denominator example; finite partitions do not
    prove the distribution.
12. The Pell unit radicand keeps discriminant value one by convention, but is
    explicitly excluded from quadratic fields; `x=0,y=1` witnesses its
    negative-Pell solution. Expanded the Lean closing comment to name the
    README definitions omitted because their carriers/constructions are not
    present at the pins.

## Source audit

No target was flagged as having an unverified locator. The reproducible sample
was `random.Random(10273).sample(targets, 15)`, where `targets` is the original
README's 89 bold named target blocks in document order. The following are in
selection order. Page numbers refer to the version specified, not PDF search
snippets. All passages were read; no source passages are reproduced here.

| Target | Source actually read and result |
| --- | --- |
| Wood admissible type | Wood arXiv:1702.04644v2, §1 p.1, §2.2 Proposition 2.2 p.8. Replaced the inaccessible NSF manuscript's published-page locator with this public version. |
| Quartic discriminant is the polynomial discriminant | Bhargava–Shankar arXiv:1006.1002v3, §2 p.7: ordinary coefficients and `27Δ=4I³−J²`. Locator correct. |
| Finite joint bundle mass | Shende–Tsimerman arXiv:1307.8237v1, §4 pp.30–33. Checked Picard classes, joint theta intersections and unconditional versus parity-conditioned mass. |
| Monic local proportions | Ash–Brakenhoff–Zarrabi, §2 p.368; §6 Propositions 6.4, 6.7 and Theorem 6.8 pp.371–372, public author copy [60]. Confirmed the valuation-one probability via the proof and small exhaustive counts. The package's corrected exponent `2−n` is retained. |
| Pointless-curve regression | Shende–Tsimerman §4 pp.30–33 supplies the normalization, not this specific curve. The displayed curve is an independent worked example; its point and divisor counts were recomputed below. |
| Quadratic twist squareclass family | BKLOS public author copy §1 p.1; Burungale–Tian arXiv:2506.03465v2 §1.0.2 and Proposition 1.3 p.2. Checked squareclass versus curve-isomorphism multiplicity. |
| Unpolarized abelian count | Lipnowski–Tsimerman arXiv:1511.02212v1, Introduction §0, Theorem 0.1 pp.1–2. The asymptotic there uses prime fields; the package only defines the general finite-field class count here and separately supplies finiteness. |
| Even-parity classes have half density | Burungale–Tian abstract and Theorem 1.2 pp.1–2. Confirmed the positive squarefree congruence family. |
| Kappa-acceptable specifications | Bhargava–Shankar–Wang I arXiv:1611.09806v3, §4 pp.20–21. Checked eventual allowance outside the discriminant bad locus. |
| Wood average normalizations | Wood v2 §§2.1.1–2.1.2 pp.5–7 and Lemma 2.1 p.7. Checked rigid imaginary and real multiplicities and base-field denominator; replaced published pagination. |
| Family defined by local conditions | Bhargava–Shankar §3 p.22 and §2.5 p.14; BKLOS §2 p.2. Distinct local spaces/measures and finite versus infinite local restrictions retained. |
| Binary quartic form | Bhargava–Shankar §2 (3) p.7 and §2.6 (32) p.16. Checked row substitution and determinant twist; clarified the general-ring projective quotient. |
| Size of the odd-degree quadratic family | Ellenberg–Venkatesh–Westerland, Annals 183 (2016), (8.7.5) p.777, PDF page 49. The two leading squareclasses give `2(q^n−q^(n−1))`; degree one retains the separate `2q` value. |
| Constant rescaling of a height | Bhargava–Shankar §3 opening p.22. Checked `H′=(27/4)H` and the direction of the resulting cutoff. |
| Arithmetic family | Bhargava–Shankar paragraph after (6), §2 p.7, and BKLOS §2 p.2. These motivate the counting conventions; the generic real-valued Northcott interface is the adapter defined here. |

The NSF endpoint [65] timed out and also failed on retry. Every affected
target now points to the successfully read arXiv v2 [50], with its actual
pagination. The old bibliography entry is retained with a public-version
cross-reference. No unverified published pagination is asserted by this review.
Extra source checks included Wood v2 §§1–3 pp.1,5–10, Shende–Tsimerman §4
pp.29–33,38, and Bhargava–Shankar–Wang II §1 p.2 and Appendix A pp.53–55.

## Adversarial mathematics pass

Every original definition, theorem, identity and convention was considered.
Rows group all targets of the named subsection, including their APIs and
Checks; they do not restrict the audit to the sampled source locators.
Exact finite computations are regression evidence, not proofs of universal
or limiting assertions. Existing correct hypotheses and negative controls
were preserved even where no repair was needed.

| Statements checked | Instances and computations | Result and change |
| --- | --- | --- |
| §0.1 Arithmetic family, density, towers, positive lower density, constant/piecewise rescaling, stabilizer mass, comparison of weighted counts | Empty, singleton and infinite carriers; inclusive counts `N:4` and `Z:7` at three; rational absolute height not Northcott; zero scale; sectors with positive constants; `(Z/3)ˣ` acting on zero and one gives stabilizers two and one. | Fixed Lean's unnecessary infinitude for towers; added empty/singleton controls and rescaling witness. Denominator of piecewise limit is positive since every `a_j,c_j` is positive and there is a piece. Normal kernel is required for a quotient action; faithfulness requires the full kernel. |
| §0.2 Local conditions, acceptable weight and primitive-polynomial congruence presentations | Empty and trivial conditions; infinitely many squarefree conditions; coupled CRT conditions; fixed square weights with `f=x` and with `f=1`. | Corrected the false `f=1` nonacceptability counterexample by keeping weights and reference polynomial distinct. No unrestricted product factorization for coupled conditions. |
| §0.3 Quartic form/action, invariants and covariance, discriminant, height, eligible invariants | Zero and leading-zero forms; characteristic three; scalar and reversal substitutions; `x⁴±y⁴`; all 3,125 coefficient tuples in `[-2,2]^5`; nine eligible residue pairs from 729 reduced coefficient classes and 349 explicit integral witnesses in `[-50,50]^2`. | Integral `27Δ` identity survives characteristic three without division by 27. Fixed reversal `J` and the general-ring quotient; ordinary versus determinant-twisted actions remain distinct. |
| §0.4 Elliptic family, invariant normalization, local congruence/large family, eligible heights | Singular `(0,0)` excluded; minimal integral pairs versus arbitrary rational equations; `27/4` height scale; small primes, particularly three; zero-invariant subfamily not large. | All minimality, nonsingularity, primitivity and sufficiently-large-prime guards retained. No change. |
| §0.5 Squareclass height/finiteness and twist models, classes and multiplicity | Unit classes, both signs over Q, the nontrivial class of `i` over Q(i), ideal-class-square obstruction; special `j=0,1728` twist collisions. | The carrier remains nonzero squareclasses, not arbitrary radicands or already-identified curves; exceptional automorphism fibers are explicit. No change. |
| §0.6 Positive squarefree family, Möbius denominator, mod-eight classes, even-parity density | Unit one included and zero excluded; six admissible squarefree residues, each absolute density `1/π²`; three selected residues give half the positive squarefree family. | Absolute and conditional densities remain distinct. Empty tower added in §0.1 also tests the density-composition use here. |
| §0.7 Discriminant-ordered field families, Galois-type selectors and embedded weights | Degree one/discriminant one; degree two; non-Galois cubic has embedding factor three, cyclic cubic factor one. | Algebraic closure and base-embedding choices retained; isomorphism classes are not identified with embeddings. No change. |
| §0.8 Cubic action, cubic ring/algebra and discriminant adapters | Zero and leading-zero forms; scalar two acts by the determinant twist rather than degree-three scaling; basis swap; simultaneous negation of the two normal basis vectors; degenerate algebra not maximal. | Existing import contracts from AnalyticNumberTheoryPartII §§5.4–5.5 retained; fixed their broken links. These are the specified free-lattice/sign and maximality adapters, not a second generic construction. |
| §0.9 Squarefree monic finite-field polynomials | Degree zero gives one, degree one gives `q`, degree two gives `q²−q`. | `q^n−q^(n−1)` remains restricted to degree at least two. No change. |
| §0.10 Coefficient-vector forms, primitive residues, local densities and moments | Empty index sets and degree zero; modulus one; primitive zero vector at modulus greater than one; `σ(x₀²;9)=18/9=2`; CRT. | `σ` is a scaled root count and may exceed one; it is not a probability. Existing formulas retain this normalization. Local adapters now cited by exact anchors. |
| §0.11 Odd quadratic function-field family and its size | Odd characteristic; degree one; nonsquare unit and the distinction between field and split algebra; both leading squareclasses versus Wood's chosen one. | General odd-degree family has factor two, including `2q` at degree one. No change to that formula. |
| §0.12 Monic/binary boxes, weighted coefficients, binary discriminant/local proportions, monic probabilities, strong/weak divisibility, maximality, kappa acceptability | Empty coefficient vector; strict endpoint `[0,4]` at bounds two and three; fixed-degree leading-zero forms; `n=0,f=2`; primes two/three; `x²+9` weak at three versus singular strong locus; `x²−3` locally maximal at three but `x²` not. | Added `n≥1` to the added-root identity and its counterexample. Definitions retain all coefficient perturbations in the strong locus. No prime-two root criterion is inferred from odd-prime criteria. |
| §0.13 Primitive projective hypersurface family and finite local set | Sign-pair quotient; constant equation one has no primitive root modulo two; modulus one singleton; nonzero primitive vectors exclude zero. | No quotient by projective coordinate changes; finite-level solubility is not a p-adic-point theorem. Corrected local §0.10 suppliers. |
| §0.14 Hyperelliptic equation family, odd-root criterion and denominator comparisons | Isomorphic equations differing by square scale stay separate models; one rational double root versus triple/two repeated roots; root at infinity; zero reduction; characteristic two; empty/zero-density denominator. | Odd-prime, multiplicity and positive-denominator guards retained. No conditional-density claim from a zero-density subfamily. |
| §0.15 Negative Pell and the positive squareclass denominator | Radicands `1,2,5,10` admitted, `3,6` excluded; discriminants eight and five; unit negative-Pell solution; both signs at height one; empty and infinite local restrictions. | Distinguished unit convention from quadratic-field discriminant. Corrected `12/π²` versus `6/π²`, and named the analytic suppliers and positive-residue application. |
| §0.16 Unpolarized, principally polarized and polarization-fiber counts | Dimension zero; elliptic canonical polarization; empty fiber; possibly infinite automorphism group acting on a finite orbit set. | Counts remain unweighted rational isomorphism classes. No division of `Nat.card` by an infinite automorphism group and no identification with coarse moduli rational points. No change. |
| §0.17 Natural bundle law and parity tails | `q=1` excluded; at three, masses `1/3,4/9,4/27`; GL₂ orders 48 and 36; inverse GL mass total `1/16`; even tail starts with the exceptional balanced term. | Added missing geometry suppliers. Exact rational-function/geometric-series normalization checked for `q=2,3,5,7`; both parities have mass one half. |
| §0.18 Picard quotient, representatives/carry, finite joint mass, theta tails, parity product, Hecke pushforward and pointless curve | Pic¹ rational without a rational curve point; `#Q=2h`; carry `−1=2 mod3`; negative-degree theta empty; joint parity obstruction; mass `2/9` at `(0,1)` for the odd product at three; Haar translation versus uniform isomorphism-class neighbors; pointless curve below. | Kept unconditional denominator `2h` and conditional denominator `h`. Added explicit bundle-index/involution suppliers instead of assuming them in Jacobian Layer B. |
| §0.19 Outside involutions, admissibility/goodness, type automorphisms, continuous surjections and infinity adapter | Trivial group/swap; identity subgroup not admissible; diagonal `C₂` with swap admissible but not good; type automorphisms versus Aut(H); `C₄→C₂` surjection; full unramified group versus a prime-to quotient; `sqrt(t)` versus nonsquare-leading `sqrt(2t)`. | Embedded rather than abstract types, full unramified extension and explicit infinity rigidifications retained. Eight Wood locators use the accessible v2 pagination across §§0.19–0.21. |
| §0.20 Imaginary and real exact quadratic slices | Imaginary `n=1` gives `q`; imaginary `q=3,n=2` gives 18; real `n=0` is split; infinity contributes one to odd-degree discriminant exponent and zero to the real split case. | Added the second imaginary numeric Check and real degree-zero exclusion. Exact slices stay distinct from cumulative height counts. |
| §0.21 Wood averages and root-of-unity/tame comparison | Empty numerator/base; fixed quadratic-base denominator; real factor `|c(H)|`; reduced multipliers `C₃,C₄`; `q−1` versus characteristic; numerator two over tame base two versus total base four. | Added explicit comparison hypotheses and two discriminating Checks. Distribution remains conjectural; partition identities alone assert no average. |
| §0.22 Symmetric pencil, discriminant refinement and binary-form order/lattices | Size zero determinant one, size one signs `(a,−b)`, size three sign minus; quotient-scheme points versus matrix quotient; nonunit leading coefficient in the lattice; separable product algebra rather than field; trace dual needs invertible derivative in the total algebra. | Restricted discriminant homogeneity to `n≥2`; kept all nonzero-leading-coefficient/discriminant hypotheses for the order. No use of that order in degree two or leading-zero cases. |
| §0.23 Binary Stickelberger and monic local formulas | All 64 quadratic coefficient classes modulo four; every modulo-two perturbation of a discriminant divisible by four; degree zero/one, primes two/three/five; exhaustive monic coefficient classes modulo `p²` up to degree four at three. | Universal proof replaces the overly narrow order-first route. Retained the corrected `2−n` local exponent; values listed below agree with counts. |
| §0.24 Monic Euler products | Degree two gives `4/π²`, local factor at two is one half; higher-degree defect bounded by a summable `O(p⁻²)` majorant. | Positive factors and convergence retained. Limit in degree uses a uniform majorant, and global-density identification still requires its tail theorem. No change. |
| Supporting bundle geometry | `O(3)⊕O(1)` index two and unchanged on tensoring by `O(−1)`; degree-two genus-zero pushforward types `(0,−1)` and `(0,0)`; theta zero/negative/pointless cases. | Added real target statements, APIs, proof routes, source locators and three Checks. Generic bundle/cohomology carriers are imported. |
| Supporting squareclasses, abelian finiteness, function fields and hypersurface adapter | Unit/Selmer and class-square fibers; prime powers not just prime fields; divisor removed-place degree and three infinity types; monomial coordinates at dimension/degree zero. | Existing prerequisite chains retained. Squareclass analytic suppliers clarified; Honda–Tate and finite ideal/polarization orbit inputs are not claimed as elementary counting consequences. |

For the pointless curve, over F₃ the right side is always two, and its leading
coefficient is nonsquare, so neither affine nor infinite rational points
exist. Over F₉, direct enumeration in `F₃[u]/(u²+1)` gives fourteen points.
There are seven rational effective degree-two divisors, all coming from
conjugate pairs. The canonical pencil accounts for four such divisors and
every other effective degree-two class has one; hence `#J=7−4+1=4`.
The degree-zero/one representatives in `Q` then give masses
`μ_C(0)=1/2, μ_C(1)=3/8, μ_C(3)=1/8`. These are finite regression values,
not the asymptotic natural bundle law.

The monic exhaustive check evaluates the integer resultant discriminant on
every coefficient tuple modulo `p²`, then counts valuation zero and exactly
one. Results `(ν₀,ν₁,λ)` were:

| Degree, prime | Exact values |
| --- | --- |
| 2, 2 | `(1/2,0,1/2)` |
| 2, 3 | `(2/3,2/9,8/9)` |
| 2, 5 | `(4/5,4/25,24/25)` |
| 3, 2 | `(1/2,0,1/2)` |
| 3, 3 | `(2/3,4/27,22/27)` |
| 4, 2 | `(1/2,0,1/2)` |
| 4, 3 | `(2/3,8/81,62/81)` |

## Current-library and roadmap duplication audit

The pinned API check used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The current read-only check used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Searched by carriers, hypotheses, operations and mathematical objects, not
only proposed declaration names. Checked all nine newer roadmaps named by
WORKERS and the four newer Completed roadmaps, and read the relevant bundle,
orthogonal, lattice, profinite and restricted-product contracts. Also read the
current library's Northcott counting, squareclass/Selmer, discriminant,
quadratic-integer, wreath-product, abelian-variety, finite-quadratic-module
and moment-determinacy declarations relevant to these targets.

No additional target removal was warranted. Existing boundaries continue to
defer generic squareclass quotients/Selmer finiteness, natural-height counts,
wreath products, restricted products, scalar moment determinacy, quadratic
forms and generic geometry to their owners. The retained arithmetic family
now explicitly differs by allowing real-valued heights. The free cubic
coefficient/basis and maximality adapters are imports of
AnalyticNumberTheoryPartII's general cubic objects. Quartic arithmetic
invariants/actions are not a second construction of generic orthogonal
groups. The new bundle contract uses AlgebraicVectorBundles' existing
finite-locally-free carriers; rank-two splitting on P¹ and the statistical
pushforward formulas were not found there or in JacobianChallenge.

At the pin `TauCeti.Order.Northcott` is the correct import; its current
successor is `TauCeti.Order.Northcott.Basic`. Likewise the pinned wreath
product module predates the current `WreathProduct.Basic` layout. No current
API was assumed to exist at the old pins, and no build was run in the
read-only checkouts.

## Lean signatures and validation

Compared these ten declarations with the README, including degenerate cases:

| Signature | Agreement checked |
| --- | --- |
| `ArithmeticFamily` | Real height, Northcott field, already chosen class/representative carrier. |
| `ArithmeticFamily.count` | Unweighted finite sublevel count, inclusive cutoff. |
| `ArithmeticFamily.HasRelativeDensity` | Intersection numerator, ambient denominator, real cutoff and zero-division convention. |
| `ArithmeticFamily.relativeDensity_mul` | Two nested inclusions and product of the two densities; no extra infinitude assumption. |
| `Coefficients.boxHeight_count` | Integer coefficient cube, inclusive bound, arbitrary dimension including zero. |
| `Coefficients.monicPolynomial` | Descending coefficients and empty tuple giving one. |
| `Coefficients.weightedBox` | Strict real inequalities with exponent `i+1`; no inclusive endpoint substituted. |
| `Coefficients.binaryValue` | Fixed homogeneous degree, root at infinity and degree-zero constant. |
| `Coefficients.StrongSquareDivides` / `WeakSquareDivides` | Every integral coefficient perturbation by `p`; weak includes divisibility and excludes strong. |
| `BinaryQuartic.twentySeven_mul_disc` | Integral identity over every commutative ring, including characteristic three; no inversion of 27. |

All data definitions have real bodies. No theory constructions, chains of
auxiliary proofs, conclusion-as-hypothesis placeholders or sorry-defined
data are added. The closing comment names the README definition groups not
represented on pinned carriers.

- `lean-check` on Part I Suggested.lean: exit 0; 40 warnings, all
  `declaration uses 'sorry'`; zero errors or other warnings. The shared build
  has Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded the
  20 GB requirement. One Lean check ran at a time; none was left running.
- `scripts/check_blueprint.py` on `ArithmeticStatistics.json` and
  `ArithmeticStatistics--ST.0.json`, with `--json`: exit 0, zero errors and
  zero warnings on both. Existing packet requests are not represented as
  completed formalizations by this review.
- Exact rational/integer computations described above passed; no floating
  approximations were used to decide equality or probabilities.
- Final local Markdown check: zero missing files or anchors. The accepted-original
  inventory retains all 744 anchors exactly once across eight parts and all 92
  original Part I anchors. README size is 248,413 bytes (limit 350,000);
  Suggested.lean has 208 lines (limit 5,000). `git diff --check` passes.
- `python3 research/blueprint/intake.py check-files` on the five deliverables:
  `5 file(s), 0 problem(s)`.

## Handoff

No uncorrected package-review defect remains. The full README targets and
their conditional/conjectural status remain the specification; this job does
not implement their proofs. No packet edit, ownership move, later-part edit
or upstream patch is needed for these fixes. Future formalization should use
the explicit bundle-geometry support contract before its probability and
theta-tail targets, and prove the squarefree support expansion/residue before
using its positive denominator. Source and finite-computation details needed
to reproduce the review are in this report; no scratch file is needed.

## Public-source access register

The following register identifies the public PDF bytes fetched during this
review. Access date for every successful fetch: **2026-10-17**. It is a fetch
register, not a claim that every page of every PDF was read. The source-audit
table specifies the passages actually checked. Bibliography numbers are those
of the package. The failed [65] fetch has no file hash.

| Reference | Public PDF | SHA-256 |
| --- | --- | --- |
| [1] | [PDF](https://arxiv.org/pdf/1006.1002v3) | `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf` |
| [2] | [PDF](https://arxiv.org/pdf/2506.03465v2) | `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664` |
| [3] | [PDF](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf) | `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880` |
| [4] | [PDF](https://arxiv.org/pdf/1402.0684) | `53a397818face350217fd47e3ae056ae62fa2d3598c1f70cbd36950f4370606d` |
| [5] | [PDF](https://arxiv.org/pdf/1005.0672) | `d45b16cdb6b34655634f4305416ad68083d6e6e5674907aefc85a30ac8937f74` |
| [7] | [PDF](https://people.math.harvard.edu/~gross/preprints/cubquat.pdf) | `da732e0f110a06386c4fca01d3bbaa82017aafa6716a60a5ba7c6ae4e3a391d5` |
| [8] | [PDF](https://www.math.utoronto.ca/~ila/GanGrossSavin.pdf) | `007efcf17a30ff33857dfd8cc2f58a7d203c8c5c6794703d4acb76c2225c99f8` |
| [37] | [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf) | `6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6` |
| [46] | [PDF](https://arxiv.org/pdf/2006.02356v1) | `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb` |
| [50] | [PDF](https://arxiv.org/pdf/1702.04644v2) | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |
| [57] | [PDF](https://arxiv.org/pdf/1310.7692v2) | `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2` |
| [58] | [PDF](https://arxiv.org/pdf/1611.09806v3) | `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83` |
| [59] | [PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) | `b6e5d1701f487b813e9d6a0b26f9b8671c02c414996298cbba71fe5060e90740` |
| [60] | [PDF](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd) | `b82ee8c71656e034511a5d0d618d359b2dbf13a7f0a5a3e743f9fa12c7de7386` |
| [62] | [PDF](https://arxiv.org/pdf/2201.13424v1) | `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd` |
| [63] | [PDF](https://arxiv.org/pdf/1511.02212v1) | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |
| [64] | [PDF](https://arxiv.org/pdf/1307.8237v1) | `542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29` |
| [65] | [PDF](https://par.nsf.gov/servlets/purl/10152050) | `fetch failed: timeout` |
| [67] | [PDF](https://eprints.gla.ac.uk/292484/1/292484.pdf) | `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1` |
| [72] | [PDF](https://arxiv.org/pdf/1007.5501v2) | `043b681e2aabae78bc16e6e04e880514eb3ecabbec5f4e4a97739a981977bc2b` |
