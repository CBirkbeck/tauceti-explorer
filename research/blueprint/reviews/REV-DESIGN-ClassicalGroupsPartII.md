# REV-DESIGN-ClassicalGroupsPartII

Issue #3507; independent review of DESIGN-ClassicalGroupsPartII (#3382).
Reviewer: Codex, session codex-yvF63T. Date: 2026-10-05.
The design was written by session codex-qTA8yi; this review did not write it.

**Accepted after corrections.** The packet is a complete target-level planning
pass. All 26 nodes are justified; 21 are verified and five corrected. No stage
is closed and no implementation is claimed. Eleven precise supplier requests
and the existing scheme/descent signature gap remain explicit. The suggested
Lean file has not been compiled at the required baseline.

## Counts and stage coverage

| Stage | Status | Nodes | Planets | Target coverage |
| --- | --- | ---: | ---: | --- |
| CG.0 | planned | 5 | 5 | Coordinates, central lattice, diagonal torus, reciprocal Weyl action, central cover |
| CG.1 | planned | 9 | 6 | Algebraic representation ring, standard/multiplier modules, primitive powers and decomposition, Hom/weight base change, rational models/classification, scalar extension |
| CG.2 | planned | 6 | 5 | Integral character, injectivity, exterior polynomials, invariant presentation, primitive identity, full ring isomorphism |
| CG.3 | planned | 6 | 5 | Positive Laurent cone/presentation, constituent subring, exact tensor criterion, positive character isomorphism, integral generation/localization |

Totals: 13 constructions, five definitions, eight theorems; **76 API items**
(previously 74), 58 unit-test statements, 21 planets, 22 confirmed baseline
citations, eleven supplier requests and one signature gap. No nodes were added,
removed or split. All `implementationStatus` values remain `unchecked`.
Every definition/construction has at least three discriminating tests. Planet
names denote central objects/results, with no more than six in a stage.

## Corrections made

1. **CG.1/irreducible-rational-model and Lie supplier.** LieHighestWeight Layer 4
   explicitly provides highest-weight classification; complete reducibility is
   Layer 5. It does not explicitly promise a Cartan-component theorem. Narrowed
   the request to classification/uniqueness and supplied the missing argument
   inside the existing GSp target: a semisimple tensor product has a unique top
   weight line; the highest tensor vector projects only to simple summands of
   that highest weight, so its generated module is the unique such summand.
   Semisimplicity is already requested from ReductiveGroups Layer 6. Updated the
   CG.1 roadmap description and recorded this supplier boundary in upstreamNotes.
   No additional upstream theorem or scope is assumed.
2. **CG.1/standard-representation.** Added `standard_coaction` to the API and
   sketch. Its coordinate formula fixes the right-comodule column convention
   over the actual coordinate algebra, before point evaluation. This supports
   comparison with native standard comodules over any algebra of coefficients.
3. **CG.1/primitive-exterior-powers.** Added `alternatingForm_coordinates` to the
   API and sketch, specifying the exact matrix J. Previously the pair-contraction
   equation referred to a scalar bilinear form without its coordinate equation.
   Clarified that the native kernel API requires a flat coalgebra, and finite
   kernels require a Noetherian source; both hold over the fields in this plan.
4. **CG.1/primitive-exterior-decomposition.** Pinned the Lefschetz wedge operator
   to the bivector sum of e_i wedge f_i when the alternating pairing of e_i,f_j
   is the Kronecker delta. This makes the stated commutator sign consistent with
   the contraction formula. The equivariant operator retains its multiplier
   twist. Extended the source locator to the symplectic calculation continuing
   at the start of Sternberg p.133.
5. **CG.0/similitude-weight-lattice.** Made the multiplier and standard weight
   constructors in the sketch the explicit pair and Kronecker-coordinate data
   already specified by the packet, avoiding unconstrained placeholders for
   these elementary constants.
6. Independently refreshed all 22 baseline `checked` records, corrected the
   descriptions of `Comodule.Hom.ker` and `ker_finite`, added source-issue verdicts
   and three missed source misprints, updated the source reading extent in both
   JSON files, and added the exhaustive packet review object. The sketch now
   records the failed import check explicitly without claiming elaboration.

These are all changes to the three mathematical deliverables. The review report
and this review's handoff are the only new files.

## Source verification

All node locators, short excerpts and the distinction between direct support and
motivation were checked against the public texts below. The hashes match the
packet. Source hypotheses are preserved: g is positive for representations and
unique multipliers; the coefficients are characteristic-zero fields; complex
Sp classification is imported and the arbitrary-field extension is proved by
finite coefficient descent. The pure invariant algebra remains integral. The
arbitrary-field claims are not attributed to Yu alone.

- [Hongjie Yu, arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5),
  §7.1, equation (7.1.1) and Remark 7.1.1, printed p.64; opening of §7.2.
  The support inequality, reciprocal Weyl action, both character-ring
  isomorphisms and the exterior generators agree. Negative exterior degrees
  are zero; the multiplier and scalar degree are different.
- [Milne, second-edition author PDF](https://www.jmilne.org/math/Books/iAG2022.pdf),
  dated 5 October 2021: Chapter 22 §a pp.464–470 and §c pp.477–479.
  Theorem 22.2 and 22.3–22.6 support highest-weight uniqueness, scalar
  endomorphisms and absolute simplicity for split reductive groups; 22.12 gives
  the central-isogeny lattice condition. Theorem 22.42 supplies the
  characteristic-zero reductive semisimplicity used through its owner.
- [Sternberg, 23 April 2004 author notes](https://people.math.harvard.edu/~shlomo/docs/lie_algebras.pdf),
  §7.9 pp.131–132 and the symplectic continuation at the start of p.133.
  Checked the Cartan-product assertion, primitive contraction, fundamental
  weights and dimension formulas, including the four misprints below.
- Read the complete atlas snapshots of ClassicalGroups and ReductiveGroups,
  and LieHighestWeight Layers 4–5, rather than infer supplier statements from
  their stage titles. Inspected the exact ArithmeticStatistics:ST.5 group node.

The sourceIssues list now has four confirmed entries, all scoped to the same
hashed Sternberg author copy. E1 was independently confirmed; E2–E4 were added
by this review, each with the required review verdict and search evidence.

| Finding | Locator | Check and correction |
| --- | --- | --- |
| E1 | p.131, primitive kernel dimension | The contraction target has degree j−2, so its dimension uses that lower binomial index. At n=j=2 the correct kernel dimension is five; the printed index gives zero. |
| E2 | p.131, Cartan-product paragraph | The second highest-weight symbol must be μ; σ is already the representation on W and the following tensor vector uses μ. |
| E3 | p.132, definition of r_i | Restore the index on a_i; this follows immediately by subtracting one from the preceding definition of l_i. |
| E4 | p.132, difference-factor product | The second numerator must be j−1. The printed equality fails at n=3: its left side is 9/2 and its right side is three. With the corrected factor both sides equal three, and the final dimension calculation is consistent. |

The intended mathematics and packet targets are unaffected by these misprints.
Rechecked the [author's online-books page](https://people.math.harvard.edu/~shlomo/),
its linked current PDF, [Grinberg's errata catalogue](https://www.cip.ifi.lmu.de/~grinberg/algebra/algerrata.html)
and [29 June 2019 Chapter 1 errata](https://darijgrinberg.gitlab.io/algebra/sternberg-errata1.pdf),
and public searches for the page numbers and formulas. No existing correction
was found for these passages. The packet records that limited search, rather
than claiming exhaustive knowledge of every erratum.

## Exact baseline check

Read declarations and enclosing hypotheses at TauCeti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The sources were read from those
git objects, not from the working-tree HEAD of a different shared build.
The following names all exist at their cited modules. No citation was removed
or replaced. Only the two kernel descriptions needed hypothesis corrections.

| Declaration | Pinned source | Confirmed use/hypotheses |
| --- | --- | --- |
| `TauCeti.FGComoduleCat` | [abbrev; source line 96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean#L96) | Full subcategory of right comodules with Module.Finite; over a field this is the finite-dimensional algebraic representation category. |
| `TauCeti.FGComoduleCat.instMonoidalCategory` | [instance; source line 161](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean#L161) | Diagonal tensor product and trivial tensor unit on finite comodules over a bialgebra, in matching universes. |
| `TauCeti.FGComoduleCat.instBraidedCategory` | [instance; source line 81](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Symmetric.lean#L81) | Tensor swap is a braiding for finite comodules over a commutative bialgebra. |
| `TauCeti.FGComoduleCat.hasBinaryBiproducts` | [instance; source line 158](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Product.lean#L158) | Binary biproducts of finite comodules. |
| `TauCeti.SplitK0` | [def; source line 111](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Split.lean#L111) | Split Grothendieck group of an essentially small category with zero morphisms and binary biproducts. |
| `TauCeti.SplitK0.of` | [def; source line 121](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Split.lean#L121) | Class of an object, invariant under isomorphism. |
| `TauCeti.SplitK0.liftRingHom` | [def; source line 263](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean#L263) | Lift a biproduct-additive invariant taking the tensor unit to 1 and tensor products to products to a ring homomorphism. |
| `TauCeti.SplitK0.of_mul_of` | [theorem; source line 179](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean#L179) | [X][Y]=[X⊗Y] for an essentially small monoidal preadditive category with binary biproducts. |
| `TauCeti.SplitK0.mapRingHom` | [def; source line 324](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean#L324) | An additive strong monoidal functor induces a ring homomorphism on the existing SplitK0. |
| `TauCeti.DiagonalizableGroup.weightSpace` | [def; source line 81](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean#L81) | Weight submodule of a right C-comodule corestricted along C→R[X], indexed by x∈X. |
| `TauCeti.DiagonalizableGroup.isInternal_weightSpace` | [theorem; source line 103](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean#L103) | All these weight submodules form an internal direct sum. |
| `TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot` | [theorem; source line 110](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean#L110) | A Module.Finite comodule has finitely many nonzero weight submodules after corestriction. |
| `TauCeti.Comodule.baseChange` | [def; source line 171](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/BaseChange.lean#L171) | Actual base change: an R,H-comodule M becomes an A,A⊗[R]H-comodule on A⊗[R]M. This is stronger than the finite scalar-extension functor whose target is only SemimoduleCat. |
| `TauCeti.Comodule.matrixCoefficientSubcoalgebra` | [def; source line 53](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Subcoalgebra.lean#L53) | For a finite free right comodule M over a coalgebra C over a commutative semiring R, the matrix coefficients span a subcoalgebra of C. Over a field every finite-dimensional M is free. |
| `TauCeti.Comodule.matrixCoefficientSubcoalgebra_finite` | [instance; source line 92](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Subcoalgebra.lean#L92) | The underlying R-module of the matrix-coefficient subcoalgebra of a finite free comodule is finite. |
| `TauCeti.Symplectic.coordinateHopfAlgebra` | [abbrev; source line 104](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean#L104) | O(Sp₂g), the Hopf quotient of the general-linear coordinate ring by XJXᵀ−J. |
| `TauCeti.GeneralLinear.coordinateHopfAlgebra` | [def; source line 479](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean#L479) | O(GL_n), with its determinant localization and matrix-inverse Hopf structure. |
| `TauCeti.char_extPowerRep_diagonal` | [theorem; source line 138](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/ExteriorPower.lean#L138) | Over a field, the abstract exterior-power standard GL_n character on diag(t_i) is the elementary symmetric polynomial in the t_i. It supplies the underlying trace computation, not the GSp comodule itself. |
| `MonoidAlgebra.domCongr` | [def; source line 307](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Basic.lean#L307) | A multiplicative equivalence of the indexing monoids induces an algebra equivalence of their monoid algebras. |
| `MvPolynomial.esymmAlgEquiv` | [def; source line 340](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean#L340) | For any commutative ring R and a finite variable set of cardinality n, elementary symmetric polynomials give an R-algebra equivalence with the symmetric subalgebra; no denominators. |
| `TauCeti.Comodule.Hom.ker` | [def; source line 238](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean#L238) | Over a commutative ring R with Module.Flat R C, the kernel of a comodule morphism is a Subcomodule whose underlying submodule is the linear kernel. Flatness is automatic for the field coefficients used here. |
| `TauCeti.Comodule.Hom.ker_finite` | [theorem; source line 249](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean#L249) | With the same Module.Flat R C hypothesis as ker, the kernel of a comodule map out of an IsNoetherian R M module is Module.Finite. Finite-dimensional modules over the coefficient field satisfy the Noetherian hypothesis. |

The native abstract GL exterior-character theorem supplies the trace calculation;
it is not itself a GSp algebraic comodule. Similarly, the abstract finite-group
character-injectivity theorem cannot supply this plan's injectivity. The packet
correctly uses the rational comodule category, existing SplitK0, and highest
weight triangularity instead. Native tensor/braiding/biproduct/kernel data are
reused; missing size/linear/monoidal-additive and power/base-change glue remain
precise requests, not duplicate category definitions.

## Node-by-node verdicts

All sources, direct prerequisites, proof steps, API uses and tests were checked
for each row. IDs below abbreviate the prefix `ClassicalGroupsPartII:`.

| Node | Verdict | Review evidence |
| --- | --- | --- |
| `CG.0/coordinate-hopf-algebra` | verified | The polynomial quotient, Hopf matrix convention and unique multiplier agree with the imported ST.5 group for g≥1; rank-one and multiplier-one fibres use the cited native coordinates. |
| `CG.0/similitude-weight-lattice` | corrected | The central degree and parity pullback are correct; negative multiplier twists remain dominant. Made the two elementary weight constructors explicit in the sketch. |
| `CG.0/diagonal-torus` | verified | The diagonal coordinates, type-C roots and t=1 specialization agree with the parent Sp torus; scheme/root-datum registration is an explicit supplier obligation. |
| `CG.0/weyl-action` | verified | Reciprocal reflection adds u_i to m and negates u_i; signed-permutation relations and integral fixed subring are correct. |
| `CG.0/central-cover` | verified | The cover has μ₂ kernel and fppf local square-root lifts; no Q-point surjectivity is asserted. The omitted scheme/descent signature is honestly recorded as a gap. |
| `CG.1/rational-representation-ring` | verified | Finite algebraic comodules and existing SplitK0 are used, with precise missing generic instance requests; characteristic-zero semisimplicity identifies the split classes. |
| `CG.1/standard-representation` | corrected | Right coaction e_b↦Σ_a e_a⊗x_ab has the correct column convention. Added its coordinate formula to both API and sketch, before point evaluation. |
| `CG.1/multiplier-line` | verified | The one-dimensional ν^m coaction and tensor law include all integer twists; ν⁻¹ is correctly excluded from nonnegative standard tensor degrees. |
| `CG.1/primitive-exterior-powers` | corrected | The contraction sign and ν twist are correct. Added the exact J pairing equation to API/sketch and documented the pinned kernel flatness/Noetherian hypotheses. |
| `CG.1/primitive-exterior-decomposition` | corrected | The primitive dimension, highest line and tensor summands follow from Lefschetz contraction, Sp classification/dimension and antisymmetrization. Fixed the Lefschetz sign normalization and extended the source locator through the completed rank-two calculation. |
| `CG.1/hom-and-weight-base-change` | verified | Finite coefficient linear equations prove generic K/F Hom and weight base change; the infinite-field invertible-locus argument reflects isomorphisms without asserting functor fullness. |
| `CG.1/irreducible-rational-model` | corrected | The finite coefficient-generated rational component and its flat base change are justified. Replaced the overclaimed imported Cartan theorem by the explicit top-line/semisimplicity argument and narrowed the Lie supplier request. |
| `CG.1/rational-highest-weight-classification` | verified | Finitely generated coefficient-field descent avoids assuming K embeds in C; Hom base change identifies the descended simple with an absolute rational model. Multiplicities and endomorphisms follow. |
| `CG.1/scalar-extension-ring-equivalence` | verified | The map is the existing SplitK0 map of additive strong monoidal scalar extension and is bijective on the simple-class basis; it is a ring equivalence, not a category equivalence. |
| `CG.2/formal-torus-character` | verified | Existing internal torus weight decomposition gives integral finite support; tensor/additive laws and evaluation as trace feed the native SplitK0 lift. |
| `CG.2/character-injectivity` | verified | The maximal highest weight in a finite nonzero integer combination proves injectivity; the finite-point-group character theorem is correctly not used. |
| `CG.2/fundamental-exterior-characters` | verified | The signed exterior degree convention makes E_(−1)=0, E_0=1 and F_1=E_1; generating function and rank-two coefficients agree. |
| `CG.2/integral-invariant-presentation` | verified | Reciprocal orbit recurrences and the native symmetric-polynomial equivalence are integral; the triangular F_k/e_k substitution has leading coefficient 1. |
| `CG.2/primitive-character-identity` | verified | Surjective ν-valued contraction and split decomposition give primitive characters; determinant of V equals ν^g. |
| `CG.2/rational-character-isomorphism` | verified | Injectivity and the primitive/multiplier generators prove the exact rational character ring equivalence, with unrestricted inverse multiplier. |
| `CG.3/positive-laurent-subring` | verified | Generator support is exactly m+Σmin(u_i,0)≥0; closure uses all subset linear inequalities rather than falsely treating min as additive. Signed coefficients are permitted. |
| `CG.3/positive-invariant-presentation` | verified | Nonzero-coordinate flip orbit sums avoid doubling zero orbits; the same integral triangular substitution gives Z[t,F_1,…,F_g] and independence. |
| `CG.3/tensor-constituent-subring` | verified | The subring uses simple tensor-power summands and contains degree-zero unit; tensor closure explains its integer span. It differs from the ring generated only by V. |
| `CG.3/tensor-constituent-criterion` | verified | Dominant tensor weights force m≥0 and d=2m+Σu_i; the rational highest component and ν summand prove sufficiency at that exact degree. |
| `CG.3/tensor-character-isomorphism` | verified | Positive support and the integral invariant generators identify the constituent subring with positive Weyl invariants; inverse ν is excluded. |
| `CG.3/integral-tensor-generation` | verified | Transporting the two polynomial presentations proves integral independent generators and localization by ν; the negative exterior index remains zero. |

## Closure, ownership and ordering

CG.0 supplies the coordinate and lattice inputs; CG.1 constructs rational
representations using the existing complex Sp theory and generic algebraic-group
interfaces. CG.2 joins characters to the integral invariant presentation.
CG.3's exponent cone and positive invariant proof depend only on the earlier
pure algebra, while its constituent interpretation additionally uses CG.1–2.
There is no circular use of character surjectivity to prove the positive ring.
The target-level nodes appropriately keep nontrivial proof steps in their
sketches rather than expanding this review into lemma-level planning.

All eleven request destinations exist and their scopes were read. ReductiveGroups
Layers 0/1/3/6/7 own the generic dictionary, comodule glue, quotient descent,
semisimplicity and structure interfaces. ClassicalGroups Layers 0/1/3/4/5 own
complex matrix compatibility, tensor/exterior constructions, classification,
characters and dimensions. LieHighestWeight Layer 4 now supplies only its
classification. The coordinate presentation imports the ST.5 general group; it
does not rebuild that definition. Searches across other packets found no owner
for this specific GSp integral character/positive reciprocal invariant theorem.
Automorphic, level-structure and monodromy uses of similitudes have different
objects and do not duplicate these targets.

The reviewed library-coverage catalogue has no layer entries for this Part II,
its ClassicalGroups parent or ReductiveGroups. Inspected the reviewed ST.5
entry (AUDIT-07); it does not assert the general GSp group or these character
rings are implemented. Direct pinned source evidence therefore governs the
baseline. No restructuring or upstream-file edit is needed.

Every planned stage target has a realizing node. The remaining lists honestly
inherit the exact supplier requests and the single central-cover scheme/descent
signature gap. A finite-type Hopf presentation or algebraically closed point
lift is not falsely advertised as a finished fppf quotient/descent API. Keeping
all four stages planned and none closed is appropriate.

## Validation and remaining implementation work

- Blueprint checker: zero errors and zero warnings, including a declaration
  index generated from the exact pinned cited modules.
- Source-issue schema and source-version checks: no errors.
- Name correspondence: all 26 suggested declarations, 76 API names and 58 named
  examples appear; each named test precedes an example. All definitions and
  constructions meet the three-test minimum. No Prop-valued sorry stand-in.
- Every individual import exists in its exact pinned source tree.
- Independent exterior-basis calculation checked the corrected Lefschetz
  commutator on all 340 basis vectors for g=1 through 4; the rank-three
  source-product calculation also confirms E4.
- Submission file/path/JSON validation and whitespace checks pass.

**No successful Lean elaboration.** The `lean-check` attempt stopped because the
required `TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra`
object file is absent from the shared build. That build's Mathlib revision
matches the pin, but its TauCeti HEAD is `cf386627`, not `f790474`. No existing
shared build at both pins was found, and the worker rules prohibit building
one. The check ended before elaborating the signatures. Source, name and import
checks do not establish their elaboration. No language server or background
Lean process was left running.

A future implementation must resolve the eleven owning interfaces, express the
existing scheme/descent signature gap with those interfaces and elaborate at
both exact pins. Those are existing explicit implementation obligations, not
contradictions in this accepted planning pass.

## Questions for the orchestrator

No blocker to accepting the reviewed packet. The reader Markdown was not an
authorized review deliverable and was not edited. On the next authorized reader
synchronization, copy the added coaction/pairing APIs, kernel hypotheses,
Lefschetz normalization, refined Cartan-component supplier explanation and
source-issue records from the reviewed packet. Its old shorthand assigning a
Cartan-component theorem to LieHighestWeight should be replaced by the argument
in this review. The design handoff likewise remains a historical record; this
review's handoff records the final corrected contract. No additional claim is
needed for this review.
