# PKG-EtaleDualityAndPerverseSheaves — complete package

Codex, session `codex-j3C1Td`, 2026-10-17. Refs #10160. The claim was confirmed by the bot in issue comment 6234081615 after claim comment 6234080510. Work branch: `codex-j3C1Td-etale-duality-package`.

This is the complete package for independent review, not a checkpoint or a claim of formalisation. It supplies the three package files and this handoff. The package README contains all owned targets with hypotheses, source locators, proof routes, APIs, discriminating Checks and layer examples. `Suggested.lean` contains 407 lines: native-carrier signatures, light definitions with real bodies, and examples. Its mathematical `sorry`s are intentional roadmap statements.

The accepted inputs contain 227 nodes: EDC.0 has 52, EDC.4 has 25, EDC.5 has 29, EDC.6 has 7, and EDC.7 has 114. The package retains 138 and imports 89 from their owners. The complete node-by-node disposition below includes every removal. Two explicit closure interfaces were added: finite-Tor product duality in §0.2 and supported topological purity/derived-complete Betti coefficients in §3.6. Every retained definition/construction has an API and at least three discriminating Checks. The five accepted input files were not changed.

## Deliverables and structure

- `research/blueprint/packages/EtaleDualityAndPerverseSheaves/README.md`
- `research/blueprint/packages/EtaleDualityAndPerverseSheaves/Suggested.lean`
- `research/blueprint/packages/EtaleDualityAndPerverseSheaves/metadata.toml` (`topic = "math.AG"`)
- `research/blueprint/handoff/PKG-EtaleDualityAndPerverseSheaves.md`

The mathematical title makes this an extension of EtaleCohomologyFoundations. Layers 0–1 cover all-constructible self-injective duality, flat traces and higher cycle theory; Layer 2 covers the abstract heart and perverse calculus; Layer 3 covers coefficients and comparisons before the geometric applications of Layer 4; Layer 5 covers perverse weights and decomposition; Layers 6–7 cover correspondences and local terms; Layer 8 covers graded Frobenius signs. This reorders the old coefficient/comparison and Lefschetz blocks to eliminate forward prerequisites. The final retained-target dependency audit finds no forward references or cycles.

No unresolved mathematical gap is hidden by an unconditional promise. The integral analytic extension is stated only with an analytic constructible derived-complete realization and uniform bounds. The strong diamond exceptional-pullback comparison requires the counit/essential-image condition; the adjunction mate and right-adjoint recovery have their unconditional supplied range. The theorem under that explicit image hypothesis is complete; no theorem that all geometric objects satisfy the hypothesis is claimed. General stacks, traits with rectified perversity, non-Noetherian coefficients, general absolute purity and further localization theories are excluded in the scope paragraph.

## Library and ownership audit

Elaboration baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only Tau Ceti library was also audited at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current TauCetiRoadmap main was `350e970`. The upstream style models read in full were AlgebraicVectorBundles and JacobianChallenge, each README and Suggested.lean.

The nine newer roadmaps absent from the atlas snapshot were checked: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, together with relevant Completed material. Chow Chern theory, real de Rham integration, lattice pairings and orthogonal isometries do not replace the additional étale, perverse or general-similitude targets. Completed HodgeStructure Lefschetz theory has different carriers and does not supply perverse relative hard Lefschetz. No existing roadmap was edited or replanned.

Current Tau Ceti removals/limits, read at their declarations:

- `Algebra/Module/ZMod/Injective.lean`: `Module.Baer.zmod_self` already proves self-injectivity of ℤ/n. §0.1 therefore retains arbitrary DVR quotients and the Noetherian finite-presentation bidual-evaluation lemma, not another ℤ/n proof.
- `LinearAlgebra/BilinearForm/SymplecticBasis.lean`: `LinearMap.BilinForm.IsAlt.even_finrank` already proves even dimension for a nondegenerate alternating form over a field. §8.1 imports it and retains self-paired primary-space parity and determinant signs. These new library facts are absent from the older elaboration pin, so the Suggested file states native end milestones without reconstructing them.
- `Topology/Algebra/GroupAction/InternalHom/DoubleDual.lean`: `eval_bijective_of_addEquiv_zmod` concerns finite ℤ/n-torsion modules with action and does not cover the general Noetherian self-injective coefficient ring statement.
- Existing self-injective algebra/finite-dimensional results have field or projectivity hypotheses, unlike arbitrary DVR quotients. Existing `trace_pi_of_apply_eq` has field coefficients: its use is kept within that range; the finite-ring point check is a block calculation.
- Pinned `LinearMap.det_dualMap`, inverse/reversed characteristic-polynomial formulas, `LinearMap.det_eq_of_compl₁₂_self_eq_smul`, and the Gram determinant identity are imported only with their actual hypotheses. Closed-immersion affineness uses the forward implication of `isClosedImmersion_iff_isAffineHom`, including the separate surjectivity condition in its converse.

Supplier versions inspected (README and suggested declarations where supplied):

| Roadmap | Upstream PR | Inspected head |
| --- | --- | --- |
| EtaleCohomologyFoundations | [PR 938](https://github.com/TauCetiProject/TauCetiRoadmap/pull/938) | `c4ee54f4b3b32173235ff75fa9db736daecb66fe` |
| EnhancedDerivedSheaves | [PR 908](https://github.com/TauCetiProject/TauCetiRoadmap/pull/908) | `b3ea60e3efc3bd4a0b541fb54469dcbf88772064` |
| ClassicalAdicEtaleCohomology | [PR 875](https://github.com/TauCetiProject/TauCetiRoadmap/pull/875) | `e36805f4bbf96f644034fbc220ab0607a15ace83` |
| ComplexComparisonPartII | [PR 848](https://github.com/TauCetiProject/TauCetiRoadmap/pull/848) | `d6cb0fc8f2ef059d222be2503f8e99285293111a` |
| LefschetzPencilsAndVanishingCycles | [PR 873](https://github.com/TauCetiProject/TauCetiRoadmap/pull/873) | `4c7deab75898820bcc1fedd1db4df1010cfc2303` |
| DeligneWeightsAndPurity | [PR 929](https://github.com/TauCetiProject/TauCetiRoadmap/pull/929) | `5f713c436ee303ceb25938d815e236b1a2c3d09a` |
| AdicCoefficientsAndComparisons | [PR 965](https://github.com/TauCetiProject/TauCetiRoadmap/pull/965) | `4a7b4d83e2622df066e2a883525bb755bce6b115` |

SchemeAndStackFoundations README was inspected at its file commit `d2081398eedfbd4153d3067aa98a21b5a5270957` on the current main. The README states exact supplier contracts, including the difference between ECF's normalized ℤ_ℓ coefficients and the ramified coherent constructible towers planned here.

The major ownership removals are ECF's basic categories, six operations, adjoint Verdier duality, smooth purity, Kummer c₁, basic projective-bundle/global blow-up formulas and integral p/p⁺; the 56 scalar/lisse/Weil-II foundations already owned by DeligneWeightsAndPurity; DWP §0.16's two-space reciprocal-polynomial theorem; and the already supplied analytic/diamond comparison foundations. The complete table below gives the exact supplier of each removed node. DWP's absolute/vector-space Lefschetz input is used, with the new relative/categorical conclusions retained. The imported source checks remain the supplier's responsibility; the package carries the additional boundary and negative-control examples.

## Corrections and closure work for the reviewer

1. Finite coefficient duality distinguishes self-injective Λ from arbitrary Noetherian Λ. Nonprojective ℤ/ℓ over ℤ/ℓ² is allowed for biduality, while derived products and product duality retain finite Tor dimension. The finite-presentation proof of evaluation uses exactness twice, rather than an unjustified cogenerator assertion. The new product-duality map has an explicit normalization, proof route and three checks.
2. The geometric/arithmetic distinction and the integral Ext term are preserved. Perfect pairings over a general base field live in Galois modules. Curve relative-duality evaluation, trace directions, multiplicities, shifts and Tate twists are specified.
3. Perverse smooth pullback uses relative dimension, not absolute dimension. The shifted functor's adjoint exactness is checked in the correct direction. Abstract intermediate extension precedes geometric use; its duality and smooth-simple consequences occur only after the relevant geometric facts. On a smooth X, IC_X(L)=L[d] requires extension of L to X. The external-product exactness claim fixes a perverse object in the other variable.
4. Ramified normalization uses λ, coherent derived reductions, common strata, and uniform ordinary/Tor bounds. O/λ reduction retains both terms for torsion. Finite coefficient extension is first proved by finite-free restriction/extension calculations; it does not depend circularly on the trace comparison proved later. Rational analytic categories are restricted to the stable-lattice essential image.
5. Supported Betti purity and noncompact derived duality are explicit named additional interfaces, not inferred from ordinary compact-manifold Poincaré duality. The proof uses relative normal cochains, excision, localization, finite-Tor coefficient base change and coherent limits. The added Dimca locators separate derived duality from underived duals.
6. Diamond full faithfulness gives right-adjoint recovery, not arbitrary preservation of f! by c*. The mate and conditional strong comparison are separate. Huber smooth duality uses residue characteristic and the stated quasi-separated/taut hypotheses, not just characteristic of the ground field.
7. Weak Lefschetz retains complex/support and integral-saturation refinements, not another copy of ECF's constant theorem. A smooth complete intersection need not have a smooth chain in a given presentation: establish the calculation at a good member, then use the geometrically connected smooth parameter locus and proper smooth base change. Top hyperplane powers need not generate integrally. The projective-bundle sign is checked for a line bundle. The blow-up refinement is at sheaf level and with supported traces; global columns/inverse signs are imported.
8. Perverse weight arguments use arithmetic Ext before geometric splitting; an arithmetic Jordan block is a negative control. Weight filtration precedes the generic weight criterion. Scalar/lisse weight foundations and absolute hard Lefschetz are removed in favor of DWP ownership.
9. Correspondence graph convention is (g,id), with c₁*F₁→c₂!F₂. Normalization uses ECF compactifications, not an unspecified scheme-foundation assertion. §6.4 owns the finite filtered trace calculation and the all-finite-type/normalized-adic nearby-cycle exchange extension; LPV's smaller exchange range is insufficient on its own.
10. Normal-cone contraction sends the first cone leg to zero, with the second leg unchanged. For isolated semisimple fixed points, take the full Artin fixed component before the cone. The finite-jet rational weight argument avoids the false claim that every associated graded invariant lifts in an arbitrary complete algebra. The involution example in characteristic different from two and the characteristic-p translation show exactly why reduced points/wild actions fail.
11. The two-space reciprocal theorem is imported from DWP §0.16 and removed from Lean. The retained determinant theorem uses alternating-rank parity already in current Tau Ceti and addresses the self-paired primary multiplicities and symmetric sign. In even middle dimension the exponent is (d/2)·b, not d·(b/2). The nonsplit quadric has middle determinant −q².

No change to another roadmap or accepted packet is included. Future changes to consumers should import these new refinements from this package, especially the ramified/common-bound category, product-duality map, supported Betti orientation, and all-finite-type specialization exchange.

## Adversarial mathematics pass

This was a manual mathematical sanity pass in addition to elaboration, not a formal proof. Every retained target's statement, hypotheses, API identities, proof route and Checks were read against the input and its source range. The following rows cover every owned subsection (and therefore all its targets in the disposition table). The zero object, empty support, rank zero, coefficient shifts, field/DVR distinction and all denominators were also checked wherever meaningful. The README retains the individual named Checks; this table records representative instances and corrections for review.

| Owned targets | Instances and computed witnesses | Result or correction |
| --- | --- | --- |
| §0.1 | m=1; zero module; ℤ/4 with M=ℤ/2; ramified O and k[[λ]] | Evaluation is the usual identity at rank zero; nonprojective torsion still dualizes. General finite-presentation proof replaces field-only reasoning. |
| §0.2 | Geometric point, smooth affine line, shifts [1], nonprojective ℤ/2 over ℤ/4 | Evaluation is canonical bidual evaluation; dual reverses shift. Derived tensor of ℤ/2 with itself is unbounded, excluded from product formula. |
| §0.3 | Identity map, finite étale disjoint points, nonreduced flat curve | Degree-one trace is identity; finite étale trace is sum; multiplicities survive topos reduction. |
| §0.4 | Double plane mod 2; successive finite flat maps | Trace multiplication by 2 vanishes mod 2; transitive degrees multiply. Reduced-space identity is incorrect. |
| §0.5 | Point; P¹; ℤ/ℓ local system over ℤ/ℓ²; nonclosed base | Twist/shift and evaluation agree with curve trace. Arithmetic Galois cohomology is not ordinary vector duality. |
| §0.6 | O/λ at a point; connected smooth curve; zero complex | RHom(O/λ,O) has Ext¹, whereas ordinary Hom is zero. Invariant/coinvariant edge descriptions retain torsion. |
| §0.7 | P¹ and a positive-genus curve; identity base change; zero rank | Degree-one relative evaluation and curve twist agree. Twisted pairing requires the dual local system. |
| §1.1 | Empty support; smooth codimension-one point; singular cycle with multiplicity | Support degree starts at 2c; the point class is the Kummer generator. Multiplicity is not discarded. |
| §1.2 | Zero bundle; line bundle; O(1)⊕O(1) on P² | c₀=1, c_i=0 above rank, c₂(sum)=h² despite each line's c₂=0. |
| §1.3 | Constant rational function; a point of degree r; proper intersection with higher Tor | Principal divisor maps to zero; point trace is r; Euler–Tor multiplicity replaces ordinary length when needed. Global graph factorization scopes lci pullback. |
| §2.1 | Standard derived category at a point; zero complex; Λ[1] | H⁰ is ordinary cohomology, shift changes the cohomological index, and heart inclusion is fully faithful. |
| §2.2 | Identity/zero exact functors; trivial recollement; open/closed decomposition | Adjoints have the required one-sided exactness. Images are formed in the abelian heart. |
| §2.3 | Point torsion theory; torsion module O/λ; j:G_m→A¹ | The tilt separates torsion; j!* has no boundary subquotient and differs from perverse j!. |
| §2.4 | Geometric point; disconnected étale cover; empty stratum | Degree-zero module is perverse at a point; constructible finite presentation and descent agree. Noetherian hypotheses remain explicit. |
| §2.5 | ℤ/ℓ over ℤ/ℓ²; Λ[1] on a curve; field | Nonprojective finite module is not discarded; duality exchanges perverse inequalities. IC corollary moved after IC construction. |
| §2.6 | Finite étale double cover; closed point; map to a point | Relative dimension is zero for double cover, so no [1]. Fibre/support dimensions control one-sided bounds. |
| §2.7 | Smooth line to point; identity; affine open | Pullback shift is [d]; adjoint direction corrected. Smooth-simple corollary moved to §2.10. |
| §2.8 | Point external product; product of smooth curves; locally closed point | External product is t-exact with the other factor perverse. Strict boundary bounds and transitivity use the correct locally closed factorization. |
| §2.9 | Smooth curve with one missing point; codimension-zero stratum; empty boundary | Deligne truncation fixes the threshold and low-degree comparison; an empty boundary gives identity. |
| §2.10 | Smooth extended local system; nodal curve; irreducible local system | IC stalk at the node has normalization rank two; shifted constant differs. Smooth equality requires L extend to X. |
| §2.11 | Point; infinite-dimensional stalk; constructible object | Nonconstructible conditions are not automatically constructibility/finite-length statements; agrees with middle perversity when constructible. |
| §2.12 | Identity; finite small map; resolution of surface singularity | Shift by source dimension is perverse for semismall maps; boundary contributions distinguish small from semismall. |
| §3.1 | O=ℤ_ℓ; ramified λ with ℓ a unit multiple of λᵉ; zero system | Level index uses λᵐ, not ℓᵐ; coherent reduction/common bounds are defining conditions. |
| §3.2 | Derived reduction of O/λ; finite free module; zero system | Derived reduction of torsion has degrees −1 and 0. Mapping inverse limit is derived/coherent and not ordinary Hom of limits. |
| §3.3 | Identity extension E=E′; ramified finite extension; point perverse torsion | Uniformizer and p/p⁺ behavior are tracked; no assertion that naive reduction is exact on a perverse heart. |
| §3.4 | Rank-one free coefficient extension; zero object; point trace | Extension agrees with finite-free Hom calculation and dual evaluation, without circular dependence on later trace transport. |
| §3.5 | Complex point; C× with monodromy ℓ; open embedding | Finite comparison is unrestricted in its range; the rational example has no stable lattice and lies outside the essential image. Nonproper Rf* is a separate extension. |
| §3.6 | Trivial complex line normal bundle; codimension zero/two; X=C; O/λ at point | Positive Thom generator has degree two; products have degree four; H²(C)=0 but H²_c(C,Λ(1))=Λ; derived dual retains Ext. |
| §3.7 | Complex P¹; point on a smooth curve; reduction from O/λ² | Trace of point class is 1 and integral Chern class reduces compatibly. Derived orientation map fixes sign. |
| §3.8 | Analytic point; smooth line; residue-characteristic torsion | Finite trace normalization matches Huber only in the prime-to-residue-characteristic range. Integral extension keeps an additional realization hypothesis. |
| §3.9 | Identity comparison; zero object; adjoint counit outside image | Recovery works under full faithfulness. Strong transport requires invertible counit; no geometric image preservation is inferred. |
| §4.1 | Empty support; identity complement; torsion middle group | Support-bound endpoints and integral saturation are retained; basic constant weak Lefschetz imported rather than duplicated. |
| §4.2 | Degree-one ample hyperplane; final zero-dimensional section; nonembedding unramified map | Affine complement and generic smoothness have their own proofs. Final zero-dimensional sections need not be connected. |
| §4.3 | Degree-one CI; plane conic/cubic; fixed presentation lacking smooth chain | Low Betti ranks agree with projective space; middle may differ. Deform from a good chain member instead of assuming every presentation has one. |
| §4.4 | Rank-one P(L); P(O⊕L); base point | ξ=−c₁(L), section product gives the plus-sign relation. Nonperfect coefficients require explicit projection/localization extension. |
| §4.5 | Blow-up of A² at origin; codimension one; support on centre | Exceptional restriction j*j*=−ζ; codimension-one blow-up is identity. Sheaf retractions/support compatibility are the new targets. |
| §4.6 | Quadric threefold and quadric-surface section over F₂; rational coefficients | Restriction/vanishing subspaces can intersect mod 2; rational primitive splitting does not imply finite/integral direct sum. |
| §4.7 | Degree one; conic; cubic curve; quintic threefold | Primitive ranks are 0, 0, 2, 204 respectively. Degree denominator is nonzero; top hᵐ has degree ∏d_i and need not generate integrally. |
| §5.1 | Trivial Frobenius; zero object; shifted lisse sheaf | Weil descent and mixed-perverse conventions preserve geometric Frobenius and weight shift w+a. |
| §5.2 | Pure unit Jordan extension; affine point; zero Ext group | Arithmetic and geometric Ext are distinct. Betti-growth input is separate and feeds the weight argument. |
| §5.3 | Smooth support with extended local system; boundary IC; simple rank one | IC is pure in its shifted weight; arithmetic splitting is not asserted by geometric purity. |
| §5.4 | Zero object; pure object; two distinct weights | Weight filtration is trivial on a pure object, functorial and strict. Generic criterion follows the filtration, removing forward dependency. |
| §5.5 | Nontrivial unipotent arithmetic Jordan block; zero object; two simple summands | Pure does not mean arithmetic semisimple; geometric splitting is what the theorem states. |
| §5.6 | Identity proper map; semismall resolution; zero complex | Decomposition is geometric and generally noncanonical; perverse cohomology indices and weights are shifted correctly. |
| §5.7 | Zero graded object; two-term Lefschetz string; point vector spaces | Primitive objects vanish where expected; η powers include coherent Tate twists. Generalizes the imported vector-space theorem. |
| §5.8 | Projective line over point; identity projective map; hyperplane restriction | Relative hard Lefschetz is an isomorphism of perverse objects with twists, not just equality of ranks. |
| §5.9 | Point model; shrinking a common base; zero restricted object | Finite diagrams and good-model conditions survive a common shrink; specialization statements use their purity hypotheses. |
| §5.10 | Complex projective line; nonproper target; zero input | Spreading plus perverse Betti comparison yields geometric decomposition/relative Lefschetz in the stated range. |
| §6.1 | Identity graph; finite permutation graph; nonreduced fixed point | Graph is (g,id), and fixed scheme is a fibre product including nilpotents. |
| §6.2 | Identity correspondence; disjoint union of points; composition of two graph maps | c₁*→c₂! direction yields operator x_i↦u_i x_{σ(i)}. Proper pushforward and compactification conditions are explicit. |
| §6.3 | Finite permutation; identity curve; zero correspondence | Trace sums fixed diagonal blocks. Identity curve total term is 2−2g, so naive stalk rank is not a general local term. Product duality closes trace construction. |
| §6.4 | Empty/whole invariant subset; two-step filtration; trivial deformation | Trace is additive on closed/open pieces with triangle signs. Full finite-type/adically normalized nearby-cycle exchange is owned here. |
| §6.5 | Identity ideal; strict contraction of affine coordinate; Frobenius powers | First cone leg becomes zero under contraction; ramification bound is strict and uniformizer-independent. Threshold precedes stalk formula. |
| §7.1 | Z=X; empty Z; identity correspondence with punctured normal cone | Puncturing removes the zero section. The full unpunctured cone would falsely forbid the trivial case. |
| §7.2 | Constant ULA family; zero complex; special fibre support | Nearby-cycle/trace constancy uses ULA and coherent specialization; it is not inferred from pointwise stalk dimensions. |
| §7.3 | Involution of x³+yz with char≠2; characteristic-p translation of P¹ | Full fixed scheme is k[x]/(x³), whereas cone at the reduced point has a fixed line. Tameness excludes translation's term 2 versus stalk 1. |
| §7.4 | Full Artin fixed component; infinite-order semisimple weights; nilpotent fixed jet | Finite rational weight projections suffice; no false invariant-lifting assertion for the full completion is used. |
| §7.5 | Transverse fixed point; tame isolated point; wild translation | Local term equals stalk trace under listed hypotheses; wild point provides a concrete failure outside them. |
| §8.1 | Rank zero; q=1; alternating rank two; symmetric rank one φ=−s; nonsemisimple primary block | det(0 on 0)=1 and det(−s) in rank one is −s. Alternating parity imported; symmetric sign uses −s-primary multiplicity and requires the stated invertible multiplier. |
| §8.2 | P¹; genus-g curve; nonsplit quadric surface; zero grading; coefficient Q₂ | Δ=q, q^(1−g), and middle det=−q² respectively. Even d uses (d/2)b even for odd b; odd d gets even middle rank. Δ²=q^(dχ). |

The light Lean definitions include the linear toy restriction/vanishing/primitive model, the integral hypersurface rank expression, finite point operators, graded Euler characteristic and graded determinant product. Their actual examples cover zero/identity, characteristic-two subspace intersection, low-degree hypersurfaces and projective-line signs. The raw rank expression is defined on all natural arguments, while its geometric interpretation is explicitly d≥1,m≥1. Heavy geometric carriers and their principal names are listed only in the README and the final Lean comment.

## Validation

- `lean-check research/blueprint/packages/EtaleDualityAndPerverseSheaves/Suggested.lean`: passed against the shared pinned build; final file 407 lines, exit 0, only declaration-uses-sorry warnings. Available memory was 90 GiB before the final invocation. No library build/update, language server or private Lake project was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: complete, 0 errors, 0 warnings (52 nodes, 150 API entries, 76 tests).
- The same validator for EDC.4: complete, 0 errors, 0 warnings (25 nodes, 12 API entries, 12 tests).
- The same validator for EDC.5: complete, 0 errors, 0 warnings (29 nodes, 119 API entries, 64 tests).
- The same validator for EDC.6: complete, 0 errors, 0 warnings (7 nodes, 8 API entries, 4 tests).
- The same validator for EDC.7: complete, 0 errors, 0 warnings (114 nodes, 227 API entries, 119 tests).
- Input inventory/disposition audit: all 227 IDs covered exactly once; 138 retained, 89 imported. All 35 retained definition/construction nodes have nonempty API and at least three tests; acceptance checks are also carried into the README. Dependency audit: no cycles or forward retained-section prerequisites.
- `python3 research/blueprint/intake.py check-files` on the four deliverables and `git diff --check`: passed. Only the four authorized paths are submitted.

## Source audit

All mathematical text is in our own words. Source theorem/section/page locators are in the README next to the corresponding target. Public sources were read from the versions below on 2026-10-17; no claim is based just on an inherited citation. The published versus arXiv pagination is distinguished. BBD covers the abstract heart, perverse operations, weights and decomposition; SGA 4 XVIII covers duality, flat traces and pairings; SGA 4½ [Cycle] covers supported classes and Chow compatibility; Varshavsky covers correspondences, contraction and isolated local terms. The original Yu, Zhu, Juteau, Katz, de Cataldo–Migliorini, Yun–Zhang, Lu–Zheng and Hansen–Kaletha–Weinstein statements were read in their cited ranges.

Three maintainer-cleared books/articles were read only in the library in place: Huber (1996), §7.5, especially Corollary 7.5.5; Jantzen (2003), I.2.11, pp.30–31, for exact finite rational character projections; Liu–Tian–Xiao–Zhang–Zhu (2022), Lemma 5.11.3(2)–(5), published pp.251–252. The latter reference now points to its published DOI rather than an earlier arXiv PDF with incompatible pagination. Dimca (2004), Proposition 3.2.11 p.65, Theorem 3.3.3 p.68 and Theorem 3.3.10 p.69, was also read from the cleared copy for the newly explicit supported-topology interface. No cleared file, extracted text or source passage is included in the repository or scratch. Finite quotient coefficient base change is a separate proof step; no blanket underived-dual assertion is imported from Dimca.

Retrieval digests for public PDFs (for reproducibility, not as substitutes for the local locators):

| Source/version | Public retrieval | SHA-256 |
| --- | --- | --- |
| BBD | [PDF](https://www.numdam.org/item/AST_1982__100__1_0.pdf) | `b1e10440e13cb6bf307f74030b577e0cf5056e41b35ca56640dc2f0d2109b9e0` |
| SGA4XVIII | [PDF](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf) | `458851856ba253e0a6047adb15da13a9124c9fe2ac922b214f2ac8c27b7abbc5` |
| SGA4XVII | [PDF](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf) | `e4f3c40b2ea3af327835bbabd0f0cd4c27219b2263501c9f719becd62548dab0` |
| WeilI | [PDF](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| WeilII | [PDF](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| BSproetale | [PDF](https://arxiv.org/pdf/1309.1198v2) | `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84` |
| dCM | [PDF](https://arxiv.org/pdf/0712.0349v2) | `171415a41c8e6aaf90e227b4003de9611c249a88b94a93550d7500ead6996e5f` |
| Angeniol-1976 | [PDF](https://www.numdam.org/article/AST_1976__36-37__152_0.pdf) | `68bf26fb91080c443d68be2545e2e6c2b28a0718f90da0758ea525624ace084b` |
| Grothendieck-Chern-1958 | [PDF](https://www.numdam.org/article/BSMF_1958__86__137_0.pdf) | `41eebe0b2c6718b762036b79fc3f494b630f7a91cf2b0594c68ebc5fc571b798` |
| LMS-1975 | [PDF](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1975c--FormuleClef-NC.pdf) | `f7da1fa86145ddaf58e20baa88ef93dbd604b1ce06efe25d0bd08e1ee21ed6c9` |
| Yu-2023 | [PDF](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |
| Katz-ACT-1993 | [PDF](https://web.math.princeton.edu/~nmk/old/ACT.pdf) | `ee0a19289e28d601ba82db2bee1822e7027f14a3d1a39a318820b5cac57826ed` |
| Katz-BettiSum-2001 | [PDF](https://web.math.princeton.edu/~nmk/BettiSum14.pdf) | `b1d9f269da24ca94dd13ee7503e665761531ae463b85173292488646811ce346` |
| Zhu-2017 | [PDF](https://arxiv.org/pdf/1407.8519v3) | `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b` |
| Juteau-2009 | [PDF](https://arxiv.org/pdf/0901.3671v1) | `7b72e2c1dfcf4d69d1adcd5b2e3b6a807907013f417e2efa2685c96b610db902` |
| Scholze-ECD-2026 | [PDF](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1` |
| Varshavsky-LV-2007 | [PDF](https://arxiv.org/pdf/math/0505564v2) | `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6` |
| Varshavsky-LocalTerms-2023 | [PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AD273B3043D9AADF4A522F51F1178575/S0010437X23007091a.pdf/local-terms-for-transversal-intersections.pdf) | `7e92c043f4cf01a4de05e747b398b6fd58c09ae0145a41bff877b7dc84e67206` |
| Varshavsky-LocalTerms-2020 | [PDF](https://arxiv.org/pdf/2003.06815v3) | `6a2c74173b5cbd164d28eb5a7669af5102d0ecb570d108eb71969e7c10e0ed8e` |
| Lu-Zheng-2022 | [PDF](https://arxiv.org/pdf/2005.08522v4) | `be71f418bdc0a5524e50aff00f2105313efc4759575276e252821b721a56db98` |
| Verdier-1983 | [PDF](https://www.numdam.org/item/AST_1983__101-102__332_0.pdf) | `997784aa55b8b4dc5af534f48d1f29703caba2f7ed7d1c4ab3265d76cac1f844` |
| Yun-Zhang-2019 | [PDF](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| SGA4half | [PDF](https://publications.ias.edu/sites/default/files/Number32.pdf) | `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6` |
| HKW-2022 | [PDF](https://arxiv.org/pdf/1709.06651v4) | `d37e986ef599420a8e206dc289e18965422b03ec923184737fbcead2abc0bd5c` |
| SGA4XIV | [PDF](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf) | `491af30c246e3aedfc717e1dd957cc634c6befba469e980c4ef7e01412bb0f94` |
| MilneLEC | [PDF](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077` |

The initial Milne fetch returned HTTP 406; the later direct retrieval succeeded with the digest above, and the cited version is v2.21 (2013). Stacks tags were checked as statements rather than guessed from their titles; the complete-intersection and ample-complement geometry is separately stated in the README. The private-book passages were read without copying. All scratch material is disposable after submission; this note contains everything needed for continuation or review.

## Complete disposition of accepted inputs

Indices are zero-based within the named accepted input file, solely for audit convenience. Each full input ID appears exactly once. “Retain” points to a full mathematical target in the package; “Import” records a removal because the identified supplier already owns it. The two additional closure interfaces are not counted as input nodes.

| Part/index | Input node ID | Disposition |
| --- | --- | --- |
| EDC.0/0 | `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/1 | `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/2 | `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/3 | `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/4 | `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/5 | `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change` | Import: EtaleCohomologyFoundations §§F.0–F.1, 0.7; EnhancedDerivedSheaves §§0.1–0.3 |
| EDC.0/6 | `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward` | Import: EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4 |
| EDC.0/7 | `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits` | Import: EtaleCohomologyFoundations §F.2; EnhancedDerivedSheaves §0.4 |
| EDC.0/8 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/9 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/10 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/11 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/12 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/13 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/14 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/15 | `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps` | Import: EtaleCohomologyFoundations §F.5; EnhancedDerivedSheaves §0.5 |
| EDC.0/16 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace` | Retain: §0.3 |
| EDC.0/17 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class` | Import: EtaleCohomologyFoundations §0.9 |
| EDC.0/18 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace` | Retain: §0.3 |
| EDC.0/19 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality` | Retain: §0.3 |
| EDC.0/20 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma` | Import: EtaleCohomologyFoundations §§0.11, F.6 |
| EDC.0/21 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace` | Import: EtaleCohomologyFoundations §§0.11, F.6 |
| EDC.0/22 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace` | Retain: §0.4 |
| EDC.0/23 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement` | Import: EtaleCohomologyFoundations §§0.11, F.6 |
| EDC.0/24 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity` | Import: EtaleCohomologyFoundations §§0.11, F.6 |
| EDC.0/25 | `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology` | Retain: §0.4 |
| EDC.0/26 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme` | Retain: §0.2 |
| EDC.0/27 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients` | Retain: §0.1 |
| EDC.0/28 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/one-dimensional-dualizing-base` | Retain: §0.2 |
| EDC.0/29 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality` | Retain: §0.2 |
| EDC.0/30 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms` | Retain: §0.2 |
| EDC.0/31 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions` | Retain: §0.2 |
| EDC.0/32 | `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality` | Retain: §0.5 |
| EDC.0/33 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion` | Retain: §0.5 |
| EDC.0/34 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing` | Retain: §0.5 |
| EDC.0/35 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance` | Retain: §0.5 |
| EDC.0/36 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` | Retain: §0.6 |
| EDC.0/37 | `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement` | Retain: §0.7 |
| EDC.0/38 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology` | Retain: §0.6 |
| EDC.0/39 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves` | Retain: §0.7 |
| EDC.0/40 | `EtaleDualityAndPerverseSheaves:EDC.2:pairings/relative-duality-locally-constant` | Retain: §0.7 |
| EDC.0/41 | `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity` | Import: EtaleCohomologyFoundations §§0.10, F.6 |
| EDC.0/42 | `EtaleDualityAndPerverseSheaves:EDC.3/semi-purity` | Retain: §1.1 |
| EDC.0/43 | `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class` | Retain: §1.1 |
| EDC.0/44 | `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map` | Import: EtaleCohomologyFoundations §§0.10, F.6 |
| EDC.0/45 | `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence` | Import: EtaleCohomologyFoundations §§0.10, F.6 |
| EDC.0/46 | `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-basis` | Import: EtaleCohomologyFoundations §§0.9, F.7 |
| EDC.0/47 | `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness` | Import: EtaleCohomologyFoundations §§0.9, F.7 |
| EDC.0/48 | `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes` | Retain: §1.2 |
| EDC.0/49 | `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map` | Retain: §1.3 |
| EDC.0/50 | `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula` | Import: EtaleCohomologyFoundations §§0.10, F.6 |
| EDC.0/51 | `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology` | Retain: §1.3 |
| EDC.4/0 | `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology` | Retain: §4.1 |
| EDC.4/1 | `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine` | Retain: §4.1 |
| EDC.4/2 | `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz` | Retain: §4.1 |
| EDC.4/3 | `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin` | Retain: §4.1 |
| EDC.4/4 | `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral` | Retain: §4.1 |
| EDC.4/5 | `EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz` | Retain: §4.2 |
| EDC.4/6 | `EtaleDualityAndPerverseSheaves:EDC.4/generic-affine-weak-lefschetz` | Retain: §4.2 |
| EDC.4/7 | `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology` | Retain: §4.3 |
| EDC.4/8 | `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition` | Retain: §4.4 |
| EDC.4/9 | `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images` | Retain: §4.5 |
| EDC.4/10 | `EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula` | Retain: §4.5 |
| EDC.4/11 | `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle` | Retain: §4.5 |
| EDC.4/12 | `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces` | Retain: §4.6 |
| EDC.4/13 | `EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index` | Import: AdicCoefficientsAndComparisons §§L0–L6; ClassicalAdicEtaleCohomology §§H0–H3 |
| EDC.4/14 | `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories` | Retain: §3.1 |
| EDC.4/15 | `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes` | Retain: §3.7 |
| EDC.4/16 | `EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension` | Retain: §3.3 |
| EDC.4/17 | `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison` | Retain: §3.5 |
| EDC.4/18 | `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison` | Retain: §3.7 |
| EDC.4/19 | `EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison` | Retain: §4.7 |
| EDC.4/20 | `EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality` | Import: AdicCoefficientsAndComparisons §L3; counit compatibility and conditional image test in §3.9 here |
| EDC.4/21 | `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system` | Retain: §3.1 |
| EDC.4/22 | `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-reduction` | Retain: §3.1 |
| EDC.4/23 | `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-uniform-bounds` | Retain: §3.1 |
| EDC.4/24 | `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-common-strata` | Retain: §3.1 |
| EDC.5/0 | `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory` | Retain: §2.1 |
| EDC.5/1 | `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology` | Retain: §2.1 |
| EDC.5/2 | `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors` | Retain: §2.2 |
| EDC.5/3 | `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation` | Retain: §2.2 |
| EDC.5/4 | `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures` | Retain: §2.2 |
| EDC.5/5 | `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension` | Retain: §2.3 |
| EDC.5/6 | `EtaleDualityAndPerverseSheaves:EDC.5/torsion-pair-tilt` | Retain: §2.3 |
| EDC.5/7 | `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function` | Import: SchemeAndStackFoundations §0.7 |
| EDC.5/8 | `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure` | Retain: §2.4 |
| EDC.5/9 | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category` | Retain: §2.4 |
| EDC.5/10 | `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse` | Retain: §2.4 |
| EDC.5/11 | `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement` | Retain: §2.4 |
| EDC.5/12 | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality` | Retain: §2.5 |
| EDC.5/13 | `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness` | Retain: §2.6 |
| EDC.5/14 | `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude` | Retain: §2.6 |
| EDC.5/15 | `EtaleDualityAndPerverseSheaves:EDC.5/smooth-pullback-perverse-exactness` | Retain: §2.7 |
| EDC.5/16 | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing` | Retain: §2.7 |
| EDC.5/17 | `EtaleDualityAndPerverseSheaves:EDC.5/affine-open-complement-exactness` | Retain: §2.7 |
| EDC.5/18 | `EtaleDualityAndPerverseSheaves:EDC.5/external-product-t-exact` | Retain: §2.8 |
| EDC.5/19 | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension` | Retain: §2.8 |
| EDC.5/20 | `EtaleDualityAndPerverseSheaves:EDC.5/deligne-truncation-formula` | Retain: §2.9 |
| EDC.5/21 | `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension-low-degree-cohomology` | Retain: §2.9 |
| EDC.5/22 | `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system` | Retain: §2.10 |
| EDC.5/23 | `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification` | Retain: §2.10 |
| EDC.5/24 | `EtaleDualityAndPerverseSheaves:EDC.5/adic-perverse-t-structures` | Import: EtaleCohomologyFoundations §§F.4, F.8; ramified coefficient refinement in §3.1 here |
| EDC.5/25 | `EtaleDualityAndPerverseSheaves:EDC.5/integral-dual-perversity` | Import: EtaleCohomologyFoundations §F.8 (integral p/p+ tilt, pointwise criteria and duality) |
| EDC.5/26 | `EtaleDualityAndPerverseSheaves:EDC.5/enlarged-perversity-conditions` | Retain: §2.11 |
| EDC.5/27 | `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity` | Retain: §2.12 |
| EDC.5/28 | `EtaleDualityAndPerverseSheaves:EDC.5/small-pushforward-intersection-complex` | Retain: §2.12 |
| EDC.6/0 | `EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons` | Retain: §3.2 |
| EDC.6/1 | `EtaleDualityAndPerverseSheaves:EDC.6/mapping-limit-and-integral-class-transport` | Retain: §3.2 |
| EDC.6/2 | `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes` | Retain: §3.4 |
| EDC.6/3 | `EtaleDualityAndPerverseSheaves:EDC.6/complex-tate-orientation-identification` | Retain: §3.6 |
| EDC.6/4 | `EtaleDualityAndPerverseSheaves:EDC.6/complex-supported-class-transport` | Retain: §3.6 |
| EDC.6/5 | `EtaleDualityAndPerverseSheaves:EDC.6/analytic-smooth-trace-comparison` | Retain: §3.8 |
| EDC.6/6 | `EtaleDualityAndPerverseSheaves:EDC.6/diamond-trace-mates-and-image-condition` | Retain: §3.9 |
| EDC.7/0 | `EtaleDualityAndPerverseSheaves:EDC.7/frobenius-descent-of-perverse-sheaves` | Retain: §5.1 |
| EDC.7/1 | `EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-sheaves` | Retain: §5.1 |
| EDC.7/2 | `EtaleDualityAndPerverseSheaves:EDC.7/pointwise-weight-criteria` | Retain: §5.1 |
| EDC.7/3 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-ext-vanishing` | Retain: §5.2 |
| EDC.7/4 | `EtaleDualityAndPerverseSheaves:EDC.7/affine-cohomology-weight-criterion` | Retain: §5.2 |
| EDC.7/5 | `EtaleDualityAndPerverseSheaves:EDC.7/subquotient-weight-stability` | Retain: §5.2 |
| EDC.7/6 | `EtaleDualityAndPerverseSheaves:EDC.7/intersection-complex-purity` | Retain: §5.3 |
| EDC.7/7 | `EtaleDualityAndPerverseSheaves:EDC.7/simple-mixed-perverse-is-pure` | Retain: §5.3 |
| EDC.7/8 | `EtaleDualityAndPerverseSheaves:EDC.7/torsion-theory-splitting-lemma` | Retain: §5.4 |
| EDC.7/9 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-filtration` | Retain: §5.4 |
| EDC.7/10 | `EtaleDualityAndPerverseSheaves:EDC.7/generic-weight-criterion` | Retain: §5.4 |
| EDC.7/11 | `EtaleDualityAndPerverseSheaves:EDC.7/geometrically-semisimple-perverse-sheaf` | Retain: §5.5 |
| EDC.7/12 | `EtaleDualityAndPerverseSheaves:EDC.7/pure-perverse-geometric-semisimplicity` | Retain: §5.5 |
| EDC.7/13 | `EtaleDualityAndPerverseSheaves:EDC.7/pure-indecomposables` | Retain: §5.5 |
| EDC.7/14 | `EtaleDualityAndPerverseSheaves:EDC.7/pure-open-closed-decomposition` | Retain: §5.5 |
| EDC.7/15 | `EtaleDualityAndPerverseSheaves:EDC.7/perverse-cohomology-weights` | Retain: §5.6 |
| EDC.7/16 | `EtaleDualityAndPerverseSheaves:EDC.7/quasi-finite-intermediate-extension-purity` | Retain: §5.6 |
| EDC.7/17 | `EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-geometric-splitting` | Retain: §5.6 |
| EDC.7/18 | `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem` | Retain: §5.6 |
| EDC.7/19 | `EtaleDualityAndPerverseSheaves:EDC.7/semismall-decomposition` | Retain: §5.6 |
| EDC.7/20 | `EtaleDualityAndPerverseSheaves:EDC.7/graded-lefschetz-object` | Retain: §5.7 |
| EDC.7/21 | `EtaleDualityAndPerverseSheaves:EDC.7/abstract-primitive-decomposition` | Retain: §5.7 |
| EDC.7/22 | `EtaleDualityAndPerverseSheaves:EDC.7/universal-hyperplane-lemma` | Retain: §5.8 |
| EDC.7/23 | `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz-theorem` | Retain: §5.8 |
| EDC.7/24 | `EtaleDualityAndPerverseSheaves:EDC.7/relative-lefschetz-primitive-decomposition` | Retain: §5.8 |
| EDC.7/25 | `EtaleDualityAndPerverseSheaves:EDC.7/intersection-cohomology-hard-lefschetz` | Retain: §5.8 |
| EDC.7/26 | `EtaleDualityAndPerverseSheaves:EDC.7/restricted-constructible-categories` | Retain: §5.9 |
| EDC.7/27 | `EtaleDualityAndPerverseSheaves:EDC.7/geometric-origin-class` | Retain: §5.9 |
| EDC.7/28 | `EtaleDualityAndPerverseSheaves:EDC.7/pure-specialization-of-geometric-origin` | Retain: §5.9 |
| EDC.7/29 | `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem-complex` | Retain: §5.10 |
| EDC.7/30 | `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz-complex` | Retain: §5.10 |
| EDC.7/31 | `EtaleDualityAndPerverseSheaves:EDC.8/scheme-correspondence` | Retain: §6.1 |
| EDC.7/32 | `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting` | Retain: §6.2 |
| EDC.7/33 | `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-pushforward` | Retain: §6.2 |
| EDC.7/34 | `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pullback-and-restriction` | Retain: §6.2 |
| EDC.7/35 | `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-composition` | Retain: §6.2 |
| EDC.7/36 | `EtaleDualityAndPerverseSheaves:EDC.8/trace-map-and-local-terms` | Retain: §6.3 |
| EDC.7/37 | `EtaleDualityAndPerverseSheaves:EDC.8/trace-pushforward-compatibility` | Retain: §6.3 |
| EDC.7/38 | `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-trace-formula` | Retain: §6.3 |
| EDC.7/39 | `EtaleDualityAndPerverseSheaves:EDC.8/zero-dimensional-lefschetz-verdier` | Retain: §6.3 |
| EDC.7/40 | `EtaleDualityAndPerverseSheaves:EDC.8/trace-additivity` | Retain: §6.4 |
| EDC.7/41 | `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-specialization` | Retain: §6.4 |
| EDC.7/42 | `EtaleDualityAndPerverseSheaves:EDC.8/normal-cone-specialization` | Retain: §6.4 |
| EDC.7/43 | `EtaleDualityAndPerverseSheaves:EDC.8/contracting-correspondence` | Retain: §6.5 |
| EDC.7/44 | `EtaleDualityAndPerverseSheaves:EDC.8/contracting-local-terms` | Retain: §6.5 |
| EDC.7/45 | `EtaleDualityAndPerverseSheaves:EDC.8/frobenius-twist-contracting` | Retain: §6.5 |
| EDC.7/46 | `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula` | Retain: §6.5 |
| EDC.7/47 | `EtaleDualityAndPerverseSheaves:EDC.8/finite-order-local-terms` | Retain: §7.5 |
| EDC.7/48 | `EtaleDualityAndPerverseSheaves:EDC.8/similitude-charpoly-reciprocity` | Import: DeligneWeightsAndPurity §0.16 |
| EDC.7/49 | `EtaleDualityAndPerverseSheaves:EDC.8/form-similitude-determinant` | Retain: §8.1 |
| EDC.7/50 | `EtaleDualityAndPerverseSheaves:EDC.8/graded-frobenius-duality-datum` | Retain: §8.2 |
| EDC.7/51 | `EtaleDualityAndPerverseSheaves:EDC.8/poincare-reciprocity-export` | Retain: §8.2 |
| EDC.7/52 | `EtaleDualityAndPerverseSheaves:EDC.8/punctured-tubular-fixed-point-conditions` | Retain: §7.1 |
| EDC.7/53 | `EtaleDualityAndPerverseSheaves:EDC.8/relative-trace-constancy` | Retain: §7.2 |
| EDC.7/54 | `EtaleDualityAndPerverseSheaves:EDC.8/normal-cone-trace-comparison` | Retain: §7.2 |
| EDC.7/55 | `EtaleDualityAndPerverseSheaves:EDC.7/betti-growth-in-etale-towers` | Retain: §5.2 |
| EDC.7/56 | `EtaleDualityAndPerverseSheaves:EDC.8/tame-fixed-subscheme-normal-cone` | Retain: §7.3 |
| EDC.7/57 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-characteristic-power-series-and-traces` | Import: DeligneWeightsAndPurity §0.10 |
| EDC.7/58 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-eigenvalues-of-exterior-powers` | Import: DeligneWeightsAndPurity §0.14 |
| EDC.7/59 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-embeddings-into-the-complex-numbers` | Import: DeligneWeightsAndPurity §0.5 |
| EDC.7/60 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-endomorphism-weights` | Import: DeligneWeightsAndPurity §0.7 |
| EDC.7/61 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-finite-field-base-extension-of-weights` | Import: DeligneWeightsAndPurity §0.12 |
| EDC.7/62 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-weight` | Import: DeligneWeightsAndPurity §0.4 |
| EDC.7/63 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-under-subquotients-and-extensions` | Import: DeligneWeightsAndPurity §0.9 |
| EDC.7/64 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-reciprocal-pairing-of-eigenvalues` | Import: DeligneWeightsAndPurity §0.16 |
| EDC.7/65 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-polynomials-in-an-endomorphism` | Import: DeligneWeightsAndPurity §0.11 |
| EDC.7/66 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-spectra-of-tensor-products-and-duals` | Import: DeligneWeightsAndPurity §0.13 |
| EDC.7/67 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-twisting-by-rank-one-characters` | Import: DeligneWeightsAndPurity §0.15 |
| EDC.7/68 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-arithmetic` | Import: DeligneWeightsAndPurity §0.2 |
| EDC.7/69 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-base-extension` | Import: DeligneWeightsAndPurity §0.3 |
| EDC.7/70 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-number-iff-iota-pure-for-every-iota` | Import: DeligneWeightsAndPurity §0.6 |
| EDC.7/71 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-q-number` | Import: DeligneWeightsAndPurity §0.1, 0.19 |
| EDC.7/72 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-absolute-values-from-the-rosati-involution` | Import: DeligneWeightsAndPurity §1.3 |
| EDC.7/73 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weights-of-the-cohomology-of-curves` | Import: DeligneWeightsAndPurity §1.7 |
| EDC.7/74 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-abelian-varieties` | Import: DeligneWeightsAndPurity §1.4 |
| EDC.7/75 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves` | Import: DeligneWeightsAndPurity §1.6 |
| EDC.7/76 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-weil-form` | Import: DeligneWeightsAndPurity §5.17 |
| EDC.7/77 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weight-functoriality` | Import: DeligneWeightsAndPurity §5.8 |
| EDC.7/78 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-determinantal-weights` | Import: DeligneWeightsAndPurity §5.6 |
| EDC.7/79 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-generalized-majoration` | Import: DeligneWeightsAndPurity §5.9 |
| EDC.7/80 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-monodromy-and-central-degree` | Import: DeligneWeightsAndPurity §5.7 |
| EDC.7/81 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-hadamard-de-la-vallee-poussin` | Import: DeligneWeightsAndPurity §5.16 |
| EDC.7/82 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-initial-curve-and-boundary-bounds` | Import: DeligneWeightsAndPurity §5.10 |
| EDC.7/83 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-monodromy-purity` | Import: DeligneWeightsAndPurity §5.11 |
| EDC.7/84 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-local-weight-corollaries` | Import: DeligneWeightsAndPurity §5.12 |
| EDC.7/85 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-punctual-purity-and-mixedness` | Import: DeligneWeightsAndPurity §5.3 |
| EDC.7/86 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-rank-one-normalization` | Import: DeligneWeightsAndPurity §5.5 |
| EDC.7/87 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-sheaves` | Import: DeligneWeightsAndPurity §5.4 |
| EDC.7/88 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-specialization-of-monodromy` | Import: DeligneWeightsAndPurity §5.15 |
| EDC.7/89 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-strict-initial-h1-bound` | Import: DeligneWeightsAndPurity §5.18 |
| EDC.7/90 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-group` | Import: DeligneWeightsAndPurity §5.1 |
| EDC.7/91 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-sheaf` | Import: DeligneWeightsAndPurity §5.2 |
| EDC.7/92 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-coefficient-specific-vanishing-cycles` | Import: DeligneWeightsAndPurity §6.1 |
| EDC.7/93 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-real-cohomological-factors` | Import: DeligneWeightsAndPurity §6.2 |
| EDC.7/94 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-sharp-curve-purity` | Import: DeligneWeightsAndPurity §6.4 |
| EDC.7/95 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-square-improvement` | Import: DeligneWeightsAndPurity §6.3 |
| EDC.7/96 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-fundamental-direct-image-theorem-3-3-1` | Import: DeligneWeightsAndPurity §7.8 |
| EDC.7/97 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-iota-mixed-direct-image-3-3-10` | Import: DeligneWeightsAndPurity §7.9 |
| EDC.7/98 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-purity-of-the-relative-curve-case` | Import: DeligneWeightsAndPurity §7.7 |
| EDC.7/99 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-spreading-out-to-a-tame-relative-curve` | Import: DeligneWeightsAndPurity §7.6 |
| EDC.7/100 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-tame-cover-of-a-lisse-sheaf-on-a-curve` | Import: DeligneWeightsAndPurity §7.5 |
| EDC.7/101 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-compact-support-direct-image-upper-weights-6-2-3` | Import: DeligneWeightsAndPurity §8.8 |
| EDC.7/102 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-direct-image-preserves-mixedness-6-1-2` | Import: DeligneWeightsAndPurity §8.4 |
| EDC.7/103 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-directional-weight-estimates` | Import: DeligneWeightsAndPurity §8.11 |
| EDC.7/104 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-generic-mixedness-of-direct-images-6-1-3` | Import: DeligneWeightsAndPurity §8.3 |
| EDC.7/105 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-geometric-semisimplicity` | Import: DeligneWeightsAndPurity §8.14, 8.19 |
| EDC.7/106 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-mixed-complexes` | Import: DeligneWeightsAndPurity §8.1 |
| EDC.7/107 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-potentially-property-p-3-4-10` | Import: DeligneWeightsAndPurity §8.20 |
| EDC.7/108 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-proper-direct-image-preserves-purity-6-2-6` | Import: DeligneWeightsAndPurity §8.12 |
| EDC.7/109 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-pure-complexes` | Import: DeligneWeightsAndPurity §8.2 |
| EDC.7/110 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-six-operations-preserve-mixedness-6-1-11` | Import: DeligneWeightsAndPurity §8.5 |
| EDC.7/111 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5` | Import: DeligneWeightsAndPurity §8.9 |
| EDC.7/112 | `EtaleDualityAndPerverseSheaves:EDC.7/weight-positive-euler-product-comparison` | Import: DeligneWeightsAndPurity §2.4–2.8, 5.16 |
| EDC.7/113 | `EtaleDualityAndPerverseSheaves:EDC.8/semisimple-isolated-fixed-subscheme-normal-cone` | Retain: §7.4 |

## Review handoff

No further implementation is required for this package job. The independent package review should rerun `lean-check`, inspect the owned variants against the exact supplier contracts, and repeat the adversarial mathematical pass independently. Particular review priorities are the general self-injective coefficient range, common-bound ramified towers, topology/comparison closure interfaces, nearby-cycle exchange range, and the finite-jet proof for full Artin fixed components. These are explicitly stated targets with proof routes and negative controls, not implementation claims. The current branch contains no edits to suppliers, packets, atlas data or another worker's deliverables.
