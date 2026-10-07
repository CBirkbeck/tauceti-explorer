# Handoff — BP-GeometricSatakeAndFusion--GS0 (#741)

Worker: Codex, session `codex-63Llj0`. Branch: `codex-63Llj0-bp-geometric-satake-gs0`.
This is a complete target-level planning pass, not a checkpoint or an implementation.

## Delivered and coverage

The packet, definitive reader and suggested file agree on 59 nodes: 21 constructions,
2 definitions, 27 theorems, 8 comparisons and 1 application. Every one of the 23 objects
has an API and three unit tests: 71 API items and 69 tests in total. There are 25 planets,
29 pinned baseline declarations, 20 requests, 8 gaps and 19 source findings.
The packet also reconciles all 236 routed paper items individually. All 16 existing
anchor ids are retained. No node is claimed implemented.

All eight stages are **planned**, none **closed**:

- GeometricSatakeAndFusion:GS0: planned — Resolve the SF/RF/RG supplier refinements inherited from the three substages.
- GeometricSatakeAndFusion:GS0:Schubert-smoothness: planned — RG Lie-weight/parabolic computation and the CS finite-projectivity/period-sheaf supplier interfaces.
- GeometricSatakeAndFusion:GS0:Witt-geometry: planned — Boundary pinching before Keel; corrected cone-factor integrality; sketch-only canonical Hodge determinant comparison.; Compatible bounded pfp flag models, local-model functoriality and componentwise adjoint fibre-dimension transfer.
- GeometricSatakeAndFusion:GS0:loop-geometry: planned — RF4 torsor gluing/Anschütz extension and integral/parahoric RG refinements.; Exact geometric Lean signatures after supplier carriers are available.
- GeometricSatakeAndFusion:GS1: planned — Model-dependent rational MV trace normalization and corrected quasi-minuscule/minimal-generation argument.; VS1 hyperbolic/ULA enhancement and EDS Ind t-structure extension.
- GeometricSatakeAndFusion:GS2: planned — Resolve the coherent correspondence/stack-kernel refinements inherited from the two substages.
- GeometricSatakeAndFusion:GS2:Satake-closure: planned — Proper-relative ULA evaluation/coevaluation with both triangle identities and the compatible one-leg comparison.
- GeometricSatakeAndFusion:GS2:correspondences: planned — Enhanced associator/unit coherence and filtered finite-projective fibre comparison, with no canonical tensor splitting yet.

GS0 and GS2 aggregate their substages without duplicate declarations. GS3 fusion and
GS4 reconstruction belong to the second part. Work stops at the completed target pass
as directed by the issue; the residual work below is explicit refinement/closure work.

## Sources actually read

Public source files were fetched and their relevant passages read on 2026-10-07.
The packet records exact URLs, SHA-256 hashes, pagination and source versions:

- FS-geometrization: VI.1–VI.8, printed pp. 190–226, including proofs.; IV.2.23–IV.2.26, printed pp. 124–126; IV.6.1–IV.6.8 and IV.6.11–IV.6.14, pp. 155–159, 162–163.
- BS17-witt-grassmannian: §§2–4, 6–10 (geometric determinant route; §5 only a cited alternative), printed pp. 4–18, 21–39.
- SW20-berkeley: Lectures 18–20, especially §§19.2–19.4 and 20.3–20.5; Lecture 21 §§21.1–21.5, printed pp. 191–197; Appendix 21.6 opening pp. 198–200.
- Zhu17: §§1.1–1.4, 2.1–2.2, Appendices A and B, printed pp. 412–440, 464–488.
- CS17: §3 setup p. 675; §3.4 pp. 684–686.
- GLX26: §1.1 p. 806; §3.2–3.3 pp. 822–824.
- VH24: §2.2.6–§2.2.15, PDF pp. 13–16 (Witt flags, admissible strata and torsor adapters).
- He21: §2.2 p. 5; §§5.3–5.4 pp. 9–12.

BS was read as final arXiv v3. The Springer PDF endpoint returned a paywalled HTML
article page rather than the published PDF; its findings are expressly scoped to v3.
Zhu and the four routed application papers use published PDFs. No full-paper reading
is claimed for the CS, GLX, van Hoften or He papers: the target passages above are the
ones read. FS IV.7 and Zhu §§2.3–2.5 are not inputs to this part's selected route.
BS §5 is an alternative determinant route, not a geometric-projectivity prerequisite.
Keel's general theory belongs to the SF.5 request; this worker read BS's application,
not a new independent planning pass over Keel's paper. Any refinement using an
alternative needs its own source reading rather than inheriting a full-paper claim.

The 19 source findings are candidates for independent review. They retain their
paper-extraction provenance and version scope; this worker adds no review verdict.
Short printed headings identify node citations, while full mathematical contracts
are paraphrased. Canonical-model conjectures and BS Question 10.6 are not theorems.

## Checks and Lean limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS0.json --index "$TAUCETI_BASELINE/declarations.tsv"`: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- API/example/name and stage/source-ledger correspondence checked against the suggested file and reader; all implementation statuses remain unchecked.
- `lean-check` on the full suggested file stops at the missing prebuilt object for `TauCeti.AlgebraicGeometry.LineBundle.Basic`. The complete file therefore **did not compile**.
- The Mathlib-only projection, formed by removing that import and just the geometric-determinant-line and fibral-descent blocks using `InvertibleSheaf`, exits successfully with only `sorry` warnings at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Available memory was above 20 GB before each check. No Lean server, Lake build, cache download or library update was used.

That projection is a limited check of the actual remaining signatures, not a fake
replacement for the unavailable line-bundle carrier. It does not claim full-file
elaboration. Once the pinned prebuilt Tau Ceti module is available, run `lean-check`
on the submitted file itself. The packet's `prototypeNotes` identify omitted geometric
conditions: signatures at the algebraic/category cores do not establish these conditions.

## Precise next refinement work

1. **Boundary representability before Keel**: BS 8.3’s induction calls the lower-bound union a pfp proper perfect algebraic space before proving it. The SF1 finite-pushout/model request must construct closed intersections and effective pinching in the chosen model, then prove it is the image v-sheaf. This proof must precede the positivity application.
2. **Zhu B.11 corrected right-factor integrality**: X=Ag requires g=A⁻¹X; the printed order XA⁻¹ is incorrect. Verify divisibility of A*X by p² on the displayed open W₃ determinant locus, and compatibility of arbitrary Witt lifts, before claiming that the corrected factor is integral/invertible. The cone statement is a source target with this exact open proof obligation.
3. **Sketch-only canonical determinant and crystal comparison**: Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.
4. **Rational MV trace normalization on perfect models**: Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.
5. **Quasi-minuscule infinity contribution and minimal generation**: For the quasi-minuscule P¹ resolution retain the section-at-infinity term absent from Zhu (2.2.13); in SL₃ the zero-weight multiplicity is two. Check the corrected parahoric in type A_n, the finite U-jet torsor/twisted external product in 2.17 and 2.16’s minimal-generation argument with the RG/EDC interfaces.
6. **Stack enhancement and coherent Ind convolution**: VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.
7. **Typed geometric signatures and unavailable prebuilt line module**: The suggested file gives concrete algebraic/category cores and identifies every omitted supplier-dependent geometric condition in prototypeNotes. It has no unknown Prop fields. The full file cannot elaborate in the provided shared build because TauCeti.AlgebraicGeometry.LineBundle.Basic has no prebuilt object; the Mathlib-only projection is checked separately. Once supplier carriers and the pinned Tau Ceti object are present, replace the narrowed signatures by the exact geometric statements, including dimensions, properness, ULA, perfect models and locally constant coefficients.
8. **Bounded affine-flag dimension and adjoint transfer**: The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

## Requests by mathematical owner

- **CrystallineCohomology:CR.1**: Evaluate a locally free crystal on perfect Witt thickenings and obtain its finite projective values and quotient mod p, functorially in perfect bases; the sublattice Grassmannian construction uses this evaluation (Zhu 1.14).
- **CrystallineCohomology:CR.7**: The Dieudonné-crystal and Hodge-determinant family interface for Zhu’s canonical Demazure models, compatible with R07’s conventions and the ramified coefficient summands. It does not reprove the classification in R07.2.
- **EnhancedDerivedSheaves:E3**: Enhanced coherent composition of pull–push correspondences with external tensor, higher associativity/unit maps and Ind extension, compatible with DSO exchange/pasting and VS0 Artin descent. A homotopy-category pentagon statement alone does not give the needed coherent ambient convolution.
- **EnhancedDerivedSheaves:E5:presentability**: Lurie HA 1.4.4.11 extension of a generated t-structure to the Ind category, with the small stable generators, closure and accessibility hypotheses checked for the relative perverse category. Existing universal-property-of-ind alone does not prove this extension.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2**: Dieudonné realization for the specified isogeny chains over perfect residue fields, with covariance, distinguished τ₀-summand, heights and Hodge filtration fixed as in Zhu B.7–B.8. General family crystal theory is requested separately.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6**: P-divisible-group deformation and Hodge-line comparison on the smooth projective canonical Demazure family in Zhu B.8–B.9; prove the scheme-map comparison stated only as an appendix sketch.
- **KTheoryLowDegrees:Z.3**: Determinant of finite projective graded quotients, multiplicativity for short exact sequences and its Picard tensor comparison. This is the elementary determinant interface only; GS projectivity uses the geometric BS §6/§8 route, without BS §5’s K-theoretic determinant construction.
- **PadicHodgeTheory:P8:local-rational**: Corrected relative O𝔅⁺_dR period sheaf, filtered integrable universal connection and Griffiths transversality on minuscule flag varieties, with [Sch13c, 7.9] and its corrigendum conventions, yielding the CS 3.4.5 surjectivity construction.
- **ReductiveGroupsPartII:RG2.3**: Smooth affine integral/parahoric/Iwahori group models; faithful representations with quasi-affine quotient; compatible Greenberg jets, dilatations, finite-level torsor lifting and Weil-restriction comparisons. The field-only pinned reductive-group category is insufficient. Sources: Zhu 1.1/1.20; SW 19.4, 21.1–21.2; BS 9.2–9.6.
- **ReductiveGroupsPartII:RG2.4**: Affine Weyl and extended Weyl data, length/Bruhat order, admissible sets, Cartan and Iwasawa decompositions, rank-one ordinary/Demazure convolution, Kottwitz inertia-component labels, and componentwise adjoint flag comparison with p prime to |π₁(G_ad)| when required by the corrected GHN theorem. Sources: Zhu 1.4, He 5.6 and its GH10/GHN imports. These strengthen this stage’s existing direction.
- **ReductiveGroupsPartII:RG2.5**: Lie G decomposition under a cocharacter, root-pairing conventions, weights of the stabilizer (≤m), opposite parabolics/Levis and dimension sum ⟨2ρ,μ⟩. Minuscule means Lie weights in {−1,0,1}; CS and FS use opposite signs.
- **RelativeFarguesFontaine:RF4:G-torsors**: Beauville–Laszlo gluing and effective étale/v-descent for G-torsors on the completed divisor using the already-planned RF2 finite-projective descent, plus Anschütz’s punctured A_inf extension/triviality theorem in SW 21.2.2 with its group-model hypotheses. Do not define another completed divisor ring or another finite-projective descent node.
- **RelativeFarguesFontaine:RF4:vector-bundles**: The uniform Banach algebra finite-projectivity criterion [KL15, 2.8.4] used in CS 3.4.3–3.4.6: a finitely presented module with the required locally constant fibre rank is finite projective, and compatible sublattices are detected on geometric field points.
- **SchemeAndStackFoundations:SF.0**: Pfp perfect schemes/algebraic spaces and compatible finite-type models up to Frobenius, dimensions, base change and étale-topos invariance (BS 3; Zhu A.1–A.17), plus finite Greenberg realization and perfected Grassmann/Quot bundles. Coordinate-ring perfection is the DIRECT Frobenius colimit, not Mathlib’s inverse-limit Perfection.
- **SchemeAndStackFoundations:SF.1**: Effective quotients of separated pfp perfect spaces by smooth perfect affine torsors (Zhu A.29–A.31), normalized finite-jet quotients, and finite pushouts/pinching of a finite union of lower Schubert bounds along closed representable intersections BEFORE applying Keel. This repairs BS E39’s boundary representability gap.
- **SchemeAndStackFoundations:SF.3**: Proper pfp perfect connected-fibre full faithfulness/effective vector-bundle descent (BS 6.1, 6.8, 6.13), including the weaker connected-fibre criterion and compatibility with geometric base change; relative Grassmann structure cohomology, determinant/Picard tensor pullbacks and fibre-trivial line descent.
- **SchemeAndStackFoundations:SF.4**: Finite/formal Witt vector-bundle v-descent and acyclicity (BS 4.1, 4.4, 4.6), with repaired blowup reduction; integral local-model existence and functoriality identifying the finite admissible Schubert union with the reduced special fibre (GLX 3.3–3.4), and compatible bounded pfp fibre-product models. Local models are an extension in SF’s moduli direction, not an ADLV or shtuka replanning.
- **SchemeAndStackFoundations:SF.5**: General nef/big/ample/semiample line bundles, exceptional locus, Kodaira decomposition, Keel’s characteristic-p criterion and union/exceptional-locus lemmas, Frobenius-power extension/descent of sections, Stein contraction, Serre vanishing and section growth on perfections. GS keeps only the BS 8.9–8.11 application; all general positivity has this single owner.
- **VStackSheavesAndLisseCategories:VS0**: Enhanced six operations and smooth equivariant descent for Artin v-stacks, including nonrepresentable quotient-stack maps, finite congruence charts and coherent proper-kernel correspondences. DSO’s eligible representable operations alone do not cover [*/L⁺G].
- **VStackSheavesAndLisseCategories:VS1**: FS IV.6 hyperbolic localization for bounded monodromic Hecke correspondences, its base change/duality/ULA preservation, and FS IV.2.24’s proper-relative ULA-kernel adjointability/biduality refinement beyond the IV.2.23 criterion already in ula-dualizability-criterion. Include pro-unipotent equivariant invariance (VI.4), without confusing geometric unipotent groups with DSO S5’s profinite prime-to-ℓ averaging.

## Structural corrections carried into the plan

The seven confirmed geomlanglands findings are reflected in the node ownership,
dependencies, requests and four restructuring proposals:

- Nonanalytic scheme v-sheaves use L1/D6 comparisons before any diamond representability claim.
- GS2 closure and duals precede GS3 symmetric fusion; the elementary VI.8 collision family remains an early ingredient.
- Generic bounded properness stays in loop geometry; integral properness is owned only in Witt geometry.
- General positivity/Keel theory belongs only to SF.5; perfect models and boundary pinching import SF.0/SF.1.
- Completed-ring bundle descent imports RF2's existing nodes, without a duplicate construction.
- GS1 receives L1/L3 and EDC.5; no unsupported VS3 lisse-category dependency is used for torsion Satake objects.
- EDC.7 rational decomposition appears at its actual rational/standard-costandard use, without delaying GS0 smoothness.

No atlas base, upstream roadmap, other packet or supplier deliverable was modified.
The proposals are for the maintainer/independent review; the requesting packet does
not implement them in the atlas. Source hashes, exact obligations and item mappings
needed for continuation are in the deliverables, independent of deleted scratch files.
