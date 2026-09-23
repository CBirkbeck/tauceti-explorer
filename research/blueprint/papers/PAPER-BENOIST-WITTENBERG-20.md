# Benoist–Wittenberg (2020): the integral Hodge conjecture for real varieties, I, extraction and routing

Issue [#1296](https://github.com/CBirkbeck/tauceti-explorer/issues/1296). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** O. Benoist and O. Wittenberg, *On the integral Hodge conjecture for real varieties, I*, Invent. Math. 222 (2020), 1–77.
  - The author-hosted published PDF was re-fetched; its SHA-256 (daeb43ec…) matches the checkpoint.
  - Crossref registers no erratum.
- **Items.** The result has **193 items: 7 library, 9 planned and 177 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Ten are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**New items.** Questions 2.1 (Voisin), 2.6, 2.16 and 4.9 had no items. They are now statement-only items.

**Findings rechecked.** These affect a stated result.
- **E1.** Theorem A(ii) and Theorem 3.16(ii) are false for a curve with a real point. The genus-one real curve y² = x³ − x makes the left side false and the right side true. The corrected scope (d ≥ 2 or X(R) = ∅) is in `main-even-genus`.
- **E3.** The Example 4.4 construction is impossible.
  - The action: f² = diag(ζ, ζ^(−1), ζ², ζ^(−2), ζ³, ζ^(−3), 1), so Λ_2 is spanned by x0x4, x1x5, x2² and x3². The antilinear action T of f on it satisfies T² = −1.
  - The consequence: no f-stable Y of the stated form exists.

**New finding.**
- **E10.** Remarks 5.10 (i) and (ii) announce the computations of CH_1(X) and CH_1(X)_tors without giving them.

**Reclassified to affect nothing.**
- **E4.** The Lemma 2.14 sign. Negation preserves the admissible subgroup.

**Gaps.**
- GAP-DIMENSION is resolved.
- GAP-CAMPEDELLI and GAP-QUARTIC are recorded as findings.
- The other nineteen are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Inventiones mathematicae 222 (2020), Theorem 3.16 (ii), p. 55, and its introduction form Theorem A (ii), p. 4. *Printed:* dim(X) > 0 *Correction:* Part (ii) needs dim(X) ≥ 2 whenever X(R) ≠ ∅. The hypothesis dim(X) > 0 of Theorem 3.16, and the hypothesis d ≥ 1 of Theorem A, are too weak: the case dim(X) = 1 with X(R) ≠ ∅ must be excluded. Part (i) is not affected by this counterexample.
- **E2** (misprint; affects nothing), Inventiones mathematicae 222 (2020), §2.2, the paragraph introducing the constant classes, immediately before Example 2.5. *Printed:* k ≥ 0 *Correction:* "let k > 0 be even": both assertions fail for k = 0.
- **E3** (error; affects a stated result), Published version, Example4.4 p.59; same data in arXiv v3 partie_1.tex lines3990–4023. *Printed:* Zariski dense *Correction:* No stable smooth complete intersection exists for the displayed action and one equation from each Λ_i. Replace the construction; its intended real-empty surface consequence remains unproved here.
- **E4** (misprint; affects nothing), Published version, Lemma2.14 proof p.43. *Printed:* δ=ι*(γ−π*α) *Correction:* δ=−ι*(γ−π*α). The lemma and equation(2.5) retain their statements.
- **E5** (misprint; affects nothing), Published version, §1.2.6 p.19, final ordinary real-locus pushforward. *Printed:* H^p(X(R)) *Correction:* The source of that pushforward is H^p(Y(R)), with the printed coefficient field F2; its target remains H^(p−c)(X(R)).
- **E6** (misprint; affects nothing), Published version, Lemma3.4 proof p.48, first sentence. *Printed:* ψ *Correction:* Use ψ′ for the map whose image is M*, as in the lemma statement.
- **E7** (misprint; affects nothing), Published version, §3.6.2 p.55, introductory definition of φ=ψ∘cl. *Printed:* Pic(X) *Correction:* The domain is CH_1(X). Pic(X)=CH_1(X) is only the surface case.
- **E8** (misprint; affects nothing), Published version, Proposition2.15 proof p.44, last sentence. *Printed:* P^k(R) *Correction:* Use P^k(C) inside the equivariant cohomology group to which Theorem1.26 is applied.
- **E9** (misprint; affects nothing), Published version, §2.1 p.37, sentence immediately after equation(2.1). *Printed:* H^{2k} *Correction:* Retain the subscript G in the group containing the admissible equivariant Hodge classes.
- **E10** (gap; affects a stated result), Published version, Remarks 5.10 (i) and (ii), pp.71–72. *Printed:* CH_1(X) ≃ Z ⊕ Z/2Z ⊕ (R/Z)^30; CH_1(X)_tors ≃ Z/2Z ⊕ (Q/Z)^30 for x0⁴ + x1⁴ = x2⁴ + x3⁴ + x4⁴ *Correction:* Treat both as announced computations: (i) needs the structure of the real points of the intermediate Jacobian of the quartic threefold of Proposition 5.7, and (ii) needs the analogue of Lemma 5.9 and [29, Proposition 7.7] for the displayed Fermat-type quartic.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **GAP-DIMENSION** (resolved). E1 records the d = 1 counterexample; main-even-genus carries the corrected scope.
- **GAP-SEMIALG** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-COMPARE** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-STEENROD** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-DUAL-LIMIT** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-EFFACEABILITY** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-GERSTEN** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-ABEL-JACOBI** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-QUADRATIC** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-PICARD** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-DIAGONAL** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-SURFACES** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-CAMPEDELLI** (recorded). E3: the construction of Example 4.4 is impossible as printed.
- **GAP-SPECIALIZATION** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-QUARTIC** (recorded). E10 records the two unwritten Remark 5.10 computations. The Betti number and fixed-point inputs are cited suppliers.
- **GAP-PART-II** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-VOISIN** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-REMARKS** (deferred). The secondary remarks rest on cited sources; the Lemma 2.14 sign is E4.
- **GAP-FOUNDATION-GRANULARITY** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-INTEGRATION-ORDER** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-KARPENKO** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.
- **GAP-MANGOLTE** (deferred). A cited supplier's proof or design work; the paper uses it as a black box.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of E4, or the earlier gap statuses, this continuation supersedes it.

## Benoist–Wittenberg I: extraction and routing checkpoint

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

### Source and read extent

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

### Example4.4: the displayed construction is obstructed (E3)

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

### Lemma2.14: exceptional self-intersection sign (E4)

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

### Other source findings

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

### Ownership decisions

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

#### Sites, support and coniveau

SF.2 owns the site/cohomology/comparison direction. It receives the exact real étale comparison and a named cohomology-with-supports/Cousin-resolution suffix. The CHK signature is precise: an infinite base field, an étale-stable category closed under the required projective-line construction, localization, étale excision and the key lemma; support homotopy invariance supplies the latter. Purity identifies the E1 terms and twists, whereas strict effaceability supplies the flasque resolution and E2 identification. These are distinct proof steps. See [CHK §5](https://webusers.imj-prg.fr/~bruno.kahn/preprints/bo.pdf).

The coniveau in SchemeKTheoryOperations:S.4 and MotivicEtaleKTheory:M.6/M.6a is K-theoretic. The arithmetic Kato complex in PAPER-DITTMANN-POP-23 belongs to HigherLocalFieldsAndHigherClassFieldTheory:HL.6 and has different residue terms. Neither is an existing implementation of BW's equivariant cohomology sequence. General norm-residue theory is imported from M.5, never duplicated here.

SF.5 receives intermediate Euler-characteristic indices and the finite-map/algebraic-equivalence congruences, using its existing Chow/intersection/Riemann–Roch direction. Kollár's index is the generator of the ideal of coherent Euler characteristics with bounded support dimension; over a nonempty real variety the zero-cycle index is one or two. The finite-cover genus argument uses a congruence modulo the target point index, not an equality of Euler characteristics. See [Kollár Proposition4, Lemma5 and Proposition14](https://arxiv.org/pdf/1312.3923v2).

#### Cycle realizations and selected Hodge cases

MC.0 owns correspondences and decomposition-of-diagonal actions. Universal zero-cycle support belongs there. MC.2 owns real-equivariant/Borel–Haefliger realizations, their proper-pushforward and cup compatibilities, admissible subgroups, norm and real-component maps, and the Bloch torsion realization. The geometric étale cycle map remains an import from EDC.3; general Chow operations remain SF.5's.

MC.7 already explicitly includes proof-scoped selected integral Hodge cases for divisors and curves. It therefore receives the real integral Hodge definitions, exact orthogonality, corrected even-genus criterion, examples, unramified obstruction and conditional torsion calculations. A separate new real-cycle roadmap would duplicate that existing direction. Broad predicates are kept separate from their proved special cases and from the paper's open questions.

The correct integration order needs finer sublayers than the current broad stage labels. SF.2's early sites/comparison precede M.5; its norm-residue-dependent coniveau suffix follows it. MC.2's early cycle maps precede MC.7's divisor/zero-cycle cases, which supply later compatibility applications. Do not create a blanket SF.2↔M.5 or MC.2↔MC.7 stage cycle. The 189-item dependency graph is acyclic; the fine-grained atlas integration is an explicit open task.

#### Shared equivariant topology

All eight upstream Algebraic Topology stage descriptions were read. They provide ordinary chains, products, local coefficients, finite-cover descent and manifold duality, not C2 fixed-locus equivariant cohomology or Steenrod squares. The same Part II already proposed for Benoist19 receives the semialgebraic extension, sign twists, equivariant purity, parity decompositions, γ-splittings, corrected self-dual sequence, affine/Lefschetz bounds and the Wu pushforward formula.

General real-closed definable geometry is imported from LogicAndDefinabilityInNumberTheory:LD.6, also used by the BKT20 route. Derived categories, the generic sheaf-H carrier, cyclic group resolutions and representation-theoretic Shapiro are imported from the pinned library. No second carrier for any of them is proposed.

The brief preserves the exact endpoints: finite Borel approximation uses i<n; Proposition1.7 requires j≡d−1 mod2; Proposition1.8 uses p<i−d; weak Lefschetz distinguishes i=d+1 from i>d+1. It also retains the γ factor in the dual real-block pairing. These details come from [§1 of BW](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf).

#### Shared quadratic-form extension

The three real-function-field inputs reuse Benoist19's QuadraticFormsRealFunctionFields proposal: the no-real-curve two-square theorem, the level/sign-symbol comparison, and the anisotropic-quadric seven-square bound. They import upstream quadratic forms, M.5 norm-residue and the existing higher-Pfister direction. The scalar field is any real closed R, not only ℝ. The precise Witt/Pfister proofs remain open prerequisites.

The new local equation computations stay in MC.7; the exceptional sign
adapter stays in MC.2. No eighth route or generic Koszul owner is introduced.

### Conventions and regression boundaries

The JSON uses concrete mathematical objects, not theorem-shaped opaque properties.

- Over arbitrary real closed R, X(R) carries its semialgebraic site; ordinary singular comparison is restricted to ℝ. Borel/sheaf equivariance is not identified with Bredon equivariance.
- Coefficients use Z(j)=i^jZ with parity sign action. Cohomology supported on X(R) and relative cohomology defined by extension by zero from its complement are distinct.
- Mod-two fixed-locus multiplication is convolution. Integral decomposition retains a possible top integral summand, and reduction is 1+β_F; the same convolution formula is not asserted integrally.
- The Steenrod pushforward operator is not degree-preserving. The real component of an equivariant cycle is controlled by all the required even-square conditions, not merely vanishing at real points.
- Universal surface support means support after **every algebraically closed extension C'/R**. The single field C=R(i) does not suffice in the general statement. The generalized Bloch conjecture mentioned in Remark5.3 is not a proved replacement.
- Lemma5.6 is stated under the full §5.4 hypotheses, because its proof uses the vanishing supplied by real integral HC and universal support.
- Proposition5.7's quartic torsion formula remains conditional over arbitrary R. Unconditional conclusions over ℝ need Part II. The full Chow group and Fermat calculation in Remark5.10 are assertions with additional unwritten calculations, not closed proofs.

### Library audit, gaps and validation

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

## Independent review (cc-fb70e5, 23 September 2026)

**Accept.** All seven routes accepted, coverage effectively complete, all ten findings confirmed, nothing
corrected in place and nothing added. The full review is in
[`reviews/REV-PAPER-BENOIST-WITTENBERG-20.md`](../reviews/REV-PAPER-BENOIST-WITTENBERG-20.md).

The recorded `daeb43ec…` matches byte for byte; the paper is 77 pages, read from the linearization `/N`
(this file's page tree is inside a compressed object stream, so a `/Count` scan returns nothing).

**The extraction's version discipline is what makes it checkable, and it is worth recording.** It states
that it read the author-hosted published version "with Inventiones pagination and DOI; not the 67-page
revised preprint". Simulating arXiv v3 instead contradicts six of the findings' locators — Theorem 3.16
comes out a Question, Lemma 2.14 a Proposition, Example 4.4 a Lemma, Lemma 3.4 a Remarks, and Remarks 5.10
does not exist at all, since §5 of the preprint ends at 5.9. All six are correct in the published text.
A reviewer who checked against the preprint would have filed six false accusations.

All 193 items carry a numbered locator. A precise statement total is not extractable from this PDF's text
layer — it glues equation numbers onto statement names, so "Lemma 1.5" followed by (1.43) reads back as
"Lemma 1.43" — but of the numbers that resolve cleanly the only genuinely uncited statement is Remark 2.7.
The twelve library declarations all exist (ten in Mathlib, two in Tau Ceti at the pinned `f790474`), and the
single detailed citation is exact: `normSq_eq_conj_mul_self` and `normSq_nonneg` at
`Mathlib/Basic/Complex/Basic.lean` lines 544 and 554, inside the recorded 544–555. Note that the evidence
sits in `libraryAudit.actualDeclarationsRead` rather than `baseline.declarations`, a thinner record than
some extractions keep here.

All seven routes hold up. Several routes into one roadmap split by stage is the corpus convention (55 papers
do it), and both Part IIs are joined proposals with **PAPER-BENOIST-19** under the same parents, with titles
reproducing the parent's exactly before the colon as PROTOCOL §15 requires; `QuadraticFormsRealFunctionFields`
is shared with PAPER-JANNSEN-16 as well.

**E1 is a counterexample to a published theorem, and it holds.** Theorem 3.16(ii) is printed as an *if and
only if* under `dim(X) > 0`. For `X = E : y² = x³ − x` over ℝ every hypothesis holds (the real integral Hodge
conjecture for 1-cycles being the trivial codimension-zero case), the right-hand side holds because the real
point kills the Brauer obstruction, and the left-hand side fails because the only 1-dimensional integral
closed subscheme of a curve is the curve, of genus 1. So `dim(X) ≥ 2` is needed when `X(ℝ) ≠ ∅`, and
Theorem A inherits the gap through `d ≥ 1`; Proposition 3.9, which the proof invokes, is where dimension two
is actually used. **E3** likewise refutes Example 4.4's construction: `T² = −id` on the weight-4 space, so no
line is `T`-stable and the asserted dense stable set cannot meet the asserted smooth locus — scoped, rightly,
as leaving the intended consequence unproved rather than false. **E10** is announced computations, not a
defective proof.
