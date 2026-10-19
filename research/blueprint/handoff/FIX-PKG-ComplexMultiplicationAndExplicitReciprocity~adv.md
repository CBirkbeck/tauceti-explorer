# CM package fix: blocked checkpoint

Job `FIX-PKG-ComplexMultiplicationAndExplicitReciprocity~adv`, issue #10955.
Worker: Codex, session `codex-CwkCr5`, 19 October 2026.
The bot confirmed this session's claim in issue #10955 after claim comment
6269944574. Starting commit: `ded1a70165e3d3df66d8ed847d734695148f8da8`.

**Checkpoint; not ready for acceptance.** The issue requires a finding-by-finding
repair against `research/blueprint/reviews/REV-PKG-ComplexMultiplicationAndExplicitReciprocity~adv.md`.
That input is missing. The earlier repair already recorded this same blocker;
this continuation confirms that it remains unresolved. The package stays
`needs_changes`. Do not interpret the availability of this fix issue, the older
accepted review, or successful elaboration as evidence that an unseen review's
findings have been discharged.

## Missing input and resume point

The required report does not occur in the working tree, the `origin/main` tree,
or the available git history of the review directory. On 19 October 2026 the
GitHub contents endpoint for its exact path on `main` returned HTTP 404.
An all-state issue-title search for the exact adversarial-review identifier
returned no issue. The current issue has no findings attachment. The preceding
issue #10742 and its submission #10886 contain a checkpoint describing this
same missing input, rather than the report itself.

The report that **does** exist is
`research/blueprint/reviews/REV-PKG-ComplexMultiplicationAndExplicitReciprocity.md`,
the 9 October review of the earlier package. It was read in full; its acceptance
does not supply the missing later findings. The previous repair's detailed
mathematical dispositions and pass tables remain in
[the adv2 handoff](FIX-PKG-ComplexMultiplicationAndExplicitReciprocity~adv2.md).

**Next action:** supply the exact adversarial report, or have the maintainer
explicitly identify a replacement findings list. Compare every actual finding
with the repaired README and Suggested.lean; record each identifier and its
disposition; repair any residue; rerun Lean and file checks. Only then can
`review.json` become `accepted`. No mathematical fact is being deferred merely
because it is difficult: the blocker is the absent list this issue explicitly
requires the worker to resolve.

No source download, script or build log is needed to resume. All durable work
and the exact blocker are in the issue's four deliverables and the earlier
handoff linked above. No second issue was claimed.

## Changes in this continuation

| Requirement or observation | Disposition |
| --- | --- |
| Missing adversarial findings | Still blocked; searched the repository, available history, GitHub main, issues and the prior submission. No invented finding identifiers or acceptance claim. |
| Layer form in Suggested.lean | Replaced the six ordinary layer comments by module section comments in layer order and made the opening title identify representative target signatures. No mathematical declaration was removed. |
| Quartic embedding sign | The README's concrete-input API promises positive imaginary parts for both selected roots. Its Checks and Lean now explicitly test `Im(b)>0`. Added the negative control `(-b)^2=b^2` with `Im(-b)<0`: the square and quartic polynomial alone cannot choose the selected embedding. |
| Previous substantive repairs | Preserved them. The ComputationalNumberTheory supplier remains absent; the finite-product estimates, actual signed counts, ordinary-order hypotheses and strict CRT bound remain. Heavy geometric targets remain in the README, without sorry-bodied data or arbitrary replacement carriers. |
| Verdict | Updated the fix identifier and this continuation's evidence and validation in `review.json`; retained `needs_changes` solely for the missing findings comparison. |

## Pass table

This table records the touched statements and the retained Lean end statements
checked during the continuation. The preceding handoff contains the wider
geometric/source audit; it is not represented here as newly performed work.
Admitted proofs remain admitted.

| Statement | Instances or failure modes checked | Result and change |
| --- | --- | --- |
| `quarticB`, its square/quartic identities, and the embedding choice | `b=i sqrt(3-sqrt(2))`; the other root `-b`; zero radicand; comparison with `a=i sqrt(3+sqrt(2))` | Since `0<sqrt(2)<3`, the radicand is strictly positive. Thus `Im(b)>0` and `Im(-b)<0`, although both squares and quartic polynomial values coincide. Added the positive and negative Lean examples and the README explanation. |
| `CMType.card` | Empty reduced algebra; one quadratic factor; two quadratic factors; real embeddings | Counts are respectively 0, 2 and 4 before halving. A real embedding is fixed by conjugation and cannot satisfy the partition. Kept finite dimension and reducedness. |
| `CMType.reflexField_conjugate` | Gaussian singleton and its conjugate; trace zero; rank-zero algebra | Conjugating the actual finite sum and its native adjoin gives the transported field; no field-only primitive-pair hypothesis is used. Unchanged. |
| `CMType.quadratic_primitive` | Quadratic CM field; whole-field inducing pair; proper subfield | A proper subfield of a quadratic field is rational and cannot be CM. The displayed CM-field and degree-two hypotheses remain. Unchanged. |
| `nonmaximalGaussian_classNumber` | `Z+3Zi` versus `Z[i]`; discriminant -36; the two reduced forms `[1,0,9]`, `[2,2,5]` | Class numbers 2 and 1 must remain distinct. Reuses IntegralLattices B2/B5 and the order arithmetic supplier. Unchanged. |
| `rootProduct_coeff_bound` | Empty product, singleton, two roots, zero roots, coefficients above the degree | Empty product has coefficient bound 1; zero coefficients are covered. Nonnegative pointwise majorants remain explicit. Unchanged. |
| `rootProduct_coeff_perturbation` and `rootProduct_precision` | Cardinalities 0, 1, 2; displacement zero; roots 1 and 2; positive cardinalities 1 through 8 and root bounds 0 through 4 | Empty error 0; singleton bound delta; two-root coefficient changes `3 delta+delta^2` and `-2 delta`. Forty rational precision instances pass. Precision still requires positive cardinality; the general perturbation bound allows zero. Unchanged. |
| `signedRelationCount.bound`, `.even`, `.invert_choice` | Cyclic groups of orders 1 through 8; relation lengths 0 through 3; every class vector and exponents 0, 1, 2 | Exhaustively checked 36,944 instances. Counts retain sign multiplicity; evenness has the necessary nonempty sign set; inversion is a coordinate bijection. The empty relation has count 1. Unchanged. |
| `coefficient_interval_recovery` | Gaussian coefficient -1728; adjacent-integer interval; unequal polynomial degrees | Exact coefficient membership and uniqueness are both hypotheses, checked through the maximum of both degrees. The ambiguous interval does not satisfy uniqueness. Unchanged. |
| `polynomial_bounded_congruence` | Bound 0; bound 10 with moduli 20 and 21; repeated modulus 5 | `-10` and `10` agree modulo 20; they differ modulo 21. Congruence modulo 5 cannot be upgraded to modulo 25. Strict bound and bounds on both polynomials remain. Unchanged. |
| Geometric boundary witnesses used by the retained examples | Gaussian curve over fields of sizes 5 and 7; conductor data `q=641,t=8,v=25,D_K=-4` | Exact point counts are 8 and 8; discriminant identity is `8^2-4*641=25^2*(-4)`. These computations do not replace the geometric CM/reduction or exact-order hypotheses. Unchanged. |

Characteristic-p and DVR substitutions are outside the complex-radical
statements' domains. The Lean file introduces no p-adic coefficient-ring growth
formula, so no general-DVR assertion is inferred from a `Z_p` specialization.
The sign Check uses a two-root witness over the actual complex carrier.

## Source and ownership checks

Read the worker and package protocols, the expansion protocol, upstream guide,
the measure-roadmap exemplar, the existing CM review and prior fix handoff, and
the CM entries of `data/library-coverage.json`. The read-only current upstream
IntegralLattices and EllipticCurves READMEs were consulted; IntegralLattices'
Suggested.lean explicitly supplies the B2/B3/B5 contracts already consumed by
this package. No new ownership target or duplicate library theory was added.

Fresh public source spot-checks were Milne, *Complex Multiplication*, v0.10;
Sutherland's 2023 Lecture 21, Theorem 21.15, printed p.10; and Yang, *On CM
abelian varieties over imaginary quadratic fields*, author-copy Introduction
pp.1–2. In particular the lifting source explicitly allows the stated residue
field identification; no weakening of that target was warranted. Yang's
principal-sign condition at the exceptional units remains distinguished from
the existence construction's discriminant range. The new radical Check is an
elementary consequence of the displayed explicit example, not an attribution
of a new theorem to these sources. No source passage was copied.

The read-only upstream commit is `0d144d044dacebca17b654695b6f1ad58f159b27`
and its current Tau Ceti library commit is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was modified, and
no Lake command was run there.

## Validation

The final `lean-check` finished with exit 0, zero errors and 70 warnings, all
`declaration uses sorry`. More than 20 GB of memory was available before each
run; each run finished before the next began. The Lean file uses Mathlib
alone; its 12 end statements and 96 examples have no Tau Ceti imports. The
shared build uses the exact Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Lean elaboration checks the
statements' types, not their admitted proofs or future geometric adapters.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocity.json`: zero errors and warnings; packet unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean`: passes.
- `python3 research/blueprint/intake.py check-files` on the four issue deliverables: zero problems.
- Exact scratch computations: 36,944 cyclic signed-relation instances, 40 rational precision instances, Gaussian point counts and the conductor/CRT boundary witnesses pass. These computations do not prove the general admitted statements.
- `git diff --check`: passes. Only the four issue deliverables change. Metadata, packets, atlas data, the earlier handoff and the upstream trees are unchanged.
