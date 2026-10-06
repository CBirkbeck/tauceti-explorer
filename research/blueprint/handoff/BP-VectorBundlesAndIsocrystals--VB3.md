# Handoff — BP-VectorBundlesAndIsocrystals--VB3 (issue #1003)

Agent: Codex, session `codex-tqenam`. Branch `codex-tqenam-vector-bundles-vb3`.
This is the completed target-level continuation of the checkpoint, submitted for
independent review rather than a further checkpoint. All eleven original node
ids and the exact five-stage scope are preserved. No implementation is claimed.

## Deliverables and coverage

The packet has 76 nodes: 10 definitions, 3 constructions, 46 theorems,
13 comparisons, 3 applications and 1 lemma. The 13 definitions/constructions
have 67 uses-derived API items and 52 tests. There are 18 planets, 13 checked
baseline declarations, 10 gaps, 17 supplier requests and 15 source findings.
The greatest layer has six nodes. Every node has its statement, hypotheses,
source passage, proof steps, acceptance conditions and prerequisites.

Packet, reader and suggested Lean file cover VB3, positive-basic-examples,
projectivized-properness, general-BC and VB4. All five coverage records are
`planned`, none `closed`; packet status is `complete` in the protocol's
completed-pass sense. Every implementation status remains `unchecked`.
The reader presents all 76 contracts, their source and supplier boundaries,
and the APIs/tests. The suggested file gives admitted signatures and examples,
with an indexed exact roadmap contract wherever missing geometry is omitted.

## Mathematical decisions to retain

- BC of [E₁→E₀] uses degree-zero derived hypercohomology in cohomological
  degrees −1,0, with H⁰(E₁,T)=0 for every T/S. It is not the cokernel of raw
  section groups. Constant E means the constant sheaf: two points give E².
- Bundle Frobenius π^{-d} gives positive slope d/h. The FS polygon is concave,
  decreasing, with horizontal rank. KL's convex increasing polygon satisfies
  P_KL(x)=deg−P_FS(n−x); its lower semicontinuity matches FS upper
  semicontinuity. KL's φ^a untilt line has slope 1/a.
- Degree zero alone does not imply slope zero. Keep pure bounded models,
  geometrically pure finite locally free objects, rational local systems and
  integral lattices distinct. Preserve the denominator and coefficient field.
- General-E relative FS results and classical Q_p/C BC results have different
  hypotheses. The curvature filtration uses natural VS morphisms, not every
  linear map on C-points. Height zero is not a curvature classifier: a torsion
  sheaf away from the distinguished point is a counterexample.
- The zero BC object has no slope. Strict height/embedding inequalities require
  a nonzero object. Abstract BC closes under kernels and cokernels of maps
  between BC objects, not all subobjects in the ambient category.
- Ordinary projectivized properness is independent of classification. Early
  Lubin–Tate/twist/ampleness calculations precede it; it supplies relative HN,
  then positive resolutions, then general two-term geometry. The classical
  Le Bras branch imports geometric classification separately.
- Relative E× quotient properness does not prove absolute π^Z quotient spatiality.
  The negative quaternion example uses SL₁(D), inv(D)=1/2, not D×; the second
  example uses SL₂ and independent pairs.
- Integral Y_[0,r] retains the characteristic-p boundary and φ^{-1} convention.
  The integral group theorem requires smooth affine G/Z_p with connected fibres.

## Ownership and structural boundaries

Read the binding RS15 decision accepted 2026-09-30. Its general-BC/VB4 reversal
remains withheld until parent-stage narrowing and edge replacement can be done
atomically. The combined node graph of this part and the companion is acyclic;
its edges must not be lifted mechanically to the stage graph. No atlas data or
upstream roadmap was edited.

Import the companion VB0 packet's corrected node contracts. Its current review
still needs changes for reader synchronization; its G-DM, G-GEOM, G-HN, G-GG and
G-KEY proof obligations remain open inputs. This part does not replan them.
RF owns the curve, untilt/divisor moduli and period rings; diamonds and six
operations own generic spatiality, torsors and smoothness; SF.0 owns the generic
derived tilt. Upstream ClassFieldTheory supplies arithmetic Lubin–Tate and local
reciprocity. Request the integral extension as ReductiveGroups, Part II rather
than modifying upstream's field-only reconstruction. The accepted CN route of
items 331–333 (h categorification/exactness) belongs to its Part II, not here.

## Source reading and versions

Source hashes and individual locators are in the packet. The following passages
were read in this run, including the routed definitions and key theorems:

- FS author-hosted Geometrization: I.3.5 and the in-scope II.2–II.3 passages.
- SW20 author-hosted Berkeley: 12.3, 15.2, 22.3, 22.6 and covariant normalization
  on p.99. Printed page numbers differ from PDF page indices by ten.
- KL15 arXiv 1301.0792v5: 7.1–7.4 and 8.5–8.8, including all 29 routed items.
- FF18 current author-hosted living version: §8.4.1, printed pp.245–247, and
  preface Theorem 2.12, printed pp.16–17. Preface pagination is separate; this
  version/hash replaces the stale checkpoint attribution.
- SW13 arXiv 1211.6357v2: Theorem A and §§3.1.3, 3.5.1.
- CN25 author copy CN5.pdf: §§3.1–3.2 and §3.3's routing boundary. The Duke 2025
  publication is paywalled and was not read; findings are scoped to the copy.
- CDN20 author copy GPW5.pdf: §2.1.2 and Lemma 2.7 (author p.21 corresponds to
  published p.328).

Literal normalized source excerpts and all seven PDF hashes were checked.
The Le Bras original proof and CN §4's graph bounds were not read: these are
explicit G-LEBRAS and G-HOM obligations, not assertions of proof closure.

Findings E16–E27 are inherited with original extraction/review attribution;
E28 retains binding RS15 attribution. E26's ring-level patching route is
conditional pending G-PATCH. E29 (FS II.3.2: m=d, not dr) and E30 (CN3.16:
nonzero hypothesis for strict inequality) are scoped observations for independent
review. This worker does not supply an independent-review verdict on any finding.

## Verification and Lean qualification

- `scripts/check_blueprint.py` with the pinned declarations index: 0 errors,
  0 warnings; all five stages planned, none closed.
- `research/blueprint/intake.py check-files` on the four deliverables: 4 files,
  0 problems. Embedded source-issue/version validation: 0 errors.
- Source hashes and excerpt matching; original-id preservation; reader/Lean
  contract correspondence; own/companion graph acyclicity; `git diff --check`.
- `lean-check research/blueprint/suggested/VectorBundlesAndIsocrystals--VB3.lean`:
  elaborated successfully, with declaration-uses-sorry warnings only. Memory was
  checked before elaboration. No build, cache download or language server ran.

The shared checker uses exactly pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout HEAD is newer
(`cf386627e9176a3827c1a5fe804989fd94a4d216`), but all seven Tau Ceti modules in
the imported transitive closure were compared byte for byte with the required
`f790474821cf4256814db967cb154e7af3d0c369` source and are unchanged. This is a
qualification of the compilation environment, not a claim of a fully pinned
Tau Ceti build. The cited spectral theorem was read at its pin; the suggested
file imports Spa.Basic because the spectral module is not cached.

Compilation checks the admitted categorical, linear, cochain, numerical and
spectral types. Perf/FF geometry, sympathetic sheaf conditions, local systems,
period rings, properness and cohomological smoothness are absent from those types
where no pinned carrier exists. They are identified in the file's declaration
comments/full contract index and G-LEAN. Category/functor/slope/height parameters
are supplier interfaces, not verified models. The pointwise scalar quotient is
not the v-sheaf quotient. Numerical tests do not realize the geometric fixtures.
No theorem is proved and no stage is formalized. No application test-suite result
from the previous worker is carried forward as a test performed in this run.

## Remaining obligations and where to resume

Independent review should first check the degree/sign conventions, scalar
quotient separation, nonzero hypotheses, and the relative purity/local-system
contracts against their cited passages. The complete target pass needs no
additional stage claim here. For later proof work, resolve these precise gaps:

- **G-LT — Crystalline Lubin–Tate Hom comparison.** SW13 Theorem A supplies full faithfulness; FSII.2.2 compresses the specific Hom/eigenspace calculation and the σ/π normalization. R07.2 must provide exactly the displayed comparison, with OE action and Frobenius. SW20 p.99 normalization was read; this is now a proof boundary, not an unread source or an asserted essential-surjectivity theorem.
- **G-CONTRACT — Quantitative verification of contraction on BC charts.** FSII.2.16 reduces in one sentence from embeddings into BC(O(n)^m) to evaluation at a finite family of untilts. Verify that those evaluations jointly detect vanishing and provide a common contraction/escape bound on each quasicompact open. The topological lemma itself is fully stated; the missing quantitative application affects ordinary and two-term properness.
- **G-SPATIAL — Two generic spatiality extensions.** DD5 has generic spatiality and relative representability nodes but does not yet state the two exact FSII.3.8 contracts. Requested there; proof must keep smallness, qcqs/surjectivity for the smooth cover, and a covering family of locally closed generalizing strata.
- **G-LEBRAS — Construction-level proof of Le Bras.** SW15.2.12 and CN3.12 state and use the exact equivalence and triangular Hom matrix. Both are read; the underlying proof in Le Bras’s thesis/article was not available among the supplied sources read. Obtain its hypercohomology full-faithfulness and sympathetic-evaluation comparison, not just cite an abstract categorical equivalence.
- **G-HOM — Bounded-image step for unrestricted VS morphisms.** CN3.18’s BdR vanishing uses presentations by Graphs of additive elements and a bound landing the image in t^{-N}BdR⁺. The graph theorem in §4 was not read in this pass. The finite-length/BdR⁺ part is sourced, but the uniform bound for arbitrary VS maps must be proved or imported from the routed CN PartII, without a cyclic use of its h-exactness theorem.
- **G-PATCH — Ring-level nodal purity counterexample.** KL8.5.18 explicitly gives sheaf modules. The accepted extraction’s E68 supplies a possible Milnor fibre-product patching argument to produce modules over completed and bounded coefficient RINGS. Verify the Witt and Robba fibre-product/intersection statements and φ compatibility before claiming Remark7.3.5’s stronger ring-level separation. This packet’s application keeps the established sheaf version.
- **G-INTEGRAL — Integral Tannakian reconstruction.** The upstream ReductiveGroups Layer1 is over a field. SW22.6.1 requires an integral smooth affine model with connected fibres and exact tensor fibre-functor torsors over Z_p. Requested as the upstream roadmap’s PartII, preserving the connected-fibre Lang input.
- **G-COMPANION — Imported companion proof obligations.** VB0 packet is complete but its independent review currently needs_changes because its reader is unsynchronized. Import its corrected NODE statements. Retain its G-DM, G-GEOM, G-HN, G-GG and G-KEY obligations where used: equal-characteristic DM, early chart/PID comparison, HN degree bounds, general-E global-generation comparison and perfected-A¹ endomorphisms. This part neither duplicates nor treats those proof gaps as resolved.
- **G-ORDER — Atomic stage-order integration.** Binding RS15 review accepted 2026-09-30 withholds the reversal general-BC→VB4. The node order is acyclic and uses VB4→positive resolutions→general two-term geometry, while early basic calculations feed VB1 twists. Never mechanically lift these node dependencies into the current stage graph. Apply the parent-stage narrowing and edge replacement atomically in a separate integration change.
- **G-LEAN — Missing geometric Lean carriers.** The pinned libraries contain sheaves, abelian/derived categories, ModuleCat, short complexes, spectral topology and lattices, but no Perf site, FF curve, slopes, diamonds, period VS or Le Bras functor. Suggested signatures give their available categorical, linear, cochain, numeric and topological components, and an exact contract index lists every definition, API item, test and missing geometric clause. Generic category/functor/height parameters are uninstantiated supplier interfaces, not verified models. Compilation with admitted proofs verifies these component types only; it proves neither geometric hypotheses nor the complete contracts.

Supplier requests, with exact contracts and consumers in the packet:

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`: Formal π-divisible O_E Lubin–Tate group, its Tate module, logarithm convergence and étale torsion exact sequence, in the covariant normalization F=σ/π.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`: Normalized π-divisible Dieudonné Hom comparison over R♯+/π: crystalline φ=π invariants identify with Hom_OE(E/O_E,G(R♯+/π))[1/π]; Lang/Artin–Schreier–Witt integral Frobenius trivialization. Full faithfulness alone is not an essential-surjectivity assertion.
- `VStackSheavesAndLisseCategories:VS1`: Divisor-to-Weil map and local reciprocity comparison for the fundamental E×-torsor; supplier owns the Weil/étale-local-system map, this part only its BC/Lubin–Tate identification.
- `DiamondEtaleCohomology:C4`: Taut partial properness, properness descent and valuative criteria of ECD 11.19,11.24,18.10; a surjective proper map is a v-cover on perfectoid geometric points, used by the nowhere-zero-section locus.
- `DiamondSixOperations:S4`: Cohomological smoothness is v-local and stable under composition/extension of E-module v-sheaves, with the hypotheses of ECD23.13.
- `DiamondSixOperations:S5`: Perfectoid balls, locally profinite torsor quotients and scalar quotient examples; ECD24.2, including cohomologically smooth dimension and additivity through the BC presentations.
- `DiamondsAndVStacks:D5`: Extend the existing spatial-v-sheaf criterion to FSII.3.8: a surjective qcqs cohomologically smooth map from a spatial diamond to a small v-sheaf makes the target spatial; a COVER by locally closed GENERALIZING spatial-diamond sub-v-sheaves makes a spatial v-sheaf a spatial diamond. Do not omit coverage or generalizing hypotheses.
- `DiamondsAndVStacks:D3`: Pro-étale sites of perfectoid spaces and finite-rank coefficient local systems, with effective sheaf/tensor descent; the specialized locally profinite torsor theorem is imported by node id.
- `PadicHodgeTheory:R06.1`: Period Rings as functors on sympathetic algebras (BdR⁺,BdR,Bcris⁺ and their reductions), compatible evaluation and completion/filtration maps. No abstract replacement of these Rings by arbitrary VS targets.
- `PadicHodgeTheory:R06.2`: Admissible rank-two supercuspidal (φ,N,G_F)-module realization and the representation input used alongside X_st⁺ Dimension in CDN Lemma2.7.
- `PerfectoidSpaces:P3`: Tilting/untilting equivalence of finite étale sites for the integral Frobenius comparisons and inverse perfection; finite-étale completed limit control.
- `RelativeFarguesFontaine:RF0:integral-Y`: Integral Y_[0,r] with characteristic-p boundary, Frobenius-inverse equivariance, and comparison with the open Y_(0,r]; the boundary integral period rings W(R) and integral Robba sheaves.
- `RelativeFarguesFontaine:RF1`: KL relative schematic FF_X over affinoid perfectoid untilts, compatible with Proj(P_R) and with perfectoid pullback. The E-general adic curve is already imported via companion node contracts.
- `SchemeAndStackFoundations:SF.0`: Generic torsion-pair tilt heart inside the existing bounded derived category, its abelianness and triangular Hom/Ext¹ description; finite-support coherent sheaves on a regular curve are hereditary (Ext²=0). Keep this generic derived machinery in SF.0.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`: Arithmetic Lubin–Tate module and reciprocity normalization; BC carries only the geometric universal-cover comparison.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`: Unramified Q_{p^d}/Q_p and its arithmetic Frobenius; semilinear Hilbert90 descent for proportional (c,d) pairs.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`: Representation/comodule and tensor-functor torsor dictionary; the integral smooth-affine connected-fibre version needed by SW19.5.2/22.6.1 exceeds the upstream field-only reconstruction and is requested as ReductiveGroups, PartII.

Start construction-level follow-up with normalized Lubin–Tate Hom comparison,
quantitative untilt evaluations in contraction, and the actual Le Bras proof.
Keep generic supplier additions in their owners; do not silently declare them
closed. This run submits one job only and leaves no second claim.
