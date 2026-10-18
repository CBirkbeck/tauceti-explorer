# DESIGN-MappingClassGroupsAndCanonicalRepresentations

Issue #3370. Worker: Codex, session `codex-ERjKj9`. This is a completed design pass for independent review, not a checkpoint or a claim of mathematical closure. The claim was confirmed before work began. No second job was taken.

## Delivered and checked

The roadmap definition, blueprint packet, full reader and suggested Lean file agree on ten layers C.0–C.9. The packet has 62 target-level nodes: five definitions, five constructions and 52 theorems; 34 API items; 30 discriminating tests; 40 planets; and 15 individually checked pinned-library declarations. Each definition and construction has uses, an API and three tests. The source-extraction routing audit accounts for all 139 items, including the imports and the finite-exponent result avoided by the revised proof. Five open-question entries are explicitly separate from theorem targets.

Every layer is `planned`, none is `closed`, and every implementation status is `unchecked`. The complete pass records 21 supplier requests, 21 explicit gaps and 11 source issues. A request is a contract to establish, not evidence that a supplier already contains it. No implementation or review acceptance is claimed.

The reader carries exact mathematical statements, hypotheses, locators, proof routes, acceptance checks, APIs, examples, source issues and ownership boundaries. It is the definitive document. The 105-line suggested Lean file follows the current WORKERS streamlined shape: one light real-bodied finite-conjugacy-orbit predicate on existing carriers, easily statable compatibility checks and examples, and the free-group end theorem on the actual pinned FreeGroup and matrix GL carriers. The surface, mapping-class, moduli, sheaf, Artinian-family and Hodge carriers are not mocked or replaced by assumptions to manufacture declarations. Their signatures, APIs and tests remain reader targets.

Validation at submission:

- `scripts/check_blueprint.py` on the packet against the pinned declaration index: zero errors and zero warnings.
- `research/blueprint/intake.py check-files` on all five deliverables: no problems.
- `scripts/check_sorry_data.py` on the suggested Lean file: passes.
- `git diff --cached --check`: passes.
- `lean-check research/blueprint/suggested/MappingClassGroupsAndCanonicalRepresentations.lean`: elaborates successfully at the shared pins, with only ten expected declaration-uses-sorry warnings. Available memory exceeded the required threshold. An initial deprecated Complex import was replaced before the successful final check. No build, dependency update, cache download or language server was started.

## Ownership and existing-library audit

The audit used Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, reading the declaration statements. Local coefficients/monodromy, socles, semisimplicity, unitary complete reducibility, compact unitarization, isotypic components, character-degree sums, FreeGroup and bounded algebraic integers are existing work. The inflation-restriction baseline gives only the stated middle exactness, not a full discrete LHS interface.

Current upstream roadmaps and the current library were read without modifying or building them. This included the additions absent from the atlas snapshot, with AlgebraicTopology and Completed/UniversalCovers as nearby style/interface references, and CharacterTheory and InductionRestriction for exact representation-theoretic boundaries. No generic covering theory, mapping-class topology, moduli stack, socle, finite-group character theory or Hodge carrier is planned again here.

Preserve the existing LV.5 surface-topology nodes through their pending transfer to topology owners. Extend the common StableReductionPartII pointed-moduli direction, especially MC.2/MC.4, rather than creating another moduli carrier. Current fine-level coverage is not silently treated as a theorem for all pointed curves or the unpointed torus. Ordinary analytic sheaf Leray is requested from sheaf foundations; a bundle/Serre interface is not that theorem. The packet's upstream notes retain these observations without editing an upstream roadmap.

The target-level order is common topology and pointed moduli, then C.0–C.2 and the shared abstract Art_C deformation extension, then Hodge H.1–H.5, then C.3–C.8. In particular H.4 imports C.2/artin-decomposition; it must not import the final canonical finiteness theorem. General discrete-group Artinian deformation algebra belongs in the R03.2 extension, not in the arithmetic-only GlobalGaloisDeformations roadmap. These are requested ownership refinements, not edits already applied to those suppliers.

Missing arbitrary-group projective extensions and discrete obstruction theory are Part II extensions of the current InductionRestriction and ProfiniteCohomology directions. Uniform Jordan bounds extend CharacterTheory. Actual representation/character schemes and connected-component lifting extend AlgebraicModuliForArithmeticGeometry. The nonproper universal étale-family comparison and arbitrary-genus Hurwitz input extend the existing InverseGaloisAndArithmeticFundamentalGroups direction. The precise contracts are in the packet request ledger and reader; stage references alone do not close them.

## Mathematical qualifications the reviewer must preserve

The finite orbit is of actual conjugacy classes, including nonsplit representations. Pure/full equivalence uses finite index; a character/GIT quotient applies only in the semisimple range. The free-group theorem is a consequence of the surface theorem, not an equivalence of mapping-class and Out actions. Families and Birman comparisons impose hyperbolicity; rank-zero and rank-one unpointed-torus cases are separated.

Canonical projective extension uniqueness is restricted to actual GL intertwiners. Fibre-prescribed lifting kills the discrete LHS edge obstruction before the inflated class, then extends and removes the finite mismatch character. Relative Artinian decomposition assumes a constant unitary fibre over A, not just unitary reduction. Higher Prym bounds concern subrepresentations, not arbitrary open-cohomology subquotients, and keep compact/open and dual-isotypic conventions distinct.

The Hodge engine remains imported and source-gated, including real admissible VMHS, Artinian vanishing, group-valued PGL integrality, all coefficient conjugates, and SNC resolution/boundary compatibility. The semisimple proof specifies a candidate bridge from a continuous fixed-determinant character path to a connected algebraic component of the actual representation scheme: connected GL orbits and unique closed orbits make quotient fibres connected; invariant clopen components have disjoint closed quotient images. The supplier must verify this bridge and fixed determinant along the Hodge deformation. Merely naming nonabelian Hodge theory does not discharge the obligation.

The nonsplit extension argument stabilizes the actual extension as well as its finite constituents and covering labels. Generic arithmetic is over the moduli space over Q. Étale exactness, profinite centerlessness, nonproper characteristic-zero base change and Riemann existence remain explicit contracts. A coefficient field isomorphism is not used as a topological isomorphism.

Integral Hodge realization permits a complex direct summand of an ambient integral realization, with all coefficient-conjugate requirements stated. It is not a rank-r integral lattice on an arbitrary complex irreducible. The equivalence with the source wording remains a gate. Residual surjections exist for every prime, whereas this nonlifting proof excludes primes dividing the Jordan exponent. Nonflatness is conditional on a specified arithmetic residual deformation problem, and gives no failure of the complete-intersection property.

The example gates include primary Morita certificates and integral normalization, an explicit augmentation nonsplitting computation in the retained g≥2 range, complete rank-two classification statements, concrete large-rank and F₂ infinite-image certificates after restriction/semisimplification, and a concrete rigid punctured-sphere example. The elementary abelianization unipotent construction is independent of those Morita gates. An unrestricted augmentation assertion is excluded by the punctured-torus logarithm splitting. No higher-free-rank existence conjecture is asserted as a theorem.

## Source record and where to resume

The packet and reader contain accessible primary-source URLs, exact versions, SHA-256 hashes, read ranges, and theorem/section/page locators. Read sources were the Landesman–Litt canonical-representation preprint v4, the required interfaces in their very-general-curves preprint v2, Cousin–Heu v4 Theorems A/B, Klevdal–Patrikis v2 Definition 1.1/Theorem 1.2, and the Aramayona–Souto multitwist argument. Partial reading is recorded honestly; unread primary example and Hurwitz certificates remain gaps. The extraction and all 64 confirmed red-team findings were screened, but this is not an independent review verdict. Source issues are mathematical paraphrases and reasoning, with no verbatim passages or source-by-source sectional summaries. No restricted book was used.

The next worker should independently review this completed pass, beginning with the 11 source issues and the 21 exact gap/request contracts, checking the proposed GIT bridge and integral-realization formulation especially carefully. Then reconcile shared topology ownership and schedule the early Art_C/Hodge supplier prefix without a target-level cycle. Original-source checks for the example certificates and the missing étale/Hurwitz comparisons must precede any claim of closure or packaging. The source manifests, routing audit, open-question inventory and full dependency contracts are all committed; no scratch file is needed to resume. The job scratch directory is deleted after the pull request opens.
