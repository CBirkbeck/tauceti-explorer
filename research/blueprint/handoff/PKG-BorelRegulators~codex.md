# Handoff: PKG-BorelRegulators~codex

Issue: #10744. Worker: Codex (GPT-6), session `codex-hHK7dv`. Date: 2026-10-19.
Claim confirmed by the bot in [the claim reply](https://github.com/CBirkbeck/tauceti-explorer/issues/10744#issuecomment-6270847808).

## Delivered

The package has an eight-layer README, a compact Suggested.lean and `topic = "math.KT"` metadata. It packages the 56-node accepted plan without changing the packet, reader, atlas or earlier suggested file. The new order separates the compact-fibre comparison from the period theorem: comparison is in §5.5, the measure/cycle construction in Layer 6, and the determinant theorem in Layer 7. All retained targets state hypotheses, source locators and dependencies. Definition sections give named API and discriminating Checks. No claim is made that this mathematics has been formalised.

The README gives the complete mathematical targets; the Lean file deliberately contains only four real-bodied light definitions, milestones whose carriers exist at the pins, and examples. The heavy objects and comparisons are named in the closing comment. There are no sorry-defined carriers, placeholder predicates, auxiliary theory developments or private replacements for existing matrix/lattice APIs.

## Limits and the eight accepted-plan gaps

1. **Carriers missing at the pins.** Keep their full mathematical definitions, API and Checks in the README; do not invent Lean types with sorry. Four light definitions remain executable expressions: archimedeanTarget, tateProjection, traceCocycle and normalizedLeadingCoefficient. Generalities are explicit: the target submodule permits arbitrary c; coordinate results require a finite involution; trace cocycle theorems require j≥2; analytic factor results state analyticity, with a nonzero residual factor only for nonvanishing.
2. **Borel–Serre boundary and Steinberg duality.** §1.5 states the boundary/building, finite triangulation, split-central quotient, orientation and duality targets locally, using Quillen's proof and Putman–Studenmund Theorem C/Proposition 2.1. Compactness alone is not substituted for these inputs.
3. **Compact symmetric dual.** §3.1 states the quotient of a chosen compact integration, its pair, cohomology comparison and functoriality. LieGroups' compact form alone is not claimed to contain it.
4. **Complete-manifold analysis and constants.** §§3.4–3.6 state integrable Stokes, exact-L² harmonic vanishing with an L² primitive, Casimir/convolution regularisation, the logarithmic resolution and root estimates. Matsushima and Kaneyuki–Nagano were actually read for the constant. The factor A=a_min/2 and curvature contraction R_iklj are fixed by the SL₂ trace-free witness. These replace the accepted plan's unread-table qualification.
5. **Weil's Tamagawa proof.** §6.2 states τ(SL₁D)=1 with Borel Proposition 2.4's explicit application of Weil. The original Weil proof was not read and is not described as decomposed or independently verified. The only consequence needed is nonzero rationality. A reviewer wishing to close that original source gap still needs the measure-compatible division-algebra argument in a cleared or public copy of Weil; compactness/positivity is insufficient.
6. **Bloch's book pairing.** The book is not a cleared source in the supplied library index, and no other copy was used. The exact Bloch-specific pairing assertion is unsupported and is not claimed. §6.6 instead defines the intrinsic Borel/Tamagawa pairing with its full measure-change identity. Recovering the book comparison requires the book's actual primitive homology, coefficient and local measure definitions; generic rescaling cannot supply them.
7. **Bott/suspension and infinitesimal Chern–Weil/van Est.** §§2.2,4.4,8.2 give these as local targets, using Burgos §§4.4–4.6, Theorems 8.12/8.15 and Lemma 10.10/Proposition 10.11. Deligne regulator is defined independently before the factor-two theorem. Its cone, compactification comparison, universal Betti lift and evaluation maps are stated.
8. **Exact Bloch–Wigner scalar.** §8.5 gives a common nonzero real scalar only, just as the accepted plan's body supports despite its stronger title. Its exact sign/value and rational/π factors in these Tate coordinates were not evaluated. Exact coefficient conversion is explicitly a target requiring transport through Goncharov's displayed universal comparisons and Suslin orientation; no guessed rational scalar is asserted. Downstream exact formulae need that computation. The all-weight Borel/Beilinson scalar 2 is separately sourced and is unaffected by this limit.

These are source/support limits, not claims that all eight original gaps have been proved closed. In particular the Bloch-specific comparison and the exact λ computation remain unsupported numerical inputs. The package preserves the supported Borel rank, full lattice, zeta proportionality and all-weight factor-two targets without depending on either guessed normalization.

## Ownership and moved-down inputs

BorelRegulators is outside the 94-roadmap Caraiani–Newton order. Existing Tau Ceti roadmaps are consumed directly; no invented same-tier bundle is used. References to FoundationsAndLibraryIntegration, UPSTREAM ids and atlas stage ids have been replaced by actual supplier contracts.

The following notions needed before a later consumer are local targets, rather than upward citations: boundary/Steinberg/orientation refinement (§1.5); all-degree discrete and quotient/Lie comparison (§§2.1–2.2); stable Hopf and filtered-union/indecomposable duality (§2.4); compact symmetric pairs (§3.1); complete-L² analysis and logarithmic growth (§§3.4–3.6); plus/Q, H-space cover, rational Hurewicz and Quillen finite generation/localisation (§§3.9–3.12); topological Chern character, suspension and Bott (§4.4); finite-projective transfer and higher Adams operations (§§4.8–4.9); Brauer index/division-representative facts beyond the supplied reciprocity interface (§6.1); the independent Deligne and weight-two Suslin/Bloch interfaces (§§8.2,8.5). ArithmeticKTheory, MotivicEtaleKTheory, ArithmeticLocallySymmetricSpaces, the automorphic analysis roadmaps, K3BlochGroups and Polylogarithms should share these owners rather than define them again.

The 2026-10-19 Tate rule is observed: no Tate theorem is restated, reproved or cited by theorem number. The Dedekind functional equation is a trivial finite-order-character instance of LFunctions and ArithmeticGaloisRepresentations §2.7. Only normalization comparison and consequences at integers are targets here. All-unitary alternatives are named at their actual owners.

## Duplication audit and removals

Read-only current TauCetiRoadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current Tau Ceti library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Elaboration baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No builds or updates were run in the read-only upstream environment.

Searches used mathematical objects and statements, not just proposed identifiers. Every section's object family is covered by the audit below and the adversarial table.

| Existing object family | Supplier inspected | Package action |
|---|---|---|
| Order complexes, chain faces and induced maps | TauCeti AlgebraicTopology/SimplicialComplex/OrderComplex | Remove generic building/order-complex redefinition. Keep only proper division-subspace specialization and new topology; import and #check actual API. |
| Continuous cochain restriction, identity and composition | Mathlib ContCohomology/Functoriality | Remove private generic restriction declaration; supplier contract cites actual pullback. |
| Explicit discrete H⁰,H¹,H² comparison | TauCeti GroupCohomologyIso; current ContinuousCohomologyIso | Keep genuinely all-degree chain comparison only. The current additional comparison is degree zero, not the all-degree result. |
| Exact/split K₀ and exact-functor maps | Pinned and current TauCeti CategoryTheory/GrothendieckGroup/{Exact,Split}; current GrothendieckEulerForms | Add explicit supplier declarations ExactK0, of_conflation, liftEquiv, map, fromSplitEquiv and SplitK0. Remove wording that could imply constructing K₀ anew; new targets are higher Q/plus and their comparisons. |
| Ordinary primitive elements | Mathlib Bialgebra.IsPrimitiveElem | Cite existing coalgebraic condition. New graded compatibility includes Koszul signs and stable block construction. |
| Forms, exterior differential, Stokes, de Rham/integration, volume | Current DifferentialGeometry Layers 5,6,8,12 | Remove generic geometry construction targets. Keep complete noncompact integrability, arithmetic quotients, relative Lie and cusp refinements. |
| Generic matrices, bases, determinant changes, covolumes and full lattices | Mathlib Matrix.det/LinearMap.toMatrix/ZLattice; current IntegralLattices | Remove private generic regulator-matrix, covolume and embedding-matrix wrappers from Lean. Keep only actual regulator/embedding-map specializations in prose. |
| Strict integer part | Native ceiling minus one | Remove auxiliary strict-floor definition. |
| Gauge measures, finite-place SL_e point-count volume | Current AdelicAlgebraicGroups §2.4 | Delete accepted local-sl-volume target and Lean theorem; cite supplied formula, including q=2,e=2 and e=1 tests. |
| SL₁(D), anisotropic quotient compactness and measure/restriction conventions | Current AdelicAlgebraicGroups §§2.5,3.4 | Delete repeated group construction and compactness targets. Keep exact τ, signed restriction-of-scalars form, cycles and primitive periods. |
| Neat subgroups, strong approximation and cover indices | Current AdelicAlgebraicGroups §§4.3,4.2,4.5 | Correct supplier section numbering and consume existing statements. |
| Cyclotomic auxiliary prime, fixed-field quotient and inert-prime density | Current Chebotarev Layers 7,8,10 | Correct older subsection addresses. Do not replace irreducibility with congruence alone. |
| Brauer invariants/reciprocity | Current ClassFieldTheory Layers 5,10 | Consume invariants and restriction-degree law; local division-index interface is explicitly additional. |
| Compact forms, Cartan pairs and maximal compacts | LieGroups Layers 7,9 | Keep compact-dual quotient/cohomology as the additional target, not a duplicate compact form. |
| Dedekind Dirichlet series, partial continuation and line-one nonvanishing | Pinned Mathlib; current TauCeti NumberTheory/NumberField/DedekindZeta | Add exact current declarations to supplier boundary. Negative-integer values still require full FE from its owner. |
| Potential overlap with the nine newer roadmaps | AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry; Completed roadmaps | DifferentialGeometry/IntegralLattices supply the actual overlap above. Vector bundles' later Chern/Bott motivation is not an existing topological regulator construction. OperatorTheory's matrix/Hilbert spectral material is not complete locally symmetric L²/Casimir analysis. OrthogonalSpinGroups' Clifford/spin objects are not SU/SO cohomology. The other searched arithmetic/topological objects do not supply the missing carriers. |
| “Steinberg” representation hits in current library | Finite GL₂ representation/character theory | These do not supply the integral reduced-homology module of the division-subspace building. Keep that target. |

## Accepted-node coverage

The node keys below identify inputs for review; they occur only in this handoff, not in the upstream README. There are no packet edits.

| Accepted node suffix | Package location/disposition |
|---|---|
| `order-arithmetic-system` | §1.1 |
| `division-building` | §1.2 |
| `steinberg-module` | §1.3 |
| `solomon-tits` | §1.4 |
| `steinberg-duality-finiteness` | §1.5 |
| `arithmetic-restriction` | §2.1: generic restriction removed as existing; all-degree comparison retained |
| `arithmetic-invariant-form-map` | §2.2 |
| `block-comparison-naturality` | §2.3 |
| `stable-hopf-compatibility` | §2.4 |
| `classical-compact-duals` | §3.1 |
| `compact-dual-cohomology` | §3.2 |
| `compact-dual-degree-stability` | §3.3 |
| `matsushima-garland-criterion` | §3.4 |
| `logarithmic-growth-complex` | §3.5 |
| `stable-range-constants` | §3.6 |
| `arithmetic-stable-range` | §3.7 |
| `stable-arithmetic-exterior` | §3.8 |
| `gl-sl-primitive-comparison` | §3.9 |
| `cartan-serre-application` | §3.10 |
| `division-order-rank-period` | §3.11 |
| `borel-rank-theorem` | §3.12 |
| `archimedean-target` | §4.1 |
| `target-coordinates` | §4.2 |
| `target-dimension` | §4.3 |
| `universal-borel-class` | §4.4 |
| `trace-cocycle` | §4.5 |
| `borel-regulator` | §4.7 |
| `embedding-pull-trace` | §4.6 |
| `regulator-transfer` | §4.8 |
| `regulator-adams-products` | §4.9 |
| `regulator-real-isomorphism` | §4.10 |
| `regulator-lattice` | §4.11 |
| `regulator-determinant` | §4.12 |
| `regulator-covolume` | §4.13 |
| `completed-zeta-conventions` | §5.1 |
| `zeta-zero-order` | §5.2 |
| `zeta-leading-coefficient` | §5.3 |
| `leading-term-functional-equation` | §5.4 |
| `compact-factor-comparison` | §5.5: moved before cycle/period use |
| `borel-positive-zeta-period` | §7.1 |
| `borel-zeta-proportionality` | §7.2 |
| `archimedean-split-division` | §6.1 |
| `norm-one-tamagawa` | §6.2: Borel source explicit; original Weil proof unread |
| `local-sl-volume` | Deleted as duplicate of AdelicAlgebraicGroups §2.4 |
| `norm-one-volume` | §6.3 |
| `restriction-scalars-form` | §6.4 |
| `compact-period-cycles` | §6.5 |
| `adelic-period-pairing` | §6.6 |
| `bloch-borel-interface` | Exact book comparison unsupported; intrinsic pairing/change-measure target in §6.6 |
| `relative-absolute-injectivity` | §8.1 |
| `beilinson-infinitesimal-representative` | §8.2 |
| `universal-factor-two` | §8.3 |
| `regulator-factor-two` | §8.4 |
| `weight-two-bloch-wigner` | §8.5: real proportionality only, exact scalar unevaluated |
| `number-field-small-cases` | §8.6 |
| `extension-matrix` | §8.7 |

## Adversarial pass

This table covers every numbered statement/definition/convention in the README, including the named API assertions in each subsection and the corresponding Lean variables. Supplier statements were checked as inputs, not resubmitted as targets. Examples/Dependencies paragraphs repeat these same statements. Characteristic-p fields, DVRs, unit ideals and q=1 are not silently admitted: number-field hypotheses exclude the first two; no unit-ideal theorem is claimed; finite residue cardinalities satisfy q≥2. The finite-field building itself does permit 𝔽₂. Rank-zero and empty-index linear-algebra tests are retained even where no number field has an empty embedding set. The examples involving 1/2 and complex projection are in characteristic zero.

Each row records its actual instances and the resulting correction or retained hypothesis. This is a mathematical/signature audit, not a proof certificate: sorry elaboration by itself proves none of these claims.

| Statement family (all API in its subsection) | Instances tried | Result / change |
|---|---|---|
| §1.1: Orders, arithmetic systems, rank, blocks and projective lattices | D=F; n=2; ℤ⊂ℚ versus ℤ[1/2]; ℤ⊂ℚ(i) versus ℤ[i]; diag(2,1) | Full integral lattice required; right D-modules use Dᵐᵒᵖ. ℚ-rank is n−1, independent of division degree. |
| §1.2: Division-subspace building, maps, action, dimensions and edges | n=0,1,2,3; repeated vertex; two incomparable lines; ℤ² versus ℚ-subspaces | Use the existing order complex. An edge needs distinct vertices; a repeated pair is a singleton face. Integral lattices are not vertices. |
| §1.3: Augmented Steinberg module and apartment action | n=1 empty building; n=2 over ℚ and 𝔽₂; transposed basis | H̃₋₁(∅)=ℤ, rank of St₂(𝔽q) is q, and St₂(ℚ) has infinite abelian rank. Basis permutations change apartment orientation. |
| §1.4: Solomon–Tits, apartment generation and freeness | n=2 and 𝔽₂ give three vertices and rank-two reduced homology; n=1 excluded | The wedge-of-spheres statement starts at n=2; rank one is handled by augmentation in §1.3. |
| §1.5: Steinberg duality, finiteness and orientation | GL₂(ℤ), finite-index torsion-free SL₂, n=1, split centre, determinant norm −1 | Remove A_G before dimension counting; ν=1 for GL₂/ℚ. Preserve the orientation twist or pass to its kernel. Finite CW alone does not imply finite generation with St coefficients. |
| §2.1: Discrete comparison, coefficients, pullback and cup products | Trivial group; degree zero; degree two versus existing explicit comparison | Generic restriction belongs to Mathlib. New target is the chain comparison in every degree, not a wrapper or comparison for a nondiscrete group. |
| §2.2: Invariant forms, relative Lie complex, van Est, quotient comparison and descent | PGL₂(ℤ) versus its positive-determinant subgroup; trivial group; zero Lie algebra; one-dimensional abelian Lie algebra; k=g | Use K_Γ and G_Γ, not full K when Γ misses components. Relative cochains require horizontality and full compact invariance. Source changes from zero to ℝ in the degree-two PGL₂ witness. |
| §2.3: Block and coefficient naturality of comparison | Identity and two consecutive blocks; component-preserving map | Use morphisms of the chosen open-group/compact pairs and the natural de Rham comparison. |
| §2.4: Stable Hopf structure, filtered-union homology and primitive/indecomposable duality | Trivial group; odd exterior x; product xy; odd versus even division degree for the exchange matrix | Define the SL product directly. Δ(xy) has x⊗y−y⊗x, so xy is not primitive. Degreewise finite-dimensional duality identifies primitives with dual indecomposables, not all cohomology. |
| §3.1: Functorial compact symmetric-pair quotient | SL₂(ℝ), SL₂(ℂ), quaternionic rank one, GL_N(ℂ) centre | Compact real form alone is insufficient. Fix compact integration and denominator: SU₂/SO₂ is S², SU₂ has a degree-three class, SU₂/USp₂ is a point. |
| §3.2: Finite and stable classical cohomology rings, primitives and pullbacks | SU₁, SU₂, SU₂/SO₂, SU₂/USp₂, degrees 2 and 3 | Retain the unstable even Euler generator and its square-zero relation; real/quaternionic stable degree three is zero. |
| §3.3: Degreewise compact-dual stability | q=0,3 and smallest ranks; unstable Euler class | State the uniform sufficient bound n≥2q+3, not a sharp bound or unbounded finite-rank identification. |
| §3.4: Matsushima constant, complete Stokes, L² harmonic vanishing, Casimir/convolution and comparison criterion | Compact group; noncompact finite-volume quotient; compact hyperbolic surface H¹; q=0; SL₂ trace-free tensor diag(1,−1) | A=a_min/2 and P uses R_iklj. The explicit value (1/2)·2−1=0 fixes both. m(SL₂)=0; no A/0. Exact L² harmonic vanishing needs its L² primitive. Use positive real cutoff m′=1/2 when c=0. |
| §3.5: Logarithmic-growth complex, differential/wedge, cusp bound, resolution and L² estimate | a_B→0 versus a_A→∞; log growth versus power growth; anisotropic quotient; SL₂/ℚ | Transport frame and metric with inversion. Strict chamber inequalities involve all wedge degrees ≤q. Empty cusp gives c=∞; SL₂/ℚ gives c=0. |
| §3.6: Root bounds, multiplicities, restriction of scalars and analytic/rational rank estimates | A₁, B₁, B₂, C₂; integral strict endpoint; n=9 versus 10 at q=2; rank zero | B₁=A₁, not substitution into n−2. Use native ceiling minus one. Rank-zero coarse estimate is not the definition of the cusp bound. |
| §3.7: General semisimple arithmetic comparison and explicit order stable range | q=0; c=0; n=9,10 with q=2; Γ missing components | Use cutoff c+1/2 for integer degrees, finite-component descent, and strict 4q<n−1. No unsupported endpoint inclusion. |
| §3.8: Stable exterior cohomology for division orders | One split real factor; quaternionic factor; complex place; decomposable degree ten | Keep primitive degrees and products distinct. Exterior products can contribute in degrees where the corresponding K-group has rank zero. |
| §3.9: Higher K, plus/Q, elementary and SL/GL homology, H-space cover | Zero ring; perfect versus nonperfect killed subgroup; central units; positive-degree homology | Plus kills the specified perfect E. Construct the H-space universal-cover/deck-action argument; do not infer a backward SL product from GL. |
| §3.10: Rational Hurewicz and arithmetic indecomposables | Primitive generator versus product of two; connected H-space universal cover | Use primitive rational homology and dual indecomposables. No assertion that H_i itself equals K_i. |
| §3.11: Division-order K-ranks by period four | i=2,3,4,5; split ℚ; imaginary quadratic; K₁ excluded | Ranks are 0,r₂,0,r₁+r₂ in those degrees; K₁ has central units and is outside the statement. |
| §3.12: Number-field K-ranks, integral finite generation, finite-S localisation and even vanishing | ℚ at K₃,K₅,K₇,K₉; imaginary quadratic; K₂(ℚ) boundary to ⊕𝔽p×; finite versus infinite S | Quillen finite generation is for O_F and finite-S rings. Field comparison is rationalised on both sides; integral field finite generation is not asserted. |
| §4.1: Real-coordinate target, parity, twist and reindexing | Empty set; fixed point at j=2,3; exchanged Bool pair; arbitrary c in the light definition | Even weight kills fixed points and gives (a,−a) on a pair. The submodule needs no involutivity; coordinate theorem does. |
| §4.2: Coordinates, reconstruction and integral reference lattice | One complex pair; real point at even weight; changed representative | One pair contributes one coordinate of lattice covolume one, not √2. Representative change is a parity sign. |
| §4.3: Target dimension | ℚ at j=2,3; imaginary quadratic at both parities; empty finite set | Dimension is r₁+r₂ for odd j, r₂ for even j; no double count of complex embeddings. |
| §4.4: Universal Borel class, Chern character, suspension, Bott and representation compatibility | j=2,3; Bott Hurewicz factorial; zero/identity block; conjugation | At j=3 the 2! Hurewicz coefficient cancels the 1/2! suspended character coefficient. Real odd-weight and conjugate-pair parity are retained. |
| §4.5: Alternating trace form, relative/absolute comparison and Tate projection | N=0,1; repeated inputs; Pauli triple; q=0,1,2 axes | Φ₃=−Tr(X[Y,Z])/2 and Pauli value −2i. π₁ kills 1 and fixes i; π₂ fixes 1 and kills i. Relative and absolute representatives agree in cohomology, not pointwise. |
| §4.6: Embedding pull and full-fibre trace | Identity/tower; ℚ→ℚ(i), j=2,3; conjugated representative | Sum all complex embeddings: trace after pull is degree. Even-weight pair a+(−a)=0. Do not sum only selected representatives. |
| §4.7: Arithmetic Borel regulator, additivity, embeddings and pairing | Zero K-class; conjugate pair; ℚ at weight two | Evaluate the discrete pullback of the universal class on Hurewicz, then divide by the selected Tate generator. No lattice follows just from this definition. |
| §4.8: Finite-projective higher transfer, base change and regulator naturality | Identity on K₀; ℚ→ℚ(i) rank one becomes two; ℤ→𝔽₂; ramified O_F→O_E | Finite projective, not merely finite. Ramification does not invalidate O_E projectivity. Split base change counts [E:F] embeddings. |
| §4.9: Adams operations, weights and products | ψ¹; ψ² at j=3; wrong weight; two positive degrees summing to odd; K₀ rank two | a≥1. Factor is 8 at j=3,a=2; positive-degree product vanishes rationally through its even-degree factor, but K₀ acts by rank. |
| §4.10: Real regulator isomorphism | Zero-dimensional source/target; real j parity; imaginary quadratic rank one; zero map of equal dimensions | Proof uses the nonzero primitive generator pairing. Dimension equality alone is not used as a surjectivity proof. |
| §4.11: Arithmetic image lattice and torsion kernel | Rank zero; torsion class; abstract equal-dimensional non-discrete subgroup | Use O_F finite generation plus the real isomorphism to obtain discreteness; no integral finite-generation assumption on K_i(F). |
| §4.12: Actual regulator matrix and determinant-line transformations | Empty matrix; transposed integral basis; conjugated target representative; rank-two scalar | M↦MU and M↦DM fix map direction. Basis transposition has determinant −1; absolute determinant is unchanged. |
| §4.13: Actual Borel covolume and original-to-renormalised conversion | Rank zero determinant 1; one complex coordinate; scalar λ; j≡3 mod 4 | Use |det|, positive scalar |λ|^d_j and fixed reference volume. Track (2π)^d_j and the stated rational 2^r₁ factor separately. |
| §5.1: Completion convention comparison | s=2 real and complex factors; F=ℚ | Γℝ(2)=1/π, Γℂ(2)=1/(2π²), Lℂ(2)=1/(2π). Import FE from its owner; no Tate theorem is a new target. |
| §5.2: Exact trivial-zero order | ℚ,j=2 gives order zero; ℚ,j=3 gives one; imaginary quadratic gives one | At j>1 the completed value reflected to j is nonzero. Count gamma poles, not totalised gamma values as ordinary nonzero factors. |
| §5.3: Normalised derivative coefficient, factor, limit, scaling, reality and nonvanishing | z² at order two gives 1; z³ at order two gives 0; order zero gives evaluation | The light expression works for arbitrary f,d. Analytic factorisation is required for the factor theorem and g(s₀)≠0 for nonvanishing. |
| §5.4: Residue expansion of supplied functional equation | ℚ,j=2 yields −1/12; rank-zero and odd-j pole counts | Keep a_F,j nonzero and exact residues before passing to rational proportionality. The exponent is d_j−[F:ℚ]j. |
| §5.5: Absolute/relative compact-fibre comparison and spectral sequences | N=1 trivial; odd N stable range; N=2 at a real place; complex diagonal factor | Require odd N. SO₂ has H¹ but SU₂ does not, so the finite even-rank restriction is not onto. β∘incl=p*∘j fixes direction. |
| §6.1: Archimedean-split division algebra, Brauer period/index and representative | Zero Brauer class; e=1 outside existence theorem; e=2 over ℚ, inert primes 3 and 7 in ℚ(i); real invariant 1/2 | Cyclotomic irreducibility, not prime congruence alone, gives full cyclic Galois degree. Period/index divisibilities force division degree e. Include Module.Finite F D in Lean. |
| §6.2: Inner-form Tamagawa value | e=1 trivial supplier case; e≥2; change one local Haar factor | τ=1 is sourced through Borel Proposition 2.4 quoting Weil. Compactness/positivity alone never imply rationality. Original Weil proof remains unread. |
| §6.3: Archimedean volume zeta product | e=2,q_v=2; e=1 empty product; exceptional finite places; noncompact infinite factor | Import good finite-place volumes, use strong approximation with the infinite noncompact factor and exact compatible Tamagawa/gauge measures. |
| §6.4: Restriction-of-scalars algebraic form, signs, basis and positive measure | ℚ(i), basis 1,i; swap embeddings; scale η by a∈F× | δ=−2i, δ²=−4 and δ⁻¹=i/2≠1/2. Signed δ and positive |D| belong to different formulae. δ and wedge signs cancel under a swap. |
| §6.5: Compact cycle, regular representation, primitive restriction and covers | e=2; D dimension e² versus standard e-dimensional complex factors; orientation reversal; neat cover of index t | Regular representation requires N≥e² and multiplies a primitive by e. Cover periods multiply by t; top wedge nonvanishing is an explicit target. |
| §6.6: Intrinsic adelic period, linearity, cohomology, volume, local and form rescaling | η=0 versus η≠0; ω=0; η↦2η; μ_v↦a_vμ_v; finite cover | I is defined also at zero. Positive density c_η requires nonzero η. c_η|I|vol_f=τ, and changing η scales period/density inversely. No unread Bloch-specific pairing normalization is asserted. |
| §7.1: Absolute and relative rational period determinant lines | d_j=0, F=ℚ,j=2; odd N; e=j compact cycle; corrected i phase | Absolute exterior degree is d=[F:ℚ], relative degree d_j. Rank-zero relative equality becomes a rationality statement; do not erase its zeta factor. |
| §7.2: Borel regulator–zeta proportionality | ℚ,j=2: 1/(1/12)=12; imaginary quadratic; rank zero | Statement is a positive rational multiple, not equality or a torsion-order formula. Renormalisation removes π discrepancy. |
| §8.1: Relative-to-absolute injectivity and quotient coordinate | N=1; q(1,i)=i and q(i,1)=−i; section (1,u) | Transport Burgos conjugate diagonal to diagonal. Primitive pullback is 1⊗x−x⊗1. Injectivity is specific to this pair, not all relative Lie cohomology. |
| §8.2: Independent Deligne complex/regulator, Betti lift, infinitesimal comparison | Spec ℂ, j=0,2,3; cone differential squared; Chern class versus character at j=3 | Cone map r−f and differential (dr,df,r−f−dω) fix signs. j=2 quotient kills real axis; j=3 kills imaginary axis. Include normal-crossings choice/comparison and named Deligne-to-Betti lift. |
| §8.3: All-weight universal factor two | j=2,3, arbitrary stable j; Pauli absolute representatives | Compare 2πΦ with πΦ, then use §8.1 injectivity and van Est. A weight-two computation alone is not a proof in all weights. |
| §8.4: Arithmetic factor two and determinant/covolume power | d_j=0,1,2 | Regulator scalar 2 gives determinant/covolume 2^d_j: 1,2,4. Same Tate generator and same reference measure are required. |
| §8.5: Pre-Bloch relation, antisymmetric tensor boundary, Suslin, measurable cocycle and weight-two real proportionality | x=2,y=3; r(2,0,1,3)=−3 versus swapped −1/3; real z; conjugated z; ℚ(t) symbol [t] detected by two valuations; zero/cyclic/rank-two tensor groups; characteristic 2 excluded; diagonal tensor 2-torsion | Five-term arguments 3/4 and 1/2 pin the convention. Use antisymmetric tensor quotient, not exterior square. Claim only common nonzero real λ; exact sign/value/rationality not evaluated. |
| §8.6: Small rank and imaginary-quadratic specialisations | ℚ at even j; ℚ(√−3), ζ₆; conjugate embedding | 2[ζ₆] is integral Bloch, [ζ₆] rational Bloch; D(ζ₆)>0. Do not silently kill the possible diagonal 2-torsion boundary or identify a lattice basis from a nonzero rational element. |
| §8.7: Coordinate extension and trace matrices, compositions and regulator squares | ℚ→ℚ(i) at j=3: P=1,T=2; j=2: rectangular sizes 1×0 and 0×1; changed representative | TP=[E:F]I is rectangular-map composition. Determinants are only for equal dimensions. Retain signed embedding counts and coordinate-free naturality. |

The four real-bodied Lean definitions were compared to their prose generalities; all theorem signatures were checked against their actual `variable`/typeclass binders. In particular the division algebra is explicitly finite over F, the target's fixed-even statement has j≥2 and Even j, and analytic nonvanishing includes g(s₀)≠0. No theorem has a hypothesis merely restating its conclusion. The sign/normalization examples in Lean cover strict endpoints, the SL₂ curvature scalar, target parity, projection axes, full trace coefficient, Bott factorial, determinant orientation/empty determinant, embedding trace cancellation, gamma convention, derivative factorial, signed discriminant, wedge/basis swap, form/measure scaling, diagonal quotient, factor-two determinant, rectangular trace-pull, tensor 2-torsion, cross-ratio inversion and five-term arguments. Heavy-carrier tests remain prose Checks, not fake Lean declarations.

## Source verification

Read the supplied library index; no relevant cleared Bloch/Weil text was listed. Only public PDFs were used for these sources. Source text and page images were kept in scratch and are not repository deliverables. No passages were copied into this package. The following are the actual fetched bytes, accessed 2026-10-19; hashes identify the version behind each locator.

| Source | SHA-256 of PDF |
|---|---|
| borel1953 | `53411a87149a3e967847a8cebae63407b8025473516ae362ef5126751f5c3aa8` |
| borel1974 | `20247a7df85bfcab17dc51e46cdcaf8bd6c2e8c1fae194014e518913ae9f859d` |
| borel1977 | `f27dc4622583423cdcfc66671cffd38904f3ecf4d97b8b1352fcf3dbf3a295b5` |
| borel1980erratum | `4f87e0cd23458a43bcb073ed30c4ab00fad221ca02f7479112fa6af045b9959a` |
| burgos2002 | `da6ba8c4b08bf447d1575788c33b96c52d8d0d0a377e8f2990ead6aed73f65ea` |
| churchfarbputman | `02dbd7c5df80650667fcf5c1cba0cfc65de98f3c99d2a5dd30357790397c35fd` |
| goncharov2004 | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| kaneyukinagano1962 | `0f71268a94143abb8dd96f5d6cd9b84c083612d4a328c25dd2f410a4234bb2fa` |
| matsushima1962 | `08501c05fb6d3ac41d25b3f28f2fa600ee05cecc817cff69036736c196567f0b` |
| putmanstudenmund | `3421bcfaffc1e05198ae8323971872ca3774bd73c067077e94f46ed5d073d7ad` |
| quillen1973 | `9e10948869fcaf64251261294efddf3f4c13ec31838d9a89a7b5b96a4f0c933b` |
| rapoport1988 | `ab0b06911f88ebf427c57c30e99858c9aeac01661599ed88de723376f210f980` |
| weibelIV | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| weibelVI | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |

All source URLs are in the README References (Goncharov is the v3 text; the arXiv download resolves it). Extra constant sources are Matsushima 1962 and Kaneyuki–Nagano 1962. Printed page numbers are used; Quillen's collected scan carries headers 16 higher than the original chapter pages. Key locator checks included:

| Source | Locators checked against text/page |
|---|---|
| Borel 1974 | 3.1–3.7 pp.241–246; exact contraction on p.243 visually; 5.5/5.7 pp.249–251; 7.1–7.4 pp.254–258; 9.1–9.5 pp.261–262; 10.2/10.6 pp.263,265–266; 11.5 p.268; 12.1/12.2 pp.270–271 |
| Matsushima | Curvature equation (1.5) p.4 and definition of H_g^p p.13 visually; §§5–9 pp.10–16; positivity Theorem 1 pp.13–14 |
| Kaneyuki–Nagano | Theorem 4.1 and table pp.249–250, with Hermitian/non-Hermitian convention distinguished |
| Borel 1953 | Propositions 31.3–31.4 pp.203–205, Sp and SO finite homogeneous cohomology and odd-rank restriction |
| Quillen | Theorems 1–3 pp.179–181; proof pp.182–184; division-space induction pp.185–190, corrected for scan header offset |
| Putman–Studenmund | Theorem C pp.4–5; Proposition 2.1 p.8; proof pp.9–10, orientation twist and central quotient |
| Borel 1977 | Lemma 2.2 pp.617–618; Proposition 2.4 and explicit Weil citation p.619; §§3.3–3.5 pp.620–622; Proposition 5.4/Theorem 5.5 pp.628–630; Theorem 6.2/Remark 6.3 pp.631–632; §6.4 pp.632–633 |
| Borel 1980 | p.373, corrections to 3.6(3), 5.5(1),(4) and 6.2(5); signed determinant phase not positive Haar phase |
| Burgos | §§4.4–4.6; Theorems 8.12/8.15 pp.70–71,73; Corollary 9.8, Theorem 9.12 and Proposition 9.15 pp.78–82; Definitions 9.19/9.24 pp.84–86; Propositions 9.25/9.26 pp.87–88; Definition 10.8/Theorem 10.9 pp.94–97; Lemma 10.10/Proposition 10.11 p.97 |
| Weibel IV | Plus/Q and rank statements §§1.1–1.18 pp.2–13; transfer/base change §2; operations §5 pp.47–49. Field comparison in public Theorem 1.18 read with both sides rationalised. |
| Weibel VI | Definition 5.1, Theorem 5.2 and Corollary 5.3 pp.23–24; antisymmetric tensor quotient and torsion kernel. Infinite characteristic-zero field restriction avoids small-field pathologies. Classical Data 8.1 p.47 is not used to claim integral field finite generation. |
| Goncharov | Introduction (11) p.7; equations (61),(64), Theorem 5.7 pp.43–47; Corollary 5.10 and Theorem 5.11 p.49. These support real universal proportionality, not a guessed coefficient in our coordinates. |
| Rapoport / Church–Farb–Putman | Regulator normalizations in §1 pp.171–175 / integral apartment and Steinberg background in introduction; auxiliary to the explicit Borel/Burgos and Quillen/Putman–Studenmund locators above. |

The exact Weil and Bloch limitations are stated above rather than disguised as verified primary locators. Source corrections concern these public versions only; no assertion is made about an uninspected book edition.

## Validation

- `lean-check research/blueprint/packages/BorelRegulators/Suggested.lean`: exit 0 against the pins above; 20 warnings, all exactly declaration-uses-sorry warnings. No errors, unused variables, sorry data definitions or missing imports. The two #check outputs are the actual orderComplex and orderComplexMap declarations. Final file is 289 lines.
- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`: exit 0, zero errors/warnings, 56 accepted nodes, 8 explicit input gaps. Packet unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: exit 0, `4 file(s), 0 problem(s)`.
- `git diff --cached --check`: exit 0; staged file list is exactly the three package files and this handoff. README is below the 200 KB issue limit.

The package is ready for the independent package review. The reviewer should focus especially on the unsupported exact comparisons listed above, the A/curvature convention in §3.4, odd-N compact-fibre argument, and the determinant-line normalization in §§6.4–7.2. No second issue is claimed in this run.
