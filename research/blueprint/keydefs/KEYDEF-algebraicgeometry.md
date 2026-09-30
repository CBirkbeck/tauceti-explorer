# Schemes, curves and moduli: key definitions

Complete survey for #5271, by Codex, session `codex-rtOQ9t`, 30 September 2026. The [machine-readable survey](KEYDEF-algebraicgeometry.json) contains 20 definitions and all catalogue item identifiers, source locators, missing-library contracts, dependencies and 131 sample API statements. This is a plan for formalisation, not a claim that the mathematics has been implemented.

The input has 295 items from 54 papers and 14 owner roadmaps. 96 input items support entries, 28 are owned elsewhere, 69 are near misses, and 102 are routine or proof-specific. Every input is covered; the reserve is a concluded classification, not unfinished work. The whole-catalogue scan inspected definition/construction candidates across 28,537 records from 207 papers. Counts below are distinct papers with explicit cited instances, not theorem mentions or inferred bibliographic influence.

## Definitions

| Definition | Papers | Owner | Size |
| --- | ---: | --- | --- |
| Chow groups, refined intersections and Chern operations | 13 | `SchemeAndStackFoundations:SF.5` | XL |
| Flat torsors, contracted products and twisting | 8 | `SchemeAndStackFoundations:SF.1` | XL |
| Normal-crossings boundaries and good compactifications | 5 | `AlgebraicModuliForArithmeticGeometry:R09.7a`; `AlgebraicModuliForArithmeticGeometry:R09.7d` | L |
| Algebraic quotient stacks and their atlases | 5 | `AlgebraicModuliForArithmeticGeometry:R09.4`; `SchemeAndStackFoundations:SF.1` | XL |
| Coherent dualizing complexes and exceptional inverse image | 4 | **Gap** | XL |
| Hilbert and Quot functors with universal families | 4 | `AlgebraicModuliForArithmeticGeometry:R09.2` | XL |
| Moduli stacks of smooth and stable pointed curves | 4 | **Gap** | XL |
| Numerical divisor and curve spaces, nef cones and numerical Picard | 4 | **Gap** | XL |
| Algebraic spaces and representable morphisms | 3 | `AlgebraicModuliForArithmeticGeometry:R09.3`; `SchemeAndStackFoundations:SF.1` | XL |
| Coarse moduli spaces of algebraic stacks | 3 | `AlgebraicModuliForArithmeticGeometry:R09.5` | XL |
| Equivariant sheaves and derived invariant sections | 3 | **Gap** | L |
| Gerbes, abelian bandings and neutralizations | 3 | `SchemeAndStackFoundations:SF.1` | XL |
| Azumaya algebras and Brauer groups on schemes | 3 | **Gap** | XL |
| Perfect schemes and spaces with finite-presentation models | 3 | **Gap** | XL |
| Sheaf cohomology with closed supports and localization | 3 | `SchemeAndStackFoundations:SF.2` | L |
| Weil restriction beyond affine targets | 3 | `AlgebraicModuliForArithmeticGeometry:R09.3` | L |
| Galois gerbs with algebraic kernels and projective limits | 2 | **Gap** | XL |
| Integrable Higgs bundles and parameter connections | 2 | **Gap** | XL |
| Inertia and relative automorphism groups | 2 | `AlgebraicModuliForArithmeticGeometry:R09.4`; `SchemeAndStackFoundations:SF.1` | L |
| Relative spectrum and vector schemes | 2 | `SchemeAndStackFoundations:SF.0` | L |

The JSON is ordered by decreasing paper count. Size M means one file with its basic API, L a small project, and XL several files or suppliers. Each entry has worked values, at least one counterexample, and supporting theorem/compatibility statements. `sourceEvidence` distinguishes direct source passages from catalogue locators; it does not mean that every cited paper was reread in full.

## Ownership findings

Eight notions have no explicit accepted owner for the stated generality:

- **Coherent duality:** StableReduction layer 2 owns coherent curve duality. Étale Verdier duality in EDC.1 has different coefficients; neither is general coherent exceptional inverse image.
- **Moduli of pointed curves:** the stable-curve and stabilization definitions are upstream, but their moduli stack and universal family are not. The proposed MotivicStructuresInModuliOfCurves direction has no accepted stage.
- **Numerical equivalence:** the general relative numerical spaces/cones and numerical Picard quotient need the proposed NumericalPicardAndContractionDescent supplier. The Picard quotient sheaf is additional work beyond taking a real vector-space quotient.
- **Equivariant sheaf cohomology:** arbitrary discrete-group actions moving a ringed base, including the Kings–Sprang lattice action, extend beyond the finite-group coefficient actions of current étale suppliers.
- **Scheme Brauer groups:** field CSAs and ring Azumaya algebras are already present. Global sheaf algebras, Morita classes and their PGL boundary comparison need an explicit owner; RP.2 is the arithmetic pairing consumer.
- **Geometric perfection:** the characteristic-p ring PerfectClosure exists. The missing work is geometric gluing, space descent, the adjunction and finite-presentation models.
- **Galois gerbs:** Kisin’s algebraic-kernel extensions and their compatible projective systems supply the Kottwitz protorus case. BG1 owns B(G) invariants, without an explicit construction of this carrier. The algebraicnt outer-stabilizer entry concerns homogeneous-space stabilizers and their outer filtrations, not the general gerb category.
- **Higgs/parameter connections:** the ringed-space, analytic and higher-dimensional supplier extends beyond ET.2b’s curve moduli. The proposed HodgeStructuresPartII direction has no accepted stage.

Three overlaps remain: algebraic spaces (R09.3 and SF.1), quotient stacks and inertia (R09.4 and SF.1). RS-27 explicitly retains the general space/stack constructions in R09.3/4, while RS-25 retains space quotients, diagonals and atlas independence in SF.1. These are residual overlaps after those accepted narrowings. The survey records both owners; it does not silently choose a winner or reopen the already-resolved finite-quotient/descent overlap with ModularCurves.

Some entries also expose scope extensions inside an existing owner: SF.5 needs the cited stack/proper-support Chow interfaces; R09.7a/7d cover characteristic-zero resolution, while the relative boundary definition has mixed-characteristic instances. General resolution in mixed characteristic is not asserted. SF.2 imports finite constructible localization from the étale suppliers and keeps the stated remaining site/coefficient comparisons.

## Imports and exclusions

The upstream boundary was checked against the actual roadmap text, not just the original item route:

- StableReduction layers 2 and 4 supply relative Proj, curve duality, general finite-type-ideal Rees blowups and their basic transforms. Its arithmetic-model resolution is not a general resolution of complex cyclic quotient surfaces.
- ModularCurves 0C/0E/0F/0G supply their finite quotients and torsors, effective descent, affine-target Weil restriction, and relative Grassmannian parameter spaces. Projective flags and abelian targets witness the remaining general Weil-restriction entry.
- JacobianChallenge and AlgebraicCurves supply curve Picard/Jacobian and function-field/model constructions. The relative-base direction for scheme tori is explicitly future work in ReductiveGroups layer 8.
- The [HodgeStructures successor section](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/HodgeStructures/README.md#successor-roadmap-variations-of-hodge-structure) and [issue167](https://github.com/TauCetiProject/TauCetiRoadmap/issues/167) reserve analytic variations upstream; this is ownership, not an implementation claim.
- Lisse finite coefficients, étale paths and integral adic systems belong to the upstream [CohomologicalPointCounting family in PR196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196), inspected at head `4bd72379658126cbe9be935656396f0c9dac4de0`: ConstructibleEtale layers2–3 and EllAdicRealization layers1–4. The family is still an upstream proposal; this survey does not re-plan it.
- Hurwitz spaces, nonreduced analytic spaces, pure motives, cotangent/derived base-change comparisons and alterations import their existing owners. Kings–Sprang25/028 imports the newly merged `algebraicnt/sequential-derived-limits` entry.

The routine decisions retain important distinctions. `Core(InvertibleSheaf X)` supplies the line-bundle groupoid carrier; its tensor and comparison theorems are not being declared proved. Relative normalization of Spec(Kbar) supplies the absolute integral-closure scheme, while its finite-cover limit API remains work. The existing general Weil-divisor sheaf supplies O(D), beyond curves. Contractions, parafactoriality, trace-free rigidity, geometric regularity and local-system qualifiers are predicates on supplied carriers; difficult theorems about those predicates do not by themselves make new key definitions.

Near misses are recorded with their failed criterion. The complete item lists and routine rationales are in the JSON:

| Reserve | Input items | Reason |
| --- | ---: | --- |
| chow varieties | 1 | Criterion 3: bounded-degree Chow varieties occur as explicit construction items only in PAPER-DEMARCO-MAVRAKI-YE-26. A Chow variety is not the Chow group modulo rational equivalence. |
| cyclotomic inertia | 1 | Criterion 3: the prime-to-characteristic colimit of Hom(Bμ_n,X), with its Frobenius-twisted rational points, occurs explicitly only in PAPER-GROECHENIG-WYSS-ZIEGLER-20-B. Ordinary inertia has a separate shared entry; it is not the same construction over an arbitrary field. |
| essential dimension | 4 | Criterion 3: the catalogue has these algebraic, prime-to-p and analytic essential-dimension definitions only for PAPER-FARB-KISIN-WOLFSON-24; different versions in one paper do not make two papers. |
| connection moduli | 2 | Criterion 3 in the general higher-dimensional/fixed-determinant scope: these Betti/de Rham/Dolbeault/Hodge moduli are explicit constructions in ESNAULT-GROECHENIG-20 only. The curve Hitchin moduli owned by ET.2b do not establish the higher-dimensional construction or arbitrary arithmetic base change. |
| admissible variation and canonical extension | 2 | Criterion 3 in this scope: the catalogue explicitly defines admissible graded-polarizable mixed variations and Deligne regular-singular canonical extensions here in LANDESMAN-LITT-24. Automorphic canonical extensions and linear mixed Hodge structures are different notions and do not provide a second instance. |
| weighted parabolic bundles | 1 | Criterion 3 for the weighted stability package: only LANDESMAN-LITT-24 has this explicit weighted parabolic-degree definition. SCHIFFMANN-16/53 defines unweighted quasi-parabolic flags and YUN-ZHANG-19/27 Iwahori lattice chains (owned by GS.0); choosing or forgetting weights is extra data, not a second instance of the weighted definition. |
| excellence variants | 6 | Criterion 3: the scheme excellence, Cohen–Macaulay/Serre variants and equidimensionality definitions are explicit catalogue items in CESNAVICIUS-21 only. Other papers assume excellent bases; those mentions are not counted as additional definition/construction instances. |
| tautological rings | 3 | Criterion 3: these tautological/semi-tautological rings and the Chow–Künneth generation predicate occur as explicit definitions in CANNING-LARSON-PAYNE-24 only. They are applications of shared moduli, cohomology and Chow objects, not extra evidence for those carriers. |
| ahk rank | 1 | Criterion 3: this birational rank corrected by the exceptional-prime count occurs explicitly in HACON-WITASZEK-23 only; it must not be conflated with the ordinary numerical Picard rank. |
| virtual dimension | 1 | Criterion 3: this presentation-independent virtual dimension is an explicit definition only in CESNAVICIUS-SCHOLZE-24. Its independence is a theorem, not a second definition instance. |
| elw index | 2 | Criterion 3: the Euler-characteristic index and its quotient-valued cycle map occur explicitly in BENOIST-WITTENBERG-20 only. The target is Z modulo the lower index, not an integer-valued Chow degree. |
| equivariant bloch ogus | 3 | Criterion 3 in this specific equivariant Betti/support setting: the coniveau, Bloch–Ogus and strict-effaceability definitions occur in BENOIST-WITTENBERG-20 only. The K-theory coniveau tower and general support cohomology have different construction contracts. |
| witt schemes | 1 | Criterion 3: the explicit sheaf-glued W_n(X) and formal inverse system W(X) are defined in BHATT-SCHOLZE-17 only. Witt affine Grassmannians and Greenberg transforms are different functors and are not counted as this construction. |
| root stacks | 2 | Criterion 3: finite and infinite root-stack constructions are explicit definition/construction items only in PAPER-BRESCIANI-24. They are not counted as banded gerbes over the whole base: the stabilizer jumps along the divisor. |
| general homogeneous quotients | 1 | Criterion 3 in this scope: CESNAVICIUS-19 explicitly constructs the diagonal quotient by a possibly nonflat group. This is not another instance of the finite-presentation flat torsor definition; its representability hypotheses must be proved separately. |
| smoothness ideals | 4 | Criterion 2 for the explicit minor-colon ideal: polynomial Jacobian matrices, minors, ideal sums/products/colons already supply its formula. The annihilator-of-cotangent-Ext version instead requires the independently owned full cotangent complex; proving the comparison of these formulas is work, but does not justify a duplicate key ideal carrier. |
| projective module presentation groupoid | 1 | Criterion 3: the specific stabilized-idempotent smooth presentation and isomorphism-space package is explicit only in CESNAVICIUS-19. The category of projective modules itself is existing data. |
| formal lefschetz | 2 | Criterion 3: the formal Lefschetz/effectivity conditions are explicitly defined only in CESNAVICIUS-19. They are not interchangeable with the weak-Lefschetz cohomology theorem. |
| henselization of pairs | 1 | Criterion 3 for this construction: the explicit initial henselian pair/ind-étale presentation appears in CLAUSEN-MATHEW-MORROW-21 only. Henselian assumptions and affinoid henselizations in other routes are not silently counted as the same general ring-pair construction. |
| etale k pi one | 1 | Criterion 3: this coefficient-specific étale K(π,1) comparison predicate appears explicitly only in FARB-KISIN-WOLFSON-24. Topological asphericity and pro-étale covers are not substitutes. |
| higher dimensional albanese | 1 | Criterion 3 in the residual scope: FARB-KISIN-WOLFSON-24 explicitly defines Albanese for higher-dimensional smooth proper varieties. Proper-curve Jacobians/Abel–Jacobi are owned upstream; BRESCIANI-24/56 instead requests the semiabelian Albanese torsor of an open curve. Neither silently supplies a second instance of the missing higher-dimensional construction. |
| local model specializations | 3 | Criterion 3: the specified Grothendieck surface valuation, mixed-DVR lifting and compatible punctured-normalization deformation packages occur in their respective single papers only. The general valuation, model and normalization carriers are separate suppliers. |
| unramified cohomology | 1 | Criterion 3: Jannsen’s all-degree valuation-residue definition is explicit in JANNSEN-16 only. Brauer residues give a specialized degree-two application; no unproved identification with arbitrary-coefficient unramified cohomology is assumed. |
| crossed module and semidirect quotients | 3 | Criterion 3 for these exact carriers: the Peiffer crossed module, reductive Picard quotient and source semidirect quotient occur explicitly in KISIN-17 only. The shared Galois-gerb entry does not silently supply these separate monoidal constructions. |
| hartogs ideal and formal local variants | 4 | Criterion 3: these exact Hartogs closure, Artinian formal-étaleness, unibranch and analytically-unramified-stack definitions occur in LE-LEHUNG-LEVIN-ETAL source catalogues only, with each notion attached to one paper. They are not interchangeable with ordinary étaleness or reducedness. |
| perfect stacks | 2 | Criterion 3: perfect algebraic stacks and their weakly smooth maps are explicitly defined in VANHOFTEN-24 only. The shared scheme/space perfection entry is not a silent construction of this higher categorical extension. |
| geometric quotients | 2 | Criterion 3: general geometric quotients of finite relations and proper actions are explicit definitions in PAPER-WITASZEK-22 only. Coarse moduli of stacks have a separate entry; a topological orbit quotient alone does not define either sheaf of functions. |
| geometric pushout | 1 | Criterion 3: the exact geometric-pushout datum with structure-sheaf fibre-product condition is explicit only in WITASZEK-22. A topological pushout does not furnish that scheme or algebraic-space structure. |
| picard p power localization | 3 | Criterion 3: these direct-limit multiplicative and Picard-groupoid localizations occur in PAPER-WITASZEK-22 only. In mixed characteristic the power map is multiplicative, not additive; geometric Frobenius perfection is a different construction. |
| localized chern class rank threshold | 1 | Criterion 3 for the extra construction: the Bloch localized Chern class for a complex of rank n−1 off its support, in degrees i≥n, occurs explicitly only in YANG-ZHAO-25. Ordinary Chern/refined Gysin operations do not automatically construct it; acyclicity off the support must not be incorrectly imposed. |
| begueri resolution | 1 | Criterion 3: the explicit smooth affine Bégueri resolution occurs only in CESNAVICIUS-SCHOLZE-24. Its exactness and representability are theorem obligations, not generic group-scheme axioms. |
| pro fppf and animated flat cohomology | 4 | Criterion 3: these ind-syntomic/pro-fppf and animated flat-site constructions occur explicitly in CESNAVICIUS-SCHOLZE-24 only. Ordinary fpqc/fppf topology and generic animation do not establish these coefficient and negative-degree cohomology interfaces. |
| cyclic quotient resolution | 1 | Criterion 3: the explicit Hirzebruch–Jung resolution of a complex cyclic quotient surface occurs here only in BAKKER-TSIMERMAN-16. Importing the general Rees blowup from StableReduction does not supply this construction; its arithmetic-model resolution theorem has a narrower base. |
| abelian character sheaves | 2 | Criterion 3: these normalized character-sheaf and avoidance-character-space constructions are explicit only in LAWRENCE-SAWIN-25. The torus description needs its precise finitely generated character-lattice convention; arbitrary continuous characters of a profinite étale group are not automatically an algebraic torus. |

Paper counts deliberately separate nearby notions. Weighted parabolic degree is not supplied by unweighted flags; a Chow variety is not a Chow group; an infinite root stack is not a banded gerbe over its whole base; mixed-characteristic multiplicative p-power localization is not geometric Frobenius perfection. Profinite fpqc torsors and gerbes are retained with their limit/topology contracts, without being called algebraic stacks of finite presentation.

## Library verification

Statements were read using `git show` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed library-coverage rows were used as leads; they were not treated as proof that a declaration exists. Important inspected files and their actual scope:

| Pin | File / declarations | Established scope |
| --- | --- | --- |
| mathlib | [Scheme](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) | Locally affine locally ringed spaces; no algebraic-space or algebraic-stack carrier. |
| mathlib | [Pseudofunctor.IsStack](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Descent/IsStack.lean) | Effective descent for a Cat-valued pseudofunctor; no representable diagonal or atlas. |
| mathlib | [Module.Grassmannian and map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Grassmannian.lean) | Module quotient of prescribed finite projective rank; scheme representability is a stated TODO. |
| mathlib | [AlgebraicCycle and map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean) | Locally finite cycles and residue-degree weighted map, not rational equivalence or intersection. |
| mathlib | [PerfectClosure and lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PerfectClosure.lean) | Direct-limit perfect closure for any commutative characteristic-p ring, with its mapping equivalence. |
| mathlib | [Perfection](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean) | Inverse-limit power-map sequences; the wrong affine variance for scheme perfection. |
| mathlib | [CSA, IsBrauerEquivalent, BrauerGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/BrauerGroup/Defs.lean) | Field central-simple-algebra quotient, not global scheme algebras. |
| mathlib | [IsAzumaya](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Azumaya/Defs.lean) | Finite projective faithful ring algebra with the multiplication-endomorphism criterion. |
| mathlib | [Sheaf.H and cohomologyPresheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) | Ordinary sheaf cohomology through Ext; no support/localization comparison. |
| mathlib | [DerivedCategory and Q](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | Localization of complexes; does not construct geometric coherent f!. |
| mathlib | [Action and Action.ρAut](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Action/Basic.lean) | Action on an object of a fixed category; semilinear sheaves moving the base still need their adapter. |
| mathlib | [groupCohomology and groupCohomologyIsoExt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean) | Discrete group cohomology via inhomogeneous cochains. |
| mathlib | [KaehlerDifferential and D](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | Universal ring derivation, not a connection on a vector bundle. |
| mathlib | [ModuleCat.Derivation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Differentials/Basic.lean) | Categorical derivations and Kähler differentials. |
| mathlib | [Scheme.Cover.RelativeGluingData.glued](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/RelativeGluing.lean) | Colimit for already supplied equifibered atlas data; no quasicoherent-algebra adapter. |
| mathlib | [Scheme.Hom.normalizationDiagram and normalization](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean) | Relative normalization through affine integral closure and gluing. |
| mathlib | [Core and CoreHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Core.lean) | Groupoid of categorical isomorphisms. |
| tauceti | [InvertibleSheaf](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Basic.lean) | Full category of locally rank-one sheaves; taking the core retains only isomorphisms. |
| tauceti | [SheafOfModules.IsInvertible](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/Sheaf/Invertible/Basic.lean) | Local rank-one condition. |
| tauceti | [CommHopfAlgCat.isPullback_fppfQuotientTorsor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Torsor.lean) | Kernel-pair square for a specified Hopf quotient, not arbitrary torsor/twist categories. |
| tauceti | [SchemeWeilDivisor and toAlgebraicCycle](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean) | Finitely supported codimension-one divisors and the cycle adapter. |
| tauceti | [SchemeWeilDivisor.sections, submodule and sheaf](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean) | O(D) on integral locally Noetherian schemes regular in codimension one; no curve restriction. |

A declaration-name index is not installed at the checker’s default baseline path, so its library-reference check validates syntax only. The direct statement reads above supply the evidence. No Lake project, cache download, build, or Lean language server was started; no pinned compiled build was available and no Lean deliverable is requested for this survey.

## Source reading record

The following are this worker’s direct readings, not inherited claims that earlier workers read whole papers. Locators not listed here were read in the full catalogue records. PDF page numbers refer to the identified download; published pages are given where different. Acquisition of additional papers did not count as reading them.

| Source | Direct reading | SHA-256 of downloaded PDF |
| --- | --- | --- |
| [PAPER-ESNAULT-GROECHENIG-20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf) | Published pp.108 and131 (PDF6,29): Higgs fields and λ-connections. | `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab` |
| [PAPER-ZHU-17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf) | Published pp.464–466,468,471–472 (PDF62–64,66,69–70): spaces, perfection, torsors and pfp models. | `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7` |
| [PAPER-CESNAVICIUS-22](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/split-unramified.pdf) | §1.7 (PDF5), Lemma7.1 (PDF21), Lemma7.2 (PDF22): right-torsor convention, patching, supports. | `984748e90f36730ddf4295176ca4b12e6aa7235c141461c0354e40320ef7476a` |
| [PAPER-GROECHENIG-WYSS-ZIEGLER-20](https://arxiv.org/pdf/1707.06417) | PDF5–7: quotient stacks, ordinary inertia, bands and transgression. | `f63d8093b87ce2fd380dc86c299e2959040ef9963c58227fb6e171ce4dfd9b31` |
| [PAPER-GROECHENIG-WYSS-ZIEGLER-20-B](https://arxiv.org/pdf/1810.06739) | PDF8–9: Situation2.6 and cyclotomic inertia, including Frobenius action. | `0139fc5ac0c4109e049b52c8bd298312954f84e63b29a4cb10b34cf66491a5f2` |
| [PAPER-KLEVDAL-PATRIKIS-25](https://link.springer.com/content/pdf/10.1007/s00222-025-01357-6.pdf) | Published pp.312–313 (PDF8–9), compactification/relative SNC definitions. | `0691a57a2aae841419ee97b8fac68aa8f3d499ed884933422a388106febab576` |
| [PAPER-BHATT-ETAL-23](https://arxiv.org/pdf/2012.15801) | arXiv2012.15801v3, PDF9–10 and18–19: dualizing normalization, supported cohomology and relative numerical spaces. | `533218825ca5045a9e8e04da1f78ef51e05c90dd83ca4ecb7cd6e8c68dff3d80` |
| [PAPER-BHATT-SCHOLZE-17](https://arxiv.org/pdf/1507.06490) | arXiv1507.06490v3, PDF35: Lemma8.11 and the recalled definitions of big and exceptional locus. | `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e` |
| [PAPER-BRESCIANI-24](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | Published pp.133 and135 (PDF5,7), fpqc classifying stacks and finite-gerbe projective limits. | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| [PAPER-CANNING-LARSON-PAYNE-24](https://arxiv.org/pdf/2307.08830) | PDF1 introduction opening and PDF2: stable moduli, tautological morphisms and the STE convention. | `fa320b35fc8b063ac09335da85ed133329dfbef1357b78f22d0a8d58ad5107a1` |
| [PAPER-KISIN-17](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1) | Author99-page PDF, §3.1.1 pp.34–35: algebraic-kernel gerbs, topology, morphisms, pro-systems and neutral example; opening statement of Lemma3.1.2. | `d3c19cddc9e8b073428de559a7215aae4f793490227b6c71d87477ccdb5d994a` |
| [PAPER-KINGS-SPRANG-25](https://arxiv.org/pdf/1912.03657) | arXiv1912.03657v4, AppendixA.1 PDF79–80: DefinitionsA.1–A.3 and spectral sequences. | `fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72` |
| [SUPPLIER-AOV-08](https://arxiv.org/pdf/math/0703310) | arXivmath/0703310v1, PDF18: Definition3.1, Theorem3.2 and Corollary3.3; source version recorded rather than identified with the later publication. | `081c9b056b9bd60c87393529793bdc7796134056064f79a8d7ba7b31f7b36462` |

Direct Stacks readings: [06PA](https://stacks.math.columbia.edu/tag/06PA) (inertia), [06PD](https://stacks.math.columbia.edu/tag/06PD) (gerbes), [0CZX](https://stacks.math.columbia.edu/tag/0CZX) (Hilbert versus Quot), [0DUF](https://stacks.math.columbia.edu/tag/0DUF) (categorical moduli), [0CBN](https://stacks.math.columbia.edu/tag/0CBN) (normal crossings), [01LQ](https://stacks.math.columbia.edu/tag/01LQ) (relative Spec), [05Y8](https://stacks.math.columbia.edu/tag/05Y8) (Weil restriction), [0AU3](https://stacks.math.columbia.edu/tag/0AU3) (coherent duality), [02RV](https://stacks.math.columbia.edu/tag/02RV) (rational equivalence/localization), [02T7](https://stacks.math.columbia.edu/tag/02T7) (divisor Gysin), and [0E73](https://stacks.math.columbia.edu/tag/0E73) (stable moduli). The literature guide 04UX was an acquisition lead, not a replacement for the AOV statement read.

Two source safeguards matter. Bhatt–Scholze define big by an ample/effective factorization; the catalogue’s abbreviated positive-self-intersection wording cannot be used without the nef condition. Cyclotomic inertia in GWZ20-B uses Hom(Bμ_n,−) with the stated prime-to-characteristic indexing and Frobenius convention; it is not ordinary inertia or silently only representable Hom. A λ-connection’s relative parameter satisfies dλ=0. The Lawrence–Sawin character-space reserve also retains its convention question: arbitrary continuous profinite characters are not automatically the points of an algebraic torus.

## Validation

`python3 scripts/check_keydefs.py research/blueprint/keydefs/KEYDEF-algebraicgeometry.json` reports **0 errors**, with eight gap warnings and three duplication warnings as explained above. All 295 input identifiers are covered; all 20 entries have at least two distinct cited papers and at least five API statements; the dependency graph is acyclic. One input, van Hoften F01, supplies both the algebraic-space carrier and its perfection, so it is cited by both distinct notions and counted once in input coverage. The 79 entry–paper incidences are deduplicated within each entry.

`git diff --check` passes. Changes are limited to this report and its JSON survey. There is no Lean compilation claim. Independent review remains the next programme step.
