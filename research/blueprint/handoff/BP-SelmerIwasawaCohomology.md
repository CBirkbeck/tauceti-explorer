# BP-SelmerIwasawaCohomology — completed target-level pass

Issue #988. Agent: Codex (GPT-6), session `codex-lvrBpD`. Branch: `codex-lvrBpD-selmer-iwasawa`. Claim confirmed by bot comment 6090406459 after claim comment 6090404500. This submission completes the target-level planning pass specified in the issue and PROTOCOL §0; it is not another checkpoint and does not assert that the open layers are closed.

## Deliverables and coverage

The packet retains the 46 inherited target ids, corrects their conventions and ownership, and adds 49 targets. It has 95 nodes: 22 constructions, 9 definitions, 15 lemmas, 7 comparisons and 42 theorems. There are 150 API items and 105 required definition/construction unit tests. Another 70 theorem/comparison acceptance tests are recorded, making 175 named test contracts in total. The atlas has 26 planets (4/4/6/6/6 in L0–L4), and the pinned baseline has 38 checked declarations. Every implementation status remains unchecked.

All five coverage records are **planned**, with precise remaining lists; none is closed. Two parity proof refinements and 19 open supplier-interface requests remain. This is the stopping criterion for a complete target-level pass, not a claim of gap-free formal implementation. All targets terminate in actual baseline declarations, existing upstream roadmaps, same-bundle/lower-tier blueprint nodes, explicit requests or these recorded gaps.

- L0 adds cup/restriction/corestriction compatibility, the correct coefficient-limit hypotheses, and the routed weak-semisimplicity/procyclic reduction facts. It imports the existing local multiplicative completion and current finite Kummer arithmetic.
- L1 adds local-condition maps and complement errors, parametric Selmer-fibre duality, strict/inertia ordinary annihilator corrections and nonsingular finite-module annihilation. It retains modified real terms at p=2.
- L2 extends upstream discrete Selmer theory to compact/rational diagrams, identifies the H⁰ correction to the Selmer H¹ kernel, and plans coefficient/local-condition/lattice triangles and restriction descent with their errors.
- L3 adds infinite fibres, derived and kernel control, local specialization corrections, Iwasawa duality/finiteness, inverse determinant lines, the degree-one étale j_* comparison, rational specialization, CGLS local calculations and the explicit Greenberg structure/Fitting criteria.
- L4 adds minimal period and small-weight integral crystalline foundations, finite/ordinary comparisons, actual Hodge Gamma factors, leading-term propositions, class/unit towers and Leopoldt, integral reductions/uniform local bounds, elliptic and adjoint examples and the two routed parity statements.

The reader states every target with its hypotheses, prerequisites, proof plan, theorem/section/page citations, API and tests. The suggested file contains typed native prototypes and the complete named contract register. The handoff, packet, reader and suggested file are the only changed paths; no metadata file is authorized by this blueprint issue.

## Verification and the suggested file

`python3 scripts/check_blueprint.py research/blueprint/packets/SelmerIwasawaCohomology.json`: 95 nodes, 0 errors and 0 warnings. The checker counts the 105 required definition/construction tests; the additional 70 tests are included in the reader and suggested contracts.

`lean-check research/blueprint/suggested/SelmerIwasawaCohomology.lean`: exit 0 against the shared pinned build; only warnings that declarations use `sorry`. Memory was checked before each compile, with more than 20 GB available. No language server, dependency update, cache download or separate build was started. No compile remains running.

The typed prototypes use Mathlib adic completion, actual localization/quotient maps, image/preimage condition propagation, Pontryagin duals, perfect finite ZMod pairing adapters, the invariants-to-coinvariants criterion, genuine filtered semilinear Frobenius data, the actual Tau Ceti Hodge carrier, its existing dual/Tate twist/Tate object and Mathlib Gamma factors. Criticality consumes the realization and its computed Tate dual, rather than a supplied Gamma function or arbitrary predicate. Tests compare actual opposite Betti involutions and zero/Tate/elliptic Hodge data. The finite Kummer tests use the pinned map itself.

Canonical compact cochain, derived Selmer, Iwasawa determinant and period signatures still depend on requested supplier interfaces. Those typed declarations are explicitly omitted under PROTOCOL §13; their exact mathematics, proposed API names and tests appear in the contract register. This limitation is real: comments are not Lean declarations, and elaboration of the companion is not implementation of those contracts. No placeholder cohomology carrier, empty proposition field or opaque predicate is used to make them look typed. The algebraic diagram adapter does not purport to construct general discrete Galois cohomology.

The reader/Lean name-consistency check covers all 95 target ids, 150 API names and 175 test names. Submission file checks cover all four authorized files, valid JSON and absence of private absolute paths. The final diff passes whitespace checks.

## Existing work and bottom-up ownership

Pinned statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current TauCetiRoadmap was screened at `94ff6a17fb5f138baeac6cd961cd5c21e40f6696`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both current checkouts were read only; no Lake command ran there.

The screen included the nine roadmaps absent from the atlas snapshot: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, plus the relevant Completed roadmaps. Two full neighboring upstream documents, HodgeStructures and GlobalNumberFields, were read for style and granularity. The reviewed library audit and the relevant supplier packets/link maps were read before extending the inherited plan.

LocalGaloisGroups Layer 7 already constructs A(K), its p-adic structure, torsion and rational decomposition. EllipticCurves Layer 7 already owns general discrete local conditions, the Selmer kernel, locally constant cohomology, finite elliptic Selmer groups and Sha. These are imports here. The compact/rational adapter is an extension and comparison, not a competing discrete theory.

The current Kummer module implements `kummerMap_surjective`, `kummerIso`, `kummerIso_res` and `kummerIso_norm`. The current local-field power-subgroup module implements `finiteIndex_range_powMonoidHom` and `card_powerClasses`. The inherited local-power-class target now plans only their finite-discrete/inverse-limit topology comparison. The corresponding request explicitly imports these implemented arithmetic facts and asks only for the missing compact-tower interface.

The pinned Hodge library already supplies opposed filtrations, Hodge numbers and finite support, pure duality, Tate twists and Tate objects. The archimedean target adds the separate complex-linear Betti involution F∞, its eigenspaces and L-function normalization. Its dual uses the existing H.dual.tateTwist(−1); it does not re-plan pure Hodge duality.

RS-08's generic-cohomology/duality boundaries are preserved: ArithmeticGaloisDuality owns canonical compact cochains, coefficient limits and generic duality. Its available exact node ids replace broad stage citations where possible. Generic Selmer mapping fibres remain independent of period theory.

The current tier order takes precedence over older upward edges in the issue. The following minimal notions move down to SIC L4 and must be imported by the higher roadmaps after review:

- From the higher p-adic Hodge/crystalline/A_inf directions: the C_p/de Rham comparison, A_cris/B_cris structures, fundamental period sequences, invariant realizations/fixed fields and the finite H¹ kernel. Perfectoid tilt/A_inf foundations stay in lower-tier PerfectoidSpaces; generic cohomology stays in ArithmeticGaloisDuality. Geometric comparisons remain in their original directions.
- From higher finite-flat/p-adic Hodge directions: the small-weight filtered Frobenius carrier/realization and crystalline extension finite condition, with the interval, unramified base and inverse-different qualifications. No whole finite-flat or prismatic theory is moved.
- From IntegralIwasawaTheory: the minimal cyclotomic class/p-ramified/local-unit/closed-global-unit towers and their class/unit exact sequence required for the Tate dictionary. General integral Iwasawa constructions stay there.

There is no higher-tier prerequisite in this packet. PadicMeasuresIwasawaAlgebras L5's perfect/determinant interface and SchemeAndStackFoundations SF.6's arithmetic K(π,1) comparison are lower-tier requests, not claims that those suppliers already implement the requested theorem. The degree-zero Λ dualizing-module normalization is explicit; an absolute dualizing complex shifted by dim Λ needs its compensating shift.

## Routed findings and link-map instructions

The deliverable scope does not authorize edits to other packets or link maps. The maintainer/follow-up must apply the following directions; this submission does not claim the atlas edges have already changed.

- **RT-AREA-iwasawa-1/18:** L3 now plans localization surjectivity, primitive/imprimitive no-pseudo-null structure and dimension-two Fitting=characteristic. The full RFX/LOC1/LOC2/LEO/CRK/divisibility and alternative hypotheses are stated. Residual irreducibility alone is not enough; pseudo-null equals finite only in dimension two. Export these targets to ModularIwasawaMainConjectures L1 and RankZeroOneBSD BSD.6/BSD.6a/BSD.7a. CGLS's anticyclotomic conclusion retains its own imprimitive hypotheses.
- **RT-AREA-iwasawa-1/19:** no p-adic-period dependency enters generic L2. Remove the old PHR L1→SIC L2 edge. The minimum finite-period notions are now owned by SIC L4 under the tier rule, so the old upward PHR L1→SIC L4 edge must also be redirected to an import by that higher roadmap.
- **RT-AREA-iwasawa-1/20:** L2 explicitly imports EllipticCurves Layer 7's discrete structure and kernel, extends to T/V and compares A=V/T. Add that upstream stage→SIC L2 link if the effective link map still lacks it.
- **RT-AREA-iwasawa-1/21:** SIC L4 owns the class-group/Tate-twist dictionary, with plus/minus, involution and sign restrictions. Add SIC L4→EulerSystemsCyclotomicMainConjecture L3 and narrow the latter to translating its ideal statement through this dictionary. No ESCMC main conjecture is imported as a premise of the generic dictionary.
- **RT-AREA-algebraicgeometry/27:** the Hodge L0 carrier is now an explicit pinned-library prerequisite, not a privately supplied Gamma function. Add HodgeStructures milestone L0→SIC L4 in the atlas link map, while retaining the already implemented pure Hodge operations as library imports.

These are ownership directions and exported contracts, not new jobs claimed by this process.

## Sources and exact remaining proof inputs

Public source editions and SHA-256 hashes are in `sources`/`sourceVersions`. Read selections include Rubin's author draft I §§2–7 and Appendix B §§2–5; Mazur–Rubin §§1–3; RJW arXiv v2 §§10.5 and 13.2–13.5; Burungale–Tian arXiv v2 §§1–3; Nekovář §§6.1–6.3, 6.7, 8.3–8.5, 8.8–8.10 and the exact 12.2.3 parity statement; Greenberg's author PDF §§1–4; the CGLS local and imprimitive structure loci; Skinner §2.2; the separate Calegari–Geraghty–Harris appendix preprint; Kato's j_* and determinant loci; Bloch–Kato §§1 and 3; Deligne §5/Table 5.3; Dokchitser–Dokchitser 4.19; Breuil Proposition 6; Nizioł §§2 and 6/Proposition 6.2; Fontaine's two Astérisque articles and Fontaine–Laffaille's small-weight/exactness loci.

Liu–Tian–Xiao–Zhang–Zhu §§2.1–2.2 and 2.4 were read in the maintainer-cleared version of record, in place. No restricted PDF or extracted passage was copied into scratch or the repository. Its DOI/edition and exact printed pages identify the source. Rubin's uncleared published monograph was not used; the public author draft is the cited edition. The inherited RJW published comparisons at E4/E5 retain the prior worker's attribution and date; this run reads the public arXiv v2 edition.

The standing user instruction supersedes the older excerpt instruction: statements, source findings and reader prose are paraphrases with exact locators, not verbatim source passages or sequential summaries of sources.

Two proof gaps remain, intentionally separate from supplier interfaces:

1. **Ordinary modular parity:** the exact specialized statement is Nekovář 12.2.3, for an even-weight, trivial-nebentypus ordinary newform over ℚ, p odd, and F=ℚ or quadratic. Refine its ordinary-family parity argument (§§12.7–12.8), auxiliary twist nonvanishing and the rank-one Heegner input (§12.10.9) into target-level proof inputs here. They cannot be invoked from higher-tier PadicFamilies, Heegner or RankZeroOneBSD. The full source is accessible; those chains are not claimed closed.
2. **Congruent two-primary parity:** Dokchitser–Dokchitser 4.19 gives the exact p=2 conclusion and attributes it to Monsky, *Generalizing the Birch–Stephens theorem. I. Modular curves*, Math. Z. 221(3) (1996), 415–420. Monsky's full proof was not read. Obtain an allowed primary source and refine the 2-adic local-root-number/descent comparison. Keep corank of Sel_(2∞), including divisible Sha, rather than finite Sel₂ dimension or an assumed finite Sha. The exact squarefree residue table and curve-model comparison are already stated.

The source findings E1–E6 and the routed E135/E138 use corrected mathematical statements. No red-team, sources or errata job was claimed. In particular the full number-field multiplicative completion is not a tensor product; norm relations retain Frobenius; the negative twists and plus-field convention are explicit; U/E has the correct quotient direction; restriction descent retains its injectivity kernel; adjoint Artin finiteness uses an equivariant class-group Hom and finite group-cohomology error. Finite lattice-tower errors are not asserted finite over Λ and may change a height-one divisor.

## Requests and where to resume

Do not restart the packet. A follow-up discharges the relevant interfaces below, replaces the corresponding omitted typed contracts against the actual supplier carriers, refines the two parity proofs, and closes only the layers whose remaining lists become empty. The compact inverse-limit arguments use compactness/finite coefficient systems: lattice cohomology need not have finite length and an entire norm lattice tower need not be Mittag–Leffler. The étale j_* comparison is explicitly degree one, and ordinary/finite conditions retain H⁰, φ=1, Fil⁰ and unramified corrections.

### ArithmeticGaloisDuality:R02.1

Continuous cohomology with compact coefficients T = lim T_n (ℤ_p(1) = lim μ_{p^m}; lattices T, V = T[1/p], W = V/T) on the canonical carrier, with the Milnor sequence 0 → lim^1 H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0 and its consequence H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite (Rubin Proposition B.2.3); vanishing of lim^1 for Mittag-Leffler systems; and the maps H^1(T) → H^1(V) → H^1(W) with H^1(T) ⊗ ℚ_p ≅ H^1(V) (Rubin Proposition B.2.4). Also: the long exact sequences for 0 → T → V → W → 0 and Tate's inverse-limit theorem for H¹(K, T) = lim H¹(K, W_M), cited as R02.1's nodes. The general continuous-section LES must apply to the canonical topological period coefficients V⊗B_cris and V⊗B_dR, beyond compact or finite-dimensional coefficient modules. For Iwasawa cohomology: derived-limit acyclicity/exactness for compatible towers of compact finite-type R-modules via their finite coefficient quotients, with the topology and continuous maps retained. Condition (F) makes finite coefficient cohomology finite, not all lattice cohomology finite-length.

Needed by: `SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`, `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`, `SelmerIwasawaCohomology:L0/inverse-limit-hypotheses`, `SelmerIwasawaCohomology:L2/lattice-passage`, `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`, `SelmerIwasawaCohomology:L2/finite-unramified-comparison`, `SelmerIwasawaCohomology:L2/selmer-limits`, `SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit`, `SelmerIwasawaCohomology:L4/period-fundamental-sequences`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

### ArithmeticGaloisDuality:R02.3

G_{F,S} for a number field F and finite S ⊇ {v | p∞}, decomposition-group localisation maps H^i(G_{F,S}, M) → H^i(F_v, M), finiteness of H^i(G_{F,S}, M) for finite M, and the Kummer sequence 0 → 𝓞_{F,S}^×/p^m → H^1(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0. Also: finiteness of H¹(K_Σ/K, W_M), cited as R02.3/h1-finite.

Needed by: `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/selmer-limits`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Import the current library’s Hilbert-90/Kummer isomorphism and its restriction/norm squares (kummerMap_surjective, kummerIso, kummerIso_res, kummerIso_norm). The remaining interface is their compatibility with the μ_(p^m) coefficient tower and canonical compact-cochain comparison, together with H⁰(G_K,μ_n)=μ_n(K); do not reimplement the existing finite-level arithmetic.

Needed by: `SelmerIwasawaCohomology:L0/kummer-limit-map`, `SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler`, `SelmerIwasawaCohomology:L0/padic-kummer-identification`, `SelmerIwasawaCohomology:L0/local-power-class-finite`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Inflation–restriction for discrete continuous cohomology, 0 → H^1(G/H, M^H) → H^1(G, M) → H^1(H, M), and the H^1 of a procyclic group, H^1(Ẑ, C) ≅ C/(σ − 1)C by evaluation at a generator.

Needed by: `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

For K/ℚ_ℓ finite: K^× = π^ℤ × 𝓞_K^×, 𝓞_K^× = μ_{q−1} × U^1_K, U^1_K a finitely generated ℤ_p-module when ℓ = p and pro-ℓ when ℓ ≠ p, and finiteness of K^×/(K^×)^n (Hensel). Import A(K), the multiplicative p-completion and its module from current LocalGaloisGroups Layer 7. Extend the local-field interface to the completed algebraic closure C_p with unique valuation extension, continuous G_K action and the Tate–Sen cohomology calculation for C_p(i), in the exact normalization needed for period-fixed-fields. This latter Part II result is not a consequence of the finite power-class theorem.

Needed by: `SelmerIwasawaCohomology:L0/local-completion`, `SelmerIwasawaCohomology:L0/local-power-class-finite`, `SelmerIwasawaCohomology:L4/cp-period-comparison`, `SelmerIwasawaCohomology:L4/period-fixed-fields`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Dirichlet's S-unit theorem: 𝓞_{F,S}^× is finitely generated, of rank #S − 1.

Needed by: `SelmerIwasawaCohomology:L0/s-units-completion`, `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Import the general discrete-module local-condition structure, its Selmer kernel and locally constant cohomology constructor, as well as the elliptic finite-level Selmer/Kummer/Sha exact sequences and transitions. Supply the comparison to the canonical continuous carrier on A=V/T.

Needed by: `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

### ArithmeticGaloisDuality:R02.4

Local Tate duality for V, W_M and T × W^* over finite extensions of ℚ_ℓ, ℝ and ℂ (Rubin, Theorem 4.1): perfect cup-product pairings into Φ, O/MO and D. The finite case is ClassFieldTheory's; the rational and lattice cases come through R02.1's limits. R02.4's poitou-tate and restricted-product-cohomology are cited as nodes.

Needed by: `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`, `SelmerIwasawaCohomology:L2/finite-condition-rational-duality`.

### ArithmeticGaloisDuality:R02.2

The Hochschild–Serre spectral sequence for I ⊆ G_K and Gal(K^ur/K) with ℚ_p-vector-space coefficients, in the degrees used to identify H¹(K^ur/K, H¹(I, V)) with H²(K, V) (Rubin, Corollary 3.3).

Needed by: `SelmerIwasawaCohomology:L2/unramified-dimension-count`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

cd_p of Gal(K^ur/K) ≅ Ẑ and of the inertia group at ℓ ≠ p is 1.

Needed by: `SelmerIwasawaCohomology:L2/unramified-dimension-count`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Naturality of the cup product in the coefficients, for the compatibility of the local pairings along T → V, V^* → W^*, T ↠ W_M and W^*_M ↪ W^*. The projection formula cor(x ∪ res y) = cor(x) ∪ y, for the twisting isomorphism.

Needed by: `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`, `SelmerIwasawaCohomology:L3/iwasawa-twist`, `SelmerIwasawaCohomology:L0/kummer-cup-shapiro`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

For ℓ ≠ p, the inertia group has a unique maximal subgroup of pro-order prime to p, with quotient ℤ_p (the tame quotient). Also: H¹(I, T) is finitely generated over ℤ_p for ℓ ≠ p (Rubin Proposition B.2.7(iii)).

Needed by: `SelmerIwasawaCohomology:L2/unramified-dimension-count`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`.

### PadicMeasuresIwasawaAlgebras:L1

Iwasawa algebras R⟦Γ⟧ for Γ ≅ ℤ_p^r × Δ: the isomorphism with R⟦X₁, …, X_r⟧[Δ], the involution ι and the twists Tw_k, and the regular sequence γ_i − 1 (Nekovář 8.4.1, 8.4.8.1).

Needed by: `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L3/iwasawa-twist`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups

Double-coset (Mackey) form of restriction and corestriction, for the semilocal decomposition.

Needed by: `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma

Shapiro's lemma at finite level with corestriction transitions (Nekovář Lemma 8.1.5), and its double-coset form (Rubin Proposition B.4.2).

Needed by: `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`, `SelmerIwasawaCohomology:L0/kummer-cup-shapiro`.

### PadicMeasuresIwasawaAlgebras:L5

Supply the perfect-complex/determinant functor, triangle multiplicativity, derived specialization and dualizing-complex conventions. Prove the signed height-one length formula under generic acyclicity. L5 currently has no planned nodes; this is a precise lower-tier foundation request, not an implementation claim.

Needed by: `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `SelmerIwasawaCohomology:L3/selmer-determinant`.

### PadicMeasuresIwasawaAlgebras:L4

Supply reflexivity/pseudo-null and almost-divisible dual criteria, and the dimension-two depth/Auslander–Buchsbaum implication: finitely generated torsion over O[[T]] with no finite submodule has projective dimension at most one. Use the existing L6 quadratic-presentation and fitting-quadratic nodes to identify Fitting with characteristic.

Needed by: `SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic`.

### SchemeAndStackFoundations:SF.6

Arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S], p inverted, with derived lattice coefficients and real-place convention; stalk computation R^q j_*T=H^q(I_v,T) and its localization triangle. An equivalence of finite étale covers alone does not imply this cohomology comparison.

Needed by: `SelmerIwasawaCohomology:L3/etale-iwasawa-comparison`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Import global reciprocity, ideal-class finiteness and the abelian pro-p idèle quotient, with finite-place unit and norm/transfer compatibility; L4 constructs only their Selmer/tower comparison.

Needed by: `SelmerIwasawaCohomology:L4/arithmetic-tower-data`, `SelmerIwasawaCohomology:L4/artin-adjoint-finiteness`.

The scratch worklist, public-source downloads and compile logs are temporary and are deleted after the PR is open and its submission check passes. This handoff and the packet preserve everything a follow-up needs; no source copy is part of the deliverables. This run claims and submits only #988, then stops.
