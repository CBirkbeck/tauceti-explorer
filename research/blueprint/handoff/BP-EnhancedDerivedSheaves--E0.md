# EnhancedDerivedSheaves E0–E4 — completed target-level planning pass

Codex — codex-BCQSXl, 2026-10-09. Refs #719. Claim confirmed by bot comment 6081236696. This submission completes one planning job; it is not a checkpoint, implementation or mathematical closure claim.

114 nodes: 23 constructions, 44 theorems, 6 comparisons, 17 definitions and 24 lemmas. 157 API specifications; 123 unit-test specifications; 30 planets; 56 named baseline declarations; 12 explicit gaps; 5 supplier requests. All 68 prior node IDs are retained.

## Coverage and completed work

| Layer | Nodes | Coverage | Closed |
| --- | ---: | --- | --- |
| E0 | 18 | planned | no |
| E1 | 22 | planned | no |
| E2 | 40 | planned | no |
| E3 | 13 | planned | no |
| E4 | 21 | planned | no |

The stopping condition is PROTOCOL §0: every stage in scope is planned at target level, with prerequisite chains ending in the baseline, named supplier interfaces or recorded gaps. E5 is outside scope. Every implementationStatus remains unchecked. The independent reviewer must assess the mathematics and the open interfaces; the structural checks do not certify them.

E0 now specifies categorical equivalences, right mapping spaces, joins, slices, coherent functors, enhanced universal properties, elementary stability, the signed dg nerve/Dold–Kan comparison, restricted coCartesian straightening and accessibility. E1 specifies unbounded replacement, enhancement/localization, tensor/internal Hom and ringed functors. Its additional perfect-ring and valuation inputs have precise hypotheses, including the corrected intrinsic Tor bound and the connective cohomology-base-change condition.

E2 specifies actual coherent towers and the product/difference computation, Milnor and ordinary pro-zero comparisons, all-degree Postnikov convergence, higher matching objects and refinement, space-valued sheaves, and the distinct perfect h-Čech, boundedness and hyperdescent results. E3 separates Kan extension, fibre cofinality, coCartesian preservation, representability, the two adjoint directions, localization, presentable limits, coproduct criteria and cutoff compatibility. E4 retains generic completion in DD.1 and specifies its sheaf reflector, completed tensor and coherent coefficient reconstruction.

The reader states all 114 nodes, 157 API items and 123 fixtures, with direct inputs and exact source locators. It is mathematical prose in our own words. No source excerpt, book passage, private path or source file is included.

## Suggested signatures and compilation

The suggested file elaborated through lean-check at Lean 4.34.0-rc2, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. There were no errors and 82 expected proof-placeholder warnings, with no other Lean warnings. No proof is implemented.

| Coverage unit | Included | Partial | Omitted |
| --- | ---: | ---: | ---: |
| Node signatures | 7 | 16 | 91 |
| API signatures | 23 | 24 | 110 |
| Test fixtures | 16 | 10 | 97 |

suggestedCoverage audits every item by node and proposed name, with explicit limits. “Included” describes the signature alone. The actual predicates for categorical equivalence, sequential repleteness, weak contractibility, saturation and pro-zero transitions reuse the pinned carriers. K-flatness uses the pinned signed total tensor and is prototyped for point modules. The tensor/Hom comparison asserts a mapping-space equivalence. The constant-ring completion prefix uses localization-generator orthogonality, with its telescope and full-subcategory comparisons expressly outstanding.

The file is not exhaustive under PROTOCOL §13: higher conditions that cannot yet be stated are omitted, never replaced by assumed propositions or proposition-valued proof holes. General sheaf, presentability, coCartesian and coefficient-limit signatures need the interfaces below. In particular, the point-module and constant-ring special cases must not be reported as implementations of the general nodes.

## Ownership and cross-roadmap requests

Accepted RS-05/RS-18 boundaries are retained: ordinary sites and topoi belong to D0; the enhancement belongs to E1; coherent convergence/descent to E2; generic Kan and adjoints to E3; generic module completion to DD.1; the sheaf/system application to E4. Elementary stability and accessibility needed by E0/E1/E3 are specified here rather than imported cyclically from E5. The E5 owner should cite these foundation nodes; its algebraic module-descent interface must avoid importing E2 geometric descent.

Canonical DGAInfinity stage references are restored in ordinary prerequisites: the current checker resolves them as roadmap stages. The earlier unresolved-reference workaround has been removed. General DG carriers and their signed infrastructure are imported from that existing upstream roadmap. Finite bicategorical mate correspondence and vertical pasting are cited from Mathlib, rather than planned a second time.

- **DiamondsAndVStacks:D0**: Ordinary coherent-site/topos and slice interfaces: free module-sheaf generators and their extensions by zero; exact/filtered-colimit section computations; ordinary scheme-perfection, quasicoherence, h-cover refinements and cohomology of structure sheaves under proper modifications. E1 owns derived functors and E2 owns coherent Rlim/Milnor. Reuse D0 nodes when their statements match; do not rebuild pinned SheafOfModules.

- **EnhancedDerivedSheaves:E5:abstract**: Only quantitative descendability and generic module-descent for a commutative algebra map whose fibre becomes tensor-nilpotent (BS Witt §§11.2–11.3, Theorem 11.15). E2 consumes this for h-Čech effectivity. Extract an acyclic declaration-level interface depending on E0/E1 foundations, without importing geometric h-descent back into its own proof. General monoidal/operadic, animation and Ind theories remain E5-owned.

- **tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules**: The general small DG-category carrier, degree-zero homology category and DG functors; import the existing upstream roadmap, not a second private DG carrier.

- **tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure**: Reindexing from cohomological to homological grading and the Koszul-braiding comparison between enriched composition factor orders; the existing enrichment is cited separately.

- **DerivedDeRhamCohomology:DD.1**: Import generic module completion and its telescope/Koszul criterion, localization orthogonality, generator independence, reflector and tensor compatibility. For a finite regular sequence in an arbitrary commutative ring, supply cofinality of (f₁^n,…,fᵣ^n) and I^n, uniform perfect Koszul resolutions, the strict pro-Tor comparison compatible with varying unbounded coefficient complexes, comparison of Koszul completion with Rlim of ordinary quotient-ring reductions, gr_I R≃(R/I)[T₁,…,Tᵣ], perfection of R/I^n, and derived-complete reduction conservativity. Keep these generic algebraic declarations in DD.1; none is constructed afresh in E4.

## Exact remaining work and resume points

Resume from the packet’s coverage.remaining and the per-item suggestedCoverage matrix, not from the old E4-only checkpoint. Each gap names its consuming nodes. Replace stage requests by exact supplier nodes when those become available; do not erase unresolved assumptions or infer coherent equivalences from homotopy-category equivalences.

1. **Signed enrichment and nerve comparison**. DGAInfinity layers 0–1 own the graded/DG carriers and factor-order convention. The E0 plan gives the sign and Dold–Kan comparison; its explicit coherent comparison θ, operator compatibility and identification with the pinned cone/rotation convention need declaration-level Lean proofs and signatures. HA/HTT statements and the triangulation proof were read; this is a formal interface/proof gap, not an unread theorem.

2. **CoCartesian and accessible higher-category interfaces**. Restricted straightening over interval, tower, simplicial and refinement nerves is specified. A genuine Cat∞ carrier, coCartesian lifting/universal mapping-space predicate, unstraightening and κ-filtered simplicial diagram/compactness interface are not pinned Lean declarations. Fix these carriers and size bounds, then state the omitted conditions. Coherent functors, slices and mapping-space predicates are present as typed prototypes.

3. **Functorial replacements with universe control**. HA provides combinatorial injective localization and Stacks 06YS provides objectwise unbounded K-flat existence. The proposed free-cover staircase must be made functorial and shown closed within one sufficiently large regular cardinal. Objectwise 06YS alone does not prove those two stronger construction properties. Diagram replacement comparison is part of the same interface.

4. **Point-free enhanced ringed localization**. Liu–Zheng §3.1 assumes enough points. Extend the point-free injective/K-flat localization comparison to coherent variable-coefficient sections, retaining tensor/Hom and all mapping spaces. HA 1.3.4.25 for constant model diagrams is an input, not a proof of the variable-ring Cartesian comparison. Do not add an implicit enough-points hypothesis to arbitrary replete topoi.

5. **Perfect-ring algebra bridges**. The pinned Tor derives one tensor variable and does not contain the comparison with Tor′ or the K-flat enhancement. Supply this comparison, regular-Noetherian finite global dimension/Kunz prerequisites and their colimit-perfection bridge from existing commutative algebra. Do not identify the pinned inverse-limit Perfection construction with forward-colimit scheme perfection. The announced intrinsic global dimension ≤2dim+1 has no proof at the cited remark and is not planned as a proved target; the corrected Tor bound ≤2dim is the recorded target.

6. **Ordinary geometric h-descent inputs**. D0/ordinary scheme owners supply scheme perfection, affine quasicoherent-module comparison, h-cover refinement into fppf/proper modifications, modification level induction and the structure-sheaf pullback square with finite cohomological bounds. The geometric proofs are requested leaves. The scope here retains qcqs/perfect finite-presentation and the finite-dimensional regular base exactly. E1 lifts the ordinary affine quasicoherent comparison to unbounded Dqc; that derived comparison is not reassigned to D0.

7. **Acyclic abstract module descent**. Request the E5-owned tensor-nilpotence/descendability module-descent theorem at declaration level. A stage-wide E5 import can conceal an E2→E5→E2 cycle. Its supplier theorem must use E0/E1 algebraic foundations alone; this packet does not build a private second abstract module-descent theory.

8. **Higher sheaf localization and matching objects**. The target statements and examples specify augmented matching objects, the OneHypercover degree-one comparison, sheaves of Kan spaces, hypercompletion and effective Postnikov towers. General matching-object/hypercover and small generating-set localization interfaces remain to be encoded. Hypercompleteness by itself is not treated as Postnikov effectivity. HTT 7.2.1.10 and its full convergence proof were read.

9. **Completion supplier algebra**. DD.1 supplies generic completion, Koszul/telescope and orthogonality, the reflector, generator independence, completed tensor, and the regular-sequence pro-Tor/reduction comparison with uniform finite amplitude on unbounded coefficient complexes. For an arbitrary regular finite ideal, do not replace this comparison by an unrestricted Artin–Rees citation. Pro-zero invariance is now its own E2 node; varying unbounded tensor still requires uniform Koszul bounds.

10. **Higher mate and coefficient reconstruction coherence**. Finite mate maps and vertical pasting are already baseline. New work fixes coherent ringed squares, their localization, coefficient transition comparisons and mapping-space reconstruction. Apply the point-free E3 system theorem and regular pro-Tor input; neither an h-category equivalence nor a field containing the desired reconstruction conclusion suffices.

11. **Source-version collation**. Three author-copy source issues have exact locators, corrections and reasons. The full version-of-record pages of the two BS papers were not available to this worker; collation remains open. No error is asserted against those unread published pages. All planned statements use the corrected hypotheses and ring directions.

12. **Actual suggested-signature conditions**. Supply the actual higher conditions and universe/coherence interfaces named in suggestedCoverage.nodeSignatures, apiSignatures and testSignatures. Partial signatures are specializations only; omitted signatures must be stated after their named carrier or comparison is available. In particular, none of the E3 presentability/Kan targets or E4 coherent coefficient-system targets is prototyped by an assumed proposition. Follow each coverage entry and its precise node statement; reuse pinned carriers, establish the signed/enhanced comparison interfaces, then add the actual signatures and fixtures and elaborate at the same pins.

## Sources read and source limitations

The packet gives URLs, hashes/editions and result-level page locators. The main source blocks read for this pass are:

- HA: §§1.1.1–1.1.4, including the full triangulation proof; the specified Dold–Kan propositions in §1.2.3; §1.3.1 dg nerve and mapping/coherent comparisons; injective localization and presentability in §§1.3.4–1.3.5; Proposition 1.4.4.1 and Corollary 1.4.4.2.
- HTT: the cited mapping-space, functor, join/slice/limit and equivalence material; Q-cosimplicial comparison; coCartesian definitions and restricted straightening; the full cited Kan-extension proofs; accessibility, representability and adjoint/localization results; sheaf construction and hypercover-localization criterion; Postnikov definitions and the full finite-homotopy-dimension convergence proof. HTT citations use PDF pagination, 18 ahead of the main printed pages.
- Bhatt–Scholze pro-étale author copy: §§3.1–3.5, pp. 16–26, including Postnikov, finite-dimension, completion and unbounded-descent proofs. The published five-page sample contains none of those pages.
- Bhatt–Scholze Witt author copy: Lemmas 3.16–3.18, pp. 14–15; Proposition 6.14, pp. 25–26; §11 perfect-ring and h-descent inputs, including Propositions 11.29–11.31 and Remarks 11.33–11.35, pp. 47–50, and the final boundedness/totalization/hyperdescent argument, pp. 50–51. The stronger intrinsic global-dimension assertion is announced without a proof; it remains a gap rather than a proved target.
- Stacks: Cohomology on Sites §§21.17–21.20 and §21.23; Derived Categories §13.34, PDF pp. 105–107; Simplicial Spaces Lemmas 85.17.3, 85.18.4 and 85.20.4. Strict ordinary towers and nonunique triangulated lifts are kept distinct from coherent enhanced towers.
- Bhatt direct summand: the ordinary pro-zero/pro-isomorphism and tensor/derived-limit arguments in §§3 and 5. No almost qualifier is added to this ordinary interface.
- Liu–Zheng: Proposition 2.2.4 and §§2.3, 3.1–3.2, pp. 79–88. The enough-points hypothesis is explicit; the arbitrary replete-topos extension is an open interface.
- Étale cohomology of diamonds: the cited §17 diagram, §22 adjoint, Proposition 23.7 cutoff and §26 coefficient results, including the specified proofs. Metadata identifies the actual arXiv-v4 bytes downloaded.
- Bhatt et al., mod-p Riemann–Hilbert: Remark 4.11, pp. 39–40, for the distinction between coherent limits and ordinary triangulated diagram choices.

Three source issues are recorded in the packet. The two pro-étale author-copy issues retain corrected quantifiers and the all-integer-degree eventual-tail proof. The new Witt Lemma 3.18 proof issue corrects the affine tensor direction to A⊗ᴸ_B B′≃A′. Visual PDF inspection verified the latter was not extraction reordering. Full published pages were unavailable and are not accused of these defects. There were no cleared-book dependencies for this job.

## Validation

- Packet checker with the pinned declaration index: zero errors, zero warnings.
- Four-file intake: zero problems; only the issue’s four deliverables change.
- All 56 named baseline statements were read in their pinned source files. The 51 distinct modules containing them matched raw pinned GitHub bytes; no mismatch occurred.
- Suggested file: successful elaboration, only 82 proof-placeholder warnings.
- Source-issue schema, acyclic target/prerequisite structure, three-or-more fixtures per definition/construction, at most six planets per layer, preserved IDs, reader/API/fixture agreement, and absence of source excerpts/private paths were checked.
- No mathematical closure or implementation is inferred from these checks.

Publication uses only the session branch codex-BCQSXl-enhanced-derived-sheaves-e0. This is the single job claimed in the run. An independent agent must review it; this worker does not review or red-team its own submission.
