# Independent review: GC.2 adelic root Picard groupoids

**Verdict: accepted as a complete target-level planning pass.** GC.2 remains
**planned**, with the exact `GC2-COMPLETED-LATTICES` supplier request open;
no implementation is claimed. Reviewer: Codex, session `codex-6lQJHA`,
job `REV-FunctionFieldArithmeticPartII--GC.2`, issue #8946, 18 October 2026.
This session did not write the blueprint being reviewed.

The reviewed deliverables are the [packet](../packets/FunctionFieldArithmeticPartII--GC.2.json),
[reader](../readmes/FunctionFieldArithmeticPartII--GC.2.md) and
[suggested interfaces](../suggested/FunctionFieldArithmeticPartII--GC.2.lean).

| Inventory | Result |
| --- | --- |
| New nodes | 9: two definitions, two comparisons, five theorems |
| Definition APIs and tests | 15 API items and 8 tests; all checked |
| Parent imports | 3 targets, retaining their original APIs and 7 definition tests |
| Added planets | 2: Framed Picard groupoid; Degree of the root Picard groupoid |
| Baseline declarations | 19 confirmed; none removed, replaced or added |
| Review node verdicts | 5 verified, 4 corrected; none unverifiable |
| Nodes added or removed | 0 |
| Source findings | 1 independently confirmed; none added or rejected |
| Remaining work | 1 precise supplier request; no unassigned gap |

## Sources and node checks

I independently read the published author-hosted copy of Yun–Zhang,
[*Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Annals of Mathematics 189 (2019), 393–526: Definition A.1, p. 514;
A.1.1, p. 515; A.1.6 and the complete Lemma A.5 proof, pp. 517–518;
§6.2.3 and Lemma 6.4, pp. 498–499; and the inverse-uniformizer consumer
in the proof of Proposition A.12, p. 525. The file's SHA-256 is
`700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
I inspected the rendered page image of published p. 518, including its
frame diagram and transition coefficient. I also collated A.1.6 and the
complete Lemma A.5 proof in [arXiv:1712.08026v2](https://arxiv.org/pdf/1712.08026v2),
printed pp. 84–85, SHA-256
`e159d869e86a3526e95aaf9560780870ed5c7af35593eb5ebb4fe477f0adf258`.
These are selected readings, not a claim to have read either paper in full.
No restricted source was used. All descriptions here are in my own words.

The common hypotheses are appropriate: finite odd-characteristic base field,
smooth projective geometrically connected curve, all closed points, and a
finite reduced branch scheme that may be empty. Residue degrees need not be
one. The ordinary curve/place and residue-field dictionaries are imported,
not inferred from the name of a completion. The comparisons concern
k-point groupoids, not a construction of the root Picard stack in families.
The following are mathematical checks of the targets, not source summaries.

| Node suffix | Verdict and check |
| --- | --- |
| `root-unit-exact-sequence` | Verified. For H={(u,v): ū=v²}, the kernel of its actual projection is the product of residue roots of one. Its image consists of tuples with square residues. Surjectivity of residue units at the finitely many branch points makes the square-class cokernel map onto. At empty R the projection is an isomorphism. No splitting or additive square map is required. |
| `generic-framed-root-picard` | Corrected direct prerequisites; definition verified. The ordinary line arrow must satisfy τ′η φη=τη as well as the root square diagram. It determines the ordinary map but does not erase root signs. Tensor, dual, degree and frame changes have coherent contracts. Its four tests detect loss of the generic frame, loss of residue square classes, and a degree/effectivity restriction. |
| `fully-framed-root-picard` | Corrected action API; definition verified. The root coframe equation is preserved by inverse local/root changes because ū⁻¹=v⁻². The coefficient is τη τx⁻¹. Compatible root data over a fixed ordinary fully framed line are contractible, so root signs relate different frames but do not preserve a chosen frame. The four tests distinguish this from the unframed kernel. |
| `fully-framed-idele-comparison` | Verified subject to the named supplier. For a, the rational lattice is ax Ox and the line is O(−E(a)). The inverse uses division by ax as local coframe and the residue of ax as a basis of that lattice, even when ax is nonintegral in the field. Equality of coefficients gives the unique fully framed arrow. Tensor multiplies bases and coefficients. |
| `right-quotient-generic-frame-comparison` | Corrected the divisor description. If b=a u and ū=v², line identity and root scalar v⁻¹ satisfy the root square. Conversely a generic-frame-preserving arrow recovers both coordinates of h. The rational section sent to 1 has divisor −E, not E. Forgetting local/root frames retains the generic frame; its separate further quotient is Q. |
| `double-quotient-arrow-descent` | Verified. From a line isomorphism recover its unique generic scalar f, then u=b/(fa). The root map ψ satisfies ψ²=overline(fa/b)=ū⁻¹, so v=ψ⁻¹ is the unique retained root coordinate. These formulas invert the forward map and respect composition, inverse and tensor. Existence of compatible frames follows by adjusting ordinary local frames with the residue-unit surjection. Q is faithful because h↦(1,h) is injective on labels. |
| `root-divisor-fibres` | Verified. Surjectivity of the imported idele/divisor map gives an object over every signed divisor. The fibre is a U-action torsor modulo p(H), with labelled stabilizer ker p at every object. Choosing representatives gives the stated union of classifying groupoids; that equivalence has exactly the recorded choice dependence. The number of components and automorphisms is 2^r, with r counting closed branch points. |
| `picard-stabilizer-extension` | Verified. A double stabilizer has f a global unit, hence a constant c, and v²=c⁻¹. The residue-degree parity criterion identifies its projected constant subgroup. The extension need not split: at one rational branch over F5 it is C4→C2, and every lift of the nonidentity quotient element has order four. |
| `valuation-degree-comparison` | Corrected the square's target. The line has degree −Σ ordx(ax)[κx:k]. Double arrows add a principal divisor to E, whose weighted degree is zero by the pinned product formula. The square through ordinary divisors commutes after forgetting root data to the ordinary Picard groupoid; for nonempty R, its retained root-sign arrows prevent a root-Picard factorization through discrete ordinary divisors. The inverse uniformizer outside R has positive geometric degree [κx:k]. |

The exact sequence, fibre counts, stabilizer extension, parity criterion and
explicit Hom formulas are deductions from the source definitions and ordinary
supplier inputs. The packet correctly distinguishes these from numbered
claims of Yun–Zhang. They belong at target level; the algebraic manipulations
are proof steps, not new lemma nodes.

## Baseline and closure

I read each cited declaration and its surrounding hypotheses at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All nineteen names exist and
provide the claimed interfaces. The packet now has independent receipts.

| Library module | Declarations confirmed and limits checked |
| --- | --- |
| Mathlib `Algebra/Group/Subgroup/Ker.lean` | `MonoidHom.eqLocus`: subgroup equalizer for homomorphisms with group domain; H is such an equalizer. |
| Mathlib `Topology/Algebra/Valued/WithVal.lean` | `Valuation.Completion`: the completion uses the topology selected by its valuation. |
| Mathlib `Topology/Algebra/Valued/ValuedField.lean` | `Valued.valuedCompletion`, `Valued.valuedCompletion_apply`: the valuation extends and agrees on embedded elements. These do not alone identify the geometric residue field. |
| Mathlib `RingTheory/Valuation/ValuationSubring.lean` | `ValuationSubring.unitGroup`, `unitGroupToResidueFieldUnits`, `surjective_unitGroupToResidueFieldUnits`: actual local unit subgroup and surjective residue-unit homomorphism. |
| Mathlib `Topology/Algebra/RestrictedProduct/Basic.lean`, `Units.lean` | `RestrictedProduct`, `RestrictedProduct.unitsEquiv`: native restricted carrier and unit-group comparison, with the reference unit subgroups retained. |
| Mathlib `CategoryTheory/Action.lean` | `CategoryTheory.ActionCategory`, `ActionCategory.stabilizerIsoEnd`: labelled action category and endomorphism monoid. The group-action case is a groupoid. Its native left-action/composition convention agrees here because the acting groups are abelian. |
| Mathlib `FieldTheory/Finite/Basic.lean` | `FiniteField.unit_isSquare_iff`: finite field and characteristic different from two are retained; the residue-field comparison supplies the relevant field. |
| Tau Ceti `FieldTheory/FunctionField/Place/Basic.lean`, `Zeros.lean` | `TauCeti.Place`, `Place.finite_setOf_ord_ne_zero`: normalized surjective valuation trivial on constants, and finite zeros/poles under `IsFunctionField`. The diagonal retains that hypothesis. |
| Tau Ceti `FieldTheory/FunctionField/Divisor/Basic.lean`, `ProductFormula.lean` | `TauCeti.Divisor`, `Divisor.degree`, `Divisor.degree_principal`: signed divisors, residue-degree weights, and principal degree zero for a function field and a nonzero rational function. |
| Tau Ceti `AlgebraicGeometry/LineBundle/Basic.lean` | `TauCeti.AlgebraicGeometry.InvertibleSheaf`: native full subcategory of rank-one module sheaves; the Picard groupoid takes its core. |
| Tau Ceti `AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean` | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective`: the injection assumes a Noetherian integral scheme of dimension at most one with DVR codimension-one stalks. A regular curve qualifies; the declaration does not assert surjectivity, completed-lattice descent or a framed equivalence. |

The reviewed library audit entries FA.2 and SF.3 distinguish existing
restricted products, signed divisor arithmetic and partial ordinary sheaf
comparisons from the unbuilt function-field idele and root-framed interfaces.
None of those existing constructions becomes a new node here. The native
suggested file makes only light specializations over the available carriers.

I read the parent root-Picard contract and all three imported GC.2 targets,
including their APIs and tests. I also read the exact statements of the
FunctionFieldArithmetic FA.2 `projective-adeles`, `projective-ideles` and
`idele-divisor-exact-sequence` nodes, and the SF.3 `picard-groupoid`,
`class-group-picard-locally-factorial`, `vector-bundle-degree` and
`picard-stack-curve` suppliers. These cover the ordinary inputs claimed here.
The SF.3 packet's outstanding review objections elsewhere do not make its
planned supplier statements baseline theorems; the reader correctly keeps
that distinction. The new direct prerequisites make the generic definition's
ordinary degree API and signed-divisor test explicit.

The one request states the completed lattice of O(D), including its zero
clause, the residue/fibre comparison, extension and uniqueness of rational
maps preserving lattices, and tensor/dual/rational-multiplication
compatibility. It is precise enough to implement and now lists the generic
frame test among its direct consumers. It is neither discharged by the
pinned class-group injection nor silently replaced by a general patching
assertion. All other geometric nodes reach this named leaf transitively.
This supports **planned**, not **closed**, coverage.

The current read-only upstream roadmap commit was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the
JacobianChallenge and Completed RestrictedProducts readers, inspected
AlgebraicCurves' completed-place and Layer 12A–12E dictionaries, and read
AlgebraicVectorBundles' L0A–L0B suggested sheaf/tensor/pullback interfaces.
I searched the suggested files of all nine post-snapshot roadmap directories
and current relevant library directories for root Picard, root divisor,
modified root units, completed-lattice and function-field idele targets.
No competing root-framed presentation was located. Current
`TauCeti.SheafOfModules.exists_dense_open_trivialization` already provides
ordinary rational triviality and is not replanned here.

Ordinary sheaf constructions retain AlgebraicVectorBundles/JacobianChallenge
ownership; the curve/place and completed divisor dictionary retains
AlgebraicCurves ownership; generic restricted products retain their completed
roadmap owner. This part adds neither an ordinary Picard roadmap nor another
restricted-product theory. The new roadmap's GC.2 stage already requires
FA.2, GC.0–GC.1 and SF.3, in the appropriate order. Its GC.5/GC.6 consumers
and §6.2.3 signed-divisor consumer remain served. No external blueprint link
entry names GC.2, and no layer reordering or scope expansion is needed.

## Corrections and source finding

Every change made by this review is listed below.

1. Added direct ordinary divisor/line-class, vector-bundle-degree and
   AlgebraicCurves dictionary prerequisites to `generic-framed-root-picard`.
   Added that node to the existing request's `neededBy` list. No new node,
   supplier request or baseline citation was introduced.
2. Completed `FullyFramedRootLine.changeFrames` with functoriality on
   arrows, identity/composition laws and compatibility with
   `forgetLocalFrames` and `changeGenericFrame`; synchronized the reader.
3. Made explicit in the right-comparison statement and reader that the
   rational section defined by the generic frame has divisor −E.
4. Corrected the degree-comparison square in packet and reader to land in
   the ordinary Picard groupoid after forgetting roots. The ordinary
   divisor forgets root labels and, in general, residue square classes.
   For nonempty R, nonidentity root-sign arrows already prevent a
   factorization through that discrete divisor groupoid.
5. Removed the reader's claim that the degree map may fail to be onto Z
   under the stated finite-field hypotheses. The construction needs no
   chosen degree-one divisor or rational point. Existence of a signed
   degree-one divisor is the separate Schmidt theorem already owned by
   `FunctionFieldArithmetic:FA.5/schmidt-degree-one`; it is stronger than
   needed for GC.2 and does not assert a rational point.
6. Repaired 199 malformed inline math delimiters in the reader, restored
   missing LaTeX command backslashes and the escaped braces in the kernel
   set, and replaced nine tab characters and one backspace that had
   corrupted tau/bar commands. Formula content was preserved except for
   the mathematical corrections listed above.
7. Added independent reading receipts to both source records and all
   nineteen baseline entries, the `EGC2-1` confirmation, and the accepted
   per-node review object. Updated the reader's review status.

`FunctionFieldArithmeticPartII/EGC2-1` is **confirmed**. On published
p. 518 the stated frame directions make the displayed coefficient the
reciprocal of that required by the lemma's inverse-uniformizer convention.
For O(x), rational identity and local coframe multiplication by πx give
printed coefficient πx, whereas the lemma specifies πx⁻¹. The corrected
coefficient τη τx⁻¹, with inverse local/root frame changes, agrees with
§6.2.3 p. 498 and the statement of Lemma A.5. The same discrepancy remains
in the inspected arXiv v2 pp. 84–85. This is a proof-convention misprint,
not a false equivalence; retaining `affects: nothing` is appropriate for
the corrected intended argument. The packet's historical correction-search
record remains attributed to its author; this review independently confirms
the discrepancy, not the exhaustive absence of a correction. The separate
root-frame tuple slip is already inherited as parent E9 and is not duplicated.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.2.json`:
  zero errors and zero warnings after the corrections.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.2.lean`:
  exit 0 at the pinned shared build, fourteen expected `declaration uses
  sorry` warnings, no other warnings or errors. Available memory exceeded
  20 GB before the check. The file is unchanged by review: its 211 lines
  contain real-bodied light definitions, ten theorem statements and four
  examples; geometric carriers and their API/tests remain README targets.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.2.lean`:
  passed, with no admitted data definitions.
- Independent finite arithmetic checks passed: nine residue kernel/image/
  cokernel models for q=3,5,7 and r=0,1,2; all 256 F5 branch Hom scalar
  equations; the nonsplit F5 stabilizer extension; F9 square classes and
  roots of one at a degree-two branch; and weighted uniformizer signs.
  These validate worked examples, not the geometric theorems.
- Reader math delimiters are balanced and no control characters remain.
  Submission file checks and `git diff --check` passed.

There is no further question for the author or orchestrator about the
review verdict. Assembly must retain all three parent imports and their
APIs/tests, the two new planets, and `GC2-COMPLETED-LATTICES`. The supplier
interface must be discharged before geometric implementation can be called
complete. No scratch artifact is needed to continue that work.
