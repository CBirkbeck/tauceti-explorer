# Independent review: Polylogarithms, P.3, revision round 2

**Accepted.** Claude (Opus 5.5), session `claude-xDizZM`, reviewed issue #7066 on 2026-10-08.
The plan was written by Codex session `codex-mZTIGY` and revised by Codex session
`codex-IkzlXJ`; the first review, `REV-Polylogarithms--P.3` (needs changes), was by
Codex session `codex-ThUx40`. This session did none of that work. The review pass is
complete; it is not a checkpoint. Every implementation status remains `unchecked`.

The revision did what the first review asked: every API item, test and named theorem now
has a signature on the actual quotients and complexes, and the file elaborates. On reading
the sources again I found one thing both earlier rounds had passed over: the plan had
copied a wrong constant from Goncharov–Rudenko's Proposition 7.2 into two statements. I
corrected it everywhere, reclassified one source finding, added three, and repaired
locators, hypotheses and placeholder text. With those corrections the plan is right as far
as it goes, and its six gaps are stated honestly.

## Counts

| Item | Revision as submitted → as reviewed |
|---|---|
| Nodes | 27 → 27: 10 constructions, 2 definitions, 13 theorems, 2 comparisons |
| Node verdicts | 15 verified, 12 corrected, none unverifiable, none added |
| API items | 68 → 73 (five added to generic vector configurations) |
| Unit tests | 37 → 37; every definition and construction has at least three |
| Named theorems | 15 → 15, all with signatures |
| Baseline citations | 44 → 44, all confirmed at the pinned Mathlib; none removed |
| Source findings | 5 → 8: one rejected, seven confirmed; one reclassified |
| Gaps / requests | 6 / 5 → 6 / 5; the first gap is restated more narrowly |
| Coverage | one stage, planned, not closed |
| Planets | 2 → 3 in this part (5 in the layer with the parent's two) |

## What the first review asked for

1. *Faithful signatures in place of comments and arbitrary-module claims.* Done. All 68
   API names, 37 tests and 15 theorem names of the revised packet are declarations or
   examples in the suggested file, stated on rational `Finsupp` quotients for B₂ and B₃,
   the actual complex Γ, the actual L₃ and actual configuration modules. I checked the
   names by script and read every statement.
2. *Discriminating tests for the comparison, the transfer, the geometric quotient, the
   Bigrassmannian and duality.* Done: the stable fixture excludes the zero comparison, the
   quadratic test uses the real restriction map, the triangle representative is concrete.
3. *Reader synchronised with the packet.* It had been; I regenerated its declaration
   blocks from the corrected packet and rewrote the passages my corrections touch.
4. *Keep the lifting and normalisation gaps explicit.* Done, and see below: the
   normalisation gap is now narrower and its constant is right.

## Corrections made in place

1. **Normalisation against M₃.** The packet stated that the unnormalised alternation of
   M₃ is (3/2)·Alt₆[T]₃, hence r₆=−(2/15)·Alt₆M₃=−96·M₃. The correct statements are
   M₃=−(1/90)·Alt₆[T]₃ on generic six-tuples, Alt₆M₃=−8·Alt₆[T]₃ and r₆=18·M₃=(1/40)·Alt₆M₃.
   Changed in the statements of `geometric-trilogarithm-comparison` and
   `configuration-borel-class`, in proof steps of those nodes and of
   `seven-term-configuration-relation`, in the first and fifth gaps, in the coverage list,
   in the request to BorelRegulators R.7, in the reader, and in the suggested file
   (`geometric_trilogarithm_comparison` and the configuration cochain). Evidence is in the
   next section.
2. **E-P3-05 reclassified.** It was recorded as an error in GR (144) affecting a stated
   result. The formula (144) is right for the normalisation GR actually use, their (167);
   what is off by a sign is the square (143) with the face signs displayed on p. 62. The
   entry is now a misprint affecting nothing, with the original allegation kept. The
   packet's own coefficient −1/5 is unchanged and correct for its zero-based faces; the
   node `triple-ratio-map` now says this as a convention and no longer as a source error.
3. **Three source findings added**: E-P3-06 (the constant of GR Proposition 7.2), E-P3-07
   (a sign in step (e) of the construction of M₃, Gon95 p. 287) and E-P3-08 (the order of
   the triangle generator, Gon95 p. 211).
4. **Hypotheses.** `seven_term_configuration_relation` and
   `configuration_chain_comparison` were stated for every field in the suggested file; the
   packet and the sources require an infinite field. Added `[Infinite F]`.
5. **Locators.** Theorem 1.1 of Gon95 is on p. 203, not p. 198 (`every-family-special-value`).
   Theorem 6.3 is on p. 296, not p. 297 (two nodes). The weight-three bicomplex is (6.3)–(6.4),
   not (6.2). The definition of generic configurations in GR is on pp. 61–62 with (129);
   (126)–(128) belong to another section. Most other locators were sharpened to the page
   and display.
6. **API.** Deletion and projection of configurations were data with no evaluation rule.
   Added `configDelete_mk`, `configProject_mk`, and listed `configLift_mk`,
   `configFieldMap` and `configFieldMap_mk`, which the suggested file already had, in the
   packet. Added `projectiveDual_generic` to the suggested file so that the projective dual
   used in `trilogarithm_duality` is tied to the vector-configuration dual.
7. **Placeholder text.** Fourteen nodes carried a stock sentence as an acceptance test,
   ten of them as their only one, and all twelve definitions and constructions had a
   single `uses` entry whose `how` was a stock sentence. Replaced with specific checks and
   with the places where each object is used. The seven-term node's acceptance fixture,
   seven points of the moment curve, tests nothing (six points on a conic give zero after
   the cobracket); replaced.
8. **Statements sharpened.** `coordinate-relation` now says how its admissible locus
   differs from the generic seven-point locus of Gon95 (1.10): a, b or c equal to 1, or
   abc=−1, are specialisations. `middle-configuration-map` records r₅=18·f₁,
   `projected-cross-ratio` that Goncharov's 1995 cross-ratio is the inverse, and
   `geometric-trilogarithm-presentation` that GR's conventions, not those of Gon95
   Definition 1.5 as printed, are the consistent ones.
9. **Planet.** Proposed **Triple ratio** on `triple-ratio-map`, the source's name for the
   central explicit formula. The two existing planets are kept.
10. **Housekeeping.** A stale comment in the suggested file said a lemma was not stated
    that is stated a few lines below; removed. The packet summary no longer describes a
    pending review. The first review object is kept in `reviewHistory`, and each source
    finding keeps its earlier verdict in `earlierReviews`.

## The normalisation against M₃

The three configuration maps of the plan are exactly 18 times Goncharov's 1995 maps:

- r₄=−3·Alt₄=18·f₀ (Gon95 p. 264). Exact identity in the exterior cube.
- r₅=18·f₁ (Gon95 (3.5), p. 266). His sum has coefficient −1/3 and his cross-ratio (1.6) is
  the inverse of GR's (135); alternating over the four projected vectors gives a factor 6.
  Checked after δ₂⊗1 in every prime coordinate on three rational five-tuples.
- r₆=18·M₃ on generic six-tuples, with M₃ normalised by T(z)↦[z]₃ and the relations of
  GR §7.3. This is the statement the plan had wrong.

Two independent arguments give the constant.

*Cobracket.* Gon95 defines the cobracket on the geometric group as f₁∘d on generic
configurations (p. 269) and Theorem A (p. 293) makes M₃ an isomorphism of complexes, so
δ₃M₃=±f₁∘d. The left square, checked in exact coordinates, is δ₃(−(1/5)·Alt₆[T])=r₅∘∂=18·f₁∘d.
Hence |Alt₆[T]|=90·|M₃| under δ₃, and the unnormalised alternation of M₃, which is 720·M₃,
is ±8·Alt₆[T]. GR Proposition 7.2 prints 3/2.

*Direct evaluation.* The script below computes L₃∘M₃ from the seven-term relation and R3
alone. It reproduces T(z)↦L₃(z), so the relations are consistent with the normalisation;
the value on a generic six-tuple does not depend on the auxiliary intersection point; and
its ratio to the L₃-value of Alt₆[T] is −1/90 to ten digits. Near the triangle T(z) the
generic values tend to L₃(z). GR's Lemma 7.4, the source of the 3/2, is itself right: its
two terms skew-symmetrise to −1/2 and 1 times Alt₆[T]. The proposition drops the
coefficients with which such terms enter M₃.

```python
import cmath, math, random
from fractions import Fraction as Q
from itertools import combinations, permutations

def bernoulli(n):
    B = [Q(1)] + [Q(0)] * n
    for m in range(1, n + 1):
        B[m] = -sum(math.comb(m + 1, k) * B[k] for k in range(m)) / (m + 1)
    return B
B = bernoulli(142)
Z2, Z3 = math.pi ** 2 / 6, 1.2020569031595942854

def li(s, z):                      # principal branch of Li_s, s = 2, 3
    if abs(z) <= 0.5:
        return sum(z ** k / k ** s for k in range(1, 80))
    mu = cmath.log(z)              # expansion in log z, valid for |log z| < 2 pi
    tot = mu ** (s - 1) / math.factorial(s - 1) * (sum(1 / j for j in range(1, s)) - cmath.log(-mu))
    term = 1
    for k in range(140):
        if k:
            term *= mu / k
        if k != s - 1:
            j = s - k              # zeta(j): zeta(3), zeta(2), or -B_{1-j+1}/(1-j+1) for j <= 0
            tot += (Z3 if j == 3 else Z2 if j == 2 else -0.5 if j == 0 else float(-B[1 - j] / (1 - j))) * term
    return tot

def L3(z):
    z = complex(z)
    if z == 0: return 0.0
    if abs(z - 1) < 1e-300: return Z3
    if abs(z) > 30: return L3(1 / z)
    l = math.log(abs(z))
    return (li(3, z) - l * li(2, z) - l * l / 3 * cmath.log(1 - z)).real

det = lambda a, b, c: a[0]*(b[1]*c[2]-b[2]*c[1]) - a[1]*(b[0]*c[2]-b[2]*c[0]) + a[2]*(b[0]*c[1]-b[1]*c[0])
sgn = lambda p: (-1) ** sum(p[i] > p[j] for i in range(len(p)) for j in range(i + 1, len(p)))
cross = lambda u, v: [u[1]*v[2]-u[2]*v[1], u[2]*v[0]-u[0]*v[2], u[0]*v[1]-u[1]*v[0]]

def T(v):                          # triple ratio |124||235||136| / (|125||236||134|)
    m = lambda i, j, k: det(v[i], v[j], v[k])
    return m(0,1,3)*m(1,2,4)*m(0,2,5) / (m(0,1,4)*m(1,2,5)*m(0,2,3))
alt = lambda v: sum(sgn(p) * L3(T([v[i] for i in p])) for p in permutations(range(6)))

def r(p, a, b, c, d):              # r'(a,b,c,d) projected from p
    m = lambda x, y: det(p, x, y)
    return m(a, c) * m(b, d) / (m(a, d) * m(b, c))
Tp = lambda z: -L3(z) - 2 * L3(1 - z) + Z3
typeB = lambda y: sum((-1) ** i * Tp(r(y[5], *[y[k] for k in range(5) if k != i])) for i in range(5)) / 3
typeC = lambda l: sum((-1) ** (i + j) * Tp(r(l[3 + j], *([l[k] for k in range(3) if k != i] + [l[3 + k] for k in range(3) if k != j])))
                      for i in range(3) for j in range(3)) / 3

def degenerate(pts):               # type B or C in any order, by skew-symmetry
    col = [t for t in combinations(range(6), 3) if abs(det(*[pts[i] for i in t])) < 1e-9]
    if len(col) == 1:
        order = list(col[0]) + [i for i in range(6) if i not in col[0]]
        return sgn(order) * typeC([pts[i] for i in order])
    s, t = col
    c = (set(s) & set(t)).pop()
    order = [i for i in s if i != c] + [c] + [i for i in t if i != c] + [i for i in range(6) if i not in set(s) | set(t)]
    return sgn(order) * typeB([pts[i] for i in order])

def M3(six, extra):                # seven-term relation for six + [extra]
    seven = six + [extra]
    return -sum((-1) ** i * degenerate(seven[:i] + seven[i + 1:]) for i in range(6))

random.seed(1)
rnd = lambda: complex(random.uniform(-2, 2), random.uniform(-2, 2))
z = 0.37 + 0.52j
tri = [[1,0,0], [0,1,0], [0,0,1], [1,1,0], [0,1,1], [-z,0,1]]
print(M3(tri, [rnd() for _ in range(3)]), L3(z))            # equal: T(z) has value L3(z)
for _ in range(2):
    l = [[rnd() for _ in range(3)] for _ in range(6)]
    a = M3(l, cross(cross(l[0], l[1]), cross(l[2], l[3])))
    b = M3(l, cross(cross(l[0], l[2]), cross(l[3], l[5])))
    print(a, b, alt(l) / a)                                 # a = b, and the ratio is -90
```

Plain Python, no libraries; it prints two equal numbers, then twice two equal numbers and
−90. These are numerical checks through L₃ and exact checks after δ₂⊗1. They are not a
proof of Alt₆[T]₃=−90·M₃ in B₃(F), which stays the first gap.

## Independent source check

All three public files were downloaded again; their SHA-256 hashes agree with the packet.

| Source | What I read |
|---|---|
| [Gon95](https://sasha-goncharov.github.io/Advances1995.pdf), Advances in Mathematics 114 (1995), 197–318, published scan | The file has no text layer; I read the pages as images: 198, 202–221, 239–241, 255–259, 264–270, 285–288, 293, 295–304, 308–312. |
| [GR5](https://arxiv.org/pdf/1803.08585v5), arXiv:1803.08585v5 of 15 July 2026 | PDF and TeX source: §1.2 (pp. 9–12), §5.1 (pp. 53–56), §§7.1–7.4 (pp. 61–71), including (135), (141)–(149), footnote 16 and (167). |
| [Z03](https://arxiv.org/pdf/math/0311111), arXiv:math/0311111v1 | p. 2, Theorem 4.1 with formula (3) and its non-degeneracy condition. |

Every node's locator was opened. The hypotheses match: infinite fields for the
configuration arguments, number fields for the periods, no four collinear points in
Theorem 8.1, the weight-four conjecture 1.39 for the derived transfer. Two statements are
deliberately narrower than the source and say so: cycle lifting is planned in
characteristic zero and for stable GL, where Gon95 §9.2 asserts it for any field and for
PGL₃.

Conventions I confirmed in the sources, since the signs depend on them: GR's faces carry
(−1)^(s−1) (p. 62), the same as the packet's zero-based signs; GR's cross-ratio (135) is
|13||24|/(|14||23|); Gon95's (1.6) is its inverse; both papers use δ[x]₂=(1−x)∧x and
δ{x}₃=[x]₂⊗x. In weight two GR's square commutes literally with these signs.

## Source findings

| Finding | Verdict | Remark |
|---|---|---|
| E-P3-01, Gon95 p. 298 | rejected | The display has H² as it should. Same verdict as the first review. |
| E-P3-02, GR (142): coefficient 2 of Alt₄ | confirmed | Recomputed with my own program on five five-tuples, two new: d₂r₅=−3·Alt₄∘∂ in every coordinate. No sign convention gives 2. |
| E-P3-03, Gon95 §9.2: higher differentials omitted | confirmed | A gap in the written proof. |
| E-P3-04, Gon95 (1.16): sign of the sixth argument | confirmed | Read on p. 208. Three checks: L₃ at 300 random complex parameters; exact vanishing after δ₃ and δ₂⊗1 at nine rational parameters, which the printed form fails; Zhao's formula (3). |
| E-P3-05, GR (143)–(144) | confirmed, reclassified | A sign convention between (143) and (167), not an error of (144). Misprint, affects nothing. |
| E-P3-06, GR Proposition 7.2: constant 3/2 | confirmed, new | The constant is −8. GR use only that it is nonzero, so their Theorem 1.8 is unaffected. |
| E-P3-07, Gon95 p. 287, step (e) | confirmed, new | Sign (−1)^i where (R2) and pp. 207, 214 give (−1)^(i−1). |
| E-P3-08, Gon95 p. 211, order of the triangle | confirmed, new | With (R2), (R3) and (1.6) as printed, the order of p. 211 corresponds to −{x}; the order of Fig. 1.12 (p. 215) to +{x}. GR keep the order and invert the cross-ratio, which is also consistent. |

The three GR findings are against the preprint v5; no version of record was available.
For each new finding I looked at the arXiv version list, the author's page and searched
for errata, and found no correction.

## Pinned library check

I read all 44 cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Each exists under the cited name, in the cited module, with the cited kind, and provides
what the citing nodes use: `Finsupp.linearCombination`, `Finsupp.lmapDomain`, `Submodule.liftQ`, `LinearIndependent`, `Matrix.det`, `Matrix.det_mul`, `exteriorPower.ιMulti`, `exteriorPower.alternatingMapLinearEquiv`, `exteriorPower.linearMap_ext`, `TensorProduct.lift`, `TensorProduct.map`, `CategoryTheory.ShortComplex.homology`, `CategoryTheory.ShortComplex.homologyMap`, `Representation.Coinvariants`, `Matrix.GeneralLinearGroup`, `groupHomology`, `Rep.trivial`, `HomologicalComplex₂.total`, `Projectivization`, `DirectSum.lof`, `NumberField.dedekindZeta`, `NumberField.discr`, `NumberField.InfinitePlace.nrRealPlaces`, `NumberField.InfinitePlace.nrComplexPlaces`, `NumberField.InfinitePlace.embedding`, `padicValRat`, `CochainComplex.of`, `ChainComplex.of`, `DirectSum.toModule`, `DirectSum.component`, `DirectLimit`, `Matrix.GeneralLinearGroup.map`, `groupHomology.map`, `groupHomology.cycles`, `groupHomology.π`, `HomologicalComplex.homologyMap`, `HomologicalComplex.homologyπ`, `HomologicalComplex.cyclesMk`, `DerivedCategory`, `DerivedCategory.Q`, `AdjoinRoot`, `RatFunc`, `riemannZeta`, `intervalIntegral`.
`DirectLimit` is the root-namespace abbreviation in `Mathlib/Order/DirectedInverseSystem.lean`.
`ChainComplex.of` and `CochainComplex.of` are the two abbreviations of that name in
`Mathlib/Algebra/Homology/HomologicalComplex.lean`. No Tau Ceti declaration is cited.
The reviewed library audit (AUDIT-30) marks all five targets of P.3 absent from the
libraries, and nothing planned here is in them.

## Node-by-node check

All node names have the prefix `Polylogarithms:P.3/`.

| Node | Verdict and evidence |
|---|---|
| `coordinate-relation` | **corrected**. Formula read on the published p. 208 and recomputed: the three formal-sum tests are exact, the corrected relation vanishes after δ₃ and δ₂⊗1 in exact prime coordinates and under L₃ numerically, and the printed sign fails both. Added the relation between the admissible locus and the source's generic locus. |
| `relation-cobracket` | **verified**. GR Lemmas 5.1–5.2 and Proposition 5.4 read (pp. 54–56). Necessary condition checked exactly at nine rational parameters, degenerate ones included. The signature is on the actual B₂⊗U. |
| `generic-vector-configurations` | **corrected**. Definition matches G95 p. 255 and GR pp. 61–62; coinvariants give the orbit module. Added the evaluation lemmas for deletion and projection, the lift evaluation and the field map to the API and the suggested file. |
| `weight-three-bigrassmannian` | **corrected**. Rows q≥3, degree m and D=∂+p checked against GR p. 62 and G95 (6.3)–(6.4); ∂p+p∂=0 verified by hand for the zero-based signs. Locator corrected. |
| `projected-cross-ratio` | **verified**. Convention is GR (135); it is the inverse of the supplier's cross-ratio (read in K3BlochGroups:V.4/cross-ratio) and of G95 (1.6). Fixtures 6/5 and 5/6 recomputed. |
| `exterior-configuration-map` | **verified**. −3·Alt₄=18f₀ recomputed; fixture values 18·u(5)∧u(67)∧u(197) and zero recomputed; right square exact on five fixtures. |
| `middle-configuration-map` | **corrected**. Formula is GR (142). Verified exactly that it is 18 times G95 (3.5), and both scaling fixtures. Statement now records that relation. |
| `triple-ratio-map` | **corrected**. Coefficient −1/5 verified for the zero-based square on three six-tuples. The statement no longer calls GR (144) an error: it satisfies GR (167). Added r₆=18·M₃, verified numerically. |
| `seven-term-configuration-relation` | **corrected**. GR Theorem 1.8 and §7.3 read; verified numerically through L₃ on random seven-tuples. The quoted constant of Proposition 7.2 corrected; hypothesis Infinite added to the suggested signature. |
| `configuration-chain-comparison` | **corrected**. Right square exact; left square exact after δ₂⊗1 and reduced to Theorem A plus the normalisation r₆=18M₃; projections by G95 Lemma 3.6, Lemma 6.2 and Theorem 6.3 (p. 296), the last also checked numerically. Hypothesis Infinite added to the suggested signature. |
| `stabilized-configuration-comparison` | **verified**. G95 §2.6 and §6 read: symmetrised resolution, (6.8)–(6.11), Lemma 6.4. The comparison is defined through an actual chain map and the supplier edge map; the stable fixture excludes the zero map. |
| `rank-two-vanishing` | **verified**. G95 p. 298 (GL₂-invariant section) and the rank filtration (1.22)–(1.24) read; the quotient is rank≤3 modulo rank≤2 in degrees 5, 4, 3. |
| `steinberg-boundary-image` | **verified**. G95 (1.20), p. 218, and (1.21), p. 219. The rational Milnor presentation as an exterior-power quotient is correct. |
| `cohomology-transfer` | **verified**. The four supplier nodes of K2SymbolsBrauer T.3–T.4 were read; the residue statement has no ramification factor, as in the supplier. Signatures name actual valuations and residue fields. |
| `suslin-top-comparison` | **verified**. G95 p. 220 remark read. The statement honestly leaves the scalar κ to be computed; the 2-torsion allowance is (n−1)! for n=3. |
| `trilogarithm-descent` | **verified**. L₃ is (1.3) of G95; values at 0, 1, −1 and the conjugation invariance checked numerically with an independent implementation. |
| `configuration-borel-class` | **corrected**. G95 Theorem 1.9, Proposition 1.11 and §9.1 read. The normalisation in the statement was wrong: the cocycle is 18·L₃(M₃), not −96·L₃(M₃). Corrected in the packet, reader and suggested file. |
| `cycle-lifting` | **verified**. G95 §9.2, p. 310 read: the lifting is asserted with the computation omitted (E-P3-03). The node states it as a planned theorem with that gap, and does not assert H¹Γ≃K₅^(3). |
| `rational-regulator-calibration` | **verified**. G95 p. 311 read. The π² per coordinate follows from the two periods recorded in BorelRegulators R.5, which were read. |
| `regulator-image-containment` | **verified**. Follows from the two previous nodes; sufficient for the determinant statement. |
| `every-family-special-value` | **corrected**. Statement and orientation are right; the period agrees with Theorem 1.1. Locator corrected: Theorem 1.1 is on p. 203, not p. 198. |
| `trilogarithm-functional-relations` | **verified**. G95 Theorem 1.3 (p. 205) read; all three identities checked numerically, the 22-term one at 300 random complex parameters. |
| `conditional-complex-transfer` | **verified**. G95 pp. 239–241 read: Conjecture 1.39 and the derived morphism. The hypotheses name the weight-four resolution and the canonical bridge. |
| `geometric-trilogarithm-presentation` | **corrected**. Relations are GR §7.3, pp. 65–66; verified numerically that they are consistent with T(z)↦[z]₃. Recorded the difference from G95 Definition 1.5 (inverse cross-ratio, order of the triangle). |
| `geometric-trilogarithm-comparison` | **corrected**. G95 pp. 285–288 and 293, GR pp. 67–68 read. The constant in the statement was wrong: M₃=−(1/90)·Alt₆[T], so Alt₆M₃=−8·Alt₆[T], not (3/2)·Alt₆[T]. Corrected in the packet, reader and suggested file. |
| `configuration-duality` | **verified**. G95 §7 read; the dual of (I,B) is (−Bᵀ,I), the four-vector fixture and its non-example recomputed by hand from the kernel. |
| `trilogarithm-duality` | **corrected**. G95 Theorem 8.1 (p. 304) read: the hypothesis is no four collinear points. Antisymmetry checked numerically. Locator of Theorem 6.3 corrected to p. 296. |

## Suggested file

`lean-check research/blueprint/suggested/Polylogarithms--P.3.lean` in the existing build
at the pinned Mathlib: exit status 0, 195 warnings, every one of them
`declaration uses sorry`, no errors and no other warnings (192 before my additions). Memory
available was above 100 GB; one elaboration at a time; no language server, build, update or
cache operation.

I read every statement for truth, not only for elaboration. The false universal claims the
first review listed are gone. Statements about B₃ now range over the quotient that kills
the 22-term relation, so they are no longer refuted by a free module. Supplier objects
that the libraries and the atlas do not have yet (rational K-groups, primitive Hurewicz,
the symmetrised edge map, Milnor norms and residues, the Borel classes, the weight-four
complex) are declared by signature in a `Supplier` namespace with their owner named; they
are not fields assuming the conclusions. Two statements are definitional and say little:
`config_coinvariants` and `configurationComparison_rank3` hold by unfolding. They are
harmless, and the content the first review wanted from the second is carried by the stable
fixture.

## Closure, ownership and requests

The local graph is acyclic. I read every imported supplier node in its packet: the parent
P.3 nodes (explicit B₃ with {0}₃, the complex, residues, the H³–Milnor comparison, the
existence theorem with its every-family clause marked as a gap), K3BlochGroups V.3–V.4
(five-term relation in Suslin's form, the pre-Bloch group, the ordered cross-ratio, which
is the inverse of the one used here, hyperhomology, stability), K2SymbolsBrauer T.2–T.4
(Milnor K-theory, norms, projection, restriction–degree, norm–residue), BorelRegulators
R.3–R.5 and KTheoryLowDegrees U.1. Each supplies what is taken from it. The periods of
R.5 give the exponent −2r₁−5r₂ for the Borel determinant and the plan's −3r₂ for the
trilogarithm determinant; the difference, π² for each of the r₁+r₂ coordinates, is the
adapter requested from R.7. The trial atlas build with this packet in place succeeds.

The five requests are precise and go to the right owners; none redefines a supplier's
object. Several suppliers' own packets are still under revision, which does not affect
this plan: it cites their nodes by id.

## Questions for the orchestrator

1. E-P3-05 changes class in the register, from an error to a sign convention. E-P3-02 and
   E-P3-06 are the two substantive findings about the Goncharov–Rudenko preprint; both
   concern displayed constants the paper does not use later.
2. At assembly the parent's statements still need the three reconciliations recorded in
   `upstreamNotes`: the rank-restricted domain of the K-theory comparison, π² per
   coordinate against R.4, and the orientation det=q·period.
3. The first gap is now a single identity, Alt₆[T]₃=−90·M₃ in B₃(F). A follow-up that
   writes the bookkeeping of GR §7.3 with coefficients would close it, and with it the
   left square and the top projection identity.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.3.json`,
  with and without the pinned declaration index: 0 errors, 0 warnings.
- Every API name, test name and theorem name of the packet occurs in the suggested file,
  and every statement of the packet occurs in the reader (checked by script).
- A trial assembly of the atlas with the corrected packet and reader in place of the
  current data succeeds.
- The suggested file elaborates as described above.
- Exact rational computations (own program): the cross-ratio and triple-ratio fixtures,
  both configuration-map fixtures, the right square on five five-tuples, the left square
  after δ₂⊗1 on three six-tuples, r₅=18·f₁, the cobracket of the 22-term relation at nine
  parameters, the three formal-sum tests. Numerical computations: the three functional
  equations of L₃, the seven-term relation, the projection identity on seven vectors of C⁴,
  antisymmetry under duality, and the normalisation of M₃.
