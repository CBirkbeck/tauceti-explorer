# Polylogarithms, explicit regulators and Zagier statements — blueprint

Blueprint packet for the roadmap `Polylogarithms`, stages P.1–P.6 (`research/blueprint/packets/Polylogarithms.json`). Written for job `BP-Polylogarithms`, issue #73, by Claude Code, session `cc-7b31c4`, 24 September 2026. Nothing here is formalised: every node carries `implementationStatus: "unchecked"`, and the suggested Lean file is signatures only.

**Sources.** Goncharov and Rudenko, *Motivic correlators, cluster varieties and Zagier's conjecture on zeta_F(4)*, arXiv:1803.08585v3, SHA-256 `9a64439247df10f0d0f41a2a304c8b152392d1521a4051b1fe4fd9239c78b093`; the abstract and §1.1 items 1–6, which state the classical and single-valued polylogarithms, the higher Bloch groups, the polylogarithmic complexes, the condition `o_n` and Theorems 1.1–1.3. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*, arXiv:math/0207036v3, SHA-256 `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db`; the abstract and introduction, for the regulator to the Deligne complex, Lobachevsky's volume formula at weight two and the Chow dilogarithm reciprocity law. Weibel's *K-book*, author-hosted draft of 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, VI.5.1–VI.5.4.1, for the Bloch-group convention P.2 descends through. **Not obtained:** Zagier's 1990 paper and Goncharov's 1991, 1994 and 1995 papers; two statements are used exactly as Goncharov and Rudenko state them, and the packet records that as a gap.

**Library baseline.** Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit `AUDIT-30` records all six layers as not built; 22 pinned declarations are cited as baseline. The weight-one case is the only polylogarithm the libraries have — `Complex.hasSum_taylorSeries_log` is `Li_1` up to sign — and `Complex.arg` is the **principal** argument, discontinuous on the negative real axis, which is exactly why P.1 forbids using it as a globally continuous function and proves instead that the two cuts cancel. Mathlib's `NumberField.Units.regulator` is the weight-one determinant whose pattern the weight-`n` determinant of P.4 follows.

| layer | nodes | planets | coverage |
| --- | --- | --- | --- |
| `Polylogarithms:P.1` | 6 | 4 | source_decomposed |
| `Polylogarithms:P.2` | 5 | 3 | source_decomposed |
| `Polylogarithms:P.3` | 5 | 3 | source_decomposed |
| `Polylogarithms:P.4` | 7 | 3 | source_decomposed |
| `Polylogarithms:P.5` | 4 | 2 | partial |
| `Polylogarithms:P.6` | 2 | 1 | source_decomposed |

In total: 29 nodes (1 application, 3 comparison, 9 construction, 6 definition, 2 lemma, 8 theorem), 78 API items, 58 unit tests, 16 planets, 14 requests and 4 gaps.

## P.1 — Classical and single-valued polylogarithms

`Li_n` is built from its series and continued by the inductive integral, so it is
**multivalued** on the twice-punctured plane and every statement names its path or its cut.
Zagier's single-valued `L_n` is then the combination `pi_n(sum_k (2^k B_k / k!) Li_{n-k}(z)
log^k|z|)`: the Bernoulli coefficients are forced by the monodromy cancellation, which is proved
as its own lemma before the function is defined. `L_2` is the Bloch–Wigner function, and it gets
its own node with the differential formula P.5 needs and the five-term identity P.2 descends.
Those last two nodes carry the ids that a confirmed red-team finding asks to be moved here from
`K3BlochGroups:V.3`; the restructure list says so.

### `classical-polylogarithm` — The classical n-logarithm ★

*definition* · planet **Classical n-logarithm**

For an integer n at least one define the classical n-logarithm on the open unit disc by the
absolutely convergent power series Li_n(z) = sum over k at least one of z to the k over k to the
n. Continue it analytically to a multivalued analytic function on the complex plane with 0 and 1
removed, by induction on n: Li_n(z) is the integral from 0 to z of Li_{n-1} against d log z,
along a path avoiding 0 and 1. Every statement below names the path or the cut domain; no global
branch is asserted.

**Hypotheses.** n is a positive integer. For the series, the modulus of z is less than one. For the continuation, z lies in the complex plane with 0 and 1 removed and a path from 0 to z in that set is given.

**Construction and proof.**

1. Prove absolute convergence of the series on the open unit disc, by comparison with the
   geometric series; for n at least two it converges on the closed disc as well, and the
   boundary case is recorded separately.
1. Prove the base case n = 1: the series is minus the principal logarithm of 1 - z on the disc,
   which is the pinned Mathlib statement.
1. Define the continuation by the displayed integral, by induction on n, and prove that the
   integrand is analytic on the complement of 0 and 1 so that the integral depends only on the
   homotopy class of the path.
1. Prove the differentiation formula z d/dz Li_n(z) = Li_{n-1}(z) on the cut domain, which is
   the recursion read backwards.
1. Fix one cut domain, the plane slit along the real ray from 1 to infinity, and record the
   resulting principal branch, together with the branch-change formula across the cut.
1. Prove the distribution relations, which express the sum of Li_n over the m-th roots of a
   point in terms of Li_n at that point.

**API.**

| name | role | statement |
| --- | --- | --- |
| `polylog` | constructor | The principal branch of Li_n on the cut domain, and the series on the disc. |
| `polylog_hasSum` | characterisation | On the open unit disc the series sums to Li_n(z). |
| `polylog_one_eq_neg_log` | compatibility | Li_1 is minus the principal logarithm of 1 - z, agreeing with the pinned Mathlib series. |
| `polylog_deriv` | relation | z times the derivative of Li_n is Li_{n-1} on the cut domain. |
| `polylog_analyticOn` | characterisation | Li_n is analytic on the cut domain. |
| `polylog_distribution` | relation | The distribution relation over the m-th roots of a point. |

**Used by.** *P.1's single-valued polylogarithm*: L_n is a finite combination of the Li_{n-k} against powers of log|z|. *P.3's trilogarithm regulator*: the explicit weight-three regulator is written through Li_3. *ColemanIntegration L2*: that layer builds the p-adic counterpart; the complex-analytic function planned here is its archimedean partner, and neither is derived from the other.

**Unit tests.**

- `weight_one` — Li_1(z) = -log(1 - z) on the disc.
- `value_at_half_weight_two` — Li_2 at one half is pi squared over twelve minus one half of the
  square of log 2, a specific value a wrong normalisation fails.
- `derivative_recursion` — z d/dz Li_3 = Li_2 on the cut domain.
- `not_single_valued` — Continuation around 1 changes the branch: Li_n is not a global analytic
  function on the punctured plane.

**Acceptance.**

- At n = 1 the principal branch is minus the principal logarithm of 1 - z, which is the pinned
  Mathlib series.
- The differentiation formula holds on the cut domain, which pins the normalisation of the
  integral.
- The function is multivalued: continuing around 1 changes the branch, and the branch-change
  formula records by how much. A definition that returns a single global analytic function is
  wrong.

**Depends on.** **baseline** `mathlib:Complex.log`, `mathlib:Complex.slitPlane`, `mathlib:Complex.hasSum_taylorSeries_log`, `mathlib:intervalIntegral`, `mathlib:AnalyticOn`.

**Source.** GR.2022, 1.1, item 1 (PDF p. 2): “The classical n-logarithm function Li_n(z) on the unit disc |z| < 1 is given by the absolutely convergent power series: Li_n(z) = sum_{k=1}^{infinity} z^k / k^n, |z| < 1. It is continued analytically to a multivalued analytic function on C - {0, 1} by induction, setting Li_n(z) = integral from 0 to z of Li_{n-1}(z) d log z, n >= 2.” — The definition and the inductive continuation, as displayed.

### `single-valued-polylogarithm` — Zagier's single-valued polylogarithm ★

*definition* · planet **Single-valued polylogarithm**

Let pi_n be the projection from the complex numbers divided by (2 pi i) to the power n minus one
to the reals which takes the real part when n is odd and the imaginary part when n is even.
Define L_n(z) as pi_n applied to the sum, over k from 0 to n - 1, of 2 to the k times the k-th
Bernoulli number over k factorial, times Li_{n-k}(z) times the k-th power of log of the modulus
of z, where the Li_{n-k} are taken along the same path. The resulting function is single-valued
on the complex projective line with 0, 1 and infinity removed, and continuous on the whole
projective line. Its weight-two case is the Bloch-Wigner dilogarithm.

**Hypotheses.** n is a positive integer. z lies in the complex projective line.

**Construction and proof.**

1. Define the parity projection pi_n and record which part it takes in each parity; the
   normalisation by the power of 2 pi i is part of the definition and is not adjustable later.
1. Form the displayed finite combination with the Bernoulli coefficients, using the pinned
   Bernoulli numbers.
1. Prove single-valuedness: the monodromy of each Li_{n-k} around 1 and around 0 contributes
   terms that cancel in the combination after applying the projection. This is the step the
   layer exists for, and it is where the Bernoulli coefficients are forced.
1. Prove the continuous extension at 0, at 1 and at infinity, using that the logarithmic
   singularities are killed by the vanishing of the other factors.
1. Prove the reality relation L_n at the conjugate equals minus one to the n minus one times
   L_n, and the inversion relation L_n(z) plus minus one to the n times L_n(1/z) equals zero.
1. Record that the weight-two case is the Bloch-Wigner function, which is treated in its own
   node with its own API.

**API.**

| name | role | statement |
| --- | --- | --- |
| `singleValuedPolylog` | constructor | The function L_n on the complex projective line. |
| `singleValuedPolylog_continuous` | characterisation | L_n is continuous on the whole projective line. |
| `singleValuedPolylog_zero_one_infty` | simp | L_n vanishes at 0, at 1 and at infinity for n at least two. |
| `singleValuedPolylog_conj` | relation | L_n at the conjugate is minus one to the n minus one times L_n. |
| `singleValuedPolylog_inv` | relation | L_n(z) plus minus one to the n times L_n of the inverse is zero. |
| `singleValuedPolylog_two` | compatibility | The weight-two case is the Bloch-Wigner function. |
| `singleValuedPolylog_one` | compatibility | The weight-one case is log of the modulus. |

**Used by.** *P.4's higher Bloch groups*: L_n is the map from B_n(C) to the reals that makes the relation subgroup a subgroup of functional equations. *P.4's Zagier determinant*: the entries of the regulator matrix are values of L_n at the embeddings. *P.2's weight-two regulator*: its weight-two case is the function descended through the Bloch group.

**Unit tests.**

- `weight_one_is_log_abs` — L_1(z) = log of the modulus of z.
- `weight_two_is_bloch_wigner` — L_2 agrees with Im Li_2(z) + arg(1 - z) log|z|.
- `reality` — L_3 at the conjugate equals L_3, while L_2 at the conjugate equals minus L_2.
- `not_analytic_at_one` — L_n is continuous at 1 but not analytic there: a non-example
  distinguishing the two.

**Acceptance.**

- L_1(z) is log of the modulus of z.
- L_2 is the Bloch-Wigner function and satisfies the five-term relation.
- L_n is continuous on the whole projective line, including at the three special points, but is
  not analytic at them.
- The Bernoulli coefficients are not free: changing one breaks single-valuedness, which is the
  acceptance test.

**Depends on.** **inside this roadmap** `classical-polylogarithm`; **baseline** `mathlib:bernoulli`, `mathlib:Polynomial.bernoulli`, `mathlib:Complex.log`, `mathlib:Complex.arg`.

**Source.** GR.2022, 1.1, item 1 (PDF p. 3): “the following expression is a single-valued function on CP^1 - {0, 1, infinity}: L_n(z) := pi_n( sum_{k=0}^{n-1} (2^k B_k / k!) Li_{n-k}(z) log^k |z| ), n >= 1. Here B_k are the Bernoulli numbers ... For example, L_2(z) is the Bloch-Wigner dilogarithm. The function L_n(z) is continuous on CP^1.” — The definition, its single-valuedness, its continuity and the identification of the weight-two case, all as displayed.

### `bloch-wigner-dilogarithm` — The Bloch-Wigner dilogarithm ★

*definition* · planet **Bloch-Wigner dilogarithm**

Define D(z) = Im Li_2(z) + arg(1 - z) log of the modulus of z on the cut domain, extended by
zero at 0, 1 and infinity. It is the weight-two case of the single-valued polylogarithm, it is
real analytic away from those three points and continuous on the whole projective line, and it
is independent of the presentation used to write it. The principal argument is not used as a
globally continuous function: the cut of the argument and the cut of the dilogarithm cancel, and
the proof says where.

**Hypotheses.** z lies in the complex projective line.

**Construction and proof.**

1. Write the displayed expression on the cut domain, with the principal branch of Li_2 and the
   principal argument.
1. Prove that the jump of the imaginary part of Li_2 across its cut cancels the jump of the
   argument term, so that the sum extends continuously across the cut.
1. Extend by zero at the three special points and prove continuity there.
1. Prove that the expression agrees with the weight-two case of the single-valued polylogarithm,
   so that the two presentations define the same function.
1. Prove conjugation, D at the conjugate is minus D, and inversion, D of the inverse is minus D;
   deduce that D vanishes on the real points of the projective line.
1. Prove the differential formula: dD is log of the modulus of z times d arg(1 - z) minus log of
   the modulus of 1 - z times d arg z, which is the weight-two regulator form P.5 uses.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochWigner` | constructor | The function D on the complex projective line. |
| `blochWigner_eq_singleValued` | compatibility | D is the weight-two case of the single-valued polylogarithm. |
| `blochWigner_conj` | relation | D at the conjugate is minus D. |
| `blochWigner_inv` | relation | D of the inverse is minus D. |
| `blochWigner_real` | simp | D vanishes at every real point. |
| `blochWigner_differential` | relation | The differential formula for dD. |

**Used by.** *P.2's weight-two regulator*: the regulator is D descended through the Bloch group. *K3BlochGroups V.3*: that layer's warning about torsion is about this function; its two reserved analytic nodes import from here, and the restructure entries of both packets propose that they become citations. *P.5's curve regulator*: the differential formula is the weight-two logarithmic expression the curve complex produces.

**Unit tests.**

- `vanishes_on_reals` — D vanishes at every real point, by conjugation.
- `value_at_i` — D at the imaginary unit is Catalan's constant.
- `five_term` — The five-term relation holds, which is the next node.
- `not_global_arg` — Replacing the principal argument by a global branch makes the formula
  discontinuous: a non-example.

**Acceptance.**

- D vanishes at 0, 1 and infinity and on the real line.
- D at the imaginary unit is Catalan's constant.
- D is real analytic off the three special points and continuous at them.
- The definition does not use the argument as a global function; a definition that does is
  discontinuous on the negative real axis.

**Depends on.** **inside this roadmap** `classical-polylogarithm`, `single-valued-polylogarithm`; **baseline** `mathlib:Complex.arg`, `mathlib:Complex.log`.

**Source.** GR.2022, 1.1, item 1 (PDF p. 3): “For example, L_2(z) is the Bloch-Wigner dilogarithm.” — The identification of the weight-two single-valued polylogarithm with the Bloch-Wigner function.

### `bloch-wigner-five-term` — The five-term relation for the Bloch-Wigner function ★

*theorem* · planet **Five-term relation for D**

For any five distinct points on the complex projective line the sum over the cyclic index of L_2
of the cross-ratio of four consecutive points vanishes. Equivalently, in the usual form, the
alternating sum over the five four-element subsets vanishes. Consequently D induces a
homomorphism from the pre-Bloch group of the complex numbers to the reals, and by restriction
from the Bloch group.

**Hypotheses.** The five points are distinct points of the complex projective line.

**Construction and proof.**

1. Define the cross-ratio in the normalisation of the source, which is the negative of the
   cluster cross-ratio and is pinned by the value at the four points infinity, minus one, zero
   and z being minus z.
1. Prove the cyclic form of the relation by the standard argument: differentiate both sides
   using the differential formula of the previous node and check that the resulting one-form
   vanishes identically, then fix the constant at a degenerate configuration where all terms
   vanish.
1. Convert the cyclic form into the alternating form, using the inversion relation and the
   identity relating the cross-ratio of a cyclic shift with the inverse cross-ratio.
1. Check that the five arguments of the alternating form are the five arguments of the
   normalisation of the five-term relation that K3BlochGroups V.3 fixes, so that the descent
   below is through that presentation and no other.
1. Apply the universal property of the pre-Bloch group: the assignment of D to a generator kills
   the class of one and every five-term element, so it descends; restrict to the Bloch group.
1. Record that the descended map kills torsion, because the reals are torsion free.

**Acceptance.**

- The relation holds for one explicit five-tuple of algebraic points, checked with an error
  bound, which is the acceptance test the roadmap names.
- The descended map vanishes on the element c of the Bloch group, which is torsion.
- The descended map is not zero on the Bloch group of the complex numbers, which is what makes
  it a regulator.

**Depends on.** **inside this roadmap** `bloch-wigner-dilogarithm`; **other roadmaps** `K3BlochGroups:V.3`.

**Source.** GR.2022, 1.1, item 3 (PDF pp. 3-4): “recall the cross-ratio of four points on P^1(F): [s_1, s_2, s_3, s_4] := (s_1 - s_2)(s_3 - s_4) / ((s_1 - s_4)(s_3 - s_2)), [infinity, -1, 0, z] = -z. Then for any five distinct points s_1, ..., s_5 on CP^1 we have: sum_{i=1}^{5} L_2([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0, i in Z/5Z.” — The cross-ratio normalisation and the five-term relation, as displayed, together with the footnote converting the cyclic form into the alternating one.

### `branch-change-and-monodromy` — Branch change and the cancellation of monodromy

*lemma*

Record the monodromy of the classical n-logarithm: continuing Li_n around the point 1 adds a
multiple of 2 pi i times Li_{n-1} composed with the appropriate power of the logarithm, and
continuing around 0 adds the corresponding lower-weight term. In the combination that defines
the single-valued polylogarithm these contributions cancel after the parity projection. This is
the lemma the roadmap asks to be proved before the global function is defined.

**Hypotheses.** n is at least two; the paths are loops in the complex plane with 0 and 1 removed.

**Construction and proof.**

1. Compute the monodromy of Li_2 around 1 from the integral representation and the residue of
   the integrand, obtaining the standard term with the logarithm.
1. Induct on n using the integral recursion to obtain the general monodromy formula.
1. Substitute the monodromy formulas into the defining combination of L_n and check that the
   terms cancel after applying the parity projection; the cancellation is exactly what forces
   the Bernoulli coefficients.
1. State the resulting single-valuedness as the input to the definition of L_n, not as a
   consequence of it.

**Acceptance.**

- The weight-two case reproduces the familiar statement that Im Li_2 plus the argument term is
  single valued.
- The cancellation fails if the coefficients are changed, so the lemma pins the definition.
- The lemma is about the multivalued continuation and cannot be stated for a single chosen
  branch.

**Depends on.** **inside this roadmap** `classical-polylogarithm`, `single-valued-polylogarithm`.

**Source.** GR.2022, 1.1, item 1 (PDF p. 3): “The obtained multivalued analytic function has a single valued cousin. Namely, consider the projection given by pi_n ...” — The single-valued cousin whose existence this lemma proves.

### `distribution-and-inversion` — Inversion, reality and distribution relations

*lemma*

For every n at least one the single-valued polylogarithm satisfies the inversion relation L_n(z)
plus minus one to the n times L_n of the inverse equals zero, the reality relation L_n at the
conjugate equals minus one to the n minus one times L_n, and the distribution relations
inherited from the classical polylogarithm. The reality relation is not an algebraic functional
equation and is recorded separately, as the source insists.

**Hypotheses.** n is a positive integer.

**Construction and proof.**

1. Derive the inversion relation from the corresponding relation for the classical polylogarithm
   on the cut domain, and check that the parity projection converts it into the displayed form.
1. Derive the reality relation from complex conjugation of the defining combination, using that
   the Bernoulli coefficients are rational and that the projection interacts with conjugation by
   the stated sign.
1. Derive the distribution relations from those of the classical polylogarithm.
1. Classify the three: inversion and distribution are algebraic functional equations and belong
   to the relation subgroup of P.4; the reality relation is not, and the source says so.

**Acceptance.**

- At n = 2 inversion says D of the inverse is minus D.
- At n = 3 reality says L_3 is invariant under conjugation, so it does not vanish on the reals,
  unlike L_2.
- The reality relation is excluded from the list of algebraic functional equations, which
  matters for the definition of the relation subgroup in P.4.

**Depends on.** **inside this roadmap** `single-valued-polylogarithm`.

**Source.** GR.2022, 1.1, item 3 and footnote 4 (PDF p. 4): “Although we do not know explicitly functional equations for n-logarithms for large n except a trivial one L_n(z) + (-1)^n L_n(z^{-1}) = 0, and the distribution relations, one can define a subgroup of all functional equations. ... And the reality relation L_n(conjugate z) = (-1)^{n-1} L_n(z), which is not on the list of algebraic functional equations.” — The three relations and the classification, as displayed.

## P.2 — The weight-two regulator

The weight-two regulator, assembled rather than rebuilt. The Bloch group and the five-term
normalisation come from `K3BlochGroups:V.3`, the configuration complex and cross-ratio from
`K3BlochGroups:V.4`, the Borel/Deligne scalar from `BorelRegulators:R.7`, and the hyperbolic-
manifold comparison stays with `ArithmeticQuantumTopology:QT.5`. What P.2 owns is the descent of
`D` through that convention, the embedding-wise matrix with the real places proved to contribute
zero, the Borel comparison with its sign and scalar, and a numerical evaluation that is a
**separate function with an error theorem** — a value below its own error bound proves nothing.

### `bloch-wigner-descent` — Descent of the Bloch-Wigner function through the Bloch group ★

*construction* · planet **Descent of D to the Bloch group**

Construct the homomorphism from the Bloch group of the complex numbers to the reals induced by
the Bloch-Wigner function, through the pre-Bloch group in the convention that K3BlochGroups V.3
fixes: the antisymmetric tensor quotient as the target of the boundary, and the five-term
relations in that layer's normalisation. The descent is through that convention and no other; a
second convention gives a different integral map with the same rationalisation.

**Hypotheses.** The field is the complex numbers. The Bloch group is the one K3BlochGroups V.3 constructs.

**Construction and proof.**

1. Import the pre-Bloch group, the five-term relation, the boundary and the Bloch group from
   K3BlochGroups V.3.
1. Apply the universal property of the pre-Bloch group to the assignment of the Bloch-Wigner
   value to a generator, which kills the class of one and every five-term element by the
   previous layer's theorem.
1. Restrict the resulting homomorphism to the Bloch group.
1. Prove naturality for a field embedding into the complex numbers, which is what makes the
   embedding-wise assembly of the next node possible.
1. Record the two consequences the roadmap insists on: the map kills torsion, so it cannot
   separate two integral conventions, and its composition with the comparison of conventions is
   the corresponding map for the other convention.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochWignerHom` | constructor | The homomorphism from the Bloch group of the complex numbers to the reals. |
| `blochWignerHom_gen` | simp | Its value on the class of a generator is the Bloch-Wigner value. |
| `blochWignerHom_torsion` | characterisation | It vanishes on every torsion element. |
| `blochWignerHom_map` | functoriality | Naturality for a field embedding into the complex numbers. |

**Used by.** *P.2's embedding-wise regulator*: the regulator matrix is built from this map at each embedding. *K3BlochGroups V.6*: that layer exports the integral model through which this map is compared with the abstract regulator. *EllipticRegulators ER.2*: the Steinberg relation through the Bloch-Wigner function is stated there against this descent.

**Unit tests.**

- `kills_c` — The image of the element c is zero.
- `natural_in_embedding` — For a real embedding the map vanishes, by the conjugation relation.
- `nonzero` — The map is not identically zero on the Bloch group of the complex numbers.
- `convention_blind` — Two conventions differing by 2-torsion give the same descended map: a
  non-example for identifying them.

**Acceptance.**

- The map kills the element c, which has order six.
- The map is natural for an embedding of a number field into the complex numbers.
- The map does not distinguish the Suslin convention from the Calegari-Garoufalidis-Zagier
  convention, whose difference is 2-torsion.

**Depends on.** **inside this roadmap** `bloch-wigner-five-term`, `bloch-wigner-dilogarithm`; **other roadmaps** `K3BlochGroups:V.3`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “and Bloch's group B(F) is defined to be its kernel.” — The convention through which the function descends is the one fixed there.

### `weight-two-regulator` — The embedding-wise weight-two regulator of a number field ★

*construction* · planet **Weight-two regulator**

For a number field F with r_2 complex places, construct the regulator map from the Bloch group
of F to the real vector space indexed by the complex places, whose component at a place is the
Bloch-Wigner descent evaluated after the corresponding embedding. Construct the associated
determinant on an r_2-tuple of elements. Real places contribute zero, by the conjugation
relation, and that vanishing is proved rather than assumed.

**Hypotheses.** F is a number field; the places are the infinite places of F. The elements are in the Bloch group of F.

**Construction and proof.**

1. Import the infinite places and their embeddings, and the count of real and complex places.
1. Define the component at a complex place by composing the map induced on Bloch groups by the
   embedding with the Bloch-Wigner descent, and check that the choice between an embedding and
   its conjugate changes only the sign, which the determinant absorbs.
1. Prove that the component at a real place vanishes, using the conjugation relation for the
   Bloch-Wigner function.
1. Assemble the map into the vector space indexed by the complex places and define the
   determinant of the resulting matrix on an r_2-tuple.
1. Prove naturality for a field extension, with the transfer behaviour that the comparison with
   the Borel class requires.

**API.**

| name | role | statement |
| --- | --- | --- |
| `weightTwoRegulator` | constructor | The map from the Bloch group of F to the real vector space indexed by the complex places. |
| `weightTwoRegulator_real_place` | simp | The component at a real place is zero. |
| `weightTwoRegulator_det` | constructor | The determinant on an r_2-tuple of Bloch elements. |
| `weightTwoRegulator_conj` | relation | Changing an embedding for its conjugate changes the component by a sign. |
| `weightTwoRegulator_map` | functoriality | Naturality for a field extension. |

**Used by.** *P.2's Borel comparison*: the comparison is stated for this map. *P.4's Zagier determinant*: the weight-n determinant is defined by the same pattern, with L_n in place of L_2. *SpecialValuesBirchTate B.8*: the statement infrastructure there uses the same normalised covolume pattern.

**Unit tests.**

- `totally_real` — For a totally real field the regulator vanishes identically.
- `imaginary_quadratic` — For an imaginary quadratic field the target is one dimensional.
- `determinant_sign` — The determinant changes sign under a transposition of the chosen
  elements, so it is defined up to a recorded sign.
- `not_the_unit_regulator` — This is not the pinned weight-one unit regulator: a non-example,
  since the two have different sources and targets.

**Acceptance.**

- For a totally real field the regulator is zero, because every place is real.
- For an imaginary quadratic field the target is one dimensional and the regulator of a nonzero
  element is a single real number.
- The determinant is well defined up to sign, and the sign convention is recorded rather than
  left to the reader.

**Depends on.** **inside this roadmap** `bloch-wigner-descent`; **other roadmaps** `K3BlochGroups:V.3`; **baseline** `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:Matrix.det`.

**Source.** GR.2022, 1.1, item 2 (PDF p. 3): “Then there exist elements y_1, ..., y_{r_2} in Q[F] satisfying a certain condition o_4 ... such that zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_{r_1+i}(y_j))), 1 <= i, j <= r_2.” — The weight-four shape of the determinant; the weight-two case has the same shape with L_2, and is the theorem of Zagier's 1986 paper that the source cites.

### `borel-comparison` — Comparison of the weight-two regulator with the Borel class ★

*theorem* · planet **Borel comparison at weight two**

The embedding-wise weight-two regulator agrees, up to an explicit nonzero rational scalar and an
explicit sign, with the Borel regulator on the indecomposable K_3 of the number field, under the
comparison that K3BlochGroups V.4 supplies between that group and the Bloch group. The scalar
and the sign are part of the statement.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Import Suslin's exact sequence from K3BlochGroups V.4, which identifies the Bloch group with
   the indecomposable K_3 modulo the enhanced roots of unity.
1. Import the Borel regulator and its comparison with the Beilinson-Deligne regulator, with its
   scalar, from BorelRegulators R.7.
1. Compare the two maps on the rationalised groups, where the enhanced torsion term dies, and
   fix the scalar by evaluating both sides on a single explicit element.
1. Record that the comparison is only after rationalisation: a real regulator kills torsion, so
   it cannot be used to identify two integral models, and the roadmap forbids doing so.
1. State the sign convention explicitly, and record which orientation of the embeddings it
   depends on.

**Acceptance.**

- Both sides vanish for a totally real field.
- The scalar is a specific nonzero rational, not an unspecified constant.
- The comparison does not transfer to the integral groups, which is the limitation the statement
  records.

**Depends on.** **inside this roadmap** `weight-two-regulator`; **other roadmaps** `K3BlochGroups:V.4`, `BorelRegulators:R.7`.

**Source.** GR.2022, Theorem 1.3(iv) (PDF p. 6): “The following composition is a non-zero rational multiple of the Borel regulator map: K_7(C)_Q -> H^1 B(C; 4) -> R.” — The weight-four statement of exactly this shape; the weight-two case is the one attributed to Zagier's 1986 paper in the same passage.

### `hyperbolic-volume` — The cross-ratio cocycle and the volume of an ideal tetrahedron

*comparison*

The Bloch-Wigner value at the cross-ratio of four points of the complex projective line is the
volume of the ideal hyperbolic tetrahedron with those vertices, and the five-term relation is
the additivity of volume under the subdivision of an ideal simplex. This is the geometric
content of Bloch's identification of the regulator; the configuration and cross-ratio machinery
is imported from K3BlochGroups V.4, which owns it, and the hyperbolic-manifold application is
left to ArithmeticQuantumTopology QT.5, which owns that.

**Hypotheses.** The four points are distinct points of the complex projective line.

**Construction and proof.**

1. Import the configuration complex and the cross-ratio from K3BlochGroups V.4.
1. State the volume formula for an ideal tetrahedron in terms of the Bloch-Wigner function of
   the cross-ratio of its vertices, with the orientation convention fixed.
1. Identify the five-term relation with the two subdivisions of an ideal four-simplex, which is
   the geometric proof of the relation.
1. Record the boundary of the ownership: the general Grassmannian and volume statements belong
   to Goncharov's programme, cited here, and the manifold-level comparison belongs to
   ArithmeticQuantumTopology QT.5.

**Acceptance.**

- The volume is positive for a positively oriented tetrahedron and changes sign under an
  orientation-reversing permutation of the vertices.
- The regular ideal tetrahedron, with cross-ratio a primitive sixth root of unity, has the
  maximal volume, whose value is the Bloch-Wigner value there.
- The subdivision identity is the five-term relation, which is the acceptance test.

**Depends on.** **inside this roadmap** `bloch-wigner-five-term`; **other roadmaps** `K3BlochGroups:V.4`, `ArithmeticQuantumTopology:QT.5`.

**Source.** Gonch.Arakelov.2004, Abstract and introduction (PDF p. 1): “For n = 2 we recover Lobachevsky's formula expressing the volume of an ideal geodesic simplex in the hyperbolic space via the dilogarithm.” — The volume formula in the weight-two case, as the source states it.

### `certified-numerics` — Certified numerical evaluation of the Bloch-Wigner function

*construction*

Construct a numerical evaluation of the Bloch-Wigner function as a separate function of a point
and a precision, together with an error theorem bounding the difference from the true value by
an explicit expression in the precision. The numerical function is not the definition of the
regulator, and an inequality between numerical values is not a proof that an exact value is
nonzero unless the error bound is smaller than the gap; the statement says so.

**Hypotheses.** The point is a complex number with 0 and 1 removed, given by exact data. The precision is a positive integer.

**Construction and proof.**

1. Reduce the argument into a region of fast convergence using the inversion and conjugation
   relations and the Landen-type transformation, recording each reduction step as an exact
   identity.
1. Truncate the defining series at a length determined by the precision and bound the tail
   explicitly.
1. Bound the error contributed by the elementary terms, the logarithm and the argument, in terms
   of the precision of the input.
1. State the error theorem: the numerical value differs from the true value by at most the
   displayed bound.
1. State the separation lemma the consumers need: if the numerical value exceeds the bound in
   absolute value then the true value is nonzero. A value alone proves nothing.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochWignerApprox` | constructor | The numerical evaluation, as a function of a point and a precision. |
| `blochWignerApprox_error` | characterisation | The error theorem bounding the difference from the true value. |
| `blochWignerApprox_ne_zero` | characterisation | If the numerical value exceeds the bound then the true value is nonzero. |
| `blochWignerApprox_mono` | compatibility | The bound decreases as the precision increases. |

**Used by.** *P.6's tests*: the five-term relation at algebraic points is checked numerically only after this error theorem. *P.4's determinant identity*: a numerical check of the Zagier determinant is meaningful only with this bound.

**Unit tests.**

- `known_value` — At the imaginary unit the numerical value agrees with Catalan's constant to
  the stated precision.
- `bound_tends_to_zero` — The error bound tends to zero as the precision grows.
- `zero_at_real` — At a real point the numerical value is within the bound of zero.
- `not_a_proof` — A numerical value below the error bound does not prove nonvanishing: the non-
  example the roadmap insists on.

**Acceptance.**

- At a point where the true value is known exactly, for instance the imaginary unit, the
  numerical value agrees to the stated precision.
- The error bound tends to zero as the precision grows.
- A numerical value smaller than the error bound proves nothing, which is the non-example the
  roadmap asks for.

**Depends on.** **inside this roadmap** `bloch-wigner-dilogarithm`, `distribution-and-inversion`.

**Source.** GR.2022, 1.1, item 2 (PDF p. 3): “Zagier's conjecture predicts that the classical regulator formula ... has analogs for zeta_F(n) for any positive integer n.” — The determinant identities these numerics are used to test; the source states them exactly, and the numerical evaluation is a separate object.

## P.3 — Weight-three polylogarithmic complexes

Goncharov's complexes, in the rational convention of the source: `B_n(F) → B_{n-1}(F)⊗F^×_Q → …
→ Λ^n F^×_Q` in degrees `1..n`. The weight-three case `B_3(F) → B_2(F)⊗F^× → Λ³F^×` is the
layer's subject, and `d² = 0` is proved where it is visible: `{x} ↦ {x}_2 ⊗ x ↦ (1−x) ∧ x ∧ x =
0`. Residues, transfers and functoriality follow, then the comparison from the weight-three
Adams piece — with its degree range, since the general isomorphism is a conjecture in the source
and is labelled one here — and the weight-three special value.

### `polylogarithmic-complex` — Goncharov's polylogarithmic complexes ★

*construction* · planet **Polylogarithmic complexes**

For a field F and a weight n construct the weight-n polylogarithmic motivic complex, placed in
degrees one to n: B_n(F) at degree one, then B_{n-1}(F) tensor the rationalised units, then
B_{n-2}(F) tensor the second exterior power, and so on, ending with the n-th exterior power of
the rationalised units. The differential has degree plus one and is induced by the map delta_n
defined in P.4. The first four complexes are written out, and the weight-three one is the
complex this layer is about. All groups are rational, following the source's convention, which
differs from the integral one by tensoring.

**Hypotheses.** F is a field. n is a positive integer. All groups are tensored with the rationals.

**Construction and proof.**

1. Import the higher Bloch groups and the map delta_n from P.4.
1. Form the displayed terms, with the exterior powers taken over the rationals.
1. Define the differential in each degree as delta tensored with the identity on the exterior
   factor, with the sign convention recorded.
1. Prove that consecutive differentials compose to zero, which for the first step is the
   computation the source displays and in general follows from it by tensoring.
1. Write out the first four complexes explicitly and check that the weight-one complex is the
   rationalised units and the weight-two complex is the Bloch complex.
1. Record the convention difference: the source's groups are rational, and the integral version
   of Goncharov is a different object whose comparison is stated but not proved here.

**API.**

| name | role | statement |
| --- | --- | --- |
| `polylogComplex` | data | The weight-n complex in degrees one to n. |
| `polylogComplex_d_comp_d` | relation | Consecutive differentials compose to zero. |
| `polylogComplex_one` | compatibility | The weight-one complex is the rationalised units. |
| `polylogComplex_two` | compatibility | The weight-two complex is the rationalised Bloch complex. |
| `polylogComplex_map` | functoriality | A field homomorphism induces a map of complexes. |

**Used by.** *P.3's weight-three special value*: the theorem is about the first cohomology of the weight-three complex. *P.4's condition o_n*: the condition is membership in the first cohomology of the weight-n complex. *P.5's curve complexes*: the curve complexes are built from these by residues along the places of the function field.

**Unit tests.**

- `weight_two_is_bloch` — The weight-two complex is the rationalised Bloch complex.
- `d_squared_weight_three` — In weight three the composite of the two differentials is zero.
- `degrees` — The complex is supported in degrees one to n.
- `not_integral` — The groups are rational: the integral complex of Goncharov is a different
  object, and the two are not identified here.

**Acceptance.**

- The weight-one complex is the rationalised units in degree one.
- The weight-two complex is B_2(F) to the second exterior power, which is the rationalised Bloch
  complex of K3BlochGroups V.3.
- The composite of two differentials is zero, checked in weight three where it is the first
  nontrivial case.
- The complex is in degrees one to n; a shifted indexing changes every cohomology statement
  below.

**Depends on.** **inside this roadmap** `higher-bloch-group`, `delta-map`; **baseline** `mathlib:TensorProduct`, `mathlib:exteriorPower.map`, `mathlib:Additive`.

**Source.** GR.2022, 1.1, item 4 (PDF p. 5): “So we get a complex in the degrees [1, n], where B_n(F) is in the degree 1, and the differential has degree +1, called the weight n polylogarithmic motivic complex: B(F; n) : B_n(F) -> B_{n-1}(F) tensor F^x_Q -> B_{n-2}(F) tensor Lambda^2 F^x_Q -> ... -> Lambda^n F^x_Q.” — The complex and its indexing, as displayed, together with the first four instances.

### `weight-three-complex` — The weight-three complex and its differential-square-zero proof ★

*theorem* · planet **The weight-three complex**

The weight-three polylogarithmic complex is B_3(F) to B_2(F) tensor the rationalised units to
the third exterior power of the rationalised units, and the composite of its two differentials
is zero. Explicitly, the class of x in B_3 maps to the class of x in B_2 tensor x, which maps in
turn to (1 - x) wedge x wedge x, and that vanishes.

**Hypotheses.** F is a field; all groups are rational.

**Construction and proof.**

1. Write the two differentials explicitly on generators, using the definition of delta in each
   weight.
1. Compute the composite on a generator: the class of x goes to the class of x in B_2 tensor x,
   and then to (1 - x) wedge x wedge x.
1. Observe that the result vanishes because a wedge with a repeated entry is zero in the
   rationalised exterior power; this is where rationality is used, and the integral statement
   needs the corresponding care.
1. Extend from generators to the whole group by linearity and by the definition of B_3 as a
   quotient.
1. Record that the analogous computation in every weight is the general statement of the
   previous node.

**Acceptance.**

- The composite vanishes on a generator, which is the whole content.
- Over the rationals the repeated wedge vanishes; over the integers the antisymmetric quotient
  of K3BlochGroups V.3 would be needed instead, and the difference is 2-torsion.
- The weight-two analogue is the statement that the Bloch boundary kills the five-term
  relations.

**Depends on.** **inside this roadmap** `polylogarithmic-complex`, `delta-map`, `higher-bloch-group`.

**Source.** GR.2022, 1.1, item 4 (PDF p. 5): “Evidently, the following composition is zero for n >= 3: B_n(F) -> B_{n-1}(F) tensor F^x_Q -> B_{n-2}(F) tensor Lambda^2 F^x_Q.” — The vanishing, as displayed, specialised to weight three.

### `residues-and-transfers` — Residues, transfers and functoriality of the weight-three complex

*construction*

For a field with a discrete valuation construct the residue map from the weight-three complex of
the field to the weight-two complex of the residue field, shifted by one, and prove that it
commutes with the differentials. Construct the transfer along a finite field extension and prove
the projection formula. Prove functoriality for an arbitrary field homomorphism.

**Hypotheses.** F is a field with a discrete valuation and residue field k, or a finite extension is given.

**Construction and proof.**

1. Define the residue on the last term by the tame symbol on the exterior power of the units,
   imported from K2SymbolsBrauer T.3.
1. Define the residue on the middle term by the valuation on the unit factor, and on the first
   term by zero, and prove that these commute with the differentials.
1. Construct the transfer along a finite extension on each term, using the norm on the unit
   factors and the transfer on the higher Bloch groups.
1. Prove the projection formula relating restriction and transfer.
1. Prove functoriality for a general field homomorphism, and the compatibility of residues with
   a homomorphism respecting the valuations.

**API.**

| name | role | statement |
| --- | --- | --- |
| `weightThreeResidue` | constructor | The residue map to the weight-two complex of the residue field. |
| `weightThreeResidue_comm` | compatibility | It commutes with the differentials. |
| `weightThreeTransfer` | constructor | The transfer along a finite extension. |
| `weightThreeTransfer_projection` | relation | The projection formula. |
| `weightThreeComplex_map` | functoriality | Functoriality for a field homomorphism. |

**Used by.** *P.5's curve complexes*: the curve complex is assembled from the residues at the places of the function field. *P.3's special-value theorem*: the transfer is what reduces a number-field statement along a subfield.

**Unit tests.**

- `unramified_first_term` — The residue vanishes on the first term.
- `projection_formula` — Transfer after restriction is multiplication by the degree.
- `commutes_with_d` — Residue and differential commute, checked on a generator.

**Acceptance.**

- The residue of the first term is zero, so a class of B_3 is unramified.
- The projection formula holds, which is the acceptance test for the transfer.
- The residue commutes with the differentials, which is what makes the curve complexes of P.5
  well defined.

**Depends on.** **inside this roadmap** `weight-three-complex`, `polylogarithmic-complex`; **other roadmaps** `K2SymbolsBrauer:T.3`.

**Source.** GR.2022, 1.1, item 4 (PDF p. 5): “The subgroup R_n(F) is generated by all elements obtained this way, and {0}.” — The specialisation construction that the residue maps generalise; the source defines the relation subgroup by exactly such boundary data.

### `k-theory-comparison-weight-three` — Comparison from weight-three rational K-theory

*theorem*

There is a canonical homomorphism from the weight-three graded piece of the Adams filtration on
the rationalised K-groups of F to the cohomology of the weight-three polylogarithmic complex, in
each degree, and it is compatible with the explicit trilogarithm regulator. The comparison
carries its proven degree range: no claim is made that the complex computes every motivic
cohomology group in every weight.

**Hypotheses.** F is a field; all K-groups are rationalised.

**Construction and proof.**

1. Import the Adams filtration on rationalised K-theory and its weight-three graded pieces.
1. Construct the comparison in each degree, following the weight-three case of the general
   construction the source describes.
1. Prove compatibility with the regulator: composing with the map given by the single-valued
   trilogarithm gives the Borel regulator up to a nonzero rational.
1. State the degree range in which the comparison is known to be an isomorphism, and record the
   general statement as the conjecture the source labels as such, not as a theorem.
1. Record the relation to the rank filtration and Suslin's conjecture that it agrees with the
   Adams filtration, as the source states.

**Acceptance.**

- The weight-two case of the comparison recovers the statement of P.2 through Suslin's sequence.
- The general isomorphism is a conjecture in the source and is recorded as one.
- The comparison is compatible with the trilogarithm regulator, with its scalar.

**Depends on.** **inside this roadmap** `weight-three-complex`, `single-valued-polylogarithm`; **other roadmaps** `MotivicEtaleKTheory:M.7`, `BorelRegulators:R.7`.

**Source.** GR.2022, 1.1, items 6 (PDF pp. 5-6): “For an arbitrary field F, it was conjectured in [Gon95] that the weight n polylogarithmic motivic complexes calculate the weight n pieces of the Quillen K-groups of the field F modulo torsion. Precisely, let gamma be the Adams gamma-filtration on Quillen's algebraic K-theory. The conjecture states that one expects the following isomorphisms: gr^n_gamma K_{2n-i}(F)_Q = H^i B(F; n), i >= 0.” — The conjecture, labelled as such in the source; the weight-three comparison this node states is the proved part attributed there to Goncharov's 1991 and 1995 papers.

### `weight-three-special-value` — The weight-three special-value theorem for number fields ★

*theorem* · planet **Weight-three special value**

For a number field F the value of the Dedekind zeta function at three equals, up to an explicit
power of pi, the square root of the discriminant and a nonzero rational, the determinant of the
matrix of values of the single-valued trilogarithm at the embeddings of a suitable family of
elements of B_3(F) satisfying the condition that their delta vanishes. The theorem is the
weight-three case of Zagier's conjecture, proved by Goncharov.

**Hypotheses.** F is a number field with r_1 real and r_2 complex places.

**Construction and proof.**

1. State the determinant formula in the shape the source fixes for weight four, with the
   trilogarithm and the corresponding exponents.
1. Import the Borel rank theorem in weight three, which gives the size of the matrix.
1. Combine the K-theory comparison of the previous node with Borel's theorem to prove the
   identity up to a nonzero rational, following the architecture the source describes for weight
   four.
1. Record the two separate propositions: the existence of elements satisfying the condition, and
   the determinant identity for any such family.
1. Attribute the theorem: the weight-two case to Zagier's 1986 paper and the weight-three case
   to Goncharov's 1991 and 1995 papers, as the source does.

**Acceptance.**

- The matrix is of size r_1 + r_2 in weight three, not r_2, because the parity of the weight
  changes which places contribute; the statement records the correct size.
- The identity is up to a nonzero rational, and the rational is not claimed to be computed.
- For a field with no complex places the statement is still nontrivial in weight three, unlike
  weight two.

**Depends on.** **inside this roadmap** `k-theory-comparison-weight-three`, `single-valued-polylogarithm`; **other roadmaps** `BorelRegulators:R.3`; **baseline** `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.discr`.

**Source.** GR.2022, 1.1, item 2 (PDF p. 3): “Similar results about zeta_F(2) and zeta_F(3) were proved in [Zag86] and [Gon91], [Gon95], respectively.” — The attribution and the existence of the weight-three theorem, as displayed; the shape of the identity is that of the weight-four formula the source states in full.

## P.4 — General polylogarithmic statement infrastructure

The statement infrastructure. `δ_n` first, then the higher Bloch groups `B_n(F) = Q[F]/R_n(F)`
with `R_n` generated by the specialisations `Σ n_i({f_i(1)} − {f_i(0)})` of elements of `ker
δ_n` over `F(t)`; the map `L_n : B_n(C) → R` is what makes `R_n` a group of *functional
equations*, and the reality relation is deliberately outside it. The condition `o_n` is `δ y =
0`, the determinant carries its `π` power and `|d_F|^{-1/2}`, and Zagier's statement is split
into **three** propositions that are never collapsed. The weight-four case is recorded as
Goncharov–Rudenko's **theorem**, with a restructure entry naming the Part II that would own its
proof.

### `delta-map` — The map delta_n

*construction*

For a field F define delta_n from the rational vector space on F to B_{n-1}(F) tensor the
rationalised units when n is at least three, and to the second exterior power of the
rationalised units when n is two, by sending the generator at x to the class of x in weight n -
1 tensor x, respectively to (1 - x) wedge x, with delta_2 at one and at zero set to zero. The
generator at infinity is adjoined with the relation that it is zero. The map descends to a
homomorphism out of B_n(F).

**Hypotheses.** F is a field. n is at least two. All groups are rational.

**Construction and proof.**

1. Define the map on generators by the displayed formulas, in the two cases n = 2 and n at least
   three.
1. Set the values at zero, at one and at infinity to zero, which is the degenerate convention
   the source fixes.
1. Prove by induction on n, simultaneously with the definition of the relation subgroup, that
   the map kills that subgroup and so descends to B_n(F); this is the joint induction the source
   performs.
1. Prove functoriality for a field homomorphism.
1. Record the weight-two case against K3BlochGroups V.3: there the target is the antisymmetric
   tensor quotient and the group is integral, while here it is the exterior square and
   everything is rational. The two agree after tensoring with the rationals and differ
   integrally by 2-torsion.

**API.**

| name | role | statement |
| --- | --- | --- |
| `deltaMap` | constructor | The map on the rational vector space on F, in both cases. |
| `deltaMap_gen` | simp | Its value on a generator, in each of the two cases. |
| `deltaMap_degenerate` | simp | Its value at zero, one and infinity is zero. |
| `deltaMap_descends` | characterisation | It kills the relation subgroup and so descends to the higher Bloch group. |
| `deltaMap_map` | functoriality | Naturality for a field homomorphism. |
| `deltaMap_two_eq_blochBoundary` | compatibility | In weight two it is the rationalised Bloch boundary of K3BlochGroups V.3. |

**Used by.** *P.4's higher Bloch groups*: the relation subgroup is defined inside the kernel of this map. *P.3's complexes*: the differential of the polylogarithmic complex is this map tensored with the identity. *P.4's condition o_n*: the condition is that this map vanishes on the element.

**Unit tests.**

- `weight_two_boundary` — In weight two the map sends the generator at x to (1 - x) wedge x.
- `degenerate_zero` — The values at zero, one and infinity vanish.
- `descends` — The map is well defined on the quotient by the relation subgroup.
- `not_integral` — The weight-two map here is not the integral Bloch boundary: its target is the
  exterior square, not the antisymmetric quotient.

**Acceptance.**

- At n = 2 the map is the rationalised Bloch boundary of K3BlochGroups V.3.
- The values at zero, one and infinity are zero.
- The map descends to B_n(F), which is the content of the joint induction.

**Depends on.** **other roadmaps** `K3BlochGroups:V.3`; **baseline** `mathlib:FreeAbelianGroup`, `mathlib:TensorProduct`, `mathlib:exteriorPower.map`, `mathlib:Additive`.

**Source.** GR.2022, 1.1, item 4 (PDF p. 4): “We define by induction a map Q[F] -> delta_n : B_{n-1}(F) tensor F^x_Q for n >= 2, F^x_Q wedge F^x_Q for n = 2, {x} -> {x}_{n-1} tensor x for n >= 2, (1 - x) wedge x for n = 2, delta_2{1} = delta_2{0} = 0. It is handy to add a generator {infinity} together with the relation {infinity} = 0.” — The map and its degenerate conventions, as displayed.

### `higher-bloch-group` — Zagier's higher Bloch groups ★

*definition* · planet **Higher Bloch groups**

For a field F define, by induction on n at least one, a subspace R_n(F) of the rational vector
space on F reflecting the functional equations of the classical n-logarithm, and set B_n(F) to
be the quotient. R_1(F) is generated by the elements at xy minus those at x and at y, together
with the generator at zero, so that the weight-one quotient is the rationalised units. For n at
least two, R_n(F) is generated by the elements obtained from an expression in the kernel of
delta_n over the rational function field F(t) by specialising t to one and to zero and
subtracting, together with the generator at zero. The class of a generator is written with the
weight as a subscript. The convention is the rational one of the source, which differs from the
integral definition by tensoring.

**Hypotheses.** F is a field. n is a positive integer. All groups are rational.

**Construction and proof.**

1. Define R_1(F) by the displayed generators and check that the quotient is the rationalised
   units.
1. For n at least two define the subspace by the specialisation recipe, inside the kernel of
   delta_n, and prove that it is a subspace.
1. Prove the joint induction with the previous node: delta_n kills R_n(F), so that it descends
   to the quotient.
1. Prove functoriality for a field homomorphism, and the behaviour under a finite extension.
1. Record the two conventions: the source's groups are rational; the integral groups of
   Goncharov are a different object, and the weight-two integral group is the Bloch group of
   K3BlochGroups V.3, which is why the two roadmaps are not planning the same thing.
1. Record the theorem that makes the definition the right one: the single-valued polylogarithm
   induces a map from B_n(C) to the reals, so the relation subgroup really is a subgroup of
   functional equations.

**API.**

| name | role | statement |
| --- | --- | --- |
| `higherBloch` | data | The rational vector space B_n(F). |
| `higherBloch.mk` | constructor | The class of a generator, with the weight as a subscript. |
| `higherBloch.one` | compatibility | The weight-one group is the rationalised units. |
| `higherBloch.two` | compatibility | The weight-two group is the rationalised Bloch group of K3BlochGroups V.3. |
| `higherBloch.lift` | universal-property | A map on generators killing the relation subspace descends. |
| `higherBloch.map` | functoriality | A field homomorphism induces a map of higher Bloch groups. |

**Used by.** *P.3's complexes*: every term of the polylogarithmic complex is one of these groups tensored with an exterior power. *P.4's Zagier statement*: the elements of the statement are elements of B_n(F) with vanishing delta. *HabiroNumberFields and K3BlochGroups V.3*: the weight-two case is the rationalisation of the integral Bloch group those layers own.

**Unit tests.**

- `weight_one` — B_1(F) is the rationalised units.
- `weight_two` — B_2(F) is the rationalised Bloch group.
- `polylog_descends` — The single-valued polylogarithm descends to B_n(C).
- `not_integral` — B_2(F) is not the integral Bloch group: the two differ by torsion, which is
  the point of the two conventions.

**Acceptance.**

- The weight-one group is the rationalised units.
- The weight-two group is the rationalisation of the Bloch group of K3BlochGroups V.3.
- The single-valued polylogarithm descends to B_n(C), which is the acceptance test that R_n
  consists of functional equations.
- The reality relation is not in R_n, because it is not an algebraic functional equation.

**Depends on.** **inside this roadmap** `delta-map`, `single-valued-polylogarithm`, `distribution-and-inversion`; **other roadmaps** `K3BlochGroups:V.3`; **baseline** `mathlib:FreeAbelianGroup`.

**Source.** GR.2022, 1.1, item 4 (PDF p. 4): “one defines inductively for each n >= 1 a subspace R_n(F) in Q[F] reflecting functional equations for the classical n-logarithm function, and set B_n(F) := Q[F] / R_n(F). ... Any expression sum n_i {f_i(t)} which lies in the kernel of delta_n for the field F(t) gives rise to an element sum n_i ({f_i(1)} - {f_i(0)}). The subgroup R_n(F) is generated by all elements obtained this way, and {0}.” — The definition, the specialisation recipe and the map that justifies calling R_n a group of functional equations, all as displayed.

### `condition-o-n` — The condition o_n

*definition*

An element y of B_n(F) satisfies the condition o_n when delta_n of y vanishes, that is, when y
lies in the first cohomology of the weight-n polylogarithmic complex. The condition is a
property of the element, decidable against a presentation, and it is what an element must
satisfy before it can appear in the Zagier determinant.

**Hypotheses.** F is a field; n is at least two; y lies in B_n(F).

**Construction and proof.**

1. Define the condition as the vanishing of delta_n.
1. Identify the set of such elements with the first cohomology of the weight-n complex, which is
   the kernel of the first differential since the complex starts in degree one.
1. Prove that the condition is preserved by the maps induced by field homomorphisms.
1. Record that Zagier's original formulation uses different subgroups, defined only for number
   fields, and that the two are compared but not identified here.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ConditionO` | characterisation | The predicate that delta_n of the element vanishes. |
| `conditionO_iff_H1` | characterisation | It holds exactly for the elements of the first cohomology of the weight-n complex. |
| `conditionO_subspace` | structure | The elements satisfying it form a subspace. |
| `conditionO_map` | functoriality | It is preserved by the induced maps. |

**Used by.** *P.4's Zagier statement*: the elements of the determinant are required to satisfy it. *P.3's special-value theorem*: the weight-three statement uses the same condition in weight three.

**Unit tests.**

- `weight_two` — In weight two the condition is membership in the rationalised Bloch group.
- `subspace` — The elements satisfying the condition form a subspace.
- `not_automatic` — A generic generator does not satisfy the condition.

**Acceptance.**

- At weight two the condition is exactly membership in the rationalised Bloch group.
- The set of elements satisfying the condition is a subspace.
- An arbitrary element of B_n(F) does not satisfy the condition, so the condition is a real
  restriction.

**Depends on.** **inside this roadmap** `higher-bloch-group`, `delta-map`, `polylogarithmic-complex`.

**Source.** GR.2022, 1.1, item 5 and footnote 7 (PDF p. 5): “The condition o_n. It simply says that delta y = 0 for an element y in B_n(F), i.e., y in H^1 B(F; n). ... Zagier's conjecture in its original formulation does not use groups B_n(F); it uses subgroups beta_n(F), defined for number fields only.” — The condition and the caveat about the original formulation, as displayed.

### `zagier-determinant` — The Zagier regulator determinant

*construction*

For a number field F, a weight n and a family of r_2 elements of B_n(F) (respectively r_1 + r_2
elements, according to the parity of n) satisfying the condition o_n, construct the matrix whose
entries are the values of the single-valued polylogarithm at the images of the elements under
the embeddings, and its determinant, together with the normalisation by the power of pi and the
square root of the discriminant that the statement uses.

**Hypotheses.** F is a number field; n is at least two; the elements satisfy the condition o_n.

**Construction and proof.**

1. Order the embeddings as the source does, so that conjugate embeddings are paired, and choose
   the representatives the parity of n requires.
1. Define the matrix entry at a place and an element as the value of the single-valued
   polylogarithm at the image.
1. Define the determinant and the normalising factor, the power of pi and the inverse square
   root of the absolute discriminant, exactly as displayed.
1. Prove that the determinant is well defined up to the sign coming from the ordering, and that
   it vanishes when the family is linearly dependent in the relevant cohomology.
1. Prove that the weight-two case is the determinant of P.2 and the weight-one case is the
   classical unit regulator pattern.

**API.**

| name | role | statement |
| --- | --- | --- |
| `zagierMatrix` | constructor | The matrix of polylogarithm values at the embeddings. |
| `zagierDet` | constructor | Its determinant with the normalising factor. |
| `zagierDet_dependent` | characterisation | The determinant vanishes on a linearly dependent family. |
| `zagierDet_two` | compatibility | In weight two it is the determinant of the weight-two regulator. |
| `zagierDet_sign` | relation | The dependence on the chosen ordering is by a sign. |

**Used by.** *P.4's statement of Zagier's conjecture*: the conjecture is an identity between this determinant and a zeta value. *P.3's weight-three theorem*: the weight-three statement is the same determinant with the trilogarithm. *SpecialValuesBirchTate B.8*: the normalised covolume infrastructure there follows the same pattern.

**Unit tests.**

- `weight_two_agrees` — In weight two the construction agrees with P.2's determinant.
- `dependent_vanishes` — A dependent family gives determinant zero.
- `matrix_size` — The matrix has size r_2 in even weight and r_1 + r_2 in odd weight.
- `normalisation` — Changing the power of pi changes the identity: the normalisation is not
  free.

**Acceptance.**

- In weight two the construction is the determinant of the weight-two regulator of P.2.
- The determinant vanishes on a dependent family.
- The normalisation is the displayed one; a different power of pi changes the statement and is
  not a matter of convention.

**Depends on.** **inside this roadmap** `condition-o-n`, `single-valued-polylogarithm`, `weight-two-regulator`; **baseline** `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.discr`, `mathlib:Matrix.det`, `mathlib:NumberField.Units.regulator`.

**Source.** GR.2022, Theorem 1.2 (PDF p. 5): “Then there exist elements y_1, ..., y_{r_2} in Ker delta_4 in B_4(F) such that zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_{r_1+i}(y_j))), 1 <= i, j <= r_2.” — The determinant and its normalisation, as displayed in weight four.

### `zagier-statement` — Zagier's statement, in three separate propositions ★

*theorem* · planet **Zagier's statement**

For a number field F and a weight n, state as three separate propositions: first, the existence
of a family of elements of B_n(F) satisfying the condition o_n whose determinant is nonzero;
second, the comparison of the first cohomology of the weight-n polylogarithmic complex with the
weight-n graded piece of rationalised K-theory; third, the numerical identity that the
normalised determinant of any such family is a nonzero rational multiple of the value of the
Dedekind zeta function at n. These are different propositions and are never collapsed into one.

**Hypotheses.** F is a number field; n is at least two.

**Construction and proof.**

1. State the existence proposition, with the condition o_n and nonvanishing of the determinant.
1. State the comparison proposition, which is the conjecture of the source for general weight
   and a theorem in weights two, three and four.
1. State the numerical identity, which is what the phrase Zagier's conjecture usually names.
1. Prove the implications that hold unconditionally between the three, and record which
   implications are open.
1. Record what a conjectural equality may not be used for: it cannot supply a constructor of
   Bloch elements, which is the rule the roadmap states.

**Acceptance.**

- In weight two all three propositions are theorems, by Zagier's 1986 result.
- In weight three all three are theorems, by Goncharov.
- In weight four all three are theorems, by Goncharov and Rudenko; the recorded restructure
  entry names the roadmap that would own that proof.
- For general n the second proposition is a conjecture in the source and is labelled as one
  here.

**Depends on.** **inside this roadmap** `zagier-determinant`, `condition-o-n`, `k-theory-comparison-weight-three`; **baseline** `mathlib:NumberField.dedekindZeta`.

**Source.** GR.2022, Theorem 1.1 and item 6 (PDF pp. 3, 5): “Then there exist elements y_1, ..., y_{r_2} in Q[F] satisfying a certain condition o_4 ... For any y_1, ..., y_{r_2} satisfying o_4 the right-hand side of (2) is equal to q times zeta_F(4) for some q in Q.” — The two halves the source separates, existence and the identity for any such family, quoted; the third proposition is the comparison the source states as a conjecture for general n.

### `weight-four-theorem` — The weight-four case is a theorem ★

*theorem* · planet **The weight-four theorem**

For every number field F the value of the Dedekind zeta function at four equals the normalised
determinant of the matrix of values of the single-valued 4-logarithm at the images of a family
of elements of the kernel of delta_4 in B_4(F), up to a nonzero rational; and for any such
family the normalised determinant is a rational multiple of that zeta value. This is Goncharov
and Rudenko's theorem, not a conjecture, and the packet records it as such.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. State the theorem in the source's form, with the displayed normalisation.
1. Record the architecture of its proof as the source describes it: the maps from the K-groups
   to the cohomology of the weight-four complex, the identification of the composition with
   Beilinson's regulator up to a nonzero rational, and Borel's theorem.
1. Record that this packet states the theorem and builds its statement infrastructure but does
   not plan its proof; the restructure entry names the roadmap that would.
1. Record the further consequence the source draws, the extension describing the weight-four
   part of the motivic Lie coalgebra, as a statement about which no claim is made here.

**Acceptance.**

- The statement uses the same determinant construction as every other weight, with n = 4.
- It is a theorem: the packet's restructure entry exists precisely because no roadmap currently
  owns its proof.
- The proof is not a consequence of the weight-three construction, which is what the roadmap's
  scope note says.

**Depends on.** **inside this roadmap** `zagier-statement`, `zagier-determinant`.

**Source.** GR.2022, Abstract and Theorem 1.2 (PDF pp. 2, 5): “We prove Zagier's conjecture on the value at s = 4 of the Dedekind zeta-function of a number field F: zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_i(y_j))), 1 <= i, j <= r_2.” — The theorem as stated in the abstract and proved in the paper.

### `freeness-extension` — The weight-four part of the motivic Lie coalgebra

*comparison*

Record the extension relating the weight-four part of the motivic Lie coalgebra of a field to
the higher Bloch groups: there is an exact sequence with B_4(F) on the left, the weight-four
part in the middle and the second exterior power of B_2(F) on the right. The source describes
this as strong evidence for the part of the Freeness Conjecture that describes it; it is not
proved there, and nothing in this packet assumes it.

**Hypotheses.** F is a field.

**Construction and proof.**

1. State the extension with its three terms, exactly as the source displays it.
1. Record its status: evidence for a conjecture, not a theorem, and the source says so in those
   words.
1. Record what depends on it in this packet: nothing. It is stated so that a later layer that
   needs it has a precise statement to cite, and so that no node silently assumes it.

**Acceptance.**

- The sequence is recorded as a conjecture, not used as a hypothesis.
- Its weight-two analogue is the identification of B_2 with the weight-two part, which is a
  theorem.
- No node of this packet has it as a prerequisite, which is the acceptance test.

**Depends on.** **inside this roadmap** `higher-bloch-group`.

**Source.** GR.2022, Abstract (PDF p. 2): “We get a strong evidence for the part of Freeness Conjecture describing the weight four part L_4(F) of the motivic Lie coalgebra of F via higher Bloch groups as an extension: 0 -> B_4(F) -> L_4(F) -> Lambda^2 B_2(F) -> 0.” — The extension and its status, as displayed.

## P.5 — Curves and regulator complexes

Coverage **partial**, for a reason the packet states: the regulator's target, the real
Deligne–Beilinson cohomology of a curve, is constructed by no stage of the atlas, and two
confirmed red-team findings ask for it to be planned once inside `MotivicEtaleKTheory:M.8`. So
P.5 owns what it can own — the curve complexes from the function field and its residues, the
**general** weight-two form `η(f,g) = log|f| d arg g − log|g| d arg f` with its Steinberg
relation through `D`, and the Chow dilogarithm reciprocity law that strengthens Suslin's for
`K₃ᴹ` — and every statement mentioning a Deligne class is conditional and says so.
`EllipticRegulators:ER.2` specialises the form; it does not own it.

### `curve-polylogarithmic-complex` — The low-weight polylogarithmic complexes of a curve ★

*construction* · planet **Curve polylogarithmic complexes**

For a smooth curve X over a field construct the weight-two and weight-three polylogarithmic
complexes of X from the complexes of its function field together with the residues at the closed
points, as the total complex of the resulting two-term diagram. Prove that the residues commute
with the differentials, so that the total complex is well defined, and define the subgroup of
unramified classes as the kernel of the total residue.

**Hypotheses.** X is a smooth curve over a field; its function field and closed points are the usual ones.

**Construction and proof.**

1. Import the polylogarithmic complexes of the function field from P.3 and the residues of P.3.
1. Form the diagram whose first row is the complex of the function field and whose second row is
   the sum over the closed points of the complex of the residue field, shifted, with the residue
   as the vertical map.
1. Prove that the vertical map is a map of complexes, and that for a fixed class only finitely
   many residues are nonzero.
1. Define the complex of X as the total complex, and the unramified classes as the kernel of the
   total residue.
1. Prove functoriality for a dominant map of curves, with the transfer, and the compatibility
   with the residues.

**API.**

| name | role | statement |
| --- | --- | --- |
| `curvePolylogComplex` | data | The total complex of the curve in weight two and weight three. |
| `curveResidue` | constructor | The total residue at the closed points. |
| `curveResidue_finite` | characterisation | Only finitely many residues of a class are nonzero. |
| `unramifiedClasses` | data | The kernel of the total residue. |
| `curvePolylogComplex_map` | functoriality | Functoriality for a dominant map, with the transfer. |

**Used by.** *P.5's regulator comparison*: the regulator is defined on the unramified classes. *EllipticRegulators ER.2*: the elliptic case specialises this construction, as the confirmed red-team finding asks. *P.5's reciprocity law*: the law is the statement that the total residue of a suitable class vanishes.

**Unit tests.**

- `first_term_unramified` — A class of the first term has vanishing residue.
- `finiteness` — Only finitely many residues are nonzero.
- `projective_line` — For the projective line the complex is the one the reciprocity law is
  stated for.
- `not_the_field_complex` — The curve complex is not the complex of the function field: they
  differ by the residue terms.

**Acceptance.**

- The residue of a class of the first term vanishes, so an element of B_n of the function field
  is automatically unramified in that degree.
- Only finitely many residues of a given class are nonzero, which is what makes the sum defined.
- For the projective line the complex reduces to the one the source's reciprocity law is about.

**Depends on.** **inside this roadmap** `residues-and-transfers`, `polylogarithmic-complex`; **other roadmaps** `K2SymbolsBrauer:T.4`.

**Source.** Gonch.Arakelov.2004, Abstract (PDF p. 1): “We study the Chow dilogarithm and prove a reciprocity law which strengthens Suslin's reciprocity law for Milnor's group K^M_3 on curves.” — The reciprocity law on curves this complex is built to state.

### `weight-two-regulator-form` — The weight-two regulator form of a curve ★

*construction* · planet **Weight-two regulator form**

For a smooth curve over the complex numbers and a symbol given by two nonzero rational
functions, construct the real one-form given by the logarithm of the modulus of the first
against the differential of the argument of the second, minus the same with the roles exchanged.
Prove its closedness away from zeros and poles, its behaviour around them, and the Steinberg
relation for it through the Bloch-Wigner function. This is the general curve formula;
EllipticRegulators ER.2 specialises it to an elliptic curve, and the confirmed red-team finding
asks for the ownership to be recorded this way.

**Hypotheses.** X is a smooth curve over the complex numbers; f and g are nonzero rational functions on X.

**Construction and proof.**

1. Define the one-form by the displayed expression, on the complement of the zeros and poles of
   both functions.
1. Prove that it is closed there, by computing its differential.
1. Prove the behaviour around a zero or a pole: the form has a logarithmic singularity whose
   residue is expressed through the orders and the tame symbol.
1. Prove the Steinberg relation through the Bloch-Wigner function: for g equal to one minus f
   the form is, up to an exact form, the differential of the Bloch-Wigner value of f, which is
   the identity that makes the regulator descend to symbols.
1. Record that the target of the regulator, the real Deligne-Beilinson cohomology of the curve,
   is not constructed here: no stage of the atlas owns it, and the packet records a request for
   it.

**API.**

| name | role | statement |
| --- | --- | --- |
| `regulatorForm` | constructor | The one-form attached to a pair of nonzero rational functions. |
| `regulatorForm_closed` | characterisation | It is closed away from the zeros and poles. |
| `regulatorForm_antisymm` | relation | It is antisymmetric in the two functions. |
| `regulatorForm_steinberg` | relation | For the Steinberg pair it is the differential of the Bloch-Wigner value, up to an exact form. |
| `regulatorForm_residue` | relation | Its behaviour around a zero or a pole, through the tame symbol. |

**Used by.** *EllipticRegulators ER.2*: that layer specialises the form to an elliptic curve and fixes the factor of two pi and the orientation. *P.5's comparison with the Chern character*: the comparison is stated for the class of this form. *P.2's regulator*: the weight-two number-field regulator is the zero-dimensional case of the same expression.

**Unit tests.**

- `constant_vanishes` — For constant functions the form vanishes.
- `steinberg` — For the Steinberg pair the form is the differential of the Bloch-Wigner value up
  to an exact form.
- `antisymmetry` — Exchanging the two functions changes the sign.
- `not_a_class` — The form is not a Deligne cohomology class until that cohomology is
  constructed, which this packet requests.

**Acceptance.**

- For f and g constant the form vanishes.
- For g equal to one minus f the form is the differential of the Bloch-Wigner value of f up to
  an exact form, which is the Steinberg relation.
- The form is antisymmetric in the two functions.
- The construction gives the form, not the class: the class needs the Deligne complex, which is
  requested.

**Depends on.** **inside this roadmap** `bloch-wigner-dilogarithm`, `curve-polylogarithmic-complex`; **other roadmaps** `EllipticRegulators:ER.2`.

**Source.** GR.2022, 1.1, item 1 (PDF p. 3): “For example, L_2(z) is the Bloch-Wigner dilogarithm.” — The function through which the Steinberg relation for the form is proved; the form itself is the classical weight-two regulator expression that EllipticRegulators ER.2 states for an elliptic curve.

### `chow-dilogarithm-reciprocity` — The Chow dilogarithm and the reciprocity law on a curve

*theorem*

Construct the Chow dilogarithm and prove the reciprocity law it satisfies on a curve, which
strengthens Suslin's reciprocity law for Milnor K_3. The law is the statement that a suitable
sum over the closed points of the curve, of local contributions built from the dilogarithm,
vanishes.

**Hypotheses.** X is a smooth projective curve over the complex numbers.

**Construction and proof.**

1. Import the construction of the Chow dilogarithm from the source, with its defining integral.
1. State the reciprocity law in the source's form, as the vanishing of the sum of local terms.
1. Record that the law strengthens Suslin's reciprocity law for Milnor K_3 on curves, which
   K2SymbolsBrauer T.4 owns in its own form, and prove the implication in that direction.
1. Record that only the statement and the comparison are planned here: the proof of the
   reciprocity law is in the source and is not decomposed further in this packet.

**Acceptance.**

- The law implies Suslin's reciprocity for Milnor K_3 on curves.
- Only finitely many local terms are nonzero.
- The weight-two analogue is Weil reciprocity, which K2SymbolsBrauer T.4 owns.

**Depends on.** **inside this roadmap** `curve-polylogarithmic-complex`, `bloch-wigner-dilogarithm`; **other roadmaps** `K2SymbolsBrauer:T.4`.

**Source.** Gonch.Arakelov.2004, Abstract (PDF p. 1): “We study the Chow dilogarithm and prove a reciprocity law which strengthens Suslin's reciprocity law for Milnor's group K^M_3 on curves.” — The theorem as the source states it.

### `deligne-target-request` — The target of the curve regulator, and what is missing

*comparison*

The weight-two and weight-three curve regulators take values in the real Deligne-Beilinson
cohomology of the curve. No stage of the atlas constructs that cohomology in general:
EllipticRegulators ER.2 builds the real Deligne complex only in degree two and weight two for an
elliptic curve, and MotivicEtaleKTheory M.8 constructs only the cycle-class maps into it. This
node states the comparison that P.5 owes and records the missing input as a request, rather than
inventing a second Deligne complex here.

**Hypotheses.** X is a smooth curve over the real or complex numbers.

**Construction and proof.**

1. State the comparison this layer owes: the class of the regulator form is the image of the
   corresponding K-theory class under the Beilinson regulator, in the degrees the source
   establishes.
1. Record what is missing: the real Deligne-Beilinson complex for smooth varieties over the
   reals, with its products and long exact sequence, and the universal Deligne regulator.
1. Record where it should live, following the confirmed red-team finding: as an early part of
   MotivicEtaleKTheory M.8 that needs no BorelRegulators input, so that R.7, M.8, ER.2 and P.5
   can all import it.
1. State the consequence for this packet: every statement of P.5 that mentions a Deligne class
   is conditional on that construction, and each such statement says so.

**Acceptance.**

- The statement is conditional and says so; no node of this packet proves a Deligne-cohomology
  statement.
- The elliptic case of ER.2 is a special case of the requested construction, not a substitute
  for it.
- The libraries contain no Deligne cohomology, which the reviewed audit records.

**Depends on.** **inside this roadmap** `weight-two-regulator-form`, `curve-polylogarithmic-complex`; **other roadmaps** `MotivicEtaleKTheory:M.8`, `EllipticRegulators:ER.2`.

**Source.** Gonch.Arakelov.2004, Abstract and introduction (PDF p. 1): “We construct an explicit regulator map from the weight n Bloch Higher Chow group complex to the weight n Deligne complex of a regular projective complex algebraic variety X.” — The regulator target whose general construction the atlas lacks.

## P.6 — Other precise statements and tests

Leopoldt in the two forms the roadmap names — injectivity of the completed global-unit map, and
nonvanishing of the p-adic regulator — with the equivalence proved modulo torsion, the abelian
case imported from `IntegralIwasawaTheory:L4`, and the conjecture never installed as a
hypothesis. Then the four tests, with the line drawn between what is proved (the conjugation
cancellation) and what is a numerical check with an error bound (the five-term evaluation). A
list of floating-point values is not a certificate: the boundary-proof requirement is discharged
by importing `K3BlochGroups:V.6`'s constructor, which refuses an element whose boundary has not
been proved to vanish.

### `leopoldt-statement` — Leopoldt's conjecture, in two equivalent forms ★

*definition* · planet **Leopoldt's conjecture**

For a number field F and a prime p, state Leopoldt's conjecture in two forms: first, that the
canonical map from the p-adic completion of the global unit group to the product of the local
unit groups at the places above p is injective; second, that the p-adic regulator, the
determinant built from the p-adic logarithms of a basis of the units at those places, is
nonzero. Prove that the two are equivalent after quotienting by torsion. Neither form is assumed
anywhere in constructing the local regulator or the Iwasawa cohomology.

**Hypotheses.** F is a number field; p is a prime. The global units are the units of the ring of integers.

**Construction and proof.**

1. Construct the completed global unit group and the map to the product of the local units,
   importing the p-adic logarithm from PadicHodgeRegulators.
1. Define the p-adic regulator as the determinant of the matrix of p-adic logarithms of a basis
   of the units modulo torsion, at the embeddings into the completions above p.
1. Prove that the determinant is independent of the chosen basis up to a unit, so that its
   nonvanishing is well defined.
1. Prove the equivalence of the two forms modulo torsion, by identifying the kernel of the map
   with the degeneracy of the determinant.
1. Record the proved special case, the abelian one, which IntegralIwasawaTheory L4 owns through
   the Baker-Brumer theorem, and state the general case as a conjecture.

**API.**

| name | role | statement |
| --- | --- | --- |
| `LeopoldtInjective` | characterisation | The injectivity form of the conjecture. |
| `padicRegulator` | constructor | The p-adic regulator determinant. |
| `padicRegulator_basis_independent` | characterisation | Its nonvanishing does not depend on the chosen basis. |
| `leopoldt_iff` | characterisation | The two forms are equivalent modulo torsion. |
| `leopoldt_abelian` | compatibility | The abelian case, imported from IntegralIwasawaTheory L4. |

**Used by.** *P.6's tests*: the statement is what the tests are about. *IntegralIwasawaTheory and AutomorphicPadicLFunctions*: both use the same closure of global units in local units; the statement is planned once, here.

**Unit tests.**

- `degree_one` — For the rationals the conjecture is trivially true.
- `abelian_case` — For an abelian field the conjecture holds, by the imported theorem.
- `equivalence` — The two forms are equivalent modulo torsion.
- `not_an_assumption` — No construction in this packet takes the conjecture as a hypothesis.

**Acceptance.**

- For a totally real field of degree one the conjecture is trivially true.
- For an abelian field the conjecture is a theorem, imported and not reproved.
- The two forms are equivalent modulo torsion, which is the acceptance test.
- The statement is a conjecture declaration, never a typeclass assumption used to prove
  something else.

**Depends on.** **other roadmaps** `IntegralIwasawaTheory:L4`, `PadicHodgeRegulators:D.3`; **baseline** `mathlib:NumberField.Units.regulator`, `mathlib:NumberField.InfinitePlace`, `mathlib:Matrix.det`.

**Source.** GR.2022, 1.1, item 2 (PDF p. 3): “Zagier's conjecture predicts that the classical regulator formula Res_{s=1} zeta_F(s) = 2^{r_1+r_2} pi^{r_2} R_F h_F / (w_F sqrt|d_F|) for the residue of the Dedekind zeta-function of a number field F at s = 1 has analogs for zeta_F(n).” — The archimedean regulator whose p-adic analogue Leopoldt's conjecture is about; the p-adic statement is standard and is set out here in the two forms the roadmap names.

### `tests` — The tests of the layer

*application*

Collect the four tests the roadmap requires: the five-term relation evaluated at algebraic
points with certified numerics, the cancellation of the weight-two function at real embeddings
by conjugation, the weight-three differential identity, and the requirement that every claimed
Bloch element carries a boundary proof. The last is discharged by importing the constructor of
K3BlochGroups V.6, which refuses an element whose boundary has not been proved to vanish.

**Hypotheses.** The field is a number field or the complex numbers, as each test requires.

**Construction and proof.**

1. State the five-term test: evaluate the relation at an explicit five-tuple of algebraic points
   using the certified numerics of P.2, with the error bound smaller than the claimed gap.
1. State the conjugation test: at a real embedding the weight-two function vanishes, so the
   regulator component is zero, which is proved rather than checked numerically.
1. State the weight-three differential identity as a test of the normalisation of the
   trilogarithm.
1. State the boundary-proof requirement and discharge it by importing the constructor of
   K3BlochGroups V.6; a list of floating-point values is not a certificate, which is the rule
   the roadmap states.
1. Record which tests are proofs and which are numerical checks with error bounds; they are
   different, and the packet says which is which.

**Acceptance.**

- The five-term test passes with a certified bound, not with a bare numerical coincidence.
- The conjugation test is a proof, not a numerical check.
- A claimed Bloch element without a boundary proof is rejected, which is the acceptance test the
  roadmap names.

**Depends on.** **inside this roadmap** `certified-numerics`, `bloch-wigner-five-term`, `single-valued-polylogarithm`; **other roadmaps** `K3BlochGroups:V.6`.

**Source.** GR.2022, 1.1, item 3 (PDF p. 4): “Then for any five distinct points s_1, ..., s_5 on CP^1 we have: sum_{i=1}^{5} L_2([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0.” — The relation the first test evaluates.

## Requests to other roadmaps

- `K3BlochGroups:V.3` — The integral pre-Bloch group, the five-term relation in its
  normalisation, the boundary into the antisymmetric tensor quotient and the integral Bloch
  group. P.2 descends the Bloch-Wigner function through exactly that convention, and P.4's
  weight-two higher Bloch group is its rationalisation; neither is rebuilt here.
- `K3BlochGroups:V.4` — The configuration complex of points of the projective line, the cross-
  ratio and Suslin's exact sequence. P.2 imports the configuration machinery for the cocycle and
  the exact sequence for the Borel comparison.
- `K3BlochGroups:V.6` — The constructor that refuses a Bloch element whose boundary has not been
  proved to vanish, and the five-term certificate format. P.6's fourth test is discharged by
  importing them.
- `BorelRegulators:R.7` — The comparison of the Borel map with the Beilinson-Deligne regulator,
  with its precise scalar. P.2's and P.3's comparisons are stated against it.
- `BorelRegulators:R.3` — Borel's rank theorem, which fixes the size of the regulator matrix in
  each weight and parity.
- `MotivicEtaleKTheory:M.8` — The real Deligne-Beilinson complex for smooth varieties over the
  reals, with its products, its long exact sequence and the universal Deligne regulator, as an
  early part that needs no BorelRegulators input, so that R.7, M.8, EllipticRegulators ER.2 and
  P.5 can all import it. Two confirmed red-team findings ask for exactly this, and P.5 is
  blocked on it.
- `MotivicEtaleKTheory:M.7` — The Adams filtration on rationalised K-theory and its weight-
  graded pieces, against which P.3's comparison is stated.
- `EllipticRegulators:ER.2` — The elliptic specialisation of the weight-two regulator form, with
  the factor of two pi, the orientation and the torsion ambiguity. P.5 owns the general curve
  formula, as the confirmed red-team finding asks; ER.2 specialises it.
- `K2SymbolsBrauer:T.3` — The tame symbol of a discrete valuation, used for the residues of the
  weight-three complex.
- `K2SymbolsBrauer:T.4` — Weil reciprocity and the Bass-Tate transfers on a curve, the weight-
  two analogue of the reciprocity law P.5 states in weight three.
- `IntegralIwasawaTheory:L4` — The abelian case of Leopoldt's conjecture through the Baker-
  Brumer theorem, imported by P.6 and not reproved.
- `PadicHodgeRegulators:D.3` — The p-adic logarithm and the p-adic regulator machinery P.6's
  statement is phrased with.
- `ArithmeticQuantumTopology:QT.5` — The comparison of the real regulator of the Bloch element
  of a hyperbolic manifold with its volume. P.2 states the ideal-tetrahedron volume formula and
  leaves the manifold-level comparison there.
- `SpecialValuesBirchTate:B.8` — The statement infrastructure for higher regulator formulas with
  complex places, whose normalised covolume pattern P.4's determinant follows; the two should
  agree on the normalisation.

## Gaps

**Zagier's and Goncharov's original papers were not obtained.** The definitions of the higher Bloch groups, the polylogarithmic complexes and the single-valued
polylogarithms are read in Goncharov and Rudenko's paper, which states them in full and
attributes them to Zagier's 1990 paper and Goncharov's 1995 paper. Those two originals are not
freely available and were not read. Two statements are therefore used exactly as Goncharov and
Rudenko state them: that the relation subspace contains all functional equations depending non-
trivially on a parameter, and the proof that the single-valued polylogarithm descends to the
higher Bloch group, which they cite to Goncharov's 1994 paper, Theorem 1.5.

**The weight-three theorem is stated, not decomposed.** The weight-three special-value theorem is attributed by the source to Goncharov's 1991 and 1995
papers, which were not obtained. This packet states the theorem, builds its statement
infrastructure and records the architecture of the weight-four proof that the source describes,
but it does not decompose the weight-three proof into nodes. A continuation that obtains the
originals should do so.

**The target of the curve regulator has no owner.** The real Deligne-Beilinson cohomology of a smooth variety over the reals is constructed by no
stage of the atlas: EllipticRegulators ER.2 builds only the degree-two weight-two complex for an
elliptic curve, MotivicEtaleKTheory M.8 only the cycle-class maps into it, and the pinned
libraries have none. This is the subject of two confirmed red-team findings, and the packet
records a request rather than planning a second Deligne complex here. P.5's coverage is partial
for this reason.

**The proof of the weight-four theorem is not planned anywhere.** Goncharov and Rudenko's theorem is recorded here as a theorem, and its statement infrastructure
is built, but no roadmap plans its proof, which needs motivic correlators and cluster
polylogarithms. The restructure list proposes the Part II that would own it.

## Structure

**The Bloch-Wigner nodes belong here, not to K3BlochGroups V.3.** The red-team finding RT-AREA-ktheory-2/27, confirmed by REV-RT-AREA-ktheory-2, records that
research/blueprint/reserved-ids.json reserves the Bloch-Wigner function and its five-term
identity as nodes of K3BlochGroups V.3 although P.1 plans them, and its fix is to re-reserve
them here. This packet implements that fix: P.1/bloch-wigner-dilogarithm and P.1/bloch-wigner-
five-term are nodes of this packet, with P.2 keeping the descent to the Bloch group and
K3BlochGroups V.3 keeping the algebraic pre-Bloch group, the five-term relation and the Bloch
group. The companion packet for K3BlochGroups delivers its two reserved ids as required by its
own job, imports the construction from here rather than rebuilding it, does not mark them as
planets, and carries the matching restructure entry. Applying the fix means retiring those two
ids from K3BlochGroups and pointing its consumers at the two nodes here.

**A Part II for the proof of the weight-four theorem.** The red-team finding RT-AREA-ktheory-2/51, confirmed by REV-RT-AREA-ktheory-2, records that P.4
treats the weight-four Zagier theorem as a separately identified extension although it is a
published theorem, and that no roadmap owns it. Its fix is to record it as a theorem, which this
packet does, and either to plan its proof in P.4 or to name its owner. The proof needs motivic
correlators, cluster varieties and the cluster polylogarithm maps, which is a body of
mathematics far larger than the statement infrastructure P.4 owns, so the proposal is a new
roadmap extending this one, titled, in the form section 15 requires, Polylogarithms, explicit
regulators and Zagier statements, Part II: weight four via motivic correlators and cluster
polylogarithms, with this roadmap as its first prerequisite. Its scope would be the motivic
correlators of the source's section 2, the cluster polylogarithm maps of its sections 3 and 4,
the map from the weight-three to the weight-two groups of its section 5, and the weight-four
Beilinson regulator of its section 9.

**The general weight-two curve regulator form belongs to P.5, and its target to M.8.** The red-team findings RT-AREA-ktheory-2/7 and /24, both confirmed, record that P.5 and
EllipticRegulators ER.2 plan the same weight-two regulator form and that no stage owns the real
Deligne-Beilinson complex in general. This packet follows their fix: P.5 owns the general curve
formula for the form, with its closedness, its residues and the Steinberg relation through the
Bloch-Wigner function, and ER.2 is expected to specialise it to an elliptic curve with the
factor of two pi and the orientation. The Deligne complex is requested from MotivicEtaleKTheory
M.8 as an early part needing no BorelRegulators input, and every statement of P.5 that mentions
a Deligne class is conditional on it. P.5's coverage is partial for that reason.

## Mistakes found in the sources

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms.json

reports 0 errors and 0 warnings against the pinned declaration index. The suggested Lean file was not compiled: no Lean toolchain at the pinned commits was available in this session, and the file is signatures and `example` statements only.
