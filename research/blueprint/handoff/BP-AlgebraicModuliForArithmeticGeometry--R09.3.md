# Handoff: R09.3 target plan

Issue #6335, job `BP-AlgebraicModuliForArithmeticGeometry--R09.3`, completed by
Codex, session `codex-alR04q`, on 2026-10-09. Branch: `codex-alR04q-r09-3`.
The claim was confirmed by the bot before work began. This run takes one job.

## Completed pass and coverage

The packet is **complete** as a target-level planning pass. The only scoped
stage, `AlgebraicModuliForArithmeticGeometry:R09.3`, is **planned**, not closed.
All narrowed targets have statements, proof routes, source matches and direct
prerequisites. No implementation is certified; every node remains unchecked.
No scoped stage is closed.

The four deliverables agree: packet, reader, suggested file and this handoff.
There are 13 new nodes: two definitions, seven theorems and four comparisons;
18 definition API items, seven discriminating unit tests, six planets and
19 pinned Mathlib declarations. The seven tests preserve the structural map
to the base. Empty and split-source relative-Hom tests include the target's
sheaf condition, which arbitrary presheaves do not satisfy.

The accepted `AlgebraicModuliForArithmeticGeometry--A0-extension.json` has
38 R09.3 nodes. Their IDs are retained as imports rather than copied or
changed. In particular, coherent descent consumes its
`space-fpqc-quasicoherent-descent`, `finite-presentation-module-descent` and
`finite-locally-free-descent` nodes. Their mathematical plans and unchecked
proof/interface obligations remain visible; acceptance of that predecessor
was not a certification of Lean proofs.

## Ownership and confirmed findings

- Finding RT-AREA-algebraicgeometry/1: SF.1 supplies the sole general space and
  stack carriers, quotient sheaves, products, atlases, properties, small étale
  ringed site and general space/module descent. The restructure entry records
  SF.1 → R09.3. R09.4 retains its own moduli-stack applications. Neither general
  algebraic spaces nor stacks are defined again here.
- Finding /10: MC0C supplies effective finite locally free scheme quotients;
  MC0E supplies finite objects, groups, subgroups, torsors, sections and
  polarized projective relative curves; SR Layer 2 supplies étale polarized
  schemes. R09.3 adds the quotient and structured-descent comparisons.
- Finding /11: MC0F retains affine finitely presented restriction and its
  base change. RG2.0a's `weil-restriction-representing-algebra` is verified to
  cover arbitrary algebras over a finite projective extension. That stronger
  affine input is essential for the unrestricted algebraic-space target in
  05Y7/05YF. R09.3 supplies the space extension and compatible base change,
  without another coordinate algebra or torus construction.
- Finding /12: relative Proj, ampleness and polarized scheme descent remain
  SR Layer 2 imports. R09.1's MC0G Grassmannian and SR imports are recorded at
  the boundary; no R09.1 deliverable is edited.

Proper GAGA belongs to downstream `ComplexComparisonPartII:C3`; the
predecessor's mention of it cannot become an upward prerequisite. R09.3
exports coherent étale presentation descent. R09.2 retains proper
modifications, Chow arguments and coherent dévissage. No new analytic target
is planned in this issue. This ownership decision should be retained when
those consumers are updated.

The SF.1 and RG2.0a supplier node statements were read. No SF.1 node has an
R09.3 prerequisite, and the RG affine construction has no dependency on these
new space targets. The supplier plans themselves remain unchecked. In
particular SF.1's space-fppf-descent records a uniform-universe/site-size gap;
this packet imports its target statement without asserting that gap is
resolved. The new SF requests must be supplied without a reverse edge through
R09.3 restriction algebraicity.

## Exact remaining work

Four gap groups prevent closure. They are recorded in the packet's `gaps`
and the stage's `remaining` list.

1. **Section-space supplier tools.** There is no exact SF.1 node for the
   finite-part theorem, Stacks *More on Groupoids in Spaces*, §12,
   Proposition 12.11 (04QH), p.19, or for the open isomorphism locus,
   *More on Morphisms of Spaces*, §49, Lemma 49.6 (05XD), p.122. Supply these
   on the common space carrier. The former requires a separated locally
   finite type map. The latter requires the source to be flat, locally of
   finite presentation and universally closed, and the target to be
   separated, closed and locally of finite type. They feed 05XR and hence
   relative-Hom and Weil-restriction algebraicity.
2. **General polarized supplier.** Extend SF.1 to fppf descent of proper
   finitely presented schemes with a specified relatively ample invertible
   sheaf and compatible object and line-bundle cocycles. Include all
   polarized morphisms, sections, refinement and arbitrary-base-change
   coherence. Its existing quasi-projective descent is restricted to
   finite locally free base covers. MC0E's curve and SR's étale cases do not
   fill this broader domain. Use the separately supplied space algebraicity
   theorem and ampleness descent 0D3C to recover a scheme. Do not infer a
   global projective-space embedding from the local-on-base convention.
3. **Inherited native adapters.** Reconcile the 38 predecessor nodes with
   SF.1's `qcoh-pseudofunctor` and `qcoh-fpqc-descent`, preserving their IDs.
   The frontier includes extension coordinates, diagonal/triple overlap
   comparisons, chosen-overlap equivalence, the native canonical descent
   comparison, equalizer/counit identification and transport of the native
   extension/restriction adjunction to the chosen pullback adjunction.
   Transport comultiplication, coalgebras and the comparison functor;
   a natural isomorphism of right functors alone is insufficient.
4. **Three native signature specializations.** The full signatures for
   `coherentPresentationDescent`, `polarizedDescentComparison` and
   `finiteModuliDescentComparison` require absent supplier declarations.
   Their complete mathematical specifications appear under their full names
   in suggested-file comments and as packet nodes. They must become actual
   declarations using the single small-étale module, polarized-pair and
   structured-object carriers. They are honest omissions under PROTOCOL §13,
   without opaque conditions or private stand-in carriers. Compilation of
   the present file does not validate these three missing signatures.

The packet has six requests. Four import existing supplier stages unchanged:
MC0C, MC0E, MC0F and SR Layer 2. Two request the exact SF.1 extensions in
items 1 and 2 above. No source-reading gap is used in place of these precise
mathematical or native-interface gaps. Independent review should check the
pointwise base-change characterization, unrestricted affine input, all
coherent-module morphisms and the compatibility domains before acceptance.

## Library and upstream audit

Pinned baseline: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Each cited declaration's
statement was read in the pinned source tree. Native relative
representability, Yoneda, the sites and map-property predicates are used
in the suggested file.

The current read-only TauCetiRoadmap main inspected was
`3b51bbf9a925f23bca922570bea8d641b6ec712d`; current TauCeti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. StableReduction and
AlgebraicVectorBundles READMEs were read in full, along with the latter's
Suggested.lean; MC0C/0E/0F/0G contracts were read. No build was run there.

AlgebraicVectorBundles L0A/L0B, absent from the atlas snapshot, already owns
module pullback, monoidal coherence and quasi-coherent/finite locally free
wrappers; L1 owns relative Spec. Current TauCeti
`AlgebraicGeometry/Modules/Pullback/Basic.lean` contains
`Scheme.Modules.isQuasicoherent_pullback`, `isFinitePresentation_pullback`,
`pullbackObjUnitIso`, `restrictPullbackObjIso`, the over-category comparison
and coherence. `Pullback/Affine.lean` contains the tensor comparisons. Reuse
these interfaces when rebasing inherited adapters; no fresh pullback or
relative Spec targets are added here.

Current `Quotient/Affine.lean` and `Quotient/FiniteGroup/Affine.lean` provide
invariant-ring spectrum quotients, affine-target universality and
integrality/finiteness. They do not by themselves identify a nonfree action
with its fppf orbit sheaf. The sign action on the affine line is a negative
acceptance case: zero and a nonzero dual-number nilpotent have identical
squares but cannot become translates after a faithfully flat extension.
The native finite-quotient signature therefore requires the actual fppf
cover and kernel pair.

## Sources read and corrections

All sources needed for the narrowed mathematical targets were freely
available. No restricted library source was copied or used. The packet
records public chapter URLs, access date 2026-10-09 and SHA-256 hashes.
Locators use printed chapter-local pages plus stable tags.

- *Criteria for Representability*: §9, 05XQ/05XR, pp.12–14; §10,
  05Y1–05Y7, pp.14–16; §11, 05Y8–05YF, pp.16–18. These proof routes were
  read, including the nonseparated section argument and unrestricted atlas
  reduction.
- *More on Morphisms*: §68, 05Y6/0BL3, pp.208–209; arbitrary generators
  and relations and finite locally free gluing.
- *Algebraic Spaces*: §6, 025Y, p.8; §7, 04T9, p.10; §9, 0262, p.12.
- *Groupoid Schemes*: §20, Definition 20.1 and Lemma 20.3, 02VG/03C5,
  pp.39–40; the general quotient-sheaf representability criterion. The
  étale presentation lemma 0262 is used only for that specialization.
- *Descent and Algebraic Spaces*: §4, 04W8, pp.3–4; §6,
  060U–060X, pp.5–6; §13, 0D3C, pp.21–22; §23, 0ADT, pp.35–36.
  **0ADT identifies a datum with a sheaf and characterizes effectiveness;
  it does not independently prove all fppf space descent.** SF.1 supplies
  that algebraicity input separately.
- *Cohomology of Algebraic Spaces*: §12, 07UA–07UC, pp.18–19;
  coherence on locally Noetherian spaces and its abelian category.
- *More on Groupoids in Spaces*: §12, finite-part functor and
  Lemmas 12.1/12.7–12.10, Proposition 12.11, pp.13–19.
- *More on Morphisms of Spaces*: §49, 05XD, p.122.
- Existing MC0C/0E/0F, SR Layer 2 and AlgebraicVectorBundles contracts,
  together with the reviewed library audit and all relevant stage links,
  accepted restructurings and predecessor node statements.

Three relevant source slips are recorded in authored descriptions under
`sourceIssues`: the order of composition W→Z→U in 05XQ, the separated
atlas maps W′→W and W′→Z in the general step of 05XR, and its undefined
base letter. Current tag pages and comments were checked; no correction was
identified in the versions read. These are reading corrections, not a claim
of a new mathematical error. No source passage or source-by-source chapter
summary is included in the deliverables.

## Verification and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.3.json`:
  **zero errors and zero warnings**.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.3.lean`:
  **exit 0 at the pinned baseline**, with placeholder-proof warnings only.
  One check was run at a time after verifying available memory. No language
  server or library build was started. Native right-adjoint uniqueness,
  unit/counit compatibility and faithfully flat comonadicity are imported
  fixtures with their existing proofs; all new targets remain unchecked.
- Definition/API/test-name and source-pointer consistency, internal and
  supplier prerequisite directions, allowed-path restrictions and
  `git diff --check` were checked before submission.

Resume from the four gap groups and their exact supplier nodes or requests.
The independent review and any refinement must preserve the ownership
boundaries, inherited IDs and planned-not-closed status until those inputs
are discharged. No scratch file is needed to resume this job.
