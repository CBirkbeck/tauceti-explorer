# RT-RS-24 — independent restructuring red team

Complete; no evidenced findings. Agent: Codex — codex-a71f92. Read date: 2026-09-30. Refs #4414.

## Scope and evidence boundary

Reviewed the accepted [RS-24 decision](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-24.result.json), [report](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-24.md), [family leads](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-24.json) and [independent review](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/reviews/REV-RS-24.md) at explorer `cc259ca124453a6f8cf49fe61cc456de32152e6d`. The author was ChatGPT Pro — gpt-20260921-c74f2a; reviewer Claude Code — cc-442dc5. This worker did neither job.

The test was whether restructuring loses mathematics, assigns an incorrect owner, strands a consumer, duplicates an existing carrier, introduces a circular prerequisite or changes an immutable Tau Ceti roadmap. I read both complete member documents, all 12 member contracts, all 15 other concrete stages in the 28 link directives, and the seven additional direct input contracts. Related ownership clauses in RS-12/16/21 were inspected, not independently reviewed in full.

This is not a new implementation audit or a page-by-page check of the underlying Scholze, Chenevier, DKSW or classification proofs. In particular I preserve the explicitly conditional symplectic application without certifying the present external status of Arthur's classification inputs. No new mathematical theorem is asserted formalized. No Lean file was requested or compiled.

## Findings

None. This means no evidenced defect was found in the stated restructuring-preservation scope, not that every source theorem or eventual implementation has been independently verified.

## Full target-preservation ledger

Original contracts: [IHG.0–IHG.6](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/content/campaign/IntegralHeckeAndGaloisDeterminants/README.md) and [TC.0–TC.4](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/content/campaign/TorsionCohomologyInfrastructure/README.md). The JSON is a decision patch, not a replacement atlas: its report explicitly retains all existing edges. A keep decision retains the entire original layer, not merely the abbreviated reason.

| Layer | Decision | Target accounting |
| --- | --- | --- |
| IHG.0 | narrow | The only transferred targets are the bare PolynomialLaw and DividedPowerAlgebra carriers. Homogeneous multiplicative laws, degree-n representation/base change, characteristic polynomials, operations, continuity, finite-projective comparison and coefficient-qualified trace reconstruction remain IHG.0's; the report and owner entry retain the operations even where the short keeps sentence compresses them. |
| IHG.1 | keep | Keep means the whole existing contract survives: Cayley–Hamilton quotient, faithful descent, GMA under residual multiplicity-freeness, semisimple reconstruction, residual-absolutely-irreducible reconstruction over complete local rings, obstructions and reducibility/extension/lattice algebra. No unrestricted representation reconstruction is introduced. |
| IHG.2 | keep | All chain/homotopy/derived/cohomology images, localization, support, annihilator and finite-generation targets remain. The amplitude-dependent bound is ideal nilpotence via compositions, not merely nilpotence of individual ghosts. TC.2 supplies the bounded geometric action before applying this theorem. |
| IHG.3 | narrow | The unramified GL_n polynomial retains arithmetic Frobenius, volume one, T_0=1, q^(i(i-1)/2), twist/determinant conversion and n=1/2 tests. General spherical Satake and its coefficient/q-half regime are imported from SR.4; the polynomial is not generalized to an unspecified dual-group representation. |
| IHG.4 | keep | Finite-quotient interpolation, uniform congruence hypotheses, continuous Chebotarev uniqueness, existence from polynomial-law identities, finite ramification and level/coefficient/inverse-limit maps all survive. Density of characteristic-zero points alone is not used to fill a nonreduced-ring gap. |
| IHG.5 | keep | The quantified-quotient descent schema, product/extension bounds, residual specialization and local-condition/lattice comparisons survive. The schema takes a supplied geometric comparison; it need not depend on construction of the particular TC.2 example. IHG.5 and TC.2 meet downstream at TC.3/4. |
| IHG.6 | keep | The entire separate integral Ribet branch is kept: residual coincidence and p=2, both versions, reduced-factor irreducibility, local triangularizations, Sigma/P conditions, coboundary generators in addition to cocycle image, local factors multiplying the extended Fitting ideal in Ttilde, invariant-theory/rational-cohomology and Koszul/Buchsbaum–Rim proof obligations. Its I.7 export survives; TC.4 is not its duplicate. |
| TC.0 | keep | Formal-model/power-bounded/site sheaf comparisons, boundary ideal, pullback/completion, extension under the exact hypotheses, admissible refinements and almost/Cech losses remain. The generic geometry suppliers are retained rather than rebuilt; almost errors are not relabelled nilpotent ideals. |
| TC.1 | keep | The Hodge-type lattice/period-map bundle comparison, away-from-p Hecke and separate p-action, finite/infinite-level reduction, approximation after ample twisting, boundary ideals and congruence exponents all remain. A period map alone does not replace the integral section construction. |
| TC.2 | narrow | The actual finite-level/completed/Cech/section diagram, Hecke/coefficient naturality, amplitude estimates, instance-specific derived-limit hypotheses, quantified nilpotent error and compatible quotient maps remain. CC.1/2/4/8 own general tower machinery; IHG.2 owns generic ghost nilpotence. No completion/cohomology interchange is asserted without control. |
| TC.3 | narrow | The symplectic/unitary boundary fibration, Levi Satake action, ambient/contragredient/twist polynomial identities and factor separation with actual auxiliary characters, ring endomorphisms, uniqueness, coefficient change, choice independence and nilpotent quotients remain. ALS.4 supplies the general boundary complex; IHG supplies only its stated algebra. The conditional symplectic application is not promoted to the CM/unitary theorem. |
| TC.4 | narrow | All four concrete routes, quantified quotient, source-proved exponent/tame-level uniformity, inverse systems and GL1/GL2/genuinely nonlifting torsion tests survive. IHG.4/5 supply generic limit/descent schemas; the concrete comparisons and universal-coefficient test remain TC's. |

The coefficient restrictions and acceptance examples were checked across the full documents, not only headings: nonreduced rings, residual characteristic at most n, trace failure outside its valid range, a nonzero ghost, GL1/GL2 normalization and a genuinely nonlifting torsion class all remain. Neither a generic perfect complex nor a pointwise polynomial factorization is substituted for the actual cohomological comparison.

## Owners and overlap adjudication

All eight directed family leads reduce to four comparisons. IHG.2/TC.2 is generic nilpotence versus an actual geometric action; IHG.3/TC.3 is GL_n normalization versus the ambient/Levi factor extraction; IHG.5/TC.2 is a generic theorem schema versus its premise; IHG.6/TC.4 is a false overlap between the independent integral Ribet theorem and a cohomological route-comparison suite. The proposal's dispositions retain both sides where needed.

| Shared target | Owner checked against its contract |
| --- | --- |
| Bare Roby polynomial-law and divided-power-algebra carriers | UPSTREAM:Mathlib:CommutativeAlgebra |
| Homogeneous multiplicative determinant laws and their common operations | IntegralHeckeAndGaloisDeterminants:IHG.0 |
| Cayley-Hamilton descent and hypothesis-qualified reconstruction | IntegralHeckeAndGaloisDeterminants:IHG.1 |
| Generic derived Hecke-image comparison and amplitude-dependent ghost-ideal nilpotence | IntegralHeckeAndGaloisDeterminants:IHG.2 |
| Local spherical algebra and Satake transform, with coefficient conventions | SmoothRepresentationsOfLocalGroups:SR.4 |
| Determinant-facing integral GL_n Hecke polynomial and Frobenius conversion | IntegralHeckeAndGaloisDeterminants:IHG.3 |
| Generic continuous determinant interpolation and coefficient/limit compatibility | IntegralHeckeAndGaloisDeterminants:IHG.4 |
| Generic determinant descent on quantified nilpotent quotients and residual specialization | IntegralHeckeAndGaloisDeterminants:IHG.5 |
| Actual geometric Hecke comparison, its bounded action and instantiated nilpotent quotient | TorsionCohomologyInfrastructure:TC.2 |
| General completed-tower torsion colimits | CompletedCohomologyPartII:CC.1 |
| General completed-tower completion and derived inverse limits | CompletedCohomologyPartII:CC.2 |
| General completed-tower finite-level chain model | CompletedCohomologyPartII:CC.4 |
| General completed-tower Shimura and Hecke adapter | CompletedCohomologyPartII:CC.8 |
| General arithmetic boundary/Levi complex and induced Hecke action | ArithmeticLocallySymmetricSpaces:ALS.4 |

The `formerly` entries are potential overlap locations, not statements that those stages already proved the target. In particular IHG.5 only takes the geometric comparison as a hypothesis. The report explicitly explains this usage, and the accepted review notes it; it does not create a reversed TC.2 → IHG.5 edge or move the geometry into IHG.5. I found no actionable owner error from that wording.

Neighbor checks: [RS-12](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-12.result.json) retains generic reconstruction/interpolation and Hecke normalization in IHG.1/4/3; [RS-16](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-16.result.json) retains the residual-coincidence integral Ribet theorem in IHG.6; [RS-21](https://github.com/CBirkbeck/tauceti-explorer/blob/cc259ca124453a6f8cf49fe61cc456de32152e6d/research/blueprint/restructure/RS-21.result.json) keeps general Satake and its normalization dictionary in SR.4 while importing the upstream GL_n double-coset special case. RS-24 does not reassign those special cases or change a Tau Ceti stage.

### Pinned upstream carrier check

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [PolynomialLaw, Basic.lean:77–85](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PolynomialLaw/Basic.lean#L77-L85) has a commutative-semiring coefficient ring and module inputs; its family on coefficient-algebra tensor products is natural for algebra maps. This is the bare carrier RS-24 imports, not yet multiplicativity or homogeneous determinant theory.
- [DividedPowerAlgebra, Init.lean:74–101](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean#L74-L101) is the congruence quotient generated by the divided-power relations. Its [weak lift, lines 317–325](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean#L317-L325) takes an explicit family satisfying those relations. The existence of these definitions does not discharge the degree-n representability/base-change and multiplicative identities retained in IHG.0.

The Mathlib and Tau Ceti checkouts matched the required pins (Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`). No new Tau Ceti implementation claim is needed here. The upstream sentinel denotes these existing imports, not a new editable roadmap.

## Every link checked on both sides

Numbers are one-based in the accepted `links` array. These 28 distinct pairs have 27 concrete stage endpoints and one existing upstream sentinel. The stage descriptions used are the corresponding `research/blueprint/atlas/roadmaps/<owner>.json` extracts and their authoritative README contracts at the explorer pin above.

| # | Source → consumer | Contract check |
| --- | --- | --- |
| 1 | UPSTREAM:Mathlib:CommutativeAlgebra → IntegralHeckeAndGaloisDeterminants:IHG.0 | Existing scalar-library prerequisite: the exact carriers were checked in pinned source; not a claim that determinant theory exists. |
| 2 | SmoothRepresentationsOfLocalGroups:SR.4 → IntegralHeckeAndGaloisDeterminants:IHG.3 | SR.4 explicitly supplies Satake and the normalization dictionary to IHG.3, including its separate integral form. |
| 3 | IntegralHeckeAndGaloisDeterminants:IHG.2 → TorsionCohomologyInfrastructure:TC.2 | IHG.2 is the abstract ghost-ideal supplier; TC.2 must construct the actual action and amplitude. |
| 4 | CompletedCohomologyPartII:CC.1 → TorsionCohomologyInfrastructure:TC.2 | CC.1 supplies torsion colimits, smooth action and correspondence operators. |
| 5 | CompletedCohomologyPartII:CC.2 → TorsionCohomologyInfrastructure:TC.2 | CC.2 supplies completion, Milnor/lim-one control and continuity under its explicit hypotheses. |
| 6 | CompletedCohomologyPartII:CC.4 → TorsionCohomologyInfrastructure:TC.2 | CC.4 supplies chain models with finite-cell/compact p-adic analytic hypotheses and noncompact/stabilizer replacements. |
| 7 | CompletedCohomologyPartII:CC.8 → TorsionCohomologyInfrastructure:TC.2 | CC.8 supplies the actual Shimura tower/Hecke comparison, expressly excluding TC's automorphic-section theorem. |
| 8 | IntegralHeckeAndGaloisDeterminants:IHG.0 → TorsionCohomologyInfrastructure:TC.3 | TC.3 uses the determinant carrier, not just characteristic polynomials on points. |
| 9 | IntegralHeckeAndGaloisDeterminants:IHG.1 → TorsionCohomologyInfrastructure:TC.3 | TC.3 uses Cayley–Hamilton/reconstruction only with its hypotheses; factor extraction is still separate. |
| 10 | IntegralHeckeAndGaloisDeterminants:IHG.3 → TorsionCohomologyInfrastructure:TC.3 | TC.3 needs IHG.3's GL_n conventions, then proves the ambient/Levi comparison. |
| 11 | IntegralHeckeAndGaloisDeterminants:IHG.4 → TorsionCohomologyInfrastructure:TC.3 | TC.3 needs continuous interpolation, not a pointwise polynomial factorization. |
| 12 | IntegralHeckeAndGaloisDeterminants:IHG.5 → TorsionCohomologyInfrastructure:TC.3 | TC.3 applies quotient descent to its actual geometric input. |
| 13 | ArithmeticLocallySymmetricSpaces:ALS.4 → TorsionCohomologyInfrastructure:TC.3 | ALS.4 supplies boundary/Levi complexes, shifts and Hecke actions; TC.3 specializes them. |
| 14 | TorsionCohomologyInfrastructure:TC.2 → TorsionCohomologyInfrastructure:TC.3 | Preserves the bounded geometric action and quotient maps consumed by factor extraction. |
| 15 | TorsionCohomologyInfrastructure:TC.3 → TorsionCohomologyInfrastructure:TC.4 | Preserves factor extraction as input to the four-route compatibility theorem. |
| 16 | IntegralHeckeAndGaloisDeterminants:IHG.4 → TorsionCohomologyInfrastructure:TC.4 | TC.4 supplies the uniformity needed to apply IHG.4's inverse-limit theorem. |
| 17 | IntegralHeckeAndGaloisDeterminants:IHG.5 → TorsionCohomologyInfrastructure:TC.4 | TC.4 applies the quantified-quotient schema, without claiming an integral result by inverting p. |
| 18 | AutomorphicGaloisRepresentationsPartII:AG2.2 → TorsionCohomologyInfrastructure:TC.4 | AG2.2 supplies the independent characteristic-zero unitary system; not symplectic classification. |
| 19 | IntegralHeckeAndGaloisDeterminants:IHG.1 → ArithmeticGaloisRepresentations:R01.5 | R01.5 explicitly imports IHG reconstruction and retains arithmetic continuity and Frobenius recognition. |
| 20 | IntegralHeckeAndGaloisDeterminants:IHG.3 → AutomorphicGaloisRepresentationsPartII:AG2.0 | AG2.0 uses the early Hecke/Frobenius dictionary, explicitly before local Langlands comparison. |
| 21 | IntegralHeckeAndGaloisDeterminants:IHG.1 → AutomorphicGaloisRepresentationsPartII:AG2.3 | AG2.3 imports generic IHG reconstruction and the early analytic engine, not the later arithmetic Galois family. |
| 22 | IntegralHeckeAndGaloisDeterminants:IHG.4 → IgusaVarietiesAndTorsionConcentration:IG.6 | IG.6 consumes determinant interpolation in its lower-rank torsion boundary argument. |
| 23 | IntegralHeckeAndGaloisDeterminants:IHG.6 → IntegralIwasawaTheory:I.7 | I.7 explicitly imports the residual-coincidence Ribet theorem and proves actual Hilbert/Eisenstein hypotheses. |
| 24 | TorsionCohomologyInfrastructure:TC.4 → IgusaVarietiesAndTorsionConcentration:IG.6 | IG.6 consumes the torsion/Hecke comparison before proving its own boundary length obstruction. |
| 25 | IntegralHeckeAndGaloisDeterminants:IHG.1 → AutomorphicCongruences:L0 | L0 explicitly imports generic reducibility/extension algebra and retains automorphic local-condition/lower-bound work. |
| 26 | IntegralHeckeAndGaloisDeterminants:IHG.1 → PadicFamilies:L4 | L4 reconstructs an actual arithmetic family only under residual hypotheses; no new input to L2a. |
| 27 | IntegralHeckeAndGaloisDeterminants:IHG.4 → PadicFamilies:L4 | L4 uses common determinant interpolation, with arithmetic specialization and local filtration still its own. |
| 28 | TorsionCohomologyInfrastructure:TC.3 → PotentialAutomorphyInfrastructure:PA.0 | PA's source-to-owner matrix imports TC boundary/Levi comparison; PA.0 retains its source-specific splitting and degree shifts. |

All six native exports are among these rows: IHG.1 → R01.5/AG2.3, IHG.3 → AG2.0, IHG.4 → IG.6, IHG.6 → I.7, and TC.4 → IG.6. The four new consumer imports are IHG.1 → L0, IHG.1/4 → L4, and TC.3 → PA.0. They do not make the later arithmetic family a prerequisite for the early L2a eigenvariety engine.

The existing direct inputs not repeated by this patch remain intact: AdicSpacesPartII F0/R3 and PerfectoidSpaces P2/P8 → TC.0, AutomorphicBundles B3 and PerfectoidShimuraVarieties S3 → TC.1, ArithmeticGaloisDuality R02.1 → IHG.6. I read their complete contracts: formal/sheaf geometry, perfectoid sheafiness and quotient control, canonical/subcanonical bundles, Hodge-type period-map pullback, and topological cohomology/limit control respectively. None is replaced by a slogan in RS-24. All unchanged internal stage edges also remain.

## Dependency stress tests and checks

Loaded the pinned atlas and current additional-roadmap definitions in memory, retaining their explicit prerequisite edges, and added the proposal's directed pairs. For each pair `source → target`, performed breadth-first reachability from target back to source. Enlarged the same graph twice with all accepted link packets, then the neighboring RS-12/16/21 directives. A return path would witness a cycle containing an RS-24 edge.

| Graph | Unique directed edges | Proposed pairs with a return path |
| --- | ---: | ---: |
| Atlas + current/additional roadmap requirements + RS-24 | 3816 | 0 / 28 |
| Additionally 25 accepted link packets | 4413 | 0 / 28 |
| Additionally RS-12, RS-16 and RS-21 directives | 4690 | 0 / 28 |

This is not a claim that every unrelated component of the whole atlas is acyclic. Unaccepted arbitrary future proposals and undeclared prose dependencies are not treated as established edges. Source-contract inspection separately checked the important early/late distinctions: raw AG2 normalization before later local Langlands comparison, early ALS before completed towers, the generic IHG.5 schema before its TC instance, and later IG.6 concentration rather than a circular input to the characteristic-zero system.

The nine new native-graph pairs are ALS.4 → TC.3; IHG.1 → AutomorphicCongruences:L0/PadicFamilies:L4; IHG.3 → TC.3; IHG.4 → PadicFamilies:L4/TC.4; IHG.5 → TC.3/TC.4; TC.3 → PA.0. The other nineteen already occur in the native graph. Neither TC.2 → IHG.5 nor an IHG.6/TC.4 direction is introduced.

The repository restructuring checker, invoked on the pinned proposal/family and the pinned atlas/additional-stage registry, returned no errors. Independent counts: 2 roadmap decisions, 12 layer decisions, 5 narrowings, 14 owner entries, 28 distinct pairs, 9 new pairs and 6 preserved native exports. The red-team JSON passed `scripts/check_redteam.py`; submission-file checks found no invalid JSON, unauthorized path or local-machine path. No accepted input file was edited.

## Handoff

Nothing remains to finish this red-team scope. No fix job is requested because no evidenced finding was found. Independent intake/review remains the programme's next step; this report does not apply the restructuring, regenerate the atlas, or certify any construction as implemented.
