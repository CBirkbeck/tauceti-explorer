# Independent review: HabiroNahmSeries, HB.8

Job `REV-HabiroNahmSeries--HB.8`, [issue #6461](https://github.com/CBirkbeck/tauceti-explorer/issues/6461).
Reviewer: Codex, session `codex-r4sILd`, 6 October 2026. The blueprint was written
by the separate session `codex-ZdJYz2`; I did not participate in that work.

**Accepted after the corrections below.** This is acceptance of a complete
target-level planning pass. HB.8 remains **planned**, with three explicit gaps,
and every implementation status remains `unchecked`. The elementary residue
and finite-support proof outlines are justified; the Gaussian comparison and
corrected level-m extension are conditional specifications with open inputs.

## Counts and disposition

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 15 | 15 |
| Theorems / constructions / comparisons | 9 / 3 / 3 | 9 / 3 / 3 |
| Construction API items | 15 | 16 |
| Unit tests | 12 | 12 |
| Planets | 6 | 6 |
| Baseline declarations | 13 | 13 |
| Gaps / requests | 3 / 0 | 3 / 0 |
| Local source issues | 1 | 1, confirmed |
| Closed / planned stages | 0 / 1 | 0 / 1 |

The packet contains an individual verdict for every node: nine verified and six
corrected. No node was added, removed or split, and no baseline citation was
removed. At target level, the signed induction, orbit identification and
proper-divisor cancellation belong in their respective theorem proof outlines.
All stage targets are accounted for by the packet's imported targets or its
refinements. There is no unresolved contradiction in the proposed statements.

## Sources and precise corrections

I read the passages cited by all fifteen nodes and checked their locators and
excerpts against the public versions:

- [GSWZ, *The Habiro ring of a number field*, v2](https://arxiv.org/pdf/2412.04241v2):
  §§1.6–1.7 and 2.1–2.7, including Lemmas 2.6–2.9, Theorems 6–8, the
  Bernoulli expansion (59), normalization (114), and affine calculation
  (137)–(139). All fifteen GSWZ excerpts are literal substrings of the
  [v2 TeX source](https://arxiv.org/src/2412.04241v2).
- [Kontsevich–Soibelman, v2](https://arxiv.org/pdf/1006.2706v2): Definition 19,
  Theorem 9 and its proof in §6.9, including Proposition 13. The integer
  quadratic twist covers arbitrary symmetric integer matrices.
- [Efimov, v2](https://arxiv.org/pdf/1103.2736v2): introduction and Theorem 1.1.
  Quiver arrow counts are nonnegative; this source alone would not justify
  signed matrices. Neither cohomological Hall algebra theorem is used as an
  unplanned prerequisite of the elementary proof.
- [Garoufalidis–Storzer–Wheeler, v2](https://arxiv.org/pdf/2305.14884v2):
  §§3.1–3.2, Lemmas 3.1–3.3. I checked the actual affine Gaussian and
  recentering formulas, rather than relying on the later citation to them.
- [Århus integral II, v4](https://arxiv.org/pdf/math/9801049v4): §§2.1–2.2,
  Definition 2.6 and Proposition 2.13 with its block-matrix proof. Block
  Fubini supports Gaussian recentering; it does not prove t-regularity.

The five independently downloaded PDF hashes match `sources` and
`sourceVersions`. The recorded TeX hash matches the extracted `text131.tex`
file, not the downloadable archive's hash. No required source remains unread.

Edits made in the permitted packet and suggested file:

1. **Signed-shift source locator:** replaced (89)–(90), pp. 24–25, by (89),
   p. 25, with (83)–(84), p. 24, as context. Equation (90) starts the next
   lemma and does not supply the signed-shift argument.
2. **Orbit-ratio locator:** the quotient definition is (83), not (84).
3. **Gaussian-shift locators:** Lemma 2.15, (137)–(139), is on p. 32, not
   p. 33. The cited GSW Lemmas 3.1–3.2 are on p. 10.
4. **Finite-support locator:** the relevant range is (81)–(89), pp. 24–25;
   (90)–(92) belong to the subsequent restricted-decomposition lemma.
5. **Local Gaussian hypotheses:** replaced the irrelevant common matrix
   hypotheses with m positive, a primitive root, formal variables, the
   Bernoulli interpretation and the positive-weight coefficient completion.
6. **Restricted integrality proof:** elimination needs powers
   `E_{n,i}^{c_i}` for arbitrary `c_i ∈ Z[1/m]`. I supplied the binomial
   integrality argument at every prime not dividing m and explained the
   lower q-bound, fixed-degree q-adic product and outer t-adic product.
7. **Restricted API:** added `restrictedCoeffs_mul`, with constant-one
   hypotheses, and its matching Lean signature. Logarithmic additivity and
   uniqueness justify this pointwise additive multiplication law.
8. **Baseline prose:** removed the stale assertion that `PowerSeries.logOf`
   was “added separately.” The cited `PowerSeries.log` supplies the fixed
   univariate logarithm; multivariate composition uses `PowerSeries.subst`.
9. **Erratum evidence:** replaced the paraphrase in `EHB8-1.printed` with
   literal formula fragments and added this review's confirmation and search
   record. Added the top-level acceptance and all fifteen node verdicts.

The reader document and accepted parent packet are outside this review's
deliverables. They were read but not edited. The packet and suggested file
contain the added API and the authoritative corrections recorded here.

## Mathematical closure checked

For the elementary chain, simultaneous total-degree induction in every
coordinate proves Laurent integrality of the forward ratios. Negative steps
are inverses of shifted constant-one ratios, so signed paths preserve the same
coefficient ring. This avoids assuming positivity of the matrix or omitting
off-diagonal shifts.

Writing `H = log F_A`, each coordinate gives
`log G_j = (q^{n_j}-1)H_n`. Thus a nonzero pole of `H_n` is simple and its
order divides every nonzero coordinate of n. At a primitive m-th root, the
orbit logarithm vanishes off the m-divisible multi-indices. Dividing the
order-m difference equation by `F_A` before specialization gives the Nahm
system, with phase `(-1)^{A_jj}` for both parities of m. Nahm uniqueness then
identifies the orbit ratios. Euler derivatives determine the zero-constant
potential and its all-root residue, with scale `zeta/m^2`, without Gaussian
identification.

I checked the formal derivative of the critical-value formula: the Nahm
identity converts `d log(1-z_j)` into `d log t_j + Σ_i A_ij d log z_i`, and
matrix symmetry cancels the quadratic terms. The constant term is zero. The
polylogarithm definition and distribution relation remain imported from
Polylogarithms P.1.

For finite support, the imported integral plethystic logarithm and pole-location
lemma supply integral numerators with q-integer denominators. At a primitive
a-th root with `n = a b`, the proper-divisor contributions reproduce
`zeta V_b/a^2`. The only additional possible term is the residue of `L_n`
from the divisor one, so it must vanish. Induction removes every candidate
cyclotomic pole. Monic polynomial division then gives integer Laurent
coefficients, not merely rational Laurent coefficients. Finite support is
the finite Laurent support of each `L_n`.

For congruence uniqueness, the eigenvalue
`D_j(k+m b) = ∏_{s=0}^{m-1}(1-q^{k_j+m b_j-s})` vanishes at the initial
coordinate `b_j=0` and is nonzero when `b_j>0`. Induction on `|b|` works in
every rank, including after Laurent expansion in `K((x))`. It does not invert
the constant term of `D_j` in `K[[x]]`.

For the restricted decomposition, the divisor-one term determines `L_n` from
smaller total degrees. Inclusion-exclusion expresses its elementary factor
as Pochhammer factors with exponents `mu(d)/d`; the corrected arbitrary-power
argument proves integral coefficients in `Z[1/m]((q))`. Mixed monomials need
no distinguished coordinate.

I independently recomputed exact rational coefficients in small cases:

- Five signed shifts `(1,0), (-1,0), (0,1), (0,-1), (2,-1)` for
  `A=[[-1,2],[2,-2]]` have integral Laurent coefficients through total degree
  four.
- For `A=[[2,1],[1,1]]`, both the ratio coefficient and `L_(1,1)` are `-q^3`.
- The potential coefficients for `A=(3)` and `A=(-1)` agree through degree
  four with the packet's values.
- The congruence recurrence holds through increment degree `2m` for
  `(A,m,k)=((1),3,2)`, the negative-entry matrix with `m=2,k=(1,0)`, and
  the mixed matrix with `m=3,k=(2,1)`.
- All mixed-monomial restricted-Adams tests agree. For `A=0,m=2,k=0`, the
  reindexed coefficient `L_2` has the stated uncancelled `Phi_4` pole.

These calculations check signs, indices and counterexamples; they are not
proofs of the general statements or formal Lean implementations.

## Gaussian error and remaining obligations

`HabiroNahmSeries/EHB8-1` is **confirmed against v2, equation (114)**. Splitting
the Pochhammer product modulo m gives leading logarithm

`Li_2(u^m exp(mw))/(m^2 h)`.

Its linear and quadratic terms are `Li_1(u^m)w/(m h)` and
`Li_0(u^m)w^2/(2h)`. The Bernoulli constant term requires the opposite sign
from the printed added constant. For `m=1,k=0`, the printed logarithmic
remainder still contains `-Li_0(u)w^2/(2h)` and `-log(1-u)`. Even after fixing
these, the cubic `w^3/h` term disproves membership in `1+x` times the printed
ring; `w^3/x^2` is not in that ring. The positive-weight augmentation
completion is the appropriate local replacement.

The [arXiv version history](https://arxiv.org/abs/2412.04241),
[Scholze's publication list](https://people.mpim-bonn.mpg.de/scholze/papers.html)
and [MPIM record](https://archive.mpim-bonn.mpg.de/id/eprint/5146/), together
with the recorded title/errata searches, yielded no later version or separate
public correction. This finding concerns the local formula and completion;
it does not show that the global Gaussian theorem is false.

The packet correctly retains:

- **G1:** propagate that local repair through all global Gaussian prefactors
  and prove the specialized shift identities.
- **G2:** prove cancellation and separate-coordinate t bounds after Wick
  contraction and congruence summation, then justify the change of completion.
  The covariance identity is valid, but a determinant bound cannot replace
  this argument; the no-leg `h Li_0(1-t)/12` term already has a pole.
- **G3:** finish the corrected level-m ratio/denominator induction, stability
  under coprime Adams pullbacks, forbidden-root cancellation and the value
  assertion at primitive m-th roots. The `k_j` dependence must be retained.

These gaps are attached to all affected nodes. The restriction
`c=ma, gcd(a,m)=1` prevents an invalid application at `c=4,m=2`. Parent
Gaussian specifications with the same gaps are not treated as proved inputs
of the elementary finite-support chain. The inherited source issues remain
references to the reviewed parent findings rather than duplicate errata.

## Baseline, ownership and prototypes

I read all thirteen declaration statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The following are confirmed in
the packet's cited modules; line numbers refer to that commit.

| Declaration | Line | What its statement supplies |
| --- | ---: | --- |
| `LaurentPolynomial` | 84 | `AddMonoidAlgebra R ℤ`; finite Laurent support |
| `LaurentSeries` | 102 | Hahn series with integer exponents |
| `MvPowerSeries` | 86 | Multivariate formal coefficient carrier |
| `MvPowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top` | 357 | Multipliability when orders tend to infinity |
| `MvPowerSeries.rescale` | 634 | Coefficientwise rescaling ring homomorphism |
| `Polynomial.cyclotomic` | 230 | Cyclotomic polynomial definition |
| `PowerSeries.log` | 50 | Fixed `log(1+X)` over a rational algebra |
| `PowerSeries.subst` | 158 | Univariate-to-multivariate substitution |
| `RatFunc` | 67 | Fraction-field carrier over a commutative ring |
| `PowerSeries` | 60 | `MvPowerSeries Unit` |
| `MvPowerSeries.expand` | 35 | Algebra map substituting powers, with m nonzero |
| `RatFunc.eval` | 143 | Reduced numerator/denominator evaluation |
| `IsPrimitiveRoot` | 63 | Exact primitive-root convention |

The multipliability theorem supplies the outer t-adic product after grouping
finite sets of a fixed degree; it does not justify the inner fixed-degree
q-adic product. Substitution is used with zero constant term. Rational
evaluation is used only after pole-freeness is known and is not asserted to
be a homomorphism on all rational functions. Signed rescaling uses the
nonzero q in `Q(q)`. These conventions match the uses.

I read the statements of all 21 distinct external blueprint prerequisites,
including the accepted parent HB.8 and HB.4 nodes and the Polylogarithms P.1
suppliers. The audited HB.8 layer is not built at the pinned baseline. Generic
products, polylogarithms and the Gaussian operator keep their existing owners;
this packet refines their uses and does not plan a second general theory.
The elementary dependency chain does not use the parent finite-support
theorem as an input.

All three construction APIs give usable characterization or uniqueness,
relations and compatibility. Each has four tests, including boundary cases
and sign/scale-sensitive computations. All twelve tests and all sixteen API
items match the suggested file. The six planets are central constructions or
named results within the permitted limit.

The file gives typed prototypes for nine target declarations. Its six
Gaussian/level names remain explicit comments because the required coefficient
completions and parent localization interfaces are unresolved. The completed
`Z[1/m]((q))` assertion likewise awaits the parent inclusion/product interface;
the rational restricted construction and its API are typed. This follows
PROTOCOL §13's honest omission rule: there are no invented proposition-valued
conditions. Imported data-valued adapters are marked as prototypes, not built
library modules. Elaboration therefore confirms signatures, not mathematics.

## Validation and orchestrator disposition

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.8.json`:
  **0 errors, 0 warnings**.
- `scripts/check_errata.py` on an errata-v1 wrapper of the source issues and
  versions: **passed**.
- `lean-check` on the revised suggested file: **exit 0**, with only
  `declaration uses sorry` warnings, against the pinned Mathlib build.
- Exact rational coefficient checks described above: **passed**.
- Deliverable-path intake check and `git diff --check`: **passed**.

No orchestrator clarification is needed to accept this pass. Continue the
existing Gaussian and corrected level-m work at G1–G3; do not mark HB.8 closed
or interpret this acceptance as a formalization claim. No promotion or edits
to integrated atlas data were made by this review.
