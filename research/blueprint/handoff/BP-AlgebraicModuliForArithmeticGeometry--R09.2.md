# Handoff: BP-AlgebraicModuliForArithmeticGeometry--R09.2

Issue: #6334. Worker: Codex (GPT-6), session `codex-DQB3R6`. Date: 2026-10-11.
Branch: `codex-DQB3R6-hilbert-quot`.

## Completed and provenance

This is a complete target pass for the sole stage R09.2. Its accepted A0-extension parent left the stage `not_read`, asking for bounded Hilbert/Quot, universal flat families, base change, graph Hom/Isom, polarized Isom and algebraic Chow/dévissage for proper GAGA. All those targets are covered here. The accepted parent’s quasi-coherent pullback and fpqc descent nodes are imported without changing their IDs.

This submission continues the four deliverables from dormant [PR #8019](https://github.com/CBirkbeck/tauceti-explorer/pull/8019), by Codex session `codex-UzuzH2`. That unmerged fork submission’s handoff records a workflow-approval hold; the orchestrator released its claim after 24 hours without progress. This session claimed #6334 after the release and the bot confirmed it. The predecessor’s correct work and five source-finding IDs were retained, and the target statements, suggested file, cited sources and current upstream owners were checked again. This PR supersedes that attempt; the worker has not closed or merged either PR by hand.

The packet is **complete** at target level; R09.2 is **planned**, with supplier integration and independent review still required. Counts: 25 nodes (2 definitions, 2 comparisons, 10 constructions, 10 theorems, 1 application), 46 API items, 44 unit-test statements, 6 planets, 20 pinned-baseline declarations, 0 gaps and 5 requests. Every definition and construction has uses, API, at least three discriminating tests and native-library compatibility. Every implementation status is unchecked.

The material corrections made in this session are:

- The Grassmannian numerical-rank equality now requires a quotient family over a nonempty test base. It no longer forces every rational polynomial, including negative or nonintegral constants, to take a natural-number value. New tests cover those two polynomials and the unique point on the empty test scheme.
- The construction data retain the chosen presentation’s evaluation map. Recovery uses that map, then untwists the cokernel, and identifies the original source epimorphism as well as its target.
- The global Quot proof uses the coherent ambient π_*E(m), the existing coherent Grassmannian, proper-immersion closedness and the existing Plücker embedding into P(∧^{P(m)}π_*E(m)). It keeps coherent, vector-bundle and globally free projectivity hypotheses distinct.
- R09.1 dependencies now name the precise polynomial, regularity, coherent-Grassmannian, Plücker and very-ampleness nodes. Its review’s corrected regularity index is retained. That review currently has `needs_changes` status because its reader still needs synchronization; these are planned suppliers, not implemented baseline results.
- The chosen birational Chow modification produces a generic-rank-one test sheaf. Higher positive rank belongs to the more general domination variant and uses direct-summand closure.
- Internal Hom ownership is corrected to AlgebraicVectorBundles L0A, with the finite-source comparisons in L0B and determinant in L0C. The support-power citation is corrected to Stacks 01Y9. The native kernel declaration is recorded as an abbreviation.

The suggested file uses native scheme, module and category signatures, typed supplier data, actual relative-flatness and polynomial conditions, and native kernels, epimorphisms, ideals, inverses and line-bundle isomorphisms. Its projective core uses chosen very ample embeddings; the reader specifies the extension to relatively ample polarizations by common positive powers. Evaluation-cokernel helpers are R09.2 construction data rather than new supplier targets.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.2.json`: 0 errors and 0 warnings.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.2.lean`: exit 0 on 2026-10-11 at the shared pinned build. The only diagnostics were 144 admission warnings. All prototype examples elaborated; their mathematics has not been proved or computationally tested.
- The exact Swarm `intake.py check-files` command passed for the three deliverables and this handoff. Target/API/test correspondence, unique source-finding IDs across the roadmap’s parts, permitted paths and private-path exclusion were checked before submission.

The Lean run was serial and memory was checked first. Baseline commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No build, dependency update, cache fetch or language server was run.

## What remains and where to resume

Independent review should read all 25 targets, inspect the arbitrary-test-scheme contracts, check the numerical-rank and evaluation-map corrections, and verify global projectivity in the coherent Grassmannian. It should verify the five inherited source findings against the exact versions and the stated counterexamples. The representing parameter morphism is not asserted flat; only the universal closed family or quotient is flat over its parameter.

Resolve the following supplier interfaces before implementation:

- **`AlgebraicModuliForArithmeticGeometry:R09.1/family-regularity`:** Import R09.1/hilbert-polynomial, family-hilbert-polynomials, relative-serre, uniform-quotient-regularity and family-regularity at their stated scopes. Export the existing fixed-ambient fibre bound as the uniform family-tail statement for all test schemes, using SF.0 finite-presentation limits for arbitrary non-Noetherian tests. R09.1/coherent-grassmannian and plucker supply the global coherent ambient used for projectivity. The R09.1 review’s corrected regularity index must be retained. This is interface integration with existing targets, not a new definition or a duplicate regularity proof.
- **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`:** The current Jacobian Layer C/StableReduction J-C contract is proper finitely presented f over locally Noetherian S, coherent S-flat F, without assuming X/S flat: finite Grothendieck complexes on affine bases, coherent higher direct images, arbitrary-base-change maps, vanishing/surjectivity criteria giving locally free H0, and a corepresenting finite module for H0(F⊗M) when M is invertible. R09.2 combines these modules along a two-term projective presentation of a coherent E to corepresent Hom(E,F); it does not infer the general proper coherent-source theorem from a cohomology complex alone. Also use proper coherent pushforward for every coherent sheaf (no sheaf-flatness assumption for coherence), required by the Chow unit and test sheaves. Constant fibre dimensions on a nonreduced base alone must not imply local freeness; see sourceIssue E19.
- **`tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`:** Import current ModularCurves 0G: the relative Grassmannian of rank-r finite locally free quotients of a finite locally free sheaf, its native sheaf quotient, universal property, arbitrary-base-change identification and projectivity; on affine base opens use the free sheaf of sections of the chosen projective presentation. R09.2 supplies the additional evaluation relations and flattening locus, not a second Grassmannian.
- **`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`:** Import the current StableReduction Layer 2 relative Proj, projective morphisms, quasi-projective completions and proper-immersion closedness interface, together with the precise R09.1/projective-bundle, relative-very-ample, coherent-grassmannian and plucker nodes. Keep coherent, locally free and globally free presentations distinct in Nitsure 5.1–5.3. R09.2 imposes evaluation/flattening equations in these existing parameter spaces; no duplicate Proj, ampleness, Grassmannian, determinant or finite-source Weil restriction is planned.
- **`SchemeAndStackFoundations:SF.0`:** Supplement the existing finite-presentation-limits node with descent of relative flatness of a finitely presented module: for a filtered system A_i with colimit A, a finitely presented A_i-algebra B_i and finitely presented B_i-module M_i, if M_i⊗A is A-flat, then after increasing i the descended M_j is A_j-flat. Surjectivity of a descended map also eventually descends. Export the affine-cover scheme version for qcqs finitely presented X/S. This is the algebra step of Stacks 99.7.7 (082Q), PDF pp. 19–20, citing Algebra 10.168.1; it is not covered by merely descending flat scheme morphisms.

No second inventory pass for R09.2 is needed. Supplier-interface resolution and independent review remain; the coverage is intentionally `planned` until those interfaces are ready. No unresolved mathematical gap is recorded.

## Ownership and downstream redirection

Current upstream roadmaps were checked at `070dc2becd74419e76303ede84b465ed4a69461f`; the current Tau Ceti library was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. JacobianChallenge and AlgebraicVectorBundles reader documents were read in full, and the relevant ModularCurves and StableReduction interfaces and suggested files were checked. The nine roadmaps newer than the atlas snapshot were included in the overlap search. No existing full Hilbert/Quot construction was found.

ModularCurves 0F owns finite-source affine Weil restriction and 0G owns finite locally free Grassmannians. R09.1 owns the coherent extension and Plücker embedding. Jacobian Layer C/StableReduction J-C supplies proper coherent cohomology and base change for a flat sheaf, without assuming X/S flat; proper coherent pushforward itself requires no sheaf-flatness hypothesis. AlgebraicVectorBundles L0A–L0C owns tensor/internal Hom, finite local freeness and determinant. It is absent from the snapshot, so its actual upstream owner is recorded in `upstreamNotes`, without a fictitious atlas stage. No duplicate Proj, ampleness, sheaf-operation or Grassmannian target is planned here. Open Mathlib PR 14686 supplies a quotient-convention lead for 0G, not a pinned-baseline declaration.

ComplexComparisonPartII C3 is a downstream Tier 5 consumer, not a prerequisite of this Tier 4 stage. Redirect `repair-relative-proper-gaga` and `repair-proper-coherent-essential-surjectivity` to R09.2’s `chow-modification`, `coherent-devissage`, `generic-projective-test-sheaves` and `chow-unit-support`. Analytic coherence/support induction, proper comparison, full faithfulness and Ext¹ lifting remain C3 inputs. Its algebraic-space theorem also needs the R09.3 reduction. These are the downstream ownership changes to apply when assembling the catalogue.

## Sources and durable review notes

All repository mathematics is in the workers’ own words, with theorem/section/page locators. No source passage, PDF or extracted text is in the deliverables. Public-source URLs, editions, checksums and reading dates are in the packet. The cleared published EGA pages were read in place; no cleared-library file or passage was copied. No restricted book was needed.

The sources checked in this pass are Nitsure’s arXiv v1; Grothendieck’s Bourbaki 221; Stacks chapters 30, 99 and 108; EGA III1 §3.1; and Michèle Raynaud’s SGA 1 XII §4 in the electronic re-edition. The inherited findings were independently confirmed:

- **E19:** Nitsure 3.7(3), printed p. 17, fails over a nonreduced base. The extension on P¹ over dual numbers has constant fibre dimensions but nonfree pushforward. Use higher-cohomology vanishing and the valid cohomology/base-change criterion.
- **E20:** EGA III1 3.1.2, printed pp. 115–116, omits the witness-support condition used by its proof. Equal component lengths on two disjoint points gives a counterexample. Use Stacks 30.12.6 (01YI).
- **E21:** Electronic SGA XII, proof of 4.4, display (*) on printed p. 250/original margin p. 331, excludes Ext degree 1 at the step that needs extension lifting. The comparison must include all nonnegative degrees.
- **E22:** Nitsure’s exercise after Remark 2.2, printed p. 11, needs H⁰-surjectivity in its third regularity implication. The P¹ Euler sequence gives a counterexample.
- **E23:** Nitsure 2.1(c), printed p. 11, needs generation of the sheaf in its final argument, rather than generation of its H⁰ vector space.

The predecessor’s publisher-access failures and correction-search dates remain as provenance. Nitsure findings concern the preprint; the version-of-record chapter was not read. E21 concerns the exact electronic re-edition; no assertion is made about an unchecked original printing. EGA’s published statement and proof were read, and the Stacks criterion supplies the corrected support hypothesis. New targeted searches located no additional primary erratum. The target statements use the corrected forms.

The scratch sources and compile log are disposable. All information needed for review is in the four deliverables and their public locators. This session submits one pull request for #6334, then stops without claiming another job.
