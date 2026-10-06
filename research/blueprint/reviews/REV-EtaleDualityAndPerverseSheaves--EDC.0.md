# Independent review: Étale duality, EDC.0–EDC.3

**Verdict: needs_changes. Completed review, 6 October 2026.** Codex, session `codex-akfhVD`, reviewed the work of Claude, session `claude-eGs7SM`, independently for [issue #398](https://github.com/CBirkbeck/tauceti-explorer/issues/398). This is a finished review pass, not a checkpoint and not a claim that the plan is formalised.

The packet gives the right scheme-level targets and useful APIs, but its general constructible-biduality proof is not justified, the singular cycle-class and specialization arguments omit essential steps, and its proposed repair of the purity proof still needs trace compatibility. Its suggested file mentions all names but omits 95 API/test statements and gives several present operations hypotheses weaker than their actual domain. Clear corrections have been applied; the unresolved items are explicit gaps. These are defects of targets inside this pass, rather than an objection to honestly deferred stages.

## Counts and scope

| Item | Input | Reviewed result |
| --- | ---: | ---: |
| Nodes | 50 | 50 |
| Definitions / constructions | 4 / 15 | 4 / 15 |
| Theorems / comparisons / lemmas | 29 / 1 / 1 | 29 / 1 / 1 |
| API entries / unit tests | 141 / 76 | 141 / 76 |
| Planets | 24 | 24 |
| Baseline declarations | 41 | 40 |
| Requests / restructuring proposals | 10 / 3 | 10 / 3 |
| Gaps | 4 | 10 |
| Source issues | 7 | 10, all confirmed |
| Planned / closed stages | 8 / 0 | 8 / 0 |
| Node verdicts | — | 4 verified, 16 corrected, 30 unverifiable |

No nodes were added or deleted. 43 nodes have changes, including source-excerpt repairs; the table below records the fields and reasons. The remaining seven nodes were also checked. Target-level granularity was retained. No source proof was unnecessarily split into lemma nodes.

The packet's `complete` status means this independent pass is finished. Every stated target in the eight stages is represented; its dependency chains terminate in a checked baseline, another roadmap's requested input, or an explicit gap. `planned` is therefore the applicable coverage status under PROTOCOL §0, and none is `closed`. Coverage remaining lists were updated for the newly exposed proof/signature work. This does not certify those targets' proofs. Every implementation status remains `unchecked`.

All 19 definitions/constructions have at least three tests: eighteen have three or four, and cycle-class-map has five. The tests were checked for nonzero coefficients and actual discriminating examples, not just their count. API roles, recorded uses, functoriality, normalization and compatibility were read for all 141 entries. The principal API defects are their absent or overscoped Lean counterparts, listed below.

## Public sources and source fidelity

Every node locator and its hypotheses were read in the public versions below. All six downloaded PDF hashes agree with the packet. All 94 resulting excerpts (93 original references and one added base-change reference) are literal substrings after Unicode and whitespace normalization, each at most 300 characters. Composite quotes, restored mathematical OCR and ellipses were replaced with short literal prose; hypotheses were checked in the surrounding statement, not inferred from that shorter prose. The `sources.readSections` metadata now includes Milne's curve proof and Deligne's actual Frobenius pairing.

- [SGA 4 XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), retyped edition 71766d9, 30 July 2024; trace, effacement and §§3.1–3.2, including editor notes. The original 1973 scan was not read.
- [SGA 4 XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), public retyped edition; compact supports, localization, projection/base change and the quasi-finite trace.
- [Milne, Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), version 2.21, 22 March 2013; 14.7–14.8, purity, cycle/Chern classes and duality.
- [Stacks, More Étale Cohomology](https://stacks.math.columbia.edu/download/more-etale.pdf), version ed88ff78, 14 July 2026; growing sections, compact supports and derived upper shriek, including [tag 0GLK](https://stacks.math.columbia.edu/tag/0GLK).
- [Deligne, La conjecture de Weil I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), 1974 scan, §§2.3–2.14. The H⁰ compact-support subscript in (2.10) was checked visually because OCR suppresses it.
- [Yu, arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5), 18 July 2022, §6.1. The journal version was not read; the two reversed Hom orders are confirmed only for this public version.

## Corrections and node-by-node findings

Full node IDs have prefix `EtaleDualityAndPerverseSheaves:`. A verdict includes source/hypothesis and prerequisite review; an unresolved signature or essential proof gate is identified in its note. Changes to source excerpts do not certify an omitted argument. All fields changed relative to the input are listed here.

| Node | Verdict | Fields changed | Finding |
| --- | --- | --- | --- |
| `EDC.0/etale-derived-category` | corrected | tests, prerequisites | Confirmed the small étale site, geometric points, exact stalks and standard derived t-structure at the pin. Replaced the false composite-coefficient monodromy non-example by the F₂/ℤ₃ character −1; corrected the baseline t-structure prerequisite. |
| `EDC.0/constructible-ctf-complexes` | unverifiable | statement, tests | Corrected constructibility to require a finite stratification and Tor-amplitude to require a uniform bound. The finite-stalk criterion alone is false. All eight predicate APIs and three tests remain comment-only; the fourth test is only a module-level nonflatness shadow. |
| `EDC.0/tate-twist` | unverifiable | sources | Checked μ_n, the change-of-n convention and geometric Frobenius q⁻¹ against XVIII 1.1.1. Repaired excerpts. The Frobenius API/test still have no typed signature. |
| `EDC.0/derived-tensor-and-internal-hom` | verified | — | The tensor/internal-Hom adjunction, exact monoidal pullback and stalk formula agree with the E1 supplier contract; no duplicate derived-category construction is planned. |
| `EDC.0/cohomology-with-supports` | corrected | sources | Checked supports, localization, excision and dependence on Z_red against XVII 5.1.16 and Stacks growing sections. Repaired the source excerpts. Lean still needs an actual complement relation in the localization statements. |
| `EDC.0/coefficient-change` | corrected | sources | Checked restriction/derived extension of coefficients and the torsion projection formula. Repaired excerpts. The unrestricted Lean lower-shriek signatures require the hypotheses recorded in the signature gap. |
| `EDC.0/enhanced-compact-pushforward` | unverifiable | proofSteps, sources | Corrected the false direct passage from a termwise resolution to K-injective subcategories. Coherent compactification/localization comparisons are not supplied by abstract mates; recorded the supplier gap and editor note 37. Five APIs and a test remain comment-only. |
| `EDC.0/compact-pushforward-amplitude-and-colimits` | corrected | prerequisites, sources | Checked stalks, amplitude and colimits in XVII 5.2.8-10 and Stacks; replaced the abstract t-structure citation by the actual derived t-structure. Finiteness is a precise pending SF.2 request, not a baseline result. |
| `EDC.1:adjoint/exceptional-inverse-image` | corrected | sources | The adjoint, amplitude and étale/closed-immersion comparisons match XVIII 3.1.4-8 and Stacks. Repaired excerpts. Existence is conditional on the explicit enhancement gap; Lean compactifiability/torsion hypotheses remain to be encoded. |
| `EDC.1:adjoint/upper-shriek-pseudofunctor` | unverifiable | sources | Composition and localization are stated correctly; confirmed the transpose-direction misprint E10. Coherence remains conditional on the missing enhanced compactification diagram, not established by the abstract E3 mates alone. |
| `EDC.1:adjoint/sheafified-adjunction` | corrected | sources | Checked sheafified adjunction and induction/coefficient/base-change specializations in XVIII 3.1.10-11 and Stacks. Repaired excerpts and recorded compatible Godement-point choices E9. Typed prototypes remain narrower than all parts of the target. |
| `EDC.1:adjoint/local-cohomology-identification` | verified | — | The quasi-finite/closed-immersion identification agrees with XVIII 3.1.8 and the supports adjunction; the dependency is the imported finite-level f_!, not an invented purity theorem. |
| `EDC.1:adjoint/dualizing-complex` | corrected | tests, sources | The relative and field dualizing objects are f^!Λ and a^!Λ. Added a nonzero-coefficient condition to the mixed-dimension test. No uniform shift/twist is claimed before smooth purity. |
| `EDC.1:adjoint/verdier-dual` | corrected | tests | Checked evaluation, shifts, internal Hom and étale restriction. Corrected the non-example to assume nonzero coefficients and a nonempty scheme. Biduality remains a separate target. |
| `EDC.1:adjoint/formal-duality-exchange` | verified | — | Both formal exchanges follow from sheafified adjunction and composition without constructible biduality. The reverse exchanges are correctly reserved for the dependent biduality stage. |
| `EDC.1:adjoint/base-change-exchange-maps` | corrected | tests, sources | Checked the directions of the three mates and pasted squares. Replaced the invalid f=id non-example by the self-pullback square of a point in A¹; Lean now retains explicit cartesian witnesses rather than silently dropping the square argument. |
| `EDC.2:trace-purity/quasi-finite-flat-trace` | unverifiable | proofSteps, prerequisites, sources | Removed Algebra.trace: it acts on regular functions, not constant torsion étale sheaves. Replaced that proof by weighted geometric stalks/gluing from XVII 6.2.3 and the étale counit 6.2.11. One API and two tests still lack typed statements. |
| `EDC.2:trace-purity/first-chern-class` | unverifiable | sources | Kummer c₁, naturality and divisor/degree normalization agree with the sources and JacobianChallenge Layer A contract. Repaired excerpts. All six APIs and four tests remain comment-only pending the Picard carrier. |
| `EDC.2:trace-purity/curve-trace` | unverifiable | sources | Checked component multiplicities and trace normalization in XVIII 1.1.1-9; added the R¹/R² Kummer misprint E8. Four APIs and three tests remain comment-only; the typed curve trace omits relative dimension one. |
| `EDC.2:trace-purity/curve-h1-duality` | corrected | sources | Checked the independent Jacobian/Kummer proof in Milne 14.7-8 and XVIII 1.6.6. The Jacobian and Weil pairing are imported from their owners. Added self-injective/noetherian coefficients to the Lean pairing theorem; its current constant-coefficient prototype does not state the full sheaf theorem. |
| `EDC.2:trace-purity/curve-effacement-lemma` | unverifiable | sources | The curve effacement target and cover/spreading argument match XVIII 1.6.6-9 and the requested smooth acyclicity input. The named theorem is still only a comment in Lean. |
| `EDC.2:trace-purity/affine-space-trace` | unverifiable | sources | The iterated affine-line trace, permutation sign and normalization agree with XVIII 2.7-8. Three APIs and two tests remain comment-only. |
| `EDC.2:trace-purity/flat-trace` | unverifiable | statement, tests, api, sources | Restricted the trace-isomorphism criterion to the constant ℤ/n sheaf, n≥2; F=0 disproves the arbitrary-sheaf version. It is not a criterion for the derived counit. Corrected the two-component test. Six APIs/four tests and (*)_d geometry remain missing in Lean. |
| `EDC.2:trace-purity/smooth-effacement` | unverifiable | — | The higher-dimensional effacement and 2.14.4 factorization match XVIII 2.14; target-level granularity is appropriate. Its named theorem remains comment-only in Lean. |
| `EDC.2:trace-purity/smooth-purity` | unverifiable | sources | The smooth-purity statement and normalizations match XVIII 3.2 and Stacks. The claimed replacement of 3.2.3 still needs the trace-compatible pro-system calculation; recorded a separate gap rather than certifying the source-issue repair. |
| `EDC.2:trace-purity/top-degree-compact-cohomology` | corrected | statement, proofSteps, sources | Separated the canonical top cohomology of X_red from the weighted trace of a possibly nonreduced scheme. Multiplicity may make trace noninvertible. Corrected the smooth-open proof; the trace statement is conditional on (*)_d. The Galois calculation uses the reduced dense smooth open, rather than a potentially zero weighted trace. |
| `EDC.1:biduality/dualizing-complex-of-smooth-scheme` | verified | — | The smooth dualizing identification follows from smooth purity. The finite local-system calculation uses self-injective coefficient duality; it does not establish general constructible biduality or trait purity. |
| `EDC.1:biduality/self-injective-coefficients` | unverifiable | prerequisites, sources | Replaced the predicate Module.Baer by the actual theorem Module.Baer.injective. The ideal-extension proof and finite double-dual calculation are correct for O/πⁿ. Lean states only the ZMod self-injective special case and does not yet encode the full DVR target. |
| `EDC.1:biduality/constructible-biduality` | unverifiable | proofSteps, sources | XVIII 3.2.6 supplies only the smooth local calculation. The boundary induction uses the reverse exchange later derived from biduality; no noncircular proof is given. The regular one-dimensional base additionally lacks its actual dualizing/purity input. Recorded both gaps. |
| `EDC.1:biduality/duality-exchange-isomorphisms` | unverifiable | — | The formal deduction from biduality is correct, but its essential prerequisite remains unestablished. The complete constructible exchange theorem is also comment-only in Lean. |
| `EDC.1:biduality/recollement-adjunctions` | unverifiable | — | The unbounded recollement adjunctions and triangles are valid. Their restriction to Dᵇ_c and the duality comparison depend on the unresolved biduality/finiteness inputs; the named constructible theorem remains comment-only. |
| `EDC.1:biduality/relative-and-geometric-duality` | corrected | proofSteps, sources | Corrected geometric duality by applying adjunction directly to the base-changed scheme, avoiding improper use of proper base change for nonproper a. The finite-field absolute-versus-relative counterexample is correct. |
| `EDC.2:pairings/poincare-duality-torsion` | corrected | proofSteps, sources | The torsion pairing follows from smooth local duality and geometric adjunction. Added self-injective/noetherian coefficients to the typed perfect-pairing theorem; arbitrary coefficients retain derived Hom rather than an unjustified ordinary dual. Removed the forward proof reference to the dependent cup-product node; evaluation and the counit identify the pairing directly. |
| `EDC.2:pairings/cup-product-trace-pairing` | corrected | statement, proofSteps, prerequisites, sources | Corrected the graded-sign argument: for general odd middle degree it proves alternation only when 2 is invertible. Curve alternation for all n uses the separate Weil-pairing proof. Kept Frobenius/monodromy compatibility; its complete signature remains to be supplied. Listed the curve Weil-pairing result directly for that separate alternation argument. |
| `EDC.2:pairings/galois-frobenius-equivariance` | unverifiable | statement, sources | Restricted eigenvalue multiplicities to field coefficients; finite torsion rings retain only pairing equivariance. Replaced the unrelated Weil I 2.12 excerpt by the actual Frobenius pairing (2.4). The Frobenius theorem is comment-only in Lean. |
| `EDC.2:pairings/adic-and-rational-poincare-duality` | unverifiable | sources | Checked the derived-limit/Ext¹ distinction and the rational perfect pairing. Perfect-complex and reduction/lim¹ hypotheses are precise SF.2 requests. The lisse-adic theorem remains comment-only in Lean. |
| `EDC.2/curve-poincare-duality-with-j-star-statement` | unverifiable | statement, sources | Corrected the mixed ℚ_ℓ/finite-ring trace target to Λ throughout. Invariant/coinvariant duality for self-injective finite coefficients is valid; it is not a counterexample to derived Verdier duality. The j_* local-system theorem has no typed signature and depends on biduality. |
| `EDC.2:pairings/extreme-degree-cohomology` | unverifiable | statement, sources | Corrected nontrivial rank-one monodromy: vanishing of coinvariants needs field coefficients or a unit χ(γ)−1. The ℤ/4, monodromy −1 example has coinvariants ℤ/2. Confirmed H⁰_c in the scanned Weil I passage; Lean theorem remains comment-only. |
| `EDC.2:pairings/lisse-tensor-hom-duality-on-curves` | unverifiable | sources | Checked both tensor-Hom orders directly in Yu arXiv v5 and confirmed E6. The finite-field equivariance is conditional on Weil data; the full lisse theorem remains comment-only in Lean. |
| `EDC.2:pairings/relative-duality-locally-constant` | unverifiable | sources | Checked the locally constant relative-duality spectral-sequence argument and its hypotheses in XVIII 3.2.1 and Stacks. It uses self-injectivity locally, not global projectivity of every sheaf. Its typed lisse/family theorem is still missing. |
| `EDC.3/smooth-pair-purity` | corrected | sources | Checked smooth-pair purity through composition and local charts; it does not supply Gabber absolute purity. Corrected the Lean pure dimensions of X and Z and the invertibility hypothesis. |
| `EDC.3/semi-purity` | corrected | sources | Checked semi-purity and the codimension-(c+1) support restriction in Milne 23.1. Corrected the typed pure-dimension, quasi-compactness and coefficient hypotheses. This does not justify dropping singular strata of codimension only c. |
| `EDC.3/fundamental-class` | unverifiable | tests, sources | The integral-cycle class via the dense smooth locus is correct. Replaced the unsupported universal quadric-cone counterexample by crossing divisors xy=0, whose local supported H² has two branches. Five APIs/four tests and actual codimension/integrality hypotheses remain missing in Lean. |
| `EDC.3/gysin-map` | unverifiable | proofSteps, tests, prerequisites, sources | Added fundamental-class as a direct prerequisite. Corrected general proper trace transitivity to use adjunction counits, not the flat trace theorem alone. Added nonzero coefficients to the non-ring-map test. Seven APIs/three tests and the correct smoothness/dimension carriers remain missing. |
| `EDC.3/gysin-sequence` | unverifiable | sources | The Gysin sequence follows from localization and smooth-pair purity; the family version needs relative smooth purity. Repaired excerpts. The named theorem remains comment-only in Lean. |
| `EDC.3/projective-bundle-freeness` | unverifiable | sources | The projective-bundle decomposition and local trivialization proof are mathematically correct. The SF.0 lines convention is coherent with the all-plus Chern relation. The typed projective-bundle theorem is absent. |
| `EDC.3/chern-classes` | unverifiable | tests, sources | Confirmed all plus signs: P(E)=Proj Sym(E∨) parametrizes lines, so ξ=−c₁(L) for rank one. No sign correction is needed. Added Λ≠0 to the c₂ non-example. All seven APIs/four tests remain comment-only. |
| `EDC.3/cycle-class-map` | unverifiable | proofSteps, sources | The additive fundamental-class map is justified. Rational-equivalence descent on singular W and the Tor intersection comparison are not proved by semi-purity or Milne 23.4. Recorded the exact codimension failure, absent public comparison source and missing graded Lean carrier/APIs. |
| `EDC.3/self-intersection-formula` | unverifiable | proofSteps, prerequisites, sources | Added SF.5 deformation geometry as a direct prerequisite and request consumer. Smoothness of a nonproper family does not identify its cohomology fibres; the specialization comparison remains a gap. The named self-intersection theorem is absent from Lean. |
| `EDC.3/projective-space-cohomology` | unverifiable | proofSteps, prerequisites, sources | Removed division by a very-ample multiple modulo n. The integral Chow self-intersection route is conditional on cycle compatibility; added curve trace as the direct normalization prerequisite. The named projective-space/degree theorem remains comment-only in Lean. |

The clear mathematical corrections include the composite-ring monodromy counterexamples; global constructibility versus merely finite stalks; the self-pullback base-change counterexample; the constant-sheaf trace criterion and nonreduced multiplicities; geometric versus absolute duality; graded skew symmetry versus alternation; finite-ring coinvariants versus field vanishing; and the invalid division by a very-ample multiple modulo n. Nonzero coefficients were added where a proposed non-example otherwise becomes true for the zero ring. The all-plus Chern relation was checked and retained because this packet uses projective bundles of lines.

The proof of enhanced compact pushforward no longer claims that applying a resolution termwise gives a functor between K-injective subcategories. General proper pushforward transitivity now uses composition of adjunction counits. Singular rational-equivalence descent and intersection multiplicities are explicit proof gates rather than a purported consequence of semi-purity or Milne's omitted comparison proof. Self-intersection now requests SF.5 directly and exposes the missing cohomological comparison.

## Pinned baseline audit

All 41 original entries were checked for both name and statement in their cited module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. All 40 retained entries have an independent confirmation in `checked`; the replacement statements were also read. The recorded Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. There are no Tau Ceti declaration baselines or Tau Ceti imports in this packet: the Jacobian roadmap is a requested supplier, not a declaration claimed to be present.

| Citation | Action and reason |
| --- | --- |
| `mathlib:Algebra.trace` | Removed, together with its import and the sole consuming prerequisite. Algebra trace on regular functions does not define trace on constant torsion étale sheaves, especially with inseparable/nonreduced fibre multiplicities. The trace node uses XVII 6.2.3 instead. |
| `mathlib:Module.Baer` | Replaced by `mathlib:Module.Baer.injective`. The former is the extension predicate; the latter is the theorem that produces an injective module. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | Replaced by `mathlib:DerivedCategory.TStructure.t`. The abstract structure alone does not supply the canonical t-structure, its bounded subcategories or cohomology characterization. |
| `mathlib:AlgebraicGeometry.IsSeparated` | Retained but corrected its `provides` description: separated and locally finite type alone do not imply Nagata compactifiability; finite type also includes quasi-compactness, with a qcqs base. |

The inventory below groups every retained name by its actual file. Links are fixed to the reviewed Mathlib pin. The packet's `provides` entries record the relevant statement; these declarations supply carriers or basic properties, not the six-operation, purity or Chow compatibility theorems being planned.

| Module at the pin | Confirmed declarations |
| --- | --- |
| [Mathlib/AlgebraicGeometry/Sites/Etale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) | `AlgebraicGeometry.Scheme.smallEtaleTopology` |
| [Mathlib/AlgebraicGeometry/Morphisms/Etale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Etale.lean) | `AlgebraicGeometry.Scheme.Etale`, `AlgebraicGeometry.Etale` |
| [Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean) | `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` |
| [Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean) | `AlgebraicGeometry.Scheme.pointSmallEtale`, `AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'` |
| [Mathlib/CategoryTheory/Sites/Point/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Point/Basic.lean) | `CategoryTheory.GrothendieckTopology.Point.sheafFiber` |
| [Mathlib/Algebra/Homology/DerivedCategory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | `DerivedCategory`, `HasDerivedCategory.standard`, `DerivedCategory.singleFunctor` |
| [Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean) | `CategoryTheory.Functor.mapDerivedCategory` |
| [Mathlib/CategoryTheory/Adjunction/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Adjunction/Basic.lean) | `CategoryTheory.Adjunction` |
| [Mathlib/CategoryTheory/Triangulated/Functor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Functor.lean) | `CategoryTheory.Functor.IsTriangulated` |
| [Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean) | `DerivedCategory.TStructure.t` |
| [Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) | `CategoryTheory.Sheaf.H` |
| [Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean) | `CategoryTheory.Abelian.Ext` |
| [Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean) | `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.SmoothOfRelativeDimension` |
| [Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean) | `AlgebraicGeometry.IsClosedImmersion` |
| [Mathlib/AlgebraicGeometry/OpenImmersion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/OpenImmersion.lean) | `AlgebraicGeometry.IsOpenImmersion` |
| [Mathlib/AlgebraicGeometry/Morphisms/Separated.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Separated.lean) | `AlgebraicGeometry.IsSeparated` |
| [Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean) | `AlgebraicGeometry.LocallyOfFiniteType` |
| [Mathlib/AlgebraicGeometry/Morphisms/Proper.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean) | `AlgebraicGeometry.IsProper` |
| [Mathlib/AlgebraicGeometry/Morphisms/Flat.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Flat.lean) | `AlgebraicGeometry.Flat` |
| [Mathlib/AlgebraicGeometry/Morphisms/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean) | `AlgebraicGeometry.IsFinite` |
| [Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean) | `AlgebraicGeometry.LocallyQuasiFinite` |
| [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean) | `rootsOfUnity` |
| [Mathlib/Algebra/Module/Injective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Injective.lean) | `Module.Injective`, `Module.Baer.injective` |
| [Mathlib/LinearAlgebra/PerfectPairing/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/PerfectPairing/Basic.lean) | `LinearMap.IsPerfPair` |
| [Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean) | `AlgebraicGeometry.AlgebraicCycle`, `AlgebraicGeometry.AlgebraicCycle.map` |
| [Mathlib/FieldTheory/Perfect.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean) | `PerfectField` |
| [Mathlib/FieldTheory/IsSepClosed.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsSepClosed.lean) | `IsSepClosed` |
| [Mathlib/Data/ZMod/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Defs.lean) | `ZMod` |
| [Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean) | `AlgebraicGeometry.Scheme.Hom.finrank` |
| [Mathlib/AlgebraicGeometry/AffineSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineSpace.lean) | `AlgebraicGeometry.AffineSpace` |
| [Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean) | `DerivedCategory.homologyFunctor` |
| [Mathlib/CategoryTheory/Sites/ConstantSheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/ConstantSheaf.lean) | `CategoryTheory.constantSheaf` |
| [Mathlib/CategoryTheory/Shift/CommShift.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Shift/CommShift.lean) | `CategoryTheory.Functor.CommShift` |

The reviewed `data/library-coverage.json` screen agrees that the étale six-operation/duality targets are absent or only partial. Existing small étale sites, points, derived categories, the actual t-structure, algebraic cycles and module perfect pairings are reused. No existing Tau Ceti layer was replanned or changed.

## Closure, suppliers, ownership and planets

Supplier statements were read in the EnhancedDerivedSheaves E1/E3 documents and packet, SchemeAndStackFoundations SF.0/SF.2/SF.5, upstream JacobianChallenge Layers A/D, and AbelianSchemesAndArithmeticModuli A3. E1 supplies K-flat/K-injective models and derived tensor; E3 supplies abstract coherent diagrams/mates, not the particular coherent compactification diagram this proof still needs. SF.2's planned integration of ConstructibleEtale, CompactSupport, EtaleBaseChange and EllAdicRealization justifies requesting those inputs. Its coherent O-module biduality is not étale constructible biduality.

All ten requests name the required hypotheses and consuming nodes. SF.5 now lists self-intersection as a consumer, and that node has the direct prerequisite. Existing exact E1/E3 packet IDs are used; coarse SF stages remain explicit requests where no supplying exact statement was established. The Jacobian geometry is requested from its upstream owner, the Weil pairing from A3, and the cup/Weil comparison follows the existing TraceFormula Layer 8 ownership contract. No second owner is invented.

Six gaps were added: enhanced localization/compactification coherence; noncircular constructible biduality and the regular one-dimensional base; singular cycle descent and Tor multiplicities; self-intersection specialization; missing/overscoped Lean signatures; and trace compatibility in the proposed replacement purity proof. The four pre-existing trait-purity, stack, perfect-space and Euler-characteristic boundaries remain explicit. Gaps name their consumers, and coverage lists the remaining work. The dependency graph passes the acyclicity and scope checker, but that syntactic check does not prove the open arguments.

Planet names were checked as actual definitions, constructions and named theorems from the sources. The 24 planets are distributed as follows; neither collector stage adds planets.

| Layer | Planets |
| --- | ---: |
| EDC.0 | 5 |
| EDC.1:adjoint | 3 |
| EDC.1:biduality | 3 |
| EDC.2:trace-purity | 6 |
| EDC.2:pairings | 2 |
| EDC.3 | 5 |

All names are within the protocol's length and six-per-layer limits. The three existing proposals remain proposals for maintainer action; no decomposition or atlas data was edited.

## Source issues

All seven original findings were checked at their locator, and three missed findings were added with this review's own confirmation. Every entry has `review.by` equal to this job ID. No claim about an unavailable edition is inferred from the retyped edition or arXiv v5.

| Issue | Verdict | What is confirmed |
| --- | --- | --- |
| E1 | confirmed | The author's remark concerning the proof of XVIII 3.2.3 is present. This confirms the recorded proof problem, not that the packet's alternative trace calculation is complete. The correction now says that explicitly. |
| E2 | confirmed | The inconsistent coefficient N and unbalanced parenthesis in the 2024 retyping of (3.2.1.1); n is intended. |
| E3 | confirmed | Consecutive K indices in 2.14.2 must be i+1. Scope is the retyped edition. |
| E4 | confirmed | Milne 24.2 must shift by −2e, and its closed-immersion codimension is −e. The correction now includes both slips. |
| E5 | confirmed | Milne §23 leaves the Chern character undefined and does not supply the comparison proof 23.4. The packet's direct construction does not by itself repair rational-equivalence/intersection compatibility. |
| E6 | confirmed | Both Hom argument orders in Yu (6.1.1)–(6.1.2) are reversed in v5; the corrected tensor-Hom formulas agree with REV-PAPER-YU-23. |
| E7 | confirmed | Editor note 2 identifies the missing reference for general quasi-projectivity of curves; local gluing avoids that reference. |
| E8 (added) | confirmed | The Kummer boundary on P¹ in XVIII 1.1.6 has degree two, while the retyping prints R¹p_*. Checked visually in the PDF. |
| E9 (added) | confirmed | Editor note 37 requires compatible choices of geometric points for Godement localization in 3.1.9.3; arbitrary independent resolutions do not give that isomorphism. |
| E10 (added) | confirmed | Editor note 38 says the transposed composition comparison in 3.1.13.1 initially goes in the reverse direction. Its inverse gives the intended isomorphism. |

## Suggested Lean file

The final file was elaborated with `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean` against the shared pinned Mathlib build. **Exit 0; 135 warnings, all declarations using `sorry`; no other warning or error.** The machine had more than 20 GB available, the single invocation finished within 20 minutes, and no background Lean process remains. Only the English crossing-divisor comment was adjusted after that successful elaboration; typed code is unchanged.

The review removed the algebra-trace import; gave exchange definitions and pasted-square statements explicit cartesian witnesses; replaced the invalid base-change non-example; added torsion/invertibility to constant biduality; added self-injective/noetherian coefficients to perfect-pairing statements; and corrected smooth-pair and semi-purity dimensions/coefficients. These changes elaborate. This verifies types of the written prototypes, not truth of their placeholder proofs or agreement of every prototype with the intended theorem.

Of the 217 API/test entries, 81 APIs and 41 tests have typed representatives, while **60 APIs and 35 tests are only comments**. This count excludes additional missing named theorem statements and does not certify that all 122 written representatives have the right hypotheses. The fourth ctf test, for example, proves only module nonflatness rather than the full complex finite-Tor non-example.

The complete absent API/test inventory is:

| Node | Comment-only APIs | Comment-only tests |
| --- | --- | --- |
| `constructible-ctf-complexes` | `IsConstructibleComplex`, `IsCtf`, `isConstructibleComplex_shift`, `isConstructibleComplex_of_triangle`, `isConstructibleComplex_iff_stalk`, `IsCtf.tensor`, `IsConstructibleComplex.pullback`, `IsConstructibleComplex.lowerShriek` | `isCtf_constant`, `not_isConstructible_infinite_skyscrapers`, `isConstructible_zero` |
| `tate-twist` | `tateTwist_geomFrobenius` | `tateTwist_frobenius_eigenvalue` |
| `enhanced-compact-pushforward` | `enhancedLowerShriek`, `enhancedLowerShriek_homotopy`, `enhancedLowerShriek_preservesColimits`, `enhancedLowerShriek_comp`, `enhancedLowerShriek_baseChange` | `not_lowerShriek_eq_pushforward` |
| `quasi-finite-flat-trace` | `finiteFlatTrace_stalk` | `finiteFlatTrace_square_map`, `not_finiteFlatTrace_counit_ramified` |
| `first-chern-class` | `firstChernClass`, `firstChernClass_tensor`, `firstChernClass_pullback`, `firstChernClass_pow`, `firstChernClass_divisor`, `firstChernClass_changeN` | `firstChernClass_projectiveLine`, `firstChernClass_trivial`, `not_firstChernClass_injective`, `firstChernClass_degree_curve` |
| `curve-trace` | `curveTrace_baseChange`, `curveTrace_components`, `curveTrace_quasiFiniteFlat`, `curveTrace_firstChernClass` | `curveTrace_projectiveLine`, `curveTrace_twoLines`, `not_curveTrace_isIso_doubleLine` |
| `affine-space-trace` | `affineSpaceTrace_succ`, `affineSpaceTrace_perm`, `affineSpaceTrace_baseChange` | `affineSpaceTrace_line`, `affineSpaceTrace_swap` |
| `flat-trace` | `trace_baseChange`, `trace_comp`, `trace_finite`, `trace_affineLine`, `trace_kunneth`, `trace_isIso_iff` | `trace_projectiveSpace`, `trace_dimZero_separable`, `trace_twoComponents`, `not_trace_ignores_multiplicity` |
| `fundamental-class` | `fundamentalClass_restrict`, `fundamentalClass_smooth`, `fundamentalClass_divisor`, `fundamentalClass_etale`, `fundamentalClassOfCycle` | `fundamentalClass_hyperplane`, `fundamentalClass_nodalCubic`, `fundamentalClass_whole`, `not_fundamentalClass_purity_singular` |
| `gysin-map` | `properPushforward_projection`, `properPushforward_comp`, `gysin_one`, `trace_properPushforward`, `properPushforward_finiteFlat`, `gysin_baseChange`, `gysin_eq_properPushforward` | `gysin_point_curve`, `gysin_hyperplane_powers`, `not_properPushforward_ring_hom` |
| `chern-classes` | `chernClass`, `totalChernClass`, `chernClass_pullback`, `chernClass_one_lineBundle`, `totalChernClass_whitney`, `chernClass_eq_zero_of_rank_lt`, `chernClass_projectiveBundle_relation` | `chernClass_tangent_projectiveSpace`, `chernClass_trivial`, `chernClass_sum_lines`, `not_chernClass_two_of_line` |
| `cycle-class-map` | `cycleClass_rationalEquiv`, `cycleClass_divisor`, `cycleClass_pullback`, `cycleClass_pushforward`, `cycleClass_intersection`, `trace_cycleClass_point`, `cycleClass_galois` | `cycleClass_hyperplane`, `cycleClass_transverse_curves`, `cycleClass_principal`, `not_cycleClass_injective` |

The further comment-only theorem targets include curve/smooth effacement, full constructible exchanges and recollement, the Frobenius/lisse/adic/relative-local-system statements, and the Gysin sequence, projective-bundle decomposition, self-intersection and projective-space/degree formulas. Several other nodes have only constant-coefficient or special-case prototypes.

The already written localization triangles also need the actual relation between a closed immersion and its open complement. Lower and upper shriek need compactifiability and coefficient scope; trace needs (*)_d, dimension and torsion; curveTrace needs dimension one; fundamentalClass needs integral cycles of the stated codimension; cycleClass needs Z^r rather than the entire ungraded AlgebraicCycle carrier; Gysin and properPushforward need the actual smoothness and pure-dimension difference. These omissions are listed as revision work, not silently replaced by new Prop-valued stand-ins. The initial honest-comment convention does not satisfy PROTOCOL §13's requirement for every API/test statement.

## Confirmed red-team routes and reader agreement

**RT-AREA-etale/3:** EDC.0–EDC.3 remain scheme-level. The stack Part II proposal explicitly owns the missing stack sites/six operations, duality, perverse/IC, decomposition and correspondence trace theory. The gap now names EDC.8 YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48, GS.1/GS.3, ET.2b and the ShtukaSpecialCyclesAndHigherSiegelWeil and RamifiedGeometricClassFieldTheory Part II consumers. Scheme results are their prerequisites, not a completed stack formalism. Future stack hypotheses must distinguish Artin/DM, proper and representable cases.

**RT-AREA-etale/16:** Perfect pfp spaces require GS0 Witt/perfect-space geometry first, then finite-type model transport of E01–E03, E07 and E14/characteristic classes. The E07 orientation/model-independence proof gate remains explicit. E10–E13 share equivariant theory with the stack Part II; E09 needs Braden localization; only finite-type E06 remains an EDC.7 source. The corrected top-degree node separates canonical reduced cohomology from multiplicity-weighted traces, so it does not promise a nonreduced trace isomorphism.

The reader document was read but is not an allowed deliverable of issue #398. Its broad scope boundaries already acknowledge the two Part II needs, but it does not spell out all the exact RT/3 item routes and repeats superseded claims corrected here: stalk-only constructibility, the base-change non-example, arbitrary-sheaf trace criterion, general graded-sign alternation, singular cycle descent and very-ample division, among others. The next blueprint revision must synchronize it with the corrected packet and signature inventory. The packet/document pair cannot be accepted in its current state; no out-of-scope reader edit was made.

## Validation and questions for the orchestrator

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: **0 errors, 0 warnings** after the review object and all corrections.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean`: **compiled**, only `sorry` warnings, as detailed above.
- Independent source-hash/excerpt, node-review coverage and API/test-name inventories checked; no node is omitted from `review.checked`.
- Submission file/path validation and `git diff --check` are recorded in the handoff.

The revision should resolve the proof/signature defects within these targets; it need not plan the honestly excluded Part IIs to pass. The orchestrator has the following ownership/scope decisions:

1. Queue the original blueprint's revision with packet, suggested file **and reader document** as deliverables so the corrected mathematics and exact red-team routes can agree.
2. Assign the regular one-dimensional base dualizing/absolute-purity input explicitly; decide whether EDC or the trait-geometry follow-up supplies it. Neither SF.2 coherent O-module duality nor a finiteness request is a substitute.
3. Obtain exact accepted SF.2/SF.5 supplier node IDs when available, and an E1/E3 contract for the actual compactification/localization diagram. Keep the precise requests until then.
4. Reconcile the two Part II proposals' common equivariant/stack operations with one owner, preserving the GS0 perfect-space dependency and Zhu's model-independence gate.

The repository handoff carries the exact revision order and durable file references; it does not depend on scratch downloads or local paths.
