# Independent review of FunctionFieldArithmeticPartII, revision 2

Job: `REV-DESIGN-FunctionFieldArithmeticPartII~2` · issue #6392.

Reviewer: Codex — `codex-j5HIy4` · 11 October 2026.

Input commit: `9ed13b38327bb8500c9e4c307e8f08979a7a04d1`.

**Verdict: accepted as a completed planning pass.** All 717 node contracts
were independently checked: 715 verified and two clarified in this review.
All 347 baseline declarations were confirmed at the exact library pins.
There are no added nodes, removed citations or unresolved contradictions.
All ten stages remain partial, all implementation statuses remain unchecked,
and the eight gaps and thirteen supplier requests remain open. Acceptance
does not establish mathematical closure, an implementation, or acceptance of
the independent symplectic split proposal.

## Revision and reader reconciliation

The first review identified a mismatch between the corrected packet and the
reader, missing finite cyclic specifications, and a failed canonical Lean
check. Revision 2 addresses those findings:

- The reader distinguishes the groupoid of all signed root divisors, with
  the modified-unit right action, from the Picard double quotient and from
  the effective divisor spaces that include sections.
- The revised hypotheses include the incidence transversality condition
  needed for the evaluation smoothness claim. The source locator points to
  the claim in the proof of Lemma A.4, rather than treating that claim as
  the numbered lemma statement.
- The fifteen finite cyclic-coordinate specifications are restored. Their
  maps retain the scaled divisibility character, the inverse basis map,
  and the coaction comparison on both tensor factors.
- The general root-stack contracts retain arbitrary positive exponents,
  scheme and stack bases, nontrivial lines, and full nonreduced fibres.
  Finite charts and chosen-frame groupoids remain specialized interfaces;
  their stackification and general root-object comparison are obligations.
- Upstream AlgebraicVectorBundles L0A–L0B supplies the general tensor-section
  and coherent module-pullback infrastructure. SF.3/JAC-A owns the remaining
  native invertible-sheaf integration and root-specific coordinate laws.
- The canonical suggested file now elaborates at the exact pins. The six
  admitted diagram/cocone/coefficient proof fields retain their signatures
  and are honest admissions in a suggested file.

I read every node's statement, hypotheses, prerequisites, proof sketch,
acceptance conditions, and attached API and tests. A separate normalized-text
reconciliation found all 717 statements, all 591 raw API entries, and all
564 raw test entries in the revised reader. Some older prose restates
hypotheses, proof notes and acceptance criteria differently; the revised
contracts and the reader's stated historical boundaries were compared
semantically. The reader remains unchanged because it is outside this
issue's deliverables. In particular, its generic unity coefficient formula
is understood with the explicit transport already stated in its proof,
which this review now also makes explicit in the packet's acceptance field.

## Corrections made by this review

1. `RS.2/infinite-affine-quotient`: made the old compilation note explicitly
   historical. Current canonical elaboration with admissions does not
   supply the actual geometric carriers in the omission ledger.
2. `RS.2/factorial-unit-qz-coefficient`: aligned acceptance with the statement
   and native signature by naming `factorialUnitCoefficientMap`. The generic
   map at parameter one needs transport along the coefficient homomorphism's
   preservation of one before its target is the unity-root algebra.
3. Replaced 59 baseline `provides` descriptions, entries 278–336, that copied
   declaration headers and appended generic boilerplate. They now describe
   the actual imported statements in own words. Names, modules, locators and
   citations are retained.
4. Confirmed all twelve source findings at their recorded locators, retained
   the preceding reviewers' receipts, and described the printed claims in
   own words. No new source finding was needed.
5. Replaced the roadmap's accumulated checkpoint summary with the current
   scope and review boundary. Historical stage refinements do not override
   the packet's current contracts and remaining lists.

The packet contains a fresh per-node verdict, a per-baseline confirmation
with direct consumers, and the exact elaboration receipt. The prior
`needs_changes` review is retained as a superseded historical record.

## Sources and limits of the fresh reading

The following public texts were freshly obtained and compared at the consumed
locators. Page numbers are printed page numbers. This table records review
bounds, rather than a section-by-section account of the sources.

| Source | Freshly checked locators and use |
| --- | --- |
| [Yun–Zhang, published paper](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | Appendix A.1–A.3, pp.514–526; the root local-system consumer in §6.2.1, pp.496–497; the signed divisor groupoid and following computation in §6.2.3, pp.498–499; normalized IC notation in §7.1.1, p.506. |
| [Abramovich–Graber–Vistoli, arXiv math/0603151v2](https://arxiv.org/pdf/math/0603151v2) | Appendix B.1–B.2, pp.52–54; root triples, quotient conventions, full zero fibre and the two-fibre-product presentation. Pages 53–54 were also inspected as rendered pages. |
| [Talpo–Vistoli, arXiv 1410.1164v2](https://arxiv.org/pdf/1410.1164v2) | §3 and §3.1, pp.12–17; Definitions3.3/3.8, cofinality, local grading, Proposition3.10, Corollary3.13 and Remark3.17. |
| [Bresciani, version of record](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | pp.131–136, including the characteristic-zero convention and the DVR/infinite reduced-gerbe construction. Arbitrary-characteristic algebra adapters are authored deductions, rather than attributions to this paper. |
| [Alper, 23 February 2023 draft](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-2-23-23.pdf) and [5 January 2026 draft](https://sites.math.washington.edu/~jarod/moduli.pdf) | Old pp.138–139 and new pp.158–160; the root-stack examples, caution and exercises used by the framed-root contracts and E10–E11. |
| [Andreychev–Venjakob, arXiv 2303.13436v1](https://arxiv.org/pdf/2303.13436v1) | pp.1–2, 26–28 and 30–35, including the trace/nuclearity and L-function interfaces used to assess the split boundary. This is not a fresh complete review of the 38-contract symplectic inventory. |
| Stacks Project | [59.28.3, Kummer](https://stacks.math.columbia.edu/tag/040N); [39.10.1–3, actions and equivariance](https://stacks.math.columbia.edu/tag/022Y); [32.2.1, affine inverse limits](https://stacks.math.columbia.edu/tag/01YW); [34.7.1, fppf covers](https://stacks.math.columbia.edu/tag/021M); [112.5.13, root-stack context](https://stacks.math.columbia.edu/tag/04V8); [26.17, fibre products](https://stacks.math.columbia.edu/tag/01JO). Displayed definitions and the consumed proofs were checked. Linked bibliographies were not recursively reviewed. |

Fresh PDF hashes agree with the packet's version receipts:

| Text | SHA256 |
| --- | --- |
| Yun–Zhang | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| AGV v2 | `c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb` |
| Talpo–Vistoli v2 | `92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2` |
| Bresciani | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| Andreychev–Venjakob v1 | `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` |
| Alper 2023 | `d97ca3395446c719f53182bbe1976c76aa6603a0fb99a7705016caad87a1ce91` |
| Alper 2026 | `f07437af689e9ae4ccd355183f357d234474606a4e0d6511ff2d4ac0a4f14d6d` |

All ten immutable authored-source URLs were also recovered and their hashes
matched: the factorial coaction, coefficient, convolution, point-action,
finite cyclic, rational-coordinate, rational-coaction, rational-coefficient,
native-coordinate and infinite-coinvariant continuations. I checked the
consumed mathematical contracts as authored deductions from their native
inputs. These are not printed theorem names in Talpo–Vistoli. Historical
admission-free prototype receipts remain attributed to their authors; their
archived Lean proofs were not independently replayed in this run.

All twelve `sourceIssues` are confirmed with fresh reasons. E1 retains
the IC/lisse normalization distinction; E2/E10/E11 retain nilpotent sections;
E3 limits only branch inertia to order two; E4 uses the two-factor descent;
E5/E7/E9 repair the indicated section or sheaf notation; E6 supplies an
effective auxiliary divisor. E12 is the exponent-symbol error on rendered
preprint p.53, with no claim about a published edition. E8 confirms the
ordinary Picard-class interpretation problem and missing coherent descent
data, rather than rejecting every possible Picard-stack exactness notion.
That issue remains `NORM-2EXACT`.

## Baseline, suppliers and ownership

All 347 declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, across 136 cited modules.
I checked ambient assumptions as well as signatures, and defining data/RHS
where needed to identify the construction. Every citation fits as the native
ingredient the consumer uses; none is treated as providing an omitted
geometric theorem. No citation was removed or replaced. The four direct Tau
Ceti imports used by the suggested file match the pin's source bytes.

Supplier checks included SF.1–SF.3, FA.2/FA.4, IG.0/IG.1, the EDC.2
interfaces, R09.4/R09.5 descent and gerbe/limit targets, and D0's groupoid
quotient and two-fibre-product target. Descent for arbitrary QCoh modules,
finite locally free rank-one modules, neutralization after a chosen object,
and coherent limit objects are used with their distinct hypotheses. An
abstract existing class-field-theory interface does not supply the missing
geometric Picard character sheaf. Each of the thirteen requests has a
specified supplier and contract.

The ownership check used current TauCetiRoadmap commit
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the AlgebraicVectorBundles
and JacobianChallenge exemplars, checked the nine post-snapshot roadmap
directories and the Completed roadmap suggestions, and searched the current
library for the consumed root-stack/character/tensor interfaces.
OperatorTheory has a README but no Suggested.lean at that roadmap commit.
The check supports the explicit AlgebraicVectorBundles imports and the
root-specific remainder; it is not a claim of universal library absence.

## Closure, API, tests and validation

The finite and infinite algebra contracts retain zero rings, nonunit
parameters, nonflat coefficient maps and wild/nonreduced examples. Universal
Hopf coinvariance is distinguished from fixedness under field-valued points.
The invariant proof extracts finite character coefficients and uses the
monic basis and injective inclusion; it does not cancel roots or assume that
arbitrary invariants commute with colimits. The normalization contracts
retain unit-labelled stabilizers and state the positive-exponent boundary
for faithful flatness and fppf covers. Spec-limit and chosen-pullback
comparisons are separate from stackification, fpqc frame torsors and genuine
infinite root-object two-limits.

There are 139 definitions/constructions, with 586 API entries and 528 tests
on those nodes (591/564 including entries on other kinds). Every definition
and construction has at least three tests. I checked the tests against
plausible wrong carriers, orientations, coefficient maps and reduced-point
substitutions. The forty planets identify the main mathematical objects and
results. The inherited 717-node input exceeds the current budget; revision 2
adds no nodes and completes its required pass without marking a stage closed.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII.json`: zero errors and warnings.
- The same check against an index made from the exact pinned library sources:
  zero errors and warnings.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII.lean`:
  exit 0, zero errors, 1,073 `sorry` warnings and no other warnings.
  The code hash from the first import is
  `8dd2fed8d1aa7dd844548ab260b4d2bf23d76818e661531a55e2cb91dfc4fcf1`.
  This review changes no Lean code. Missing geometric signatures remain in
  its explicit omission ledger.

There is no question blocking acceptance. The orchestrator should retain the
eight recorded gaps and thirteen requests when scheduling the remaining
work, and decide the separate symplectic split on its own review. This run
finishes issue #6392 only.
