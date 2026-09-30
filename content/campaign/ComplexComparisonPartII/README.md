# Roadmap: Complex Comparison PartII

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.



## Purpose and shared carriers

Continue the existing CohomologicalPointCounting/ComplexComparison proposal, PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. Its Layers 0–2 already construct complex analytification of all finite-type schemes, including nilpotents, and Layers 8–12 supply Riemann existence and constructible Artin comparison. That proposal explicitly excludes coherent GAGA and de Rham comparison. This roadmap supplies those substantial additions on the same analytic-space, scheme and sheaf carriers. ComplexManifolds PR279 supplies the smooth bundle comparison; algebraic vector-bundle/coherent-module theory remains with the existing algebraic geometry owners.

<a id="c0"></a>

## C0. Coherent analytic modules on algebraic analytifications

Use the analytic structure sheaf already constructed by ComplexComparison. Construct coherent modules by local finite presentations over convergent power-series algebras and prove independence of presentation, coherence of kernels/cokernels, tensor/Hom, restriction and gluing. Establish coherence of the holomorphic structure sheaf using Weierstrass preparation/division and the Noetherianity/coherence argument. Treat nonreduced closed analytic subspaces with their ideal sheaves. Compare locally free coherent sheaves with the existing holomorphic vector bundles only on smooth spaces where that dictionary applies.

Prove the affine polynomial-to-holomorphic local-ring comparison, faithful flatness needed for analytification and the induced exact functor on coherent algebraic sheaves. Define that functor by pullback and tensor product along the morphism of locally ringed spaces; its exactness is a theorem. Preserve tensor, internal Hom for finite presentation, duals for locally free sheaves, determinants and short exact sequences.

<a id="c1"></a>

## C1. Analytic coherent cohomology and projective computations

Use Mathlib's sheaf-cohomology/derived-section object. Prove the local acyclicity and Stein cohomology results actually used for polydiscs and projective affine charts, by solving the appropriate analytic Cousin/∂ problems with convergence and cover hypotheses stated. Establish Leray/Čech comparisons for these acyclic covers; a finite cover alone is not acyclic.

Construct analytic O(n) on complex projective space, compute its cohomology in all degrees and compare multiplication/connecting morphisms with the algebraic calculation. Prove finite-dimensional coherent cohomology on projective analytic spaces, generation after sufficiently high twists and the finite-presentation resolution/dévissage needed in C2. The analytic vanishing and generation theorem is proved independently of the algebraization it will establish.

<a id="c2"></a>

## C2. Projective coherent GAGA

For a projective complex scheme X prove equivalence between coherent O_X-modules and coherent O_(X^an)-modules: exactness, full faithfulness and essential surjectivity. Construct the cohomology comparison in every degree, naturally in the sheaf, by reducing to projective-space twists and finite presentations. Include nonreduced schemes, closed immersions and products; a theorem only on smooth projective varieties is insufficient for moduli thickenings and graph arguments.

Prove the comparison of relative pushforward along projective morphisms in the coherent proper setting used by arithmetic families. State its naturality, projection formula and allowable base-change hypotheses. Identify line bundles, morphisms of vector bundles, sections, coherent ideals and algebraic closed subschemes with their analytic counterparts through the same equivalence.

<a id="c3"></a>

## C3. Proper coherent GAGA and algebraic spaces

Extend the projective theorem to proper finite-type complex schemes by the Chow-lemma and coherent dévissage/descent package constructed in AlgebraicModuliForArithmeticGeometry R09.2–R09.3; do not assert every proper scheme is projective. Export the exact coherent categorical equivalence and cohomology comparison with all properness hypotheses.

For proper algebraic spaces of finite presentation supplied by AlgebraicModuliForArithmeticGeometry, descend the comparison through étale presentations with their C0 analytification. Establish effective descent of coherent modules and the full-faithfulness square, rather than treating a coarse space as a fine scheme. The statement never says that an arbitrary proper algebraic space is projective.

<a id="c4"></a>

## C4. Chow algebraization and morphism comparison

Prove that closed analytic subspaces of projective space are algebraic, retaining the coherent ideal and its nonreduced structure. Derive algebraicity of holomorphic maps from proper algebraic schemes to the separated finite-type targets used here via their graphs, with existence of an algebraic graph and the proper projection argument. Apply full faithfulness to morphisms of abelian schemes, polarizations, level structures and coherent correspondences. State precisely which scheme/algebraic-space targets have already been constructed; an arbitrary analytic family over an algebraic base is not automatically algebraic.

Provide the projective realization→Chow step in Baily–Borel and the GAGA step in PEL complex comparison. Borel algebraicity of a nonproper map into an arithmetic quotient remains ShimuraVarieties V3, proved by its extension theorem, and is not inferred from proper GAGA.

Also export algebraic-versus-analytic connectedness for finite-type smooth affine complex curves, as required by PR81 §5C. For each algebraic component construct a smooth projective completion by projective closure and normalization (R09.3 and the existing curve normalization theory); this general curve lemma does not use ModularCurvesPartII R13.4 or its later uniformization. Use projective GAGA/idempotents for the completed curve and prove that removing finitely many points from a connected Riemann surface preserves connectedness. Combine this with the clopen algebraic-component decomposition to obtain the comparison for the affine curve. It is not deduced from the generally false claim that all analytic functions on an affine variety are algebraic.

<a id="c5"></a>

## C5. Algebraic de Rham–Betti comparison

For a smooth complex algebraic variety construct its algebraic de Rham complex from the existing Kähler differential/exterior algebra, its analytification and the integration/Poincaré map to the analytic resolution of the constant complex sheaf. Prove the local analytic Poincaré lemma with its naturality. For proper smooth varieties, combine C2–C3 with hypercohomology to obtain algebraic de Rham ≅ singular cohomology with complex coefficients, using ComplexComparison's sheaf/singular comparison. Prove cup products, pullback, trace and relative Gauss–Manin compatibility for proper smooth families.

For the nonproper smooth curves used by modular symbols construct a smooth projective compactification and logarithmic de Rham complex with its residue/localization sequence; prove the regular-singular logarithmic comparison and independence of compactification in this class. Distinguish compact, ordinary and parabolic cohomology and their pairings. A general irregular algebraic connection is not assumed to obey the regular-singular comparison theorem. Integral Betti lattices and rational coefficient structures are retained before complexification; complex comparison alone does not choose periods.

<a id="c6"></a>

## C6. Arithmetic comparison acceptance tests

Compute O(n) on projective space; an infinitesimal thickening of a projective point; the Hodge line, invariant differential and polarized first cohomology of a complex elliptic curve; G_m with its logarithmic residue; and the coherent graph of an isogeny. For ModularCurvesPartII compare f(q)dq/q with the weight-two Hodge section, while retaining the distinct relative Tate differential du/u. AbelianSchemesAndArithmeticModuli, PELModuli, ShimuraVarieties and AutomorphicBundles consume the proved natural transformations, not unlabelled vector-space dimension equalities.

Primary sources are Serre, Géométrie algébrique et géométrie analytique (downloaded), and Grothendieck, On the de Rham cohomology of algebraic varieties. The coherent analytic prerequisites require the relevant Grauert–Remmert/Cartan proofs and are included as C0–C1 targets; the book request is recorded in the campaign audit. This is a Part II proposal, with only cross-reference amendments planned for PR196.


## Implementation handoff: Coherent and de Rham comparison maps

**Stages:** C0, C1, C2, C3, C4, C5, C6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct coherent analytification by the actual local-ring map and prove faithful flatness/exactness. Derive projective GAGA through O(n) cohomology and finite presentations; extend to proper schemes/spaces by the specified Chow-lemma and descent route. The graph proof of algebraicity records proper source and separated target hypotheses.

**Acceptance and consumer contract.** Test a nonreduced thickening, a proper nonprojective case, an elliptic Hodge line and G_m logarithmic residue. Compare ordinary, compact and parabolic cohomology for open modular curves. Borel algebraicity of a nonproper source remains V3; C4 cannot obtain it by applying proper GAGA. Tensor, trace and cup-product compatibilities must identify the maps used by R14/R19.

## Source anchors and prototype coverage

- Serre, *Géométrie algébrique et géométrie analytique*, Ann. Inst. Fourier 6 (1956), 1–42: coherent analytification, projective comparison and algebraization; local source.
- Grothendieck, *On the de Rham cohomology of algebraic varieties*, Publ. Math. IHÉS 29 (1966), 95–103: algebraic de Rham comparison; local source.
- Grauert–Remmert, *Coherent Analytic Sheaves*, and Cartan's coherent analytic/Stein theorems supply C0–C1's analytic proofs. Their acquisition and exact theorem-selection gaps remain in the book/source register; C0–C1 are construction obligations, not assumed coherent-analytic axioms.

## References

SERRE_GAGA; the Grothendieck source and the C0–C1 analytic books above. This Part II is new campaign content; its upstream source contract is PR196 ComplexComparison, whose coherent-GAGA/de-Rham exclusions are retained.


The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
