# DESIGN-AdmissiblePairsAndPadicHodgeStructures

Completed by Codex (GPT-6), session `codex-dWoEF5`, for issue #3419. The bot confirmed claim comment 6259036475 in comment 6259038127. This submission completes one design job and awaits independent review.

## Delivered

- A new roadmap definition with dependency-ordered layers AP0–AP12.
- A complete target-level packet: 78 nodes (24 definitions, 37 theorems, 10 constructions, one comparison, six applications), 136 API items, 102 discriminating unit tests, 58 planets and six pinned baseline declarations.
- A reader document carrying every target statement, API, unit test, acceptance check, source locator and supplier contract, with worked examples and dependencies for every layer.
- A 181-line suggested Lean file: one real-bodied definition, seven theorem signatures and six examples, in layer order. The geometric carriers and end theorems are mathematical targets in the reader, rather than invented Lean carriers.
- Complete routing of the extraction's 191 items: 145 assigned items map to this roadmap's targets, 44 import existing owners and two are contextual comparisons.

All thirteen stages are **planned**, none is claimed closed or formalized. There are zero unrecorded prerequisite names and zero explicit mathematical gaps. The 43 supplier requests remain explicit obligations, with exact statements and `neededBy` links. `implementationStatus` remains `unchecked` throughout. Packet `status: complete` means the design pass is complete.

## Ownership and remaining work

The packet's `requests` and each coverage entry's `remaining` give the precise interfaces needed before formalization. They cover diamonds/descent, period sheaves and relative patching, full isocrystal slope theory, reductive bundle/admissible-locus geometry, abstract Tannakian theory, local comparison and strict-field Galois openness, rigid Zariski geometry, rational group topology and the arithmetic applications.

The final ownership audit read the accepted AInfCohomology AI.2 targets. AP2 imports `AI.2/bkf-module`, `AI.2/bkf-valid-operations` and `AI.2/fargues-classification`; its request to `AI.2` concerns the additional rational rigidification/modification equivalence. R07.4 finite-height Breuil–Kisin modules are a different category. Do not implement a second BKF category here. The comparison is independent of the Ax–Lindemann proof chain.

Two unapplied `rescope` proposals assign the general stabilizer/observable/unipotent refinements to the existing ReductiveGroups direction's Part II extension, and the additional rigidified modification equivalence to AInfCohomology, Part II. They do not edit upstream roadmaps. The current AdicSpaces and AlgebraicVectorBundles roadmaps supply fixed-curve and general bundle foundations through the named interfaces. No existing upstream target is re-planned. This new roadmap is outside the current Caraiani–Newton tier list; no higher-tier notion was moved to another owner in this submission.

An independent reviewer should check the source contracts and mathematics, then the maintainer can route the supplier refinements and package this roadmap when its dependencies permit. No second job was claimed.

## Source and mathematical audit

Read both Howe–Klevdal arXiv-v2 papers in full, the reviewed extraction and its findings, and the relevant supplier descriptions. The packet records dates, URLs and PDF SHA-256 values. The 48 inherited source findings are rewritten in original words and reconciled with the statements used here; no review verdict is self-assigned. E14 explicitly records an inherited v1 finding corrected in v2. E35 distinguishes the two Borel diagonal data and the chosen affine-line cell. E44 uses the topological closure of a rational domain for the finite-residue negative example.

The published texts were not served through the attempted publisher and author links. Findings therefore concern the explicitly cited preprints; published numbering is not silently substituted. Part III is outside scope. No uncleared book was used, and no source passage or source file is included in the submission.

Important retained hypotheses and proof repairs:

- A ramified DVR extension scales elementary divisors; the Tate table fixes all slope, weight and lattice signs.
- G-Hodge invariants and the represented domain retain centrality of the weight homomorphism. Basic vector pairs and G-basic isocrystals are distinguished.
- Constant-slope local triviality establishes family abelianness. Connectedness of the family group is proved separately, and neutrality of canonical reduction requires a connected base.
- Good type over rigid bases uses seminormalization, resolution and rigid-source descent, without applying finite-Q_p-field Liu–Zhu rigidity outside its scope.
- Subgroup admissibility is the neutral H¹-kernel piece of the defining-line Hodge locus. The Borel example separates ambient and subgroup admissibility; the GL_3 parabolic stabilizes a plane.
- Both factors in the product-connectedness lemma are cohomologically smooth. Hodge-domain connectedness is proved after basic duality, avoiding a circular dependency.
- Hodge–Tate inclusions use fractional `Fil^n` for every integer n. The infinite-level subgroup data have an H-basic class, and opposite specialness retains ambient basicness. Non-reductive special subgroups are allowed.
- Generic density uses countably many closed incidence pieces, weakly Shilov avoidance, infinite residue field and connected resolution. The converse full-group implication is asserted only at a point, with a disconnected two-CM-point counterexample for general subfamilies.
- The orbit proof passes to the strict completed maximal unramified extension and uses an inertia orbit contained in the original orbit. It translates the lift and shrinks the compact group to a smooth constant-rank stratum. The level group on the inner-form side is H_bH(Q_p).
- The general analytic closure retains the empty-index exception. Theorem B has no basicness hypothesis. Basic Shimura applications explicitly assume the uniformization and its diagonal arithmetic quotient and period compatibility.

The library audit used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Baseline statements were read in source at those pins. Current upstream roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current partial Fargues–Fontaine files are absent at the pin and do not supply this family theory.

## Validation

- `scripts/check_blueprint.py` with the existing pinned declaration index: no errors or warnings.
- `research/blueprint/intake.py check-files`: all five deliverables valid, no local paths.
- `scripts/check_sorry_data.py`: passed; no data definition with a `sorry` body.
- Source-finding and source-version validation using `source_issues.check_issues` and `check_errata.versions_checked`: passed.
- Reader/packet parity checked for all statements, API entries, tests, acceptance checks, locators and supplier contracts. The internal dependency graph is acyclic, layers are ordered, stage requirements equal their targets' prerequisites, and all extraction items are accounted for.
- The suggested file **compiled successfully with only `sorry` warnings**, using `lean-check` against the pinned shared build after checking available memory. No language server or Lake build/update/cache operation was started.

Scratch source texts and generators are disposable; all continuing mathematical and ownership information is in these five deliverables. There is no required unfinished work in this design job.
