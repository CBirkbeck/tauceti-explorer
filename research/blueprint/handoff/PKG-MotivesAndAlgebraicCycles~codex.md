# Handoff: MotivesAndAlgebraicCycles package

Issue: #11240. Agent: Codex. Session: codex-1yFbAK. Date: 2026-10-20.
The claim bot confirmed comment 6280137890. This run took this one issue only.

## Delivered

The package contains the full eight-layer roadmap, a compact representative Suggested.lean, and `topic = "math.AG"` metadata. It is a roadmap for future formalization, not an implementation or a proof of the cycle conjectures. The README distinguishes unconditional constructions, conditional implications, conjecture predicates, announced computations requiring proof, invalid example constructions, and open questions. Source statements and proof routes are in our own words.

The effective input is the accepted base packet plus its six accepted layer continuations: 182 + 15 + 11 + 17 + 28 + 12 + 50 = 315 nodes, grouped without repeating overlapping targets. The nineteen retained-target refinements in MC.6 were applied before writing; they replace old statements/APIs/tests rather than adding nineteen targets. The MC.5 and MC.7 completion targets supply the operative readings of the older corresponding nodes. The separately named `MotivesAndAlgebraicCyclesPartII` roadmap and its 79 nodes are outside this issue's base-roadmap package; they were not folded into it. Original packets/readers/suggested files and atlas data were not edited.

## Library and ownership audit

Read-only current revisions checked:

- TauCetiRoadmap: `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Current Mathlib: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
- Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The reviewed coverage audit has no direct MotivesAndAlgebraicCycles entry. Related intersection, cohomology, effective-motive and period entries were leads, not evidence that a missing declaration exists. Searches used the mathematical objects (coactions, rigidity, projectors, trace, Hodge pieces, localization, cycle operations) as well as names.

Duplication removals and boundaries:

| Input notion | Existing supplier; package treatment |
| --- | --- |
| MC.1 `dual-of-biproduct` | Current Tau Ceti `CategoryTheory/Monoidal/Rigid/Biproduct`, notably `TauCeti.ExactPairing.biproduct`; removed as a construction target, cited in supplier contracts. Duals of idempotent summands remain a separate target. |
| MC.5 `finite-comodules-abelian` | Current `Algebra/Coalgebra/Comodule/Finite/Abelian`: abelian finite comodules over Noetherian `R` and flat coalgebra, plus exact forgetful functor. Removed as a target; not imported into Suggested because it is newer than the build pin. |
| Karoubi carrier, its morphisms and completion | Mathlib `CategoryTheory/Idempotents/Karoubi` and preadditive/completeness modules; only the correspondence-specific category and any missing linear adapter are planned. |
| Finite comodules, monoidal/Hopf dictionary, known-group reconstruction | Tau Ceti finite-comodule and representation/Tannaka modules; ReductiveGroups Layers 0–1. Arbitrary-category reconstruction here constructs its own coefficient algebra and antipode, so does not duplicate the given-group theorem. |
| Pure Hodge structures, morphisms, Tate objects | Tau Ceti `Geometry/Hodge/{Structure,Morphism,Tate/Basic}`. The kept light definition is an inverse image under an explicit rational comparison map, not another Hodge structure. |
| Generic t-structure and triangulated K₀ | Mathlib TStructure and Tau Ceti TriangulatedK0; only motivic predicates/applications and compact-support motivic measure are new. Exact tensor ring descent is GrothendieckEulerForms, Part II. |
| Ordinary cycles/intersection, higher Chow groups, effective motivic localization and cancellation | SchemeAndStackFoundations, MotivicEtaleKTheory and SchemeKTheoryOperations retain those constructions. The geometric subcategory, stabilization, bivariant adapters and compact support here use their carriers. |
| Analytic forms, integration, Stokes, analytic de Rham theorem | Current DifferentialGeometry Layers 5–8, Tau Ceti singular cohomology, and AlgebraicTopology relative/cup/cohomological Mayer–Vietoris interfaces. Algebraic comparison and supported cycle compatibility remain separate contracts. |
| Algebraic vector bundles and semialgebraic syntax | Current AlgebraicVectorBundles and RealAlgebraicGeometry; the latter explicitly excludes triangulation/homology. Neither provides real equivariant cycle cohomology. |
| Finite étale Galois sets and effective descent | Existing ModularCurves geometry. Layer 6 adds only its cycle/diagram/Nori compatibility and resulting Artin subcategory equivalence. |

The other newer directions (IntegralLattices, LocalGaloisGroups, all OperatorTheory subroadmaps, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic) and Completed roadmaps were searched for overlapping target objects; none supplies a motive category, arbitrary-category reconstruction, formal-period algebra or real-cycle detector construction. The known group/representation targets of ReductiveGroups and pure Hodge carriers were read directly. No Lake operation was run in the current read-only environment.

### Open upstream plans and moves

MotivesAndAlgebraicCycles is outside the 94-roadmap Caraiani–Newton tier list. This package introduces no arbitrary higher-tier dependency. The general neutral/relative reconstruction targets stay early within Layer 6 and independent of Nori geometry, as required for geometric Satake consumers. Installation of the proposed abstract/period stage split is still maintainer bookkeeping, outside the four authorized files.

The two cohomology plans in TauCetiRoadmap PR [196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196) remain existing suppliers, integrated through SchemeAndStackFoundations. The PR is open at head `4bd72379658126cbe9be935656396f0c9dac4de0`; both READMEs and compact suggested files were read. ComplexComparison owns finite Artin comparison, relative comparison and triangulation/finite CW type; EllAdicRealization owns the finite-tower/native-pro-étale and rational comparisons. Neither is represented as implemented or replanned here. Their joint coefficient/Kummer/trace exports with EtaleDualityAndPerverseSheaves remain explicit obligations. ComplexComparisonPartII retains algebraic de Rham/analytic cycle comparison. No generic Artin or native ℓ-adic construction moved into this package. No external roadmap files were changed.

The input's broad placeholders were replaced by these exact existing owners and by explicit targets where the adapter is missing. In particular, unregistered real-equivariant and real-function-field quadratic-form directions are not credited as completed suppliers: the necessary mathematical contracts and proof targets remain here. ComputationalNumberTheory is not a dependency; explicit calculations are hypotheses or named proof tasks. No additional cross-roadmap ownership move was silently made.

## What the package cannot certify

These are retained mathematical obligations, not excuses to omit targets:

1. The complete Chow/intersection, relative Picard and geometric comparison suppliers are future theories. Geometric Betti, de Rham and ℓ-adic realizations require their operations and exact normalization squares, not just abstract Weil axioms. The current main lacks the two cohomology plans of PR 196; the README consumes their plans without claiming their implementation.
2. The moving route uses effective relative families on the generic field-of-definition locus and an infinite ground field. Extending it to finite fields requires transfer descent on complexes, with two coprime extension degrees. Signed cycle families alone do not supply the positive-family construction. Categorical Gysin must agree with the zero-section/specialization class and the positive uniformizer residue. These remain in §§4.3–4.6, while smooth/perfect-field geometric statements retain their intended scope.
3. Complex-pair finiteness uses compatible triangulation from the existing ComplexComparison direction. The affine homotopy/cohomological-dimension input to the Basic Lemma, constructible Basic Lemma, cellular functoriality, bounded Čech realization, correspondence pullback and Nisnevich bridges must actually be proved. Smooth proper de Rham comparison does not give relative de Rham for arbitrary singular pairs; h-descent/hypercovers and multiplicative comparison are required.
4. Reflection-only relative Beck in FS VI.10.2 does not provide the preservation premise of the pinned monadic theorem. §6.4 states a sufficient theorem with both preservation and reflection and preserves the weaker printed assertion as an unmet proof obligation. Neutral finite-hull representability is an additional theorem, not obtained merely by taking vector spaces as relative coefficients.
5. Affine heap group reconstruction uses the effective-quotient theorem in SGA 3, Exposé VII, Theorem 1.4. That primary quotient proof was not read; §6.5 states descent and representability as proof tasks with nonemptiness/field scope. The main period bitorsor is constructed from already reconstructed fiber groups and does not depend on this auxiliary quotient.
6. The Roitman primary PDF could not be retrieved (TLS/timeout at the public endpoint). Its low-degree hypersurface result is retained with the input's precise locators and a rational-equivalence construction task, not asserted to have been checked from that primary proof. The accessible diagonal-support, Kollár-index and Karpenko calculations were read. Do not treat the Roitman locator as freshly verified.
7. The known Tate/standard-case registers retain their characteristic, deformation and realization restrictions. Totaro and Kleiman give the stated registers; the primary proofs for the Zarhin/Tankeev/André/Moonen/K3-in-characteristic-two, Katz–Messing and related cases, Artin–Tate/Brauer/Sha/BSD and Schoen implications still need full extraction/routing. None is presented as following from the abstract motive definitions.
8. Real applications require equivariant semialgebraic cohomology, Gersten/coniveau, Steenrod operations, Borel–Haefliger, finite-stalk duality, restriction/norm and Bloch's torsion cycle map with the exact twist and low-dimensional injectivity range. The BW/CTV arguments were read, but not every primary Bloch–Ogus and torsion Abel–Jacobi proof. Missing proof contracts are explicit. No analytic Hodge decomposition over a non-Archimedean real closed field is assumed.
9. Several real example constructions remain proof tasks: the conic bundle/K3 Picard data, Noether–Lefschetz quartics, approximation for fibrations, Witt's sum-of-two-squares and Pfister's seven-square inputs, Enriques and complex integral-curve cases, and the full real Fano/K3 deformation route. The anti-linear Campedelli construction is obstructed by its weight-four equation line; only that obstruction is claimed. An alternative real-empty surface construction is required for the intended example.
10. The announced full empty-real quartic Chow group and the real-point Fermat quartic torsion group retain explicit intermediate-Jacobian/lattice/anticanonical proof tasks. A cohomological cokernel alone is not used to deduce a torsion Chow computation.
11. The primary Beilinson height pairing/domain was not obtained. §7.17 uses a specified primitive domain and pairing as hypotheses and distinguishes its signed expectation from a primary-domain theorem. Li–Liu's exact all-level modularity, all-prime semisimplified Galois-isotypic contract, local almost-self-dual intersection repair, and analytic local factors are explicit premises. The repaired local proof was not independently verified. Localized nonvanishing is not promoted to a one-dimensional eigenspace or rank formula.

No source file or verbatim source passage is committed. The approved-source library index was checked; no uncleared book copy was used. All fetched texts and other authors' files were data only. No suspicious instruction asking for credential use, code execution or unrelated file changes was encountered.

## Adversarial pass

Every retained target is covered by one of the groups below; the input-to-section crosswalk follows. Applicable zero, rank-one, positive-characteristic and nonproper cases were applied at the group level, including the actual maps/signs rather than only name checks. Geometric cases needing missing carriers are discriminating future Checks in the README, not admitted Lean examples.

| README group | Instances and result | Correction or constraint |
| --- | --- | --- |
| 0.1 correspondence groups, actions, composition and disjoint union | Point gives ℚ in degree zero; two points give E₁₂E₂₁=E₁₁; empty gives zero; surface-to-point is CH² | Kept both cycle gradings and componentwise dimensions; degree addition and action direction fixed. |
| 0.2 graph, transpose, tensor and contraction | Point-in-curve, curve structural map; surface-to-curve transpose 0→1; tensor matrices | Contravariance, shifted transpose and geometric tensor symmetry kept distinct. |
| 0.3 line/curve projectors | Two orthogonal P¹ factors; curve π₁; summand identity p | Identity is p, not Δ; π₁=0 only for P¹. |
| 0.4 algebraic equivalence and curve parameters | Point, P¹, infinite-order elliptic divisor, finite-field torsion | Imperfect-field projective-parameter and arbitrary descent claims excluded; adequate closure retained. |
| 0.5 adequate/numerical relations and quotients | Point pairing; P¹×P¹ primitive divisor; total relation | All complementary cycles required; normalization separated from the general adequate construction. |
| 0.6 support, diagonal decomposition and coniveau | Universal field-extension quantifier, point action, supported diagonal terms, surface support | Required Gersten action and support degree bounds; one decomposition over k is insufficient. |
| 0.7 hypersurfaces and intermediate indices | Projective-space index 1; quartic geometric support vs real index 2; singular-curve normalization | χ equality only modulo lower index; Roitman primary proof remains unverified. |
| 0.8 anisotropic quadric | 2τ=0 but χ₁τ=1 mod 2; rationalization and splitting extension | Integral and rational phenomena separated; Clifford/K-theory and Hochschild–Serre tasks retained. |
| 1.1 twisted category/Karoubi | Unit twists equal/unequal, Hom(1,hP¹(1)), zero projector | Karoubi library reused; no artificial single-dimension object restriction. |
| 1.2 tensor, Tate, Lefschetz and sums | P¹=1⊕L; inverse twists; point⊔P¹ | Common twists preserve Hom; geometric switch gives symmetry. |
| 1.3 duals and retracts | Unit; P¹; retract identity and triangle equations | Existing finite-biproduct duality removed; idempotent-retract duality kept. |
| 1.4 Chow groups/Manin | Point; two P¹ projectors; all test varieties and twists | Detection ranges over all smooth projective tests, not only rational points. |
| 1.5 universal property | Identity functor; zero object; two choices of splitting | Uniqueness uses coherent marked isomorphism, not equality of chosen splittings. |
| 1.6 projective bundle/diagonal | Rank 1, P², tautological quotient top Chern | Diagonal leading coefficient is 1; bundle rank zero handled by empty projectivization. |
| 1.7 adequate motives | Total relation zero category; numerical quotient; idempotents | Retracts of image are guaranteed; essential surjectivity needs lifting. Normalization added only to Jannsen. |
| 2.1 graded realization carrier | Odd lines, degree shift, zero total dimension | Koszul symmetry and finite total dimension retained. |
| 2.2 Weil operations, disconnected/base change | Point⊔P¹; odd square; finite separable points; traces | No single global top trace on mixed dimensions; geometric invariants not substituted for cohomology. |
| 2.3 motive realization, kernel and round trip | P¹ projector; homologically trivial elliptic divisor; zero projector | Kernel-to-correspondence-action equivalence is an actual target, not an axiom. |
| 2.4 Künneth/Chern character cycle map | Hyperplane, negative divisor, codimension 2 structure sheaf, empty cycle | Correct factorial/sign and independent Gysin/trace tasks; no use of the problematic Stacks pushforward proof under insufficient axioms. |
| 2.5 normalized comparison | Point, quadratic trace 2, Tate line, curve finite degree | Unital/multiplicative comparison and all traces/Tate markings required. |
| 2.6 Betti/de Rham | P¹, divisor integral 2πi, characteristic-zero field without complex embedding | General algebraic de Rham retained; comparison only with specified embedding. |
| 2.7 étale | Geometric Frobenius q⁻¹ on Qℓ(1), Kummer towers, changed closure | ℓ invertible; coefficient direction and derived limits retained; existing native comparison supplier consumed. |
| 2.8 curves/quotients | Closed point degree a, f_*f^*=deg f, projector images | Comparison on images uses native linear ranges; quotient descent exactly matches kernel containment. |
| 3.1 numerical trace radical | Nilpotent with vanishing power traces, P¹ projectors, base extension | Characteristic-zero Newton identities and finite-dimensional scalar extension used where required. |
| 3.2 categorical semisimplicity | Field, dual numbers, split zero idempotent | Semisimple endomorphism algebras plus pseudoabelian/additive hypotheses; not merely no nilpotents in scalars. |
| 3.3 Jannsen equivalence | Total adequate relation; infinite-order elliptic Chow kernel; P¹ | Added I⁰(point)=0 to exclude zero-category counterexample. No standard conjecture premise. |
| 3.4 rank/signed Tannaka | Odd rank −1 vs unsigned 1; even Tate line; unit | Ordinary fiber requires changed symmetry under algebraic Künneth projectors; no Q-neutrality from extension-valued fiber. |
| 3.5 radical and lifts | Nilpotent ideal, two lifts, D-dependent factorization | Lifts need not be canonical; realization on numerical motives requires D. |
| 3.6 Tannakian meaning | Known Hopf comodules, super sign, nonneutral fiber | Definition separated from neutral reconstruction and semisimplicity. |
| 4.1 geometric category/inversion | Unit inversion, exponent N→Z, Q kills Z/p, infinite unit sum | Thick/compact vs unbounded ambient distinction; generic tensor inversion not assumed to preserve all properties. |
| 4.2 homotopy/MV/projective bundles | A¹, P⁰/P¹, rank-one bundle, coordinate hyperplane | Projective-space quotient, splitting and bundle formulas retained at their intended field scope. |
| 4.3 blow-up/Gysin | Codimension 1 blow-up, point on surface, uniformizer t | Perfect-field targets kept; categorical normalization and +ord residue required separately. |
| 4.4 relative cycles/transfers | Empty, point, positive relative dimension on point, diagonal | Generic field-of-definition and effectivity conditions kept; no second finite-correspondence construction. |
| 4.5 bivariant/moving | Point, A¹, affine suspension; finite vs infinite parameter fields | Second variable not naively homotopy invariant; positive-family and finite-field descent gaps visible. |
| 4.6 duality/Gysin for cycles | Projective line, zero-section, suspension square | Effective-family moving prerequisites retained; arbitrary-field generalization not claimed from infinite-field proof. |
| 4.7 compact support | Mᶜ(A¹)=R(1)[2] vs point; G_m localization; nilpotent thickening | Proper covariance only, étale contravariance and derived coefficients; no general integral universal-homeomorphism conclusion. |
| 4.8 representability/Chow bridge | Point, BM A¹, CH→Hom, graph of point-in-curve | Made ChowMotiveᵒᵖ→DM explicit: transpose projector and inverse twist/shift reverse arrows. |
| 4.9 stable dual/Tate category | Dual of Lefschetz, A¹ compact dual, k× and Pic(point), negative weight | Stable dual differs from effective RHom; triangulated Tate hull not a mixed Tate heart. |
| 4.10 scissor ring/measure | Fat point, closed-open A¹, G_m; ordinary L↦1 | Compact support essential; target denominators inverted explicitly; coefficient change not K₀⊗Q. |
| 5.1 diagram/algebra/coalgebra | M₂, Jordan centralizer, zero vs identity arrow, N quiver nonfunctor, infinite isolated lines | Added distinguished identity loops; transition maps need not inject/surject. Dedekind projective version retained separately. |
| 5.2 universal category | Isolated K² Morita model, dual numbers, marked identity factorization | Uses current finite-comodule abelianness; exact faithful universality not inferred from a bare coalgebra definition. |
| 5.3 pair diagrams/Betti | Empty/equal pair; P¹ triple; G_m Tate pair; product good vs very good | Cohomological boundary direction and integral-good rationalization fixed; finite CW homotopy type rather than improper compact triangulation claim. |
| 5.4 Basic Lemma/cellular | Zero-dimensional affine; repeated levels; Q²→Q with (a,b)↦b−a; nongood dimension chain | General subfield k⊂C scope retained; constructible version not deduced from constant coefficients. |
| 5.5 covers/all pairs/supports | Singleton vs unnormalized nerve; two cover-index maps; empty/full support | Corrected support cone to Cone(R(X)→R(X−Z))[-1]; prism homotopy replaces strict uniqueness. |
| 5.6 tensor/excision/localization | Nongood intermediate pair, odd×odd signs, rank-two noninvertibility, Q[t]→Q | Correct good endpoints, two Koszul conventions, ordinary symmetry and canonical localization universal property. |
| 5.7 generators/duality/fibers | Disconnected top degree, smooth support of two points, Tate comparison; Z/2 | Stated abstract field rigidity criterion; identified failure of unqualified Dedekind version. Relative de Rham and fiber extension not assumed. |
| 5.8 equivariance/correspondences | Trivial group, ramified finite correspondence, composition/refinement | Integral-good filtration first, rational quotient invariants afterward; quotient endpoint and multiplicity conditions retained. |
| 5.9 geometric-to-Nori | Point, Tate R(1)[2]↦L_N[-2], relative cone, two choices | Covers chosen before filtrations; derived zigzags and bounded cohomology; no strict unique indexing poset. |
| 6.1 neutral/finite hull | Zero hull, nonsemisimple C_p in char p, weight-one non-tensor hull, free Z-modules | Preserving subobjects of every X^n; local representer not assumed globally. |
| 6.2 reconstruction/antipode | Off-diagonal coefficient 1; matrix monoid; S(t)=t⁻¹ | Construct antipode from duals before identifying endomorphisms as automorphisms. Lean milestone has no Hopf premise. |
| 6.3 recognition/functoriality | G_m finite type not finite; μ₂ restriction; α_p and μ_p | Characteristic-zero connectedness restriction; group scheme tested on all algebras. |
| 6.4 relative reconstruction | M₂ product order, weight-bounded pieces, identity A→A, constant systems | Both Beck preservation and reflection; A-action balanced coend; left modules/right comodules. |
| 6.5 heap/affine heap | Empty, integers, Z/3 wrong middle reversal, additive line, zero algebra | Nonemptiness essential for translation groups; quotient representability a proof task. |
| 6.6 comparison coefficients | Single m×n fibers, off-diagonal, arrow 2 over Z, saturated arrow 1 | Integral formal presentation can have Z/2; only torsion-free quotient matches coefficient algebra in stated Dedekind scope. |
| 6.7 formal periods/localization | Point, interval Stokes, odd cross product twice, Q[t] vs Q[t,t⁻¹] | Marked canonical coefficient map, not abstract isomorphism plus invertible image. |
| 6.8 fiber extension/bitorsor/inner form | Zero tensor endomorphism, unit-less hull, changed section th | Full fiber extension not assumed initially; fpqc torsor, no rational point asserted. |
| 6.9 period torsor/point | Laurent Tate coactions, noncommuting 2×2 matrices, inverse period, doubled comparison | Named group sides and matrix inverse fixed; analytic 2πi value supplied independently of nonvanishing. |
| 6.10 Artin/pure Tate | Split/quadratic/nonnormal extensions, regular centralizer, Tate weights, G_a extension | Absolute Galois proconstant group vs one field automorphism group; pure Tate uses subquotients, not extensions; even braiding. |
| 7.1 rational Hodge | Unit and wrong Tate piece, zero comparison, wrong weight, divisor | Injectivity and fixed image only in theorem premises; four proved examples across the two light definitions total. |
| 7.2 Tate/known cases | Top cycle degree m, finite-field Pic torsion, Jordan block at 1, changed finite field, ℓ=p | Rational vs Qℓ sources distinguished, finite-field injectivity scope, primary known proofs left explicit. |
| 7.3 standard predicates/implications | P^d, primitive surface divisor, P¹×P¹ a−b, codimension-zero inverse on surface | Rational cycle image and all complementary pairings; no ordered Qℓ; hard Lefschetz separate premise. |
| 7.4 known standard/smash | Curves/surfaces, x=x′, genus zero, n=g, n=2/3 norm coefficient | Norm coefficient is ((n−1)!)^n n!, giving 48 at n=3; not (n!)^n. Finite-field C restricted to its realization. |
| 7.5 BB/Murre | Point, curve Pic⁰, P² even projectors, empty intersection | Global equivalence, correct 2j−ν index; strong cutoff distinct; no canonical Chow lift. |
| 7.6 motivic t-structure | Tate heart degree zero vs shifted Lefschetz; nonzero invisible object | Conservative cohomology and joint tensor bounds; boundedness derived; no Q-neutrality from ℓ-adic fiber. |
| 7.7 integral/real/real-closed targets | Torsion Hodge class, divisor, constant ω^{2k}, non-Archimedean field | Admissibility retained; no analytic Hodge transfer to arbitrary real closed R. |
| 7.8 divisor/zero/bundle/blow-up | Pic(point), projective space, point blow-up, conic with no real point | Full support/semialgebraic and descent prerequisites required, not just rational cycle facts. |
| 7.9 detectors/genus/norm | Disconnected real curve, empty-real curve, component pairing | Correct detector domains, mod-two duality and norm exactness; index/genus hypotheses explicit. |
| 7.10 obstruction/orthogonality/descent | p_g=0, deficient φ with ψ onto, algebraic vs full orthogonal complements | Detector surjectivity alone not a proof of IHC; complex integral algebraicity/Picard-torsion conditions retained. |
| 7.11 real examples/Campedelli | Weight-four anti-linear T²=−1, two quartics, anisotropic quadric | Invalid Campedelli construction replaced by obstruction and new-construction task, not an existence claim. |
| 7.12 unramified/torsion defects | Empty real locus, supported diagonal, torsion boundary, d≤3 | Exact twists/Q/Z and zero-on-real-locus condition; torsion Abel–Jacobi image/injectivity independent prerequisites. |
| 7.13 quartic threefold | Empty-real torsion F₂⊕(Q/Z)^30; real-point Fermat; full R/Z group | Only justified torsion result unconditionally in stated scope; full/Fermat calculations need named proof completion. |
| 7.14 open questions | General vs special field/range, conjectural strengthening | Kept as questions, not theorem targets proving them. |
| 7.15 compatible Hodge/Tate | Unit, L(1), quadratic Artin character | All primes and comparison data; not merely Hodge type or p-adic Hodge–Tate weights. |
| 7.16 BB rank predicates | Elliptic center 1, order zero with integral torsion, Hecke localization | Rational rank only; selected Hecke module/dimension equality not inferred from localization. |
| 7.17 height | Zero vector excluded; r=1 source sign; nonprimitive vector | Pairing and primitive domain explicit hypotheses; primary normalization remains unmet. |
| 7.18 unitary specialization | n=2 curve, reducible base change, cohomological occurrence | Particular cuspidal Π_j retained, not entire base change product. |
| 7.19 Li–Liu | r=1 gives −π/4, even [F:Q]; exactly two split places; nonzero localized module | Correct |R∩split|≥2, not difference; Hyp.4.5 only for height formula, full Hyp.6.6 and local repair premise explicit. |

## Validation

- `lean-check` on the absolute Suggested.lean path exited **0** at the build pins above. Only four `declaration uses sorry` warnings: the antipode milestone and three Hodge-class theorems. Two real-bodied definitions, four proved discriminating examples, no admitted data, no admitted examples, no auxiliary lemma development. No LSP or Lake build/update/cache command was used.
- Final `python3 research/blueprint/intake.py check-files` on the four authorized deliverables: **4 files, 0 problems**. Structural validation: 77 prose groups, each with at least three Checks; Layers 0–7 in order, each with Examples and Dependencies; README 199,933 bytes; Suggested.lean 150 lines. The 315-node crosswalk was checked for complete, unique assignment (313 retained, two supplied removals).
- `git diff --cached --check` passed. The staged path set is exactly the four issue deliverables; no private paths or fetched source content are included.
- Suggested.lean's closing comment names the heavy README constructions absent from the pinned carriers. The README and Lean use the same generality for the two kept definitions and the four milestone statements.

## Complete input crosswalk

The local node name below is the suffix of `MotivesAndAlgebraicCycles:MC.<layer>/`; the first number of the README section gives the layer. Every one of the 315 effective input nodes has a destination: 313 are grouped in the prose, and the two supplied constructions are listed in the removal table above. Multiple older names can refer to the same mathematical target; they are not repeated definitions. This crosswalk is handoff bookkeeping only.

| README section | Input local node names |
| --- | --- |
| 0.1 | `correspondence-group`, `correspondence-action-on-cycles`, `correspondence-composition`, `composition-associative`, `category-of-correspondences`, `correspondences-with-the-point`, `composition-compatible-with-action`, `correspondences-of-disjoint-union` |
| 0.2 | `graph-correspondence`, `correspondence-functor`, `transpose-correspondence`, `graph-acts-as-gysin-and-pushforward`, `tensor-of-correspondences`, `tensor-interchange`, `graph-against-diagonals` |
| 0.3 | `projective-line-idempotents`, `pointed-curve-idempotents` |
| 0.4 | `algebraic-equivalence`, `algebraic-equivalence-adequate`, `curve-parameterisation`, `algebraic-implies-homological` |
| 0.5 | `adequate-equivalence-relation`, `numerical-equivalence`, `equivalence-quotient-comparisons` |
| 0.6 | `universal-ch0-support`, `diagonal-decomposition`, `cohomology-sheaf-correspondence-action`, `supported-diagonal-vanishing`, `real-universal-surface-vanishing` |
| 0.7 | `low-degree-hypersurface-ch0`, `quartic-universal-support`, `intermediate-index`, `euler-characteristic-mod-index` |
| 0.8 | `karpenko-quadric` |
| 1.1 | `chow-motive`, `motives-category`, `motive-functor-h`, `motives-karoubian`, `twisted-correspondence-category` |
| 1.2 | `motives-monoidal`, `tate-twist`, `lefschetz-motive`, `motives-additive`, `h-projective-line`, `lower-twist-by-lefschetz` |
| 1.3 | `motive-dual`, `motives-rigid`, `dual-of-summand` |
| 1.4 | `chow-group-of-motive`, `chow-groups-representable`, `manin-identity-principle` |
| 1.5 | `motives-universal-property` |
| 1.6 | `projective-bundle-formula`, `diagonal-of-projective-bundle`, `projective-space-projectors`, `diagonal-as-zero-scheme` |
| 1.7 | `motives-mod-adequate-relation` |
| 2.1 | `graded-vector-spaces-koszul` |
| 2.2 | `weil-cohomology-data`, `classical-weil-cohomology`, `weil-pushforward`, `cycle-class-degree`, `trace-of-a-product`, `class-of-the-diagonal`, `euler-characteristic-self-intersection`, `chow-groups-under-field-extension`, `pushforward-along-projection`, `cycle-class-of-fundamental-class`, `weil-cohomology-of-schemes`, `weil-cohomology-by-base-change`, `lefschetz-trace-formula`, `chow-kernel-torsion`, `zero-cycles-separable-points`, `graph-duality-compatibility` |
| 2.3 | `homological-equivalence`, `weil-from-monoidal-functor`, `weil-to-monoidal-functor`, `realization-equivalence`, `homological-correspondences-embed`, `realization-round-trip`, `realization-quotients` |
| 2.4 | `chern-character-cycle-map`, `kunneth-components` |
| 2.5 | `normalized-cohomology-comparison`, `comparison-intertwines-correspondences`, `comparison-on-chow-motives` |
| 2.6 | `betti-realization`, `de-rham-realization`, `de-rham-betti-motivic-comparison` |
| 2.7 | `etale-realization`, `etale-cohomology-is-weil`, `etale-betti-motivic-comparison` |
| 2.8 | `curve-divisor-acceptance` |
| 3.1 | `trace-formula-for-correspondences`, `numerical-cycles-finite-dimensional`, `radical-base-change`, `nilpotent-of-vanishing-power-traces`, `numerical-implies-semisimple-algebras` |
| 3.2 | `pseudo-abelian-semisimplicity`, `dual-numbers-non-example`, `semisimple-abelian-category`, `semisimple-algebras-imply-semisimple-category` |
| 3.3 | `jannsen-semisimplicity`, `semisimple-category-implies-numerical` |
| 3.4 | `rank-of-a-motive`, `numerical-motives-tannakian`, `categorical-rank` |
| 3.5 | `radical-of-homological-correspondences`, `cohomology-of-numerical-motives`, `numerical-quotient-functor` |
| 3.6 | `tannakian-category` |
| 4.1 | `effective-geometric-motives`, `tate-stabilised-motives`, `inverting-a-tensor-object`, `symmetric-group-acts-trivially-on-tate-twists`, `geometric-motives-generated-by-smooth-projective` |
| 4.2 | `homotopy-invariance-and-mayer-vietoris`, `motive-of-projective-space`, `vector-bundle-invariance`, `projective-space-quotient`, `projective-space-inclusion-split`, `projective-bundle-theorem` |
| 4.3 | `smooth-blow-up-triangle`, `blow-up-formula-over-a-perfect-field`, `gysin-triangle-over-a-perfect-field`, `gysin-triangle`, `blow-up-triangle-and-formula`, `blow-up-smooth-centre-and-gysin-map`, `motivic-cohomology-higher-chow` |
| 4.4 | `equidimensional-cycles-transfers`, `equidimensional-cycle-sheaves`, `equidimensional-cycle-localisation` |
| 4.5 | `bivariant-cycle-cohomology`, `bounded-family-moving-lemma`, `naive-bivariant-comparison` |
| 4.6 | `projective-duality-for-equidimensional-cycles`, `duality-for-equidimensional-cycles`, `bivariant-duality`, `bivariant-suspension-and-gysin`, `bivariant-shifting-theorem`, `friedlander-voevodsky-duality` |
| 4.7 | `motives-with-compact-support`, `suslin-friedlander-comparison`, `suslin-friedlander-into-cycle-complex`, `compact-support-localisation-triangle`, `compact-support-kunneth`, `compact-support-geometric` |
| 4.8 | `hom-into-motives-with-compact-support`, `chow-motives-functor`, `chow-motives-into-geometric-motives`, `borel-moore-motivic-homology` |
| 4.9 | `tate-motives`, `geometric-motives-rigid`, `dual-of-motive-of-smooth-scheme`, `geometric-motive-dual`, `double-dual-isomorphism`, `dual-of-tensor-product` |
| 4.10 | `grothendieck-ring-of-varieties`, `compactly-supported-motivic-measure` |
| 5.1 | `completion-finite-end-model`, `completion-finite-dual`, `completion-filtered-descent`, `diagram`, `endomorphism-coalgebra` |
| 5.2 | `completion-abelian-reconstruction`, `completion-universal-factorisation`, `diagram-category`, `diagram-category-universal-property`, `diagram-category-generation` |
| 5.3 | `completion-pair-finiteness`, `completion-triple-adapter`, `completion-affine-vanishing`, `effective-pairs-diagram`, `singular-cohomology-representation` |
| 5.4 | `completion-basic-lemma-proof`, `completion-cellular-filtration`, `completion-cellular-complex`, `completion-constructible-basic-lemma`, `basic-lemma` |
| 5.5 | `completion-affine-cover`, `completion-all-pairs-extension`, `diagram-comparison`, `cohomology-with-supports`, `cellular-realisation-functor` |
| 5.6 | `completion-excision-completion`, `completion-tensor-assembly`, `completion-tate-localisation`, `graded-multiplicative-diagram`, `diagram-localisation`, `nori-motives`, `nori-tensor-category` |
| 5.7 | `completion-rigidity-proof`, `completion-de-rham-interface`, `completion-two-fibres`, `completion-tate-period`, `nori-rigidity`, `nori-generators`, `nori-top-cohomology`, `nori-gysin-isomorphism`, `nori-duality-morphism`, `rigidity-criterion` |
| 5.8 | `completion-equivariant-filtration`, `completion-correspondence-action`, `completion-simultaneous-correspondences` |
| 5.9 | `completion-nisnevich-bridge`, `completion-comparison-zigzag`, `completion-geometric-effective`, `completion-geometric-full` |
| 6.1 | `neutral-fibre-datum`, `neutral-finite-subcategory-representability` |
| 6.2 | `tensor-automorphism-group`, `rigid-bialgebra-is-hopf`, `neutral-reconstruction-coalgebra`, `neutral-tannaka-reconstruction` |
| 6.3 | `tannaka-functoriality`, `pro-algebraic-approximation`, `tannaka-finiteness-recognition`, `tannaka-connectedness-recognition` |
| 6.4 | `relative-reconstruction-datum`, `relative-beck-sufficient`, `relative-finite-piece-reconstruction`, `relative-coalgebra-assembly`, `relative-bialgebra-reconstruction`, `relative-rigid-antipode` |
| 6.5 | `torsor`, `torsor-groups`, `affine-torsor`, `affine-torsor-groups` |
| 6.6 | `comparison-algebra`, `period-space-of-a-diagram`, `periods-equal-comparison-algebra` |
| 6.7 | `formal-periods`, `formal-periods-equal-comparison-algebra`, `very-good-pairs-generate-periods` |
| 6.8 | `fibre-inner-form`, `fibre-functor-extension`, `iso-torsor`, `tensor-iso-scheme`, `tensor-iso-torsor` |
| 6.9 | `period-torsor`, `period-point` |
| 6.10 | `artin-diagram-category`, `artin-galois-equivalence`, `artin-nori-embedding`, `artin-galois-group`, `pure-tate-subcategory`, `pure-tate-graded-equivalence`, `pure-tate-galois-group` |
| 7.1 | `rational-classes-of-type`, `hodge-conjecture-interface`, `hodge-conjecture`, `hodge-class`, `cycle-classes-are-hodge` |
| 7.2 | `tate-variants-corrected`, `tate-conjecture`, `tate-conjecture-variants`, `strong-tate-conjecture`, `tate-beilinson-conjecture`, `tate-and-hodge-known-cases` |
| 7.3 | `lefschetz-standard-A`, `lefschetz-standard-B`, `hodge-standard-positivity`, `standard-implications`, `rational-kunneth-C`, `rational-numerical-D`, `kunneth-conjecture-C`, `conjecture-D`, `lefschetz-and-hodge-standard-conjectures` |
| 7.4 | `known-case-register`, `smash-nilpotence-proof-correction`, `known-cases-of-conjecture-C`, `smash-nilpotence` |
| 7.5 | `bloch-beilinson-axioms`, `murre-axioms`, `murre-bloch-beilinson-equivalence`, `bloch-beilinson-filtration-and-murre` |
| 7.6 | `motivic-t-structure-predicate`, `motivic-t-structure-consequences`, `motivic-t-structure` |
| 7.7 | `integral-hodge-predicate`, `real-integral-hodge-predicate`, `realclosed-integral-hodge-predicate`, `real-rational-descent-and-constants` |
| 7.8 | `lefschetz-one-one-cases`, `zero-cycle-and-projective-space-cases`, `real-blowup-and-birational-invariance` |
| 7.9 | `real-detector-orthogonality`, `real-genus-and-descent`, `real-curve-existence-and-index`, `real-norm-detector-exactness` |
| 7.10 | `real-obstruction-predicates`, `real-algebraic-orthogonality`, `real-surface-and-enriques-cases`, `real-integral-descent-criterion` |
| 7.11 | `real-obstruction-example-register`, `campedelli-construction-obstruction`, `quartic-surface-hodge-obstructions`, `quartic-valuation-and-cycle-obstructions`, `anisotropic-quadric-constant-obstruction` |
| 7.12 | `real-unramified-cycle-defect`, `real-boundary-and-torsion-cycles`, `real-torsion-orthogonality`, `complex-unramified-cycle-defect` |
| 7.13 | `quartic-threefold-torsion`, `quartic-sketch-completion-targets` |
| 7.14 | `cycle-question-ledger` |
| 7.15 | `compatible-hodge-tate-classes` |
| 7.16 | `beilinson-bloch-predicates` |
| 7.17 | `height-positivity-predicate` |
| 7.18 | `unitary-bb-specialization` |
| 7.19 | `li-liu-hypothesis-contract`, `li-liu-localized-nonvanishing`, `li-liu-arithmetic-inner-product` |

## Source-version receipt

These SHA-256 values identify the public PDFs inspected during this run; they do not certify a complete proof audit. The reading limitations above still apply. Locators in the roadmap use the printed pagination of these versions where available. HM17 is the 16 January 2017 text; HM25 is the annotated 1 July 2025 text; HMS14 is arXiv v5. No PDFs or extracted source text are part of the deliverable.

| Source | SHA-256 of inspected PDF |
| --- | --- |
| [STACKS.WEIL](https://stacks.math.columbia.edu/download/weil.pdf) | `01f8d89f2c09649af2e0355b4798a71ee8c31ff97f8f2fa13a5b907e0db7caa2` |
| [MILNE.MOT](https://www.jmilne.org/math/xnotes/MOT.pdf) | `a701ee93d7cefbcc9570afce76b0bd235b6a1bffbf1567a1d73c307d700cd768` |
| [ACMV.2017](https://www.math.colostate.edu/~achter/math/abtriv0717.pdf) | `defc0d6a23e3fd0a004413511a0e813cbf25fda77f683c089f978df953e59492` |
| [BW.2020](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf) | `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9` |
| [CTV.2011](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf) | `6a76c596025eb4379a800bcefb57c3f260226b202dae7919d191b4835a0a212a` |
| [KOLLAR.2014](https://arxiv.org/pdf/1312.3923v2) | `735a72d0615586eef919234b66504dbe36a8e62df33ad7c0b51641455b6cfde2` |
| [KARPENKO.1991](https://sites.ualberta.ca/~karpenko/publ/agiqf.pdf) | `af1c7a6dd92dc2ce1fffab96c1f73f7d0e091e0050dd4d31370addd473d48369` |
| [ACMV.DIAG.2025](https://smf.emath.fr/system/files/filepdf/smf_ast_455.pdf) | `5976fbb2b5f9ea45df90c092c4b2b52e24af18aaa2e505a8e8a67f48107d6e49` |
| [JANNSEN.1992](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf) | `f2a285cb7ba9f53a1dcb3844e41901dd4f8391cc2655b1b8195bc7a62a277fab` |
| [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf) | `f76706281f40b3c43c878bbd7c00c7520751d7b356a9da02004613ba5097e33a` |
| [HODGEII](https://www.numdam.org/article/PMIHES_1971__40__5_0.pdf) | `748edefb44fded8af67869abfed87062d66977d25b5d12f7d014f1810a063c3f` |
| [DELIGNE82](https://www.jmilne.org/math/Documents/Deligne82.pdf) | `827e3571c8049fc5d3aed8dfad912fee39a2f5dbf7341726c38235f035d32139` |
| [MILNE.LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077` |
| [SGA4.XVI](https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf) | `d93c3cee9212b35a031559fdf2b9556f96678522791fa7ca836710fc921af96a` |
| [SCHOLL](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/classical_motives.pdf) | `b14a6ef464a7f054e5bad45e01027a9783c4dca0781b662dace31ec3123accb4` |
| [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf) | `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1` |
| [GROTH1958](https://www.numdam.org/article/BSMF_1958__86__137_0.pdf) | `41eebe0b2c6718b762036b79fc3f494b630f7a91cf2b0594c68ebc5fc571b798` |
| [V.DM](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s5_0.pdf) | `b15df626bd9e0bc41080dc7712ae8bab8bc8cd2ad8d20bf668593ce87eee70ad` |
| [FV.BivCycl](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s4.pdf) | `c5edd97134be2d8e3d625b54e604739e6a25590ce686acc8a71a316cfa104554` |
| [SV.RelCycles](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/s2.pdf) | `4f2cfb7162e9ca5febd9010ffca3a3d1ebe3e34b7031c6d514bd02b00e53ce92` |
| [V.CTP](https://web.archive.org/web/20160101000000id_/http://www.math.uiuc.edu/K-theory/0368/s3.pdf) | `5072e58b964d8883e76f2e0f98ba9c73ecf8f43b6ab88129caae8294699434aa` |
| [FL.Moving](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/14.pdf) | `da01bf9a4ccc26bd421af94d562e266c43d008ee7d97790c377d4e7b1dbe87de` |
| [MVW.2006](https://www.claymath.org/library/monographs/cmim02.pdf) | `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020` |
| [Bittner.2001](https://arxiv.org/pdf/math/0111062v1) | `484d2c3586977503dc6f1b43fca158af059cd0f9c5322731d0ebae6d643e160c` |
| [HMS14](https://arxiv.org/pdf/1105.0865v5) | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [HM17](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v6.pdf) | `a77d6efa07d426114558c08aa6684979bb42b1dc08825c10f026d8de702c6326` |
| [HM25](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf) | `6d08014f21a616abb4ba7e177effad4d15e4a215b0f234ce3a4605c20a02b731` |
| [VW](https://arxiv.org/pdf/1111.5146v1) | `ac48f5a80a465807602c2a410cbfac68ccfdfc1540532c86d19f7374ddc428d2` |
| [HARRER](https://arxiv.org/pdf/1609.05516) | `26cd326422cd4ae1444d9a7ca60cebf74723450de522003de33784a4e09e3a06` |
| [BVHP](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/huber-TT1.pdf) | `1bab85843513dd77f4d2b485f4a357d217a5f4283b05b15f7ad01af595dc92ce` |
| [DM.TC](https://www.jmilne.org/math/xnotes/tc.pdf) | `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8` |
| [FS.2021.v4](https://arxiv.org/pdf/2102.13459v4) | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| [DELIGNE](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf) | `e308d945ea3cf5dad8b187a06509013712c467b589039eb41b365cc4c988f0c8` |
| [KLEIMAN](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf) | `0fca42935d8908ded002bb36675a3fe0863fce18279af36ab0fd33b879591ecf` |
| [JANNSEN94](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf) | `ba94f5191b9b9f803b9f798a3a9325d60ad59c6c2f6e94b32e157268e03520cd` |
| [BEILINSON10](https://arxiv.org/pdf/1006.1116v2) | `eba1a4dd5b90773518d252936bc5d49b6ac8fdb17c75de79300b6a91b0a2f1d6` |
| [TOTARO](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf) | `53be841ceb366122bd98d07c95291e6b46f7ab47f24b9fc6fb40c9b4b8ec6ec5` |
| [BW2](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf) | `6562e18516da996517b3baa26c2207489a8b8438fff841a3be643739a93bb508` |
| [TOTARO13](https://www.math.ucla.edu/~totaro/papers/public_html/integral.pdf) | `ff883f6915a311ffd010065dc029e9942fdca64fa84dbaa223f6bfa991f9e785` |
| [LI-LIU](https://www.math.columbia.edu/~chaoli/AIPF.pdf) | `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566` |
| [IP](https://arxiv.org/pdf/1806.10563v2) | `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5` |
| [BENOIST](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) | `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a` |
| [VOEVODSKY.CANCEL](https://arxiv.org/pdf/math/0202012v1) | `834de6dc40560395512507023eb6241e155673edf3c4f159836658dfee650d6a` |

The Roitman retrieval failed; no source hash or fresh proof verification is claimed for it. The two downloaded but unused Satake-related PDFs were not cited as support for this roadmap.

At the PR 196 head recorded above, inspected file hashes were:

| File | SHA-256 |
| --- | --- |
| ComplexComparison/README.md | `1c58d7db30b9acbe8656b29345d1c92cd334ef5b14cb35d644967b7adb96477c` |
| ComplexComparison/Suggested.lean | `90b55ff57ac585e7166f24dbad28e3acfb4541a69bd1c0bbf745a7281cef7c35` |
| EllAdicRealization/README.md | `9f327acf78145850c0fd8bf2818352d68ff1d647edd6b18644ebda81d2ab872b` |
| EllAdicRealization/Suggested.lean | `2e66334d05cda3b23af26dbe1aacd9be45a4f380c62a22b9ebca4fb07db2345c` |

## Submission state and review entry points

The package work is complete. The mathematical obligations in the limitations section are fully stated future roadmap targets or supplier contracts; no package deliverable is left for a continuation worker. Independent review should start with the eleven source/proof limitations, the Dedekind counterexample in §5.7, the support-cone direction in §5.5, the contravariant Chow bridge in §4.8, the coefficient/localization maps in §§5.6 and 6.6–6.9, and the real/arithmetic scope distinctions in Layer 7. The full crosswalk makes omissions checkable without reconstructing this session. No scratch file is required to continue review.
