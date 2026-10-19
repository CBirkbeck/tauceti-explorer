# Independent review: Algebraic topology, Part II

**Verdict: accepted as a complete target-level planning pass.** Every target has been independently checked and is verified or corrected. This accepts a plan with explicit missing proof inputs, not a proof-complete development. All 16 layers remain planned, none closed; all implementation statuses remain unchecked.

Review job: REV-DESIGN-AlgebraicTopologyPartII, issue #3491. Reviewer: Codex, session codex-qEwYPq, 19 October 2026. The design was written by another session, codex-qPJYQX (design PR #3401); this session did none of that work.

## Counts and scope

| Item | Submitted design | Reviewed plan |
|---|---:|---:|
| Targets | 75 | 75 |
| Definitions / constructions | 4 / 13 | 4 / 13 |
| Theorems / comparisons | 56 / 2 | 55 / 3 |
| API items | 51 | 86 |
| Discriminating unit tests | 51 | 51 |
| Planets | 73 | 72 |
| Pinned declarations | 11 | 11 |
| Supplier requests | 14 | 14 |
| Explicit gaps | 14 | 15 |
| Source findings | 11 | 12 |
| Routed source items | 102 | 102 |

The node review contains 51 verified and 24 corrected entries, with no added or unverifiable target. No baseline citation was removed or renamed. One generic theorem became a specialization comparison and consequently lost its planet. One gap and one source finding were added. All 17 definitions/constructions retain three tests and now have concrete API contracts beyond their original three-item outlines.

## Mathematical and ownership corrections

1. **Trace supplier.** FF.2 supplies character-sum bounds, not the general trace formula. Configuration trace now requests EDC.8's finite-étale representation/local-system adapter to the retained PR196 CohomologicalPointCounting/TraceFormula owner. EDC.6 still supplies complex/étale comparison. The shared PR196 source is absent from the public checkout, so its precise endpoint is a requested interface rather than an invented external stage or a claim of implementation.
2. **Generic equivariant carrier and Ext.** The carrier and generic finite-group stalk theorem belong to `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`. The AT2.14 target now only specializes that imported theorem to C₂ on the real circle. R7 spells out the finite-rank-in-each-degree resolution/stalk-colimit compatibility. The fixed-C₂ construction's out-of-scope trivial-group test became a free two-point orbit test; the generic trivial-group law stays at its owner.
3. **Current smooth geometry.** DifferentialGeometry Layer 2 already owns the orientation cover; Layer 3 consumes native finite-dimensional flows and smooth dependence; Layer 10 owns its stated equidimensional Sard interface, which does not by itself provide parametric transversality. Their current README/Suggested sections were read. The newer layers have no atlas stage IDs, so exact upstream locators are recorded without inventing IDs. GT.1 remains only the manifold bridge. R14 and G12 no longer attribute ordinary flow/transversality results to it. Ordinary Ehresmann retains the accepted MappingClassGroupsAndCanonicalRepresentations ownership promise until that owner has an actual stage.
4. **Surface representatives.** State compact boundaryless surfaces, finite disjoint embedded circles (including the empty union), a finite family of immersed closed curves with finite singular set, and finite forbidden points. Relative perturbation preserving disjointness is a genuine missing input, now G15, rather than an export of GT.1. The disconnected-surface check prevents an unjustified single-circle assertion.
5. **Equivariant transport.** Make finite-dimensional, Hausdorff, second-countable, boundaryless smooth hypotheses explicit for Ehresmann; the base point is fixed and both involutions smooth. Average metrics, linearize the base in invariant exponential coordinates, and lift radial paths. Properness and the ordinary supplier still require G12. The stratified version states locally finite Whitney strata, a smooth base action and given invariant compatible control data. G13 does not assume those data exist or that a generic theorem verifies the actual divisor family. A direct ambient cohomological-transport argument remains possible; pair-preserving transport is not asserted necessary.
6. **Locators.** Definable normality is Edmundo–Prelli §2.3, pp.10–12, not §2.2. Mather Proposition 11.1 is original notes p.62, PDF p.34 left, not p.142. BW (1.35) is p.19. Source-version records and the reader carry the corrected locators and the expanded Broughton proof read.
7. **API and consistency.** Added 35 concrete API items across all 17 definitions/constructions: coordinate/action simp and extensionality, coefficient and support functoriality, twist compatibility, adjunction and base-change characterizations, exact-sequence naturality, quotient/descent laws and extension classification. Replaced stale request aliases by actual R5/R7 IDs. Rebuilt each layer's remaining list from its incident gaps. Synchronized every target, hypothesis, dependency, API item, test, source finding, supplier contract and route in the reader.

## Sources and independent reads

All eleven public PDFs were fetched independently and their SHA-256 values agree with the recorded versions. The packet and reader record the exact URL, version, hash and locators. The following is the extent of the source read, not a claim to have completed all their foundational proofs.

| Source | Passages checked |
|---|---|
| [BS](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf) | §1 p.894; §2 proof of Lemma 2.8, p.907; §3 Lemma 3.9, p.919; §7 Definition 7.3, Lemmas 7.4–7.6 and Corollary 7.5, pp.941–945 |
| [BW](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf) | §1.1–1.5, pp.8–29; §1.6.3–1.6.4, pp.32–35; Lemmas 3.5, 3.15 and 5.9, pp.48,53–54,71 |
| [B19](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | §2.1–2.3, pp.71–75; §3.2, pp.77–78; §4.2, diagrams (4.3)–(4.5), pp.82–83; Proposition 6.6 proof, pp.93–95; §7.1–7.4, pp.97–103; §8.1, pp.104–107; loop applications p.91 |
| [CEF](https://www.math.uchicago.edu/~farb/papers/Pn-FqT.pdf) | Proposition 3.3, pp.19–20; Theorem 3.7, pp.21–22 |
| [HILTON](https://ncatlab.org/nlab/files/Hilton55.pdf) | Theorem A and basic products, pp.154–155; proof and Corollary 4.10, pp.160–162 |
| [SERRE](https://www.college-de-france.fr/media/jean-pierre-serre/UPL7235285843586540944_Serre_The_se.pdf) | Chapter V §3 Proposition 3, pp.492–494; §6 Lemma 7 and Corollary 2, pp.497–498 |
| [SULLIVAN](https://www.numdam.org/item/10.1007/BF02684341.pdf) | Introduction, pp.269–270; §11 loop models, pp.311–312 |
| [PHAM](https://www.numdam.org/item/BSMF_1965__93__333_0.pdf) | Part I §2, Theorem 1 and deformation-retraction lemma, pp.337–338 |
| [BROUGHTON](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0092/LOG_0016.pdf) | Theorem 1.2, p.219; Definition 3.1 and examples, pp.225–226; §4 Proposition 4.1, Corollary 4.2, Lemma 4.3 and Theorem 1.2 proof, pp.228–232; local Milnor/Morse prerequisites remain G1 |
| [EP](https://arxiv.org/pdf/1401.0846v3) | §2.3 definable normality, pp.10–12; §4.1 Theorems 4.1,4.7, pp.46–50; §4.2 Theorems 4.8–4.9 and Remark 4.10, pp.50–51 |
| [MATHER](https://www.math.princeton.edu/facultypapers/mather/notes_on_topological_stability.pdf) | §11 Proposition 11.1 and proof, original notes p.62 (PDF p.34, left page); §§7,10 controlled-data proof leaves remain a supplier obligation |

Broughton and Mather were checked against page images, including the stated Broughton proof reduction and Mather's original pagination. The other source reads covered the cited statements and relevant proof reductions. In particular, Hilton's basic-product indexing, Serre's rational sphere ranks and Sullivan's dual/minimal-model conventions were compared with the loop targets. These reads do not discharge G1–G3's local Milnor/Morse, spectral-sequence and model-existence inputs. Similarly, Edmundo–Prelli's exceptional-operation results do not constitute a construction of the semialgebraic foundations in Lean.

Scheiderer 18.11, the Epstein/Raynaud operation constructions, the Dimca/Lefschetz computation and Jannsen p.268 were not independently obtained here. They remain explicitly unverified primary proof inputs in G7, G8, G11 and G14. No passage or source file was copied into the repository. Source matches and this report use original wording.

## Source-finding verdicts

Eleven findings are confirmed, one rejected. Confirmation of a specification gap does not assert that the corrected theorem is false.

| Finding | Verdict | Independent conclusion |
|---|---|---|
| E1 | confirmed | BS, Published Lemma 7.6, pp.944–945: For n=3 and N>0, π₀Ω²(∨_N S²)=ℤ^N. The full space cannot have the claimed finite H⁰. |
| E2 | confirmed | BS, Published proof of Corollary 7.5, equation (7.3), pp.943–944: Equation (7.3) keeps only monomials on one weighted diagonal while presenting equality with the entire bivariate product; for j>0 even the constant term contradicts that equality. The weighted coefficient extraction suffices. |
| E3 | confirmed | BS, Published Lemma 7.4 proof, p.942: The first sum on p.942 uses compact notation with ordinary q^{m−a} weights. A¹ with m=1 detects the mismatch. |
| E4 | confirmed | BS, Published Lemma 7.4 proof, final product p.943: The final product on p.943 has no exponent; N=0 detects it. The immediately preceding product retains −e_r. |
| E5 | confirmed | BS, Published Lemma 7.6 proof, p.944: The bouquet notation on p.944 uses the smash symbol; Hilton Corollary 4.10 is a wedge theorem. |
| E6 | confirmed | BS, Published Lemma 7.6 proof, p.945: Sullivan pp.269–270 identifies indecomposables with dual homotopy and p.311 treats minimal nilpotent models. These hypotheses/duals must be made explicit; this is a specification gap rather than a counterexample in the corrected connected range. |
| E7 | confirmed | BW, Published §1.2.6, equation (1.35), p.19: The underlying misprint is confirmed after correcting the inherited diagnosis and locator: the domain must be Y(R), and the published target already is X(R). |
| E8 | confirmed | BW, Published §1.1.4, equation (1.16), p.14: Finite exponent does not imply biduality: an infinite direct sum of F₂ at a point fails the algebraic double-dual map. Finite stalks give the valid statement. |
| E9 | confirmed | B19, Published Lemma 7.3, pp.98–99; equation (7.13), p.103: With a=η mod n−φζ and ψ mod n=p*φ, p*η−ψζ reduces to p*a. At n=4 the printed plus sign can differ; trace nη is unchanged. |
| E10 | confirmed | B19, Published Lemma 7.3 proof, p.99: Equality after restriction requires a monic target restriction. The local non-disconnection argument supplies it for p_*(ℤ/n), independently of the source Q embedding. |
| E11 | rejected | B19, Published Proposition 6.6 proof, pp.94–95: The stronger allegation is not established by the cited passage. Ambient cohomological transport is asserted there; no necessity of pair-preserving transport or failure of Proposition 6.6 is proved. Keep the precise implementation checks in G13. |
| E12 | confirmed | B19, Equations (7.8)–(7.9), p.100, lower coefficient-reduction arrow: The generator n/2 of A[2] reduces to its parity, whereas A/2A reduces identically. The n=4 computation contradicts a degree-two identity. |

E7 corrects the inherited diagnosis: the published target is already correct; the domain must be Y(R). E11's allegation is rejected because the cited ambient transport argument does not establish a need for a divisor-preserving trivialization or a failure of Proposition 6.6. G13 retains the actual formalization checks without treating that allegation as fact.

E12 is new in this review. For even n with the sign action, H¹(C₂,ℤ/n(1))=(ℤ/n)/2 and H²(C₂,ℤ/n(1))=(ℤ/n)[2]. Coefficient reduction therefore acts identically on the first normalized coordinate but takes the degree-two generator n/2 to its parity. At n=4 that second map is zero; n=2 and n=6 give one. The existing cyclic-reduction target already had the right distinction. Its tests now have an explicit source-finding record. The new Lean example also detects the degree-four sign in E9; it tests the finite-module expression, not the unconstructed sheaf lift.

## Baseline, suppliers and closure

All eleven declarations were opened at their exact commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their statement, typeclass hypotheses and conventions were checked, not just their names.

- `mathlib:CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`): Sheaf cohomology on a Grothendieck site as Ext from the constant integral sheaf. No equivariant-support or semialgebraic six-operation theorem is supplied.
- `mathlib:Equiv.Perm.cycleType` (`Mathlib/GroupTheory/Perm/Cycle/Type.lean`): Multiset of lengths of nontrivial disjoint cycles; fixed points are omitted. The root-permutation adapter must add them.
- `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`): For additive-group-valued f,g, divisor-sum equality is equivalent to Möbius inversion using divisorsAntidiagonal, for positive indices.
- `mathlib:ArithmeticFunction.moebius` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`): The integer arithmetic function is (−1)^(card prime factors) on squarefree integers and zero otherwise.
- `mathlib:GenLoop` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`): The existing subtype of continuous cube maps sending the boundary to the base point. It is not a new loop-space carrier for this roadmap.
- `tauceti:HomotopyGroup.zerothHomotopyEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`): Path components of N-indexed generalized loops identify with the native N-indexed homotopy group.
- `tauceti:HomotopyGroup.loopSpaceEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`): Currying gives the equivalence from M-indexed homotopy of N-loops to (M⊕N)-indexed homotopy.
- `tauceti:HomotopyGroup.piLoopSpaceMulEquiv` (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`): Native group equivalence π_(m+1)(Ω^Fin n X)≃*π_(m+1+n)X, at the constant-loop basepoint.
- `mathlib:Rep.FiniteCyclicGroup.homResolutionIso` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`): Identifies the cyclic projective-resolution Hom complex with alternating ρ(g)−id and norm. Reuse it rather than plan a new periodic resolution.
- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`): For nonzero even degree identifies cyclic group cohomology with homology of norm followed by ρ(g)−id.
- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`): For odd degree identifies cyclic group cohomology with homology of ρ(g)−id followed by norm.

The reviewed library audit was read. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked separately from the pins. The current AlgebraicTopology and RealAlgebraicGeometry README/Suggested documents and relevant DifferentialGeometry, GeometricTopology and AlgebraicVectorBundles interfaces were read. Existing ordinary local coefficients, cochains and relative/twisted cohomology are imported; no such carrier is planned anew. The native maximal-flow inventory is also imported. AlgebraicVectorBundles' future Chern-class direction does not supply the topological tangent Stiefel–Whitney API G9 needs.

The supplier statements behind SF.0, SF.2 and its reserved generic key definition, EDC.6, EDC.8, FF.2, FF.3, FA.5 and LD.6 were read. Requests distinguish existing ownership from the additional interface needed. SF.6/MC.2 remain downstream of the semialgebraic prefix; the late Picard and affine arguments are not used to feed an étale comparison back into their foundations. No notion was moved to a new owner in this review.

All 102 route IDs were compared with the three accepted parent-AlgebraicTopology extraction routes: 22 BS, 49 BW, 31 B19, no missing or duplicate item. Every target in the roadmap is realized by a node, dependencies are acyclic and ordered by layer, and every prerequisite terminates at an internal target, checked baseline, supplier stage/request or named gap. Target-level proof sketches were checked as reductions with those obligations; this is not lemma-level proof closure. The source statements and conclusions left under G1–G15 are justified planning targets, not unverified claims of existing proofs.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicTopologyPartII.json`: **0 errors, 0 warnings**.
- Submission-file validation: **six files, zero problems**; the suggested file also passes the sorry-data check.
- Independent consistency check: **passed** for 75 unique reviewed nodes, acyclic ordered dependencies, roadmap/reader statement and API/test parity, all eleven source-version hashes, all twelve source-finding verdicts, the exact 102 extraction routes and all fifteen gaps in layer coverage. No source excerpt field or local filesystem path is present.
- `lean-check research/blueprint/suggested/AlgebraicTopologyPartII.lean`: **exit 0**, only the six existing declaration-uses-sorry warnings (lines 44, 49, 75, 97, 129, 150). The new modulo-four sign example and existing degree-two reduction examples elaborate with proofs. No data definition is sorry'd; the file remains 191 lines and introduces no missing-theory carrier.

## Handoff questions and remaining work

There is no unresolved contradiction blocking acceptance of this planning pass. The orchestrator should carry G1–G15 and all fourteen supplier requests into the continuation work. In particular: identify the concrete retained PR196 trace endpoint for R2; resolve the promised ordinary Ehresmann stage without duplicating it; obtain the unread primary inputs named above; and supply the relative perturbation theorem G15. The corrected E7 diagnosis, rejected E11 allegation and added E12 should inform any later extraction/errata reconciliation. Those extraction files are outside this review's authorized deliverables and were not edited.

No upstream repository, atlas content, labels or promotion files were changed. This review does not authorize publishing any new source erratum outside the programme.
