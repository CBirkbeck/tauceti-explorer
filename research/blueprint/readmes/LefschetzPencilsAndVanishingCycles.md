# Lefschetz pencils, nearby cycles and vanishing cycles

*Roadmap `LefschetzPencilsAndVanishingCycles`: the complete blueprint, assembled from its two reviewed parts.*

This document is definitive. Its machine form is two part packets, and the node sections below are generated from them as their independent reviews left them, so that document and packets agree node for node:

- `research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.0.json`: stages LPV.0–LPV.6, 89 nodes. Written by BP-LefschetzPencilsAndVanishingCycles--LPV.0 and reviewed by REV-LefschetzPencilsAndVanishingCycles--LPV.0 on 6 October 2026, which corrected it in place and returned it as **needs changes**. The review found the target inventory, the source work and the gaps sound, but found many suggested Lean statements false without their omitted hypotheses and many unit tests weaker than their statements. It left all seven stages `partial`, each with its exact remaining work. Each LPV.0-part node below carries the review's verdict on it.
- `research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.7.json`: stage LPV.7 with its two sub-layers LPV.7:semistable-curves and LPV.7:invariant-cycles, 36 nodes. Written by BP-LefschetzPencilsAndVanishingCycles--LPV.7 and **accepted** by REV-LefschetzPencilsAndVanishingCycles--LPV.7 on 6 October 2026, which corrected it in place. All three stages are `planned`, with six explicit gaps.

The LPV.7 part imports the LPV.0 part's nodes by id and never restates them; no node id occurs in both packets. This document replaces the two part documents, whose node text lagged the corrections their reviews made. The suggested Lean file `research/blueprint/suggested/LefschetzPencilsAndVanishingCycles.lean` joins the two parts' files. It is a naming proposal, not an implementation, and `implementationStatus` is `unchecked` for every node. It asserts no statement without the hypotheses it needs: where those hypotheses have no pinned form (an actual nearby-cycle functor, a Lefschetz pencil, a perverse t-structure, a spectral object of a filtered complex), the declaration is kept under its name as a commented *omitted signature* recording the missing premises, and a node whose main declaration is kept that way says so in its header line below. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap builds the geometric theory of degenerations in étale cohomology that Deligne's proofs of the Weil conjectures, and the atlas's arithmetic applications, rest on. It owns five bodies of mathematics.

1. **Nearby and vanishing cycles over a henselian trait** (SGA 7 XIII). For a scheme X of finite type over a henselian trait S = Spec R, the functor Ψ_η = ī^*j̄_* from sheaves on the generic fibre to sheaves on X_s̄ with a continuous action of Gal(η̄/η), its derived functor RΨ, the vanishing cycles RΦ, the triangle sp^*i^*K → RΨ_η(K_η) → RΦ(K) →, the variation Var(σ) : RΦ(K) → RΨ_η(K), the stalk formula through the strict-local Milnor fibre, local acyclicity, the proper and smooth base-change compatibilities, the specialization sequence of a proper family, constructibility, coefficient change and the adic and rational realizations.
2. **Local monodromy** (SGA 7 I and XIII, Weil II §1.6–1.7, Illusie 1994 §1). The canonical and normalized variation maps, the finite logarithm N : V → V(−1) of a unipotent inertia action, the geometric local monodromy theorem (quasi-unipotence), the monodromy filtration and its primitive decomposition, relative monodromy filtrations, maximal unipotence, the semisimple trace, and the two-component semistable nearby complex that gives the algebraic route to the odd Picard–Lefschetz formula.
3. **Ordinary quadratic singularities and the Picard–Lefschetz formula** (SGA 7 XII and XV, Weil I §4). Ordinary quadratic forms in every characteristic, smooth quadrics and their cohomology, ordinary quadratic points and their henselian local equations, the nearby cycles of a standard quadratic degeneration, the vanishing cycle δ, the specialization sequence of a proper family with one ordinary quadratic point, and the Picard–Lefschetz formula with its sign table and its characteristic-two and nonordinary branches.
4. **Lefschetz pencils and their monodromy** (SGA 7 XVII–XVIII, Weil I §5, Weil II §4). Lefschetz pencils and the dual variety, their existence after a Veronese re-embedding, the incidence blowup, descent of good axes over finite fields, the cohomology sheaves of a pencil, the vanishing subspace E, its radical quotient E/(E ∩ E^⊥) with the induced pairing, the restriction and Gysin formulas and the middle-degree reduction, conjugacy of vanishing cycles, generation by local transvections, absolute irreducibility, and the Kazhdan–Margulis theorem that the monodromy image is open in the symplectic group; with the conditional orthogonal branch of Weil II §4.4.
5. **Perverse nearby cycles, semistable degenerations and invariant cycles** (Illusie 1994 §4, Illusie 1991, Saito 2003, Weil II §3.6 and §6.2). Perverse t-exactness of nearby and shifted vanishing cycles, Gabber's duality, intermediate extension, the filtered-colimit support criterion used for Igusa varieties; the nearby cycles, monodromy operator and monodromy filtration of a proper semistable curve with their graph and Jacobian descriptions; the strictly semistable weight spectral sequence; and Deligne's local and global invariant-cycle theorems, through potentially pure complexes and the support-bound weak Lefschetz theorem.

The headline theorems are the Picard–Lefschetz formula (`LPV.2/local-picard-lefschetz-formula`), the existence of Lefschetz pencils (`LPV.3/existence-of-lefschetz-pencils`), the Kazhdan–Margulis open-image theorem (`LPV.5/kazhdan-margulis-open-image`), perverse exactness of nearby cycles (`LPV.6/nearby-perverse-exactness`), the monodromy filtration of a semistable curve (`LPV.7:semistable-curves/curve-monodromy-filtration`), the weight spectral sequence (`LPV.7:semistable-curves/snc-weight-spectral-sequence`), and the local and global invariant-cycle theorems (`LPV.7:invariant-cycles/local-invariant-cycles`, `LPV.7:invariant-cycles/global-invariant-cycles`).

The layers come in a fixed order, and the order is part of the plan. LPV.0–LPV.5 use no weight theorem: they are what Deligne's proof of the Riemann hypothesis in Weil I consumes. LPV.6 uses no purity or decomposition theorem. LPV.7:semistable-curves uses no weights either. Only LPV.7:invariant-cycles imports weights, from DeligneWeightsAndPurity DWP.5, DWP.7 and DWP.8, and it in turn supplies DWP.9's hard Lefschetz theorem; it never imports DWP.9.

- **LPV.0, nearby and vanishing cycles on actual sites.** The trait, its geometric points and inertia; the fibre-product topos X_s ×_s S and its galoisian description; Ψ, RΨ, RΦ, the vanishing triangle, the variation and the stalk formula; derived functorialities and the specialization sequence; the geometric fibre maps on small étale sites; oriented products; constructibility; coefficient and trait change; adic realization; and the comparison with Huber's adic nearby cycles on its admissible domain.
- **LPV.1, inertia, variation and the monodromy operator.** can/var with their composition identities, the finite logarithm and twisted N, geometric quasi-unipotence, ramified rescaling N′ = eN, the monodromy filtration with strictness, primitive decomposition, tensor and dual rules, relative monodromy uniqueness, tame restriction along normal crossings, maximal unipotence, the semisimple trace, the two-component semistable nearby complex, and Frobenius equivariance NF = qFN.
- **LPV.2, ordinary quadratic singularities and Picard–Lefschetz.** Thirty-one nodes: the quadratic algebra of SGA 7 XII (ordinary forms, normal forms, the even Clifford centre and discriminant cover, smooth quadrics and their cohomology, affine quadrics and δ), the local geometry of SGA 7 XV (ordinary quadratic points, the Tjurina module, henselian approximation and versal deformation, canonical forms and local equations, cones and punctured cones, standard quadratic degenerations, their nearby cycles and variation, the local description of δ), the local Picard–Lefschetz theorems XV 3.1–3.3 and their global form in Weil I §4, the complex sign table, the wild characteristic-two branch, nonordinary concentration and the Fresán–Sabbah–Yu example.
- **LPV.3, existence of sufficiently ample Lefschetz pencils.** The pencil, the dual variety and incidence family, existence after a Veronese embedding of degree at least two, the ordinary-axis open and its jet estimates, the incidence blowup, finite-extension descent over 𝔽_q, and the inseparable-Gauss and low-dimensional cases.
- **LPV.4, global vanishing cycles and middle-degree reduction.** The cohomology sheaves of a pencil, including δ = 0; the vanishing subspace E; the common fixed space of local transvections; the radical quotient and its nondegenerate pairing; pencil restriction and Gysin; the Leray filtration and middle-degree reduction; the local-to-global fixed-space comparison; and hypersurface cohomology outside the middle degree.
- **LPV.5, irreducibility and open symplectic monodromy.** Bertini surjectivity, conjugacy of vanishing cycles, generation by local transvections with E^⊥ the invariants, absolute irreducibility of E/(E ∩ E^⊥), Weil I Lemma 5.11, compact subgroups of Sp(V)(ℚ_ℓ) with full Lie algebra, the Kazhdan–Margulis theorem; and the characteristic-two, orthogonal, ADE and integral branches of Weil II §4.
- **LPV.6, perverse nearby cycles and comparison interfaces.** Perverse exactness of RΨ and of RΦ[−1], nearby-cycle Verdier duality, intermediate-extension exchange under stated exchange hypotheses, coefficient conventions, the filtered-colimit support criterion, and the Igusa semiperversity interface.
- **LPV.7, invariant cycles and semistable-curve exports.** An index layer only (`LPV.7/export-index`). Its two sub-layers are independent:
  - **LPV.7:semistable-curves**: the étale normalization complex, nodal nearby cycles and the node residue sign, the specialization sequence of a nodal curve, graph and component cohomology, the factorization of N through the negative edge form, curve invariant cycles and the monodromy filtration centred at 1, the Jacobian and Tate realization and its pairing, base-change compatibility and worked examples; then strict normal crossings: the nearby-cycle stalks, the graded nearby complex, the weight spectral sequence with its restriction-plus-Gysin differential, and monodromy on the spectral sequence.
  - **LPV.7:invariant-cycles**: specialization with invariant codomain, arithmetic spreading, the continuous Wang sequence and the localization-duality cross, the weight bounds, the local invariant-cycle theorem (Weil II 3.6.1) and its complex form (3.6.4), potentially pure models, the potentially pure local theorem 6.2.9, affine vanishing and support-bound weak Lefschetz 6.2.11, the pencil obstruction and image equality, general-pencil monodromy, and the global invariant-cycle theorem 6.2.12.

The blueprint has 125 nodes: 89 in the LPV.0 part and 36 in the LPV.7 part. They are 68 theorems, 15 comparisons, 14 constructions, 12 lemmas, 10 definitions and 6 applications, with 120 API items, 91 unit tests and 41 planets (at most six on any layer). No layer is `closed`. LPV.0–LPV.6 are `partial`, and LPV.7 with its two sub-layers is `planned`; the layer sections give the remaining work.

**What is not here.**

- The étale site, sheaf cohomology, constructible and lisse sheaves, the derived direct and inverse images with smooth and proper base change, the Frobenius trace formula and the complex comparison: the CohomologicalPointCounting roadmaps (PR196), integrated through SchemeAndStackFoundations SF.2, and the constructible six operations, duality, pairings, cycle classes, Gysin maps, blowup formulas, weak Lefschetz, affine vanishing and early perverse sheaves of EtaleDualityAndPerverseSheaves EDC.0–EDC.6.
- The arithmetic tame character and Weil–Deligne carrier: ArithmeticGaloisRepresentations R01.2. Continuous Galois cohomology: ArithmeticGaloisDuality R02.1–R02.2. Tame fundamental groups and Abhyankar's lemma: InverseGaloisAndArithmeticFundamentalGroups IG.1.
- Weights, purity, the Weil I and Weil II estimates, hard Lefschetz and the decomposition theorem: DeligneWeightsAndPurity DWP.1–DWP.10. LPV.7:invariant-cycles imports DWP.5, DWP.7 and DWP.8, and DWP.9 consumes it. The weight–monodromy conjecture is claimed nowhere.
- Nodal geometry, normalization and dual graphs of nodal curves: Tau Ceti StableReduction layer 1. Generalized Jacobians, toric characters and the positive valuation pairing: NeronModelsAndSemistableAbelianVarieties R11.4.
- Hyodo–Kato monodromy: CrystallineCohomology CR.6, compared with étale N by CohomologyComparisons.
- Nearby cycles over valuation rings of higher rank and for adic spaces in general: ClassicalAdicEtaleCohomology H1, which LPV.0 supplies on the trait.
- Igusa varieties, their towers and boundary geometry: IgusaVarietiesAndTorsionConcentration IG.2–IG.4.

## Boundaries

The roadmap's ownership follows the restructuring proposal RS-17, accepted by REV-RS-17. RS-17 keeps the roadmap, narrows LPV.1, LPV.4, LPV.6, LPV.7 and LPV.7:semistable-curves, and makes LPV.7 an index of its two independent sub-layers.

**Suppliers.** These are the prerequisites of the nodes below that lie outside the roadmap.

- **The pinned libraries.** Mathlib supplies the linear algebra the monodromy theory runs on: transvections and their fixed spaces, bilinear forms with orthogonals and the alternating predicate, skew-adjoint Lie subalgebras and irreducible Lie modules, the nilpotent exponential, spans, kernels, ranges, quotients, corestrictions and ranks; quadratic maps with their polar forms, nondegeneracy (in the Elman–Karpenko–Merkurjev sense, which matches SGA 7's ordinary forms) and even Clifford algebras; valuation inertia subgroups and henselian local rings; schemes with the small étale topology, proper, smooth, integral, finite-type and open-immersion predicates, generic points and pullback squares; derived categories, shifts, spectral objects and spectral sequences; and group representations with their invariants. Tau Ceti supplies the scheme-theoretic generic and special fibres, unipotent elements of the general linear group and the divided-power formula for the nilpotent exponential. Neither library has nearby cycles, ordinary quadratic singularities, Lefschetz pencils, dual varieties, étale fundamental groups of schemes, perverse sheaves or semistable curves: the reviewed library audit AUDIT-19 finds every layer of this roadmap not built. The declarations are listed under "What the pinned libraries have".
- **SchemeAndStackFoundations.** SF.2 is the integration owner of the PR196 roadmaps: ConstructibleEtale layers 0–3 and 7–9, EtaleBaseChange layers 2–8, EllAdicRealization, TraceFormula layers 2–3 and ComplexComparison layers 8–12. SF.0 supplies projective spaces, Grassmannians, Veronese maps and tangent spaces (from Tau Ceti ProjectiveSchemesAndSmoothMorphisms), excellence and completion interfaces and Severi–Brauer schemes; SF.4 is asked for the Rees-algebra blowup of a two-generated regular ideal. The reserved key definitions `SchemeAndStackFoundations:key/excellent-schemes` and `SchemeAndStackFoundations:key/henselization` are cited by node id. General Artin approximation and Elkik versality are asked for as SchemeAndStackFoundations, Part II.
- **EtaleDualityAndPerverseSheaves EDC.0–EDC.6.** The étale derived category, constructible complexes, coefficient change and Tate twists (EDC.0); exceptional inverse images, localization and biduality (EDC.1); cup-product trace pairings and Poincaré duality (EDC.2:pairings, EDC.2:trace-purity); cycle classes, Gysin sequences and maps, self-intersection and projective-space cohomology (EDC.3); blowup and projective-bundle formulas, weak Lefschetz and affine vanishing (EDC.4); early perverse t-structures and intermediate extension (EDC.5); and the finite, adic and rational realizations with Huber's admissible comparison (EDC.6). Two Part II extensions are requested: absolute purity and Gysin diagrams over an excellent henselian trait (EDC.3), and the rectified trait perversity, integral p/p+ conventions and enlarged nonconstructible category (EDC.5).
- **EnhancedDerivedSheaves E0, E1, E4.** Coherent filtered derived categories with functorial cones (E0), the enlarged derived étale category with filtered colimits (E1), and derived adic completion of compatible systems (E4).
- **ArithmeticGaloisRepresentations R01.2.** Decomposition and inertia, the henselian specialization sequence of Galois groups, tame and wild inertia, the tame character t_ℓ and its Kummer reductions, and the arithmetic Weil–Deligne carrier. RS-17 makes R01.2 the owner of the arithmetic carrier and LPV.1 the owner of the trait-geometric N.
- **ArithmeticGaloisDuality R02.1, R02.2.** Continuous inertia representations on rational ℓ-adic cohomology, inverse-limit exactness, and continuous Hochschild–Serre for the Wang sequence.
- **InverseGaloisAndArithmeticFundamentalGroups IG.1.** The algebraic tame fundamental group, Abhyankar's lemma, SGA 1 XIII specialization and the tame presentation of ℙ¹ minus finitely many points.
- **DeligneWeightsAndPurity.** DWP.5 (the local invariant weight bound Weil II 1.8.8), DWP.7 (proper smooth purity and cohomological bounds) and DWP.8 (the punctual weight filtration, the arithmetic purity of 6.2.7 and the direct-image weight estimates) for LPV.7:invariant-cycles; DWP.4 only for the late orthogonal and integral applications of LPV.5 (see Dependencies).
- **Other atlas roadmaps.** FiniteFieldsAndCharacterSums FF.0 (finite-field arithmetic for pencil descent); IgusaVarietiesAndTorsionConcentration IG.4 (the finite-level formal models of the LPV.6 application); NeronModelsAndSemistableAbelianVarieties R11.4 (normalization sequence, graph characters, the Picard–Néron identity component and the integral monodromy pairing); AbelianSchemesAndArithmeticModuli A3 (Jacobians and Tate pairings); ComplexComparisonPartII C5 (the Betti realization for the complex invariant-cycle theorem).
- **Tau Ceti roadmaps.** StableReduction layers 1, 4 and 5 (nodes, normalization and dual graphs; blowups on arithmetic surfaces; regular and minimal models); EllipticCurves layer 4 (the Tate curve); HodgeStructures milestone L2 (mixed Hodge structures and strictness); and in representation theory LieHighestWeight layer 0 (the SL₂ engine), ClassicalGroups layer 0, CharacterTheory layer 4 and RootSystems layer 5. The atlas also links Tau Ceti LocalFieldsRamification and ClassFieldTheory to LPV.1, and ProjectiveSchemesAndSmoothMorphisms to LPV.3.

**Consumers.** These come from the atlas stage links, RS-17's links and the nodes of other packets that cite this roadmap.

- **DeligneWeightsAndPurity** is the main consumer. LPV.3, LPV.4 and LPV.5 supply DWP.3 (the radical quotient of the vanishing system and the open symplectic image) and DWP.4 (Weil I's dimension induction); LPV.0–LPV.2 supply DWP.5 and DWP.6 (local monodromy purity and coefficient-specific vanishing cycles); LPV.7:invariant-cycles supplies DWP.9 (Weil II 4.1.3, 4.3.9 and 6.2.13); LPV.7:semistable-curves supplies DWP.10 (semistable curve weights). Its packets cite `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.0/derived-functorialities-and-specialization-sequence`, `LPV.3/dual-variety`, `LPV.3/existence-of-lefschetz-pencils`, `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LPV.4/vanishing-subspace`, `LPV.4/vanishing-quotient-and-its-pairing`, `LPV.5/bertini-surjectivity-on-fundamental-groups`, `LPV.5/monodromy-generated-by-local-transvections`, `LPV.5/kazhdan-margulis-open-image`, `LPV.7:semistable-curves/curve-normalization-cohomology` and `LPV.7:semistable-curves/curve-monodromy-filtration`, and several stages.
- **WeightsInEtaleCohomology** (Deligne weights, Part II) R34.3–R34.6: the trait specialization comparison, the arithmetic Picard–Lefschetz normalization, the pencil descent and vanishing-quotient comparisons, and the semistable models of modular curves.
- **ClassicalAdicEtaleCohomology H1**, with H1:valuation-nearby-cycles and H1:formal-adic-comparison: it identifies Huber's nearby cycles with LPV.0's on the trait and transports the variation; it cites seven LPV.0 nodes and two LPV.2 nodes.
- **IgusaVarietiesAndTorsionConcentration IG.4** and **EndoscopicTransferAndUnitaryTraceComparison** ET.2a and ET.5: perverse nearby cycles and the support criterion of LPV.6.
- **AutomorphicGaloisRepresentations** R19.2 (Carayol's vanishing-cycle filtration and special places), **AutomorphicGaloisRepresentationsPartII** AG2.5, **ModularCurvesPartII** R13.6 and **PadicHodgeTheory** R06.5: the trait formalism, N and the semistable-curve calculations.
- **WeilConjectures** WC.3 and **PadicDifferentialEquationsAndRigidCohomology** RD.7 (pencils and their monodromy), **EtaleDualityAndPerverseSheaves** EDC.7 and **ExcursionOperatorsAndSpectralAction** ES7:function-field-automorphic (invariant cycles), **CrystallineCohomology** CR.5:log-algebra (Abhyankar input) and **MordellLawrenceVenkatesh** LV.0 (Weil I Lemma 5.11).

**Owners.** RS-17 gives each piece of mathematics that more than one roadmap planned exactly one owner. The rows that concern this roadmap:

| Mathematics | Owner | Formerly also planned in |
|---|---|---|
| Trait nearby and vanishing functors, the strict-local stalk formula, the specialization sequence and the proper and smooth comparisons; Huber's valuation extension keeps its additional scope | **LPV.0** | WeightsInEtaleCohomology R34.3, ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles |
| Trait-geometric N, can/var, geometric quasi-unipotence and the canonical linear-algebra monodromy filtration; weight purity is a later theorem | **LPV.1** | DWP.5, R34.3 |
| Arithmetic tame character, Weil–Deligne carrier and arithmetic quasi-unipotence under local-field hypotheses | ArithmeticGaloisRepresentations R01.2 | LPV.1 |
| Ordinary quadratic vanishing cycles and the parity- and characteristic-qualified local Picard–Lefschetz formulas | **LPV.2** | R34.3 |
| Veronese/Bertini pencils, blowup geometry and descent after a finite extension of the ground field | **LPV.3** | DWP.4, R34.4 |
| The pencil vanishing system E, E^⊥, the radical quotient and the pencil-specific Leray and Gysin comparisons before weights | **LPV.4** | DWP.3, DWP.4, R34.4 |
| General projective-bundle and smooth-centre blowup cohomology, weak Lefschetz, with their twists | EtaleDualityAndPerverseSheaves EDC.4 | LPV.4, DWP.4, R34.4 |
| Conjugacy, generation, irreducibility and open symplectic ℚ_ℓ monodromy of the pencil radical quotient | **LPV.5** | DWP.3, R34.4 |
| Early constructible middle perversity, recollement and intermediate extension | EtaleDualityAndPerverseSheaves EDC.5 | LPV.6 |
| Nearby-cycle t-exactness and the filtered-colimit support inequality consumed by IG.4 | **LPV.6** | IG.4, EDC.5 |
| Semistable-curve nearby cohomology, N and the comparison with graph and Jacobian descriptions | **LPV.7:semistable-curves** | LPV.7, R34.3, DWP.10, ModularCurvesPartII R13.6 |
| Nodal charts, normalization and the dual graph of a proper nodal curve | Tau Ceti StableReduction layer 1 | LPV.7, LPV.7:semistable-curves |
| Generalized Jacobian, toric characters, monodromy pairing and Néron component group | NeronModelsAndSemistableAbelianVarieties R11.4 | LPV.7, LPV.7:semistable-curves |
| Potentially pure invariant cycles and the support-bound weak Lefschetz theorem (Weil II 3.6, 6.2.8–6.2.12) | **LPV.7:invariant-cycles** | DWP.9, LPV.7 |
| Absolute hard Lefschetz and the 6.2.13 extension | DeligneWeightsAndPurity DWP.9 | R34.5, EDC.7 |
| Weil I's Riemann hypothesis by dimension induction and tensor powers | DeligneWeightsAndPurity DWP.4 | R34.5, WeilConjectures WC.3 |

**Overlap with LocalFieldsRamification.** The link map of Tau Ceti LocalFieldsRamification records an overlap between its layer 4 (the tame quotient of the absolute Galois group of a nonarchimedean local field) and LPV.1, which works over excellent henselian traits whose residue fields need not be finite. The recommendation is a rescope: LPV.1 constructs inertia, wild inertia and t_ℓ in trait generality through R01.2, and compares them with layer 4's I_K, P_K and Ẑ^(p′)(1) when the completed fraction field is a local field; statements over finite residue fields use layer 4's declarations. No node plans that comparison. RS-17, which postdates that link map, makes ArithmeticGaloisRepresentations R01.2 the owner of the tame character that LPV.1 imports, so the comparison sits most naturally with R01.2's carrier.

## Conventions

The two parts wrote the same objects in different notations. The prose of every node below uses the forms listed here: ℚ_ℓ, ℤ_ℓ, ℚ̄_ℓ and t_ℓ, which the LPV.0 part also wrote Q_l, Z_l and t_l, and the LPV.7 part ℚℓ and ℤℓ; ℤ/ℓ^n and 𝔽_q for Z/ℓ^n and F_q; X_η, X_η̄, X_s, X_s̄, where the LPV.7 part wrote Xη, Xη̄, Xs, Xs̄; and a space between a word and a numbered reference (Theorem 3.6.1, Weil II 6.2.9), which the LPV.7 part often omitted. Lean names, code spans, API and test names, locators and the literal source excerpts keep their own form.

- **Traits.** A henselian trait is S = Spec R, R a henselian discrete valuation ring, with generic point η and closed point s. A separable geometric generic point η̄ is a *choice*, transported naturally, not a canonical algebraic closure; the valuation extends uniquely, giving the geometric closed point s̄, the normalization S̄ of S in k(η̄), the open immersion j̄ : η̄ → S̄ and the closed immersion ī : s̄ → S̄. The residue field of S̄ may be purely inseparable over k(s̄). Inertia is I = ker(Gal(η̄/η) → Gal(s̄/s)), with wild inertia P its pro-p part (p the residue characteristic, P trivial when p = 0) and the tame character t_ℓ : I → ℤ_ℓ(1). Finiteness theorems use an excellent trait. LPV.7:invariant-cycles works over S = Spec(k[T]^h_(T)), the henselization at the origin with k algebraically closed.
- **Coefficients.** Λ is a finite torsion ring with ℓ invertible on S, usually ℤ/ℓ^n. Integral and rational ℓ-adic statements pass through the derived adic realization of compatible systems (`LPV.0/adic-nearby-cycle-realization`), never through an underived inverse limit. Λ(m) is the Tate twist. In LPV.4 and LPV.5 the coefficients are ℚ_ℓ and **E denotes the vanishing subspace**, not a coefficient field; a larger coefficient field is written E′, and openness in Sp(V ⊗ E′)(E′) is never asserted.
- **Nearby and vanishing cycles.** Ψ_η = ī^*j̄_* and RΨ_η = ī^*Rj̄_*; Deligne's "cycles évanescents" R^iΨ are the nearby-cycle sheaves, and Huber's "vanishing cycles" are RΨ, not the cone RΦ. The vanishing triangle sp^*i^*K → RΨ_η(K_η) → RΦ(K) → has no shift; specialization runs from H^i(X_s̄, K) to H^i(X_η̄, K) for proper f, and the connecting map raises degree by one. The variation Var(σ) : RΦ(K) → RΨ_η(K) satisfies σ = 1 + Var(σ)∘can on RΨ_η and σ = 1 + can∘Var(σ) on RΦ, with Var(στ) = Var(σ) can Var(τ) + Var(σ) + Var(τ). In Lean composition order, `can ≫ Var σ` is the first identity.
- **Monodromy.** On a unipotent open subgroup of inertia, ρ(σ) = exp(t_ℓ(σ) N) with N : V → V(−1) the finite logarithm, nilpotent, independent of the choice of a generator of ℤ_ℓ(1) as a twisted map; with geometric Frobenius F over 𝔽_q, NF = qFN. After a finite extension of ramification index e, N′ = eN. The monodromy filtration M centred at c is the unique finite increasing filtration with N M_i ⊂ M_(i−2) and N^r : Gr_(c+r) ≅ Gr_(c−r)(−r); its primitive parts follow Deligne's lower convention P_i = ker(N : Gr_i → Gr_(i−2)), zero for i > c. A two-block has weights c − 1, c + 1, so M is not the kernel filtration.
- **Dimensions and signs.** In a Lefschetz degeneration or pencil the smooth fibre has dimension n and the total space dimension n + 1; write n = 2m or n = 2m + 1. The vanishing cycle is δ ∈ H^n(X_η̄, ℚ_ℓ)(m), determined up to sign, and (x, δ) = Tr(x ∪ δ). For n odd, σx = x + (−1)^(m+1) t_ℓ(σ)(x, δ)δ; for n even and p ≠ 2, σ acts by the reflection x ↦ x + (−1)^(m+1)(x, δ)δ when ε(σ) = −1, where ε is the quadratic character, and (δ, δ) = (−1)^m·2. Deligne's table for n ≡ 0, 1, 2, 3 mod 4: signs −, −, +, + and (δ, δ) = 2, 0, −2, 0. δ = 0 can happen only for n odd, and then the exceptional contribution is a skyscraper in degree n + 1.
- **Characteristic two.** A quadratic form is ordinary when it is nowhere zero and its quadric is smooth. Over a field this is nondegeneracy of the polar form when the rank is even or 2 is invertible, and, for odd rank in characteristic two, a one-dimensional polar kernel on which Q does not vanish; for V ≠ 0 it is Mathlib's `QuadraticMap.Nondegenerate`. Smoothness of a quadric never implies nondegeneracy of the polar form in characteristic two. Weil I §5.8 excludes p = 2 with n even from the tame branch; that branch has its own wild quadratic character (`LPV.2/quadratic-character-in-characteristic-two`, `LPV.5/characteristic-two-transverse-monodromy`). The odd branch works in characteristic two.
- **The radical quotient.** E is the span of all transports of the local vanishing cycles, which is independent of the paths, while the individual oriented δ_s are not. E ∩ E^⊥ may be nonzero and E may be zero. The monodromy object is V = E/(E ∩ E^⊥) with the induced nondegenerate form ψ, alternating for n odd and symmetric for n even; irreducibility and openness are statements about V, never about E presumed nondegenerate.
- **Perverse conventions.** Fibrewise, RΨ between perverse categories of the generic and special fibres is t-exact. For a perverse complex on the total space over the trait, with the rectified perversity, the exact functors are ψ[−1] and φ[−1]. These are not interchangeable unshifted formulas. Integrally the dual conventions p and p+ are kept distinct.
- **Semistable curves.** The dual multigraph Γ of a nodal special fibre keeps loops and parallel edges; orientations come from an ordering of the two branches at each node. The normalization differential is (da)_e = a(tail e) − a(head e). The thickness of a node with local equation uv = a_e is n_e = v(a_e); under a finite extension of ramification index e it becomes e·n_e, resolved by e·n_e unit-thickness edges. H¹(Γ) = coker d and H₁(Γ) = ker ∂ are dual lattices, not the same object. Illusie's negative edge form u−(a)(b) = −Σ_e n_e a_e b_e is the negative of R11.4's positive valuation pairing u+, and N = c′ ∘ u− ∘ c. The monodromy filtration on H¹ of the generic fibre is centred at 1.
- **The weight spectral sequence.** E₁^(p,q) = ⊕_(i ≥ max(0,−p)) H^(q−2i)(Y^(p+2i), ℚ_ℓ(−i)) ⇒ H^(p+q)(X_η̄, ℚ_ℓ) for proper X, where Y^(j) is the disjoint union of the (j + 1)-fold intersections of special components; d_r has bidegree (r, 1 − r); W_s H^m = M′_(s−m) for the induced filtration M′; d₁ = δ* + δ_* (alternating restrictions plus alternating Gysin maps) in Saito's sign convention. With relative dimension d the columns lie in [−d, d] and the page 2d + 2 has stabilized; no E₂-degeneration is assumed, and equality of M′ with the monodromy filtration is a separate theorem.
- **Invariant cycles.** sp^I is the specialization map corestricted to the inertia invariants; surjectivity is a theorem, never part of the construction. A potentially pure complex carries an explicit arithmetic model (a PotentiallyPureModel), not a label. The dual-support bound of Weil II 6.2.11 is dim Supp ℋ^j(DK[−2n−2]) ≤ n + 1 − j for every j, with dim ∅ = −∞.
- **Short labels in the LPV.7 part.** The LPV.7 part's proofs refer to its own nodes by short labels. The semistable-curve sub-layer uses nd = `normalization-differential`, nr = `normalization-etale-resolution`, ns = `nodal-nearby-cycle-sheaves`, sign = `node-residue-variation-sign`, seq = `curve-specialization-sequence`, nc = `curve-normalization-cohomology`, nf = `curve-monodromy-factorization`, ni = `curve-inertia-invariants`, mf = `curve-monodromy-filtration`, jt = `jacobian-tate-realization`, sn = `snc-nearby-cycle-description`, sg = `snc-graded-nearby-complex` and sd = `snc-restriction-gysin-differential`. The invariant-cycle sub-layer uses isp = `invariant-specialization`, spread = `arithmetic-spreading`, wang = `continuous-wang-sequence`, cross = `localization-duality-cross`, wb = `invariant-and-support-weight-bounds`, lic = `local-invariant-cycles`, gam = `geometric-generic-pure-model`, ppm = `potentially-pure-model`, pull = `potential-purity-incidence-pullback`, pl = `pure-complex-local-invariant-cycles`, av = `dual-support-affine-vanishing`, wl = `support-bound-weak-lefschetz`, ob = `pencil-relative-obstruction`, im = `pencil-image-equality` and gm = `general-pencil-monodromy`. "Sign" and "cross" also occur as ordinary words, and "im N" is the image of N.
- **Lean names.** The LPV.0 part names its declarations in the namespaces `TauCeti.AlgebraicGeometry.VanishingCycles`, `TauCeti.AlgebraicGeometry.Quadric` and `TauCeti.AlgebraicGeometry.LefschetzPencil`; the LPV.7 part uses the working namespace `TauCeti.LPV7`. The document and the joined Lean file keep the packets' names, so that every name a packet gives appears verbatim in both.

## Layer overview

| Layer | Title | Nodes | Planets | Coverage | Packet |
|---|---|---:|---:|---|---|
| [LPV.0](#lpv0--nearby-and-vanishing-cycles-on-actual-sites) | Nearby and vanishing cycles on actual sites | 12 | 2 | partial | LPV.0 |
| [LPV.1](#lpv1--inertia-variation-and-the-monodromy-operator) | Inertia, variation and the monodromy operator | 13 | 6 | partial | LPV.0 |
| [LPV.2](#lpv2--ordinary-quadratic-singularities-and-picardlefschetz) | Ordinary quadratic singularities and Picard–Lefschetz | 31 | 6 | partial | LPV.0 |
| [LPV.3](#lpv3--existence-of-sufficiently-ample-lefschetz-pencils) | Existence of sufficiently ample Lefschetz pencils | 7 | 3 | partial | LPV.0 |
| [LPV.4](#lpv4--global-vanishing-cycles-and-middle-degree-reduction) | Global vanishing cycles and middle-degree reduction | 8 | 3 | partial | LPV.0 |
| [LPV.5](#lpv5--irreducibility-and-open-symplectic-monodromy) | Irreducibility and open symplectic monodromy | 11 | 4 | partial | LPV.0 |
| [LPV.6](#lpv6--perverse-nearby-cycles-and-comparison-interfaces) | Perverse nearby cycles and comparison interfaces | 7 | 5 | partial | LPV.0 |
| [LPV.7](#lpv7--invariant-cycles-and-semistable-curve-exports) | Invariant cycles and semistable-curve exports | 1 | 0 | planned | LPV.7 |
| [LPV.7:semistable-curves](#lpv7semistable-curves--semistable-curves-and-strict-normal-crossings) | Semistable curves and strict normal crossings | 18 | 6 | planned | LPV.7 |
| [LPV.7:invariant-cycles](#lpv7invariant-cycles--local-and-global-invariant-cycles) | Local and global invariant cycles | 17 | 6 | planned | LPV.7 |

Every layer has at most six planets. The node graph of the two parts is acyclic, also through every packet on main. Within the roadmap it follows the layer order, except for one backward stage edge, LPV.5 → LPV.4, with no node cycle (see Dependencies). The LPV.0 part refers to no LPV.7 node, and the LPV.7 part refers to LPV.0-part nodes by id where one supplies exactly what it needs, and to the stages LPV.0, LPV.1, LPV.3, LPV.4 and LPV.5, with requests, where it needs more than those nodes state. The Dependencies section lists these cross-part references and the node ids that answer them.

In each layer below, the coverage record follows the overview, then the nodes in the order of their packet. Every node ends with its part's review verdict: **verified** (the planning contract is supported at the stated scope), **corrected** (corrected in place by the review) or **unverifiable**. The last usually means that the suggested Lean form, or a unit test, omits a hypothesis the statement needs, not that the cited theorem is false; the note says which.

## LPV.0 — Nearby and vanishing cycles on actual sites

LPV.0 builds the trait formalism of SGA 7 XIII on the actual small étale sites, with the fibre squares of the pinned `TauCeti.genericFiber` and `TauCeti.specialFiber`. The henselian trait and its inertia (`henselian-trait-conventions-and-galois-sheaves`) come first; then the fibre-product topos X_s ×_s S, whose sheaves are triples (F_s, F_η, φ) with φ landing in the inertia invariants for X = S (`fibre-product-topos-Y-times-S`); the functor Ψ with its base-change functorialities (`functor-psi-and-functorialities`); the variation Var(σ) and its three identities (`variation-morphism`); and the derived functors RΨ, RΦ, the vanishing triangle, the stalk formula through the strict-local Milnor fibre and local acyclicity (`derived-nearby-cycles-RPsi-and-vanishing-triangle`, planet "Nearby and vanishing cycles"). The derived functorialities and the specialization sequence attach each base-change isomorphism to its own hypothesis (proper, smooth or étale) and assert none for arbitrary morphisms. The remaining nodes realize the site maps, compare with the oriented product of Illusie 2006, prove constructibility over an excellent trait (planet "Constructibility of nearby cycles"), change coefficients and traits, realize adic and rational coefficients, and compare with Huber's adic nearby cycles on the admissible domain that ClassicalAdicEtaleCohomology H1 uses.

What is open: the original SGA 4½ finiteness proof (G-finiteness-source) and the inertia-equivariant adic comparison (G-adic-comparison). All twelve nodes are unverifiable in the review's sense: their mathematics is sourced, but their suggested Lean forms drop continuity, residue-Galois descent, bounded invertible coefficients and the actual exchange maps.

**Coverage.** `partial`. Remaining:
- Resolve G-finiteness-source and G-adic-comparison through the specified upstream/EDC contracts.
- G-review-signature-fidelity: restore continuity and residue-Galois descent, bounded invertible coefficients, actual site/strict-local stalk maps, and qualified exchange/realization statements; complete geometric API/tests.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Henselian trait and geometric fibre diagram

`LPV.0/henselian-trait-conventions-and-galois-sheaves` · definition · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait`

A henselian trait is S = Spec R for a henselian discrete valuation ring R. Fix a separable geometric generic point and the uniquely extended valuation, with geometric closed point, normalization S̄, open generic inclusion j̄ and closed inclusion ī. Inertia is the kernel of generic-to-residue Galois specialization. The generic Galois-sheaf equivalence is imported from ConstructibleEtale:3, not constructed here.

**Hypotheses.**

- R a discrete valuation ring and henselian; the normalization in the chosen separable closure has the uniquely extended valuation
- The residue field of S̄ can be a purely inseparable extension of the selected separable residue closure

**Construction.**

1. Use the pinned generic and special fibre pullback constructors for the scheme diagram.
2. Import valuation decomposition/inertia and the henselian specialization exact sequence from R01.2.
3. Import Galois descent for sheaves from ConstructibleEtale:3.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait` (structure): A henselian trait S = Spec V with closed point s, generic point η, a geometric generic point η̄, the geometric closed point s̄ and S̄ = Spec of the normalisation of V in k(η̄).
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia` (constructor): I = ker(Gal(η̄/η) → Gal(s̄/s)), a closed normal subgroup.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia_exact` (characterisation): 1 → I → Gal(η̄/η) → Gal(s̄/s) → 1 is exact; surjectivity uses that V is henselian.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.genericFiber` (compatibility): The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.specialFiber` (compatibility): The trait-indexed closed fibre is TauCeti.specialFiber over the residue field.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian` (degenerate): If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux` (value): For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia` (comparison): I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot` (non-example): For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients.

**Acceptance.**

- For Y = Spec k the equivalence recovers Gal(k̄/k)-sets.

**Used by.**

- `LPV.0/fibre-product-topos-Y-times-S`: the galoisian triples describing sheaves on Y ×_s S
- `LPV.0/functor-psi-and-functorialities`: Ψ_η takes values in continuous Gal(η̄/η)-sheaves on X_s̄
- `LPV.2/local-picard-lefschetz-formula`: the inertia group I through which monodromy acts
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`: the trait conventions the analytic comparison matches

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`.

**Depends on.** other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`, `SchemeAndStackFoundations:SF.2`; libraries: `tauceti:TauCeti.genericFiber`, `tauceti:TauCeti.specialFiber`, `mathlib:HenselianLocalRing`, `mathlib:ValuationSubring.inertiaSubgroup`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, Rappel 1.1.3, p. 7: “Le foncteur F ↦ F̄ muni de l'action de Gal(k̄/k) est une équivalence de la catégorie des faisceaux d'ensembles sur Y avec la catégorie des faisceaux d'ensembles sur Ȳ munis d'une action continue de Gal(k̄/k) compatible à l'action de Gal(k̄/k) sur Ȳ.” — The galoisian description used throughout (OCR cleaned).
- `SGA7II-1973`, Exposé XIII, 0.2.5, p. 5: “On note S̄ le spectre du normalisé de V dans k(η̄), de corps résiduel une extension inséparable de k(s̄).” — Conventions on S̄ and geometric points.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII 0.2 supports the trait/valuation convention. The exact-sequence API supplies only the kernel tautology; no residue-Galois surjectivity or continuous descent is represented.

### The specialization morphism sp: S -> s and the 2-fibre-product topos Y ×_s S with its galoisian description (XIII 1.2)

`LPV.0/fibre-product-topos-Y-times-S` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos`

1.2.1: for S local henselian with closed point i: s -> S, S' ↦ S' ×_S s is an equivalence between finite étale S-schemes and finite étale s-schemes; the inverse defines a morphism of sites sp: S -> s (SGA 4 VIII 7) with sp_*F = i^*F (1.2.1.1) and, for F on an open U (or on η), sp_*F = i^*j_*F (1.2.1.2). 1.2.2: for a henselian trait S, sheaves on S are triples (F_s, F_η, φ: F_s -> i^*j_*F_η) (SGA 4 IV 9.5.4); via 1.1, i^*j_* is the functor of I-invariants, so sheaves on S are triples (a Gal(s̄/s)-set F_s̄, a Gal(η̄/η)-set F_η̄, an equivariant φ: F_s̄ -> F_η̄^I); the functors sp^*, sp_*, j^*, j_*, i^*, i_* are written out in these terms (1.2.2(c)). 1.2.3-1.2.4: for Y a scheme over s, the 2-fibre product Y ×_s S of the étale topoi of Y and S over that of s exists (Giraud) and is described by triples (F_s a sheaf on Y, i.e. a sheaf on Ȳ with continuous Gal(s̄/s)-action; F_η a sheaf on Ȳ with continuous Gal(η̄/η)-action compatible via 1.1.1; φ: F_s -> F_η equivariant); Y ×_s S is the union of the open Y ×_s η and the closed complement Y, with the same formulas for sp = pr_1, j, i; 1.2.4.2 independence of the choice of k(η̄); 1.2.5-1.2.6: points of Y ×_s η and Y ×_s S, conservative families, Point(Y ×_s S) ≅ Point(Y) ×_{Point(s)} Point(S); 1.2.7: functoriality in Y (f_*, f^* formulas 1.2.7.1-2 for quasi-compact f) and in S (surjective morphisms of henselian traits, f^* formula 1.2.7.3, f_* as induced representation for finite f); 1.2.8-1.2.9: f_! (extension by zero for locally closed immersions; direct image with proper support formula 1.2.8.1 for f locally of finite type and separated) and its right adjoint f^! for locally closed immersions, extended to quasi-finite f for abelian sheaves (SGA 4 XVIII 3.1.8), with f^! = f^* for étale f.

**Hypotheses.**

- S a henselian trait; Y a scheme over s; the 2-fibre product is taken for the étale topoi (Giraud); readers may take the galoisian description 1.2.4 as the definition
- For non-separably-closed residue field the 2-product must be fibred over Spec(k)_et (introduction, item c))

**Construction.**

1. Equivalence of finite étale covers of S and s (henselian), giving sp.
2. Description of sheaves on S by triples (SGA 4 IV 9.5.4) and identification of i^*j_* with I-invariants.
3. Galoisian description of Y ×_s S; verification of independence (1.2.4.2) by functoriality in the separable closure.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos` (constructor): For Y over s, the category of triples (F_s, F_η, φ): F_s a sheaf on Y (a Gal(s̄/s)-sheaf on Ȳ), F_η a continuous Gal(η̄/η)-sheaf on Ȳ, φ : F_s → F_η equivariant (XIII 1.2.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.sp_pullback` (constructor): sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.etaPart` (constructor): The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait` (equivalence): For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant` (value): The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially.
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward` (value): j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion).
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate` (degenerate): For Y = ∅ the category is the terminal one.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant` (non-example): For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants.

**Acceptance.**

- A sheaf on Y ×_s S restricted to the closed Y is F_s and to the open Y ×_s η is F_η; sp^*(F_s) = (F_s, F_s, id).
- Points (x, s̄) and (x, η̄) form conservative families (1.2.5).

**Used by.**

- `LPV.0/functor-psi-and-functorialities`: Ψ(F) is a triple (F_s, Ψ_η(F_η), φ)
- `LPV.0/variation-morphism`: complexes written as triples with φ injective
- `LPV.2/direct-images-at-a-lefschetz-degeneration`: R^i f_*ℚ_ℓ on a trait read as the triple (H^i(X_s), H^i(X_η̄), sp)

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`.

**Depends on.** this roadmap, same part: `LPV.0/henselian-trait-conventions-and-galois-sheaves`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, Construction 1.2.4, p. 10: “Les faisceaux F sur Y ×_s S s'identifient aux triples (a) F_s est un faisceau sur Y, soit encore un faisceau F_s̄ sur Ȳ = Y ⊗_s s̄, muni d'une action continue de Gal(s̄/s) compatible à l'action de Gal(s̄/s) sur Ȳ (b) F_η est un faisceau F_η̄ sur Ȳ, muni d'une action continue de Gal(η̄/η), compati…” — The galoisian description of the topos (OCR cleaned).
- `SGA7II-1973`, Exposé XIII, 1.2.2(b), p. 9: “Via l'équivalence (a), le foncteur i^*j_* s'identifie au foncteur 'invariants sous I'.” — Identification of i^*j_* with inertia invariants.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII 1.1–1.2 supports the fibre-product description. equivSheavesOnTrait is stated for any henselian trait but discards residue-Galois descent and continuity; a strictly henselian comment does not restrict its argument.

### The left exact functor Ψ: (sheaves on X) -> (sheaves on X_s ×_s S), its η-part Ψ_η = ī^* j̄_*, and its functorialities (XIII 1.3)

`LPV.0/functor-psi-and-functorialities` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta`

1.3.1-1.3.2: for p: X -> S over a henselian trait, with X̄ = X ×_S S̄, the cartesian diagram X_s̄ -> X̄ <- X_η̄ over s̄ -> S̄ <- η̄; for F a sheaf on X_η with pullback F_η̄ on X_η̄ put Ψ_η(F) = ī^* j̄_* F_η̄ (1.3.2.2), a sheaf on X_s̄ with continuous Gal(η̄/η)-action compatible with the action on X_s̄, i.e. a sheaf on X_s ×_s η; Ψ_η is left exact (1.3.2.3). 1.3.3: for F on X with restrictions F_η, F_s, put Ψ(F)_η = Ψ_η(F_η), Ψ(F)_s = F_s, and φ induced by the adjunction F -> j_*j^*F; Ψ(F) = (F_s, Ψ_η(F_η), φ) is a sheaf on X_s ×_s S and Ψ is left exact (1.3.3.3); 1.3.4 notations. 1.3.5-1.3.10 (functorialities, useful mainly in derived form): for f: X -> X' over S, base change gives Ψ f_* -> f_* Ψ (1.3.6.1), an isomorphism for f proper (SGA 4 XII 5.1(i)), whose essential case X' = S is Γ(X_η̄, F) -> Γ(X_s̄ ×_s η̄, Ψ_η F) (1.3.6.3); f^*Ψ -> Ψ f^* (1.3.7.1); for f quasi-finite, f_!Ψ -> Ψ f_! (1.3.8.1), inverse of 1.3.6.1 for f finite; Ψ f^! -> f^! Ψ (1.3.9.1), inverse of 1.3.7.1 for f étale; base change of traits S' -> S: f^*Ψ -> Ψ f^* (1.3.10.1).

**Hypotheses.**

- S a henselian trait; X any S-scheme; sheaves of sets (pointed sets for f_!)
- Ψ is not in general the direct image of a morphism of topoi (1.3.1)

**Construction.**

1. Define Ψ_η by pullback to η̄, direct image to X̄ and restriction to X_s̄; check the Galois action.
2. Assemble the triple with the adjunction map; derive the functorialities from base change maps.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta` (constructor): Ψ_η(F) = ī^* j̄_* F_η̄, a continuous Gal(η̄/η)-sheaf on X_s̄ (XIII 1.3.2.2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi` (constructor): Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_leftExact` (characterisation): Ψ and Ψ_η are left exact.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_pushforward` (compatibility): The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait` (value): For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants` (non-example): For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant` (value): For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id` (degenerate): For f = id the base-change map is the identity.

**Acceptance.**

- For X = S, Ψ_η(F) is the Gal(η̄/η)-set F_η̄ viewed over s̄ and Ψ(F)_s = F_s with φ: F_s -> F_η̄^I.

**Used by.**

- `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`: RΨ is the right derived functor of Ψ
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`: the underived functor compared with the analytic construction
- `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`: Ψ versus Φ at the underived level

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/change-of-trait-compatibility`, `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`, `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`.

**Depends on.** this roadmap, same part: `LPV.0/fibre-product-topos-Y-times-S`, `LPV.0/henselian-trait-conventions-and-galois-sheaves`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, 1.3.1, p. 13: “Ce foncteur n'est pas en général le foncteur image directe d'un morphisme de topos.” — Nature of Ψ.
- `SGA7II-1973`, Exposé XIII, 1.3.6, p. 15: “Le morphisme de changement de base induit un morphisme de foncteurs Ψ f_* -> f_* Ψ qui est un isomorphisme pour f propre (SGA4 XII 5.1(i)).” — Proper compatibility at the underived level (OCR cleaned).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII 1.3 supplies Ψ. psi_pushforward compares arbitrary supplied glue functors without a geometric square/properness condition; tests do not instantiate the claimed geometric functor.

### The variation Var(σ): Φ(K)_η -> K_η for a complex K on Y ×_s S and σ in the inertia group (XIII 1.4)

`LPV.0/variation-morphism` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.variation`

1.4.1-1.4.2: for K a complex of A-modules on Y ×_s S, i.e. a triple (K_s, K_η, φ) with K_s̄, K_η̄ complexes on Ȳ with continuous Gal(s̄/s), resp. Gal(η̄/η), actions and φ equivariant, K is homotopic to a triple K' with φ' injective and the sequence 0 -> K'_s -> K'_η -> coker(φ') -> 0 (1.4.2.1) split degreewise (take K'_η the sum of K_η and the cone of sp^*K_s); Φ(K) := coker(φ') gives a distinguished triangle sp^*K_s -> K_η -> Φ(K) -> in K(Y ×_s η, A) depending only on K (1.4.2.2), passing to the derived category and yielding the long exact sequence ... -> H^i(V, K_s) -> H^i(V, K_η) -> H^i(V, Φ(K)_η) -> ...; 1.4.3: the inertia group I acts trivially on K'_s, so for σ ∈ I the endomorphism σ − 1 of K'_η factors through Var(σ): coker(φ') -> K'_η; in the derived category this defines the variation Var(σ): Φ(K)_η -> K_η (1.4.3.1) with σ = 1 + Var(σ)q on K_η (1.4.3.2), σ = 1 + q Var(σ) on Φ(K)_η (1.4.3.3), q: K_η -> Φ(K)_η the natural map, and Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ) (1.4.3.4).

**Hypotheses.**

- A a ring (or a sheaf of rings on Y); K ∈ D(Y ×_s S, A)
- I acts trivially on the s-part

**Construction.**

1. Replace K by a homotopic triple with injective, degreewise split φ'; define Φ as the cokernel; factor σ − 1 through Φ.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation` (constructor): Var(σ) : Φ(K)_η → K_η for σ ∈ I and K a complex on Y ×_s S, defined on a representative with φ' injective (XIII 1.4.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_left` (characterisation): σ = 1 + Var(σ) ∘ q on K_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_right` (characterisation): σ = 1 + q ∘ Var(σ) on Φ(K)_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul` (compatibility): Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined` (compatibility): Var(σ) depends only on K in the derived category, not on the representative K'.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one` (degenerate): Var(1) = 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero` (value): If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz` (value): At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which over rational coefficients is nonzero when t_ℓ(σ) ≠ 0, (a, δ) ≠ 0 and δ ≠ 0 (XV 3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one` (non-example): Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s.

**Acceptance.**

- The variation determines the inertia action on K_η through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

**Used by.**

- `LPV.2/even-relative-dimension-variation-3-2`: the variation formula at an ordinary quadratic point, n even
- `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`: the variation formula at an ordinary quadratic point, n odd
- `LPV.2/local-picard-lefschetz-formula`: the monodromy on H^n(X_η̄) through σ = 1 + Var(σ) q
- `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology`: transport of Var to analytic cohomology

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology`.

**Depends on.** this roadmap, same part: `LPV.0/fibre-product-topos-Y-times-S`, `LPV.0/henselian-trait-conventions-and-galois-sheaves`; other roadmaps' stages: `EnhancedDerivedSheaves:E0`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, 1.4.3, p. 17: “Le groupe d'inertie I agit trivialement sur K'_s. Pour tout σ ∈ I l'endomorphisme σ − 1 de K'_η se factorise donc par un morphisme Var(σ): coker(φ') -> K'_η” — Definition of the variation (OCR cleaned).
- `SGA7II-1973`, Exposé XIII, (1.4.3.2)-(1.4.3.4), p. 17: “σ = 1 + Var(σ) q (sur K_η); σ = 1 + q Var(σ) (sur Φ(K)_η); Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ)” — The identities satisfied by Var.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII 1.4.3 checked. Corrected left/right Lean names, the noncommutative composition order, the nonzero-pairing test condition, and E0 dependency. Representative independence still has only a factorization prototype, and degree-zero cokernel is not the derived construction.

### RΨ, RΨ_η, RΦ, the vanishing triangle, the stalk formula and local acyclicity (XIII 2.1.1-2.1.5)

`LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` · construction · planet “Nearby and vanishing cycles” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi`

2.1.1: S a henselian trait, A a torsion ring prime to the residue characteristic p (more generally a torsion sheaf of rings prime to the residue characteristics; the main case A = ℤ/ℓ^n, ℓ invertible on S). 2.1.2: RΨ: D^+(X, A) -> D^+(X_s ×_s S, A) and RΨ_η: D^+(X_η, A) -> D^+(X_s ×_s η, A) are the derived functors of Ψ, Ψ_η; since restriction of an injective to the open X_η stays injective and pullback to X_η̄ is acyclic, (2.1.2.1) RΨ(K)_s = i^*K, (2.1.2.2) RΨ(K)_η = RΨ_η(K_η), (2.1.2.3) RΨ_η(K)_η̄ = ī^* R j̄_* K_η̄ (displays partly lost in OCR); with RΨ_η(K) := (RΨ(K))_η, RΦ(K) := Φ(RΨ(K)) the triangle 1.4.2.2 becomes the distinguished triangle sp^* i^*K -> RΨ_η(K_η) -> RΦ(K) -> (2.1.2.4) on X_s ×_s η, with the variation Var(σ): RΦ(K)_η -> RΨ_η(K) (2.1.2.5); the R^iΨ(A) (or R^iΨ(K)) are the sheaves of vanishing cycles (Deligne's terminology for the nearby-cycle sheaves). 2.1.3-2.1.4 (stalk formula): for a geometric point x̄ of X_s̄ and the strict henselization X_(x̄), a scheme over the strict henselization S^nr with geometric generic point η̄^nr, (RΨ(K))_(x̄, η̄) = RΓ(X_(x̄) ×_{S^nr} η̄, K), in particular R^iΨ(K)_(x̄,η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K) — the cohomology of the strict-local geometric Milnor fibre. 2.1.5 (local acyclicity, from SGA 4 XV 2.1): if f is smooth and F locally constant then RΦ(F) = 0; more generally RΦ(K) = 0 where f is smooth and the H^i(K) are locally constant.

**Hypotheses.**

- A torsion, prime to the residue characteristic (0.2.7); K ∈ D^+
- The stalk formula uses the strict henselization at x̄ and the strict henselization S^nr of the trait
- Local acyclicity of smooth morphisms is imported from SGA 4 XV 2.1

**Construction.**

1. Derive Ψ using injectives; verify (2.1.2.1)-(2.1.2.3).
2. Apply Φ to obtain the triangle and Var.
3. Stalk: compute (RΨ_η K)_(x̄,η̄) via the strict localization and (2.1.2.3).
4. Local acyclicity: SGA 4 XV 2.1.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi` (constructor): RΨ : D⁺(X, A) → D⁺(X_s ×_s S, A), the right derived functor of Ψ, with RΨ(K)_s = i^*K and RΨ(K)_η = RΨ_η(K_η) (XIII 2.1.2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi` (constructor): RΦ(K) = Φ(RΨ(K)), in D⁺(X_s ×_s η, A).
- `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingTriangle` (constructor): The distinguished triangle sp^* i^*K → RΨ_η(K_η) → RΦ(K) → (XIII 2.1.2.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_stalk` (characterisation): R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K), the cohomology of the geometric Milnor fibre (XIII 2.1.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic` (characterisation): (X, K) is locally acyclic over S if and only if RΦ(K) = 0 (XIII 2.1.5); for f smooth and K constant it holds.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth` (value): For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait` (degenerate): For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node` (value): For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction` (non-example): For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.

**Acceptance.**

- For a smooth family with locally constant coefficients RΦ = 0 and sp^*i^*K ≅ RΨ_η(K_η).
- For a disjoint union, RΨ is computed componentwise (functoriality in X); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), to be checked against XV §2.

**Used by.**

- `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`: concentration of RΦ at an ordinary quadratic point
- `LPV.2/lefschetz-degeneration-specialization-sequence`: the long exact sequence of the triangle on a proper family
- `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`: the scheme-side nearby-cycle object
- `AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration`: the vanishing-cycle sequence of a proper curve

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`, `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`, `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree`, `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/huber-vanishing-cycles-are-nearby-cycles`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/nearby-cycles-over-valuation-base`, `DeligneWeightsAndPurity:DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`, `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Depends on.** this roadmap, same part: `LPV.0/functor-psi-and-functorialities`, `LPV.0/fibre-product-topos-Y-times-S`, `LPV.0/variation-morphism`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E0`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, 2.1.1, p. 17: “Soient S un trait hensélien comme en (0.2.5) et A un anneau de torsion premier à la caractéristique résiduelle p de S (0.2.7).” — Coefficient hypothesis.
- `SGA7II-1973`, Exposé XIII, Proposition 2.1.4, p. 19: “On a (RΨ(K))_(x̄,η̄) = RΓ(X_(x̄) ×_{S^nr} η̄, K); en particulier, R^iΨ(K)_(x̄,η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K)” — Stalk formula (OCR cleaned).
- `SGA7II-1973`, Exposé XIII, Reformulation 2.1.5, p. 19: “Si f est lisse et F un faisceau localement constant, on a RΦ(F) = 0” — Local acyclicity.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII 2.1.1–5 checked. Added the variation and E0 prerequisites. RPsi_stalk identifies arbitrary MilnorCohomology with the stalk; boundedness, invertible coefficients and genuine strict localization are absent from the signature.

### Derived functorialities of RΨ (proper and smooth base change, f_!, f^!, change of trait) and the specialization sequence with inertia/variation diagrams (XIII 2.1.6-2.1.8)

`LPV.0/derived-functorialities-and-specialization-sequence` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.derivedFunctorialitiesAndSpecializationSequence`

For a separated finite-type morphism g of finite-type schemes over a henselian trait, there are natural nearby-cycle exchange maps with g*, Rg*, Rg! and Rg!. The Rg* map is an isomorphism for proper g, the pullback map for smooth g (hence for open or étale g), and the exceptional inverse-image map for étale g. A dominant change of henselian traits gives an isomorphism after the chosen geometric points and inertia restriction are transported. For proper f:X→S, the specialization triangle yields the inertia-equivariant long exact sequence H^i(X_s̄,K)→H^i(X_η̄,K)→H^i(X_s̄,RΦK)→H^{i+1}(X_s̄,K). Compact supports have their own comparison arrow, from special-fibre nearby cycles to generic-fibre cohomology; an isomorphism is asserted here only with properness.

**Hypotheses.**

- Finite-type noetherian schemes; torsion coefficients invertible on the trait; bounded-below complexes
- Properness, smoothness or étaleness exactly as attached to each exchange map; no arbitrary base-change isomorphism
- Dominant change of traits, with compatible geometric points

**Proof.**

1. Construct exchange maps from the adjunction units and the actual geometric fibre square.
2. Apply the corresponding smooth or proper base-change theorem of EtaleBaseChange; retain the comparison map without an invertibility assertion in the other cases.
3. Use XIII 2.1.7.5 for dominant trait change, distinct from arbitrary base change over higher-dimensional bases.
4. Apply RΓ to the specialization distinguished triangle and proper base change; use naturality to retain inertia equivariance.

**Acceptance.**

- Direction: specialization goes from H^i(X_s̄, K) to H^i(X_η̄, K) (through RΨ), and RΦ sits in degree shift 0 in the triangle sp^*i^*K -> RΨ_η -> RΦ -> (no shift), so the connecting map raises the degree by one.
- Inertia and Galois equivariance are built into the topos X_s ×_s S (all maps are equivariant).

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/change-of-trait-compatibility`, `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`, `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.0/functor-psi-and-functorialities`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, 2.1.7.1-2, p. 20: “D'après le théorème de changement de base pour un morphisme propre (SGA4 XII 5.1), ce morphisme est un isomorphisme si f est propre. ... D'après le théorème de changement de base pour un morphisme lisse (SGA4 XVI 1.2), ce morphisme est un isomorphisme si f est lisse.” — Proper and smooth compatibilities (OCR cleaned).
- `SGA7II-1973`, Exposé XIII, 2.1.8.9, p. 22: “Le complexe évanescent RΦ(K) exprime donc la différence entre les cohomologies des fibres géométriques X_η̄ et X_s̄ (à valeurs dans l'image réciproque de K). D'après (2.1.8.7), la variation Var(σ) détermine l'action du groupe d'inertie I sur H^i(X_η̄, K). Ces faits sont à la base de toutes les ap…” — The specialization sequence and its use (OCR cleaned).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII derived exchange/specialization supports the mathematical outline. A distinguished-triangle statement alone does not realize the asserted geometric exchange maps and specialization long exact sequence.

### Geometric fibre maps on the small étale sites

`LPV.0/geometric-fibre-site-morphisms` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.geometricFibreSiteMaps`

The chosen geometric fibre square X_η̄→X_S̄←X_s̄ induces the small-étale inverse-image and direct-image adjunctions. The inclusions are the base changes of the open generic and closed special inclusions, and inertia acts on the geometric generic side, with natural descent action on ī*Rj̄*. The sites are Scheme.smallEtaleTopology, not the Zariski sites.

**Hypotheses.**

- Henselian trait; finite-type X→S; chosen compatible geometric points

**Proof.**

1. Use the pinned generic/special fibre pullback constructors.
2. Import the scheme-to-small-étale-topos morphisms from ConstructibleEtale and identify their fibre squares.
3. Transport the generic Galois action through these morphisms; record coherence for identity and composition.

**Acceptance.**

- For X=S, the geometric nearby stalk is the generic representation, rather than its inertia invariants.
- The open map is j̄ over the geometric normalization; replacing it by j changes the answer.

**Depends on.** this roadmap, same part: `LPV.0/henselian-trait-conventions-and-galois-sheaves`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Sources.**

- `illusie-2006`, §1.1, classical trait diagram: “henselian trait” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Actual site maps belong to PR196. The single geometricFibreSiteMaps functor does not specify the localization/normalization diagram or its exchange maps and identities.

### Oriented product and the classical trait description

`LPV.0/oriented-product-comparison` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.orientedProductTraitComparison` (omitted signature)

The oriented product X_s←×_Sη has points consisting of a geometric x, geometric generic point and specialization path. Its derived nearby-cycle stalk is RΓ(X_(x)×_{S_(f(x))}η̄,K). For a trait the oriented product identifies with the classical generic part of X_s×_sS, carrying the same specialization and inertia action. The full gluing topos has special and generic parts; it is not identified with the generic part alone.

**Hypotheses.**

- Trait base and compatible geometric points; torsion derived sheaves
- For a general higher-dimensional base this statement does not assert arbitrary base-change or constructibility

**Proof.**

1. Use the oriented-product site of triples U→V←W and its covering families from Illusie §2.1.
2. Describe its points by specialization paths and identify the strict-local tube.
3. Restrict to the trait and compare the universal gluing maps with XIII 1.2–1.3.

**Acceptance.**

- The specialization arrow points from the special stalk to the generic nearby stalk.
- The identity map over a field has vanishing cycles zero.

**Depends on.** this roadmap, same part: `LPV.0/fibre-product-topos-Y-times-S`, `LPV.0/geometric-fibre-site-morphisms`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `EnhancedDerivedSheaves:E1`.

**Sources.**

- `illusie-2006`, §2.1–2.4, especially 2.2.3 and 2.3.4: “oriented product” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 2006 distinguishes oriented products and their comparison. The Lean equivalence takes an arbitrary site C,J; no relation to the trait or fibre product forces this equivalence.

### Constructibility and bounded nearby cycles

`LPV.0/constructibility-and-finite-amplitude` · theorem · planet “Constructibility of nearby cycles” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesConstructible` (omitted signature)

For X of finite type over an excellent henselian trait and a bounded constructible torsion complex K with coefficients invertible on S, RΨK and RΦK have bounded constructible cohomology. Finite Tor-amplitude is retained under the finite-coefficient hypotheses of the finiteness theorem. A mere collection of finite stalks is not used as the constructibility criterion.

**Hypotheses.**

- Excellent henselian trait; finite-type morphism
- Bounded constructible finite torsion coefficients invertible on S; finite Tor-amplitude for the Tor conclusion

**Proof.**

1. Apply the trait finiteness theorem recalled in Illusie §1.1 and supplied by EtaleBaseChange:6.
2. Use the strict-local stalk calculation for the finite cohomological amplitude.
3. Apply the specialization triangle to RΦ and the constructible/finite-Tor supplier criteria.

**Acceptance.**

- For an ordinary node only the single middle vanishing sheaf survives.
- The general-base oriented functor is not asserted constructible without a modification theorem.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:key/excellent-schemes`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `illusie-2006`, §1.1, finiteness theorem and change of trait: “constructible” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Excellent finite-type and bounded constructible hypotheses are essential. Added the reserved excellence key. nearbyCyclesConstructible instead asserts boundedness for every unbounded derived K; PR196 Layer 6 covers proper direct images, not all nearby-cycle finiteness.

### Coefficient change and inertia restriction

`LPV.0/coefficient-and-trait-change` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesCoefficientTraitChange` (omitted signature)

Nearby and vanishing cycles commute with derived extension of finite coefficient rings in the invertible finite-Tor setting, and with dominant change of henselian traits. These isomorphisms preserve specialization, the cone triangle and inertia after restriction. For adic coefficient systems the statement is applied compatibly at every finite level before derived completion; underived tensor is not substituted for derived tensor.

**Hypotheses.**

- Finite coefficient homomorphism and constructible finite-Tor complexes; ℓ invertible
- Dominant trait morphism with transported geometric points

**Proof.**

1. Use XIII 2.1.13 universal coefficient comparison, retaining derived tensor and Tor terms.
2. Use XIII 2.1.7.5 for change of traits, with the restriction map on inertia.
3. Check the unit/counit construction of specialization and the enhanced cone commute with both comparisons.

**Acceptance.**

- Reduction ℤ/ℓ²→ℤ/ℓ has the derived Tor correction when the stalk is not flat.
- A ramification-index e extension replaces t_ℓ by e times the normalized new tame character.

**Depends on.** this roadmap, same part: `LPV.0/derived-functorialities-and-specialization-sequence`, `LPV.0/constructibility-and-finite-amplitude`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`; other roadmaps' stages: `EnhancedDerivedSheaves:E4`, `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `SGA7II-1973`, XIII 2.1.7.5 and 2.1.13, pp. 18, 24–25: “changement” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XIII coefficient/trait change is qualified. The Lean isomorphism holds between arbitrary scalar-change functors with no coefficient map or compatible cartesian trait diagram.

### Adic realization of trait nearby cycles

`LPV.0/adic-nearby-cycle-realization` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.adicNearbyCycleRealization` (omitted signature)

A compatible system of bounded constructible ℤ/ℓ^r-complexes defines the integral adic nearby/vanishing complex by the imported derived adic realization. Tensoring with ℚ_ℓ gives the rational functors and their inertia-equivariant specialization triangle. This is the realization of the finite-level LPV carrier, not a separate nearby-cycle definition.

**Hypotheses.**

- ℓ invertible; finite-level constructibility and uniform amplitude; derived-complete compatible systems

**Proof.**

1. Apply finite-level coefficient comparison to the transition maps.
2. Import the adic completion/realization equivalence and the required derived inverse-limit control.
3. Rationalize the triangle and its Galois action; keep integral Tor and inverse-limit issues visible.

**Acceptance.**

- The nodal vanishing stalk realizes to ℤ_ℓ(−1) in degree one.
- A non-flat finite-level system is not realized by an unqualified ordinary inverse limit.

**Depends on.** this roadmap, same part: `LPV.0/coefficient-and-trait-change`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; other roadmaps' stages: `EnhancedDerivedSheaves:E4`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- `illusie-1994`, §4.4, extension to adic coefficients: “adique” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Derived compatible systems and uniform bounds are correctly requested. The arbitrary realizing functor/analytic object isomorphism does not encode that compatible system or its derived limit comparison.

**Assembly note.** This node answers the LPV.7 part's eight citations of the stage `LPV.0`, which stand for the passage from finite torsion to rational ℓ-adic coefficients. Its statement covers the rational functors and their inertia-equivariant specialization triangle; the compatibility of that rational triangle with proper base change, local stalk calculations and support localization is the remainder that the LPV.7 part's request to LPV.0 still asks for.

### Scheme and adic nearby cycles over a trait

`LPV.0/scheme-adic-trait-comparison` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.schemeAdicNearbyComparison` (omitted signature)

For the finite-type trait situation admitting Huber’s formal-completion comparison, compare the scheme functor ī*Rj̄* with the adic generic-fibre nearby-cycle functor at finite torsion level, then at derived adic and rational levels. The comparison must commute with specialization and the action of each inertia element. The identification is an input to ClassicalAdicEtaleCohomology H1 and R19.2; it does not assert a comparison for arbitrary analytic spaces.

**Hypotheses.**

- Huber finite-type/formal-completion hypotheses; ℓ invertible; compatible geometric generic points
- The precise admissibility and inertia-equivariance proof is supplier request and gap G-adic-comparison

**Proof.**

1. Factor the comparison through formal completion and Huber’s generic-fibre morphism of étale sites.
2. Identify both functors on strict-local geometric tubes.
3. Check the action induced by the same geometric automorphism before passing to inverse limits; this coherence remains an explicit proof obligation.

**Acceptance.**

- The algebraic nodal tube and its admissible adic counterpart have the same rank-one vanishing stalk and Tate twist.
- The comparison square intertwines σ for every inertia element, not only its underlying nonequivariant cohomology.

**Depends on.** this roadmap, same part: `LPV.0/geometric-fibre-site-morphisms`, `LPV.0/adic-nearby-cycle-realization`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- `caraiani-scholze`, §4.6, p. 63, Huber comparison used in finite-level semiperversity: “Hub96” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Admissible scheme/formal/adic comparison remains G-adic-comparison. The proposed analytic nearby object is arbitrary; its relation to the formal completion is not stated.

## LPV.1 — Inertia, variation and the monodromy operator

LPV.1 turns inertia into linear algebra. It proves the composition identities of can and Var and normalizes the variation on the unipotent part (`normalized-can-var`); defines the finite logarithm of a unipotent automorphism and the canonical twisted N (`finite-monodromy-logarithm`); states the geometric local monodromy theorem for the cohomology of finite-type families, and not for arbitrary inertia representations (`geometric-quasi-unipotence`); rescales N under ramification; constructs the monodromy filtration centred at an integer, with strictness, primitive decomposition, tensor, dual and symmetric-power rules and relative uniqueness; defines maximal unipotence after Qian; constructs the semisimple trace on finite-inertia gradings; and records Frobenius equivariance NF = qFN. The two-component semistable nearby complex (`two-component-semistable-nearby-complex`) is planned here, before LPV.2, because the algebraic proof of the odd Picard–Lefschetz formula runs through it (Illusie 2021 §6.3, with the 1994 errata). The general strictly semistable spectral sequence belongs to LPV.7:semistable-curves, which recovers this two-component case.

RS-17 narrows LPV.1 to the trait-geometric theory: the arithmetic tame character, the Weil–Deligne carrier and arithmetic quasi-unipotence are imported from ArithmeticGaloisRepresentations R01.2. Weight-dependent existence of relative monodromy filtrations (Weil II 1.9) is a downstream use in DeligneWeightsAndPurity DWP.5, not an input. Five nodes are verified (ramified rescaling, the monodromy filtration, tensor and dual rules, relative uniqueness, maximal unipotence), one corrected (primitive decomposition), seven unverifiable. The semisimple trace still needs a primary source for its admissible gradings (G-review-semisimple-trace-source).

**Coverage.** `partial`. Remaining:
- Supply arithmetic geometric local monodromy, coherent filtered-derived totalization and regular-trait purity; verify the cited author errata in the early two-component construction.
- G-review-semisimple-trace-source and G-review-definition-api-tests: construct admissible trace gradings and refinements, identify the two-component total complex with RΨ, and represent its N and Tate line; replace arbitrary-representation quasi-unipotence and arbitrary-residue commutation.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Canonical and normalized variation maps

`LPV.1/normalized-can-var` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.normalizedCanVar` (omitted signature)

For the geometric nearby/vanishing triangle, can:RΨK→RΦK and Var(σ):RΦK→RΨK satisfy Var(σ)can=σ−1 and can Var(σ)=σ−1 on their respective objects. For the unipotent part with rational ℓ-adic coefficients, normalized var:RΦK→RΨK(−1) and N:RΨK→RΨK(−1) satisfy var can=N and can(−1)var=N_Φ. The same normalization is used after choosing a generator of ℤ_ℓ(1); it is independent of that choice as a twisted map.

**Hypotheses.**

- Derived geometric functors; unipotent part for normalized var; rational coefficients
- A finite logarithm is taken only after unipotence is proved

**Proof.**

1. Use the two XIII 1.4 composition identities for Var(σ).
2. On a unipotent action form log(T), and multiply Var by the finite polynomial log(T)/(T−1), whose constant coefficient is one.
3. Undo the trivialization of ℤ_ℓ(1) to obtain the twisted maps and both compositions.

**Acceptance.**

- For T=1+U and U²=0, var agrees with Var divided by the chosen tame parameter.
- Both compositions are checked; interchanging Ψ and Φ gives a wrong source/target.

**Depends on.** this roadmap, same part: `LPV.0/variation-morphism`, `LPV.0/adic-nearby-cycle-realization`, `LPV.1/finite-monodromy-logarithm`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `SGA7II-1973`, Exposé XIII, (1.4.3.2)–(1.4.3.4), p. 17: “Var” — The two unnormalized composition identities; normalized var is obtained by the explicitly stated finite-polynomial argument, not asserted in this passage.
- `illusie-1994`, §1.5, pp. 12–13, (1.5.1)–(1.5.4): “log” — The nilpotent logarithm and twisted monodromy; combined with XIII 1.4.3 and the finite polynomial log(T)/(T−1).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Replaced the wrong Illusie 1.2 citation by XIII 1.4.3 plus Illusie 1.5 and the explicit polynomial argument. normalizedCanVar still asserts can≫var=N for three unrelated morphisms.

### Finite logarithm of unipotent monodromy

`LPV.1/finite-monodromy-logarithm` · construction · planet “Monodromy logarithm” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog`

For a unipotent automorphism T of a finite-dimensional characteristic-zero vector space and (T−1)^d=0, log T is the finite sum Σ_{1≤j<d}(-1)^(j+1)(T−1)^j/j. It is independent of the chosen valid d, nilpotent, and inverse to the pinned nilpotent exponential. For an inertia action factoring through t_ℓ on an open subgroup, these logarithms give the canonical twisted N:V→V(−1).

**Hypotheses.**

- Characteristic-zero coefficient field; finite dimension
- Unipotence is an input, not deduced from an arbitrary inertia action

**Construction.**

1. Define the finite polynomial using the actual Module.End algebra.
2. Use formal polynomial identities modulo X^d for bound independence, nilpotence and the log/exp inverse.
3. Use the imported tame character and unipotence to identify log ρ(σ)=t_ℓ(σ)N.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog` (constructor): The explicit finite polynomial log(1+U) in Module.End.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_bound_independent` (compatibility): If U^d=U^e=0, the sums using d and e are equal.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_nilpotent` (structure): The finite logarithm is nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_exp` (relation): exp(log T)=T, using IsNilpotent.exp.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_twisted` (compatibility): log ρ(σ)=t_ℓ(σ)N; changing the Tate generator changes the scalar matrix but not N:V→V(−1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_conj` (functoriality): Conjugating U by a linear equivalence conjugates finiteLog(U,d), for every d.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero` (degenerate): log 1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero` (computation): If U²=0 then log(1+U)=U.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block` (computation): For U=E₀₁+E₁₂ on Q³, log(1+U)=U−U²/2.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection` (non-example): The involution −1 on Q is not unipotent, so the finite nilpotent logarithm hypothesis fails.

**Acceptance.**

- For a square-zero rank-one U, log(1+U)=U.
- For a three-step Jordan block, log(1+U)=U−U²/2.
- No logarithm is defined by this polynomial for an automorphism with eigenvalue −1.

**Used by.**

- LPV.1 can/var and monodromy filtration: Turns tame unipotent inertia into a canonical nilpotent twisted operator.
- LPV.5 compact-image proof: Identifies the actual rank-one logarithms inside the ℓ-adic analytic Lie algebra.

**Depends on.** other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`; libraries: `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`, `mathlib:IsNilpotent.exp`, `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower`.

**Sources.**

- `illusie-1994`, §1.5, pp. 12–13, (1.5.1)–(1.5.2): “log” — Definition of the logarithm on an open unipotent inertia subgroup and its canonical twisted form.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Corrected logarithm locator to Illusie 1.5 and added conjugation API. Finite polynomial/log-exp signatures are sound; finiteLog_twisted currently expresses a scalar log-exp inverse, not the packet’s twisted inertia/generator-independence interface.

### Geometric local monodromy theorem

`LPV.1/geometric-quasi-unipotence` · theorem · planet “Geometric local monodromy” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.geometricQuasiUnipotence` (omitted signature)

For ℓ different from the residue characteristic and a finite-type family over a henselian discretely valued field in the geometric local-monodromy setting, inertia acts quasi-unipotently on its finite-dimensional rational ℓ-adic geometric cohomology with constant ℚ_ℓ coefficients (with compact supports as well). After a finite extension the action is unipotent and factors through the ℓ-primary tame character. An arbitrary continuous representation of the inertia of an algebraically closed-residue field is not asserted quasi-unipotent by a formal group-theoretic argument.

**Hypotheses.**

- Geometric cohomology of a finite-type family; finite-dimensional ℚ_ℓ realization; ℓ invertible
- The hypotheses of the geometric theorem in Illusie 1.4; excellent trait in the nearby-cycle realization
- An arbitrary inertia representation needs the distinct arithmetic residue-field hypothesis of the representation-theoretic theorem

**Proof.**

1. Apply the geometric local monodromy theorem recalled in Illusie 1.4, whose proof is requested from the arithmetic/local-monodromy supplier.
2. Pass to a finite extension killing the finite semisimple inertia part.
3. Use the structure of tame inertia and the vanishing of a finite-order unipotent action in characteristic zero to remove wild inertia.

**Acceptance.**

- A quadratic reflection becomes unipotent after the quadratic extension, with N=0.
- A character of tame inertia with infinite semisimple image is not used as a geometric counterexample to the theorem.

**Depends on.** this roadmap, same part: `LPV.0/constructibility-and-finite-amplitude`, `LPV.0/adic-nearby-cycle-realization`; other roadmaps' nodes: `SchemeAndStackFoundations:key/excellent-schemes`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `illusie-1994`, §§1.2–1.4, geometric theorem (1.4): “géométrique” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 1.4 is a geometric cohomology theorem, not a theorem about arbitrary representations. Added excellence ownership. The Lean assertion for every characteristic-zero representation is false (integer group acting by powers of 2).

### Monodromy after a ramified extension

`LPV.1/finite-extension-and-logarithm-rescaling` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling`

For a finite extension of henselian discretely valued fields of ramification index e, restrict the inertia representation and transport Tate twists. On a common unipotent open subgroup the normalized monodromy satisfies N′=eN relative to the respective uniformizer-normalized tame characters. Thus log nilpotency index, monodromy filtration and primitive dimensions are unchanged for e≠0 in the rational coefficient field.

**Hypotheses.**

- Finite extension; rational characteristic-zero coefficients; common unipotent subgroup
- Integral assertions do not cancel e when e is divisible by ℓ

**Proof.**

1. Use the Kummer formula t_ℓ|I′=e t_ℓ′ from R01.2.
2. Compare exp(t_ℓ N) and exp(t_ℓ′N′), then apply the finite logarithm.
3. Use nonzero scalar invariance of the monodromy filtration and its primitive kernels.

**Acceptance.**

- For a nodal curve under t=u^e the rank-one logarithm is multiplied by e.
- For a killed reflection N=N′=0.

**Depends on.** this roadmap, same part: `LPV.1/finite-monodromy-logarithm`, `LPV.0/coefficient-and-trait-change`, `LPV.1/monodromy-filtration`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `deligne-weil-ii`, 1.6.14 and 1.7.2, pp. 169–172: “choix de N” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Illusie 1.5 and tame-character restriction give N′=eN. The scalar-invariance prototype correctly requires this equality and nonzero e; it does not claim geometric rescaling for unrelated operators.

### Monodromy filtration centered at an integer

`LPV.1/monodromy-filtration` · construction · planet “Monodromy filtration” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration`

For nilpotent N on a finite-dimensional vector space, define the unique finite increasing filtration M centered at c with N M_i⊂M_(i−2) and N^r:Gr_(c+r)^M V≅Gr_(c−r)^M V (with twist −r when N is a twisted map). One concrete center-zero formula is M_k=Σ_{a,b≥0,a−b=k}(ker N^(a+1)∩im N^b). For N=0, M_(c−1)=0 and M_c=V. Primitive parts use Deligne’s lower-weight convention P_i=ker(N:Gr_i→Gr_(i−2)), zero for i>c.

**Hypotheses.**

- Finite-dimensional field module; nilpotent N; integer center c
- For equivariant twisted N, all graded powers retain their Tate twists

**Construction.**

1. Construct by induction on a nilpotence bound, using ker N^d/im N^d, or the displayed kernel-image formula.
2. Check N lowers by two and induces the opposite graded isomorphisms.
3. Prove uniqueness by the same extreme graded pieces and induction; use scalar invariance to remove a Tate generator choice.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration` (constructor): The finite increasing kernel-image filtration M indexed by Z and centered at c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_mono` (structure): M_i≤M_j for i≤j, with a finite lower and upper bound.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_lowering` (relation): N(M_i)⊂M_(i−2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower` (data): The induced map N^r from Gr_(c+r) to Gr_(c−r), with twist −r.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_bijective` (characterisation): Each opposite graded-power map is bijective.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_scalar` (compatibility): M(aN,c)=M(N,c) for a≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.primitivePart` (projection): P_i is the kernel of the induced graded N, using the lower-weight convention.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_conj` (functoriality): Conjugation by a linear equivalence maps each filtration submodule to the corresponding submodule of the conjugate operator.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero` (degenerate): For N=0 the filtration is 0 below c and V at and above c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block` (computation): For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block` (computation): For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration` (non-example): For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V.

**Acceptance.**

- A size-three Jordan block has weights c−2,c,c+2.
- A size-two block has weights c−1,c+1, so the filtration is not the kernel-power filtration.

**Used by.**

- LPV.1 primitive and relative-filtration interfaces: Provides the center, graded powers and generator-independent filtration.
- LPV.7 semistable curves and Liu et al. §5.9: Supplies linear monodromy conventions; no weight spectral sequence is planned here.
- Kisin–Pappas §4.7.1: Makes inertia finite on graded pieces for semisimple traces.

**Depends on.** this roadmap, same part: `LPV.1/finite-monodromy-logarithm`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; libraries: `mathlib:Submodule.span`.

**Sources.**

- `deligne-weil-ii`, 1.6.1–7 and 1.6.14, pp. 165–170: “filtration” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Weil II 1.6.1–7/14 supports the kernel-image formula, opposite graded isomorphisms, lower primitive convention and bounds. Nilpotence is present in the relevant signatures; added conjugation transport API.

### Primitive decomposition and strictness of N

`LPV.1/primitive-decomposition-and-strictness` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition`

For the center-zero monodromy filtration, N:(V,M)→(V,M shifted by two) is strict: N(M_(i+2))=im N∩M_i. Consequently Gr_i(ker N)≅P_i. Every Gr_i V is the direct sum of the lower primitive pieces P_−j with j≥|i| and j≡i mod 2, using the inverses of the opposite-graded isomorphisms N^j followed by powers of N (equivalently, in characteristic zero, the canonical SL₂ raising operator); on a length-(d+1) Jordan block the successive weights are d,d−2,…,−d. In characteristic zero the associated graded has the canonical SL₂ action whose lowering operator is N.

**Hypotheses.**

- Nilpotent N and finite-dimensional vector space; characteristic zero only for SL₂
- Strictness here is for N and for isomorphisms commuting with N; arbitrary commuting morphisms are not asserted strict

**Proof.**

1. Apply the opposite-graded isomorphisms to split a graded piece into its primitive kernel and the next N image.
2. Iterate to obtain the decomposition and deduce strictness by graded surjectivity/injectivity.
3. Use Jordan blocks for the explicit weights.
4. Construct the characteristic-zero SL₂ realization on each nilpotent Jordan block, using the specifically requested LieHighestWeight, Part II extension and the existing SL₂ classification. No general Jacobson–Morozov theorem is asserted to be supplied by Layer 0.

**Acceptance.**

- A size-three block contributes a one-dimensional P_−2 and no other primitive part.
- For a commuting map from a trivial one-dimensional module into ker N of a two-block, strictness fails at index −1; the theorem does not assert it.

**Depends on.** this roadmap, same part: `LPV.1/monodromy-filtration`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

**Sources.**

- `deligne-weil-ii`, 1.6.3–8 and 1.6.10–11, pp. 165–168: “primitive” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** corrected: Corrected the lower-primitive decomposition to use inverse opposite-graded maps before powers of N, and replaced the unjustified generic Jacobson–Morozov import by the requested Jordan-block SL₂ extension. The strictness prototype is sound; the new SL₂ realization remains an explicit supplier extension.

### Tensor, dual and symmetric monodromy filtrations

`LPV.1/tensor-dual-and-symmetric-monodromy` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual`

In characteristic zero, for N=N₁⊗1+1⊗N₂, the monodromy filtration is the convolution M_i=Σ_(a+b=i)M_a(V₁)⊗M_b(V₂), with centers added. For the dual operator −Nᵗ, M_i(V*)=ann M_(−i−1)(V) at center zero. The associated graded and primitive decomposition commute with these operations, with the Tate twists attached to powers of N. Sym^d of the standard two-block is the length-(d+1) block with weights −d,−d+2,…,d.

**Hypotheses.**

- Finite dimension; characteristic zero for tensor and symmetric-power assertions
- Dual uses −Nᵗ and the reflected filtration indices

**Proof.**

1. Use the SL₂ weight decomposition and the tensor/dual rules of the supplier.
2. Apply uniqueness of the monodromy filtration.
3. Use Clebsch–Gordan to identify primitive multiplicities and symmetric-power blocks.

**Acceptance.**

- Two size-two blocks tensor to a size-three block plus a size-one block.
- The dual of a size-two block has the same weights −1,1 with operator −Nᵗ.

**Depends on.** this roadmap, same part: `LPV.1/primitive-decomposition-and-strictness`, `LPV.1/monodromy-filtration`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

**Sources.**

- `deligne-weil-ii`, 1.6.9–12 and 1.6.14, pp. 167–170: “produit tensoriel” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Weil II 1.6.8–12 gives characteristic-zero tensor convolution, dual annihilators and symmetric powers. The dual prototype has the correct minus-transpose and index −i−1; the other operations are specified mathematically with the SL₂ supplier.

### Relative monodromy filtration: uniqueness

`LPV.1/relative-monodromy-uniqueness` · theorem · planet “Relative monodromy filtration” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique`

Given a finite increasing filtration W and nilpotent N preserving W, at most one finite increasing M satisfies N M_i⊂M_(i−2) and N^r:Gr_(w+r)^M Gr_w^W V≅Gr_(w−r)^M Gr_w^W V for every w and r≥0. Existence is an additional hypothesis; scaling N by a nonzero scalar does not change M. The corresponding graded maps have twist −r for twisted monodromy.

**Hypotheses.**

- Finite filtrations; nilpotent N preserving W
- No unconditional existence conclusion

**Proof.**

1. Induct on the length of W using the source’s three identities determining M from W’s last graded quotient and the previous subobject.
2. Apply the center-w uniqueness theorem on each Gr_w^W.
3. Check the defining conditions are invariant under nonzero scaling.

**Acceptance.**

- For W pure of weight w the relative filtration is the ordinary filtration centered at w.
- For N(e₁)=e₀, W_0=Qe₀ and W_1=Q², no relative M exists: the prescribed graded centers force N M_1⊂M_−1=0, contradicting N≠0.

**Depends on.** this roadmap, same part: `LPV.1/monodromy-filtration`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Sources.**

- `deligne-weil-ii`, 1.6.13–14, pp. 168–170: “au plus” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Weil II 1.6.13–14 supports uniqueness, not existence. The Lean data include finite increasing W,M,M′, lowering, preserved W and the induced graded conditions, without assuming the desired equality.

### Tame restriction along a normal-crossings divisor

`LPV.1/normal-crossings-tame-restriction` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.normalCrossingsTameRestriction` (omitted signature)

For a regular scheme with strict normal-crossings divisor D=∪D_a and a lisse rational ℓ-adic sheaf on its complement, tame unipotent local inertia gives commuting twisted residues N_a on the tame restriction to each stratum. The restriction is constructed using compatible Kummer covers and is independent of their cofinal choice. Relative filtrations along a stratum are unique when they exist. Existence and purity under mixedness are requested from DeligneWeightsAndPurity; they are not consequences of the linear algebra alone.

**Hypotheses.**

- Strict normal crossings; ℓ invertible; tame and unipotent local monodromy after the specified cover
- The relative-filtration existence result needs the weight hypotheses of Weil II 1.9.1
- Local Kummer coordinates are fixed for the restriction on E; independence of the cofinal tower does not assert independence of defining equations. The intrinsic version uses the normal-bundle torsor (1.7.10).

**Proof.**

1. Import Kummer tame covers/Abhyankar and take the compatible restriction system.
2. Identify the commuting tame factors and apply finite logarithms to obtain N_a.
3. Apply relative uniqueness to compare orders of restrictions whenever the required filtrations exist.
4. Route Weil II 1.9’s mixedness/purity argument to the weight supplier.

**Acceptance.**

- On a two-component coordinate divisor the two residues commute.
- A wild local system is not assigned a tame Kummer restriction by this theorem.

**Depends on.** this roadmap, same part: `LPV.1/finite-monodromy-logarithm`, `LPV.1/relative-monodromy-uniqueness`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Sources.**

- `deligne-weil-ii`, 1.7.8–10, pp. 172–174: “restriction à E” — Kummer tame restriction, its dependence on local defining equations, and the intrinsic normal-bundle formulation; commuting logarithms follow from commuting tame factors.
- `deligne-weil-ii`, 1.9.1–6, pp. 179–181: “filtration” — Weight-dependent relative-filtration existence; an outgoing weight application, not an input to LPV’s linear uniqueness.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Corrected Kummer/normal-bundle locators and coordinate dependence, removed the wrong DWP.1 input, and routed weight existence downstream to DWP.5. The prototype still says any endomorphism family commutes.

### Maximal unipotence and maximal nilpotence

`LPV.1/maximal-unipotence` · definition · planet “Maximal unipotence” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent`

On a nonzero n-dimensional characteristic-zero vector space, T is maximally unipotent when its minimal polynomial is (X−1)^n, and N is maximally nilpotent when its minimal polynomial is X^n. For N=log T these are equivalent to a single size-n Jordan block and dim ker N^j=min(j,n). The zero-dimensional case is excluded from the adjective; it is not silently a size-zero Jordan block.

**Hypotheses.**

- Finite-dimensional characteristic-zero vector space; n>0
- T unipotent for the equivalence with log

**Construction.**

1. Use the existing unipotent predicate and minimal-polynomial API; define the maximal nilpotency-index condition.
2. Use Jordan block decomposition to identify the minimal polynomial and kernel dimensions.
3. Compare log(1+U)=U times a polynomial with invertible constant coefficient, so all kernel powers have the same dimensions.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent` (characterisation): For dim V=n>0, N^n=0 and N^(n−1)≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyUnipotent` (characterisation): T is unipotent and T−1 is maximally nilpotent; equivalent to minpoly T=(X−1)^n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalLog_iff` (equivalence): Maximal unipotence of T is equivalent to maximal nilpotence of log T.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_kernel_rank` (relation): dim ker N^j=min(j,n).
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_conj` (compatibility): Maximal nilpotence is invariant under conjugation by a linear equivalence.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block` (computation): The size-three Jordan block is maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one` (non-example): A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension` (degenerate): The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded` (non-example): The zero-dimensional vector space does not satisfy the nonzero-dimension definition.

**Acceptance.**

- A three-block is maximal, while a direct sum of a two-block and a trivial line is not.

**Used by.**

- Qian, published Definition 3.6: Exports the minimal-polynomial and kernel-rank tests without the unrelated automorphy proof.
- LPV.1 monodromy filtration: Recognizes the single primitive block and its extremal weights.

**Depends on.** this roadmap, same part: `LPV.1/finite-monodromy-logarithm`, `LPV.1/primitive-decomposition-and-strictness`; libraries: `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`.

**Sources.**

- `qian-2023`, Published Definition 3.6: “maximally unipotent” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Published Qian Definition 3.6 checked. Nonzero dimension, nilpotence index and kernel dimensions characterize a single block; zero dimension is excluded. Added conjugation invariance. Source minimal-polynomial wording and the equivalent nilpotence-index predicate agree.

### Semisimple trace on finite-inertia graded pieces

`LPV.1/semisimple-nearby-trace` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace`

For a bounded finite-dimensional Weil complex with quasi-unipotent inertia, choose an inertia-stable finite filtration with finite inertia image on each graded piece. Its semisimple Frobenius trace is Σ_i,j(-1)^i Tr(Frob;(Gr_j H^i)^I). It is independent of the finite-inertia filtration, additive in equivariant distinguished triangles, and unchanged by the allowed choice of Frobenius lift. It generally differs from the trace on H^i(K)^I, since taking invariants before removing unipotent extensions is not exact.

**Hypotheses.**

- Finite-dimensional rational ℓ-adic Weil modules; inertia finite on graded pieces
- The Frobenius endomorphism normalizes inertia; finite-group averaging uses characteristic zero

**Construction.**

1. Use geometric quasi-unipotence and the monodromy filtration to obtain finite inertia on graded pieces.
2. Compute each invariant graded trace using the projector averaging over its finite inertia image.
3. Prove filtration independence by a common refinement and exactness of finite-group invariants.
4. Apply finite-dimensional trace additivity to triangle cohomology; import the generic trace and adic realization suppliers.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace` (constructor): Alternating sum of Frobenius traces on the inertia invariants of finite-inertia graded cohomology.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement` (compatibility): The trace is unchanged under a finite common refinement.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_additive` (relation): For an equivariant distinguished triangle, trace B=trace A+trace C.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift` (compatibility): Changing Frobenius by an inertia element leaves the semisimple trace unchanged.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial` (computation): For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block` (non-example): For a two-block with compatible graded Frobenius eigenvalues a and qa, the semisimple trace is a+qa, while the trace on inertia invariants is only the eigenvalue of ker N.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic` (computation): For a nontrivial quadratic finite inertia line, the semisimple trace is 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift` (compatibility): Shifting a complex by one negates its semisimple trace.

**Acceptance.**

- A trivial one-dimensional inertia module gives its ordinary Frobenius trace.
- For a nontrivial two-dimensional unipotent inertia block with compatible Frobenius eigenvalues a and qa on the two finite-inertia grades, the semisimple trace is a+qa; the trace on inertia invariants is just the eigenvalue on ker N. The Frobenius normalization fixes the direction of q-rescaling.
- A finite quadratic character has invariant trace zero.

**Used by.**

- Kisin–Pappas §4.7.1: Supplies the semisimple trace of the already-defined nearby-cycle stalk; the local-model trace formula remains with its owner.
- IgusaVarietiesAndTorsionConcentration IG.5: Provides the rational trace interface without asserting that torsion invariants are exact.

**Depends on.** this roadmap, same part: `LPV.1/geometric-quasi-unipotence`, `LPV.1/monodromy-filtration`, `LPV.0/adic-nearby-cycle-realization`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `kisin-pappas-2018`, §4.7.1, p. 212, semisimple trace of RΨ: “semi-simple trace” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Kisin–Pappas 4.7.1 establishes the use of semisimple trace, not its full construction. Missing primary refinement source recorded. Arbitrary lists in the Lean refinement/additivity statements need actual common grading data.

### Two-component semistable nearby-cycle complex

`LPV.1/two-component-semistable-nearby-complex` · construction · planet “Two-component monodromy complex” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex`

Let a regular strictly semistable scheme over an excellent strictly henselian trait have special fibre D₁∪D₂, with smooth transverse components and intersection C. The early filtered Rapoport–Zink nearby-cycle complex has graded objects gr₁=Λ_C[−1](−1), gr₀=Λ_D₁⊕Λ_D₂, gr_−1=Λ_C[−1], and other grades zero; the boundary maps are alternating restrictions and Gysin maps. N:gr₁→gr_−1(−1) is the identity on Λ_C[−1](−1), and N²=0 in the filtered derived calculation. The corrected simple complex resolves K=RΨΛ, not the inertia-cohomology cone L. Its inertia action can be trivial on cohomology sheaves while N on the derived object is nonzero.

**Hypotheses.**

- Strictly semistable regular total space over a excellent strictly henselian trait; precisely two transverse components
- Λ finite with ℓ invertible, or rational ℓ-adic after realization
- Only this filtered two-component calculation is claimed here; the general weight spectral sequence belongs to LPV.7

**Construction.**

1. Import the coherent filtered-derived construction and absolute purity for regular trait pairs.
2. Build the two-row restriction/Gysin double complex from the intersections, with the 1994 erratum’s 1−T upper differential.
3. Use the corrected filtered quasi-isomorphism sA≅K and compute the three nonzero grades.
4. Read N as the identity shift of the double complex; its second iterate is zero because there are only two components.
5. For rational coefficients identify inertia with exp(t_ℓ N); finite coefficients in this two-step case use T−1 directly, without denominators.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex` (constructor): The filtered nearby complex on D₁∪D₂, with actual restriction/Gysin differentials.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_grades` (data): The three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1].
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_monodromy` (relation): N on the outer grades is the identity after the Tate twist, and N²=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_resolves` (compatibility): The corrected total complex is quasi-isomorphic to the geometric nearby complex K, not to L=RΓ(I,K).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node` (computation): For xy=π, the degree-one nearby stalk is Λ(−1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint` (degenerate): If C is empty then N=0 and only the center-zero grade remains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split` (non-example): For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square` (characterisation): The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1).

**Acceptance.**

- For xy=π the intersection term is a point, R¹Ψ=Λ(−1), and the sheaf-level inertia action is trivial.
- With C empty all off-center grades vanish and N=0.
- A nonzero derived N in the nodal case prevents replacing the filtered complex by the direct sum of its cohomology sheaves.

**Used by.**

- LPV.2 algebraic Picard–Lefschetz: Provides the semistable N calculation before LPV.2, removing the cycle through LPV.7.
- RT-AREA-etale/18 and Illusie 2002 erratum: Fixes the proof route and the corrected local concentration range.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`, `SchemeAndStackFoundations:key/excellent-schemes`; other roadmaps' stages: `EnhancedDerivedSheaves:E0`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Sources.**

- `illusie-2021`, §6.3, pp. 104–105, formulas (6.2)–(6.4): “Rapoport–Zink” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 2021 6.3 supports the three grades and derived N, using the corrected 1994 K and differential. Added excellent-trait ownership. Arbitrary filtered, graded and realization functors in Lean do not identify a Rapoport–Zink total complex with RΨ.

**Assembly note.** The general strictly semistable case is `LPV.7:semistable-curves/snc-graded-nearby-complex`, whose two-component acceptance case has exactly these three grades. The general node should cite this one as the special case it recovers; this node, planned earlier, cannot cite the general one.

### Twisted monodromy and Frobenius equivariance

`LPV.1/twisted-monodromy-equivariance` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.twistedMonodromyEquivariance`

The canonical N:V→V(−1) is equivariant for the trait Galois action. After trivializing the Tate line and using geometric Frobenius over 𝔽_q, this reads NF=qFN. For σ in the chosen unipotent inertia subgroup, ρ(σ)=exp(t_ℓ(σ)N). Changing a Tate generator by a unit rescales the displayed scalar N inversely and leaves the twisted map unchanged.

**Hypotheses.**

- Finite-dimensional rational ℓ-adic geometric representation; a unipotent open inertia subgroup
- Geometric Frobenius convention; Frob acts by q on ℚ_ℓ(−1)

**Proof.**

1. Use finite log/exp and the tame character conjugation rule from R01.2.
2. Interpret the scalar logarithm as a map into the inverse Tate line.
3. Apply Galois equivariance to geometric Frobenius and write the resulting q relation.

**Acceptance.**

- For a two-block with F eigenvalues a on ker N and qa on the quotient, NF=qFN.
- Arithmetic Frobenius would invert q; the convention is fixed explicitly.

**Depends on.** this roadmap, same part: `LPV.1/finite-monodromy-logarithm`, `LPV.1/geometric-quasi-unipotence`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `illusie-1994`, §1.5, p. 13, (1.5.3)–(1.5.4): “Frobenius” — Canonical twisted N and the displayed geometric-Frobenius relation NF=qFN.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Corrected Illusie locator to 1.5.3–4. Geometric Frobenius gives NF=qFN. The prototype asserts this for arbitrary N,F,q, which is false for N=F=id and q=2.

## LPV.2 — Ordinary quadratic singularities and Picard–Lefschetz

LPV.2 is the largest layer, 31 nodes in four groups.

- **Quadratic algebra (SGA 7 XII).** Ordinary quadratic forms, with the characteristic-two distinction (`ordinary-quadratic-form`, planet "Ordinary quadratic form"); the étale-local normal form; the even Clifford centre, the discriminant double cover and the two families of generatrices; smooth quadrics over a base (planet "Smooth quadric"); their ℓ-adic cohomology and point counts (planet "Cohomology of quadrics"); and affine quadrics with the vanishing class δ and the sign of δ² (planet "Vanishing cycle of the affine quadric").
- **Local geometry (SGA 7 XV §§1–2).** Ordinary and nondegenerate quadratic points (planet "Ordinary quadratic singularity"); the Tjurina module; henselian approximation and versal deformation, imported in their general form from SchemeAndStackFoundations, Part II; canonical forms and the local equation Q − b of a family; nonsmooth points nearby; homotopy invariance; cones, punctured cones and the anticommutative boundary diagram; standard quadratic degenerations, their nearby cycles and variation; and the local description of δ.
- **Picard–Lefschetz.** Concentration and rank of RΦ at ordinary quadratic points (XV 3.1.2); the even variation with its quadratic character (XV 3.2); the odd formula with the Kummer character of b (XV 3.3), proved algebraically through LPV.1's two-component complex; the specialization sequence of a proper family with one ordinary quadratic point and the Picard–Lefschetz formula in Weil I §4's form (planet "Picard–Lefschetz formula"); and the direct images R^i f_*ℚ_ℓ at such a degeneration, including δ = 0.
- **Comparisons and branches.** The complex sign table, a verification of conventions and not the algebraic proof; the wild quadratic character in characteristic two; nonordinary concentration after Illusie 2003 for the Fresán–Sabbah–Yu singularities; and the Fresán–Sabbah–Yu discriminant example.

Every node is unverifiable in the review's sense: the source work, with the twelve SGA 7 misprints E1–E12, is confirmed, but the suggested Lean forms do not bind the theorems to their quadratic models. The original algebraic proof of the odd sign (Illusie 2002) and the hypotheses of Illusie 2003 are unread (G-algebraic-PL, G-nonordinary), and general approximation is a supplier gap (G-approximation).

**Coverage.** `partial`. Remaining:
- Read the original Illusie 2002 odd algebraic proof and 2003 nonordinary concentration hypotheses; resolve Artin/Elkik supplier proof gaps.
- G-review-signature-fidelity: bind every quadratic cohomology/variation theorem to its actual model and coefficient ring; restore general characteristic-two/base-change and canonical-ambient scope; represent dimension-zero nearby/costalk ranks and globally signed coefficient reductions.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Concentration and rank of the nearby cycles at ordinary quadratic singular points (XV 3.1.1-3.1.2)

`LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryQuadraticPointNearbyCycles312` (omitted signature)

For f:X→S flat of finite type and pure relative dimension n over a henselian trait, assume the special fibre is smooth away from finitely many ordinary quadratic points. Let Σ be those points and E⊂Σ the points near which the generic fibre is smooth. With finite coefficients Λ invertible on S, R^iΦΛ=0 for i≠n and R^nΦΛ is supported exactly on E, where its stalks are free of rank one. The local nearby-cycle stalk and costalk pairing is perfect; at n=0 the nearby-cycle degree-zero stalk has rank two, while the vanishing-cycle stalk has rank one.

**Hypotheses.**

- f flat of finite type, pure relative dimension n; special-fibre singularities ordinary quadratic
- Λ finite torsion invertible on S
- E is the smooth-generic subset of the singular locus; persistent cone singularities are excluded from its support

**Proof.**

1. Apply the henselian local equation and the standard degeneration calculation.
2. Smooth local acyclicity removes the smooth locus; the persistent-cone case removes Σ−E.
3. Apply the affine-quadric compact-support duality calculation, keeping Ψ distinct from Φ in degree zero.

**Acceptance.**

- Outside E (points where the generic fibre is not smooth nearby) the vanishing cycles vanish (2.2.4).
- For n = 0 the rank is 2 (two points degenerating to one).

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles`.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.2/ordinary-quadratic-point`, `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/standard-quadratic-degeneration`, `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Proposition 3.1.2, p. 24: “Proposition 3.1.2. (i) Les faisceaux R^i Phi(Lambda) sont nuls pour i != n. (ii) Le faisceau R^n Phi(Lambda) est nul en dehors de Sigma. Sa restriction a Sigma est un faisceau de Lambda-modules de rang 1. (iii) Pour tout point geometrique xbar de Sigma, la forme (a,b) (2.2.5 (C)) met en dualite l…” — The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 1 of 2 of the passage)
- `SGA7II-1973`, Exposé XV, Proposition 3.1.2, p. 24: “Ceux-ci sont libres de rang un pour n != 0, de rang 2 pour n = 0.” — The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 2 of 2 of the passage)
- `SGA7II-1973`, Exposé XV, proof of 3.1.2, p. 24: “Les assertions de 3.1.2 sont de nature locale pour la topologie étale. Ceci permet de ne traiter que le cas où S est strictement hensélien, et où X est l'hypersurface de l'espace affine relatif A^{n+1}_S défini par une équation quadratique vérifiant 2.2.1 (a) (b) (appliquer 1.3.2).” — Reduction to the standard model.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 3.1.2 and the 2021 survey support the ordinary quadratic result with its actual local model. The Lean Phi is an arbitrary complex, so rank-one concentration is false for Phi=0.

### Even relative dimension n = 2m: the natural generator ±δ of H^n_{x}(R^nΦ(A(m))), the quadratic character ε_x of inertia and Var(σ)(a) = (−1)^m (ε_x(σ) − 1)/2 · (a,δ)δ (XV 3.2.1-3.2.3)

`LPV.2/even-relative-dimension-variation-3-2` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.evenRelativeDimensionVariation32` (omitted signature)

Notation of 3.1 with n = 2m, S strictly henselian (general case by descent). Proposition 3.2.1: (i) for x ∈ E the group H^n_{x}(R^n Psi_eta(A(m))) (the source writes psi_eta here, not Phi) has a natural generator δ, well defined up to sign, characterised by naturality in A and (δ,δ) = (−1)^m·2 (for n = 0 add Tr(δ) = 0); (ii) for a suitable character ε_x: I -> {±1} of the inertia group (independent of A), Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a δ) δ for a ∈ R^n Φ_η(A(m)), whence σ(δ) = ε_x(σ) δ. Proof: pass to the universal case A = Z_ℓ; up to sign only one δ satisfies (i); reduce as in 3.1.2 to 2.2.5 and apply 2.2.5 (D). Complément 3.2.2: if the henselization of X at x is that of the projective quadric Σ a_ij X_i X_j = 0 at x_0, ε_x is defined by the separable quadratic extension of the fraction field given by the centre of the even Clifford algebra Z(C^+(Q)). 3.2.3: in residue characteristic ≠ 2, I has a unique nontrivial character ε of order 2 (σ(√t) = ε(σ)√t for a uniformizer t); X_(x) is the henselization at 0 of Σ a_ij x_i x_j = b with b in the maximal ideal and Q nondegenerate; the centre of the Clifford algebra is k(η)(√((−1)^{m+1}·2b·det(a_ij))) (Bourbaki Alg. ch. 9 §9 no. 4), so ε_x = ε^{v(b)}: the variation vanishes if v(b) is even and ε_x = ε otherwise.

**Hypotheses.**

- n = 2m even; S strictly henselian; x ∈ E
- 3.2.3 requires residue characteristic ≠ 2 and uses the Clifford-algebra description; the characteristic-2 case is only covered by 3.2.2's Clifford-centre description
- NOTATION as in the 3.1.2 node: the source's Sigma is this packet's E. Part (i) of 3.2.1 is about R^n psi_eta and part (ii) about R^n Phi_eta; the two are genuinely different functors and the source uses both on the same page.

**Proof.**

1. Universal case A = Z_ℓ and uniqueness of δ up to sign.
2. Reduction to the standard quadric and 2.2.5(D).
3. Clifford-algebra computation of ε_x.

**Acceptance.**

- For v(b) even the local monodromy is trivial in even relative dimension; for v(b) odd it is the reflection σ(δ) = −δ (when ε_x(σ) = −1).
- Sign convention: (δ,δ) = (−1)^m·2 fixes δ up to sign; the n mod 4 sign table of the stage must be checked against this normalisation.

**Cited by other roadmaps' packets.** `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LPV.0/variation-morphism`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/discriminant-double-cover-of-an-even-quadric`, `LPV.2/variation-in-a-standard-quadratic-degeneration`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Proposition 3.2.1, pp. 24-25: “Proposition 3.2.1. (i) Pour x in Sigma, le groupe H^n_{x}(R^n psi_eta(Lambda(m))) a un generateur naturel delta, bien defini au signe pres, caracterise par les conditions d'etre naturel en Lambda et de verifier (delta,delta) = (-1)^m 2 (pour n = 0, ajouter la condition Tr(delta) = 0).” — The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 1 of 2 of the passage)
- `SGA7II-1973`, Exposé XV, Proposition 3.2.1, pp. 24-25: “(ii) Pour un caractere epsilon_x : I -> {+-1} convenable (independant de Lambda) du groupe d'inertie I, la variation s'ecrit Var(sigma)(a) = (-1)^m ((epsilon_x(sigma) - 1)/2)(a delta) delta (pour a in R^n Phi_eta(Lambda(m))). Il resulte que sigma(delta) = epsilon_x(sigma) . delta.” — The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 2 of 2 of the passage)
- `SGA7II-1973`, Exposé XV, 3.2.3, pp. 25-26: “La variation est nulle si b est de valuation paire, et sinon ε_x = ε” — Explicit character in residue characteristic ≠ 2.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 3.2 coefficient, parity and discriminant character checked. The arbitrary Var parameter is not connected to an ordinary degeneration; an unrelated endomorphism need not equal the source formula.

### Odd relative dimension n = 2m+1: the character c_b, the vanishing cycle ±δ_x from the primitive quotient of the tangent quadric, and the Picard-Lefschetz formulas Var(σ)(a) = (−1)^{m+1} c_{b(x)}(σ)(aδ)δ and σ(a) = a + (−1)^{m+1} c_{b(x)}(σ)(aδ_x)δ_x (XV 3.3.1-3.3.6)

`LPV.2/odd-relative-dimension-picard-lefschetz-3-3` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.oddRelativeDimensionPicardLefschetz33` (omitted signature)

Let X→S have an ordinary nondegenerate quadratic singularity of relative dimension n=2m+1, with smooth generic fibre, local equation Q−b=0 and b≠0 in the maximal ideal of the henselian trait. The primitive quotient of the exceptional quadric determines ±δ. For finite coefficients prime to the residue characteristic, Var(σ)(a)=(-1)^(m+1) ε_b(σ)(a,δ)δ, where ε_b(σ)=σ(b^(1/r))/b^(1/r) in μ_r=Λ(1); the root is of b. For a proper family this gives σ(a)=a+(-1)^(m+1)ε_b(σ)(a,δ)δ on middle cohomology. For ℚ_ℓ coefficients ε_b=v(b)t_ℓ. The algebraic proof uses the LPV.1 two-component filtered nearby-cycle calculation, its restriction/Gysin boundary signs and quadric cohomology, before LPV.2.

**Hypotheses.**

- n=2m+1; ordinary nondegenerate point; smooth generic fibre
- S henselian trait; b≠0; ℓ invertible; properness for the global cohomology formula
- Geometric δ is normalized by the primitive quadric classes; twists make ε_b(a,δ)δ untwisted

**Proof.**

1. Use the local equation and the primitive quotient of the tangent quadric to define ±δ.
2. Pass through the semistable two-component model and apply its filtered nearby-cycle N map; it has been planned in LPV.1 without LPV.7 or a weight theorem.
3. Compute restriction/Gysin on the exceptional quadric and its primitive classes to determine the coefficient (-1)^(m+1). The original calculation requires the source gap G-algebraic-PL to be resolved.
4. Transfer back by the dominant-trait exchange map and naturality of can/var; use the author erratum |i|>1, not |i|>−1.
5. For a regular proper degeneration b is a parameter, so ε_b=t_ℓ.

**Acceptance.**

- The formula has the sign (−1)^{m+1} and the twist A(m); the quadratic character is replaced by the Kummer character c_b of b.
- The global formula requires properness; the δ=0 branch is supplied separately by the specialization sequence and direct-image node.

**Cited by other roadmaps' packets.** `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison`, `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`.

**Depends on.** this roadmap, same part: `LPV.1/two-component-semistable-nearby-complex`, `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/local-description-of-the-vanishing-cycle`, `LPV.0/variation-morphism`, `LPV.0/derived-functorialities-and-specialization-sequence`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Sources.**

- `illusie-2021`, §6.1, pp. 103–104; §6.3, pp. 104–105: “Picard–Lefschetz” — The author describes the algebraic proof through the two-component Rapoport–Zink calculation; original proof interior is not claimed read.
- `illusie-2002-erratum`, p. 251 line 18 of the 2002 paper: “|i| > 1” — Corrected concentration bound used in the local calculation.
- `SGA7II-1973`, XV 3.3.2–6, pp. 26–30: “ε_b” — The original formula, coefficient character and quadric normalization; its transcendental proof is not used as the algebraic proof.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 3.3/Illusie 2021 support root of b and the odd sign; corrected acceptance’s root of −b and stale zero-cycle deferral. G-algebraic-PL remains honest. The arbitrary Var prototype has no geometric hypotheses and only rational coefficients.

### The specialisation sequence of a proper family with one ordinary quadratic point

`LPV.2/lefschetz-degeneration-specialization-sequence` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.lefschetzDegenerationSpecializationSequence` (omitted signature)

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Then: (i) there is a vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), well defined up to sign; (ii) sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ) is an isomorphism for i ≠ n, n + 1; (iii) there is an exact sequence 0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0 whose middle map is x ↦ Tr(x ∪ δ) and whose other maps are sp.

**Hypotheses.**

- The residue field is algebraically closed; the general case is reached by passing to the strict henselisation.
- ℓ is different from the residue characteristic p.
- X is regular and x is the only point where f fails to be smooth; the generic fibre X_η is then smooth and proper.

**Proof.**

1. Proper base change: H^i(X_s, ℚ_ℓ) = H^i(X, ℚ_ℓ) because S is henselian and f proper, and H^i(X_η̄, ℚ_ℓ) = H^i(X_s̄, RΨ_η ℚ_ℓ) by XIII 2.1.7.1 (finite coefficients ℤ/ℓ^k, then the limit).
2. The vanishing triangle sp^* i^*ℚ_ℓ → RΨ_η ℚ_ℓ → RΦ ℚ_ℓ → gives the long exact sequence … → H^i(X_s) → H^i(X_η̄) → H^i(X_s, RΦ) → H^{i+1}(X_s) → ….
3. By XV 3.1.2, applied with E = {x} (the generic fibre is smooth near x), RΦ(ℚ_ℓ) is concentrated in degree n and supported at x, of rank 1. So H^i(X_s, RΦ) = 0 for i ≠ n, which gives (ii), and H^n(X_s, RΦ) = R^nΦ(ℚ_ℓ)_x is a line.
4. The generator δ of XV 3.2.1 (n even) or of XV 3.3 (n odd) and the duality (a, b) of XV 3.1.2(iii) identify R^nΦ(ℚ_ℓ)_x with ℚ_ℓ(m − n) and the map H^n(X_η̄) → R^nΦ_x with x ↦ Tr(x ∪ δ), δ being the image of the local generator in H^n(X_η̄)(m). This uses XV 2.2.5 (the nearby-cycle and variation nodes of the standard quadratic degeneration) and XV 3.3.4.
5. The sequence of step 2 in degrees n − 1, …, n + 2, with the vanishing of step 3, is (iii); δ is determined up to sign because the local generator is.

**Acceptance.**

- n = 1, a curve of genus g acquiring one node: if the node is nonseparating, δ ≠ 0, the middle map is onto, dim H^1(X_s) = 2g − 1 and H^2(X_s) ≅ H^2(X_η̄); if it separates, δ = 0, H^1(X_s) ≅ H^1(X_η̄) and dim H^2(X_s) = 2.
- n = 0, X = Spec A[y]/(y² − π) with p ≠ 2: X_η̄ is two points, δ = e₁ − e₂ and the sequence is 0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.0/derived-functorialities-and-specialization-sequence`, `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LPV.2/even-relative-dimension-variation-3-2`, `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LPV.2/variation-in-a-standard-quadratic-degeneration`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `deligne-weil-i`, §4, (4.2), p. 288: “Voici l'analogue de (4.1) en géométrie algébrique abstraite” — The algebraic setting: a proper family over a henselian trait with one ordinary quadratic point.
- `deligne-weil-i`, §4, (4.3), (4.3.1)–(4.3.3), p. 288: “Ce cycle est bien défini au signe près” — The vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), the isomorphisms (4.3.2) and the exact sequence (4.3.3), whose middle map x ↦ Tr(x ∪ δ) was read on the page image.
- `deligne-weil-i`, §5, (5.13) B), p. 294: “Les résultats du § 4 sont démontrés dans les exposés XIII, XIV et XV de SGA 7” — The proofs are in SGA 7 XIII–XV.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 4.3–4 and XIII support the local specialization sequence. Its realization must bind all cohomology objects/maps to the proper family and its vanishing line, rather than unrelated supplied objects.

### The Picard–Lefschetz formula for a proper family

`LPV.2/local-picard-lefschetz-formula` · theorem · planet “Picard–Lefschetz formula” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.localPicardLefschetzFormula` (omitted signature)

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let I = Gal(η̄/η) (the inertia group, as the residue field is algebraically closed) act on H^i(X_η̄, ℚ_ℓ) by transport of structure, and write (x, δ) = Tr(x ∪ δ). Then I acts trivially on H^i(X_η̄, ℚ_ℓ) for i ≠ n. On H^n: (A) if n = 2m + 1 is odd, σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ, where t_ℓ : I → ℤ_ℓ(1) is the tame character; (B) if n = 2m is even and p ≠ 2, let ε : I → {±1} be the unique character of order 2; then σx = x when ε(σ) = 1 and σx = x + (−1)^{m+1}(x, δ)δ when ε(σ) = −1, and (δ, δ) = (−1)^m·2. Equivalently, in Deligne's table (4.1), the sign in σx = x ± … is − for n ≡ 0, 1 and + for n ≡ 2, 3 mod 4, and (δ, δ) = 2, 0, −2, 0.

**Hypotheses.**

- p ≠ 2 in case (B).
- ℓ ≠ p.
- The twists are as in the specialisation sequence: δ ∈ H^n(X_η̄)(m), (x, δ) ∈ ℚ_ℓ(m − n), so t_ℓ(σ)(x, δ)δ lies in H^n(X_η̄)(2m + 1 − n) = H^n(X_η̄) for n odd.

**Proof.**

1. Proper base change identifies the I-module H^n(X_η̄) with H^n(X_s̄, RΨ_η ℚ_ℓ), and σ = 1 + Var(σ) ∘ q on it (XIII 1.4.3), q being the map to H^n(X_s̄, RΦ) = R^nΦ_x.
2. For i ≠ n, R^iΦ = 0, so q = 0 in degree i and σ acts trivially.
3. Case n odd: XV 3.3 gives Var(σ)(a) = (−1)^{m+1} ε_b(σ)(a, δ)δ with b a generator of the ideal (b) of 3.3.1. As X is regular, b is a uniformiser, and ε_b is the Kummer character, whose ℓ-adic limit is t_ℓ.
4. Case n even, p ≠ 2: XV 3.2.1 gives Var(σ)(a) = (−1)^m((ε_x(σ) − 1)/2)(a, δ)δ and (δ, δ) = (−1)^m·2. Regularity of X makes ε_x nontrivial, and the tame quotient of I has a unique character of order 2 when p ≠ 2.
5. Substituting into σ = 1 + Var(σ) q gives (A) and (B). Evaluating at n = 0, 1, 2, 3 gives Deligne's table, which is checked against the complex Picard–Lefschetz table of (4.1).

**Acceptance.**

- n = 0, X = Spec A[y]/(y² − π), p ≠ 2: σ with ε(σ) = −1 swaps the two points, and x − (x, δ)δ with δ = e₁ − e₂ sends e₁ to e₂.
- Sign table for n = 0, 1, 2, 3: signs −, −, +, +; (δ, δ) = 2, 0, −2, 0; σδ = −δ for n even when ε(σ) = −1 and σδ = δ for n odd.

**Depends on.** this roadmap, same part: `LPV.2/lefschetz-degeneration-specialization-sequence`, `LPV.2/even-relative-dimension-variation-3-2`, `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LPV.0/variation-morphism`, `LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LPV.2/variation-in-a-standard-quadratic-degeneration`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `deligne-weil-i`, §4, (4.3) A), p. 288: “On dispose d'un homomorphisme canonique” — t_ℓ : I → ℤ_ℓ(1) and σx = x ± t_ℓ(σ)(x, δ)δ for n odd.
- `deligne-weil-i`, §4, (4.3) B), p. 289: “il existe un unique caractère d'ordre deux” — The even case with the quadratic character ε, p ≠ 2.
- `deligne-weil-i`, §4, (4.3), p. 289: “sont les mêmes qu'en (4.1)” — The signs are those of the complex table (4.1).
- `deligne-weil-i`, §4, (4.1), p. 287: “Sur C, les résultats locaux de Lefschetz sont les suivants” — The complex table of signs, (δ, δ) and Tδ by n mod 4, read on the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 4.1 sign and tame quadratic geometry checked. An arbitrary representation ρ is not a Picard–Lefschetz action; δ=0 would incorrectly force every such action trivial.

### The sheaves R^i f_*ℚ_ℓ at a Lefschetz degeneration, including the case δ = 0

`LPV.2/direct-images-at-a-lefschetz-degeneration` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.directImagesAtALefschetzDegeneration` (omitted signature)

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero.

**Hypotheses.**

- As in the specialisation sequence, with p ≠ 2 when n is even.

**Proof.**

1. A sheaf on S is a triple (G_s̄, G_η̄, φ : G_s̄ → G_η̄^I) (XIII 1.2.2); for R^i f_*ℚ_ℓ it is (H^i(X_s), H^i(X_η̄), sp) by proper base change. It is constant if and only if I acts trivially and sp is an isomorphism, and it equals j_*j^* of itself if and only if sp is an isomorphism onto the invariants.
2. For i ∉ {n, n + 1} both hold by the specialisation sequence and the Picard–Lefschetz formula.
3. δ ≠ 0: by Poincaré duality on X_η̄ some x has (x, δ) ≠ 0, so the middle map of (4.3.3) is onto; hence H^{n+1}(X_s) ≅ H^{n+1}(X_η̄), and I acts trivially there. In degree n, sp is injective with image δ^⊥, and δ^⊥ = H^n(X_η̄)^I because the fixed space of x ↦ x + c(x, δ)δ with c ≠ 0 is δ^⊥ (use LinearEquiv.mem_fixedSubmodule_transvection_iff only in the odd alternating branch, where the functional vanishes on δ; for the even reflection compute c(x,δ)δ=0 directly, with ε nontrivial).
4. δ = 0: I acts trivially in every degree, sp is an isomorphism in degree n, and (4.3.3) becomes 0 → ℚ_ℓ(m − n) → H^{n+1}(X_s) → H^{n+1}(X_η̄) → 0, which is the stalk at s̄ of the stated sequence of sheaves.
5. (δ, δ) = (−1)^m·2 ≠ 0 for n even, so δ ≠ 0 there.

**Acceptance.**

- δ = 0 is realised by a genus-g curve acquiring a separating node (n = 1): R² f_*ℚ_ℓ has stalk ℚ_ℓ(−1)² at s and ℚ_ℓ(−1) at η̄.

**Depends on.** this roadmap, same part: `LPV.2/lefschetz-degeneration-specialization-sequence`, `LPV.2/local-picard-lefschetz-formula`, `LPV.0/fibre-product-topos-Y-times-S`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; libraries: `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`.

**Sources.**

- `deligne-weil-i`, §4, (4.4) a), p. 289: “Ces résultats apportent les informations suivantes” — Case δ ≠ 0: constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- `deligne-weil-i`, §4, (4.4) b), p. 289: “C'est là un cas exceptionnel” — Case δ = 0, only for n odd, with the skyscraper sequence in degree n + 1 (read on the page image).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 4.4 checked. Corrected misuse of the transvection fixed-space lemma in the reflection branch. The direct-image claim still needs the proper regular ordinary family and actual direct-image sheaves in its suggested form.

### Ordinary quadratic forms

`LPV.2/ordinary-quadratic-form` · definition · planet “Ordinary quadratic form” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary`

Let S = Spec A, V a locally free A-module of rank r and Q a quadratic form on V, with polar form Φ(x, y) = Q(x + y) − Q(x) − Q(y). Q is nowhere zero if the values Q(v) generate the unit ideal; then Q = 0 defines a subscheme of P(V*) (EGA convention), flat and purely of relative dimension r − 2 over S, the quadric of Q. Q is ordinary if it is nowhere zero and its quadric is smooth over S; this can be checked after base change to fields. Over a field: (a) if r is even or the characteristic is not 2, Q is ordinary if and only if Φ is nondegenerate; (b) if r is odd and the characteristic is 2, Q is ordinary if and only if the kernel N of the alternating form Φ has dimension one and Q does not vanish on N. For V ≠ 0 over a field, ordinary is Mathlib's QuadraticMap.Nondegenerate (radical zero and polar kernel of rank at most one), which follows Elman–Karpenko–Merkurjev.

**Hypotheses.**

- The case r = 0 is excluded: the zero form on the zero module is not nowhere zero.
- Condition (b) is for characteristic 2; the source prints card(A) = 2 (source issue E1).

**Construction.**

1. Smoothness of the quadric is the Jacobian criterion: the quadric is singular at [v] exactly when Q(v) = 0 and Φ(v, ·) = 0, that is, when v is a nonzero vector of the radical.
2. Hence over a field, ordinary means that no nonzero v has Q(v) = 0 and Φ(v, ·) = 0. If 2 ≠ 0 then Q(v) = Φ(v, v)/2, so this is nondegeneracy of Φ.
3. In characteristic 2, Φ is alternating, so dim ker Φ ≡ r mod 2. For r even the condition forces ker Φ = 0; for r odd it forces dim ker Φ = 1 with Q nonzero on it. This is the Mathlib condition (radical ⊥, rank ker Φ ≤ 1).
4. Construct quadratic scalar extension coefficientwise in a local basis and prove basis independence and descent. The pinned quadratic tensor base-change API requires 2 invertible; characteristic two uses this coefficient construction rather than polarization.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary` (data): IsOrdinary Q : Prop — Q nowhere zero with smooth quadric.
- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary.baseChange` (compatibility): Ordinary is stable under base change and can be checked on the fibres at points of S.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_polar_nondegenerate` (characterisation): Over a field with r even or 2 ≠ 0: IsOrdinary Q ↔ (polarBilin Q).Nondegenerate.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_of_char_two` (characterisation): Over a field of characteristic 2 with r odd: IsOrdinary Q ↔ finrank (ker Φ) = 1 ∧ Q ≠ 0 on ker Φ.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate` (equivalence): Over a field with V ≠ 0: IsOrdinary Q ↔ QuadraticMap.Nondegenerate Q.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two` (value): Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth).
- `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two` (non-example): Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one` (degenerate): r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test` (comparison): Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r.

**Acceptance.**

- xy + z² in characteristic 2 is ordinary; x² + y² in characteristic 2 is not; ax² is ordinary.

**Used by.**

- `LPV.2/smooth-quadric`: a smooth quadric is locally the quadric of an ordinary form
- `LPV.2/normal-form-of-ordinary-quadratic-forms`: the étale-local normal form
- `LPV.2/ordinary-quadratic-point`: the leading term of an ordinary quadratic point
- `LPV.3/lefschetz-pencil`: condition (C) of a Lefschetz pencil, through ordinary quadratic points

**Depends on.** other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`; libraries: `mathlib:QuadraticMap.Nondegenerate`, `mathlib:QuadraticMap.polarBilin`.

**Sources.**

- `SGA7II-1973`, Exposé XII, 1.1, p. 2: “La forme Q est dite ordinaire si elle n'est nulle en aucun point de S et que la quadrique qu'elle définit est lisse sur S.” — The definition. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, 1.1 a), p. 2: “a) pour n pair ou car(A) ≠ 2 : Q ordinaire ⟺ Q non dégénéré ;” — The criterion for even rank or characteristic not 2 (XII writes n for the rank). Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, 1.1 b), p. 2: “le noyau N de la forme bilinéaire (alternée) associée Φ est de dimension un, et que Q n'est pas nul sur N.” — The criterion in characteristic 2 and odd rank. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 1.1 and Mathlib quadratic nondegeneracy conventions checked, including characteristic-two odd rank. The scheme/fibrewise definition and arbitrary characteristic-two base change are not represented by the field-only prototype restricted to invertible 2.

### Étale-local normal form of an ordinary quadratic form

`LPV.2/normal-form-of-ordinary-quadratic-forms` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.normalFormOfOrdinaryQuadraticForms`

Let Q be an ordinary quadratic form on a locally free A-module V of rank r = 2m (resp. r = 2m + 1). Étale locally on Spec A, V has a basis e₁, …, e_r with Q(Σ xᵢeᵢ) = Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1} with λ invertible).

**Hypotheses.**

- The source prints the upper summation limit m − 1 (source issue E2).

**Proof.**

1. Induction on m; m = 0 is clear (r = 1 gives Q = λx², λ a unit because Q is nowhere zero).
2. For m > 0 the quadric is smooth with nonempty geometric fibres, so it has sections étale locally: an e ∈ V nowhere zero with Q(e) = 0.
3. e is nowhere in the kernel of Φ (the quadric is smooth at [e]), so locally there is f′ with Φ(e, f′) = 1; put f = −Q(f′)e + f′, so that Q(e) = Q(f) = 0 and Φ(e, f) = 1.
4. V = V₁ ⊕ V₂ with V₁ = Ae + Af hyperbolic and V₂ = V₁^⊥, on which Q is ordinary of rank r − 2; apply the induction hypothesis to V₂.

**Acceptance.**

- r = 2: Q = x₁x₂; r = 3: Q = x₁x₂ + λx₃², which over a separably closed field of characteristic not 2 is equivalent to x² + y² + z².

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XII, Proposition 1.2, p. 2: “Si Q est ordinaire et si n = 2m (resp. n = 2m +1), alors, localement pour la topologie étale sur S, V admet une base e telle que” — The statement; the formulas are on p. 3. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, proof of 1.2, p. 3: “Prouvons 1.2 par récurrence sur m.” — The inductive proof by splitting off a hyperbolic plane. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 1.2 checked with E2 correction. The field normal forms are legitimate after separable closure; the general scheme/base-change contract and precise basis/isometry data remain to be represented.

### The discriminant double cover of an even-dimensional quadric

`LPV.2/discriminant-double-cover-of-an-even-quadric` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre`

Let Q be nondegenerate on V locally free of rank 2m > 0 over A. The centre Z(Q) of the even Clifford algebra C⁺(Q) is a finite étale A-algebra of rank 2, and C⁺(Q) is an Azumaya algebra over Z(Q) (XII 1.5); C⁺(Q) depends only on the quadric Q = 0 in P(V*) (XII 1.3). A totally isotropic direct summand W of rank m defines an idempotent e(W) ∈ Z(Q) (XII 1.6–1.7), and over a field e(W₁) = e(W₂) if and only if dim(W₁/W₁ ∩ W₂) is even (XII 1.12). For a smooth quadric X/S of dimension n = 2m > 0 this gives an étale double cover Z(X) → S (Z(X) = X for n = 0), and the generatrices (linear subspaces of dimension m of P(X) inside X) form a smooth projective S-scheme Gén(X) whose Stein factorisation is e : Gén(X) → Z(X) (XII 2.7–2.8).

**Hypotheses.**

- Even rank; for rank 2 in characteristic not 2, Z(Q) is the discriminant algebra.

**Construction.**

1. Étale locally Q is split (normal form); for a split decomposition V = W₁ ⊕ W₂ into totally isotropic summands, C(Q) ≅ End(ΛW₁) as ℤ/2-graded algebras, and C⁺(Q) ≅ End(ΛW₁)⁺ × End(ΛW₁)⁻ has centre A × A (XII 1.4).
2. Descent gives Z(Q) étale of rank 2 and C⁺(Q) Azumaya over it (XII 1.5).
3. The idempotent e(W₁, W₂) depends only on W₁ by a connectedness argument on the affine space of complements (XII 1.6), giving e(W).
4. 1.12 reduces by the addition formula (1.10.1) to dim V = 2, where it is the computation e(Ae) = fe, e(Af) = ef.
5. For a smooth quadric, C⁺ of the ambient form descends to C⁺(X) (XII 2.6); its centre is Z(X). Gén(X) is covered by affine spaces of generatrices disjoint from a given one, hence smooth, and its geometric fibres over Z(X) are connected by reduction to P¹ × P¹ (XII 2.8).

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre` (constructor): Z(Q), the centre of CliffordAlgebra.even Q.
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_isEtale` (characterisation): Z(Q) is finite étale of rank 2 over A, and C⁺(Q) is Azumaya over Z(Q).
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent` (constructor): e(W) ∈ Z(Q) for W totally isotropic of rank m.
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_eq_iff` (characterisation): Over a field, e(W₁) = e(W₂) ↔ Even (finrank (W₁ ⧸ W₁ ⊓ W₂)).
- `TauCeti.AlgebraicGeometry.Quadric.discriminantCover` (constructor): Z(X) → S for a smooth quadric of even dimension, with e : Gén(X) → Z(X) the Stein factorisation.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic` (value): V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof).
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant` (value): Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square.
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib` (comparison): C⁺(Q) is Mathlib's CliffordAlgebra.even Q.
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum` (characterisation): For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents.

**Acceptance.**

- n = 2: X ≅ P¹ × P¹, Gén(X) is two copies of P¹ (the two rulings) and Z(X) is two points.
- n = 0: Z(X) = X, a double cover.

**Used by.**

- `LPV.2/cohomology-of-smooth-quadrics`: the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m)
- `LPV.2/even-relative-dimension-variation-3-2`: the quadratic character ε_x of the even case is the monodromy on Z(X)
- `LPV.2/local-picard-lefschetz-formula`: the character ε of case (B)

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`, `LPV.2/normal-form-of-ordinary-quadratic-forms`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`; libraries: `mathlib:CliffordAlgebra.even`.

**Sources.**

- `SGA7II-1973`, Exposé XII, Proposition 1.5, p. 5: “le centre Z(Q) de C⁺(Q) est une algèbre étale localement libre de rang 2 sur A et C⁺(Q) est une algèbre d'Azumaya sur Z(Q).” — The centre of the even Clifford algebra. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Proposition 1.12, p. 8: “Alors, e(W₁) = e(W₂) si et seulement si dim(W₁/W₁ ∩ W₂) est pair.” — The parity criterion for the two families. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Proposition 2.8, p. 13: “Sous les hypothèses de 2.7, p : Gén(X) → S est projectif et lisse, et (2.7.1) est sa factorisation de Stein.” — The generatrices and their Stein factorisation through Z(X). Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 1.3–1.7 supports Clifford-centre discriminant and parity of Lagrangian intersections. The named isEtale prototype proves only vector-space dimension two; tests omit the actual discriminant square class and complementary ruling data.

### Smooth quadrics over a base

`LPV.2/smooth-quadric` · definition · planet “Smooth quadric” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric`

Over an algebraically closed field k, a smooth quadric of dimension n is a k-scheme isomorphic to the subscheme Q = 0 of P(V*), dim V = n + 2, for Q an ordinary quadratic form. Over a scheme S, a smooth quadric of dimension n is a proper smooth S-scheme whose geometric fibres are smooth quadrics. For n = 0 it is an étale double cover of S, for n = 1 a Severi–Brauer scheme of relative dimension 1, and for n = 2 its geometric fibres are P¹ × P¹. Étale locally on S it is the quadric of an ordinary form in a projective space; for n>0 its ambient Severi–Brauer scheme P(X) depends only on X/S; Ω^n_{X/S} ≅ O(−n) has ample inverse.

**Hypotheses.**

- For n>0 the ambient Severi–Brauer scheme P(X) is canonical (XII 2.6). The n=0 case is the étale double-cover statement, with no canonical ambient asserted by that proposition.

**Construction.**

1. Over k algebraically closed, Remark 2.2 identifies n = 0, 1, 2 and Lemma 2.3 computes Ω^n ≅ O(−n), Pic and the vanishing of H^i(O) and H^1(O(1)).
2. Over S, Pic_{X/S} is étale locally constant (H¹(O) = H²(O) = 0), so étale locally for n>0 there is the positive hyperplane bundle L with L^{⊗(−n)} matching Ω^n; p_*L is locally free of rank n + 2 and X ⊂ P(p_*L) is the quadric of an ordinary form, unique up to a unit (XII 2.5).
3. For n>0, P(p_*L) does not depend on the local positive hyperplane bundle L (XII 2.6), and descends to P(X). For n=0 use the étale double-cover description separately.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric` (data): IsSmoothQuadric (f : X ⟶ S) (n : ℕ) : Prop — proper, smooth, geometric fibres smooth quadrics of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_of_isOrdinary` (constructor): The quadric of an ordinary form of rank n + 2 is a smooth quadric of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.ambientProjective` (constructor): For a smooth quadric X/S of relative dimension n>0, the canonical ambient Severi–Brauer S-scheme P(X) with X a relative divisor of degree 2.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_zero_iff` (characterisation): A smooth quadric of dimension 0 is the same as an étale double cover.
- `TauCeti.AlgebraicGeometry.Quadric.canonical_iso` (characterisation): Ω^n_{X/S} ≅ O_X(−n).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero` (degenerate): n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k.
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two` (value): n = 2: xy = zw in P³ is P¹ × P¹ (Segre).
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic` (value): n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve.
- `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone` (non-example): The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary.

**Acceptance.**

- The three low-dimensional cases of Remark 2.2 and the real conic.

**Used by.**

- `LPV.2/cohomology-of-smooth-quadrics`: the cohomology of smooth quadrics
- `LPV.2/cohomology-of-affine-quadrics`: affine quadrics X − (X ∩ H)
- `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`: the projectivised tangent cone at an ordinary quadratic point

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XII, 2.1, p. 9: “Une quadrique lisse de dimension n sur k est un schéma X sur k isomorphe au sous-schéma de P(V*) défini par l'équation Q=0, pour Q une forme quadratique ordinaire sur k.” — Smooth quadrics over an algebraically closed field. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Définition 2.4, p. 10: “Une quadrique lisse de dimension n sur un schéma S est un S-schéma f : X → S, propre et lisse sur S, dont les fibres géométriques sont des quadriques lisses.” — The relative definition. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, 2.4, p. 10: “Pour n = 0, une quadrique lisse de dimension 0 sur S n'est autre qu'un revêtement étale double de S.” — The case n = 0. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 2.1–2.6 checked. Corrected n>0 canonical ambient and the negative canonical-bundle power. ambientProjective is merely a form-parameterized scheme, while canonical_iso compares arbitrary sheaves; geometric Segre/real-conic tests are missing.

### The ℓ-adic cohomology of a smooth quadric

`LPV.2/cohomology-of-smooth-quadrics` · theorem · planet “Cohomology of quadrics” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfSmoothQuadrics` (omitted signature)

Let p : X → S be a smooth quadric of dimension n and ℓ a prime invertible on S, with hyperplane class η ∈ H⁰(S, R²p_*ℤ_ℓ(1)). (i) R^{2i+1}p_*ℤ_ℓ = 0. (ii) For 0 ≤ 2i < n (resp. n < 2i ≤ 2n), R^{2i}p_*ℤ_ℓ(i) is canonically the constant sheaf ℤ_ℓ, generated by η^i (resp. η^i/2). (iii) For n = 2m, the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m) of the generatrices is an isomorphism, and for disjoint sections α, β of Z(X): (a) η^m = cℓ(α) + cℓ(β); (b) for m even, Tr(cℓ(α)²) = Tr(cℓ(β)²) = 1 and cℓ(α)cℓ(β) = 0, and for m odd, cℓ(α)² = cℓ(β)² = 0 and Tr(cℓ(α)cℓ(β)) = 1; (c) η·(cℓ(α) − cℓ(β)) = 0. Consequently, over 𝔽_q, #X(𝔽_q) = Σ_{i=0}^{n} q^i for n odd and Σ_{i=0}^{n} q^i + εq^m for n = 2m, with ε = 1 if X has a rational generatrix and ε = −1 otherwise.

**Hypotheses.**

- The source writes η ∈ H⁰(S, R¹p_*ℤ_ℓ(1)) in 3.1 (source issue E3); η lives in degree 2.

**Proof.**

1. (i) and (ii) are the cohomology of smooth complete intersections (SGA 7 XI 1.6, 2.6): weak Lefschetz and Poincaré duality, with η^i/2 in the upper half because a hyperplane section of a quadric has degree 2.
2. (iii) is étale local, so reduce to S = Spec k, k algebraically closed, and X : Σ_{i=0}^{m} x_i x_{i+m+1} = 0 in P^{2m+1}.
3. (a): η^m is the class of the linear section x_i = 0 (0 ≤ i < m), which is the union of the generatrices D₁ : x_i = 0 (0 ≤ i ≤ m) and D₂ : x_i = 0 (0 ≤ i < m), x_{2m+1} = 0; dim D₁/(D₁ ∩ D₂) = 1 is odd, so e(D₁) ≠ e(D₂) by XII 1.12.
4. (b): disjoint generatrices have product 0 and generatrices meeting transversally in a point have Tr = 1; XII 1.12 decides, according to the parity of m, whether such pairs lie in the same family.
5. (c): by (ii) it suffices that Tr(η^m(cℓ(α) − cℓ(β))) = Tr(cℓ(α)² − cℓ(β)²) = 0.
6. cℓ is an isomorphism because the Gram matrices [[1, 0], [0, 1]] and [[0, 1], [1, 0]] have determinant ±1 and R^n p_*ℤ_ℓ(m) has rank 2.
7. The point count is the Lefschetz trace formula with these eigenvalues; Frobenius swaps α and β exactly when X has no rational generatrix.

**Acceptance.**

- n = 2, X = P¹ × P¹: the two rulings have square 0 and product 1 (m = 1 odd); #X(𝔽_q) = (1 + q)² when split and 1 + q² for the nonsplit form (Weil restriction of P¹ from 𝔽_{q²}).
- n = 0: two points, Tr(cℓ(α)²) = 1 (m = 0 even), #X(𝔽_q) = 1 + ε ∈ {0, 2}.

**Depends on.** this roadmap, same part: `LPV.2/smooth-quadric`, `LPV.2/discriminant-double-cover-of-an-even-quadric`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `SGA7II-1973`, Exposé XII, Théorème 3.3, p. 14: “Soit p : X → S une quadrique lisse de dimension n sur S et ℓ un nombre premier inversible sur S” — The theorem; (ii)–(iii) are on p. 15. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Théorème 3.3 (iii)(b), p. 15: “pour m impair : cℓ(α)² = cℓ(β)² = 0 , Tr(cℓ(α).cℓ(β)) = 1.” — The intersection form on the two generatrix classes, m odd. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Vérification 3.4, p. 17: “Compte tenu de 3.3, la formule des traces de Lefschetz donne la formule classique” — The point count over 𝔽_q. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 3.1–3.5 checked against corrected powers, degree-two class and reference E3–E6. Odd-degree vanishing for an arbitrary nearby object does not provide the cohomology module/ruling/Frobenius table.

### Cohomology of affine quadrics and the vanishing class δ

`LPV.2/cohomology-of-affine-quadrics` · theorem · planet “Vanishing cycle of the affine quadric” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAffineQuadrics` (omitted signature)

Let X be the smooth quadric over S of an ordinary form Q on V of rank n + 2, H a hyperplane of P(V*) meeting X transversally, Y = X ∩ H (a smooth quadric of dimension n − 1), X° = X − Y and f : X° → S. For n = 2m the primitive part of R^n p_*ℤ_ℓ(m) is the orthogonal of η^m, generated by cℓ(α) − cℓ(β), and the primitive quotient is R^n p_*ℤ_ℓ(m)/ℤ_ℓη^m. The cohomology of X° is torsion-free, with nonzero Betti numbers b₀ = b_n = 1, and with compact support b_{2n} = b_n = 1 (b₀ = 2 for n = 0). For n = 2m > 0, R^n f_!ℤ_ℓ(m) is the primitive part and R^n f_*ℤ_ℓ(m) the primitive quotient of R^{2m}p_*ℤ_ℓ(m); for n = 2m + 1, R^n f_!ℤ_ℓ(m) is the primitive quotient and R^n f_*ℤ_ℓ(m + 1) the primitive part of R^{2m}q_*ℤ_ℓ(m). Locally these have natural generators defined up to sign, δ with compact support and δ′ without. The forget-supports map φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ is 0 for n odd and sends ±δ to ±2δ′ for n even > 0; Tr(δδ′) = ±1, and Tr(δ²) = 0 for n = 2m + 1 and (−1)^m·2 for n = 2m.

**Hypotheses.**

- n > 0 for the exact sequences; n = 0 gives Y = ∅ and X° = X.

**Proof.**

1. The localisation sequence … → R^i f_!ℤ_ℓ → R^i p_*ℤ_ℓ → R^i q_*ℤ_ℓ → … and its dual Gysin sequence … → R^{i−2}q_*ℤ_ℓ(−1) → R^i p_*ℤ_ℓ → R^i f_*ℤ_ℓ → … (XII 3.6.2–3.6.3).
2. By Theorem 3.3 the restriction r_i is an isomorphism for i ≠ n, 2n (n even) and i ≠ n − 1 (n odd). For n = 2m, r_n(cℓ(α)) = ½η^m, so r_n is onto with kernel the primitive part; for n = 2m + 1, r_{2m}(η^m) = η^m, so r_{2m} is injective with cokernel the primitive quotient.
3. Hence R^i f_!ℤ_ℓ = 0 for i ≠ n, 2n and is a twisted constant sheaf of rank 1 in degrees n and 2n; dually R^i f_*ℤ_ℓ = 0 for i ≠ 0, n, f_*ℤ_ℓ = ℤ_ℓ and R^n f_*ℤ_ℓ has rank 1.
4. n = 2m: δ maps to ±(cℓ(α) − cℓ(β)), so Tr(δ²) = cℓ(α)² − 2cℓ(α)cℓ(β) + cℓ(β)², which is 1 + 1 − 0 = 2 for m even and 0 + 0 − 2 = −2 for m odd (Theorem 3.3 (iii)(b)); ±φ(δ) is twice ±δ′.
5. n = 2m + 1: δ = ∂cℓ(α) and δ² = ∂(cℓ(α)·∂cℓ(α)) = 0, so φ(δ) = 0; δ′ maps to ±(cℓ(α) − cℓ(β)) in R^{2m}q_*ℤ_ℓ(m) and Tr(δδ′) = ±1.

**Acceptance.**

- n = 1: X° = P¹ minus two points ≅ 𝔾_m, H¹_c and H¹ of rank 1, φ = 0, Tr(δ²) = 0.
- n = 2: Tr(δ²) = −2, the self-intersection of the vanishing sphere of a surface node; over ℂ, Σ z_i² = 1 is diffeomorphic to the tangent bundle of a sphere (XII 3.8).

**Depends on.** this roadmap, same part: `LPV.2/cohomology-of-smooth-quadrics`, `LPV.2/smooth-quadric`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`.

**Sources.**

- `SGA7II-1973`, Exposé XII, 3.5, p. 17: “on appellera partie primitive de Rⁿf_*ℤ_ℓ(m) l'orthogonal de ηᵐ” — The primitive part and quotient. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, 3.6, p. 18: “Pour n pair, l'homomorphisme de restriction r_i est un isomorphisme pour i ≠ n,2n ; pour n impair, c'est un isomorphisme pour i ≠ n-1.” — The restriction maps in the localisation sequence. Transcribed from the page image.
- `SGA7II-1973`, Exposé XII, Table 3.7, p. 20: “Ces groupes ont, localement, des générateurs naturels définis au signe près, notés δ pour les groupes de cohomologie à support propre et δ' pour les autres.” — The generators δ, δ′; the table's values of Tr(δδ′) and Tr(δ²) were read on the page image. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XII 3.6–3.7 trace and primitive generator signs checked. The arbitrary nearby object prototype does not identify the affine quadric or supply its compact supports, generator and trace.

### Ordinary and non-degenerate quadratic points

`LPV.2/ordinary-quadratic-point` · definition · planet “Ordinary quadratic singularity” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint`

Let y be a closed point of a scheme Y of finite type over a field k of characteristic p, and n = dim_y Y. For k algebraically closed, y is an ordinary quadratic point of Y if Ô_{Y,y} ≅ k[[x₁, …, x_{n+1}]]/(f) with f = Q(x) + (terms of order > 2) and Q an ordinary quadratic form in n + 1 variables. For general k, y is an ordinary quadratic point if the points of Y ⊗_k k̄ over y are. Replacing ordinary by nondegenerate gives a non-degenerate quadratic point; y is non-degenerate if and only if it is ordinary and p ≠ 2 or n is odd. An ordinary quadratic point with p = 2 and n even is called degenerate.

**Hypotheses.**

- The quadratic part Q is well defined up to linear change of variables because f has no linear term.

**Construction.**

1. The quadratic part of f is determined up to linear change of coordinates and multiplication by a unit, and ordinary is invariant under both.
2. The criterion for non-degeneracy is XII 1.1 applied to the form in n + 1 variables: ordinary and nondegenerate agree unless p = 2 and n + 1 is odd.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint` (data): IsOrdinaryQuadraticPoint (Y : Scheme) (y : Y) : Prop, for Y locally of finite type over a field.
- `TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint` (data): The same with the leading form nondegenerate.
- `TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff` (characterisation): IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n).
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_baseChange` (compatibility): The notion is geometric: it holds at y if and only if it holds at the points over y after any field extension.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone` (example): The vertex of the affine cone of an ordinary form in n + 1 variables is an ordinary quadratic point (XV 1.2.3–1.2.4).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary` (value): The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two` (value): n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate.
- `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary` (non-example): The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point.
- `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic` (degenerate): A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1.

**Acceptance.**

- The node, the double point in both characteristics, the cusp and a smooth point.

**Used by.**

- `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`: the hypothesis of SGA 7 XV 3.1.1
- `LPV.2/lefschetz-degeneration-specialization-sequence`: the singular point of a Lefschetz degeneration
- `LPV.3/lefschetz-pencil`: condition (C) of a Lefschetz pencil
- `LPV.2/canonical-form-of-an-ordinary-quadratic-point`: the canonical forms 1.2.3–1.2.4

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Définition 1.2.1, p. 4: “on dit que y est un point quadratique ordinaire de Y si le complété Ô_{Y,y} de l'anneau local de Y en y est isomorphe au quotient de k[[x₁,...,x_{n+1}]] par l'idéal engendré par une seule série formelle f” — The definition over an algebraically closed field. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 1.2.2, pp. 4–5: “Pour que y soit un point quadratique non dégénéré de Y, il faut et il suffit qu'il soit un point quadratique ordinaire et que soit p ≠ 2, soit n est impair.” — Non-degenerate quadratic points. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Exemple 1.2.4, p. 5: “y₀ est un point quadratique ordinaire du sous-schéma Y₀ de E^{n+1}_k d'équation Q = 0.” — The degenerate model (x₀² − a) + Σ a_ij x_i x_j in characteristic 2. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.1 ordinary/nondegenerate distinction checked. Ring-equivalence definition needs the actual completed local k-algebra, and baseChange currently equates ordinarity for unrelated k,A,k′,A′.

### The Tjurina module of an ordinary quadratic point

`LPV.2/tjurina-module-of-an-ordinary-quadratic-point` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.tjurinaModuleOfAnOrdinaryQuadraticPoint` (omitted signature)

Let y be an ordinary quadratic point of Y/k with k(y) purely inseparable over k, and T¹_{Y/k} = O_Y/J the quotient by the Jacobian ideal (XV 1.1.1). Near y, T¹_{Y/k} is monogenic and concentrated at y, of rank 1 over k if y is non-degenerate (so k(y) = k), and of rank 2 if y is degenerate (p = 2, n = 2m), in which case k(y) = k or k(y) ≅ k(√a) with a ∈ k − k².

**Hypotheses.**

- k(y) purely inseparable over k; the general case reduces to it through the largest separable subextension of k(y).

**Proof.**

1. Both assertions can be checked over k̄ after completion at y.
2. Non-degenerate: with f = Q + (order > 2), the ∂f/∂x_i generate the maximal ideal by Nakayama, so k[[x]]/(f, ∂f/∂x_i) = k.
3. Degenerate: in suitable coordinates f = x₀² + Σ_{i=1}^{m} x_i x_{i+m} + R with R of order ≥ 3. The ideal (f, ∂f/∂x_i) equals (x₀², x_i (i ≠ 0)) by Nakayama, because ∂f/∂x_i ≡ x_{i+m} and ∂f/∂x_{i+m} ≡ x_i modulo q·n + (x₀²); so the quotient is k[x₀]/(x₀²), of dimension 2.
4. A radicial subscheme of rank 2 of affine space lies on a unique line (XV 1.2.9–1.2.10), which gives k(y) = k or k(√a).

**Acceptance.**

- n = 0, Y = Spec k[x]/(x²): T¹ = k[x]/(x², 2x) has dimension 1 for p ≠ 2 and 2 for p = 2.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-point`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Lemme 1.2.7, p. 6: “est monogène, concentré en y et de rang 1 sur k . En particulier k(y) = k .” — The non-degenerate case (the source writes J^n_{Y/k} here). Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Lemme 1.2.8, p. 7: “est monogène, concentré en y et de rang 2 sur k .” — The degenerate case p = 2, n even. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV Tjurina computation is for the quadratic Jacobian ideal. The prototype’s arbitrary ideal J cannot have the asserted one/two-dimensional quotient without that relationship.

### Henselian quadratic coordinate approximation

`LPV.2/tougeron-artin-implicit-function-theorem` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.tougeronArtinImplicitFunctionTheorem` (omitted signature)

In the ordinary quadratic local equation, a formal coordinate change tangent to the identity can be approximated to a prescribed finite order by a henselian coordinate change, under the finite-presentation/Jacobian-ideal hypotheses of Artin’s lemma cited in XV 1.1.2. This is the application of general henselian approximation to the quadratic germ, not a second general approximation theorem.

**Hypotheses.**

- Excellent henselian local base in the approximation application; finite-presentation hypersurface
- The Jacobian-square divisibility condition of XV 1.1.2; the exact general statement is requested from SchemeAndStackFoundations, Part II

**Proof.**

1. Present the coordinate-change equations as a finite-type scheme of solutions.
2. Apply the supplier’s Artin approximation/Jacobian-square lifting statement; keep the prescribed finite jet.
3. Check that the linear part remains invertible and the quadratic leading term is preserved.

**Acceptance.**

- p = 1, X : g(x) = 0 in 𝔸¹_S with g′(s) a unit (δ′ = (g′)): a root modulo I lifts to a root in A, which is Hensel's lemma.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:key/excellent-schemes`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Théorème 1.1.2 (Tougeron-Artin), p. 2: “Soient S le spectre d'un anneau local hensélien A , f : X → S un morphisme comme en 1.1.1., a et I deux idéaux de A distincts de A” — The statement, continued on p. 3. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.1.2 supports the Artin application. Added excellence key. General approximation is properly requested as Part II; its Jacobian-square/formal-versus-henselian conditions must constrain the suggested coordinate-change objects.

### Henselian versal deformation of a quadratic germ

`LPV.2/elkik-versal-henselian-deformations` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.elkikVersalHenselianDeformations`

For an isolated ordinary quadratic germ over a field, the versal henselian deformation has the one-parameter nondegenerate model Q−b, or the two-parameter characteristic-two even-dimensional model x₀²+bx₀+c+Q′. A chosen special-fibre identification extends after the coefficient lifts are prescribed. Versality and comparison with the formal deformation are imported from the general Elkik approximation/deformation supplier.

**Hypotheses.**

- Isolated ordinary quadratic germ; finite presentation over a henselian noetherian local base
- Nondegenerate polar form in the first branch; characteristic two with even fibre dimension in the second

**Proof.**

1. Use the Tjurina rank calculation to identify one or two deformation parameters.
2. Apply the supplier’s henselian/formal versality comparison and algebraization.
3. Verify the explicit parameter families by the Jacobian calculation in XV 1.3.1–3.

**Acceptance.**

- The ordinary quadratic point has a one-parameter versal deformation Q − b = 0 (non-degenerate case) and a two-parameter one in the degenerate case, matching the ranks 1 and 2 of T¹ in the Tjurina-module lemma.

**Depends on.** this roadmap, same part: `LPV.2/tjurina-module-of-an-ordinary-quadratic-point`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Théorème 1.1.4 (R. Elkik), p. 4: “Il existe une S-déformation hensélienne verselle de X₀ (et une seule à isomorphisme non unique près).” — The existence and uniqueness statement. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 1.1.4, p. 4: “Pour la démonstration de ce théorème délicat, on renvoie à R. Elkik (séminaire de l'ENS, 1971/72).” — The proof is not in SGA 7. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.3 and Elkik route support one/two parameter models. General henselian/formal versality is requested, but arbitrary supplied rings cannot have the claimed universal deformation isomorphism.

### Canonical form of an ordinary quadratic point up to henselisation

`LPV.2/canonical-form-of-an-ordinary-quadratic-point` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.canonicalFormOfAnOrdinaryQuadraticPoint`

Let y be an ordinary quadratic point of a k-scheme Y and k′ the largest separable subextension of k(y). There are a k′-scheme Y₀ ⊂ 𝔸^{n+1}_{k′}, either the cone Q = 0 of a nondegenerate form with y₀ the origin (1.2.3), or, for p = 2 and n = 2m, the scheme (x₀² − a) + Σ_{0<i≤j≤2m} a_ij x_i x_j = 0 with the 2m-variable form nondegenerate and y₀ = (√a, 0, …, 0) (1.2.4), and a k-isomorphism between the henselisations Y_(y) and Y₀(y₀). The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular point, by an affine change of variables (XV 1.2.12).

**Hypotheses.**

- When a ∉ k², k(y₀) = k(√a) is purely inseparable of degree 2 over k.

**Proof.**

1. Pass to an étale neighbourhood of y that is a k′-scheme, reducing to k(y) purely inseparable over k.
2. dim (Ω¹_{Y/k})_y = n + 1 (check over k̄ after completion), so near y, Y is cut out by one equation f in a smooth k-scheme Z of dimension n + 1.
3. Non-degenerate case: then k(y) = k (Tjurina-module lemma); choose étale coordinates x_i at y with f = Q(x) + (order > 2), so Q(x_i) ∈ m³ on Y. The ideal generated by the ∂Q/∂X_i pulls back to m, and the implicit function theorem (a = m, δ′ = J) gives x′_i ≡ x_i mod m² on Y_(y) with Q(x′_i) = 0, which is the isomorphism.
4. Degenerate case: k(y) = k(√a); the radicial rank-2 subscheme defined by J lies on a line (XV 1.2.9–1.2.10), giving coordinates in which f = (x₀² − a) + Σ a_ij x_i x_j + R; one checks Q(x_i) ≡ 0 mod δ²q on Y (XV 1.2.11.1) and concludes by the implicit function theorem.

**Acceptance.**

- The node xy = 0 is the cone of x₁x₂; y² = x² + x³ at the origin (p ≠ 2) is étale locally the node.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-point`, `LPV.2/tjurina-module-of-an-ordinary-quadratic-point`, `LPV.2/tougeron-artin-implicit-function-theorem`, `LPV.2/ordinary-quadratic-form`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Théorème 1.2.6, p. 5: “Il existe alors un k'-schéma Y₀ ⊂ E^{n+1}_{k'} du type 1.2.3. ou 1.2.4., et un k-isomorphisme φ entre l'hensélisé Y_(y) de Y en y et l'hensélisé Y₀(y₀) de Y₀ en y₀ .” — The canonical form. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, proof of 1.2.6, p. 7: “D'après le théorème des fonctions implicites 1.1.2.” — The non-degenerate case through the implicit function theorem. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.2 canonical-form statement checked with E8–E9. The actual local germ and prescribed quadratic part must be tied to the ring-isomorphism prototype; arbitrary rings do not satisfy it.

### Local equation of a flat family at an ordinary quadratic point

`LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.localEquationOfAFamilyAtAnOrdinaryQuadraticPoint` (omitted signature)

Let S = Spec A be henselian local with closed point s, f : X → S flat of finite presentation, and x a closed point of X_s at which X_s has an ordinary quadratic singularity, with k(x) purely inseparable over k(s) and X_s of dimension n. (i) If x is non-degenerate, there are a nondegenerate quadratic form Q in n + 1 variables over A and b in the maximal ideal such that the henselisation of X at x is isomorphic to the henselisation at the origin of Q − b = 0 in 𝔸^{n+1}_S. (ii) If x is degenerate (n = 2m, char k(s) = 2), there is Q(x) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j over A with b in the maximal ideal and the 2m-variable form nondegenerate, such that the henselisation of X at x is isomorphic to that of Q = 0 at (√c, 0, …, 0). The isomorphism can be chosen to extend a given one on the special fibre, lifting its coefficients (XV 1.3.3).

**Hypotheses.**

- The source prints x₀ for x₀² in the formula of (ii) (source issue E7).

**Proof.**

1. By the canonical-form theorem, the special fibre at x is the model 1.2.3 or 1.2.4.
2. By XV 1.3.1, the versal henselian deformation of that model over S is Σ a_ij x_i x_j − b = 0 over A{b} (non-degenerate) or (x₀² − a) + Σ a_ij x_i x_j + bx₀ + c = 0 over A{b, c} (degenerate), a consequence of Elkik's theorem and explicit computations (SGA 7 VI 6).
3. X/S is pulled back from the versal deformation along a local morphism S → T, which specialises b (and c) to elements of A.

**Acceptance.**

- A family of curves acquiring a node: xy = b with b ∈ m_A; for a regular total space b is a uniformiser, which is the b(x) of XV 3.3.1.

**Depends on.** this roadmap, same part: `LPV.2/canonical-form-of-an-ordinary-quadratic-point`, `LPV.2/elkik-versal-henselian-deformations`, `LPV.2/ordinary-quadratic-point`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Corollaire 1.3.2 (i), p. 11: “le S-schéma hensélisé de X en x soit isomorphe à l'hensélisé en l'origine du sous-schéma de E^{n+1}_S d'équation (1.3.1(i)) Q − b = 0 .” — The non-degenerate case. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Remarque 1.3.3, p. 12: “on peut prendre Q = x₀² + bx₀ + c + Σ a_ij x_i x_j , avec c ≡ ā mod l'idéal maximal.” — The degenerate case with the square present, and the choice extending a given special-fibre isomorphism. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.3.2–3 checked with missing x₀² correction. Coefficient lifts, complete local family and residue characteristic must be present in the model identification.

### Non-smooth points near an ordinary quadratic point are ordinary quadratic

`LPV.2/non-smooth-points-near-an-ordinary-quadratic-point` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nonSmoothPointsNearAnOrdinaryQuadraticPoint` (omitted signature)

In the situation of the local-equation theorem, there is a neighbourhood U of x in X such that every point of U at which f is not smooth is an ordinary quadratic point of its fibre.

**Hypotheses.**

- f flat of finite presentation; x an ordinary quadratic point of X_s with k(x) purely inseparable over k(s).

**Proof.**

1. Work on the local model Q − b = 0 (resp. x₀² + bx₀ + c + Σ a_ij x_i x_j = 0).
2. Non-degenerate case: f fails to be smooth exactly where all ∂Q/∂x_i vanish and Q = b, that is, at the origin over V(b); the fibre there is the cone Q = 0, an ordinary quadratic point.
3. Degenerate case: the singular locus is the section x_i = 0 (i ≥ 1), x₀ with x₀² + bx₀ + c = 0 and b = 0 there; each such point is of type 1.2.4 in its fibre.

**Acceptance.**

- In a Lefschetz pencil the singular points of the fibres near x_s are x_s itself, as condition (B) requires.

**Depends on.** this roadmap, same part: `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LPV.2/ordinary-quadratic-point`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Corollaire 1.3.4, p. 12: “Il existe un voisinage U de x dans X tel que les points de non lissité de f contenus dans U soient des points quadratiques ordinaires de leur fibre.” — The statement. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 1.3 Jacobian gives the critical-point classification. A supplied coefficient tuple alone does not assert that the tested critical locus is the family’s nonsmooth locus.

### Homotopy invariance of étale cohomology

`LPV.2/homotopy-invariance-of-etale-cohomology` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.homotopyInvarianceOfEtaleCohomology` (omitted signature)

Let k be algebraically closed, Λ a torsion ring prime to char k, U and V k-schemes, K ∈ D⁺(U, Λ) and L ∈ D⁺(V, Λ). A morphism (U, K) → (V, L) is a pair (f : U → V, φ : f*L → K); it induces f* : H*(V, L) → H*(U, K). Two morphisms f₀, f₁ are homotopic if there are a connected k-scheme T of finite type, points 0, 1 ∈ T(k) and a morphism (U × T, pr₁*K) → (V, L) whose fibres at 0 and 1 are f₀ and f₁. Homotopic morphisms induce the same map on cohomology.

**Hypotheses.**

- k algebraically closed; T connected of finite type.

**Proof.**

1. Join 0 and 1 by a chain of points x₀ = 0, …, x_n = 1 and smooth connected curves Γ_i → T with x_i, x_{i+1} in the image of Γ_i (normalise one-dimensional subschemes through consecutive points). This reduces to T a smooth connected curve.
2. Smooth base change for t : T → Spec k gives t*Rf_*K ≅ Rpr_{2*}(pr₁*K), so R^n pr_{2*}(pr₁*K) is the constant sheaf t*H^n(U, K).
3. f_i* factors as H^n(V, L) → H^n(U × T, pr₁*K) → H⁰(T, t*H^n(U, K)) → H^n(U, K), the last map being the fibre at i; for a constant sheaf on a connected T this does not depend on i.

**Acceptance.**

- The homotheties (x, t) ↦ tx, t ∈ 𝔸¹, make the identity of an affine cone homotopic to the constant map to its vertex.

**Depends on.** other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Lemme 2.1.3, p. 14: “Si f₀ est homotope à f₁ , alors f₀* coïncide avec f₁* .” — The homotopy lemma and its proof by smooth base change. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.1.1 homotopy requires maps joined by a family over a connected parameter scheme. The prototype equates cohomology maps of arbitrary f₀,f₁.

### Cohomology of a cone and of its henselisation at the vertex

`LPV.2/cohomology-of-a-cone` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfACone` (omitted signature)

Let Y ⊂ P^r be projective over an algebraically closed field k, X ⊂ 𝔸^{r+1} its affine cone with vertex 0, X_(0) the henselisation at 0, X* = X − {0}, X*_(0) = X_(0) − {0}, X₁ ⊂ P^{r+1} the projective cone (X = X₁ − Y), and F a torsion group prime to char k. Then (i) H^i(X, F) ≅ H^i({0}, F), which is F for i = 0 and 0 for i > 0; (ii) H^i_{0}(X, F) ≅ H^i_c(X, F); and H^i(X*, F) ≅ H^i(X*_(0), F) (Corollary 2.1.4).

**Hypotheses.**

- F torsion prime to the characteristic; all cohomology with coefficients in F.

**Proof.**

1. (i): the identity of X is homotopic, through the homotheties, to the constant map with value 0 (homotopy lemma).
2. (ii): homotheties of ratio tending to infinity make Y a deformation retract of X₁ − {0}; the five lemma on the long exact sequences of H_{0}(X) → H(X₁) → H(X₁ − {0}) and H_c(X) → H(X₁) → H(Y) gives (ii).
3. Corollary 2.1.4: the five lemma on the sequences for supports in {0} in X and in X_(0), with (i) and H^i(X_(0)) = H^i({0}) (X_(0) is henselian local).

**Acceptance.**

- Y = P⁰ (X = 𝔸¹): H^i(𝔸¹) = F for i = 0 and 0 otherwise, and H^i_{0}(𝔸¹) = H^i_c(𝔸¹) = F(−1) for i = 2.

**Depends on.** this roadmap, same part: `LPV.2/homotopy-invariance-of-etale-cohomology`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Proposition 2.1.2, p. 13: “Cette proposition se démontre par un argument d'homotopie, qu'il nous va falloir formaliser.” — The proposition (displays (i) and (ii) read on the page image) and its proof. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Corollaire 2.1.4, p. 15: “On applique le lemme des 5 au diagramme” — The comparison of the punctured cone with its henselisation. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.1.3 cone contraction supports constant-coefficient cohomology. The arbitrary complex cone need not have cohomology concentrated in degree zero.

### The Gysin sequence of a punctured cone and its local analogue

`LPV.2/cohomology-of-a-punctured-cone` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAPuncturedCone`

In the notation of the cone theorem, let X̃, X̃_(0), X̃₁ be the blow-ups of X, X_(0), X₁ at 0, Y₀ the exceptional divisor, h : X̃₁ → Y the projection, and y₀, y_∞ : Y → X̃₁ the sections with images Y₀ and Y. Restriction gives isomorphisms H^i(X̃₁ − Y₀) ≅ H^i(Y) and H^i(X̃) ≅ H^i(Y₀) = H^i(Y), through which the long exact sequences of the pairs (X̃₁ − Y₀, Y) and (X̃₁ − Y, Y₀) become the rows of a commutative diagram (2.1.5.1): … → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …, the middle arrows being cup product with the class η of a hyperplane section in one row and −η in the other (Lemma 2.1.6). Locally, H^i(X̃_(0)) ≅ H^i(Y₀) by proper base change, and the sequence of (X̃_(0), Y₀) maps to the second row of (2.1.5.1) (diagram (2.1.7.1)).

**Hypotheses.**

- Coefficients F torsion prime to char k.

**Proof.**

1. The Leray spectral sequences of h on X̃₁ − Y₀ and X̃₁ − Y (line bundles over Y) give the restriction isomorphisms.
2. η (resp. −η) is the restriction to Y (resp. Y₀ ≅ Y) of the class of O(Y) (resp. O(Y₀)) on X̃₁ − Y₀ (resp. X̃₁ − Y).
3. Commutativity: both rows come from applying H(Y, ·) to the distinguished triangles y_∞*Ry_∞^!F → R(h|X̃₁ − Y₀)_*F → R(h|X*)_*F → and y₀*Ry₀^!F → R(h|X̃₁ − Y)_*F → R(h|X*)_*F →, whose cohomology sheaves are in degrees 0, 1 and 2 only; this reduces to Y a point, which is checked directly.
4. Local analogue: X̃_(0) → X_(0) is proper, so proper base change gives H^i(X̃_(0)) ≅ H^i(Y₀), and the punctured-cone corollary identifies H^i(X*_(0)) with H^i(X*).

**Acceptance.**

- Y = P^{r−1} (X = 𝔸^r, X* = 𝔸^r − {0}): the sequence recovers H^i(𝔸^r − {0}) = F for i = 0, 2r − 1 and 0 otherwise, because cup with η is an isomorphism H^{i−2}(P^{r−1})(−1) → H^i(P^{r−1}) for 2 ≤ i ≤ 2r − 2.

**Depends on.** this roadmap, same part: `LPV.2/cohomology-of-a-cone`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Lemme 2.1.6, p. 16: “Les flèches notées η et −η de 2.1.5.1 sont les cup-produits avec la classe de cohomologie d'une section hyperplane.” — The Gysin maps in (2.1.5.1). Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 2.1.7, p. 16: “est un analogue local de la 2ᵉ ligne de (2.1.5.1).” — The local sequence of (X̃_(0), Y₀). Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.1.4–8 supports the punctured-cone triangle. The suggested arbitrary boundary/hyperplane objects do not represent the open/closed immersion and localization maps.

### An anticommutative boundary diagram for a cone

`LPV.2/boundary-anticommutativity-for-a-cone` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.boundaryAnticommutativityForACone` (omitted signature)

In the notation of the punctured-cone theorem, the composite H^{n−1}(Y₀) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X) is the negative of the boundary map ∂ : H^{n−1}(Y) → H^n_c(X) of the pair (X₁, Y), under Y₀ ≅ Y.

**Hypotheses.**

- The source numbers this lemma 2.7.8; it is Lemma 2.1.8, as its application in 2.2.7 says (source issue E9).

**Proof.**

1. By the local analogue (2.1.7.1) it is equivalent to prove that H^{n−1}(X₁ − {0}) → H^n_{0}(X₁) = H^n_{0}(X) → H^n_c(X) agrees with the restriction to Y followed by ∂ : H^{n−1}(Y) → H^n_c(X).
2. This is a compatibility of boundary maps for the closed subsets {0} and Y of X₁ with complement X ∩ (X₁ − {0}) = X*, a general property of the long exact sequences of supports; the sign comes from the orientation reversal of the identification Y₀ ≅ Y (−η versus η).

**Acceptance.**

- It is the step that turns the local generator of XV 2.2.7 into the global class δ of the affine quadric (XII 3.6–3.7).

**Depends on.** this roadmap, same part: `LPV.2/cohomology-of-a-punctured-cone`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Lemme 2.7.8 (= 2.1.8), p. 17: “C'est là un general non-sense.” — The anticommutative diagram (displayed on the page) and the proof by reduction through 2.1.7. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.1.8 sign checked. Two unrelated morphisms a,b do not satisfy a=−b; the square, orientation and connecting morphisms must be specified.

### Standard quadratic degenerations

`LPV.2/standard-quadratic-degeneration` · definition · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration`

Let S be a henselian trait with s, η, s̄, η̄ as in SGA 7 XIII 0.2.5, and Λ = ℤ/k with k invertible on S. A standard quadratic degeneration of relative dimension n is the closed subscheme X ⊂ 𝔸^{n+1}_S defined by Q(x) = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, nonzero modulo the uniformiser, such that, with X₁ ⊂ P^{n+1}_S the quadric Σ a_ij x_i x_j + Σ b_i x_i z + cz² = 0 and Y = X₁ ∩ H (H the hyperplane at infinity, X = X₁ − Y): (a) Y is a smooth quadric over S, that is, Σ a_ij x_i x_j is ordinary; (b) X_s̄ is a quadratic cone. Its vertex x₀ is the singular point of X_s. The subscheme A of X_s cut out by the ∂Q/∂x_i is concentrated at x₀; it has degree one, so x₀ is rational, except when char k(s) = 2 and n is even, where A has rank 2 and k(x₀) is k(s) or a purely inseparable quadratic extension of k(s). If x₀ = 0, the b_i and c lie in the maximal ideal.

**Hypotheses.**

- The source says 'n + 1 est pair' for the exceptional case; it is n + 1 odd, that is, n even (source issue E12).
- Condition (*) of XV 2.2.5, that the generic fibre is smooth, is a further hypothesis, not part of the definition.

**Construction.**

1. The projective closure is a flat family of quadrics; (a) says its hyperplane section at infinity is smooth.
2. On X_s the ∂Q/∂x_i define the singular locus of the cone, concentrated at the vertex; its degree over k(s) is computed after passing to k(s̄), as in the Tjurina-module lemma.
3. If x₀ is rational, translate it to the origin; since x₀ ∈ X_s is singular, Q and its first derivatives vanish there modulo the maximal ideal, so the b_i and c lie in it.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration` (structure): The data (S, Λ, Q) with the ordinarity of the leading form (a) and the cone condition (b).
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.vertex` (projection): The singular point x₀ of X_s, rational unless char k(s) = 2 and n is even.
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.projectiveClosure` (constructor): X₁ ⊂ P^{n+1}_S with X = X₁ − Y and Y = X₁ ∩ H a smooth quadric over S.
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter` (constructor): For n even, the character ε : I → {±1} of the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation` (constructor): The local model Q − b = 0 of a family at a non-degenerate ordinary quadratic point (XV 1.3.2) is a standard degeneration.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node` (value): n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point` (degenerate): n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two` (non-example): char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family` (non-example): Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4).

**Acceptance.**

- The node xy = π and the double point x² = π are standard; x² + y² − π in characteristic 2 is not.

**Used by.**

- `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`: the nearby cycles computed on the standard model
- `LPV.2/variation-in-a-standard-quadratic-degeneration`: the variation and the character ε
- `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`: XV 3.1.2 is reduced to the standard model through 1.3.2

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`, `LPV.2/discriminant-double-cover-of-an-even-quadric`, `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`.

**Sources.**

- `SGA7II-1973`, Exposé XV, 2.2.1, p. 17: “Soient S un trait hensélien et s, η, s̄, η̄ comme en XIII 0.2.5 , Λ = ℤ/k , avec k premier à la caractéristique résiduelle de S” — The setting; the equation and its projective closure (2.2.1.1) are on p. 18. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 2.2.1 (a)–(b), p. 18: “la forme quadratique Σ_{i≤j} a_ij x_i x_j est ordinaire;” — Hypothesis (a); hypothesis (b) says X_s̄ is a quadratic cone. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.2.1–2 checked with parity E12. StandardQuadraticDegeneration stores unrelated Q/linear/total/f fields without the equations or fibre conditions; node/trivial tests merely inspect rank or constants.

### Nearby cycles of a standard quadratic degeneration

`LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesOfAStandardQuadraticDegeneration` (omitted signature)

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. (Proposition 2.2.3) H^i(X_η̄, Λ) ≅ H^i(X_s̄, RΨ_η̄Λ) ≅ R^iΨ_η̄(Λ)_{x₀} and H^i_c(X_η̄, Λ) ≅ H^i_c(X_s̄, RΨ_η̄Λ) ≅ H^i_{x₀}(X_s̄, RΨ_η̄Λ). (Corollary 2.2.4) If X_η̄ is singular, a quadratic cone again, all R^iΦ(Λ) vanish. (2.2.5) If X_η is smooth and S is strictly henselian: (A) R^iΨ_η̄(Λ) = 0 for i ≠ 0, n; for n ≠ 0, Ψ_η̄(Λ) = Λ and R^nΨ_η̄(Λ) is (non-canonically) Λ at x₀ extended by 0; for all n, R^iΦ(Λ) = 0 for i ≠ n and R^nΦ(Λ) is Λ at x₀ extended by 0. (B) H^i_{x₀}(X_s, RΨ_η̄Λ) = 0 for i ≠ n, 2n; the trace H^{2n}_{x₀}(X_s, RΨ_η̄Λ(n)) → Λ is an isomorphism for n ≠ 0, and for n>0, H^n_{x₀}(X_s, RΨ_η̄Λ(n)) ≅ Λ. For n=0, R⁰Ψ_η̄(Λ)_{x₀} and H⁰_{x₀}(X_s,RΨ_η̄Λ) are both Λ²; R⁰Φ is the rank-one cokernel of the diagonal specialization Λ→Λ². (C) (a, b) = Tr(a ∧ b) puts the free Λ-modules R^nΨ_η̄(Λ)_{x₀} and H^n_{x₀}(X_s, RΨ_η̄Λ(n)) in perfect duality.

**Hypotheses.**

- (*) X_η smooth for (A)–(C); S strictly henselian for simplicity.

**Proof.**

1. The left isomorphisms of 2.2.3 are XIII 2.1.8.6 and 2.1.10.5 (proper base change for X₁ and supports).
2. The right ones follow from the cone theorem: in the triangle (Λ on X_s̄)[0] → RΨ_η̄(Λ) → RΦ(Λ) →, the cone theorem applies to Λ on X_s̄ and RΦ(Λ) is supported at x₀.
3. Corollary 2.2.4: if X_η̄ is a cone, H⁰(X_s̄, Λ) = Λ = H⁰(X_η̄, Λ) and all higher groups vanish on both sides, so the long exact sequence XIII 2.1.8.9 gives RΦ = 0.
4. (A)–(B): X_η̄ = X₁,η̄ − Y_η̄ is an affine quadric, so XII 3.7 computes H^i(X_η̄) and H^i_c(X_η̄); pass from ℓ-adic to Λ = ℤ/k coefficients by the universal coefficient formula (XIII 2.1.13).
5. (C): Poincaré duality on X_η̄ and the isomorphisms 2.2.3.

**Acceptance.**

- n = 1, xy = π: R¹Φ(Λ) is Λ at the origin, and H¹_c(X_η̄) ≅ Λ with X_η̄ ≅ 𝔾_m.
- n=0, x²=π with residue characteristic ≠2: R⁰Ψ and degree-zero nearby costalk have rank 2, while R⁰Φ=coker(Λ→Λ²) for the diagonal specialization has rank 1. The trace-zero kernel of Λ²→Λ belongs to the dual support description, not the definition of R⁰Φ.

**Depends on.** this roadmap, same part: `LPV.2/standard-quadratic-degeneration`, `LPV.2/cohomology-of-a-cone`, `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.0/derived-functorialities-and-specialization-sequence`, `LPV.2/cohomology-of-affine-quadrics`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`.

**Sources.**

- `SGA7II-1973`, Exposé XV, Proposition 2.2.3, p. 18: “Sous les hypothèses de 2.2.1, les morphismes” — The isomorphisms (displayed on p. 19) and their proof. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Corollaire 2.2.4, p. 19: “est encore un cône quadratique” — If the geometric generic fibre is singular, the vanishing cycles are 0. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 2.2.5 C, p. 20: “met en dualité parfaite les Λ-modules libres” — The duality (a, b) = Tr(a ∧ b). Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.2.3–5/XII 3.7 checked. Corrected n=0 nearby/costalk rank two and R⁰Φ as diagonal cokernel. The arbitrary-complex prototype states only a vanishing range and misses these identifications.

### The variation in a standard quadratic degeneration

`LPV.2/variation-in-a-standard-quadratic-degeneration` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.variationInAStandardQuadraticDegeneration` (omitted signature)

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (D) n = 2m > 0: H^n_{x₀}(X_s, RΨ_η̄Λ(m)) and R^nΨ_η̄(Λ(m))_{x₀} have natural generators δ, δ′ defined up to sign (from XII 3.7), which can be normalised so that (δ′, δ) = 1; then φ(δ) = (−1)^m·2·δ′ for the natural map φ from the first to the second. With Z the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1) and ε : I → {±1} its character, σδ = ε(σ)δ and σδ′ = ε(σ)δ′, and Var(σ)(a) = ((ε(σ) − 1)/2)(−1)^m (a, δ)δ. (E) n = 2m + 1: H^n_{x₀}(X_s, RΨ_η̄Λ(m)) and R^nΨ_η̄(Λ(m + 1))_{x₀} have natural generators δ, δ′ with (δ′, δ) = 1, and φ(δ) = 0. (F) n = 2m + 1: I acts trivially on the cohomology of X_η̄; Var(σ)(δ′) = λ(σ)δ for a homomorphism λ : I → Λ(1), so λ = λ_X·ε with ε : I → Λ(1) = μ_k the Kummer character σ(t^{1/k}) = ε(σ)t^{1/k} of a uniformiser t and λ_X ∈ Λ depending on X/S; that is, Var(σ)(a) = λ_X ε(σ)(a, δ)δ.

**Hypotheses.**

- (D) is derived in ℤ/2k-coefficients, where (ε(σ) − 1)/2 makes sense, and then reduced.
- λ_X is determined in XV §3; for the local model with b a uniformiser it is (−1)^{m+1} (the carried odd-dimensional node).
- The source writes D(σ) for Var(σ) in (2.2.5.9) (source issue E10).

**Proof.**

1. (D): XII 3.7 gives δ, δ′ on X_η̄ = affine quadric, and φ(δ) = ±2δ′; the normalisation (δ′, δ) = 1 and Tr(δ²) = (−1)^m·2 give φ(δ) = (−1)^m·2δ′.
2. I acts on the two generatrix families of the quadric X₁,η̄ through Z, hence on δ = cℓ(α) − cℓ(β) and on δ′ by ε.
3. Var(σ) maps the rank-one vanishing group to the rank-one group generated by δ, so Var(σ)(a) = c(σ)(a, δ)δ. The identity σ = 1 + q∘Var(σ) (XIII 1.4.3.3), with q(δ) = φ(δ) = (−1)^m·2δ′ and (δ′, δ) = 1, gives ε(σ)δ′ = (1 + 2c(σ)(−1)^m)δ′; computing in ℤ/2k-coefficients, c(σ) = ((ε(σ) − 1)/2)(−1)^m.
4. (E): as in (D) with XII 3.7 for n odd; φ(δ) = 0 because δ² = 0.
5. (F): I acts trivially on H*(X_η̄) by XII 3.7 and because Y is proper and smooth over S. Var(σ)(δ′) is a multiple λ(σ)δ, λ is additive by XIII 1.4.3.4, and every homomorphism from the tame inertia to Λ(1) is a multiple of the Kummer character.

**Acceptance.**

- n = 0, x² = π, p ≠ 2: ε is the character of k(η)(√π), and Var(σ)(a) = −(a, δ)δ when ε(σ) = −1, the swap of the two points.
- n = 1, xy = π: Var(σ)(a) = λ_X t_ℓ(σ)(a, δ)δ with λ_X = −1 (Weil I (4.1): x − (x, δ)δ for n ≡ 1 mod 4).

**Depends on.** this roadmap, same part: `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/discriminant-double-cover-of-an-even-quadric`, `LPV.0/variation-morphism`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `SGA7II-1973`, Exposé XV, 2.2.5 D, (2.2.5.3)–(2.2.5.6), p. 21: “Soit Z l'extension quadratique séparable de k(η) centre de la partie paire de l'algèbre de Clifford de la forme quadratique (2.2.1.1).” — The character ε and the variation formula (2.2.5.6), read on the page image. Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, 2.2.5 F, p. 21: “Le groupe d'inertie I agit trivialement sur la cohomologie de” — The odd case: trivial action on the cohomology of X_η̄ and (2.2.5.9)–(2.2.5.10) on pp. 21–22. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.2.5.6–9 checked with Var versus D(σ) E10. Geometric Var, character and pairing must constrain the suggested arbitrary endomorphism family.

### Local description of the vanishing cycle

`LPV.2/local-description-of-the-vanishing-cycle` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.localDescriptionOfTheVanishingCycle` (omitted signature)

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (n even) ±δ is determined by (2.2.5.3)–(2.2.5.4), which for k a power of an odd prime amounts to (δ, δ) = (−1)^m·2; in general the unordered pair ±δ is obtained from the distinguished geometric classes of XII 3.7 by coefficient reduction with one common geometric sign. Choosing norm-normalized generators independently at each prime factor, even after a ℤ/2^a k lift, does not characterize this pair. (n = 2m + 1 odd, so x₀ is rational) Let X_{s(0)} be the henselisation of X_s at x₀, X̃_{s(0)} its blow-up at x₀, Y₀ the exceptional divisor (a smooth quadric of dimension 2m) and X*_{s(0)} = X_{s(0)} − {x₀}. The composite (2.2.6.2) H^{n−1}(Y₀, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x₀}(X_s, Λ(m)) → H^n_{x₀}(X_s, RΨ_η̄Λ(m)) identifies the last group with the primitive quotient of H^{2m}(Y₀, Λ(m)), and ±δ is the image of the natural generators of that primitive quotient.

**Hypotheses.**

- The source asserts the characterisation by (δ, δ) = (−1)^m·2 whenever 2 ∤ k; for k with two distinct odd prime factors it fails (source issue E11).

**Proof.**

1. n even: if δ₁ is another generator with (δ₁, δ₁) = (δ, δ), then δ₁ = uδ with u² = 1 in ℤ/k; u = ±1 exactly when ℤ/k has no other square roots of 1, that is, when k is a power of one odd prime. In general reduce the distinguished geometric classes of XII 3.7 with a single common sign. Mere norm equality, primary-factor reductions or a larger modulus cannot synchronize independent primary signs.
2. n odd: ±δ is determined by its image in H^n_c(X_η̄, Λ(m)); by (2.1.7.1) it suffices that H^{n−1}(Y₀) ≅ H^{n−1}(X̃_s) → H^{n−1}(X*_s) → H^n_{x₀}(X_s) → H^n_c(X_s) → H^n_c(X_η̄) (the last map sp) sends the distinguished generators of the primitive quotient to those of the target.
3. By the anticommutativity lemma, this composite is, up to sign, the boundary ∂ : H^{n−1}(Y_s) → H^n_c(X_s) followed by specialisation, that is, the boundary H^{n−1}(Y_η̄) → H^n_c(X_η̄) of XII 3.6, which maps the generators of the primitive quotient to ±δ (XII 3.7).

**Acceptance.**

- n = 1, xy = π: Y₀ is the two tangent directions at the node, H⁰(Y₀) = Λ², its primitive quotient is Λ, and δ generates H¹_c(X_η̄) = H¹_c(𝔾_m).
- k = 15, m even: u = 4 satisfies u² ≡ 1, so 4δ also has (4δ, 4δ) = 2, and the characterisation by (δ, δ) alone does not single out ±δ.
- The ambiguity persists after a 2-primary lift: 19²=1 in ℤ/60 and 19 reduces to 4 in ℤ/15; this is not the reduction of either globally signed geometric generator.

**Depends on.** this roadmap, same part: `LPV.2/variation-in-a-standard-quadratic-degeneration`, `LPV.2/cohomology-of-a-punctured-cone`, `LPV.2/boundary-anticommutativity-for-a-cone`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/cohomology-of-smooth-quadrics`.

**Sources.**

- `SGA7II-1973`, Exposé XV, 2.2.6, p. 22: “Nous allons donner des cycles δ et δ' de (D) et (E) une description de nature locale pour la topologie étale.” — The local description, including (2.2.6.1). Transcribed from the page image.
- `SGA7II-1973`, Exposé XV, Lemme 2.2.7, pp. 22–23: “au quotient primitif de la cohomologie de dimension 2m de la quadrique Y₀ de dimension 2m” — The identification through (2.2.6.2), proved on p. 23 by applying 2.1.8. Transcribed from the page image.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XV 2.2.6 and XII 3.7 checked. Replaced the insufficient larger-modulus/primewise norm normalization by globally signed geometric classes; added the modulo-60 acceptance check. Arbitrary B,δ cannot satisfy its Lean norm assertion.

### Complex comparison and the Picard–Lefschetz sign table

`LPV.2/complex-picard-lefschetz-comparison` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.complexPicardLefschetzComparison`

For an algebraic ordinary quadratic degeneration over C, compare the finite-coefficient étale specialization triangle, inertia and the primitive-quadric vanishing generator with the classical Milnor-fibre triangle and positively oriented small loop. Cup products, trace and Tate orientation are part of the comparison. For n modulo 4 equal to 0,1,2,3, the Picard–Lefschetz coefficient is respectively −,−,+,+ and the vanishing self-pairing is 2,0,−2,0. The complex comparison is a verification of conventions, not the algebraic proof in positive characteristic.

**Hypotheses.**

- Algebraic finite-type complex family with a single ordinary quadratic critical point; properness for the global sequence
- Finite coefficients, then adic realization; compatible loop and Tate orientations

**Proof.**

1. Import the PR196 ComplexComparison relative comparison, cup-product and trace compatibility, and Riemann-existence path identification.
2. Use the ordinary local normal form to identify the algebraic primitive quadric generator with the Milnor vanishing sphere up to sign.
3. Compare the specialization exact sequences and their monodromy operators.
4. Check the four coefficient/self-pairing entries from Weil I 4.1; changing δ to −δ leaves the operator unchanged.

**Acceptance.**

- The n=0 model z²=t exchanges the two points and δ=(1,−1) has square 2.
- The n=1 nodal Milnor fibre gives a transvection with coefficient − and δ²=0.

**Depends on.** this roadmap, same part: `LPV.2/local-picard-lefschetz-formula`, `LPV.2/local-description-of-the-vanishing-cycle`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- `deligne-weil-i`, §4.1, pp. 287–288: “Picard-Lefschetz” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: The source explicitly uses transcendental comparison in XV 3.3; PR196 supplies Artin/Riemann-existence orientation compatibility, not the topological Picard–Lefschetz theorem itself. A sign identity alone is not this comparison.

### Wild quadratic-character branch

`LPV.2/quadratic-character-in-characteristic-two` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.wildQuadraticPicardLefschetz` (omitted signature)

In even fibre dimension and residue characteristic two, the ordinary quadratic vanishing stalk is still rank one, but the inertia character is the separable quadratic character of the even Clifford center of the generic quadratic model. It can be wildly ramified, so it is not replaced by the unique tame quadratic character used when p≠2. The rational local monodromy formula is x↦x+(-1)^m((ε_x(σ)−1)/2)(x,δ)δ, with δ²=(-1)^m·2; the finite even-coefficient formula is defined by lifting before dividing by two.

**Hypotheses.**

- Ordinary quadratic point; even relative dimension; smooth generic fibre
- Rational ℓ-adic coefficients with ℓ≠2, or the finite-level lift convention
- The character may be trivial; a nontrivial reflection is asserted only where ε_x(σ)=−1

**Proof.**

1. Apply the general even variation theorem and identify the Clifford-center separable extension.
2. In characteristic two retain the linear x₀ term of the local model; its discriminant extension is not tame Kummer of a uniformizer.
3. Use the rational pairing normalization to obtain the reflection, keeping the finite-level lifting convention for the division by two.

**Acceptance.**

- For a characteristic-two zero-dimensional separable quadratic family the two generic points are exchanged by the wild quadratic character.
- Tame-generation conclusions of LPV.5 are not applied to this wild branch without their additional hypotheses.

**Depends on.** this roadmap, same part: `LPV.2/even-relative-dimension-variation-3-2`, `LPV.2/discriminant-double-cover-of-an-even-quadric`, `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `deligne-weil-ii`, 4.2.1–3, pp. 220–221: “caractéristique 2” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.2.1 and XV 3.2 support the character-two quadratic-character case. A wild geometric action/vanishing cycle is required; the arbitrary representation signature omits them.

### Isolated nonordinary quadratic concentration

`LPV.2/isolated-nonordinary-quadratic-concentration` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nonordinaryQuadraticConcentration` (omitted signature)

For the isolated quadratic hypersurface singularities in residue characteristic two covered by Illusie’s 2003 Corollary 2.10, including the nonordinary singularities used by Fresán–Sabbah–Yu §5.1.3, R^iΦ ℚ_ℓ is zero outside the middle degree n. This gives injective specialization H^n(X_s̄)→H^n(X_η̄) in the proper setting. No rank-one, reflection, or ordinary-quadric generator assertion is made for these nonordinary stalks.

**Hypotheses.**

- Isolated quadratic hypersurface singularity in the precise 2003 corollary’s class; ℓ≠2
- The original corollary’s complete hypotheses remain source gap G-nonordinary; FSY supplies the verified application
- Properness for the stated global injection

**Proof.**

1. Use FSY’s explicit characteristic-two isolated quadratic local equation to identify the application.
2. Import the middle-concentration result from Illusie 2003 Corollary 2.10, retaining its unresolved original-source hypothesis check.
3. Apply the proper specialization triangle; vanishing below n makes the middle specialization injective.

**Acceptance.**

- The characteristic-two FSY boundary singularity is routed here, rather than to the ordinary rank-one theorem.
- The exact sequence retains the actual middle vanishing-stalk dimension as a parameter.

**Depends on.** this roadmap, same part: `LPV.0/derived-functorialities-and-specialization-sequence`, `LPV.2/ordinary-quadratic-point`.

**Sources.**

- `fsy-2022`, §5.1.3, pp. 43–44; citation [30, Corollary 2.10] in the downloaded arXiv text: “quadratic non-ordinary isolated singularity” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Corrected downloaded FSY reference to [30, Cor. 2.10] and literal singularity excerpt. Source application verified; original general 2003 hypotheses remain G-nonordinary. The arbitrary Phi prototype does not enforce the model.

### Fresán–Sabbah–Yu quadratic discriminant example

`LPV.2/fsy-discriminant-example` · application · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.fsyDiscriminantExample` (omitted signature)

In the odd-prime ordinary quadratic models of FSY §5.1.3 with k=2m+1, the orthogonal vanishing line has square (-1)^m·2, Tate twist −m, and the quadratic Galois character of the explicitly computed Hessian determinant. The paper identifies its field by adjoining a square root of (-1)^((1+ap)/2)·2ap. This is a worked check of the even-dimensional Picard–Lefschetz discriminant interface; the motives’ weight and Hodge conclusions remain with their owners.

**Hypotheses.**

- The FSY §5.1.3 ordinary points and odd prime p; the paper’s a,p indexing
- Even fibre dimension k−1=2m

**Proof.**

1. Compute the ordinary tangent quadratic form in the paper’s local coordinates.
2. Apply the Clifford/discriminant character theorem and the self-pairing normalization.
3. Compare with the determinant and quadratic field displayed by FSY, retaining its Tate twist.

**Acceptance.**

- The displayed square-class, twist −m and self-pairing are all checked together.
- The characteristic-two example is governed by the separate nonordinary-concentration node.

**Depends on.** this roadmap, same part: `LPV.2/even-relative-dimension-variation-3-2`, `LPV.2/cohomology-of-affine-quadrics`, `LPV.2/discriminant-double-cover-of-an-even-quadric`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `fsy-2022`, §5.1.3, pp. 41–44, including determinant calculation on p. 44: “discriminant” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: FSY 5.1.3 determinant is on p. 44; extended locator. The prototype repeats a generic norm equation and does not specify the example’s determinant, coefficient ring or inertia character.

## LPV.3 — Existence of sufficiently ample Lefschetz pencils

LPV.3 constructs Lefschetz pencils as actual schemes. A pencil of hyperplane sections of a smooth connected projective X of dimension n + 1 is Lefschetz when its axis is transverse, it has finitely many singular fibres and each has one ordinary quadratic point (`lefschetz-pencil`, planet "Lefschetz pencil"). The dual variety is the closed image of the conormal variety, irreducible when nonempty and empty for X a projective space (`dual-variety`). After a Veronese re-embedding of degree r ≥ 2, a sufficiently general pencil is Lefschetz in every characteristic (`existence-of-lefschetz-pencils`, planet "Existence of Lefschetz pencils"); in the original embedding there may be none, as the Hermitian curve shows. The proof rests on the ordinary-axis open and the jet estimates of SGA 7 XVII, with the degree-two two-point defect (`ordinary-axis-open-and-jet-separation`), and on the identification of the incidence total space with the blowup along the axis (`incidence-pencil-blowup`). Over 𝔽_q a good axis exists over some finite extension 𝔽_(q^r), not necessarily over 𝔽_q, and Frobenius becomes Frob_q^r (`finite-field-pencil-descent`, planet "Finite-field pencil descent"). The inseparable Gauss map in characteristic two, linear and dual-defective varieties, and curves with an empty axis are treated separately.

The review asks that the suggested `IsLefschetzPencil` carry the ordinary-singularity, smooth-total-space and transverse-axis conditions, and that the line, quadric, cubic and Hermitian tests be instantiated on their models. The Rees-algebra blowup is requested from SchemeAndStackFoundations SF.4.

**Coverage.** `partial`. Remaining:
- Complete the imported projective/jet and finite-presentation geometry contracts; independently verify the degree-two exceptional jet estimate and characteristic-two parity.
- G-review-definition-api-tests and G-review-supplier-order: add ordinary singularity/total-space/axis conditions to IsLefschetzPencil; instantiate the line, quadric, cubic and Hermitian test models; provide the requested SF.4 Rees/blowup and SF.0 closed-point contracts.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Lefschetz pencil of hyperplane sections

`LPV.3/lefschetz-pencil` · definition · planet “Lefschetz pencil” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil`

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s.

**Hypotheses.**

- Transversality of A means A ∩ X is smooth of codimension 2 in X, or empty.
- Ordinary quadratic singular points are those of the LPV.2 node ordinary-quadratic-point (SGA 7 XV 1.2.1).

**Construction.**

1. Define X̃ as the closed subscheme of X × D cut out by the incidence x ∈ H_t, a bilinear equation in the coordinates of P and D.
2. Under (A), identify X̃ with the blow-up of X along A ∩ X: A ∩ X is cut out by the two linear forms defining D, and X̃ is their graph closure (EDC.4's blow-up along a smooth centre of codimension 2).
3. Condition (B) makes S finite with f smooth elsewhere; condition (C) is LPV.2's local condition at x_s.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil` (data): IsLefschetzPencil X A : Prop, conditions (A)–(C) for the axis A.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace` (constructor): X̃ ⊂ X × D with π and f, and f^{-1}(t) = X ∩ H_t.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace_iso_blowup` (characterisation): Under (A), π : X̃ ≅ Bl_{A∩X} X and X̃ is smooth over k.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet` (constructor): The finite set S ⊂ D with its points x_s, and f smooth on X̃ − {x_s}.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.localModel` (compatibility): X̃ ×_D D_s → D_s is proper, X̃ ×_D D_s is regular of dimension n + 1, and it is smooth except at the ordinary quadratic point x_s.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane` (degenerate): X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface` (value): X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface` (value): X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz` (non-example): p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

**Acceptance.**

- A line in P² (no singular fibre), the quadric surface (two nodal fibres, δ = 0), the cubic surface (twelve nodal fibres), and the Hermitian curve, where condition (C) fails in the original embedding.

**Used by.**

- `LPV.3/existence-of-lefschetz-pencils`: the existence theorem after a Veronese re-embedding
- `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`: the cohomology sheaves R^i f_*ℚ_ℓ of the pencil
- `LPV.4/vanishing-subspace`: the vanishing cycles δ_s, s ∈ S
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`: the pencil over 𝔽_q in Deligne's proof
- `WeightsInEtaleCohomology:R34.4`: geometric reduction to a pencil

**Cited by other roadmaps' packets.** `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-point`, `LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `deligne-weil-i`, §5, (5.1), p. 289: “forment le pinceau d'axe A” — The pencil of hyperplanes containing the axis A and the diagram X ← X̃ → D (5.1.1).
- `deligne-weil-i`, §5, (5.6), p. 291: “forment un pinceau de Lefschetz de sections hyperplanes si les conditions suivantes sont vérifiées” — The definition, with conditions A)–C) over an algebraically closed field.
- `deligne-weil-i`, §5, (5.6), p. 292: “la théorie de Lefschetz locale du § 4 s'applique au spectre” — The local theory of §4 applies at each s ∈ S.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVII pencil conditions and the quadric/cubic/Hermitian examples checked. IsLefschetzPencil omits ordinary singularities, total-space smoothness and axis transversality; its quadric/cubic tests assert different counts for the very same unrestricted f.

### The dual variety and the incidence family

`LPV.3/dual-variety` · definition · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety`

Realises `LPV.3`, `LPV.5`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and, when nonempty, irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌.

**Hypotheses.**

- X smooth, connected and projective; irreducibility of X̌ comes from its description as the image of the conormal variety, a projective bundle over X.

**Construction.**

1. The conormal variety C = {(x, t) : x ∈ X, T_xX ⊂ H_t}, T_xX the projective tangent space, is a projective bundle over X with fibres P^{N−n−2} (empty when N = n + 1), hence irreducible when nonempty; X̌ is its closed image and is irreducible when nonempty. When X=P the conormal incidence and dual are empty.
2. t ∉ X̌ exactly when X ∩ H_t is smooth of dimension n (the Jacobian criterion at each x ∈ X ∩ H_t), which is the smoothness of g at the points of g^{-1}(t).
3. For a pencil, t ∈ D lies in S exactly when X_t is singular, that is, t ∈ X̌ (X ⊂ H_t cannot happen for t ∈ D: A ∩ X has codimension 2 in X).

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety` (constructor): X̌ ⊂ P̌, the reduced closed image of the conormal variety {(x, t) : T_xX ⊂ H_t}.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.mem_dualVariety_iff` (characterisation): t ∈ X̌ if and only if X ∩ H_t is singular or X ⊂ H_t.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_isIrreducible` (characterisation): If X is smooth, connected, projective and its dual is nonempty, the reduced dual is irreducible. For X equal to the ambient projective space the dual is empty.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.incidence_smooth_off_dual` (characterisation): g : Y → P̌ is smooth over P̌ − X̌.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet_eq_inter_dual` (compatibility): For a Lefschetz pencil, S = D ∩ X̌.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace` (degenerate): X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear` (value): X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic` (value): X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two` (non-example): p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic.

**Acceptance.**

- X = P gives X̌ = ∅; a smooth plane conic has the dual conic for p ≠ 2 and a line for p = 2.

**Used by.**

- `LPV.5/bertini-surjectivity-on-fundamental-groups`: π₁ of the complement P̌ − X̌
- `LPV.5/vanishing-cycles-are-conjugate`: irreducibility of X̌ and connectedness of its smooth locus
- `LPV.3/existence-of-lefschetz-pencils`: general lines D meet X̌ transversally in its good locus

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`, `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`.

**Depends on.** other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `deligne-weil-i`, §5, proof of (5.4), p. 290: “la variété duale de X : c'est l'ensemble des” — The dual variety X̌: the t such that H_t is tangent to X (X_t singular or X ⊂ H_t); it is irreducible (p. 291).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVII conormal geometry checked. Corrected empty-dual irreducibility exception. The closed-image abstraction is sound, but unrelated incidence maps are asserted smooth off the dual and tests omit actual conormal models.

### Existence of Lefschetz pencils after a Veronese re-embedding

`LPV.3/existence-of-lefschetz-pencils` · theorem · planet “Existence of Lefschetz pencils” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.existenceOfLefschetzPencils` (omitted signature)

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all.

**Hypotheses.**

- k algebraically closed.
- r ≥ 2 in the positive statement; the r = 1 failure needs p ≠ 0.

**Proof.**

1. Use the Veronese ordinary-axis open and its degree-two-aware jet estimate from XVII §§3–4.
2. Choose an axis in that nonempty open, with the curve/empty-center branch included.
3. Use the incidence blowup to obtain the smooth projective total space and hyperplane fibres.
4. The ordinary one-point conditions give finitely many critical fibres; no universally étale Gauss map is assumed.

**Acceptance.**

- The Hermitian curve of degree q + 1 in characteristic p odd has no Lefschetz pencil of lines, while a general pencil of conics (r = 2) is Lefschetz.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`, `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`, `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

**Depends on.** this roadmap, same part: `LPV.3/ordinary-axis-open-and-jet-separation`, `LPV.3/lefschetz-pencil`, `LPV.3/dual-variety`, `LPV.2/ordinary-quadratic-point`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `deligne-weil-i`, §5, (5.7), p. 292: “il se peut qu'aucun pinceau de sections hyperplanes de X ne soit de Lefschetz” — For p ≠ 0 the given embedding may admit no Lefschetz pencil.
- `deligne-weil-i`, §5, (5.7), p. 292: “un pinceau assez général de sections hypersurfaces” — For r ≥ 2 a sufficiently general pencil of degree-r hypersurface sections is Lefschetz; the dimension of the Veronese space, C(N+r, N) − 1, was read on the page image.
- `deligne-weil-i`, §5, (5.13) C), p. 294: “est démontré dans SGA 7, XVII” — The proof is SGA 7 XVII.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVII 3–4 existence requires the specified embedding/Veronese and good-axis locus. A subtype constructor for arbitrary admissible subsets also produces a point when the subset is empty.

### Ordinary axis open and Veronese jet estimates

`LPV.3/ordinary-axis-open-and-jet-separation` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryAxisOpen` (omitted signature)

For a smooth projective connected X of positive dimension, after a Veronese embedding of degree r≥2 the hyperplanes whose section has exactly one ordinary quadratic singularity form a dense open in the relevant dual locus, and the locus of bad hyperplanes has codimension at least two in the dual projective space. Together with transversality of the base axis this gives a nonempty open of good pencil axes. Degree two requires the separate two-point jet estimate: the common mixed coefficient can reduce the number of independent conditions by one when the joining line lies in both tangent spaces; the linear-X case is treated by an explicit quadratic pencil.

**Hypotheses.**

- Smooth connected projective X; dim X≥1; algebraically closed base; r≥2
- The good-axis conditions concern ordinary singularities, not separability of the Gauss map in all characteristics

**Proof.**

1. Use the degree-r one-jet map and prescribe a nondegenerate quadratic two-jet at one point.
2. Bound sections with nonordinary singularity using the quadratic-form open.
3. Estimate the two-singular-point incidence, separating r≥3 from r=2 and its common-coefficient defect; handle linear X explicitly.
4. Combine these codimension bounds with the open transversality condition on the axis.

**Acceptance.**

- A degree-two embedding of a linear variety is covered by the explicit quadratic-pencil branch.
- The degree-two proof does not assert surjectivity onto two arbitrary independent one-jet spaces.

**Depends on.** this roadmap, same part: `LPV.2/ordinary-quadratic-form`, `LPV.2/ordinary-quadratic-point`, `LPV.3/dual-variety`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `SGA7II-1973`, Exposé XVII, 2.5, 3.2–7 and 4.1–3; Proposition 4.3 for the degree-two two-point jet bound: “Veronese” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Added XVII 4.3’s two-point degree-two jet estimate to the locator. The Lean theorem declares any subset of any axis scheme open and nonempty; it has no jet or tangency conditions.

### Incidence pencil and its blowup description

`LPV.3/incidence-pencil-blowup` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.incidencePencilBlowup` (omitted signature)

Let X⊂P be smooth projective and A a codimension-two axis meeting X transversely. The incidence family X̃={(x,H):x∈X∩H, H⊃A} over the dual line D is canonically Bl_(A∩X)X, with the actual hyperplane fibres. The center is smooth of codimension two when nonempty, X̃ is smooth, and f:X̃→D is projective. For a curve the general axis misses X, the center is empty and the blowup is X.

**Hypotheses.**

- Smooth projective X; transverse axis; dim X≥1
- Empty center allowed in dimension one

**Proof.**

1. Write the incidence equation s₀u₁−s₁u₀=0 using the two sections cutting out the axis.
2. Use the Rees-algebra universal property and regular-sequence condition to identify it with the blowup.
3. Verify smoothness in its two coordinate charts and projectivity of the pencil map.
4. Treat the empty-center case using the universal property.

**Acceptance.**

- A quadric-surface pencil blows up the two points of its axis intersection.
- A line in P² with a disjoint point axis has total space X and no critical fibre.

**Depends on.** this roadmap, same part: `LPV.3/lefschetz-pencil`; other roadmaps' nodes: `SchemeAndStackFoundations:key/henselization`; other roadmaps' stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

**Sources.**

- `SGA7II-1973`, XVIII §§2–3; XVII 2.2: “éclatement” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVII/XVIII incidence and blowup geometry checked. Moved the requested general Rees/blowup contract from SF.1 descent to SF.4 Part II. The prototype still identifies unrelated incidence and blowup schemes.

### Finite-extension descent of good axes

`LPV.3/finite-field-pencil-descent` · theorem · planet “Finite-field pencil descent” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.finiteFieldPencilDescent`

A nonempty good-axis open defined over 𝔽_q has a point over some finite extension 𝔽_(q^r). The resulting axis, finite singular set and ordinary local models descend at finite presentation to that finite extension. After this base extension arithmetic Frobenius is Frob_q^r on the original cohomology, and the pencil can be supplied to the DWP.4 dimension induction. The open need not have an 𝔽_q-rational point.

**Hypotheses.**

- Smooth projective variety over 𝔽_q; Veronese degree≥2; geometrically nonempty good-axis open
- Finite-presentation descent; ℓ≠p

**Proof.**

1. Construct the Galois-stable good-axis open using the jet/codimension proof.
2. Use the residue field of a closed point of this finite-type 𝔽_q open to obtain a finite extension.
3. Descend the incidence equation and all finite-presentation local conditions.
4. Transport the ℓ-adic realization and identify Frob_(q^r)=Frob_q^r before the weight-roadmap application.

**Acceptance.**

- The descent theorem supplies a finite extension rather than claiming a rational axis over every small finite field.
- A Frobenius eigenvalue α becomes α^r after extension; the supplier’s weight descent uses this power relation.

**Depends on.** this roadmap, same part: `LPV.3/ordinary-axis-open-and-jet-separation`, `LPV.3/existence-of-lefschetz-pencils`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisRepresentations:R01.2`, `FiniteFieldsAndCharacterSums:FF.0`, `SchemeAndStackFoundations:SF.0`.

**Sources.**

- `deligne-weil-i`, §7.1, p. 299, choice of pencil after finite extension: “extension finie” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 7.1 finite-field descent checked. Added SF.0 closed-point residue-field ownership and narrowed FF.0 to field/Frobenius arithmetic; the finite-type finite-field scheme and good-axis model still need to constrain the Lean signature.

### Inseparable Gauss map and low-dimensional pencil cases

`LPV.3/inseparable-gauss-and-low-dimension` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.inseparableGaussPencilCases`

In characteristic two and even fibre dimension n, the ordinary hyperplane locus can have an inseparable Gauss map; a Lefschetz axis is not required to meet the reduced dual transversely as if that map were étale. For a linear X the dual has codimension at least two and a general pencil can have no singular fibres; for X=P the dual is empty. A curve has an empty general base axis. Connected-fibre cohomology arguments are applied only in dimensions where the weak Lefschetz connectedness hypotheses hold, with n=0 handled by finite fibres.

**Hypotheses.**

- The all-characteristic ordinary-pencil definition of XVII 2.2
- Separate n=0, empty-dual and dual-defective cases

**Proof.**

1. Use the Hessian/Gauss differential criterion of XVII 3.3–5.
2. Separate the characteristic-two parity where ordinary does not imply nondegenerate polar Hessian.
3. Apply the codimension-two bad-locus existence criterion directly, without an invalid reduced-dual transversality requirement.
4. Check the linear and curve models and the dimension hypotheses for connected fibres.

**Acceptance.**

- The characteristic-two conic has a line as reduced dual and purely inseparable degree-two Gauss map.
- The line-in-plane pencil has finite singleton fibres and no singular locus.

**Depends on.** this roadmap, same part: `LPV.3/dual-variety`, `LPV.3/ordinary-axis-open-and-jet-separation`, `LPV.2/ordinary-quadratic-point`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `deligne-weil-ii`, 4.2.1–3 and 4.2.7, pp. 219–221: “transversal” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.2 locators corrected to pp. 219–221. The explicit characteristic-two tangent calculation is sound, but it alone does not represent the whole inseparable-Gauss and low-dimension comparison.

## LPV.4 — Global vanishing cycles and middle-degree reduction

LPV.4 passes from local to global over the parameter line D ≅ ℙ¹, with U = D − S and coefficients ℚ_ℓ. Outside p = 2 with n even, R^n f_*ℚ_ℓ is lisse on U and tame at S; the other direct images are constant, or, when all vanishing cycles vanish, sit in a skyscraper sequence in degree n + 1 (`cohomology-sheaves-of-a-lefschetz-pencil`). Transport along étale paths defines the vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ), independent of the paths and stable under π₁(U, u) (`vanishing-subspace`, planet "Vanishing subspace"). An elementary lemma identifies the common fixed space of the local transvections and reflections with E^⊥ (verified); the pairing descends to a nondegenerate form ψ on E/(E ∩ E^⊥), alternating for n odd (`vanishing-quotient-and-its-pairing`). The pencil restriction and Gysin formulas through the incidence blowup (planet "Pencil restriction and Gysin"), the Leray filtration and middle-degree reduction (planet "Middle-degree reduction"), the comparison of local fixed spaces with global invariants (completed in LPV.5) and hypersurface cohomology outside the middle degree finish the layer.

RS-17 narrows LPV.4 to the pencil-specific objects and maps: general projective-bundle and blowup cohomology with their twists is imported from EtaleDualityAndPerverseSheaves EDC.4. The middle reduction must still name its maps: Weil I §7.1 has two different exact-sequence reductions according as the vanishing line lies in the radical, and the review records them as G-review-middle-filtration.

**Coverage.** `partial`. Remaining:
- Supply general blowup/weak Lefschetz and actual Leray edge maps; retain the stated middle subquotient until any splitting hypotheses are proved.
- G-review-middle-filtration: specify the actual middle maps, constant/radical/skyscraper subquotients and Leray differentials; complete geometric realization and quotient universal-property tests.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### The cohomology sheaves of a Lefschetz pencil

`LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologySheavesOfALefschetzPencil` (omitted signature)

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are.

**Hypotheses.**

- The vanishing cycle δ_s is the one of the local theory at s, transported to X_u; being zero does not depend on the transport.

**Proof.**

1. f is smooth and proper over U, so each R^i f_*ℚ_ℓ is lisse on U (smooth and proper base change).
2. At s ∈ S apply the local theory to X̃ ×_D D_s: the inertia at s acts through t_ℓ (n odd) or ε (n even, p ≠ 2), so R^i f_*ℚ_ℓ is tamely ramified at s, and the local description of the Lefschetz-degeneration node holds at s.
3. If δ_s ≠ 0 for all s: for i ≠ n, R^i f_*ℚ_ℓ is lisse near every s, hence lisse on D = P¹; a lisse sheaf on P¹_k is constant because π₁(P¹_k) = 1. In degree n the local statement R^n = j_*j^*R^n at every s gives it globally.
4. If δ_s = 0 for all s: the same argument in degrees i ≠ n + 1; in degree n + 1 the local sequences at the points of S glue to the stated sequence, with ℱ = j_*j^*R^{n+1} f_*ℚ_ℓ lisse on D, hence constant. E is spanned by the δ_s, so E = 0.
5. All δ_s are conjugate up to sign under π₁(U, u) (conjugacy theorem), so one is zero if and only if all are.

**Acceptance.**

- The quadric-surface pencil (n = 1, |S| = 2) is in case (b): R² f_*ℚ_ℓ has an extra ℚ_ℓ(−1) at each of the two singular fibres.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`, `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`.

**Depends on.** this roadmap, same part: `LPV.3/lefschetz-pencil`, `LPV.2/direct-images-at-a-lefschetz-degeneration`, `LPV.5/vanishing-cycles-are-conjugate`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Sources.**

- `deligne-weil-i`, §5, (5.8), p. 292: “en excluant le cas” — The exclusion of p = 2 with n even, and tame ramification of R^n f_*ℚ_ℓ at each s ∈ S.
- `deligne-weil-i`, §5, (5.8) a) 1)–2), p. 292: “Si les cycles évanescents sont non nuls” — Constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- `deligne-weil-i`, §5, (5.8) b), p. 293: “cycles évanescents sont nuls” — The exceptional case, with the sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0, read on the page image.
- `deligne-weil-i`, §5, (5.13) D), p. 294: “est démontré dans SGA 7, XVIII” — The proof of (5.8) is SGA 7 XVIII.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVIII 6.3 and Weil I 5.8 give the two direct-image branches. Arbitrary R,J,eta,exceptional,E in the prototype cannot force those lissity and exactness conclusions.

**Assembly note.** Its last clause, that one vanishing cycle is zero only if all are, uses `LPV.5/vanishing-cycles-are-conjugate`, a stage edge LPV.5 → LPV.4 against the layer order (no node cycle). Stating the two cases as "all vanishing cycles nonzero" and "all zero", with the dichotomy a corollary in LPV.5, removes the edge; see Dependencies.

### The vanishing subspace E of the middle cohomology

`LPV.4/vanishing-subspace` · construction · planet “Vanishing subspace” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle`

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem).

**Hypotheses.**

- Only E is independent of the paths, not the individual oriented vectors δ_s.

**Construction.**

1. Transport: the local vanishing cycle lives in H^n of the geometric generic fibre of X̃ ×_D D_s; a path identifies that fibre functor with the one at u.
2. Path independence and stability: a change of path is an element of π₁(U, u), so the set of all transports is π₁-stable and its span E is π₁-stable and path-free.
3. Local monodromy: the Picard–Lefschetz formula, transported along the path.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle` (constructor): vanishingCycle (s : S) (γ : path u ⇝ η̄_s) : H^n(X_u, ℚ_ℓ)(m), up to sign.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_changePath` (compatibility): vanishingCycle s (g · γ) = ± g • vanishingCycle s γ for g ∈ π₁(U, u).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace` (constructor): E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ)), the span of all vanishing cycles for all paths.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_stable` (characterisation): g • E = E for every g ∈ π₁(U, u).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.localMonodromy_vanishingCycle` (characterisation): σ in the inertia at s acts on H^n(X_u) by x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s (n odd), and by the reflection in δ_s when ε(σ) = −1 (n even).

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre` (degenerate): If S = ∅ (a line in P²) then E = 0.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface` (value): Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic` (value): n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path` (non-example): n odd, s ≠ s′ with (δ_s, δ_{s′}) ≠ 0: transporting δ_s around s′ gives δ_s ± t(δ_s, δ_{s′})δ_{s′} ≠ ±δ_s, so the individual vanishing cycles depend on the path while E does not.

**Acceptance.**

- E = 0 for the quadric-surface pencil and E = ℚ_ℓ(e₁ − e₂) for the conic pencil.

**Used by.**

- `LPV.4/fixed-space-of-the-local-transvections`: E^⊥ as the common fixed space of the local transvections
- `LPV.4/vanishing-quotient-and-its-pairing`: the radical quotient E/(E ∩ E^⊥) and its form
- `LPV.5/absolute-irreducibility-of-the-vanishing-quotient`: absolute irreducibility of E/(E ∩ E^⊥)
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`: the lisse subsheaf ℰ₀ with fibre E over 𝔽_q

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`.

**Depends on.** this roadmap, same part: `LPV.3/lefschetz-pencil`, `LPV.2/lefschetz-degeneration-specialization-sequence`, `LPV.2/local-picard-lefschetz-formula`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Sources.**

- `deligne-weil-i`, §5, (5.2), p. 290: “partie évanescente de la cohomologie” — E is the span of the vanishing cycles (the complex case).
- `deligne-weil-i`, §5, (5.8) a) 3), p. 292: “le sous-espace de la cohomologie engendré par les cycles évanescents” — E ⊂ H^n(X_u, ℚ_ℓ) in the ℓ-adic setting, stable under π₁(U, u).

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.3 and XVIII support path-dependent cycles and stable span. The algebraic span/path API is useful; its geometric quadric and path non-example tests do not instantiate the stated models or nonzero tame coefficient.

### The common fixed space of the local transvections is E^⊥

`LPV.4/fixed-space-of-the-local-transvections` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.fixedSpaceOfTheLocalTransvections`

Let V be a finite-dimensional vector space over a field K with a symmetric or alternating bilinear form ( , ), (δ_s)_{s∈S} a finite family in V, E = span(δ_s), and T_s(x) = x + c_s(x, δ_s)δ_s with c_s ∈ K^× (Mathlib's LinearMap.transvection; a transvection when (δ_s, δ_s) = 0 and a reflection when c_s(δ_s, δ_s) = −2). Then ⋂_s Fix(T_s) = E^⊥ = {x : (x, δ_s) = 0 for all s}.

**Hypotheses.**

- c_s ≠ 0 for every s. If δ_s = 0 then T_s = id and δ_s contributes nothing to E.

**Proof.**

1. T_s x = x if and only if c_s(x, δ_s)δ_s = 0 (LinearEquiv.mem_fixedSubmodule_transvection_iff when (δ_s, δ_s) = 0; the same computation for a reflection).
2. For δ_s ≠ 0 and c_s ≠ 0 this says (x, δ_s) = 0; for δ_s = 0 it is automatic.
3. Intersecting over s gives {x : (x, δ_s) = 0 ∀ s} = E^⊥ (LinearMap.BilinForm.orthogonal of the span).

**Acceptance.**

- V a symplectic plane and one δ ≠ 0: Fix(T) = ℚ_ℓδ = δ^⊥; for δ = 0, T = id and Fix(T) = V = E^⊥.

**Depends on.** libraries: `mathlib:LinearEquiv.transvection`, `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`, `mathlib:LinearMap.BilinForm.orthogonal`.

**Sources.**

- `deligne-weil-i`, §5, Proposition (5.3), p. 290: “c'est clair sur (5.2.1)” — E^⊥ is the monodromy invariants: clear from the local formula (5.2.1), since the γ_s generate.
- `deligne-weil-i`, §5, (5.3), p. 290: “le sous-espace des invariants” — The statement E^⊥ = invariants.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Weil I 5.3 fixed-space calculation checked, including δ=0 and reflection branch. B.flip makes the source pairing order correct; symmetry/alternation identifies it with the pinned right-orthogonal submodule.

### The radical quotient E/(E ∩ E^⊥) and its nondegenerate pairing

`LPV.4/vanishing-quotient-and-its-pairing` · construction · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient`

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ).

**Hypotheses.**

- The pairing on H^n(X_u) is perfect by Poincaré duality, but its restriction to E can be degenerate: E ∩ E^⊥ may be nonzero, and irreducibility and open image concern the quotient, not E.

**Construction.**

1. The kernel of ( , )|_E is {x ∈ E : (x, y) = 0 ∀ y ∈ E} = E ∩ E^⊥ by definition, so the induced form on the quotient is nondegenerate.
2. Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x) and x ∪ x = 0 for n odd (graded commutativity), so ψ is alternating for n odd and symmetric for n even.
3. π₁(U, u) acts on H^n(X_u) preserving the cup product and the trace (the trace is π₁-invariant because R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ on U), and it preserves E, hence E^⊥ and the quotient.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient` (constructor): E ⧸ (E ⊓ E^⊥), a finite-dimensional ℚ_ℓ-space with a π₁(U, u)-action.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm` (constructor): ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate` (characterisation): ψ is nondegenerate.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt` (characterisation): ψ is alternating for n odd (LinearMap.BilinForm.IsAlt) and symmetric for n even.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep` (constructor): ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero` (degenerate): If E = 0 (the quadric-surface pencil) the quotient is 0 and ρ is trivial.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical` (value): Linear algebra: in V = ℚ_ℓ⁴ with ω(e₁, f₁) = ω(e₂, f₂) = 1, E = span(e₁, f₁, e₂) has radical E ∩ E^⊥ = ℚ_ℓe₂, and ψ on the 2-dimensional quotient is nondegenerate; for E = span(e₁, e₂), E ∩ E^⊥ = E and the quotient is 0.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic` (value): n = 0 conic pencil: E = ℚ_ℓ(e₁ − e₂), E ∩ E^⊥ = 0 and ψ(δ, δ) = 2 is a symmetric nondegenerate form on a line.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate` (non-example): The restriction of Tr(x ∪ y) to E itself can be degenerate (the radical example), so ρ does not in general land in Sp(E); the target must be the quotient.

**Acceptance.**

- A nontrivial radical, a zero quotient and a nonzero quotient, as in the unit tests.

**Used by.**

- `LPV.5/absolute-irreducibility-of-the-vanishing-quotient`: the representation whose absolute irreducibility is proved
- `LPV.5/kazhdan-margulis-open-image`: the target Sp(E/(E ∩ E^⊥), ψ) of the open-image theorem
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`: ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥) with its perfect alternating pairing
- `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`: the symplectic target of the geometric monodromy

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`.

**Depends on.** this roadmap, same part: `LPV.4/vanishing-subspace`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; libraries: `mathlib:LinearMap.BilinForm.orthogonal`, `mathlib:LinearMap.BilinForm.IsAlt`.

**Sources.**

- `deligne-weil-i`, §5, (5.9), p. 293: “est le noyau de la restriction à E de la forme” — E ∩ E^⊥ is the kernel of the form restricted to E.
- `deligne-weil-i`, §5, (5.9), p. 293: “Cette forme induit donc une forme bilinéaire non dégénérée” — The induced nondegenerate form ψ with values in ℚ_ℓ(−n).
- `deligne-weil-i`, §5, (5.9), p. 293: “alternée pour n impair, et symétrique pour n pair” — Parity, and ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ) for n odd.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.8 and the radical quotient math are sound. The quotient API still needs the projection/universal property and explicit finite-dimensional radical/conic pairing models; current tests assume away the claimed radical computations.

### Pencil restriction and Gysin formulas

`LPV.4/pencil-restriction-and-gysin` · theorem · planet “Pencil restriction and Gysin” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilRestrictionGysin` (omitted signature)

For the transverse-axis pencil with center Z=A∩X and incidence blowup π:X̃→X, the imported codimension-two blowup formula identifies H^i(X̃)=H^i(X)⊕H^(i−2)(Z)(−1) by π* plus exceptional Gysin. The inverse has the exceptional minus sign. For a smooth pencil fibre Y, restriction sends (a,b) to m*a+h*b, while fibre Gysin sends y to (m*y,−h*y), where m:Y→X and h:Z→Y. These formulas identify the lower-dimensional contributions used in DWP.4.

**Hypotheses.**

- Smooth projective X and transverse smooth codimension-two center; ℚ_ℓ coefficients
- The empty-center curve case has no exceptional summand

**Proof.**

1. Import the general blowup cohomology theorem from EDC.4, rather than proving it here.
2. Compute restriction and fibre Gysin using the exceptional divisor normal bundle.
3. Use EDC.3 self-intersection and projection formulas to check both minus signs.
4. Apply weak Lefschetz below the middle degree to identify the ambient and axis images.

**Acceptance.**

- For an empty center the formula reduces to ordinary restriction/Gysin on X.
- For a blown-up surface the exceptional class has square −1, detecting the inverse-sign convention.

**Depends on.** this roadmap, same part: `LPV.3/incidence-pencil-blowup`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `SGA7II-1973`, XVIII §§2–4 and 5.1: “restriction” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: XVIII 5.1 restriction/Gysin diagrams and exceptional minus sign checked. Actual blowup maps and cup/Gysin realization must constrain the proposed algebraic/derived morphisms.

### Leray filtration and middle-degree reduction

`LPV.4/pencil-leray-and-middle-reduction` · theorem · planet “Middle-degree reduction” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilMiddleReduction`

For a Lefschetz pencil f:X̃→P¹ with U the smooth locus, the actual Leray spectral sequence and edge maps relate H*(X̃) to H^a(P¹,R^b f*ℚ_ℓ), with a=0,1,2 only. The known constant direct images outside the middle degree and the possible degree-(n+1) skyscraper terms identify the lower-dimensional pieces. The middle contribution uses H¹(P¹,j*R^n f*ℚ_ℓ), with the relevant kernel/quotient or filtration specified by the edge maps. No general degeneration at E₂ or hard-Lefschetz-dependent decomposition is assumed.

**Hypotheses.**

- Proper pencil; rational coefficients; tame branch for the local direct-image description
- Any assertion of a split filtration needs the supplier’s extra hypotheses and is not part of this target

**Proof.**

1. Import the actual Rf* Leray spectral sequence and cohomological dimension of P¹ from PR196.
2. Insert the constant/sheaf/skyscraper descriptions of the local-to-global direct images.
3. Compute the edge-map image using the pencil restriction/Gysin formulas.
4. Present middle reduction as the resulting filtration and subquotient, retaining any differential rather than setting it to zero without proof.

**Acceptance.**

- The δ=0 case retains the degree-(n+1) skyscraper contribution.
- The dimension induction imports estimates for both X’s axis and the pencil fibres, rather than discarding the blowup summand.

**Depends on.** this roadmap, same part: `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LPV.4/pencil-restriction-and-gysin`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `deligne-weil-i`, §§6–7, pp. 294–300, pencil reduction: “Leray” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 7.1 p. 300 was read: two different radical/nonradical exact-sequence reductions are essential. Recorded a gap with the actual map directions; unspecified relevant kernel/quotient is not a realized middle target.

### Local fixed space and global invariant interface

`LPV.4/global-fixed-and-local-fixed-interface` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.localGlobalFixedComparison`

The common fixed space of the nontrivial local transvections/reflections is E⊥ by the elementary linear-algebra lemma. It equals the full π₁(U,u)-invariant space only after the algebraic monodromy-generation theorem of LPV.5 is applied. E is the span of all transported local cycles, and E∩E⊥ is the radical of its restricted pairing. These identities do not require hard Lefschetz or nondegeneracy of E itself.

**Hypotheses.**

- Tame pencil branch; ℚ_ℓ coefficients; all transported cycles included
- For local zero cycles the corresponding operator is identity

**Proof.**

1. Apply the fixed-space lemma to each local operator.
2. Use π₁ stability of the full transported span to identify the common local fixed space.
3. Invoke LPV.5 generation only for the final global-invariant equality.
4. Pass to the radical quotient to obtain the nondegenerate pairing.

**Acceptance.**

- A three-dimensional subspace of a four-dimensional symplectic space can have a one-dimensional radical.
- The local-to-global equality is not used to prove its own monodromy-generation prerequisite.

**Depends on.** this roadmap, same part: `LPV.4/fixed-space-of-the-local-transvections`, `LPV.4/vanishing-subspace`, `LPV.4/vanishing-quotient-and-its-pairing`, `LPV.5/monodromy-generated-by-local-transvections`.

**Sources.**

- `deligne-weil-i`, §5.3 and 5.8–9, pp. 289–292: “invariants” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Local fixed-space and global invariant-cycle outputs must remain distinct. The interface needs the genuine specialization/restriction maps and qualified supplier invariant-cycle hypotheses; arbitrary linear identifications do not imply it.

**Assembly note.** Its final equality uses `LPV.5/monodromy-generated-by-local-transvections`, which realises LPV.4 as well as LPV.5; at stage level this is the backward edge LPV.5 → LPV.4 described under Dependencies.

### Hypersurface cohomology outside the middle degree

`LPV.4/hypersurface-outside-middle` · application · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.hypersurfaceOutsideMiddle` (omitted signature)

For a smooth projective hypersurface Y of dimension n over an algebraically closed field, rational ℓ-adic cohomology outside degree n agrees with the projective-space even Tate classes in degrees 0,2,…,2n and vanishes in the other odd degrees, with the dual generators above the middle degree. In a sufficiently ample pencil of hypersurface sections this identifies the constant direct-image pieces and isolates the middle vanishing quotient used by the odd-dimensional Weil-I induction.

**Hypotheses.**

- Smooth hypersurface; ℓ invertible; rational coefficients
- Weak Lefschetz below n and Poincaré duality above n; the middle cohomology is not asserted to be Tate

**Proof.**

1. Import weak Lefschetz and projective-space cohomology.
2. Apply smooth proper duality to identify the degrees above the middle.
3. Insert the result into the direct-image and middle-reduction nodes.
4. Route the tensor-power/weight conclusion of Weil I 5.12 to DWP.4.

**Acceptance.**

- A smooth cubic surface has b₀=b₄=1 and b₁=b₃=0; its b₂ is a middle-degree contribution.
- An odd-dimensional smooth hypersurface has its only possible non-Tate/odd contribution in degree n.

**Depends on.** this roadmap, same part: `LPV.4/pencil-leray-and-middle-reduction`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Sources.**

- `deligne-weil-i`, Remark 5.12, p. 294: “hypersurface” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I hypersurface/weak-Lefschetz reduction supports outside-middle assertions. Specify the smooth hypersurface and hyperplane class objects; arithmetic scalar/count identities alone do not realize cohomology isomorphisms.

## LPV.5 — Irreducibility and open symplectic monodromy

LPV.5 proves that the monodromy of an odd-dimensional Lefschetz pencil is as large as it can be. A general line sees the whole monodromy of the complement of the dual variety for the given ℚ_ℓ local system (`bertini-surjectivity-on-fundamental-groups`); the vanishing cycles are conjugate up to sign (planet "Conjugacy of vanishing cycles"); the monodromy image is topologically generated by the local transvections, so that E^⊥ is the invariant subspace; and V = E/(E ∩ E^⊥) is absolutely irreducible when nonzero (planet "Irreducibility of the vanishing quotient"). Weil I Lemma 5.11 (verified) shows that an irreducible symplectic Lie algebra generated by the square-zero operators x ↦ ψ(x, δ)δ is all of sp(V, ψ); a compact subgroup of Sp(V)(ℚ_ℓ) whose Lie algebra is sp(V, ψ) is open; together they give the Kazhdan–Margulis theorem: the image of π₁(U, u) is open in Sp(V, ψ)(ℚ_ℓ) for the fixed ℚ_ℓ-model (planet "Kazhdan–Margulis theorem"). The algebraic proof uses the tame presentation of ℙ¹ minus finitely many points from IG.1, not the topological fundamental group.

Four further nodes treat the branches Weil II §4 adds: characteristic-two transverse pencils with their wild quadratic characters; the orthogonal alternative, open or finite, which assumes E nondegenerate and so cannot be used to prove hard Lefschetz (planet "Orthogonal monodromy alternative"); the ADE classification of finite orthogonal monodromy; and the failure of the integral statement. The ℓ-adic Lie theory is gap G-padic-Lie, with a proposed LieGroups, Part II, and the rational lattice of 4.4.5–7 is G-orthogonal-integrality. The last two nodes import DWP.4, while DWP.4 consumes LPV.0–LPV.5 (see Dependencies).

**Coverage.** `partial`. Remaining:
- Resolve p-adic Lie charts/closed-subgroup proof; read the conditional orthogonal lattice proof interior and supply its rationality inputs.
- G-review-signature-fidelity and G-review-supplier-order: restore transvection-generation/irreducibility, ℚ_ℓ topology/chart and rational positive-definite lattice hypotheses; separate geometric open-Sp from the later weight-dependent applications.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Bertini: a general line sees the whole monodromy of P̌ − X̌

`LPV.5/bertini-surjectivity-on-fundamental-groups` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.bertiniSurjectivityOnFundamentalGroups` (omitted signature)

For a connected smooth projective variety and the incidence family over the complement of its nonempty irreducible dual divisor, a sufficiently general line satisfying the source’s transversality conditions has the same monodromy image as the base on the given finite-dimensional ℚ_ℓ local system. The proof uses irreducibility of the pullback along a general line for each relevant finite cover, specialization and a finite congruence/Frattini control of the fixed representation. It does not claim that one universal open works simultaneously for every finite cover or every representation.

**Hypotheses.**

- The dual is a nonempty divisor; its smooth ordinary locus and the chosen generic line meet the source’s transversality conditions
- A fixed finite-dimensional continuous ℚ_ℓ representation with compact image; tame branch for the specialization argument
- Linear/empty-dual cases are treated separately

**Proof.**

1. Apply the geometric Bertini irreducibility theorem to the finite cover controlling the fixed compact image.
2. Use the finite congruence/Frattini quotient to reduce image surjectivity to this finite cover.
3. Apply SGA 1 tame specialization and Abhyankar as in XVIII 6.1 to return to the line complement.
4. Record exact image surjectivity and the base-point transports, rather than asserting a stronger all-cover simultaneous open.

**Acceptance.**

- Over ℂ, for X a smooth conic in P² the dual X̌ is a conic, π₁(P̌² − X̌) = ℤ/2, and a general line D meets X̌ in two points with π₁(D − S) = ℤ mapping onto ℤ/2.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`, `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`.

**Depends on.** this roadmap, same part: `LPV.3/dual-variety`, `LPV.3/ordinary-axis-open-and-jet-separation`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.0`, `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `deligne-weil-i`, §5, proof of (5.4), p. 291: “D'après un théorème de Lefschetz, pour D assez générale” — Over ℂ: π₁(D − S) → π₁(P̌ − X̌) is surjective for D general.
- `deligne-weil-i`, §5, (5.8), p. 292: “devient le théorème de Bertini” — In the algebraic setting Lefschetz's π₁ theorem becomes Bertini's theorem.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.4 uses Bertini plus the stated tame algebraic fundamental-group supplier. Every subgroup H does not have the same represented image as G; the geometric π₁ surjection is missing.

### The vanishing cycles are conjugate up to sign

`LPV.5/vanishing-cycles-are-conjugate` · theorem · planet “Conjugacy of vanishing cycles” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingCyclesAreConjugate` (omitted signature)

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}.

**Hypotheses.**

- The pencil is sufficiently general for the surjectivity onto π₁(P̌ − X̌).

**Proof.**

1. Use the nonempty irreducible dual divisor and its smooth ordinary locus to identify its generic local inertia conjugacy class.
2. Apply the tame Bertini image-surjectivity theorem for the fixed cohomological representation.
3. Transport the primitive vanishing generator along the local inertia conjugacies, obtaining ±gδ.
4. Treat the empty singular set separately; the characteristic-two even branch uses its own transverse-pencil node.

**Acceptance.**

- The conic pencil (n = 0, p ≠ 2): both vanishing cycles are ±(e₁ − e₂).
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.

**Depends on.** this roadmap, same part: `LPV.3/dual-variety`, `LPV.5/bertini-surjectivity-on-fundamental-groups`, `LPV.2/local-picard-lefschetz-formula`; other roadmaps' stages: `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Sources.**

- `deligne-weil-i`, §5, Théorème (5.4), p. 290: “(pris au signe près) sont conjugués sous” — The statement over ℂ.
- `deligne-weil-i`, §5, proof of (5.4), p. 291: “deux points du lieu lisse de” — Connectedness of the smooth locus of the irreducible X̌ makes the loops γ_x conjugate.
- `deligne-weil-i`, §5, (5.8), p. 292: “lemme d'Abhyankar pour contrôler la ramification” — In the algebraic proof, Abhyankar's lemma controls the ramification of R^•g_*ℚ_ℓ along the smooth codimension-one locus of X̌.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.4–5.8 gives conjugacy of geometric vanishing cycles. Arbitrary vector families need not lie in a common ±orbit of an arbitrary representation.

### Monodromy is generated by the local transvections, and E^⊥ is the invariant subspace

`LPV.5/monodromy-generated-by-local-transvections` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGeneratedByLocalTransvections` (omitted signature)

Realises `LPV.5`, `LPV.4`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s.

**Hypotheses.**

- The sign ± is the one fixed by the Picard–Lefschetz formula; for n odd the generator of the inertia is one with t_ℓ(γ_s) a chosen generator of ℤ_ℓ(1).

**Proof.**

1. Use SGA 1 XIII’s algebraic tame presentation of P¹ minus the finite critical set, and identify its local inertia images.
2. Apply the local Picard–Lefschetz formulas to those images; for an odd-dimensional pencil they are transvections.
3. Use continuity and compactness to take the closed subgroup generated by the local images, not merely the abstract subgroup.
4. Combine with the local fixed-space lemma to obtain E⊥=V^π₁. The characteristic-two even wild branch is not inferred from this tame presentation.

**Acceptance.**

- Conic pencil: the image is ℤ/2, generated by the swap of the two points, and the invariants are ℚ_ℓ(e₁ + e₂) = E^⊥.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`.

**Depends on.** this roadmap, same part: `LPV.2/local-picard-lefschetz-formula`, `LPV.4/vanishing-subspace`, `LPV.4/fixed-space-of-the-local-transvections`; other roadmaps' stages: `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `deligne-weil-i`, §5, (5.8), p. 292: “Le groupe fondamental modéré de U est un quotient du complété profini du groupe fondamental transcendant analogue” — The tame fundamental group of U and the transfer of Lefschetz's arguments.
- `deligne-weil-i`, §5, (5.8) a) 3), p. 292: “est engendrée (topologiquement)” — The image of π₁ in GL(E/(E ∩ E^⊥)) is topologically generated by the x ↦ x ± (x, δ_s)δ_s, and E^⊥ is the invariant subspace (read on the page image).
- `deligne-weil-i`, §5, Proposition (5.3), p. 290: “c'est clair sur (5.2.1)” — Over ℂ: E is stable and E^⊥ is the invariants because the γ_s generate π₁.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I tame local-generation argument checked. The arbitrary span equality ignores conjugates of an arbitrary δ-family; actual tame generators and geometric path transport must be stated.

### Absolute irreducibility of the vanishing quotient

`LPV.5/absolute-irreducibility-of-the-vanishing-quotient` · theorem · planet “Irreducibility of the vanishing quotient” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.absoluteIrreducibilityOfTheVanishingQuotient`

For the tame Lefschetz pencil branch (odd fibre dimension, or residue characteristic different from 2), the nonzero representation V=E/(E∩E⊥) of π₁(U,u) is absolutely irreducible. If V=0 the representation is zero and is handled as a separate branch, not called irreducible.

**Hypotheses.**

- V≠0 for the irreducibility assertion
- Coefficient field ℚ_ℓ, with scalar extension to any finite extension or algebraic closure; local operators and conjugacy persist
- The pencil is in the tame branch

**Proof.**

1. For a stable nonzero subspace W after scalar extension, nondegeneracy supplies a vanishing cycle δ with (W,δ)≠0.
2. A local transvection or reflection then puts δ in W.
3. Conjugacy puts all transported cycles in W, so W=V.
4. If every pairing vanishes then W is in the radical, hence zero in V. Treat V=0 separately.

**Acceptance.**

- The quadric-surface pencil has E/(E ∩ E^⊥) = 0; the conic pencil has a one-dimensional quotient.

**Cited by other roadmaps' packets.** `WeightsInEtaleCohomology:R34.4/original-coefficient-monodromy-hypotheses`.

**Depends on.** this roadmap, same part: `LPV.5/vanishing-cycles-are-conjugate`, `LPV.5/monodromy-generated-by-local-transvections`, `LPV.4/vanishing-quotient-and-its-pairing`.

**Sources.**

- `deligne-weil-i`, §5, Corollaire (5.5), p. 291: “est absolument irréductible” — The action of π₁(U, u) on E/(E ∩ E^⊥) is absolutely irreducible.
- `deligne-weil-i`, §5, proof of (5.5), p. 291: “Ceci prouve (5.5)” — The argument through a vector x with (x, δ_s) ≠ 0 and conjugacy.
- `deligne-weil-i`, §5, (5.13) D), p. 294: “La démonstration dans le cas général” — SGA 7 XVIII proves irreducibility of E only when E ∩ E^⊥ = 0; the radical quotient is the general case.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.8 gives absolute irreducibility for the nonzero vanishing quotient. An arbitrary positive-dimensional representation can be reducible, including a trivial two-dimensional one.

### A simple symplectic Lie algebra generated by the x ↦ ψ(x, δ)δ is all of sp (Weil I 5.11)

`LPV.5/symplectic-lie-algebra-generated-by-transvections` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.symplecticLieAlgebraGeneratedByTransvections`

Let V be a finite-dimensional vector space over a field k of characteristic 0, ψ a nondegenerate alternating form on V, and 𝔏 ⊂ sp(V, ψ) a Lie subalgebra. For δ ∈ V let N(δ) : x ↦ ψ(x, δ)δ. If (i) V is a simple 𝔏-module and (ii) 𝔏 is generated as a Lie algebra by a family of endomorphisms N(δ_i), then 𝔏 = sp(V, ψ).

**Hypotheses.**

- sp(V, ψ) is Mathlib's skewAdjointLieSubalgebra ψ.
- Characteristic 0 (char ≠ 2 would suffice for the final spanning step).

**Proof.**

1. N(δ) is skew-adjoint: ψ(N(δ)x, y) = ψ(x, δ)ψ(δ, y) = −ψ(x, N(δ)y); and N(δ)² = 0 since ψ(δ, δ) = 0. Assume V ≠ 0. Then 𝔏 ≠ 0: otherwise simplicity gives dim V = 1, impossible for a nondegenerate alternating form.
2. Let W = {δ ∈ V : N(δ) ∈ 𝔏}. W is stable under scalars (N(λδ) = λ²N(δ)) and Zariski closed (the preimage of the subspace 𝔏 under the quadratic map N).
3. For δ ∈ W, exp(λN(δ)) = 1 + λN(δ) lies in Sp(V, ψ) and normalises 𝔏 (Ad exp = exp ad, with ad N(δ) nilpotent and preserving 𝔏); since gN(δ″)g^{-1} = N(gδ″) for g ∈ Sp, it maps W to W. So δ″ + λψ(δ″, δ′)δ′ ∈ W for δ′, δ″ ∈ W, and if ψ(δ′, δ″) ≠ 0 the span of δ′ and δ″ lies in W.
4. If L ⊂ W is a linear subspace and δ ∈ W with ψ(δ, L) ≠ 0 then L + kδ ⊂ W: the w ∈ L with ψ(w, δ) ≠ 0 form a dense open subset of L on which w + kδ ⊂ W by step 3, and W is closed. Hence W is the union of pairwise orthogonal maximal linear subspaces W_α (the spans of the classes of the relation ψ(δ, δ′) ≠ 0).
5. Each W_α is stable under every N(δ), δ ∈ W: N(δ)w = ψ(w, δ)δ is 0 for δ ∈ W_β, β ≠ α, and lies in W_α for δ ∈ W_α. By (ii) W_α is 𝔏-stable. Some generator δ_i is nonzero, and its W_α is nonzero, so W_α = V by (i): N(δ) ∈ 𝔏 for all δ ∈ V.
6. sp(V, ψ) is spanned by the N(δ): polarisation gives N(δ + δ′) − N(δ) − N(δ′) = x ↦ ψ(x, δ)δ′ + ψ(x, δ′)δ, and these span sp(V, ψ) ≅ Sym²V (char ≠ 2). So 𝔏 = sp(V, ψ).

**Acceptance.**

- dim V = 2 with ψ(e₁, e₂) = 1: N(e₁) = −E₁₂ and N(e₂) = E₂₁ generate sl₂ = sp(V, ψ), since their bracket is −H.
- Hypothesis (i) is needed: the Lie algebra spanned by N(e₁) alone is one-dimensional, and V is not a simple module for it.

**Depends on.** libraries: `mathlib:skewAdjointLieSubalgebra`, `mathlib:LieModule.IsIrreducible`, `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:IsNilpotent.exp`.

**Sources.**

- `deligne-weil-i`, §5, Lemme (5.11), p. 293: “V est une représentation simple de” — Hypothesis (i); the statement and hypothesis (ii) read on the page image.
- `deligne-weil-i`, §5, proof of (5.11), p. 294: “On conclut en notant que l'algèbre de Lie” — The final step: sp(V, ψ) is generated by the N(δ), δ ∈ V.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** verified: Weil I 5.11 proof read through p. 294. The nonzero simple Lie-module, rank-one generators, alternating nondegenerate form and Lie-span hypotheses are all retained; no general irreducibility theorem is silently substituted.

### Compact subgroups of Sp(V)(ℚ_ℓ) with full Lie algebra are open

`LPV.5/lie-algebra-of-a-compact-l-adic-subgroup` · lemma · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.lieAlgebraOfACompactLAdicSubgroup` (omitted signature)

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ).

**Hypotheses.**

- H closed (compact) is essential: the group generated by the local monodromies is dense in the image of π₁, and only its closure is compact.

**Proof.**

1. Fix a lattice V_{ℤ_ℓ} and K = 1 + ℓ^r End(V_{ℤ_ℓ}) with r ≥ 2 (r ≥ 1 for ℓ odd); log and exp are inverse homeomorphisms between K and ℓ^r End(V_{ℤ_ℓ}).
2. H is a closed subgroup of GL(V)(ℚ_ℓ), hence an ℓ-adic Lie group, and H ∩ K contains an open uniform pro-ℓ subgroup H₀ (Lazard). log maps H₀ bijectively onto a ℤ_ℓ-Lie lattice Λ, and 𝔏 = ℚ_ℓΛ is a ℚ_ℓ-Lie subalgebra; it lies in sp(V, ψ) because exp(tX) ∈ Sp for all small t forces X ∈ sp.
3. For h = exp(N) ∈ H unipotent, h^a = exp(aN) ∈ H for a ∈ ℤ_ℓ (H is closed), so ℓ^k N ∈ Λ for k large and N ∈ 𝔏.
4. If 𝔏 = sp(V, ψ), Λ is a lattice of full rank in sp(V, ψ), so H₀ = exp Λ contains exp(ℓ^s sp(V_{ℤ_ℓ}, ψ)) for s large, an open neighbourhood of 1 in Sp(V, ψ)(ℚ_ℓ). So H is open.

**Acceptance.**

- H = Sp(V)(ℤ_ℓ) is compact and open with 𝔏 = sp(V, ψ); H = {1} has 𝔏 = 0; the closure of the group generated by one unipotent exp(N), N ≠ 0, is exp(ℤ_ℓN) with 𝔏 = ℚ_ℓN.

**Depends on.** libraries: `mathlib:skewAdjointLieSubalgebra`.

**Sources.**

- `deligne-weil-i`, §5, proof of (5.10), p. 293: “est un sous-groupe compact, donc analytique” — The image of ρ is compact, hence an ℓ-adic analytic subgroup, and openness reduces to its Lie algebra being sp.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I/Weil II require a sufficiently small p-adic logarithm chart and compact closed subgroup. Arbitrary topology/subgroup data without that chart cannot provide the claimed Lie algebra or exponential membership.

### The Kazhdan–Margulis theorem: the monodromy image is open in Sp

`LPV.5/kazhdan-margulis-open-image` · theorem · planet “Kazhdan–Margulis theorem” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.kazhdanMargulisOpenImage` (omitted signature)

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. Let n be odd. The image of ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ) is open. The statement is for the fixed ℚ_ℓ-model; openness in Sp(V ⊗ E′)(E′) for a larger coefficient field E′ is not asserted.

**Hypotheses.**

- n odd, so ψ is alternating.
- V = E/(E ∩ E^⊥) = 0 is allowed: Sp(0) is trivial and the image is open.

**Proof.**

1. H = ρ(π₁(U, u)) is compact (continuous image of a profinite group) in Sp(V, ψ)(ℚ_ℓ); let 𝔏 be its Lie algebra.
2. For s ∈ S, the inertia at s maps onto {exp(aN_s) : a ∈ ℤ_ℓ}, N_s = ±N(δ_s) (t_ℓ is onto ℤ_ℓ(1)), so N_s ∈ 𝔏. Let 𝔤_S ⊂ 𝔏 be the Lie subalgebra generated by the N_s.
3. V is a simple 𝔤_S-module: a 𝔤_S-stable subspace is stable under each N_s, hence under T_s = exp(±N_s), hence under the closed group they generate, which is H (monodromy generation), and by absolute irreducibility it is 0 or V.
4. By Lemma 5.11 with k = ℚ_ℓ, 𝔤_S = sp(V, ψ). So 𝔏 = sp(V, ψ), and H is open by the compact-subgroup lemma.
5. Weil I states that 𝔏 itself is generated by the N_s; step 3 avoids needing this, and it follows a posteriori from 𝔤_S ⊂ 𝔏 ⊂ sp.

**Acceptance.**

- V = 0 for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (X = P² with r = 3): X̃ is P² blown up in 9 points, H^1(X̃) = 0 and f has a section, so the monodromy invariants vanish, E = H^1(X_u) is 2-dimensional with E ∩ E^⊥ = 0, and the image is open in Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ).

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`, `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`, `WeightsInEtaleCohomology:R34.4/original-coefficient-monodromy-hypotheses`.

**Depends on.** this roadmap, same part: `LPV.4/vanishing-quotient-and-its-pairing`, `LPV.5/monodromy-generated-by-local-transvections`, `LPV.5/absolute-irreducibility-of-the-vanishing-quotient`, `LPV.5/symplectic-lie-algebra-generated-by-transvections`, `LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`; other roadmaps' stages: `ArithmeticGaloisRepresentations:R01.2`.

**Sources.**

- `deligne-weil-i`, §5, Théorème (5.10), p. 293: “(Kajdan-Margulis)” — The theorem, attributed to Kazhdan and Margulis: the image of ρ is open.
- `deligne-weil-i`, §5, proof of (5.10), p. 293: “Il suffit de montrer que son algèbre de Lie” — Reduction to the Lie algebra being sp(E/(E ∩ E^⊥), ψ), then Lemma 5.11.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil I 5.9–5.11 open image follows from the geometric transvection-generated Lie algebra. An arbitrary representation has no open-image conclusion.

### Characteristic-two transverse-pencil monodromy

`LPV.5/characteristic-two-transverse-monodromy` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.charTwoTransverseMonodromy` (omitted signature)

For the characteristic-two even-dimensional branch of Weil II 4.2, retain the actual quadratic inertia characters. For transverse pencils satisfying the specified generic-axis hypotheses, the local cycles at the ordinary critical fibres are conjugate up to sign and their stable span is independent of the chosen generic pencil after the prescribed transports. The existence of the generic-axis open is part of 4.2.7; a blanket tame-generation theorem is not asserted for every characteristic-two pencil.

**Hypotheses.**

- Characteristic two, even fibre dimension; the transverse/generic-axis hypotheses of Weil II 4.2.3–8
- Rational ℓ-adic coefficients ℓ≠2

**Proof.**

1. Use the characteristic-two local formula with its actual quadratic character.
2. Apply the family-of-axes comparison and the good generic-axis open of 4.2.7.
3. Use the conjugacy argument of 4.2.6–8 to compare transported local cycles.
4. Keep this branch separate from the tame P¹ inertia-generator proof.

**Acceptance.**

- A wild quadratic local character is retained in the generic-pencil comparison.
- The tame genus-zero presentation is not cited to dispose of wild inertia.

**Depends on.** this roadmap, same part: `LPV.2/quadratic-character-in-characteristic-two`, `LPV.3/ordinary-axis-open-and-jet-separation`, `LPV.4/vanishing-subspace`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `deligne-weil-ii`, 4.2.3–8, pp. 220–221: “conjugués” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.2.3–8 locators corrected to pp. 220–221. Source distinguishes tame/transverse characteristic-two branches and connected components; the representation prototype omits their geometric assumptions.

### Orthogonal monodromy: open or finite

`LPV.5/conditional-orthogonal-open-or-finite` · theorem · planet “Orthogonal monodromy alternative” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.orthogonalOpenOrFinite` (omitted signature)

For a pencil in the even-dimensional branch of Weil II 4.4, assume its vanishing space E has already been proved nondegenerate over the fixed ℚ_ℓ field and the source’s conjugacy and generation hypotheses hold. Its compact geometric monodromy image in O(E) is open or finite. The nondegeneracy of E is an explicit input; in the source it is obtained from hard Lefschetz, so this branch is not used to prove the DWP hard Lefschetz theorem. The odd-dimensional open-Sp theorem instead uses the radical quotient V.

**Hypotheses.**

- Even fibre dimension; nondegenerate E; source 4.4.1 hypotheses
- Compact geometric image over the fixed ℚ_ℓ coefficient field; zero space handled separately

**Proof.**

1. Use the local reflections and conjugacy on E.
2. Apply the orthogonal-group/Lie alternatives in Weil II 4.4.1–4.
3. Use compact ℓ-adic Lie theory for the positive-dimensional open case.
4. Keep the hard-Lefschetz proof of the nondegeneracy input with DWP.5; do not create a dependency back from the odd core.

**Acceptance.**

- For the conic pencil the one-dimensional orthogonal image is finite of order two.
- An isotropic or degenerate E does not satisfy the theorem’s nondegeneracy hypothesis.

**Depends on.** this roadmap, same part: `LPV.5/vanishing-cycles-are-conjugate`, `LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `LPV.2/even-relative-dimension-variation-3-2`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Sources.**

- `deligne-weil-ii`, 4.4.1–4, pp. 227–229: “ouvert ou fini” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.4.1–4 locator corrected. Reflection generation, conjugacy and irreducibility are essential; generic compact orthogonal subgroups need not be open or finite. Existing ClassicalGroups is over C; Q_l extension requested explicitly.

### Finite orthogonal monodromy and ADE lattices

`LPV.5/finite-orthogonal-ade` · theorem · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.finiteOrthogonalADE` (omitted signature)

In the nonzero finite-monodromy case of the preceding even-dimensional theorem, and with the integral/rationality inputs of Weil II 4.4.5–9, the integer lattice generated by all vanishing cycles has an integral positive-definite root pairing after the source’s sign normalization. It is a simply-laced irreducible ADE root lattice, and monodromy is its Weyl group. The rationality and cross-ℓ character arguments are supplied externally; they are not inferred from compactness alone.

**Hypotheses.**

- Even dimension; nonzero nondegenerate E; finite monodromy
- Integral vanishing lattice and the character/integrality hypotheses of Weil II 4.4.5–9

**Proof.**

1. Use the externally supplied rational character comparison and integrality to descend the cycle span to a rational lattice.
2. Normalize the sign of the pairing so each vanishing root has square two.
3. Use conjugacy and local reflections to identify the irreducible root system and its Weyl group.
4. Import the ADE classification from RootSystems. The unread interior 4.4.5–7 remains gap G-orthogonal-integrality.

**Acceptance.**

- The conic-pencil root δ=(1,−1) gives A₁ and its order-two Weyl group.
- The integral lattice is not replaced by an arbitrary ℚ_ℓ lattice without the source’s rationality hypotheses.

**Depends on.** this roadmap, same part: `LPV.5/conditional-orthogonal-open-or-finite`; other roadmaps' stages: `DeligneWeightsAndPurity:DWP.4`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`.

**Sources.**

- `deligne-weil-ii`, 4.4.8–9, pp. 230–231: “A, D, E” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.4.8–9 locator corrected. Rational character and a positive-definite integral root lattice are not consequences of arbitrary finite orthogonal image. The prototype infers positivity for any bilinear form (zero form disproves it).

**Assembly note.** It cites the whole stage DeligneWeightsAndPurity:DWP.4, while the atlas links LPV.5 → DWP.4: a stage cycle. The input needed is only the rational-character and cross-ℓ comparison of Weil II 4.4.5–4.4.9; see Dependencies and G-review-supplier-order.

### Integral failure and arithmetic consequence routing

`LPV.5/integral-failure-and-arithmetic-routing` · application · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.LefschetzPencil.integralVanishingFailure` (omitted signature)

Weil II 4.3.10 identifies the integral intersection of vanishing cycles and fixed classes with the kernel of the polarization map; torsion can make it nonzero. Thus a rational nondegeneracy conclusion cannot be exported integrally without its extra hypotheses. The character/rationality consequences and divisor-degree gcd estimates of 4.5.1–2 are consumers of the monodromy theorem plus DWP and trace/character suppliers, not new proofs of weights in LPV.

**Hypotheses.**

- Integral ℤ_ℓ cohomology for the failure example; rational coefficients for the monodromy consequence
- The 4.5 gcd application retains its source’s geometric and rationality hypotheses

**Proof.**

1. Record the exact integral polarization-kernel obstruction in 4.3.10.
2. Check the rational radical-quotient construction remains valid without asserting integral splitting.
3. Route the character/gcd conclusions to DWP.4 and the upstream trace/character owners with their precise input contracts.

**Acceptance.**

- A polarization divisible by ℓ can leave an integral torsion kernel, so the rational statement is not copied with ℤ_ℓ coefficients.
- The gcd theorem is not used as an input to the geometric local monodromy proof.

**Depends on.** this roadmap, same part: `LPV.4/vanishing-quotient-and-its-pairing`, `LPV.5/kazhdan-margulis-open-image`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`; other roadmaps' stages: `DeligneWeightsAndPurity:DWP.4`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `deligne-weil-ii`, 4.3.10, p. 226, and 4.5.1–2 with proof, pp. 231–233: “torsion” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Weil II 4.3.10/4.5 locators corrected. Arbitrary polarization/vanishing/fixed subgroups do not satisfy the asserted kernel identity; DWP.4’s reverse whole-stage dependency also requires prefix separation.

**Assembly note.** It cites the whole stage DeligneWeightsAndPurity:DWP.4, while the atlas links LPV.5 → DWP.4: a stage cycle. Its arithmetic consequences are applications that follow DWP.4, not inputs to it; see Dependencies.

## LPV.6 — Perverse nearby cycles and comparison interfaces

LPV.6 imports only EDC.5's early perverse t-structure, and uses no purity or decomposition theorem. Over a trait, rational ℓ-adic nearby cycles are t-exact between the perverse categories of the generic and special fibres, which on the total space is the ψ[−1] convention (planet "Perverse nearby cycles"); RΦ(K)[−1] is perverse for K perverse on the total space (planet "Perverse vanishing cycles"); Gabber's duality RΨ(D_ηK) ≅ D_s(RΨK) is natural and inertia-equivariant (planet "Nearby-cycle duality"); and RΨ commutes with intermediate extension when both exchange maps are isomorphisms, a hypothesis to be checked for each pair (planet "Intermediate-extension exchange"). A comparison node fixes the finite, adic, rational and integral p/p+ conventions. The filtered-colimit support criterion (planet "Filtered-colimit support criterion") transports a uniform lower perverse bound to a filtered colimit in the enlarged category, without a constructibility conclusion, and the last node returns this bound to IgusaVarietiesAndTorsionConcentration IG.4 for Caraiani–Scholze §4.6.

RS-17 narrows LPV.6 to these nearby-cycle statements: the early constructible perverse category, recollement and intermediate extension belong to EDC.5. The Igusa node imports IG.4 while IG.4 consumes LPV.6, a stage-level cycle to be split as Dependencies describes.

**Coverage.** `partial`. Remaining:
- Supply early and enlarged perverse categories, qualified costalk-colimit commutation and inertia-equivariant admissible adic comparison.
- G-review-signature-fidelity and G-review-supplier-order: identify actual rectified/integral perverse t-structures, qualified duality/j!* and colimit maps, and import an Igusa geometry prefix independent of the LPV.6 conclusion.

The target inventory is present, but the independent review found unresolved mathematical/signature/API contracts. The precise remaining entries and review gaps replace the prior claim that every target is realized.

### Perverse exactness of nearby cycles

`LPV.6/nearby-perverse-exactness` · theorem · planet “Perverse nearby cycles” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyPerverseExact` (omitted signature)

For a finite-type scheme over a henselian trait, rational ℓ-adic geometric nearby cycles take perverse sheaves on the geometric generic fibre to perverse sheaves on the geometric special fibre, and the induced functor on perverse hearts is exact. With the rectified perversity on the total trait space, this is the ψ[−1] convention: the generic-fibre restriction is shifted by −1 before applying the fibrewise functor. No weight or decomposition theorem is required.

**Hypotheses.**

- Early middle/rectified perverse structures imported from EDC.5; finite type; ℓ invertible
- Rational coefficients, or the finite-coefficient perversity specified by the supplier; p and p+ are not identified integrally

**Proof.**

1. Import the support/cosupport definition and the trait dimension convention from EDC.5.
2. Use the group-cohomology two-term calculation and the strict-local nearby stalks to establish the required perverse bounds.
3. Combine the two bounds to obtain t-exactness and hence exactness on the hearts.
4. Check the generic-fibre dimension shift accounts for ψ[−1] on the total space.

**Acceptance.**

- For a smooth relative-d curve, ℚ_ℓ[d] on each fibre is preserved with no extra fibrewise shift.
- For ℚ_ℓ[d+1] on the smooth total trait space, ψ[−1] gives ℚ_ℓ[d] on the special fibre.

**Depends on.** this roadmap, same part: `LPV.0/constructibility-and-finite-amplitude`, `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.5`.

**Sources.**

- `illusie-1994`, 4.5–4.6, pp. 47–49: “pervers” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 1994 4.5/2021 supplies nearby perversity with coefficients and rectified dimension function. Arbitrary t-structures and functors do not have shifted t-exactness; EDC trait/integral extension is now explicitly Part II.

### Perverse exactness of shifted vanishing cycles

`LPV.6/vanishing-perverse-exactness` · theorem · planet “Perverse vanishing cycles” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingPerverseExact` (omitted signature)

For a perverse complex K on the total trait space with rectified perversity, RΦK[−1] is perverse on the special fibre. Its can/var maps match the shifted nearby triangle. This is different from asserting that arbitrary i*K or i*K[−1] is perverse: the restriction has the two adjacent perverse degrees appearing in the gluing argument.

**Hypotheses.**

- Finite type; early EDC.5 rectified perversity; finite or rational coefficients with the supplier’s duality convention

**Proof.**

1. Use the total-space gluing bounds for j*K[−1] and i*K[−1].
2. Apply fibrewise nearby t-exactness to the generic restriction.
3. Use the specialization triangle and its two perverse bounds to show the shifted cone is perverse.
4. Retain the total/fibre dimension shifts and normalized can/var twists.

**Acceptance.**

- At a nodal curve, RΦQ_l[2][−1] is the point skyscraper ℚ_ℓ(−1) in perverse degree zero.
- For a smooth total family the shifted vanishing object is zero.

**Depends on.** this roadmap, same part: `LPV.6/nearby-perverse-exactness`, `LPV.1/normalized-can-var`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.5`.

**Sources.**

- `illusie-1994`, 4.6, pp. 48–49: “Φ” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 1994 4.6 and its erratum give vanishing perversity under the same geometric conventions. An arbitrary vanishing functor between arbitrary hearts need not have this property.

### Nearby-cycle Verdier duality

`LPV.6/nearby-verdier-duality` · theorem · planet “Nearby-cycle duality” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyVerdierDuality` (omitted signature)

Gabber’s comparison RΨ(D_ηK)≅D_s(RΨK) is natural and inertia-equivariant, with the dualizing complexes and Tate twists provided by the six-operation supplier. The induced shifted vanishing-cycle duality is compatible with can/var and the specialization pairing. Rational adic passage is compatible with the comparison; for integral coefficients the two dual perverse conventions are kept distinct.

**Hypotheses.**

- Finite type over a trait; constructible bounded complexes; torsion prime to residue characteristic or derived adic realization
- Dualizing objects and their normalizations supplied by EDC.1–2

**Proof.**

1. Construct the tensor/trace comparison of Illusie 4.3 using the actual geometric functors.
2. Apply Gabber’s duality theorem and dévissage as in 4.2–4.3.
3. Check naturality with the geometric inertia automorphisms.
4. Pass compatibly to adic coefficients and identify the cone-duality shifts.

**Acceptance.**

- The rank-one nodal stalk/costalk pairing reproduces the twist −1.
- No unqualified self-dual p-perversity statement is made over ℤ_ℓ with torsion.

**Depends on.** this roadmap, same part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.0/adic-nearby-cycle-realization`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Sources.**

- `illusie-1994`, 4.2–4.4, pp. 44–47: “dualité” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Illusie 1994 4.2–4 gives constructible finite-Tor duality for the actual nearby functor. An isomorphism for unrelated dualX,dualY,nearby functors is not implied.

### Qualified intermediate-extension exchange

`LPV.6/intermediate-extension-exchange` · theorem · planet “Intermediate-extension exchange” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyIntermediateExtension` (omitted signature)

Let j_η and j_s be compatible open immersions in a trait family. Suppose nearby cycles are t-exact for the specified perverse structures and both exchange maps RΨ j_η!≅j_s! RΨ and RΨ Rj_η*≅Rj_s* RΨ are isomorphisms on the complexes in question, including the coherence of the !→* map. Then RΨ(j_η!*P)≅j_s!*(RΨP), by exact preservation of the image in the perverse heart. These exchange hypotheses must be verified for the chosen pair, for example a constant product family with a fixed smooth boundary; they are not a universal assertion for moving boundaries.

**Hypotheses.**

- The displayed ! and * exchange isomorphisms and their common map coherence
- Perverse t-exactness; constructible perverse P; specified coefficient convention

**Proof.**

1. Use the supplier definition j!*P=im(pH⁰j!P→pH⁰Rj*P).
2. Apply exactness of RΨ on perverse hearts and the two exchange isomorphisms.
3. Check that their map corresponds to the same !→* morphism.
4. Verify the exchange hypotheses by smooth/product base change in the constant pair; leave other cases as explicit conditions.

**Acceptance.**

- A constant smooth pair U⊂Y times the trait satisfies the exchange and yields the constant intermediate extension.
- An arbitrary moving open boundary is not covered merely by writing j!*.

**Depends on.** this roadmap, same part: `LPV.6/nearby-perverse-exactness`, `LPV.0/derived-functorialities-and-specialization-sequence`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.5`.

**Sources.**

- `illusie-1994`, 4.5–4.6 (exactness); image argument using the EDC.5 definition: “exact” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Qualified ! and * exchange maps are necessary for j!* exchange. The prototype supplies arbitrary intermediate-extension functors without an open-immersion square or invertible exchange maps.

### Perverse coefficients and comparison conventions

`LPV.6/perverse-coefficients-and-comparison` · comparison · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.perverseCoefficientComparison` (omitted signature)

The finite-level nearby-cycle functor, its derived adic realization and its rational form are compared in the early perverse framework. Integral duality exchanges the supplier’s p and p+ conventions where torsion requires it. The scheme/adic and scheme/complex comparison maps are used only for their stated finite-type admissible domains and must preserve dimension shifts, specialization and inertia. No perverse diamond or arbitrary analytic comparison is manufactured inside LPV.

**Hypotheses.**

- Finite-type and coefficient hypotheses of the supplier comparisons
- Derived adic limits with uniform amplitude; p/p+ conventions explicit

**Proof.**

1. Use the finite-level coefficient-change theorem and the EDC.6 integral/rational comparison.
2. Track support/cosupport bounds under the derived adic realization.
3. Check the comparison of ψ[−1] and φ[−1] using the same trait dimension function.
4. Import analytic/adic/diamond comparisons at their precise domain, retaining gap G-adic-comparison.

**Acceptance.**

- Rationalization removes the integral torsion distinction but does not change the fibrewise shift convention.
- The ordinary node compares to the complex Milnor fibre with the same specialization direction.

**Depends on.** this roadmap, same part: `LPV.0/coefficient-and-trait-change`, `LPV.0/scheme-adic-trait-comparison`, `LPV.6/nearby-perverse-exactness`, `LPV.6/vanishing-perverse-exactness`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- `illusie-1994`, 4.4–4.6, pp. 47–49: “coefficients” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Finite/adically realized/rational and integral p/p+ coefficient conventions must constrain the comparison. Arbitrary extX,extY,nearby′ functors do not commute.

### Filtered-colimit support and cosupport criterion

`LPV.6/filtered-colimit-support-criterion` · theorem · planet “Filtered-colimit support criterion” · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.filteredColimitSupportCriterion` (omitted signature)

In the enlarged derived étale category supplied by EDC.5/E1, let K=colim K_a be a filtered colimit of finite-level constructible complexes with a common perverse lower bound relative to a fixed dimension function. Assume geometric costalks commute with this colimit in the stated finite-cohomological-dimension setting; then K has the same lower bound, because cohomology commutes with filtered colimits of coefficient modules. The analogous upper-bound assertion uses stalks. The colimit need not be constructible, so the conclusion is a support/cosupport bound in the enlarged category, not membership in the constructible perverse heart.

**Hypotheses.**

- Filtered system; uniform finite-level bound; fixed dimension function
- The required stalk or costalk/filtered-colimit commutation proved by the supplier under finite cohomological dimension
- The enlarged category permits nonconstructible objects

**Proof.**

1. Express the lower perverse bound by vanishing of costalk cohomology below the dimension threshold.
2. Use the supplier’s actual costalk-colimit comparison; do not assume Ri! commutes with every colimit.
3. Use exact filtered colimits of modules to retain the bound.
4. Apply the same argument with stalks for the upper bound, without a constructibility conclusion.

**Acceptance.**

- An increasing union of arbitrarily many point-supported perverse sheaves can retain the bound while failing constructibility.
- A system with bounds tending to −∞ is not covered by the uniform-bound assertion.

**Depends on.** this roadmap, same part: `LPV.6/nearby-perverse-exactness`; other roadmaps' nodes: `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.5`, `EnhancedDerivedSheaves:E1`.

**Sources.**

- `caraiani-scholze`, §4.6, pp. 60–63, finite-level lower bounds and cofinal models: “colimit” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Caraiani–Scholze 4.6 supports the qualified stalk/costalk colimit criterion and uniform bounds. A general t-structure need not have a lower half closed under arbitrary existing filtered colimits.

### Igusa finite-level semiperversity interface

`LPV.6/igusa-semiperversity-interface` · application · LPV.0 part · Lean `TauCeti.AlgebraicGeometry.VanishingCycles.igusaSemiperversityInterface` (omitted signature)

For the cofinal finite-level formal models in Caraiani–Scholze §4.6, the scheme/adic nearby comparison and the preceding support criterion transport the finite-level lower perverse bound to the filtered-colimit object consumed by IgusaVarietiesAndTorsionConcentration:IG.4. The Igusa/Hodge–Tate tower geometry, affineness and vanishing of boundary terms under transition maps remain with IG.2–4. LPV exports only the nearby-cycle exactness, shift conventions, comparison and support criterion.

**Hypotheses.**

- The actual cofinal formal-model and finite-cohomological-dimension hypotheses of CS §4.6
- Finite-level semiperversity and boundary transition vanishing supplied by IG.4

**Proof.**

1. Identify the finite-level scheme nearby functor with the admissible adic functor using the supplier comparison.
2. Apply the fixed dimension shift and uniform lower perverse bound.
3. Use the costalk-colimit criterion in the enlarged category.
4. Return the resulting bound to IG.4 without constructing a second tower or nearby carrier.

**Acceptance.**

- The target is IG.4 of the Igusa roadmap, not the distinct InverseGalois roadmap with the same local stage letters.
- No constructibility claim is added for the infinite-level colimit.

**Depends on.** this roadmap, same part: `LPV.6/filtered-colimit-support-criterion`, `LPV.0/scheme-adic-trait-comparison`; other roadmaps' stages: `IgusaVarietiesAndTorsionConcentration:IG.4`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Sources.**

- `caraiani-scholze`, §4.6, Theorem 4.6.1 and its finite-level comparison proof: “semiperverse” — The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.0).** unverifiable: Caraiani–Scholze 4.6 and IG.4 geometry checked. Recorded the LPV.6↔IG.4 stage-order problem. An arbitrary filtered diagram in an arbitrary heart is not the specified formal-model/Igusa interface.

**Assembly note.** It cites the whole stage IgusaVarietiesAndTorsionConcentration:IG.4, while the atlas links LPV.6 → IG.4: a stage cycle. The input needed is only IG.4's finite-level formal models and their common lower bound; see Dependencies.

## LPV.7 — Invariant cycles and semistable-curve exports

LPV.7 is an index. Its one node, `LPV.7/export-index`, points each consumer to the sub-layer it needs and adds no mathematics: DWP.9 consumes LPV.7:invariant-cycles, while DWP.10, WeightsInEtaleCohomology R34.3 and the modular-curve consumers consume LPV.7:semistable-curves, so that no consumer of the curve calculation is forced through the weight theorems DWP.7–DWP.9. Hyodo–Kato N is owned by CrystallineCohomology CR.6, and its comparison with étale N by CohomologyComparisons; two operators named N are never identified by name.

**Coverage.** `planned`. Remaining:
- Certify the two child supplier interfaces and recorded gaps; the parent is only an export index.

### Invariant-cycle and semistable export index

`LPV.7/export-index` · application · LPV.7 part

The parent LPV.7 stage is only the index of two independent child exports. DWP.9 consumes local/pure/global invariant cycles from LPV.7:invariant-cycles; DWP.10 and WeightsInEtaleCohomology:R34.3 consume the curve/strict-SNC maps from LPV.7:semistable-curves. No proof, object or late purity prerequisite is added at this aggregate. Hyodo–Kato N is owned by CrystallineCohomology:CR.6, and comparison with étale N by CohomologyComparisons.

**Hypotheses.**

- Accepted RS-17 narrowing; existing stage identifiers retained.

**Proof.**

1. Point consumers to the child’s precise named theorem and its hypotheses.
2. Keep semistable cohomology and graph calculations independent of the invariant-cycle weight proof.
3. Expose source restrictions and explicit open supplier contracts in the reader/handoff.

**Acceptance.**

- No consumer of the early curve interface is forced through DWP.7–DWP.9.
- No second proof of either child or unsourced identification of operators named N.

**Depends on.** this roadmap's stages: `LPV.7:semistable-curves`, `LPV.7:invariant-cycles`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie21`, §§4.4,6.3–6.4 (separate curve calculation and weight-monodromy question); scope fixed by reviewed RS-17: “monodromy” — Illusie21 motivates separating the curve calculation from the general weight-monodromy question, but the navigation/export ownership is an atlas decision fixed by accepted RS-17. Clarified that citation match. The aggregate adds no mathematical construction and does not re-own Hyodo–Kato N.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Illusie21 motivates separating the curve calculation from the general weight-monodromy question, but the navigation/export ownership is an atlas decision fixed by accepted RS-17. Clarified that citation match. The aggregate adds no mathematical construction and does not re-own Hyodo–Kato N.

## LPV.7:semistable-curves — Semistable curves and strict normal crossings

The sub-layer uses no weight theorem, and imports its geometry: nodal charts, normalization and the dual graph from Tau Ceti StableReduction layer 1, the generalized Jacobian and the positive valuation pairing from NeronModelsAndSemistableAbelianVarieties R11.4. What it proves is the étale side and the comparison.

- **Curves.** The étale normalization complex with the signed differential (planet "Normalization complex") and the constant-sheaf resolution; the nearby cycles at nodes and the residue identification R¹Φ(1) ≅ ker(sum); the node residue and variation sign N_e(δ′_e) = −n_e δ_e; the specialization sequence of a nodal curve (planet "Curve specialization sequence"); graph and component cohomology; the factorization N = c′ ∘ u− ∘ c through the negative edge form, so N² = 0 and rank N = b₁(Γ); the invariants V^I = ker N = sp H¹(Y) (planet "Curve inertia invariants"); the monodromy filtration centred at 1 with graded pieces H¹(Γ), ⊕H¹(Ỹ_v) and H₁(Γ)(−1) (planet "Curve monodromy filtration"); the Jacobian and Tate realization and the sign u− = −u+; base change, with thickness e·n_e under ramification e; and the smooth, bridge and split two-edge examples.
- **Strict normal crossings.** The Kummer-residue stalks R^qΨΛ_x ≅ ∧^q(coker(Λ → Λ^a))(−q) (planet "Normal-crossing nearby cycles"); the graded nearby complex; the weight spectral sequence with its proper and nonproper abutments (planet "Weight spectral sequence"); the restriction-plus-Gysin differential with Saito's signs; and monodromy on the spectral sequence, where for curves E₂ = E∞ and the induced filtration agrees with the curve filtration.

Open: trait-scope purity for the singular semistable morphism (G-trait-purity), the filtered étale realization feeding Mathlib's spectral sequences (G-filtered-realization), actual geometric models for the examples (G-geometric-tests) and the geometric premises missing from the suggested Lean forms (G-suggested-premises).

**Coverage.** `planned`. Remaining:
- Certify trait purity and filtered étale realization (G-trait-purity, G-filtered-realization).
- Realize the geometric smooth/bridge/I₂ acceptance instances (G-geometric-tests).
- Supply omitted geometric premises before strengthening Lean signatures (G-suggested-premises).

### Étale normalization differential

`LPV.7:semistable-curves/normalization-differential` · construction · planet “Normalization complex” · LPV.7 part · Lean `TauCeti.LPV7.normalizationDifferential`

For the finite oriented dual multigraph Γ of a proper geometrically connected nodal special fibre Y, imported from StableReduction, construct d:Λ^V→Λ^E by (da)e=a(tail e)−a(head e), using the ordered branch sets. Regard d as the degree-zero map of the two-term normalization complex. Λ is ℤ/ℓ^m, ℤ_ℓ or a finite extension of ℚ_ℓ, with ℓ invertible. The graph, its integral homology and orientations are supplied objects; this node builds the étale coefficient realization, not a second graph theory.

**Hypotheses.**

- Y is a proper connected geometric nodal curve; ordered branches are chosen only for coordinates.
- Loops and multiple edges are retained; no component weight or intersection matrix is substituted for Γ.

**Construction.**

1. Use StableReduction’s normalization and paired branch scheme.
2. Take the branch-difference map in the normalization sequence, as in Illusie91 (2.1.2) and (2.3.5).
3. Identify constant sections with ker d when Γ is connected; orientation reversal is the signed change of edge coordinates.

**API.**

- `TauCeti.LPV7.normalizationDifferential_apply` (simp): For a:Λ^V and e∈E, d(a)(e)=a(tail e)−a(head e).
- `TauCeti.LPV7.normalizationDifferential_constant` (characterisation): d sends every constant vertex function to zero.
- `TauCeti.LPV7.normalizationDifferential_reverse` (functoriality): Swapping tail and head multiplies d by −1 on the corresponding edge coordinates.
- `TauCeti.LPV7.normalizationDifferential_ker` (compatibility): Kernel membership is equality of vertex values on each edge; the quotient map Λ^E→Λ^E/range d is surjective and has kernel range d. Under the supplied two-term-complex realization these are its degree-zero kernel and degree-one cokernel.

**Unit tests.**

- `TauCeti.LPV7.normalization_tree_test` (computation): For two vertices and one oriented edge, d(a0,a1)=a0−a1; hence the degree-one quotient vanishes.
- `TauCeti.LPV7.normalization_loop_test` (degenerate): For one vertex and one loop, d=0 and the edge quotient is Λ, not zero.
- `TauCeti.LPV7.normalization_parallel_test` (non-example): For two vertices and two parallel edges with the same orientation, d(a0,a1)=(a0−a1,a0−a1), whose quotient has rank one over ℚ_ℓ.

**Acceptance.**

- A loop has zero differential; two parallel edges remain two coordinates.
- The maps retain the exact source branch sign.

**Used by.**

- Illusie91 (1.6.5), (2.3.5): Computes the toric injection from node residues and prevents confusing cycles with cocycles.
- LPV.7:semistable-curves; DWP.10 and WeightsInEtaleCohomology:R34.3: Provides the exact normalization maps, rather than only a graph Betti number.

**Depends on.** Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; libraries: `mathlib:LinearMap.ker`, `mathlib:LinearMap.range`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§1.1, 2.1–2.3, formulas1.1.1–1.1.3, 2.1.2, 2.3.5: “branches” — Illusie91 2.1.2 and 2.3.5 give tail-minus-head after choosing branch order. Loops and parallel edges must survive the imported multigraph. The API now states the actual kernel and quotient-map properties prototyped in Lean; identifying two-term cohomology still uses the geometric realization.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Illusie91 2.1.2 and 2.3.5 give tail-minus-head after choosing branch order. Loops and parallel edges must survive the imported multigraph. The API now states the actual kernel and quotient-map properties prototyped in Lean; identifying two-term cohomology still uses the geometric realization.

### Normalization resolution of the constant sheaf

`LPV.7:semistable-curves/normalization-etale-resolution` · comparison · LPV.7 part · Lean `TauCeti.LPV7.normalizationEtaleResolution` (omitted signature)

Let ν:Ỹ→Y be normalization and i_e:{e}→Y the node inclusions. The sequence 0→Λ_Y→ν_*Λ_Ỹ→⊕_e i_e*Λ(e)→0 is exact, where Λ(e)=coker(Λ→Λ^{B_e}) for the two branches B_e, and the last map is restriction to the branches followed by the quotient. Branch ordering identifies Λ(e) with Λ with the same sign as normalizationDifferential. This is an étale constant-sheaf calculation, distinct from the imported coherent normalization/conductor sequence.

**Hypotheses.**

- Finite normalization of a proper geometric nodal curve; coefficients prime to the characteristic.

**Proof.**

1. Check smooth stalks and the two-branch node stalks using the supplied normalization chart.
2. Use conservative geometric stalks to prove exactness.
3. Take derived global sections and identify H⁰(Ỹ,Λ)→⊕Λ(e) with the normalization differential.

**Acceptance.**

- At a node the cokernel of the diagonal Λ→Λ² is rank one.
- At a smooth point the cokernel vanishes.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/normalization-differential`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §2.3, formulas2.3.1–2.3.5 and Lemma2.4: “normalisée” — Illusie91 2.3.1–2.3.5 and Lemma2.4 supply the constant étale normalization sequence with branch quotient, not the coherent conductor sequence. The stalk proof and signed differential agree.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 2.3.1–2.3.5 and Lemma2.4 supply the constant étale normalization sequence with branch quotient, not the coherent conductor sequence. The stalk proof and signed differential agree.

### Nearby cycles at nodes

`LPV.7:semistable-curves/nodal-nearby-cycle-sheaves` · theorem · LPV.7 part · Lean `TauCeti.LPV7.nodalNearbyCycleSheaves` (omitted signature)

For a proper flat nodal curve X/S over a strictly henselian trait, with smooth geometrically connected generic fibre and étale local equations uv=a_e≠0 at the nodes, R⁰ΨΛ=Λ_Y, R¹ΨΛ is supported at the nodes, and R^qΨΛ=0 for q>1. There is a canonical residue identification R¹ΦΛ(e)(1)≅Λ′(e), where Λ′(e)=ker(sum:Λ^{B_e}→Λ), dual to Λ(e). Inertia is trivial on these cohomology sheaves, although its action on RΨΛ and on H¹ of the generic fibre need not be trivial.

**Hypotheses.**

- ℓ is invertible on S; ν and node charts imported from StableReduction.
- For the strict semistable subcase, X is regular and every thickness v(a_e)=1.

**Proof.**

1. Apply LPV.0’s stalk formula and LPV.2’s dimension-one local quadratic calculation at each node.
2. Apply smooth local acyclicity off the nodes.
3. Use the branch residue/trace dualities in Illusie91 (1.3.3), (1.5.1), preserving the twist.

**Acceptance.**

- The smooth locus has R¹Φ=0.
- A split node has one copy of Λ(−1) in R¹Φ; trivial sheaf action does not force N=0 globally.

**Depends on.** this roadmap, other part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`; this roadmap's stages: `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§1.2–1.5, formulas1.2.1–1.2.2, 1.3.3 and 1.5.1: “trace” — Illusie91 1.2–1.5 gives the node-supported degree-one sheaf, its trace-dual branch kernel and trivial sheaf-level inertia. Added EDC.2:pairings directly for the residue/trace identification; LPV.2 supplies the local quadratic computation and LPV.0 the triangle.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Illusie91 1.2–1.5 gives the node-supported degree-one sheaf, its trace-dual branch kernel and trivial sheaf-level inertia. Added EDC.2:pairings directly for the residue/trace identification; LPV.2 supplies the local quadratic computation and LPV.0 the triangle.

**Assembly note.** Its citation of the stage `LPV.0` stands for the rational ℓ-adic realization, which `LPV.0/adic-nearby-cycle-realization` constructs.

### Node residue and variation sign

`LPV.7:semistable-curves/node-residue-variation-sign` · lemma · LPV.7 part · Lean `TauCeti.LPV7.nodeResidueVariationSign` (omitted signature)

With Illusie’s dual branch bases δ′_e=(1,−1) and δ_e, the normalized local variation N_e:R¹ΦΛ(e)(1)→H¹_e(Y,RΨΛ) sends δ′_e to −n_e δ_e, where n_e=v(a_e). The map to H²(Y,Λ)(1) sends δ′_e to [C_tail]−[C_head]. The two connecting morphisms compared by the localization/normalization diagram differ by a minus sign (Illusie91 Lemmas 1.5.4 and 2.4).

**Hypotheses.**

- Same nodal-family hypotheses; n_e≥1; coefficient/tame character normalization fixed by LPV.1.

**Proof.**

1. Identify the boundary map through local trace duality and LPV.2’s odd-dimensional Picard–Lefschetz formula.
2. Use the nine-diagram boundary sign to compare local cospecialization with normalization.
3. Insert tℓ(σ), obtaining Var_e(σ)=tℓ(σ)N_e.

**Acceptance.**

- For uv=π, N_e is minus the identity in the branch bases.
- Reversing the branch order changes both bases, leaving the geometric map unchanged.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/nodal-nearby-cycle-sheaves`, `LPV.7:semistable-curves/normalization-etale-resolution`; this roadmap, other part: `LPV.0/variation-morphism`, `LPV.2/local-picard-lefschetz-formula`; this roadmap's stages: `LPV.1`, `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.1`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, Lemma1.5.4, §1.7 formulas1.7.1–1.7.4, Lemma2.4: “opposés” — Illusie91 Lemma1.5.4, 1.7.4 and Lemma2.4 fix the minus sign and valuation factor. The two localization connecting maps are opposite; the packet keeps this convention instead of identifying the two maps.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 Lemma1.5.4, 1.7.4 and Lemma2.4 fix the minus sign and valuation factor. The two localization connecting maps are opposite; the packet keeps this convention instead of identifying the two maps.

**Assembly note.** The stage citations stand for LPV.0-part nodes: `LPV.0/adic-nearby-cycle-realization` (rational coefficients), and `LPV.1/finite-monodromy-logarithm` with `LPV.1/normalized-can-var` (the tame character normalization of N_e). The cited `LPV.2/local-picard-lefschetz-formula` is stated for a regular total space, where the thickness is one; the factor n_e = v(a_e) comes from `LPV.2/odd-relative-dimension-picard-lefschetz-3-3` with m = 0, whose Kummer character of b is v(b)·t_ℓ on rational coefficients and gives Var(σ)(a) = −v(b) t_ℓ(σ)(a, δ)δ.

### Specialization sequence for a nodal curve

`LPV.7:semistable-curves/curve-specialization-sequence` · theorem · planet “Curve specialization sequence” · LPV.7 part · Lean `TauCeti.LPV7.curveSpecializationSequence` (omitted signature)

For X/S as above, proper base change and the vanishing triangle give 0→H¹(Y,Λ)→H¹(X_η̄,Λ)→⊕_e Λ′(e)(−1)→H²(Y,Λ)→H²(X_η̄,Λ)→0. In branch coordinates the middle boundary is the oriented incidence map on edges, followed by component trace classes. For a connected generic curve H²(X_η̄,Λ)≅Λ(−1), and H⁰ specializes isomorphically. All arrows, twists and Galois actions are retained.

**Hypotheses.**

- Proper flat family, geometrically connected smooth generic fibre and reduced nodal special fibre.
- Work after strict henselization; descent to a henselian base is part of the compatibility theorem.

**Proof.**

1. Use LPV.0’s proper comparison RΓ(Y,RΨΛ)≅RΓ(X_η̄,Λ).
2. Apply the vanishing triangle and ns; the node support kills H^j(Y,R¹Φ) for j>0.
3. Identify the boundary using sign and compute the final trace using connectedness.

**Acceptance.**

- The kernel of the node-to-component map is H₁(Γ,Λ)(−1).
- A bridge contributes a local vanishing cycle but no nonzero quotient in generic H¹.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/nodal-nearby-cycle-sheaves`, `LPV.7:semistable-curves/node-residue-variation-sign`; this roadmap, other part: `LPV.0/derived-functorialities-and-specialization-sequence`; this roadmap's stages: `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §1.6, formulas1.6.1–1.6.6, §2.2: “spécialisation” — Illusie91 1.2.2 and 2.2.2 give the proper specialization exact sequence. The boundary is oriented incidence, and the rational H2 trace/sum yields the graph-cycle quotient.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 1.2.2 and 2.2.2 give the proper specialization exact sequence. The boundary is oriented incidence, and the rational H2 trace/sum yields the graph-cycle quotient.

**Assembly note.** Its citation of the stage `LPV.0` stands for the rational realization `LPV.0/adic-nearby-cycle-realization` of the proper specialization sequence of `LPV.0/derived-functorialities-and-specialization-sequence`.

### Graph and component cohomology

`LPV.7:semistable-curves/curve-normalization-cohomology` · theorem · LPV.7 part · Lean `TauCeti.LPV7.curveNormalizationCohomology` (omitted signature)

The normalization resolution gives a canonical exact sequence 0→H¹(Γ,Λ)→H¹(Y,Λ)→⊕_v H¹(Ỹ_v,Λ)→0 and H²(Y,Λ)≅⊕_v Λ(−1). Here H¹(Γ,Λ)=coker d, whereas H₁(Γ,Λ)=ker ∂ is its dual lattice realization. No canonical splitting of the H¹ sequence is asserted. Under branch choices, the normalization injection γ′ and the cospecialization map c′ satisfy c′=−γ′.

**Hypotheses.**

- Y proper, connected, nodal and geometric; normalized components smooth proper.

**Proof.**

1. Take the long exact sequence of nr, using finiteness of the node scheme.
2. Identify the graph quotient from nd and component H² by EDC.2 trace.
3. Use sign’s nine-diagram comparison to identify the two graph injections.

**Acceptance.**

- A tree has H¹(Y)=⊕H¹(Ỹ_v); a cycle of rational components has graph H¹ of rank one.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/normalization-etale-resolution`, `LPV.7:semistable-curves/node-residue-variation-sign`; other roadmaps' nodes: `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§2.1–2.4, especially2.3.5 and Lemma2.4: “conoyau” — Illusie91 2.3.1–2.3.5 and 2.6.1–2.6.5 give the normalization H1 extension and dual graph lattices. Characters are H1 of the graph, while the toric cohomology is H^1; R11.4 owns the integral lattice objects.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 2.3.1–2.3.5 and 2.6.1–2.6.5 give the normalization H1 extension and dual graph lattices. Characters are H1 of the graph, while the toric cohomology is H^1; R11.4 owns the integral lattice objects.

### Graph factorization of curve monodromy

`LPV.7:semistable-curves/curve-monodromy-factorization` · comparison · LPV.7 part · Lean `TauCeti.LPV7.curveMonodromyFactorization`

Put V=H¹(X_η̄,ℚ_ℓ), M=H₁(Γ,ℤ) and M∨=H¹(Γ,ℤ). The LPV.1 operator N:V(1)→V factors as c′ ∘ u− ∘ c, where c:V(1)↠M⊗ℚ_ℓ is the specialization quotient, c′:M∨⊗ℚ_ℓ↪V is cospecialization, and u−(a)(b)=−Σ_e n_e a_e b_e. Equivalently N=γ′ ∘ u− ∘ γ, with γ=−c and γ′=−c′. The negative edge form is nondegenerate over ℚ_ℓ; it need not be an integral isomorphism.

**Hypotheses.**

- Proper nodal family of seq, with all positive node thicknesses.
- Rational coefficients; choose a Tate-coordinate only when writing N as an endomorphism.

**Proof.**

1. Factor σ−1 through local variation using LPV.0 and sign.
2. Use seq and the dual sequence to identify the quotient and injection with the imported graph lattices.
3. Sum the local maps and use the positive-definiteness of Σ n_e a_e² over ℚ to show rational nondegeneracy.

**Acceptance.**

- N²=0 and rank N=b₁(Γ).
- For a two-edge cycle the scalar pairing is −2; the integral determinant is not forced to be a unit.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-specialization-sequence`, `LPV.7:semistable-curves/curve-normalization-cohomology`, `LPV.7:semistable-curves/node-residue-variation-sign`; this roadmap's stages: `LPV.1`; other roadmaps' nodes: `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; libraries: `mathlib:LinearMap.ker`, `mathlib:LinearMap.range`, `mathlib:Module.finrank`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§2.1–2.2, formulas2.1.3, 2.2.3;2.6.5–2.7: “négative” — Illusie91 2.2.3 and 2.6.5 factor N through the negative thickness-weighted form on the graph quotient. Positivity/nondegeneracy is used over rational coefficients, yielding N2=0 and rank equal to the graph Betti number, without claiming a torsion-level isomorphism.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 2.2.3 and 2.6.5 factor N through the negative thickness-weighted form on the graph quotient. Positivity/nondegeneracy is used over rational coefficients, yielding N2=0 and rank equal to the graph Betti number, without claiming a torsion-level isomorphism.

**Assembly note.** Its citation of the stage `LPV.1` stands for the twisted logarithm of `LPV.1/finite-monodromy-logarithm`.

### Curve invariant cycles without weights

`LPV.7:semistable-curves/curve-inertia-invariants` · theorem · planet “Curve inertia invariants” · LPV.7 part · Lean `TauCeti.LPV7.curveInertiaInvariants`

For the rational nodal-curve setting, sp:H¹(Y,ℚ_ℓ)→V is injective with image V^I=ker N. In degrees 0 and 2 specialization is surjective onto invariants as well; in degree 2 it is the component-trace sum and is an isomorphism only when there is one geometric component. This result follows from the explicit monodromy calculation and does not import DWP.

**Hypotheses.**

- The proper nodal-family hypotheses and ℓ invertible; N is twist-aware.

**Proof.**

1. From nf, rational injectivity of u− and c′ gives ker N=ker c.
2. Use seq to identify ker c with the special-fibre image.
3. Use ρ(σ)=1+tℓ(σ)N and surjectivity of the tame character to identify ker N with invariants.

**Acceptance.**

- Smooth specialization has N=0 and is an isomorphism in all degrees.
- A two-component rational cycle has invariant H¹ of dimension one and generic H¹ of dimension two.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-monodromy-factorization`, `LPV.7:semistable-curves/curve-specialization-sequence`; this roadmap's stages: `LPV.1`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, Remarques2.8–2.9, printed p.42: “Ker N” — Illusie91 2.2.3, 2.6.5 and 2.8 show ker N equals the specialized H1 and the inertia invariants in the rational unipotent setting. LPV.1 supplies the tame character; fixed cohomology sheaves alone would not prove this.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 2.2.3, 2.6.5 and 2.8 show ker N equals the specialized H1 and the inertia invariants in the rational unipotent setting. LPV.1 supplies the tame character; fixed cohomology sheaves alone would not prove this.

**Assembly note.** Its citation of the stage `LPV.1` stands for ρ(σ) = exp(t_ℓ(σ)N), which for N² = 0 is 1 + t_ℓ(σ)N: `LPV.1/finite-monodromy-logarithm` and `LPV.1/twisted-monodromy-equivariance`.

### Curve monodromy filtration and its graded pieces

`LPV.7:semistable-curves/curve-monodromy-filtration` · theorem · planet “Curve monodromy filtration” · LPV.7 part · Lean `TauCeti.LPV7.curveMonodromyFiltration`

The LPV.1 monodromy filtration of V=H¹(X_η̄,ℚ_ℓ), centered at 1, is M_j=0 for j<0, M_0=im N, M_1=ker N=sp H¹(Y), and M_j=V for j≥2, after the appropriate Tate-coordinate identifications. Canonically gr_0≅H¹(Γ,ℚ_ℓ), gr_1≅⊕H¹(Ỹ_v,ℚ_ℓ), and gr_2≅H₁(Γ,ℚ_ℓ)(−1). N:gr_2→gr_0(−1) is the negative edge-pairing isomorphism in the specified residue coordinates. These indices label monodromy, without asserting Frobenius weights over an arbitrary residue field.

**Hypotheses.**

- Rational coefficients and the curve setting of nf; monodromy-filtration existence/uniqueness imported from LPV.1.

**Proof.**

1. Use N²=0 and the LPV.1 uniqueness characterization.
2. Use ni and nc for gr_1 and the graph subspace.
3. Use seq and nf for gr_2 and the twisted N isomorphism.

**Acceptance.**

- For a smooth curve only gr_1 survives.
- For a cycle of rational components gr_1=0, and gr_0,gr_2 each have dimension one.

**Cited by other roadmaps' packets.** `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-monodromy-factorization`, `LPV.7:semistable-curves/curve-inertia-invariants`, `LPV.7:semistable-curves/curve-normalization-cohomology`; this roadmap's stages: `LPV.1`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, Remarque2.9, printed p.42; formulas2.2.3,2.6.5: “filtration” — Illusie91 Remarque2.9 gives the filtration centered at1. The graph cohomology, component H1 and twisted graph homology are its graded pieces; no Frobenius purity over an arbitrary residue field is asserted.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 Remarque2.9 gives the filtration centered at1. The graph cohomology, component H1 and twisted graph homology are its graded pieces; no Frobenius purity over an arbitrary residue field is asserted.

**Assembly note.** Its citation of the stage `LPV.1` stands for `LPV.1/monodromy-filtration`, whose existence and uniqueness this node applies with centre 1.

### Jacobian and Tate realization of the sequence

`LPV.7:semistable-curves/jacobian-tate-realization` · comparison · LPV.7 part · Lean `TauCeti.LPV7.jacobianTateRealization` (omitted signature)

For a regular projective semistable model X/S of a smooth geometrically connected curve, identify Vℓ(Jac(X_η)) with H¹(X_η̄,ℚ_ℓ)(1). The invariant part identifies with Vℓ(Pic⁰Y), the toric part with H¹(Γ,ℚ_ℓ)(1), and the abelian quotient with ⊕Vℓ(Jac(Ỹ_v)). The torus character lattice is H₁(Γ,ℤ), not H¹. The normalization, specialization and Tate exact sequences commute, with Kummer realization and the canonical principal polarization fixing the identifications.

**Hypotheses.**

- Strictly henselian base with algebraically closed residue field, regular projective semistable model; retain the R11.4 Picard/Néron hypotheses.
- ℓ invertible; rationalize the integral Tate modules only after constructing their maps.

**Proof.**

1. Import R11.4 normalization and Picard/Néron identity, and A3’s Tate pairings.
2. Use Kummer to compare additive normalization with the multiplicative Picard sequence.
3. Apply the residue sign sign and the torsion-compatible specialization maps to identify the filtration.

**Acceptance.**

- The torus rank equals b₁; the abelian rank is twice the sum of normalization genera.
- The diagrams agree as Galois modules, not just dimensions.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-normalization-cohomology`, `LPV.7:semistable-curves/curve-specialization-sequence`, `LPV.7:semistable-curves/curve-monodromy-filtration`; other roadmaps' nodes: `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`, `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`, `NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity`; other roadmaps' stages: `AbelianSchemesAndArithmeticModuli:A3`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§2.3–2.6, formulas2.3.3–2.3.5 and2.6.1–2.6.5: “Tate” — Illusie91 2.3–2.6 supplies the Picard/Tate specialization diagram. The principal polarization/Kummer realization accounts for H1(1), and the torus character lattice remains graph H1, as in accepted R11.4.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 2.3–2.6 supplies the Picard/Tate specialization diagram. The principal polarization/Kummer realization accounts for H1(1), and the torus character lattice remains graph H1, as in accepted R11.4.

### Agreement with the Jacobian valuation pairing

`LPV.7:semistable-curves/curve-jacobian-pairing` · comparison · LPV.7 part · Lean `TauCeti.LPV7.curveJacobianPairing` (omitted signature)

Under jt, the ℓ-adic pairing defined from N by the trace-dual quotient/injection is Illusie’s negative form u−⊗ℚ_ℓ. R11.4’s polarization-normalized integral valuation form u+ has the positive convention Σ a_e b_e on a regular model. Prove u−=−u+ and transport the two connecting-map signs explicitly, rather than asserting the identically named pairings equal. The pairing and factorization are compatible with reorientation and coefficient extension. The thickness-weighted extension uses the supplied regular subdivision comparison.

**Hypotheses.**

- Regular projective semistable curve for direct use of R11.4/graph-monodromy; weighted nonregular models require the extra subdivision contract.

**Proof.**

1. Use Illusie91 Theorem 2.7 for the trace-dual Tate realization.
2. Compare with the precise positive convention of R11.4/integral-monodromy-pairing and /graph-monodromy.
3. Use c′=−γ′ and c=−γ to check the commuting square; record rather than discard the overall pairing convention.

**Acceptance.**

- For a regular two-edge cycle the two pairings are [−2] and [2].
- There is no integral unimodularity claim.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-monodromy-factorization`, `LPV.7:semistable-curves/jacobian-tate-realization`; other roadmaps' nodes: `NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing`, `NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy`; libraries: `mathlib:LinearMap.BilinForm`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, Theorem2.7 and its sign comparison with SGA7 IX9.1.2, printed p.41: “signe opposé” — Illusie91 Theorem2.7 explicitly compares opposite pairing conventions. The packet correctly keeps uMinus=-uPlus and imports the positive integral valuation pairing from R11.4 instead of re-planning it.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 Theorem2.7 explicitly compares opposite pairing conventions. The packet correctly keeps uMinus=-uPlus and imports the positive integral valuation pairing from R11.4 instead of re-planning it.

### Choice and base-change compatibility

`LPV.7:semistable-curves/curve-choice-basechange-compatibility` · theorem · LPV.7 part · Lean `TauCeti.LPV7.curveChoiceBaseChange` (omitted signature)

The curve comparison diagrams descend from strict henselization, are equivariant for residue Galois permutations of components and branches, and commute with coefficient extension. Reorientation acts by signed edge permutations. Replacing a Tate-generator coordinate by a unit rescales log T and the coordinate of tℓ together, leaving the twisted N canonical. Under a finite trait extension of ramification index e, after compatible tame/Tate identification N_new=e N_old. For an old edge of thickness n_e, a regular semistable resolution replaces it by e*n_e unit-thickness edges (e edges when n_e=1); its summed edge pairing gives the same scaling, with exceptional rational components contributing no H¹.

**Hypotheses.**

- Use actual proper base-change maps and chosen trait embeddings; allow regular semistable resolutions only through the StableReduction subdivision supplier.

**Proof.**

1. Use LPV.0 trait base change, LPV.1 tame character compatibility, and signed branch transports.
2. Compare the normalization maps and variation factors before passing to graph quotients.
3. For an original nodal chart uv=π^n_e, ramified base change gives uv=(π_new)^(e*n_e) up to a unit; use the supplied regular resolution and e*n_e-edge subdivision geometry.

**Acceptance.**

- Unramified base change preserves N; ramification e scales it.
- An orientation change conjugates matrices, preserving the underlying map and pairing.
- An edge of original thickness 2 under ramification 3 resolves into6 unit edges; the summed pairing scales the original thickness 2 form by 3.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-monodromy-factorization`, `LPV.7:semistable-curves/curve-jacobian-pairing`; this roadmap, other part: `LPV.0/derived-functorialities-and-specialization-sequence`; this roadmap's stages: `LPV.1`, `LPV.0`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §0 thicknesses and §§1.7,2.1–2.7; compare Illusie21 §4.4: “valuation” — Illusie91 defines thickness as valuation and its local variation is linear in that valuation. Ramification sends n_e to e*n_e. Corrected the requested regular resolution to e*n_e unit edges; e edges applies only when n_e=1. Reorientation and coefficient/Galois transport preserve the intrinsic twisted map.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Illusie91 defines thickness as valuation and its local variation is linear in that valuation. Ramification sends n_e to e*n_e. Corrected the requested regular resolution to e*n_e unit edges; e edges applies only when n_e=1. Reorientation and coefficient/Galois transport preserve the intrinsic twisted map.

**Assembly note.** The stage citations stand for `LPV.0/adic-nearby-cycle-realization` (rational coefficients), `LPV.1/finite-extension-and-logarithm-rescaling` (N′ = eN) and `LPV.1/twisted-monodromy-equivariance` (independence of the Tate generator).

### Smooth, bridge and split-cycle instances

`LPV.7:semistable-curves/smooth-and-split-cycle-examples` · application · LPV.7 part · Lean `TauCeti.LPV7.smoothAndSplitCycleExamples`

Instantiate the constructions on a smooth proper model (N=0), two smooth components meeting in one node (tree, N=0 on global H¹ despite nonzero R¹Φ at that node), and a split strict semistable genus-one model with two rational components meeting in two nodes. In the last case gr_0 and gr_2 have rank one, gr_1=0, and there are compatible rational bases in which N(a,b)=(−2b,0) and ρ(σ)=1+tℓ(σ)N. Prove existence or import an actual algebraic model with this special fibre; an abstract two-dimensional linear map alone is only the algebraic test.

**Hypotheses.**

- An actual proper strict semistable model, ℓ invertible, and branch/Tate conventions as above.
- For the split genus-one instance, import an I₂ regular Tate/elliptic model with split rational components.

**Proof.**

1. Apply seq, nc, nf and mf to the three imported geometric instances.
2. Compute the one-dimensional cycle generator (1,−1) for the two-edge graph and its negative norm −2.
3. Use jt to check the Tate-module interpretation and retain the distinction between the linear test and geometric existence.

**Acceptance.**

- The two-edge N is nonzero over ℚ_ℓ for every ℓ, including ℓ=2.
- The bridge is not mistaken for a nonzero global monodromy contribution.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/curve-inertia-invariants`, `LPV.7:semistable-curves/curve-monodromy-filtration`, `LPV.7:semistable-curves/jacobian-tate-realization`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Illusie91`, §§2.1–2.2, especially2.1.1 and2.1.3; Remarques2.8–2.9: “rang fini” — Illusie91 graph formulas imply the smooth, bridge and split two-edge-cycle calculations; the two-edge negative form gives -2. These are derived examples, not examples explicitly constructed in the source. Existence of an actual proper I2 model remains G-geometric-tests.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Illusie91 graph formulas imply the smooth, bridge and split two-edge-cycle calculations; the two-edge negative form gives -2. These are derived examples, not examples explicitly constructed in the source. Existence of an actual proper I2 model remains G-geometric-tests.

### Strict normal-crossing nearby-cycle stalks

`LPV.7:semistable-curves/snc-nearby-cycle-description` · theorem · planet “Normal-crossing nearby cycles” · LPV.7 part · Lean `TauCeti.LPV7.sncNearbyCycleDescription` (omitted signature)

Let X/S be strictly semistable of pure relative dimension d in Saito’s chart sense: locally étale over Spec R[t₀,…,t_d]/(t₀⋯t_r−π), 0≤r≤d, with smooth irreducible special components. For Λ=ℤ/ℓ^m, ℤ_ℓ or ℚ_ℓ and a geometric point lying on a branches, R^qΨΛ_x≅∧^q(coker(diag:Λ→Λ^a))(−q). This is the stalk form of the Kummer-residue description, with R⁰Ψ=Λ and inertia trivial on all R^qΨ. The residue resolution is canonical before choosing a basis; this theorem does not determine the derived inertia action by its cohomology-sheaf action.

**Hypotheses.**

- Henselian DVR; ℓ invertible; strict semistable charts, not just a divisor called semistable.
- Use the global component ordering only to write alternating residue coordinates.

**Proof.**

1. Use Saito03 Prop 1.1.1 tameness and relative duality, requested in their trait scope.
2. Construct the Kummer classes for the components and the uniformizer.
3. Apply Prop 1.1.2 and Cor 1.1.3 to get the residue resolution; evaluate at a geometric stalk.

**Acceptance.**

- One branch gives R^qΨ=0 for q>0; two branches give one Λ(−1); three give ranks 1,2,1.

**Depends on.** this roadmap, other part: `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; this roadmap's stages: `LPV.1`, `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Saito03`, §1.1, Propositions1.1.1–1.1.2 and Corollary1.1.3: “Kummer” — Saito03 1.1 computes the Kummer-residue exterior stalks in strict multiplicity-one charts and proves trivial inertia on their cohomology sheaves. Illusie21 (2.5) independently gives the exterior formula; split its locator into its own source entry. Relative trait purity remains an explicit EDC extension/gap.
- `Illusie21`, §2.2, formula(2.5), reduced multiplicity-one case; §6.3: “normal crossings” — Illusie21 gives an exterior stalk calculation and, in6.3, trivial inertia in the semistable case. Its formula uses the kernel lattice C=ker(sum:Z^a→Z); it corroborates rank and vanishing, not a canonical integral identification of that kernel with the diagonal quotient. The canonical Kummer quotient and residue resolution asserted by this node follow Saito03 Proposition1.1.2 and Corollary1.1.3.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Saito03 1.1 computes the Kummer-residue exterior stalks in strict multiplicity-one charts and proves trivial inertia on their cohomology sheaves. Illusie21 (2.5) independently gives the exterior formula; split its locator into its own source entry. Relative trait purity remains an explicit EDC extension/gap. Illusie21 uses a kernel-lattice presentation; only rank/vanishing and semistable inertia are corroborated by that citation. The canonical diagonal quotient follows Saito, without identifying the two integral branch lattices.

**Assembly note.** Its citation of the stage `LPV.0` stands for `LPV.0/adic-nearby-cycle-realization`. Its citation of the stage `LPV.1` stands for the tame inertia action on the nearby cycles of a strictly semistable chart (Saito 2003 Proposition 1.1.1); no LPV.1 node states it for these charts, and LPV.1's tame character comes from R01.2.

### Graded nearby complex for strict semistability

`LPV.7:semistable-curves/snc-graded-nearby-complex` · comparison · LPV.7 part · Lean `TauCeti.LPV7.sncGradedNearbyComplex` (omitted signature)

Let a_j:Y^(j)→Y be the disjoint union of (j+1)-fold component intersections (Y^(0) denotes components). For ℚ_ℓ coefficients, the LPV.1 monodromy filtration centered at 0 on the shifted-perverse nearby complex has gr_r RΨℚ_ℓ≅⊕_{p,q≥0,p−q=r} a_{p+q,*}ℚ_ℓ(−p)[−p−q]. N lowers r by 2 and sends the (p,q) summand identically to the (p−1,q+1) summand after a (−1) twist when p≥1, and to zero otherwise. This comparison supplies a concrete model; it neither constructs a second general monodromy filtration nor imports weight theorems.

**Hypotheses.**

- Strict semistability of sn; ℚ_ℓ coefficients.
- The perverse interpretation RΨℚ_ℓ[d] and its constructibility must be justified in this trait setting.

**Proof.**

1. Follow Saito03 Lemma 2.2.1 and Cor 2.2.2: kernel filtration is canonical truncation and image filtration is identified through residues.
2. Use the LPV.1 convolution characterization to obtain gr_r.
3. Check generator independence and identify log(T) on the graded with the leading T−1 map.

**Acceptance.**

- For two components, gr₁=ℚ_ℓ_C(−1)[−1], gr₀=ℚ_ℓ_D1⊕ℚ_ℓ_D2, gr₋₁=ℚ_ℓ_C[−1].
- Trivial action on R^qΨ does not replace the nonzero derived N.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/snc-nearby-cycle-description`; this roadmap's stages: `LPV.1`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.5`; libraries: `mathlib:DerivedCategory`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Saito03`, Lemma2.2.1, Corollary2.2.2, Proposition2.2.3 (author numbering): “perverse” — Saito03 Lemma2.2.1 through Proposition2.2.3 gives the shifted-perverse monodromy grading and the identity maps between shared stratum summands. Illusie21 (6.3)–(6.4) confirms the shifts/twists; split its citation from Saito. LPV.1 owns the general filtration.
- `Illusie21`, §6.3, formulas(6.3)–(6.4): “associated graded object” — Saito03 Lemma2.2.1 through Proposition2.2.3 gives the shifted-perverse monodromy grading and the identity maps between shared stratum summands. Illusie21 (6.3)–(6.4) confirms the shifts/twists; split its citation from Saito. LPV.1 owns the general filtration.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Saito03 Lemma2.2.1 through Proposition2.2.3 gives the shifted-perverse monodromy grading and the identity maps between shared stratum summands. Illusie21 (6.3)–(6.4) confirms the shifts/twists; split its citation from Saito. LPV.1 owns the general filtration.

**Assembly note.** Its citation of the stage `LPV.1` stands for the kernel-image convolution filtration of a nilpotent endomorphism of an object of an abelian category (Saito 2003 §2.1). LPV.1 plans the monodromy filtration only on finite-dimensional vector spaces (`LPV.1/monodromy-filtration`), so this is planned by no node; the request to LPV.1 records it. Its two-component case is `LPV.1/two-component-semistable-nearby-complex`, which it should cite.

### Strict semistable weight spectral sequence

`LPV.7:semistable-curves/snc-weight-spectral-sequence` · construction · planet “Weight spectral sequence” · LPV.7 part · Lean `TauCeti.LPV7.weightSpectralSequence`

From the finite filtered nearby complex construct the cohomological spectral sequence E₁^{p,q}=⊕_{i≥max(0,−p)} H^{q−2i}(Ȳ^(p+2i),ℚ_ℓ(−i))⇒H^{p+q}(X_η̄,ℚ_ℓ), with d_r of bidegree(r,1−r). Empty/negative-index strata contribute zero, so the displayed sum is finite. Properness is used to identify RΓ(Ȳ,RΨℚ_ℓ) with generic cohomology. Without properness the same filtered-complex construction abuts to H^{p+q}(Ȳ,RΨℚ_ℓ), without asserting that it is H^{p+q}(X_η̄,ℚ_ℓ). The induced filtration on H^m is M′, with the weight indexing W_sH^m=M′_{s−m}; equality with the canonical monodromy filtration on H^m is a separate theorem.

**Hypotheses.**

- Strict semistability of sn; finite-dimensional constructible cohomology; proper X for the generic-fibre abutment.
- Coefficients ℚ_ℓ; no Frobenius-weight or degeneration premise in this construction.

**Construction.**

1. Apply Mathlib’s spectral-object spectral-sequence machinery to the finite filtration in sg; request the étale hypercohomology bridge rather than redefine spectral sequences.
2. Compute E₁ by sg and proper pushforward from strata.
3. Prove convergence from bounded filtration and proper base change, identifying its actual abutment and filtration maps. Use the finite column bound [-d,d] to identify page 2*d+2 with the graded abutment without any E2-degeneration assumption.

**API.**

- `TauCeti.LPV7.weightSpectralSequence_e1` (data): The first page is canonically isomorphic to the displayed finite sum of twisted stratum cohomology.
- `TauCeti.LPV7.weightSpectralSequence_e2` (compatibility): The second page is the homology of the actual first-page differential, through Mathlib’s spectral-sequence iso.
- `TauCeti.LPV7.weightSpectralSequence_abutment` (characterisation): For proper X the finite filtration converges to generic-fibre cohomology with induced filtration M′ and actual comparison maps. Relative dimension d bounds columns by [-d,d], so page 2*d+2 is stabilized and identifies with the graded abutment. Earlier stabilization requires a separate degeneration proof.
- `TauCeti.LPV7.weightSpectralSequence_reindex` (functoriality): A signed permutation of component indices induces an isomorphism of spectral sequences compatible with stratum maps and N.

**Unit tests.**

- `TauCeti.LPV7.weight_ss_smooth_test` (degenerate): With one smooth component, E₁^{0,q}=H^q(Y,ℚ_ℓ), and E₁^{p,q}=0 for p≠0.
- `TauCeti.LPV7.weight_ss_curve_test` (computation): For relative dimension 1, E₁^{−1,2}=H⁰(nodes,ℚ_ℓ)(−1), E₁^{0,1}=⊕H¹(components,ℚ_ℓ), E₁^{1,0}=H⁰(nodes,ℚ_ℓ); d₁ also includes components→nodes and nodes→H²(components).
- `TauCeti.LPV7.weight_ss_nonproper_test` (non-example): For the local model uv=π the construction abuts to H*(Ȳ,RΨ), and the signature contains no unsupported proper-base-change isomorphism to generic H*. With relative-dimension column bound [-d,d], use the stabilized page 2*d+2.

**Acceptance.**

- A smooth model has only p=0 terms.
- For curves the page has the normalization restriction and node Gysin maps of seq and nc.
- Nonproperness does not erase the spectral sequence but changes the justified abutment.

**Used by.**

- LTXZZ22 §5.9 Construction 5.9.1 and Lemma 5.9.3: Supplies stratum maps and the T−1 action; arithmetic localizations and their degeneration belong to the consumer.
- DWP.10; WeightsInEtaleCohomology:R34.3: Exports a filtered geometric calculation with degeneration and weight-monodromy obligations kept distinct.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/snc-graded-nearby-complex`; this roadmap, other part: `LPV.0/derived-functorialities-and-specialization-sequence`; this roadmap's stages: `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`; libraries: `mathlib:CategoryTheory.CohomologicalSpectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`, `mathlib:ModuleCat`, `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore`, `mathlib:CategoryTheory.Abelian.SpectralObject.HasSpectralSequence`, `mathlib:CategoryTheory.Limits.IsZero`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Saito03`, Corollary2.2.4 and proof (author numbering; published Corollary2.8): “spectral sequence” — Saito03 Corollary2.2.4 constructs the E1 page and distinguishes proper generic-fibre cohomology from nearby hypercohomology. LTXZZ22 5.9 actually uses its nonproper form. Corrected the suggested convergence page to 2*d+2 under the column bound [-d,d], with no assumed E2 degeneration.
- `LTXZZ22`, §5.9, Construction5.9.1, printed p.231, and Lemma5.9.3 proof, printed pp.233–240: “weight spectral” — Construction5.9.1 is the downstream use of the stratum spectral sequence; Lemma5.9.3 explicitly uses Saito Corollary2.8(2) without properness. The arithmetic localizations and special computations remain owned by the consumer.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Saito03 Corollary2.2.4 constructs the E1 page and distinguishes proper generic-fibre cohomology from nearby hypercohomology. LTXZZ22 5.9 actually uses its nonproper form. Corrected the suggested convergence page to 2*d+2 under the column bound [-d,d], with no assumed E2 degeneration.

**Assembly note.** Its citation of the stage `LPV.0` stands for `LPV.0/adic-nearby-cycle-realization`.

### Restriction and Gysin differential

`LPV.7:semistable-curves/snc-restriction-gysin-differential` · theorem · LPV.7 part · Lean `TauCeti.LPV7.weightSpectralSequenceDifferential`

Order the special components. For J=I\{i_j}, use sign (−1)^j; let δ* be the alternating restriction maps from (r+1)-fold to (r+2)-fold intersections and δ_* the alternating Gysin maps in the reverse direction, of cohomological degree 2 and twist(1). In Saito’s convention d₁ is δ*+δ_* on the corresponding E₁ summands. Their squares vanish and their mixed compositions anticommute by divisor/intersection compatibility. A transpose to Rapoport–Zink coordinates uses the signed conjugation (−1)^{ij}, not an unqualified assertion of identical matrices.

**Hypotheses.**

- Strict semistable strata; Gysin maps between smooth strata with their codimension and purity hypotheses.
- Actual coefficient twists and component ordering, not abstract arrows called Gysin.

**Proof.**

1. Import EDC.3 transverse restriction/Gysin, self-intersection and projection formulas.
2. Identify boundary maps in Saito03 Lemma 2.2.5 and Proposition 2.2.6 via the residue classes.
3. Compute the total-complex signs and compare the manuscript’s final paragraph with Rapoport–Zink indexing.

**Acceptance.**

- For curves the maps agree with the incidence maps used in seq, after its explicitly specified residue coordinates.
- For three intersecting components, the alternating second boundary vanishes.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LPV.7:semistable-curves/snc-nearby-cycle-description`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.3`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Saito03`, Lemma2.2.5 and Proposition2.2.6, author pp.21–26, including final sign comparison: “Gysin” — Saito03 Lemma2.2.5 and Proposition2.2.6 give alternating restriction plus Gysin, square-zero identities and the signed comparison with Rapoport–Zink. Keep the source convention rather than identifying matrices without conjugation.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: Saito03 Lemma2.2.5 and Proposition2.2.6 give alternating restriction plus Gysin, square-zero identities and the signed comparison with Rapoport–Zink. Keep the source convention rather than identifying matrices without conjugation.

### Monodromy on the spectral sequence and curve agreement

`LPV.7:semistable-curves/snc-monodromy-and-curve-comparison` · comparison · LPV.7 part · Lean `TauCeti.LPV7.spectralMonodromyCurveComparison` (omitted signature)

The twisted N map induces E₁^{p,q}(1)→E₁^{p+2,q−2}. On common stratum summands it is the identity in the normalized graded coordinates of sg, and is zero on absent summands. It commutes with d₁ and persists to the abutment. For curves, finite page positions force E₂=E∞ and the induced filtration, recentered at 1, agrees with mf; the identification of its N with nf includes the residue-coordinate sign. In higher dimensions no equality between M′ on cohomology and its canonical monodromy filtration is inferred merely from existence of the sequence or an E₂ degeneration input.

**Hypotheses.**

- Rational coefficients, strict semistability; properness for generic cohomology.
- The integral statement in the source is for ν=T−1; log(T) is not defined by an integral series in general.

**Proof.**

1. Use Saito03 Cor 2.2.4(2) and sg to compute N on each common summand.
2. Check compatibility with sd through the filtered morphism.
3. For curves compute E₂ kernels/cokernels, observe the remaining d_r have zero targets for r≥2, and compare their edge pairing to nf.

**Acceptance.**

- The curve E₂ pieces are graph cohomology, component H¹ and graph homology with the stated twist.
- The rational logarithm and T−1 have the same leading action on gr, without claiming they are equal on every higher-dimensional complex.

**Depends on.** this roadmap, same part: `LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LPV.7:semistable-curves/snc-restriction-gysin-differential`, `LPV.7:semistable-curves/curve-monodromy-filtration`, `LPV.7:semistable-curves/curve-monodromy-factorization`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/Semistable`, namespace `TauCeti.LPV7`.

**Sources.**

- `Saito03`, Corollary2.2.4(2), author pp.19–20: “filtration” — Saito03 Corollary2.2.4(2) gives the page monodromy map and Illusie21 6.3–6.4 distinguishes degeneration from monodromy-filtration equality. Curves have no possible higher differentials by their page support; the negative residue coordinates are retained. Split the Illusie citation into its own entry.
- `LTXZZ22`, §5.9, monodromy-filtration discussion preceding Lemma5.9.3, printed p.233: “monodromy filtration” — This consumer tracks the filtration on nearby cohomology and its induced Galois-cohomology filtration; its localized degeneration and concentration arguments are not asserted as geometric generalities here.
- `Illusie21`, §§6.3–6.4, monodromy action and degeneration versus weight-monodromy: “monodromy” — Saito03 Corollary2.2.4(2) gives the page monodromy map and Illusie21 6.3–6.4 distinguishes degeneration from monodromy-filtration equality. Curves have no possible higher differentials by their page support; the negative residue coordinates are retained. Split the Illusie citation into its own entry.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: Saito03 Corollary2.2.4(2) gives the page monodromy map and Illusie21 6.3–6.4 distinguishes degeneration from monodromy-filtration equality. Curves have no possible higher differentials by their page support; the negative residue coordinates are retained. Split the Illusie citation into its own entry.

## LPV.7:invariant-cycles — Local and global invariant cycles

This sub-layer proves Deligne's invariant-cycle theorems before hard Lefschetz, which DWP.9 then deduces from them. Specialization is corestricted to the inertia invariants without any surjectivity claim (`invariant-specialization`). Over S = Spec(k[T]^h_(T)) with k algebraically closed, arithmetic spreading descends a family to a finite field while preserving the image of inertia; the continuous Wang sequence and the localization-duality cross place H^i(X_s) and the invariants H^i(X_η̄)^I in one diagram whose weights are separated: at most i on the invariants, at least i + 1 on the support term. That gives the local invariant-cycle theorem 3.6.1 for X essentially smooth with smooth generic fibre (planet "Local invariant cycles"), and its complex form 3.6.4 (planet "Complex invariant cycles"), which still needs the geometric mixed Hodge structures (G-complex-mhs).

The second half follows Weil II §6.2. Potentially pure complexes carry explicit arithmetic models (`geometric-generic-pure-model`, `potentially-pure-model`, planet "Potentially pure complexes"); a sufficiently general incidence pencil preserves potential purity; the local theorem holds for potentially pure complexes with no smoothness hypothesis (6.2.9, planet "Pure-complex invariant cycles"); affine vanishing from the dual-support bound gives support-bound weak Lefschetz (6.2.11(i), planet "Support-bound weak Lefschetz"); the pencil obstruction and image equality give 6.2.11(ii) without Leray degeneration; and general-pencil monodromy completes the global invariant-cycle theorem 6.2.12 (planet "Global invariant cycles"). Its inputs from LPV.3–LPV.5 must hold for arbitrary constructible complexes, which those layers' constant-coefficient nodes do not yet state (G-complex-pencil, and the requests to LPV.3, LPV.4 and LPV.5).

**Coverage.** `planned`. Remaining:
- Certify constructible-complex incidence/pencil contracts (G-complex-pencil).
- Extract the geometric mixed-Hodge proof for the complex specialization target (G-complex-mhs).
- Supply omitted geometric premises and arithmetic-model conditions before strengthening Lean signatures (G-suggested-premises).

### Specialization with invariant codomain

`LPV.7:invariant-cycles/invariant-specialization` · construction · LPV.7 part · Lean `TauCeti.LPV7.invariantSpecialization`

For f:X→S proper over a henselian trait and K∈Dᵇ_c(X,ℚ_ℓ), the LPV.0 specialization map sp_i:H^i(X_s̄,K)→H^i(X_η̄,K) has inertia-fixed image. Construct sp_i^I by corestriction to the actual invariant submodule of the continuous inertia representation; its composite with the inclusion is sp_i. The map is constructed for every proper family; surjectivity requires one of the source-qualified theorems below.

**Hypotheses.**

- ℓ invertible; geometric fibre identifications and continuous coefficient realization supplied by LPV.0, EDC.0 and R02.1.

**Construction.**

1. Use the trivial inertia action on i*K and equivariance of the vanishing triangle.
2. Apply Representation.invariants and LinearMap.codRestrict, not a new fixed-space predicate.
3. Transport the corestriction along compatible proper/trait base-change comparisons.

**API.**

- `TauCeti.LPV7.invariantSpecialization_coe` (projection): The inclusion of invariants composed with sp^I equals sp.
- `TauCeti.LPV7.invariantSpecialization_range` (characterisation): sp^I is surjective exactly when range sp equals the invariant submodule.
- `TauCeti.LPV7.invariantSpecialization_unique` (extensionality): A linear map to invariants whose composite with inclusion is sp equals sp^I.
- `TauCeti.LPV7.invariantSpecialization_natural` (functoriality): For equivariant cohomology comparison maps commuting with sp, the corestricted maps commute too.

**Unit tests.**

- `TauCeti.LPV7.invariant_sp_identity_test` (degenerate): For the identity map and trivial action, the corestriction is surjective.
- `TauCeti.LPV7.invariant_sp_zero_test` (non-example): The zero map to a nonzero trivially acted-on one-dimensional space corestricts but is not surjective.
- `TauCeti.LPV7.invariant_sp_unipotent_test` (computation): On ℚ² with ρ(t)(a,b)=(a+tb,b), the injection a↦(a,0) corestricts surjectively to invariants; the full identity ℚ²→ℚ² has no fixed-image witness.

**Acceptance.**

- The underlying map is exactly sp_i.
- There is no surjectivity assertion in this construction.

**Used by.**

- Weil II Theorems 3.6.1 and 6.2.9: Gives the actual map whose surjectivity is proved by the weight cross.
- DWP.9, Weil II 6.2.13: Ensures the global theorem exports the invariant subspace as a linear-map image, not merely equality of dimensions.

**Depends on.** this roadmap, other part: `LPV.0/derived-functorialities-and-specialization-sequence`; this roadmap's stages: `LPV.0`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`, `ArithmeticGaloisDuality:R02.1`; libraries: `mathlib:Representation.invariants`, `mathlib:Representation.mem_invariants`, `mathlib:LinearMap.codRestrict`, `mathlib:Representation.trivial`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Introduction to §3.6, printed p.212; specialization in6.2.9: “invariants” — WeilII 3.6 and 6.2.9 construct specialization into actual inertia invariants. The corestriction API and tests distinguish fixed image from surjectivity, which is reserved for later source-qualified theorems.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 3.6 and 6.2.9 construct specialization into actual inertia invariants. The corestriction API and tests distinguish fixed image from surjectivity, which is reserved for later source-qualified theorems.

**Assembly note.** Its citation of the stage `LPV.0` stands for `LPV.0/adic-nearby-cycle-realization`, the rational realization of the specialization map of `LPV.0/derived-functorialities-and-specialization-sequence`.

### Arithmetic spreading with inertia-image control

`LPV.7:invariant-cycles/arithmetic-spreading` · lemma · LPV.7 part · Lean `TauCeti.LPV7.arithmeticSpreading` (omitted signature)

For k algebraically closed, S=Spec(k[T]^h_(T)), f:X→S proper, X essentially smooth over k and X_η smooth, spread to f′:X′→C with C a smooth k-curve, X′ smooth, and f′ smooth off the marked point. Then descend after shrinking an integral finite-type arithmetic parameter base to a finite-field fibre, preserving the specialization cohomology maps and the image of local inertia in the relevant ℓ-adic local system. One must preserve inertia-fixed subspaces, not only Betti numbers; use Weil II 1.11.1–1.11.3’s tame-cover specialization on a sufficiently small parameter open.

**Hypotheses.**

- Finite-presentation descent with a marked smooth curve section and compatible coefficient systems; ℓ invertible.
- Use the prime-to-residue-characteristic/tame tower and any required finite extension explicitly.

**Proof.**

1. Apply limit descent to algebraize the henselian family with its marked point.
2. Use the tame compactification tower and stabilizers of lifted boundary sections in 1.11.3.
3. Apply proper/smooth base change to the family of cohomology maps and preserve the local monodromy image while choosing a closed finite-field parameter.

**Acceptance.**

- The comparison identifies invariants and specialization image; mere equality of ranks is insufficient.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/invariant-specialization`; this roadmap's stages: `LPV.5`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`, `ArithmeticGaloisDuality:R02.1`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proof3.6.1, printed p.213, referring to1.11.3; read1.11.1–1.11.3: “arithmétique” — WeilII proof3.6.1 invokes the tame-cover spreading result1.11.3 to preserve the inertia image after arithmetic descent. The packet requests the full representation-image statement, not just unchanged cohomology dimensions.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII proof3.6.1 invokes the tame-cover spreading result1.11.3 to preserve the inertia image after arithmetic descent. The packet requests the full representation-image statement, not just unchanged cohomology dimensions.

**Assembly note.** Its citation of the stage `LPV.5` stands for tame-cover specialization preserving the full image of local inertia (Weil II 1.11.3). The nearest LPV.0-part node, `LPV.5/bertini-surjectivity-on-fundamental-groups`, uses SGA 1 tame specialization for a fixed local system on the complement of the dual variety; the general statement is the LPV.7 part's request to LPV.5.

### Continuous Wang sequence over the trait

`LPV.7:invariant-cycles/continuous-wang-sequence` · theorem · LPV.7 part · Lean `TauCeti.LPV7.continuousWangSequence` (omitted signature)

For f:X→S proper in the strict henselian equicharacteristic trait setting and K∈Dᵇ_c(X,ℚ_ℓ) (or finite rational ℓ-adic coefficient extension), continuous Hochschild–Serre gives 0→H^{i−1}(X_η̄,K)_I(−1)→H^i(X_η,K)→H^i(X_η̄,K)^I→0. This is the row used for constant coefficients in 3.6.1 and for general K in 6.2.9; no total-space or generic-fibre smoothness is needed for this row. Its finite-level derivation uses 1→I′→I→ℤ_ℓ(1)→1, exact averaging for the pro-prime-to-ℓ kernel, and putting W=V^{I′}≅V_{I′}, H⁰(ℤ_ℓ(1),W)=V^I, H¹(ℤ_ℓ(1),W)=V_I(−1), H^j=0 for j≥2. Prove the inverse-limit/rationalization comparisons under the source’s finite constructibility hypotheses; Mathlib’s discrete group cohomology is not by itself this continuous theorem.

**Hypotheses.**

- Bounded constructible rational ℓ-adic K, continuous finite-dimensional geometric hypercohomology, and compatible finite-level ℓ-power torsion systems over the strict henselian trait.

**Proof.**

1. Import R02.2 continuous Hochschild–Serre and R02.1 inverse-limit exactness.
2. Average the finite prime-to-ℓ quotients and pass to continuous invariants.
3. Use the two-column spectral sequence to obtain the exact edge sequence with Tate twist.

**Acceptance.**

- For trivial rank-one coefficients, H¹(I,ℚ_ℓ)=ℚ_ℓ(−1).
- The degree-two term vanishes without treating ℤ_ℓ as a discrete infinite cyclic group.

**Depends on.** this roadmap, other part: `LPV.0/henselian-trait-conventions-and-galois-sheaves`; this roadmap's stages: `LPV.0`; other roadmaps' stages: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proof3.6.1, equations(1)–(5), printed p.213; proof6.2.9, generalized Wang row, printed p.249: “Wang” — WeilII proof3.6.1 gives the continuous Wang row, and proof6.2.9 uses the same row for bounded constructible K. Expanded the node to this coefficient generality without total-space smoothness and added EDC.0. R02.1/2 must supply inverse-limit exactness and continuous Hochschild–Serre; discrete group cohomology is insufficient.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: WeilII proof3.6.1 gives the continuous Wang row, and proof6.2.9 uses the same row for bounded constructible K. Expanded the node to this coefficient generality without total-space smoothness and added EDC.0. R02.1/2 must supply inverse-limit exactness and continuous Hochschild–Serre; discrete group cohomology is insufficient.

**Assembly note.** Its citation of the stage `LPV.0` stands for `LPV.0/adic-nearby-cycle-realization`.

### Localization and Wang duality cross

`LPV.7:invariant-cycles/localization-duality-cross` · comparison · LPV.7 part · Lean `TauCeti.LPV7.localizationDualityCross` (omitted signature)

If X is essentially smooth over k of pure dimension d, combine Wang’s short exact sequence with localization H^i(X)→H^i(X_η)→H^{i+1}_{X_s}(X), proper base change H^i(X)≅H^i(X_s), and support duality H^{i+1}_{X_s}(X)≅H^{2d−i−1}(X_s)^∨(−d). The resulting exact cross has middle H^i(X_η), lower H^i(X_s), upper this support group and right H^i(X_η̄)^I. This rational cross is Galois/Frobenius equivariant after arithmetic descent; no torsion-free integral duality is silently assumed.

**Hypotheses.**

- X essentially smooth and proper over the trait, dimension handled componentwise; rational ℓ-adic coefficients.

**Proof.**

1. Use EDC.0 localization, EDC.1 Verdier duality and the smooth dualizing formula.
2. Use proper base change and the étale comparison with X′ to identify the support group.
3. Combine with wang and isp, retaining all maps and arithmetic actions.

**Acceptance.**

- The upper twist is −d and its cohomological degree is 2d−i−1.
- Integral torsion is explicitly excluded from this dual-vector-space identification.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/continuous-wang-sequence`, `LPV.7:invariant-cycles/invariant-specialization`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proof3.6.1, equations(6)–(8), printed p.214: “dualité” — WeilII proof3.6.1 (6)–(8) gives the localization/Wang cross, proper base change and dual support group with dimension d and twist -d. The smooth-total-space hypothesis belongs to this constant-coefficient duality calculation.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII proof3.6.1 (6)–(8) gives the localization/Wang cross, proper base change and dual support group with dimension d and twist -d. The smooth-total-space hypothesis belongs to this constant-coefficient duality calculation.

### Weights in the invariant-cycle cross

`LPV.7:invariant-cycles/invariant-and-support-weight-bounds` · lemma · LPV.7 part · Lean `TauCeti.LPV7.invariantSupportWeightBounds` (omitted signature)

After the finite-field descent, B=H^i(X_η̄,ℚ_ℓ)^I is mixed of weights≤i, while C=H^{2d−i−1}(X_s,ℚ_ℓ)^∨(−d) is mixed of weights≥i+1. The first bound uses punctual purity of R^if_* on the smooth locus and the local estimate Weil II 1.8.8(i); the second uses the proper special-fibre upper weight bound 3.3.4, duality and twist. Exactness of W_i on mixed Frobenius modules turns the cross into a lift from H^i(X_s) onto B.

**Hypotheses.**

- Finite-field model of spread and rational coefficients; no hard Lefschetz or decomposition input.

**Proof.**

1. Import DWP.7 proper smooth purity and cohomological upper bounds.
2. Request DWP.5’s precise local inertia-invariant estimate1.8.8(i).
3. Use the exact weight filtration of DWP.8: W_i C=0 and W_i B=B, so the cross forces the right-hand map to factor through the lower image.

**Acceptance.**

- The strict separation i versus i+1 is retained; mixedness alone is insufficient.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/localization-duality-cross`; other roadmaps' nodes: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`; other roadmaps' stages: `DeligneWeightsAndPurity:DWP.5`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Lemmas3.6.2–3.6.3 and final exact W_i diagram, printed p.214: “exact” — WeilII Lemmas3.6.2–3.6.3 give invariant weights at most i and support weights at least i+1; exact W_i lifts classes through the cross. The requested DWP inputs precede hard Lefschetz and do not create a circular proof.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII Lemmas3.6.2–3.6.3 give invariant weights at most i and support weights at least i+1; exact W_i lifts classes through the cross. The requested DWP inputs precede hard Lefschetz and do not create a circular proof.

### Local invariant-cycle theorem

`LPV.7:invariant-cycles/local-invariant-cycles` · theorem · planet “Local invariant cycles” · LPV.7 part · Lean `TauCeti.LPV7.localInvariantCycles` (omitted signature)

Let k be algebraically closed with ℓ invertible, S=Spec(k[T]^h_(T)), and f:X→S proper. If X is essentially smooth over k and X_η is smooth, then for every i the specialization H^i(X_s,ℚ_ℓ)→H^i(X_η̄,ℚ_ℓ)^I is surjective. This is Deligne II 3.6.1 in its equicharacteristic, algebraizable trait scope, not an assertion for every degeneration over a mixed-characteristic DVR or for integral coefficients.

**Hypotheses.**

- All stated properness, total-space essential smoothness, generic-fibre smoothness and trait hypotheses.

**Proof.**

1. Reduce via spread, then apply cross and wb over the finite-field model.
2. Apply exact W_i to eliminate the upper support obstruction.
3. Transport surjectivity back through the preserved cohomology/inertia-image identifications.

**Acceptance.**

- A smooth proper family specializes isomorphically.
- A split nodal curve agrees with the independent curve calculation.
- An arbitrary mixed-characteristic trait is not an admissible instance of this statement.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/arithmetic-spreading`, `LPV.7:invariant-cycles/invariant-and-support-weight-bounds`, `LPV.7:invariant-cycles/invariant-specialization`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Theorem3.6.1 and proof, printed pp.213–214: “surjectif” — WeilII Theorem3.6.1 proves the stated algebraizable equicharacteristic rational theorem. The packet retains essentially smooth total space and smooth generic fibre and does not promote it to arbitrary traits or integral coefficients.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII Theorem3.6.1 proves the stated algebraizable equicharacteristic rational theorem. The packet retains essentially smooth total space and smooth generic fibre and does not promote it to arbitrary traits or integral coefficients.

### Complex local invariant-cycle theorem

`LPV.7:invariant-cycles/complex-local-invariant-cycles` · theorem · planet “Complex invariant cycles” · LPV.7 part · Lean `TauCeti.LPV7.complexLocalInvariantCycles` (omitted signature)

Let D⊂ℂ be the unit disk, f:X→D proper, X smooth and f smooth over D*=D\{0}. Use a relative projective closed embedding X↪P^N(ℂ)×D whose projection is f, an unambiguous sufficient form of the factorization in Deligne3.6.4. For t∈D*, H^i(X₀,ℚ)→H^i(X_t,ℚ)^{π₁(D*,t)} is surjective. A mixed-Hodge version of the same localization/Wang cross proves this using exactness of the weight filtration. The geometric mixed-Hodge structures and their compatibility with the cross are a recorded source/proof gap, not supplied merely by the linear-algebraic HodgeStructures roadmap.

**Hypotheses.**

- Proper smooth total complex manifold with the specified relative projective closed embedding; smoothness over the punctured disk.
- Rational singular/Betti cohomology, not ℓ-adic arithmetic coefficients.

**Proof.**

1. Use the Betti localization and topological Wang comparison for the disk family.
2. Supply the geometric mixed-Hodge structures on invariants and support cohomology with bounds≤i and≥i+1, and all maps as MHS morphisms (G-complex-mhs).
3. Apply the imported HodgeStructures L2 strictness to the cross, giving exact W_i and surjectivity.

**Acceptance.**

- The trivial projective family has identity specialization.
- The source’s factorization and rational coefficients are visible in the theorem.

**Depends on.** other roadmaps' stages: `ComplexComparisonPartII:C5`; Tau Ceti roadmaps: `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, §3.6.4, printed p.215, citing Steenbrink’s Oslo vanishing-cohomology work: “Hodge” — The source gives surjectivity for a proper smooth-total-space disk family and says f factors through the projective projection. This packet uses a relative projective closed embedding as a sufficient explicit form, leaving a broader analytic interpretation unclaimed; the complete geometric MHS proof is recorded as a gap.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 3.6.4 supplies the complex local theorem. The relative projective embedding is a sufficient explicit factorization hypothesis. HodgeStructures L2 supplies abstract strictness only; the geometric support/nearby MHS proof is honestly left in G-complex-mhs and routed to a Part II.

### Arithmetic pure model at a geometric generic point

`LPV.7:invariant-cycles/geometric-generic-pure-model` · definition · LPV.7 part · Lean `TauCeti.LPV7.GeometricGenericPureModel`

For a projective k-scheme X, k algebraically closed, and K∈Dᵇ_c(X,ℚ̄_ℓ), retain the absolute arithmetic model data used before applying6.2.8 to the incidence pencil: an integral finite-type ℤ[1/ℓ]-scheme A₀, a geometric generic point Spec k→A₀, a proper X₀→A₀, an arithmetic pure complex K₀ of weight w on X₀, and compatible base-change identifications X≅X₀×A₀Spec k and K≅pullback K₀. GeometricGenericPureModel stores this data. It imports arithmetic purity from DWP.8; it does not redefine purity. A sufficiently general incidence-line pullback turns this absolute witness into the local curve/section PotentiallyPureModel.

**Hypotheses.**

- X projective over algebraically closed k; ℓ invertible; actual model schemes and constructible pullback functors.
- The pure-model convention is 6.2.7. The local trait model is a distinct witness, not inferred from a pointwise weight label.

**Construction.**

1. Retain the arithmetic base, generic point, proper family and pure complex of 6.2.8(a),(c),(d) before making the smooth-curve base of(b).
2. Expose the geometric base-change square and complex realization, importing proper model spreading from EDC.0.
3. Use generic incidence duality in the pullback lemma to produce the smooth-curve/section local witnesses at singular pencil parameters.

**API.**

- `TauCeti.LPV7.GeometricGenericPureModel.base` (projection): Return the arithmetic base scheme A₀. The point, genericity proof and arithmetic structure map are separate structure projections.
- `TauCeti.LPV7.GeometricGenericPureModel.family` (projection): Return the model scheme X₀; familyMap, proper, K0 and weight are separate projections.
- `TauCeti.LPV7.GeometricGenericPureModel.realization` (data): Return the supplied complex pullback isomorphism pullback(K₀)≅K. The family base-change square is a separate structure projection; the geometric étale interpretation remains in G-suggested-premises.
- `TauCeti.LPV7.GeometricGenericPureModel.transport` (compatibility): Transport a witness along compatible isomorphisms of the projective k-scheme and complex, preserving its arithmetic model and weight.
- `TauCeti.LPV7.GeometricGenericPureModel.mk` (constructor): Construct the witness from all its arithmetic scheme maps, actual generic-point/proper predicates, Cartesian family square and complex realization data. The suggested form omits arithmetic purity until the owner interfaces exist.
- `TauCeti.LPV7.GeometricGenericPureModel.ext` (extensionality): Two witnesses are equal when all their scheme, map, complex, weight, functor and realization data are equal (heterogeneous equality where needed). Proof fields are proof-irrelevant; model schemes and complex isomorphisms are data and are retained.

**Unit tests.**

- `TauCeti.LPV7.generic_model_constant_test` (compatibility): An actual constant smooth projective model with pure constant coefficients retains its geometric-fibre and complex realization isomorphisms.
- `TauCeti.LPV7.generic_model_shift_twist_test` (computation): For K₀[a](b), the same geometric model has weight w+a−2b and the shifted/twisted realization.
- `TauCeti.LPV7.generic_model_closed_point_test` (non-example): The generic-point condition rules out a model point contained in a proper closed subset of the integral arithmetic base.

**Acceptance.**

- A model based at a proper closed parameter point does not qualify.
- The absolute witness contains a complex isomorphism and proper base-change square, not just an integer weight.

**Used by.**

- Weil II 6.2.12: Supplies the arithmetic data transported to every local pencil trait, before applying6.2.9.
- DWP.9, Weil II 6.2.13: Specifies the input meaning of a potentially pure projective complex without importing hard Lefschetz.

**Depends on.** other roadmaps' nodes: `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`; libraries: `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:IsGenericPoint`, `mathlib:HasDerivedCategory.standard`, `mathlib:CategoryTheory.shiftFunctor`, `mathlib:CategoryTheory.IsPullback`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, 6.2.8(a),(c),(d), and proof6.2.12 constructing potentially pure i*q*K, printed pp.248,250: “intègre” — The source defines potential purity in the local curve setting and applies it to the global incidence pencil. This node isolates the sufficient absolute arithmetic input to that pullback, without asserting an unproved converse to the local definition.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: WeilII 6.2.8(a),(c),(d) and proof6.2.12 motivate the absolute arithmetic pure witness before the incidence pullback. Its purity is imported from accepted DWP.8. Corrected the projection descriptions to their exact Lean return types and added constructor/extensionality APIs; the absent purity realization stays explicit.

### Arithmetic model of a potentially pure complex

`LPV.7:invariant-cycles/potentially-pure-model` · definition · planet “Potentially pure complexes” · LPV.7 part · Lean `TauCeti.LPV7.PotentiallyPureModel`

For k algebraically closed, S=Spec(k[T]^h_(T)), f:X→S proper and K∈Dᵇ_c(X,ℚ̄_ℓ), a PotentiallyPureModel is the witness of Deligne6.2.8: an integral finite-type ℤ[1/ℓ]-scheme A₀ with Spec k a geometric generic point; a smooth relative curve S₀→A₀ with section; a proper f₀:X₀→S₀; a complex K₀ pure in the arithmetic6.2.7 sense; and compatible isomorphisms identifying S with the henselization at that section after base change to k, and (X,K) with the corresponding pullback of (X₀,K₀). Potential purity means existence of this data, not a Prop field or a free label. Record its integer weight and purity witness under the supplied DWP definition.

**Hypotheses.**

- ℓ invertible in k; genuine constructible complexes and model pullback functors.
- Use the arithmetic dualizing normalization of 6.2.7; no arbitrary ℤ-model purity convention.

**Construction.**

1. Import DWP.8’s actual arithmetic purity definition and EDC.0 constructible coefficients.
2. Package the schemes, section, proper map, complex and pullback identifications of 6.2.8.
3. Derive the predicate as existence of this witness and expose projections/transport without requiring a unique witness.

**API.**

- `TauCeti.LPV7.PotentiallyPureModel.base` (projection): Return the arithmetic base scheme A₀. The point, genericity proof and arithmetic structure map are separate structure projections.
- `TauCeti.LPV7.PotentiallyPureModel.family` (projection): Return the pair (S₀,X₀); curve, curveSection, familyMap, proper, K0 and weight are separate projections.
- `TauCeti.LPV7.PotentiallyPureModel.realization` (data): Return the supplied complex pullback isomorphism pullback(K₀)≅K. The family base-change square is a separate structure projection; the geometric étale interpretation and henselization identification remains in G-suggested-premises.
- `TauCeti.LPV7.PotentiallyPureModel.shrink` (functoriality): Restrict to a nonempty parameter open containing the geometric generic point; retain the induced model, section and purity.
- `TauCeti.LPV7.PotentiallyPureModel.transport` (compatibility): Transport a witness along compatible isomorphisms of the trait family and complex; proof-irrelevance applies to properties, not to the model schemes.
- `TauCeti.LPV7.PotentiallyPureModel.mk` (constructor): Construct the witness from all its arithmetic scheme maps, actual generic-point/proper/smooth/section predicates, Cartesian family square and complex realization data. The suggested form omits arithmetic purity and the henselization identification until the owner interfaces exist.
- `TauCeti.LPV7.PotentiallyPureModel.ext` (extensionality): Two witnesses are equal when all their scheme, map, complex, weight, functor and realization data are equal (heterogeneous equality where needed). Proof fields are proof-irrelevant; model schemes and complex isomorphisms are data and are retained.

**Unit tests.**

- `TauCeti.LPV7.potential_model_constant_test` (compatibility): A constant proper smooth family descending to an integral finite-type ℤ[1/ℓ]-base, with a pure constant complex, gives the indicated witness and constant family after realization.
- `TauCeti.LPV7.potential_model_shift_twist_test` (computation): Replacing pure K₀ of weight w by K₀[a](b) gives a witness of weight w+a−2b with the same geometric model; shifts and twists are tracked.
- `TauCeti.LPV7.potential_model_closed_point_test` (non-example): A parameter map factoring through a proper closed subset of integral A₀ fails the geometric-generic-point condition, even if the remaining schemes and complex are present.

**Acceptance.**

- A model includes its geometric generic point, not a closed finite-field point.
- The complex has its model and purity data, rather than an arbitrary symbol.

**Used by.**

- Weil II 6.2.9: Allows arithmetic descent of the entire specialization/duality cross.
- Weil II 6.2.12 and DWP.9’s6.2.13: Retains the source data needed to pull purity to the general incidence-pencil family.

**Depends on.** other roadmaps' nodes: `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`; libraries: `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsIntegral`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`, `mathlib:AlgebraicGeometry.LocallyOfFiniteType`, `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:IsGenericPoint`, `mathlib:HasDerivedCategory.standard`, `mathlib:CategoryTheory.shiftFunctor`, `mathlib:CategoryTheory.IsPullback`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Definition6.2.8(a)–(d), printed p.248: “section” — WeilII 6.2.8(a)–(d) defines the curve-with-section, proper-family and pure-complex witness. The suggested structure uses real scheme predicates and pullback maps but omits the henselization/purity interface openly. Corrected the projection descriptions and added constructor/extensionality APIs without collapsing the witness to a proposition.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** corrected: WeilII 6.2.8(a)–(d) defines the curve-with-section, proper-family and pure-complex witness. The suggested structure uses real scheme predicates and pullback maps but omits the henselization/purity interface openly. Corrected the projection descriptions and added constructor/extensionality APIs without collapsing the witness to a proposition.

### Potential purity on a general incidence pencil

`LPV.7:invariant-cycles/potential-purity-incidence-pullback` · lemma · LPV.7 part · Lean `TauCeti.LPV7.potentialPurityIncidencePullback` (omitted signature)

For the projective incidence diagram X←q Z←i X̃ over a sufficiently general parameter line D as in 6.2.10, transport the absolute GeometricGenericPureModel for K to i*q*K on X̃. Prove the needed duality identity D(i*q*K)=i*q*DK in Deligne’s normalized incidence convention; it comes from q smooth and i noncharacteristic/generic-local-acyclic pullback with the relative-dimension shifts cancelling. Retain the shrink of the arithmetic parameter base and the general-line condition. Arbitrary pullback of a pure complex is not asserted pure.

**Hypotheses.**

- The projective incidence family, smooth base-change maps and sufficiently general line supplied by LPV.3/EDC.0.
- The projective K has the absolute arithmetic witness gam; the conclusion supplies the local PotentiallyPureModel on each pencil trait.

**Proof.**

1. Spread the incidence diagram and line/section along the witness.
2. Apply generic local acyclicity and the correctly shifted Verdier duality exchanges to q and i.
3. Use DWP.8’s upper bounds for pullback, duality and the normalized identity to show arithmetic purity of the pulled-back model.

**Acceptance.**

- For a general smooth hyperplane, D(K|Y)=DK|Y(−1)[−2].
- The conclusion requires generality; arbitrary closed immersion is not allowed.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/potentially-pure-model`, `LPV.7:invariant-cycles/geometric-generic-pure-model`; this roadmap's stages: `LPV.3`; other roadmaps' nodes: `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proof6.2.12, printed p.250; generic duality comparison in proof6.2.11: “général” — WeilII proof6.2.12 applies arithmetic purity only to the sufficiently general incidence pullback. The smooth/noncharacteristic duality exchange and canceled shifts require LPV.3 and EDC; arbitrary pullback purity is not asserted.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII proof6.2.12 applies arithmetic purity only to the sufficiently general incidence pullback. The smooth/noncharacteristic duality exchange and canceled shifts require LPV.3 and EDC; arbitrary pullback purity is not asserted.

**Assembly note.** Its citation of the stage `LPV.3` stands for the incidence family with generic local acyclicity for an arbitrary constructible K. `LPV.3/dual-variety` plans the incidence family and its smoothness off the dual variety for constant coefficients only (G-complex-pencil).

### Local invariant cycles for potentially pure complexes

`LPV.7:invariant-cycles/pure-complex-local-invariant-cycles` · theorem · planet “Pure-complex invariant cycles” · LPV.7 part · Lean `TauCeti.LPV7.pureComplexLocalInvariantCycles` (omitted signature)

In the trait setting of 6.2.8, f:X→S proper and K∈Dᵇ_c(X,ℚ̄_ℓ) with a PotentiallyPureModel imply surjectivity H^i(X_s,K)→H^i(X_η̄,K)^I for every integer i. No total-space smoothness or generic-fibre smoothness is added beyond the existence of the arithmetic pure model. With D the Verdier duality, the support group in the cross is H^{i+1}_{X_s}(X,K)≅H^{−i−1}(X_s,DK)^∨. The same exact weight separation follows from proper preservation of purity6.2.6/6.2.7 and upper bounds6.2.3.

**Hypotheses.**

- Proper f, algebraically closed k, equicharacteristic henselization S, ℓ invertible and the precise model witness.
- Bounded constructible rational ℓ-adic coefficients; degrees may be negative.

**Proof.**

1. Use ppm to spread all maps, wang with hypercohomology, and EDC.1 support duality.
2. Use DWP.8 proper purity and compact-support upper bounds to replace the two estimates in wb.
3. Apply exact W at the appropriate shifted weight, then descend the surjectivity through the model realization.

**Acceptance.**

- The constant-sheaf smooth-total-space case recovers lic after choosing its arithmetic model.
- The theorem applies to a pure complex with several cohomological degrees, not just a lisse sheaf.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/potentially-pure-model`, `LPV.7:invariant-cycles/continuous-wang-sequence`, `LPV.7:invariant-cycles/invariant-specialization`; other roadmaps' nodes: `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Theorem6.2.9 and its duality cross, printed pp.248–249: “potentiellement pur” — WeilII 6.2.9 proves local invariant cycles for a potentially pure bounded complex with no added smoothness assumption. Its support dual is H^(-i-1)(Xs,DK)^dual. The corrected Wang node now supplies the coefficient generality actually consumed here.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 6.2.9 proves local invariant cycles for a potentially pure bounded complex with no added smoothness assumption. Its support dual is H^(-i-1)(Xs,DK)^dual. The corrected Wang node now supplies the coefficient generality actually consumed here.

### Affine vanishing from the dual support bound

`LPV.7:invariant-cycles/dual-support-affine-vanishing` · lemma · LPV.7 part · Lean `TauCeti.LPV7.dualSupportAffineVanishing` (omitted signature)

For X projective over algebraically closed k, K∈Dᵇ_c(X,ℚ_ℓ), n∈ℤ and dim Supp ℋ^j(DK[−2n−2])≤n+1−j for every j (dim∅=−∞), any hyperplane complement A=X\Y is affine and H_c^i(A,K)=0 for i≤n. Equivalently the bound on unshifted DK is dim Supp ℋ^q(DK)≤−n−1−q. Apply affine Artin vanishing to the cohomology sheaves and their hypercohomology sequence, then duality; this is a support condition, without requiring X smooth or K pure.

**Hypotheses.**

- Projective closed embedding X⊂P^N; ℓ invertible; n integer; actual dual-support dimensions.

**Proof.**

1. Translate the shift correctly: ℋ^j(DK[−2n−2])=ℋ^{j−2n−2}(DK).
2. Use EDC.4’s affine support-dimension bound to get H^a(A,ℋ^q DK)=0 for a+q≥−n.
3. Apply hypercohomology and EDC.1 duality H_c^i(A,K)^∨≅H^{−i}(A,DK).

**Acceptance.**

- For smooth dim X=n+1 and K=ℚ_ℓ, DK[−2n−2]=ℚ_ℓ(n+1); the j=0 bound is n+1, as required.
- Replacing n+1−j by n−1−j wrongly excludes this standard case.

**Depends on.** other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.0`; libraries: `mathlib:CategoryTheory.Limits.IsZero`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proposition6.2.11 and proof, printed pp.249–250; compare4.1.6: “support” — WeilII 6.2.11 proof and4.1.6 give affine support vanishing after Verdier duality. Reindexing q=j-2n-2 gives the unshifted bound -n-1-q; the shift and vanishing endpoint i<=n agree with the source.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 6.2.11 proof and4.1.6 give affine support vanishing after Verdier duality. Reindexing q=j-2n-2 gives the unshifted bound -n-1-q; the shift and vanishing endpoint i<=n agree with the source.

### Support-bound weak Lefschetz

`LPV.7:invariant-cycles/support-bound-weak-lefschetz` · theorem · planet “Support-bound weak Lefschetz” · LPV.7 part · Lean `TauCeti.LPV7.supportBoundWeakLefschetz` (omitted signature)

Under the bound of av, for every hyperplane section Y the restriction H^i(X,K)→H^i(Y,K|Y) is an isomorphism for i<n and is injective for i=n. This includes singular hyperplanes, since the proof uses the affine complement rather than purity of that hyperplane. For a sufficiently general Y, generic local acyclicity gives D_Y(K|Y)=DK|Y(−1)[−2] and transfers the same bound with n replaced by n−1.

**Hypotheses.**

- Exactly the projective and dual-support hypotheses of 6.2.11; no smoothness or potential-purity premise.

**Proof.**

1. Apply the localization exact sequence and the vanishing from av.
2. Use generic-local-acyclicity duality for the sufficiently general section, retaining its shifts.
3. Check the support dimensions after intersection with the general hyperplane.

**Acceptance.**

- The boundary degree n is injective, not asserted surjective.
- The constant sheaf on a smooth(n+1)-fold recovers ordinary weak Lefschetz.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/dual-support-affine-vanishing`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proposition6.2.11(i) and first two paragraphs of its proof, printed pp.249–250: “hyperplan” — WeilII 6.2.11(i) gives isomorphism below n and injection at n for every hyperplane, including singular ones. Only the inherited duality bound for a sufficiently general hyperplane uses generic local acyclicity and the (-1)[-2] exchange.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 6.2.11(i) gives isomorphism below n and injection at n for every hyperplane, including singular ones. Only the inherited duality bound for a sufficiently general hyperplane uses generic local acyclicity and the (-1)[-2] exchange.

### Local detection of the pencil extension obstruction

`LPV.7:invariant-cycles/pencil-relative-obstruction` · lemma · LPV.7 part · Lean `TauCeti.LPV7.pencilRelativeObstruction` (omitted signature)

For the general incidence pencil and a chosen fibre Y_u, identify the obstruction to extending a class from Y_u to X with a relative-cohomology class on P¹ using the cone of the pushforward-to-axis comparison. Under wl’s inherited affine bounds, its negative cohomology sheaves have finite support. Apply Deligne4.3.6: for L∈D⁺_c(P¹) with finite support of ℋ^j(L) for j<0, lisse outside finite B, and a chosen t∈P¹, the maps H¹(P¹ mod t,L)→∏_{b∈B}H¹(P¹_(b) mod η_b,L) are injective. Thus the obstruction vanishes if all its local obstructions vanish.

**Hypotheses.**

- Constructible complexes and the actual general-pencil/axis morphisms; boundedness needed for the relative Leray comparison.
- The finite-support condition is proved using affine bounds; no arbitrary Leray degeneration is assumed.

**Proof.**

1. Use EDC.0 localization cones and relative hypercohomology, and LPV.4’s axis/pencil maps.
2. Follow4.3.6’s truncation to H⁰ and H¹ of a sheaf without point-supported sections.
3. Use the P¹ torsor extension argument and local inertia generation, then apply the injective detection map to the extension obstruction.

**Acceptance.**

- An invariant class extending over each singular neighbourhood has zero global obstruction.
- The argument uses4.3.6–4.3.8, without importing the hard-Lefschetz-dependent orthogonal splitting4.3.9.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/support-bound-weak-lefschetz`; this roadmap's stages: `LPV.4`, `LPV.5`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proposition4.3.6 and §§4.3.7–4.3.8, printed pp.224–226; proof6.2.11: “torseurs” — WeilII 4.3.6–4.3.8 and proof6.2.11 give the relative obstruction and finite-support argument on P1. The packet requests the constructible-complex cone/axis extension from LPV.4 and local inertia/torsor input from LPV.5, not the later orthogonal decomposition4.3.9.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 4.3.6–4.3.8 and proof6.2.11 give the relative obstruction and finite-support argument on P1. The packet requests the constructible-complex cone/axis extension from LPV.4 and local inertia/torsor input from LPV.5, not the later orthogonal decomposition4.3.9.

**Assembly note.** Its citations of the stages `LPV.4` and `LPV.5` stand for the pencil cone and axis maps for constructible K and for local inertia generation on ℙ¹. The constant-coefficient analogues are `LPV.4/pencil-leray-and-middle-reduction` and `LPV.5/monodromy-generated-by-local-transvections` (G-complex-pencil).

### Ambient and pencil-section images

`LPV.7:invariant-cycles/pencil-image-equality` · theorem · LPV.7 part · Lean `TauCeti.LPV7.pencilImageEquality` (omitted signature)

For K satisfying6.2.11’s dual-support bound and a sufficiently general pencil D, for every u∈D the image of H^n(X,K) in H^n(Y_u,K) equals the image of H⁰(D,R^n f̃_*(i*q*K)) in that fibre. Prove the equality through the relative obstruction calculation; it does not assert degeneration of all Leray spectral sequences, a direct-sum fixed/vanishing decomposition or hard Lefschetz.

**Hypotheses.**

- Projective X⊂P^N, n integer, dual-support bounds; sufficiently general incidence pencil with axis and duality compatibilities.

**Proof.**

1. Restriction from X gives a global section of the pencil direct image.
2. Use wl on general fibres/axis to place the reverse extension obstruction in ob’s finite-support range.
3. A global section extends locally by definition, so local obstructions vanish; ob gives an ambient lift.

**Acceptance.**

- Equality is of actual images, including singular fibres u; only wl’s middle-degree injection is used.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/pencil-relative-obstruction`, `LPV.7:invariant-cycles/support-bound-weak-lefschetz`; this roadmap's stages: `LPV.3`, `LPV.4`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Proposition6.2.11(ii) and proof;4.3.7–4.3.8: “image” — WeilII 6.2.11(ii), via4.3.7–4.3.8, identifies the two images for a sufficiently general pencil. It requires neither wholesale Leray degeneration nor hard Lefschetz.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 6.2.11(ii), via4.3.7–4.3.8, identifies the two images for a sufficiently general pencil. It requires neither wholesale Leray degeneration nor hard Lefschetz.

**Assembly note.** Its citations of the stages `LPV.3` and `LPV.4` stand for the general pencil with its axis for constructible K; the LPV.0 part plans the constant-coefficient pencil only (G-complex-pencil).

### Monodromy image on a general pencil

`LPV.7:invariant-cycles/general-pencil-monodromy` · comparison · LPV.7 part · Lean `TauCeti.LPV7.generalPencilMonodromy`

For the full hyperplane incidence family Z→P̌ and K, choose a dense open U where all relevant R^j f_*q*K are lisse. For a sufficiently general line D and u∈V=D∩U, the images of π₁(V,u) and π₁(U,u) acting on H^j(Y_u,K) agree, hence so do their invariant subspaces. Request the general constructible-complex Bertini/fundamental-group statement from LPV.3/LPV.5; their ordinary constant-coefficient transvection theorem alone does not supply this assertion.

**Hypotheses.**

- k algebraically closed, projective incidence family; sufficiently general line relative to the fixed lisse systems, not every line.

**Proof.**

1. Use constructibility and generic lissity from EDC.0 to choose U.
2. Apply the supplier’s general-line monodromy-image theorem to the finite set of cohomological degrees.
3. Transport the same basepoint/path identifications to compare the actual images and invariant submodules.

**Acceptance.**

- The comparison is image equality, not a claim of isomorphism of fundamental groups.

**Depends on.** this roadmap's stages: `LPV.3`, `LPV.5`; other roadmaps' stages: `EtaleDualityAndPerverseSheaves:EDC.0`; libraries: `mathlib:Representation.invariants`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, §6.2.10, formulas6.2.10.1–6.2.10.2, printed p.249: “coïncide” — WeilII 6.2.10.1–6.2.10.2 identifies general-line and full incidence monodromy images. The request correctly extends LPV.3/5 beyond constant-coefficient transvection formulas to the actual constructible K.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII 6.2.10.1–6.2.10.2 identifies general-line and full incidence monodromy images. The request correctly extends LPV.3/5 beyond constant-coefficient transvection formulas to the actual constructible K.

**Assembly note.** Its citations of the stages `LPV.3` and `LPV.5` stand for the general-line image theorem for the lisse sheaves R^j f_*q^*K on an open U of the dual space. `LPV.5/bertini-surjectivity-on-fundamental-groups` proves it for a fixed ℚ_ℓ local system with compact image on the complement of the dual variety, in the tame branch; U here is the open where the sheaves are lisse (G-complex-pencil).

### Global invariant cycles for potentially pure complexes

`LPV.7:invariant-cycles/global-invariant-cycles` · theorem · planet “Global invariant cycles” · LPV.7 part · Lean `TauCeti.LPV7.globalInvariantCycles` (omitted signature)

Let X⊂P^N be projective over algebraically closed k, K∈Dᵇ_c(X,ℚ̄_ℓ) with the absolute GeometricGenericPureModel, so that the general pencil pullback has the6.2.8 local witnesses; n∈ℤ, and dim Supp ℋ^j(DK[−2n−2])≤n+1−j for all j. For a general hyperplane Y_u with u∈U as in 6.2.10, restriction identifies H^n(X,K) with H^n(Y_u,K)^{π₁(U,u)}. The injection comes from wl; surjectivity comes from applying6.2.9 at every point of D\V to the pulled-back pure model, using im and gm. This is the exact 6.2.12 input to DWP.9, not a consequence of DWP.9.

**Hypotheses.**

- All the projectivity, source dual-support, general-hyperplane and arithmetic-model hypotheses.
- ℓ invertible and rational coefficients; no hidden hard-Lefschetz or decomposition premise.

**Proof.**

1. Use pull to transport potential purity to a sufficiently general pencil.
2. Use pl at the finitely many omitted points to identify the image of global pencil sections with π₁(V)-invariants.
3. Use im and gm for surjectivity, and wl for injectivity.

**Acceptance.**

- The exported isomorphism is the corestricted ambient restriction, not an arbitrary vector-space isomorphism.
- No E⊕E⊥ decomposition is used; DWP.9 is a consumer.

**Depends on.** this roadmap, same part: `LPV.7:invariant-cycles/potential-purity-incidence-pullback`, `LPV.7:invariant-cycles/pure-complex-local-invariant-cycles`, `LPV.7:invariant-cycles/support-bound-weak-lefschetz`, `LPV.7:invariant-cycles/pencil-image-equality`, `LPV.7:invariant-cycles/general-pencil-monodromy`, `LPV.7:invariant-cycles/invariant-specialization`, `LPV.7:invariant-cycles/geometric-generic-pure-model`.

**Library placement.** module `TauCeti/AlgebraicGeometry/NearbyCycles/InvariantCycles`, namespace `TauCeti.LPV7`.

**Sources.**

- `WeilII`, Corollary6.2.12 and proof, printed p.250: “global” — WeilII Corollary6.2.12 combines weak-Lefschetz injection, the potential-purity pullback, local6.2.9, image equality and general-line monodromy. All inputs are earlier/imported; DWP.9 is a consumer and never a prerequisite.

**Review (REV-LefschetzPencilsAndVanishingCycles--LPV.7).** verified: WeilII Corollary6.2.12 combines weak-Lefschetz injection, the potential-purity pullback, local6.2.9, image equality and general-line monodromy. All inputs are earlier/imported; DWP.9 is a consumer and never a prerequisite.

## Dependencies

**Layer order.** The stage edges that the node prerequisites induce inside the roadmap are LPV.0 → LPV.1, LPV.2, LPV.6, LPV.7:semistable-curves, LPV.7:invariant-cycles; LPV.1 → LPV.2 (the two-component complex), LPV.6 (normalized can/var) and LPV.7:semistable-curves; LPV.2 → LPV.3, LPV.4, LPV.5, LPV.7:semistable-curves; LPV.3 → LPV.4, LPV.5, LPV.7:invariant-cycles; LPV.4 → LPV.5, LPV.7:invariant-cycles; LPV.5 → LPV.7:invariant-cycles; and both sub-layers → LPV.7. There is one backward edge, LPV.5 → LPV.4, with no node cycle:

- `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` uses `LPV.5/vanishing-cycles-are-conjugate` for its last clause, that one vanishing cycle is zero only if all are;
- `LPV.4/global-fixed-and-local-fixed-interface` uses `LPV.5/monodromy-generated-by-local-transvections`, which realises LPV.4 as well as LPV.5, for the equality of E^⊥ with the global invariants.

Neither LPV.5 node depends on these two LPV.4 nodes, so the node graph is acyclic; it is acyclic also through every packet on main. At stage level the edge runs backwards. It disappears if the conjugacy clause moves to LPV.5 (as a corollary of conjugacy, with LPV.4 stating its two cases "all vanishing cycles nonzero" and "all zero") and the global-invariant comparison is placed in LPV.5, where its last proof step already sits.

**Cross-part references.** The LPV.0 part never refers to the LPV.7 part. The LPV.7 part cites six LPV.0-part nodes by id, ten times in all: `LPV.0/derived-functorialities-and-specialization-sequence` (from four nodes), `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` (from two), `LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LPV.0/variation-morphism`, `LPV.2/local-picard-lefschetz-formula` and `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`. It also cites five stages of the LPV.0 part, each with a request. The assembly notes on the consuming nodes say which LPV.0-part node answers each one:

- **The stage LPV.0** (eight nodes) stands for the passage from finite torsion to rational ℓ-adic coefficients, which `LPV.0/adic-nearby-cycle-realization` constructs, with `LPV.0/coefficient-and-trait-change` for the finite levels. What that node does not state is the compatibility of the rational triangle with proper base change, the local stalk calculations and support localization; that residue is what the request still asks.
- **The stage LPV.1** (seven nodes). For the curve nodes it stands for the twisted logarithm (`LPV.1/finite-monodromy-logarithm`), ρ(σ) = exp(t_ℓ(σ)N) with the Tate-generator independence (`LPV.1/twisted-monodromy-equivariance`), the centred filtration (`LPV.1/monodromy-filtration`), the normalized variation (`LPV.1/normalized-can-var`) and the ramified rescaling (`LPV.1/finite-extension-and-logarithm-rescaling`). For `snc-nearby-cycle-description` and `snc-graded-nearby-complex` it stands for more than LPV.1 plans: LPV.1 constructs the monodromy filtration of a nilpotent endomorphism of a finite-dimensional vector space, while these nodes need the kernel-image convolution filtration of a nilpotent endomorphism of an object of an abelian category (the shifted-perverse nearby complex, Saito 2003 §2.1). No node plans that; the LPV.7 request records it.
- **The stages LPV.3, LPV.4 and LPV.5** (eight references from LPV.7:invariant-cycles) stand for the incidence, pencil and monodromy statements of Weil II 6.2.10–6.2.12 and 4.3.6–4.3.8 for an arbitrary constructible complex K. The LPV.0 part plans them for constant coefficients only: `LPV.3/dual-variety`, `LPV.4/pencil-leray-and-middle-reduction` and `LPV.5/bertini-surjectivity-on-fundamental-groups` are the nearest nodes. The extension is gap G-complex-pencil and the three requests; the LPV.0 part's coverage of LPV.3–LPV.5 does not yet list it.

Two references would sharpen with an LPV.0-part node id. `node-residue-variation-sign` handles nodes of any thickness n_e = v(a_e), but cites `LPV.2/local-picard-lefschetz-formula`, which is stated for a regular total space, where the thickness is one; the thickness factor comes from `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, whose Kummer character of b is v(b)·t_ℓ on rational coefficients. And `snc-graded-nearby-complex` recovers in its two-component acceptance case exactly the three grades of `LPV.1/two-component-semistable-nearby-complex`, which it should cite as the special case it must agree with.

**Stage cycles with other roadmaps.** The atlas links LPV.5 → DeligneWeightsAndPurity DWP.4 and LPV.6 → IgusaVarietiesAndTorsionConcentration IG.4. Two LPV.5 nodes (`finite-orthogonal-ade` and `integral-failure-and-arithmetic-routing`) cite the stage DWP.4, and `LPV.6/igusa-semiperversity-interface` cites the stage IG.4. These are late applications, not inputs to the layers' main theorems. Each whole-stage edge closes a cycle with the atlas link, and the fix is to cite the specific earlier output: for DWP.4, the rational-character and cross-ℓ comparison of Weil II 4.4.5–4.4.9; for IG.4, the finite-level formal models and their common lower bound. Until those are split off, the LPV.5 and LPV.6 nodes concerned are applications that follow DWP.4 and IG.4 rather than inputs to them (gap G-review-supplier-order).

**Weights.** No node of LPV.0–LPV.6 or of LPV.7:semistable-curves depends on a weight, purity, hard-Lefschetz or decomposition theorem. LPV.7:invariant-cycles imports DWP.5 (Weil II 1.8.8), DWP.7 (3.3) and DWP.8 (3.4.1 and 6.2.3–6.2.7), and is consumed by DWP.9; no path leads back from DWP.9 or DWP.10 into LPV.7.

## Source issues

The parts record 25 mistakes in their sources, each with its independent verdict:

- the LPV.0 part's E1–E12, in SGA 7 XII and XV, checked on the page images of the printed volume: eleven misprints and one error (E11, the characterisation of ±δ by (δ, δ) alone, which fails for k with two distinct odd prime factors);
- its E13–E22, ten corrections to Illusie 1994 from the author's errata sheet ErrTML;
- its E23, the author's correction |i| > 1 to Illusie 2002;
- the LPV.7 part's E13 and E14, two cross-reference misprints in the author copy of Saito 2003.

The two parts numbered their issues independently, so the ids `LefschetzPencilsAndVanishingCycles/E13` and `/E14` each name two different mistakes; the headings below name the part, and the errata register should renumber the LPV.7 part's two as E24 and E25. Nodes use the corrected statements.

#### LefschetzPencilsAndVanishingCycles/E1 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, 1.1 b), p. 2
- **Printed.** b) pour n impair et card(A) = 2 : Q est ordinaire si et seulement si …
- **Correction.** b) pour n impair et car(A) = 2 : …
- **Reason.** Case a) is 'n pair ou car(A) ≠ 2', so b) is its complement, characteristic 2; with card(A) = 2 the dichotomy would cover only the field with two elements.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, 1.1 b), p. 2; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E2 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, Proposition 1.2, p. 3
- **Printed.** Q(Σ_1^n x_i e_i) = Σ_1^{m−1} x_i x_{i+m} (resp. Σ_1^{m−1} x_i x_{i+m} + λx²_{2m+1})
- **Correction.** Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1}), or equivalently sums from 0 to m − 1 with the basis indexed from 0
- **Reason.** With the basis e₁, …, e_n and i from 1 to m − 1, the variables x_m and x_{2m} do not occur and the displayed form is degenerate, contradicting ordinarity; the inductive proof splits off m hyperbolic planes.
- **Affects.** a stated result. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, Proposition 1.2, p. 3; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E3 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, 3.1, p. 14
- **Printed.** η ∈ H⁰(S, R¹p_*ℤ_ℓ(1))
- **Correction.** η ∈ H⁰(S, R²p_*ℤ_ℓ(1))
- **Reason.** η is the image of c₁(O(1)) ∈ H²(X, ℤ_ℓ(1)), as the next sentence of 3.1 says ('l'image dans H⁰(S, R²p_*ℤ_ℓ(1))').
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, 3.1, p. 14; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E4 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, proof of 3.3, formula (a), p. 15
- **Printed.** la quadrique d'équation Σ_0^m x_i x_{i+m+1} = 0 dans P^{m+1}(k)
- **Correction.** dans P^{2m+1}(k)
- **Reason.** The quadric has dimension n = 2m and the equation uses the variables x₀, …, x_{2m+1}.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, proof of 3.3, formula (a), p. 15; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E5 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, 3.6, p. 18
- **Printed.** Pour r = 2m + 1, r_{2m}(η^m) = η^m
- **Correction.** Pour n = 2m + 1
- **Reason.** The paragraph treats n even and then n odd; r denotes the restriction maps r_i.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, 3.6, p. 18; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E6 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XII, 3.6, p. 18
- **Printed.** Par dualité, ou à l'aide de 3.5.3, on montre de même …
- **Correction.** à l'aide de (3.6.3)
- **Reason.** Exposé XII has no 3.5.3; the dual Gysin sequence (3.6.3) is the one that computes R^i f_*ℤ_ℓ.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XII, 3.6, p. 18; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E7 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, Corollaire 1.3.2 (ii), display (4.14.2), p. 11
- **Printed.** Q(X) = x₀ + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j
- **Correction.** Q(X) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j
- **Reason.** Without the square the equation is smooth at every point; the versal deformation of 1.3.1 (ii) and Remarque 1.3.3 both have x₀².
- **Affects.** a stated result. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, Corollaire 1.3.2 (ii), display (4.14.2), p. 11; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E8 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, 1.2.1 and proof of 1.2.6, pp. 4 and 6
- **Printed.** (4.2.1) f(X) = Q(X) = + termes d'ordre > 2; 'Soit Y₀ défini par Q comme en 4.3.'
- **Correction.** f(X) = Q(X) + termes d'ordre > 2, and 'comme en 1.2.3'
- **Reason.** The stray '=' breaks the formula, and the references numbered 4.x (also the label (4.14.2) in 1.3.2) point to a numbering of the exposé that no longer exists; 1.2.3 is the cone Q = 0 used in the proof.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, 1.2.1 and proof of 1.2.6, pp. 4 and 6; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E9 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, 2.1.3 and Lemme 2.7.8, pp. 14–17
- **Printed.** 'Lemme 2.1.3' and the paragraph '2.1.3. Prouvons 2.1.2' share a number, and the lemma after 2.1.7 is numbered 'Lemme 2.7.8'
- **Correction.** number the paragraph 2.1.3 bis (or renumber), and read 'Lemme 2.1.8'
- **Reason.** The proof of 2.2.7 says 'Appliquons 2.1.8', and the lemma sits between 2.1.7 and 2.2.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, 2.1.3 and Lemme 2.7.8, pp. 14–17; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E10 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, (2.2.5.9), p. 21
- **Printed.** D(σ)(δ') = λ(σ).δ
- **Correction.** Var(σ)(δ') = λ(σ).δ
- **Reason.** The next display (2.2.5.10) rewrites it as a formula for Var(σ), and D is not defined in XV.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, (2.2.5.9), p. 21; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E11 · error · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, 2.2.6, p. 22
- **Printed.** si 2∤k (Λ = ℤ/k), ±δ est caractérisé par (2.2.5.3) (2.2.5.4), ie. par (2.2.6.1) (δ,δ) = (−1)^m.2
- **Correction.** Norm characterizes the pair ±δ over a single odd prime-power coefficient ring. Over composite odd k, reduce the distinguished geometric classes of XII 3.7 with one common sign; independent prime-by-prime choices or a ℤ/2^a k norm lift do not suffice.
- **Reason.** (uδ, uδ) = u²(δ, δ), and ℤ/k has square roots of 1 other than ±1 when k has two distinct odd prime factors: for k = 15, u = 4 gives u² = 16 ≡ 1, so 4δ ≠ ±δ also satisfies (2.2.6.1).
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, 2.2.6, p. 22; the printed text has the recorded error, rather than merely an OCR artefact. Independently checked 4²=1 modulo 15 with 4≠±1; 19 modulo 60 shows why a 2-primary norm lift also fails to synchronize the signs. The packet correction is strengthened accordingly.

#### LefschetzPencilsAndVanishingCycles/E12 · misprint · `SGA7II-1973` · LPV.0 part

- **Locator.** Exposé XV, 2.2.2, p. 18
- **Printed.** Sauf dans le cas exceptionnel où k(s) est de caractéristique 2 et où n+1 est pair
- **Correction.** où n+1 est impair (n pair)
- **Reason.** The degenerate case is characteristic 2 with n even (XV 1.2.2 and 1.2.8: an odd number n + 1 of variables), and 2.2.6 says 'Supposons n impair; x₀ est alors un point rationnel (2.2.2)'.
- **Affects.** nothing. **Known.** new.
- **Searched.** web search 'SGA 7 Groupes de monodromie errata Exposé XII quadriques Deligne misprint', 2026-09-29: no errata list for LNM 340 found (only the Springer and IAS bibliographic pages); the IAS scan itself (LNM 340), which contains no errata sheet
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Original printed SGA 7 II page image checked at Exposé XV, 2.2.2, p. 18; the printed text has the recorded error, rather than merely an OCR artefact.

#### LefschetzPencilsAndVanishingCycles/E13 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 22 lines −4 and −2, p. 24 lines 6–7, p. 38 line −11
- **Printed.** t_|
- **Correction.** Use the vertical tame parameter t_vert and σ_vert consistently.
- **Reason.** The author’s ErrTML sheet identifies the vertical parameter used in the double-complex construction.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 22 lines −4 and −2, p. 24 lines 6–7, p. 38 line −11.

#### LefschetzPencilsAndVanishingCycles/E14 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 35 line 7
- **Printed.** R^(q+1)
- **Correction.** Replace R^(q+1)a_q! by R^(2q)a_q!.
- **Reason.** Purity in codimension q has cohomological degree 2q.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 35 line 7.

#### LefschetzPencilsAndVanishingCycles/E15 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 37 line −5
- **Printed.** T−1
- **Correction.** Use 1−T in the upper row of the diagram.
- **Reason.** The author corrects the sign used to compare the boundary maps in the filtered nearby complex.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 37 line −5.

#### LefschetzPencilsAndVanishingCycles/E16 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 38 line −5, (3.6.8)
- **Printed.** L
- **Correction.** Replace L by K in the filtered quasi-isomorphism.
- **Reason.** The simple Rapoport–Zink complex resolves nearby K, not its inertia-cohomology cone L.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 38 line −5, (3.6.8).

#### LefschetzPencilsAndVanishingCycles/E17 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 39 line 7, second row
- **Printed.** a_(d+1)*
- **Correction.** The row is a_d*Λ followed by a_(d+1)*Λ(−1).
- **Reason.** The author’s erratum reverses the printed component order, needed for the graded monodromy map.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 39 line 7, second row.

#### LefschetzPencilsAndVanishingCycles/E18 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 41 line −3
- **Printed.** W_(·−n)
- **Correction.** M_·=W_·, without the shift −n.
- **Reason.** The author’s erratum fixes the monodromy-filtration indexing.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 41 line −3.

#### LefschetzPencilsAndVanishingCycles/E19 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 41 line −2
- **Printed.** poids i
- **Correction.** The weight is i+n, not i.
- **Reason.** The pure weight includes the dimension shift; this weight result is routed to DWP, not proved here.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 41 line −2.

#### LefschetzPencilsAndVanishingCycles/E20 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 43 line −1 and p. 44 lines 1–2
- **Printed.** parenthèses
- **Correction.** Delete the parenthetical proposed correction to the quoted text.
- **Reason.** The author’s erratum explicitly retracts that proposed correction; LPV does not perpetuate it.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 43 line −1 and p. 44 lines 1–2.

#### LefschetzPencilsAndVanishingCycles/E21 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 44 line −12
- **Printed.** g
- **Correction.** Replace g by α.
- **Reason.** The duality-comparison map is the α of the preceding construction.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 44 line −12.

#### LefschetzPencilsAndVanishingCycles/E22 · misprint · `illusie-1994` · LPV.0 part

- **Locator.** p. 48 line 3
- **Printed.** pour X
- **Correction.** Read pour K.
- **Reason.** The perverse argument applies to the complex K, not to the scheme X.
- **Affects.** the proof. **Known.** Author ErrTML.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed against the author’s one-page ErrTML.pdf and the corresponding original 1994 passage at p. 48 line 3.

#### LefschetzPencilsAndVanishingCycles/E23 · misprint · `illusie-2002-erratum` · LPV.0 part

- **Locator.** ErrPL.pdf, correcting p. 251 line 18 of the 2002 paper
- **Printed.** |i|>−1
- **Correction.** Replace the original 2002 bound by |i|>1.
- **Reason.** ErrPL.pdf gives the corrected local concentration bound in Sur la formule de Picard–Lefschetz; the original source is not claimed read.
- **Affects.** the proof. **Known.** Author ErrPL.pdf.
- **Searched.** Author-hosted errata sheet read in full, 2026-10-06; exact public URL and document hash in sources.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.0): Confirmed as the author’s explicit correction in ErrPL.pdf: |i|>1. The original 2002 page was not obtained; its proof interior remains G-algebraic-PL, and no independent original-page verification is claimed.

#### LefschetzPencilsAndVanishingCycles/E13 · misprint · `Saito03` · LPV.7 part

- **Locator.** Lemma1.1.6, proof of part1, author manuscript p.11 (9 June 2003 author copy; no claim about the unread version of record)
- **Printed.** Proposition 1.1.1.2
- **Correction.** Proposition1.1.1(1), in this author manuscript.
- **Reason.** The proof needs triviality of the prime-to-ℓ inertia action on nearby cohomology. Proposition1.1.1(1) states that triviality; (2) is the relative purity isomorphism and does not state it.
- **Affects.** nothing. **Known.** new.
- **Searched.** Author publication list https://www.ms.u-tokyo.ac.jp/~t-saito/publ.html (checked 2026-10-06; no correction linked for this paper; its other correction/errata links concern other works).; Cambridge journal article page https://doi.org/10.1017/S1474748003000173 (checked 2026-10-06; public metadata/abstract, no correction located; version-of-record full text not served).; Web search for Saito Weight spectral sequences and independence of l erratum/corrigendum (2026-10-06); no correction of these manuscript cross-references located.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.7): Checked the manuscript page image and the two numbered statements; The proof needs triviality of the prime-to-ℓ inertia action on nearby cohomology. Proposition1.1.1(1) states that triviality; (2) is the relative purity isomorphism and does not state it.

#### LefschetzPencilsAndVanishingCycles/E14 · misprint · `Saito03` · LPV.7 part

- **Locator.** Lemma2.2.1, proof of parts1–3, author manuscript p.19 (9 June 2003 author copy; no claim about the unread version of record)
- **Printed.** Proposition 1.1.2.2
- **Correction.** Proposition1.1.2(1), in this author manuscript.
- **Reason.** The displayed isomorphism from the stratum pushforward to the restricted higher direct image is Proposition1.1.2(1). Part(2) is the residue exact sequence, not this isomorphism.
- **Affects.** nothing. **Known.** new.
- **Searched.** Author publication list https://www.ms.u-tokyo.ac.jp/~t-saito/publ.html (checked 2026-10-06; no correction linked for this paper; its other correction/errata links concern other works).; Cambridge journal article page https://doi.org/10.1017/S1474748003000173 (checked 2026-10-06; public metadata/abstract, no correction located; version-of-record full text not served).; Web search for Saito Weight spectral sequences and independence of l erratum/corrigendum (2026-10-06); no correction of these manuscript cross-references located.
- **Review.** confirmed (REV-LefschetzPencilsAndVanishingCycles--LPV.7): Checked the manuscript page image and the two numbered statements; The displayed isomorphism from the stratum pushforward to the restricted higher direct image is Proposition1.1.2(1). Part(2) is the residue exact sequence, not this isomorphism.

## Gaps

Eighteen gaps: twelve in the LPV.0 part and six in the LPV.7 part. Seven of the LPV.0 part's gaps are source or supplier gaps (an unread primary proof, or a general theorem another roadmap must supply). The five whose ids begin `G-review-` were added by its review and record what a revision must do: restore the hypotheses of the suggested signatures, complete the definition APIs and tests, source the semisimple trace, name the maps of the middle reduction, and split the whole-stage supplier dependencies. The LPV.7 part's G-suggested-premises is the same kind of record for its suggested forms.

#### G-algebraic-PL — Original algebraic Picard–Lefschetz proof interior (LPV.0 part)

Illusie, Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268, DOI 10.2969/aspm/03610249: publisher PDF was blocked. The author’s 2021 §6.1 and §6.3 and ErrPL.pdf were read and give the algebraic two-component route and corrected concentration range. The original blowup/base-change calculation determining the odd sign still needs its primary proof read and checked. It is not replaced by SGA 7’s transcendental proof or by LPV.7.

Needed by: `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

#### G-nonordinary — Original nonordinary concentration hypotheses (LPV.0 part)

FSY §5.1.3 was read and verifies the characteristic-two application and middle concentration it cites. Illusie, Perversité et variation, Manuscripta Math. (2003), Corollary 2.10, DOI 10.1007/s00229-003-0407-z, was not obtained; its exact general class of isolated quadratic singularities and proof need checking before widening the FSY application.

Needed by: `LPV.2/isolated-nonordinary-quadratic-concentration`.

#### G-approximation — General henselian approximation and versality sources (LPV.0 part)

The SGA 7 XV cited application and quadratic models were read. Artin’s original Lemma 5.10 and Elkik’s original versality proof were not read. Their general results are requested as SchemeAndStackFoundations, Part II; the LPV nodes contain only their quadratic applications.

Needed by: `LPV.2/tougeron-artin-implicit-function-theorem`, `LPV.2/elkik-versal-henselian-deformations`.

#### G-adic-comparison — Inertia-equivariant scheme/adic nearby comparison (LPV.0 part)

Caraiani–Scholze §4.6 uses Huber’s finite-level comparison, but its full admissibility hypotheses and the coherence with each inertia automorphism have not been checked in Huber’s primary proof. EDC.6 must supply the exact comparison domain and equivariant square; no general analytic identification is asserted.

Needed by: `LPV.0/scheme-adic-trait-comparison`, `LPV.6/perverse-coefficients-and-comparison`.

#### G-padic-Lie — Compact Q_l subgroup Lie theory (LPV.0 part)

Weil I 5.10–11 were read, but the p-adic closed-subgroup theorem and exp/log charts needed to pass from equality of Lie algebras to openness have not been read in their primary proof. Real LieGroups’ Cartan theorem is insufficient. The specific compact-matrix-group lemma remains here with this gap and a LieGroups, Part II proposal.

Needed by: `LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `LPV.5/kazhdan-margulis-open-image`.

#### G-orthogonal-integrality — Orthogonal rationality/integrality proof interior (LPV.0 part)

Weil II 4.4.8–9 was read. The proof interior 4.4.5–7 constructing the rational integral cycle lattice was not freshly read; its exact character and cross-ℓ comparison contracts are requested from DWP.4 and CharacterTheory. ADE is conditional on these inputs, not inferred from a finite ℚ_ℓ image alone.

Needed by: `LPV.5/finite-orthogonal-ade`.

#### G-finiteness-source — Excellent-trait finiteness proof (LPV.0 part)

Illusie’s classical-trait finiteness statement and PR196 EtaleBaseChange’s precise finite-type constructibility contract were read. The original SGA 4½ finiteness proof is not freshly read here; it belongs to that upstream supplier. The LPV hypotheses retain excellence and finite-type/finite-Tor restrictions.

Needed by: `LPV.0/constructibility-and-finite-amplitude`.

#### G-review-signature-fidelity — Geometric and coefficient hypotheses missing from suggested signatures (LPV.0 part)

Re-state the flagged signatures using genuine supplied geometric data and coefficient categories. Arbitrary functors, maps, t-structures, representations and models do not satisfy the advertised geometric theorems. The review report gives counterexamples and a per-node list. If an unavailable hypothesis cannot be stated, omit the affected theorem prototype and record its missing form; do not universally assert its conclusion.

Needed by: 79 nodes: `LPV.0`, `LPV.1`, `LPV.2`, `LPV.3`, `LPV.4`, `LPV.5`, `LPV.6`.

#### G-review-definition-api-tests — Usable geometric API and faithful unit-test realization (LPV.0 part)

Complete definition/construction extensionality, transport/functoriality, coefficient-change and universal-property interfaces on actual geometric carriers; implement the packet’s tests with the named models. Counts of comments or API names do not establish these contracts. See the nineteen-row definition/construction audit in the review.

Needed by: 17 nodes: `LPV.0`, `LPV.1`, `LPV.2`, `LPV.3`, `LPV.4`.

#### G-review-semisimple-trace-source — Primary source for admissible semisimple trace gradings (LPV.0 part)

Kisin–Pappas 4.7.1 uses semisimple trace and refers elsewhere for its construction; it does not prove the packet’s admissible-grading/refinement theorem. Read the primary construction and specify actual common exact refinements, finite inertia and Frobenius normalization. TraceFormula Layers 2–3 provide ordinary enhanced trace additivity, not the entire semisimple-nearby-trace theorem.

Needed by: `LPV.1/semisimple-nearby-trace`.

#### G-review-middle-filtration — Explicit middle Leray filtration and its two radical cases (LPV.0 part)

Specify the maps and subquotients in Weil I 7.1, p. 300: in the nonradical case H¹(D,j*E) surjects onto H¹(D,Rⁿf*), while H¹(D,j*E) injects into H¹(D,j*(E/(E∩E⊥))); in the radical case use the intervening sheaf F and the skyscraper exact sequence (7.1.4)–(7.1.5). Include the zero-cycle case and retain Leray differentials; do not leave the target as an unspecified relevant kernel/quotient.

Needed by: `LPV.4/pencil-leray-and-middle-reduction`.

#### G-review-supplier-order — Supplier scope and cross-roadmap stage ordering (LPV.0 part)

Split the DWP.4↔LPV.5 and IG.4↔LPV.6 whole-stage dependencies into actual independent prefixes and later applications. Reuse SL₂ classification with its requested nilpotent-Jordan extension; request ℚ_ℓ classical-group interfaces as Part II; use SF.4 for the requested blowup extension. The removed DWP.1 relative-filtration dependency was an incorrect supplier, and DWP.5 is a downstream consumer.

Needed by: `LPV.1/primitive-decomposition-and-strictness`, `LPV.1/normal-crossings-tame-restriction`, `LPV.3/incidence-pencil-blowup`, `LPV.5/conditional-orthogonal-open-or-finite`, `LPV.5/finite-orthogonal-ade`, `LPV.5/integral-failure-and-arithmetic-routing`, `LPV.6/igusa-semiperversity-interface`.

#### G-complex-mhs — Geometric mixed-Hodge cross (LPV.7 part)

Deligne3.6.4 gives the complex result and cites Steenbrink, but the complete construction/compatibility proof of geometric MHS on inertia invariants and support cohomology has not been extracted here. HodgeStructures L2 supplies only the abstract mixed-Hodge category and strictness. The first page of Steenbrink’s Oslo article was inspected; its isolated-singularity abstract does not establish the required general projective-disk contract. Complete the source proof in HodgeStructures PartII, including weight bounds≤i and≥i+1 and the Betti localization/Wang morphisms; retain projective factorization.

Needed by: `LPV.7:invariant-cycles/complex-local-invariant-cycles`.

#### G-trait-purity — Trait-scope purity interface (LPV.7 part)

Saito03 Proposition 1.1.1(2) and Lemma 1.1.4 require relative purity for a strictly semistable morphism over a DVR and stratum fundamental classes in a regular trait ambient scheme. The read EDC.2/3 field/smooth interfaces do not certify this scope. The requests state the exact extension; certify its source and coefficient hypotheses before implementation, without replacing the singular morphism by a smooth one.

Needed by: `LPV.7:semistable-curves/snc-nearby-cycle-description`, `LPV.7:semistable-curves/snc-graded-nearby-complex`, `LPV.7:semistable-curves/snc-restriction-gysin-differential`.

#### G-filtered-realization — Filtered étale realization and convergence (LPV.7 part)

Mathlib at the pin has spectral sequences and spectral objects. Its general machinery has not been connected to the constructible étale nearby category: construct the bounded filtered hypercohomology spectral object, page-one comparison, convergence maps and abutment filtration. The suggested file checks the existing carriers and linear/page shapes, with geometric premises explicitly omitted; it is not a formal geometric spectral sequence. Certify the column bound [-d,d] and the stabilized page 2*d+2 maps; d+2 is not a general convergence bound.

Needed by: `LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LPV.7:semistable-curves/snc-monodromy-and-curve-comparison`.

#### G-complex-pencil — Constructible-complex pencil contracts (LPV.7 part)

LPV.3–5 must supply the generic-local-acyclic incidence-line and relative-cone interfaces for arbitrary constructible K, with the finite-support proof and normalized duality exchanges. The source statements and proof route are read and planned here; the existing ordinary quadratic/transvection nodes do not certify this extension. Requests require the exact 6.2.10–12 generality, arithmetic model transport and 4.3.6–8 route, without DWP.9.

Needed by: `LPV.7:invariant-cycles/potential-purity-incidence-pullback`, `LPV.7:invariant-cycles/pencil-relative-obstruction`, `LPV.7:invariant-cycles/pencil-image-equality`, `LPV.7:invariant-cycles/general-pencil-monodromy`, `LPV.7:invariant-cycles/global-invariant-cycles`.

#### G-geometric-tests — Realization of geometric acceptance instances (LPV.7 part)

The graph and unipotent linear calculations discriminate the sign and rank, but no actual proper I₂ model is implemented or certified at the pinned baseline. Complete the EllipticCurves/StableReduction supplier contract for the regular split two-component two-node genus-one model and compare its Jacobian Tate action; also realize the smooth and bridge tests. This packet does not count a matrix as an algebraic family.

Needed by: `LPV.7:semistable-curves/smooth-and-split-cycle-examples`.

#### G-suggested-premises — Geometric premises absent from suggested signatures (LPV.7 part)

The pinned libraries do not expose the full constructible étale category, geometric nearby/purity realization, generic incidence contracts or arithmetic potential-purity predicate. The suggested signatures use existing Scheme, DerivedCategory, ModuleCat, Representation, linear maps and spectral-sequence carriers, and mark exactly which geometric premises or realizations are omitted. Complete these supplier interfaces and strengthen the signatures before treating them as the mathematical theorems. All nodes remain implementationStatus unchecked.

Needed by: 35 nodes: `LPV.7:invariant-cycles`, `LPV.7:semistable-curves`.

## Requests to other roadmaps

Forty-four requests: 21 from the LPV.0 part and 23 from the LPV.7 part. Several ask for a Part II of the supplier, which the "Structural proposals" section collects. Five of the LPV.7 part's requests are addressed to this roadmap's own LPV.0-part stages (LPV.0, LPV.1, LPV.3, LPV.4, LPV.5); Dependencies says which nodes answer them.

| Supplier | Part | Need | Consumers |
|---|---|---|---|
| `ArithmeticGaloisRepresentations:R01.2` | LPV.0 | The henselian Galois specialization exact sequence and the valuation inertia comparison; tame/wild inertia and t_ℓ:I→ℤ_ℓ(1), its Kummer reductions, uniformizer independence, conjugation and ramification-index restriction. Supply the geometric local-monodromy theorem for constant ℚ_ℓ cohomology of finite-type families (also compact supports), with its exact hypotheses, and the distinct representation-theoretic residue-field hypotheses. Finite inertia averaging and Frobenius-normalization contracts are used without duplicating the inertia carrier. | `henselian-trait-conventions-and-galois-sheaves`, `coefficient-and-trait-change`, `normalized-can-var`, `finite-monodromy-logarithm`, `geometric-quasi-unipotence`, `finite-extension-and-logarithm-rescaling`, `normal-crossings-tame-restriction`, `semisimple-nearby-trace`, `two-component-semistable-nearby-complex`, `twisted-monodromy-equivariance`, `odd-relative-dimension-picard-lefschetz-3-3`, `local-picard-lefschetz-formula`, `variation-in-a-standard-quadratic-degeneration`, `quadratic-character-in-characteristic-two`, `fsy-discriminant-example`, `finite-field-pencil-descent`, `bertini-surjectivity-on-fundamental-groups`, `kazhdan-margulis-open-image` |
| `DeligneWeightsAndPurity:DWP.4` | LPV.0 | Weil-I finite-field descent and dimension/tensor-power induction; the rational-character and cross-ℓ comparison inputs to Weil II 4.4.5–9 and the character/gcd applications 4.5.1–2. The odd geometric open-Sp theorem does not import a weight theorem. | `finite-orthogonal-ade`, `integral-failure-and-arithmetic-routing` |
| `EnhancedDerivedSheaves:E0` | LPV.0 | A coherent filtered derived category of actual étale module sheaves, functorial cones, total complexes and filtered quasi-isomorphisms; enough coherence to compare the can/var triangle and the two-component Rapoport–Zink double complex without choosing nonfunctorial cones. | `two-component-semistable-nearby-complex`, `variation-morphism`, `derived-nearby-cycles-RPsi-and-vanishing-triangle` |
| `EnhancedDerivedSheaves:E1` | LPV.0 | The enlarged derived étale category and filtered colimits with uniform finite cohomological amplitude; actual geometric stalk and qualified costalk colimit comparisons for the support criterion. This category must permit nonconstructible colimits. | `oriented-product-comparison`, `filtered-colimit-support-criterion` |
| `EnhancedDerivedSheaves:E4` | LPV.0 | Derived adic completion/realization of compatible ℤ/ℓ^r complexes with uniform amplitude, derived inverse-limit control and rationalization; no underived inverse-limit substitute. | `coefficient-and-trait-change`, `adic-nearby-cycle-realization` |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality` | LPV.0 | The constructible Verdier dualizing objects, biduality and tensor/trace coherence on the geometric fibres, with finite and rational coefficient conventions; Gabber’s nearby duality is the LPV target built on them. | `nearby-verdier-duality` |
| `EtaleDualityAndPerverseSheaves:EDC.3` | LPV.0 | EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin/trace diagrams for regular pairs over an excellent henselian trait, with invertible torsion coefficients. The existing EDC.3 smooth-pair statements over a field supply stratum maps but not this trait extension. Supply the regular semistable total-space comparison used by the early two-component nearby complex and its algebraic Picard–Lefschetz application, without perverse, weight or hard-Lefschetz inputs. | `two-component-semistable-nearby-complex`, `odd-relative-dimension-picard-lefschetz-3-3` |
| `EtaleDualityAndPerverseSheaves:EDC.4` | LPV.0 | General codimension-two smooth blowup cohomology, with maps π* plus exceptional Gysin and the inverse exceptional minus sign; weak Lefschetz/connectedness and smooth complete-intersection cohomology in the required finite and rational coefficient ranges. LPV owns the pencil incidence identification and restriction/Gysin calculation, not this general theorem. | `cohomology-of-smooth-quadrics`, `lefschetz-pencil`, `inseparable-gauss-and-low-dimension`, `pencil-restriction-and-gysin`, `pencil-leray-and-middle-reduction`, `hypersurface-outside-middle` |
| `EtaleDualityAndPerverseSheaves:EDC.5` | LPV.0 | EtaleDualityAndPerverseSheaves, Part II: Early perverse t-structures on finite-type schemes over fields and the rectified trait dimension function, the p/p+ integral conventions, support/cosupport criteria, gluing and intermediate extension as the image of !→*. Supply their enlarged nonconstructible extension and the precise finite-cohomological-dimension hypotheses under which geometric stalks/costalks commute with filtered colimits. No purity or decomposition theorem is required. These trait/integral/enlarged extensions are requested; the existing finite-field constructible scope does not already provide them. | `nearby-perverse-exactness`, `vanishing-perverse-exactness`, `nearby-verdier-duality`, `intermediate-extension-exchange`, `filtered-colimit-support-criterion` |
| `EtaleDualityAndPerverseSheaves:EDC.6` | LPV.0 | Finite/derived-adic/rational realization with perverse shift and duality conventions; Huber’s admissible finite-type scheme/formal-completion/adic nearby comparison, including specialization and inertia equivariance. The analytic comparisons are imported on their stated domain, not extended to all analytic spaces. | `adic-nearby-cycle-realization`, `scheme-adic-trait-comparison`, `complex-picard-lefschetz-comparison`, `perverse-coefficients-and-comparison`, `igusa-semiperversity-interface` |
| `FiniteFieldsAndCharacterSums:FF.0` | LPV.0 | Finite-field extension arithmetic and Frob_(q^r)=Frob_q^r. The scheme-theoretic finite residue field of a closed point of the good-axis open comes from SchemeAndStackFoundations:SF.0, not from this field-arithmetic stage. | `finite-field-pencil-descent` |
| `IgusaVarietiesAndTorsionConcentration:IG.4` | LPV.0 | The actual cofinal finite-level formal models, tower/boundary transition maps and common semiperverse lower bound of Caraiani–Scholze §4.6, with its finite-cohomological-dimension hypotheses. LPV returns the nearby and colimit-support interface, not the Igusa tower geometry. | `igusa-semiperversity-interface` |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.1` | LPV.0 | Algebraic tame inertia conjugacy, Abhyankar and SGA 1 XIII specialization; the tame presentation of P¹ minus a finite set by local generators with product relation, and π₁(P¹)=1 over an algebraically closed field. Do not replace these by the topological complex presentation in positive characteristic. | `normal-crossings-tame-restriction`, `cohomology-sheaves-of-a-lefschetz-pencil`, `vanishing-subspace`, `bertini-surjectivity-on-fundamental-groups`, `vanishing-cycles-are-conjugate`, `monodromy-generated-by-local-transvections`, `characteristic-two-transverse-monodromy` |
| `SchemeAndStackFoundations:SF.0` | LPV.0 | Import existing projective spaces, dual projective spaces, Grassmannians, projective tangent spaces and Veronese morphisms from the upstream ProjectiveSchemesAndSmoothMorphisms roadmap. Supply excellent local-ring and completion interfaces and Severi–Brauer ambient quadrics. General Artin Jacobian-square approximation and Elkik henselian/formal versality/algebraization, beyond the existing carrier, are SchemeAndStackFoundations, Part II; LPV plans only their quadratic applications. Also supply the finite-type closed-point residue-field theorem (Zariski lemma) for finite-field good-axis descent. | `constructibility-and-finite-amplitude`, `ordinary-quadratic-form`, `normal-form-of-ordinary-quadratic-forms`, `discriminant-double-cover-of-an-even-quadric`, `smooth-quadric`, `ordinary-quadratic-point`, `tougeron-artin-implicit-function-theorem`, `elkik-versal-henselian-deformations`, `dual-variety`, `existence-of-lefschetz-pencils`, `ordinary-axis-open-and-jet-separation`, `incidence-pencil-blowup`, `bertini-surjectivity-on-fundamental-groups`, `finite-field-pencil-descent` |
| `SchemeAndStackFoundations:SF.4` | LPV.0 | SchemeAndStackFoundations, Part II, in the birational-geometry direction: The Rees-algebra blowup universal property and affine charts for a regular two-generated ideal, with the empty-center identity case. The incidence equation is specialized to a pencil inside LPV.3; general blowup geometry remains with its owner. SF.1 is the descent/stacks stage, not an existing Rees-algebra blowup theorem; this precise extension is requested from SF.4. | `incidence-pencil-blowup` |
| `SchemeAndStackFoundations:SF.2` | LPV.0 | Integration contract, not a second plan: re-export the existing PR196 ConstructibleEtale layers 0–3 (small-étale morphisms, stalks, Galois descent, lisse representations and paths), 7–9 (derived complexes), EtaleBaseChange layers 2–8 (Rf*, Leray, coherent exchange maps, smooth/proper base change with their distinct hypotheses, proper-direct-image constructibility and finite-type cohomological-dimension bounds; the nonproper excellent-trait nearby-cycle finiteness theorem is still G-finiteness-source, local acyclicity and lissity), EllAdicRealization derived compatible systems and TraceFormula finite-dimensional trace/additivity. Read PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. ComplexComparison layers 8–12 must supply Riemann existence, relative comparison and cup/trace orientation compatibility for the algebraic ordinary degeneration. General carriers remain owned upstream; SF.2 is the atlas external entry’s integration_owner. | `henselian-trait-conventions-and-galois-sheaves`, `functor-psi-and-functorialities`, `derived-nearby-cycles-RPsi-and-vanishing-triangle`, `derived-functorialities-and-specialization-sequence`, `geometric-fibre-site-morphisms`, `constructibility-and-finite-amplitude`, `semisimple-nearby-trace`, `lefschetz-degeneration-specialization-sequence`, `homotopy-invariance-of-etale-cohomology`, `cohomology-of-a-cone`, `cohomology-of-a-punctured-cone`, `complex-picard-lefschetz-comparison`, `finite-field-pencil-descent`, `cohomology-sheaves-of-a-lefschetz-pencil`, `vanishing-subspace`, `pencil-leray-and-middle-reduction`, `bertini-surjectivity-on-fundamental-groups`, `vanishing-cycles-are-conjugate`, `monodromy-generated-by-local-transvections`, `characteristic-two-transverse-monodromy`, `integral-failure-and-arithmetic-routing` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values` | LPV.0 | Rational/integral character values and descent for the finite reflection-group representation, as needed by Weil II 4.4.5–9; finite ℚ_ℓ image by itself does not supply an integral rational root lattice. | `finite-orthogonal-ade` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation` | LPV.0 | Consume the existing complex classical-group carriers. Request ClassicalGroups, Part II for their fixed ℚ_ℓ form-preserving group/Lie-algebra and topology interfaces. The merged Layer 0 is over C and does not prove Weil II 4.4’s orthogonal alternatives: LPV owns those source-specific alternatives and must state their reflection-generation and irreducibility hypotheses. | `conditional-orthogonal-open-or-finite` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine` | LPV.0 | Import the characteristic-zero SL₂ module classification, symmetric powers and Clebsch–Gordan rule from the existing upstream engine; the specific nilpotent Jordan-block SL₂ realization needed for Deligne 1.6.8 is an extension in that direction, LieHighestWeight, Part II, rather than a second general Jacobson–Morozov plan. | `primitive-decomposition-and-strictness`, `tensor-dual-and-symmetric-monodromy` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification` | LPV.0 | Classification of irreducible simply-laced integral positive-definite root systems as A,D,E and identification of the reflection group with the Weyl group, after LPV’s lattice hypotheses have been proved. | `finite-orthogonal-ade` |
| `SchemeAndStackFoundations:key/excellent-schemes` | LPV.0 | Import the reserved excellent-schemes predicate and its excellent affine/local-ring interfaces (G-ring, J-2, universal catenarity) from SchemeAndStackFoundations. Reuse this carrier for finite-type nearby-cycle finiteness and the excellent regular-trait purity/approximation applications; no excellence definition is planned in LPV. | `constructibility-and-finite-amplitude`, `geometric-quasi-unipotence`, `two-component-semistable-nearby-complex`, `tougeron-artin-implicit-function-theorem` |
| `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs` | LPV.7 | Import the finite normalization, two-branch node schemes, local uv=a charts with thicknesses, geometric component set and oriented dual multigraph retaining loops/multiple edges; identify ker ∂=H₁ and coker d=H¹ with their dual integral lattices and signed orientation/Galois transports. This packet adds only the étale realization of those supplied geometric objects. | `normalization-differential`, `normalization-etale-resolution`, `nodal-nearby-cycle-sheaves`, `curve-choice-basechange-compatibility` |
| `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces` | LPV.7 | For an original nodal chart uv=π^n and ramification index e, supply the regular semistable resolution of the resulting thickness e*n chart, its exceptional rational chain, and the graph subdivision replacing the thick edge by e*n unit-thickness edges. Include proper pullback on cohomology, preservation of graph H1, scaling of the weighted edge pairing by e, and invariance of component H1 under the rational subdivision. The e-edge formula is only the n=1 case. | `curve-choice-basechange-compatibility` |
| `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models` | LPV.7 | Supply the actual proper regular split genus-one I₂ model of the EllipticCurves Layer4 Tate example with v(q)=2: special fibre two smooth rational components meeting transversely at two nodes, smooth connected generic fibre, and its Picard/Jacobian identification. Also supply a smooth proper curve model and a two-component bridge instance. An abstract graph or reduction-symbol datatype is insufficient. | `smooth-and-split-cycle-examples` |
| `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | LPV.7 | Supply the split Tate elliptic curve with parameter q=π² over a complete discretely valued field (choose residue characteristic≠2 if using a Weierstrass construction), its regular I₂ fibre through StableReduction Layer5, and the Galois-equivariant Tate-module realization. Retain the distinction between the point-level Tate uniformization and the geometric component model. | `smooth-and-split-cycle-examples` |
| `AbelianSchemesAndArithmeticModuli:A3` | LPV.7 | Supply the smooth proper curve Picard/Jacobian realization H¹(C_η̄,ℤ_ℓ)(1)≅TℓJac(C_η̄), including its trace-dual pairing, compatibility with component Picard varieties, specialization and descent; use R11.4 for the semistable identity component and character lattice. | `jacobian-tate-realization` |
| `EtaleDualityAndPerverseSheaves:EDC.0` | LPV.7 | Supply bounded constructible ℓ-adic complexes, integer-indexed hypercohomology and Tate twist, conservative geometric stalks, finite normalization pushforward, proper/smooth base change and rational coefficient passage from compatible torsion towers. Supply finite-presentation/limit descent of families and complexes, generic local acyclicity for hyperplanes and incidence lines, localization cones and relative hypercohomology, and the exact bridge from finite filtered nearby complexes to Mathlib spectral objects with convergence and induced filtration maps. Ordinary DerivedCategory and SpectralSequence alone do not supply this geometric interface. | `normalization-etale-resolution`, `snc-weight-spectral-sequence`, `invariant-specialization`, `arithmetic-spreading`, `geometric-generic-pure-model`, `potentially-pure-model`, `potential-purity-incidence-pullback`, `dual-support-affine-vanishing`, `support-bound-weak-lefschetz`, `pencil-relative-obstruction`, `general-pencil-monodromy`, `continuous-wang-sequence` |
| `EtaleDualityAndPerverseSheaves:EDC.1` | LPV.7 | Supply the localization nine-diagram comparison with explicit boundary signs and the cup-product/coboundary rule used in Illusie91 Lemma 1.5.4; compare the two node connecting maps as negatives, rather than only giving an unsigned exact sequence. | `node-residue-variation-sign` |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality` | LPV.7 | Supply support duality for constructible complexes, biduality and pullback exchange including all shifts and Tate twists. In the trait cross identify H^{i+1}_{X_s}(X,K)=H^{−i−1}(X_s,DK)^∨ with the correct total/arithmetic dualizing normalization. For a generic-local-acyclic codimension-one section use D_Y i*K=i*DK(−1)[−2]; for the incidence smooth/generic-line composite justify the cancelling normalized identity D(i*q*K)=i*q*DK. Compatibility of every map in the cross and pencil cone is required. | `localization-duality-cross`, `potential-purity-incidence-pullback`, `pure-complex-local-invariant-cycles`, `dual-support-affine-vanishing`, `support-bound-weak-lefschetz` |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings` | LPV.7 | Supply the perfect trace pairing for smooth proper component curves, H²(C,Λ)=Λ(−1), sum of component trace maps to connected generic H², and the compatibility of residue/cospecialization maps with cup products. Preserve the integral branch duality and distinguish H₁ from H¹. | `curve-specialization-sequence`, `curve-normalization-cohomology`, `nodal-nearby-cycle-sheaves` |
| `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity` | LPV.7 | Supply the smooth-total-space support duality/trace normalization for the Weil II 3.6 cross, plus the relative fundamental-class isomorphism Λ≅Rf!Λ(−d)[−2d] for the strict semistable trait morphism in Saito03 Proposition 1.1.1(2). Smooth-morphism purity alone does not cover that singular trait morphism; record the trait extension explicitly. | `snc-nearby-cycle-description`, `localization-duality-cross` |
| `EtaleDualityAndPerverseSheaves:EDC.3` | LPV.7 | Supply intersection-stratum regular-immersion fundamental classes and residue/Gysin maps over the trait in Saito03 Lemma 1.1.4, and restriction/Gysin/projection/self-intersection compatibility over the residue field. For the ordered strata, prove the mixed alternating compositions cancel using the principal vertical divisor. This is the exact input to Saito03 Proposition 2.2.6; smooth pairs over a field alone do not justify the regular ambient DVR purity step. | `snc-nearby-cycle-description`, `snc-restriction-gysin-differential` |
| `EtaleDualityAndPerverseSheaves:EDC.4` | LPV.7 | Supply affine Artin vanishing H^a(A,F)=0 for a>dimSupp F for constructible sheaves and its hypercohomology support-bound consequence. With dimSupp ℋ^q(DK)≤−n−1−q, deduce H^{−i}(A,DK)=0 for i≤n and hence H_c^i(A,K)=0 by duality. No hard Lefschetz input is allowed. | `dual-support-affine-vanishing` |
| `EtaleDualityAndPerverseSheaves:EDC.5` | LPV.7 | Supply the early middle perverse category over the special-fibre field, its exactness operations and normalized L[d] statement over rational ℓ-adic coefficients. Justify the strict-semistable instance RΨℚ_ℓ[d] perverse by the source’s kernel/image calculation or the independently proved nearby t-exactness interface. Integral p/p+ conventions require their own extension and are not imported from rational self-duality. | `snc-graded-nearby-complex` |
| `ArithmeticGaloisDuality:R02.1` | LPV.7 | Supply actual continuous inertia representations on finite-dimensional rational ℓ-adic hypercohomology and compatible inverse-limit cohomology for torsion towers. For I′=ker(I→ℤ_ℓ(1)), prove exactness of invariants and coinvariants on compatible torsion systems by averaging over its finite prime-to-ℓ quotients; I′ includes wild inertia and all other tame prime factors. Identify V^{I′}≅V_{I′} and their induced ℤ_ℓ(1)-actions. Relate continuous fixed subspaces to Mathlib Representation.invariants. Preserve tℓ, Galois descent and invariants under arithmetic spreading. | `invariant-specialization`, `arithmetic-spreading`, `continuous-wang-sequence` |
| `ArithmeticGaloisDuality:R02.2` | LPV.7 | Supply continuous Hochschild–Serre for the generic fibre and the cohomological-dimension-one tame quotient, including the twisted coinvariant term and the Wang short exact sequence for bounded constructible rational complexes. Use ℓ-adic continuous cohomology, not cohomology of the abstract underlying discrete group. | `continuous-wang-sequence` |
| `DeligneWeightsAndPurity:DWP.5` | LPV.7 | Supply Weil II 1.8.8’s local invariant weight bound: at a finite-field boundary point, inertia invariants of a punctually pure local system of weight i have weights≤i; retain the local Frobenius/tame conventions. This plus proper upper bounds and smooth support duality proves the weight cross, without DWP.9. | `invariant-and-support-weight-bounds` |
| `LefschetzPencilsAndVanishingCycles:LPV.1` | LPV.7 | Supply the tame twisted nilpotent logarithm N:V→V(−1), finite monodromy filtration with its center, kernel/image convolution in an abelian category, generator/ramified-character compatibility, and comparison of log T with T−1 on graded pieces. The curve instance requires T=1+tℓN and N²=0; the general filtered nearby instance uses the shifted-perverse rational category and does not infer filtration equality on cohomology. | `node-residue-variation-sign`, `curve-monodromy-factorization`, `curve-inertia-invariants`, `curve-monodromy-filtration`, `curve-choice-basechange-compatibility`, `snc-nearby-cycle-description`, `snc-graded-nearby-complex` |
| `LefschetzPencilsAndVanishingCycles:LPV.0` | LPV.7 | Extend the imported finite-torsion nearby/vanishing-cycle triangles, variation maps and functoriality to compatible ℓ-power towers and their rational ℓ-adic realization. Prove compatibility of proper base change, local stalk calculations, specialization and support localization with this coefficient passage; EDC.0 supplies the constructible category and inverse-limit realization, and R02.1 supplies continuous cohomology. The finite-torsion declarations alone do not justify the rational statements in this packet. | `nodal-nearby-cycle-sheaves`, `node-residue-variation-sign`, `curve-specialization-sequence`, `curve-choice-basechange-compatibility`, `snc-nearby-cycle-description`, `snc-weight-spectral-sequence`, `invariant-specialization`, `continuous-wang-sequence` |
| `LefschetzPencilsAndVanishingCycles:LPV.3` | LPV.7 | Supply the projective incidence scheme, smooth projection q to X, generic-local-acyclic parameter open U for every relevant cohomology sheaf of an actual constructible complex K, and sufficiently general lines with marked sections and incidence duality exchanges. Ordinary constant-sheaf Lefschetz pencils do not cover arbitrary K in Weil II 6.2.10–12. | `potential-purity-incidence-pullback`, `pencil-image-equality`, `general-pencil-monodromy` |
| `LefschetzPencilsAndVanishingCycles:LPV.4` | LPV.7 | Supply the sufficiently general pencil total space and axis maps for constructible complexes, their pushforward-to-axis cone and restriction comparison. Under the dual-support bound prove the finite-support conditions on negative cohomology of the relative obstruction complex used in Weil II 4.3.6–8 and 6.2.11(ii). This contract excludes the hard-Lefschetz orthogonal splitting4.3.9. | `pencil-relative-obstruction`, `pencil-image-equality` |
| `LefschetzPencilsAndVanishingCycles:LPV.5` | LPV.7 | Supply tame-cover specialization preserving the full local inertia image in Weil II 1.11.3, general-line surjectivity π₁(V)→π₁(U) in the incidence setup of 6.2.10, and local-inertia generation/torsor extension on P¹ for4.3.6. Equality of representation images, not just a dimension calculation, is needed. Imported ordinary transvection formulas alone do not suffice. | `arithmetic-spreading`, `pencil-relative-obstruction`, `general-pencil-monodromy` |
| `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne` | LPV.7 | Import mixed-Hodge structures and strictness/exactness of the weight filtration from L2. The geometric Betti/support/limit MHS of the projective disk family, their maps and separated weight bounds are an extension beyond that linear-algebraic contract, recorded as G-complex-mhs and proposed HodgeStructures PartII below; do not infer them from strictness alone. | `complex-local-invariant-cycles` |
| `ComplexComparisonPartII:C5` | LPV.7 | Supply the actual rational Betti realization and de Rham–Betti comparison for the projective algebraic/analytic family, with localization and topological Wang maps over the disk. This comparison does not by itself construct the geometric mixed-Hodge structures needed for Weil II 3.6.4. | `complex-local-invariant-cycles` |

## Requests from other roadmaps

Other roadmaps' packets file sixteen requests with this roadmap. Each is answered below by the nodes that supply it, or marked as not yet planned here.

| From | Asks | Answered by |
|---|---|---|
| AutomorphicGaloisRepresentations R19.2/carayol-vanishing-cycle-filtration → LPV.0 | The vanishing-cycle exact sequence of a proper curve over a strictly henselian trait with lisse coefficients, compatible with finite étale covers and group actions (Carayol 4.2–4.5). | `LPV.0/derived-functorialities-and-specialization-sequence` (the inertia-equivariant sequence of a proper family, for any bounded-below torsion complex, so for a lisse sheaf), with `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` and `LPV.0/adic-nearby-cycle-realization`. Compatibility with group actions is naturality of these maps; it is not a separate node. |
| AutomorphicGaloisRepresentations R19.2/carayol-special-places → LPV.7:semistable-curves | Picard–Lefschetz for a stable curve with lisse coefficients F: the image of N on H¹(X_η̄, F)(1) (Carayol 11.4–11.10). | For constant coefficients: `LPV.7:semistable-curves/curve-monodromy-factorization` (N = c′ ∘ u− ∘ c, with image the graph part c′(H¹(Γ)) = ker(H¹(Y) → ⊕H¹(Ỹ_v))) and `curve-monodromy-filtration`. Lisse nonconstant F is not planned. |
| ClassicalAdicEtaleCohomology H1 → LPV.0 | RΨ_η, RΦ and the triangle for an arbitrary torsion coefficient ring, with the prime-to-p hypothesis attached only to the theorems that need it; change of trait to S̄ with the colimit description. | Partly. `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` states the construction with coefficients prime to p (SGA 7 XIII 2.1.1), and `LPV.0/derived-functorialities-and-specialization-sequence` covers dominant change of traits. Moving the prime-to-p hypothesis from the definition to the theorems is not yet done. |
| ClassicalAdicEtaleCohomology H1 → LPV.1 | N for a finite E[I]-module with unipotent continuous action, E = ℤ/ℓ^n, functorial for isomorphisms. | Not as asked. `LPV.1/finite-monodromy-logarithm` defines N in characteristic zero; over ℤ/ℓ^n the logarithm needs (T − 1)^d = 0 with d ≤ ℓ, so a finite-level N exists only under that bound. The rational N transports along isomorphisms (`finiteLog_conj`). |
| CrystallineCohomology CR.5:log-algebra/log-abhyankar → LPV.5 | The classical Abhyankar lemma over a regular noetherian strict normal-crossings pair. | Not planned here: LPV.5 imports Abhyankar's lemma from InverseGaloisAndArithmeticFundamentalGroups IG.1, which is its owner. |
| DeligneWeightsAndPurity DWP.6 → LPV.3 | A Lefschetz pencil over 𝔽_q after a Veronese embedding and a finite extension, with axis, line, blowup and singular set; and the general-position pencils on a surface with normal-crossings boundary of Weil II §3.1. | The first: `LPV.3/existence-of-lefschetz-pencils`, `LPV.3/incidence-pencil-blowup` and `LPV.3/finite-field-pencil-descent`. The second is not planned. |
| DeligneWeightsAndPurity DWP.3, DWP.6 → LPV.4 | R^n f_*ℚ_ℓ on U, the π₁(U₀)-stable vanishing part ℰ over 𝔽_q, the cup-product pairing, and geometric constancy of R^i f_*ℚ_ℓ (i ≠ n), R^n/ℰ and ℰ ∩ ℰ^⊥ (Weil I §5). | `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LPV.4/vanishing-subspace`, `LPV.4/vanishing-quotient-and-its-pairing` and `LPV.4/global-fixed-and-local-fixed-interface`, with descent to 𝔽_q by `LPV.3/finite-field-pencil-descent`. Geometric constancy of R^n/ℰ and of ℰ ∩ ℰ^⊥ is not stated by any node. |
| DeligneWeightsAndPurity DWP.5 → LPV.1 | Quasi-unipotence, N : V → V(−1), the centred filtration, primitive and SL₂ strings, Clebsch–Gordan, duality, relative filtrations, geometric Frobenius signs. | `LPV.1/geometric-quasi-unipotence`, `finite-monodromy-logarithm`, `monodromy-filtration`, `primitive-decomposition-and-strictness`, `tensor-dual-and-symmetric-monodromy`, `relative-monodromy-uniqueness` (uniqueness; existence under weights stays with DWP.5) and `twisted-monodromy-equivariance`. |
| DeligneWeightsAndPurity DWP.6 → LPV.2 | The vanishing-cycle triangle, the five-term specialization sequence, the normalization resolution and the nodal branch sign line. | `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LPV.2/lefschetz-degeneration-specialization-sequence`, `LPV.7:semistable-curves/normalization-etale-resolution` and `LPV.7:semistable-curves/node-residue-variation-sign`. |
| DeligneWeightsAndPurity DWP.5 → LPV.0 | The local trait, Weil representation, tame character and branch sign conventions of Weil II §1.8. | `LPV.0/henselian-trait-conventions-and-galois-sheaves` and `LPV.1/twisted-monodromy-equivariance`; the tame character is R01.2's. |
| DeligneWeightsAndPurity DWP.5 → LPV.5 | "LPV, Part II": reduction of a normal finite-type scheme over a finite field to curves with the same monodromy image (Weil II 1.3.1, 1.3.4, 1.11.4). | Not planned. The requester proposes a Part II of this roadmap; the maintainer decides. |
| DeligneWeightsAndPurity DWP.9 → LPV.7:invariant-cycles | Weil II 6.2.8–6.2.12 for potentially pure complexes, including the constant-coefficient case 4.1.3, and the direct proof 4.3.2–4.3.8 for every Lefschetz pencil satisfying 4.3.1. | `LPV.7:invariant-cycles/pure-complex-local-invariant-cycles` (6.2.9), `support-bound-weak-lefschetz` (6.2.11(i), with the general-hyperplane duality), `pencil-image-equality` (6.2.11(ii)), `global-invariant-cycles` (6.2.12, which gives 4.1.3 for K constant) and `pencil-relative-obstruction` (4.3.6–4.3.8 for a sufficiently general pencil). The fixed-part theorem for *every* Lefschetz pencil satisfying 4.3.1 is not planned. |
| DeligneWeightsAndPurity DWP.7, DWP.8 → LPV.1 | Quasi-unipotence on nearby cycles over a henselian trait, the tame character, N and the filtration of Weil II 1.6.1 and 1.6.14; tame and wild inertia at boundary traits of curves over any field. | `LPV.1/geometric-quasi-unipotence`, `finite-monodromy-logarithm`, `monodromy-filtration`, with `LPV.0/henselian-trait-conventions-and-galois-sheaves` for the trait and its inertia; t_ℓ and wild inertia come from R01.2. |
| MordellLawrenceVenkatesh LV.0 → LPV.5 | Weil I Lemma 5.11 over any coefficient field of characteristic zero. | `LPV.5/symplectic-lie-algebra-generated-by-transvections`, which is stated over an arbitrary field of characteristic zero. |
| WeightsInEtaleCohomology R34.3 → LPV.0 | The finite-level functorialities extended to compatible integral systems, with the derived inverse-limit comparison and its finiteness and Mittag–Leffler hypotheses. | `LPV.0/adic-nearby-cycle-realization` and `LPV.0/coefficient-and-trait-change`. |
| WeightsInEtaleCohomology R34.3 → LPV.7:semistable-curves | Normalization, branch incidence, nearby cycles and the graph kernel and cokernel for proper semistable curves; Frobenius on components and branches; integral-to-adic passage. | `normalization-differential`, `normalization-etale-resolution`, `nodal-nearby-cycle-sheaves`, `curve-specialization-sequence`, `curve-normalization-cohomology` and `curve-choice-basechange-compatibility` (Galois permutation of components and branches), with `LPV.0/adic-nearby-cycle-realization`. |

## Structural proposals

Five proposals, each a Part II of an existing roadmap in the direction the plan needs. None changes this roadmap's layers. The atlas's design jobs and the maintainer decide on them.

- **Regular-trait purity extension** (LPV.0 part). The existing EDC.3 smooth-pair-purity statement is over a field and does not supply the regular trait pairs used by the algebraic Picard–Lefschetz prefix. Proposal: EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin diagrams for regular trait pairs; keep the general carrier with EDC.
- **Henselian approximation extension** (LPV.0 part). Ordinary quadratic applications require general Artin/Elkik approximation beyond the existing henselization carrier. Proposal: SchemeAndStackFoundations, Part II: general approximation and henselian/formal versality, imported by LPV’s quadratic applications.
- **P-adic Lie extension** (LPV.0 part). The existing LieGroups roadmap is real/complex; compact ℚ_ℓ subgroup arguments need their own scalar-field hypotheses. Proposal: LieGroups, Part II: p-adic exp/log charts, closed subgroup theorem and full-Lie-algebra openness; this avoids re-planning the real LieGroups results.
- **SL₂ nilpotent realization extension** (LPV.0 part). The existing SL₂ engine provides representation theory; the required nilpotent Jordan-block realization should build on it. Proposal: LieHighestWeight, Part II: nilpotent-endomorphism SL₂ realization/Jacobson–Morozov interface needed by Deligne 1.6.8, without a second SL₂ carrier.
- **HodgeStructures, Part II: geometric degeneration mixed-Hodge structures** (LPV.7 part). Extends `tauceti:TauCetiRoadmap/HodgeStructures`. The existing roadmap L2 constructs the abstract category and strictness; the geometric support/nearby MHS and weight bounds used by Weil II 3.6.4 are additional mathematics in its direction. Scope: Geometric rational Betti, support and limit/nearby mixed-Hodge structures for the proper projectively factored disk family; compatibility of localization/Wang maps and weight separation, building on HodgeStructures L2 and ComplexComparisonPartII C5. Needed by `LPV.7:invariant-cycles/complex-local-invariant-cycles`.

## Notes for the maintainer on upstream roadmaps

- `SchemeAndStackFoundations:SF.2` (LPV.0 part): The atlas stores PR196 as external entries with SF.2 as integration_owner, rather than checker-resolvable stages. Accordingly prerequisites use SF.2 only as that integration contract, with exact PR196 layers and immutable source head in requests. No generic étale/Galois/base-change carrier is re-planned in LPV.
- `SchemeAndStackFoundations:SF.0` (LPV.0 part): ProjectiveSchemesAndSmoothMorphisms is the upstream owner of projective/Grassmann/Veronese/tangent geometry. SF.0 is the atlas integration owner; the request imports it and separates the missing approximation Part II.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups` (LPV.0 part): Its real/complex Cartan and analytic Lie theory cannot supply a ℚ_ℓ closed-subgroup theorem. Add LieGroups, Part II for p-adic matrix exp/log charts, compact closed subgroups and openness from full Lie algebra; until integrated, LPV’s compact-subgroup node ends at G-padic-Lie.
- `DeligneWeightsAndPurity:DWP.5` (LPV.0 part): Weil II 1.9’s weight-dependent relative-filtration existence is a downstream use of LPV.1 and belongs to DWP.5/local-weight-corollaries, not DWP.1 (curve and abelian-variety Weil estimates). Do not add a reverse DWP.5→LPV.1 dependency for the tame commuting-residue and uniqueness targets.
- `IgusaVarietiesAndTorsionConcentration:IG.4` (LPV.0 part): IG.4 consumes LPV.6 scheme nearby-cycle perversity. LPV.6/igusa-semiperversity-interface must import an independently available geometry/formal-model prefix, not all of IG.4; split the specific geometry contract before installing that edge. See G-review-supplier-order.
- `DeligneWeightsAndPurity:DWP.4` (LPV.0 part): DWP.4 explicitly consumes LPV.0–5. Separate the LPV.5 geometric open-image prefix from its later rational-character/ADE/arithmetic applications and name the exact rationality output before adding a reverse whole-stage dependency. See G-review-supplier-order.
- `LPV.7:semistable-curves` (LPV.7 part): The accepted RS-17 boundary is followed: normalization geometry and graph homology belong to StableReduction; generalized Jacobian characters and positive valuation pairing to R11.4. LPV proves the étale comparison and keeps Illusie’s negative pairing convention. The requested DVR purity and geometric I₂ examples need supplier scope certification.
- `LPV.7:semistable-curves` (LPV.7 part): Illusie21 §6.4 records E₂ degeneration results beyond the 2003 discussion. No blanket claim that degeneration is unknown is made here. This packet constructs the source-qualified sequence and proves the curve degree case; higher-dimensional degeneration and equality of M′ with canonical monodromy filtration are separately sourced consumer obligations.

## What the pinned libraries have

The 48 declarations the two parts cite, each read at its pinned commit (Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`) by the part that cites it and by its review. Four are Tau Ceti's. The library audit AUDIT-19 finds every layer not built; these declarations are the carriers the plan extends.

| Declaration | Kind | Module | Provides | Cited in |
|---|---|---|---|---|
| `mathlib:LinearEquiv.transvection` | definition | `Mathlib/LinearAlgebra/Transvection/Basic.lean` | For f : Dual R V and v : V with f v = 0, the linear equivalence x ↦ x + f x • v. | LPV.0 |
| `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff` | theorem | `Mathlib/LinearAlgebra/Transvection/Basic.lean` | x is fixed by the transvection x ↦ x + f x • v if and only if f x • v = 0. | LPV.0 |
| `mathlib:LinearMap.BilinForm.orthogonal` | definition | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean` | The orthogonal B.orthogonal N of a submodule N for a bilinear form B. | LPV.0 |
| `mathlib:LinearMap.BilinForm.IsAlt` | definition | `Mathlib/LinearAlgebra/BilinearForm/Properties.lean` | A bilinear form is alternating: B x x = 0 for all x. | LPV.0 |
| `mathlib:skewAdjointLieSubalgebra` | definition | `Mathlib/Algebra/Lie/SkewAdjoint.lean` | The Lie subalgebra of Module.End R M of endomorphisms skew-adjoint for a bilinear form B; for B alternating and nondegenerate this is sp(M, B). | LPV.0 |
| `mathlib:LieModule.IsIrreducible` | definition | `Mathlib/Algebra/Lie/Semisimple/Defs.lean` | A nontrivial Lie module whose only Lie submodules are ⊥ and ⊤. | LPV.0 |
| `mathlib:IsNilpotent.exp` | definition | `Mathlib/RingTheory/Nilpotent/Exp.lean` | The finite exponential ∑ aⁱ/i! of a nilpotent element of a ℚ-algebra; for N² = 0 it is 1 + N. | LPV.0 |
| `mathlib:ValuationSubring.inertiaSubgroup` | definition | `Mathlib/RingTheory/Valuation/RamificationGroup.lean` | The inertia subgroup of the decomposition group of a valuation subring: the kernel of the action on its residue field. | LPV.0 |
| `mathlib:QuadraticMap.Nondegenerate` | definition | `Mathlib/LinearAlgebra/QuadraticForm/Radical.lean` | A quadratic map is nondegenerate if its radical is 0 and the kernel of its polar form has rank ≤ 1 (Elman–Karpenko–Merkurjev II §7). | LPV.0 |
| `mathlib:QuadraticMap.polarBilin` | definition | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The polar bilinear map (x, y) ↦ Q(x + y) − Q(x) − Q(y). | LPV.0 |
| `mathlib:CliffordAlgebra.even` | definition | `Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean` | The even subalgebra C⁺(Q) of the Clifford algebra of a quadratic form. | LPV.0 |
| `mathlib:HenselianLocalRing` | definition | `Mathlib/RingTheory/Henselian.lean` | A local ring in which simple roots of monic polynomials modulo the maximal ideal lift. | LPV.0 |
| `tauceti:TauCeti.genericFiber` | definition | `TauCeti/AlgebraicGeometry/Fibers.lean` | For a scheme over Spec R and a fraction field K, the actual pullback generic fibre as an object over Spec K. | LPV.0 |
| `tauceti:TauCeti.specialFiber` | definition | `TauCeti/AlgebraicGeometry/Fibers.lean` | For a scheme over Spec R, the actual residue-field pullback special fibre. | LPV.0 |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | definition | `Mathlib/AlgebraicGeometry/Sites/Etale.lean` | The Grothendieck topology on X.Etale induced from the big étale topology. | LPV.0 |
| `mathlib:DerivedCategory` | definition | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The localization of cochain complexes at quasi-isomorphisms, for an abelian category with HasDerivedCategory. | LPV.0, LPV.7 |
| `mathlib:Submodule.span` | definition | `Mathlib/LinearAlgebra/Span/Defs.lean` | The smallest submodule containing a set, defined by the infimum of all containing submodules. | LPV.0 |
| `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent` | definition | `TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean` | A general linear automorphism g is unipotent exactly when its underlying endomorphism minus 1 is nilpotent. | LPV.0 |
| `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower` | theorem | `TauCeti/RingTheory/Nilpotent/Exp.lean` | For x^k=0 in a Q-algebra and r : ℚ, exp(r • x)=Σ_(i<k)r^i • dividedPower(i,x), with divided powers x^i/i!. Extension to arbitrary characteristic-zero scalar parameters is a routine algebra calculation, not the literal Tau Ceti statement. | LPV.0 |
| `mathlib:AlgebraicGeometry.Scheme` | structure | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes as locally ringed spaces locally isomorphic to affine spectra, rather than unlabeled point sets. | LPV.7 |
| `mathlib:AlgebraicGeometry.IsProper` | class | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Separated, universally closed, locally finite type scheme morphisms. | LPV.7 |
| `mathlib:ModuleCat` | structure | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` | Bundled modules and their actual linear-map morphisms. | LPV.7 |
| `mathlib:DerivedCategory.Q` | def | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | Localization functor from cochain complexes to the chosen derived category. | LPV.7 |
| `mathlib:CategoryTheory.CohomologicalSpectralSequence` | abbrev | `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` | Spectral sequence with differential bidegree (r,1-r); no geometric convergence supplied by this carrier. | LPV.7 |
| `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence` | def | `Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean` | Spectral sequence attached to a spectral object satisfying HasSpectralSequence; use for the filtered nearby complex. | LPV.7 |
| `mathlib:Representation.invariants` | def | `Mathlib/RepresentationTheory/Invariants.lean` | Submodule of vectors fixed by every element of a group representation. | LPV.7 |
| `mathlib:Representation.mem_invariants` | theorem | `Mathlib/RepresentationTheory/Invariants.lean` | Membership is equivalent to fixing the vector for every group element; no topology built into this statement. | LPV.7 |
| `mathlib:LinearMap.codRestrict` | def | `Mathlib/Algebra/Module/Submodule/LinearMap.lean` | Corestriction of a linear map to a submodule containing every value. | LPV.7 |
| `mathlib:LinearMap.ker` | def | `Mathlib/Algebra/Module/Submodule/Ker.lean` | Kernel submodule, with membership given by vanishing. | LPV.7 |
| `mathlib:LinearMap.range` | def | `Mathlib/Algebra/Module/Submodule/Range.lean` | Image submodule, with membership given by existence of a preimage. | LPV.7 |
| `mathlib:Submodule.mkQ` | def | `Mathlib/LinearAlgebra/Quotient/Defs.lean` | Canonical surjective linear map to the quotient by a submodule. | LPV.7 |
| `mathlib:AlgebraicGeometry.IsIntegral` | class | `Mathlib/AlgebraicGeometry/Properties.lean` | Nonempty scheme with domain rings of sections on every nonempty open. | LPV.7 |
| `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension` | class | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smooth relative dimension n tested by standard-smooth affine neighbourhoods. | LPV.7 |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType` | class | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean` | Finite-type ring maps on affine opens for a scheme morphism. | LPV.7 |
| `mathlib:AlgebraicGeometry.QuasiCompact` | class | `Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean` | Inverse images of compact opens are compact; together with local finite type gives finite type. | LPV.7 |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | abbrev | `Mathlib/AlgebraicGeometry/OpenImmersion.lean` | The underlying locally ringed space morphism is an open immersion. | LPV.7 |
| `mathlib:IsGenericPoint` | def | `Mathlib/Topology/Sober.lean` | Closure of the specified singleton is the specified set, so a generic point of the whole base cannot lie in a proper closed subset. | LPV.7 |
| `mathlib:HasDerivedCategory.standard` | def | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The constructed localization supplies a chosen derived-category instance. | LPV.7 |
| `mathlib:CategoryTheory.Abelian.SpectralObject` | structure | `Mathlib/Algebra/Homology/SpectralObject/Basic.lean` | Functorial relative cohomology with actual connecting maps and long exact sequences. | LPV.7 |
| `mathlib:CategoryTheory.Abelian.SpectralObject.SpectralSequenceDataCore` | structure | `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean` | Ordered indices and cohomological degrees relating spectral-object pages and differentials. | LPV.7 |
| `mathlib:CategoryTheory.Abelian.SpectralObject.HasSpectralSequence` | class | `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean` | Specific zero-object conditions required by the general page recipe. | LPV.7 |
| `mathlib:CategoryTheory.Limits.IsZero` | structure | `Mathlib/CategoryTheory/Limits/Shapes/ZeroObjects.lean` | Categorical zero object characterized by unique maps to and from every object. | LPV.7 |
| `mathlib:CategoryTheory.shiftFunctor` | def | `Mathlib/CategoryTheory/Shift/Basic.lean` | The existing shift autoequivalence, used for actual shifted complex test forms. | LPV.7 |
| `mathlib:Representation.trivial` | def | `Mathlib/RepresentationTheory/Basic.lean` | Actual trivial group representation with identity action. | LPV.7 |
| `mathlib:LinearMap.BilinForm` | abbrev | `Mathlib/LinearAlgebra/BilinearMap.lean` | Existing bilinear-map carrier M→linear M→linear F for the two pairing conventions. | LPV.7 |
| `mathlib:Module.finrank` | def | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | Finite natural rank as Cardinal.toNat of module rank, used only under finite-dimensional field hypotheses. | LPV.7 |
| `mathlib:CategoryTheory.IsPullback` | structure | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean` | A commutative square whose pullback cone satisfies the categorical limit universal property. | LPV.7 |

## Sources

Seventeen source records. Two papers occur under two ids each: Deligne's *La conjecture de Weil. II* is `deligne-weil-ii` in the LPV.0 part and `WeilII` in the LPV.7 part, and Illusie's *Grothendieck and vanishing cycles* is `illusie-2021` and `Illusie21`; the files have the same SHA-256. Each part records the sections it read.

- `deligne-weil-i` (LPV.0 part). Pierre Deligne, *La conjecture de Weil. I*. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. <https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>, SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`. Read: §§4–5, pp. 287–294: inherited page-image reading, independently audited against the text and required targets; §§6–7 consulted for arithmetic ownership; their weight arguments are supplied by DeligneWeightsAndPurity.
- `SGA7II-1973` (LPV.0 part). Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, *Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340*. Springer 1973; IAS author-archive scan with OCR (the OCR is poor: symbols ~, @, 4 replace accents and Greek letters; statements were reconstructed from the surrounding French text and the numbered cross-references). <https://publications.ias.edu/sites/default/files/Number12.pdf>, SHA-256 `fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297`. Read: XII §§1–3 and XV §§1–2: inherited page-image reading and transcriptions, 2026-09-29; their statements retained and audited; XIII 2.1.9–13 and 2.2–2.4; XVII §§1–4; XVIII §§1–4, 5.1, 6.1, 6.3–6.4, 6.6–6.7; portions needed for the algebraic generation and pencil restriction/Gysin formulas.
- `deligne-weil-ii` (LPV.0 part). Pierre Deligne, *La conjecture de Weil. II*. Publ. Math. IHÉS 52 (1980), 137–252. <https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>, SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`. Read: 1.6–1.7 and 1.9, pp. 165–178; 4.2.1–8, 4.3.9–10, 4.4.1–4, 4.4.8–9 and 4.5.1–2, pp. 220–234; proof interiors 4.4.5–7 not freshly read.
- `illusie-1994` (LPV.0 part). Luc Illusie, *Autour du théorème de monodromie locale*. Astérisque 223 (1994), 9–57. <https://www.numdam.org/item/AST_1994__223__9_0/>, SHA-256 `a81d3e6c63ea0257b1cbd58933bb863c4adad3864cc19968f56beec700670e70`. Read: 1.1–1.5; 3.5–3.8 (filtered nearby-cycle calculation); 4.1–4.6 (duality and perversity); beginning of 4.7.
- `illusie-1994-errata` (LPV.0 part). Luc Illusie, *Errata to Autour du théorème de monodromie locale*. Author errata sheet, 1 page. <https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf>, SHA-256 `78fdd24a8f926ad02e3e9e16589fc2607f5f6dbbbf8a02ec48ba331703c4af9f`. Read: Entire errata sheet.
- `illusie-2021` (LPV.0 part). Luc Illusie, *Grothendieck and vanishing cycles*. Ann. Fac. Sci. Toulouse 30 (2021), 83–115. <https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf>, SHA-256 `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219`. Read: 6.1–6.3, pp. 103–105; algebraic Picard–Lefschetz route through the two-component calculation.
- `illusie-2002-erratum` (LPV.0 part). Luc Illusie, *Erratum to Sur la formule de Picard–Lefschetz*. Author erratum to Adv. Stud. Pure Math. 36 (2002), 249–268. <https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf>, SHA-256 `3aa532eb93b8acf3d8c2e49d7d68144fb274042d2a5310780bedc1b03dd34120`. Read: Entire sheet; p. 251 line 18 correction.
- `illusie-2006` (LPV.0 part). Luc Illusie, *Vanishing cycles over general bases*. Author lecture text, December 2006. <https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf>, SHA-256 `18bfa00248bae2e61eead6edbfa762f805cde11347b7e14347b19ffb83740780`. Read: 1.1 and 2.1–2.4 (oriented products and their points).
- `qian-2023` (LPV.0 part). Lie Qian, *Potential automorphy for GL_n*. Invent. Math. 231 (2023), published text. <https://par.nsf.gov/servlets/purl/10388233>, SHA-256 `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8`. Read: Definition 3.6: maximally unipotent and maximally nilpotent.
- `fsy-2022` (LPV.0 part). Javier Fresán, Claude Sabbah and Jeng-Daw Yu, *Hodge theory of Kloosterman connections*. arXiv:1810.06454 downloaded public manuscript, 74 PDF pages; cited locators refer to this SHA-256 text, not independently to the published Duke Math. J. pagination. <https://arxiv.org/pdf/1810.06454>, SHA-256 `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a`. Read: 5.1.3, pp. 41–44, ordinary quadratic points and the characteristic-two nonordinary branch.
- `kisin-pappas-2018` (LPV.0 part). Mark Kisin and George Pappas, *Integral models of Shimura varieties with parahoric level structure*. Publ. Math. IHÉS 128 (2018), 121–218. <https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf>, SHA-256 `e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b`. Read: 4.7.1 and 4.7.3, pp. 212–213; definitions and use of nearby-cycle semisimple trace.
- `caraiani-scholze` (LPV.0 part). Ana Caraiani and Peter Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*. Author public manuscript, Noncompact.pdf. <https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf>, SHA-256 `b0e813515e0ab6f5348e8bd2b32e6010a90295eb77e71f333b7870ccb735f535`. Read: 4.6, pp. 60–63, finite-level semiperversity and the cofinal-model interface.
- `WeilII` (LPV.7 part). Pierre Deligne, *La conjecture de Weil. II*. Publications Mathématiques de l’IHÉS 52 (1980), 137–252; published scan. <https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>, SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`. Read: 1.11.1–1.11.3 (spreading and tame inertia images); 3.6.1–3.6.4, printed pp.213–215, statements and proofs; 4.1.6, 4.3.2–4.3.8 (affine vanishing and relative obstruction); 6.2.7–6.2.12, printed pp.248–250; page images checked for shifts and support bound.
- `Illusie91` (LPV.7 part). Luc Illusie, *Réalisation ℓ-adique de l’accouplement de monodromie, d’après A. Grothendieck*. Astérisque 196–197 (1991), 27–44; article in the published collection. <https://www.numdam.org/item/AST_1991__196-197__1_0.pdf>, SHA-256 `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119`. Read: Entire article, §§0–2.9, printed pp.27–44; local trace signs, specialization, graph lattices, Tate realization, pairing.
- `Illusie21` (LPV.7 part). Luc Illusie, *Grothendieck and vanishing cycles*. Annales de la Faculté des Sciences de Toulouse 30 (2021), 83–115; published version. <https://www.numdam.org/item/AFST_2021_6_30_1_83_0.pdf>, SHA-256 `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219`. Read: §2.2 (tame normal-crossing stalks); §4.4, formulas4.24–4.39 (graph realization and negative sign); §§6.3–6.4, formulas6.1–6.6 (graded nearby complex and abutment filtration).
- `Saito03` (LPV.7 part). Takeshi Saito, *Weight spectral sequences and independence of ℓ*. Author manuscript dated 9 June 2003; published in J. Inst. Math. Jussieu 2 (2003), 583–634; manuscript numbering retained. <https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf>, SHA-256 `a4d564c3e632458e7856ac0133430412e40abc9d26a8cdc39e88747473aa3109`. Read: §1.1, Propositions1.1.1–1.1.2, Corollary1.1.3 and proof (local purity/residues); §2.1, kernel/image convolution (import from LPV.1); §2.2, Lemma2.2.1 through Proposition2.2.6 and proofs (graded pieces, spectral sequence, d1 and signs); §2.2 final comparison with Rapoport–Zink sign conventions.
- `LTXZZ22` (LPV.7 part). Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. Inventiones mathematicae 228 (2022), 107–375; published article served by NSF PAR. <https://par.nsf.gov/servlets/purl/10323568>, SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`. Read: §5.9, Construction5.9.1, monodromy-filtration discussion and Lemma5.9.3 proof, printed pp.231–240; uses published Saito Corollary2.8(2) for d1 without properness.

### Versions read

- (LPV.0 part) published: Deligne, La conjecture de Weil. I, Publ. Math. IHÉS 43 (1974), Numdam <https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>, read 2026-09-29, SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
- (LPV.0 part) published: Deligne and Katz (eds.), Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Math. 340 (1973), scan in Deligne's IAS publication archive <https://publications.ias.edu/sites/default/files/Number12.pdf>, read 2026-09-29, SHA-256 `fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297`.
- (LPV.0 part) published: Pierre Deligne, La conjecture de Weil. II, Publ. Math. IHÉS 52 (1980), 137–252 <https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>, read 2026-10-06, SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.
- (LPV.0 part) published: Luc Illusie, Autour du théorème de monodromie locale, Astérisque 223 (1994), 9–57 <https://www.numdam.org/item/AST_1994__223__9_0/>, read 2026-10-06, SHA-256 `a81d3e6c63ea0257b1cbd58933bb863c4adad3864cc19968f56beec700670e70`.
- (LPV.0 part) published: Luc Illusie, Errata to Autour du théorème de monodromie locale, Author errata sheet, 1 page <https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf>, read 2026-10-06, SHA-256 `78fdd24a8f926ad02e3e9e16589fc2607f5f6dbbbf8a02ec48ba331703c4af9f`.
- (LPV.0 part) published: Luc Illusie, Grothendieck and vanishing cycles, Ann. Fac. Sci. Toulouse 30 (2021), 83–115 <https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf>, read 2026-10-06, SHA-256 `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219`.
- (LPV.0 part) published: Illusie, Erratum to Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268 <https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf>, read 2026-10-06, SHA-256 `3aa532eb93b8acf3d8c2e49d7d68144fb274042d2a5310780bedc1b03dd34120`.
- (LPV.0 part) author copy: Luc Illusie, Vanishing cycles over general bases, Author lecture text, December 2006 <https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf>, read 2026-10-06, SHA-256 `18bfa00248bae2e61eead6edbfa762f805cde11347b7e14347b19ffb83740780`.
- (LPV.0 part) published: Lie Qian, Potential automorphy for GL_n, Invent. Math. 231 (2023), published text <https://par.nsf.gov/servlets/purl/10388233>, read 2026-10-06, SHA-256 `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8`.
- (LPV.0 part) preprint: Fresán–Sabbah–Yu, Hodge theory of Kloosterman connections, downloaded arXiv:1810.06454 manuscript; published-version identity not independently established <https://arxiv.org/pdf/1810.06454>, read 2026-10-06, SHA-256 `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a`.
- (LPV.0 part) published: Mark Kisin and George Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018), 121–218 <https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf>, read 2026-10-06, SHA-256 `e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b`.
- (LPV.0 part) author copy: Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties, Author public manuscript, Noncompact.pdf <https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf>, read 2026-10-06, SHA-256 `b0e813515e0ab6f5348e8bd2b32e6010a90295eb77e71f333b7870ccb735f535`.
- (LPV.0 part) published: Luc Illusie, Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268 <https://doi.org/10.2969/aspm/03610249>, read Original PDF not obtained: publisher bot protection. Author 2021 survey and ErrPL.pdf read 2026-10-06; original proof interior is G-algebraic-PL..
- (LPV.0 part) published: Luc Illusie, Perversité et variation (2003), Corollary 2.10 <https://doi.org/10.1007/s00229-003-0407-z>, read Original not obtained. FSY §5.1.3 primary application read 2026-10-06; precise general hypotheses remain G-nonordinary..
- (LPV.0 part) preprint: Lie Qian, Potential automorphy for GL_n, first arXiv version <https://arxiv.org/pdf/2104.09761>, read Locator check only, 2026-10-06: Definition 3.6 is in the published version, not at the same number in v1. The published NSF-hosted text is the cited source., SHA-256 `4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415`.
- (LPV.7 part) published: Publications Mathématiques de l’IHÉS 52 (1980), 137–252; published scan <https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>, read 2026-10-06, SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.
- (LPV.7 part) published: Astérisque 196–197 (1991), 27–44; article in the published collection <https://www.numdam.org/item/AST_1991__196-197__1_0.pdf>, read 2026-10-06, SHA-256 `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119`.
- (LPV.7 part) published: Annales de la Faculté des Sciences de Toulouse 30 (2021), 83–115; published version <https://www.numdam.org/item/AFST_2021_6_30_1_83_0.pdf>, read 2026-10-06, SHA-256 `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219`.
- (LPV.7 part) author copy: Author manuscript dated 9 June 2003; published in J. Inst. Math. Jussieu 2 (2003), 583–634; manuscript numbering retained <https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf>, read 2026-10-06, SHA-256 `a4d564c3e632458e7856ac0133430412e40abc9d26a8cdc39e88747473aa3109`.
- (LPV.7 part) published: Inventiones mathematicae 228 (2022), 107–375; published article served by NSF PAR <https://par.nsf.gov/servlets/purl/10323568>, read 2026-10-06, SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

## What the blueprint does not claim

- Nothing here is formalised. Every node has `implementationStatus: unchecked`, and the suggested Lean file elaborates signatures whose proofs are `sorry`.
- No layer is closed. LPV.0–LPV.6 are `partial` and LPV.7 with its sub-layers is `planned`; the coverage records and the eighteen gaps say what remains.
- The geometric local monodromy theorem is a statement about the cohomology of finite-type families, not about arbitrary inertia representations. The weight–monodromy conjecture is not claimed, and no universal semistable reduction is assumed.
- The open-image theorem concerns Sp(V)(ℚ_ℓ) for the fixed ℚ_ℓ-model V = E/(E ∩ E^⊥); openness after extending coefficients is not asserted. The orthogonal alternative assumes E nondegenerate and so cannot prove hard Lefschetz.
- The local invariant-cycle theorem is Deligne's equicharacteristic, algebraizable statement over the henselization of k[T] at (T). It is not asserted over mixed-characteristic traits or with integral coefficients.
- The weight spectral sequence is constructed with a stated abutment; its E₂-degeneration and the equality of its filtration with the monodromy filtration are separate theorems, proved here only for curves.
- The complex comparison of Picard–Lefschetz signs checks conventions; the proof in positive characteristic is algebraic and assumes no lift to characteristic zero.
