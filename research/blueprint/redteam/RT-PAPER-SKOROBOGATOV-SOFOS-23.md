# RT-PAPER-SKOROBOGATOV-SOFOS-23

Target: [PAPER-SKOROBOGATOV-SOFOS-23](../papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json), issue [#4156](https://github.com/CBirkbeck/tauceti-explorer/issues/4156). **Complete: three findings, one high and two medium.** Codex, session `codex-rtOQ9t`, 1 October 2026.

The extraction was authored by Codex `codex-a71f92`, continued by Claude Code `cc-442dc5`, and reviewed by Claude Code `cc-2aeb03`. I did not participate in those tasks. The bot confirmed my claim before this audit began. The base atlas is `fa21d9afd2e9d8fc6f1fb00781a11c90ad4219e1`.

## Reading and boundary

The [published article](https://eprints.gla.ac.uk/292484/1/292484.pdf), *Inventiones mathematicae* 231 (2023), 673–739, was read in full, including all proofs and references. Its 67-page PDF has SHA-256 `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1`, matching the extraction. I also inspected page images at 677, 680, 694 and 736; PDF extraction loses mathematical symbols. The [arXiv record](https://arxiv.org/abs/2005.02998), [published-version repository record](https://eprints.gla.ac.uk/292484/) and publisher/author search were consulted. I did not newly collate every preprint page or reread the proofs of all cited suppliers.

All 149 items, supplied API/test entries, eight routes, twelve prerequisite citations, ten gates and 42 source-issue entries were compared with the source and existing review. Protocol §16 does not require a paper extraction to prove its cited suppliers or furnish blueprint-level proof closure. None of the findings rests on such a requirement.

The existing sign correction is substantive and is already documented: the coefficient-box main term counts both signs, while the original prime count counts positive primes. The repaired even-von-Mangoldt dispersion and its positive-prime comparison are present. The simultaneous-in-x issue, square-a Holzer issue, repeated-polynomial issue and integral-persistence issue are also already recorded. This report does not submit them again.

## Findings

### 1. The explicit removal of the residue-polynomial degree condition in item 9 propagates into item 11 and permits an empty coefficient family for every H. The resulting density-one statement has no denominator and cannot follow from Theorem 1.5.

**high; error.** `research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json items /9 and /11; route 1 brief; associated review of item 9`

Published p. 677 fixes Q_i of degree at most d_i before defining Poly(H), and Theorem 1.5 explicitly retains the assumptions of Theorem 1.2. Item 9 instead says that no deg Q_i <= d_i is required; item 11 imports the data of item 9 and adds only coprimality. Take n=d_1=1, M=2, n_0=0 and Q(t)=t^2+1. Then gcd(Q(0),2)=1, but no linear P is coefficientwise congruent to Q modulo 2: the t^2 coefficients are 0 and 1. Thus Poly(H) and its Schinzel subset are empty for every H. Item 8 defines R only for nonempty Poly(H), and item 2 explicitly rejects an empty density denominator. Even imposing the totalized convention 0/0=0 would make item 11 assert 0=1+o(1). The page-680 theorem does not repeat the degree condition, but this is no justification for deleting it from the standing-data interface or from Theorem 1.5.

**Repair:** Keep any literal transcription of Theorem 1.9 labelled as such, and give its usable contract with the p. 677 standing degree condition, or the sufficient generalized condition that Q_i modulo M has degree at most d_i. Explicitly restore deg Q_i <= d_i in item 11, as Theorems 1.2 and 1.5 require; record eventual nonemptiness and use sufficiently large H. Propagate this condition into the route-1 brief and all average/relative-density consumers, checking item 74 too. Do not add coprimality to a generalized mean-discrepancy theorem merely for this repair: incompatibility of degrees is the demonstrated defect.

### 2. The extracted two-sided L1 bound omits the condition relating z to H. Its own note uses z log z <= H log H, so the stated uniform bound lacks a necessary range hypothesis at the zero argument.

**medium; missing.** `research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json item /l1-bound-truncated-von-mangoldt`

Published Proposition 3.8, p. 694, assumes H^delta1 <= z <= H before proving the bound for S_|f|(0). The separate extracted item gives that bound with no z condition. Its note acknowledges Lambda_z(0)=-sum_{e<=z} mu(e) log e and bounds its absolute value by z log z <= H log H. That last inequality needs the omitted range. This cannot be a uniform assertion for arbitrary z: at every prime p, Lambda_p(0)-Lambda_(p-1)(0)=log p. At least one adjacent absolute value is >=(log p)/2, unbounded with p. With fixed H=16,d=1,k=m=1, S_|Lambda_z|(0) contains that zero summand while H(log H)^2 max(k,m)^d is fixed. The nonzero-argument divisor estimate does not control this term.

**Repair:** Split the positive-argument bound (t>=1, with y sufficiently large) from the two-sided value-range bound. In the latter state d>=1, fixed delta2>0, H sufficiently large, positive k,m <= (log H)^delta2 and 1<=z<=H; alternatively retain the full source range H^delta1<=z<=H. Keep the zero-term proof in the note and state the constant dependencies. If arbitrary z is desired, add the separate z log z contribution. This repairs an extraction-level omission, not a new error in the published Proposition 3.8.

### 3. The strict Hilbert class field and its splitting theorem are assigned to ClassFieldTheory Layer 12, but the existing named-field supplier is Layer 13. The geometric design brief repeats the wrong supplier boundary.

**medium; error.** `research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json item /63 planned; route 2 brief; research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.md supplier paragraph`

At atlas fa21d9afd2e9d8fc6f1fb00781a11c90ad4219e1, ClassFieldTheory Layer 12 supplies the general global class-field correspondence and admissible ray-class Artin maps. Layer 13 explicitly defines narrowHilbertClassField as rayClassField at GlobalNumberFields.narrowModulus, and plans the maximal unramified properties and splitting criteria. Item 63 needs precisely that field and the criterion that a prime split iff it has a totally positive generator (published p. 720). Its sole planned reference is Layer 12; the route-2 brief likewise says layers 5,6,10,12 supply strict ray-class splitting. The reviewed library audit separately places narrowHilbertClassField and these splitting criteria in Layer 13, not yet built. The newly added global-cyclic-norm-criterion and kronecker-weber items already refer correctly to Layer 13.

**Repair:** Point item 63 to tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; retain Layer 12 as an underlying prerequisite only if useful. Update route 2 and the report to import Layer 13 for the strict Hilbert class field, its splitting law, the cyclic norm theorem and Kronecker-Weber. Keep the item planned and do not create a second class-field construction or change the upstream roadmap.

## Why the first two conditions matter

For finding 1, the contradiction is in the top coefficient modulo 2, so it holds at every height and cannot be repaired by enlarging H. `gcd(Q(0),2)=1` only checks evaluation at one input; it says nothing about coefficientwise compatibility with the prescribed degree. The source's p. 677 standing data and item 1 supply the missing condition. It is legitimate to generalize from integral degree to degree after reduction, but that generalization must still guarantee an eventually nonempty family. Item 11 cannot inherit arbitrary Q merely because item 9 reproduces the shorter printed theorem statement.

For finding 2, let `A(z)=Lambda_z(0)`. At a prime p, `A(p)-A(p-1)=log p`, since `mu(p)=-1`. The triangle inequality gives `max(|A(p)|,|A(p-1)|)>=log(p)/2`. Thus the zero summand alone rules out a bound uniform in unrestricted z with H fixed. The item's note identifies the right repair already: constrain z so that `z log z <= H log H`. The positive-argument divisor bound remains valid; it is the passage to a sum including zero that needs this range.

## Library and ownership audit

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. The credited declarations were read in:

- `Mathlib/LinearAlgebra/Vandermonde.lean`, lines 219–236;
- `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean`, lines 65–136;
- `Mathlib/RingTheory/Norm/Defs.lean`, lines 59–90;
- `Mathlib/NumberTheory/LegendreSymbol/Basic.lean`, lines 99–110;
- `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`, lines 85–118 and 423–427;
- `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`, lines 105–109;
- `Mathlib/NumberTheory/SumTwoSquares.lean`, lines 33–38.

The seven library credits hold. In particular, Mathlib's Jacobi symbol has the paper's denominator-2 convention; the Kronecker symbol would be the wrong replacement. Its natural von Mangoldt function does not itself choose the signed extension.

The current atlas was assembled without distances: 2907 stages, 8322 stage edges. Read the source-route stages ST.0, AN.2/AN.5, ES.0, SV.2/SV.4 and RP.2, the ten planned-item suppliers, and their reviewed coverage. The local/global norm, invariant, reciprocity and quadratic-form suppliers are still planned endpoints, not credited as built. The proposed two Part IIs retain distinct analytic and geometric scopes. Layer 13, rather than Layer 12 alone, is the already-designated supplier of the named strict Hilbert class field; finding 3 repairs this extraction's pointer and brief, and requests no upstream edit.

## Reproduction and checks

The accepted report's standalone Python certificate was rerun unchanged. It passed all 374 rational local-law identities, produced `38/64, 156/256, 624/1024, 2496/4096, 9984/16384` in degrees 2–6, and gave the rigorous lower factor `0.9507133873828343` and resulting density factor `0.5644860737585579`. Its four diagnostic positive-prime ratios also reproduced. These are finite checks and diagnostics, not Lean proofs.

The empty-family witness can be reproduced independently:

```python
for H in (3, 7, 25):
    count = sum(
        all((u-v) % 2 == 0 for u, v in zip((b, a, 0), (1, 0, 1)))
        for a in range(1, H+1) for b in range(-H, H+1)
    )
    assert count == 0
```

All 132 missing items have exactly one route; all explicit item prerequisites resolve. The mod-4 report correctly specifies the four-variable degree-three map when giving kernel size four, and the general-degree proportions are correct. No finding is made about that wording.

Validation: `scripts/check_redteam.py`, `research/blueprint/intake.py check-files` on these two deliverables, and whitespace checks. No Lean source is a deliverable; no Lean, Lake, cache or LSP process was run.
