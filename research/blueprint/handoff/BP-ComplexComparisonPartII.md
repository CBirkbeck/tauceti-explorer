# BP-ComplexComparisonPartII — checkpoint from FIX-RT-AREA-algebraicgeometry

This checkpoint carries a partial blueprint for ComplexComparisonPartII (stages C0–C6) written by Codex session codex-5ebb6f in #4652 while fixing the confirmed findings of RT-AREA-algebraicgeometry. That job could not keep it: the roadmap's blueprint is not written yet, so findings about it go to this job (PROTOCOL.md section 17), and this job's issue lists them.

The orchestrator moved the worker's files here unchanged, except for their names and `"part": null`:

- `research/blueprint/packets/ComplexComparisonPartII--FIX-RT-AREA-algebraicgeometry.json` became `research/blueprint/packets/ComplexComparisonPartII.json`;
- the matching reader and suggested files became `research/blueprint/readmes/ComplexComparisonPartII.md` and `research/blueprint/suggested/ComplexComparisonPartII.lean`.

What the packet covers, as its worker recorded it: twelve declaration-sized interface and source nodes, seven supplier requests and fourteen explicit gaps. Every stage is `partial`, and the review is pending. The worker's finding-by-finding ledger is in `research/blueprint/handoff/FIX-RT-AREA-algebraicgeometry.md`. Rows 3, 9, 28–30 and 32–35 concern this roadmap.

Resume here:

1. Continue the blueprint of all seven stages from this packet, following this job's issue, including the findings it lists.
2. Keep the repair nodes that hold up.
3. Fill the recorded gaps and requests.

The worker also edited the roadmap's base document, `content/campaign/ComplexComparisonPartII/README.md`, which a job may not change: source-scope corrections, ownership imports and the separation of additive Betti comparison from finite coefficients. Carry those corrections into the packet and reader. The edit is kept below, unchanged:

```diff
diff --git a/content/campaign/ComplexComparisonPartII/README.md b/content/campaign/ComplexComparisonPartII/README.md
index 90bec026..1bcf73c5 100644
--- a/content/campaign/ComplexComparisonPartII/README.md
+++ b/content/campaign/ComplexComparisonPartII/README.md
@@ -12,13 +12,13 @@ the consolidation audit.
 
 ## Purpose and shared carriers
 
-Continue the existing CohomologicalPointCounting/ComplexComparison proposal, PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. Its Layers 0–2 already construct complex analytification of all finite-type schemes, including nilpotents, and Layers 8–12 supply Riemann existence and constructible Artin comparison. That proposal explicitly excludes coherent GAGA and de Rham comparison. This roadmap supplies those substantial additions on the same analytic-space, scheme and sheaf carriers. ComplexManifolds PR279 supplies the smooth bundle comparison; algebraic vector-bundle/coherent-module theory remains with the existing algebraic geometry owners.
+Continue the existing CohomologicalPointCounting/ComplexComparison proposal, PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. Its Layers 0–2 propose complex analytification of all finite-type schemes, including nilpotents, and Layers 8–12 propose Riemann existence and finite-coefficient constructible Artin comparison. These are external roadmap contracts, not declarations in the pinned libraries or encoded supplier stages. Their integration is an unresolved prerequisite of C0. That proposal explicitly excludes coherent GAGA and de Rham comparison. This roadmap supplies those additions on the same analytic-space, scheme and sheaf carriers. ComplexManifolds PR279 proposes the smooth bundle comparison; its Milestone 7 likewise needs a tracked supplier before C0 can consume it. Algebraic vector-bundle/coherent-module theory remains with the existing algebraic geometry owners.
 
 <a id="c0"></a>
 
 ## C0. Coherent analytic modules on algebraic analytifications
 
-Use the analytic structure sheaf already constructed by ComplexComparison. Construct coherent modules by local finite presentations over convergent power-series algebras and prove independence of presentation, coherence of kernels/cokernels, tensor/Hom, restriction and gluing. Establish coherence of the holomorphic structure sheaf using Weierstrass preparation/division and the Noetherianity/coherence argument. Treat nonreduced closed analytic subspaces with their ideal sheaves. Compare locally free coherent sheaves with the existing holomorphic vector bundles only on smooth spaces where that dictionary applies.
+Import the analytic structure sheaf from the ComplexComparison contract once its supplier is tracked. The required input is a category of complex analytic spaces locally modelled on closed analytic subspaces of open subsets of finite-dimensional complex space, with quotient structure sheaves retaining nilpotents, local morphisms, open gluing and fibre products. SGA 1 XII, 1.1–1.3, gives the analytification construction once that category exists; it does not replace the analytic-space foundations. Construct coherent modules by local finite presentations over convergent power-series algebras and prove independence of presentation, coherence of kernels/cokernels, tensor/Hom, restriction and gluing. Establish coherence of the holomorphic structure sheaf using Weierstrass preparation/division and the Noetherianity/coherence argument. Treat nonreduced closed analytic subspaces with their ideal sheaves. Compare locally free coherent sheaves with the PR279 Milestone 7 holomorphic vector bundles only on smooth spaces where that dictionary applies.
 
 Prove the affine polynomial-to-holomorphic local-ring comparison, faithful flatness needed for analytification and the induced exact functor on coherent algebraic sheaves. Define that functor by pullback and tensor product along the morphism of locally ringed spaces; its exactness is a theorem. Preserve tensor, internal Hom for finite presentation, duals for locally free sheaves, determinants and short exact sequences.
 
@@ -30,13 +30,15 @@ Use Mathlib's sheaf-cohomology/derived-section object. Prove the local acyclicit
 
 Construct analytic O(n) on complex projective space, compute its cohomology in all degrees and compare multiplication/connecting morphisms with the algebraic calculation. Prove finite-dimensional coherent cohomology on projective analytic spaces, generation after sufficiently high twists and the finite-presentation resolution/dévissage needed in C2. The analytic vanishing and generation theorem is proved independently of the algebraization it will establish.
 
+The algebraic inputs are separate imports: StableReduction Layer 2 supplies relative Proj, O(1) and the proper coherent-pushforward contract; AlgebraicModuliForArithmeticGeometry R09.1 must export the projective-space O(n) cohomology calculation and the algebraic Serre vanishing/generation statements over locally Noetherian bases. These supplier contracts still need decomposition. Analytic O(n) computations cannot substitute for the algebraic half of GAGA.
+
 <a id="c2"></a>
 
 ## C2. Projective coherent GAGA
 
 For a projective complex scheme X prove equivalence between coherent O_X-modules and coherent O_(X^an)-modules: exactness, full faithfulness and essential surjectivity. Construct the cohomology comparison in every degree, naturally in the sheaf, by reducing to projective-space twists and finite presentations. Include nonreduced schemes, closed immersions and products; a theorem only on smooth projective varieties is insufficient for moduli thickenings and graph arguments.
 
-Prove the comparison of relative pushforward along projective morphisms in the coherent proper setting used by arithmetic families. State its naturality, projection formula and allowable base-change hypotheses. Identify line bundles, morphisms of vector bundles, sections, coherent ideals and algebraic closed subschemes with their analytic counterparts through the same equivalence.
+For a projective morphism f : X → Y of complex schemes locally of finite type and coherent F, prove the natural comparison (R^q f_*F)^an → R^q f^an_*F^an is an isomorphism for every q ≥ 0 (SGA 1 XII, Theorem 4.2, projective case). This includes nonreduced schemes. Projection-formula and base-change compatibilities require their separately stated coherent-cohomology inputs; the comparison alone does not assert unrestricted cohomology and base change. Identify line bundles, morphisms of vector bundles, sections, coherent ideals and algebraic closed subschemes with their analytic counterparts through the same equivalence.
 
 <a id="c3"></a>
 
@@ -44,23 +46,29 @@ Prove the comparison of relative pushforward along projective morphisms in the c
 
 Extend the projective theorem to proper finite-type complex schemes by the Chow-lemma and coherent dévissage/descent package constructed in AlgebraicModuliForArithmeticGeometry R09.2–R09.3; do not assert every proper scheme is projective. Export the exact coherent categorical equivalence and cohomology comparison with all properness hypotheses.
 
+The primary source for schemes is SGA 1 XII: Theorem 4.2 proves (R^q f_*F)^an ≅ R^q f^an_*F^an for every proper f : X → Y of complex schemes locally of finite type and every coherent F. Corollary 4.3 gives absolute cohomology comparison for proper X, and Theorem 4.4 gives equivalence of coherent categories. The relative result is required by C5's proper smooth families even when f is not projective. Import proper higher-direct-image coherence, the projection formula and Leray from StableReduction Layer 2 in their stated scope; broader cases remain explicit supplier requests. The projective Serre inputs and Chow lemma are prerequisites of the source proof, not consequences assumed from GAGA itself.
+
 For proper algebraic spaces of finite presentation supplied by AlgebraicModuliForArithmeticGeometry, descend the comparison through étale presentations with their C0 analytification. Establish effective descent of coherent modules and the full-faithfulness square, rather than treating a coarse space as a fine scheme. The statement never says that an arbitrary proper algebraic space is projective.
 
 <a id="c4"></a>
 
 ## C4. Chow algebraization and morphism comparison
 
-Prove that closed analytic subspaces of projective space are algebraic, retaining the coherent ideal and its nonreduced structure. Derive algebraicity of holomorphic maps from proper algebraic schemes to the separated finite-type targets used here via their graphs, with existence of an algebraic graph and the proper projection argument. Apply full faithfulness to morphisms of abelian schemes, polarizations, level structures and coherent correspondences. State precisely which scheme/algebraic-space targets have already been constructed; an arbitrary analytic family over an algebraic base is not automatically algebraic.
+Prove that closed analytic subspaces of projective space are algebraic, retaining the coherent ideal and its nonreduced structure. For proper complex schemes X and Y, derive algebraicity of holomorphic maps X^an → Y^an via the coherent ideal of the graph in (X × Y)^an and the algebraic projection argument (SGA 1 XII, Corollary 4.5). The more general contract with proper source and separated finite-type target needs an additional proof: Corollary 4.5 does not by itself supply that scope. Keep that obligation explicit, together with the relative and algebraic-space variants needed by families. Apply the appropriate proved full-faithfulness theorem to morphisms of abelian schemes, polarizations, level structures and coherent correspondences. State precisely which scheme/algebraic-space targets have already been constructed; an arbitrary analytic family over an algebraic base is not automatically algebraic.
 
 Provide the projective realization→Chow step in Baily–Borel and the GAGA step in PEL complex comparison. Borel algebraicity of a nonproper map into an arithmetic quotient remains ShimuraVarieties V3, proved by its extension theorem, and is not inferred from proper GAGA.
 
-Also export algebraic-versus-analytic connectedness for finite-type smooth affine complex curves, as required by PR81 §5C. For each algebraic component construct a smooth projective completion by projective closure and normalization (R09.3 and the existing curve normalization theory); this general curve lemma does not use ModularCurvesPartII R13.4 or its later uniformization. Use projective GAGA/idempotents for the completed curve and prove that removing finitely many points from a connected Riemann surface preserves connectedness. Combine this with the clopen algebraic-component decomposition to obtain the comparison for the affine curve. It is not deduced from the generally false claim that all analytic functions on an affine variety are algebraic.
+Also export algebraic-versus-analytic connectedness for finite-type smooth affine complex curves, as required by PR81 §5C. For each algebraic component import its unique regular projective model from AlgebraicCurves Layer 12B–12C; over C that model is smooth. Import Layer 6's holomorphy-ring dictionary and establish the open immersion of the original affine curve into that model with finite complement. C4 consumes these constructions rather than repeating normalization of a projective closure; R09.3's algebraic-space descent does not supply the completion theorem. This general curve lemma does not use ModularCurvesPartII R13.4 or its later uniformization. Use projective GAGA/idempotents for the completed curve and prove that removing finitely many points from a connected Riemann surface preserves connectedness. Combine this with the clopen algebraic-component decomposition to obtain the comparison for the affine curve. It is not deduced from the generally false claim that all analytic functions on an affine variety are algebraic.
 
 <a id="c5"></a>
 
 ## C5. Algebraic de Rham–Betti comparison
 
-For a smooth complex algebraic variety construct its algebraic de Rham complex from the existing Kähler differential/exterior algebra, its analytification and the integration/Poincaré map to the analytic resolution of the constant complex sheaf. Prove the local analytic Poincaré lemma with its naturality. For proper smooth varieties, combine C2–C3 with hypercohomology to obtain algebraic de Rham ≅ singular cohomology with complex coefficients, using ComplexComparison's sheaf/singular comparison. Prove cup products, pullback, trace and relative Gauss–Manin compatibility for proper smooth families.
+For a smooth complex algebraic variety construct its algebraic de Rham complex from the existing Kähler differential/exterior algebra, its analytification and the integration/Poincaré map to the analytic resolution of the constant complex sheaf. Prove the local analytic Poincaré lemma with its naturality. For proper smooth varieties, combine C2–C3 with hypercohomology to obtain algebraic de Rham ≅ singular cohomology with complex coefficients (Grothendieck 1966, Theorem 1′, p. 96).
+
+C5 owns the missing comparison H^q_sheaf(T, constant A) ≅ H^q_singular(T; A) for an abelian coefficient group A and a semi-locally contractible topological space T. Sella, arXiv:1602.06674v3, states this theorem on p. 2 and constructs a flasque resolution using nestings. Import singular cochains and cohomology from AlgebraicTopology Stage 6 and reuse the pinned sheaf-cohomology and flasque-acyclicity declarations. Retain the Z, Q and C instances, coefficient maps and pullback naturality. The finite-coefficient comparison in PR196 does not supply them. On manifolds a classical sheafification proof can instead use hereditary paracompactness; local contractibility alone does not make the naive singular-cochain sheafification argument valid. Cup-product compatibility requires a compatible chain-level product construction, beyond Sella's additive theorem.
+
+For a proper smooth family f : X → S with X and S smooth over C, construct relative algebraic and holomorphic de Rham complexes and prove the relative holomorphic Poincaré lemma with coefficients f^(-1)O_(S^an). Combine C3's relative proper GAGA with Ehresmann local triviality for the proper holomorphic submersion f^an to identify relative de Rham cohomology with R^q f^an_*C tensor O_(S^an) and its Gauss–Manin connection; its horizontal sections recover the complex Betti local system. Compact fibres yield finitely generated integral Betti stalks, and finite-dimensional complex Betti stalks. Do not claim that complex stalks are finitely generated as abelian groups or that arbitrary coefficients have that finiteness property. The Ehresmann, relative Poincaré, hypercohomology/base-change and connection proofs remain separate construction obligations. Families over a singular base require an additional comparison argument. Prove cup products, pullback and trace compatibilities on these actual maps.
 
 For the nonproper smooth curves used by modular symbols construct a smooth projective compactification and logarithmic de Rham complex with its residue/localization sequence; prove the regular-singular logarithmic comparison and independence of compactification in this class. Distinguish compact, ordinary and parabolic cohomology and their pairings. A general irregular algebraic connection is not assumed to obey the regular-singular comparison theorem. Integral Betti lattices and rational coefficient structures are retained before complexification; complex comparison alone does not choose periods.
 
@@ -70,26 +78,28 @@ For the nonproper smooth curves used by modular symbols construct a smooth proje
 
 Compute O(n) on projective space; an infinitesimal thickening of a projective point; the Hodge line, invariant differential and polarized first cohomology of a complex elliptic curve; G_m with its logarithmic residue; and the coherent graph of an isogeny. For ModularCurvesPartII compare f(q)dq/q with the weight-two Hodge section, while retaining the distinct relative Tate differential du/u. AbelianSchemesAndArithmeticModuli, PELModuli, ShimuraVarieties and AutomorphicBundles consume the proved natural transformations, not unlabelled vector-space dimension equalities.
 
-Primary sources are Serre, Géométrie algébrique et géométrie analytique (downloaded), and Grothendieck, On the de Rham cohomology of algebraic varieties. The coherent analytic prerequisites require the relevant Grauert–Remmert/Cartan proofs and are included as C0–C1 targets; the book request is recorded in the campaign audit. This is a Part II proposal, with only cross-reference amendments planned for PR196.
+Primary sources are Serre (GAGA), SGA 1 Exposé XII, Grothendieck (1966), and Sella's sheaf–singular comparison. The coherent analytic prerequisites require the relevant Grauert–Remmert/Cartan proofs and are included as C0–C1 targets; the book request is recorded in the campaign audit. This is a Part II proposal, with only cross-reference amendments planned for PR196.
 
 
 ## Implementation handoff: Coherent and de Rham comparison maps
 
 **Stages:** C0, C1, C2, C3, C4, C5, C6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.
 
-Construct coherent analytification by the actual local-ring map and prove faithful flatness/exactness. Derive projective GAGA through O(n) cohomology and finite presentations; extend to proper schemes/spaces by the specified Chow-lemma and descent route. The graph proof of algebraicity records proper source and separated target hypotheses.
+Construct coherent analytification by the actual local-ring map and prove faithful flatness/exactness. Derive projective GAGA through O(n) cohomology and finite presentations; extend to proper schemes/spaces by the specified Chow-lemma and descent route. The sourced graph theorem has proper source and proper target. Its extension to separated finite-type targets, and the relative and algebraic-space versions, remain explicit proof obligations.
 
 **Acceptance and consumer contract.** Test a nonreduced thickening, a proper nonprojective case, an elliptic Hodge line and G_m logarithmic residue. Compare ordinary, compact and parabolic cohomology for open modular curves. Borel algebraicity of a nonproper source remains V3; C4 cannot obtain it by applying proper GAGA. Tensor, trace and cup-product compatibilities must identify the maps used by R14/R19.
 
 ## Source anchors and prototype coverage
 
 - Serre, *Géométrie algébrique et géométrie analytique*, Ann. Inst. Fourier 6 (1956), 1–42: coherent analytification, projective comparison and algebraization; local source.
-- Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math. IHÉS 29 (1966), 95–103: algebraic de Rham comparison; local source.
+- Michèle Raynaud, from unpublished notes of A. Grothendieck, SGA 1, Exposé XII, *Géométrie algébrique et géométrie analytique*: 1.1–1.3 (nonreduced analytification and coherent pullback), 4.2 (relative proper comparison), 4.3–4.4 (absolute proper cohomology and coherent GAGA), 4.5 (graphs between proper schemes). [Freely readable re-typeset copy, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203v2), PDF pp. 255–257 and 263–267, read 2026-09-29. The original published edition was not checked in this repair.
+- Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math. IHÉS 29 (1966), 95–103: [published article](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorems 1 and 1′, pp. 95–96, and Theorem 2, p. 97, read 2026-09-29. The proper proof uses coherent GAGA and the analytic Poincaré lemma; the nonproper proof has further inputs.
+- Yehonatan Sella, *Comparison of sheaf cohomology and singular cohomology*: [arXiv:1602.06674v3](https://arxiv.org/pdf/1602.06674v3), theorem on p. 2, Lemma 0.1, Proposition 0.2, Example 0.3 and Step 1, pp. 2–8, read 2026-09-29. The nesting/small-chain construction must still be decomposed into proof-sized prerequisites; additive comparison does not discharge cup products or relative Gauss–Manin.
 - Grauert–Remmert, *Coherent Analytic Sheaves*, and Cartan's coherent analytic/Stein theorems supply C0–C1's analytic proofs. Their acquisition and exact theorem-selection gaps remain in the book/source register; C0–C1 are construction obligations, not assumed coherent-analytic axioms.
 
 ## References
 
-SERRE_GAGA; the Grothendieck source and the C0–C1 analytic books above. This Part II is new campaign content; its upstream source contract is PR196 ComplexComparison, whose coherent-GAGA/de-Rham exclusions are retained.
+SERRE_GAGA; SGA 1 XII; Grothendieck (1966); Sella; and the C0–C1 analytic books above. This Part II is new campaign content; its upstream source contract is PR196 ComplexComparison, whose coherent-GAGA/de-Rham exclusions are retained. The partial repair packet records exact supplier requests and gaps; it does not apply changes to the immutable atlas source snapshot.
 
 
 The mathematical scope is preserved at the named milestones, with transfers and additions
```
