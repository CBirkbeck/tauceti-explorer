# Handoff: AutomorphicFormsOnReductiveGroups package

Completed by Codex, session `codex-WQKPTk`, for #10141. This is the complete package submission, not a checkpoint. The package contains the roadmap, its compact Lean companion and `math.NT` metadata. The source packet and reader were treated as inputs and were not edited.

## Coverage and boundaries

All 100 accepted input targets have a location or a named supplier below. The README is the full mathematical specification: Layers 0–7, definition APIs, discriminating Checks, worked examples, exact dependency contracts, downstream consumers and numbered section/theorem/page source locators. The Lean companion contains only 12 light definitions, one eigenclass structure, 11 theorem signatures and 83 examples over carriers available at the pins. Analytic/representation-theoretic carriers absent at the pins are named in its single closing comment; no data definition is sorry'd. The example computations do not constitute formalization of the source theorems.

The approved input's generality is retained and sharpened: general reductive groups and real groups, all-degree cohomology, arbitrary compatible finite-dimensional coefficients where appropriate, all totally real factors for the coherent calculation, and no ordinary/slope condition on archimedean classification. The explicit local lattice signature is over ℚ_p/ℤ_p. Its more general nonarchimedean local-field counterpart is registered separately in §5.6, with its own uniformizer; the two signatures are not identified.

## Current-library and ownership audit

Read the current TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti source at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to the pinned build. The shared compilation uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`. Read ReductiveGroups and RepresentationTheory/LieHighestWeight in full, plus the accepted PadicMeasuresIwasawaAlgebras exemplar. Object searches covered automorphic/cuspidal carriers, moderate growth, compact-finite/isotypic projectors, central characters and Harish-Chandra projection, continuous/relative Lie cochains, Weil groups, stable integral lattices, coherent cohomology, restricted tensor products and the Hecke action. Searched both current and pinned libraries; current-only declarations were not imported into the pinned Lean file.

The nine newer roadmaps were checked: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. They supply geometric/vector-bundle, differential-form, integral-lattice, operator and real-point ingredients, not the new automorphic and archimedean/coherent representation carriers here. The completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts directories are absent from this current roadmap checkout; their existing library functionality is reused where relevant. No absent directory is claimed to have been read.

Duplication removals and precise near misses:

- ArithmeticLocallySymmetricSpaces' current package contract (upstream PR #871, head `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd`) supplies F.1, F.5–F.7 and §4.5. Reuse its real points, compatible modules, all-degree absolute/relative complexes, invariant forms, automorphic/cusp carriers, uniform growth, fixed-level/type/central-ideal finiteness, cusp decay/discreteness, algebraic weights, Wigner lemma and Kostant theorem. This same-bundle dependence is explicit; it does not claim those open-package targets are implemented at the pins.
- `TopRep.homogeneousCochains` and `continuousCohomology` already give all-degree continuous group cohomology. §1.2 plans the smooth comparison and locally compact exponential-law adapter to Cartesian cochains, not another continuous theory.
- `TauCeti.hcProjection`, `lift_hcProjection` and `vermaCentralCharacter_dotAction` now give projection/evaluation and dot-invariance directions under the actual splitting/Killing hypotheses. They do not already prove the full reductive Harish-Chandra isomorphism. That input remains LieHighestWeight Layers 7/9; no semisimple Killing hypothesis is applied directly to glₙ.
- Reuse `UniversalEnvelopingAlgebra`, centres, `Representation`, submodules, tensor products, exterior/alternating constructions, Haar integration and the actual compact-group projectors/Peter–Weyl. Abstract orbit-finiteness predicates here are adapters, not a second compact representation library.
- Reuse `TauCeti.GlobalNumberFields.HeckeCharacter`, the existing modular-form slash/Hecke maps and the GL₂ double-coset degree theorem. Only this roadmap's normalization/dictionary is new.
- Finite-place smooth categories, Hecke idempotents and spherical dimension one are supplied by SmoothRepresentationsOfLocalGroups. The new distribution algebra and Flath comparison retain their own targets.
- Arithmetic quotients, finite class sets, unipotent compactness, reduction theory and heights come from AdelicAlgebraicGroups. Local hyperspecial existence alone is not claimed to prove a global good-model theorem; §3.5 states integral spreading separately.
- General integral-lattice algebra is supplied by IntegralLattices. A p-adic full stable lattice is not a discrete ℤ-lattice by a change of scalar notation.

Moved-down notions (higher consumers must import these):

1. The Hermitian datum, actual Hodge stabilizer, full real split centre, tangent splitting and coherent Lie pair are owned by §§6.1–6.2, rather than assuming ShimuraData. No Shimura variety or geometric coherent comparison is required to define them.
2. Archimedean Weil groups/GLₙ parameters and local/global Whittaker models, plus the K-Bessel/Fourier interface, are owned by §§2.5, 4.3, 4.5, rather than importing AutomorphicLFunctionsAndLocalFactors. No finite-place LLC, complete L-function or functional equation is claimed from this interface.
3. A concrete discrete occurrence and the minimum finite-jet Eisenstein realization required by the automorphic-subquotient theorem are owned by §§3.2, 4.2. AutomorphicSpectralTheory is a higher consumer, not a prerequisite for these definitions. Its full spectral decomposition, trace formula and multiplicity formulas remain outside this package.
4. ComputationalNumberTheory is not a prerequisite: specified computed Fourier/Hecke values enter as hypotheses of examples needing them.

## Claims the README could not support unchanged

The following are corrections to the mathematical scope, not silent omissions:

- No general topological full-G∞ action on the K-finite carrier. It acts on A∞; K, enveloping and finite-adelic actions act on A. No Fréchet topology is asserted for the unrestricted union over central ideals.
- No arbitrary derivative growth theorem from moderate growth alone, no strict exponent inductive limit without a closed-image proof, and no properness of a matrix height merely from closedness inside GLₙ.
- No automatic full-K binomial multiplicity, no quotient by a split centre before coefficient balancing, and no replacement of absolute rank by split rank. Rational and full real split centres are distinguished.
- No general rationality theorem from the bare word cohomological for a reductive group: §5.7 states an actual rational admissible Hecke-cohomology summand with compatible levels. GLₙ exact-field descent is separately stated in its full representation-theoretic generality; arithmetic number-field finiteness uses regular algebraic cuspidality.
- No arbitrary Maass Ramanujan consequence of Clozel purity. §5.5 distinguishes the integral Clozel weight from the raw Langlands exponent sum and gives the exact twist.
- No identification of coherent degree with ordinary relative degree; no automatic doubling after full-group induction with the coefficient fixed; no replacement of the coherent representation by the Weyl length alone.
- No one large-weight theorem combining BCGP's global discrete-occurrence theorem, Pilloni's essentially-unitary singular local theorem and the local lowest-weight theorem. §6.6 states all three independently and keeps the central normalizations. Pilloni's printed `a≥R` at Theorem 15.2.2.1(2), p.108, conflicts with the negative `a` parameter used immediately there; the package uses the mathematically required `−a≥R` and records the discrepancy here. The original source was read in the cleared library; it was not copied or edited.
- No arbitrary base change at nonsmall stabilizers. The sign example over ℤ/F₂ disproves it. A field scalar mismatch forces zero, but a ring scalar mismatch need not: 4 mod 8 survives both signs. Central quotienting uses overlap compatibility and effective stabilizers.
- No unrestricted finite p-adic image on an integral coefficient lattice, no unique eigencharacter determined by a nonfaithful eigenvector, no automatic characteristic-zero lift of torsion classes, and no integral H¹ torsion for trivial ℤ coefficients.
- The Maass numerical example does not promote a numerical eigenvalue to a certified formal existence theorem. Neither finite spectral computations nor any unproved functorial transfer are part of the foundational package.

All mathematical prose is newly written. Source titles are bibliographic labels. No source passage, source file or chapter-by-chapter summary is included. The cleared nonpublic Corvallis, Pilloni and Scholze sources were read in place. Clozel was read from the editor's publicly hosted volume linked in References. Direct source checks corrected BPCZ's growth/smoothing/constant-term/smooth-automorphic locators to §§2.5.7–2.5.10, pp.18–19 and §2.7.1, p.23; the smooth globalization citation is Bernstein–Krötz Theorem 10.6, p.45. Harris Theorems 3.4 and 3.5 are on p.63. Purity is Clozel Lemme 4.9, pp.144–145; arithmetic rationality is Théorème 3.13, p.112, general finite-extension descent is Proposition 3.16, pp.122–123, and exact GLₙ descent is Propositions 3.1–3.2, pp.102–104. Badulescu–Renard Theorem 8.2 and the complex-case discussion supply the generic unitary dual without an unread book citation.

## Adversarial pass: all accepted targets

Each row covers the statement, its defining properties and named API at the specified location; the README supplies the expanded Checks. The rows follow the input node order, so supplier-only targets are also accounted for. Instances are actual calculations or negative controls, not a claim that an analytic theorem has been formally proved. The analytic theory is over ℝ/ℂ; characteristic-p compact averaging, Weyl decomposition and component splitting are explicitly outside those theorems. Residual/integral statements are tested separately at p=2 and F₂. A residue cardinality q=1 is not a local field; its polynomial coset count is tested separately.

| Input target | Package/supplier | Instances and computation | Result / correction |
| --- | --- | --- | --- |
| `smooth-adelic-function` | 0.1 | Trivial group, constant 1, p-adic |x−1| at 1, nonsmooth |log|x||. | Keep global finite level and genuine archimedean smoothness; separate rational invariance. |
| `adelic-test-functions` | 0.2 | Trivial group gives ℂ; noncompact constants fail compact support; volume-two projector has coefficient 1/2. | No positive-dimensional delta unit; normalize by nonzero Haar volume. |
| `adelic-schwartz-space` | 0.3 | Symmetric torus Gaussian has maximum exp(−2π); compact group constants pass, noncompact constants fail. | Require both height directions, all derivatives and compact finite support. |
| `moderate-growth` | 0.4 | Height 1 rejects x; constants use N=0; exp(x) exceeds every polynomial. | Real nonnegative exponents match Lean; integer-exponent equivalence assumes H≥1. |
| `uniform-moderate-growth-space` | 0.4 | sin(exp(t²)) is bounded but its Euler derivative grows exponentially. | One common exponent for all derivatives; do not infer uniform growth from boundedness. |
| `growth-translation-differentiation` | 0.4 | R(y)1=1; X1=0 while (1+X)1=1; torus Euler derivatives preserve the exponent. | Use augmentation ideal, not positive filtration degree, to annihilate constants. |
| `convolution-to-uniform-growth` | 0.5 | Mass-one kernel fixes 1; Gaussian integration by parts gives opposite nonzero signs. | Derived smoothing uses the specified left derivative and principal anti-automorphism. |
| `finite-hecke-action` | 0.5 | e_J²=e_J; raw diag(p,1) sends 1 to p+1, hence 3 at p=2. | Finite Hecke algebra is supplied; add only its growth-space action. |
| `gk-pair` | ALS F.1/F.5 | Trivial pair; disconnected O(2); rank-zero Lie quotient. | Reuse the compatible pair, with actual differentiated inclusion and all compact components. |
| `gk-module` | ALS F.5 | Zero module; trivial action; compact derivative incompatible with an arbitrary Lie action. | Reuse compatible modules; Lie action and K action cannot be chosen independently. |
| `relative-lie-cochain-complex` | ALS F.5; 1.1 | Zero coefficient; trivial pair gives V in degree zero; sl₂ gives dω(X,Y)=−1. | Reuse relative cochains and their differential; bracket is inserted first. |
| `relative-cohomology-functoriality` | 1.1 | Zero sequence; degree-zero connecting map lands in H¹; odd cup swap gives −1. | Add pair-morphism data, relative resolution exactness and characteristic-zero compact averaging. |
| `differentiable-cochains` | 1.2 | Sign-action dv=−2v; additive x is a cocycle; x² gives −4 at (1,2). | Reuse continuous cohomology through the exponential law; smoothing is finite-dimensional-coefficient here. |
| `invariant-forms-complex` | ALS F.5; 1.3 | At a point invariant forms are V^K; full O(2) removes orientation degree two. | Reuse invariant forms; homogeneous-space adapter retains component action. |
| `van-est-isomorphism` | 1.3 | Compact L gives V^L only; ℝ gives degrees 0,1; GL₁(ℂ) gives the norm generator. | General van Est has finite-dimensional continuous coefficients and the full maximal compact. |
| `cartan-iwasawa-malcev` | 1.3 | L compact gives a point; ℝ gives ℝ; compact subgroup surjects onto components. | Reductive case is supplied; add the finite-component nonreductive extension needed by van Est. |
| `van-est-acceptance` | 1.3 | n=0 exterior algebra is degree zero; GL₂(ℝ) full O(2) kills the orientation class. | Keep continuous-group, not Lie-algebra-only, answer. |
| `real-points-lie-group` | ALS F.1 | GL₀ is trivial; GL₁(ℝ) and GL₂(ℝ) each have two components. | Reuse real points and their actual component groups. |
| `real-reductive-group` | ALS F.1; LieGroups 9 | Compact group has 𝔭=0; split torus has a positive norm direction. | Reuse reductive datum and Cartan decomposition; do not assume semisimple centre zero. |
| `k-finite-vectors` | 2.1 | Zero vector, trivial representation, finite-dimensional representation, infinite cyclic regular delta orbit. | Orbit span, not orbit set, is finite-dimensional; generic Lean predicate needs no topology. |
| `admissible-gk-module` | 2.1 | Zero module; infinitely many lowest-weight tensor summands; two-dimensional O(2) type has isotypic dimension 4. | Admissibility is not finite generation; Harish-Chandra requires both. |
| `infinitesimal-character` | 2.2 | Zero module permits every scalar character; Jordan block is generalized, not scalar; dual scalar 2 becomes −2. | Nonzero irreducibility for uniqueness; use principal anti-automorphism for duals. |
| `harish-chandra-admissibility` | 2.2; ALS F.6 | Unit central ideal annihilates only zero; without fixed K-types infinitely many types occur. | Fix level, finite type set and cofinite central ideal; arithmetic theorem is supplied. |
| `principal-series` | 2.3 | P=G is identity; zero coefficient induces zero; SL₂ half modulus at diag(2,1/2) is 2. | Use positive half modulus and normalized covariance. |
| `casselman-embedding` | 2.3 | Trivial SL₂ embeds at ν=−1, but is quotient at ν=1; zero module excluded from irreducible assertion. | Embedding direction differs from Langlands quotient direction. |
| `sf-representation` | 2.7 | Zero and finite-dimensional spaces; smooth C∞(S¹) has infinitely many compact types. | Joint continuity, smooth vectors and seminorm moderate growth are distinct requirements. |
| `g-continuous-norms` | 2.7 | Factorial weights on a discrete-series basis need not yield continuous G action; zero space is harmless. | A norm alone is not G-continuous; retain completion/action hypotheses and Sobolev comparison. |
| `casselman-wallach-globalization` | 2.7 | Zero globalizes to zero; finite direct sums work; full smooth space differs from compact-finite vectors. | Finite-generated admissible category and closed Hausdorff quotient are explicit. |
| `dixmier-malliavin` | 2.7 | A mass-one test function fixes constants; no smooth delta unit on a positive-dimensional group. | Factorization is a finite sum of integrated vectors, not a universal smooth identity kernel. |
| `real-reductive-representation-theory` | 2.1–2.7 | Compact, split torus and SL₂ examples; zero representation is not irreducible. | Replace the umbrella with the actual admissibility, induction, classification and globalization interfaces. |
| `tempered-square-integrable` | 2.4 | Compact irreducibles are discrete; SL₂ trivial is not tempered; D₁ limits are tempered but not discrete. | Integrate matrix coefficients modulo the specified split centre and require unitary normalization. |
| `discrete-series` | 2.4 | SL₂ has discrete series; split SO(3,3) has absolute ranks 3 and 2 and has none. | Use compact-mod-centre Cartan criterion, shifted integral lattice and compact-wall nondegeneracy. |
| `langlands-classification` | 2.4 | Trivial SL₂ is quotient at ν=1; compact group has P=G and exponent zero. | Positive chamber and unique irreducible quotient, with specified Langlands datum. |
| `weil-group-real` | 2.5 | j²=−1; j·2 squares to −4; a split semidirect lift could square to +1. | Use nonsplit real Weil group and its actual norm. |
| `archimedean-llc-gln` | 2.5 | GL₁ real sign on j; norm restricts to |z|²; GL₂ trivial parameter is unbounded. | GLₙ archimedean correspondence only; n=0 is a separate trivial case. |
| `gl2-real-discrete-series` | 2.6 | k=2 Casimir 0, k=12 gives 30, k=1 gives −1/4; lowest lowering coefficient is 0. | Distinguish D₁ limit, two connected rays, scalar action μ and Casimir normalization. |
| `vogan-generic-unitary-dual` | 2.6 | GL₁ characters tempered; complementary interval 0<β<1/2 excludes reducible endpoint; trivial GL₂ nongeneric. | Use generic unitary dual theorem, including complex case; no genericity from unitarity alone. |
| `automorphic-form` | ALS F.6; 3.1 | Constants; unit central ideal gives zero; fixed-level/fixed-type bounds. | Reuse existing automorphic-form carrier. |
| `automorphic-forms-uniform-growth` | ALS F.6; 0.4 | Constants have uniform exponent zero; bounded oscillatory negative control is not Z-finite. | Reuse uniform-growth theorem for automorphic vectors; do not assert it for arbitrary smooth moderate functions. |
| `smooth-automorphic-forms` | 3.1 | Rapid infinite K-type series belongs to A∞ but not A; compact archimedean group gives equality. | Fréchet globalization is fixed finite level/central ideal; unrestricted union has no asserted Fréchet topology. |
| `harish-chandra-finiteness` | ALS F.6 | Unit ideal gives zero; finite level plus central ideal without fixed types is insufficient. | Import arithmetic finiteness with all its bounds. |
| `adelic-classical-bijection` | 3.1 | GL₂/ℚ has one component; GL₁ with class number >1 has several; repeated representative forces diagonal compatibility. | Actual stabilizers and distinct double cosets; inverse gluing is named. |
| `automorphic-forms-module` | 3.2 | Constants fixed; central logarithm has a two-dimensional translation span. | Full real group acts on smooth globalization, not generally the compact-finite carrier. |
| `automorphic-representation` | 3.2 | Trivial representation occurs once; arbitrary infinite central sum fails Z-finiteness; E(t)=t requires first jet. | Irreducible admissible subquotients and actual occurrences; Eisenstein finite jets explicitly provide the constituent realization. |
| `restricted-tensor-product` | 3.4 | Empty stage ℂ; finite stage ordinary tensor; zero reference vector kills transition tensors. | Nonzero reference vectors and actual directed tensor maps, no infinite completed tensor by default. |
| `spherical-dimension-one` | SmoothRepresentations 4; 3.5 | Spherical fixed line is dimension 1; ramified fixed space is zero. | Reuse local spherical theorem; no zero reference vector at a bad place. |
| `flath-factorization` | 3.5 | Hecke character factors; conductor distinguishes ramification; rescaling a spherical vector changes display only. | Flath needs admissible simple module and almost-everywhere spherical lines; spreading theorem is a separate target. |
| `nongeneric-automorphic` | 4.3 | Trivial split GL₂ is automorphic and nongeneric; cuspidal GLₙ has injective nonzero Whittaker expansion. | Separate genericity from automorphy and cuspidality; general reductive groups are not assigned GLₙ genericity. |
| `holomorphic-sl2-forms` | 4.4 | Rank-one coefficients and two real places; central −1 parity; vanishing lowering operator. | Totally real, coefficient-valued holomorphy and finite level; no boundedness assumption excluding Eisenstein forms. |
| `unipotent-quotient-compact` | AdelicAlgebraicGroups 2–3 | N=1 quotient is a point with mass 1; additive quotient has probability measure. | Import arithmetic unipotent compactness and normalized quotient measure. |
| `constant-term` | ALS F.6; 4.1 | P=G gives identity; constants have constant term 1; empty proper-parabolic index is vacuous. | Reuse CT carrier; add module/Hecke compatibility and actual proper-parabolic kernel predicate. |
| `constant-term-transitivity` | 4.1 | P=G boundary; nested unipotent integrals give same constant 1; conjugation transports subgroup. | Compatible quotient measures, Fubini and actual parabolic nesting. |
| `cusp-form` | ALS F.6; 4.1 | Zero form is cuspidal; nonzero proper constant term excludes it; anisotropic index empty. | Reuse cusp space and require all proper rational parabolics. |
| `anisotropic-cuspidal` | 4.2 | Torus constants cuspidal; split GL₂ constants not cuspidal. | Anisotropic modulo centre means no proper rational parabolics; central growth is separate. |
| `cusp-form-rapid-decay` | ALS F.6; 4.2 | Zero function; anisotropic torus constant has no decay in full norm direction. | Import rapid decay modulo the specified centre, not on a noncompact central orbit. |
| `cusp-forms-square-integrable` | ALS F.6; 4.2 | Unitary torus character has infinite full central integral but finite central quotient norm. | Central quotient or specified weighted positive twist is necessary. |
| `cuspidal-spectrum-discrete` | ALS F.6; 4.2 | Zero cusp space; finite multiplicity occurrence; noncuspidal constants not added to cusp spectrum. | Import cuspidal Hilbert direct sum; do not duplicate a full spectral theorem. |
| `cuspidal-automorphic-representation` | 4.2 | Constants on anisotropic torus; GL₂ cusp realization; zero module not an occurrence. | Keep actual closed embedding plus its smooth/compact-finite comparison. |
| `sl2-generation` | 4.4 | Field elementary matrices; inversion exchanging upper and lower unipotents; central parity. | Generation is over the specified coefficient field/group, not a blanket integral congruence assertion. |
| `sl2-fourier-vanishing` | 4.4 | Unit-index criterion plus holomorphic Fourier expansion; zero and Eisenstein constant term controls. | Retain exact coefficient, invariance and unit-index hypotheses of Zhang; not generic vanishing of one Fourier coefficient. |
| `maass-cusp-forms` | 4.5 | Zero function; λ=0 excludes nonzero cusp form; exceptional imaginary parameter allowed but not asserted to exist. | K-Bessel expansion includes the source factor two; numerical dataset example is an input, not a certified existence proof. |
| `algebraic-weight` | ALS F.7; LieHighestWeight; 5.1 | GL₂ (2,0) dimension 3, central weight 2, dual (0,−2); rank zero trivial. | Import algebraic weights and representations; integral lattice is group dependent. |
| `infinitesimal-character-of-weight` | LieHighestWeight 7/9; 5.1 | sl₂ weights m and −m−2 same dot orbit; nonzero highest-weight dominant representative unique. | Use λ+ρ and full reductive centre, not nondegenerate Killing form directly on glₙ. |
| `c-l-algebraic` | 5.1 | GL₁ ρ=0; GL₂ half shift gives (1,0); SL₂ versus PGL₂ character lattices. | C/L algebraicity is general reductive; twisting element existence is an extra hypothesis. |
| `cohomological-representation` | ALS F.7; 5.2 | Zero coefficient gives no cohomology; GL₁ raw degrees 0,1 versus central quotient degree 0. | Extend to specified compatible finite-dimensional coefficients, while arithmetic predicate remains algebraic. |
| `wigner-lemma` | ALS F.7; 5.2 | D_k(μ): a−b=k−2 and a+b=−μ; D₁ gives no ordinary algebraic coefficient. | Duality and full central-character matching, with balanced central quotient only. |
| `l0-q0-invariants` | 5.3 | PGL₁ (0,0), real PGL₂ (1,0), imaginary-quadratic PGL₂ (1,1), real PGL₃ (2,1). | Use absolute ranks; distinguish rational split centre from full real split centre. |
| `borel-wallach-tempered-range` | 5.3 | Tempered PGL₂ degree 1; non-tempered trivial module degrees 0,2; compact group only degree 0. | All-degree theorem for connected compact component; full K takes component invariants, not unchanged binomial multiplicity. |
| `vogan-zuckerman` | 5.4 | q=g gives unitary character; compact p=0 only degree 0; zero/mismatched coefficient gives zero. | Actual integrating Levi character, adapted coefficient, derived induction and all-degree formula. |
| `gln-tempered-cohomological` | 5.5 | n=1 trivial/sign actions; n=2 D₂ has two SO(2) degree-one classes; raw centre adds degree two. | Full-group versus connected-component distinction and odd/even classification retained. |
| `clozel-purity` | 5.5 | D₁₂ cohomological raw weight −10, Clozel weight −11, twist +5; unitary raw 0 corresponds to Clozel −1. | Correct shifted weight convention; purity is algebraic cuspidal theorem, not arbitrary Maass Ramanujan. |
| `hermitian-positive-system` | 6.1 | SL₂ tangent weights ±2; GSp₄ tangent dimension 3; compact case tangent 0; two-factor product. | Move Hermitian datum here; quotient full real split centre, distinct from rational A∞. |
| `coherent-relative-cohomology` | 6.2 | D_k+ coefficient −k in degree 0; D_k− coefficient k−2 in degree 1; at k=1 coefficients coincide. | Actual parabolic Lie pair and balanced centre; coherent is not ordinary relative cohomology. |
| `gsp4-discrete-series` | 6.3–6.4 | Weights (4,2), (2,2), (1,2) distinguish noncompact/compact walls; split (3,2;0) gives compact (3,2;5). | Keep group character lattice, central rho coordinate, all three noncompact walls and component restriction. |
| `bhr-coherent-cohomology` | 6.5 | Holomorphic degree 0 versus antiholomorphic degree 3; generic limits degrees 1 and 2. | Harris formula dualizes representation; apply dual parameter before counting degree. |
| `mirkovic-tempered-coherent` | 6.5 | Compact irreducible gives coefficient-matching invariants; trivial noncompact representation not tempered. | Tempered converse is component theorem, with nondegenerate limits and central balance. |
| `bhr-large-weight` | 6.6 | (20,10) pairings 11,19,27,8 pass R=5; (12,12) fails; (12,2) passes with zero; equality at 5 fails. | Separate global large-weight, sign-corrected singular essentially-unitary local, and local lowest-weight statements. |
| `harris-limits-gsp2g` | 6.7 | g=1 lengths 0,1; g=2 lengths 0,1,2,3; g=0 separate torus. | Parameter and Weyl representative retained, not identified with length; every degree and no slope restriction. |
| `holomorphic-ds-sp2n-unn` | 6.8 | Sp₂ k=2 regular, k=1 limit; Sp₄ k=3 regular; U(1,1) k=1 and U(2,2) k=2 regular half-integers. | Positive rank bounds differ between symplectic and unitary cases; n=0 separate trivial representation. |
| `coefficient-lattices` | 5.6 | Zero rank lattice is full; rank-one zero lattice is not; nonprincipal O_E ideal need not be free. | Adelic lattice family, component transport and integral spreading; no global rational-group stable lattice. |
| `rationality-field` | 5.7 | Trivial character ℚ; order-m character ℚ(ζ_m); quaternion irreducible rational character with Schur obstruction. | Distinguish rationality field and actual model; never twist topological infinity action by discontinuous automorphism. |
| `clozel-rationality` | 5.7 | GL₂ cohomological Hecke field ℚ(a_n); GL₁ transcendental uniformizer value gives ℚ(t). | Exact GLₙ descent separate from arithmetic finiteness; general reductive theorem requires explicit rational admissible cohomology summand. |
| `torsion-hecke-eigenclasses` | 5.8 | Zero coefficient has no class; F₂ identity system with class 1 exists; class 4 mod 8 does not determine scalars. | Require nonzero class, unital Hecke character and nonzero image under transport; finite-field kernel maximal without surjectivity. |
| `gl1-dictionary` | 7.1 | Trivial torus character cuspidal but not full-centre L²; log norms at e and e² add to 3. | Reuse Hecke characters; general automorphic functions also have generalized-character polynomial factors. |
| `gl2-classical-to-adelic` | 7.2 | Positive scalar gives t^k t^(−k)=1; clockwise rotation yields e^{ikθ}; lowering kills holomorphic vectors. | Actual adelization, inverse and growth bounds; no blanket cusp-only dictionary. |
| `gl2-dictionary` | 7.2 | k=1,2,12 Casimir −1/4,0,30; Eisenstein constant term nonzero; odd trivial-nebentype parity obstructs. | Weight-raising factor 2i fixed; include limits and noncuspidal forms. |
| `gl2-hecke-normalisation` | 7.3 | Delta at p=2: raw −3/4 times 32 equals −24; diamond i tests inverse. | One Haar/convolution convention; distinguish raw, unitary-normalized and cohomological eigenvalues. |
| `algebraic-modular-forms` | 7.4 | Zero module gives zero; one class gives coefficient invariants; level scalar 2 acts by inverse 1/2; q=1 count 2 only polynomial. | Two explicit coefficient conventions, potentially infinite p-adic action, weighted sums requiring semigroup extension. |
| `algebraic-modular-forms-structure` | 7.5 | C₂ sign invariants over ℤ vanish, mod 2 become F₂; trivial action does commute with reduction. | Smallness or invertible stabilizer order required for arbitrary base change; ideal class number, not type number. |
| `transport-compatibilities` | 7.7 | Product with trivial group; slice ranks 0,1,2; product cusp with noncusp; GL₂=(Gₘ×SL₂)/μ₂ not direct product. | Finite-dimensional slices and evaluation-matrix coefficient extraction prove the factors automorphic; abstract finite-corner factorization alone does not. Compatible character needed for finite-central descent; no inner-form equivalence. |
| `absolute-lie-cochain-complex` | ALS F.5 | Zero coefficient and rank-zero algebra; degree-one sl₂ bracket −1. | Reuse absolute all-degree complex; no second construction. |
| `kostant-parabolic-cohomology` | ALS 4.5 | Zero nilradical, rank-one Weyl alternatives, full central weight. | Reuse Kostant and its characteristic-zero splitting/descent; no char-p Weyl decomposition. |
| `finite-corner-tensor-factorization` | 3.4 | M_r⊗M_s standard module dimension rs; nonsimple diagonal character matrix rank 2 not exterior tensor. | Simplicity plus finite-dimensional nonzero corner, not arbitrary commuting modules. |
| `archimedean-hecke-algebra` | 3.3 | G∞=K collapses enveloping balance; circle projectors orthogonal; finite projector sum not global identity. | Actual compact-supported distributions and balanced multiplication; reuse compact projectors. |
| `normalized-real-parabolic-induction` | 2.3 | SL₂ half modulus at t=2 is 2 versus inverse 1/2; P=G and zero module. | One normalization shared by all real induction statements. |
| `central-translation-finiteness` | 3.2 | Constant span 1; log norm span {1,log}; infinite central-character sum fails finiteness. | Finite-dimensional joint generalized characters, not semisimplicity of all central translates. |
| `central-character-algebraic-modular-forms` | 7.6 | Real quadratic Gₘ central class set singleton; scalar 1 versus −1 kills field values but not 4 mod 8. | Separate central-character carrier with overlap compatibility and effective stabilizers; ring cancellation needs injectivity. |
| `local-stable-lattice` | 5.6 | n=0 zero lattice; n=1 zero not full; pL full at p=2; noncompact diag(p^m,1) has no stable full lattice. | Lean local target explicitly ℚ_p/ℤ_p; separately register arbitrary nonarchimedean local-field version using uniformizer. |
| `gl2-algebraic-weight-model` | 2.6; LieHighestWeight | GL₂ (2,0) dual (0,−2); determinant adds twice its exponent; degree-zero representation allowed. | Use existing algebraic representation carrier, only coordinate specialization is new. |
| `cohomological-with-coefficient` | 5.2 | Zero B; GL₁ raw exterior degrees; D_k central compatibility; nonalgebraic coefficient allowed in generic adapter. | B is compatible finite-dimensional group/Lie module, not arbitrary unrelated Lie module. |

## Added adapters and Lean signatures: scope and variable audit

Every Lean declaration was read with its actual section variables. In particular no compactness is accidentally inherited by `IsKFinite`, no centrality is accidentally inherited by the bare function equation, and no arithmetic meaning is assigned to the abstract constant-term index or abstract rational/finite group homomorphism without the specialization contracts.

| Statement / definition | Cases evaluated | Result / change |
| --- | --- | --- |
| `HasModerateGrowth` | Empty domain, zero function, arbitrary constant, height one on ℝ, exponential with polynomial height. | Empty/zero pass; constants use exponent zero; x and exp(x) give distinct negative controls. Exponent type is nonnegative real in both files. |
| `moderateGrowth_iff_of_comparable` | h=h′=1; constants C<1 or C=1; zero exponent; two reciprocal polynomial bounds. | Need h,h′≥1, positive comparison constants, nonnegative powers. Composing bounds gives power MN and coefficient C^N; no zero/negative-base power inference. |
| `moderateGrowth_rightTranslate` | y=1, f=0, constant f, multiplicative torus character. | Factor H(y)^N is absorbed into the nonnegative bound; H≥1 prevents invalid power monotonicity. |
| `IsLeftInvariant`, `leftInvariant_rightTranslate` | Γ bottom/top; constant and arbitrary f. | Bottom imposes nothing, top implies f(g)=f(1); left subgroup unchanged after right translation. |
| `IsLevelInvariant`, `levelInvariant_rightTranslate` | J bottom/top; noncommuting S₃ conjugations. | Correct subgroup is yJy⁻¹. Opposite conjugation fails the explicit example. |
| `HasCentralCharacter` | Zero f, constants, nonzero evaluation, arbitrary subgroup versus actual central specialization. | Zero satisfies every character; a nonzero value permits cancellation over ℂ. Centrality is needed for representation compatibility, not for typing the bare equation. |
| `rightTranslate`, `rightTranslate_mul` | Identity parameter; arbitrary evaluation; S₃ swaps in both orders. | R(y)R(z)f(g)=f(gyz); no abelian-group hypothesis and no inverse parameter. |
| `IsKFinite`, `kFinite_of_finiteDimensional` | Zero vector; trivial action in infinite dimension; finite-dimensional action; regular delta on ℤ. | Spans have dimensions 0, at most 1, finite, and infinite respectively. Analytic compactness belongs to specialization only. |
| `IsCuspidalFor` | Empty index, all zero maps, one map with nonzero value; zero domain/codomain. | Empty condition and zero maps are vacuous; one nonzero term excludes the vector. The arithmetic index includes all proper rational parabolics. |
| `CoefficientLattices.LocalStableLattice`, `exists_localStableLattice` | n=0, n=1, p=2, pL, integral matrices, noncompact powers diag(p^m,1). | Zero lattice full only at n=0; pL full since p≠0 in ℚ_p. Compact orbit lies in a common p⁻ᵐ standard lattice, whose ℤ_p-submodule is finite-generated. Noncompact subgroup counterexample prevents dropping hJ. |
| `TorsionEigenSystem`, `.maximalIdeal` | Zero module, F₂ scalar class 1, c=4 mod 8, proper finite subfield image. | Nonzero class is data; no uniqueness assertion from a nonfaithful class. Finite integral-domain image is a field, hence maximal kernel without surjectivity. The additional polynomial-ring injection example has source F₂, so its kernel is maximal despite infinite codomain. |
| `CoherentWeights.corootValues` | (3,1), (19,8), (11,0), dual (−1,−3). | Values (2,3,4,1), (11,19,27,8), (11,11,11,0), (2,−1,−4,−3); long coroots have no extra two. |
| `CoherentWeights.Separated` | R=5 with (19,8), compact-near-wall (11,10), noncompact wall (11,0), equality (5,0), zero point. | Interior and permitted zero pass; small nonzero or equality fail. Zero point is allowed by this predicate alone; compact regularity is a separate hypothesis of representation classification. |
| `CoherentWeights.hcParameter` | (4,2), (2,2), (1,2), (20,10). | (3,0), (1,0), (0,0), (19,8); asymmetrical shifts are required. Central coordinate deliberately not claimed to be encoded in the pair. |
| `separated_of_weight_gaps` | l=2; l>R+2; all four coroot evaluations. | k−l>R+2 makes x−y=k−l+1>R; x and x+y also exceed R; y is zero or >R. R>0 retained. |
| `weight_gaps_of_separated` | k=l, l=2, l>2, R>2. | Compact evaluation k−l+1≥1 cannot be zero, so >R and k−l>R−1. l>2 gives y=l−2>R; k=l is correctly impossible. Bounds are implications with adjusted constants. |
| `IsAlgebraicModularForm` | Zero f, trivial coefficient constant m, nonfixed constant m, trivial group, zero ring/module. | Zero and invariant constants pass; a rational action moving m fails. Works over arbitrary commutative A without assuming field cancellation. |
| `algebraicModularForm_ext` | Empty representative family with/without cover; singleton/trivial group; repeated representatives; zero module. | The actual cover supplies a decomposition for each g; both covariance equations transport equality. Empty cover cannot exist for a group. No finiteness/independence assertion follows from ext alone. |
| Additional `localExactDescent`, `glFinitePart_exactDescent` | GL₁ transcendental unramified character; trivial character; arbitrary nonalgebraic finite part; quaternion group negative control. | Exact-field GLₙ descent has no arithmetic finiteness conclusion. Generic multiplicity-one/rational local classification is a named construction target; it is not inferred from Schur's lemma for arbitrary groups. |
| Product `coefficientSlice`, `finiteTypeSliceDecomposition`, `automorphicProduct_factors` | Zero form; separated product; independent two-term sum; trivial factor; central unit ideal. | Slice ranks 0,1,2 are computed; cofinite central ideals restrict to cofinite ideals in each factor. Harish-Chandra finiteness and a separating evaluation matrix produce actual automorphic coefficients. Unit ideal leaves only zero. Finite corners then track automorphic factor subquotients. |
| Minimal `DiscreteOccurrence` | Zero space, torus constants, noncuspidal full spectrum. | Contains a nonzero irreducible closed subspace and its embedding. No complete spectral decomposition is hidden in this definition. |
| `eisensteinFiniteJetRealization` | Family E(t)=t at t=0; E(t)=0; varying finite type/level. | First jet detects constant base section for t, zero-jet does not; identically zero map fails generic detection. Finite jet order is chosen for the specified finite-dimensional family and its holomorphic denominator. |
| Coherent central balancing | Weights 1 and −1 versus 1 and 1; full real split centre versus rational diagonal centre. | Sum zero permits quotient; sum two does not. Product split centres are retained factorwise. |
| Level/rational algebraic-modular-form transport | Scalars γ=2,g=3 acting on value 6; inverse versus direct level action. | 3⁻¹2⁻¹(2·6)=2, while 3⁻¹2(2·6)=8. Weighted trace at index one is identity. |
| Stabilizer/effective-stabilizer and central overlap | C₂ sign on ℤ/F₂, trivial action, central scalars ±1 on 4 mod 8. | Averaging requires invertible order, smallness trivializes actual stabilizers; scalar cancellation over a ring requires an injective difference. ψ(z)ψ(u)=ψ(γ)⁻¹ is the overlap condition. |

The generic predicates do not promise the missing analytic carriers: no arbitrary height is silently a proper adelic height; no arbitrary list of linear maps is silently the arithmetic constant term; no arbitrary abstract group map is silently a rational/finite adelic embedding. All those constructions and their hypotheses are explicit README targets or supplier contracts.

## Convention witnesses

Each listed calculation occurs as a README Check and a Lean `example`. The numerical examples prove the displayed arithmetic; the analytic constructions they test remain roadmap targets.

| Convention | Distinguishing computation |
| --- | --- |
| Right-translation order / level conjugation | Noncommuting S₃ swaps send 0 to 1 versus 2; yJy⁻¹ passes and y⁻¹Jy fails. |
| Convolution compact idempotent | Volume two: (1/2)²·2=1/2 versus 1²·2=2. |
| Integration-by-parts / principal anti-automorphism | Gaussian against the linear function gives opposite derivative signs; scalar dual 2 becomes −2; matrix XY has (0,0)-entry 1 whereas YX has 0. |
| CE bracket / cup sign | dω(X,Y)=−1 versus reversed +1; odd swap (−1)¹=−1 versus degree-zero swap +1. |
| Group coboundary | Sign zero-cochain gives −2 versus trivial 0; square function at (1,2) gives −4. |
| Normalized real induction | sqrt(2²)=2 versus 2⁻¹=1/2. |
| Compact isotypic projector | Dimension two times orthogonality integral 1/2 gives 1; reciprocal dimension gives 1/4. |
| Weil nonsplit relation | (−2)·2=−4 versus 2·2=4. |
| GL₂ ladder / Casimir | Lowest lowering coefficient (2−2)/2=0; raising (2+2)/2=2; Casimir at k=1,2,12 is −1/4,0,30. |
| Highest-weight dual / centre | (2,0) dualizes to (0,−2), not (−2,0); weights 1+(−1)=0 versus 1+1=2. |
| C/L twist | Half determinant shift sends (1/2,−1/2) to (1,0), not a shift of only one coordinate. |
| Purity twist | Raw −10 plus 2·5 is 0; inverse twist gives −20; Clozel weight is −11 for n=2. |
| Hodge splitting / tangent coefficient | R⁺=1,R⁻=0 gives (1,0), exchanged to (0,1); tangent weight 2 cancels −2, not +2. |
| Coherent rank-one coefficient | −k versus k−2: unequal at k=2, equal at k=1, in degrees zero versus one. |
| GSp₄ rho / character lattice | Positive root sum (4,2;−3) gives rho (2,1;−3/2); compact parity c≡a+b mod 2. |
| Minimal K-type | (2,1)+(3/2,3/2)−(1/2,−1/2)=(3,3); adding compact rho gives (4,2). |
| Coherent parameter / dual / degree | (4,2;−3) gives coefficient (−2,−4;0), dual parameter (0,−3;0); chamber i maps to 3−i. |
| Component extension | Two positive exchanges square to +1; changing one sign gives −1. |
| Root wall / separation | Pairings at (19,8), (11,0), equality bound (5,0); strict versus weak inequality differs. |
| Bessel differential equation | At the selected half-order solution, 11/4−3/2−5/4=0 but replacing the ν² sign gives 1/2. |
| Scalar unitary regularity | U(1,1) weight one gives (1/2,−1/2), two distinct coordinates. |
| GL₂ adelization / raising | t²t⁻²=1; split-basis raising identity yields kf+2if′; 2i·(2/(2i))=2. |
| Hecke / diamonds | Delta: 32·(−3/4)=−24; i⁻¹=−i and (−i)⁻¹=i. |
| Coefficient transport / level | 3⁻¹2⁻¹(2·6)=2 versus 8 with the wrong inverse; 2⁻¹·6=3. |
| Residual signs / ring cancellation | −1 acts as +1 on 1 mod 2, but not over ℤ; 4 mod 8 survives unequal scalars. |

## Validation and completion

- `lean-check research/blueprint/packages/AutomorphicFormsOnReductiveGroups/Suggested.lean`: exit 0 on the final 564-line file. Exactly 38 warnings, all `declaration uses sorry`; no other warning and no error. The 12 definitions and the eigenclass structure have actual bodies. All displayed numerical convention witnesses elaborate with their included proofs. Some generic predicate examples and theorem signatures deliberately use `sorry` as permitted by the package shape.
- The final companion imports `Mathlib` and the used Tau Ceti GL₂ degree module; one module docstring, the required namespace, `theorem` rather than `lemma`, no `#print axioms`, no invented heavyweight carriers.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`: exit 0, 0 errors, 0 warnings (100 nodes, 311 API entries, 214 tests, 30 planets). This checks the unchanged input, not an assertion that its original prose needed no correction.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: exit 0, 0 problems. The staged whitespace check also passed.

No package work is left for a checkpoint successor. Independent package review should assess the mathematical targets, supplier interface against the same-bundle package, and the source-correction notes above. No higher-tier package or external roadmap was edited.

The analytic constructions and deep classification theorems in the README remain implementation targets. The original Blasius–Harris–Ramakrishnan and Mirković proofs were not inspected; their theorem statements were checked in Harris’s numbered survey statements, with that source boundary explicit. The supplied Harish-Chandra finiteness, Kostant and foundational automorphic interfaces remain dependencies on the same-bundle package. The unchanged input’s recorded gaps are not marked closed by the input validator or by the companion’s elaboration.

## Public source retrieval manifest

Access date for every entry: **2026-10-17**. SHA-256 identifies the public PDF used for the statement/locator checks and targeted reading, rather than certifying that every proof in each work was audited. Only bibliographic identifiers and hashes are retained; source files and extracted passages are excluded from the submission. The cleared nonpublic sources were read in place and are not part of this download manifest. Unused Vogan and Franke downloads were not used as proof authorities in the package.

| Source | Retrieval URL | SHA-256 |
| --- | --- | --- |
| `badulescu-renard` | [PDF](https://www.cmls.polytechnique.fr/perso/renard/juinBR.pdf) | `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88` |
| `bcg25` | [PDF](https://arxiv.org/pdf/2309.15944v3) | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |
| `bcgp21` | [PDF](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| `bcgp25` | [PDF](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| `bernstein-kroetz` | [PDF](https://arxiv.org/pdf/0812.1684v3) | `f5f2e79d87532c9ac46389d7eb1606e0301eac0ba7c7972ab628e278e091ca3e` |
| `boxer-pilloni` | [PDF](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf) | `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6` |
| `bpcz22` | [PDF](https://arxiv.org/pdf/2007.05601v1) | `5c23180ed16b06a514a86b24d3cc9643ef4a4a4292af4b7b72c5dbf714a5483e` |
| `buzzard-gee` | [PDF](https://arxiv.org/pdf/1009.0785v3) | `52e4f5bf0215a7c0833cb6429552716c85ccbd67761e29d9cae61c42a038853d` |
| `casselman-sl2` | [PDF](https://personal.math.ubc.ca/~cass/research/pdf/Irr.pdf) | `1e6427e91f3c38d3ab743eccb67af39dc20ac15564c21bf4010c47e2747e4a89` |
| `cg18` | [PDF](https://arxiv.org/pdf/1207.4224v2) | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |
| `cg20-appendix` | [PDF](https://arxiv.org/pdf/1907.08694v1) | `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed` |
| `cg20` | [PDF](https://arxiv.org/pdf/1907.08691v1) | `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059` |
| `chenevier-taibi20` | [PDF](https://arxiv.org/pdf/1907.08783v1) | `81b7fe2c31d0ab4ac7465c7d5209611638fa0d8c7c4ff11f7f4746866491742c` |
| `clozel-volume1` | [PDF](https://www.jmilne.org/math/Books/AA1988a.pdf) | `ed6ec30fc1f53f7c8ac4276ef449e1cad3ab42457bf5b7ee90a33413345ff96c` |
| `cogdell-pcmi` | [PDF](https://people.math.osu.edu/cogdell.1/pcmi-www.pdf) | `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a` |
| `ding25` | [PDF](https://arxiv.org/pdf/2407.21237v2) | `a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8` |
| `dit16` | [PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| `getz-hahn` | [PDF](https://sites.math.duke.edu/~jgetz/aut_reps.pdf) | `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac` |
| `harris90-survey` | [PDF](https://www.jmilne.org/math/Books/AA1988b.pdf) | `ead5b841dbafb65c1796f8dc7d4f331271947b63b3ef2923efa1cdadf5bff62d` |
| `hr` | [PDF](https://arxiv.org/pdf/1405.6513v2) | `1d3af2de1c1a370dc339e10c74cda84f5e6f5b25c09810bfdf8bbbbc8df6ca06` |
| `jiang-zhang20` | [PDF](https://arxiv.org/pdf/1508.03205v4) | `d97bf3048aa10de52f07ae5bbbc3970c974996ae4193d9cd7f12b17890df7bb4` |
| `knapp94` | [PDF](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf) | `684de4bcfc50e448fe52fddc863392012581b43097f40f8bcc4c83dbc5a2dfbb` |
| `kostant61` | [PDF](https://people.tamu.edu/~jml/kostant61.pdf) | `72c2799109e38d68c0095347a4831df88e20a71d11ae14500a7102e9a60b35fd` |
| `pitale-schmidt09` | [PDF](https://arxiv.org/pdf/0809.0482v1) | `5110b60550eac671f721b748fbd05798ceac9f337471f4c5dc95b56be5c9332d` |
| `vogan-zuckerman` | [PDF](https://www.numdam.org/item/CM_1984__53_1_51_0.pdf) | `ccaaf5ad243ccb85d3db629ff7677ca5b80b7e2d71e502d21fa1b773863b78a4` |
| `wockel-vanest` | [PDF](https://arxiv.org/pdf/1401.1037v1) | `e2b911da78c856e1399e6527b2eabf3ccacf47f689257c6197f6b4ace014f4a2` |
| `zhang21` | [PDF](https://arxiv.org/pdf/1909.02697v3) | `f58b275c97b2675123f44994c91fde9406d6928f6d659b7b8a0f196112d3f61c` |
