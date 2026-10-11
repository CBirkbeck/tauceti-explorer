# Independent review: PolynomialGaloisGroupsPartII

Accepted with corrections, 2026-10-11. Reviewer: Codex, session `codex-okRqvY`,
job `REV-DESIGN-PolynomialGaloisGroupsPartII`, issue #3591. The design was by
the separate session `codex-jw5Scx`. This is acceptance of a target-level plan;
the suggested statements remain admitted and `implementationStatus` remains
`unchecked` throughout.

The packet has 32 nodes: nine definitions, one construction and 22 theorems.
All 32 have individual review verdicts: 21 verified and 11 corrected. There
are 38 API items, 34 discriminatory tests and 23 planets. No nodes were added
or removed. All 27 original baseline citations were confirmed; four exact
Mathlib citations were added, giving 31. All seven stages are planned;
PG2.0, PG2.1, PG2.2, PG2.4 and PG2.5 are closed. PG2.3 and PG2.6 retain the
inherited analytic gap PG2-G1. PG2-R1 is a confirmed import of the parent's
existing imprimitivity plan, rather than an implementation claim.

## Corrections made

1. Replaced the parent-stage recognition prerequisites in `bochert-min-support`
   and `primitive-min-support` with the two declarations actually available
   in pinned Mathlib's `GroupAction/Jordan.lean`:
   `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem` and
   `Equiv.Perm.alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem`.
   Neither requires a separate degree-six endpoint; degree five is covered.
   Narrowed PG2-R1 to the imprimitivity grid, closed PG2.4 and updated the
   corresponding stage dependency. Generic prime-cycle Jordan theory is
   neither assumed nor newly planned.
2. Added the named `mergePerms_permCongr` and `badTransitive_permCongr` APIs.
   They expose the carrier transport needed to move the polynomial root action
   to `Fin n`. The first follows the existing full-cycle-type transport; the
   second transports the existential subgroup, its action and the alternating
   group. Their signatures appear in the suggested file.
3. Added `maxFactorMultiplicity_zero` and its zero-polynomial example, and
   `minSupport_two_le`. These make the already stated zero convention and
   nonidentity-support lower bound accessible without unfolding definitions.
4. Added `Polynomial.rootMultiplicity_mul` and
   `Polynomial.rootMultiplicity_X_sub_C` as the precise baseline inputs to
   the residue-fibre count, and specified the nonzero monic-product condition
   that permits their use. No injectivity of the reduction homomorphism was
   introduced.
5. Clarified the `PartitionLaw` statement and roadmap description: the
   structure bundles the three inequalities and parameter ranges;
   `IsProbabilityMeasure` is a separate hypothesis in every probability
   theorem. All three inequalities and all endpoints are unchanged.
6. Moved the parent-grid prerequisite from `block-orbit-cycle-divisibility`,
   whose signature already assumes an equivariant equal-fibre quotient, to
   `imprimitive-exclusion`, which actually constructs that quotient from an
   imprimitive action. Read the current parent's exact grid statement and
   confirmed PG2-R1 against it, closing PG2.5. Its deterministic exclusions
   assume the anatomy events and do not require their probability estimates.
7. Removed the probability criterion from the direct prerequisites of the
   deterministic `galois-merging-certificate`, and the unrelated parent
   symmetric-group-realization layer from PG2.6's required suppliers. They
   describe applications and context, rather than inputs to these statements.
8. Replaced every generic source `match` with a node-specific description of
   the source support and of any generalization or repair. Split the
   Bary-Soroker–Kozma Claim 1 citation onto its actual `bsk` source ID. Added
   independent verdicts to all four inherited source findings, limiting the
   locators to the arXiv version actually read. Removed repeated generic
   acceptance sentences from the roadmap descriptions and made the minimum
   and distinguisher acceptance conditions concrete.

## Mathematical checks

The independent review read the cited passages in all four public PDFs,
whose URLs, dates and SHA-256 values are in the packet:

| Source | Passages checked for this plan |
|---|---|
| [Bary-Soroker–Koukoulopoulos–Kozma, arXiv v3](https://arxiv.org/pdf/2007.14567v3) | Introduction pp.4–5; §11 p.54; Definition 11.2, Lemma 11.3 and Claim 11.4 pp.56–57; §11.3 pp.57–58; Proposition 12.1 and all proofs of Lemmas 12.2–12.9 pp.59–63 |
| [Babai, author exposition](https://people.cs.uchicago.edu/~laci/papers/uni-update.pdf) | §§2–4 pp.3–5; Definition 6.1 and Exercise 6.2 pp.5–6; full §8 proof pp.7–9; Exercise 9.5 and Corollary 9.6 p.10 |
| [Schomburg, arXiv v1](https://arxiv.org/pdf/2209.12049v1) | Commutator support inclusion (2.1), §2 pp.1–4, Lemmas 2.3–2.5, and Theorem 3.1 with its proof pp.4–5 |
| [Bary-Soroker–Kozma](https://arxiv.org/pdf/1710.05165) | Claim 1 and its proof pp.9–10 |

The equal-part merging relation is one operation on occurrences. Its
nontransitivity example is correct: merging `{1,1,2}` to `{2,2}` and then to
`{4}` does not supply a direct merging from the original multiset. Fixed
points contribute parts of size one throughout. The factor-multiplicity
maximum counts individual normalized irreducible factors, so two distinct
linear factors are not confused with one squared factor.

For ramified specialization, monicity makes the characteristic-zero roots
integral, and separability makes them distinct upstairs. Reduction may
identify them. A residue root's fibre size is exactly its factor exponent;
an arithmetic Frobenius lift exists at every prime above the rational prime.
Return cycles in equal fibres supply the merging witness. No discriminant,
squarefree reduction or unramifiedness condition was silently used.

The higher-irreducibility equivalence uses injective tuples, the generated
intermediate field and successive quotients of positive remaining degree.
Point-stabilizer recursion agrees with the pinned action APIs. Restriction
surjectivity applies to the ambient normal splitting extension; that
extension need not be the quotient polynomial's own splitting field.
The degree-minus-two equivalence uses the existing Mathlib alternating
containment theorem, with degree at least three.

The two analytic suppliers were read in
`packets/AnalyticNumberTheory--AN.0.json`. The uniform divisor subpower bound
has exactly the unrestricted positive-integer form needed for the block
subsum union. The Mertens product node has the essential leading coefficient
`exp γ`, as well as its explicit constant-identification and first-theorem
proof gaps. A generic upper bound by a constant times `log x` would not give
the required strict margin above `(log n)/4`. PG2-G1 correctly retains this
boundary at its owner.

The strengthened E5* is justified, not assumed from Lemma 12.6. For small
divisors, fewer than four witnesses means a count at most three; uniformly
large `n` ensures `3 ≤ t L_r`, so the source's lower-tail estimate still
applies. For large divisors, E1 and E3 give five distinct long parts, and
at most one can be divisible by that divisor. The resulting four-witness
failure estimate has the same logarithm-squared rate and uniform parameter
dependence required by Proposition 12.1.

The Babai argument includes the weighted suborbit spanning-tree count,
rather than only the easy triangle-inequality case. A rendered view of p.7
confirms that Lemma 8.5 asserts diameter two for the **complement** of the
symmetrized orbital graph. The Schomburg proof uses a conjugate that fixes
`u α` but moves `α`, hence does not commute with `u`; incidence counts and
commutator support give `n ≤ 4m + 6/(m−3)`. The degree threshold 38 gives
`m ≥ 10`, after which integrality yields `n ≤ 4m`. The primitive bound's
remaining degrees 5–37 use the pinned small-support recognition.

The repaired imprimitive exclusion was checked in all three ranges. In the
middle range five distinct long parts give disjoint block orbits; at most
one fills its blocks and at most three orbits contain cycles longer than
`n/4`. In the large range four nondivisible parts give unfilled, disjoint
block orbits, again avoiding all at most three long cycles. In either case
the selected companion original part really is at most `n/4`, as E1
requires. The original source's one-witness large-range argument does not
by itself justify this invocation. The final probability union retains one
threshold and constant uniform over the probability laws and permitted θ.

## Baseline, ownership and coverage

Read all 27 original declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including the ambient typeclass
hypotheses. No original citation was removed or found to be a near miss.
The four added citations were read at the same Mathlib pin. In particular:

| Baseline family | Compatibility checked |
|---|---|
| `Nat.Partition`; `fullCycleType`, sum, conjugacy and relabeling | Positive multiset parts, fixed-point ones and exact carrier cardinality |
| `factorDegrees` and its monic sum | Repeated normalized factors, rational-prime reduction and preservation of degree |
| Number-field Frobenius; finite-field factor orbits; integral lying-over | No unramified hypothesis; algebraic splitting residue extension; maximal prime above `(p)` |
| Galois root representation, injectivity and restriction | Splitting `Fact`; normal ambient extension for restriction surjectivity |
| Irreducibility/orbits and the existing double-transitivity adapter | Separability, positive degree and degree greater than one respectively |
| Multiple-transitivity and alternating-group APIs | Injective tuple action; pretransitive point-stabilizer recursion; degree-minus-two containment |
| Primitive actions and Jordan recognition | Existing vocabulary and exact support-two/support-three cases, with no extra degree-six restriction |
| Harmonic inequalities, Euler constant and cycle powers | Inclusive integer endpoints; `γ < 2/3`; a moved point is fixed by a cycle power exactly when its order divides the exponent |
| Root multiplicity formulas | Nonzero product over a domain; indicator multiplicity of a linear factor |

Read reviewed audit entries for parent layers 0, 1, 5 and 9, which are covered
by `REV-AUDIT-05`. Their already built root action, partitions, factor
degrees, Frobenius orbits and recognition facts remain imports, not new
nodes. Read the current upstream `PolynomialGaloisGroups` README and
Suggested file, and `NumberFieldArithmetic` Frobenius conventions, at
TauCetiRoadmap main `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`.
Searched the current roadmap tree, including the nine additions beyond the
atlas snapshot, and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` for the new definitions and
minimum-degree results. No additional owner or implementation was found.

The parent's Layer 1 grid gives `X ≃ Fin r × Fin s`, both factors greater
than one, with each group element permuting rows. Projection yields the
exact surjective equivariant quotient with constant fibre size; the
equivalence gives `n=rs` and hence `r ∣ n` and `1<r<n`. The packet's faithful
permutation-subgroup convention avoids any claim of a wreath embedding for
an abstract nonfaithful action. The supplier is an existing roadmap plan.

All stage targets have nodes and all prerequisite chains have identified
owners. No concrete coefficient distribution is planned here; those remain
downstream consumers. PG2-G1 prevents calling the entire chain closed and
is recorded in every affected stage's remaining work. Acceptance does not
erase that supplier gap.

## Source findings

All four inherited findings are independently confirmed for arXiv v3 only:

| Finding | Independent result |
|---|---|
| E1, Lemma 12.9 Cases 2b and 3, p.63 | The companion part is not bounded by `n/4` in the source, so its use of E1 has a gap; the packet's five/four-orbit repair addresses it. |
| E2, introduction p.4 and §11 p.54 | Unqualified irreducibility/transitivity equivalence fails for `(X²−2)²` acting on its distinct roots; the packet keeps separability. |
| E3, Lemma 12.8 proof, p.62 | The exponent inequality is reversed; `κα ≤ 1/40 < 1/8` supplies the intended prime threshold. |
| E4, Lemma 12.9 Case 1, p.63 | The displayed sum omits its summand; the argument requires the sum of the part values. |

The published journal text was not read, so these verdicts make no claim
about its wording or any published correction. No new source mistake was
established.

## Verification and handoff

`lean-check research/blueprint/suggested/PolynomialGaloisGroupsPartII.lean`
exited zero: 95 expected admitted-proof warnings, no other warnings and no
errors. The shared Mathlib build is at the pinned revision; all six directly
imported Tau Ceti source files match the pinned commit byte for byte. This
checks elaboration of signatures, not proofs. Every packet API and named
test has its corresponding suggested signature or example.

`python3 scripts/check_blueprint.py
research/blueprint/packets/PolynomialGaloisGroupsPartII.json` reports zero
errors and zero warnings. The submission file check and `git diff --check`
also pass. Only the four issue deliverables and this job's handoff are
changed.

There is no question blocking acceptance. The orchestrator should preserve
PG2-G1 at the analytic owner and pass the API additions, normalization
clarification and confirmed grid contract to the package worker. The older
reader document is outside this review issue's deliverables; the package
worker should reconcile it with the corrected packet and suggested file.
