# #551 finite plane-curve jets and sharp postulation — 2 October 2026

**Partial mathematical checkpoint; canonical integration and Lean elaboration remain unfinished.** Agent: ChatGPT Pro — cp-20261002-sr-c72e81. Job: BP-DeformationAndDerivedPatchingAlgebra--P7. Winning claim [5959759422](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5959759422), confirmed by [5959762254](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5959762254). Publication parent: `804df52206c95795837fda47eb802cd55d9a1d1b`.

Only this handoff changes. The packet, reader and suggested file retain their existing contents, all 96 node objects, reserved multiplicity definition, coverage statuses, requests and planets. The previous complete handoff, including its seven checked residue/length declarations, immutable proof archive, assembler checks, remaining source obligations and J01–J16 worklist, is preserved at the [publication parent](https://github.com/CBirkbeck/tauceti-explorer/blob/804df52206c95795837fda47eb802cd55d9a1d1b/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md). Its earlier computational and Lean receipts are historical receipts, not checks rerun here.

This checkpoint supplies a self-contained mathematical continuation of J07, J10 and J11: the actual curve-quotient length, its successive differences, an exact postulation-defect formula and the earliest cumulative agreement index. It includes native-carrier signature drafts and the complete exact-arithmetic regression program. These drafts are **not registered packet nodes or additions to the submitted suggested file**. No stage is closed and nothing is reported as formalised.

## 1. Conventions and ownership

Let k be any field, R = k[[x,y]] = MvPowerSeries (Fin 2) k, v = (x,y), f a nonzero series, d = ord(f) in the natural numbers, I = (f), A = R/I, and n the image of v in A. The field need not be algebraically closed, perfect or of characteristic zero; f need not be reduced or irreducible. Include d = 0: f is then a unit and A is the zero ring. The finite-jet results below still apply, but no nontrivial local-ring structure on that zero ring is asserted.

For N >= 0 put

    H_N = length_A(A/n^(N+1)),
    G_N = length_A(n^N/n^(N+1)),
    C(r) = binom(r,2), for r >= 0,
    P_d(T) = d(T+1) - d(d-1)/2 in Q[T].

C(0) = C(1) = 0. A binomial argument written with natural subtraction is truncated at zero. Rational expressions, particularly d-1 in P_d, are ordinary rational subtraction. Coefficient characteristic does not change these rational polynomials of integer lengths.

These are the existing cumulative `function`, graded `gradedFunction`, and eventual `polynomial` conventions of R03.3, not new definitions of Hilbert–Samuel multiplicity. Stacks [00K4](https://stacks.math.columbia.edu/tag/00K4) distinguishes its graded phi from cumulative chi; its use of the name Hilbert polynomial for the graded function is not silently substituted for this packet's cumulative convention.

The general owner stays DeformationAndDerivedPatchingAlgebra:R03.3. The key definition `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity` is unchanged. General completion, dimension/support comparison, graded Hilbert–Serre, tangent cones and arithmetic patching are not supplied by this special computation.

## 2. Finite-jet proof

### 2.1 Actual ideal powers and the ambient basis

For a finite set of variables and any commutative coefficient ring, a series g belongs to the algebraically generated variable ideal to the r-th power exactly when all its coefficients of total degree less than r vanish. One inclusion follows by multiplying r variables. For the converse, assign each multi-index alpha of degree at least r to one beta <= alpha of degree exactly r. There are only finitely many such beta. Collect the coefficients assigned to beta into a series g_beta at indices alpha-beta. Coefficientwise equality gives the finite sum g = sum_beta X^beta g_beta, placing g in the algebraic ideal power. For r = 0 the claim is simply membership in the unit ideal. No infinite sum of ideal elements or topological closure is used.

Consequently R/v^r has k-basis the classes x^i y^j with i+j < r. Spanning is finite total-degree truncation, not rectangular truncation. Independence follows because a polynomial supported in total degree less than r cannot belong to v^r unless each coefficient is zero. Its dimension is C(r+1), including r = 0.

For a nonzero series over a field, its least nonzero homogeneous part is a nonzero polynomial. The product of two such initial polynomials is nonzero in k[x,y], so ord(fg) = ord(f)+ord(g) for nonzero f,g. With ord(0) = infinity the corresponding statement also handles g = 0. This is the actual order argument behind the already planned `variable-ideal-power-order` and the built `MvPowerSeries.order_mul`; it does not need an independently assumed tangent-cone isomorphism.

### 2.2 The shifted sequence and the low-index branch

Suppose N >= d. Multiplication by f gives the actual R-linear map

    mu: R/v^(N+1-d) -> R/v^(N+1), [g] |-> [fg].

It is well-defined by the order lower bound. If fg belongs to v^(N+1), order additivity implies g belongs to v^(N+1-d), proving injectivity. The natural projection

    pi: R/v^(N+1) -> R/(I+v^(N+1))

is surjective. A representative in its kernel is fh+t with t in v^(N+1), hence belongs to the image of mu; conversely the image plainly maps to zero. Thus

    0 -> R/v^(N+1-d) -> R/v^(N+1) -> R/(I+v^(N+1)) -> 0

is exact. These are precisely the existing `shiftedJetMap` and `jetProjection`, not multiplication on a wrongly indexed common source and target.

If N < d, do not apply that shifted statement with natural subtraction. Instead f belongs to v^(N+1), so I+v^(N+1) = v^(N+1). This is the existing `jetProjection_below_order` branch. For example, f=x^4 and N=0 leaves the residue quotient unchanged, whereas multiplication by f on R/v is zero and is not injective.

### 2.3 Length, finiteness and the actual curve quotient

Use the native short-exact-sequence length theorem first as a sum identity in extended naturals:

    length_R(R/v^(N+1))
      = length_R(R/v^(N+1-d)) + length_R(R/(I+v^(N+1))).       (1)

The target is a quotient of the finite-dimensional k-space R/v^(N+1), so it is finite-dimensional over k. All three lengths in (1) are finite: for these series modules the existing residue comparison identifies R-length with k-length, hence with finite k-dimension. Only after this finiteness step may one take natural lengths and subtract. In particular no subtraction of infinite extended-natural lengths is used.

Let q:R->A be the quotient map. The identity (v.map q)^r = (v^r).map q and the built double-quotient algebra equivalence give

    A/n^r ~= R/(I+v^r).

The equivalence preserves the R-module structure; length over R equals length over A on A/n^r because R->A is surjective. This is the native `DoubleQuot.quotQuotEquivQuotSupₐ` followed by `Module.length_eq_of_surjective`. It is not an assumption that a newly defined jet has a desired dimension.

Using the ambient basis in (1), and using the separate low-index branch, proves for every N >= 0:

    H_N = C(N+2) - C(max(0,N+2-d)).                            (2)

For N < d, the second binomial is zero (its argument is at most one). For d=0 the two binomials cancel, as they must for a unit equation. The statement concerns the actual quotient ring and its own module length.

For f=0, finite d does not exist. Treat that boundary separately: I=0, A is R and H_N=C(N+2). Giving the zero equation order zero would incorrectly force H_N=0.

### 2.4 Successive quotients

For N >= 1 the native quotient projection has short exact sequence

    0 -> n^N/n^(N+1) -> A/n^(N+1) -> A/n^N -> 0.

The submodule carrier in `gradedFunction` is canonically this kernel: for the regular module A, ideal scalar multiplication identifies q^N*top with q^N and its next denominator with q^(N+1). Prove this using the actual submodule inclusion and quotient maps, not an opaque graded module carrying prescribed lengths. Thus G_N = H_N-H_(N-1). At N=0, the source is A/n and G_0=H_0; no negative-index Lean value is needed.

Taking differences in (2) gives

    G_N = min(N+1,d)                                         (3)

for every N >= 0. The calculation is equally valid for a nonreduced equation such as x^4 in characteristic two.

## 3. Exact postulation defect and the two thresholds

The full arithmetic identity is

    H_N - P_d(N) = C(max(0,d-N-1)).                           (4)

Both sides of (4) are interpreted in Q. If N+2 >= d, expand the two binomials in (2); the binomial with argument zero or one is still zero, and the difference is exactly P_d(N). If N+2 < d, equation (2) reads H_N=C(N+2), and

    2(H_N-P_d(N))
      = (N+2)(N+1)-2d(N+1)+d(d-1)
      = (d-N-1)(d-N-2).

This proves (4) also in that branch. It follows that

    H_N = P_d(N) iff d <= N+2.                               (5)

The first nonnegative index of permanent cumulative agreement is therefore max(0,d-2). When d>=3, the preceding index N=d-3 has defect exactly one, proving sharpness. On the other hand, (3) reaches its stable value d for the first time at max(0,d-1). These are different thresholds.

For d=4:

    N                 0   1   2   3   4
    H_N               1   3   6  10  14
    P_4(N)           -2   2   6  10  14
    H_N-P_4(N)        3   1   0   0   0
    G_N               1   2   3   4   4

The predecessor's N>=d-1 cumulative threshold is a valid sufficient threshold, not a false statement. The new claim is its sharp improvement and the exact earlier defect. No source erratum is alleged.

To identify the existing `polynomial` constructor, assume the actual A has the Noetherian and local instances and that the actual image ideal n has radical equal to its maximal ideal, as its signature requires. Formula (5) supplies an eventual equality with witness max(0,d-2); uniqueness in the existing `existsUnique_polynomial` then identifies the constructor with P_d. This is a specialization, not a replacement for the still-unproved general existence theorem. Unit equations remain outside any nontrivial-local-ring interpretation. This checkpoint does not use polynomial degree to silently claim that the missing native two-variable dimension theorem has been implemented.

## 4. Native signature draft and integration contract

The following is an append fragment for the existing suggested file, **not a standalone Lean module and not compiled**. It deliberately has no new carrier definitions. The eight draft declarations correspond respectively to: the finite length balance; ambient equation-jet length; curve cumulative function; curve graded function; exact rational defect; earliest agreement; specialization of the existing polynomial; and the zero-equation boundary. They are local continuation labels until entered as individual nodes in packet, reader and suggested file together.

Existing inputs to reuse include `shifted-jet-injective`, `shifted-jet-exact`, `jet-below-equation-order`, `plane-total-jet-ring-length`, `series-module-finite-length`, `hilbert-samuel-function`, `graded-hilbert-function`, and `eventual-hilbert-samuel-polynomial`. The double-quotient and scalar-restriction results are baseline imports, never duplicate new nodes. If the integration consumes the named `polynomial_unique` API instead of the existential uniqueness theorem directly, promote that API once as the protocol requires; do not duplicate its signature.

<!-- BEGIN NATIVE SIGNATURE DRAFT -->
```lean
namespace TauCeti.HilbertSamuel
noncomputable section PlaneCurveContinuation
variable {k : Type*} [Field k]
local notation "R" => MvPowerSeries (Fin 2) k
local notation "v" => (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 -> R)))
variable (f : R)
local notation "A" => (R ⧸ Ideal.span {f})
local notation "qf" => (v.map (Ideal.Quotient.mk (Ideal.span {f})))

-- Draft 1: sum in ENat first; no subtraction of infinite lengths.
lemma planeEquationJet_length_balance (d N : ℕ)
    (hN : d ≤ N) (hd : f.order = (d : ℕ∞)) :
    Module.length R (R ⧸ v ^ (N + 1)) =
      Module.length R (R ⧸ v ^ (N + 1 - d)) +
        Module.length R (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := by sorry

-- Draft 2: the right-hand subtraction is in Nat before the ENat cast.
lemma planeEquationJet_length (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    Module.length R (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by sorry

-- Draft 3: the actual Hilbert-Samuel function of the actual quotient A.
lemma planeCurve_function (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    function (A := A) (M := A) qf N =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by sorry

-- Draft 4: use the native successive-quotient carrier, including N=0.
lemma planeCurve_gradedFunction (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    gradedFunction (M := A) qf N = (min (N + 1) d : ℕ∞) := by sorry

-- Draft 5: rational subtraction, after the preceding finite-length equality.
lemma planeCurve_postulation_defect (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    ((function (A := A) (M := A) qf N).toNat : ℚ) -
        ((d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) =
      (Nat.choose (d - N - 1) 2 : ℚ) := by sorry

-- Draft 6: cumulative, not graded, agreement threshold.
lemma planeCurve_postulation_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    (((function (A := A) (M := A) qf N).toNat : ℚ) =
      (d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) ↔
        d ≤ N + 2 := by sorry

-- Draft 7: no caller-supplied Hilbert polynomial or automatic local instance.
lemma planeCurve_polynomial [IsNoetherianRing A] [IsLocalRing A]
    (d : ℕ) (hd : f.order = (d : ℕ∞))
    (hq : qf.radical = IsLocalRing.maximalIdeal A) :
    polynomial (A := A) (M := A) qf hq =
      Polynomial.C (d : ℚ) * (Polynomial.X + 1) -
        Polynomial.C ((d : ℚ) * ((d : ℚ) - 1) / 2) := by sorry

-- Draft 8: zero is not a finite-order equation.
lemma planeZeroEquation_function (N : ℕ) :
    let I : Ideal R := Ideal.span {(0 : R)}
    let B := R ⧸ I
    let q := v.map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q N = (Nat.choose (N + 2) 2 : ℕ∞) := by sorry
end PlaneCurveContinuation

section PlaneCurveAcceptance
-- Unit boundary: no IsLocalRing instance is required on the zero quotient.
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(1 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = 0 := by sorry

-- The zero equation retains the regular surface's quadratic function.
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by sorry

-- Smooth equation: the function is N+1, not the ambient triangular number.
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = (N + 1 : ℕ∞) := by sorry

-- Nonreduced positive-characteristic equation, with its low-index exception.
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 4}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let q := v.map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q 0 = 1 ∧
      function (A := B) (M := B) q 1 = 3 ∧
      function (A := B) (M := B) q 2 = 6 ∧
      function (A := B) (M := B) q 4 = 14 := by sorry

-- The cumulative function has already stabilised polynomially at index 2,
-- but the degree-2 graded component has dimension 3, not yet 4.
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 4}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let q := v.map (Ideal.Quotient.mk I)
    gradedFunction (M := B) q 2 = 3 ∧ gradedFunction (M := B) q 3 = 4 := by sorry

-- Large order does not erase a small ambient jet.
example :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 100}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by sorry
end PlaneCurveAcceptance
end TauCeti.HilbertSamuel
```
<!-- END NATIVE SIGNATURE DRAFT -->

Integration must append each declaration with a unique node ID, explicit hypotheses, the appropriate proof segment above, actual dependencies and the matching acceptance signature. No definition/construction is introduced in this fragment; the original definitions retain their APIs and tests. Keep every existing node object and all source obligations. Record the inherited jet basis/order/map proofs as unchecked until implemented. Do not mark all J01–J16 complete merely because this finite-jet proof is mathematically explicit.

## 5. Source and validation record

Fresh pinned reads used for this continuation:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/RingTheory/Length.lean`: `LinearEquiv.length_eq`, `Module.length_eq_of_surjective`, `Module.length_eq_add_of_exact`, its infinite-length branches and `Module.length_le_of_surjective`.
- The same pin, `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`, blob `225f9102da25667f06fe021abc4fb895669d0880`: the maps and inverse proofs of `DoubleQuot.quotQuotEquivQuotSup`, the algebra form `DoubleQuot.quotQuotEquivQuotSupₐ`, quotient algebra-map compatibility and equal-ideal transport. These are already baseline imports in the packet.
- The actual current suggested-file contracts for `mem_variableIdeal_pow_iff`, shifted maps, low-index projection, total jets/basis, series residue and length, cumulative/graded functions, and eventual-polynomial uniqueness. They are inherited planned declarations, not mistaken for built Mathlib lemmas.
- The relevant R03.3 entries of AUDIT-17, the accepted RS-08 ownership boundary and the existing handoff. The large `data/library-coverage.json` fetch returned no text in this browser, so the scoped audit was read instead. This is not a claim to have freshly reread every routed paper, every audit layer or the whole baseline tree.
- Stacks [00IU](https://stacks.math.columbia.edu/tag/00IU), especially Lemmas 10.52.3 and 10.52.5 and their proofs; and the mathematical content of [00K4](https://stacks.math.columbia.edu/tag/00K4), read online 2 October 2026. Formula (4) and the sharp threshold are the explicit algebraic derivation here, not a quotation attributed to those sources.

No library installation, cache download, Lake setup, library build or language server was used. There is no existing pinned build in this environment and available memory is below the WORKERS minimum. **Lean was not run.** The six draft acceptance examples above are not counted as passing Lean tests. The packet checker and atlas assembler were not run locally; the canonical packet and graph inputs are unchanged. Any GitHub submission check only certifies its own scope, not the mathematics or Lean elaboration.

The independent executable check computes actual cokernel dimensions by Gaussian elimination over F2, F3, F5 and F7. Its multiplication matrices use all monomials of total degree at most N; their rank is not filled with the predicted formula. It covers 224 equations (220 finite-order and four zero equations), 2,464 jet matrices, and 12,221 additional integer/rational index pairs, with **36,686 assertions passing**. Named cases include units, a line, a node, a cusp, coincident tangent directions, a fourth power in positive characteristic and higher-order perturbations. The deterministic seed is fixed in the source. This tests finite polynomial truncations and arithmetic, not an arbitrary-series theorem or the native Lean signatures.

The exact program follows. Save the code block as a Python file in your own disk-backed scratch and run it with Python 3. Its source SHA-256 is `9dde5556639d51f24711f3070f8cc077988de005569d3a3da281570ddf4683e4`; retain the terminal newline when extracting. It writes nothing except its JSON receipt to standard output. The SHA-256 in the resulting receipt is that of the saved program, allowing byte-for-byte reproduction to be checked independently.

<!-- BEGIN EXACT JET REGRESSION -->
```python
#!/usr/bin/env python3
"""Exact finite-jet regressions; these are not a Lean or arbitrary-series proof."""
from __future__ import annotations
import hashlib
import json
from fractions import Fraction
from math import comb
from pathlib import Path
from random import Random


def choose2(n: int) -> int:
    assert n >= 0
    return comb(n, 2) if n >= 2 else 0


def monomials(n: int) -> list[tuple[int, int]]:
    return [(i, degree - i) for degree in range(n + 1) for i in range(degree + 1)]


def rank_mod_p(matrix: list[list[int]], p: int) -> int:
    """Ordinary row reduction over the prime field, without a predicted rank."""
    a = [[x % p for x in row] for row in matrix]
    if not a:
        return 0
    row = 0
    for col in range(len(a[0])):
        pivot = next((j for j in range(row, len(a)) if a[j][col]), None)
        if pivot is None:
            continue
        a[row], a[pivot] = a[pivot], a[row]
        inverse = pow(a[row][col], -1, p)
        a[row] = [(inverse * x) % p for x in a[row]]
        for j in range(len(a)):
            if j != row and a[j][col]:
                factor = a[j][col]
                a[j] = [(x - factor * y) % p for x, y in zip(a[j], a[row])]
        row += 1
        if row == len(a):
            break
    return row


def jet_length(f: dict[tuple[int, int], int], p: int, n: int) -> int:
    """Dimension of the actual cokernel of f on k[x,y]/(x,y)^(n+1)."""
    basis = monomials(n)
    position = {a: j for j, a in enumerate(basis)}
    matrix = [[0] * len(basis) for _ in basis]
    for col, (u, v) in enumerate(basis):
        for (i, j), coefficient in f.items():
            if i + j + u + v <= n:
                target = position[(i + u, j + v)]
                matrix[target][col] = (matrix[target][col] + coefficient) % p
    return len(basis) - rank_mod_p(matrix, p)


def polynomial(d: int, n: int) -> Fraction:
    return Fraction(d * (n + 1)) - Fraction(d * (d - 1), 2)


def main() -> None:
    rng = Random(551_20261002)
    cases: list[tuple[str, int, dict[tuple[int, int], int]]] = []
    named = {
        'zero': {},
        'unit': {(0, 0): 1, (1, 0): 1, (0, 2): 1},
        'line': {(1, 0): 1},
        'node': {(1, 1): 1},
        'cusp': {(0, 2): 1, (3, 0): -1},
        'triple_tangent': {(3, 0): 1, (0, 3): -1},
        'nonreduced_fourth_power': {(4, 0): 1},
        'higher_terms': {(4, 0): 1, (0, 7): 1, (3, 5): 1},
    }
    for p in (2, 3, 5, 7):
        for name, f in named.items():
            cases.append((f'{name}/F{p}', p, f))
        for d in range(8):
            for sample in range(6):
                f = {a: rng.randrange(p) for a in monomials(10) if sum(a) >= d}
                # Pick the leading form independently of any rank calculation.
                f[(d, 0)] = rng.randrange(1, p)
                cases.append((f'random/F{p}/d{d}/{sample}', p, f))
    assertions = 0
    finite_order_cases = 0
    jet_checks = 0
    for name, p, f in cases:
        f = {a: c % p for a, c in f.items() if c % p}
        previous = 0
        d = min(map(sum, f)) if f else None
        finite_order_cases += d is not None
        for n in range(11):
            actual = jet_length(f, p, n)
            jet_checks += 1
            if d is None:
                assert actual == choose2(n + 2), (name, n, actual)
                assertions += 1
            else:
                expected = choose2(n + 2) - choose2(max(0, n + 2 - d))
                defect = choose2(max(0, d - n - 1))
                assert actual == expected, (name, n, d, actual, expected)
                assert actual - previous == min(n + 1, d), (name, n, d)
                assert Fraction(actual) - polynomial(d, n) == defect, (name, n, d)
                assert (Fraction(actual) == polynomial(d, n)) == (d <= n + 2)
                if n >= d:
                    assert actual + choose2(n + 2 - d) == choose2(n + 2)
                    assertions += 1
                if n < d:
                    assert actual == choose2(n + 2)
                    assertions += 1
                assertions += 4
            previous = actual
    # Arithmetic checks extend well beyond the matrix sizes and isolate casts,
    # truncated subtraction, and the earliest cumulative agreement index.
    arithmetic_checks = 0
    for d in range(101):
        threshold = max(0, d - 2)
        for n in range(121):
            h = choose2(n + 2) - choose2(max(0, n + 2 - d))
            assert Fraction(h) == polynomial(d, n) + choose2(max(0, d - n - 1))
            assert (Fraction(h) == polynomial(d, n)) == (n >= threshold)
            arithmetic_checks += 1
            assertions += 2
        if d >= 3:
            n = d - 3
            h = choose2(n + 2)
            assert Fraction(h) - polynomial(d, n) == 1
            assertions += 1
    # A coefficient zero divisor invalidates the order-addition injection.
    assert 2 % 4 != 0 and (2 * 2) % 4 == 0
    assertions += 1
    # Wrong small-index multiplication on a one-dimensional residue jet is zero.
    assert jet_length({(4, 0): 1}, 2, 0) == 1
    assertions += 1
    receipt = {
        'agent': 'ChatGPT Pro — cp-20261002-sr-c72e81',
        'scope': 'finite polynomial jets and independent integer/rational boundary arithmetic',
        'polynomial_cases': len(cases),
        'finite_order_cases': finite_order_cases,
        'zero_equation_cases': len(cases) - finite_order_cases,
        'jet_matrix_checks': jet_checks,
        'arithmetic_pairs': arithmetic_checks,
        'assertions': assertions,
        'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'lean_compiled': False,
        'warning': 'No arbitrary-series theorem or native Lean signature is certified by these tests.'
    }
    print(json.dumps(receipt, indent=2))

if __name__ == '__main__':
    main()
```
<!-- END EXACT JET REGRESSION -->

## 6. Resume here

First integrate the finite-jet strand, not a second general multiplicity definition. Give the eight draft declarations their packet nodes and reader proof text, retain the exact native quotient and scalar maps, and make the whole suggested file elaborate in an existing pinned build subject to the WORKERS memory rule. Establish native finiteness before any `toNat` subtraction. The submitted file must use the existing `gradedFunction` carrier, not simply define its answer as a difference. Add tests that distinguish the cumulative and graded thresholds; x^4 over F2 is a compact witness. Run the indexed blueprint checker and the actual assembler, then record the results rather than inheriting an old successful receipt.

Next resume the predecessor's J08–J09 tangent-cone map and full homogeneous kernel, J12 dimension, J13 comparison with the reserved intrinsic and ambient multiplicities, and J14–J16 embedded-prime, finite coefficient-extension and coordinate-change statements. The full general graded Hilbert–Serre induction still needs its actual homogeneous kernel/cokernel, quotient action, signed length recurrence, initial anchor, threshold and support-dimension comparison. Completion, Artin–Rees, associativity, both supplier requests and all original derived/deformation/patching/source-route obligations remain open.

This checkpoint changes no implementation status, no coverage decision, no source-issue verdict and no ownership assignment. The proof and executable source above are self-contained; no next worker depends on an inaccessible scratch path.
