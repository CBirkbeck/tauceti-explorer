# Handoff: DESIGN-MotivesAndAlgebraicCyclesPartII

Issue #3463; agent Codex; session `codex-kJCITL`. This is a complete target-level design pass for independent review, not an implementation or an accepted mathematical review.

The roadmap definition, packet, definitive reader and suggested Lean file are supplied together. The fixed roadmap identifier and parent are retained. The title describes Berkovich motives rather than the extraction’s obsolete rigid-analytic label. No RigDA equivalence is assumed.

## What is finished

All 45 extraction items assigned to this continuation are mapped explicitly to targets in `extractionCoverage`; the other 19 items are accounted for in `importedExtractionItems`, including the missing suppliers. Together they cover all 64 extraction items exactly once. There are 79 nodes: 46 theorems, 13 definitions, 12 constructions, 6 lemmas and 2 comparisons; 75 API items; 75 definition/construction checks; 57 planets; and 3 cited baseline declarations. Every definition and construction has uses, three API entries and three discriminating checks. The reader contains all targets, hypotheses, prerequisites, proof sketches, source locators, APIs, checks and acceptance conditions, plus 13 worked examples.

All thirteen layers BM.0–BM.12 are **planned**; none is closed. Every implementation status is `unchecked`. “Complete” describes the planning pass. It does not close the requested supplier interfaces, the missing K-theory inputs, or the independent review. The packet’s coverage records give the direct requests and inherited ownership gaps for each layer. The target graph and the induced layer graph are acyclic.

The current upstream roadmap checkout was read at `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AdicSpaces and JacobianChallenge and their suggested forms were read, and the newer roadmaps absent from the atlas snapshot were checked for overlap. Ordinary Jacobians and continuous profinite cohomology are imported through their actual upstream stage identifiers. Existing enhanced-category, Banach, diamond, algebraic-motive and K-theory targets are not replanned.

## What the reviewer should do next

Review the exact targets and enhanced coherences in the reader against the listed source versions. Begin with BM.0–BM.4 and the explicit interface contracts, then check cancellation, spectral K-theory, stabilization, rigidity and the comparisons. Check the source findings below independently. All stages still require that review; no stage has been marked closed by its author.

The general nearby-cycle construction is distinguished from the explicit Galois-stack and coherent-monodromy model over the algebraic closure of a finite field. Do not extend the latter to an arbitrary algebraically closed residue field without a separate argument. The algebraic comparison uses integral **étale** motives, not the parent’s Nisnevich category. The v-stack comparison retains the norm torsor and the partial-properness hypothesis. These scope distinctions are part of the targets.

## Unresolved proof leaves

### BM-G1: No live owner for general KH cdh descent

The corrected extraction routes integral KH cdh descent to GeneralAlgebraicKTheoryPartIITelescopicLocalization, which is not a live or reserved roadmap in this checkout. The live GeneralAlgebraicKTheoryPartII supplies a height-one-localized cdh statement and cannot replace it. Needed contract: noetherian finite-dimensional KH cdh descent, with formal-model/admissible-blowup comparison. A pro-cdh K proof followed by ball localization is an alternative, routed to a second absent descent/rigidity Part II. The maintainer must assign the general descent owner; neither absent identifier is used as a prerequisite.

### BM-G2: No live owner for valuation-ring K inputs

SchemeKTheoryOperationsPartIIDescentAndRigidity from the extraction is not live; the actual SchemeKTheoryOperationsPartII concerns formal K/Euler theory. Needed contracts: A¹-invariance of K for valuation rings, vanishing of negative K in the field/valuation comparisons used for totally disconnected rings, and the relative K/KH cofiber comparison for completions of smooth O_C-models. The ordinary S.5 regular-noetherian theorem does not cover nonnoetherian valuation rings. These proof leaves remain unestablished here and require a correctly assigned Part-II supplier.

### BM-G3: No live owner for the full geometric K-rigidity input

The missing descent/rigidity Part II also owns the Gabber–Suslin finite-coefficient geometric algebraically-closed-field invariance used in Theorem 8.9. L.2 is requested for the henselian comparison it actually plans; it is not silently promoted to the full geometric statement. The exact map and prime-to-residue-characteristic conditions need a source-checked owner.

### BM-G4: RigDA comparison has no supplied theorem

No target asserts Dmot(X)≃Ayoub RigDA(X). The corrected brief explicitly says that no roadmap plans RigDA and that this paper does not prove that comparison. The revised Binda–Kato–Vezzani route must import these Berkovich foundations and provide a separate source-checked comparison if required. This is a boundary/comparison gap, not a dependency assumed by any node.

No absent or unapproved continuation identifier is used as a prerequisite. BM-G1–BM-G3 require an owner assignment and source-checked supplier theorem before the affected layers can close. BM-G4 is a comparison boundary with no dependent node. The cdh and pro-cdh routes are alternatives, not simultaneous assumed inputs.

## Requests to mathematical owners

The packet records 32 exact interface requests; these are planning requests, not claims that other packets were edited or owners contacted. Each request lists its actual consumers in `neededBy`. The reader’s “Supplier contracts and ownership” section repeats each complete contract. The following inventory preserves the requested scope for the next reviewer.

1. **`EnhancedDerivedSheaves:E0`** — Enhanced space-valued sheaves and derived sheaves on cardinal-cutoff sites, hypersheafification, slices, coherent pullback and descent of adjoints. Give the actual enhanced category and change-of-cutoff comparison; ordinary triangulated sheaf cohomology alone is insufficient.

2. **`EnhancedDerivedSheaves:E2`** — The general Mondal–Reinecke theorem that the hypercomplete infinity-topos of a replete ordinary topos is Postnikov complete; also the finite-covering-dimension Postnikov criterion for sheaves on compact Hausdorff spaces, derived inverse-limit/completion and arithmetic reconstruction for the mapping spectra used here. The existing abelian-derived repleteness and locally weakly contractible space statements alone do not supply the first assertion.

3. **`EnhancedDerivedSheaves:E5:presentability`** — The nonstable compact-assembly criterion for seminormed rings used in Proposition 2.9; the presentable monoidal Verdier quotient for a localizing tensor ideal; spectral ball localization and E-infinity arithmetic fracture. These are additions to the precise existing stable compact-assembly and small Verdier-quotient nodes, which are cited separately.

4. **`EnhancedDerivedSheaves:E5:animation`** — Free animated commutative monoids and their group completions, augmentation-ideal filtration with connectivity convergence, and the Breen–Deligne group-completion resolution in the exact form cited by Scholze Proposition 8.4 (Aoki Theorem 4.4). Supply primary-source verification of that general resolution.

5. **`AnalyticStacks:AS.0`** — Apply no new motivic definitions here: export Mann’s six-functor construction principle, the extension theorem Scholze 5.19 = Heyer–Mann 3.4.11, coherent base-change/projection and cohomological étaleness/smoothness criteria. BM.8 verifies these axioms for Banach motives.

6. **`AnalyticStacks:AS.1`** — Derived quasi-coherent categories and tensor descent for the algebraic stacks MG_k and MG_C; affine-group comodule categories; identify representations of Hom(Q,L) with coherent locally nilpotent L-dual-rational-twisted operators, including unbounded derived objects. This operator/comodule equivalence must be proved, not inferred just on cohomology.

7. **`GeneralAlgebraicKTheory:K.2:plus`** — Connective ring K-theory as the functorial E-infinity group completion of finite projective modules, enhanced to connective spectra and multiplicative for tensor product; the existing plus-space component description is a partial input, not an infinite-loop product splitting.

8. **`GeneralAlgebraicKTheory:K.5`** — Suslin excision for a Tor-unital nonunital ideal I, with K(I)=fib(K(Z⊕I)→K(Z)) independent of unitization and its map to ambient K(A). Also the relative/truncating KH model for arbitrary idempotent ideals and A¹ localization needed to define the root-free KH-cofiber. Neither unrestricted K-excision nor automatic Tor-unitality of every ideal is allowed.

9. **`SchemeKTheoryOperations:S.6`** — Functorial multiplicative Adams operations on rational connective ring K-theory for the abstract rings in the Banach site and compatibility with line bundles, supported completion and the codimension-one weight shift. Existing regular-noetherian-scheme operations supply only that narrower range; the E-infinity/all-ring extension must be explicit.

10. **`KTheoryFiniteLocalFields:L.1`** — Quillen’s finite-field K calculation and compatibility with inclusions, followed by filtered continuity to K(F_pbar)_Q=Q[0]. Only the latter consequence is used for the residue Tate category.

11. **`KTheoryFiniteLocalFields:L.2`** — Prime-to-residue-characteristic K-rigidity for the henselian pairs entering the field-cofiber comparison, with the actual maps and Bocksteins. The full geometric Gabber–Suslin field-extension assertion remains in the routed-ownership gap.

12. **`KTheoryFiniteLocalFields:L.5`** — Verify and supply K(O_C)^∧p≃K(C)^∧p for algebraically closed complete C and K(k)^∧p≃Z_p for perfect characteristic-p fields, in the exact form cited as Hesselholt–Nikolaus Lemma 1.3.7 and Kratzer Corollary 5.5 in Scholze Corollary 8.10. This p-completed K statement is beyond a bare THH calculation and needs the trace/K comparison. Preserve p=2 as well.

13. **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`** — Import the represented Pic⁰/Jacobian and functorial line-bundle moduli on a smooth proper geometrically connected curve. The new marked-trivialization torus torsor is constructed in BM.4; do not duplicate the ordinary Jacobian.

14. **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`** — Multiplication by every positive integer is surjective on points of an abelian variety over an algebraically closed field, including inseparable multiplication in its characteristic. Combine with the torus case to prove the new semiabelian divisibility.

15. **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`** — Rational sections/divisors on smooth projective curves and their approximation/Riemann–Roch API. The analytic extension to controlling entire boundary discs is requested from TB.0 rather than attributed to algebraic point interpolation alone.

16. **`AdicCoefficientsAndComparisons:L5`** — The field-case de Jong alteration and normal-crossing compactification theorem with its dominance, generic-finiteness and base-extension hypotheses, and the proper-hypercover descent route when the degree is not invertible. Rational trace splitting may be used only rationally.

17. **`DiamondsAndVStacks:D1`** — Perfectoid strict bases and the almost structure-sheaf localization on closed subsets needed by torsion almost modules. Retain the actual plus subrings and complete idempotent algebra structures.

18. **`DiamondsAndVStacks:D2`** — Perfectoid arc/v-basis descent and tilting of the corresponding sites, with cutoff and cover conditions. The Banach arc-site itself is constructed here and is not identified with the scheme arc-site.

19. **`DiamondsAndVStacks:D4`** — Small v-stacks and cardinal-cutoff geometry, their fibre products and geometric-point descriptions for the v/arc comparison.

20. **`DiamondsAndVStacks:D6`** — Perfectoid Huber-pair and analytic diamond interface, the plus-subring and norm-free Tate presentations and site comparisons used by BM.12.

21. **`DiamondEtaleCohomology:C0`** — Étale/pro-étale/v site comparison, including the strict-base description by sheaves on π₀ and the overconvergent essential-image criterion from ECD 13.13/22.7; prove the unbounded strict-base passage.

22. **`DiamondEtaleCohomology:C2`** — Enhanced left-completed étale category Det for small v-stacks, coherent descent, and its correct finite-coefficient interpretation.

23. **`DiamondEtaleCohomology:C4`** — Canonical partially proper compactification, separatedness hypotheses, universal property and the functorial identification used by b*a*. No claim that every envelope is spatial.

24. **`DiamondEtaleCohomology:C6`** — Algebraically closed base-field invariance in its precise finite-coefficient range, including nonarchimedean extensions. Use as a torsion input, not an integral equivalence of all étale objects.

25. **`DiamondEtaleCohomology:C8`** — Geometric-point-as-profinite-quotient theorem and analytic/residue Galois cohomological-dimension bounds, including the closed-disc bound used in Lemma 5.3. Keep strict cohomological dimension for Z coefficients distinct from torsion cd.

26. **`DiamondEtaleCohomology:C9`** — Compact generation for Det of the finite-dimensional spatial diamond in Proposition 12.4, with uniform cohomological bounds on qc separated étale charts. The conclusion is used for the ambient category only.

27. **`DiamondSixOperations:S2`** — The enhanced proper-support homology of quasicompact smooth diamond domains and its pullback, tensor and base-change comparison in the range used for the compact-factorization argument.

28. **`MotivicEtaleKTheory:M.5a`** — The finite-correspondence, Nisnevich-transfer and cancellation inputs in their existing range, plus the precise integral étale change-of-topology and transfer-free/with-transfer comparison over algebraically closed fields. The presentable infinity enhancement, positive-characteristic coefficient inversion and map-level comparison must be specified; the existing bounded Nisnevich theory is only partial.

29. **`MotivesAndAlgebraicCycles:MC.2`** — The classical rational flag-variety realization for the normalizer permutation action, showing the averaging idempotent on the finite Tate decomposition retains exactly the degree-zero diagonal. Supply compatibility with the algebraic/étale comparison; no arbitrary-realization conservativity is assumed.

30. **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`** — Canonical all-degree continuous cohomology of profinite groups with discrete coefficients, its filtered-colimit interface and comparison with the condensed/profinite Galois-action site. Use the existing upstream carrier rather than define a second continuous-cohomology theory.

31. **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`** — Continuous Galois cohomological-dimension and closed-subgroup bounds on Z-modules in the geometric field cases, via the upstream canonical continuous-cohomology carrier.

32. **`TropicalAndBerkovichArithmetic:TB.0`** — Analytic refinements used by the owned curve targets: pass from the smooth missing reduction points in van der Put Corollary 1.3 to pairwise disjoint closed-disc boundaries after shrinking around two retained points; prove rational-section approximation preserving value 1 at chosen centres and no zero/pole on each entire boundary disc. Also Pic(C⟨T⟩)=0 and analytic line-bundle descent as needed by reduced-unit invariance. Do not re-plan the marked Jacobian or the final prime-divisible curve homotopy.

The restructure proposals keep this Berkovich continuation together, leave the revised Binda–Kato–Vezzani route to import it after a new extraction, and ask that genuinely broader supplier ranges be assigned to continuations of their existing mathematical owners. Existing narrow statements remain inputs. No approved roadmap identifier or unrelated packet was changed.

## Sources read and source limits

All statements and source descriptions in the deliverables are original formulations. No source passage, book extraction or source file is included.

- [Peter Scholze, *Berkovich motives*](https://arxiv.org/abs/2412.03382v3), arXiv:2412.03382v3, 22 January 2026; JAMS 39 (2026), 697–764. Read all of the 65-page v3 preprint, including proofs and references, with focused rereading of §§4–11. Every Scholze page locator here uses the preprint internal pagination, not JAMS pagination. The published JAMS PDF was not compared.
- [Marius van der Put, *The class group of a one-dimensional affinoid space*](https://www.numdam.org/item/AIF_1980__30_4_155_0/), Annales de l’Institut Fourier 30 (1980), no. 4, 155–164. Theorem 1.1, Lemma 1.2, Corollary 1.3 and proofs, pp. 155–161. The reduction-complement statement is distinguished from the additional analytic disc-boundary refinement.
- [Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, *Néron Models*](https://doi.org/10.1007/978-3-642-51438-8), Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 21, Springer, 1990. Maintainer-cleared copy read in place: §9.2, pp. 243–249, especially Proposition 3, Example 8 and Proposition 10. Used for proper Picard and nodal normalization background; not claimed as a direct reduced-modulus marked-Picard theorem. No source file or passage is included.
- [Denis-Charles Cisinski and Frédéric Déglise, *Étale motives*](https://arxiv.org/abs/1305.5361v4), arXiv:1305.5361v4, 5 December 2014; published Compositio Math. 152 (2016), 556–666. Read §2.2, pp. 25–27; §4.5, p. 41; §5.2, pp. 44–45; the comparison construction and Theorem 5.5.3/Corollary 5.5.5 with proofs, pp. 53–56. Locators use arXiv v4 internal pagination. The infinity-enhancement and transfer-free comparison are explicit supplier contracts, not attributed to an unstated theorem here.

The author-hosted Berkovich PDF was additionally checked on pp. 35 and 38 for the local calculations. The packet records SHA-256 hashes for the public PDFs and the exact access date, 19 October 2026. The author copy has hash `23a34fdedb928bf43b6d8fad58cc4a4652d2dfdeeeb429a0aabdbc44b17b53c9`. The JAMS version-of-record URL returned HTTP 403 and was **not** read or compared. Preprint locators do not purport to be journal page numbers.

The deeper cited inputs of Aoki, Mondal–Reinecke, Heyer–Mann, Cisinski’s KH cdh theorem, pro-cdh descent, valuation-ring K-invariance, Gabber–Suslin rigidity, Hesselholt–Nikolaus and Kratzer p-completion computations and the derived unipotent-comodule comparison have not all been source-verified at their original papers here. They are precise supplier contracts or recorded gaps, not certified theorems silently inferred from weaker existing nodes. The source metadata records only the texts and sections actually read. Reading a supplier packet is distinguished from reading its original cited paper.

## Source findings to verify

Five new findings are recorded under `sourceIssues`. They concern the inspected v3 preprint and author PDF, remain unreviewed, and are not assertions about the inaccessible version of record. The latest arXiv history, author paper page and Crossref correction relations were checked; no linked correction was located. Two prior extraction corrections (the P¹ base and the distinction between analytic reduction and algebraic closure in residue-field products) are reused rather than rediscovered.

- **E1** — §6, proof of Lemma 6.5, p. 38, polynomial root-containment calculation (arXiv v3; same expressions in the author copy). For |T|≥r₂ the product norm is |T|ⁿ≥r₂ⁿ. For |T−a_i|≤r₁, distinct residue classes give |T−a_j|=|a_i−a_j|=1 for j≠i; hence the product norm is at most r₁^{k_i}. Choose every k_i with r₁^{k_i}<s₁ and the total n with r₂ⁿ>s₂.
- **E2** — §6, proof of Lemma 6.5, p. 38, ratio of two nearby point coordinates (arXiv v3; author copy). The difference from 1 is (T₁−T₂)/(T₂−a_j).
- **E3** — §6, proof of Lemma 6.5, p. 38, final subgroup-containment display (arXiv v3; author copy). State that 0⊕(C×/(1+C<1))^d⊗Q is contained in the image of (N[U])(*)⊗Q→Q⊕(C×/(1+C<1))^d⊗Q.
- **E4** — §6, proof of Lemma 6.5, p. 38, top-right term of the domain-decomposition diagram (arXiv v3; author copy). Each annular V_i has one boundary degree for each of the d boundary coordinates of U, so the summand is Q^d. Summing over e domains gives Q^{de}.
- **E5** — §5.2, proof of Proposition 5.19, p. 35, coefficient inequality for the annulus fibre (arXiv v3; same in the author copy). Use min(r₂^{n−i},|a₀|r₁^{−i}): the upper and lower root-radius bounds impose both strict coefficient inequalities.

E5 includes a concrete diagnostic: over C₂, T²+T/2+4 has root norms 2 and 1/8, so the preprint’s displayed maximum test admits a root outside the annulus with radii 1/4 and 4; the corrected minimum excludes it. The corrected coefficient calculation is restricted to the nonarchimedean case. Archimedean annulus invariance uses the complex comparison. The target conclusions are retained with corrected proof steps; these are not new accepted errata.

## Suggested file and validation

The suggested file is 56 lines. Its only new definition is the real-bodied strict one-unit predicate over the existing normed-field carrier. Three API theorem statements and three examples retain six proof placeholders. Higher-category and motivic carriers do not exist at the pins and remain explicit mathematical targets in the reader; no dummy propositions, assumed carrier models or placeholder data definitions substitute for them.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. `lean-check research/blueprint/suggested/MotivesAndAlgebraicCyclesPartII.lean` completed successfully with exactly six proof-placeholder warnings and no other warning or error. The wrapper used the shared pinned build; no build or package update was run.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCyclesPartII.json` with the shared baseline declaration index: zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/MotivesAndAlgebraicCyclesPartII.lean`: passed.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: passed.
- Exact extraction-item partition, node/API/check agreement with the reader, the internal and layer dependency graphs, and the six-planet limit: passed.
- Staged whitespace check: passed.

The next action is independent mathematical review and supplier-owner resolution, followed by the normal accepted-plan packaging process. There is no unfinished writing pass or scratch material needed to resume. This run claims no second job.
