# Independent review: Kloosterman moments and potential automorphy

**Verdict: accepted as a complete target-level planning pass.** This is not a
claim of mathematical closure or implementation. All twelve stages remain
planned, none is closed, and nine gaps and thirteen supplier requests remain.

Reviewer: Codex, session `codex-bgObmW`, job
`REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy`, issue #3556,
2026-10-19. The design was written by a different session, `codex-bJqrNS`.

## Coverage and method

I checked all 62 targets against their primary-source locators, including the
coefficient fields, shifts, weights, exceptional characteristics, local factors
and pairing conventions. The packet's `review.checked` gives an individual
reason for every verdict: **48 verified, 14 corrected, zero added and zero
unverifiable**. A verified target may have a recorded missing proof input; its
verdict does not certify that input as supplied.

The inventory remains 11 definitions, 10 constructions, 38 theorems, one
comparison and two applications, with 85 API items, 63 discriminatory tests,
59 planets and seven baseline declarations. Every definition and construction
has at least three tests. Every layer has at most six planets. All 49 routed
items retain their dispositions, including the two explicit boundary items.
No target-level split was necessary. Every stage description has corresponding
targets, and both the node and layer dependency graphs are acyclic.

Direct reading used the public versions already identified by URL, version and
hash in the packet:

- Fresán–Sabbah–Yu, [*Hodge theory of Kloosterman connections*, v5](https://arxiv.org/pdf/1810.06454v5): the cited main-text locators on pp. 1–59 and Appendix A on pp. 59–72, including the product-potential and Fourier comparison arguments.
- Xu–Zhu, [*Bessel F-isocrystals for reductive groups*, v2](https://arxiv.org/pdf/1910.13391v2): §1.1.1–1.1.2, pp. 2–4; §2.1.5, p. 10; §4.1.13, p. 42.
- Serre, [*On the mod p reduction of orthogonal representations*, v3](https://arxiv.org/pdf/1708.00046v3): §4.1–4.2, Theorem 4.2.1 and Lemma 4.2.4, pp. 9–10, including their proofs.

The original proof sources explicitly left unread in G3, G4, G8 and G9 remain
unread here. Their conclusions were checked where FSY/XZ state them; this
review does not convert secondary theorem statements into original proof
decompositions. No restricted book was needed or copied.

## Corrections made

1. **Global versus two-adic conjectural sign.** KM.11/even-functional-equation
   previously assigned `(−1)^floor(k/8)` to the global sign. FSY Remark 5.37,
   p. 56, assigns this prediction to the two-adic contribution. The global
   prediction also includes
   `v′ = Σ_(p≡1 mod4) floor(k/(2p)) + Σ_(p≡3 mod4) floor(k/(4p)) + δ_(8|k)`.
   The reader now gives the full dictionary. At k=8 the predicted local sign
   is −1 and the predicted global sign is +1. Neither prediction is promoted
   to a theorem; the target still uses the actual geometric invariants.
2. **Hodge–Tate convention at the supplier boundary.** FSY/KM labels the
   cyclotomic character by −1; R06.2 labels it by +1. Added the exact supplier
   convention node and the dictionary `HT_KM(V) = −HT_R06(V)`, preserving
   multiplicities, the representation, its Tate twists and the filtered
   covariant period module. The k=7 labels are 2,4,6 here and −2,−4,−6 at
   R06.2. Regularity and the stated polarization are unaffected.
3. **Exact period suppliers.** Replaced the broad R06.2 prerequisite in
   KM.9/padic-comparison, KM.9/newton-polygon and KM.11/local-transport with
   the existing exact nodes `admissible-category-tannakian`,
   `ddr-exact-strict-tensor`, `dst-exact-tensor-fully-faithful` and
   `admissible-implies-weakly-admissible`, as appropriate. Together with
   `hodge-tate-weight-convention`, these five inspected nodes supply the
   requested period inputs. Removed the redundant request and its coverage
   obligations, reducing fourteen requests to thirteen. No period theory is
   replanned locally.
4. **Étale and holonomic extension boundaries.** The cited EDC.5 intermediate
   extension node is stated for torsion coefficients. Added
   EDC.6/rational-perverse-coefficient-extension to the rational étale
   cohomological-moments target. Conversely, removed the étale analogue from
   KM.3/middle-cohomology's direct inputs: it cannot supply a holonomic
   intermediate extension. G1 already states that precise missing input.
   Synchronized the roadmap's layer requirements and the reader.
5. **Purity dependency.** The normalized sheaf's weight-zero assertion now
   directly depends on KM.1/sheaf-structure, where weight r−1 purity is
   stated. This adds no cycle.
6. **Odd semisimplification argument.** Replaced the unsupported phrase
   “local semisimplicity” in KM.8/odd-conductor's proof route. The stated odd
   local decomposition has finite inertia image and N=0. In characteristic
   zero, finite-inertia invariants are exact on a global Jordan–Hölder
   filtration restricted locally, so Frobenius determinants on invariants and
   the tame conductor are unchanged. Semisimplicity of an unramified
   Frobenius is unnecessary.
7. **Source attribution and metadata.** Split five mixed FSY/XZ locator
   entries into separately attributed citations with specific matches:
   raw-sum, deligne-sheaf, sheaf-structure, monodromy and rigid-realization.
   The last now explicitly includes XZ §4.1.13. Corrected the FSY PDF length
   from 75 to 74 pages in both JSON documents and the reader; theorem page
   numbers and the verified hash are unchanged.
8. **Baseline precision.** AddChar needs an additive monoid and a
   multiplicative monoid; its description no longer unnecessarily restricts
   the latter to a commutative monoid. All seven citations remain valid.
9. **Source-issue verdicts.** Added the required independent review objects
   to E1–E9 and corresponding reader explanations. Refined E6's description
   and replaced E9's pending-independent-review status. Details follow.

No Lean signature needed a change: the corrected geometric/conjectural targets
have no carrier at the pins and are deliberately README targets under the
compact-file rule. The existing suggested file was independently checked in
its final unchanged form.

## Source issues

All nine records are confirmed, with these precise meanings:

| Record | Independent finding |
| --- | --- |
| E1 | FSY §3.2.1, p. 23: the single sheaf integrates over n coordinates; nk belongs to its kth tensor construction. |
| E2 | FSY proof of Proposition 4.20, p. 33: the relevant primitive index is k−1, the monodromy center. A length-k block has top weight 2k−2. |
| E3 | FSY §5.1.1, p. 40: reciprocal partners are α and p^(k+1)/α. At k=3,p=2, −4 is fixed by 16/α. |
| E4 | FSY §5.1.2, p. 41: the derivative claim needs the hypersurface intersection with the coordinate divisor; crossing components must be distinct. |
| E5 | FSY Corollary 5.30, p. 52: the standard Serre product differs from the paper normalization by π^(d_k(d_k+1)/4). The functional equation is unchanged. |
| E6 | FSY Example A.3, p. 63: the first, unshifted i* display has the wrong degree. For normalized perverse constants, i*Q_U^p = Q_D^p[1], so use shift [−1] and perverse degree −1. The next i! display with shift [1] is correct. The old record incorrectly described the first display as having a positive shift. |
| E7 | FSY Example A.27, p. 71: the composite is supported at zero; it is not the zero functor. |
| E8 | XZ §§1.1.1, 2.1.5, 4.1.13, pp. 2–3,10,42: for d+ϖdx, horizontality of F*E→E requires d log u = ϖ(d(x^p)−dx). This fixes the multiplier sign; cyclic-module and horizontal-coefficient equations remain distinct. |
| E9 | FSY proof of Proposition 5.23, p. 50, compared with (5.6)/(5.16), pp. 41,45: the stated unit-thickness model does not cover every orbit parameter. This is a proof gap, not a counterexample to the proposition. |

For E9, the concrete check is k=9,p=3,a=3. The critical value is 18, with
3-adic valuation two, and the quadratic Hessian is nondegenerate. Formal Morse
reduction preserves that smoothing thickness. A unit times `(sqrt(−3))²`
has valuation one. The inspected RD.7/mieda-p-adic-picard-lefschetz contract
requires precisely the latter model. A further resolution or comparison
argument is therefore necessary. G6 correctly retains it. The all-prime de
Rham and stated good-prime crystalline branches do not depend on this step.

## Baseline and ownership

Every declaration's actual statement was read at the required pin, rather than
inferred from its name. None was removed or replaced.

| Declaration | Pinned module and fit |
| --- | --- |
| `AddChar` | [Mathlib/Algebra/Group/AddChar.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/AddChar.lean#L70): the existing character carrier and constant-one trivial character. |
| `AddChar.sum_eq_ite` | [Same module, line 329](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/AddChar.lean#L329): orthogonality for a finite additive group over domain coefficients. |
| `FiniteField.trace_to_zmod_nondegenerate` | [Mathlib/FieldTheory/Finite/Trace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Trace.lean#L37): nondegenerate prime-field trace; its surjectivity gives nontriviality of the composed character. |
| `FiniteField.algebraMap_trace_eq_sum_pow` | [Same module, line 49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Trace.lean#L49): trace as the sum of Frobenius powers. |
| `Complex.Gamma` | [Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean#L287): the total complex function, with the meromorphic interpretation reserved for analytic assertions. |
| `TauCeti.Hodge.MixedHodgeStructure` | [TauCeti/Geometry/Hodge/Mixed/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Mixed/Basic.lean#L72): rational weight filtration and complex Hodge filtration with pure graded pieces, specialized to rational modules. |
| `SymmetricPower` | [Mathlib/LinearAlgebra/TensorPower/Symmetric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorPower/Symmetric.lean#L52): the local symmetric tensor module, without claiming it supplies induced connections. |

I read the relevant `data/library-coverage.json` entries for character sums,
arithmetic local representations and the Hodge-structure layers. The plan
imports existing character, MHS and toric carriers and does not recreate them.
The current upstream tree was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included the
post-snapshot roadmaps and current Mathlib. No existing Kloosterman,
holonomic/MHM or irregular-Hodge implementation matching these targets was
found. ArithmeticDirichletSeries and ProfiniteArithmetic supplied style and
ownership checks. AnalyticToricGeometry's actual layer-zero README and
Suggested interfaces supply complex toric charts and gluing; the needed
arithmetic extension remains G7. No upstream files or libraries were edited
or built.

I read the exact external-node statements for DWP cohomological bounds;
EDC intermediate extension and rational coefficient extension; LPV ordinary
Picard–Lefschetz and its FSY discriminant example; MC.5 Nori category, tensor
category and supports; RD.7's unit-thickness comparison; R06.2's period inputs;
ML.0 archimedean factors and ML.2's two Patrikis–Taylor nodes; and R01.2–R01.3
epsilon, pure-associated-graded WD and conductor nodes. Broader SF.2, EDC,
RD, CP, MC.5, G7 and R01.5 needs remain precise requests wherever the inspected
statement does not supply the full needed contract. Supplier statements with
their own gaps are not treated as implemented library theorems.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/KloostermanMomentsAndPotentialAutomorphy.json`: zero errors and warnings.
- `lean-check research/blueprint/suggested/KloostermanMomentsAndPotentialAutomorphy.lean`: successful elaboration at the pinned shared build; only 22 expected `sorry` warnings. The file remains 174 lines, five real-bodied definitions, ten named theorems and twelve examples.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/KloostermanMomentsAndPotentialAutomorphy.lean`: passed; no placeholder data definition.
- `python3 research/blueprint/intake.py check-files` on the five changed deliverables: zero problems.
- Reader/packet audit: every statement, hypothesis, proof step, API, test, source match, request and gap agrees; all nine reader source-issue sections carry exactly their own verdict.
- Independent arithmetic checks: exact extension-field moments at q=2,4,8 recover the k=3 and k=4 generating polynomials through degree three. Numerical prime-field checks at p=2,3,5,7,11 through k=12 confirm the stated sign, integrality and character-independence examples. Hodge cardinality, regularity, dimension parity and characteristic-two degree partitions agree through k=500. These are consistency checks, not proofs.
- `git diff --check`: passed. No source passage, PDF, restricted text, local path or build artifact is submitted.

There is no unresolved contradiction requiring a design revision. The
orchestrator still needs to route G1–G9 and the thirteen supplier contracts:
holonomic/MHM foundations, motivic weights, characteristic-two vanishing
cycles, preservation of forms under semisimplification, higher-thickness
semistable geometry, arithmetic toric extension, original arithmetic proof
leaves and the Saito root-number theorem. The existing structural proposals
name their owners. Their precise statements and consumers remain in the
packet and reader; accepting this pass does not discharge them. In particular,
neither the even two-adic predictions nor cuspidality of the entire moment
system should be added during packaging.
