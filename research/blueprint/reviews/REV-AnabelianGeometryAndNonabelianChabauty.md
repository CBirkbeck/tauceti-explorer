# Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526), job
`REV-AnabelianGeometryAndNonabelianChabauty`. Current reviewer: Codex
`codex-1O5j0u`, 2026-10-05. Input explorer revision:
`ceae7664eb1264bc255acade6af444e36a29b0d0`, incorporating review checkpoints
[#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170) and
[#6175](https://github.com/CBirkbeck/tauceti-explorer/pull/6175).
This session did not author the blueprint.

**This remains an unfinished independent review.** There is no global `review`
object, acceptance verdict or completed per-node verdict matrix. The scoped
`independentReviewCheckpoint` records this pass's work. The blueprint's
`complete` status still denotes its budget-complete planning pass. All stages
and implementation statuses are unchanged: NC.0/NC.3 are partial, the other
five stages are not_read, and every implementation is unchecked.

The packet retains 363 nodes, 160 baseline declarations, 17 requests, 10 gaps
and 11 planets. Definitions/constructions have 320 API entries and 250 tests;
across every node kind there are 340 API entries and **265 tests**. This pass
adds one theorem test, no node and no supplier. Existing reading/compilation
receipts remain attributed to their authors.

## Corrections in this pass

1. **Central-obstruction sign.** `NC.3/central-extension` specifies the positive
   defect D(g,h)=c(g)g(c(h))c(gh)⁻¹, matching the pinned Tau Ceti additive
   differential d¹a(g,h)=g•a(h)−a(gh)+a(g). Kim's arXiv v1 printed p.5 instead
   takes the inverse defect, c(gh)g(c(h))⁻¹c(g)⁻¹. Thus the packet's class is
   the negative of Kim's printed class; their zero loci agree. The statement,
   proof outline, source match and suggested omission comment now pin this
   comparison. This is a convention qualification, not a source error.
2. **Sign discriminator.** Added
   `tests.central_defect_sign_C3_C9`: for the least-residue section C₃→C₉ and
   trivial action, the positive defect at (2,1) is 3, its negative is 6, and
   they differ. The central subgroup identification a↦3a takes these to 1 and
   −1 in C₃. The native arithmetic example is proved by `decide`. It does not
   construct the omitted continuous H² interface or certify an H² comparison.
3. **Hypothesis spelling.** Replaced the unbound U in the central-extension
   action/continuity hypotheses by its actual ambient coefficient group B.
4. **Descent reading receipt.** Replaced the obsolete claim that Stacks 01ZM
   could not be retrieved. Its whole statement and all three printed proofs
   were read, retaining directedness, qcqs bases and affine transition maps.
   The packet still requests the generic property/group-structure descent and
   cohomology-continuity suppliers. Reading a source is not building them.
5. **Scoped source receipts.** Recorded fresh reading of Stacks 03RH/03RM and
   Schmidt–Stix Appendix A.3. Their cited foundational proof leaves remain
   open. Historical receipts and encoded recovery payloads are preserved;
   none was decoded or executed or used as independent proof evidence.

No roadmap reader, atlas data, supplier packet or author handoff was edited.
The issue authorizes only this review's packet, suggested file, report and
handoff.

## Baseline statement audit

Every one of the **160 cited declarations** was read at the packet's exact
pins, with the relevant namespace and surrounding hypotheses. All 138 cited
Mathlib names also resolve in a fresh `lean-check` file importing the cited
modules and checking the qualified names; it exits 0. The 22 Tau Ceti entries
were inspected in pinned git objects. Their import cannot be checked in the
existing build because the LowDegree object is absent. The table below gives
exact pinned source locators; it is a statement audit, **not** a certificate
that every citing proof uses the declaration correctly.

The significant boundaries confirmed in the source are:

- Native `groupCohomology.IsMulCocycle₁` requires commutative coefficients;
  its reversed factors cannot be reused for an arbitrary nonabelian group.
  Native `continuousCohomology` uses homogeneous cochains of `TopRep` in
  every degree. The geometric/derived-discrete agreement remains an import
  contract, not an identification supplied by that definition.
- Tau Ceti B² is the image of **continuous** degree-one cochains; its d¹ has
  the positive sign above. H⁰/H¹/H² are additive constructions. The trivial
  action H¹ equivalence lands in additive continuous homomorphisms to the
  multiplicative coefficient synonym. It does not construct nonabelian H¹.
- `explicitShapiro0` needs continuous multiplication. `explicitShapiro1`
  retains compact totally disconnected G, a closed subgroup, discrete additive
  coefficients and joint action continuity. Degree-two descent/inflation
  supplies degree two; the existing finite-quotient H¹ transition/colimit
  supplies discrete abelian coefficients. None is an arbitrary all-degree or
  nonabelian geometric comparison.
- `MulAction.toPerm` and `toPermHom` have distinct types. The native quotient
  group structure requires normality; the coset action and topological
  quotient projection have wider subgroup scopes. The normal fixed-point
  action and the quotient action are already native. `Subgroup.continuousSMul`
  restricts the **acting** group; it does not supply continuity on an arbitrary
  coefficient subgroup.
- Embedding and quotient continuity lemmas were identified by their qualified
  namespaces, not the first basename match. The product continuity argument
  uses **open** quotient maps. The first-isomorphism group equivalence requires
  surjectivity; its inverse continuity is a separate quotient-topology issue.
  `MonoidHom.liftOfSurjective` requires kernel containment. The colimit proof
  uses the generated duals of the cited native limit lemmas; those remain
  native library results.
- `Torsor` includes nonemptiness and scalar division.
  `IsTopologicalTorsor` includes continuous scalar division. Its orbit
  homeomorphism is the actual native composition with the opposite-group
  homeomorphism. Abstract finite étale fibres and Galois-category groups still
  do not supply the non-affine scheme fundamental group.

## Selected node and signature audit

The fresh detailed screen covers the 49 nodes listed in the packet's
`selectedNodeAudit`: the late `kernel-invariant-gauge` through
`twisted-kernel-invariant-injectivity-iff` families and
`equivariant-topological-torsors`. Their statements, hypotheses, proof
outlines, API/test entries and actual suggested signatures were read.
No new contradiction was established in those families. Their earlier
precursors and every consumer dependency still need the complete matrix before
acceptance. The following calculations are the independent mathematical
support for this selected screen.

For K=ker(f), equivariance and f(u)∈Vᴳ imply that
f(u c(g)(g•u)⁻¹)=1. The ambient gauge expression is a continuous cocycle;
its native subgroup coordinate is continuous through the induced topology.
The compatible action on K remains explicit. Gauging first by v and then by u
uses the ordered product uv. A kernel gauge a changes under u into the kernel
gauge uau⁻¹, so the operation descends to kernel cohomology classes.

Let E=f⁻¹(Vᴳ). Kernel elements act trivially on H¹(G,K). When f is
surjective, E→Vᴳ is surjective with kernel K, so the permutation homomorphism
factors through Vᴳ. Changing a lift changes the representative by a kernel
gauge, establishing class-level lift independence. No continuous choice of
lifts is required, and this set action need not fix the neutral kernel class.

Two kernel classes have equal ambient images precisely when an ambient gauge
relates their representatives. Its projection is invariant, so this is exactly
one Vᴳ-orbit. The inverse of the orbit-to-image equivalence therefore returns
an orbit, independently of a chosen kernel preimage. For a continuous
surjective coefficient map, inverse-gauge normalization yields a kernel-valued
cocycle from every neutral mapped class; this gives the orbit-to-neutral-fibre
equivalence. It does not give an individual, unique kernel class.

For the sign map S₃→ℤˣ with discrete trivial C₃-actions, its kernel is A₃.
The three-cycle and inverse define distinct kernel H¹ classes, since A₃ is
abelian and the original action is trivial. The invariant −1 lifts to (01),
whose conjugation exchanges them. Their **ambient inclusion fibre** is one
invariant orbit containing two kernel classes. This is the concrete
regression against treating the inverse as a unique kernel class.

Twisting transports the neutral fibre of f_c to the original fibre over
[f∘c], with the class translation d↦dc in that order. Applying the kernel
orbit classification in the actual twists gives the specified repointed-fibre
equivalence. The neutral kernel orbit maps to [c]. For the identity map on S₃
and the discrete C₂ transposition cocycle, that image is nonneutral; every
coboundary for the trivial action is the identity cocycle. Injectivity of the
translated kernel-class map is equivalent to triviality of the **whole action
on kernel classes**; triviality of the invariant group is sufficient but not
necessary.

The native torsor bundle was checked against its actual signatures and source
hypotheses. With gp=p cₚ(g), point change p↦p·x changes its cocycle by the gauge
x⁻¹, and the cocycle model has action g⋆y=c(g)g(y). The coordinate
homeomorphism preserves both actions. This confirms the topological
classification abstraction's conventions; the existing algebraic
comparison/descent/effectivity gap remains essential.

## Primary-source and ownership reading

Fresh selected reading used the exact downloaded Kim v1, Kim Albanese v4,
Poonen and Schmidt–Stix PDFs, whose hashes match the packet. The paragraphs
read are distinguished from whole-paper certification. Kim v1 printed pp.5–9
supply the cocycle/gauge conventions, torsor argument, central obstruction and
freeness calculations. Poonen printed pp.11–13, 106–107 and 154–155 supply the
Galois-cohomology conventions, descent/effectivity qualifications and algebraic
torsor/twisting distinctions.

In [Schmidt–Stix Appendix A.3](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
printed pp.861–866, the classifying map is constructed through the nerve of the
fundamental groupoid. A.14 gives a fibrant replacement; A.15 proves the group
map correspondence; A.16 identifies maps to BG with pro-group maps. A.18 uses
the cited homotopy-group detection theorem. The raw comparison's fundamental
model-category and Artin–Mazur leaves are still not closed by this reading.

[Stacks 01ZM](https://stacks.math.columbia.edu/tag/01ZM) separates descent of
finite-presentation objects, descent of their morphisms and eventual equality.
Its proof glues a finite affine descent and descends overlap equations at a
later index. Descent of a cover alone does not prove eventual zero of the
pulled-back cohomology class; the latter uses the separate canonical cohomology
colimit. Finite étale/surjective properties and finite coefficient group laws
retain their own supplier proof requirements.

[Stacks 03RH](https://stacks.math.columbia.edu/tag/03RH) supplies the surrounding
proof of [03RM](https://stacks.math.columbia.edu/tag/03RM): the fundamental
multiplicative/divisor sequence and higher vanishing, using the function-field
vanishing input and Leray. Reading this chain does not establish its cited
Tsen, stalk, Leray and colimit foundations in the atlas.

The seven reviewed library audit records were read with their duplicate-owner
boundaries. Upstream `ReductiveGroups` and
`RepresentationTheory/InductionRestriction` READMEs were read in full at
`2172af4ad0d340223ad59e6a5f698766118142c1` as density/ownership comparators;
ProfiniteCohomology's first 400 lines were also read for its explicit versus
canonical and all-degree colimit contracts. No claim is made to have re-audited
the complete supplier packets or all upstream roadmap links. The reserved
K(π,1) key remains a single owned node; its full-coefficient canonical-map
interface must retain the full fundamental group, with separately scoped raw
homotopy and constant-Fₚ/pro-p comparisons.

## Validation and remaining work

The packet checker reports **0 errors and 0 warnings**. The 138 Mathlib name
checks elaborate with exit 0. The full suggested file was attempted with
`lean-check`; it fails at the unavailable
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library build, update, cache download or language server was started.

The final Mathlib projection removes exactly the Tau Ceti import line and the
whole exact `section Abelian` block, retaining `section AbelianTwistingTest`.
It elaborates with exit 0 and **690 warnings, all uses of `sorry`**; there are
no errors or other warnings. The new sign discriminator is proved without an
admission. Available memory was 95 GiB. This verifies prototype expressibility,
not the admitted results or the excluded additive comparisons. Full-file
compilation remains unavailable.

Current suggested SHA-256: `8c77e349c1f417615b452bb59b21424e596097fdea8c2c33287abdd2de28ccee`.
Current projection SHA-256: `0d4eeb9a9b74b5c7a4d54e2721f10431fdf9b3dffa07ea9d772d7c2c9a129b41`.

The remaining work is the earlier nodes' complete consumer/source/API/test
matrix, the transitive geometric/foundation supplier audit, current coverage
and gap reconciliation, planet/duplication screening and the complete
source-error screen. `sourceIssues` remains empty without a completed screen.
Honest partial/not_read stages alone do not require rejection of the
budget-complete pass. No final review verdict should be inferred from this
checkpoint. Resume from the handoff instead of promoting the scoped reading
receipts to verified node verdicts.

## Pinned baseline locators

These locators concern the declarations actually cited, including native
limit declarations whose `to_dual` attributes generate the used colimit
statements. Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti to
`f790474821cf4256814db967cb154e7af3d0c369`. Ambiguous basename matches were resolved manually.

| Cited reference | Statement at the pin |
|---|---|
| `mathlib:ContinuousMap` | [Mathlib/Topology/ContinuousMap/Defs.lean:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Defs.lean#L33) |
| `mathlib:ContinuousMonoidHom` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean#L57) |
| `mathlib:ContinuousSMul` | [Mathlib/Topology/Algebra/MulAction.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L46) |
| `mathlib:FixedPoints.subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L203) |
| `mathlib:IsTopologicalGroup` | [Mathlib/Topology/Algebra/Group/Defs.lean:110](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Defs.lean#L110) |
| `mathlib:MulAction.QuotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L52) |
| `mathlib:MulAction.orbitRel` | [Mathlib/GroupTheory/GroupAction/Defs.lean:287](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L287) |
| `mathlib:MulAction.orbitRel.Quotient` | [Mathlib/GroupTheory/GroupAction/Defs.lean:349](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L349) |
| `mathlib:MulAction.toPerm` | [Mathlib/Algebra/Group/Action/Basic.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Basic.lean#L34) |
| `mathlib:MulAut.conj` | [Mathlib/Algebra/Group/End.lean:723](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean#L723) |
| `mathlib:MulDistribMulAction` | [Mathlib/Algebra/Group/Action/Defs.lean:629](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L629) |
| `mathlib:MulDistribMulAction.toMulAut` | [Mathlib/Algebra/Group/Action/End.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L232) |
| `mathlib:Multiplicative` | [Mathlib/Algebra/Group/TypeTags/Basic.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean#L46) |
| `mathlib:QuotientGroup.Quotient.group` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L72) |
| `mathlib:QuotientGroup.continuous_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L44) |
| `mathlib:QuotientGroup.isOpenMap_coe` | [Mathlib/Topology/Algebra/Group/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L52) |
| `mathlib:Subgroup.Normal` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:604](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L604) |
| `mathlib:Subgroup.center` | [Mathlib/GroupTheory/Subgroup/Center.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Subgroup/Center.lean#L30) |
| `mathlib:Topology.IsQuotientMap` | [Mathlib/Topology/Defs/Induced.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Induced.lean#L166) |
| `mathlib:groupCohomology.IsMulCocycle₁` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:621](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean#L621) |
| `tauceti:TauCeti.ContCohomology.B1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:174](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L174) |
| `tauceti:TauCeti.ContCohomology.B2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:494](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L494) |
| `tauceti:TauCeti.ContCohomology.H0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:326](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L326) |
| `tauceti:TauCeti.ContCohomology.H1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:674](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L674) |
| `tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:840](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L840) |
| `tauceti:TauCeti.ContCohomology.H1pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:679](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L679) |
| `tauceti:TauCeti.ContCohomology.H2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:730](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L730) |
| `tauceti:TauCeti.ContCohomology.H2pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:735](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L735) |
| `tauceti:TauCeti.ContCohomology.Z1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:485](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L485) |
| `tauceti:TauCeti.ContCohomology.Z2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:488](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L488) |
| `tauceti:TauCeti.ContCohomology.d0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:167](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L167) |
| `tauceti:TauCeti.ContCohomology.d1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:228](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L228) |
| `mathlib:AlgebraicGeometry.Scheme` | [Mathlib/AlgebraicGeometry/Scheme.lean:42](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean#L42) |
| `mathlib:AlgebraicGeometry.IsLocallyNoetherian` | [Mathlib/AlgebraicGeometry/Noetherian.lean:56](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean#L56) |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Mathlib/AlgebraicGeometry/Sites/Etale.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean#L50) |
| `mathlib:continuousCohomology` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) |
| `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup` | [Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean#L232) |
| `mathlib:CommAlgCat.FiniteEtale` | [Mathlib/RingTheory/Etale/Finite.lean:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L58) |
| `mathlib:CommAlgCat.FiniteEtale.fiber` | [Mathlib/RingTheory/Etale/Finite.lean:118](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L118) |
| `mathlib:Topology.IsEmbedding.continuous_iff` | [Mathlib/Topology/Maps/Basic.lean:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L245) |
| `mathlib:MulAction.quotient` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:83](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L83) |
| `mathlib:MulAction.Quotient.smul_mk` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:93](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L93) |
| `mathlib:MulAction.fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:116](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L116) |
| `mathlib:MulAction.mem_fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L133) |
| `mathlib:QuotientGroup.eq` | [Mathlib/GroupTheory/Coset/Defs.lean:198](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L198) |
| `mathlib:QuotientGroup.out_eq'` | [Mathlib/GroupTheory/Coset/Defs.lean:204](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L204) |
| `mathlib:QuotientGroup.mk_out_eq_mul` | [Mathlib/GroupTheory/Coset/Defs.lean:216](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L216) |
| `mathlib:QuotientGroup.leftRel_apply` | [Mathlib/GroupTheory/Coset/Defs.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L71) |
| `mathlib:MulAction.left_quotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L67) |
| `mathlib:groupCohomology.coindIso` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean#L59) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean:120](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L120) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean:372](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L372) |
| `tauceti:TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean:96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L96) |
| `tauceti:TauCeti.ContCohomology.exists_explicitInfl2_eq` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean:108](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L108) |
| `tauceti:TauCeti.openActionKernel` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean:133](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean#L133) |
| `mathlib:ZMod.instIsSimpleAddGroup` | [Mathlib/GroupTheory/SpecificGroups/Cyclic.lean:282](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Cyclic.lean#L282) |
| `mathlib:ZMod.card` | [Mathlib/Data/ZMod/Defs.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Defs.lean#L166) |
| `mathlib:ZMod.natCast_self` | [Mathlib/Data/ZMod/Basic.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L145) |
| `mathlib:ZMod.addOrderOf_one` | [Mathlib/Data/ZMod/Basic.lean:122](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L122) |
| `mathlib:ZMod.unitOfCoprime` | [Mathlib/Data/ZMod/Basic.lean:794](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L794) |
| `mathlib:ZMod.coe_unitOfCoprime` | [Mathlib/Data/ZMod/Basic.lean:798](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L798) |
| `mathlib:Nat.card_zmod` | [Mathlib/SetTheory/Cardinal/Finite.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Finite.lean#L249) |
| `mathlib:Subgroup.prod` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L89) |
| `mathlib:Subgroup.prod_le_iff` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:137](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L137) |
| `mathlib:Subgroup.map_le_iff_le_comap` | [Mathlib/Algebra/Group/Subgroup/Map.lean:196](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Map.lean#L196) |
| `mathlib:OpenSubgroup.comap` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L217) |
| `mathlib:OpenSubgroup.prod` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:160](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L160) |
| `mathlib:Subgroup.quotient_finite_of_isOpen` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:289](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L289) |
| `mathlib:MonoidHom.eqLocus` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:388](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L388) |
| `mathlib:ConjAct` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L43) |
| `mathlib:ConjAct.toConjAct` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:76](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L76) |
| `mathlib:ConjAct.toConjAct_smul` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L133) |
| `mathlib:Subgroup` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:296](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L296) |
| `mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` | [Mathlib/Topology/Algebra/ClopenNhdofOne.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ClopenNhdofOne.lean#L31) |
| `mathlib:isClopen_discrete` | [Mathlib/Topology/Clopen.lean:123](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L123) |
| `mathlib:IsClopen.preimage` | [Mathlib/Topology/Clopen.lean:90](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L90) |
| `mathlib:isClopen_iInter_of_finite` | [Mathlib/Topology/Clopen.lean:78](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L78) |
| `mathlib:Subgroup.Normal.conj_mem'` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:638](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L638) |
| `mathlib:FixedPoints.mem_subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:208](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L208) |
| `tauceti:TauCeti.ContCohomology.descendZ1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:291](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L291) |
| `tauceti:TauCeti.ContCohomology.coe_descendZ1_apply_mk` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:315](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L315) |
| `tauceti:TauCeti.ContCohomology.explicitInfl1_descendZ1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:323](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L323) |
| `mathlib:QuotientGroup.induction_on` | [Mathlib/GroupTheory/Coset/Defs.lean:172](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L172) |
| `mathlib:MulAction.coe_quotient_smul_fixedPoints` | [Mathlib/GroupTheory/GroupAction/OfQuotient.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/OfQuotient.lean#L34) |
| `mathlib:coe_smul_fixedPoints_of_normal` | [Mathlib/GroupTheory/GroupAction/SubMulAction.lean:612](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/SubMulAction.lean#L612) |
| `mathlib:QuotientGroup.eq_one_iff` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:120](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L120) |
| `mathlib:QuotientGroup.mk_mul` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:163](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L163) |
| `mathlib:QuotientGroup.isQuotientMap_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:40](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L40) |
| `mathlib:Topology.IsQuotientMap.continuous_iff` | [Mathlib/Topology/Maps/Basic.lean:360](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L360) |
| `mathlib:MulAction.orbitRel_apply` | [Mathlib/GroupTheory/GroupAction/Defs.lean:294](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L294) |
| `mathlib:MulAction.mem_orbit_iff` | [Mathlib/GroupTheory/GroupAction/Defs.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L55) |
| `mathlib:inv_smul_smul` | [Mathlib/Algebra/Group/Action/Defs.lean:499](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L499) |
| `mathlib:continuous_subtype_val` | [Mathlib/Topology/Constructions.lean:380](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L380) |
| `mathlib:Continuous.comp` | [Mathlib/Topology/Continuous.lean:115](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Continuous.lean#L115) |
| `mathlib:Subgroup.continuousSMul` | [Mathlib/Topology/Algebra/MulAction.lean:270](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L270) |
| `mathlib:QuotientGroup.isOpenQuotientMap_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L55) |
| `mathlib:IsOpenQuotientMap.prodMap` | [Mathlib/Topology/Constructions/SumProd.lean:647](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L647) |
| `mathlib:IsOpenQuotientMap.id` | [Mathlib/Topology/Maps/OpenQuotient.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L35) |
| `mathlib:IsOpenQuotientMap.continuous_comp_iff` | [Mathlib/Topology/Maps/OpenQuotient.lean:64](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L64) |
| `mathlib:continuous_induced_rng` | [Mathlib/Topology/Order.lean:781](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Order.lean#L781) |
| `mathlib:Continuous.smul` | [Mathlib/Topology/Algebra/MulAction.lean:135](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L135) |
| `mathlib:continuous_fst` | [Mathlib/Topology/Constructions/SumProd.lean:68](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L68) |
| `mathlib:continuous_snd` | [Mathlib/Topology/Constructions/SumProd.lean:104](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L104) |
| `mathlib:Equiv.ofBijective` | [Mathlib/Logic/Equiv/Defs.lean:820](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L820) |
| `mathlib:Equiv.apply_symm_apply` | [Mathlib/Logic/Equiv/Defs.lean:248](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L248) |
| `mathlib:Equiv.symm_apply_apply` | [Mathlib/Logic/Equiv/Defs.lean:250](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L250) |
| `mathlib:Equiv.injective` | [Mathlib/Logic/Equiv/Defs.lean:178](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L178) |
| `mathlib:CategoryTheory.Limits.Types.FilteredColimit.isColimitOf` | [Mathlib/CategoryTheory/Limits/Types/Filtered.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Types/Filtered.lean#L59) |
| `mathlib:OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:421](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L421) |
| `mathlib:CategoryTheory.IsFiltered` | [Mathlib/CategoryTheory/Filtered/Basic.lean:95](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtered/Basic.lean#L95) |
| `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso` | [Mathlib/CategoryTheory/Limits/IsLimit.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L159) |
| `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp` | [Mathlib/CategoryTheory/Limits/IsLimit.lean:168](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L168) |
| `mathlib:CategoryTheory.Limits.limit.isLimit` | [Mathlib/CategoryTheory/Limits/HasLimits.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L217) |
| `mathlib:CategoryTheory.Iso.toEquiv` | [Mathlib/CategoryTheory/Types/Basic.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Types/Basic.lean#L416) |
| `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientTransition1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean:150](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean#L150) |
| `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientColimit1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean:493](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean#L493) |
| `mathlib:MonoidHom.comp` | [Mathlib/Algebra/Group/Hom/Defs.lean:779](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L779) |
| `mathlib:MonoidHom.id` | [Mathlib/Algebra/Group/Hom/Defs.lean:750](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L750) |
| `mathlib:MonoidHom.comp_apply` | [Mathlib/Algebra/Group/Hom/Defs.lean:806](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L806) |
| `mathlib:MonoidHom.one_apply` | [Mathlib/Algebra/Group/Hom/Defs.lean:1026](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L1026) |
| `mathlib:map_mul` | [Mathlib/Algebra/Group/Hom/Defs.lean:326](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L326) |
| `mathlib:map_inv` | [Mathlib/Algebra/Group/Hom/Defs.lean:440](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L440) |
| `mathlib:map_one` | [Mathlib/Algebra/Group/Hom/Defs.lean:234](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L234) |
| `mathlib:Subgroup.subtype` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:563](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L563) |
| `mathlib:MulDistribMulAction.compHom` | [Mathlib/Algebra/GroupWithZero/Action/End.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Action/End.lean#L50) |
| `mathlib:MulAction.continuousSMul_compHom` | [Mathlib/Topology/Algebra/MulAction.lean:252](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L252) |
| `mathlib:MulEquiv.refl` | [Mathlib/Algebra/Group/Equiv/Defs.lean:259](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L259) |
| `mathlib:Quotient.congr` | [Mathlib/Logic/Equiv/Defs.lean:884](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L884) |
| `mathlib:Equiv.trans` | [Mathlib/Logic/Equiv/Defs.lean:161](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L161) |
| `mathlib:Equiv.symm` | [Mathlib/Logic/Equiv/Defs.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L145) |
| `mathlib:MulEquiv.trans` | [Mathlib/Algebra/Group/Equiv/Defs.lean:405](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L405) |
| `mathlib:MulEquiv.symm` | [Mathlib/Algebra/Group/Equiv/Defs.lean:285](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L285) |
| `mathlib:MulEquiv.symm_apply_apply` | [Mathlib/Algebra/Group/Equiv/Defs.lean:328](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L328) |
| `mathlib:MonoidHom.ker` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:238](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L238) |
| `mathlib:MonoidHom.mem_ker` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L249) |
| `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | [Mathlib/GroupTheory/QuotientGroup/Basic.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Basic.lean#L159) |
| `mathlib:Homeomorph.isQuotientMap` | [Mathlib/Topology/Homeomorph/Defs.lean:241](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L241) |
| `mathlib:Topology.IsQuotientMap.comp` | [Mathlib/Topology/Maps/Basic.lean:336](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L336) |
| `mathlib:QuotientGroup.mk'` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L88) |
| `mathlib:QuotientGroup.mk_surjective` | [Mathlib/GroupTheory/Coset/Defs.lean:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L165) |
| `mathlib:Continuous.subtype_mk` | [Mathlib/Topology/Constructions.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L416) |
| `mathlib:MulEquiv` | [Mathlib/Algebra/Group/Equiv/Defs.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L75) |
| `mathlib:MonoidHom.ofInjective` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:205](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L205) |
| `mathlib:Topology.IsEmbedding.continuous` | [Mathlib/Topology/Maps/Basic.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L249) |
| `mathlib:Topology.IsInducing.isTopologicalGroup` | [Mathlib/Topology/Algebra/Group/Basic.lean:275](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Basic.lean#L275) |
| `mathlib:MulAction.stabilizer` | [Mathlib/GroupTheory/GroupAction/Defs.lean:515](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L515) |
| `mathlib:MulAction.mem_stabilizer_iff` | [Mathlib/GroupTheory/GroupAction/Defs.lean:524](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L524) |
| `mathlib:MonoidHom.liftOfSurjective` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:941](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L941) |
| `mathlib:MonoidHom.liftOfRightInverse_comp_apply` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:946](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L946) |
| `mathlib:MulAction.toPermHom` | [Mathlib/Algebra/Group/Action/End.lean:184](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L184) |
| `mathlib:MulAction.compHom` | [Mathlib/Algebra/Group/Action/Hom.lean:48](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Hom.lean#L48) |
| `mathlib:Equiv.Perm.sign` | [Mathlib/GroupTheory/Perm/Sign.lean:357](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L357) |
| `mathlib:Equiv.Perm.sign_surjective` | [Mathlib/GroupTheory/Perm/Sign.lean:424](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L424) |
| `mathlib:Set.equivOfEq` | [Mathlib/Logic/Equiv/Set.lean:51](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Set.lean#L51) |
| `mathlib:Equiv.subtypeEquiv` | [Mathlib/Logic/Equiv/Basic.lean:263](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Basic.lean#L263) |
| `mathlib:Homeomorph` | [Mathlib/Topology/Homeomorph/Defs.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L43) |
| `mathlib:Torsor` | [Mathlib/Algebra/Torsor/Defs.lean:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Torsor/Defs.lean#L70) |
| `mathlib:IsTopologicalTorsor` | [Mathlib/Topology/Algebra/Group/Torsor.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L35) |
| `mathlib:Homeomorph.smulConst` | [Mathlib/Topology/Algebra/Group/Torsor.lean:100](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L100) |
| `mathlib:MulOpposite.opHomeomorph` | [Mathlib/Topology/Algebra/Constructions.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Constructions.lean#L50) |

---

## Prior checkpoint report (retained historical record)

The following is codex-CS32rR's report before this continuation. Its current-count
wording and hashes describe that checkpoint. Its unfinished-review scope and
remaining obligations continue except where this pass explicitly advances them.

## Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue #526, job `REV-AnabelianGeometryAndNonabelianChabauty`. Current reviewer:
Codex `codex-CS32rR`, 2026-10-05. Input explorer commit:
`c5c5af2032b33bc80d5a0353e4abefe392b1d922`, including the earlier independent
review checkpoint [#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170)
by `codex-rkkbhf`. Neither reviewer session authored the blueprint.

**This review is unfinished.** No top-level `review` object or acceptance
verdict is written. The packet's `complete` status means a budget-complete
planning pass, not a completed review. NC.0 and NC.3 remain partial; the other
five stages remain not_read. Every implementation status is `unchecked`.

The current packet has 363 nodes: 4 definitions, 60 constructions, 265 lemmas,
27 theorems and 7 comparisons. The checker counts 320 API entries and 250 tests
on definitions/constructions; across all node kinds there are 340 API entries
and 264 tests. There are 160 baseline declarations, 17 supplier requests,
10 gaps and 11 planets. This checkpoint adds one definition node, five
baseline entries and one comparison gap. It removes no baseline citation and
changes no supplier ownership or stage status.

### Corrections in this checkpoint

1. Added `NC.3/equivariant-topological-torsors`, marked
   `addedBy: REV-AnabelianGeometryAndNonabelianChabauty`. The classification
   theorem previously introduced its torsor object without a definition node,
   API or tests. The new node reuses native `Torsor Uᵐᵒᵖ P` and
   `IsTopologicalTorsor P`, adding the compatible G-action and semilinearity.
   It specifies a **nonempty** topological carrier,
   jointly continuous right U- and left G-actions, homeomorphic orbit maps,
   and the semilinearity law. A continuous free transitive action alone does
   not ensure the topology has a continuous orbit inverse.
2. Added the actual `Torsor.Iso`: a native homeomorphism preserving both
   actions, with extensionality, identity, inverse and composition. Added its
   `isoSetoid`, whose relation is `Nonempty (P.Iso Q)`. The prototype now has
   `classOf_eq_classOf_iff` and
   `classification : Quotient (Torsor.isoSetoid G U) ≃ H1 G U`, with the
   quotient evaluation formula. The earlier class map and surjectivity alone
   did not express injectivity on isomorphism classes.
3. Added the orbit homeomorphism by composing native
   `MulOpposite.opHomeomorph` and `Homeomorph.smulConst`, rather than rebuilding
   the underlying torsor action or division. Added the cocycle model and coordinate homeomorphism,
   the right/left coordinate formulas, point-cocycle specification,
   change-of-point formula, preservation by isomorphisms, model cocycle and
   class-map evaluation. A coordinate homeomorphism avoids identifying
   carriers in different universes by an ill-typed equality. The new definition
   has 18 API entries and five typed tests; the classification theorem has
   eight API entries. All corresponding forms are in the suggested file.
4. Added the separate algebraic-torsor comparison gap and qualified the
   classification theorem's geometric acceptance items. Kim's Proposition 1
   classifies filtered affine-algebra torsors, whereas this node is an authored
   topological abstraction of its pointwise argument. Poonen's algebraic
   classification additionally uses Galois descent. A point-space class map
   cannot establish scheme isomorphism or descent/effectivity by itself.
5. Supplied four typed examples for the inherited test names
   `tests.invariants`, `tests.continuity` and `tests.h1_abelian`: negation versus
   trivial C₂-action on ℤ; countably many continuous C₂-characters of the
   countable product versus uncountably many abstract characters; and neutral
   H¹ for C₂ acting by negation on C₃. The action hypotheses are explicit.
6. Supplied the four missing twisting tests. The trivial twist checks its
   action and cocycle evaluations and compatibility with the class map; the
   commutative case checks the original action and translation by c. For
   discrete C₂ acting trivially on S₃ with c(generator)=(01), the twisted
   invariants have cardinality 2, the original invariants have cardinality 6,
   and the twist equivalence carries the neutral point to a nonneutral class.
   The discrete topology, trivial original action and transposition hypotheses
   are retained. Reconciled the omission ledger for these actual examples and
   for already present instances/tests; unrelated omissions remain open.
7. Corrected the reserved K(π,1) node's Schmidt–Stix locator: the cohomological
   criterion is in the **proof** of Lemma 2.7(b), not its statement. Added
   Achinger's version-of-record Definition 4.1 as the direct source for the
   canonical all-degree, all-finite-coefficient predicate, with its coherent
   scope distinguished from the packet's wider parameterized predicate.
8. Visually inspected the scanned degree diagram in Schmidt 1996,
   Proposition 15, printed pp.243–244, and updated the gap's obsolete
   uninspected-diagram wording. The diagram's degree-two restriction is
   multiplication by the covering degree. This does not close the generic
   cohomology, curve-degree or descent suppliers. Replaced the packet's
   outdated summary counts and recorded the current checkpoint in NC.3's
   remaining work.

The previous checkpoint's corrections are retained: `MulAction.toPerm` versus
`toPermHom`; acting-subgroup continuity; `Z1.mem_iff` and the named identity
instance; the actual conjugation-action target of `H1.equivOfTrivial`;
`Z1/H0.equivContCohomology`; named twisted continuity and `Twist.self`; the
four-cocycle/two-class S₃ tests; Kim Albanese §4's locator; and the duplicate
coefficient-map dependency. Its original report remains accessible in #6170.
Historical encoded recovery payloads and receipts are preserved; their build
claims are not independent review evidence.

### Fresh mathematical and source checks

The torsor calculation fixes the order conventions: gp=p·cₚ(g),
cₚ(gh)=cₚ(g)g(cₚ(h)), and cₚᵤ=u⁻¹·cₚ under the existing gauge action
u·c(g)=u c(g)g(u)⁻¹. The model is g⋆x=c(g)g(x), and gauge-related models
are isomorphic by the corresponding left translation. An equivariant
homeomorphism preserves the point cocycle. Conversely, equal gauge classes
identify suitably changed point cocycles, and the two orbit homeomorphisms
produce the required isomorphism. A fixed point is exactly a point with trivial
cocycle. These arguments justify the added abstract signatures, without
claiming their `sorry` proofs are implemented.

Fresh reading included Kim's §1, Propositions 1–3 and proofs on printed pp.5–10
of [arXiv v1](https://arxiv.org/pdf/math/0409456v1), the selected torsor
passages in [Poonen](https://math.mit.edu/~poonen/papers/Qpoints.pdf),
Schmidt–Stix §2.3, pp.826–828 in the
[Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
Achinger [2017 §4](https://link.springer.com/article/10.1007/s00222-017-0733-5),
FKW [v2 §2.3.1 and §3.2.2](https://arxiv.org/pdf/2110.05534v2), and the actual
[Schmidt 1996 pages](https://www.numdam.org/article/CM_1996__100_2_233_0.pdf).
The acquired PDFs match the retained packet hashes. This is selected reading,
not whole-paper or all-locator certification.

The reserved `key/etale-k-pi-1` occurs once. Its API/tests cover the inventory's
field, P¹ obstruction, affine and positive-genus curves, characteristic-zero
products, Artin towers/M₀,n and the qualified raw-homotopy comparison. It uses
the canonical comparison in every degree for each permitted coefficient;
p-primary coefficients retain the full fundamental group. The cited raw equivalence retains Achinger's
geometrically-unibranch hypothesis. FKW's constant-Fₚ edge comparison and its specially justified pro-p
inflation are separate inputs. The corresponding geometric Lean interfaces
remain explicit omissions, rather than dummy proposition carriers.

Selected Stacks statements and proofs were checked at tags
[03QQ](https://stacks.math.columbia.edu/tag/03QQ),
[03RQ](https://stacks.math.columbia.edu/tag/03RQ),
[0AMB](https://stacks.math.columbia.edu/tag/0AMB),
[03RR](https://stacks.math.columbia.edu/tag/03RR),
[03PL](https://stacks.math.columbia.edu/tag/03PL),
[03P8](https://stacks.math.columbia.edu/tag/03P8),
[0BA0](https://stacks.math.columbia.edu/tag/0BA0),
[03RP](https://stacks.math.columbia.edu/tag/03RP),
[03RV](https://stacks.math.columbia.edu/tag/03RV),
[09YQ](https://stacks.math.columbia.edu/tag/09YQ) and
[07RR](https://stacks.math.columbia.edu/tag/07RR).
The comparison needs the canonical Kummer boundary and degree pullback, not an
arbitrary H² isomorphism. Separable descent needs both eventual cover descent
and eventual zero of a class; continuity does not make restriction injective.
Generic proofs used by these statements, the full curve section, Künneth and
finite-presentation descent have not been read to closure.

### Baseline, ownership and limits

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Lean sources were read from those
git objects. The five new entries are native `Homeomorph`
(`Mathlib/Topology/Homeomorph/Defs.lean:43`), `Torsor`
(`Mathlib/Algebra/Torsor/Defs.lean:70`), `IsTopologicalTorsor` and
`Homeomorph.smulConst` (`Mathlib/Topology/Algebra/Group/Torsor.lean:35,100`),
and `MulOpposite.opHomeomorph` (`Mathlib/Topology/Algebra/Constructions.lean:50`).
Their complete statements and bodies were read; there is no finiteness or
separation assumption. The equivariant bundle uses the native torsor and
continuity classes. Native scalar division supplies the continuous orbit inverse,
and the orbit homeomorphism is the actual native composition.

Selected inherited declarations were reread with context, including LowDegree
cochain signs, native continuous cohomology, Shapiro, subgroup actions,
quotient/embedding continuity and finite-quotient transitions/colimits. A
basename search can accidentally find another namespace's declaration;
qualified embedding, quotient-map and action-continuity statements were
inspected separately. This is not a completed audit of all 160 citations
against every consumer. Incoming `checked` receipts remain attributed to their
original authors, not silently converted into this review's verdicts.

Read the seven reviewed library audit records, supplier stage descriptions and
current SF/IG packet inventories. SF.2 is accepted but partial and its current
nodes chiefly cover other owned targets; SF.3 and IG.0/IG.1/IG.6 have no
completed relevant fine-grained supply here. Their requests remain contracts,
not established results. ProfiniteCohomology Layer 10 explicitly owns the
all-degree finite-quotient colimit; the native degree-one additive theorem is
not the arbitrary nonabelian or geometric comparison. The AlgebraicTopology
and JacobianChallenge upstream documents were read as granularity/boundary
comparators. No supplier file, roadmap reader or atlas data was edited.

`sourceIssues` remains empty. No source-error verdict is asserted; the complete
screen remains unfinished. Planet naming and every remaining node's source,
closure, API, tests and typed prototype still need the detailed independent
review described in the handoff.

### Validation

The packet checker reports **0 errors and 0 warnings**. `git diff --check`
passes. The full suggested file was attempted with `lean-check`; import failed
because the existing pinned build lacks
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library build, update, cache download or language server was started.

The final temporary Mathlib-only projection removes exactly `import TauCeti.*`
lines and the whole `section Abelian` through `end Abelian`. It elaborated with
`lean-check`, exit code 0: **690 warnings, all uses of `sorry`**, no errors or
other warnings. Available memory was 95 GiB before that check. This checks the
prototype forms, not their proof correctness, and excludes the additive
comparisons. The full suggested file remains uncompiled.

Projection SHA-256:
`3c673ea43f7d115078d17426699c2a8db4f38aafa73e6a44596e9b8b44494a57`.
Suggested file SHA-256:
`7d153ef927b6b1637f5dba083e4b65566e041afb238b8fb5db4e889699e2cb15`.

### Questions for the orchestrator

- Does IG.0's remit explicitly include the geometric product theorem and P¹
  fundamental-group computation, beyond its finite-étale fibre-functor
  dictionary? The requests retain these precise contracts but the current
  finer packet has not supplied them.
- Reconcile the unaccepted EtaleHomotopyTypes candidate with the generic raw
  homotopy/fibration foundations; it cannot be treated as a registered supplier
  or depend on the NC.0 consumer for its generic inputs.

No final verdict should be inferred from this checkpoint.
