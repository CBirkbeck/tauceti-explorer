# RT-AUDIT-19 — independent red team

Agent: Codex — codex-a71f92. Completed 2026-09-26. Refs #1588.

Two corrections are substantiated, both in the finite-field audit. Neither
changes a layer's library classification. One target has an insufficiently
specified nondegeneracy condition that admits a counterexample over its natural
coefficient field; one summary drops the Gauss-product sign. Both are high under
PROTOCOL §17's false-statement criterion, although the second has a very small
repair. The separate current finite-field blueprint already contains the
correct perfect-power distinction. This report does not request another owner
or another construction of it.

## Scope and baseline

I did neither AUDIT-19 nor REV-AUDIT-19. The input is the accepted,
review-enriched `research/blueprint/audit/AUDIT-19.result.json`, read with
`research/blueprint/reviews/REV-AUDIT-19.md`, the five complete roadmap documents,
their atlas stages, and the library-coverage overlay at explorer
`c2588eb3e2f4a9c64787d242c2888d2fde0100fe`.

The implementation baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Later roadmap packets and suggested
files are not additions to those libraries.

The actual inventory is 41 layers and 192 target entries: 152 absent, 29 partial,
9 Mathlib and 2 both. There are 259 citation occurrences, 202 distinct cited
declarations and 144 distinct cited files. I resolved the library/name/file/line
coordinates in the declaration index, opened each distinct statement with its
section hypotheses, and checked each reuse against its target and fit label.
The older review's prose inventory is not the current census.

All 41 coverage records agree exactly with the accepted audit, including the
ordered targets, notes and duplicates. Their verdicts are 33 not built, 5 process
and 3 partly built: HQ.1, FF.0 and FF.1. No mismatch in those classifications
was established. An absent target with a related citation is not an assertion
that the cited theorem itself is absent.

## Findings

### RT-AUDIT-19/1: a non-power need not give cancellation

Location: the second target of `FiniteFieldsAndCharacterSums:FF.2` in the audit.
Its condition is that the polynomial is not an `ord(χ)`-th power. It gives
neither the ambient extension in which this is tested nor a definition of the
parameter `m` in `(m − 1)√q`.

Here is a complete counterexample to the ordinary `F_q[X]` reading. Over `F₅`,
take the quadratic character, extended by zero, and `f(X)=2X²`. The nonzero
squares are 1 and 4. A polynomial square cannot have leading coefficient 2,
so `f` is not a square in `F₅[X]`. For `x=0,1,2,3,4`, the values of `f(x)` are
`0,2,3,3,2` and the character values are `0,−1,−1,−1,−1`. Their sum is −4.
There is one distinct geometric root. The proposed bound is therefore zero;
even taking `m=deg(f)=2` would give `√5<4`.

This calculation uses exactly the conventions of the pinned
[`quadraticChar` API](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean#L120):
multiplicativity, `quadraticChar_zero` (line 130), `quadraticChar_sq_one'`
(140), and `quadraticChar_neg_one_iff_not_isSquare` (159).

The correction is to exclude **constant multiples** `c h^e`, where `e` is the
nontrivial character's order, or to test the power condition over an algebraic
closure. Over that closure `2X²` is a square. Specify `m` as the number of
distinct geometric roots, a nonzero polynomial, complex-valued character and
zero extension. Kopparty's [2013 notes, Theorem 4, p. 5](https://www.math.toronto.edu/swastik/courses/rutgers/finitefields-F13/polycharsum.pdf)
explicitly exclude `cQ^e`. That note is corroboration of the hypothesis, not of
the audit's sharper root-count coefficient: its numerical bound is weaker.

If the audit intended a geometric power condition, this is its missing
qualification, not an objection to the geometrically stated Weil bound. The
current partial packet already makes the qualification in
`FF.2/weil-bound-multiplicative` and computes the exceptional case in
`FF.2/multiplicative-perfect-power-sum`. Align the audit with those statements
and add the constant-multiple rejection test to its degenerate-case note. Do
not create duplicate nodes or change `absent` to `built`. The mixed-sum clause
needs its own hypotheses; this repair does not establish that separate theorem.

### RT-AUDIT-19/2: preserve the additive character in the Gauss product

Location: the finite-field roadmap summary in the audit. It writes
`g(χ)g(χ⁻¹)=q`. With a fixed primitive additive character, the right side is
`χ(−1)q`. The detailed FF.1 target is correct: it inverts the additive character
as well as the multiplicative one.

The pinned [Gauss-sum file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean#L188)
settles this directly. `gaussSum_mul_gaussSum_eq_card` (188) has both inverses;
`gaussSum_mul_gaussSum_pow_orderOf_sub_one` (205) retains the additive character
and the sign; `gaussSum_sq` (222) specializes to quadratic characters. All need
the stated nontriviality/primitivity hypotheses.

For an exact small example take `F₃`, its quadratic character, and
`ψ(1)=ζ`, where `ζ` is a primitive cubic root of unity. Then `χ=χ⁻¹`,
`g=ζ−ζ²`, and `g²=ζ+ζ²−2=−3`. The summary would return +3.

Write `g(χ,ψ)g(χ⁻¹,ψ⁻¹)=q` with the hypotheses, matching FF.1, or write the
same-`ψ` identity with `χ(−1)`. No new library theorem is needed. Keep the
correct detailed target and partly-built verdict.

## Library attack and rejected leads

For every absent target and missing portion of a partial target I searched the
declaration index first, then both complete pinned Lean trees using alternative
names. The search was grouped by the mathematical object, not only the spelling
in the audit:

- Habiro/q-differentials, Jackson/skew derivations, q-de Rham/q-Witt,
  lambda/delta/prismatic structures; animation, cotangent complexes, derived
  completion/tensor products, décalage, spectra and cyclotomic traces; ghost
  injectivity and torsion hypotheses.
- Nearby/vanishing cycles, local acyclicity, constructible/lisse/perverse
  sheaves, Tate modules/twists, tame inertia, monodromy filtrations, pencils,
  Veronese/Bertini/blow-ups, nilpotent log and p-adic Lie theory.
- Weil numbers, purity/weights, Rosati/Kuga–Sato, variety/function-field zeta
  functions, trace/duality/comparison, determinant reciprocity, Pfaffian/parity,
  power sums, Hodge index and product-of-curves intersections.
- Finite-field tensor decompositions, Gauss/Jacobi/Hasse–Davenport,
  Stickelberger/Kloosterman, factorization algorithms and Hensel factor lifting,
  point counting, Galois rings, linearized/Ore/permutation polynomials,
  sequences/correlation, evaluation/BCH/Reed–Solomon/residue codes and finite
  harmonic analysis.

Important near-hits were opened and rejected for specific reasons. Mathlib's
derived category of an abelian category does not provide the constructible
étale six-operation package. Its ghost-map bijectivity needs invertibility of
`p`; that is not the requested torsion-free injectivity interface. Topological
covering-space monodromy is not étale nearby cycles. Nilpotent exponential is
not a unipotent logarithm or a monodromy filtration. General normed-algebra
series do not by themselves establish the required p-adic convergence and Lie
group structure; the rational-nonnegative continuous scalar-action assumption
on the candidate logarithm is material. The existing even-dimension result
for real symplectic spaces is not the general coefficient-field parity theorem.

The elliptic endgame remains conditional on its Frobenius/torsion inputs; its
presence is not an unconditional Hasse bound. Frobenius/irreducibility criteria
and factor-degree certificates are ingredients, not a certified factorization
algorithm. Tau Ceti's Stickelberger result concerns number-field discriminants,
not Gauss-sum valuations; Schur–Zassenhaus and analytic BCH are also unrelated
name hits. Generic Ore polynomials do not alone supply the finite-field
additive-polynomial classification.

I also checked the complex conjugation formula `star_gaussSum_eq` (GaussSum,
line 89). Together with the product formula it supplies the familiar norm
calculation. The audit's narrower comment about no separately stated norm-square
lemma is not sufficient evidence for another finding; I do not report it as
an omitted implementation.

## Ownership and planning context

All 69 duplicate records resolve, and I read all 52 distinct destination
descriptions. Many are explicitly shared ingredients or imports, not proposals
to rebuild an entire supplier. The PR/DD/AI/EDS/RT boundaries in HQ, the
LPV/DWP/R34/Weil chain, and the surface-alternative/elliptic comparisons survive
that distinction. The general henselian-trait scope of LPV is not replaced by
a local-field theorem with finite residue field.

I checked relevant nonempty records in the EllipticCurves, AlgebraicCurves,
AlgebraicCodingTheory and LocalFieldsRamification link maps against the stage
descriptions. Coding supplies a common code carrier, Hamming data and matrix
interfaces; FF.4 still owns its evaluation/residue and BCH/Reed–Solomon families.
The general Fourier kernel is shared, while MacWilliams and character-sum
applications are different consumers. The unresolved lattice-code handoff is
already recorded as requiring a consumer contract, not an established edge.
No further substantiated ownership correction emerged from these checks.

The three integrated decompositions explicitly record partial source coverage
and unread inputs. I inspected those coverage and gap records; I did not
perform a new full source extraction or red-team all their nodes. Likewise,
the HQ packets and the finite-field packet remain planning documents. The
current reservations list contains none of these five roadmap names. None of
that changes the pinned implementation baseline.

## Public-source checks and limits

The following selected passages were read on 2026-09-26. These are hypothesis
and ownership checks supporting the audit attack, not claims of complete
paper-level verification:

- Wagner, [q-Hodge filtrations and Habiro cohomology, arXiv v2](https://arxiv.org/pdf/2510.04782v2):
  Definition 3.2, Lemma 3.3, Theorem 3.11, Theorems 4.11–4.12 and 4.22–4.23.
  Checked the chosen filtration, perfect covering, small-prime hypotheses and
  partial multiplication range against the HQ targets.
- Wagner, [q-Witt, arXiv v5](https://arxiv.org/html/2410.23078v5): the restriction-operator
  discussion in §1.3 and paragraph 3.11; and [ku, arXiv v1](https://arxiv.org/html/2510.06057v1),
  introductory paragraphs 1.7–1.11 for the E1/E2 and prime-2 caveats. No full
  proof verification of either paper is asserted here.
- Deligne, [Weil I, published IHÉS 43 (1974)](https://numdam.org/item/PMIHES_1974__43__273_0.pdf):
  1.6–1.7, 4.1–4.4 and 5.8–5.11. Checked degree/parity, the characteristic-2
  qualification, radical quotient and the compact-open monodromy statement
  over `Q_l`; these do not give an arbitrary-coefficient extension for free.
- Deligne, [Weil II, published IHÉS 52 (1980)](https://numdam.org/item/PMIHES_1980__52__137_0.pdf):
  3.6.1 and 6.2.8–6.2.13. Checked the arithmetic-model qualification on
  potential purity and the dual/support hypotheses in the invariant-cycle
  argument; hard Lefschetz is not needed to assert that argument's conclusion.
- Kopparty's notes linked in finding 1: Theorem 4 only, used for its explicit
  constant-multiple exclusion.

Searches give evidence of absence within the pinned libraries, not a theorem
that no differently organized development could exist. Private references and
unpublished candidate Lean files are not implementation evidence. The complete
status here means the accepted audit's targets, citations, verdicts and recorded
overlaps were rechecked; it does not mean its proposed mathematics is formalized.

## Validation and handoff

Ran `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-19.result.json`
and `python3 research/blueprint/intake.py check-files` on both deliverables.
No Lean file was changed or compiled. Only the two report files are submitted.
An independent verifier should check both findings before the normal fix job
updates the audit; the orchestrator owns regeneration of the coverage overlay.
