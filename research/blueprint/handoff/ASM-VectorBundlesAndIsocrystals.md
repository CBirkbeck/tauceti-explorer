# Handoff: ASM-VectorBundlesAndIsocrystals

Completed assembly of issue #261 by Codex (GPT-6), session `codex-cWBom8`, 7 October 2026. This is a complete assembly submission, not a checkpoint. The task is to join and reconcile the reviewed plans; their recorded supplier and construction-level proof obligations remain open.

## Completed deliverables

- [Full reader](../readmes/VectorBundlesAndIsocrystals.md): purpose, ownership boundaries, conventions, layer overview, acyclic declaration-level proof order, pinned library baseline, edition-aware bibliography, and VB0–VB4 contracts in part order. All 127 nodes, 168 API items, 124 planned tests and 35 planets are preserved. Node sections use the independently corrected packets rather than the stale part readers. All 33 source corrections retain their stable IDs and independent provenance.
- [Full suggested Lean file](../suggested/VectorBundlesAndIsocrystals.lean): one standard note, one deduplicated import block, the existing `TauCeti.FFBundles` and `TauCeti.BanachColmez` namespaces in separate lexical sections, and both exact omission indexes. Reviewed component bodies and names are preserved; no new mathematical theorem or arbitrary proposition surrogate is introduced.
- This handoff collects all 32 supplier requests and six restructuring proposals verbatim, alongside validation and review limits.

The two part packets needed no edit. Every same-roadmap prerequisite already resolves to an exact node, and the combined direct graph is acyclic. No reviewed node statement, hypothesis, proof outline, API, test, status, ownership or review verdict changed. No mathematical change is presented as a reader-only edit.

## Validation and provenance

- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json research/blueprint/packets/VectorBundlesAndIsocrystals--VB3.json`: both packets report **0 errors and 0 warnings**; all ten stage records remain `planned`, none `closed`.
- `python3 research/blueprint/intake.py check-files` on the three new deliverables: **3 files, 0 problems**. Local Markdown links and explicit anchors are valid; duplicate source anchors were removed by merging byte-identical editions. `git diff --cached --check` passes.
- Assembly checks matched each packet statement, hypothesis, proof step, acceptance clause and API/test contract against the full reader; every API/test name occurs in the full Lean file. The 127 node IDs are unique. DFS on exact local prerequisites has no cycle or unresolved local node. Each stage is displayed in its internal prerequisite order; external and cross-stage dependencies stay explicit.
- `lean-check research/blueprint/suggested/VectorBundlesAndIsocrystals.lean`: **exit 0, 231 warnings, all `declaration uses sorry`, no errors or other warnings**. Memory was checked before the single elaboration; no background Lean process remains. This checks admitted component signatures only, not the indexed omissions or their geometric hypotheses.
- Mathlib source/build pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. The complete statements of all 29 cited baseline declarations were reread at the recorded Mathlib/Tau Ceti pins. The reviewed `data/library-coverage.json` has no dedicated VB layer entries.
- Tau Ceti source pin: `f790474821cf4256814db967cb154e7af3d0c369`. The shared compiled checkout is at `cf386627e9176a3827c1a5fe804989fd94a4d216`; its actual imported Tau Ceti closure (seven modules listed below) is byte-identical to the pin. The three unavailable modules `TauCeti.Algebra.Category.ModuleCat.Sheaf.FinitePresentation`, `TauCeti.AlgebraicGeometry.LineBundle.Basic` and `TauCeti.AlgebraicGeometry.LineBundle.Class` were read at the pin but remain commented omissions; none was rebuilt.

Imported Tau Ceti closure:

- `TauCeti.AlgebraicGeometry.AdicSpace.Cont.Basic`
- `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`
- `TauCeti.AlgebraicGeometry.AdicSpace.ValuationSpectrum`
- `TauCeti.RingTheory.Valuation.Continuous.Basic`
- `TauCeti.RingTheory.Valuation.Trivial`
- `TauCeti.RingTheory.Valuation.ValuativeRel.Basic`
- `TauCeti.RingTheory.Valuation.ValuativeRel.Comap`

The upstream Reductive groups and Hodge structures roadmap documents were read for scope and density. The Local fields and ramification and Class field theory link maps were read for the actual VB0 interfaces. Public-source hashes and edition readings are inherited from the independent reviews; this assembly does not claim a fresh independent source review. CN25's arXiv and author PDFs have distinct hashes and are kept separate. The Berkeley PDF has ten preliminary pages; use its printed locators accordingly. FF's separately paginated preface is retained in edition conventions.

## Review and integration limits; where to resume

Both part verdicts remain `needs_changes`. The full reader incorporates their corrected mathematical contracts, including the general functor's chosen k-structure, conditional torsor descent, perfected equal-characteristic affine-line input, KTheory Z.1 ownership, finite generator witness, CN countability, fibrewise semistable small-slope presentations, punctured spatial-diamond/relative-quotient distinctions and corrected source findings E31–E33. The original part readers are not deliverables of this assembly and remain unchanged; their own revision/re-review still needs to reconcile those files with the reviewed packets before promotion. This assembly does not turn either verdict into acceptance.

There is no new assembly-level mathematical gap. The 17 inherited gap records are preserved in the full reader under part-qualified IDs (the two G-LEAN records are distinct). The historical “VB3 still uses the whole VB1” clause in VB0/G-INTEGRATION has been superseded at the direct-node level by the corrected VB3 packet, and this full reader no longer has the stale-reader problem in VB3/G-COMPANION. These observations do not discharge the remaining RF3/stage integration or any companion mathematical proof obligation, so no gap was deleted from a packet.

Internal VB0 requests 11 and 12 now have exact early companion prerequisites in the VB3 packet. Request 13 is supplied by `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`, with its precise dependence on positive presentations and relative splitting. They remain in the preserved request list for provenance; they should not cause duplicate planning. All other requests require the owner contract or external integration indicated below.

For the next authorized integration/revision, start with accepted [RS-15](../restructure/RS-15.result.json) and [RS-20](../restructure/RS-20.result.json) and the two independent review reports. Apply early rank-one/partial-chart narrowing and stage-edge replacement atomically. Do not lift the direct node graph to parent stages mechanically: early basic BC → twist cohomology and VB4 → positive resolutions → general two-term BC geometry intentionally cross the displayed layer order. Keep the stable declaration IDs. Do not make classification a prerequisite for ordinary projectivized properness or use general GAGA to prove early geometric chart coverage.

Construction-level work still includes G-DM (full rational classification, including equal characteristic), G-GEOM (independent early chart-cover proof), G-HN (degree bounds and generic-fibre exactness), G-GG (general-E contraction comparison) and G-KEY (perfected-A¹ comparison). The BC part adds G-LT (crystalline Hom), G-CONTRACT (uniform evaluation/contraction bounds), G-SPATIAL (the two FS II.3.8 extensions), G-LEBRAS (construction-level full faithfulness/evaluation proof), G-HOM (bounded-image graphs), G-PATCH (ring-level purity patching), and G-INTEGRAL (integral reconstruction). G-LEAN in each part tracks unavailable geometric carriers. These are existing planned obligations, not solved formalizations.

## Supplier requests preserved from the packets

### VB0: 14 requests

#### VB0 request 1

Supplier: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Supply the completed maximal unramified coefficient field with arithmetic q-Frobenius and finite unramified extensions. Completion and ramified-Witt comparison belong to RF0; the existing unramified Frobenius theory is imported, not replanned.

Needed by:

- `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`
- `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`
- `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`

#### VB0 request 2

Supplier: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Supply the general cyclic algebra Cyc(E_h/E,arithmetic σ,π^d), its central-simple structure, the algebraic BrauerGroup ↔ cohomological H² comparison, and inv=d/h. Include restriction multiplication by total extension degree and opposite inversion. These general algebraic/arithmetic inputs are owned by Class field theory; this packet only specializes to slope labels.

Needed by:

- `VectorBundlesAndIsocrystals:VB0/slope-division-algebra`
- `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`

#### VB0 request 3

Supplier: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

Extend the existing ramified Witt universal property to its fraction field L=breve E and q-Frobenius, plus the general-E/integral tilted Robba coefficient comparison. Normalize π_E and σ_E, preserve topology and Frobenius under E′/E; equal characteristic uses R[[π]] and its fraction field.

Needed by:

- `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`
- `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`
- `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`
- `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`
- `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`
- `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`

#### VB0 request 4

Supplier: `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

Apply accepted RS-20: expose only rank-one O(n), π^{-n} sign, tensor/dual and untilt-divisor compatibility at RF3. Remove the general finite-isocrystal functor from this supplier; it is owned by VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor. No full VB1 or ampleness prerequisite is needed for rank-one descent.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`
- `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`

#### VB0 request 5

Supplier: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`.

Apply accepted RS-20: the homogeneous graded ring and maps D(g)→D_+(g) glue only on U=⋃D(g). Expose the local ring maps and overlap localization laws without claiming U=X. Early geometric coverage is VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover; general-S coverage and compatible schematic twists are VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`
- `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`
- `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`

#### VB0 request 6

Supplier: `SchemeAndStackFoundations:SF.0`.

Supply generic locally free sheaf tensor/dual/determinant and exact-sequence identities; QCoh finite-type/global-generation predicates; Proj/localization gluing; extension of sections after clearing homogeneous denominators on qcqs schemes; regular dimension-one torsion-free/coherent and finite-length DVR module facts; finite-support cohomology and affine cohomological criterion. These must apply to the non-finite-type but regular noetherian geometric curve and to the nonnoetherian relative Proj. No algebraic-curve finite-type assumption may be added.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`
- `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`
- `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`
- `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`
- `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`
- `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`
- `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`
- `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence`
- `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`
- `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`
- `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`
- `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`
- `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`
- `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`
- `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`

#### VB0 request 7

Supplier: `SchemeAndStackFoundations:SF.1`.

Supply effective finite faithfully flat/Galois descent of finite projective modules, with compatible semilinear endomorphisms, ordinary coefficient extension/restriction adjunction for finite separable field extension, and gluing of such data. V-descent on perfectoid annuli uses the D2 v-theorems in addition; ordinary fpqc descent alone does not establish the analytic v-stack. When a lifted σ′ conjugates the Galois group, require Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′; ordinary commutation is the centralizing special case.

Needed by:

- `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`
- `VectorBundlesAndIsocrystals:VB0/finite-galois-descent`
- `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`

#### VB0 request 8

Supplier: `PerfectoidQuotients:Q4`.

Supply FS II.0.2/ECD5.8: a Zariski closed subset of an affinoid perfectoid admits the universal strongly Zariski closed perfectoid quotient, surjective on the ring and almost surjective on the plus ring, compatibly with tilt. The present Q4 packet has radical quotient algebra but no exact named node for this complete geometric statement.

Needed by:

- `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`

#### VB0 request 9

Supplier: `KTheoryLowDegrees:Z.1`.

Import the existing Z.1 finite-projective presentations, split/exact K₀ universal property and stable-isomorphism criterion: kernels in finite free presentations of the same projective have equal K₀ classes and become isomorphic after finite free stabilization. Z.2 owns locally constant rank and does not supply this argument. The KL contraction route does not require this alternative stabilization argument; Frobenius compatibility remains local work.

Needed by:

- `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`

#### VB0 request 10

Supplier: `AdicEtaleGeometry:A1`.

Extend the analytic foundations with the comparison used in FS II.2.15: in mixed characteristic E-linear affine-line diamond maps come from analytic A¹ maps; in equal characteristic use the perfected analytic affine line and convergent additive series allowing fractional p-power exponents. Prove that g(πX)=πg(X) leaves only g(X)=aX, and supply the nonclassical-point/open-image step. Existing étale-site targets do not state this input. Reuse the generic diamond functor rather than duplicating it.

Needed by:

- `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`

#### VB0 request 11

Supplier: `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`.

Retarget the two-term hypercohomology definition from the entire VB1 stage to VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology and VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology. It must remain H⁰ of derived RΓ for two-term complexes; a cokernel does not define it.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`
- `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`

#### VB0 request 12

Supplier: `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`.

Provide FS II.2.2–II.2.4, including degree-one untilt divisor/evaluation sequence, connected basic positive spaces and the negative A¹/E presentation. Replace its whole-VB1 prerequisite by VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles, VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent, VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology and VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology; it must not import Tw or HN, since Tw consumes this node.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`
- `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`
- `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`
- `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`

#### VB0 request 13

Supplier: `VectorBundlesAndIsocrystals:VB4`.

Own FS II.3.4’s relative geometric-slope vanishings: negative fiber slopes imply H⁰=0; nonnegative slopes kill H¹ after pro-étale cover; positive slopes yield an étale neighborhood with vanishing on every affinoid base change. Their proofs consume VB3 positive resolutions and VB4 family trivialization. Do not route them back into the early twist-cohomology stage.

Needed by:

- `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`
- `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`

#### VB0 request 14

Supplier: `VStackSheavesAndLisseCategories:VS1`.

Consume VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras for SW20 16.3.2–16.3.6 divisor/Weil-map work. VS1 owns that construction and uses the Class field theory Layer 9 reciprocity input; this packet exports only the constant finite étale algebra theorem required by RT-AREA-geomlanglands/31. Respect the mixed-characteristic scope of the current Layer 9 reciprocity isomorphism; an equal-characteristic divisor/reciprocity use needs a separate supplier, as recorded in upstreamNotes.

Needed by:

- `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`

### VB3: 18 requests

#### VB3 request 1

Supplier: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Formal π-divisible O_E Lubin–Tate group, its Tate module, logarithm convergence and étale torsion exact sequence, in the covariant normalization F=σ/π.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`

#### VB3 request 2

Supplier: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Normalized π-divisible Dieudonné Hom comparison over R♯+/π: crystalline φ=π invariants identify with Hom_OE(E/O_E,G(R♯+/π))[1/π]; Lang/Artin–Schreier–Witt integral Frobenius trivialization. Full faithfulness alone is not an essential-surjectivity assertion.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`
- `VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`

#### VB3 request 3

Supplier: `VStackSheavesAndLisseCategories:VS1`.

Divisor-to-Weil map and local reciprocity comparison for the fundamental E×-torsor; supplier owns the Weil/étale-local-system map, this part only its BC/Lubin–Tate identification.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`

#### VB3 request 4

Supplier: `DiamondEtaleCohomology:C4`.

Taut partial properness, properness descent and valuative criteria of ECD 11.19,11.24,18.10; a surjective proper map is a v-cover on perfectoid geometric points, used by the nowhere-zero-section locus.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`
- `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`
- `VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`

#### VB3 request 5

Supplier: `DiamondSixOperations:S4`.

Cohomological smoothness is v-local and stable under composition/extension of E-module v-sheaves, with the hypotheses of ECD23.13.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`
- `VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`

#### VB3 request 6

Supplier: `DiamondSixOperations:S5`.

Perfectoid balls, locally profinite torsor quotients and scalar quotient examples; ECD24.2, including cohomologically smooth dimension and additivity through the BC presentations.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`
- `VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`
- `VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`
- `VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`

#### VB3 request 7

Supplier: `DiamondsAndVStacks:D5`.

Extend the existing spatial-v-sheaf criterion to FSII.3.8: a surjective qcqs cohomologically smooth map from a spatial diamond to a small v-sheaf makes the target spatial; a COVER by locally closed GENERALIZING spatial-diamond sub-v-sheaves makes a spatial v-sheaf a spatial diamond. Do not omit coverage or generalizing hypotheses.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`
- `VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`
- `VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients`

#### VB3 request 8

Supplier: `DiamondsAndVStacks:D3`.

Pro-étale sites of perfectoid spaces and finite-rank coefficient local systems, with effective sheaf/tensor descent; the specialized locally profinite torsor theorem is imported by node id.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/twisted-local-systems`
- `VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`
- `VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category`

#### VB3 request 9

Supplier: `PadicHodgeTheory:R06.1`.

Period Rings as functors on sympathetic algebras (BdR⁺,BdR,Bcris⁺ and their reductions), compatible evaluation and completion/filtration maps. No abstract replacement of these Rings by arbitrary VS targets.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/curvature`
- `VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`

#### VB3 request 10

Supplier: `PadicHodgeTheory:R06.2`.

Admissible rank-two supercuspidal (φ,N,G_F)-module realization and the representation input used alongside X_st⁺ Dimension in CDN Lemma2.7.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example`

#### VB3 request 11

Supplier: `PerfectoidSpaces:P3`.

Tilting/untilting equivalence of finite étale sites for the integral Frobenius comparisons and inverse perfection; finite-étale completed limit control.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`

#### VB3 request 12

Supplier: `RelativeFarguesFontaine:RF0:integral-Y`.

Integral Y_[0,r] with characteristic-p boundary, Frobenius-inverse equivariance, and comparison with the open Y_(0,r]; the boundary integral period rings W(R) and integral Robba sheaves.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/integral-boundary-realization`
- `VectorBundlesAndIsocrystals:VB4/integral-group-torsors`

#### VB3 request 13

Supplier: `RelativeFarguesFontaine:RF1`.

KL relative schematic FF_X over affinoid perfectoid untilts, compatible with Proj(P_R) and with perfectoid pullback. The E-general adic curve is already imported via companion node contracts.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/relative-ampleness`

#### VB3 request 14

Supplier: `SchemeAndStackFoundations:SF.0`.

Generic torsion-pair tilt heart inside the existing bounded derived category, its abelianness and triangular Hom/Ext¹ description; finite-support coherent sheaves on a regular curve are hereditary (Ext²=0). Keep this generic derived machinery in SF.0.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart`

#### VB3 request 15

Supplier: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

Arithmetic Lubin–Tate module and reciprocity normalization; BC carries only the geometric universal-cover comparison.

Needed by:

- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`

#### VB3 request 16

Supplier: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Unramified Q_{p^d}/Q_p and its arithmetic Frobenius; semilinear Hilbert90 descent for proportional (c,d) pairs.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/twisted-local-systems`

#### VB3 request 17

Supplier: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

Representation/comodule and tensor-functor torsor dictionary; the integral smooth-affine connected-fibre version needed by SW19.5.2/22.6.1 exceeds the upstream field-only reconstruction and is requested as ReductiveGroups, PartII.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/integral-group-torsors`

#### VB3 request 18

Supplier: `PadicDifferentialEquationsAndRigidCohomology:RD.2`.

For a perfect analytic field L over F_p, i.e. Kedlaya’s analytic rings with ℓ=L perfect: (a) for a φ^a-module M over ℛ̃^bd_L the special slope polygon (over ℛ̃_L) lies on or above the generic one (over ℰ̃_L), with the same endpoints; (b) if they coincide, the slope filtration of M⊗ℛ̃_L descends to M (KL15 Proposition 7.4.3, citing Ked05 Proposition 5.5.1 and Theorem 5.5.2). The RD.2 nodes special-polygon-above-generic and coincident-polygons-common-filtration are cited by id; this request asks that their stated generality cover perfect ℓ and the KL sign and order conventions.

Needed by:

- `VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`
- `VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule`

## Restructuring proposals preserved from the packets

These six proposals are collected for the authorized restructuring/integration owner. No ownership, stage or link edits are made by this assembly. The accepted RS-15/RS-20 constraints above take precedence over historical wording in an inherited detail.

### VB0 proposal 1: rescope

Roadmaps: `VectorBundlesAndIsocrystals`, `RelativeFarguesFontaine`.

Accepted RS-15 and RS-20 and confirmed RT-AREA-padic-1/21 require an acyclic order. Current RF3 and VB3 packets retain the older aggregate contracts.

Apply the following split and retargeting atomically: RF3 rank-one twists/graded ring/partial charts → VB1 early bundle/annular/Frobenius-complex/v-descent → basic VB3 Lubin–Tate/fundamental sequence → VB1 twist cohomology → VB1 geometric-point cover/regularity/Picard/degree/HN → VB2 ampleness/global map/GAGA → VB2 classification. Keep all legacy IDs. Reparent the classical-point and geometric-scheme nodes to VB1; RF3 must not consume the global map or full functor. Retarget the basic VB3 dependencies to the four early analytic nodes, excluding Tw. The global stage graph is not claimed repaired until supplier changes integrate.

### VB0 proposal 2: split

Roadmaps: `VectorBundlesAndIsocrystals`.

VB1 contains both analytic descent and an independent geometric-point prefix; KL’s norm/action and ampleness material is too broad for a single reader layer.

Proposed sublayers: VB1:early (Bundle, Ann, Robba, Phi, RE, Coh, VD, Fun, Tw); VB1:geometric-point (ClassPt, GeoMap, Reg, Loc, Pic, Deg, Sat, SS, HN, HP); VB2:ampleness:algebraization (GG, GMap, GAGA, Ind); VB2:ampleness:robba (Pr, Norm, Act); VB2:ampleness:criteria (CD, Amp, Pow, PL, AC, EA, Aff). ParentStageId continues to use the current stage IDs until integration; names are proposals, not new suppliers.

### VB0 proposal 3: rescope

Roadmaps: `VectorBundlesAndIsocrystals`, `VStackSheavesAndLisseCategories`.

Confirmed RT-AREA-geomlanglands/31 needs a simple-connectivity export without duplicating VS1’s Weil-map construction.

Add the classification finite-étale-constant-algebras node as the VB2:classification → VS1 supplier. Keep SW20 16.3.2–16.3.6 and the Class field theory Layer 9 → VS1 reciprocity dependency in VS1.

### VB3 proposal 1: reorder-links

Roadmaps: `VectorBundlesAndIsocrystals`.

Preserve the binding RS15 fix: replace stage edges and narrow general-BC atomically. Node-level order early basic→twist/degree/ampleness→ordinary properness→VB4→resolutions→general BC is acyclic; retain stable ids and do not lift cross-stage node prerequisites blindly.

```json
{
  "source": "research/blueprint/restructure/RS-15.result.json",
  "nodes": [
    "VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover",
    "VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC",
    "VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting",
    "VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution",
    "VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces"
  ]
}
```

### VB3 proposal 2: move-target

Roadmaps: `VectorBundlesAndIsocrystals`, `DiamondsAndVStacks`.

The contracting-action lemma is general topology; move its eventual generic owner to the locally spectral space layer D0, retaining the stable id as an imported alias and its BC application here. Until that move is accepted this packet retains the target.

```json
{
  "node": "VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma",
  "supplier": "DiamondsAndVStacks:D0/locally-spectral-space"
}
```

### VB3 proposal 3: extend-upstream

Roadmaps: `ReductiveGroupsPartII`.

Request ReductiveGroups, PartII for the integral Z_p tensor-fibre-functor/torsor dictionary needed by SW22.6.1; do not replan upstream ReductiveGroups Layer1.

```json
{
  "consumer": "VectorBundlesAndIsocrystals:VB4/integral-group-torsors",
  "need": "Smooth affine Z_p model with connected fibres; exact tensor integral representations and torsors."
}
```

## Upstream notes preserved from the packets

### VB0 upstream note 1

```json
{
  "roadmaps": [
    "tauceti:TauCetiRoadmap/ClassFieldTheory"
  ],
  "note": "The Layer 9 carrier/topology applies to every local field, but its localWeilArtinEquiv reciprocity comparison is explicitly restricted to finite extensions of Q_p because Layer 8 excludes equal-characteristic p-primary existence. The downstream VS1 divisor/Weil construction must respect that scope or identify a separate equal-characteristic reciprocity supplier. This review changes no Tau Ceti roadmap or link."
}
```

### VB3 upstream note 1

```json
{
  "roadmap": "ReductiveGroups",
  "detail": "The integral reconstruction needed by SW19.5.2/22.6.1 is outside the field-only Layer1 contract. This packet requests the extension as ReductiveGroups, PartII and does not edit or replan upstream."
}
```

### VB3 upstream note 2

```json
{
  "roadmap": "VectorBundlesAndIsocrystalsPartII",
  "detail": "CN §3.3 h(W)=Hom_VS(W,BdR), its Ext correction and rank=height theorem belong to accepted routed items331–333 in PartII. The parent supplies BC, Le Bras, curvature and Hom vanishing only. No duplicate h construction is planned here."
}
```

All durable results and next actions are in the full reader, suggested file, unchanged part packets/reviews and this note. Scratch source snippets, generation helpers and logs are disposable. This worker submits only issue #261 and claims no second job.
