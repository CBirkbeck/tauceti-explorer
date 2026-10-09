# Independent review: Artin v-stacks, solid and lisse coefficient categories

**Verdict: accepted, after the corrections below.** Reviewer: Codex, session `codex-MY9iqn`, on 2026-10-09. This worker did none of the package authorship or earlier planning/revision work. The claim for [issue #7541](https://github.com/CBirkbeck/tauceti-explorer/issues/7541) was confirmed by the bot before review began.

The input is the [package](../packages/VStackSheavesAndLisseCategories/README.md) and the [accepted plan](../packets/VStackSheavesAndLisseCategories.json), accepted by `independent-review-REV-VStackSheavesAndLisseCategories~2` on 2026-10-08. This is the independent package-transfer review required by Protocol §20. Its acceptance preserves the plan's stated mathematical interfaces and signature omissions; it does not declare those interfaces implemented or the mathematical dependency graph closed.

## Checks required by the issue

| Requirement | Result and evidence |
| --- | --- |
| Upstream form | Pass. Compared the introduction, scope, conventions, dependency presentation and target/API/example organization with `UPSTREAM_GUIDE.md` and the nearby upstream AdicSpaces and ClassFieldTheory documents. The package motivates the geometry and coefficient development, pins conventions, imports neighbouring theories and organizes all six layers into 26 mathematical families. README is 164,600 bytes, below 200,000 bytes. Suggested.lean is 148,520 bytes. |
| Fidelity to the accepted plan | Pass. Read every target and its hypotheses against the corresponding package entry, including the 33 rewritten statements and the two hypotheses expressed as mathematical interfaces rather than gap identifiers. All 80 targets, 183 API items and 95 tests are present. Every direct prerequisite and source locator is retained, apart from removal of a source-issue workflow suffix. Local anchors are unique and all local links resolve. The internal prerequisite order has no forward references. Additional explanatory prose supplies conventions or explains existing targets; it does not introduce an extra theorem or category. |
| Own words and attribution | Pass. The roadmap gives mathematical specifications, rather than a paper's narrative or a section-by-section synopsis. The cited sources have theorem/definition/proposition or section identifiers and printed pages for each target. Checked selected source passages directly in freshly fetched editions; all five SHA-256 values match the accepted plan. A supplementary normalized 17-word overlap scan found no literal prose run in the README against those five source texts. This scan supplements the passage comparison, rather than replacing it. No source excerpts were committed. |
| No programme process | Pass after correction. The roadmap contains no packet filenames, job identifiers, review findings, checkpoints or coverage statuses. Suggested.lean's source-issue, red-team and gap-tracking identifiers have been removed or replaced by mathematical interface descriptions. The standard opening prototype note and the accepted Lean namespace are retained as required by §13; they are not histories of the programme's decisions. |
| Suggested Lean | Pass. The final `lean-check` exited 0, with 38 warnings, all `declaration uses sorry`, and no errors or other warnings. The executable tokens are identical to the accepted suggested file. The actual condensed definitions, API signatures and 12 typed examples match their ordinary categorical portions of the README. The omission ledger retains all unavailable signatures, names, contracts and dependencies honestly. |
| Metadata | Pass. `metadata.toml` is exactly the single line `topic = "math.AG"` followed by a newline, and parses as one key. Algebraic geometry is suitable for the geometric stacks and sheaf-category development. |

## Corrections applied

1. Replaced all 80 `Gaps:` comment lines in Suggested.lean with `Required interfaces:` and descriptions of the actual mathematical input. This includes cutoff comparisons, enhanced descent, Breen–Deligne stable homology, compact-Hausdorff cohomology, sousperfectoid estimates, algebraic ULA, integral Banach–Colmez unit homology, smooth derived duality, Haar normalization and perfect descent. The necessary carrier/interface qualifications remain explicit.
2. Removed references to `sourceIssues`, `E3`, `E4`, `E10` and `RT29` from the Lean ledger. Retained the corrected discrete-group smoothness exception, represented affine points, the lisse Künneth target category and the restriction of the lisse duality target to exchange. These are mathematical statements rather than instructions to consult an earlier review.
3. Corrected the VS3.3 lead-in: its completed-ULA input precedes that section in VS3.1. The README now links directly to that target instead of saying it is below.

No mathematical definition, hypothesis, dependency, proposed API name or test was changed. Metadata already met the requirement. The accepted packet, original suggested file, atlas data and upstream roadmaps were not edited.

## Mathematical boundaries and sensitive statements

The generic VS2 condensed/solid layer contains 22 targets and has no internal dependency, even transitively, on VS0 or VS1. The VII.5 completed-ULA and constructible/geometric-Langlands comparisons are in VS3. The divisor/Drinfeld and solid partial-support applications are in VS4. Five stable node identifiers still start with VS2 although their accepted owner is VS3 or VS4; the package follows `parentStageId`, not that historical identifier prefix. This preserves the core/application separation established by the accepted plan.

The small v-stack, diamond, eligible torsion-operation and enhanced category carriers remain imported from their owners. Artin is a property of that stack carrier. Solid integer groups reuse `CondensedMod.IsSolid`; the full subcategory uses Mathlib's `ObjectProperty.FullSubcategory`. General discrete-ring solidity uses sectionwise restriction along every polynomial map from the integers, while topological solid E coefficients and the underlying-integer-solid analytification remain different constructions. Smooth representations use the existing `TauCeti.SmoothDiscreteTopRep`, with the derived extension owned by SmoothRepresentationsOfLocalGroups. AnSpec/gluing, adic completion, the relative curve and bundle geometry are imported, not replanned.

The plan's hypotheses are preserved at the points where enlarging them would be unsound: ULA includes both the strict-local generization and perfect-constructibility tests; the Artin extension requires an eligible composite chart; the Jacobian criterion uses positive tangent slopes and its projective-embedding condition. Solid partial-support vanishing keeps proper spatial finite-dimensional geometry, a pullback input and the bounded-below or smoothness alternative. VII.5.2's nonproper torsion comparison and VII.5.3's proper solid comparison remain separate. The lisse generating source is not given an extra absolute-diamond condition; cutoff adjoints do not assert unrestricted presentability. Admissibility tests perfection of the whole derived invariant complex. Lisse exchange does not assert a reflexivity theorem. Coefficient extension asserts preservation; a descent converse requires the exact perfect-descent input stated in the conventions.

For connected Banach–Colmez kernels, the required integral homology and cone-detection/completion interface is retained. The package does not use proper smooth Poincaré duality on nonproper fibres or claim that reductions alone detect arbitrary rational solid coefficients. Haar-normalized global dualizing trivialization likewise retains its purity interface. These remain mathematical targets with specified dependencies, rather than assumed theorem fields.

The accepted packet and the reviewed library-coverage rows were checked alongside the package's neighbouring-roadmap table. Existing link-map screens do not introduce another owner or an extra edge into this package. In particular, the local Weil topology and degree remain the accepted ClassFieldTheory Layer 9 input of the divisor presentation; this review neither duplicates that theory nor emits a new link.

## Sources and library checks

All five public PDFs were fetched afresh. The hashes below equal the accepted plan's recorded hashes. The publisher's functioning Paškūnas–Quast PDF endpoint is already used by the package and returns the same edition.

| Source | Edition and independently checked passages | SHA-256 |
| --- | --- | --- |
| [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | Author-hosted 356-page edition. Selected passages in IV.1–IV.4 and VII.2–VII.7: Artin/discrete-group scope, ULA and Jacobian hypotheses, solid support/homology, completed comparisons, lisse generators and stratum/duality distinctions; also IX.2.2, pp.322–323. | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| [Scholze, Condensed lectures](https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf) | Author-hosted 78-page edition. Theorem 5.8, pp.35–36; Definition 7.1, Examples 7.3 and Proposition 7.8/Remark 7.9, pp.45–48, for the integer and general-ring distinctions. | `d422561285f3025a53ee71a497d350fc89afaefe28053de78e2255b2d521c69d` |
| [Scholze–Weinstein](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | Author-hosted 27 March 2020 edition. Theorem 13.5.7, printed p.114/PDF p.124, and Lemma 16.3.2, printed p.144/PDF p.154, including the printed Q_p scope and the separate general-field supplier. | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [Boxer–Calegari–Gee–Pilloni](https://math.uchicago.edu/~fcale/papers/Modular.pdf) | Author-hosted 230-page edition. §2.2.1, pp.18–20, and Remark 2.4.1/Example 2.4.2, pp.30–31, for topological solid E and discrete underlying-Z analytification/localization. | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| [Paškūnas–Quast](https://doi.org/10.1017/fmp.2026.10030) | Published 96-page edition. Appendix A, Lemmas A.1–A.8 and §A.1, pp.88–91. Representability corrects the accessibility-only claim; arbitrary relations use compact intersections, retaining finite affine ambient dimension. | `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93` |

The 39 recorded baseline declaration statements were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The key active interfaces are the condensed free/right-Kan objects and solidification map, lifted-integer CondensedAb, the integer Hom-inversion predicate, full-subcategory inclusion, restriction of scalars, sheaf composition, profinite realization and categorical epimorphisms/pullbacks. The Tau Ceti smooth-discrete representation carrier exists at its pin; the package correctly imports its enhanced theory as mathematical input rather than calling it absent.

The shared elaboration environment has exactly the pinned Mathlib. Its Tau Ceti checkout is a different revision, but Suggested.lean imports only the individual Mathlib modules and no Tau Ceti module. Thus the successful run validates this file's actual imports at the exact Mathlib pin; the Tau Ceti declaration reading was separately performed at the required commit.

## Target transfer ledger

Every row below passed statement, hypothesis, source, prerequisite and API/test comparison. The table uses the accepted owning layer. “Partial ordinary prototype” identifies the six targets with executable Lean content; “omitted signature” identifies the other 74 whose contracts are comments, not elaborated declarations.

| Layer | Target | Suggested form |
| --- | --- | --- |
| VS0 | [`artin-v-stack-definition`](../packages/VStackSheavesAndLisseCategories/README.md#artin-v-stack-definition) | Omitted signature |
| VS0 | [`stability-under-fibre-products-and-representable-maps`](../packages/VStackSheavesAndLisseCategories/README.md#stability-under-fibre-products-and-representable-maps) | Omitted signature |
| VS0 | [`enhanced-smooth-descent`](../packages/VStackSheavesAndLisseCategories/README.md#enhanced-smooth-descent) | Omitted signature |
| VS0 | [`shriek-pullback-for-smooth-stacky-maps`](../packages/VStackSheavesAndLisseCategories/README.md#shriek-pullback-for-smooth-stacky-maps) | Omitted signature |
| VS0 | [`point-to-classifying-stack-not-smooth`](../packages/VStackSheavesAndLisseCategories/README.md#point-to-classifying-stack-not-smooth) | Omitted signature |
| VS0 | [`partial-compact-support`](../packages/VStackSheavesAndLisseCategories/README.md#partial-compact-support) | Omitted signature |
| VS0 | [`partial-compactly-supported-vanishing`](../packages/VStackSheavesAndLisseCategories/README.md#partial-compactly-supported-vanishing) | Omitted signature |
| VS1 | [`ula-definition-with-constructibility`](../packages/VStackSheavesAndLisseCategories/README.md#ula-definition-with-constructibility) | Omitted signature |
| VS1 | [`ula-descent-and-smooth-locality`](../packages/VStackSheavesAndLisseCategories/README.md#ula-descent-and-smooth-locality) | Omitted signature |
| VS1 | [`perfect-local-systems`](../packages/VStackSheavesAndLisseCategories/README.md#perfect-local-systems) | Omitted signature |
| VS1 | [`perfect-rhom-and-la-characterisation`](../packages/VStackSheavesAndLisseCategories/README.md#perfect-rhom-and-la-characterisation) | Omitted signature |
| VS1 | [`kernel-correspondence-category`](../packages/VStackSheavesAndLisseCategories/README.md#kernel-correspondence-category) | Omitted signature |
| VS1 | [`ula-dualizability-criterion`](../packages/VStackSheavesAndLisseCategories/README.md#ula-dualizability-criterion) | Omitted signature |
| VS1 | [`ula-relative-adjoints-and-calculus`](../packages/VStackSheavesAndLisseCategories/README.md#ula-relative-adjoints-and-calculus) | Omitted signature |
| VS1 | [`ula-for-artin-v-stacks`](../packages/VStackSheavesAndLisseCategories/README.md#ula-for-artin-v-stacks) | Omitted signature |
| VS1 | [`smooth-ula-criterion`](../packages/VStackSheavesAndLisseCategories/README.md#smooth-ula-criterion) | Omitted signature |
| VS1 | [`smooth-spd-oe`](../packages/VStackSheavesAndLisseCategories/README.md#smooth-spd-oe) | Omitted signature |
| VS1 | [`ula-analytification`](../packages/VStackSheavesAndLisseCategories/README.md#ula-analytification) | Omitted signature |
| VS1 | [`formal-smoothness`](../packages/VStackSheavesAndLisseCategories/README.md#formal-smoothness) | Omitted signature |
| VS1 | [`formal-smoothness-calculus`](../packages/VStackSheavesAndLisseCategories/README.md#formal-smoothness-calculus) | Omitted signature |
| VS1 | [`formal-smoothness-examples`](../packages/VStackSheavesAndLisseCategories/README.md#formal-smoothness-examples) | Omitted signature |
| VS1 | [`section-functor-and-positive-tangent`](../packages/VStackSheavesAndLisseCategories/README.md#section-functor-and-positive-tangent) | Omitted signature |
| VS1 | [`jacobian-criterion`](../packages/VStackSheavesAndLisseCategories/README.md#jacobian-criterion) | Omitted signature |
| VS1 | [`hyperbolic-localization`](../packages/VStackSheavesAndLisseCategories/README.md#hyperbolic-localization) | Omitted signature |
| VS1 | [`braden-theorem`](../packages/VStackSheavesAndLisseCategories/README.md#braden-theorem) | Omitted signature |
| VS1 | [`hyperbolic-base-change-duality-and-ula`](../packages/VStackSheavesAndLisseCategories/README.md#hyperbolic-base-change-duality-and-ula) | Omitted signature |
| VS1 | [`divisor-weil-map`](../packages/VStackSheavesAndLisseCategories/README.md#divisor-weil-map) | Omitted signature |
| VS1 | [`geometric-divisor-finite-etale`](../packages/VStackSheavesAndLisseCategories/README.md#geometric-divisor-finite-etale) | Omitted signature |
| VS1 | [`drinfeld-pullback`](../packages/VStackSheavesAndLisseCategories/README.md#drinfeld-pullback) | Omitted signature |
| VS1 | [`drinfeld-local-systems`](../packages/VStackSheavesAndLisseCategories/README.md#drinfeld-local-systems) | Omitted signature |
| VS2 | [`condensed-cohomology`](../packages/VStackSheavesAndLisseCategories/README.md#condensed-cohomology) | Omitted signature |
| VS2 | [`breen-deligne-resolution`](../packages/VStackSheavesAndLisseCategories/README.md#breen-deligne-resolution) | Omitted signature |
| VS2 | [`condensed-lca-rhom`](../packages/VStackSheavesAndLisseCategories/README.md#condensed-lca-rhom) | Omitted signature |
| VS2 | [`solid-free-structure`](../packages/VStackSheavesAndLisseCategories/README.md#solid-free-structure) | Partial ordinary prototype |
| VS2 | [`solid-abelian-groups`](../packages/VStackSheavesAndLisseCategories/README.md#solid-abelian-groups) | Partial ordinary prototype |
| VS2 | [`solidification`](../packages/VStackSheavesAndLisseCategories/README.md#solidification) | Partial ordinary prototype |
| VS2 | [`derived-solid-tensor`](../packages/VStackSheavesAndLisseCategories/README.md#derived-solid-tensor) | Omitted signature |
| VS2 | [`general-ring-solidity`](../packages/VStackSheavesAndLisseCategories/README.md#general-ring-solidity) | Partial ordinary prototype |
| VS2 | [`nonarchimedean-solid-coefficients`](../packages/VStackSheavesAndLisseCategories/README.md#nonarchimedean-solid-coefficients) | Omitted signature |
| VS2 | [`z-solid-analytification`](../packages/VStackSheavesAndLisseCategories/README.md#z-solid-analytification) | Omitted signature |
| VS2 | [`principal-localization-and-formal-complement`](../packages/VStackSheavesAndLisseCategories/README.md#principal-localization-and-formal-complement) | Omitted signature |
| VS2 | [`qcqs-condensed-sets`](../packages/VStackSheavesAndLisseCategories/README.md#qcqs-condensed-sets) | Partial ordinary prototype |
| VS2 | [`condensed-epis-and-colimits`](../packages/VStackSheavesAndLisseCategories/README.md#condensed-epis-and-colimits) | Partial ordinary prototype |
| VS2 | [`affine-condensed-points`](../packages/VStackSheavesAndLisseCategories/README.md#affine-condensed-points) | Omitted signature |
| VS2 | [`closed-affine-points-quasicompact`](../packages/VStackSheavesAndLisseCategories/README.md#closed-affine-points-quasicompact) | Omitted signature |
| VS2 | [`solid-sheaves-on-v-stacks`](../packages/VStackSheavesAndLisseCategories/README.md#solid-sheaves-on-v-stacks) | Omitted signature |
| VS2 | [`solid-sheaf-structure-and-completion`](../packages/VStackSheavesAndLisseCategories/README.md#solid-sheaf-structure-and-completion) | Omitted signature |
| VS2 | [`solid-four-operations`](../packages/VStackSheavesAndLisseCategories/README.md#solid-four-operations) | Omitted signature |
| VS2 | [`relative-solid-homology`](../packages/VStackSheavesAndLisseCategories/README.md#relative-solid-homology) | Omitted signature |
| VS2 | [`torsion-solid-comparisons`](../packages/VStackSheavesAndLisseCategories/README.md#torsion-solid-comparisons) | Omitted signature |
| VS2 | [`solid-geometric-base-change`](../packages/VStackSheavesAndLisseCategories/README.md#solid-geometric-base-change) | Omitted signature |
| VS2 | [`proper-smooth-solid-poincare`](../packages/VStackSheavesAndLisseCategories/README.md#proper-smooth-solid-poincare) | Omitted signature |
| VS3 | [`completed-ula-solid-duality`](../packages/VStackSheavesAndLisseCategories/README.md#completed-ula-solid-duality) | Omitted signature |
| VS3 | [`constructible-and-geometric-langlands-embedding`](../packages/VStackSheavesAndLisseCategories/README.md#constructible-and-geometric-langlands-embedding) | Omitted signature |
| VS3 | [`lisse-category-definition`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-category-definition) | Omitted signature |
| VS3 | [`lisse-adjoints-and-operations`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-adjoints-and-operations) | Omitted signature |
| VS3 | [`lisse-comparisons`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-comparisons) | Omitted signature |
| VS3 | [`lisse-coefficient-change`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-coefficient-change) | Omitted signature |
| VS3 | [`lisse-point-semiorthogonal-decomposition`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-point-semiorthogonal-decomposition) | Omitted signature |
| VS4 | [`solid-geometric-base-change-and-drinfeld`](../packages/VStackSheavesAndLisseCategories/README.md#solid-geometric-base-change-and-drinfeld) | Omitted signature |
| VS4 | [`solid-partial-support`](../packages/VStackSheavesAndLisseCategories/README.md#solid-partial-support) | Omitted signature |
| VS4 | [`solid-partial-supported-vanishing`](../packages/VStackSheavesAndLisseCategories/README.md#solid-partial-supported-vanishing) | Omitted signature |
| VS4 | [`classifying-stack-equivalence`](../packages/VStackSheavesAndLisseCategories/README.md#classifying-stack-equivalence) | Omitted signature |
| VS4 | [`contractibility-of-connected-banach-colmez-torsors`](../packages/VStackSheavesAndLisseCategories/README.md#contractibility-of-connected-banach-colmez-torsors) | Omitted signature |
| VS4 | [`strata-are-classifying-stacks`](../packages/VStackSheavesAndLisseCategories/README.md#strata-are-classifying-stacks) | Omitted signature |
| VS4 | [`strict-locality-of-the-chart`](../packages/VStackSheavesAndLisseCategories/README.md#strict-locality-of-the-chart) | Omitted signature |
| VS4 | [`lisse-stratum-left-adjoint`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-stratum-left-adjoint) | Omitted signature |
| VS4 | [`hn-localization-and-geometric-invariance`](../packages/VStackSheavesAndLisseCategories/README.md#hn-localization-and-geometric-invariance) | Omitted signature |
| VS4 | [`compact-generation-and-compact-objects`](../packages/VStackSheavesAndLisseCategories/README.md#compact-generation-and-compact-objects) | Omitted signature |
| VS5 | [`torsion-bun-homology-and-haar-dualizing`](../packages/VStackSheavesAndLisseCategories/README.md#torsion-bun-homology-and-haar-dualizing) | Omitted signature |
| VS5 | [`bernstein-zelevinsky-duality`](../packages/VStackSheavesAndLisseCategories/README.md#bernstein-zelevinsky-duality) | Omitted signature |
| VS5 | [`verdier-biduality-and-reflexivity`](../packages/VStackSheavesAndLisseCategories/README.md#verdier-biduality-and-reflexivity) | Omitted signature |
| VS5 | [`torsion-kunneth`](../packages/VStackSheavesAndLisseCategories/README.md#torsion-kunneth) | Omitted signature |
| VS5 | [`ula-equals-admissibility`](../packages/VStackSheavesAndLisseCategories/README.md#ula-equals-admissibility) | Omitted signature |
| VS5 | [`lisse-bernstein-zelevinsky-duality`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-bernstein-zelevinsky-duality) | Omitted signature |
| VS5 | [`lisse-verdier-exchange`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-verdier-exchange) | Omitted signature |
| VS5 | [`lisse-kunneth`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-kunneth) | Omitted signature |
| VS5 | [`lisse-ula-definition`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-ula-definition) | Omitted signature |
| VS5 | [`lisse-ula-equals-admissibility`](../packages/VStackSheavesAndLisseCategories/README.md#lisse-ula-equals-admissibility) | Omitted signature |
| VS5 | [`duality-and-admissibility-coefficient-change`](../packages/VStackSheavesAndLisseCategories/README.md#duality-and-admissibility-coefficient-change) | Omitted signature |

## Validation and remaining mathematical work

- `python3 scripts/check_blueprint.py research/blueprint/packets/VStackSheavesAndLisseCategories.json`: exit 0, no errors or warnings; 80 nodes, 183 API items and 95 tests.
- Independent package comparison: 80 distinct target anchors, every source locator/direct prerequisite, all API/test names and statements, no unresolved local links, no forward internal prerequisites and no generic-VS2-to-Artin/ULA dependency.
- Lean token comparison: executable content equals the accepted suggested file after removing comments and whitespace.
- `lean-check research/blueprint/packages/VStackSheavesAndLisseCategories/Suggested.lean`: final exit 0; 38 `sorry` warnings, no other warnings or errors.
- JSON/TOML parsing and final size checks: pass. Submission-path validation passed for all six allowed files with zero problems; git whitespace checks passed.

The explicit omission discipline is required by Protocol §13: the pinned libraries do not yet have the geometric/enhanced carriers needed to type most targets. None is replaced by an uninterpreted proposition or a record containing assumed theorems. Ordinary category prototypes and their tests are not proofs of the source theorems. The plan's sixteen gaps and fifteen supplier requests remain mathematical work for their owners; no stage is declared closed by this review. The package-review job itself is complete, with no further correction required. Promotion is left to the normal intake.
