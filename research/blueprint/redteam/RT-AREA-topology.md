# RT-AREA-topology — red team of the Topology area

**Result: 123 findings — 23 high, 75 medium, 25 low.**

The five Tau Ceti roadmaps are ambitious and mostly careful, and much of them is already built without `sorry` in Tau Ceti
`f790474`. The atlas records none of this: every stage is "unknown" and there are no stage edges. No accepted library
audit covers any of these roadmaps.

The high findings fall into three groups.

- **Statements that are false or cannot be proved as written:**
  - GeometricTopology: "PL embeddings are locally flat", JSJ uniqueness without a minimality condition, geometrization
    without finite volume, Thurston's Euler-class bound planned as a conjecture, and a trivially true Levine target.
  - HeegaardFloer: a Calderón–Zygmund inequality with no hypotheses, handleslide invariance "via Perutz", and Némethi's
    theorem for "every plumbed 3-manifold".
  - CombinatorialHeegaardFloer: knot normalisations applied to links, and a slice-genus bound not marked smooth.
  - AlgebraicTopology: relative homotopy groups only for NDR pairs, and exact couples claimed from Mathlib.
- **Prerequisites that no stage owns:**
  - smooth triangulation;
  - manifold orientation and degree;
  - multi-pointed Heegaard Floer homology;
  - the smooth topology of Heegaard diagrams, with Cerf theory;
  - compactness beyond genus zero;
  - compactly supported cohomology and noncompact duality;
  - the unknotting number;
  - Habiro's refined Kirby calculus.
- **ArithmeticQuantumTopology against its sources:**
  - it re-plans GeometricTopology's framed links and surgery;
  - it plans ribbon categories where Habiro's construction needs U_h(sl2), bottom tangles and the twist element ω;
  - it has no stage for the GSWZ theorem on perturbative Chern–Simons series.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1547).

**Target:** `area:topology`, which has six roadmaps:
- ArithmeticQuantumTopology (8 stages, proposed);
- `tauceti:TauCetiRoadmap/AlgebraicTopology` (8);
- `tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer` (22);
- `tauceti:TauCetiRoadmap/GeometricTopology` (11);
- `tauceti:TauCetiRoadmap/HeegaardFloer` (22);
- `tauceti:TauCetiRoadmap/UniversalCovers` (5).

It also covers the restructurings RS-09, RS-10 and RS-33, the UniversalCovers link map, and the three papers
(PAPER-BENOIST-19, PAPER-BENOIST-WITTENBERG-20 and PAPER-BROWNING-SAWIN-20) that propose Part IIs of AlgebraicTopology.

**Baseline:** Mathlib `082e2d3` and Tau Ceti `f790474`.

**Eligibility:** `cc-2aeb03` wrote and reviewed nothing in this area.

## Method

- **The roadmaps.** For each one: its atlas extract, its document (and for the Tau Ceti roadmaps, the upstream README and
  `Suggested.lean`), every stage description, and the restructurings, link map and paper routes that touch it.
- **Libraries.** Every planned object and milestone was looked up at the pins. The Tau Ceti files behind every "built"
  verdict were read and checked for `sorry`.
- **Duplication.** `data/atlas.json` was searched across all roadmaps for the area's notions: knots and links, surgery and
  Kirby calculus, covering spaces, CW and simplicial structures, spectral sequences, cohomology and duality, orientation and
  degree, Morse and Cerf theory, symplectic and Floer theory, hyperbolic 3-manifolds, the Bloch group, q-series and quantum
  modularity.
- **Sources.** Public versions, fetched 24 September 2026, with URLs in the findings. Among them:
  - Kirby's problem list (Berkeley PostScript, the 1997 text);
  - Ozsváth–Szabó (math/0101206 and the link paper) and Perutz (0801.0564);
  - Zemke (2111.14962) and Juhász–Thurston–Zemke (1210.4996);
  - Ozsváth–Stipsicz–Szabó (0912.0830) and Manolescu–Ozsváth–Sarkar;
  - Habiro (math/0605314 and math/0509039) and GSWZ (2412.04241);
  - Piccirillo, Ruberman–Stern and Yazdi.

## Findings


### ArithmeticQuantumTopology — Arithmetic quantum topology, Habiro invariants and regulators — 21 findings (4 high, 12 medium, 5 low)

- **RT-AREA-topology/1** (duplicate, high). QT.0 plans framed and oriented link presentations, their isotopy equivalence, the Reidemeister and framing rules and surgery presentations from scratch.
- **RT-AREA-topology/2** (missing, high). The theorem that makes Habiro's unified invariant well defined is not planned, and QT.3 states the invariance incorrectly.
- **RT-AREA-topology/3** (missing, high). QT.1 plans the wrong machinery for its declared source.
- **RT-AREA-topology/4** (missing, medium). QT.4's general-Lie-type target needs quantum groups of every simple Lie algebra, and neither this roadmap nor the atlas plans them.
- **RT-AREA-topology/5** (duplicate, medium). QT.2 constructs 'colored link polynomials', whose two-dimensional colour is the Jones polynomial.
- **RT-AREA-topology/6** (error, medium). QT.5's prerequisites and supplier statement are wrong.
- **RT-AREA-topology/7** (duplicate, medium). The identity 'the volume of an ideal hyperbolic tetrahedron with cross-ratio z is D(z)' is planned twice: in P.2, as Bloch's hyperbolic-volume calculation behind the regulator, and in QT.5, as the comparison of the real regulator with volume.
- **RT-AREA-topology/8** (missing, medium). Cusped hyperbolic 3-manifolds and ideal triangulations have no owner, yet QT.5's acceptance test is the figure-eight knot complement.
- **RT-AREA-topology/9** (missing, medium). The 'extended-Bloch element' and 'the specified Chern-Simons class' are named without definition or source, and no other stage plans them.
- **RT-AREA-topology/10** (missing, high). No stage of the atlas targets the central arithmetic-quantum-topology theorem of GSWZ: the perturbative complex Chern-Simons series of a cusped hyperbolic 3-manifold are elements of the K₃-indexed Habiro modules of its field.
- **RT-AREA-topology/11** (duplicate, medium). The identification of knot perturbative series with topological invariants, and the asymptotic machinery, are planned in two places.
- **RT-AREA-topology/12** (missing, medium). The roadmap never mentions the Kashaev invariant or the volume conjecture, although quantum modularity, 'refined volume' conjectures and the GSWZ application are all about the Kashaev invariant.
- **RT-AREA-topology/13** (duplicate, medium). Quantum modular forms have two prospective owners and no definition stage.
- **RT-AREA-topology/14** (missing, medium). State integrals need Faddeev's non-compact quantum dilogarithm Φ_b, which no stage of the atlas plans.
- **RT-AREA-topology/15** (missing, medium). QT.7 plans to formulate 'arithmetic resurgence conjectures', but no stage of the atlas defines the objects they need: Gevrey-1 series, the Borel transform, resurgent (endlessly continuable) functions, Stokes constants and lateral Borel sums.
- **RT-AREA-topology/16** (missing, medium). The Habiro-cohomology (q-de Rham) link of this roadmap is not recorded, although PLAN-HABIRO decided it should be.
- **RT-AREA-topology/17** (missing, low). q-holonomicity of the coloured Jones function (Garoufalidis-Lê) and the A-polynomial are absent.
- **RT-AREA-topology/18** (other, low). QT.3's boundary sentence on rational homology spheres treats as open-ended what the literature has done.
- **RT-AREA-topology/19** (other, low). The source list does not cover the stages.
- **RT-AREA-topology/20** (other, low). The per-roadmap extract disagrees with data/atlas.json.
- **RT-AREA-topology/21** (error, low). QT.6's prerequisites do not match its content.

### tauceti:TauCetiRoadmap/AlgebraicTopology — Algebraic topology of spaces and manifolds — 19 findings (3 high, 9 medium, 7 low)

- **RT-AREA-topology/22** (missing, high). Stage 6 plans duality only for compact manifolds and plans no cohomology with compact supports, no duality for noncompact manifolds and no umkehr (Gysin) pushforward for proper maps.
- **RT-AREA-topology/23** (error, high). Item 8.1 says 'State relative groups for NDR pairs/cofibrations, rather than attaching them to arbitrary inclusions without hypotheses.' This restriction is unnecessary and removes the main use of relative groups outside CW theory.
- **RT-AREA-topology/24** (missing, high). The Inventory lists 'exact couples' among the current Mathlib APIs the development starts from.
- **RT-AREA-topology/25** (missing, medium). Stage 1 builds the colimit only for the full groupoids FundamentalGroupoid(U_i1 ∩ ... ∩ U_ik) (items 1-3), and its based theorem (item 4) assumes path-connected intersections.
- **RT-AREA-topology/26** (missing, medium). Three classical inputs are planned nowhere, although stated targets use them.
- **RT-AREA-topology/27** (missing, medium). The roadmap forbids 'a list of cell counts ... in place of an actual CW structure', but no stage plans the model spaces that its checks compute.
- **RT-AREA-topology/28** (missing, medium). The ordinary characteristic-class machinery of manifolds and vector bundles has no owner at the level of ordinary topology: the Thom class and Thom isomorphism, the Gysin sequence, the Euler class, Stiefel-Whitney classes, mod-2 Steenrod squares and the Wu formula.
- **RT-AREA-topology/29** (missing, medium). The atlas records no stage edge touching this roadmap, not even the order that the document calls strict ('the chain 2 -> 3 -> 4 is strict'). Cross-roadmap suppliers and consumers stated in the documents are also absent.
- **RT-AREA-topology/30** (library-claim, medium). Stage 2 is presented as unbuilt (status 'unknown'), but items 1-3 and the carrier half of item 6 are already in Tau Ceti f790474, sorry-free.
- **RT-AREA-topology/31** (error, medium). Item 2.5 asks Stage 2 to 'Calculate (D^n,S^(n-1))' and to fix the connecting-map convention with it.
- **RT-AREA-topology/32** (error, medium). 'Prove finite-cover multiplicativity from transfer' gives a proof route that does not work.
- **RT-AREA-topology/33** (duplicate, medium). Item 8.1 plans 'Extend cubical HomotopyGroup with pointed maps, functoriality, basepoint change', which is UniversalCovers Stage 3.9. The document's own Ownership section assigns that to UniversalCovers ('basepoint change, and induced maps on homotopy groups ... This roadmap consumes those maps'). It is already built at Tau Ceti f790474: induced maps, homotopy and homotopy-equivalence invariance, basepoint change along paths, the pi_1-action on pi_n, and the loop-space shift.
- **RT-AREA-topology/34** (library-claim, low). The generation half of item 2 and the uniqueness half of item 3's universal property are already built sorry-free at Tau Ceti f790474, for families whose members are neighbourhoods of every point, which is more general than open covers.
- **RT-AREA-topology/35** (duplicate, low). Two theorems are planned twice inside the roadmap.
- **RT-AREA-topology/36** (error, low). 'Prove that the projection of Mathlib's locally trivial FiberBundle over a paracompact base has this lifting property': the paracompactness hypothesis is unnecessary.
- **RT-AREA-topology/37** (error, low). Two Hatcher locators are wrong.
- **RT-AREA-topology/38** (error, low). 'As a reusable corollary, prove that a simply connected integral homology n-sphere, n>=2, is homotopy equivalent to the standard S^n' has no hypothesis on the space.
- **RT-AREA-topology/39** (library-claim, low). Item 5.3 needs the deck group of a regular finite cover and 'the permutation local system' of a nonregular cover, and the Ownership section assigns deck transformations to UniversalCovers.
- **RT-AREA-topology/40** (other, low). Three separate proposals each claim the title 'Algebraic topology of spaces and manifolds, Part II'. RS-33 retitles StableHomotopyKTheory as 'Part II: homotopy foundations for algebraic K-theory'. PAPER-BENOIST-19 and PAPER-BENOIST-WITTENBERG-20 (coalesced) propose EquivariantTopologyRealVarieties, 'Part II: involutions and real-locus cohomology'. PAPER-BROWNING-SAWIN-20 proposes ConfigurationSpacesAndRationalLoops, 'Part II: configurations and rational double loops'. PROTOCOL section 15 describes a single extension that 'starts exactly where the roadmap it extends stops'. Three siblings with the same numbering leave the boundaries between them unstated.

### tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer — Combinatorial Heegaard Floer and grid homology — 25 findings (3 high, 16 medium, 6 low)

- **RT-AREA-topology/41** (error, high). The standing conventions fix the Alexander grading as A = ½(M_O − M_X) − (n−1)/2 and call its integrality 'a lemma', and they state GH̃(G) ≅ GĤ(L) ⊗ W^{⊗(n−1)} for a link L. G.2 asks for 'integer-valuedness of A' for every grid diagram.
- **RT-AREA-topology/42** (error, medium). G.6 asserts 'All V_i act identically on homology' and then treats GH⁻ as an 𝔽[U]-module.
- **RT-AREA-topology/43** (error, medium). The milestone order G.5 → G.6 → G.7 does not match the proofs, and G.5's move list does not match the proof it cites.
- **RT-AREA-topology/44** (missing, high). The v1 headline, the Milnor conjecture u(T_{p,q}) = (p−1)(q−1)/2, and G.7's |τ(K)| ≤ u(K) need the unknotting number, crossing changes and torus knots, and no roadmap of the atlas plans them.
- **RT-AREA-topology/45** (missing, high). G.10 states |τ(K)| ≤ g_s(K) without saying 'smooth', and relies on 'normal forms of knot cobordisms (book Appendix B.5)'. That is a Morse-theoretic theorem about smooth surfaces in [0,1] × S³, and no layer of the atlas plans it.
- **RT-AREA-topology/46** (missing, medium). G.8's bound max{s : GĤ(K, s) ≠ 0} ≤ g(K) needs the Seifert genus g(K) and the book's §3.4: Seifert surfaces built from grid diagrams, their genus as the maximal Alexander grading, and the theorem that some grid realises the Seifert genus.
- **RT-AREA-topology/47** (missing, medium). G.9's 'alternating knots are thin' consumes classical knot theory that nobody plans: alternating diagrams, the determinant of a link, the Goeritz matrix and the Gordon-Litherland formula, the signature and determinant behaviour in unoriented skein triples (Przytycki's criterion), and quasi-alternating links.
- **RT-AREA-topology/48** (missing, medium). G.9 plans the 'multivariable Alexander polynomial as Euler characteristic' (book Theorem 11.6.1), but no roadmap plans the multivariable Alexander polynomial or its inputs.
- **RT-AREA-topology/49** (error, medium). G.9 promises 'grid polytope vs Thurston norm, again bound only', as if the bound were combinatorial.
- **RT-AREA-topology/50** (missing, medium). G.11 targets Chekanov's theorem that m(5₂) is Legendrian non-simple, and the transverse invariant, but the contact topology these statements are about is planned nowhere.
- **RT-AREA-topology/51** (missing, medium). Lane ALG omits dual complexes and the universal coefficient theorem over 𝔽[U] with bigraded Ext.
- **RT-AREA-topology/52** (error, low). The chirality in G.7 and in the acceptance criteria is not pinned.
- **RT-AREA-topology/53** (library-claim, medium). The inventory says that Mathlib's complexes over any ComplexShape make 'ℤ×ℤ-bigraded complexes … immediate', and that 'All of it applies over ModuleCat (MvPolynomial (Fin n) (ZMod 2)) directly'. For the grid complexes the two claims do not combine.
- **RT-AREA-topology/54** (duplicate, medium). Filtered chain complexes are needed in three roadmaps and no owner is recorded.
- **RT-AREA-topology/55** (missing, medium). Lane H names Reidemeister-Singer as 'the serious topological input', but OSS's definition and invariance proof of HF̂_st use more external results, and no layer plans them.
- **RT-AREA-topology/56** (error, medium). The document lists 'exactly HF̂ for b₁(Y) = 0 via a twisted refinement' among what is 'combinatorial all the way down', and H.4 plans 'the twisted refinement recovering HF̂(Y) on the nose for b₁(Y) = 0'. OSS construct the twisted invariant HF̂^T(Y) and prove its topological invariance combinatorially (over 𝔽₂ in 0912.0830 Theorem 9.4, over ℤ in 1301.0480 Corollary 3.9). The identification HF̂^T(Y) ≅ HF̂(Y) for rational homology spheres is Theorem 10.4 of the appendix, which uses the holomorphic theory, and OSS's 'combinatorial proof' that HF̂(Y) is a topological invariant (Theorem 9.5) rests on it.
- **RT-AREA-topology/57** (error, low). The acceptance test 'lens spaces give 𝔽^p (one generator per spin^c structure); S¹ × S² exercises weak admissibility' cannot be run on the planned package as worded.
- **RT-AREA-topology/58** (error, medium). Lane L's invariance target 'invariance under Neumann moves' does not match the object it builds.
- **RT-AREA-topology/59** (missing, medium). GeometricTopology expects CHF to supply Rasmussen's s invariant as well as τ. Layer 6 imports 'τ : C → ℤ and s as consumers of the combinatorial Heegaard Floer roadmap', and layer 4 credits [Kir97, Problem 1.41] to 'Piccirillo, via the Conway knot, jointly with the combinatorial Heegaard Floer roadmap's τ'. CHF plans no Khovanov homology, Lee deformation or s, and no other roadmap does. τ cannot replace s here.
- **RT-AREA-topology/60** (missing, medium). GeometricTopology layer 6 consumes CHF's τ as 'a homomorphism on the concordance group'. That needs additivity, τ(K1 # K2) = τ(K1) + τ(K2), and no CHF layer plans a connected-sum (Künneth) formula for grid homology or a grid diagram of a connected sum.
- **RT-AREA-topology/61** (duplicate, low). Cromwell's theorem (the grid-to-diagram correspondence) is named as work in two places, and the atlas records no stage edge between them.
- **RT-AREA-topology/62** (error, low). Three locators are wrong or missing.
- **RT-AREA-topology/63** (other, low). G.13 calls the filtered grid complex 'the combinatorial stand-in for CFK^∞'. In the book's dictionary the filtered GC⁻ over 𝔽[U] corresponds to CFK^{−,*}, from which CFK^∞ is recovered by inverting U; the stage should say which object it builds.
- **RT-AREA-topology/64** (other, medium). The atlas records no stage edge for this roadmap: every stage has requires [] and consumers [], and only three roadmap-level 'declared' edges (stageCount 0) exist.
- **RT-AREA-topology/65** (library-claim, low). The atlas marks every stage 'unknown', and data/library-coverage.json has no entry for any CHF layer: AUDIT-44 lists the roadmap but has no result.

### tauceti:TauCetiRoadmap/GeometricTopology — Geometric topology and the solved Kirby-list problems — 30 findings (6 high, 20 medium, 4 low)

- **RT-AREA-topology/66** (error, high). Layer 10 states Thurston's conjecture and its disproof backwards, and the planned target is either vacuous or false.
- **RT-AREA-topology/67** (error, high). Layer 2 plans the theorem 'Smooth and PL embeddings are locally flat'. The PL half is false in codimension 2: the cone on a nontrivial knot K ⊂ S^3 = ∂D^4 is a PL embedding of D^2 in D^4 that is not locally flat at the cone point (otherwise every knot, e.g. the trefoil with signature -2, would be topologically slice). PL embeddings are locally flat in codimension >= 3 (Zeeman's unknotting of ball pairs) but not in general in codimension 2, which is exactly where Layers 4 and 6 use the predicate.
- **RT-AREA-topology/68** (error, high). The geometrization target is false as sketched and does not match the theorem that was proved.
- **RT-AREA-topology/69** (error, high). The JSJDecomposition structure has no minimality condition, so the planned theorem that it exists and is unique (canonical up to isotopy) is false for the structure as described.
- **RT-AREA-topology/70** (error, high). The Levine target for [Kir97, 1.31] is trivially true as written, and it misdescribes the category.
- **RT-AREA-topology/71** (missing, high). AlgebraicTopology Stage 8 consumes 'geometric topology's smooth-triangulation result' to prove that compact smooth manifolds have finite CW type, and FuchsianOrbifolds Layer 5 consumes that CW model for compact surfaces.
- **RT-AREA-topology/72** (error, medium). The unlock for [Kir97, 1.41] names the wrong paper and the wrong invariant. 1.41(A) (0-shake genus versus slice genus) was resolved by Piccirillo, 'Shake genus and slice genus' (Geom.
- **RT-AREA-topology/73** (error, medium). Several Kirby numbers are wrong.
- **RT-AREA-topology/74** (other, medium). Layer 5 lists [Kir97, 1.82] among the solved problems it unlocks, but 1.82 (the Generalized Property R Conjecture for framed links producing #(S^1 × S^2)) is open;
- **RT-AREA-topology/75** (error, medium). [Kir97, 4.82] is listed as a Layer 1 unlock with no source and a wrong gloss, and Layer 1 cannot state it.
- **RT-AREA-topology/76** (other, medium). 'Chirally cosmetic surgery [Kir97, Problem 1.81]' is not a solved problem and names no part or source. 1.81(A), the cosmetic surgery conjecture, is open (a 2025 paper still develops procedures to check it case by case). 1.81(B) ('no cosmetic surgeries, pure or chiral, on hyperbolic manifolds which yield hyperbolic manifolds') is false: Dunfield's census manifold o9_39009 has chirally cosmetic slopes.
- **RT-AREA-topology/77** (missing, medium). [Kir97, 1.19] (Akbulut-Kirby: equal 0-surgeries imply concordant) is listed as a Layer 5 unlock with no resolving reference, and it cannot be stated in Layer 5: concordance is built in Layer 6, which comes later and itself builds on Layer 4. The conjecture was disproved by Yasui (2015); Miller-Piccirillo gave non-concordant knots with diffeomorphic 0-traces.
- **RT-AREA-topology/78** (missing, medium). Seifert surfaces are not planned anywhere, though Layer 6 says it takes them from Layer 4. Layer 4 plans 'Alexander from a Seifert matrix' only as an algorithm on matrices.
- **RT-AREA-topology/79** (error, medium). The GT-CHF exchange forms a cycle and leaves the key four-dimensional input unowned.
- **RT-AREA-topology/80** (error, medium). The defining relation of Layer 6 is mis-sketched.
- **RT-AREA-topology/81** (missing, medium). Layer 1's gluing, handle and connected-sum plans rely on objects it never constructs, and its corners plan is wrong in one claim and too thin for its consumer.
- **RT-AREA-topology/82** (missing, medium). The isotopy extension theorem is planned nowhere, though Layer 1's connected-sum well-definedness needs it and MordellLawrenceVenkatesh LV.5 lists 'isotopy extension (GeometricTopology Layer 1)' as an input.
- **RT-AREA-topology/83** (missing, medium). The Annulus Conjecture target uses 'inside Σ₁' and 'regionBetween Σ₁ Σ₂' without planning the theorems that define them.
- **RT-AREA-topology/84** (missing, medium). The basic 3-manifold notions the Layer 7-10 statements rest on are unplanned, misplaced or misdefined.
- **RT-AREA-topology/85** (missing, medium). Layer 7 plans hyperbolic metrics 'on the model ℍⁿ' but never constructs ℍⁿ as a Riemannian manifold of curvature −1 or its isometry group, and does not reconcile with the hyperbolic planes already in the libraries, which use different normalisations.
- **RT-AREA-topology/86** (missing, medium). The Weeks target cannot be stated as sketched and its locator is wrong. hypVolume M takes a proof of Nonempty (HyperbolicMetric M), so 'hypVolume weeksManifold ≤ hypVolume M' needs a proof that the Weeks manifold is hyperbolic, for example an explicit face-pairing with the Poincaré polyhedron theorem in dimension 3, or a discrete group Γ ≤ PSL(2,ℂ) with ℍ³/Γ ≅ Weeks.
- **RT-AREA-topology/87** (missing, medium). Layer 9's inputs are claimed from places that do not have them.
- **RT-AREA-topology/88** (missing, medium). Layer 10's cohomological inputs are misattributed or missing.
- **RT-AREA-topology/89** (error, medium). Zeeman's conjecture is a statement about polyhedra: a polyhedron is collapsible if some triangulation (cell structure) of it collapses, and collapsibility depends on the triangulation (there are non-collapsible simplicial 3-balls). The roadmap sketch and Tau Ceti's TauCeti.ZeemanConjecture both require one specific triangulation, the ordered 'staircase' cylinder on K, for every linear order, to collapse.
- **RT-AREA-topology/90** (library-claim, medium). At the pins, seven layers are partly built, but the atlas marks every stage 'unknown', no accepted audit covers the roadmap, and STATUS.md is 15 days older than f790474 and understates Layer 6. Verdicts at Tau Ceti f790474 / Mathlib 082e2d3 (no sorry in any cited file). Layer 1 partial: boundary as a manifold, local product collars, global collar data (the collar theorem itself unproved), PL predicate and groupoid with PL ≤ Top; no gluing, handles, tubular neighbourhoods or connected sum.
- **RT-AREA-topology/91** (missing, medium). The roadmap records no stage edge, and several of its unlocks sit in a layer that cannot yet state them.
- **RT-AREA-topology/92** (error, low). The unlock 'Conway mutation does not preserve concordance, [Kir97, 1.53]' is credited to Piccirillo's Conway/Kinoshita-Terasaka pair, but the list itself records the answer 'No' (Kearton 1989) for general mutation.
- **RT-AREA-topology/93** (error, low). Waldhausen's rank-versus-genus conjecture is credited as 'disproved by Li', but Boileau-Zieschang disproved it in 1984 with Seifert fibred spaces of rank 2 and Heegaard genus 3, as the Kirby list itself records.
- **RT-AREA-topology/94** (library-claim, low). The inventory misses several Mathlib 082e2d3 files that the layers should consume, and one ⚠ can be resolved.
- **RT-AREA-topology/95** (error, low). The Smale target sketch is weaker than the layer's own design note, and its model is wrong.

### tauceti:TauCetiRoadmap/HeegaardFloer — Heegaard Floer homology, analytically — 22 findings (7 high, 14 medium, 1 low)

- **RT-AREA-topology/96** (error, high). F4.4 plans handleslide invariance 'via Perutz': 'the handleslid torus is Hamiltonian-isotopic, so invariance reduces to F3's continuation maps instead of a new (triangle) moduli problem'. That is not what Perutz proves, and it contradicts two other layers of the roadmap.
- **RT-AREA-topology/97** (error, high). F2.3 limits compactness to 'fixed genus-zero domains only; resist the general theory', and the README says the Sym^g route has a 'fixed strip domain, genus-zero disk-tree bubbling only ... no Deligne-Mumford'. The Ozsváth-Szabó proofs of F4.4 and F4.5 targets need two compactness-and-gluing problems outside that scope.
- **RT-AREA-topology/98** (error, high). The roadmap states that 'Némethi's H^- computes the holomorphic HF^- of every plumbed 3-manifold', with dependencies 'the staged HF^-/HF^infinity flavors of F4.5 and the combinatorial Lane L'. The cited theorem says something narrower, and its proof needs inputs that no layer plans.
- **RT-AREA-topology/99** (missing, high). Reconciliations 1 and 3 both rest on multi-pointed Heegaard Floer homology, which no layer plans.
- **RT-AREA-topology/100** (missing, high). v3 promises 'HF-hat(Y) over F_2', and F4.5 ends with 'naturality (JTZ) as the capstone'. Both need smooth topology linking diagrams to 3-manifolds, and no atlas layer plans it.
- **RT-AREA-topology/101** (error, high). AlgebraicTopology makes Heegaard Floer the owner of 'the Mathlib-compatible manifold orientation and degree API', and its Stage 6 consumes it for fundamental classes, Poincaré-Lefschetz duality and 'the shared manifold degree'. The HF README only lists 'manifold orientations and degree theory' among things missing from Mathlib ('build here'). None of the 22 HF stages plans them, and no other stage in data/atlas.json defines manifold orientation or the degree of a map.
- **RT-AREA-topology/102** (error, high). F1.2 states 'The Calderón-Zygmund inequality ||u||_{W^{1,p}} <= C||dbar u||_{L^p} via the Cauchy kernel' with no hypothesis on u or p, and it is false as written.
- **RT-AREA-topology/103** (missing, medium). F2.1 says symplectic manifolds are among the 'Definitions [that] land immediately (almost nothing to wait for)', and F3 works with 'exact Lagrangians in an exact symplectic manifold'. Both need differential forms on manifolds: an exterior derivative (to state that omega is closed, omega = d lambda, and lambda|_L = df), pullback, and Stokes' theorem on the strip or disk, which gives the action-energy identity E(u) = A(x) - A(y) that F3's d^2 = 0 and continuation maps rest on.
- **RT-AREA-topology/104** (missing, medium). F4.2 plans 'Spin^c structures (Turaev's vector-field model) and s_z' with no listed input.
- **RT-AREA-topology/105** (missing, medium). F4.5 lists 'holomorphic triangles and cobordism maps; surgery exact triangles; d-invariants', but the four-dimensional topology these need is planned nowhere.
- **RT-AREA-topology/106** (missing, medium). F4.1 plans 'smooth complex structure ..., the totally real tori T_alpha, T_beta, pi_2 = Z for g > 2, the basepoint divisor and positivity n_z(phi) >= 0'. It omits topology of Sym^g(Sigma) that OS §2-3 use before any count is defined.
- **RT-AREA-topology/107** (missing, medium). Every computation the roadmap promises reduces holomorphic counts to the lemma that an index-one class whose domain is an embedded bigon or rectangle has an odd number of holomorphic representatives modulo R. This covers the acceptance test 'every moduli count a bigon', reconciliation 1 (OSS appendix, item 4) and reconciliation 3 (MOS §3). The lemma is proved by conformal mapping: the Riemann mapping theorem with boundary correspondence for the polygon, or, in Sym^2, a unique anticonformal involution of the rectangle, through the tautological correspondence.
- **RT-AREA-topology/108** (missing, medium). F4.2 plans 'the combinatorial Maslov index (Lipshitz's formula e(D) + n_x(D) + n_y(D), stateable now, against F1.3 later)' with no proof route inside F4. Lipshitz proves the formula in his cylindrical setting (arXiv:math/0502404, Corollary 4.10). The erratum the roadmap cites only under F5 (arXiv:1301.4919) repairs 'a serious gap in the proof of the index formula', found by Pardon.
- **RT-AREA-topology/109** (duplicate, medium). Two layers plan the same combinatorial definitions.
- **RT-AREA-topology/110** (missing, medium). F3 plans Floer homology of 'exact Lagrangians in an exact symplectic manifold (zero section vs its Hamiltonian image in T*S^1, then T*M)', with 'HF(L, phi(L)) = H_*(L)-type computations in cotangent bundles'. Exactness rules out bubbling but does not give compactness: T*S^1 and T*M are non-compact, and strips can escape to infinity.
- **RT-AREA-topology/111** (other, medium). F4.5 stages 'orientation systems and Z' before 'naturality (JTZ) as the capstone', and the standing conventions ask that every F_2 theorem be stated so that 'the coefficient ring can be generalized without restating the geometry'. JTZ prove naturality only for functors to F_2[U]-modules on based 3-manifolds.
- **RT-AREA-topology/112** (error, medium). F4.5 lists 'HF^+-, HF^infinity ...; holomorphic triangles and cobordism maps; surgery exact triangles' without saying which flavors satisfy what.
- **RT-AREA-topology/113** (error, medium). The acceptance check '`HF-hat(L(p,q))` over F_2 from the genus-1 diagram (every moduli count a bigon) gives F^p' is mis-stated, and it cannot rule out a vacuous definition.
- **RT-AREA-topology/114** (library-claim, medium). At the pins, several layers are partly built, but the atlas and the audit record none of it.
- **RT-AREA-topology/115** (missing, medium). The roadmap says it owns the three reconciliation theorems ('which this roadmap owns'), and CHF keeps 'only pointers back'. Yet the atlas extract has no stage for any reconciliation or for the acceptance seam.
- **RT-AREA-topology/116** (other, medium). The atlas records no stage edge for this roadmap: every stage has empty requires and consumers, and the only roadmap edge is the stage-free 'declared' edge CHF -> HF.
- **RT-AREA-topology/117** (error, low). Two locators are imprecise.

### tauceti:TauCetiRoadmap/UniversalCovers — Universal covers — 6 findings (4 medium, 2 low)

- **RT-AREA-topology/118** (other, medium). Every stated target of all five stages is built sorry-free at Tau Ceti f790474, yet the atlas lists the roadmap as 'active' with status 'unknown' for every stage, and the README still reads as a plan.
- **RT-AREA-topology/119** (library-claim, medium). Stage 0.4 asks to port the deck-transformation group from mathlib4#40135 and the README lists #40135 as 'open'. It was merged into Mathlib before the pin: Mathlib 082e2d3 has deck p : Subgroup (E ≃ₜ E) with its action instances.
- **RT-AREA-topology/120** (duplicate, medium). Tau Ceti f790474 has, in this roadmap's directory, the generic topological Galois theory of finite covers.
- **RT-AREA-topology/121** (duplicate, medium). LieGroups Layer 5 plans to build the universal covering space of a connected Lie group itself ('This construction (the covering space, the lifted group law, and the transported Lie-group structure)'), and Layer 4's Lie III proof passes 'to its universal cover'. The topological construction with unique lifting is this roadmap's Stage 0 and is built at f790474. The link map flagged the overlap ('rescope'), but no restructuring proposal covers LieGroups, so it is still planned twice.
- **RT-AREA-topology/122** (missing, low). The atlas records no stage edge touching this roadmap.
- **RT-AREA-topology/123** (error, low). Both stages state their hypotheses with the class name LocPathConnectedSpace.


## What held

- **Built at the pins.** Much of the area is built in Tau Ceti `f790474`, with no `sorry`:
  - every stage of UniversalCovers;
  - Stages 1, 2 and part of 8 of AlgebraicTopology;
  - seven layers of GeometricTopology in part;
  - knot presentations (PD, Gauss and braid codes, and smooth-link isotopy);
  - parts of the grid-homology and Heegaard Floer lanes.

  The findings on atlas status and stage edges record where the atlas lags behind.
- **Consistent restructurings.** RS-09, RS-10 and RS-33 are consistent with the roadmaps, apart from what the findings name.
- **Already covered elsewhere.** Findings already confirmed in other red teams are not repeated:
  - the PDE edges and Sobolev inputs of HeegaardFloer F1 (RT-AREA-pde/6, /7, /11 and /33);
  - the flow theorem needed by Lane M (RT-AREA-diffgeom/2).

## For the verifier and the fixer

- **Checked here.** Several high findings were checked at the pins and sources:
  - Tau Ceti's framed PD and Gauss codes, framed Markov braids and smooth-link isotopy are at the cited lines, and
    `TauCeti/KnotTheory` has no `sorry` (the QT.0 duplication);
  - the Kirby list's "Problem 3.34 (Smale)";
  - the Calderón–Zygmund counterexample u = 1.
- **A merged duplicate.** The smooth-triangulation supplier gap was found from both sides. It is reported once, under
  GeometricTopology, with the AlgebraicTopology consumer-side fix folded in: the simplicial-to-CW bridge, or the Morse-theory
  route for item 8.7.
- **Maintainer notes.** Most fixes to the five Tau Ceti roadmaps change upstream roadmap documents. They are stated as
  maintainer notes, mirrored in the atlas records: stages, edges and statuses.
- **Requests to the orchestrator:**
  - queue a library audit for the topology roadmaps, since none is accepted;
  - regenerate the stage edges that all six documents state but the atlas omits.
