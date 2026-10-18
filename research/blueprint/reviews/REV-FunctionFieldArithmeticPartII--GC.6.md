# Independent review: ramified norms and quadratic traces

**Verdict: accepted as a planning pass.** GC.6 remains planned, with three
explicit gaps and two supplier requests. It is neither closed nor implemented.
Reviewer: Codex, session `codex-YxTavn`, job
`REV-FunctionFieldArithmeticPartII--GC.6`, issue #8950, 2026-10-18.
This session did not write the plan being reviewed.

The reviewed deliverables are the [packet](../packets/FunctionFieldArithmeticPartII--GC.6.json),
[reader](../readmes/FunctionFieldArithmeticPartII--GC.6.md), and
[suggested signatures](../suggested/FunctionFieldArithmeticPartII--GC.6.lean).

| Inventory | Result |
| --- | --- |
| Target nodes | 18: one definition, two constructions, three comparisons, ten theorems, two applications |
| Per-node verdicts | 13 corrected, 5 verified; none unverifiable |
| Definition/construction API | 17 entries, including two added by this review |
| Definition/construction tests | 9 named tests, at least three for each object |
| Baseline | All 18 declarations confirmed in 12 source files; none removed |
| Nodes added or removed | 0 |
| Parent targets covered | All 13 GC.6 targets |
| Planets | One added by the plan, Norm descent obstructions; six with the five parent planets |
| Source findings | No new finding; inherited E8 independently confirmed as an interpretation gap |
| Remaining work | Three gaps, two precise requests, and the stated geometric implementation frontier |

## Sources and corrections

I read Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*,
Annals 189 (2019), 393–526, in the
[published author-hosted PDF](https://math.mit.edu/~zyun/GZW_ramified_published.pdf):
Appendix A, printed pp. 514–526. Its SHA-256 is
`700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
The relevant receipts are Definition A.1, p. 514; Lemma A.5 and (A.4),
p. 518; Lemmas A.8 and A.10 and Proposition A.11, pp. 520–523;
A.3.1–A.3.3, pp. 523–525; and Proposition A.12 with (A.12), pp. 525–526.
The packet and reader now distinguish the authored approximation deductions
from statements actually made in Lemma A.5.

I also read Milne's [*Lectures on Étale Cohomology*](https://www.jmilne.org/math/CourseNotes/LEC.pdf),
version 2.21, 22 March 2013: section 9, properties (a)–(c), p. 64;
Remark 9.3, p. 65; Example 9.5, p. 66; section 11's torsor construction,
pp. 76–77; Proposition 11.1, p. 77; and Theorem 11.4 and its descent
argument, pp. 78–79. The previous locator put Proposition 11.1 on p. 76.

The Stacks references were checked individually. Definition 21.4.1 and
Lemmas 21.4.2–21.4.3 in [03AG](https://stacks.math.columbia.edu/tag/03AG)
give the torsor and H¹ interfaces. Lemma 95.14.2 in
[04UJ](https://stacks.math.columbia.edu/tag/04UJ) concerns the big fppf site;
the corrected proof uses the generic SF.1 sheaf-stack contract to descend
sheaves and their actions on the small étale site. Lemma 21.11.1 in
[0CJZ](https://stacks.math.columbia.edu/tag/0CJZ) has extra cofinal-acyclicity
conditions; none of the targets assumes an unrestricted Čech-H² or gerbe
classification theorem.

The norm tags were wrong in several places. They are now:

| Result | Correct tag |
| --- | --- |
| Lemma 31.18.1: local trivialization on finite inverse images | [0BUT](https://stacks.math.columbia.edu/tag/0BUT) |
| Lemma 31.18.2: norm of line bundles | [0BCY](https://stacks.math.columbia.edu/tag/0BCY) |
| Lemma 31.18.3: norm of maps and sections | [0BCZ](https://stacks.math.columbia.edu/tag/0BCZ) |
| Lemma 31.18.6: determinant norm and arbitrary base change | [0BD2](https://stacks.math.columbia.edu/tag/0BD2) |

Tag 0BD0 concerns ampleness, so it was removed from the norm citations.
The P¹ test now attributes the norm/divisor comparison to the exact SF.3
supplier and its dictionary request, rather than claiming the two cited
Stacks lemmas state that comparison. No restricted source was needed, and
no source passage was copied into the deliverables.

## Mathematical checks and changes

The packet's `review.checked` records a verdict for every node. The main
checks, including the authored deductions, are these:

| Targets | Checked reasoning and corrections |
| --- | --- |
| Root coordinates | The two native group homomorphisms have the claimed equalizer for arbitrary commutative rings. Added a constructor with projection formulas and a group homomorphism for every commuting chart square, with identity/composition laws. Group operations remain inherited. |
| Root torsor comparison | Simultaneous frames form a locally nonempty simply transitive sheaf. Frame descent recovers both lines and their square comparison on all arrows. The B-frame argument now uses 0BUT directly, valid after arbitrary base change. |
| Ramified chart | The determinant is `c²-a*d²`, with branch value `c²`. For a residue-one norm-one unit, `1+u` is invertible near the branch and gives the required ratio. Added the missing explicit invariant-kernel argument: `2*d=0` forces `d=0` even after nonflat base change. Prescribed square-root lifts establish sheaf epimorphisms, not global-section surjectivity. |
| Norm sections and difference nullhomotopy | Norm transition cocycles give the torsor extension; section norms include zero sections. Norm cancellation and the branch identity give compatible tensor, naturality and base-change trivializations for the difference line. |
| Two fibres and connecting maps | Inverse images of the unit give the two based torsor fibres, with H⁰(K) and H⁰(A) automorphisms respectively. Native Ext gives both boundaries; the degree-zero local-lift comparison fixes the sign, and H¹ exactness gives the stated effective lifts. |
| Obstructions and descent | The primary norm-lift obstruction is in H²(K). The fixed norm trivialization gives an H²(A) obstruction. Changing that trivialization by `c⁻¹` adds `δ_N(c)`, so the underlying-line obstruction is precisely the stated quotient by `im(δ_q δ_N)`. The two H¹ sequences distinguish invariance from descent. No Brauer vanishing is assumed. |
| P¹ example | Pullback doubles degree, so both O(1) and O(-1) are invariant but do not descend. Norm preserves degree. The target now assumes finite k, matching the stated suppliers; the familiar example also works more generally. |
| Approximation, support moving and Q | The two pinned approximation theorems supply finite precision in rational frames. Nonzero residues give a nonzero representative; the empty family needs the separate choice 1. Matching the prescribed root-framed values gives a signed divisor away from R. Its inverse-uniformizer ideles surject onto the actual quotient Q, retaining square-residue conditions and kernel root labels. |
| Quadratic reciprocity | The local norm/residue calculation is sound, with the completion/Hensel adapter still requested from FA.4. Removed the parent quadratic-input conclusion that η kills H from the prerequisites proving that conclusion. Unramified split/inert signs are computed directly on the two-point permutation representation. |
| Cyclic and signed traces | Inverse `finRotate` gives the required left shift, and the scalar is applied once on the last factor. The rank-one trace is the local scalar, including zero. The exact GC.5 signed-line and translation contracts then give negative powers, the normalized unit and every integer-degree component. The two-point anti-invariant line has the correct signs in every residue degree, including ℓ=2 over characteristic-zero coefficients. |

These checks confirm the inherited source issue
`FunctionFieldArithmeticPartII/E8`: ordinary kernel/image exactness on
Picard classes would fail the degree test. The correction is the specified
based fibres and obstruction data. This review does not assert that every
possible coherent interpretation of (A.11) is false, and does not claim to
have repeated the parent's search for corrections. Its new confirmation is
attached to `inheritedSourceIssues`; `sourceIssues` stays empty.

## Baseline and ownership

I read all cited declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including ambient hypotheses.
All 12 cited source files matched their pinned raw files byte for byte.

| Module | Confirmed declarations |
| --- | --- |
| `Mathlib/Algebra/Group/Subgroup/Ker.lean` | `MonoidHom.eqLocus` |
| `Mathlib/Algebra/Group/Hom/Basic.lean` | `powMonoidHom` |
| `Mathlib/Algebra/Group/Units/Hom.lean` | `Units.map` |
| `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean` | `TauCeti.Place.exists_forall_ord_sub_eq`, `exists_forall_residue_eq` |
| `TauCeti/CategoryTheory/Sites/Units.lean` | `CategoryTheory.Sheaf.additiveUnitsFunctor`, `additiveUnitsFunctor_obj_obj` |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` | `CategoryTheory.Sheaf.H`, `H.map` |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | `TauCeti.AlgebraicGeometry.InvertibleSheaf` |
| `TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean` | `InvertibleSheaf.tensorProduct` |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` | `PiTensorProduct.map`, `PiTensorProduct.reindex` |
| `Mathlib/LinearAlgebra/Trace.lean` | `LinearMap.trace` |
| `Mathlib/Logic/Equiv/Fin/Rotate.lean` | `finRotate` |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/ExactSequences.lean` | `CategoryTheory.Abelian.Ext.covariantSequence`, `covariantSequence_exact`, `covariant_sequence_exact₃` |

The units-sheaf baseline description now says **commutative** ring sheaves,
as its declaration requires. All citing geometric rings satisfy that
hypothesis. No generic approximation, cohomology, trace, tensor, subgroup,
or units-sheaf theory is replanned.

I read the exact direct supplier statements in SF.1–SF.3, D0, FA.2/FA.4,
the parent GC.0/GC.2/GC.3/GC.5/GC.6, and the reviewed GC.5 follow-up.
The three reviewed audit entries SF.3, FA.2 and FA.4 leave the required
geometric and function-field integrations open. SF.3's needs-changes review
is disclosed; its imports are mathematical planning contracts, not claims
of implementation or acceptance of the entire supplier packet.

For the duplication check I read the current JacobianChallenge and
AlgebraicVectorBundles READMEs in full, their relevant suggested interfaces,
and AlgebraicCurves Layer 12 and its suggested-file boundary, at
TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`.
I inspected the current Tau Ceti library read-only at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the units,
approximation, line-bundle and local reciprocity interfaces. The existing
ownership remains: vector-bundle coherence in L0A/L0B/L0C; curve and
divisor comparisons in AlgebraicCurves 12 and JacobianChallenge A; local
Artin infrastructure in ClassFieldTheory 6–7, integrated through FA.4.
The two requests specify adapters to these owners. Nothing is added to or
replanned within an upstream roadmap.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.6.json`: zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files` on all five deliverables: passed.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.6.lean`: exit 0; 132 lines, fourteen warnings, all declaration uses of `sorry`.
- `git diff --check`: passed.

The suggested file has one real-bodied light definition, four representative
API signatures and eight examples. This review adds an actual zero-residue
example and the missing positive-root member; it replaces the bare unit
existence example by the genuine empty-family specialization. Geometric
carriers, the two additional coordinate API specifications and all omitted
construction APIs/tests stay in the reader. The file makes no geometric
implementation claim.

No review work or blocking question remains. Assembly must retain both
named supplier requests, all three gaps, the distinction between based
fibres and Picard-class exactness, the actual modified-unit image, and the
signed/all-degree Frobenius conventions. Locator corrections to parent
documents can be carried through at assembly; this job changes only its own
deliverables. The [handoff](../handoff/REV-FunctionFieldArithmeticPartII--GC.6.md)
records that continuation boundary; no scratch artifact is required.
