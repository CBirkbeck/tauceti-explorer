# Benoist–Wittenberg I: extraction and routing checkpoint

Issue #1296 · third checkpoint · Codex, session codex-c83e7a · 2026-09-22.
Builds on merged PRs #1675 (codex-a71f92) and #1975 (cc-7b31c4).

Status: **partial**. There are 189 items: 7 library, 9 planned and 173 missing,
with every missing item routed once through the existing seven routes. All 48
definitions/constructions have API outlines and at least three mathematical tests.
The whole 77-page published paper has been read again in this checkpoint. The
transitive proof inventory is still open; no formalization or Lean compilation is claimed.

The principal new finding is an obstruction to the displayed surface construction in
Example4.4. Its antiholomorphic action cannot preserve the required one-dimensional
space of weight-four equations. The extraction now records that obstruction instead
of asserting existence of the impossible complete intersection. A separate sign
correction repairs Lemma2.14 without changing its conclusion. Both findings await
independent review under PROTOCOL §18.

## Source and read extent

The primary source is the [published 77-page article](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf),
Inventiones222(2020),1–77, DOI10.1007/s00222-020-00965-8. Its SHA-256 is
`daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9`.
This checkpoint read every page, proof and reference and visually checked pp.19,
34,37,43,44,48,55,59. The apparent projection-arrow problem on p.34 is **not** an
error: the printed arrow points in the intended direction.

The [arXiv v3 source](https://arxiv.org/src/1801.00872v3), dated11March2020,
has archive SHA-256 `25d11f433052792b396d274557d120f1fe0d1d3db4ba3d8f2d53168a64a01eb3`.
The Example4.4 passage, `partie_1.tex` lines3973–4048, agrees with the published
coordinate action, lift, eigencharacters and claimed stable family. Other supporting
paper reads listed in the JSON retain their earlier-worker provenance; they were
not all repeated here. Reid §2.1 and Godeaux §6 remain unread primary proofs.

## Example4.4: the displayed construction is obstructed (E3)

Write g=f². The printed action and chosen lift give weights
`w=(1,7,2,6,3,5,0)` modulo8 on the coordinates. A quadratic monomial x_i x_j
has weight w_i+w_j. The four equation spaces Λ_i have weight2i.

| Weight | Monomial basis |
| --- | --- |
| 0 | x0x1, x2x3, x4x5, x6² |
| 2 | x0², x1x4, x2x6, x5² |
| 4 | x0x4, x1x5, x2², x3² |
| 6 | x0x5, x1², x3x6, x4² |

Define `T(Q)(x)=conjugate(Q(f(x)))`. This is a polynomial and T is
conjugate-linear on coefficients. Direct substitution gives T²=g*. For the
weight-four basis `(a,b,c,d)=(x0x4,x1x5,x2²,x3²)`,

`T(a)=−b, T(b)=a, T(c)=−d, T(d)=c`.

Thus `T(Aa+Bb+Cc+Dd)=conjugate(B)a−conjugate(A)b+conjugate(D)c−conjugate(C)d`
and T²=−id on Λ_2. There is no nonzero T-stable complex line: if TQ=uQ,
then applying T again gives −Q=conjugate(u)uQ=|u|²Q, impossible for Q≠0.
This is an argument for every complex scalar, not an inference from sampled values.
The pinned scalar facts `Complex.normSq_eq_conj_mul_self` and
`Complex.normSq_nonneg` were read at Mathlib082e2d3.

It remains to justify why preservation of Y would force preservation of an equation
line; one must not simply assume that each equation is preserved individually.
For a smooth scheme-theoretic complete intersection of four quadrics in P⁶, twist
the ideal-sheaf Koszul resolution by2:

`0 → O(−6) → O(−4)^4 → O(−2)^6 → O^4 → I_Y(2) → 0`.

Regular sequences give exactness ([Stacks062F](https://stacks.math.columbia.edu/tag/062F)).
The negative twists have no global sections and the required intermediate
cohomology vanishes ([Stacks01XS, Lemma30.8.1](https://stacks.math.columbia.edu/tag/01XS)).
Breaking the sequence into short exact sequences therefore gives
`H⁰(I_Y(2))=span_C(Q0,Q1,Q2,Q3)`. Distinct weights imply that its intersection
with Λ_2 is precisely the nonzero line C Q2. Smoothness ensures that this is the
vanishing ideal of the reduced variety. If f(Y)=Y, substitution shows that T
preserves that ideal. Since T also preserves Λ_2, it must preserve C Q2,
contradicting the preceding calculation.

Consequently no f-stable smooth complete intersection of the prescribed type
exists. In particular the claimed dense stable family cannot meet the claimed
nonempty open locus of smooth complete intersections. This obstruction uses the
printed lift; it is not caused by dropping conjugation bars or changing a character.
The ambient C16 action itself exists, and avoiding Fix(f⁸) would imply freeness.
Those correct observations do not supply the impossible invariant surface.

The stable ID `campedelli-descent` now states this obstruction, with dependencies
on four new equation-space/operator/ideal items. `GAP-CAMPEDELLI` asks for a
replacement construction of the intended real-empty Picard-torsion example.
Neither nonexistence of all real Campedelli surfaces nor falsity of the main
Hodge-theoretic results follows from this computation. Generic Koszul and coherent
cohomology infrastructure remains shared; its exact supplying nodes are still
`GAP-FOUNDATION-GRANULARITY`, not a new duplicate roadmap.

## Lemma2.14: exceptional self-intersection sign (E4)

With ξ=c1(O_E(1)), the normal bundle of the exceptional divisor is O_E(−1).
The line-bundle normalization follows from
[Stacks02OS](https://stacks.math.columbia.edu/tag/02OS). The self-intersection
formula gives `i*i_*u=−ξ cup u`. Therefore, with the source's definitions,

`i*(γ−π*α)=−Σ_j ξ^(k−j)τ*β_j=−δ`.

The p.43 proof omits the minus sign when expressing δ as a restriction. Its
normalization `τ_*ξ^(r−1)=1` fixes the positive hyperplane convention. The blowup
of P² at a point, with β=1, checks the sign: the exceptional class restricts to
degree−1. Negation preserves the admissible subgroup, so δ remains admissible.
The upward induction in equation(2.5) then works unchanged. The theorem item now
includes this exact proof step and a separate sign adapter; the sign question is
removed from `GAP-REMARKS` while the general Gysin implementation remains open.

## Other source findings

E1 and E2 from the preceding checkpoint are retained: the even-genus equivalence
requires dimX≥2 when X(R) is nonempty, and the constant ω^{2k} paragraph requires
positive even k. The elliptic counterexample and k=0 argument remain in the JSON;
their corrected items are unchanged.

Five additional slips are recorded with precise locators and checks:

| Finding | Printed location | Correction |
| --- | --- | --- |
| E5 | §1.2.6, p.19, final pushforward | Domain uses Y(R), as in diagram(1.35). |
| E6 | Lemma3.4 proof, p.48, first sentence | The map with image M* is ψ′. |
| E7 | §3.6.2, p.55, domain of φ | Use CH_1(X); Pic(X) fits only in dimension2. |
| E8 | Proposition2.15 proof, p.44, final group | Use complex points P^k(C). |
| E9 | §2.1, p.37, after(2.1) | Retain G on equivariant cohomology. |

These are extracting-worker findings, not independent-review verdicts. A bounded
search of the authors' publication pages, arXiv history and title/erratum/Campedelli
queries found no matching correction on2026-09-22. The earlier statement that no
erratum exists is withdrawn: absence from that search is not proof of absence.
No message has been sent to the authors.

## Ownership decisions


| Route | Existing owner or shared extension | Missing items |
| --- | --- | ---: |
| Source | SchemeAndStackFoundations:SF.2 | 21 |
| Source | SchemeAndStackFoundations:SF.5 | 5 |
| Source | MotivesAndAlgebraicCycles:MC.0 | 4 |
| Source | MotivesAndAlgebraicCycles:MC.2 | 28 |
| Source | MotivesAndAlgebraicCycles:MC.7 | 63 |
| Part II | EquivariantTopologyRealVarieties | 49 |
| Part II | QuadraticFormsRealFunctionFields | 3 |

The two Part II IDs are the **same proposals already recorded in PAPER-BENOIST-19**, not competing owners. Their matching parent IDs, titles and areas are retained. They have not been treated as accepted atlas layers merely because a paper checkpoint proposes them. Integration should coalesce their source briefs.

### Sites, support and coniveau

SF.2 owns the site/cohomology/comparison direction. It receives the exact real étale comparison and a named cohomology-with-supports/Cousin-resolution suffix. The CHK signature is precise: an infinite base field, an étale-stable category closed under the required projective-line construction, localization, étale excision and the key lemma; support homotopy invariance supplies the latter. Purity identifies the E1 terms and twists, whereas strict effaceability supplies the flasque resolution and E2 identification. These are distinct proof steps. See [CHK §5](https://webusers.imj-prg.fr/~bruno.kahn/preprints/bo.pdf).

The coniveau in SchemeKTheoryOperations:S.4 and MotivicEtaleKTheory:M.6/M.6a is K-theoretic. The arithmetic Kato complex in PAPER-DITTMANN-POP-23 belongs to HigherLocalFieldsAndHigherClassFieldTheory:HL.6 and has different residue terms. Neither is an existing implementation of BW's equivariant cohomology sequence. General norm-residue theory is imported from M.5, never duplicated here.

SF.5 receives intermediate Euler-characteristic indices and the finite-map/algebraic-equivalence congruences, using its existing Chow/intersection/Riemann–Roch direction. Kollár's index is the generator of the ideal of coherent Euler characteristics with bounded support dimension; over a nonempty real variety the zero-cycle index is one or two. The finite-cover genus argument uses a congruence modulo the target point index, not an equality of Euler characteristics. See [Kollár Proposition4, Lemma5 and Proposition14](https://arxiv.org/pdf/1312.3923v2).

### Cycle realizations and selected Hodge cases

MC.0 owns correspondences and decomposition-of-diagonal actions. Universal zero-cycle support belongs there. MC.2 owns real-equivariant/Borel–Haefliger realizations, their proper-pushforward and cup compatibilities, admissible subgroups, norm and real-component maps, and the Bloch torsion realization. The geometric étale cycle map remains an import from EDC.3; general Chow operations remain SF.5's.

MC.7 already explicitly includes proof-scoped selected integral Hodge cases for divisors and curves. It therefore receives the real integral Hodge definitions, exact orthogonality, corrected even-genus criterion, examples, unramified obstruction and conditional torsion calculations. A separate new real-cycle roadmap would duplicate that existing direction. Broad predicates are kept separate from their proved special cases and from the paper's open questions.

The correct integration order needs finer sublayers than the current broad stage labels. SF.2's early sites/comparison precede M.5; its norm-residue-dependent coniveau suffix follows it. MC.2's early cycle maps precede MC.7's divisor/zero-cycle cases, which supply later compatibility applications. Do not create a blanket SF.2↔M.5 or MC.2↔MC.7 stage cycle. The 189-item dependency graph is acyclic; the fine-grained atlas integration is an explicit open task.

### Shared equivariant topology

All eight upstream Algebraic Topology stage descriptions were read. They provide ordinary chains, products, local coefficients, finite-cover descent and manifold duality, not C2 fixed-locus equivariant cohomology or Steenrod squares. The same Part II already proposed for Benoist19 receives the semialgebraic extension, sign twists, equivariant purity, parity decompositions, γ-splittings, corrected self-dual sequence, affine/Lefschetz bounds and the Wu pushforward formula.

General real-closed definable geometry is imported from LogicAndDefinabilityInNumberTheory:LD.6, also used by the BKT20 route. Derived categories, the generic sheaf-H carrier, cyclic group resolutions and representation-theoretic Shapiro are imported from the pinned library. No second carrier for any of them is proposed.

The brief preserves the exact endpoints: finite Borel approximation uses i<n; Proposition1.7 requires j≡d−1 mod2; Proposition1.8 uses p<i−d; weak Lefschetz distinguishes i=d+1 from i>d+1. It also retains the γ factor in the dual real-block pairing. These details come from [§1 of BW](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

### Shared quadratic-form extension

The three real-function-field inputs reuse Benoist19's QuadraticFormsRealFunctionFields proposal: the no-real-curve two-square theorem, the level/sign-symbol comparison, and the anisotropic-quadric seven-square bound. They import upstream quadratic forms, M.5 norm-residue and the existing higher-Pfister direction. The scalar field is any real closed R, not only ℝ. The precise Witt/Pfister proofs remain open prerequisites.

The new local equation computations stay in MC.7; the exceptional sign
adapter stays in MC.2. No eighth route or generic Koszul owner is introduced.

## Conventions and regression boundaries


The JSON uses concrete mathematical objects, not theorem-shaped opaque properties.

- Over arbitrary real closed R, X(R) carries its semialgebraic site; ordinary singular comparison is restricted to ℝ. Borel/sheaf equivariance is not identified with Bredon equivariance.
- Coefficients use Z(j)=i^jZ with parity sign action. Cohomology supported on X(R) and relative cohomology defined by extension by zero from its complement are distinct.
- Mod-two fixed-locus multiplication is convolution. Integral decomposition retains a possible top integral summand, and reduction is 1+β_F; the same convolution formula is not asserted integrally.
- The Steenrod pushforward operator is not degree-preserving. The real component of an equivariant cycle is controlled by all the required even-square conditions, not merely vanishing at real points.
- Universal surface support means support after **every algebraically closed extension C'/R**. The single field C=R(i) does not suffice in the general statement. The generalized Bloch conjecture mentioned in Remark5.3 is not a proved replacement.
- Lemma5.6 is stated under the full §5.4 hypotheses, because its proof uses the vanishing supplied by real integral HC and universal support.
- Proposition5.7's quartic torsion formula remains conditional over arbitrary R. Unconditional conclusions over ℝ need Part II. The full Chow group and Fermat calculation in Remark5.10 are assertions with additional unwritten calculations, not closed proofs.

## Library audit, gaps and validation

The checked pins remain Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
TauCetif790474821cf4256814db967cb154e7af3d0c369. Seven existing library items
are retained with their prior exact-declaration reads. The new complex scalar
facts were read in `Mathlib/Basic/Complex/Basic.lean` lines544–555, rather than
the deprecated forwarding module under `Mathlib/Data/Complex`.

This checkpoint refreshed 489 input files at `5d370bcf4f927e579d55ebd933bfac2933a8313d`,
reread the SF.2/SF.5 reviewed audit and MC.2/MC.7 stage descriptions, and preserved
the shared Part II identities. An absent reviewed MC audit does not establish
absence of a library theorem. The specialized operator calculation is not an
excuse to re-plan generic semilinear maps or complex-number arithmetic.

The named open gaps still include semialgebraic/real-site foundations, Steenrod/Wu,
CHK effacement, Gersten, real Abel–Jacobi, Witt/Pfister, Picard descent,
decomposition-of-diagonal and the other surface/quartic calculations. Main-paper
reading is complete; transitive proof closure is not. Example4.4 now requires a
replacement instead of further attempts to prove the displayed false assertion.

Checks: the paper checker, intake path/schema checker, exact single routing,
unique IDs, dependency acyclicity, API/test contracts and gap references passed.
An exact executable diagnostic passed2706 cases: polynomial conjugate-pullback
squares through degree4 for all eighth-root phases, the quadratic character
decomposition, an independent matrix-square check, cyclic orders and the
exceptional integer sign. It uses no floating point. These checks verify algebraic
identities; the geometric ideal argument and stable-line impossibility are the
prose proofs above. All144 definition/construction test contracts remain unexecuted
in Lean. This issue authorizes only JSON, report and handoff.
