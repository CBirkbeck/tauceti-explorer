# DESIGN-PadicDifferentialEquationsAndRigidCohomologyPartII

Issue [#3439](https://github.com/CBirkbeck/tauceti-explorer/issues/3439), Codex session `codex-OL8I79`, 2026-10-19. Claim command `/claim Codex — codex-OL8I79` was confirmed by the bot at [comment 6263713913](https://github.com/CBirkbeck/tauceti-explorer/issues/3439#issuecomment-6263713913). This run claims one job only.

## Completed deliverable

The roadmap definition, complete target-level packet, mathematical reader and compact suggested file cover all seven stages. The assigned Part II id owns PBQ filtrations, saturation, curve reconstruction, dagger hulls, curve MS and the finite-field extremal-slope theorem. Coalesce the proposed MinimalSlope alias into this assigned id. The other three directions receive the complete briefs below and exhaustive item dispositions in the packet. No other packet, atlas data or existing upstream roadmap was changed.

There are 66 nodes: 16 definitions, 49 theorems and 1 construction; 51 API items, 51 unit tests, 31 planets and 8 cited baseline declarations. Every definition/construction has three API entries and three tests derived from its uses. All implementation statuses are unchecked. Packet completeness records completion of the planning pass; it does not claim proof closure.

## Coverage and exact remaining work

| Stage | Status | Remaining |
| --- | --- | --- |
| MS.0 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. |
| MS.1 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. |
| MS.2 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. Repair G2, without altering the independent main curve route. |
| MS.3 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. |
| MS.4 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. |
| MS.5 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. Repair G1 for the alternate affine–generic proof; register G3 for docile Lefschetz. |
| MS.6 | planned | Discharge the explicit parent supplier requests used in this layer and check the planned mathematical interfaces in independent review. Register G3 and instantiate its shared mixedness, Chebotarev and curve inputs. |

The independent reviewer should check the full mathematical chain, especially bounded splitting, PBQ descent, global saturation, the boundary-kernel argument, the independent curve MS proof and projected trace. No review object or self-acceptance was added. None of the seven stages is closed.

### G1: affine–generic dagger hull comparison

DAD v4 Proposition 4.2.12, p.17, invokes compactness and a uniform p-primary torsion bound for an arbitrary injection into W⟨u⟩. In A_n, (pu^n)^j is not in pA_n but its image has norm p^(−j), so the asserted positive lower bound fails. The quotient W⟨u⟩/A_n has elements of unbounded p-power torsion. A Frobenius-specific strictness argument is needed. This is not a counterexample to the proposition. Curve MS uses Tsuzuki Proposition 6.1 and does not depend on this alternate node.

Needed by: `MS.5/affine-generic-hull`.

### G2: independent finite étale bounded-disc comparison

Tsuzuki Lemma 3.31(1), p.19, uses PBQ of the pullback to infer PBQ of its push-pull, the very assertion to be proved. Supply a direct Taylor-disc comparison for the nonconstant finite unramified extension of complete generic fields induced by a finite étale curve cover; show bounded solution annihilators commute with it, then purity is preserved. Finite constant coefficient base change alone is not this lemma. Neither the global PBQ filtration nor the main curve reconstruction uses this node.

Needed by: `MS.2/finite-etale-pbq`.

### G3: register the common arithmetic D-module and companion supplier contracts

The proposed ArithmeticDModules continuation has no registered stage. Its early common prefix must export generic mixed coefficient Chebotarev (PAPER-ABE-18/51), finite coefficient conventions and the AE localisation/vanishing argument proving Corollary 2.4 for arbitrary base tuples. Its weight and crystalline-companion inputs at AM.7 must export AE Theorem 2.7 and the irreducibility-preserving finite-set curves of Theorem 3.10 (after rank-one twist/untwist). Use the split briefs below to give these contracts one owner and stage ids. Do not import the entire DAD monodromy continuation or prove generic companion existence here.

Needed by: `MS.5/docile-lefschetz`, `MS.6/finite-field-inputs`, `MS.6/pure-hom-chebotarev`.

G1 and G2 are additional source-proof routes, and do not block the independent Tsuzuki curve proof. G3 does affect docile Lefschetz and finite-field conclusions until its common supplier contracts are registered. All seven parent requests below must be discharged or verified at their owners before closure. No new issue or supplier stage was created by this design.

## Parent supplier requests

1. **PadicDifferentialEquationsAndRigidCohomology:RD.0:** For the smooth affine curve dagger algebra A†_K and its finite projective modules, prove the intersection of the generic module with all interior bounded-disc lattices and all boundary E† lattices recovers the dagger module (Tsuzuki Lemma 3.2, pp.12–13). Also provide the finite isometric Frobenius-compatible normalisation of Lemma A.1(2), pp.37–38: the fixed field has the full value group after finite unramified extension. The value group is not the valuation ring. Consumers: `MS.2/curve-gluing`.

2. **PadicDifferentialEquationsAndRigidCohomology:RD.0:** Supply the extended logarithmic Robba carrier, Frobenius-equivariant embedding, multiplication injectivity and exact growth of nonzero Frobenius eigenfunctions (Ohkubo Lemmas 1.15, 2.10–2.14, pp.8–14). The existing extended Robba carrier alone does not include its logarithmic growth API. Export the completed-tensor and localisation identities used by the affine A_n models, DAD §4.2.9–4.2.11, pp.15–16. Consumers: `MS.1/growth-eigenvector`, `MS.5/integral-models`, `MS.5/bounded-torsion-tor`.

3. **PadicDifferentialEquationsAndRigidCohomology:RD.1:** For a finite free differential Frobenius module over K[[t]]₀, extension to E† identifies its saturated differential Frobenius submodules with the submodules of the bounded Robba realisation (de Jong Proposition 6.4, used in Ohkubo Theorem 12.7, p.46). Export this bounded-disc to bounded-Robba comparison, with the specific Frobenius hypotheses. It is not a claim that every E-completed submodule descends, and fixed-slope Hom full faithfulness alone does not supply it. Consumers: `MS.1/disc-pbq-descent`.

4. **PadicDifferentialEquationsAndRigidCohomology:RD.3:** Extend the Katz–Crew finite-inertia correspondence from the parent Q_q coefficient contract to the complete K with isometric σ and finite fixed field K^σ used here, with compatible finite coefficient extension and effective descent. Import local finite monodromy from RD.2. This is the exact unit-root gluing input of Tsuzuki Lemma 3.32, p.19. Consumers: `MS.2/curve-gluing`.

5. **PadicDifferentialEquationsAndRigidCohomology:RD.3:** Provide finite L-structures and their Q̄_p 2-colimit, coefficient-linear tensor/dual/rank API, primitive projectors for K_m⊗_K L, constant-field pull/push and effective descent, compatible with curve lifting (Tsuzuki §§7.1–7.3 and Appendix B, pp.29–34,39–40). The projected trace normalisation is proved in MS.6. Supply also separating functions on curves and the finite étale Galois closure after shrinking used in etale-affine-line. Consumers: `MS.6/lefschetz-condition`, `MS.6/lefschetz-fibres`, `MS.6/projected-trace`, `MS.5/etale-affine-line`.

6. **PadicDifferentialEquationsAndRigidCohomology:RD.4:** Give the rigid H¹ classification of extensions by a constant line and the relative Legendre/Kummer cohomology input of Tsuzuki §3.9, pp.21–22, including the K3 calculation’s comparison with the coefficient H¹. This numerical example is conditional on that supplier, not an assumed K3 implementation. Consumers: `MS.2/legendre-kummer-example`.

7. **PadicDifferentialEquationsAndRigidCohomology:RD.6:** Export the CM K3 Frobenius calculation in Tsuzuki §3.9, pp.21–22: the twisted H¹ slopes are 0,2 for p≡1 mod4 and 1,1 for p≡3 mod4; the unit-root twist produces the stated invariant extension. For AE Theorem 2.7 use arbitrary real weights and the constant-twist/untwist compatibility, rather than restricting to integer weights. Consumers: `MS.2/legendre-kummer-example`, `MS.6/finite-field-inputs`.

## Split design briefs for the maintainer

Each proposed id below remains unregistered. Its layer keys are a design order, not available dependency references. The packet's `restructure` proposals contain the same complete briefs and the exact item lists; `routeDispositions` maps every one of the 198 inputs. Do not create another monolithic Part II from all four directions.

### PadicDifferentialEquationsPartIIArithmeticDModules

**Title:** Arithmetic D-modules, six operations and geometric Satake. **Parent:** `PadicDifferentialEquationsAndRigidCohomology`. **Area:** `padic`.

Give the arithmetic coefficient formalism one owner, with an early Crew prefix, geometric Satake at AM.6 and Lefschetz applications at AM.7. Basic overconvergent monodromy used by Bessel coefficients and DAD must not depend on the MG.4 DAD parabolicity theorem.

**Final targets.**

- Xu–Zhu Theorems 3.5.1 and 3.5.3: the p-adic holonomic spherical category Sat_G is tensor equivalent to Rep(Ĝ); Theorem 3.6.7 and §3.6.8 give the Frobenius form Rep°_(L,σ)(Ĝ(L)⋊Z) and the Weil-normalised Satake category. Keep the split-group, coefficient and normalisation hypotheses of those statements.
- Abe §§1–3 and Appendix: holonomic derived categories and the six operations on admissible stacks with finite diagonal and c-admissible stacks, with the stated restricted formalism for locally finite-type stacks. Trace, cycle/correspondence classes and independence of ℓ are scoped to the source’s admissibility hypotheses.

**Proposed order.**

- `AM.0`: Finite/bar coefficient structures and the common overconvergent Crew/Weil and object-generated monodromy prefix (ABE/25, DAD/75). Import RD.3 and generic Tannakian reconstruction. Export the common-coefficient tensor-fibre comparison; do not identify every convergent or perfect-point group with this basic group.
- `AM.1`: Finite-level arithmetic differential operators and D† on smooth formal frames, their overconvergent functions, coherent modules, specialisation from isocrystals and frame independence. Import existing frames from RD.3.
- `AM.2`: Overholonomicity, realisable and glued holonomic derived categories on separated finite-type schemes, holonomic and constructible t-structures and the derived-heart equivalence. Construct the six operations, proper/smooth base change, localisation, duality, projection and Künneth formulas, Berthelot–Kashiwara and smooth f^!=f^+(d)[2d]. Prove the AE localisation and low-degree vanishing contract giving docile H⁰ Lefschetz for arbitrary base tuples.
- `AM.3`: Finite extensions and Q̄_p descent, equivariant coefficients on schemes/stacks/ind-schemes, twisted external products, simplicial stack descent, admissible and c-admissible operations, flat trace maps, cycle classes and correspondences. Preserve the finite-diagonal conditions rather than claiming all stacks have the full formalism.
- `AM.4`: Weights and intermediate extension, decomposition and geometric semisimplicity, cohomological trace and L-functions, mixed coefficient Chebotarev ABE/51, and independence of ℓ for the stated correspondences. The Chebotarev contract assumes mixed coefficients and uses the parent weight/trace bounds; it does not require that every irreducible is pure before the AM.7 Abe application.
- `AM.5`: Nearby and vanishing cycles, ULA and its actual proofs, logarithmic monodromy and Sol=Coker(N)∨, extensions to the stated ind-schemes/stacks, and Braden hyperbolic localisation. Define the fixed-locus map by restriction to X⁰⊂X⁺×_X X⁻. Supply a proof without normality or impose the source’s p∤|π₁(G_der)| restriction where required.
- `AM.6`: Fusion, constant/weight functors and symmetric tensor structure for the p-adic spherical category, then Tannakian identification with Ĝ and its semilinear Frobenius version. Grassmannians, convolution and fusion spaces are imports; this layer owns their arithmetic coefficient theory.
- `AM.7`: After the finite-order crystalline correspondence supplied by GlobalShtukasPartIICrystallineCompanions, give the AE Theorem 2.7 twist/untwist mixedness and purity adapter and Theorem 3.10 finite-set irreducibility-preserving curves. Export those to minimal-slope MS.6 and rigid-companion applications. The AM.0–AM.6 inputs needed by the correspondence cannot cite this layer.

**Imports.**

- RD.2 local monodromy, MC/MCF and Swan conductors; RD.3 frames and isocrystals; RD.4 rigid cohomology; RD.5 finiteness/duality; RD.6 weight bounds and trace.
- GlobalShtukasAndFunctionFieldLanglands:GS.1 owns affine/Beilinson–Drinfeld Grassmannians, Schubert geometry, convolution, fusion and semi-infinite orbits. EtaleDualityAndPerverseSheaves:EDC.5 and DeligneWeightsAndPurity own the ℓ-adic comparison side. MotivesAndAlgebraicCycles:MC.6 and upstream ReductiveGroups own generic Tannaka theory.

**Exports and dependency direction.**

- AM.0→DAD monodromy groups and Kloosterman/Bessel coefficients: common overconvergent groups and tensor-fibre comparison.
- AM.2→MS.5: exact AE Corollary 2.4 H⁰ restriction/vanishing under good-position ample complete intersections, arbitrary base tuples.
- AM.4→MS.6 and RigidCompanions: mixed coefficient Chebotarev ABE/51; AM.3 owns admissible-stack covers ABE/17/EG145.
- AM.0–AM.6→GlobalShtukasPartIICrystallineCompanions; that correspondence→AM.7→late minimal-slope and rigid-connection applications. No reciprocal whole-roadmap dependency.

**Acceptance tests.**

- A¹ and G_m with constant, Dwork and Kummer coefficients check shifts, Frobenius, coefficient rank and trace conventions.
- The IC object of the smallest PGL₂ Schubert variety checks the Satake fibre functor and Tate/Weil normalisation.
- P¹ with the standard G_m action tests all three fixed/attracting/repelling maps in Braden’s comparison.

**Source and ownership gates.**

- Carry XZ sourceIssues E14–E15 and E24–E26: top-degree normalisation, the degree-zero smooth-surjective full-faithfulness argument, equivariant descent and hyperbolic restriction maps.
- Include Abe’s appendix categorical gluing and stack hypotheses; never substitute characteristic-zero D-modules for arithmetic D†.
- Do not rebuild the generic Chebotarev, common Crew or generic Tannaka construction at either consumer.

**Exact routed item ids:** `PAPER-ABE-18/2`, `PAPER-ABE-18/3`, `PAPER-ABE-18/4`, `PAPER-ABE-18/5`, `PAPER-ABE-18/6`, `PAPER-ABE-18/7`, `PAPER-ABE-18/8`, `PAPER-ABE-18/9`, `PAPER-ABE-18/10`, `PAPER-ABE-18/11`, `PAPER-ABE-18/12`, `PAPER-ABE-18/13`, `PAPER-ABE-18/14`, `PAPER-ABE-18/15`, `PAPER-ABE-18/16`, `PAPER-ABE-18/17`, `PAPER-ABE-18/18`, `PAPER-ABE-18/19`, `PAPER-ABE-18/20`, `PAPER-ABE-18/21`, `PAPER-ABE-18/22`, `PAPER-ABE-18/23`, `PAPER-ABE-18/24`, `PAPER-ABE-18/25`, `PAPER-ABE-18/26`, `PAPER-ABE-18/27`, `PAPER-ABE-18/28`, `PAPER-ABE-18/29`, `PAPER-ABE-18/30`, `PAPER-ABE-18/48`, `PAPER-ABE-18/49`, `PAPER-ABE-18/50`, `PAPER-ABE-18/51`, `PAPER-ABE-18/52`, `PAPER-DADDEZIO-23/75`, `PAPER-XU-ZHU-22/10`, `PAPER-XU-ZHU-22/11`, `PAPER-XU-ZHU-22/12`, `PAPER-XU-ZHU-22/13`, `PAPER-XU-ZHU-22/14`, `PAPER-XU-ZHU-22/15`, `PAPER-XU-ZHU-22/16`, `PAPER-XU-ZHU-22/18`, `PAPER-XU-ZHU-22/19`, `PAPER-XU-ZHU-22/22`, `PAPER-XU-ZHU-22/23`, `PAPER-XU-ZHU-22/24`, `PAPER-XU-ZHU-22/25`, `PAPER-XU-ZHU-22/26`, `PAPER-XU-ZHU-22/27`, `PAPER-XU-ZHU-22/28`, `PAPER-XU-ZHU-22/29`, `PAPER-XU-ZHU-22/30`.

### PadicDifferentialEquationsPartIIMonodromyGroups

**Title:** Monodromy groups of F-isocrystals and parabolicity. **Parent:** `PadicDifferentialEquationsAndRigidCohomology`. **Area:** `padic`.

Extend the curve MS theorem to higher-dimensional perfect bases through monodromy and docile Lefschetz, then identify the slope stabiliser and its arithmetic consequences.

**Final targets.**

- DAD Theorem 4.1.3: MS on every smooth variety over a perfect field. Theorem 4.4.12: for smooth geometrically connected X over perfect k, a perfect point η and constant-slope M†, G(M,η) is the slope-filtration stabiliser in G(M†,η); if M† is semisimple this subgroup is parabolic.
- Theorem 4.4.3: for smooth projective connected Y⊂P^d_(k^alg) with dim≥2, SNC divisor D and M† docile on X=Y∖D, there is a smooth connected curve C⊂X meeting its constant-slope open such that the generated tensor categories are equivalent.
- Theorem 5.1.6: for an abelian scheme over smooth finite-field X with constant slopes, the slope-graded first crystalline cohomology and its first p-adic étale local system are semisimple. Theorem 5.2.2: p-primary torsion over E^sep of an abelian variety over finitely generated E/F_p is finite under the stated division End⊗Q_p or absence-of-Albert-IV hypothesis.
- Corollary 5.3.1 gives determination by the minimal part over perfect bases. Theorem 5.3.3 determines a cuspidal GL_r representation over a finite-field curve by minimal-slope Hecke data almost everywhere. Corollaries 5.4.2 and 5.4.4 give PBS filtrations and minimal dagger compactifications for isoclinic subobjects of dagger-extendable objects.

**Proposed order.**

- `MG.0`: Import the shared AM.0 Crew prefix. Build the divisibility-indexed positive Frobenius-power F^∞ carrier with coherent transitions and eventual morphisms before defining Λ_η; add exact tensor and scalar APIs (DAD/73).
- `MG.1`: Additional convergent/perfect-point groups and observable functors, punctual Q_p^ur structures, Dieudonné–Manin fibre structures, Λ_η, exact/cartesian squares and comparison of object-generated quotients.
- `MG.2`: Slope quasi-cocharacters, the associated parabolic P_G(λ), observability, Chevalley stabilisers and the intersection arguments for the exact square.
- `MG.3`: Docile Lefschetz using the imported MS.5 theorem, DAD Lemmas 4.4.5–4.4.7 and Corollary 4.4.8, with Bertini imposing the required tangency conditions. Lemma 4.4.7 is used only for cyclic quotients of prime order.
- `MG.4`: Use MS on curves and the monodromy/Lefschetz machinery to prove MS in all dimensions and parabolicity. No higher-dimensional theorem is imported back into this job’s curve proof.
- `MG.5`: Semisimplicity and p-torsion applications, minimal-slope determination, automorphic normalisation, PBS filtrations and minimal compactifications with their embedding hypotheses.

**Imports.**

- This roadmap MS.5 supplies curve MS and docile Lefschetz. Parent RD.1–RD.3 supply slopes, local monodromy, docility, full faithfulness and semistable reduction.
- VectorBundlesAndIsocrystals:VB0 supplies general Dieudonné–Manin, MC.6 and upstream ReductiveGroups Layer 7 supply Tannaka/parabolics, and CrystallineCohomology:CR.3 supplies the positive-power coefficient transition input.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 supplies crystalline Dieudonné theory, WeightsInEtaleCohomology:R34.2 supplies abelian-variety weights, and AbelianSchemesAndArithmeticModuli:A6 supplies the semisimple endomorphism algebra used for DAD/71.
- FunctionFieldArithmetic:FA.5 supplies curve Chebotarev. GlobalShtukasPartIICrystallineCompanions supplies Abe’s finite-order theorem and DAD/74’s degree-character normalisation and untwisting adapter.

**Exports and dependency direction.**

- Higher-dimensional MS and parabolicity to the genuinely additional monodromy consumers; the Bessel roadmap’s basic overconvergent groups still come from AM.0.

**Acceptance tests.**

- A split isoclinic object gives a trivial slope flag; the full group is its stabiliser.
- A nontrivial two-slope flag tests a proper parabolic and the direction of the inclusion.
- A perfect point over a field Ω larger than k checks the coefficient-field base change of the entire exact square.

**Source and ownership gates.**

- All /50 intersection factors live over K(Ω) inside GL(ω_ηM). Base-change the entire /41 square; V_M⊗K(Ω)=ω_η(M). The categorical equivalence over K(k) does not make the group live over K(k) without a descended form.
- Order CR.3/RD.3→positive-power carrier /73→Λ_η→exact square→intersection→parabolicity. Keep finite-order automorphic applications downstream of the crystalline correspondence.
- Carry DAD correction gates, including compactification/complement hypotheses and prime-cyclic quotient restriction. Do not revive the unused former item /38.

**Exact routed item ids:** `PAPER-DADDEZIO-23/33`, `PAPER-DADDEZIO-23/34`, `PAPER-DADDEZIO-23/35`, `PAPER-DADDEZIO-23/36`, `PAPER-DADDEZIO-23/37`, `PAPER-DADDEZIO-23/39`, `PAPER-DADDEZIO-23/40`, `PAPER-DADDEZIO-23/41`, `PAPER-DADDEZIO-23/42`, `PAPER-DADDEZIO-23/43`, `PAPER-DADDEZIO-23/44`, `PAPER-DADDEZIO-23/45`, `PAPER-DADDEZIO-23/46`, `PAPER-DADDEZIO-23/47`, `PAPER-DADDEZIO-23/48`, `PAPER-DADDEZIO-23/49`, `PAPER-DADDEZIO-23/50`, `PAPER-DADDEZIO-23/51`, `PAPER-DADDEZIO-23/52`, `PAPER-DADDEZIO-23/53`, `PAPER-DADDEZIO-23/54`, `PAPER-DADDEZIO-23/55`, `PAPER-DADDEZIO-23/56`, `PAPER-DADDEZIO-23/57`, `PAPER-DADDEZIO-23/58`, `PAPER-DADDEZIO-23/59`, `PAPER-DADDEZIO-23/60`, `PAPER-DADDEZIO-23/61`, `PAPER-DADDEZIO-23/62`, `PAPER-DADDEZIO-23/63`, `PAPER-DADDEZIO-23/64`, `PAPER-DADDEZIO-23/65`, `PAPER-DADDEZIO-23/66`, `PAPER-DADDEZIO-23/67`, `PAPER-DADDEZIO-23/68`, `PAPER-DADDEZIO-23/69`, `PAPER-DADDEZIO-23/70`, `PAPER-DADDEZIO-23/71`, `PAPER-DADDEZIO-23/73`.

### PadicDifferentialEquationsPartIIRigidCompanions

**Title:** Rigid connections and companions. **Parent:** `PadicDifferentialEquationsAndRigidCohomology`. **Area:** `padic`.

Study the arithmetic consequences of cohomological rigidity, keeping its crystalline, Simpson, companion and weight foundations at their existing owners.

**Final targets.**

- EG Theorem 5.4 with generic, geometric and residual rigidity separately specified; Theorem 6.1 supplies Cassels good points in every relevant arithmetic open.
- Corollary 4.17 and Theorem 7.3 give p-to-ℓ and p-to-p companions for the cohomologically rigid family under its good-reduction hypotheses. The motivicity conclusion remains the dense-open curve assertion; no arbitrary-family companion theorem is asserted.

**Proposed order.**

- `RC.0`: Import periodic crystalline realisations, stable moduli, unitarity and finite-residue fixed-determinant deformation functors. Define the residual-rigidity convention and prove the abstract GL/PGL and profinite/Betti comparison statements /91–93.
- `RC.1`: Import the small integral Faltings correspondence and relative crystalline local-system definition; own the LSZ/Faltings comparison and rigidity deductions /96–98.
- `RC.2`: Prove the separate generic/geometric/residual rigidity assertions in Theorem 5.4, Cassels good points and their open-set compatibility in Theorem 6.1.
- `RC.3`: Import the crystalline companion relation and p-to-ℓ existence, then prove the rigid-family corollaries. Import common mixed Chebotarev and admissible-stack covers, rather than developing them again.
- `RC.4`: Deligne constant-field decomposition /144, geometric irreducibility, End⁰-H¹ vanishing, determinant-order control and normalised counting. Prove only the stated dense-open curve motivicity conclusion.

**Imports.**

- CartierFlows supplies periodic crystalline realisations, HodgeStructuresPartII stable moduli and unitarity (/89), and the finished GlobalGaloisDeformations:R04.1/R04.2 blueprint the finite-residue fixed-determinant deformation functors (/90). No reopening of that blueprint for character-variety comparisons.
- PadicHodgeTheoryPartIIPadicSimpson supplies small integral Faltings; PadicHodgeTheoryPartIIRelativeCrystallineLocalSystems supplies crystalline local systems.
- ArithmeticDModules AM.3/AM.4 own admissible-stack covers (ABE/17, EG/145) and mixed coefficient Chebotarev ABE/51. GlobalShtukasPartIICrystallineCompanions owns the shtuka realisation and companion existence (ABE/1,31,32,44,46,47). The AE Lefschetz companion proof is retained as an explicitly located external input.
- DeligneWeightsAndPurity:DWP.7, GlobalShtukasAndFunctionFieldLanglands:GS.6 and the late DWP.10 smooth-variety reduction via EK Corollary 4.5/Appendix B supply the ℓ-adic purity branches. SF.2/upstream TraceFormula supplies trace. Parent RD.6 and CrystallineCohomology:CR.2 supply p-adic weights and coefficient comparison.

**Exports and dependency direction.**

- Arithmetic good reductions and companion/motivicity deductions for rigid connections, without exporting a general arbitrary-isocrystal companion theorem.

**Acceptance tests.**

- Compare fixed determinant GL rigidity with its PGL counterpart and track the missing central scalar directions.
- Separate residual rigidity from geometric rigidity under a finite coefficient extension; do not infer either by name.
- Check that Cassels points exist after imposing each additional arithmetic open, not just at a single preferred reduction.

**Source and ownership gates.**

- Keep EG E11/E12’s corrected proof arguments and every retained source/realisation gate visible in the eventual design.
- Order early arithmetic D-modules→crystalline correspondence→late rigid-companion applications, using prefix dependencies. No reverse import of this consumer by its own foundations.
- Do not enlarge the final motivicity statement beyond its dense-open curve scope.

**Exact routed item ids:** `PAPER-ESNAULT-GROECHENIG-20/086`, `PAPER-ESNAULT-GROECHENIG-20/094`, `PAPER-ESNAULT-GROECHENIG-20/096`, `PAPER-ESNAULT-GROECHENIG-20/097`, `PAPER-ESNAULT-GROECHENIG-20/098`, `PAPER-ESNAULT-GROECHENIG-20/099`, `PAPER-ESNAULT-GROECHENIG-20/100`, `PAPER-ESNAULT-GROECHENIG-20/101`, `PAPER-ESNAULT-GROECHENIG-20/102`, `PAPER-ESNAULT-GROECHENIG-20/104`, `PAPER-ESNAULT-GROECHENIG-20/109`, `PAPER-ESNAULT-GROECHENIG-20/111`, `PAPER-ESNAULT-GROECHENIG-20/112`, `PAPER-ESNAULT-GROECHENIG-20/113`, `PAPER-ESNAULT-GROECHENIG-20/114`, `PAPER-ESNAULT-GROECHENIG-20/115`, `PAPER-ESNAULT-GROECHENIG-20/116`, `PAPER-ESNAULT-GROECHENIG-20/117`, `PAPER-ESNAULT-GROECHENIG-20/118`, `PAPER-ESNAULT-GROECHENIG-20/120`, `PAPER-ESNAULT-GROECHENIG-20/122`, `PAPER-ESNAULT-GROECHENIG-20/091`, `PAPER-ESNAULT-GROECHENIG-20/092`, `PAPER-ESNAULT-GROECHENIG-20/093`, `PAPER-ESNAULT-GROECHENIG-20/144`, `PAPER-ESNAULT-GROECHENIG-20/145`.

## Audit, sources and interpretation limits

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 / Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Read actual statements of LinearMap.quotKerEquivRange, Representation.averageMap and its invariant/identity laws, LinearMap.trace and trace_one, Padic.norm_p_pow, and WittVector.Isocrystal. The last is a carrier; its file's rank-one classification is not general Dieudonné–Manin theory. No exact parent/Part II entry exists in the reviewed library audit. ColemanIntegration:L0 is a related entry only.

Current upstream roadmaps at 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were searched, including the roadmaps absent from the atlas snapshot and Completed. No matching PBQ, dagger-hull or minimal-slope target was found. Generic Tannakian/reductive-group inputs remain upstream. Read AdicSpaces and ReductiveGroups as the two full models. No Lake command was run in the read-only current checkout.

The packet records the exact five public PDFs, hashes and reading scopes. Full Tsuzuki §§1–7 and Appendices A–B were read; D’Addezio §§4.1–4.2 and §4.4.2; CT11 bounded splitting and PBQ existence; Ohkubo PBQ/log-growth/descent and boundedness; Abe–Esnault docile H⁰ restriction, weight and finite-set curve statements. The other directions' complete routed extraction/review records were read to assemble their briefs. No protected source was used, and no source passage is stored in any deliverable. The maintainer library index was checked.

Tsuzuki and D’Addezio findings remain scoped to the exact preprints read, with inherited extraction identifiers. Their journal main texts were not collated in this run. Cambridge served the Ohkubo abstract/login page in place of the requested published PDF. The new E31 is consequently a preprint-only misprint: Proposition 5.9, p.26, uses the wrong zero-th-kernel equality; boundedness means M^0=0. Its rank-one countercheck, arXiv version search and failed publisher collation are recorded. No independent confirmation is claimed by this design. No public source needed for the selected proof route was missing; the precise missing analytic and arithmetic supplier contracts are enumerated above.

Two existing upstream wording concerns are recorded only under `upstreamNotes`: use the exact reverse-algebraic-filtration carrier and corrected indices, and do not strengthen the parent's Q_q Crew correspondence to general K without the explicit request.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomologyPartII.json`: 0 errors, 0 warnings, all seven stages planned.
- `python3 research/blueprint/intake.py check-files` on all five permitted deliverables: 5 files, 0 problems. JSON/reader agreement, route total, internal target anchors, API/test counts and the six-planet limit were also checked.
- The suggested file elaborated with `lean-check` at the pinned shared build: exit 0; only eight declaration-uses-placeholder-proof warnings. It has real-bodied elementary data and no placeholder data definition. Imports are individual Mathlib modules. No Lean server, library build or update was started.
- The suggested file checks actual image/quotient carriers, a finite-group averaging milestone preserving a prescribed quotient, unbounded logarithm coefficients and growth, and primitive coefficient-projector trace. Heavy analytic/category carriers have precise reader targets rather than artificial stand-ins.
- All 198 input item references are assigned: 80 minimal-slope (79 planned, one parent import), 53 arithmetic D-modules, 39 monodromy, 26 rigid companions. All 66 target statements, 51 API entries and 51 tests appear in the reader; at most six planets occur in any layer.

The design is ready for independent review. Follow-up must resolve G1/G2 or explicitly retain their separate unclosed targets, register G3 with the ordered shared-prefix exports, and discharge the seven parent requests. It must preserve the distinction between a finite-field isomorphism and the lift of the specified map, the PBQ graded convention, dual arrow directions, finite coefficient normalisation and primitive-projector trace.
