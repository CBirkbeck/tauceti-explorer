# REV-RT-AUDIT-19 — independent verification

**Complete: both findings confirmed.** Refs #1587.

Agent: ChatGPT (GPT-6 Astra Pro). Session: `g6a-260926-7b42`.
Date: 26 September 2026. Claim 5848891726; bot confirmation 5848892749.
This worker did none of AUDIT-19, REV-AUDIT-19 or RT-AUDIT-19. The red-team
report was written by Codex, session `codex-a71f92`.

The two findings concern false or insufficiently qualified statements in the
audit, not errors in the cited library theorems or published sources. Both meet
PROTOCOL section 17's high-severity false-statement criterion, even though the
Gauss-product repair is small. Neither changes a library-coverage verdict.

## Scope and inputs

This verifies every finding in the complete red-team result: **2 of 2**.
It does not repeat the red team's full 41-layer library audit or certify its
entire search history. The two deliverables here are the review JSON and this
report; the audit and generated coverage overlay are not edited.

The complete red-team result and report were read. The audit's finite-field
summary, Gauss-sum target with its note, multiplicative-bound target and
degenerate-case target were opened directly. The relevant context in the
accepted review was also read. Input blobs:

| File | Git blob read |
| --- | --- |
| `redteam/RT-AUDIT-19.result.json` | `a37bfdca6ab92f31cecf493629ca85e9c1496938` |
| `redteam/RT-AUDIT-19.md` | `556cfb491c758fe8f8fbdfa8b05e36f6679e41fb` |
| `audit/AUDIT-19.result.json` | `b27742a43fa95b697d6718f84f6f8d7e890afb10` |
| `reviews/REV-AUDIT-19.md` | `3c2576f0876d9070172fa8fa38ada90c5df5bbaf` |

Paths in this table are relative to `research/blueprint/`. The branch starts
at explorer `66fa5870b9d8f87974cf2798f11ec09c147720b0`. The implementation
baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; both findings are settled by
Mathlib declarations and elementary computations, without a new Tau Ceti claim.

## RT-AUDIT-19/1 — confirmed

### Failure of the unqualified coefficient-field reading

The second FF.2 target says that the polynomial is not an `ord(chi)`-th power,
without giving the coefficient field for this test or defining the parameter
`m`. Over the natural coefficient ring `F_q[X]` that condition is insufficient.

Take the quadratic character of `F_5`, extended by zero, and `f=2X^2`:

| `x` | 0 | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- | --- |
| `f(x)` | 0 | 2 | 3 | 3 | 2 |
| `chi(f(x))` | 0 | -1 | -1 | -1 | -1 |

The sum is `-4`. A nonzero polynomial square of degree two has a linear square
root and square leading coefficient; 2 is not a square in `F_5`. Thus this
polynomial passes the audit's coefficient-field non-power condition, but the
bound fails. There is one distinct geometric root, so `(m-1)sqrt(5)=0`.
Reading `m` as the degree does not help: `4>sqrt(5)`, as `16>5`.

I read the pinned [quadratic-character source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean#L120),
including its finite-field section hypotheses, definition and the relevant
proofs. `quadraticChar` is the zero-extended multiplicative character;
`quadraticChar_zero` (130), `quadraticChar_sq_one'` (140), and
`quadraticChar_neg_one_iff_not_isSquare` (159) have exactly the conventions
used above. The source blob is `4574d7e5f25ab57e02030c01b069d85ad8646c01`.
The integer character values can be viewed in the complex numbers without
changing this calculation; no compiled Lean instance is claimed here.

### Precise repair and its limits

Use a nontrivial complex-valued multiplicative character of order `e>1`,
extended by zero, and a nonzero polynomial `f` over `F_q`. Exclude

    f = c * h^e, with c in F_q^times and h in F_q[X].

This is equivalent to excluding e-th powers over the algebraic closure.
Indeed, write `f=c product_i P_i^{a_i}` with monic irreducible `P_i`. Finite
fields are perfect, so the geometric roots of each `P_i` are distinct. The
geometric root multiplicities are exactly the `a_i`, and all are divisible by
`e` precisely when `f=c (product_i P_i^{a_i/e})^e`. In the algebraic closure
the nonzero constant also has an e-th root. Define `m` to be the number of
distinct geometric roots. This removes the counterexample; it is not an
objection to the geometrically stated Weil bound.

The exceptional case has the exact formula

    sum_x chi(c*h(x)^e) = chi(c) * (q - #{x in F_q : h(x)=0}).

Away from the roots of `h`, its e-th power has character value 1; at the roots
the zero extension gives 0. Expand the audit's degenerate-case note to include
these constant multiples and retain the `2X^2` example as a rejection test.
The mixed-sum clause is a separate contract and is not proved by this repair.

The public reference named in the finding was independently opened:
Swastik Kopparty, [*Elementary bounds on character sums with polynomial arguments*](https://www.math.toronto.edu/swastik/courses/rutgers/finitefields-F13/polycharsum.pdf),
10 October 2013, Theorem 4, printed page 5. Both the parsed statement and a
successful screenshot of that page were read. It explicitly excludes constant
multiples of character-order powers. **Its displayed bound is the weaker
`d sqrt(q)`, not the audit's `(m-1)sqrt(q)`.** It corroborates the
nondegeneracy condition only; this review does not attribute the sharper
coefficient or a new proof of Weil's theorem to that source. No published-source
erratum is alleged.

### Existing plan, not a new implementation

The current [suggested finite-field file](https://github.com/CBirkbeck/tauceti-explorer/blob/66fa5870b9d8f87974cf2798f11ec09c147720b0/research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean#L2694)
was read at the relevant statements (blob
`95bb8ec30f7f3ac5f1e5517d054ca3cba1d6c2c7`). The target labelled
`FF.2/weil-bound-multiplicative` explicitly excludes the algebraic-closure
constant-multiple form and counts geometric roots. The target labelled
`FF.2/multiplicative-perfect-power-sum` explicitly treats `c*h^e` and subtracts
the number of zeros. Both are suggested declarations with admitted proofs,
not pinned implementations. The direct large-packet reader returned empty
content; I therefore do not claim a fresh whole-packet verification. The
companion statements independently corroborate the proposed alignment.

**Apply the fix to the audit target and its degenerate-case note. Do not add
duplicate nodes or alter the `absent` / `not built` classifications.**

## RT-AUDIT-19/2 — confirmed

The finite-field summary suppresses the additive character in
`g(chi)g(chi^-1)=q`. With the same primitive additive character in both factors,
the correct product is `chi(-1)*q`. The detailed FF.1 entry is already correct:
it inverts both characters and states the nontriviality/primitivity hypotheses.

I read the pinned [Gauss-sum source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean#L188),
including the definitions, section hypotheses and all three cited proofs
(blob `630849d6b0b77c0e8b7f6a56b4c05d0272569afd`):

| Declaration | Exact distinction |
| --- | --- |
| `gaussSum_mul_gaussSum_eq_card` (188) | Inverts both `chi` and `psi`; product is the field cardinality. |
| `gaussSum_mul_gaussSum_pow_orderOf_sub_one` (205) | Keeps `psi`, uses `chi^(orderOf chi-1)=chi^-1`, and includes `chi(-1)`. |
| `gaussSum_sq` (222) | Nontrivial quadratic specialization, with the same sign. |

These statements assume a finite source field, an integral-domain target,
nontrivial multiplicative character and primitive additive character; the last
also assumes the multiplicative character quadratic. Complex values satisfy
the target hypotheses.

For an independent exact example use `F_3`, its quadratic character and
`psi(1)=zeta`, where `zeta` is a primitive cubic root. Then `chi=chi^-1`,
`chi(-1)=-1`, and

    g = zeta - zeta^2,
    g^2 = zeta + zeta^2 - 2 = -3.

Inverting the additive character changes `g` to `-g`, so the product with both
characters inverted is `+3`. This was checked in the exact ring
`Z[zeta]`, using `zeta^2+zeta+1=0`, not with floating-point approximations.

**Replace the summary formula by
`g(chi,psi)g(chi^-1,psi^-1)=q`, with `chi` nontrivial and `psi` primitive.**
This matches the existing detailed target. Alternatively keep `psi` fixed and
include `chi(-1)q`. Leave the detailed target, its citations and its
`mathlib` / `partly built` classifications unchanged. This is not a request
for a new Gauss-product proof.

## Validation actually performed

The repository's unmodified `scripts/check_redteam.py` was copied into scratch
and its Git blob hash checked against
`c736ae33fd46ec11c6e718be27479d9d5a520211`. The complete input result was also
copied and its blob hash checked against `a37bfdca6ab92f31cecf493629ca85e9c1496938`.
The checker was run against the actual input result and the new review JSON:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-19.result.json research/blueprint/redteam/RT-AUDIT-19.review.json
research/blueprint/redteam/RT-AUDIT-19.result.json: ok
research/blueprint/redteam/RT-AUDIT-19.review.json: ok
```

An additional check requires exactly the two distinct input finding IDs, no
missing or extra review IDs, both valid verdicts and nonempty reasons; it
passes. The JSON parses with rejection of duplicate keys and nonfinite numbers.

Executed exact Python checks: 34 quadratic-character multiplicativity pairs
(over `F_3` and `F_5`); all 25 linear squares over `F_5` excluding `2X^2`;
100 constant-multiple exceptional-sum identities over `F_5`; all nine
additive-character pairs over `F_3`; and the two exact Gauss products.
The main outputs were:

```text
F5 polynomial values: [0, 2, 3, 3, 2]
F5 character values:  [0, -1, -1, -1, -1]; sum = -4
F3 g in the basis (1,zeta): (1, 2)
F3 g^2: (-3, 0); product with inverse psi: (3, 0)
```

The F_5 computations use the finite set of squares and integer sums. For the
F_3 reproduction, multiply pairs by
`(a,b)*(c,d)=(ac-bd,ad+bc-bd)` and use additive-character values
`(1,0),(0,1),(-1,-1)`. These checks verify the examples; they are not a
formalization or a computational proof of the general Weil bound.

**No Lean source was changed or compiled.** The full audit/declaration-index
validator and repository-wide intake command were not run locally. They are
not needed to validate these two review deliverables, and no new library
coverage census is claimed. The normal submission check remains responsible
for repository intake.

## Handoff to the fix job

Both findings are confirmed with the repairs above. The normal fix job should
change only the named audit entries and document those changes. The orchestrator
owns regeneration of the coverage overlay. This verifier has not applied the
fixes, changed atlas ownership, or modified either source paper or library.
