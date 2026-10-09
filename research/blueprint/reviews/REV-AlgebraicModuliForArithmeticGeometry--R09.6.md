# Independent review of R09.6

Accepted on 2026-10-09 by Codex, session `codex-yn5td4`, for job
`REV-AlgebraicModuliForArithmeticGeometry--R09.6` (#6295). The author session was
`codex-4z8G3x`; this reviewer did not write the input. Acceptance concerns the
finished target-level plan. Coverage remains **planned**, with three explicit
supplier gaps; it is neither closed nor implemented.

## Inventory and scope

The reviewed packet has 21 nodes: four definitions, three constructions, thirteen
theorems and one application. It has 32 API items, 26 unit tests, six planets,
14 pinned baseline declarations, ten supplier contracts, three gaps and one
confirmed source misprint. No node was added or removed, and no baseline citation
was removed or replaced. The two added completion APIs remain inside the existing
construction rather than becoming proof-step nodes.

The native suggested file represents 21 API items and 18 examples. The remaining
11 API items (three versality interfaces and eight geometric parameter interfaces)
and eight examples remain explicitly named in its geometric omission ledger.
The thirteen geometric target theorems and arithmetic application are also in
that ledger. The native fixed-fibre, fixed-ring-tower and Yoneda prototypes are
not signatures for the missing relative geometric comparisons. Their missing
carriers and supplier contracts remain visible in the packet's three gaps.

## Corrections made in place

1. An affine neighbourhood is an open inclusion `Spec Λ⊂S`. The test-category
   conventions now distinguish finite `Λ→k` from the classical complete-local
   equal-residue assumptions used for hulls. The actual SF.4 Artinian-category
   node is a direct prerequisite.
2. The framed-arrow Lean criterion now uses unique existence, as its mathematical
   API promised. The constant-groupoid tower test now identifies the automorphism
   equivalence with evaluation at index zero.
3. Stabilizer linearization states the source's full surjection hypothesis:
   its kernel is annihilated by the source maximal ideal. A small extension is
   a special case, with a nonzero principal kernel.
4. Completed-ring properties now cite native maximal-ideal completeness and
   expose its specialized Lean theorem. Noetherianity has an explicit SF.4
   completion contract, a theorem signature on the actual completed stalk,
   and a proof outline sourced to Stacks 10.97.4–6, pp. 227–228. It is not
   attributed to the native local-ring or residue-field theorem.
5. The family-versality citations now include Artin 98.12.5, p. 19, and Formal
   Deformation Theory 90.29.1/90.29.5, pp. 71–73, for finite residue extension,
   plus 90.8.2, pp. 20–21, for testing small extensions.
6. Effective-versal algebraization now directly imports SF.4's requested
   complete-local Nakayama theorem. The approximation prefix remains in A0.
7. Parameter-completion transport explicitly assumes a locally Noetherian base
   and a locally finite-type parameter scheme, or such a same-residue étale
   chart. It does not enlarge any of the representing theorems' hypotheses.
8. Arithmetic transfer explicitly imports ModularCurves Layers 7B and 7D.
   Its elliptic instance uses the marked deformation over `W(k)[[T]]` for
   algebraically closed characteristic-p residue field and transports the family
   and level in the rigidified completed strict-henselian comparison.

## Sources and source issue

All six original public PDFs were independently downloaded and their hashes
matched the packet. The additional [Commutative Algebra PDF](https://stacks.math.columbia.edu/download/algebra.pdf)
was read at 10.97.4–6, pp. 227–228; its hash and edition are in the packet.
The node-by-node record below states the exact checked results. The approximation
imports were also checked against [Smoothing Ring Maps](https://stacks.math.columbia.edu/download/smoothing.pdf),
16.13.1–2, pp. 32–33; [More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf),
15.51.10 and proof, pp. 129–130; and [Artin's 1969 paper](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf),
Theorem 1.10, p. 26, and Corollaries 2.5–2.6 with proof, pp. 28–29.
An actual formal solution is required by polynomial approximation. The common
étale neighbourhood can match any fixed finite jet; it need not realize the
original formal coordinate change at every order.

The added finding `AlgebraicModuliForArithmeticGeometry/E6001` concerns only an
intermediate formula in the proof of [Formal Deformation Theory 90.19.11, tag 06JY](https://stacks.math.columbia.edu/tag/06JY),
p. 58 of the July 14, 2026 PDF. The tangent-space identification should be
untensored; the lifting action tensors it once with the extension kernel.
The one-object additive groupoid with a two-dimensional square-zero kernel
separates these dimensions. The lemma statement is correct. The finding is a
confirmed misprint affecting nothing in the intended mathematics, and its
version and correction searches are recorded in the packet. No other source
error was established. All deliverables state results and corrections in our
own words; no source passage or source-section summary is included.

## Baseline verification

Read each original declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including its surrounding
variables. All original thirteen citations supply their stated interfaces.

| Declaration | What was checked |
| --- | --- |
| `CategoryTheory.StructuredArrow` | Actual comma objects, frame-commuting arrows and faithful right projection. |
| `CategoryTheory.toSkeleton_eq_toSkeleton_iff` | Isomorphism-class equality iff a nonempty isomorphism type; no quotient by raw equality. |
| `CategoryTheory.Functor.mapAut` | Native group homomorphism induced by mapping an automorphism isomorphism. |
| `AdicCompletion` | Compatible ideal-power quotient sequences; specialize to the actual stalk. |
| `AdicCompletion.evalₐ` | Algebra homomorphism to the n-th quotient; use n+1 for the packet's indexing. |
| `AdicCompletion.ext_evalₐ` | Equality follows from all quotient evaluations; the omitted zeroth-power quotient is trivial. |
| `AdicCompletion.isLocalRing_of_fg` | Local ring and finitely generated maximal ideal, available under Noetherianity. |
| `AdicCompletion.residueField_map_bijective` | Noetherian local ring; the completion structural map induces a residue-field bijection. |
| `TauCeti.derivationToDualNumberEquivLift` | Coefficient-compatible scalar tower and specified augmentation give the relative derivation/lift equivalence. |
| `TauCeti.AlgHom.kernelCotangentLinearEquivZariski` | Augmentation-kernel cotangent comparison at the actual affine point; not an arbitrary-base absolute tangent theorem. |
| `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` | Dual over the actual stalk residue field; used only in the matching rational field-base case. |
| `CategoryTheory.Functor.EssSurj` | Essential image via isomorphism, matching the effectivity predicate. |
| `CategoryTheory.yoneda` | Actual arrows and precomposition, matching the universal element and pullback formula. |
| `AdicCompletion.isAdicComplete_of_fg` (added) | Completion is complete for its own maximal ideal; LocalRing.lean, lines 120–125, with the finite-generation hypothesis. |

## Closure, ownership and tests

Read the supplier statements in A0-extension-2, R09.4 and SF.4, and the D0/SF.1/SF.0
layer contracts. The A0 approximation prefix is a plan awaiting independent
review, not an accepted Lean implementation. SF.4's review still records supplier
limitations; the groupoid extension and Noetherian-completion request remain
open work. A request names a required theorem rather than proving it exists.
The completed-atlas relation retains the identity-point formal arrows, and
space/stack restriction does not gain a gratuitous properness assumption.
The proper coherent Grothendieck-existence and formal-curve suppliers retain
their own scope; they do not effect arbitrary varying higher-dimensional schemes.

The reviewed R09.6 library audit marks it not built and points to the already
available Zariski tangent and dual-number dictionary. Current Tau Ceti source
was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Current TauCetiRoadmap main was checked at
`de435a569d325b365a30fe83269ce34674eaea80`, including the AlgebraicVectorBundles
and StableReduction READMEs and relevant Suggested.lean interfaces, and
ModularCurves 7B/7D. AlgebraicVectorBundles owns the sheaf/total-space theory;
this packet only consumes supplied quotient-classifying representations.
StableReduction owns curve and stable-map families, and explicitly leaves
moduli representability downstream. ModularCurves owns the marked elliptic
comparison. None is re-planned here. All external prerequisites remain lower-tier
or existing upstream work; no higher-tier deformation-patching dependency was added.

The confirmed finding RT-AREA-algebraicgeometry/2 and accepted RS-27 agree on
SF.0 → A0 approximation prefix → R09.6 effective-versal algebraization, with
Artin criteria owned by A0. The packet and reader preserve that order and the
complete criterion hypotheses, including independent effectivity and openness
of versality. There is no circular use of the already-algebraic stack theorem.

Each of the seven definitions/constructions has at least three tests.
Their mathematical values were checked independently: framed identity fibres,
reduction kernels, glue-compatible towers, essential image, shifted completion
jets, versal excess parameters, and all eight parameter examples. In particular,
the closed nonflat degree-one Hilbert parameter classifies only base maps killing
ε; the universal family is flat over that parameter. A length-one quotient on
P¹ has point-completion k[[t]]. Hom and Isom separate zero from units. Relative
Picard classes lose the line-bundle automorphisms that its stack retains.
The six planets are central definitions/constructions or the named algebraization
theorem, with no source-tag or proof-step labels.

## Per-node verdicts

### framed-deformation — corrected

Stacks 98.3, pp. 4–5, and native StructuredArrow give the actual framed groupoid. Corrected the direction of the affine-open inclusion and separated finite Λ→k coefficients from classical equal-residue hull coefficients. The Lean arrow criterion now asserts the unique lift promised by the API.

### framed-functoriality — verified

Stacks 98.3.2–3, p. 5, identifies the framed 2-product and smooth lifting. D0 coherence and SF.1 representable lifting are explicit suppliers; the comparison isomorphism is retained.

### infinitesimal-stabilizer — verified

Formal Deformation Theory 90.19.1–3, pp. 55–56, matches the reduction kernel of Functor.mapAut and its framed automorphism group. Identity, zero reduction and frame-kernel tests distinguish residual from infinitesimal automorphisms.

### stabilizer-linearization — corrected

Formal Deformation Theory 90.19.6–13, pp. 56–58, proves the vector structure and vanishing criterion. Stated the full maximal-ideal-annihilated surjection hypothesis and recorded the proof misprint E6001; tensor with the kernel once. RS and groupoid suppliers remain explicit.

### tangent-exact-sequence — verified

Artin 98.8.2, p. 11, and Formal Deformation Theory 90.26.2, p. 66, give the six-term exact sequence, with the difference signs and framed boundary. It ends at the displayed tangent space without asserting a final surjection.

### completed-local-ring — corrected

The carrier, jets, localness and residue comparison are native. Added pinned maximal-ideal completeness and its Lean specialization; separated Noetherianity into a precise SF.4 contract with Stacks 10.97.4–6, pp. 227–228, and a real completed-ring theorem signature. Noetherianity is not supplied by the native localness lemma.

### scheme-formal-comparison — verified

Artin 98.12.3 and proof, pp. 18–19, identifies coefficient-compatible Artinian maps with maps from the actual completed stalk. Locally finite-type and locally Noetherian assumptions ensure a Noetherian stalk. The node test concerns a point of a fixed node, not deformation of the node itself.

### space-formal-comparison — verified

Artin 98.3 and 98.12.3, pp. 4–5 and 18–19, with Formal Algebraic Spaces 87.33.3, pp. 74–75, justify transport through a supplied pointed étale chart. The same-residue-field chart is an explicit hypothesis; an arbitrary smooth chart or residue extension is not substituted.

### relative-tangent-comparison — verified

Formal Deformation Theory 90.11.11, p. 34, and Artin 98.12.3 identify dual-number lifts with relative derivations. Read all three Tau Ceti tangent/derivation declarations at f790474. Absolute Zariski tangent identification is restricted to the rational field-base case.

### formal-object — corrected

Artin 98.9.1–4, pp. 11–12, defines coherent formal objects and arrows. Native tower objects retain adjacent isomorphisms and arrow commutation. Strengthened the constant-groupoid automorphism test to require the equivalence to be induced by evaluation at index zero, rather than merely an abstract group equivalence.

### effectivity — verified

Artin 98.9.4, p. 12, is essential image of restriction. The native predicate and EssSurj equivalence preserve isomorphism rather than equality. The empty-source and nonfaithful constant-functor tests distinguish object existence from a restriction equivalence.

### space-restriction — verified

Formal Algebraic Spaces 87.33.2–3, pp. 74–75, proves both injectivity and surjectivity for maps out of a complete Noetherian local ring to any algebraic space. No separatedness, properness or target finite-presentation assumption is needed; the equalizer and finite étale descent supplier is requested.

### stack-restriction — verified

Artin 98.9.5, pp. 12–14, proves full faithfulness using the algebraic-space Isom and existence using a smooth atlas, finite étale extension and fppf descent. It assumes an already algebraic stack, a locally Noetherian base and finite-type residue field, and does not discharge its own Artin effectivity hypothesis.

### effectivity-two-fibres — verified

Artin 98.9.6, p. 14, identifies the two sides as 2-products and uses equivalence in each factor. Essential surjectivity alone is not the stated input.

### family-versality — corrected

Artin 98.12.1–5, pp. 18–19, and Formal Deformation Theory 90.8.1–3 and 90.29.1–5, pp. 20–21 and 71–73, support all three APIs. Added the missing finite-residue-extension locator and the small-extension lemma; specified the nonzero principal kernel convention. The closed-point dual-number and excess-parameter examples are valid.

### completion-versality — verified

Artin 98.12.3–4, pp. 18–19, gives completion equivalence and the smooth scheme-morphism characterization at the specified finite-type point. The statement inherits the family definition’s coefficient and finite-type conventions.

### atlas-versality — verified

Artin 98.3.3 and 98.12.3, pp. 5 and 18–19, gives chart versality. Formal Deformation Theory 90.18.1 and 90.19.12–13, pp. 54 and 58, justify the classical tangent-bijective hull/prorepresentation clauses. Zero infinitesimal automorphisms alone does not remove chart parameters or residual inertia.

### completed-atlas-presentation — verified

Formal Deformation Theory 90.26.1–2, pp. 65–66, supplies a deformation-category presentation from a smooth chart. The completed relation is taken at its identity point, so it retains infinitesimal arrows but does not claim to include other residual automorphisms. D0/SF.1/SF.4 supply the actual geometric quotient coherence.

### versal-algebraization — corrected

Artin 98.12.7–8, pp. 20–21, uses effectivity, versality, G-ring regularity and limit preservation on objects. Read its N=2 approximation, recursive lifting, Nakayama surjection and graded-length comparison. Added the direct SF.4 prerequisite for the complete-local Nakayama step already requested. The completion isomorphism is existential, not a prescribed all-orders coordinate change.

### parameter-formal-exports — corrected

Yoneda transports the supplied representation and universal object; Artin 98.12.3, pp. 18–19, transports the formal point comparison. Added the locally Noetherian base and locally finite-type parameter hypotheses explicitly. All eight geometric interfaces retain their representing theorem’s assumptions. Checked all eight examples, including the nonflat Hilbert base and Picard-space/Picard-stack distinction.

### arithmetic-comparison-transfer — corrected

Artin 98.9.5, 98.12.7, 98.16.1 and 98.17.1, pp. 12–14, 20–21 and 26–27, justifies conditional transfer and the full imported criterion ledger. Added explicit existing ModularCurves 7B/7D imports and their marked elliptic W(k)[[T]] instance with algebraically closed characteristic-p and rigidification hypotheses. Application effectivity and level rigidity remain supplied inputs.

## Validation and orchestration notes

- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.6.lean`
  elaborates at the pinned libraries; only declarations using `sorry` warn.
  This checks interfaces and types, not the unproved geometric statements.
- `scripts/check_blueprint.py` with the shared pinned declaration index:
  zero errors and zero warnings.
- The source-issue schema and version records pass their shared validators;
  all API/test names are accounted for in native signatures/examples or the
  explicit omission ledger.
- Submission-file checks and `git diff --check` pass.

The issue permits edits to the packet and suggested file, plus this report;
it does not permit editing the reader document. Assembly/package work should
synchronize the reader with the corrections above, including its older
sourceIssues-empty sentence, the added completion APIs and their supplier,
the coefficient terminology, the finite-residue-extension locator and the
explicit elliptic imports. Its substantive mathematical comparisons and its
RT-AREA-algebraicgeometry/2 ordering were checked and agree with the corrected
packet. The packet and this review are the authoritative correction record.
Likewise apply the original packet's already-recorded smooth-chart-versus-hull
and classifying-stack corrections when updating the existing package.
No maintainer decision is required to accept this part; the named supplier gaps
and packet-wide assembly remain downstream work.
