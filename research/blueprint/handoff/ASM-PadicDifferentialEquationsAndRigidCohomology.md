# Assembly handoff: p-adic differential equations and rigid cohomology

Job `ASM-PadicDifferentialEquationsAndRigidCohomology`, issue #9741. Worker: Codex, session `codex-qchP84`. This is a completed assembly, submitted for independent review. It is not a formalization or a claim that the remaining mathematical proof obligations are closed.

## Deliverables and validation

The main reader joins the reviewed main plan and RD.0–RD.7 continuations into one document. It gives scope, neighboring owners, conventions, a common source register and layer overview, then all 503 targets in prerequisite order within their actual layer. Each target carries its statement, hypotheses, source locators, proof route, API, unit tests and Checks. The worked calculations from RD.1, RD.4, RD.6 and RD.7 remain in the corresponding sections. There are 103 bibliographic entries, with versions distinguished, and 130 unique library baseline references. Source passages and obsolete `excerpt` fields have been removed; mathematical corrections are paraphrases.

The suggested file joins the main signatures and all eight parts under `TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology`, with consistent RD.0–RD.7 namespaces, one standard note and one import block. It has 1,838 lines. `lean-check` succeeded at the pinned build: no errors and 106 warnings, all `declaration uses sorry`. Light data definitions have real bodies; analytic carriers and theories unavailable at the pins remain reader targets. No source theory was developed in the suggested file.

All nine packets passed `python3 scripts/check_blueprint.py` with zero errors and zero warnings. A combined audit checks resolved internal references, acyclicity, non-forward layer prerequisites, target/API/test coverage in the reader, unchanged review objects and at most six planets per layer. No part reader or part Lean file was edited. The ordinary submission file check, whitespace check and sorry-data check are also run before submission.

## Mathematical changes requiring independent re-review

The node-change inventory below identifies every altered node and its changed fields. In particular, review these substantive reconciliations, rather than treating the inherited verdicts as acceptance of this assembly:

1. The old mixed RD.0 coefficient/Frobenius definition is split. `RD.0/laurent-robba-amice-carriers` defines the coefficient carriers before a Frobenius lift is chosen. The stable `frobenius-lift-on-robba-ring` ID now defines the weakly continuous lift on the integral Amice ring. Weak substitution gives existence and uniqueness; extension to the bounded and full Robba rings, its radius change and the cyclotomic logarithm checks belong to `frobenius-radius-comparison`. This removes the implicit analytic-extension circle and distinguishes weak density from π-adic completion.
2. The cyclic-vector lemma imports the finite Katz algorithm and triangular rescaling. The rescaling comparison no longer assumes the cyclic-vector lemma it proves. Its direct proof uses the Leibniz rule and an invertible triangular transition matrix. The nonzero derivation and characteristic-zero field hypotheses remain essential.
3. General local residue duality retains its finite-cover analytic descent obligation in RD.1 G5. The quasi-unipotent residue target is placed in RD.2 and imports Matsuda decomposition; that calculation is not asserted to prove the general descent comparison.
4. Global common-vertex and dense-open slope targets are placed in RD.3 after the convergent coefficient category. Their IDs retain the RD.1 prefix. Mixed full-faithfulness targets remain in RD.5, as already specified by the reviewed ownership reconciliation.
5. Strong fibration uses a cofinal union of products with polydisc radii tending to one, with the proper-closure and relative conormal-coordinate hypotheses. It does not give a fixed open-unit-polydisc product at every boundary point of a strict neighborhood. The author-posted Berthelot 96-03 proof was checked directly: Théorème 1.3.7 and Remarque 1.3.8, pp. 41–45. The related RD.3 continuation and RD.4 refinement are applied to their consumers.
6. Ordinary no-F coefficients require Taylor convergence. Frobenius-forced convergence is a separate theorem with smooth weak-lift hypotheses. The affine description and Monsky–Washnitzer comparison import their precise convergence and global-section targets. The ordinary support, base-change and comparison refinements are applied without silently closing the compact-support adapters or general Gysin proof gaps.
7. The constant smooth-proper rigid–crystalline construction, tube-to-envelope map and quasi-isomorphism are placed in RD.4, retaining their RD.7 IDs, so that RD.5 trace compatibility can use them. The coefficient comparison with linear q-Frobenius remains RD.7. The embedding computation imports `CrystallineCohomology:CR.2/smooth-ambient-comparison`; it is not supplied by a local chart argument alone.
8. The RD.5 reviewed consumer retargets are applied, including supported coherent duality, strong topological Robba duality, principal parts, trace normalization and proper hypercover descent. The duplicated Hahn–Banach target is replaced by `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`; its durable alias is recorded in `supersededNodes`. General LF trace theory is still a supplier obligation.
9. RD.6 and RD.7 milestones import the supplied index/Swan, rank-one, Tannakian, Frobenius-equivariant Fourier, weight-normalizing line, local weight–monodromy, constant-curve slope, rational-descent/Fatou, weight-separation and point-counting denominator/lattice targets. Numerical identities do not substitute for the all-power étale trace formula. The coefficient construction precedes the Dwork character identification; real normalization is a genuine constant Frobenius line, not a real-valued integer Tate twist.
10. The perfect-residue, standard-Frobenius specialization is imported from the existing FiniteFlatGroupsAndIntegralPadicHodgeTheory package §§R07.4.7–R07.4.8. Compatibility Checks on twelve relevant targets make explicit that this assembly plans only the additional coefficient/Frobenius generality, not a second implementation of that specialization.
11. Parent coverage records the union target-level plan. Obsolete broad parent gap records are replaced by the explicit continuation targets and their narrower surviving proof obligations. There are still 39 gap records and 31 supplier contracts across the nine packets; no layer is marked mathematically closed. The remaining obligations are collected below. The known correction to slope-filtration source issue E72 cites the published erratum, Documenta Mathematica 12 (2007), pp. 361–362; no new novelty claim is made.

## Owner decisions and work to resume

The collected proposals below are a manager decision queue, not edits to other roadmaps or accepted atlas restructuring. Historical proposals can conflict; the actual parent-stage assignments and scope conventions in the assembled reader take precedence for this submission.

- RD.2's three-sublayer proposal, RD.5's thematic split and RD.6's three- versus four-sublayer proposals are retained for a manager decision. They have not been applied to atlas structure. The existing eight stages keep at most six planets each; demotion changes display only and does not delete targets. RD.4 uses the reviewed ordinary/cohomological comparison selection, and RD.3 includes convergent F-isocrystals.
- The liftable proper direct-image theorem and abelian-scheme overconvergence are still to be planned in RD.5. Ordinary convergent direct images do not supply that theorem. Zarhin's trick belongs with `AbelianSchemesAndArithmeticModuli`, not the higher Arakelov consumer.
- Keep the distinction between RD.2's general finite-étale Robba theorem and the higher p-adic Hodge consumer's field-of-norms identification. Redirect consumers there; do not add an upward prerequisite to the local theorem.
- RD.6–RD.7 supply rational descent/Fatou and weight-separated factor extraction under the current tier order; later WeilConjectures consumers import these. A proposal to consolidate them in DWP.0 needs an explicit ownership decision. DWP.0 already supplies the common eigenvalue weights and determinant/trace algebra.
- Kloosterman rigid cohomology does not by itself supply semistability or weak admissibility. Keep the `CohomologyComparisons:CP.4` comparison obligation explicit. Ordinary-locus, log proper-support and finite-level Igusa constructions likewise retain their coefficient and support-specific comparison contracts.
- The all-power constant ℚℓ trace/zeta theorem remains an explicit supplier contract routed through the registered SF.2 interface to CohomologicalPointCounting/TraceFormula Layers 12–13. The inherited record identifies upstream PR 196, head `4bd72379658126cbe9be935656396f0c9dac4de0`, as the proposed provider. That historical reading is not a claim of current upstream adoption. The next owner must read the adopted statements before replacing the request by exact imports.
- Keep the analytic radius/projector source interiors, coefficient-category transports, geometric Newton-polygon extension, general finite-cover duality, compact-support Gysin/gluing, LF trace/Fredholm theory and nonflat strengthening restrictions visible. The assembly does not erase them because a target has been named.

The checked current Tau Ceti library head was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current TauCetiRoadmap and the current library were read without running Lake there, including the newer roadmaps absent from the atlas snapshot. AlgebraicCurves, AdicSpaces and the accepted integral p-adic Hodge package provide relevant boundaries. No existing Robba/isocrystal implementation was found in the current library. Baseline and elaboration pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The source work in this assembly is scoped: the reviewed parts remain the basis of the mathematical plan; this run directly checked the public strong-fibration argument and the cited source/version metadata needed for reconciliation. It did not re-read every proof in the source register. Unavailable or uncleared book inputs remain bounded proof obligations, particularly RD.1 G1. The library index was consulted; no uncleared book copy or source passage was copied into the repository. Resume with the independent assembly review, then the owner decisions and precise remaining proof obligations below. There is no unfinished assembly step requiring another worker to regenerate these files.



## Node-change inventory

Every entry below is an edit relative to the accepted input. `prerequisites` and proof changes need mathematical checking; `planet` is a display change. No review field was changed.

| Target | Changed fields |
| --- | --- |
| `RD.0/analytic-ring-bezout` | prerequisites |
| `RD.0/bounded-robba-ring` | acceptance, planet |
| `RD.0/extended-robba-ring` | acceptance, planet, prerequisites |
| `RD.0/frobenius-lift-on-dagger-algebra` | prerequisites |
| `RD.0/frobenius-lift-on-robba-ring` | acceptance, api, prerequisites, proofSteps, statement, tests, title |
| `RD.0/frobenius-lifts-induce-homotopic-maps` | prerequisites |
| `RD.0/laurent-robba-amice-carriers` | new coefficient-carrier target |
| `RD.0/robba-ring` | prerequisites |
| `RD.0/units-of-robba-ring` | acceptance, planet |
| `RD.1/cyclic-vector-lemma` | prerequisites, proofSteps |
| `RD.1/degree-and-slope` | acceptance |
| `RD.1/frobenius-module` | acceptance |
| `RD.1/frobenius-slopes` | acceptance |
| `RD.1/isoclinic-frobenius-module` | acceptance |
| `RD.1/semistability-and-harder-narasimhan-filtration` | acceptance |
| `RD.1/standard-frobenius-modules` | acceptance |
| `RD.2/berger-form-of-local-monodromy` | hypotheses, prerequisites, proofSteps |
| `RD.2/isoclinic-descent-to-bounded-robba-ring` | acceptance |
| `RD.2/monodromy-representation-equivalence` | prerequisites |
| `RD.2/slope-filtration-for-frobenius-modules-statement` | acceptance |
| `RD.2/tsuzuki-unit-root-finite-monodromy` | prerequisites, proofSteps |
| `RD.3/affine-smooth-description-of-overconvergent-f-isocrystals` | prerequisites, proofSteps, sources, statement |
| `RD.3/etale-cover-of-affine-space` | prerequisites, proofSteps |
| `RD.3/finite-etale-pushforward-of-isocrystals` | prerequisites, proofSteps |
| `RD.3/full-faithfulness-requires-frobenius` | prerequisites, proofSteps |
| `RD.3/independence-of-compactification` | prerequisites, proofSteps |
| `RD.3/independence-of-frame` | prerequisites, proofSteps |
| `RD.3/j-dagger-properties` | prerequisites, proofSteps |
| `RD.3/overconvergent-f-isocrystal` | prerequisites |
| `RD.3/overconvergent-isocrystal` | proofSteps |
| `RD.3/overconvergent-isocrystal-connection-form` | prerequisites, proofSteps |
| `RD.3/overconvergent-isocrystals-of-a-variety` | api, prerequisites, proofSteps |
| `RD.3/overconvergent-sections-of-affine-frame` | proofSteps |
| `RD.3/punctured-curve-boundary-acceptance` | prerequisites |
| `RD.3/restriction-to-convergent` | prerequisites, proofSteps |
| `RD.3/sigma-nabla-module-over-dagger-algebra` | proofSteps, sources, statement |
| `RD.3/strong-fibration-theorem` | acceptance, hypotheses, prerequisites, proofSteps, sources, statement |
| `RD.3/taylor-comparison-of-pullbacks` | prerequisites, proofSteps |
| `RD.3/weak-fibration-theorem` | prerequisites, proofSteps |
| `RD.4/compact-support-independence-of-compactification` | proofSteps, sources, statement |
| `RD.4/excision-sequence` | planet, proofSteps, sources, statement |
| `RD.4/finite-etale-pushforward-cohomology` | proofSteps, sources, statement |
| `RD.4/finite-etale-pushforward-de-rham` | proofSteps, sources, statement |
| `RD.4/finite-flat-base-change` | proofSteps, sources, statement |
| `RD.4/frobenius-independent-of-lift` | prerequisites |
| `RD.4/independence-of-compactification` | prerequisites, proofSteps, sources, statement |
| `RD.4/independence-of-embedding` | prerequisites, proofSteps, sources, statement |
| `RD.4/localisation-sequence` | proofSteps, sources, statement |
| `RD.4/monsky-washnitzer-comparison` | planet, prerequisites, proofSteps, sources, statement |
| `RD.4/mw-comparison-for-affine-curves` | proofSteps, sources, statement |
| `RD.4/overconvergent-de-rham-complex` | planet |
| `RD.4/rigid-cohomology-with-supports` | proofSteps, sources, statement |
| `RD.5/cohomological-descent-for-proper-hypercoverings` | prerequisites, proofSteps |
| `RD.5/crew-finiteness-and-duality-on-curves` | prerequisites |
| `RD.5/dimension-of-h1-of-affine-curve` | prerequisites, proofSteps |
| `RD.5/excision-duality-compatibility` | prerequisites, proofSteps |
| `RD.5/frechet-montel-transpose-strict` | prerequisites, proofSteps |
| `RD.5/kunneth-morphism` | hypotheses, prerequisites, proofSteps |
| `RD.5/nonarchimedean-hahn-banach` | superseded by the explicit L0 Hahn–Banach owner; durable alias retained |
| `RD.5/poincare-duality-on-affine-space` | prerequisites, proofSteps |
| `RD.5/poincare-pairing` | hypotheses, prerequisites, proofSteps |
| `RD.5/residue-pairing-perfect` | prerequisites, proofSteps |
| `RD.5/top-compact-support-cohomology` | prerequisites, proofSteps |
| `RD.5/trace-map` | prerequisites, proofSteps |
| `RD.6/dwork-isocrystal` | proofSteps |
| `RD.6/fourier-transform-rank-and-irreducibility` | prerequisites |
| `RD.6/global-monodromy-group` | prerequisites |
| `RD.6/grothendieck-ogg-shafarevich-formula` | prerequisites, proofSteps |
| `RD.6/l-function-of-overconvergent-f-isocrystal` | proofSteps |
| `RD.6/l-function-rationality` | prerequisites, proofSteps |
| `RD.6/lefschetz-trace-formula` | prerequisites, proofSteps |
| `RD.6/local-invariants-strongly-mixed` | prerequisites |
| `RD.6/nonnegative-slopes-of-h1c-on-curves` | prerequisites |
| `RD.6/p-adic-weil-ii` | prerequisites |
| `RD.6/purity-via-fourier-on-affine-line` | prerequisites |
| `RD.6/rank-one-isocrystals-are-pure` | prerequisites, proofSteps |
| `RD.6/trace-formula-without-rational-points` | prerequisites |
| `RD.7/ell-adic-comparison-smooth-projective` | prerequisites, proofSteps |
| `RD.7/kedlaya-point-counting-certification` | prerequisites, proofSteps |
| `RD.7/rigid-crystalline-comparison` | parentStageId, planet, prerequisites, proofSteps, realises |
| `RD.7/rigid-zeta-expression` | proofSteps |
| `RD.7/weil-factors-rational-and-integral` | prerequisites, proofSteps |
| `RD.0/finite-coefficient-extension-interface` | prerequisites |
| `RD.0/frobenius-radius-comparison` | acceptance, api, tests |
| `RD.0/integral-amice-weak-topology` | prerequisites |
| `RD.0/laurent-topology-interface` | prerequisites |
| `RD.0/weak-substitution-convergence` | prerequisites |
| `RD.1/common-vertex-global-subobject` | parentStageId, realises |
| `RD.1/cyclic-rescaling` | prerequisites |
| `RD.1/dense-open-global-slopes` | parentStageId, realises |
| `RD.1/robba-residue-duality` | parentStageId, prerequisites, realises |
| `RD.2/andre-local-monodromy-group` | planet |
| `RD.2/irregularity-equals-swan-conductor` | planet |
| `RD.5/global-semistable-reduction` | planet |
| `RD.5/log-extension-of-unipotent-isocrystal` | planet |
| `RD.5/overconvergent-site` | planet |
| `RD.5/proper-surjection-cohomological-descent` | planet |
| `RD.5/unipotent-monodromy-along-boundary` | planet |
| `RD.6/christol-mebkhout-global-euler-characteristic` | planet |
| `RD.6/kloosterman-f-isocrystal` | planet |
| `RD.6/kummer-isocrystal` | planet |
| `RD.6/local-monodromy-weight-purity` | planet |
| `RD.6/neutral-tannakian-recognition` | planet |
| `RD.6/rank-one-finite-geometric-monodromy` | planet |
| `RD.7/comparison-map-quasi-isomorphism` | parentStageId, realises |
| `RD.7/tube-to-envelope-comparison-map` | parentStageId, realises |

## Collected requests

Each packet’s request is retained separately so its scope and consuming targets can be reviewed. Overlapping contracts are not declarations of a second implementation.

### PadicDifferentialEquationsAndRigidCohomology

#### Contract 1

- **supplier:** SchemeAndStackFoundations:SF.0
- **need:** The finite-type schematic closures and graph-closure comparison diagrams for two compactifications, with their proper projections. Nagata compactification itself is imported from AdicCoefficientsAndComparisons:L2/nagata-factorisation-as-used-in-27-4; do not re-prove it here.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/frame
- PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystals-of-a-variety
- PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-cover-of-affine-space

#### Contract 2

- **supplier:** CrystallineCohomology:CR.3
- **need:** Early crystalline coherent-crystal/rational coefficient data, Frobenius pullback and evaluation needed by the RD.3 Frobenius-bearing convergent comparison; proper smooth perfectness and rational Frobenius for RD.7. The actual CR.1/isocrystal, CR.3/proper-perfectness and CR.3/frobenius-map nodes supply their stated pieces. The ordinary convergent coefficient category and its analytic convergence comparison are owned by RD.3, not silently supplied by the whole CR.3 stage.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/restriction-to-convergent

#### Contract 3

- **supplier:** SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem
- **need:** de Jong 1996 Theorem 4.1 and Remark 4.2: alteration of an integral separated finite-type k-scheme with regular projective compactification and SNC boundary; generically étale over perfect k. The exact SF.4 node supplies the schematic theorem under accepted RS-25 (confirmed by RT-AREA-algebraicgeometry/16). L5 imports that geometry and owns étale descent. RD.5 retains its separate simplicial construction, purely inseparable base-change argument, and rigid-cohomology descent; none is supplied by étale descent.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/smooth-proper-hypercovering

#### Contract 4

- **supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison
- **need:** For an algebraic function field F/k (a smooth projective curve), the identification of Kähler differentials Ω^1_{F/k} with Weil differentials compatible with residues, so that regular Kähler differentials of the curve have dimension g and principal parts of differentials at the missing points of an affine curve have one-dimensional cokernel (residue theorem).
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/reduction-principal-parts-near-isomorphism

#### Contract 5

- **supplier:** LocallyAnalyticDistributions:L4
- **need:** The nonarchimedean nuclear trace/Fredholm comparison specifically for Dwork operators factoring through compact radius restrictions, and the corresponding locally convex inductive-limit domain, including independence of stage/presentation. Existing L4/compact-matrix-criterion, fredholm-determinant and finite-coordinate-determinant supply the Banach chart pieces; they do not establish that every LF compact endomorphism is nuclear, nor the trace identity on arbitrary LF spaces. OperatorTheory is over R/C and does not supply this extension.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/dwork-operator
- PadicDifferentialEquationsAndRigidCohomology:RD.6/lefschetz-trace-formula

#### Contract 6

- **supplier:** tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation
- **need:** Lie algebras of affine algebraic groups over a field of characteristic 0, with the dimension formula dim G = dim Lie(G), Lie algebras of normalisers and centralisers, and the criterion that a closed subgroup H ⊆ N has finite index iff Lie(H) = Lie(N) (with Layer 3 for components and quotients). A Tau Ceti layer cannot be listed as a node prerequisite; recorded here and as a gap.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/normaliser-over-centraliser-finite

#### Contract 7

- **supplier:** AdicSpacesPartII:R2
- **need:** Compatibility of the Raynaud generic fibre of the formal completion of projective n-space with projective rigid analytification, and classical rigid specialization (anticontinuous) versus the continuous adic specialization and interior-defined adic tube. Existing R2/raynaud-generic-fibre and R2/tube are imported; this request concerns only the comparison identities used by the chosen frames.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/frame
- PadicDifferentialEquationsAndRigidCohomology:RD.3/tube
- PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-space-two-embeddings-acceptance

#### Contract 8

- **supplier:** SchemeAndStackFoundations:SF.2
- **need:** Through SF.2’s existing upstreamIntegration mapping to the pending CohomologicalPointCounting/TraceFormula provider: For separated finite-type X over F_q and ℓ≠p, the constant Q_ℓ-sheaf trace identity #X(F_(q^r))=Σ_i(-1)^i Tr(Frob_q^r|H_c^i(X_Fbar,Q_ℓ)) for every r≥1, arithmetic zeta functions and their determinant expression. The exact planned statement was read in upstream PR 196 at head 4bd72379658126cbe9be935656396f0c9dac4de0, Layers 12–13. That PR is OPEN and absent from the checked current main; this is a pending provider, not an existing Tau Ceti roadmap or a proved theorem. Import it after upstream adoption instead of reproducing its plan. This request uses the registered SF.2 supplier stage only to reconcile that upstream import; SF.2 does not re-plan the trace theorem.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective
- PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-proper
- PadicDifferentialEquationsAndRigidCohomology:RD.7/rigid-zeta-expression

### PadicDifferentialEquationsAndRigidCohomology--RD.0

#### Contract 1

- **supplier:** SchemeAndStackFoundations:SF.0
**consumers**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/controlled-weak-smooth-lifting
- PadicDifferentialEquationsAndRigidCohomology:RD.0/endpoint-preserving-weak-homotopy
- **need:** Arabia §§1–2 controlled lifting over arbitrary ideals: for a ring R, ideal I, finitely presented smooth R-algebra S, surjection p:B→C with kernel J, map φ:S→C and compatible map hbar:S/IS→B/IB, construct an étale neighbourhood B→Bε of (IB)J (the actual canonical quotient map is an isomorphism), a surjection pε:Bε→C extending p, and hε:S→Bε with pε hε=φ and reduction hbar. Proposition 2.1.2(a) supplies polynomial approximations multiplicative modulo ((IB)∩J)^n; (b) supplies the exact neighbourhood lift. Corollary 2.1.3 is the C=0 case. Theorem 2.2.2 fixes both polynomial endpoints: the neighbourhood ideal is IB·T(T−1), not just IB. This is beyond the existing etale-neighbourhood and etale-section-selector targets.
**proofInputs**
- Arabia 1.1.5: a finitely presented smooth algebra is a retract of a smooth complete intersection, using the symmetric algebra of its finite projective conormal module; verify the cited Elkik Lemma 3, p.562, or provide the conormal argument directly. That cited proof has not been inspected in this pass.
- Arabia 1.1.6: lift a smooth complete intersection modulo an arbitrary ideal by lifting its equations and localising the lifted Jacobian determinant. The ideal need not be nilpotent.
- Arabia 1.2.3: lift a finite projective module with a finite free presentation after an étale neighbourhood of I. Lift its residual idempotent ψbar. For principal I=(π), write ψ²−ψ=πα and solve α+(2ψ−1)β+πβ²=0 in matrix coordinates. The Jacobian is invertible modulo π. The solution must commute enough with ψ: the commutator satisfies [ψ,πβ]=πQ[ψ,πβ]; invert det(1−πQ) to force it to vanish. Do not expand noncommuting matrices as if they commuted. Reduce a finitely generated I successively to this case; finite presentation reduces general I to finitely many coefficients. Nakayama supplies a localisation g≡1 modulo I needed to keep the chosen presentation.
- Arabia 1.3.1: lift the complete-intersection retract and its projective module, then use the symmetric-algebra presentation and its linear section to lift an arbitrary smooth algebra. Existing nilpotent formal-smooth lifting is insufficient.
- In 2.1.2 preserve the two prescribed maps through the symbolic finite-coefficient argument and the product-ideal neighbourhood. In Theorem 2.2.2 use the surjective endpoint map B[T]→B×B with kernel T(T−1). Never cancel π in a ring where π could be a zero divisor.
**sources**
- **sourceId:** arabia
- **locator:** §§1.1–1.3, pp.610–620; Théorème 2.1.2, pp.625–632; Corollaire 2.1.3, pp.632–633; Théorème 2.2.2, pp.633–634
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/controlled-weak-smooth-lifting
- PadicDifferentialEquationsAndRigidCohomology:RD.0/endpoint-preserving-weak-homotopy

#### Contract 2

- **supplier:** AdicSpacesPartII:F1
**consumers**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/controlled-weak-smooth-lifting
- PadicDifferentialEquationsAndRigidCohomology:RD.0/endpoint-preserving-weak-homotopy
- **need:** Supply the general weak-completion collapse used in Arabia §3.2: if A→B is flat and its canonical map A/πA→B/πB is an isomorphism, and the target weak completion is weakly finitely generated, then A†→B† is an isomorphism. Include the criterion that lifts of finitely many algebra generators modulo π weakly generate a weakly complete, weakly finitely generated algebra. Construct the relative weak completion of a finitely presented étale algebra over a weakly finitely generated base B†, preserving its quotient maps, so an étale neighbourhood of an ideal contained in πB† collapses back to B†. The existing weak-completion-presentation and mw-morphism-lifting do not state this arbitrary weak-target, endpoint-controlled contract.
**proofInputs**
- Use flatness and the mod-π isomorphism to identify every successive π-graded piece and every mod-π^m quotient, hence the completions. For weak surjectivity, lift the chosen mod-π generators and iterate the π-adic error with a degree bound linear in the π-order; the bounds, rather than formal completeness alone, keep the resulting series weakly convergent.
- For the relative finite presentation, construct its weak completion on a weak finite presentation over O, verify presentation independence and the universal property. All evaluation/quotient maps extend. An étale neighbourhood preserving mod π is flat, so the collapse applies. It preserves the original maps because the isomorphism is the canonical one.
**sources**
- **sourceId:** arabia
- **locator:** §3.2, especially Proposition 3.2.5, pp.635–636; §3.4, pp.637–639
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/controlled-weak-smooth-lifting
- PadicDifferentialEquationsAndRigidCohomology:RD.0/endpoint-preserving-weak-homotopy

#### Contract 3

- **supplier:** PerfectoidSpaces:P3
**consumers**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/overconvergent-galois-fixed-coefficients
- **need:** Supply completed characteristic-p fixed fields: for a complete nonarchimedean field κ of characteristic p, C the completion of an algebraic closure, and Gκ its automorphisms over κ, C^Gκ is the valuation-completed perfection of κ. Include the approximation theorem over a perfect complete field E: for algebraic α and Δ=min_σ v(σα−α), for every ε>0 there exists a∈E with v(α−a)≥Δ−ε. These are Fontaine–Ouyang Propositions 3.6 and 3.8 (characteristic-p branch), not the higher-tier mixed-characteristic Ax–Sen theorem.
**proofInputs**
- In a finite Galois extension of a perfect base choose c of trace 1. Replacing c by its p-power roots keeps trace 1 and makes its valuation arbitrarily close to zero. Then a=Tr(cα) approximates α, using αTr(c)=α; the manuscript display omits α in that equality.
- Approximate a completed invariant x by algebraic α. Every conjugate difference of α becomes arbitrarily small since the action is isometric and fixes x. Apply the approximation theorem and completeness of the perfect base. First pass to completed perfection for imperfect κ.
**sources**
- **sourceId:** fontaine-ouyang
- **locator:** Propositions 3.6 and 3.8, §3.1, pp.42–44
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.0/overconvergent-galois-fixed-coefficients

### PadicDifferentialEquationsAndRigidCohomology--RD.1

#### Contract 1

- **supplier:** PadicDifferentialEquationsAndRigidCohomology:RD.0
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-germ-extension
- PadicDifferentialEquationsAndRigidCohomology:RD.1/descending-generic-filtration
- PadicDifferentialEquationsAndRigidCohomology:RD.1/bijective-lattice-invariants
- PadicDifferentialEquationsAndRigidCohomology:RD.1/negative-frobenius-cokernel
- PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison
- **need:** Supply FF coefficient rings E†=colim B_[0,ρ], its π-adic completion E, and R_F=colim B_(0,ρ], in mixed and equal coefficient characteristic, with explicit norms, φ fixing π and q-power residue action. Match the HP Laurent charts when E=F_q((π)); provide intersections, gluing and scalar extensions. This is an RD.0 extension, not a duplicate FF vector-bundle roadmap.

### PadicDifferentialEquationsAndRigidCohomology--RD.2

### PadicDifferentialEquationsAndRigidCohomology--RD.3

### PadicDifferentialEquationsAndRigidCohomology--RD.4

#### Contract 1

- **supplier:** PadicDifferentialEquationsAndRigidCohomology:RD.3
- **need:** Refine the inherited strong-fibration and affine coefficient-equivalence targets to the exact conormal-coordinate/cofinal-radius hypotheses and invertible horizontal-Frobenius Taylor-convergence proof from Berthelot I 1.3.7–1.3.8 and II 2.5.7–2.5.8. RD.4 imports these nodes and does not duplicate them. Also export the no-F affine realization of E∈Isoc† as a finite projective A†_K-module with integrable connection AND Taylor convergence on a strict diagonal neighbourhood (BI Proposition 2.5.2(ii), global pp. 82–83), with lifted pullback from Corollary 2.5.6, p. 86. The existing RD.3 overconvergent-isocrystal owns this class; the Frobenius theorem supplies automatic convergence only when its invertible horizontal Frobenius hypotheses hold.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare
- PadicDifferentialEquationsAndRigidCohomology:RD.4/coefficient-long-exact-sequence
- PadicDifferentialEquationsAndRigidCohomology:RD.4/general-rigid-gysin
- PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-support-cohomological-bounds

#### Contract 2

- **supplier:** CrystallineCohomology:CR.5
- **need:** Extend the existing CR.5/log-exactification, log-de-rham and semistable-residues interfaces to the weak-formal W[t] admissible systems used by GK05 and Disegni–Liu: exactifications of embedding-product diagonals, strict/smooth local projection charts, and the exterior SNC residue isomorphism with incidence signs. Existing algebraic exactification and absolute component residues are imported by node id. Analytic open-polydisc Poincaré, common-refinement independence of tube realizations and proper log rigid/convergent comparison are RD.4 targets; the PD Poincaré lemma is not used as an analytic substitute. For admissibility, retain flatness and generic smoothness over W[t], smoothness over W, the special-base identity, and the induced higher embedding levels of DL B.1/GK05 §5.2; do not require the entire generic fibre to be smooth. This algebraic/formal supplier must not depend on the RD.4 analytic cohomology it is used to construct.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-proper-support-cohomology
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization

#### Contract 3

- **supplier:** AdicEtaleGeometry:A1
- **need:** Provide the Berkovich tube quasi-étale specialization map to the formal-completion étale site and formal/special étale equivalence, including closed-stratum restriction, as the analytic-site interface used by Disegni–Liu B.1. This extends that roadmap’s A1 site interfaces; it is not an equivalence of tube sheaves with special-fibre sheaves.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/quasi-etale-specialization

#### Contract 4

- **supplier:** EnhancedDerivedSheaves:E1
- **need:** Import derived pushforward, support-kernel triangles and adjunction transformations for bounded-below module-sheaf complexes on these sites, including naturality of connecting maps.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/quasi-etale-specialization
- PadicDifferentialEquationsAndRigidCohomology:RD.4/tube-proper-support-functor
- PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps

#### Contract 5

- **supplier:** EnhancedDerivedSheaves:E2
- **need:** Import hypercover descent and compatible derived pushforwards for coherent/log coefficient realizations; analytic and log comparison theorems themselves remain in RD.4/CR.5. Also supply the bounded-below derived inverse limits of boundary-ideal pro-de Rham complexes, cofinal invariance and compatibility with proper global sections used by Xu–Zhu. This is an inverse-limit construction, not adic module completion.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent
- PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes
- PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization

#### Contract 6

- **supplier:** EnhancedDerivedSheaves:E3
- **need:** Import injective resolutions of diagrams, homotopy-independent totalizations, bounded filtered-complex spectral sequences and exact filtered colimits of vector spaces. These are homological foundations, not new rigid coefficient definitions.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare
- PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex
- PadicDifferentialEquationsAndRigidCohomology:RD.4/igusa-theta-cokernel

#### Contract 7

- **supplier:** SchemeAndStackFoundations:SF.4
- **need:** Supply the proper projective refinements of compactifications used in the Chow-lemma step of CT03 §6.4/§8.3, the smooth affine weak lifts from Elkik used by the MW comparison, and smooth closed-pair local-coordinate lift data for the Gysin reduction. Keep these model/lifting results in the birational/formal geometry owner; their rigid comparisons belong to RD.4.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare
- PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent
- PadicDifferentialEquationsAndRigidCohomology:RD.4/general-rigid-gysin
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization

#### Contract 8

- **supplier:** AdicSpacesPartII:R3
- **need:** Supply proper rigid coherent GAGA for analytification of the boundary-ideal pro-complex and its coherent terms, and the admissible-cover/tube support comparisons in Xu–Zhu §§2.2.3–2.2.4. This is a requested extension in that roadmap’s analytic direction.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps

#### Contract 9

- **supplier:** AdicSpacesPartII:F1
- **need:** Keep ownership of dagger spaces/forms and their larger-radius ambient support/localization carrier complexes. Supply the exact compact-support carrier of GK00 §4.8 with radius-change maps. The comparisons with Berthelot rigid and log proper-support cohomology belong to RD.4; do not duplicate them in F1. For the fixed-model log comparison, supply the partially proper dagger closure tube and coherent log-form/coefficient extensions on it; a comparison between an arbitrary dagger chart and its ordinary completion is not sufficient.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-supported-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-dagger-comparison

### PadicDifferentialEquationsAndRigidCohomology--RD.5

#### Contract 1

- **supplier:** EnhancedDerivedSheaves:E2
- **need:** The calculus of universal cohomological descent on an arbitrary site, after SGA 4 Vbis and Conrad's notes (Zureick-Brown Definition 3.12, Theorems 3.16–3.17, Corollary 3.18): a morphism (or augmented simplicial object) X_• → S is of cohomological descent if id → Rp_*p^* is an isomorphism on D^+(S), universally so if this holds after every base change, and relative to a class of sheaves when only those are tested; (i) coverings, and morphisms with local sections, are universally of cohomological descent; (ii) universal cohomological descent is stable under base change, composition and cancellation (if X → Y → Z is, so is Y → Z), also relative to a sheaf and its pullbacks; (iii) for P the class of morphisms universally of cohomological descent, every P-hypercovering is universally of cohomological descent; (iv) disjoint unions of maps of descent relative to F_i are of descent relative to ⊔F_i. E2/hypercover and E2/bounded-below-hypercover-descent supply the topos-level hypercover descent; (i)–(iv) are not among their statements.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/modification-cohomological-descent
- PadicDifferentialEquationsAndRigidCohomology:RD.5/fppf-cohomological-descent
- PadicDifferentialEquationsAndRigidCohomology:RD.5/proper-surjection-cohomological-descent

#### Contract 2

- **supplier:** SchemeAndStackFoundations:SF.0
- **need:** For a projective scheme X over a field with an ample line bundle L: (a) the complement of the zero locus of a section of L is affine; (b) for a closed subscheme D and a finite subscheme Z disjoint from D, some section of a power of L vanishes on D and at no point of Z; (c) n + 1 sections of L without common zero define a finite morphism X → P^n (Kedlaya, More étale covers, Lemmas 3–4). These are the projective-geometry inputs of Kedlaya's finite projections étale off the hyperplane at infinity.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/projection-etale-off-hyperplane

#### Contract 3

- **supplier:** LocallyAnalyticDistributions:L0
- **need:** Over a discretely valued (spherically complete) K: (a) Mackey's theorem for semi-complete locally convex spaces V = (V'_c)', with the convex equicontinuous subsets of the dual being the relatively linearly compact convex sets; (b) in a Fréchet space every balanced convex closed bounded linearly compact set lies in the closed convex hull of a null sequence (Crew 2.9); (c) an infinite-dimensional K-Banach space is not reflexive; (d) Montel spaces: for Fréchet–Montel spaces the strong and linearly compact duals coincide. These complete L0/nonarchimedean-hahn-banach, L0/pseudo-polar-duality and L0/barrelled-banach-steinhaus for Crew's strictness criteria; the first pass's restructure proposal moves RD.5's strict-map, Fréchet–Montel transpose and finite-cokernel lemmas to L0 as well. (e) Exactness of the inverse-limit Čech sequence for increasing closed discs with Fréchet section spaces and dense restriction maps (the nonarchimedean analytic Mittag–Leffler argument in Crew, proof of Theorem 7.5, pp. 743–744); dense maps alone do not give the algebraic surjective-transition criterion.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/frechet-and-dual-frechet-finite
- PadicDifferentialEquationsAndRigidCohomology:RD.5/strictness-transpose-criteria
- PadicDifferentialEquationsAndRigidCohomology:RD.5/dagger-curve-mayer-vietoris

#### Contract 4

- **supplier:** CrystallineCohomology:CR.5
- **need:** Relative log crystalline cohomology with locally free ISOCrystal coefficients on Shiho’s Noetherian p-adic fine-log bases: if f is proper log smooth and either integral or has regular base Y, Rf_crys*E is a perfect Q ⊗ O_𝒴-complex (Shiho, arXiv:0707.1742v2, Theorem 1.16, p. 9; proof pp. 9–11). Do not assume E arises from a locally free integral crystal. CR.5/log-crystal supplies the finite-level integral definition, and CR.3/proper-perfectness the non-log case, but neither states this general result. Include the relative locally free isocrystal category and realisation on the log PD embedding system.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/relative-convergent-crystalline-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-perfect-complexes

### PadicDifferentialEquationsAndRigidCohomology--RD.6

#### Contract 1

- **supplier:** LocallyAnalyticDistributions:L4
- **need:** Trace and Fredholm theory for compact (nuclear) endomorphisms of LF spaces M = ∪_r M(r) of Banach spaces sharing an orthogonal basis (van der Put, Lemma and Definition 3.4), compatible with the Banach-stage Fredholm determinant: independence of the stage, additivity of traces along strict short exact sequences of such spaces with a stable subspace, Tr(θg) = Tr(gθ) for θ nuclear and g continuous. This is the request the parent packet records, restated for the alternating-trace lemma.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/nuclear-trace-on-complexes

#### Contract 2

- **supplier:** InverseGaloisAndArithmeticFundamentalGroups:IG.1
- **need:** For a smooth geometrically connected curve X over F_q with smooth compactification X̄: the étale fundamental group π_1(X, x̄), the exact sequence 1 → π_1(X ⊗ F̄_q) → π_1(X) → Gal(F̄_q/F_q) → 1, decomposition and inertia subgroups at the points of X̄ − X (with the wild inertia), and geometric Frobenius elements at closed points of X.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/unit-root-isocrystals-and-p-adic-representations
- PadicDifferentialEquationsAndRigidCohomology:RD.6/katz-lang-geometric-finiteness

#### Contract 3

- **supplier:** tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property
- **need:** The Jacobian of a smooth proper geometrically connected curve over F_q, with a rational point after a finite extension of F_q as Layer F's standing hypotheses require, with the Abel–Jacobi map and its universal property for maps to abelian varieties, as input to the identification of abelian étale covers of the curve with isogenies onto the Jacobian.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/katz-lang-geometric-finiteness

### PadicDifferentialEquationsAndRigidCohomology--RD.7

#### Contract 1

- **supplier:** ArithmeticGaloisRepresentations:R01.6
- **need:** For an abelian variety A over F_q and ℓ ≠ p: a Frobenius-equivariant isomorphism H^1_et(A_{F̄_q}, Q_ℓ) ≅ Hom(V_ℓA, Q_ℓ) under which the geometric Frobenius of the étale side is the transpose of V_ℓ(π_A), π_A the q-Frobenius endomorphism; equivalently the arithmetic Frobenius of Gal(F̄_q/F_q) acts on V_ℓA through V_ℓ(π_A). The DeligneWeightsAndPurity package imports the same statement from this layer (its input E11).
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/abelian-variety-crystalline-frobenius-polynomial

#### Contract 2

- **supplier:** NeronModelsAndSemistableAbelianVarieties:R11.5
- **need:** Fontaine's period rings B_cris ⊂ B_st with φ and N, the functors D_cris, D_st, D_dR on continuous p-adic representations of Gal(K̄/K) for K/Q_p finite, the predicates crystalline, semistable and de Rham, and D_cris = D_st^{N=0}, as planned in §5.3 of that roadmap's package; used for the representation V_{k,p} over K = Q_p and Q_p(√−p).
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-semistable-realization

#### Contract 3

- **supplier:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3
- **need:** Weak admissibility of D_st(V) for a semistable p-adic representation V of Gal(K̄/K), K/Q_p finite (the package's dSt_isWeaklyAdmissible), in the form: the Newton polygon of the filtered (φ, N)-module lies on or above its Hodge polygon with the same endpoints.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-newton-above-hodge

## Collected restructure proposals

These are inherited proposals for the manager. In particular, older generic-slope, crystalline-coefficient and full functional-analysis ownership descriptions are superseded in scope by the decisions above, while their proposals remain visible for audit. No restructuring file, stage graph or other roadmap was edited.

### PadicDifferentialEquationsAndRigidCohomology

#### Proposal 1

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PadicHodgeTheory
- **title:** Move the single Laurent-series carrier from P7 to RD.0 under the upstream tier rule
- **detail:** The older RT-AREA-padic-2/31 and RS-26 record put the carrier at P7. WORKERS now places RD at tier 12 and PHT at tier 13 and forbids upward citations.
- **proposal:** RD.0/frobenius-lift-on-robba-ring owns the convergent Laurent carrier, bounded/integral/Amice subrings and norms; P7 and its cyclotomic consumers import it. Existing comparison node IDs remain. The higher owner and RS-26 formerly list need manager reconciliation; no second Robba carrier is proposed.

#### Proposal 2

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AdicSpacesPartII
- **title:** Dagger algebras: F1 owns weak completion and overconvergent de Rham complexes, RD.0 owns Frobenius lifts on them
- **detail:** RD.0 asks to 'construct overconvergent power-series algebras as unions over strict radii, their weak completion maps and differential forms'; AdicSpacesPartII:F1 owns 'weakly complete dagger affinoid algebras, their radius-indexed presentations', 'differential forms, exterior derivative'. F1 does not mention Frobenius lifts.
- **proposal:** RD.0 imports weak completions, dagger algebras, Ω† and de Rham complexes from F1 (request recorded) and plans only the Frobenius-lift existence and homotopy statements (RD.0/frobenius-lift-on-dagger-algebra, RD.0/frobenius-lifts-induce-homotopic-maps), which ColemanIntegration L1 requests.

#### Proposal 3

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- VectorBundlesAndIsocrystals
- **title:** Dieudonné-Manin: VB0 covers E-breve (residue field F̄_q); RD.1 needs arbitrary algebraically closed residue fields and the extended Robba ring
- **detail:** VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block fixes isocrystals over W_{O_E}(F̄_q)[1/π] and uses Dieudonné-Manin there. Kedlaya's slope theory needs Dieudonné-Manin over W(κ, O)[π^{-1}] for κ the completed algebraic closure of k((t)) (generic slopes) and over the extended Robba ring R^alg (special slopes); the latter is equivalent, through Fargues-Fontaine's dictionary, to VB2's classification of bundles on X_C, but neither roadmap plans that dictionary.
- **proposal:** Keep RD.1/dieudonne-manin-classical (any algebraically closed residue field) and RD.1/dieudonne-manin-over-extended-robba-ring; VB0 cites RD.1/dieudonne-manin-classical for the general residue field, and the sign dictionary (VB0's block of slope d/h = Kedlaya's M_{−d,h}) is recorded in RD.1/standard-frobenius-modules. A comparison node 'φ-modules over the extended Robba ring ↔ bundles on X_C' belongs to VectorBundlesAndIsocrystals, Part II.

#### Proposal 4

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PhiGammaModulesAndIwasawaCohomology
- **title:** RD.1 σ-modules over R are the Γ-free core of PG.2's Robba (φ,Γ)-modules
- **detail:** AUDIT-37 lists PG.2 ('Robba (φ,Γ)-modules') as overlapping RD.1. PG.2 adds a Γ-action and the étale/Galois comparison; RD.1 has no Γ.
- **proposal:** Keep both; PG.2 imports RD.1/frobenius-module, RD.1/frobenius-slopes and RD.1/isoclinic-frobenius-module (and RD.2's slope filtration) instead of re-planning slopes of φ-modules over the Robba ring.

#### Proposal 5

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- RelativeFarguesFontaine
- **title:** Extended Robba ring versus the rings B_{C^♭,I} of RF0:annuli
- **detail:** For a perfect complete ℓ, Kedlaya's Γ^ℓ_I is, after renormalising radii, the ring of functions on the annulus Y_{Spa ℓ, I} of RelativeFarguesFontaine:RF0:annuli; RD.0 needs the analytic rings also for imperfect ℓ (k((t)) and its finite separable extensions).
- **proposal:** Keep RD.0/analytic-ring (general ℓ) and add a comparison with RF0:annuli/radius-function-and-rational-annuli for perfect ℓ when RF0 is implemented.

#### Proposal 6

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** The slope filtration theorem belongs to RD.2, not RD.1
- **detail:** The atlas text of RD.1 mentions slope filtrations with existence, uniqueness and descent; the reviewed decomposition and the part interface ids put the slope filtration theorem in RD.2 (id RD.2/slope-filtration-for-frobenius-modules-statement kept). Its proof needs the whole analytic ring theory of SFR (Bézout property, Dieudonné-Manin over the extended Robba ring, isoclinic descent), which is RD.2 material; RD.1 needs only Newton polygons and generic slopes over Γ.
- **proposal:** RD.1: differential modules, generic radii, Frobenius slopes and the classical Dieudonné-Manin decomposition over the complete ring Γ^alg[π^{-1}]. RD.2: the slope filtration theorem over the Robba ring with its descent (SFR Chapters 2-6), horizontality and the local monodromy theorem. Update the RD.1 stage text accordingly. For the atlas, RD.1 may also be divided into two sub-layers: RD.1a "p-adic differential modules and radii" and RD.1b "Frobenius modules and slopes".

#### Proposal 7

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- ColemanIntegration
- **title:** Residues and primitives on annuli: a foundational owner is needed
- **detail:** RD.2/robba-ring-antiderivative contains residue and logarithmic primitive statements also needed by ColemanIntegration L0. ColemanIntegration consumes RD, so an import from its broad L0 stage would risk a cycle. The shared analytic carrier belongs to RD.0 under WORKERS’ current tier ordering.
- **proposal:** Assign the foundational residue/primitive interface to RD.0, using the existing RD.2/robba-ring-antiderivative target as the source of its precise statements; RD.2 and ColemanIntegration consume the earlier interface. Do not restore the superseded higher-tier P7 carrier assignment. This ownership reconciliation does not add a node in the budget-bounded pass.

#### Proposal 8

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- CrystallineCohomology
- **title:** Convergent F-isocrystals (CR.3) versus overconvergent ones (RD.3)
- **detail:** The audit lists RD.3 against CR.1/CR.3. CrystallineCohomology:CR.3 owns convergent F-isocrystals; RD.3 owns frames, tubes, strict neighbourhoods, j†, overconvergent (F-)isocrystals, independence of the frame, the restriction functor and Kedlaya's full faithfulness theorem. The tube of a frame is needed by both.
- **proposal:** CR.1/CR.3 supply crystalline coefficient data, Frobenius and evaluation; RD.3 owns the ordinary analytic convergent category and the Frobenius-bearing crystalline comparison. Do not equate bare rational crystals and convergent coefficients without the required hypotheses.

#### Proposal 9

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AdicSpacesPartII
- **title:** Strict neighbourhoods: dagger affinoids (F1) versus tubes in frames (RD.3)
- **detail:** The AdicSpacesPartII:F1 stage lists strict neighbourhoods; RD.3's stage text lists strict neighbourhoods of the tube of a frame. These are different notions: an affinoid relatively compact in another (F1) and an admissible open V with ]X[ ⊆ V ⊆ ]Y[ such that {V, ]Y−X[} is an admissible covering (Berthelot 2.5a).
- **proposal:** F1 owns dagger algebras and affinoid strict neighbourhoods; RD.3 owns RD.3/strict-neighbourhood and j†, citing F1 to identify global overconvergent sections on affine frames with dagger algebras.

#### Proposal 10

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PadicHodgeTheory
- **title:** The p-adic local monodromy theorem is exported by RD.2; R06.3 keeps the Galois bridge
- **detail:** The audit lists R06.3 as restating the p-adic local monodromy theorem. RD.2 plans the analytic theorem and the comparison RD.2/berger-form-of-local-monodromy (Berger's Théorème 5.20 form: solutions in B†_log,L for a differential module with Frobenius over B†_rig,K).
- **proposal:** R06.3 cites RD.2/berger-form-of-local-monodromy and owns only V ↦ N_dR(V), Berger's Théorèmes 3.6/5.10 and the deduction that de Rham representations are potentially semistable.

#### Proposal 11

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AdicSpacesPartII
- **title:** RD.4 and AdicSpacesPartII:F1: who owns the overconvergent de Rham complex
- **detail:** F1 owns dagger algebras, their differential forms and exterior derivative, de Rham complexes on dagger spaces and compact-support variants by boundary vanishing; RD.4 restates "the overconvergent de Rham complex on frames".
- **proposal:** F1 keeps the analytic objects (dagger algebras, Ω^•, de Rham complexes of coherent modules with connection on dagger spaces and strict neighbourhoods). RD.4 owns j† on tubes of frames, the frame cohomology, rigid cohomology with and without supports, their independence of choices, functoriality and Frobenius, and imports F1 through requests.

#### Proposal 12

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AutomorphicGaloisRepresentationsPartII
- **title:** RD.4 and AG2.4: ordinary-locus rigid cohomology
- **detail:** AG2.4 builds the overconvergent logarithmic de Rham complex with compact-support boundary ideal and its hypercohomology for HLTT.
- **proposal:** AG2.4 consumes RD.4/rigid-cohomology, RD.4/compactly-supported-rigid-cohomology and RD.5/finiteness-of-rigid-cohomology and keeps only the Shimura-variety-specific boundary and slope comparisons.

#### Proposal 13

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- CrystallineCohomology
- **title:** RD.5 and CR.3: finiteness, duality and Künneth
- **detail:** CR.3 owns finiteness, base change, Künneth and (CR.3:duality) duality for crystalline cohomology of proper smooth schemes; RD.5 proves the rigid statements for all separated finite-type schemes with overconvergent F-isocrystal coefficients.
- **proposal:** Keep both; RD.5 does not use crystalline cohomology (Kedlaya's proof avoids it), and RD.7 compares the two for proper smooth X. Record a link RD.5 → RD.7 only.

#### Proposal 14

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** RD.2 and RD.5: absolute versus relative local monodromy
- **detail:** The audit lists RD.2 as duplicated by RD.5.
- **proposal:** RD.2 owns the local monodromy theorem over R_K; RD.5 owns its reformulation with a Robba-ring identification (Kedlaya, Finiteness, Theorem 5.1.2) and the relative theorem over dagger algebras (Theorem 5.1.3), which are new statements.

#### Proposal 15

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- LocallyAnalyticDistributions
- **title:** Nonarchimedean locally convex duality has no owner
- **detail:** RD.5 needs strict maps, LF and Fréchet–Montel spaces, transposes of strict maps and Hahn–Banach over a spherically complete field (Crew Part I; Kedlaya 8.3); LocallyAnalyticDistributions:L0 constructs locally convex inductive limits and continuous duals of spaces of locally analytic functions. Mathlib's locally convex spaces are over ordered fields.
- **proposal:** Move RD.5/strict-map, RD.5/frechet-montel-transpose-strict, RD.5/nonarchimedean-hahn-banach and RD.5/finite-cokernel-strict to LocallyAnalyticDistributions:L0 (or a new foundational nonarchimedean functional analysis layer), with RD.5 importing them.

#### Proposal 16

- **kind:** overlap
- **action:** rescope
**roadmaps**
- AdicCoefficientsAndComparisons
- SchemeAndStackFoundations
- **title:** Owner of de Jong alterations
- **detail:** The earlier RT-AREA-etale/21 prefix proposal predates the accepted RS-25 boundary and later RT-AREA-algebraicgeometry/16 fix. SF.4 owns de Jong’s schematic theorems; L5 imports them for its étale applications.
- **proposal:** Import SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem into RD.5. Keep the rigid hypercover construction and rigid descent here; L5’s étale hypercover descent is a separate consumer, not a substitute.

#### Proposal 17

- **kind:** sublayers
- **action:** split
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Sub-layers of RD.5 for the atlas
- **detail:** RD.5 has 73 target nodes in four distinct blocks after parent-stage reconciliation.
- **proposal:** RD.5a Relative local monodromy and generic pushforwards (relative-robba-ring … relative-local-monodromy-theorem, unipotent/relative-local-cohomology nodes, generic-pushforward-*, leray-long-exact-sequence, pushforward-flat-base-change, pushforward-external-product, six-term-isomorphism-lemma, finitely-generated-intersection); RD.5b Curves (near-isomorphism … crew-finiteness-and-duality-on-curves, van-der-put-legendre-computation, dimension-of-h1-of-affine-curve); RD.5c Topology and duality (strict-map … relative-poincare-duality, trace-map, poincare-pairing, top-compact-support-cohomology, excision-duality-compatibility, poincare-duality); RD.5d Main theorems (etale-covers-of-affine-space, finiteness-for-smooth-varieties, smooth-proper-hypercovering, cohomological-descent-for-proper-hypercoverings, finiteness-of-rigid-cohomology, finiteness-of-compactly-supported-rigid-cohomology, frobenius-bijective-on-cohomology, compact-support-vanishing-above-twice-dimension, euler-characteristic-duality, kunneth-*, no-finiteness-without-frobenius, affine-curve-duality-acceptance).

#### Proposal 18

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- DeligneWeightsAndPurity
- **title:** ι-weights of numbers and endomorphisms belong to DWP.0
- **detail:** RD.6's text asks to 'define algebraic/iota weights using an embedding of algebraic coefficient eigenvalues into C'; DWP.0 already owns Weil q-numbers and the ι-weight predicate on coefficient-field elements and on endomorphisms. RD.6 keeps only the pointwise weights of overconvergent F-isocrystals, ι-real/ι-realizable objects and determinantal weights, and imports the number-level notions (and the 'all ι ⇒ Weil number' bridge) from DWP.0.
- **proposal:** Narrow RD.6's weight target to overconvergent F-isocrystals; add the stage link DeligneWeightsAndPurity:DWP.0 → PadicDifferentialEquationsAndRigidCohomology:RD.6, and ask DWP.0 to state its predicates for an arbitrary characteristic-0 coefficient field (p-adic included).

#### Proposal 19

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- WeilConjectures
- **title:** RD.7 owns weight-separated identification of Weil factors under the current tier order
- **detail:** RD.7 needs uniqueness, rational descent and integrality of pure-weight factors over characteristic-zero coefficient fields. The later WC.3 consumer needs the same argument, so current-tier RD.7 owns it and WC.3 imports it.
- **proposal:** RD.7 owns the required weight-separated rational/integral Weil-factor identification under the current 94-roadmap tier scope; DWP.0 supplies the common weights and determinant formalism. WC.3 is a later consumer, not a prerequisite.

#### Proposal 20

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- DeligneWeightsAndPurity
- WeightsInEtaleCohomology
- **title:** Rigid Weil II versus ℓ-adic Weil II (DWP.5, R34.5)
- **detail:** The audit lists RD.6 as overlapping DWP.5 and R34.5. The overlap is structural only: the ℓ-adic local weights and fundamental estimate (DWP.5) and their interface (R34.5) concern lisse ℓ-adic sheaves, while RD.6 proves Kedlaya's rigid theorem for overconvergent F-isocrystals through the p-adic Fourier transform. Only the elementary positive-series lemma is shared (requested from DWP.2).
- **proposal:** Keep both; record that the analytic positive-series lemma is owned by DWP.2 and imported by RD.6; no mathematics moves.

#### Proposal 21

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- CrystallineCohomology
- **title:** RD.7 needs CR.2 as well as CR.3
- **detail:** The rigid–crystalline comparison computes crystalline cohomology by the PD-envelope de Rham complex of an embedding, which CR.2 owns; RD.7's stage text lists only CR.3.
- **proposal:** Add the stage link CrystallineCohomology:CR.2 → PadicDifferentialEquationsAndRigidCohomology:RD.7 (CR.2 already precedes CR.3, so no cycle).

#### Proposal 22

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- DeligneWeightsAndPurity
- **title:** RD.7's ℓ-adic comparison for smooth proper (non-projective) X needs DWP.7
- **detail:** DWP.4 gives ℓ-adic purity only for smooth projective X; RD.7's stage text says 'smooth proper'. The rigid side needs no projectivity (Kedlaya's purity).
- **proposal:** Add the stage link DeligneWeightsAndPurity:DWP.7 → PadicDifferentialEquationsAndRigidCohomology:RD.7 for the proper case, or narrow the ℓ-adic clause of RD.7 to projective X and let WC.6 (which already uses DWP.7) extend it.

#### Proposal 23

- **kind:** sub-layer
- **action:** split
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Split RD.6 into three sub-layers for the atlas
- **detail:** RD.6 has about sixty declarations in three independent strands.
- **proposal:** RD.6a 'Trace formula and L-functions' (normalisations, L-function, Dwork operators, trace formula, P^1/G_m tests); RD.6b 'p-adic Fourier transform' (D†, ρ, Dwork isocrystal, geometric transform, GOS, conductor estimate, degeneration lemmas of Kedlaya §3); RD.6c 'Weights and rigid Weil II' (ι-weights, determinantal weights, monodromy group, Rankin squaring, local weights, Weil II, purity, functional equation, slopes, curve H^1 weights).

#### Proposal 24

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Assign mixed full faithfulness to RD.5 while retaining integrated IDs
- **detail:** The ordinary coefficient category at RD.3 is unrelated to RD.1/RD.2 in the atlas. Results using both cannot be placed there.
- **proposal:** Seven inherited RD.3-prefixed IDs keep their identity but have parentStageId and realises RD.5. Pure frame/category construction stays RD.3; generic/global slopes stay RD.1 and local monodromy RD.2. New docility/semistable targets are recorded as RD.5 follow-up gaps. RD.3/etale-cover-of-affine-space also moves its parentStageId and realises to RD.5, preserving its integrated ID and exporting the geometric finiteness/weight input.

### PadicDifferentialEquationsAndRigidCohomology--RD.0

#### Proposal 1

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PadicHodgeTheory
- AdicSpacesPartII
- SchemeAndStackFoundations
- PerfectoidSpaces
- **title:** Complete RD.0 without higher-tier analytic ownership or duplicated weak completion
- **detail:** The reviewed parent moves the general Laurent carrier to RD.0 under the binding current tier order. Its topology, coefficient extension and generic compact preparation here consequently supply P7 annulus foundations. F1 owns weak carriers; SF.0 owns ordinary arbitrary-ideal smooth lifting; P3 owns the completed characteristic-p fixed-field theorem.
- **proposal:** Reconcile the RS-26 owner/formerly record and replace P7 Laurent topologies and circle preparation by imports from RD.0/laurent-topology-interface and RD.0/compact-laurent-preparation. Keep relative dagger-base Robba carriers in RD.5. Extend SF.0, F1 and P3 in their own directions with the three contracts recorded in requests. Do not move mixed-characteristic Hodge targets into RD.0. At assembly use planetAssembly to retain six displays without dropping any target.

#### Proposal 2

- **kind:** assembly
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Join the RD.0 follow-up to the parent RD.0 nodes
- **detail:** The parent RD.0 gaps on the Laurent topology, equal-characteristic annuli and Lazard ideal theory, and on the full topological Frobenius-lift signature, are discharged here, as is the Arabia half of the gap on unread proof interiors (Kedlaya–Xiao and Arabia Sections 1–2). The parent node frobenius-lift-on-robba-ring states both the Laurent, Robba and Amice carriers and the Frobenius lift. Thirteen nodes here use it only as the carrier, while its Frobenius clauses need weak-substitution-convergence and frobenius-radius-comparison, so giving it those prerequisites without a split would close a cycle. Its clause extending σ to R^bd, E and R is frobenius-radius-comparison itself, which uses the parent robba-ring, and robba-ring uses the lift.
- **proposal:** At assembly: (1) split the parent RD.0/frobenius-lift-on-robba-ring into a carrier node (A(r,1), R_K, R^bd, R^int, E and O_E with convolution) and a node for Frobenius lifts on O_E (the definition and the correspondence with u); point the carrier uses here at the carrier node and give the lift node the prerequisites RD.0/integral-amice-weak-topology and RD.0/weak-substitution-convergence. Its clause extending σ to R^bd, E and R is RD.0/frobenius-radius-comparison, which must not become a prerequisite of the lift node: it depends on the parent RD.0/robba-ring, which uses the lift. (2) Add RD.0/laurent-topology-interface to the parent RD.0/robba-ring, and RD.0/noncompact-analytic-bezout and RD.0/robba-closed-ideals to the parent RD.0/analytic-ring-bezout. (3) Add RD.0/controlled-weak-smooth-lifting to the parent RD.0/frobenius-lift-on-dagger-algebra, and RD.0/endpoint-preserving-weak-homotopy with RD.0/rational-dagger-interval-integration to the parent RD.0/frobenius-lifts-induce-homotopic-maps. (4) Drop the two parent gaps named above and cut the Arabia half of the third; its Kedlaya–Xiao half stays with RD.1. (5) Withdraw the parent request to AdicSpacesPartII:F1 for the weakly completed polynomial homotopy complex and its integration contraction: RD.0/endpoint-preserving-weak-homotopy builds the homotopy into F1’s weak polynomial extension with its evaluation maps, and RD.0/rational-dagger-interval-integration is the contraction. Each added edge was checked to be acyclic against the current packets.

### PadicDifferentialEquationsAndRigidCohomology--RD.2

#### Proposal 1

- **kind:** assembly
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Prerequisite edits for first-pass RD.2 nodes, to be made at assembly
- **detail:** This follow-up cannot edit the first-pass packet. Several first-pass RD.2 nodes now have planned suppliers here.
- **proposal:** At assembly: (1) replace the IMPORTED step of RD.2/tsuzuki-unit-root-finite-monodromy by RD.2/tsuzuki-equivalence-finite-local-monodromy (a) and add that node, RD.2/lang-trivialisation-of-unit-root-modules and RD.2/small-constant-unit-root-module-is-trivial to its prerequisites; drop the gap 'Tsuzuki's unit-root local monodromy theorem is imported, not proved'. (2) Add RD.2/quasi-constant-modules-are-semilinear-representations and RD.2/matsuda-decomposition to the prerequisites of RD.2/monodromy-representation-equivalence (its proof uses overview Lemma 4.3.2 and Theorem 4.6.6). (3) Add RD.2/local-monodromy-over-finite-etale-robba-extensions to RD.2/berger-form-of-local-monodromy and replace its hypothesis assigning the B†_rig,K identification to PadicHodgeTheory:P7 and PhiGammaModulesAndIwasawaCohomology:PG.0 by: the identification of B†_K with the unramified extension of B†_F attached to the field-of-norms extension belongs to the consumer R06.3; drop the gap 'Berger ring and Galois identifications moved down' and the Berger sentence of 'Tier-compatible Galois, Tannakian and zeta inputs'. (4) Add RD.0/completed-algebraic-closure-is-algebraically-closed to the prerequisites of RD.0/extended-robba-ring. (5) Mark the first pass's source issue E72 (Lemma 2.9.1) as known: corrected in Documenta Math. 12 (2007), 361-362.

#### Proposal 2

- **kind:** sub-layers
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Divide RD.2 into three sub-layers for the atlas
- **detail:** With this follow-up, RD.2 has 50 nodes and eight planet candidates (six from the first pass, two here: 'Irregularity equals Swan conductor' and 'André's local monodromy group'), more than one star can show.
- **proposal:** RD.2a 'Slope filtrations over the Robba ring' (first pass: finitely-presented-differential-module-is-free, slope-zero-eigenvectors-descend-to-overconvergent, special-polygon-above-generic, coincident-polygons-common-filtration, good-models-of-sigma-modules, isoclinic-descent-to-bounded-robba-ring, slope-filtration-for-frobenius-modules-statement, differentials-have-positive-slopes, slope-filtration-is-horizontal, isoclinic-model-inherits-connection; planets Isoclinic descent, Slope filtration theorem). RD.2b 'The p-adic local monodromy theorem' (first pass: finite-etale-extension-of-bounded-robba-ring, constant-and-quasi-constant-differential-module, unipotent-differential-module, quasi-unipotent-differential-module, robba-ring-antiderivative, unipotent-iff-nilpotent-residue, quasi-unipotent-implies-overconvergent, tsuzuki-unit-root-finite-monodromy, log-robba-ring, log-robba-ring-antiderivative, slope-pieces-horizontal-after-finite-extension, quasi-unipotence-and-local-monodromy-statement, local-monodromy-finite-etale-form, logarithmic-form-of-local-monodromy, berger-form-of-local-monodromy and the three acceptance applications; this packet: the nine Tsuzuki nodes and local-monodromy-over-finite-etale-robba-extensions; planets Unipotent differential module, Tsuzuki's unit-root monodromy theorem, p-adic local monodromy theorem, Logarithmic form of the local monodromy theorem). RD.2c 'Monodromy representations, ramification and the Tannakian group' (first pass: solution-space-phi-n-module, monodromy-representation-equivalence; this packet: quasi-constant-modules-are-semilinear-representations, matsuda-decomposition, highest-break-under-finite-etale-pullback, matsuda-highest-break-theorem, irregularity-equals-swan-conductor, quasi-unipotent-modules-admit-frobenius-structures, differential-modules-with-algebraic-constants, unipotent-solutions-and-residues, andre-local-monodromy-group; planets Irregularity equals Swan conductor, André's local monodromy group). If the sub-layers are not adopted, the assembly keeps six planets and drops the two proposed here.

#### Proposal 3

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PadicHodgeTheory
- **title:** Berger's form: RD.2 exports the theorem over R^L; the field-of-norms identification stays with PadicHodgeTheory
- **detail:** The first pass asked for the B†_rig,K identification to move down into RD.2 from PadicHodgeTheory:P7 and PhiGammaModulesAndIwasawaCohomology:PG.0. RD.2 does not need it: Berger's ring is B†_rig,F ⊗_{B†_F} B†_K (Lemme 3.13), which is R^L for the field-of-norms extension L of F_p((π)), and the local monodromy theorem holds over every R^L (RD.2/local-monodromy-over-finite-etale-robba-extensions).
- **proposal:** R06.3 (tier 13) cites RD.2/local-monodromy-over-finite-etale-robba-extensions (part (c)) together with its own P7 identification of B†_K; no notion moves down, and RD.2 cites no p-adic Hodge theory.

#### Proposal 4

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Local duality over the Robba ring belongs with RD.2
- **detail:** The RD.1 continuation (packet PadicDifferentialEquationsAndRigidCohomology--RD.1, merged 2026-10-14 while this job ran) plans RD.1/residue-duality-pairing and RD.1/robba-residue-duality (Kedlaya, p-adic Differential Equations, Proposition 20.4.2, as used by Dospinescu-Le Bras). Its proof cites RD.2/local-monodromy-finite-etale-form, RD.2/logarithmic-form-of-local-monodromy and RD.2/unipotent-iff-nilpotent-residue, so an RD.1 node depends on RD.2 while the atlas has RD.1 → RD.2; and its gap G5 asks for a public proof that cohomology, residue and duality descend along finite covers. Part (a) of RD.2/matsuda-decomposition is that public proof for quasi-unipotent modules (Kedlaya overview §4.4, Proposition 4.4.3, arXiv).
- **proposal:** At assembly, give RD.1/robba-residue-duality parentStageId RD.2 (keeping its id, as the first pass did for RD.3-prefixed nodes now in RD.5) and add RD.2/matsuda-decomposition to its prerequisites, which closes its gap G5; RD.1/residue-duality-pairing (the pairing itself) can stay in RD.1. Then the layer order RD.1 → RD.2 has no exception.

#### Proposal 5

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- PerfectoidSpaces
- **title:** The characteristic-free completion lemma is general field theory
- **detail:** RD.0/completed-algebraic-closure-is-algebraically-closed is planned here because the first pass assigned the missing source to RD.2. PerfectoidSpaces (tier 3), P4/algebraically-closed-extension-of-affinoid-field, records the same characteristic-p case as a gap, and Mathlib's Dense.lean lists the upgrade of IsAlgClosed.of_denseRange as a TODO. DiamondEtaleCohomology:C8/finite-topological-generators (tier 11) proves the same lemma inline from Conrad §2, and RD.0/extended-robba-ring uses it without a citation.
- **proposal:** Keep the node in RD.0 while no lower roadmap plans it. If PerfectoidSpaces plans the lemma, RD.0 cites that node and this one becomes a pointer; if Mathlib proves it, cite the declaration. The lowest roadmap that needs the lemma is PerfectoidSpaces (P4); the TauCetiRoadmap pull request for PerfectoidSpaces does not state it as a target.

#### Proposal 6

- **kind:** overlap
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- **title:** The first pass's slope filtration theorem generalises a target the FiniteFlatGroups package moved down
- **detail:** The accepted package of FiniteFlatGroupsAndIntegralPadicHodgeTheory (tier 10, review accepted 2026-10-13) moved down, as §R07.4.7 (the Robba ring, φ-modules, degree, slope, purity) and §R07.4.8 (Kedlaya's slope filtration theorem with Dieudonné-Manin over the extended Robba ring and descent of pure modules), the notions its plan had cited from RD.1. Those targets are the case k perfect, coefficients W(k)[1/p], q = p and the standard Frobenius of the first pass's RD.2 nodes slope-filtration-for-frobenius-modules-statement, isoclinic-descent-to-bounded-robba-ring and their RD.0/RD.1 inputs, which allow a ramified coefficient ring, a q-power Frobenius lift, an arbitrary lift and imperfect k. They are package targets without packet node ids, so this packet cannot cite them by id.
- **proposal:** At the RD assembly or package: cite FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.7-§R07.4.8 for that special case, keep in RD.0-RD.2 only the generalisation, and state the compatibility (for k perfect, O = W(k), q = p and σ(u) = u^p the RD objects and filtrations are those of §R07.4.7-§R07.4.8). Nothing in this follow-up depends on the choice.

#### Proposal 7

- **kind:** placement
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Dwork's transfer theorem to the centre of a disc could sit in RD.1
- **detail:** RD.2/dwork-transfer-to-the-centre-of-a-disc is a statement about generic radii (RD.1 material); its only consumer is RD.2's key lemma.
- **proposal:** The assembly may move it to RD.1 next to RD.1/dwork-transfer-generic-disc; no RD.1 node needs it, so either placement is acyclic.

#### Proposal 8

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** The RD.6 follow-up restates the local break and Swan comparisons planned here
- **detail:** The RD.6 follow-up packet (PadicDifferentialEquationsAndRigidCohomology--RD.6, merged on 2026-10-14 just before this one) plans RD.6/highest-break-equals-ramification-break, the same statement and proof as RD.2/matsuda-highest-break-theorem (Kedlaya overview Theorem 5.4.10), and RD.6/irregularity-equals-swan, whose local content is RD.2/irregularity-equals-swan-conductor (a)-(b). The local theory belongs to RD.2, which precedes RD.6.
- **proposal:** At assembly (or in the RD.6 review), RD.6/highest-break-equals-ramification-break becomes a citation of RD.2/matsuda-highest-break-theorem, and RD.6/irregularity-equals-swan keeps only the packaging for overconvergent F-isocrystals on a curve at each boundary point, citing RD.2/irregularity-equals-swan-conductor for the local equality.
- **addedBy:** REV-PadicDifferentialEquationsAndRigidCohomology--RD.2

### PadicDifferentialEquationsAndRigidCohomology--RD.3

#### Proposal 1

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **detail:** Two results listed among RD.3's open items are statements about overconvergent coefficients but their proofs need relative rigid cohomology R^q f_rig*, its coherence and base change (Tsuzuki 2003, §§2–3, Theorem 3.3.1), which is downstream of RD.3: Berthelot's Théorème 5 (Mém. SMF 23, p. 30, stated without proof; proved as Tsuzuki 2003, Theorem 4.1.1, pp. 906–908) and Étesse's Théorème 7 (pp. 599–600). Étesse's proof also uses Zarhin's trick, whose atlas owner ArakelovGeometryAndAbelianHeights:R35.6 is in tier 16 and cannot be cited from tier 12, and Siegel moduli with level structure (AlgebraicModuliForArithmeticGeometry:R09.4, tier 4).
- **proposal:** Plan both at RD.5 (finiteness and relative cohomology): (i) for a proper smooth f: X → S of smooth k-schemes admitting a proper formal lift smooth over a smooth formal lift of S (Tsuzuki's 'liftable' situation), R^q f_rig* E is an overconvergent isocrystal for every overconvergent E, compatible with base change and zero for q > 2 dim(X/S); (ii) for an abelian scheme f: A → S over a smooth separated k-scheme and e ≤ p − 1, the convergent F-isocrystal (R^i f_cris* O)^an extends to an overconvergent F-isocrystal, by polarisation, level structure, Zarhin's trick, (i) on the universal family and descent along the finite étale level cover, consuming RD.3/direct-summands-of-overconvergent-f-isocrystals, RD.3/etale-descent-of-overconvergent-f-isocrystals and RD.3/f-crystal-to-convergent-f-isocrystal. Zarhin's trick moves down: plan it in the tier-6 roadmap AbelianSchemesAndArithmeticModuli (or at RD.5 as a stated input) and point R35.6 at the new owner.

#### Proposal 2

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **detail:** RD.3 has 22 targets in the main document and 27 in this part, falling into three blocks; one star cannot show their structure.
- **proposal:** Sub-layers for the atlas, keeping the stage RD.3: RD.3a 'Tubes, strict neighbourhoods and j†' (frame, tube, strict-neighbourhood, standard-strict-neighbourhoods, etale-tube-isomorphism, etale-strict-neighbourhood-isomorphism, weak- and strong-fibration-theorem, j-dagger, j-dagger-properties, j-dagger-exactness-and-functoriality, coherent-j-dagger-modules, coherent-j-dagger-gluing); RD.3b 'Overconvergent isocrystals' (overconvergent-isocrystal and its connection form, overconvergence-is-a-property, taylor-series-convergence-criterion, frame-pullback-functor, taylor-comparison-of-pullbacks, independence-of-frame and of-compactification, isocrystals-glued-from-local-frames, zariski-stack-of-overconvergent-isocrystals, overconvergent-isocrystals-of-a-variety, overconvergent-f-isocrystal, the Monsky–Washnitzer nodes, weak-completion-henselian-descent, finite étale lifting and pushforward, Étesse's descent and direct summands, kummer-isocrystal, the Liouville nodes, affine-space-two-embeddings-acceptance); RD.3c 'Convergent and unit-root F-isocrystals' (convergent-isocrystal, convergent-f-isocrystal, f-crystal-to-convergent-f-isocrystal, convergent-f-isocrystals-are-crystalline, underlying-bundle-of-convergent-isocrystal, restriction-to-convergent, unit-root-f-isocrystal, crew-unit-root-correspondence). The planets would then be Frame and Tube (RD.3a), Berthelot's j† functor, Independence of the frame and Overconvergent F-isocrystal (RD.3b), Convergent F-isocrystal (RD.3c).

### PadicDifferentialEquationsAndRigidCohomology--RD.4

#### Proposal 1

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AdicSpacesPartII
- **title:** Dagger carriers in F1; rigid comparison in RD.4
- **detail:** F1 owns dagger forms and the analytic ambient support/localization complexes. RD.4 owns identification with Berthelot ordinary, supported, compact and model-specific log rigid cohomology. This prevents parallel compact-support theories.
- **proposal:** Narrow the F1 comparison clause to its generic dagger/completion comparison and carrier-level support operations; point its Berthelot/log comparison consumers at these RD.4 targets.

#### Proposal 2

- **kind:** dependency
- **action:** add-links
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- AutomorphicGaloisRepresentationsPartII
- **title:** Ordinary-locus comparison, finiteness and weights
- **detail:** RT-AREA-padic-2/32 requires three distinct imports by AG2.4: comparison from RD.4, finiteness from RD.5 and Frobenius weights from RD.6. A comparison alone does not prove finite slope pieces or weights.
- **proposal:** Apply the three evidence-backed links recorded in proposedLinks; preserve the explicit G2 log realization obligation.

#### Proposal 3

- **kind:** planets
- **action:** consolidate
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** One six-planet inventory after RD.4 assembly
- **detail:** The accepted parent already marks RD.4 planets; this part adds three candidates, so assembly must reconcile rather than concatenate the two inventories.
- **proposal:** Use the final six: Rigid cohomology; Compactly supported rigid cohomology; Frobenius on rigid cohomology; Rigid Gysin isomorphism (this general target replaces the restricted one); Dagger–rigid cohomology comparison; Log rigid cohomology with proper support. Remove the other inherited RD.4 planet flags during authorized assembly, keeping their targets.

#### Proposal 4

- **kind:** ownership
- **action:** move-down
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Ordinary support amplitude before finiteness
- **detail:** DL B.5 needs ordinary rigid vanishing above twice dimension. The accepted RD.5 named vanishing target is compact support, so the new ordinary/closed-support bound is planned once in RD.4 and imported by RD.5.
- **proposal:** Point later finiteness/vanishing applications at RD.4/rigid-support-cohomological-bounds. Keep RD.5’s compact-support vanishing and finiteness targets as their existing owner.

#### Proposal 5

- **kind:** ownership
- **action:** rescope
**stages**
- PadicDifferentialEquationsAndRigidCohomology:RD.4
- CrystallineCohomology:CR.6
- **detail:** The current CR.5 packet includes CR.6 convergent-log-complex and tube-proper-support clients and explicitly requests their analytic embedding/tube foundations from RD.4 or an RD Part II. This continuation supplies the requested source-qualified analytic interfaces; it does not add log crystalline, Witt or Hyodo–Kato comparisons.
- **proposal:** Point the CR.6 client interfaces at RD.4/log-rigid-realization, quasi-etale-specialization, tube-proper-support-functor and supported-log-de-rham-complexes. Retain CR.5 ownership of algebraic log charts, differentials, exactification and component residues. Consolidate the unsupported completed realization as a client of these interfaces, so no second analytic support or tube construction is implemented in CR.6. The remaining Fréchet, Stein-exhaustion and completed-tensor requests remain outside this RD.4 pass.

### PadicDifferentialEquationsAndRigidCohomology--RD.5

#### Proposal 1

- **kind:** sublayers
- **action:** split
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Display groups of RD.5; stage ordering deferred to assembly
- **detail:** The first pass plus this follow-up has 108 target nodes. The five named groups below are useful reader groups, not an established ordered sublayer decomposition: functional analysis precedes curve duality, whereas final duality and arbitrary base change use descent and finiteness.
- **proposal:** RD.5a Relative local monodromy and generic pushforwards (as in the first pass). RD.5b Curves: the first pass's curve nodes with curve-lift-with-boundary, dagger-curve-mayer-vietoris, principal-parts-index-computation, log-rigid-comparison-for-curves and igusa-theta-cokernel-finite. RD.5c Topology, trace and duality: the first pass's strict-map … poincare-duality with frechet-and-dual-frechet-finite, strictness-transpose-criteria, robba-topological-residue-duality, robba-plus-minus-duality, overconvergent-germ-hom-lemma, rigid-trace-morphism, compact-support-gysin-and-trace, top-degree-dimension-one, finite-etale-trace-projector, supported-duality-morphism, kunneth-pairing-on-tubes and rigid-cohomology-base-field-extension. RD.5d Dévissage, descent and the main theorems: the first pass's main-theorem nodes with RD.3/etale-cover-of-affine-space, projection-etale-off-hyperplane, overconvergent-site, overconvergent-site-comparison, modification-cohomological-descent, fppf-cohomological-descent, proper-surjection-cohomological-descent, proper-hypercover-descent-spectral-sequence, finiteness-for-smooth-quasi-projective-models, relative-convergent-crystalline-comparison, convergent-direct-image-smooth-proper and convergent-direct-image-perfect-complexes. RD.5e Full faithfulness, docility and semistable reduction (new): the seven RD.3-prefixed mixed full-faithfulness nodes with unipotent-monodromy-along-boundary, extension-across-boundary, dense-open-restriction-fully-faithful, convergent-log-isocrystal, log-extension-of-unipotent-isocrystal, global-semistable-reduction and docility-acceptance. These are display groups only. At assembly split the early functional-analysis inputs from final Poincaré duality, Künneth and arbitrary base change, and separate finite-level Igusa applications from the curve input they consume. Construct an acyclic sublayer order from the full target dependency graph; do not impose edges between these five groups wholesale. Preserve at most six planets per actual sublayer and preserve target ids. This proposal is not ready to apply as five ordered layers.

#### Proposal 2

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- LocallyAnalyticDistributions
- **title:** Hahn–Banach is owned by LocallyAnalyticDistributions:L0
- **detail:** RD.5/nonarchimedean-hahn-banach (first pass) duplicates LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach (tier 4, accepted), whose consequence (b) is exactly the continuous-extension statement RD.5 uses; the L0 follow-up already replaced its own citation of the RD.5 node.
- **proposal:** Drop RD.5/nonarchimedean-hahn-banach at assembly and repoint its consumers (RD.5/frechet-montel-transpose-strict, RD.5/poincare-duality-on-affine-space) to LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach, as listed in supersededNodes. The first pass's proposal to move the remaining locally convex lemmas to L0 stands; this packet's two new functional-analysis lemmas are planned here only because L0 lacks Mackey's theorem and the Fréchet–Montel statements (requested).

#### Proposal 3

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- CrystallineCohomology
- **title:** CR.6's request to RD.5 points upward
- **detail:** CrystallineCohomology (tier 9) requests from RD.5 (tier 12) strict Fréchet and ind-Fréchet derived cohomology interfaces for semistable Stein exhaustions and finite-dimensional log rigid pieces (CR.6/stein-hk, stein-hk-comparison, tower-hk). Under the upstream tier rule a tier-9 plan cannot cite RD.5; RD.5's finiteness theorems are for k-varieties, not for Stein exhaustions of rigid curves.
- **proposal:** CR.6 plans the Stein-exhaustion interfaces itself (the notion moves down), importing AdicSpacesPartII:F1 dagger finiteness and duality (tier 3) and LocallyAnalyticDistributions:L0; RD.5 does not serve the request.

#### Proposal 4

- **kind:** ownership
- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **title:** Place the existing proper rigid–crystalline comparison before RD.5
- **detail:** Trace, supported duality, Künneth compatibility and the proper-smooth step of arbitrary base change use the existing RD.7/rigid-crystalline-comparison, which itself has no RD.5 prerequisite. Leaving its construction until RD.7 hides an internal upward dependency.
- **proposal:** Move the existing constant-coefficient RD.7/rigid-crystalline-comparison and RD.7/tube-to-envelope-comparison-map plus RD.7/comparison-map-quasi-isomorphism to the RD.4 comparison block at assembly, preserving stable ids or recording aliases. Preserve their recorded proof gaps. Keep the later q-linear Frobenius normalisation with RD.6–RD.7; do not move the whole RD.7 coefficient/Frobenius block and create a cycle. Locally free crystalline coefficients must be covered before using the corresponding compatibility; imperfect Cohen-field comparison remains the explicit gap in this packet.

### PadicDifferentialEquationsAndRigidCohomology--RD.6

#### Proposal 1

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- DeligneWeightsAndPurity
- **detail:** RT-AREA-etale/9: RD.6 must import Weil q-numbers and ι-weights from DWP.0 rather than define them.
- **proposal:** Add the stage edge DeligneWeightsAndPurity:DWP.0 → PadicDifferentialEquationsAndRigidCohomology:RD.6. RD.6 defines only pointwise purity and mixedness of overconvergent F-isocrystals (parent RD.6/pointwise-iota-weights) and imports DWP.0/weil-q-number, /iota-weight, /endomorphism-weights, /purity-under-subquotients-and-extensions, /twisting-by-rank-one-characters, /characteristic-power-series-and-traces and /embeddings-into-the-complex-numbers. Add RD.6 to the 'formerly' list of the DWP.0 owner record for these notions (the DWP.0 packet's own restructure entry already implements its side).

#### Proposal 2

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- ArithmeticGaloisRepresentations
- **detail:** RT-AREA-padic-2/34: the p-adic GOS formula needs Christol–Mebkhout's index theory and Irr_x = Swan_x, with Swan conductors of equal-characteristic local fields.
- **proposal:** Add the stage edge ArithmeticGaloisRepresentations:R01.3 → PadicDifferentialEquationsAndRigidCohomology:RD.6 (R01.3 already covers equal characteristic k((t)) with perfect residue field: R01.3/breaks-and-swan-conductor, /swan-from-breaks, /artin-schreier-swan-conductor, so no extension of R01.3 is needed). The local Christol–Mebkhout index theorems are the RD.1-parented node RD.1/christol-mebkhout-local-index planned in this packet; the global Euler–Poincaré formula needs rigid cohomology and finiteness (RD.4, RD.5) and therefore sits at RD.6, with Irr_x = Swan_x at the points at infinity (the local break comparison is RD.2/matsuda-highest-break-theorem and RD.2/irregularity-equals-swan-conductor). The comparison passes through an algebraically closed residue field, i.e. R01.3's tier (P).

#### Proposal 3

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- MotivesAndAlgebraicCycles
- **detail:** The neutral Tannakian recognition theorem is planned only by MotivesAndAlgebraicCycles MC.6, which RD may not cite.
- **proposal:** Owner record: neutral Tannakian recognition (Deligne–Milne Theorem 2.11 and Proposition 2.20) is owned by PadicDifferentialEquationsAndRigidCohomology:RD.6 (node RD.6/neutral-tannakian-recognition), formerly MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction; MC.6 imports it.

#### Proposal 4

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- InverseGaloisAndArithmeticFundamentalGroups
- ClassicalArithmeticCompletion
- LefschetzPencilsAndVanishingCycles
- AdicSpacesPartII
- AutomorphicGaloisRepresentationsPartII
- **detail:** New cross-roadmap inputs and one export.
- **proposal:** Add stage edges InverseGaloisAndArithmeticFundamentalGroups:IG.1 → RD.6 (fundamental groups and inertia of curves over F_q), ClassicalArithmeticCompletion:CA.6 → RD.6 (Kronecker–Hankel rationality), LefschetzPencilsAndVanishingCycles:LPV.1 → RD.6 (monodromy filtration), AdicSpacesPartII:R3 → RD.6 (proper rigid GAGA), and RD.6 → AutomorphicGaloisRepresentationsPartII:AG2.4 (weights of rigid cohomology of the ordinary locus, as RT-AREA-padic-2/32 asks; the comparison itself is RD.4's). All edges point from lower to higher tiers and create no cycle.

#### Proposal 5

- **action:** split
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **detail:** RD.6 now has about 95 nodes and twelve planets across four topics; the atlas shows at most six planets per layer.
- **proposal:** Divide RD.6 into four sub-layers. RD.6:trace-formula — linear Frobenius, fibres, Tate twists, L-functions, Dwork operators, nuclearity and nuclear-trace-on-complexes, the trace formula, rationality, closed-points-and-zeta-function, rational-descent-of-power-series, Monsky–Washnitzer formula, projective line (planets: L-function, Lefschetz trace formula). RD.6:coefficients — constant-f-line, dwork-isocrystal, dwork-additive-character, kummer-isocrystal, dwork-kummer-sign-dictionary, kloosterman-f-isocrystal, kloosterman-local-monodromy-and-purity (planets: Dwork isocrystal, Kummer F-isocrystal, Kloosterman F-isocrystal). RD.6:fourier-and-conductors — Weyl algebra, Fourier transform, geometric transform and comparison, fourier-frobenius-extension, fourier-comparison-is-frobenius-equivariant, swan-conductor-of-isocrystal, RD.1/christol-mebkhout-local-index (imported), christol-mebkhout-global-euler-characteristic, irregularity-equals-swan, GOS, conductor estimate (planets: p-adic Fourier transform, p-adic Euler–Poincaré formula). RD.6:weights — pointwise weights, ι-real, rank-one nodes, determinantal weights, neutral-tannakian-recognition, coefficient-category-is-neutral-tannakian, global monodromy group, Rankin squaring, weight drop, local invariants, local-monodromy-weight-purity, weight-normalising-constant-line, Weil II on A^1 and in general, smooth proper purity, middle-cohomology-is-pure, symmetric-power-kloosterman-middle-cohomology, slopes and nonnegative-slopes-constant-coefficients-on-curves, curves (planets: ι-weights, Rigid Weil II, Finite monodromy of rank-one F-isocrystals, Neutral Tannakian recognition theorem, Local weight–monodromy purity).

#### Proposal 6

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **detail:** Added by REV-PadicDifferentialEquationsAndRigidCohomology--RD.6: the follow-ups RD.2, RD.3 and RD.6 were planned concurrently, and RD.6 restated four results the lower follow-ups own: Matsuda's comparison of differential and ramification breaks (RD.2/matsuda-highest-break-theorem, RD.2/irregularity-equals-swan-conductor), the Kummer isocrystal (RD.3/kummer-isocrystal) and Crew's unit-root correspondence (RD.3/crew-unit-root-correspondence, RD.3/unit-root-f-isocrystal).
- **proposal:** Owner records for the assembly: the local break comparison and the local Irr = Swan belong to RD.2; the Kummer isocrystal with its p-power Frobenius structure and the unit-root correspondence belong to RD.3. RD.6/highest-break-equals-ramification-break is withdrawn (no packet cited it). RD.6/irregularity-equals-swan keeps only the identification at the points at infinity of a curve, RD.6/kummer-isocrystal only the q-power Frobenius over F_q and its trace function, and RD.6/unit-root-isocrystals-and-p-adic-representations only the K-coefficient form and Tsuzuki's theorem on curves; each now cites its lower owner. The planet name "Irregularity equals Swan conductor" stays with RD.2's node; RD.6's planet moves to the p-adic Euler–Poincaré formula.

### PadicDifferentialEquationsAndRigidCohomology--RD.7

#### Proposal 1

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- DeligneWeightsAndPurity
- WeilConjectures
- **detail:** The characteristic-zero weight-separation theorem and the rationality-descent/Fatou lemma (RD.7/weight-separated-factor-extraction, RD.7/rational-zeta-descent-and-fatou) restate WeilConjectures:WC.3/degreewise-pure-factor-extraction and WC.1/local-fatou-normalization, WC.1/rationality-over-q-via-hankel-determinants. WeilConjectures is outside the upstream tiers and consumes RD.7, so the accepted parent review moved this argument down into RD.7. DeligneWeightsAndPurity (tier 11) also cites the same WC.1/WC.3 statements (its package inputs E50–E53) and is below this roadmap.
- **proposal:** Give both statements a single owner at the lowest consumer: DeligneWeightsAndPurity:DWP.0 (eigenvalue weights and functorial linear algebra), as pure statements about power series and Weil numbers. When DWP's upward WC citations are moved down, transfer the two RD.7 nodes there unchanged; RD.7, WC.1 and WC.3 then import them. Until that move RD.7 owns them, as the accepted parent review decided.

#### Proposal 2

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- CohomologyComparisons
- **detail:** Fresán–Sabbah–Yu Proposition 5.23 and Corollary 5.27 (routed to RD.6/RD.7 by PAPER-FRESAN-SABBAH-YU-22) are statements about the p-adic Galois representation V_{k,p}: semistability over Q_p(√−p), crystallinity for large p and weak admissibility. Their proofs need C_dR and C_st, which CohomologyComparisons:CP.4 plans in a higher tier.
- **proposal:** Move RD.7/kloosterman-semistable-realization and RD.7/kloosterman-newton-above-hodge to CohomologyComparisons:CP.4 as applications of its proper semistable comparison, importing from this roadmap the middle rigid cohomology of Sym^k Kl_2 (RD.6) and Mieda's comparison map RD.7/mieda-p-adic-picard-lefschetz, which stay here because they are statements about rigid and log-crystalline cohomology.

#### Proposal 3

- **action:** rescope
**roadmaps**
- PadicDifferentialEquationsAndRigidCohomology
- **detail:** The parent packet lists 'the rational Ogus–Shiho cohomology comparison used in RD.7' among the remaining work of both RD.3 and RD.7.
- **proposal:** RD.3 owns the convergent coefficient model (the ordinary convergent site, convergent isocrystals and the equivalence with F-crystals up to isogeny, Kedlaya's Notes Theorem 2.2); RD.7 owns the cohomological comparisons (RD.7/tube-to-envelope-comparison-map, RD.7/comparison-map-quasi-isomorphism, RD.7/crystalline-rigid-comparison-with-coefficients). The RD.3 follow-up and the assembly should drop the cohomology comparison from RD.3's list and cite these nodes.

## Remaining mathematical obligations

The assembly is complete; the following proof obligations are deliberately open. Resolve them in their stated owning layer or supplier, then arrange an independent mathematical review before asserting closure.

### PadicDifferentialEquationsAndRigidCohomology

#### Proof of independence of compactification for compact supports (Berthelot, Théorème 4)

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-independence-of-compactification
- **detail:** Stated without proof in MSMF 23; Chiarellotto–Tsuzuki treat only cohomology without supports. NEXT ACTION: obtain Berthelot 96-03 or Le Stum, Rigid Cohomology, Section 6.4 (not public), or adapt the Chiarellotto–Tsuzuki descent argument to RΓ_{]X[}.

#### Compact-support Gysin, excision and finite étale pushforward proof interfaces

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/gysin-isomorphism
- PadicDifferentialEquationsAndRigidCohomology:RD.4/excision-sequence
- PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-etale-pushforward-cohomology
- PadicDifferentialEquationsAndRigidCohomology:RD.5/excision-duality-compatibility
- PadicDifferentialEquationsAndRigidCohomology:RD.5/kunneth-morphism
- **detail:** RD.4/general-rigid-gysin supplies ordinary no-F Gysin. The compact-support coefficient adapters, their proper-ambient frame changes and finite étale pushforward remain the precise RD.4 G1 proof obligations; RD.5/supported-duality-morphism and kunneth-pairing-on-tubes supply the ordinary RD.5 uses.

#### Nuclear operator theory for Dwork operators

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/dwork-operators-are-nuclear
- PadicDifferentialEquationsAndRigidCohomology:RD.6/trace-formula-without-rational-points
- **detail:** RD.6/nuclear-trace-on-complexes supplies the passage from termwise de Rham traces to cohomology. The LF nuclear trace/Fredholm theory and compact-radius restriction hypotheses remain the precise LocallyAnalyticDistributions:L4 request.

#### Lie-theoretic normaliser and centraliser input

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/global-monodromy-group
- PadicDifferentialEquationsAndRigidCohomology:RD.6/normaliser-over-centraliser-finite
- **detail:** RD.6/neutral-tannakian-recognition and coefficient-category-is-neutral-tannakian supply the reconstruction theorem. The dimension and Lie-normaliser inputs remain the exact ReductiveGroups request; comodule reconstruction alone does not supply them.

#### Liftable proper direct images and abelian-scheme overconvergence

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-smooth-proper
- **detail:** Plan both at RD.5 (finiteness and relative cohomology): (i) for a proper smooth f: X → S of smooth k-schemes admitting a proper formal lift smooth over a smooth formal lift of S (Tsuzuki's 'liftable' situation), R^q f_rig* E is an overconvergent isocrystal for every overconvergent E, compatible with base change and zero for q > 2 dim(X/S); (ii) for an abelian scheme f: A → S over a smooth separated k-scheme and e ≤ p − 1, the convergent F-isocrystal (R^i f_cris* O)^an extends to an overconvergent F-isocrystal, by polarisation, level structure, Zarhin's trick, (i) on the universal family and descent along the finite étale level cover, consuming RD.3/direct-summands-of-overconvergent-f-isocrystals, RD.3/etale-descent-of-overconvergent-f-isocrystals and RD.3/f-crystal-to-convergent-f-isocrystal. Zarhin's trick moves down: plan it in the tier-6 roadmap AbelianSchemesAndArithmeticModuli (or at RD.5 as a stated input) and point R35.6 at the new owner. The ordinary convergent category and unit-root correspondence are supplied by RD.3/convergent-f-isocrystal and crew-unit-root-correspondence. The liftable overconvergent direct-image and abelian-scheme extension targets are still to be planned at RD.5; convergent direct images alone do not supply them.

#### Pending upstream étale trace and arithmetic zeta provider

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective
- PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-proper
- PadicDifferentialEquationsAndRigidCohomology:RD.7/rigid-zeta-expression
- **detail:** CohomologicalPointCounting/TraceFormula PR 196 (https://github.com/TauCetiProject/TauCetiRoadmap/pull/196), checked 11 October 2026 at head 4bd72379658126cbe9be935656396f0c9dac4de0, is OPEN. Its Layers 12–13 state the all-power constant Q_ℓ étale trace formula, point-count/closed-point zeta equivalence and cohomological determinant expression required here. SchemeAndStackFoundations SF.2 upstreamIntegration names that PR, but neither the checked current upstream main nor current Tau Ceti library contains this roadmap. Read the adopted statements and signatures when it lands, then replace this request with exact upstream layer imports. Until then the Katz–Messing factor-identification proof has an explicit étale input gap distinct from local finite-field arithmetic and weight separation.

#### Nonflat strengthening of unipotent relative local base change

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/relative-local-cohomology-base-change
- **detail:** Finiteness Proposition 7.2.1, p. 45, asserts that flatness can be omitted for unipotent modules. Its displayed filtration alone does not justify commuting cohomology with nonflat tensor product. Resolve the extra Frobenius constraint on the constant nilpotent matrix, or prove flatness of its kernel and cokernel before restoring this strengthening. The reviewed node currently requires flatness.

#### Elliptic p-rank dichotomy for nonprime finite fields

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/elliptic-curve-slopes-versus-weights
- **detail:** For q = p^f, f > 1, supplement the Newton-polygon computation by the elliptic ordinary/supersingular p-rank theorem. The Hasse bound and p | a alone do not prove v_p(a) ≥ f/2 for a general integer a; this arithmetic assertion needs the fact that a is an elliptic Frobenius trace.

#### Quillen–Suslin proof inputs over rank-one valued fields

- **id:** review-quillen-suslin-proof-inputs
- **stageId:** PadicDifferentialEquationsAndRigidCohomology:RD.3
- **reason:** source-proof gap
- **detail:** RD.3/rigid-quillen-suslin needs the rank-one version of the coordinate-change lemma and the algebra behind finite free resolutions and unimodular extension. Public arXiv v4 Lemma6.2 is stated for discrete valuations; its integral Lemma6.3 does justify the restricted DVR version. The inherited Davis–Schneider attribution is not independently accessible.
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/rigid-quillen-suslin

### PadicDifferentialEquationsAndRigidCohomology--RD.1

#### G1: analytic radius and projector suppliers

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/partial-frobenius-descendant
- PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-radius-decomposition
- PadicDifferentialEquationsAndRigidCohomology:RD.1/extrinsic-partial-radius-variation
- PadicDifferentialEquationsAndRigidCohomology:RD.1/coefficient-partial-radius-variation
- PadicDifferentialEquationsAndRigidCohomology:RD.1/affine-gap-annular-splitting
- PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-partial-radius-variation
- PadicDifferentialEquationsAndRigidCohomology:RD.1/intrinsic-annular-splitting
- PadicDifferentialEquationsAndRigidCohomology:RD.1/constant-profile-disc-splitting
- PadicDifferentialEquationsAndRigidCohomology:RD.1/boundary-break-proof
- **detail:** KX Theorem 2.2.5 cites the uncleared Kedlaya book Theorem 11.3.2; the ∂₀ splitting cites Theorem 12.4.2. The coefficient proof uses almost-isometric bases (book 1.3.7/8.6.1), visible-spectrum comparison (6.7.4), contracting twisted-factor lifting (6.7.1 and 2.2.2), and the half-open/disk analytic inputs in KX 2.3.8–2.3.10. The public KX proof and full rotation/gluing route were read; these precise analytical suppliers have not been independently established in a cleared source. Obtain public proofs or a cleared copy, and check they match these hypotheses. The main packet already owns the broad spectral, transfer and Frobenius-antecedent targets; do not duplicate them. The review added the ∂ⱼ-Frobenius antecedent and descendant theorems and the decomposition by intrinsic radii (KX Proposition 1.4.17, Theorems 1.4.19 and 1.4.21), which KX prove only by reference to book Theorems 10.4.2, 10.5.1, 10.6.2 and 10.7.1; those inputs belong to this gap too.

#### G2: ordinary Newton-polygon root supplier

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/puiseux-root-input
- PadicDifferentialEquationsAndRigidCohomology:RD.1/monodromy-key-calculation
- PadicDifferentialEquationsAndRigidCohomology:RD.1/equalchar-degree-zero-section-input
- **detail:** The published monodromy Lemma 4.12 proof and HP §§9–11 have been read. The packet supplies recursive lifting instead of a bare density argument, an explicit unique-minimum proof that a≠0, and uniform bounds for the oriented b₂ sums. Still supply and trace an ordinary Newton-polygon root theorem for finite polynomials over the complete algebraically closed valued residue field, including the nonzero-root and closed-ball-image statements after clearing fractional exponents. No verified pinned declaration or fully traced proof of that general supplier is cited here.

#### G3: FF and HP coefficient-category transport

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/descending-generic-filtration
- PadicDifferentialEquationsAndRigidCohomology:RD.1/bijective-lattice-invariants
- PadicDifferentialEquationsAndRigidCohomology:RD.1/negative-frobenius-cokernel
- PadicDifferentialEquationsAndRigidCohomology:RD.1/isoclinic-completion-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.1/frobenius-germ-extension
- PadicDifferentialEquationsAndRigidCohomology:RD.1/equal-characteristic-classification
- PadicDifferentialEquationsAndRigidCohomology:RD.1/reverse-algebraic-filtration-comparison
- **detail:** RD.0 currently plans mixed Cohen/Witt analytic rings and ordinary Robba rings. It does not state the chartwise FF Teichmüller E†/E/R_F comparison in both coefficient characteristics. Prove the compatible norms, Frobenius action, overlap intersections and germ extension; transport the rank-one/global-generation/standard-block and slope-splitting inputs used by HP §§4–8 without assuming the classification in advance. HP §§9–11 were read in full for the key estimate and classification. No claim of ordinary-Robba/FF ring equality or unrestricted bounded completion equivalence is made. The gap also covers two extensions of Kedlaya's setting: the descending generic filtration for FF's complete perfect F (the monodromy paper proves it for perfect algebraic extensions of k((t)); SFR Proposition 5.4.3 gives the extended-ring step for any K), and D'Addezio's E†_alg over the non-complete k(t)^alg, compared with the extended ring through O_(E^alg)[p^(1/b)]∩Γ_(2,b,c)=O†_(E^alg)[p^(1/b)] (D'Addezio, proof of Theorem 4.2.6, p. 15).

#### G4: geometric Newton-polygon purity and extension

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/common-vertex-global-subobject
- PadicDifferentialEquationsAndRigidCohomology:RD.1/dense-open-global-slopes
- **detail:** Read public statements/arguments in Notes on isocrystals Theorems 3.12/4.1, Corollary 4.2 and Remark 4.5 and both consumers. Their geometric purity/common-vertex extension proof suppliers (Katz curve argument, de Jong–Oort purity and the Notes §5 extension theorem) have not been fully traced here. Establish them at target level with smoothness/perfect-base hypotheses, rather than replacing them by the local Robba filtration. The convergent category is imported from RD.3; no higher-tier VB0 import is needed.

#### G5: public general Robba-duality proof

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.1/robba-residue-duality
- **detail:** The DLB consumer was read but its general duality citation is Kedlaya book Proposition 20.4.2, which is not cleared and was not read. The alternative RD.2 local-monodromy route needs a full proof that finite-cover normal-form cohomology, residue, trace and duality descend, with the exact one-form and degree factors. Establish those comparisons and convergence of Laurent integration; a proof for a nilpotent constant matrix alone is not the general theorem.

### PadicDifferentialEquationsAndRigidCohomology--RD.2

#### Upper ramification filtration over an infinite perfect residue field (inherited from ArithmeticGaloisRepresentations R01.3)

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.2/matsuda-highest-break-theorem
- PadicDifferentialEquationsAndRigidCohomology:RD.2/irregularity-equals-swan-conductor
- PadicDifferentialEquationsAndRigidCohomology:RD.2/andre-local-monodromy-group
- **detail:** The comparison of differential breaks with ramification breaks uses Serre's upper numbering, the break decomposition and the Swan conductor of representations of Gal(k((t))^sep/k((t))) with finite wild image. ArithmeticGaloisRepresentations R01.3 supplies them for finite k through Tau Ceti's LocalFieldsRamification layers 3-4 (tier (F)) and records a gap for an arbitrary perfect residue field (tier (P)). André's setting (k̄ algebraically closed) and Kedlaya's (k perfect) need tier (P). Kedlaya's own proof is insensitive to this (it works over k̄ throughout), so the gap is in the library interface, not in the mathematics; it closes when R01.3's tier (P) gap is closed.

### PadicDifferentialEquationsAndRigidCohomology--RD.3

#### Ogus's convergent-site theorems are used as stated, not read

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/convergent-f-isocrystals-are-crystalline
- PadicDifferentialEquationsAndRigidCohomology:RD.3/underlying-bundle-of-convergent-isocrystal
- PadicDifferentialEquationsAndRigidCohomology:RD.3/etale-descent-of-overconvergent-f-isocrystals
- **detail:** Three inputs rest on A. Ogus, 'F-isocrystals and de Rham cohomology II — convergent isocrystals' (Duke 1984) and 'The convergent topos in characteristic p' (Grothendieck Festschrift III, 1990), neither publicly accessible: (i) Proposition 7.3 of the 1990 paper, giving a crystal M with N ≅ M ⊗ ℚ, used in the essential surjectivity part of Berthelot 96-03 (2.4.2); (ii) Example 2.7.3, Proposition 2.18, Remark 2.8.1, Theorem 2.15 and Proposition 2.21 of the 1984 paper, used by Guo–Reinecke (Remark 2.15, Proposition 2.17) for the convergent site and the ramified underlying bundle; (iii) Theorems 4.5 and 4.6 of the 1984 paper (descent of convergent F-isocrystals along étale surjective and proper surjective generically étale maps over a perfect field), used by Étesse's Théorèmes 1 and 3. Full faithfulness in (2.4.2)(a) is proved by Berthelot and is not affected. NEXT ACTION: obtain Ogus's papers, or replace (i) by a public proof that a convergent F-isocrystal on a smooth affine has a Frobenius-stable lattice up to twist, and (iii) by a public descent argument for convergent F-isocrystals.

#### Crew's and Katz's proofs of the unit-root correspondence not read

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/crew-unit-root-correspondence
- **detail:** Kedlaya (Notes, Theorem 3.7) and D'Addezio (proof of Proposition 3.3.4) cite R. Crew, PSPM 46 (1987), Theorem 2.1, which builds on Katz's Proposition 4.1.1 (LNM 350); neither is publicly accessible. The node gives the standard Lang-torsor outline (étale-local solvability of Φ(v) = v modulo p^m, the inverse limit ℤ_q-local system, the quasi-inverse T ↦ T ⊗ O_crys) and identifies the lattice input through Kedlaya's Remark 2.3. NEXT ACTION: read Crew 1987 or Katz 1973, or refine the outline into lemma-level nodes (Lang's theorem for GL_r over W_m, existence of Φ-stable lattices for unit-root objects).

#### Abe's published counterexample not read

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.3/liouville-extension-counterexample
- **detail:** T. Abe, 'Some notes on Tsuzuki's full faithfulness conjecture', IMRN 2011, 4747–4755, cited by Kedlaya (Notes, Remark 5.6), has no public copy. The acceptance node supplies its own explicit counterexample (an extension of the unit object by a Kummer isocrystal with a p-adic Liouville-type exponent), proved completely from Berthelot's coordinate criterion; the relation with Abe's example is not checked. NEXT ACTION: compare with Abe's paper when available.

### PadicDifferentialEquationsAndRigidCohomology--RD.4

#### Global support comparison and unrestricted Gysin proof

- **id:** G1
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/general-rigid-gysin
- PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-independence-of-compactification
- PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-etale-pushforward-cohomology
- PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-support-cohomological-bounds
- **detail:** Obtain and read Tsuzuki, Hiroshima Math. J. 29 (1999), 479–527, Theorem 4.1.1 and Corollaries 2.6.5–2.6.6, plus a full support-independence proof behind Berthelot 1986 Théorème 4. The publisher returned a bot-protection page; no 1999 proof was read. Supply the normal-coordinate residue-change compatibility needed to descend the local Gysin maps, and the support-preserving proper/finite-étale comparison. The 2003 primary statement witness fixes the unrestricted target and base-change compatibility but does not fill these proofs. The local residue calculation and its gluing must cover E∈Isoc† without Frobenius, since the inherited liftable Gysin target is F-only. Verify compact-support finite scalar extension for these coefficients; CT03 Corollary 11.8.2 supplies only the ordinary comparison.

#### Global compact and log dagger comparison for the ordinary-locus consumer

- **id:** G2
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-supported-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-dagger-comparison
- **detail:** Compare the F1 larger-radius ambient dagger support complex with Berthelot compact support under radius and proper-frame changes. Separately construct the supported dagger-to-completed-log-convergent adapter for the admissible DL pair, with its chosen coefficient, preserving the signed relative/absolute triangle, N, refinement and support maps. GK00 Theorem 5.1 gives dagger versus overconvergent j† cohomology; it does not identify completed log forms on nonproper charts. GK05 Theorem 5.3(ii) supplies the unsupported proper semistable constant-coefficient comparison, not a blanket nonproper-boundary or general-log-connection theorem. Identify the exact HLTT ordinary-locus log model, horizontal boundary and coefficient with this pair-specific adapter before exporting it to AG2.4. GK00 §5.2 only announces compact support; neither citation alone closes these obligations.

#### Geometric realization of the Igusa theta quotient

- **id:** G3
**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.4/igusa-theta-cokernel
- **detail:** Read Coleman 1996 §8 and Coleman 1997 Theorem 2.1 with the Igusa-level log coefficient model used by Pan v1 Proposition 5.1.7. Construct or import the finite-level geometric spaces, determinant line and theta resolution from their curve/modular-form owners, identifying their complex with log rigid Sym^k cohomology after extension to C. Check coefficient extension and finite-level finiteness hypotheses. Pan’s quotient definition was read; his cited geometric proof was not. No upward-tier geometric prerequisite is silently inserted into RD.4.

### PadicDifferentialEquationsAndRigidCohomology--RD.5

#### Proof interiors of Kedlaya's semistable reduction theorem

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/global-semistable-reduction
- **detail:** Global semistable reduction (Semistable reduction IV, Theorem 2.4.4) rests on local semistable reduction at monomial valuations (III, Theorem 6.3.1, from the p-adic local monodromy theorem over polyannuli), the induction on transcendence defect (IV, Theorem 5.0.1) and the patching over the Riemann–Zariski space (II, Propositions 3.3.4 and 3.4.5). Only Part I §§3–6, Part II Theorem 4.2.1 and Part IV §2 were read. NEXT ACTION: decompose Parts II–IV at target level; the Riemann–Zariski space of a function field has no planned owner.

#### Berkovich's coherent descent for finite and flat maps of good analytic spaces

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/fppf-cohomological-descent
- **detail:** Zureick-Brown's Proposition 5.19 uses that higher direct images of coherent sheaves along finite maps of good K-analytic spaces vanish (Berkovich 1993, Corollary 4.3.2) and that coherent sheaves are sheaves for the flat quasi-finite topology (Berkovich 1993, Proposition 4.1.2). Berkovich's paper was not read. NEXT ACTION: read Berkovich, Étale cohomology for non-Archimedean analytic spaces, §§1.6, 4.1, 4.3, or derive the two facts in the rigid (adic) setting from AdicSpacesPartII:R3/tate-kiehl-affinoid and fpqc descent for modules.

#### Frobenius descent for convergent isocrystals and Ogus's comparison

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-smooth-proper
- PadicDifferentialEquationsAndRigidCohomology:RD.5/relative-convergent-crystalline-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-perfect-complexes
- **detail:** Xu's proof that smooth proper higher direct images of convergent (F-)isocrystals are convergent (arXiv:1802.09060v1, Theorem 1.9) uses his Frobenius descent (Theorem 1.5, §6) and Ogus's description of the direct image of the structure sheaf; Guo–Reinecke use Ogus 1990, Theorem 0.7.7 over a point. Only the statements were read. NEXT ACTION: decompose Xu §§5–9 and read Ogus, The convergent topos in characteristic p (1990).

#### Details of the verifications Berthelot's note leaves to the reader

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/compact-support-gysin-and-trace
- PadicDifferentialEquationsAndRigidCohomology:RD.5/finite-etale-trace-projector
- PadicDifferentialEquationsAndRigidCohomology:RD.5/kunneth-pairing-on-tubes
- **detail:** Berthelot's Dualité note is a six-page author copy (two-page English account and four-page French announcement): the compatibility of the compact-support Gysin map with traces (1.3) is reduced to the residue formalism of Hartshorne's Residues and Duality, the extension of a finite étale map of dagger algebras to strict neighbourhoods (1.4) and the Künneth compatibilities (3.3) are asserted with indications only. The nodes give the indicated routes. NEXT ACTION: write the residue computation for a smooth pair in local coordinates and the strict-neighbourhood extension (Berthelot, Finitude, §3.6) in detail.

#### Berkovich analytic foundations of the overconvergent site

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/overconvergent-site
- PadicDifferentialEquationsAndRigidCohomology:RD.5/overconvergent-site-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.5/fppf-cohomological-descent
- **detail:** Le Stum’s site uses strict K-analytic Berkovich spaces, their analytic domains, good neighbourhoods, formal generic fibres and specialisation, and ringed tube pullbacks (Le Stum §§2.1–2.5 and §§3.1–3.3; Zureick-Brown §4). AdicSpaces and AdicSpacesPartII supply Huber/classical rigid/dagger foundations, not this category or its comparison. No such owner was found in current Tau Ceti or the additional current upstream roadmaps. NEXT ACTION: supply a Berkovich-foundations extension to the analytic owner and its rigid comparison, or rewrite the descent proof entirely in an already supplied analytic category. The site is a valid target, not yet a closed construction.

#### Relative log convergent sites and the crystalline realisation functor

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/relative-convergent-crystalline-comparison
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-smooth-proper
- PadicDifferentialEquationsAndRigidCohomology:RD.5/convergent-direct-image-perfect-complexes
- **detail:** RD.5/convergent-log-isocrystal treats a smooth pair with a normal-crossings embedding. Shiho Theorem 2.36 instead uses relative log convergent sites over general Noetherian p-adic fine-log formal bases and the functor Φ to log crystalline isocrystals. CR.5/log-crystal and the absolute RD.3 restriction-to-convergent do not define this relative site. NEXT ACTION: extend the RD.3 coefficient-site owner with Shiho §2.1 (relative enlargements and isocrystals) and Φ in §2.3, retaining rational coefficients without an integral lattice; request log perfectness from CR.5 separately.

#### Proper rigid–crystalline comparison over imperfect residue fields

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.5/rigid-trace-morphism
- PadicDifferentialEquationsAndRigidCohomology:RD.5/supported-duality-morphism
- PadicDifferentialEquationsAndRigidCohomology:RD.5/kunneth-pairing-on-tubes
- PadicDifferentialEquationsAndRigidCohomology:RD.5/rigid-cohomology-base-field-extension
- **detail:** The existing RD.7/rigid-crystalline-comparison is stated over perfect k, and its embedding/descent proof already has a first-pass gap. Moving that target earlier does not extend its scope. In particular, the arbitrary Cohen-field base-change theorem here needs proper smooth comparison for imperfect k as well as compatible PD-base change. CR.3/derived-base-change has the required Noetherian PD-base form, but does not supply this comparison. NEXT ACTION: finish the existing comparison proof, extend it to Cohen rings over imperfect k, and verify compatibility with coefficient/base change and traces; keep the stable owner and id rather than duplicating it.

### PadicDifferentialEquationsAndRigidCohomology--RD.6

#### Christol–Mebkhout IV: global deduction of the p-adic Euler–Poincaré formula

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/christol-mebkhout-global-euler-characteristic
- **detail:** The survey (Astérisque 279) states the formula (Théorème 1.2, p. 129) and proves the local index theorems (14.11, 14.13) and the algebraization theorem (1.1, Chapter V), but refers to Christol–Mebkhout IV (Invent. Math. 143, 2001, Corollaire 5.0-12) and to [10] there for the global deduction (semicontinuity and comparison of algebraic and p-adic irregularities). Those texts are not freely available and were not read. The deduction also uses the algebraic Euler–Poincaré formula for meromorphic connections on curves with Malgrange's irregularity (Deligne; Kedlaya's sketch reaches it through Mebkhout's complex formula and GAGA, p. 35), which no cited roadmap plans. NEXT ACTION: obtain Christol–Mebkhout IV, or derive the deduction from Poineau–Pulita V–VI (arXiv 1309.3940 and its sequel), whose Theorem 3.5.2 already gives a GOS-type index formula on pseudo-disks with meromorphic singularities.

#### Geometric class field theory for curves over finite fields (Katz–Lang)

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/katz-lang-geometric-finiteness
- **detail:** The identification of abelian étale covers of a smooth proper curve over F̄_q with isogenies onto its Jacobian, and Lang's theorem making the Frobenius coinvariants finite, are planned by no roadmap this one may cite (Tau Ceti ClassFieldTheory excludes function fields; FunctionFieldArithmetic lies outside the cited roadmaps). Katz–Lang (Enseign. Math. 27, 1981, Theorem 1) is read only as restated by Crew 1992 Theorem 1.6. NEXT ACTION: plan the curve case in a lower-tier owner of étale fundamental groups of curves (InverseGaloisAndArithmeticFundamentalGroups IG.1 is the natural home) and replace this gap by that node.

#### Higher-dimensional rank-one finiteness (Abe, Lemma 6.1)

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/rank-one-finite-geometric-monodromy
- PadicDifferentialEquationsAndRigidCohomology:RD.6/rank-one-purity-via-curves
- **detail:** For X of dimension > 1 Abe reduces to a smooth compactification with normal crossings boundary through an alteration (AdicCoefficientsAndComparisons L5 / SchemeAndStackFoundations SF.4), uses Shiho's logarithmic extension theorem and Berthelot's restriction to a dense open (Be1, 2.1.11). Only the curve case is proved in this packet; the higher-dimensional statement is imported from Abe. Kedlaya's Weil II uses the rank-one theorem only on curves (Sections 6.2-6.3), so the RD.6 weight theorems do not depend on this gap.

#### Relative rigid cohomology of the Kloosterman family

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/kloosterman-f-isocrystal
- **detail:** That R^n pr_rig,* f^*L_π is an overconvergent F-isocrystal on all of G_m (not only on a dense open, as the generic pushforward theorem RD.5/generic-pushforward-theorem gives) and that its fibres are the fibrewise compactly supported cohomology rest on Sperber's Dwork-theoretic computation and Berthelot's relative cohomology (Crew 1994 §1.5, citing [Sperber §6] and [Berthelot]), which were not read.

#### Intrinsic purity of the Kloosterman F-isocrystal

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/kloosterman-local-monodromy-and-purity
- **detail:** The sources deduce purity of Kl_{n+1} from Deligne's ℓ-adic theorem through equality of Frobenius traces. The ℓ-adic theorem is owned in the atlas by FiniteFieldsAndCharacterSums FF.2, outside the roadmaps RD may cite. The plan here is the rigid route through the Fourier transform (parent RD.6/purity-via-fourier-on-affine-line on the localized Fourier transform description); checking its hypotheses (constant fibre cohomology of the twists) is open.

#### Extended Fourier automorphism and Frobenius-equivariance

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/fourier-frobenius-extension
- PadicDifferentialEquationsAndRigidCohomology:RD.6/fourier-comparison-is-frobenius-equivariant
- **detail:** Kedlaya's Remark 4.2.3 states the extension of ρ to F and ρ(ρ(F)) = qF without proof; convergence of ρ(F) on D†-modules from (σ, ∇)-modules and the equivariance of the Fourier comparison have to be checked.

#### Nuclear trace theory on LF spaces

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/nuclear-trace-on-complexes
- **detail:** Requested from LocallyAnalyticDistributions L4 (see requests): its Fredholm nodes treat Banach and (Pr) stages; the LF union and the additivity of traces along strict exact sequences used by van der Put (1.5) are not yet planned there.

#### Localized Fourier transform of the Kloosterman family

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.6/symmetric-power-kloosterman-middle-cohomology
- **detail:** Fresán–Sabbah–Yu (3.13) transport to rigid cohomology the ℓ-adic description of the (n+1)-fold pullback of Kl_{n+1} as a localized Fourier transform and the tensor-power/convolution exchange; the rigid Fourier transform of the parent (on A^1 with constant fibre cohomology) does not by itself supply the localized version on G_m.

### PadicDifferentialEquationsAndRigidCohomology--RD.7

#### Mieda's p-adic Picard–Lefschetz formula not read

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/mieda-p-adic-picard-lefschetz
- PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-semistable-realization
- **detail:** Y. Mieda, 'The Picard–Lefschetz formula for p-adic cohomology', Math. Z. 257 (2007), 403–425, Theorem 1.1, (2.3) and Theorem 2.13, is used only through Fresán–Sabbah–Yu's account in the proof of their Proposition 5.23 (pp. 49–51). The injectivity of β, its Frobenius compatibility through logarithmic de Rham–Witt complexes and the semistability of the blow-up are therefore stated, not decomposed. The paper (doi:10.1007/s00209-007-0131-6) is not freely available: the author's publication page gives only the DOI and no arXiv version was found on 14 October 2026. NEXT ACTION: once a copy is cleared, read it and split the node into the semistable-model lemma and the comparison map.

#### p-adic comparison theorems C_dR and C_st are owned above this tier

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-semistable-realization
- PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-newton-above-hodge
- **detail:** Fresán–Sabbah–Yu, Proposition 5.23, uses that étale cohomology of a smooth proper variety over Q_p is de Rham and that of a proper semistable model over Q_p(√−p) is semistable, with D_st identified with Hyodo–Kato/log-de Rham cohomology (Tsuji's C_st). The atlas plans these comparisons in CohomologyComparisons:CP.4 (proper-rigid-potential-semistable-comparison, semistable-filtered-bdr-agreement) and PadicHodgeTheory, both in higher tiers than this roadmap (tier 12), so they cannot be cited here; moving them down into RD.7 would duplicate the core of p-adic Hodge theory. The two Kloosterman applications therefore rest on this gap; the restructuring proposal below moves them up to the owner of C_st.

#### Katz–Messing's paper not accessible

**neededBy**
- PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective
- **detail:** Katz–Messing, Invent. Math. 23 (1974), 73–77 (doi:10.1007/BF01405203) is behind the publisher's paywall and no author or GDZ copy was found on 14 October 2026. The plan does not use their argument (the crystalline–ℓ-adic equality is obtained from Kedlaya's p-adic purity and RD.7/weight-separated-factor-extraction), so no step depends on the paper; RD.7/abelian-variety-crystalline-frobenius-polynomial, the degree-one case, is also proved by weight separation. The comparison of routes stays open.

## Planet inventory

Display selections for the eight existing layers. All non-planet targets remain in the reader.

- **RD.0:** Frobenius lift on the Robba ring, Bézout property of the Robba ring, Frobenius lift on a dagger algebra, Valuation p-bases, Overconvergent tensor descent, Closed ideals and analytic divisors.
- **RD.1:** Differential module over the Robba ring, Generic radius of convergence, Differential Swan conductor, Dieudonné–Manin decomposition over the extended Robba ring, Frobenius slopes, (φ,∇)-module over the Robba ring.
- **RD.2:** Isoclinic descent, Slope filtration theorem, Unipotent differential module, Tsuzuki's unit-root monodromy theorem, p-adic local monodromy theorem, Logarithmic form of the local monodromy theorem.
- **RD.3:** Frame, Tube, Berthelot's j† functor, Independence of the frame, Overconvergent F-isocrystal, Convergent F-isocrystal.
- **RD.4:** Rigid cohomology, Rigid cohomology with compact supports, Frobenius on rigid cohomology, Rigid Gysin isomorphism, Log rigid cohomology with proper support, Dagger–rigid cohomology comparison.
- **RD.5:** Relative local monodromy theorem, Generic pushforward, Finiteness of rigid cohomology, Poincaré duality, Finiteness with compact supports, Künneth formula.
- **RD.6:** L-function of an overconvergent F-isocrystal, Lefschetz trace formula for Frobenius, ι-weights of overconvergent F-isocrystals, p-adic Fourier transform, Dwork isocrystal, Rigid Weil II.
- **RD.7:** Katz–Messing comparison of Weil factors, Weil-factor export, Ogus comparison with coefficients, Weight separation of Weil factors, Tuitman's point-counting algorithm.
