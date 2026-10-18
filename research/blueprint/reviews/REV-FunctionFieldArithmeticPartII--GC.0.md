# Independent review: FunctionFieldArithmeticPartII, GC.0

Accepted after corrections on 2026-10-18 by Codex (GPT-6), session
`codex-uu3skJ`, for [issue #8944](https://github.com/CBirkbeck/tauceti-explorer/issues/8944).
This reviewer did not write the input plan. The packet's review identity is
`independent-review-REV-FunctionFieldArithmeticPartII--GC.0`.

## Counts and verdict

| Item | Result |
| --- | --- |
| Target nodes | 9 checked: 5 verified, 4 corrected, 0 unverifiable |
| Definitions / constructions / theorems | 2 / 1 / 6 |
| API items | 18 checked; 3 strengthened in place |
| Definition/construction tests | 13 after adding 1; distributed 4 / 4 / 5 |
| Baseline declarations | 13 confirmed; none removed or replaced |
| New nodes | 0 |
| Source issues | 1 inherited finding independently confirmed; 0 new findings |
| New planets | 0; the three parent GC.0 planets remain within the six-planet budget |
| Remaining interfaces | 3 supplier requests and 1 geometric-signature gap, explicitly retained |

The packet is a **complete planning pass**, with GC.0 coverage **planned**,
not closed. The full root geometry has precise mathematical targets and
supplier contracts. Its absence as assembled Lean interfaces at the pins is
recorded in `GC0-LEAN-GEOMETRY`; acceptance does not claim implementation.

## Corrections made

1. **Nonempty branch locus for full triviality.** The assertion that an everywhere-nonzero
   geometric section has trivial full inertia now explicitly assumes `r>0`. For `r=0` the section equations are vacuous and the ordinary scalar
   group remains G_m. The packet's acceptance checks and reader were updated.
   The suggested file now states the frame-relative and nonempty-frame-full
   stabilizer consequences directly, replacing the previous coercion-only
   equivalence, and includes a `Fin 0` regression with a nonidentity scalar.
2. **Zero section on an empty base.** Noninvertibility of the zero-section
   object requires `R_S≠∅`, rather than merely `R≠∅`. For `S=∅`, all root data
   and sections form a terminal groupoid, and the zero section is a frame.
   Corrected the statement, test and reader narrative, and added
   `check_section_empty_base`. The geometric omission ledger includes it.
3. **Exact Kummer locator.** The relative-gerbe node now cites both Stacks
   Lemma 59.28.3 (fppf, tag 040N) and Lemma 59.28.1 (étale when 2 is
   invertible, tag 03PL). The previous locator named only the former while
   claiming both topologies. Source metadata and the reader now agree.
4. **Source scope.** Yun–Zhang's application uses a finite field of odd
   characteristic and a reduced finite R. Each source match now distinguishes
   that setting from this plan's extension to arbitrary fields with finite
   étale R. The native tensor, frame and descent proofs justify the extension;
   they use no Frobenius or finite-field result. The parent finite-field
   application is unchanged. Clarified that i is a closed immersion and the
   finite-étale condition is on R→Spec k, rather than on i.
5. **Usable arrow API.** `nativeIso` now states extensionality and projection
   formulas for identities, composition and inverse; `pullback` specifies its
   native identity/composition comparisons and pseudofunctor laws;
   `sectionIso` states extensionality and the projected category operations.
   These strengthen existing targets without creating proof-step nodes.
6. **Inherited erratum bookkeeping.** Added the published `sourceVersions`
   entry and an independent `confirmed` review of `FunctionFieldArithmeticPartII/E2`.
   All statements remain in our own words; no `excerpt` field or source passage
   is present.

The reader contains the corrected statements, API, test and source matches,
and describes the exact suggested fragment. No implementation-status field,
parent packet, supplier packet or atlas data was changed.

## Node checks

The packet records a separate verdict and explanation for every node.
Locators below refer to the author-hosted published
[Yun–Zhang article](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Annals of Mathematics 189 (2019), 393–526; these are printed page numbers.

| Node suffix | Verdict | Source and mathematical check |
| --- | --- | --- |
| `native-root-fibres` | corrected | Definition A.1, p. 514; A.1.1, p. 515. Actual invertible-sheaf triples, compatible pairs of isomorphisms, and effective descent; API strengthened. |
| `root-tensor-coherence` | verified | Definition A.1, p. 514; A.2.2, pp. 521–522. Middle-factor interchange uses unsigned symmetry; dual square uses the inverse of the dual identification. Coherence is imported on the two native line factors. |
| `root-degree-components` | verified | Definition A.1, p. 514; A.2.2, pp. 521–522. Degree is deg L, ranges over all integers, and is locally constant in families. Geometric nonemptiness does not choose a k-object or trivialize Pic^d. |
| `root-frame-action` | verified | A.1.1, p. 515. With γ:L_R→O and e′=e u⁻¹, the formulas γ′=u²γ and atlas arrow (1,u) agree. Nontrivial frame torsors and nonsplit R remain present. |
| `square-quotient-comparison` | verified | A.1.1, p. 515. Descent of the actual frame torsor gives both directions, unit and counit, and all arrows. Algebraicity uses its existing suppliers; empty R retains the ordinary Picard stack. |
| `relative-root-gerbe` | corrected | A.1.1, p. 515, plus the two Kummer lemmas above. Fixed-L arrows give the relative μ₂ band. Finite-étale splitting gives rank 2^ρ and local comparison; no canonical global root is chosen. |
| `native-root-section-fibres` | corrected | A.1.2 and Definition A.2, p. 515; A.1.5, p. 517. A root section lives only on R; it need not extend to X. The zero/empty-base condition and arrow API were corrected. |
| `section-quotient-comparison` | verified | A.1.2, p. 515. Weights two and one preserve γ⁻¹a². In the fixed-root 2-fibre, actual sections descend to affine rank-ρ charts without quotienting them by root automorphisms. |
| `root-stabilizers` | corrected | Definition A.1 and A.1.1–A.1.2, pp. 514–515. The sheaf equations are u²=c and uα=α, with c=1 only for relative inertia. Full triviality requires a nonempty index set; arbitrary-ring sections are never cancelled without a frame. |

Also read the downstream tensor/torsor consumers in A.2.2, pp. 521–522,
and A.3.1, pp. 523–524, and the boundary with global effective sections in
A.1.3–A.1.5, pp. 515–517. Read Stacks
[§95.16, Lemma 95.16.1](https://stacks.math.columbia.edu/tag/0372),
[§97.11, Lemmas 97.11.1–97.11.3 and Proposition 97.11.5](https://stacks.math.columbia.edu/tag/05Y8),
and [§59.28, Lemmas 59.28.1 and 59.28.3](https://stacks.math.columbia.edu/tag/03PK)
at the node locators. These online sources have no fixed pagination.

For inherited E2, independently read published A.1.3, pp. 515–516, and
diagram (A.1), p. 516. The fixed zero-value factor retains the square-zero
coordinate: [Spec K[t]/(t²)/μ₂]. Its reduction is Bμ₂. A dual-number section
with value ε distinguishes the full fibre from its reduction. This is the
existing parent finding, owned by GC.1; this review neither claims discovery
nor repeats an exhaustive erratum search. The published PDF SHA-256 is
`700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.

## Baseline, closure and ownership

Read the actual declarations at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and compared the four source
files byte for byte with those used by the shared Lean check.

| Pinned module | Confirmed declarations |
| --- | --- |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | `InvertibleSheaf`, `InvertibleSheaf.trivial` |
| `TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean` | `tensorProduct`, both `tensorProductCongr` maps, `tensorProductAssoc`, `tensorProductComm`, both `tensorTrivial` isomorphisms |
| `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | `Scheme.Modules.pullback`, `pullbackId`, `pullbackComp` |
| `Mathlib/CategoryTheory/Core.lean` | `CategoryTheory.Core` |

The native category includes noninvertible module maps, so the suggested arrow
structures explicitly contain isomorphisms. The native trivial line uses its
free-rank-one presentation; unit identifications are isomorphisms. Individual
tensor comparisons do not by themselves supply the whole coherent monoidal
pullback or dual API.

Read each direct supplier's statement and hypotheses: the parent GC.0 targets
and RS.0 section-power; SF.1 stack-in-groupoids, two-fibre-product, affine
fpqc descent, torsor representability, setoid criterion and quotient
algebraicity; SF.2 Kummer; SF.3 native Picard groupoid, ordinary curve Picard
stack and Picard-sheaf torsors without a point; and D0's ordinary quotient and
2-fibre-product interface. The three requests name the remaining precise
adapters, their consumers and their owners. The SF.3 `needs_changes` review is
explicitly not treated as implementation evidence. No nonroutine root step
is hidden behind an unspecified carrier or predicate.

Read the current TauCetiRoadmap main at
`0d144d044dacebca17b654695b6f1ad58f159b27`: JacobianChallenge's README and
Suggested file, AlgebraicVectorBundles' README and relevant L0A/L0B and
rank-one Suggested interfaces, and screened the Suggested files of all nine
roadmaps newer than the atlas snapshot for overlapping root targets.
Read current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including native line pullback,
rigidified line data and automorphisms, the chosen-section rigidified Picard
functor, and Euler degree. Those remain existing work imported through the
integration contract. Neither a set of rigidified classes nor arithmetic
weighted degree supplies the full family root stack.

Read the reviewed AUDIT-20 entries for FunctionFieldArithmetic FA.0–FA.1 in
`data/library-coverage.json`; there is no Part II entry. Existing function-field
divisors, weighted degree and Riemann–Roch are not replanned. No ownership move,
new roadmap, restructuring, or upstream change is required.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.0.json`: **0 errors, 0 warnings**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.0.lean`: **passed**.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.0.lean`: **exit 0**, 12 expected `declaration uses sorry` warnings, no other warnings or errors; 158 lines, below the 5,000-line limit. Available memory exceeded the required 20 GB before the run.
- Checked source-version metadata using `check_errata.versions_checked`: **passed**.
- Compared every node statement, API statement, test, proof step, acceptance check and source match with the reader inventory: **no omissions**. Recursively checked for `excerpt` fields: **none**.

No question for the orchestrator blocks acceptance. Future formalization must
implement `GC0-WEIL-FRAMES`, `GC0-NATIVE-INTEGRATION` and `GC0-ORDINARY-SITE`
with their supplier owners, then replace the explicit geometric omission
ledger when those genuine carriers exist. The parent GC.1 effective-fibre
correction remains outside this job. Nothing remains to finish this review.
