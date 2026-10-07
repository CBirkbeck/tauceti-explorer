# Parameter stacks, invariant theory and spectral coefficients

This roadmap constructs integral moduli of local Langlands parameters and the representation-theoretic structures that control their perfect complexes. It also supplies the group-theoretic excursion algebra and reconstruction theorem used by local spectral actions and global shtukas. The automorphic constructions belong to their consumer roadmaps.

This is the completed target-level planning pass for issue #767, by Codex, session `codex-eWzdia`, read and revised on 7 October 2026. It continues the inherited packet, retaining all 33 inherited node identifiers while correcting their statements, hypotheses, dependencies and ownership where the sources or the issue require it. The packet has 89 declarations: 16 definitions, 10 constructions, 54 theorems, 7 comparisons and 2 lemmas; 132 API items and 89 unit-test specifications accompany the definitions and constructions. There are 34 planets across eight stages, with at most six in any stage. All declarations are unchecked. All eight stages are **planned**, and the packet's planning pass is **complete**. No stage is closed: the precise supplier extensions and four gaps below remain.

## Conventions and the dependency boundary

Let E be a nonarchimedean local field with residue characteristic p and residue cardinality q, and let ℓ≠p be the coefficient prime. Write H for the pinned split dual group and Q for a finite group through which the standard action of W_E on H factors. Integral parameters use the relatively discrete condensed ring Λ_disc⊗_{ℤ_ℓ,disc}ℤ_ℓ. In particular, this is not the discrete topology on all of Λ when Λ is a characteristic-zero coefficient field. A parameter c satisfies c(γδ)=c(γ)·γ(c(δ)); its associated homomorphism takes values in a semidirect product. Gauge acts by c^h(γ)=h c(γ) γ(h)⁻¹.

The dense discrete Weil group uses geometric Frobenius σ with σ⁻¹τσ=τ^q. DHKM's arithmetic Frobenius is Fr=σ⁻¹. The selected finite-presentation model is constructed once over ℤ[1/p], and its ℤ_ℓ models are base changes. Canonical comparison between different dense models is asserted over ℤ_ℓ using unique continuous extension, rather than assumed for framed models over ℤ[1/p]. Relative scheme dimension is dim H; total dimension over the one-dimensional coefficient base is dim H+1; the quotient stack has expected relative dimension zero.

Cohomological complexes use the cohomological shift convention. The good-filtration connective part is D^{≤0}, and its t-structure lives on IndPerf, where truncations are available. Perf^ind means the stable retract closure of pullbacks from BH. Equality with all Perf is a generation theorem. Singularities use the full cotangent complex: H¹(L^∨), not an unjustified identification with H⁻¹(L)^∨ or the existing naive extension cotangent kernel. The nilpotent cone in the singularity calculation lies in the **dual** Lie algebra; the characteristic-zero Weil–Deligne monodromy lies in the Lie algebra itself.

Three strengths of invariant theory must stay separate. At every ℓ≠p there is an unconditional coarse quotient, a universal homeomorphism from its spectrum to the excursion spectrum, and semisimple geometric reconstruction. After inverting ℓ the comparison is a ring isomorphism. The integral ring isomorphism, equivariant colimit, higher-cohomology vanishing, coefficient base change and generation of actual parameter Perf require ℓ∤|π₁(H)_tors|. The generic integral categorical universal property instead uses Map^Σ; it has no such prime restriction until it is compared with the actual Weil parameter category.

The dependency order is LP0 → LP1 → unconditional excursion/semisimple theory, together with LP1 → LP3 → integral-invariants and LP4 generation. LP4's generic action theorems are also built from the categorical approximation. General reductive-group, highest-weight, geometric-reductivity and fixed-group foundations have an independent supplier before these parameter applications. A fixed-point argument needed for LP1 therefore does not import the later LP3 application and create a cycle.

## What is imported

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit was read first, and the baseline declarations below were checked in their actual source files. Scheme, condensed-module, abstract group-cohomology and ordinary categorical interfaces already exist; they do not themselves supply the missing algebraic or infinity-category enhancements.

General highest-weight modules, good-filtration criteria and tensor stability are requested from the reductive-group owner. The confirmed fixes propose `ReductiveGroupsPartII:RG2.6`, but that identifier is neither current nor reserved in the atlas read for this run. The packet routes a precisely worded **extension request** to the existing `ReductiveGroupsPartII:RG2.5`, and records registration as G1. It does not claim that RG2.5's present pinned-dual statement proves those extensions. LP3 owns their cocycle, fixed-group and generation applications; PA.1 keeps its GL-specific weight and linkage bounds.

`SchemeAndStackFoundations:SF.1` supplies fpqc descent and quotient-stack interfaces; `SchemeKTheoryOperations:S.1` supplies perfectness, using E1; the E5 branch supplies the derived quotient and linear stable-category extensions. `DerivedDeRhamCohomology:DD.0` supplies the full cotangent complex. `DeformationAndDerivedPatchingAlgebra:R03.3` is requested to extend its complete-intersection direction to singularities and coherent support. The existing Tau Ceti DGAInfinity Layer 8 supplies Hochschild cochains; the relative cotangent-to-Hochschild bridge is an explicit extension request. SF.4 is requested to supply the normalisation, étaleness and completion inputs for the BHKT quotient applications.

The blueprint owns the abstract VIII.3–VIII.4 operators and reconstruction, and the generic VIII.5/X parameter-category results. `ExcursionOperatorsAndSpectralAction` applies them to the HS1/HS4 family on compact lisse objects on Bun_G, performs the W→W_E/P passage using IX.5.1, and handles the compact-support and ES1 comparisons. This follows the issue's more specific ownership resolution. `GlobalShtukasAndFunctionFieldLanglands:GS.5` imports the group-agnostic excursion relations and reconstruction, then supplies shtuka-specific operators and the global continuity instance. `SmoothRepresentationsOfLocalGroups:SR.6` imports LP1's single integral model and keeps DHKM's finiteness and Hecke consequences.

## Sources and scope of reading

The six public PDFs below were opened, downloaded and read in the sections listed, on 7 October 2026. The pass covers the definitions and key results in these sections needed by the roadmap targets. It does not claim a reading of the unrelated chapters of the six papers. Results cited inside these papers that belong to a general supplier are requested explicitly; the unread secondary proofs are named in G1 rather than silently treated as verified.

### Geometrization of the local Langlands correspondence

Laurent Fargues; Peter Scholze. [Author-hosted 356-page PDF; printed and PDF pages agree. Same SHA-256 as the inherited packet; this pass extends the VIII.5 reading beyond p.301.](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Read 2026-10-07; PDF SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

- VIII introduction, VIII.1–VIII.4, pp.277–293, statements and proofs
- VIII.5, pp.293–315, including fixed groups, Donkin theorem, the cyclic fixed-locus resolution, fundamental groups, gerbes and wild elimination; statements and proofs
- X introduction and X.1, pp.339–343; X.3, pp.348–350, abstract rational and integral universal properties and proofs. X.2 elliptic applications are outside this packet.

### Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale

Vincent Lafforgue. [Public French arXiv PDF; source numbering is that used in FS. Global shtuka constructions are imported by GS.5, not read or planned here.](https://arxiv.org/pdf/1209.5352). Read 2026-10-07; PDF SHA-256 `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.

- §10, Lemma10.1 and Proposition10.8, pp.133–139, abstract relations; §11, definitions and Proposition11.7 with Lemmas11.9–11.10 and proof, pp.140–147; Remark11.8 trace comparison.

### G-hat-local systems on smooth projective curves are potentially automorphic

Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne. [Published Acta Mathematica 223 (2019) PDF. General potential-automorphy arguments are outside this packet.](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). Read 2026-10-07; PDF SHA-256 `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.

- §3.1–§3.2, pp.10–19, all statements and proofs; §4.1–§4.7, pp.19–24, pseudocharacters, reconstruction and all three continuity clauses; Proposition8.3 and proof, p.53.

### Coherent sheaves on the stack of Langlands parameters

Xinwen Zhu. [Public revised arXiv PDF (2025 revision). Lemma3.10 is the Weil–Deligne comparison cited as Lemma3.1.8 by FS; these are different numbering versions, not different assertions.](https://arxiv.org/pdf/2008.02998). Read 2026-10-07; PDF SHA-256 `40b5f906d3238b80cde88e51f917e2c7a0f104a1d98bfb7366ac8dc4c35b79b2`.

- §3.1, pp.31–36: discrete groups, strong continuity, Theorem3.7, Lemmas3.9–3.12 and proofs.

### Moduli of Langlands parameters

Jean-François Dat; David Helm; Robert Kurinczuk; David Moss. [Public arXiv PDF; arithmetic Frobenius is inverse to the geometric Frobenius of FS.](https://arxiv.org/pdf/2009.06708). Read 2026-10-07; PDF SHA-256 `70b647bb5fbf924f20784a5084f7f38c9a2faf88e04690f38d76fc0be2a3213c`.

- Introduction, Definition1.1 and main theorems, pp.4–7; §4.1, Theorem4.1 and Corollary4.2 with their proofs, pp.29–31.

### Endo-parameters for p-adic classical groups

Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens. [Public arXiv PDF. The wild local Langlands correspondence asserted there is a conjectural boundary, not a theorem here.](https://arxiv.org/pdf/1611.02667). Read 2026-10-07; PDF SHA-256 `1cbcbb779d8d4ba8f3339d749b3dd7bc3d2555e6792491338a861d45009d9092`.

- §1.20–§1.21, pp.8–9: enhanced Langlands and extended wild inertial parameters, centralisers, equation(1.1) and restriction.

## Verified baseline interfaces

- [`mathlib:Representation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean): Abstract group representations on modules. Algebraic regularity, finite-projective coefficient conditions, rational reductive representations and their tensor/derived categories are supplied separately by RG/E5, not by this abstract representation alone.
- [`mathlib:MonoidHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean): Group homomorphisms. A parameter is a cocycle, not a homomorphism, but the sections of the L-group projection and the maps F_n -> W indexing the excursion colimit are homomorphisms, and the distinction is exactly what LP0's first node fixes.
- [`mathlib:Subgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean): Subgroups. The inertia and wild inertia of W_E, the open P inside the wild inertia, the discrete dense W inside W_E/P, the parabolic and Levi subgroups of G-hat semidirect W_E and the fixed-point subgroup G^P are subgroups.
- [`mathlib:FreeGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): Free groups with their universal property. The excursion algebra is a colimit over (n, F_n -> W), and AUDIT-21 records this as the indexing half of that construction, the cocycle spaces themselves being absent.
- [`mathlib:RingHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Hom/Defs.lean): Ring homomorphisms. The Theta_n of the universal property are maps of Z_l-algebras, and the comparison Exc -> O(Z^1)^{G-hat} is one.
- [`mathlib:MvPolynomial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean): Polynomial algebras. O(Z^1(F_n,G-hat)) = O(G-hat^n) is a quotient of a polynomial algebra, and the finite presentation of the cocycle scheme is by equations in such a ring.
- [`mathlib:AlgebraicGeometry.Scheme`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean): Schemes. Z^1(W_E/P,G-hat) is an affine scheme of finite type, Z^1(W_E,G-hat) is a disjoint union of such, and Sing_{X/S} is an affine X-group scheme.
- [`mathlib:Module.Flat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean): Flatness. Z^1(W_E/P,G-hat) is FLAT over Z_l, the excursion algebra is flat under the good-prime hypothesis, and the universal property of its l-torsion-free quotient is for FLAT test algebras.
- [`mathlib:RingTheory.Sequence.IsRegular`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean): REGULAR SEQUENCES, at the pins. AUDIT-21 records that Mathlib has no named local-complete-intersection predicate, but that the lci structure CAN be stated as a quotient by a regular sequence; this is the pinned notion that statement would use.
- [`mathlib:Algebra.Extension.H1Cotangent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean): Kernel of the naive extension cotangent-complex differential, the degree-one naive term. The full derived cotangent complex and H^1 of its dual are requested separately, not identified with this kernel.
- [`mathlib:groupCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean): Cohomology of an abstract group representation by the inhomogeneous cochain complex. Rational algebraic-group cohomology and condensed continuous Weil cohomology need separate interfaces.
- [`mathlib:PrimeSpectrum.isHomeomorph_comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean): A ring map with nilpotent kernel and positive powers of every target element in its image induces a homeomorphism on spectra. Universal homeomorphism requires this after every base change; it is not asserted by this declaration alone.
- [`mathlib:CategoryTheory.Triangulated.TStructure`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean): t-structures on a triangulated category, at the pins, as the abstract notion only. The GOOD-FILTRATION t-structure is defined against it, and AUDIT-21 records that good filtrations themselves are absent.
- [`mathlib:CategoryTheory.Idempotents.Karoubi`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Idempotents/Karoubi.lean): The Karoubi envelope. 'Generated under cones and RETRACTS' is an idempotent-completion statement, and the categories of Chapter X are idempotent-complete by hypothesis.
- [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean): Monoidal categories. Perf(*/G-hat) acts monoidally on Perf of the parameter stack, and the universal property of the colimit theorem is for exact MONOIDAL functors.
- [`mathlib:CategoryTheory.Functor.Monoidal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean): Monoidal functors, the data the universal property quantifies over.
- [`mathlib:CategoryTheory.CatCenter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean): `abbrev CatCenter := End (1_C)`, at the pins: the Bernstein centre of a category, which is the target of the map out of the excursion algebra in FS VIII.4.1.
- [`mathlib:Condensed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Basic.lean): Condensed objects, at the pins. A parameter is a CONDENSED cocycle, the coefficient ring is made condensed as Lambda_disc tensor_{Z_l,disc} Z_l, and the evaluations of the excursion algebra over W_E/P are maps of condensed sets.
- [`mathlib:CondensedMod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Module.lean): Condensed modules, the ambient category for the condensed coefficient convention.
- [`mathlib:Module.Free`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean): Free coefficient modules in Weil duality; finite rank is an additional hypothesis. The finite-type submodules of the condensed coefficient convention need not themselves be free.
- [`mathlib:RootPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean): Root pairings, at the pins, with RootPairing.flip for the dual root datum. The exponents of the root system, the Chevalley isomorphism g-hat // G-hat = t-hat // W, the dominant weights indexing the nabla_lambda and pi_1(G-hat) as the quotient of the character lattice by the root lattice are all root-datum data.
- [`mathlib:CoxeterSystem`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coxeter/Basic.lean): Coxeter systems. The Coxeter number h, which bounds the exponents in the banality condition of FS VIII.2.11, is a Coxeter-theoretic invariant.
- [`tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean): Degree-n continuous cohomology as a coefficient functor from TopRep to TopModuleCat. This is an abelian cohomology interface, not nonabelian cocycles or local Weil duality.
- [`mathlib:CategoryTheory.PresheafOfGroups.OneCocycle`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean): Nonabelian Čech 1-cocycles of a presheaf of groups on a family of objects. The cocycle, gauge relation and quotient H1 are already supplied; continuous crossed cocycles of a group action are a different input. Their bridge is descent via SF.1.
- [`mathlib:SemidirectProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SemidirectProduct.lean): Group carrier N⋊[α]Γ with multiplication (n,γ)(n′,γ′)=(n α(γ)(n′),γγ′), rightHom projection and its sections. Does not supply a condensed or integral L-group.
- [`mathlib:Subalgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean): Subalgebras containing the base-ring image and closed under zero, one, addition and multiplication. An algebraic invariant ring also requires the rational action supplied by RG.
- [`mathlib:CommRingCat.Colimits.hasColimits_commRingCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/Ring/Colimits.lean): Small colimits of commutative rings, with cocone maps and universal descent. The excursion diagram and Z_l-algebra/animated enhancement remain additional inputs.
- [`mathlib:Equiv.Perm.cycleFactorsFinset`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Cycle/Factors.lean): Finite set of disjoint nontrivial cyclic factors of a finite permutation. Fixed one-cycles must be added separately in the trace identity.
- [`tauceti:TauCeti.fixedSubgroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/FixedSubgroup.lean): The equaliser of a group endomorphism F and identity; membership is F(g)=g. Point-group compatibility for cyclic fixed loci only; no scheme smoothness, reductivity or connectedness follows.

## Layers and declaration catalogue

Each entry names its stable packet identifier, mathematical statement, direct inputs and proof route. Definitions and constructions also list the proposed API, its consumers and at least three test specifications. The tests describe required behaviour; they do not report implemented proofs. Source references point to the versioned public PDFs above. All declarations remain unchecked.

## LP0 — LanglandsParameterStacks:LP0

LP0 fixes the coefficient convention before discussing topology. Crossed cocycles, sections and finite-Q lifts are equivalent descriptions, but a cocycle is generally not a homomorphism into H. Finite wild ramification produces the clopen pieces used in every subsequent stage. The unique extension theorem connects the dense finitely presented Weil group to condensed parameters.

KSS adds a distinct complex classical-group use of wild restrictions. A wild inertial parameter must extend to an admissible parameter. Its twisted centralizer takes account of conjugation on P_F by the Weil component; using an ordinary centralizer in the whole L-group gives the wrong object. Enhancements restrict through the intrinsic centre quotient, and their restriction need not stay irreducible.

**Coverage: planned.** Register the RG2.6 structural/complex enhancement requests; finish the Weil/wild/condensed coefficient supplier interfaces and the corresponding omitted signatures.

**Planets:** Crossed cocycles; Condensed L-parameters; Finite wild ramification; Weil discretisation; Wild inertial parameters; Extended wild parameters.

### Crossed cocycles and gauge action

Identifier: `LanglandsParameterStacks:LP0/functoriality-of-cocycles`. Kind: construction.

For a group Γ acting on a group H by α:Γ→Aut(H), CrossedCocycle(α) consists of maps c:Γ→H with c(γδ)=c(γ)α(γ)(c(δ)). Gauge by h is c^h(γ)=h c(γ)α(γ)(h)^{-1}. Equivariant coefficient homomorphisms and restriction of Γ transport cocycles. Sections Γ→H⋊Γ are equivalent to cocycles; H¹(Γ,H) is the gauge-orbit set. In the continuous version require continuous c and a continuous action.

**Hypotheses and conventions.** Γ,H are groups; the continuous version has topological groups and continuous action.

**Direct inputs.** `mathlib:MonoidHom`, `mathlib:Subgroup`, `mathlib:CategoryTheory.PresheafOfGroups.OneCocycle`, `SchemeAndStackFoundations:SF.1`, `mathlib:SemidirectProduct`.

**Construction or proof.**

1. Multiply (c(γ),γ)(c(δ),δ) in the semidirect product to obtain the cocycle equation.
2. Use associativity for the gauge action and equivariance for coefficient transport.
3. Keep this crossed-group interface distinct from the baseline Čech cocycle; compare after the SF.1 descent bridge.

Source: [Laurent Fargues; Peter Scholze, VIII.1.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `CrossedCocycle` (data): Maps with the crossed multiplication law.
- `CrossedCocycle.ext` (extensionality): Pointwise equality implies equality of cocycles.
- `CrossedCocycle.map_one` (simp): c(1)=1.
- `CrossedCocycle.map_inv` (simp): c(γ⁻¹)=α(γ⁻¹)(c(γ)⁻¹).
- `CrossedCocycle.gauge` (functoriality): The H-action h·c has the displayed formula and satisfies one and multiplication laws.
- `CrossedCocycle.restrict` (functoriality): Precompose a group homomorphism; restrict the action, with identity and composition laws.
- `CrossedCocycle.map` (functoriality): An α-equivariant homomorphism H→H′ maps c pointwise; identity, composition and gauge compatibility.
- `CrossedCocycle.sectionEquiv` (equivalence): Cocycles are the sections of H⋊Γ→Γ.
- `CrossedCocycle.orbit` (projection): The gauge class in nonabelian H¹, compatible with restrictions.

**Uses.**

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`: Sections and the finite-Q lift.
- `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`: Universal equations and twisted conjugation.

**Unit-test specifications.**

- `cocycle_trivial_action` (compatibility): For trivial α, crossed cocycles are precisely group homomorphisms Γ→H.
- `cocycle_trivial_group` (degenerate): For Γ=1 there is exactly one crossed cocycle.
- `cocycle_coboundary` (computation): The gauge of the unit cocycle by h evaluates to h α(γ)(h)⁻¹.
- `cocycle_not_hom` (non-example): Let Γ=C₂ act on H=ℤ additively by negation. The cocycle c(s)=1 satisfies c(s²)=1−1=0, but is not a homomorphism C₂→ℤ.

### Condensed L-parameters

Identifier: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`. Kind: definition.

Fix a pinned split dual group H/Z_l with standard algebraic action factoring through Q and W_E→Q. For a Z_l-algebra Λ use the condensed algebra Λ_disc⊗_{Z_l,disc}Z_l. On profinite S its sections are continuous maps S→Λ taking values in a finite-type Z_l-submodule. An L-parameter is a condensed crossed cocycle W_E→H(Λ), equivalently a section H(Λ)⋊W_E→W_E, or a lift of W_E→Q to H(Λ)⋊Q.

**Hypotheses and conventions.** l≠p; the action is the standard pinning action. The cyclotomic normalisation is compared only after adjoining sqrt(q). The relatively discrete condensed coefficient convention is part of the definition, not the discrete topology on all Λ.

**Direct inputs.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Condensed`, `mathlib:CondensedMod`.

**Construction or proof.**

1. Import the Weil group and the integral pinned dual, and apply the crossed-cocycle/section equivalence in condensed groups.
2. Compute the tensor coefficient convention on profinite sets; a faithful linear embedding gives the finite-type continuous matrix-coefficient criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.1.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `condensedCoefficients` (structure): The relatively discrete condensed coefficient algebra with its finite-type continuous sections.
- `LParameter` (data): A condensed crossed cocycle for the standard action.
- `LParameter.asSection` (equivalence): Cocycles and sections are naturally equivalent.
- `LParameter.asLift` (equivalence): Sections and lifts to H⋊Q are naturally equivalent.
- `LParameter.matrixCriterion` (characterisation): For a closed embedding H⋊Q→GL_N, restriction to inertia has finite-type continuous matrix coefficients.
- `LParameter.restrictWild` (projection): Restriction to wild inertia with the same action and coefficient convention.

**Uses.**

- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`: The extension theorem concerns these coefficients.
- `LanglandsParameterStacks:LP1/representability-flatness-and-lci`: The functor of points represented by the parameter scheme.
- `ExcursionOperatorsAndSpectralAction:ES5`: Parameters of Schur objects.

**Unit-test specifications.**

- `parameter_split_torus` (computation): For H=G_m with trivial action, parameters are continuous multiplicative characters with the prescribed coefficient convention.
- `parameter_char_l` (computation): For an F_l-algebra Λ the relatively discrete condensed structure is discrete; inertia restrictions are locally constant.
- `parameter_section` (compatibility): The projection of asSection(φ)(w) equals w, and its first coordinate equals φ(w).
- `parameter_not_discrete_Ql` (non-example): For Λ=Q_l the convention admits continuous infinite-image Z_l-valued inertia characters; imposing discrete coefficients would exclude them.

### Finite wild ramification

Identifier: `LanglandsParameterStacks:LP0/finite-wild-ramification`. Kind: definition.

A parameter has finite wild ramification if its restriction to wild inertia P_E is trivial on an open subgroup. A finite-wild piece indexed by open normal P⊂P_E, normal in W_E and in the kernel of W_E→Q, consists of parameters trivial on P.

**Hypotheses and conventions.** l≠p; relatively discrete coefficients as in LParameter.

**Direct inputs.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Construction or proof.**

1. A continuous image of the pro-p wild group in the l-adic matrix congruence kernel is trivial; compactness and reduction modulo l yield finite wild image.
2. Shrink a kernel to a W_E-normal open subgroup and require it to kill the fixed finite action.

Source: [Laurent Fargues; Peter Scholze, VIII.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `FiniteWildRamification` (characterisation): There exists an open wild kernel.
- `FiniteWildPiece` (data): The subfunctor of parameters trivial on P.
- `FiniteWildPiece.inflate` (functoriality): For P′⊂P, inflation embeds the P-piece in the P′-piece.
- `LParameter.finiteWild` (other): Every parameter with these coefficients has finite wild ramification.

**Uses.**

- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`: The clopen decomposition.
- `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`: Objectwise finite ramification in the consumer.

**Unit-test specifications.**

- `wild_unramified` (degenerate): An unramified parameter lies in the piece P=P_E when Q is unramified.
- `wild_piece_order` (characterisation): For P′⊂P, triviality on P implies triviality on P′; the inflation direction is this way.
- `wild_finite_image` (compatibility): For coefficients in a finite extension of Q_l the condition means the usual finite image on wild inertia.

### Discrete Weil groups and unique extension

Identifier: `LanglandsParameterStacks:LP0/discretization-and-unique-extension`. Kind: theorem.

For open normal P as above choose tame τ and geometric Frobenius σ. The dense group W⊂W_E/P generated by P_E/P, τ^{Z[1/p]} and σ is finitely presented, with σ⁻¹τσ=τ^q and the finite-wild conjugation relations. Restriction identifies condensed parameters trivial on P with crossed cocycles on W whose wild restriction is continuous (automatic for finite P_E/P).

**Hypotheses and conventions.** Finite action factors through W_E/P; l≠p; use relatively discrete Z_l-algebras.

**Direct inputs.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/finite-wild-ramification`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:FreeGroup`.

**Construction or proof.**

1. Import the exact tame quotient and its topology. Matrices conjugate to their qth powers have roots-of-unity eigenvalues of order prime to p; a suitable power is unipotent. Extend its powers by the finite binomial formula, then the tame torsion part, giving existence and uniqueness of the extension.

Source: [Laurent Fargues; Peter Scholze, Proof of VIII.1.3, pp.279–280](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H=G_m the tame relation forces χ(τ)^{q−1}=1.
- Check geometric σ=Fr⁻¹ converts the DHKM relation Fr τ Fr⁻¹=τ^q into the displayed relation.

### Change of discrete Weil model

Identifier: `LanglandsParameterStacks:LP0/change-of-discretization`. Kind: comparison.

Any two choices of dense discrete W₁,W₂ inside the same W_E/P yield canonically equivalent cocycle functors over Z_l: extend to W_E/P, then restrict. The comparisons obey identity and composition. Over Z[1/p] the framed models need not be canonically choice independent; only their Z_l base changes have this universal continuous extension comparison.

**Hypotheses and conventions.** l≠p; same P and same action; coefficient convention fixed.

**Direct inputs.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Use the unique extension twice; both compositions are identity because their restrictions extend to the same parameter. Compare DHKM Corollary4.2, which asserts the integral l-adic canonical identification, not choice independence of framed Z[1/p]-models.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; David Moss, §4.1, Corollary4.2, pp.30–31](https://arxiv.org/pdf/2009.06708).

**Acceptance.**

- Changing τ scales the normalised monodromy coordinate; the parameter functor comparison is canonical, not equality of an unnormalised N.

### Wild inertial parameters

Identifier: `LanglandsParameterStacks:LP0/wild-inertial-parameter`. Kind: definition.

In the complex classical-group setting of KSS, a wild inertial parameter is a homomorphism ρ:P_F→{}^LG which extends to an admissible Langlands parameter φ:W_F×SL₂(C)→{}^LG with the prescribed projection to W_F. It is taken up to conjugation by the complex dual group H.

**Hypotheses and conventions.** The action on H is trivial on P_F, so this restriction is a homomorphism; admissibility and the classical-group L-group are supplied by RG2.5.

**Direct inputs.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Construction or proof.**

1. Restrict an admissible parameter to P_F; require extendibility as part of the definition, not a theorem that arbitrary wild homomorphisms extend.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.20–§1.21, pp.8–9](https://arxiv.org/pdf/1611.02667).

**API.**

- `WildInertialParameter` (data): A wild homomorphism together with existence of an admissible extension.
- `WildInertialParameter.conjugate` (functoriality): H-conjugation preserves extendibility.
- `WildInertialParameter.ofLanglands` (constructor): Restrict an admissible complex Langlands parameter.
- `WildInertialParameter.ext` (extensionality): The underlying homomorphism determines this subtype; the extension is not chosen data.

**Uses.**

- `LanglandsParameterStacks:LP0/twisted-wild-centralizer`: The centralizer uses the wild restriction.
- `LanglandsParameterStacks:LP0/extended-wild-parameters`: Enhanced restrictions.

**Unit-test specifications.**

- `wild_inertial_trivial` (degenerate): The trivial wild homomorphism is extendible by an unramified admissible parameter.
- `wild_inertial_conjugate` (compatibility): Restriction of hφh⁻¹ equals hρh⁻¹.
- `wild_inertial_extension_not_data` (characterisation): Two admissible extensions with the same ρ define the same WildInertialParameter.

### Twisted wild centralizers

Identifier: `LanglandsParameterStacks:LP0/twisted-wild-centralizer`. Kind: construction.

Define C_{{}^LG}(ρ)={(g,w): (g,w)ρ(w⁻¹pw)(g,w)⁻¹=ρ(p) for all p∈P_F}. It is an extension of W_F by C_H(ρ). A chosen admissible extension φ identifies it with C_H(ρ)⋊_{Ad φ}W_F. This is a twisted centralizer, not the ordinary centralizer of ρ(P_F) in the L-group.

**Hypotheses and conventions.** ρ is extendible; φ provides a splitting; P_F is normal in W_F.

**Direct inputs.** `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `mathlib:Subgroup`, `mathlib:MonoidHom`.

**Construction or proof.**

1. Check closure using normality of P_F. The splitting sends w to φ(w), and (g,w) factors uniquely as (gφ(w)⁻¹)φ(w).
2. Changing the extension changes this chosen splitting; the subgroup defined by the equation is intrinsic.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, p.8](https://arxiv.org/pdf/1611.02667).

**API.**

- `twistedWildCentralizer` (data): The displayed subgroup of the L-group.
- `twistedWildCentralizer.mem_iff` (characterisation): Membership is the twisted equation for every p.
- `twistedWildCentralizer.projection` (projection): The group projection to W_F.
- `twistedWildCentralizer.kernel` (characterisation): Its kernel is C_H(ρ).
- `twistedWildCentralizer.splitEquiv` (equivalence): A chosen extension gives C_H(ρ)⋊_{Ad φ}W_F.

**Uses.**

- `LanglandsParameterStacks:LP0/wild-enhancement-group`: The centre gives S_ρ.

**Unit-test specifications.**

- `wild_centralizer_trivial` (degenerate): For ρ=1 the twisted centralizer is the whole L-group.
- `wild_centralizer_kernel` (compatibility): Elements above w=1 are exactly the usual dual-group centralizer.
- `wild_centralizer_twist` (non-example): For any extension φ, φ(w) lies in the twisted centralizer even when it does not commute with every ρ(p).

### Wild enhancement groups

Identifier: `LanglandsParameterStacks:LP0/wild-enhancement-group`. Kind: definition.

Set S_ρ=Z(C_{{}^LG}(ρ))/Z(H)^{W_F}. Via a chosen φ, the numerator is Z(C_H(ρ))^{φ(W_F)} and embeds into C_H(φ(W_F×SL₂(C))). Restriction along this centre inclusion and quotient defines a map Rep(S_φ)→Rep(S_ρ), where S_φ=C_H(φ)/(C_H(φ)°Z(H)^{W_F}).

**Hypotheses and conventions.** Use the trivial centre of W_F and φ(SL₂(C))⊂C_H(ρ), as in KSS(1.1); S_ρ is not defined as π₀ C_H(ρ).

**Direct inputs.** `LanglandsParameterStacks:LP0/twisted-wild-centralizer`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`.

**Construction or proof.**

1. Take centres of the split extension, noting the projection of any central element to W_F is trivial.
2. The centre commutes also with φ(SL₂), hence lies in the parameter centralizer. Inflating a representation of S_φ and restricting kills Z(H)^{W_F}.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, equation(1.1), p.8](https://arxiv.org/pdf/1611.02667).

**API.**

- `wildEnhancementGroup` (data): The quotient of the intrinsic twisted centralizer centre.
- `wildEnhancementGroup.centerIdentification` (equivalence): Using φ identifies it with Z(C_H(ρ))^{φ(W_F)}/Z(H)^{W_F}.
- `wildEnhancementGroup.restrictRep` (functoriality): Inflate from S_φ and restrict to the centre, descending to S_ρ.
- `wildEnhancementGroup.conjugateEquiv` (equivalence): Dual-group conjugation transports the quotient and its representations.

**Uses.**

- `LanglandsParameterStacks:LP0/extended-wild-parameters`: Defines the allowed enhancement.

**Unit-test specifications.**

- `wild_enhancement_trivial_rho` (computation): For ρ=1 the numerator is Z(H)^{W_F}, so S_ρ is trivial.
- `wild_enhancement_center_quotient` (characterisation): The restricted representation is trivial on Z(H)^{W_F}.
- `wild_enhancement_conjugacy` (compatibility): Conjugating φ and ρ transports the restricted representation by the induced S_ρ equivalence.

### Extended wild inertial parameters

Identifier: `LanglandsParameterStacks:LP0/extended-wild-parameters`. Kind: definition.

An extended wild parameter is (ρ,χ_ρ), where ρ is wild inertial and χ_ρ is a representation of S_ρ obtained by restricting some irreducible enhancement χ_φ of an admissible extension φ. Wild(G) is the set of H-conjugacy classes of such pairs. Res:Lang(G)→Wild(G) sends (φ,χ_φ) to this restriction. χ_ρ is not required to be irreducible.

**Hypotheses and conventions.** Complex classical-group setting, as in KSS; enhanced admissible parameters come from RG2.5. No bijection with endo-parameters is asserted.

**Direct inputs.** `LanglandsParameterStacks:LP0/wild-enhancement-group`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the centre restriction from the preceding construction.
2. Show conjugation transports the restriction, so Res descends to equivalence classes. Existence of the enhanced extension is retained, whereas irreducibility of the restriction is not.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, pp.8–9](https://arxiv.org/pdf/1611.02667).

**API.**

- `ExtendedWildParameter` (data): Pairs satisfying the enhancement extension condition.
- `WildParameterClasses` (data): H-conjugacy classes of extended wild pairs.
- `restrictEnhancedParameter` (functoriality): The well-defined map Res on classes.
- `ExtendedWildParameter.forget` (projection): Forget the enhancement to the wild conjugacy class.

**Uses.**

- `KSS §1.21 equation(1.2)`: The codomain of the conjectural wild correspondence; no correspondence theorem is imported.

**Unit-test specifications.**

- `extended_wild_unramified` (degenerate): For trivial ρ the restriction enhancement is the trivial S_ρ representation on the underlying vector space, whose dimension need not be one.
- `extended_wild_conjugacy` (characterisation): Conjugate enhanced Langlands parameters have the same WildParameterClasses image.
- `extended_wild_forget` (compatibility): Forgetting Res(φ,χ_φ) equals the conjugacy class of φ|P_F.

## LP1 — LanglandsParameterStacks:LP1

LP1 owns the single finite-presentation cocycle scheme and its flat complete-intersection geometry. The dimension bound uses fixed-group reductivity and finite unipotent-class input from the independent reductive supplier, before any LP3 generation argument. The derived framing and quotient are parameter instances of imported derived mapping and descent foundations.

Weil cohomology and Tate duality compute tangent and cotangent complexes. Characteristic-zero monodromy compares the parameter space with Weil–Deligne pairs. Singularities are calculated in the dual Lie algebra, and banal primes yield a containment in its nilpotent cone, not equality. The corrected cotangent-to-Hochschild map gives the cohomological support operators; source issue E4 explains why the printed equality with all Hochschild cohomology is too strong.

**Coverage: planned.** Supply RG2.6 fixed-group reductivity and unipotent-class finiteness before the dimension bound; discharge SF.1/S.1/E5/DD.0/R03.3/DGA8 general interfaces. Fill the omitted derived/singularity signatures.

**Planets:** Integral cocycle schemes; Weil cohomology and duality; Flat complete-intersection parameter spaces; Cotangent complexes of parameter stacks; Weil–Deligne parameters; Singularities of parameter stacks.

### Integral finite-wild cocycle schemes

Identifier: `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`. Kind: construction.

For a split reductive model H over Z[1/p] with finite W-action and a finite-wild quotient W=W_F^0/P_F^e, construct Z¹(W,H) as the closed subscheme of H^r cut out by the cocycle equations of a finite presentation of W. It represents crossed cocycles on W for all Z[1/p]-algebras and carries twisted conjugation. Its base change to Z_l represents the finite-wild condensed parameter functor for l≠p.

**Hypotheses and conventions.** The chosen discrete W has finite wild subgroup and tame relation. The model H and action over Z[1/p] are fixed; framed choice independence is asserted only after base change to Z_l.

**Direct inputs.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`, `mathlib:MvPolynomial`, `mathlib:AlgebraicGeometry.Scheme`.

**Construction or proof.**

1. Use generators to embed the functor into H^r and impose each relation, evaluated with the given action. The relation functor is an equaliser of algebraic maps, hence a closed affine finite-presentation scheme.
2. The universal property identifies relations with cocycles, and hence is independent of a presentation of the same W.
3. Use arithmetic Fr=σ⁻¹ to compare DHKM and FS presentations; apply the unique continuous-extension theorem after base change.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; David Moss, §1 and §4.1, pp.4–7,29–31; FS proof VIII.1.3, p.280](https://arxiv.org/pdf/2009.06708).

**API.**

- `IntegralCocycleScheme` (data): The representing affine finite-presentation scheme over Z[1/p].
- `IntegralCocycleScheme.pointsEquiv` (universal-property): A-points are crossed cocycles W→H(A), naturally in A.
- `IntegralCocycleScheme.universalCocycle` (projection): Evaluation at w gives the universal cocycle, satisfying the crossed multiplication law.
- `IntegralCocycleScheme.gaugeAction` (structure): Twisted conjugation is an algebraic H-action.
- `IntegralCocycleScheme.baseChange` (compatibility): The base change represents cocycles for the base-changed H and action.
- `IntegralCocycleScheme.presentationEquiv` (equivalence): Two finite presentations of the same W give canonical mutually inverse scheme isomorphisms.

**Uses.**

- `LanglandsParameterStacks:LP1/representability-flatness-and-lci`: Flat lci model.
- `SmoothRepresentationsOfLocalGroups:SR.6`: DHKM finiteness and Hecke consequences import this construction.

**Unit-test specifications.**

- `scheme_free_group` (computation): For W=F_n the cocycle scheme is H^n with twisted conjugation.
- `scheme_trivial_group` (degenerate): For W=1 it is Spec Z[1/p].
- `scheme_tame_torus` (computation): For H=G_m and unramified action, the tame scheme has coordinates s∈G_m, t∈μ_{q−1}; it is G_m×μ_{q−1}.
- `scheme_l_adic` (compatibility): Its Z_l-points functor on Z_l-algebras agrees with the corresponding finite-wild condensed parameter functor.

### Clopen finite-wild pieces

Identifier: `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`. Kind: lemma.

Z¹(W_E,H) is the filtered union of its finite-wild pieces Z¹(W_E/P,H). For P′⊂P these are open and closed subschemes inside the P′-piece; the union is a disjoint union of affine finite-type schemes after separating the clopen wild-kernel strata.

**Hypotheses and conventions.** l≠p; P kills the finite action.

**Direct inputs.** `LanglandsParameterStacks:LP0/finite-wild-ramification`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`.

**Construction or proof.**

1. The equation φ(γ)=1 is clopen for finite p-power order γ because p is invertible in the coefficient ring. Impose finitely many such equations on P/P′.
2. Every parameter has an open wild kernel. Separate nested clopen pieces to obtain the disjoint affine cover.

Source: [Laurent Fargues; Peter Scholze, Proof VIII.1.3, pp.279–280](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Do not assert that the full union is quasi-compact when infinitely many distinct wild strata occur.

### Weil cohomology dimension and Euler characteristic

Identifier: `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`. Kind: theorem.

For a finite-rank free relatively discrete Λ-module M with condensed W_E-action and l≠p, RΓ(W_E,M) has perfect amplitude [0,2] and Euler characteristic zero. For field coefficients dim H⁰−dim H¹+dim H²=0. The same calculation on a finite-wild dense W gives the derived deformation complex.

**Hypotheses and conventions.** Λ is a Z_l-algebra; use the continuous/condensed theory, not abstract cohomology of W_E with forgotten topology.

**Direct inputs.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor`, `mathlib:groupCohomology`, `mathlib:Module.Free`.

**Construction or proof.**

1. Kill an open wild kernel; exact invariants for the finite p-group reduce to tame inertia and Frobenius.
2. Tame l-primary inertia and the Z Frobenius each give two-term resolutions. Their total complex has amplitude [0,2] and alternating rank zero. Compare restriction to the discrete model.

Source: [Laurent Fargues; Peter Scholze, VIII.1.3 dimension argument and VIII.2.2, pp.280–282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For the trivial rank-one Q_l representation, H⁰ and H¹ have dimension one and H² vanishes.

### Frobenius-tame dimension bound

Identifier: `LanglandsParameterStacks:LP1/dimension-bound-lemma`. Kind: lemma.

Let H/F_l be smooth with reductive identity component. For the prescribed action of σ on Z/l^mZ, the variety Hom(Z/l^mZ⋊σZ,H) has dimension at most dim H. Consequently each geometric fibre of the finite-wild cocycle scheme has dimension at most dim H of the dual group.

**Hypotheses and conventions.** l≠p; the inertia centralizer identity is reductive by the requested Prasad–Yu fixed-point input; finite unipotent conjugacy classes are a separate requested reductive-group input.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`.

**Construction or proof.**

1. Stratify the image of the tame l-power generator by its finitely many unipotent conjugacy classes. Its orbit has dimension dim H−dim Z_H(x).
2. Frobenius choices, when nonempty, form a torsor under Z_H(x), so every stratum has dimension dim H.
3. For the parameter scheme first stratify finite prime-to-l inertia, apply the fixed-group reductivity input, then this lemma. Do not use LP3 to obtain that input.

Source: [Laurent Fargues; Peter Scholze, VIII.1.4 and end of VIII.1.3, p.281](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H=G_m, the tame l-power image is finite while Frobenius varies in a one-dimensional torus.

### Flat complete-intersection parameter schemes

Identifier: `LanglandsParameterStacks:LP1/representability-flatness-and-lci`. Kind: theorem.

Each finite-wild Z¹(W,H) over Z[1/p] is flat and a relative local complete intersection of relative dimension dim H; its total dimension is dim H+1. After base change to Z_l these schemes represent finite-wild parameters, and their clopen union represents all condensed L-parameters. The quotient [Z¹/H] has expected relative dimension zero.

**Hypotheses and conventions.** Split reductive H with fixed finite action; l≠p for the Z_l interpretation. No condition on l dividing π₁(H)_tors is imposed.

**Direct inputs.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/dimension-bound-lemma`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `SchemeAndStackFoundations:SF.1`, `mathlib:Module.Flat`, `mathlib:RingTheory.Sequence.IsRegular`.

**Construction or proof.**

1. The finite presentation yields a complete-intersection presentation of the expected lower fibre dimension.
2. Use the dimension bound and the tame/wild reduction in DHKM4.1 to get the matching upper bound. The regular-sequence/flatness criterion gives syntomicity.
3. Base change and clopen gluing give FS VIII.1.3; subtract dim H only for the quotient stack.

Source: [Laurent Fargues; Peter Scholze, VIII.1.3, pp.279–281; DHKM Theorem4.1, pp.29–30](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Distinguish relative dimension dim H, absolute dimension dim H+1 and stack dimension zero.
- For the tame torus, μ_{q−1} is finite flat but may be nonreduced in characteristic l dividing q−1.

### DHKM and FS integral models

Identifier: `LanglandsParameterStacks:LP1/independent-source-and-dimension-normalisation`. Kind: comparison.

DHKM W_F^0 uses arithmetic Frobenius and the same dense tame subgroup as FS W after σ=Fr⁻¹. The finite-presentation cocycle schemes agree for matched choices over Z[1/p]; FS Z_l models are their base changes. Canonical independence of choices follows over Z_l from continuous extension, not for the framed Z[1/p]-models. DHKM dimension dim H+1 is absolute; FS dim H is relative.

**Hypotheses and conventions.** Match the wild quotient, action and dual integral model.

**Direct inputs.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP0/change-of-discretization`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`.

**Construction or proof.**

1. Match generators and relations with the inverse Frobenius normalisation.
2. Apply the representing-functor universal property and Corollary4.2 of DHKM.
3. Record that SR.6 imports the model, retaining DHKM1.7/1.8 finiteness rather than a second construction.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; David Moss, DHKM §4.1 pp.29–31; FS VIII.1.3 p.280](https://arxiv.org/pdf/2009.06708).

**Acceptance.**

- The same tame relation is obtained after replacing geometric Frobenius by its inverse.

### Derived parameter stacks

Identifier: `LanglandsParameterStacks:LP1/derived-parameter-stack`. Kind: construction.

Construct the derived framed cocycle stack and its quotient as the derived mapping stack over BQ, Map_{BQ}(BW,B(H⋊Q)), with framing at the base point. Its restriction to classical coefficient rings agrees with the finite-presentation parameter stack; QCoh and Perf use fpqc descent and the general derived stack enhancement.

**Hypotheses and conventions.** W is a finite-wild discrete model; animation and fpqc descent are imported from E5 and SF.1, and locally perfect complexes from S.1.

**Direct inputs.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:abstract`, `SchemeAndStackFoundations:SF.1`, `SchemeKTheoryOperations:S.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the general animated mapping-stack construction with the L-group projection.
2. A base-point framing extracts the derived crossed cocycle functor; quotient by changing framing gives the unframed mapping stack.
3. Apply the imported descent and perfectness interfaces, without constructing them again in LP1.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu §3.1, Theorem3.7](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `DerivedParameterStack` (data): Mapping stack over BQ with the fixed quotient map.
- `DerivedParameterStack.framed` (data): Its base-point-framed fibre.
- `DerivedParameterStack.forgetFraming` (projection): Quotient of the framed stack by H.
- `DerivedParameterStack.classicalPoints` (compatibility): Classical ring points are ordinary crossed cocycles modulo gauge.
- `DerivedParameterStack.perfectPullback` (functoriality): Restriction and coefficient base change preserve locally perfect complexes by the imported S.1 interface.

**Uses.**

- `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`: Classicality of the derived model.
- `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`: Tangent calculation.

**Unit-test specifications.**

- `derived_stack_trivial_group` (degenerate): For W=1 over the trivial quotient the unframed stack is BH, and its framed space is a point.
- `derived_stack_free_group` (computation): For W=F_n with trivial quotient the stack is [H^n/H] and the framed space H^n.
- `derived_stack_gauge` (compatibility): Changing a base-point framing by h acts by c(γ)↦h c(γ)α(γ)(h)⁻¹.

### Classicality of the derived cocycle scheme

Identifier: `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`. Kind: theorem.

The derived framed cocycle scheme of a finite-wild W is classical and equals IntegralCocycleScheme base changed to Z_l. The unframed derived stack equals [Z¹(W,H)/H].

**Hypotheses and conventions.** The flat lci dimension theorem and the continuous/discrete cochain comparison are used; this is more than equality on classical points.

**Direct inputs.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:animation`.

**Construction or proof.**

1. Compute the tangent complex using Weil cochains. Its Euler characteristic is zero for the unframed stack, hence dim H framed.
2. The classical scheme is flat lci of that expected dimension; the derived zero-locus presentation has no additional homotopy sheaves.
3. Use Zhu3.9 strong-continuity comparison to identify the derived continuous and discrete moduli problems.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu Theorem3.7 and Lemma3.9, pp.32–35](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For W=F_n the derived presentation is the smooth classical H^n.

### Local Tate duality for Weil cochains

Identifier: `LanglandsParameterStacks:LP1/local-tate-duality`. Kind: theorem.

For a finite-rank free Λ-module M with condensed W_E-action, RΓ(W_E,M) is perfect and there is a natural duality RΓ(W_E,M)^∨ ≃ RΓ(W_E,M^∨(1))[2].

**Hypotheses and conventions.** Λ a Z_l-algebra, l≠p; cohomological shifts. Coefficients satisfy the relatively discrete convention.

**Direct inputs.** `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Use the two-stage tame/Frobenius resolution after finite wild invariants, and its trace pairing.
2. The tame l-primary generator contributes the Tate twist, and the two cohomological degrees give shift [2].
3. Alternatively use local Tate duality from the requested cohomology interface; do not depend on D_lis or the spectral-action consumer.

Source: [Laurent Fargues; Peter Scholze, VIII.2.2, p.282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For trivial Q_l coefficients the pairing H⁰(M)×H²(M^∨(1))→Q_l has rank one.

### Cotangent complexes of parameter stacks

Identifier: `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`. Kind: theorem.

At φ over Λ the tangent complex of [Z¹(W_E,H)/H] is RΓ(W_E,Lie(H)_{Ad φ})[1]. Its dual, the pullback cotangent complex, is RΓ(W_E,Lie(H)^*_{Ad φ}(1))[1]. Thus H⁰ of the adjoint cochains gives infinitesimal automorphisms, H¹ gives deformations and H² gives obstructions.

**Hypotheses and conventions.** Smooth integral H, l≠p; continuous/condensed coefficients; Lie(H)^* is the dual module, not identified with Lie(H) without a specified invariant perfect pairing.

**Direct inputs.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/local-tate-duality`, `DerivedDeRhamCohomology:DD.0`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Algebra.Extension.H1Cotangent`.

**Construction or proof.**

1. Differentiate the mapping stack: the tangent of BH is Lie(H)[1], and maps from BW take derived invariants.
2. Dualise and apply local Tate duality, obtaining the displayed cotangent shift.
3. Use the full cotangent construction from DD.0; the naive H1Cotangent declaration alone cannot represent this complex.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1–VIII.2.3, pp.281–282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- At the trivial Q_l-valued torus parameter the adjoint deformation dimension is one and obstructions vanish.

### Weil–Deligne parameters

Identifier: `LanglandsParameterStacks:LP1/weil-deligne-parameters`. Kind: definition.

Over a Q_l-algebra Λ a Weil–Deligne parameter is (φ₀,N), where φ₀:W_E→H(Λ) is a crossed cocycle continuous for the discrete coefficient topology (trivial on an open inertia subgroup), N∈Lie(H)⊗Λ is nilpotent, and Ad(φ₀(w))(w·N)=q^{deg(w)}N in the FS degree normalisation.

**Hypotheses and conventions.** Fix the tame coordinate and Frobenius normalisation; H has its standard finite action; nilpotence is in Lie(H), distinct from the dual nilpotent cone used for singularities.

**Direct inputs.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. Apply the discrete-cocycle definition and impose the Frobenius scaling equation.
2. Gauge sends (φ₀,N) to (h·φ₀,Ad(h)N); the condition is stable under it.

Source: [Laurent Fargues; Peter Scholze, VIII.2.4, p.282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `WeilDeligneParameter` (data): A discrete-inertia cocycle and nilpotent monodromy satisfying the scaling law.
- `WeilDeligneParameter.cocycle` (projection): The discrete cocycle φ₀.
- `WeilDeligneParameter.monodromy` (projection): N, with its nilpotence and equivariance.
- `WeilDeligneParameter.gauge` (functoriality): Gauge conjugates N as well as φ₀.
- `WeilDeligneParameter.zeroMonodromy` (constructor): Discrete-inertia cocycles give parameters with N=0.

**Uses.**

- `LanglandsParameterStacks:LP1/weil-deligne-comparison`: The characteristic-zero comparison target.

**Unit-test specifications.**

- `WD_unramified` (degenerate): For unramified φ₀ and N=0 one obtains a Weil–Deligne parameter.
- `WD_torus` (computation): For a torus in characteristic zero the nilpotent cone is zero, so every Weil–Deligne parameter has N=0.
- `WD_gauge` (compatibility): Gauge of zeroMonodromy(φ₀) is zeroMonodromy(h·φ₀).

### Monodromy and the Weil–Deligne comparison

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`. Kind: comparison.

For chosen tame coordinate and Frobenius there is an H-equivariant isomorphism Z¹(W_E,H)_{Q_l}≃Par_WD. On sufficiently small l-primary tame inertia φ(x)=exp(xN). A unipotent power of tame τ gives N=m⁻¹log φ(τ^m); subtracting its exponential gives φ₀ with finite inertia. This constructs the algebraic monodromy morphism to the Lie(H) nilpotent cone.

**Hypotheses and conventions.** Characteristic zero, l≠p. The isomorphism depends on choices; changing tame coordinate scales N accordingly.

**Direct inputs.** `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ArithmeticGaloisRepresentations:R01.2`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the requested quasi-unipotence theorem or the eigenvalue argument in VIII.1.3 to obtain a unipotent power. The finite logarithm and exponential are inverse on nilpotents.
2. Zhu3.10 constructs the continuous finite-inertia r and inverse exponential formula, with the chosen normal form for elements of the discrete group.
3. Check independence of the chosen sufficiently divisible m, then equivariance under gauge.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu Lemma3.10 (formerly3.1.8), pp.35–36](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

Source: [Xinwen Zhu, §3.1 Lemma3.10, pp.35–36](https://arxiv.org/pdf/2008.02998).

**Acceptance.**

- The torus case has N=0.
- Do not claim this comparison integrally: denominators in log and exp require Q_l.

### Singularities of parameter stacks

Identifier: `LanglandsParameterStacks:LP1/singularities-and-singular-support`. Kind: definition.

For X=[Z¹(W_E,H)/H] define Sing_{X/Z_l} by the general syntomic singularity construction. On an affine chart Spec B, O(Sing)=Sym_B H¹(L_{B/Z_l}^∨), representing T↦H⁻¹(L⊗_B T). It embeds into [Lie(H)^*/H]×_{BH}X. At φ the fibre is H⁰(W_E,Lie(H)^*_{Ad φ}(1)). Nilpotent singular support means support inside the pullback of the dual nilpotent cone, the closed locus of covectors whose orbit closures contain zero.

**Hypotheses and conventions.** Use the general construction from R03.3, full cotangent from DD.0 and smooth descent from E5. Do not replace H¹(L^∨) by H⁻¹(L)^∨ without justification.

**Direct inputs.** `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:animation`, `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. The cotangent calculation gives the fibre and its equivariant inclusion into the dual Lie bundle.
2. Descend from affine syntomic charts using compatibility with smooth pullback.
3. Define the dual nilpotent locus by orbit closure. An identification with the usual Lie nilpotent cone requires a chosen invariant perfect pairing.

Source: [Laurent Fargues; Peter Scholze, VIII.2.2, pp.283–285](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `ParameterSingularities` (data): The relative singularity scheme/stack of the parameter stack.
- `ParameterSingularities.fiber` (characterisation): The fibre at φ is H⁰(W_E,Lie(H)^*_{Ad φ}(1)).
- `ParameterSingularities.embed` (projection): Closed inclusion into the dual Lie bundle pulled back from BH.
- `dualNilpotentCone` (data): Covectors with zero in their H-orbit closure.
- `NilpotentSingularSupport` (characterisation): The support of a coherent parameter complex is contained in the pullback of dualNilpotentCone.
- `ParameterSingularities.smoothPullback` (compatibility): Pullback along smooth parameter charts agrees with the affine singularity construction.

**Uses.**

- `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`: The fibre inclusion.
- `ExcursionOperatorsAndSpectralAction:ES4`: The nilpotent-support category in the consumer.

**Unit-test specifications.**

- `singularities_smooth` (degenerate): On the smooth locus of a syntomic parameter chart the singularity fibre is zero.
- `singularities_torus_Ql` (computation): At the trivial torus parameter over Q_l, H⁰(W_E,Q_l(1))=0 and the singularity fibre is zero.
- `singularities_torus_mod_l` (non-example): For H=G_m and l dividing q−1, the trivial F_l-parameter has one-dimensional singularity fibre although the dual nilpotent cone of the torus is zero.
- `singularities_dual` (compatibility): If a specified invariant perfect Lie pairing exists, the inclusion transports to the usual Lie nilpotent cone; no such identification is implicit.

### Hochschild action on parameter complexes

Identifier: `LanglandsParameterStacks:LP1/hochshild-action-and-support`. Kind: theorem.

On any affine syntomic parameter chart B/Z_l, The commutative square-zero-extension map H¹(L^∨)→HH²(B/Z_l) and the Hochschild action give H¹(L^∨)→Ext²_B(N,N), naturally in N. For bounded coherent N the resulting graded Sym_B H¹(L^∨)-module is coherent; its conical support descends to the parameter stack. N is perfect precisely when this support lies in the zero section, and the projection of nonzero support is the complement of its largest perfectness open.

**Hypotheses and conventions.** Regular noetherian base; bounded coherent N; charts syntomic. General Hochschild and complete-intersection support theorems are imported, not re-owned here.

**Direct inputs.** `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:animation`.

**Construction or proof.**

1. Use the commutative-extension-to-associative-extension map H¹(L^∨)→HH² and the Hochschild action on the identity bimodule from DGAInfinity8 to obtain the degree-two operators. Do not identify all HH² with H¹(L^∨); see E4.
2. Apply the requested Gulliksen finite-generation and Jørgensen/Arinkin–Gaitsgory perfectness criterion from R03.3.
3. Smooth pullback compatibility glues the result and identifies the maximal perfectness locus.

Source: [Laurent Fargues; Peter Scholze, VIII.2.6–VIII.2.10, pp.283–284](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- A vector bundle has support in the zero section.
- Over a singular hypersurface the residue field at a singular point has nonzero singular support.

### Nilpotence of singularity fibres

Identifier: `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`. Kind: theorem.

At φ over a Z_l-field L, the fibre of ParameterSingularities is contained in the dual nilpotent cone if either L is a Q_l-field, or l∤q^{en}−1 for every homogeneous Chevalley invariant degree e, where n is the residue degree of the extension cutting out the outer action. This is an inclusion, not equality.

**Hypotheses and conventions.** Use Chevalley invariants in the stated very-good/banal characteristic; no assertion is made in the excluded case.

**Direct inputs.** `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. A covector fixed by the Tate-twisted adjoint action has homogeneous invariant value scaled by q^{en}.
2. If q^{en}−1 is invertible every positive-degree invariant vanishes, giving the nullcone inclusion.
3. In characteristic zero all q^{en}−1 are nonzero. The source remarks that the correct support condition outside these cases is uncertain.

Source: [Laurent Fargues; Peter Scholze, VIII.2.11–VIII.2.13, pp.284–285](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H=G_m and l∤q−1 both the fibre and nullcone are zero.
- At a smooth GL₂ parameter the fibre can be zero while the Lie nilpotent cone is nonzero, ruling out equality.

## LP2 — LanglandsParameterStacks:LP2

LP2 records the three strengths of spectral coordinates without conflating their hypotheses. Its three substages contain the declarations. The unconditional quotient and geometric-point classification precede the good-prime integral theorem. This aggregate comparison introduces no extra hypothesis for the unconditional branches.

**Coverage: planned.** Discharge the open supplier and finite-Q reconstruction inputs of the three substages; no new aggregate construction is needed.

**Planets:** None..

### The three excursion comparisons

Identifier: `LanglandsParameterStacks:LP2/three-way-separation`. Kind: comparison.

At every l≠p the excursion comparison is a universal homeomorphism and classifies semisimple geometric parameters; after inverting l it is a ring isomorphism. Under l∤|π₁(H)_tors| it is an integral ring isomorphism with higher-cohomology vanishing and coefficient base change. These are three distinct mathematical strengths.

**Hypotheses and conventions.** Use the finite-wild piecewise interpretation. This aggregate node does not create a new hypothesis for its constituent unconditional theorems.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`.

**Construction or proof.**

1. Combine the unconditional comparison and character theorem with the separately stated good-prime invariant theorem.
2. Keep the underlying derived cocycle colimit distinct from its stronger IndPerf(BH) version.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2–VIII.3.8, pp.287–290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Closed geometric points alone cannot establish an integral algebra isomorphism.

## LP2:excursion-presentation — LanglandsParameterStacks:LP2:excursion-presentation

This substage owns invariants, piecewise affine coarse quotients and the unrestricted excursion algebra. Generic DVR quotients permit flat base change; arbitrary nonflat base change belongs only to the later parameter-specific theorem with its stronger inputs. Complete reducibility and closed-orbit classification are used at every coefficient prime, without importing LP3.

The free-group indexing category, full excursion relations and torsion-free continuous universal property are separated. FS proves independence of the torsion-free quotient from the dense Weil group and explicitly leaves independence of the full integral algebra open. The abstract categorical datum and matrix coefficients produce central operators for arbitrary Γ→Q; the local and global automorphic families are consumer instances.

**Coverage: planned.** Provide geometric-reductivity/power-lifting and quotient interfaces; elaborate their algebraic regular-function and categorical signatures. Full Exc choice independence without torsion removal remains source-open G2.

**Planets:** Coarse parameter quotients; Complete reducibility; Excursion algebras; Excursion universal homeomorphism; Excursion data; Abstract excursion centre maps.

### Coarse parameter quotients

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`. Kind: construction.

For each finite-wild affine scheme X=Z¹(W,H), let A=O(X) and define X//H=Spec(A^H) using invariants for the algebraic twisted action. The inclusion A^H→A gives the universal invariant morphism from X to an affine scheme. Inflation of finite-wild pieces induces the corresponding invariant-algebra maps and coarse maps. These objects exist without a good-prime restriction.

**Hypotheses and conventions.** H reductive over the base; finite generation of invariants and geometric reductivity are supplied by the reductive-group owner, not by LP3. Quotients are piecewise; the full infinite union is not silently made affine.

**Direct inputs.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`, `mathlib:RingHom`, `mathlib:Subalgebra`.

**Construction or proof.**

1. Form the algebraic coaction equaliser defining A^H. It is a subalgebra, and an invariant affine map factors uniquely through it.
2. Use geometric reductivity for finite generation and the geometric quotient properties; compatible clopen decompositions give the maps for changing wild kernels.

Source: [Laurent Fargues; Peter Scholze, VIII.3.1–VIII.3.2, pp.285–287; BHKT3.2 and3.10](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `ParameterInvariantAlgebra` (data): The algebraic H-invariant subalgebra of O(Z¹).
- `ParameterCoarseQuotient` (data): Its spectrum, separately on each affine finite-wild piece.
- `ParameterCoarseQuotient.quotientMap` (projection): The affine map induced by the invariant inclusion.
- `ParameterCoarseQuotient.lift` (universal-property): Invariant maps to affine schemes factor uniquely, with lift and uniqueness laws.
- `ParameterCoarseQuotient.inflate` (functoriality): Shrinking P gives the compatible coarse map; identity and composition.
- `ParameterInvariantAlgebra.flatBaseChange` (compatibility): For the DVR hypotheses of the next node, flat base change commutes with invariants.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`: Target of the comparison.
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`: Coarse points used without importing LP3.

**Unit-test specifications.**

- `coarse_trivial_group` (degenerate): For H=1 the invariant algebra is the full coordinate algebra and the quotient map is identity.
- `coarse_torus` (computation): For a torus with trivial W-action the gauge action is trivial, so the coarse quotient equals the cocycle scheme.
- `coarse_affine_universal` (characterisation): An invariant affine scalar function descends uniquely, and pulls back to itself.
- `coarse_not_orbit_set` (non-example): For the SL₂ tuple (nontrivial upper unipotent), its coarse image equals the image of the identity tuple although the two tuples are not conjugate.

### Reductive quotient properties over fields and DVRs

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`. Kind: theorem.

For an integral affine finite-type X over a field with reductive G, X//G is integral finite type and normal if X is normal. Over an excellent coefficient DVR O, assume additionally X is flat; the same properties hold. For every algebraically closed O-field K, coarse K-points are closed G_K-orbits, each fibre has one closed orbit, and invariant closed sets have closed, separated images. Invariants commute with flat O-base change; invariant principal neighbourhoods exist about closed residual orbits.

**Hypotheses and conventions.** DVR O is the integer ring of a finite Q_l-extension as in BHKT3.2. No arbitrary nonflat base-change isomorphism is claimed. For possibly reducible parameter schemes apply the general geometric-reductivity quotient interface rather than assume integral X.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use the requested finite-generation and geometric-reductivity quotient theorem; invariants of a normal domain remain normal.
2. Apply BHKT3.10 geometric separation and invariant principal-neighbourhood properties, with flat base change computed as a flat coaction equaliser.
3. Distinguish closed-orbit point bijections from an isomorphism (A^G)⊗K≃(A⊗K)^{G_K}; the former does not imply the latter.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Proposition3.2 pp.11–12; §3.2 Proposition3.10 pp.15–16](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- Check left translation (G×X)//G≃X when G acts trivially on X.
- Base change to the fraction field is flat; passage to the residue field is not flat.

### Complete reducibility and strong reductivity

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`. Kind: definition.

For connected reductive G over algebraically closed k and closed H⊂G, H is G-completely reducible when each parabolic containing H has a Levi containing H; G-irreducible when no proper parabolic contains H; strongly reductive when, for a maximal torus S of Z_G(H), H is in no proper parabolic of Z_G(S). For Γ→G(k) apply these to the Zariski closure of its image; over general k use algebraic closure. Strong G-irreducibility additionally requires every representation with the same one-variable invariant values to be G-irreducible.

**Hypotheses and conventions.** The strongly reductive condition is independent of the chosen maximal torus by conjugacy. Nonsplit finite-Q extensions use the separately requested nonconnected formulation.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `mathlib:Subgroup`, `mathlib:Representation`.

**Construction or proof.**

1. Import parabolic, Levi and centralizer geometry from RG. Define the three quantified predicates and the absolute representation predicates.
2. Use conjugacy of maximal tori to prove independence of S; do not identify complete reducibility with ordinary linear semisimplicity except in GL_n.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Definitions3.3,3.5 pp.11–12](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**API.**

- `IsGCompletelyReducible` (characterisation): Every containing parabolic admits a containing Levi.
- `IsGIrreducible` (characterisation): No proper containing parabolic.
- `IsStronglyReductive` (characterisation): No proper containing parabolic in the maximal centralizer torus centralizer.
- `IsAbsolutelyGCompletelyReducible` (characterisation): Apply complete reducibility to the geometric Zariski image.
- `IsStronglyGIrreducible` (characterisation): Irreducibility persists for representations with identical one-variable invariants.
- `IsGCompletelyReducible.conjugate` (compatibility): Each predicate is preserved by G-conjugation.
- `IsGIrreducible.completelyReducible` (relation): G-irreducible implies G-completely reducible.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`: The geometric characterisation.
- `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor`: The minimal-parabolic reconstruction.

**Unit-test specifications.**

- `cr_torus` (computation): A maximal torus of SL₂ is completely reducible but not SL₂-irreducible.
- `cr_unipotent` (non-example): The upper unipotent root subgroup of SL₂ lies in its Borel and in no Levi of that Borel, hence is not completely reducible.
- `cr_GL` (compatibility): For GL(V), the Zariski image is completely reducible exactly when V is a semisimple representation.
- `cr_trivial` (degenerate): The trivial subgroup is completely reducible.

### Closed tuples and Levi semisimplification

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`. Kind: theorem.

For a tuple x∈G(k)^n, with G connected reductive and k algebraically closed of any characteristic, its orbit is closed iff its generated Zariski subgroup is strongly reductive iff it is G-completely reducible. It is stable iff this subgroup is G-irreducible. Projection along a minimal containing parabolic to a Levi gives a cocharacter limit in the unique closed orbit in the closure. For a completely reducible subgroup, a containing Levi in a minimal parabolic is irreducible; all minimal containing parabolics have the same dimension.

**Hypotheses and conventions.** No very-good characteristic hypothesis; use the scheme-theoretic centralizer only when separability is additionally needed.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the requested Richardson–Bate–Martin–Röhrle tuple criterion.
2. A cocharacter centralising a Levi contracts the unipotent radical to the identity, giving the semisimplification limit and its invariant values.
3. Apply BHKT3.7: minimal parabolics have a common Levi comparison, and a completely reducible subgroup in such a Levi cannot lie in a proper Levi parabolic.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Theorem3.4, Proposition3.6, Proposition3.7 pp.12–13](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- The SL₂ unipotent tuple limits to the identity; a semisimple diagonal tuple has closed orbit.

### Semisimple L-parameters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`. Kind: definition.

For an algebraically closed Z_l-field L, a parameter into H(L)⋊W_E is semisimple if every parabolic of this L-group containing its image admits a Levi containing that image. Equivalently, for every conjugate factoring through a standard action-stable parabolic, it is H(L)-conjugate to its Levi projection. The definition is also used for arbitrary Γ→Q, with image in H(L)⋊Q and the nonconnected complete-reducibility formulation.

**Hypotheses and conventions.** Parabolics project surjectively to the acting group and have the corresponding Levi projection. The action-stable parabolic is not an arbitrary parabolic of H with no Q condition.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Apply the nonconnected reductive-group interface from RG; pass between action-stable standard parabolics and their conjugates.
2. Specialise Γ to a discrete finite-wild Weil group and extend to W_E.

Source: [Laurent Fargues; Peter Scholze, VIII.3.1, pp.286–287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `IsSemisimpleParameter` (characterisation): The containing-parabolic/containing-Levi property.
- `IsSemisimpleParameter.leviCriterion` (characterisation): Every standard-parabolic factorisation is conjugate to its Levi projection.
- `IsSemisimpleParameter.gauge` (compatibility): The predicate is invariant under gauge conjugation.
- `IsSemisimpleParameter.GL` (compatibility): For split GL_n it agrees with semisimplicity of the underlying linear representation.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`: Closed-orbit criterion without good-prime input.
- `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`: Group-agnostic reconstruction.

**Unit-test specifications.**

- `semisimple_torus` (computation): Every parameter into a torus is semisimple because there are no proper parabolics.
- `semisimple_split_GL` (compatibility): A direct sum of characters into GL_n is semisimple.
- `semisimple_unipotent` (non-example): A nontrivial unipotent generator representation of Z in SL₂ is not semisimple although all its invariant values agree with the trivial representation.

### Closed parameter orbits

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`. Kind: theorem.

For every finite-wild component over algebraically closed L, closed H(L)-orbits of cocycles are exactly semisimple parameters, equivalently parameters conjugate to every applicable Levi projection. Consequently the coarse L-points classify semisimple gauge classes without assuming l∤|π₁(H)_tors|.

**Hypotheses and conventions.** L has any characteristic allowed by Z_l; twisted conjugation uses the finite Q action.

**Direct inputs.** `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Apply Hilbert–Mumford–Kempf to the finite-generator cocycle presentation.
2. For dominant λ, lim λ(t)gλ(t)^{−τ} exists iff g lies in P_λ and τλ=λ; the limit is the Levi projection.
3. Use the nonconnected Richardson/BMR criterion for H⋊Q and the unconditional quotient geometric-point theorem.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2–VIII.3.3, pp.286–287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- The criterion for nonsplit groups requires τλ=λ; omitting it gives the wrong degeneration.

### Finite free-group indexing

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`. Kind: definition.

For any Γ→Q let FreeCocycleIndex(Γ) have objects (n,u:F_n→Γ) and morphisms v:F_n→F_m with u=u′∘v. The coordinate-algebra diagram is covariant by restriction of cocycles. The category is nonempty and has finite coproducts (free products), hence is sifted.

**Hypotheses and conventions.** Include n=0 and the unique map F₀→Γ. The invariant algebras use the pulled-back Q-actions.

**Direct inputs.** `mathlib:FreeGroup`, `mathlib:MonoidHom`.

**Construction or proof.**

1. Use the baseline finite free groups and their universal property to form this category.
2. Concatenate generator tuples for coproducts; the diagonal has the required finality because finite coproducts exist.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `FreeCocycleIndex` (data): Finite free group maps to Γ and commuting triangle morphisms.
- `FreeCocycleIndex.coproduct` (constructor): Free product with the induced map to Γ.
- `FreeCocycleIndex.coordinateDiagram` (functoriality): Cocycle restriction gives the covariant coordinate-ring diagram.
- `FreeCocycleIndex.sifted` (structure): The index is sifted, with the zero-generator object providing nonemptiness.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`: The invariant colimit index.
- `LanglandsParameterStacks:LP4/sifted-approximation`: The animated free resolution index.

**Unit-test specifications.**

- `index_zero` (degenerate): The zero-generator map is initial.
- `index_coproduct` (computation): The coproduct of n- and m-generator tuples is the n+m-generator concatenation.
- `index_direction` (characterisation): A word map F_n→F_m induces O(Z¹(F_n,H))→O(Z¹(F_m,H)), not the reverse ring map.

### Excursion algebras

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`. Kind: construction.

Define Exc(Γ,H)=colim_{(n,F_n→Γ)} O(Z¹(F_n,H))^H in Z_l-algebras. The action on each free cocycle space is the pulled-back Q-twisted conjugation. Restriction of the universal Γ-cocycle induces a canonical algebra map Exc(Γ,H)→O(Z¹(Γ,H))^H whenever the Γ-cocycle scheme is represented.

**Hypotheses and conventions.** Γ is any discrete group with map to Q for the colimit construction; the finite-wild W case has a representing finite-type scheme.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CommRingCat.Colimits.hasColimits_commRingCat`.

**Construction or proof.**

1. Build the invariant diagram over FreeCocycleIndex and take its ring colimit.
2. Use the universal cocycle evaluation to obtain its compatible cone into the invariant algebra. Keep the universal-homeomorphism assertion as a separate theorem.

Source: [Laurent Fargues; Peter Scholze, VIII.3.4, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `ExcursionAlgebra` (data): The colimit of free-cocycle invariant algebras.
- `ExcursionAlgebra.ofFree` (constructor): Structure map from each free tuple invariant algebra.
- `ExcursionAlgebra.lift` (universal-property): Compatible ring maps out of the free diagram induce a unique ring map; evaluation and uniqueness laws.
- `ExcursionAlgebra.compare` (projection): The canonical map to represented Γ-cocycle invariants.
- `ExcursionAlgebra.mapGroup` (functoriality): A homomorphism Γ→Γ′ over Q induces Exc(Γ,H)→Exc(Γ′,H), with identity and composition laws.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`: The explicit Θ presentation.
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`: The good-prime comparison.

**Unit-test specifications.**

- `excursion_trivial_dual` (degenerate): For H=1 and fixed Γ→Q all free-cocycle invariant rings are the base, so Exc is the base.
- `excursion_free_group` (compatibility): For Γ=F_n the identity tuple is terminal in the index, hence Exc≃O(Z¹(F_n,H))^H.
- `excursion_lift_eval` (characterisation): For a compatible cone ξ, lift(ξ)∘ofFree(u)=ξ_u for every u.

### Excursion comparison as a universal homeomorphism

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`. Kind: theorem.

For a finite-wild W, Spec(O(Z¹(W,H))^H)→Spec Exc(W,H) is a universal homeomorphism, and the algebra comparison is an isomorphism after inverting l. Its proof is independent of l∤|π₁(H)_tors|.

**Hypotheses and conventions.** H reductive, Z_l coefficients, finite-wild W; distinguish a universal homeomorphism from an integral ring isomorphism.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `ReductiveGroupsPartII:RG2.5`, `mathlib:PrimeSpectrum.isHomeomorph_comap`.

**Construction or proof.**

1. First reconstruct the full cocycle coordinate algebra as the sifted colimit of free cocycle algebras.
2. Geometric reductivity supplies power lifting of invariant functions and nilpotent kernel after every base change, so apply the spectrum criterion base change by base change.
3. Over Q_l algebraic representations are semisimple, and invariants commute with this colimit, giving a ring isomorphism.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Geometric L-points agree at all primes; this does not prove integral equality of rings.

### The universal excursion relations

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`. Kind: theorem.

Maps Exc(Γ,H)→A correspond to families of Z_l-algebra maps Θ_n:O((H⋊Q)^n//H)→Map(Γ^n,A), n≥1, linear over O(Q^n) via Γ→Q, compatible with coordinate reindexing and with ordered multiplication in fibres of every map between finite ordered sets. Empty products are units. These relations imply insertion of identities and inversion/word substitution, yielding the full free-group diagram compatibility.

**Hypotheses and conventions.** Γ is any discrete group over Q; A is any Z_l-algebra. No π₁ good-prime restriction or continuity assumption in this algebraic universal property.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. A free tuple identifies O(Z¹(F_n,H))^H with the Q-tuple fibre of O((H⋊Q)^n//H).
2. The ring colimit is exactly the compatible family of maps on all finite words. Reindexing and multiplication give positive words and units.
3. For inverses, insert the pair (γ,γ⁻¹), multiply it to the unit and apply the group identity; this recovers arbitrary signed word substitution.

Source: [Laurent Fargues; Peter Scholze, VIII.3.7 and proof, pp.288–289](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H=G_m and Γ=F₁, the presentation recovers Z_l[t,t⁻¹].
- For noncommuting Γ words, fibre products retain their specified order.

### Continuous torsion-free excursion characters

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`. Kind: theorem.

The l-torsion-free quotient Exc(W,H)_tf is flat over Z_l and has the universal property of the Θ families of VIII.3.7 for flat test algebras A when those families are maps of condensed sets on (W_E/P)^n. The torsion-free quotient is canonically independent of the dense discrete W. Inflation on finite-wild pieces is compatible with evaluation and the invariant comparison. Geometric field-valued characters do not change under removal of l-power torsion because that torsion is nilpotent.

**Hypotheses and conventions.** Finite-wild W inside W_E/P; standard relatively discrete coefficient convention. The torsion-free quotient is independent of W; FS leaves independence of the full Exc without this quotient open.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `mathlib:Module.Flat`.

**Construction or proof.**

1. Restrict continuous Θ to W and use the algebraic universal property.
2. Over torsion-free A, the matrix/binomial extension argument promotes the relations to continuous functions on W_E/P; quotient by l-torsion gives the representing algebra.
3. Flatness over the DVR is torsion-freeness. Use the power-lifting comparison to identify the nilpotent torsion and unchanged geometric characters.

Source: [Laurent Fargues; Peter Scholze, VIII.3.3 after VIII.3.7, pp.289–290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Continuity is imposed on W_E/P, not a nonexistent profinite topology on all of the discrete W.

### Categorical Hecke data

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`. Kind: definition.

For a Z_l-linear category C, a categorical Hecke datum assigns every finite I a Rep(Q^I)-linear monoidal functor Rep((H⋊Q)^I)→End(C)^{BΓ^I}, natural coherently in finite-set maps, where Γ→Q is fixed. The unit and diagonal/fusion identifications are part of the data. In a stable category the functors are exact.

**Hypotheses and conventions.** Use the abstract category C, not Bun_G. Stable enhancements, endofunctors and equivariant objects are supplied by E5.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Package the representation functors, Γ^I actions and finite-set coherence.
2. Evaluation on the trivial representation is the identity endofunctor. The diagonal restriction allows invariant α and β to become creation and annihilation natural transformations.

Source: [Laurent Fargues; Peter Scholze, VIII.4 setup, pp.290–291](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `CategoricalHeckeDatum` (data): Finite-set monoidal representation functors with Γ^I-equivariance and fusion coherence.
- `CategoricalHeckeDatum.unit` (simp): The trivial representation acts as identity.
- `CategoricalHeckeDatum.reindex` (compatibility): Finite-set pullback and fusion commute coherently with the Γ-action.
- `CategoricalHeckeDatum.create` (constructor): A diagonal invariant α:1→V creates a transformation id_C→T_V.
- `CategoricalHeckeDatum.annihilate` (constructor): A diagonal invariant β:V→1 annihilates T_V→id_C.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Input for the abstract excursion theorem.
- `ExcursionOperatorsAndSpectralAction:ES0`: HS1/HS4 supply this datum for the Bun_G consumer.

**Unit-test specifications.**

- `hecke_empty_set` (degenerate): For I=∅ the unit object acts as identity with trivial Γ^∅-action.
- `hecke_fold` (characterisation): Folding I⊔I to I identifies the external tensor product action with the tensor product action.
- `hecke_zero_category` (computation): The zero stable category admits the unique datum; every excursion endomorphism is zero.

### Excursion data

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`. Kind: definition.

An excursion datum is (I,V,α,β,(γ_i)), with I finite, V a finite-projective representation of (H⋊Q)^I, α:1→V and β:V→1 invariant under diagonal H, and γ_i∈Γ. For a categorical Hecke datum define S_D=T_β∘(γ_i)∘T_α∈End(id_C).

**Hypotheses and conventions.** Integral finite-projective representations; the Γ^I action is part of the categorical datum.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Use the diagonal invariant maps as creation/annihilation transformations, then compose with the tuple action.
2. Naturality makes the composite a central natural endomorphism, not merely an endomorphism of one object.

Source: [Laurent Fargues; Peter Scholze, VIII.4.2, p.291](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `ExcursionDatum` (data): Finite I, V, invariant α,β and Γ-tuple.
- `ExcursionDatum.operator` (constructor): The natural endomorphism S_D.
- `ExcursionDatum.reindex` (functoriality): Reindex tuples and pull back the representation; the resulting operator is unchanged.
- `ExcursionDatum.tensor` (constructor): External tensor product on I⊔J with tensor α,β and concatenated tuple.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`: Matrix coefficient and its canonical presentation.
- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Assembly into a ring map.

**Unit-test specifications.**

- `datum_unit` (degenerate): For the unit representation and α=β=id, S_D=id_C.
- `datum_zero_alpha` (computation): If α=0 then S_D=0.
- `datum_tensor_operator` (compatibility): For external tensor products S_{D⊗D′}=S_D S_D′.

### Excursion matrix coefficients

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`. Kind: construction.

To (I,V,α,β) associate f_D((h_i,q_i))=β(((h_i,q_i))·α), a regular function on H\(H⋊Q)^I/H. Let V_f be the finite-projective subrepresentation generated by f in the regular functions on (H⋊Q)^I/H, with α_f=f and β_f evaluation at the unit. The induced canonical presentation gives the same excursion operator, independent of (V,α,β).

**Hypotheses and conventions.** The finite-projective subrepresentation is taken in the integral representation framework supplied by RG, as used in FS; the function is bi-invariant because α and β are diagonal H-invariant.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Replace V by the subrepresentation generated by α; the map v↦(g↦β(gv)) identifies its quotient with V_f. Functoriality under the resulting representation maps identifies S_D with the canonical operator.
2. Finite-set naturality yields a commuting reindexing square. It does not generally make that square a pullback; see source issue E3.

Source: [Laurent Fargues; Peter Scholze, Proof VIII.4.1, pp.291–292](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `excursionMatrixCoefficient` (data): The bi-invariant regular function f_D.
- `excursionMatrixCoefficient.eval` (simp): Its value is β(g·α).
- `excursionMatrixCoefficient.canonicalPresentation` (constructor): The generated regular-function representation with α_f=f, β_f evaluation at the unit.
- `excursionMatrixCoefficient.operatorIndependent` (relation): Equal f_D give equal operators for fixed I and tuple.
- `excursionMatrixCoefficient.reindex` (functoriality): Pullback of f agrees with reindexing the datum.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Independence and multiplication descend to invariant functions.

**Unit-test specifications.**

- `coefficient_unit` (computation): For V=1 and α=β=id the coefficient is 1.
- `coefficient_zero` (degenerate): For α=0 the coefficient is zero.
- `coefficient_product` (compatibility): External tensor product gives the product of the two matrix coefficients.
- `coefficient_biinvariant` (characterisation): For diagonal a,b∈H, f_D(a g_i b)=f_D(g_i).

### Abstract excursion centre maps

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`. Kind: theorem.

Every categorical Hecke datum for Γ over Q induces a natural Z_l-algebra map Exc(Γ,H)→End(id_C), sending an invariant function evaluated at a Γ-tuple to its excursion operator. This is group-agnostic and has no π₁ good-prime condition. The Bun_G and Bernstein-centre comparisons are consumer applications.

**Hypotheses and conventions.** Use coherent finite-set naturality and monoidal representation functors; exactness when C is stable.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Use the matrix-coefficient presentation for operator independence. External tensors and the fold I⊔I→I prove multiplicativity, the trivial representation proves the unit.
2. Insert an extra coordinate over 1∈Q to identify the bi-invariant quotient with the simultaneous-conjugation invariant functions on n coordinates.
3. Reindexing and the evaluation/coevaluation triple-product identity γγ′⁻¹γ″ give the word relations of the universal excursion algebra; apply its universal property.

Source: [Laurent Fargues; Peter Scholze, VIII.4.1–VIII.4.2 pp.290–293; Lafforgue Lemma10.1 and Proposition10.8](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- The zero category gives the zero ring homomorphism into its zero centre.
- Unit data evaluate to the identity and external tensor products multiply.

### Derived free-cocycle presentations

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`. Kind: theorem.

For finite-wild W the natural map colim_{F_n→W} O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in D(Z_l), indeed of animated algebras. This underlying derived statement has no π₁ good-prime restriction.

**Hypotheses and conventions.** Do not upgrade this directly to an isomorphism in IndPerf(BH); that stronger equivariant assertion is the next stage.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. The colimit is the universal animated algebra with a W-cocycle.
2. The classical truncation is the ordinary cocycle algebra; the derived deformation calculation and correct lci dimension force the animated algebra to be classical.

Source: [Laurent Fargues; Peter Scholze, VIII.3.5 and proof, p.288](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- This ordinary derived isomorphism alone does not justify commuting rational H-invariants with the colimit in characteristic l.

## LP2:integral-invariants — LanglandsParameterStacks:LP2:integral-invariants

The stronger substage has exactly the good-prime equivariant colimit and its invariant/cohomological consequences. It imports the unconditional comparison and LP3's mod-ℓ generation chain. Integral lifting and coefficient change then give the ring isomorphism, flatness, higher-cohomology vanishing and all-coefficient parameter base change. The legacy monodromy and transition identifiers are retained elsewhere with corrected parent stages.

**Coverage: planned.** Supply the highest-weight/derived coefficient-change interfaces and verify the all-coefficient good-prime base-change reduction; elaborate the IndPerf theorem signatures.

**Planets:** Integral invariant comparison.

### Integral invariant comparison

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`. Kind: theorem.

Assume l∤|π₁(H)_tors|. Then colim_{F_n→W}O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in IndPerf(BH) over Z_l. In particular Exc(W,H)≃O(Z¹(W,H))^H as Z_l-algebras.

**Hypotheses and conventions.** l≠p; finite-wild W. These are stronger integral assertions than the unconditional universal homeomorphism or underlying D(Z_l) comparison.

**Direct inputs.** `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. The mod-l IndPerf comparison is the wild-to-tame theorem. Rationally H-representations are semisimple and the underlying derived comparison suffices.
2. Rational and mod-l reduction detect the cone; use the coefficient/IndPerf base-change interface.
3. Since the free cocycle algebras and the resulting algebra have good filtrations modulo l, applying H-invariants computes the ordinary invariant ring and commutes with this sifted colimit.

Source: [Laurent Fargues; Peter Scholze, VIII.3.6 p.288; VIII.5.1–VIII.5.2 pp.293–294,315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H a torus the π₁ torsion condition is automatic.
- At a bad π₁ prime retain the universal homeomorphism and geometric character bijection; this theorem is unavailable.

### Cohomology vanishing and invariant base change

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`. Kind: theorem.

Under the same good-prime hypotheses, the cocycle algebra has no higher rational H-cohomology, its invariant algebra is Z_l-flat, and for a Z_l-algebra Λ the canonical map O(Z¹(W,H))^H⊗Λ→O(Z¹(W,H)_Λ)^{H_Λ} is an isomorphism, with the derived base-change form supplied by the equivariant colimit.

**Hypotheses and conventions.** The all-coefficient base-change conclusion here is parameter-specific and uses good filtrations; it is not the generic DVR quotient theorem, which grants only flat base change.

**Direct inputs.** `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:Module.Flat`.

**Construction or proof.**

1. Each free cocycle algebra has the imported good filtration; the mod-l comparison places the result in the connective good-filtration part.
2. Use the equivariant integral colimit and coefficient change to obtain derived invariants and their concentration in degree zero.
3. Flatness of the coordinate algebra and its invariants identifies derived tensor with ordinary tensor; deduce the displayed map.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1–VIII.5.2 and proof, pp.293–294](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Residue-field base change here is justified by the good-prime theorem, not by falsely calling Z_l→F_l flat.

## LP2:semisimple-characters — LanglandsParameterStacks:LP2:semisimple-characters

Reconstruction is stated once for arbitrary Γ→Q, with continuity added in separate clauses. In characteristic zero, Lafforgue's anchor maximises the generated reductive closure and stabilises the full centralizer. In positive characteristic, BHKT uses minimal containing parabolics and complete reducibility instead. A finite-Q extension of that argument is recorded as G4 and requested from the reductive owner.

For profinite characteristic-zero coefficients, continuity comes from surjectivity onto the double-centralizer coordinate algebra. For discrete coefficients, finitely many invariant generators determine the appended element and force a locally constant kernel. These clauses produce the all-prime condensed Weil bijection. The GL shadow is the actual alternating cycle-trace pseudocharacter identity; its characteristic-zero comparison imports Procesi generation rather than redefining a pseudocharacter as a representation.

**Coverage: planned.** Verify the finite-Q arbitrary-characteristic anchor extension G4 and supply the algebraic invariant-ring/continuous coordinate interface; elaborate the full regular-function signatures.

**Planets:** Reductive-group pseudocharacters; Semisimple reconstruction; Continuous semisimple parameter characters; GL trace pseudocharacters.

### Reductive-group pseudocharacters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`. Kind: definition.

For a split reductive group H/Z, a group Γ and commutative ring A, an H-pseudocharacter is a family of ring maps Θ_n:Z[H^n]^H→Map(Γ^n,A), n≥1, compatible with reindexing and multiplication of the last two variables. It is continuous if all values are continuous functions for given topologies on Γ and A. Over a flat Z-algebra the source may equivalently be base changed; for nonflat coefficients do not replace integral invariants by new fibre invariants. The twisted finite-Q form uses the universal excursion relations.

**Hypotheses and conventions.** H split over Z; Γ arbitrary for the algebraic definition; Γ profinite in BHKT4.7. The full ordered-word relations follow as in VIII.3.7.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `ReductiveGroupsPartII:RG2.5`, `mathlib:RingHom`.

**Construction or proof.**

1. Define the integral invariant ring maps and their two relations, using integral base-change only when flat.
2. Evaluation of a representation gives a pseudocharacter, invariant under conjugation; coefficient maps and group precomposition commute with this evaluation.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §4.1–§4.6, pp.19–24](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**API.**

- `ReductivePseudocharacter` (data): The integral-invariant family with the stated relations.
- `ReductivePseudocharacter.ofRepresentation` (constructor): Evaluate invariant functions on tuples of a representation.
- `ReductivePseudocharacter.map` (functoriality): Coefficient base change with identity and composition laws.
- `ReductivePseudocharacter.precomp` (functoriality): Precompose Γ′→Γ with identity and composition laws.
- `ReductivePseudocharacter.ext` (extensionality): Equality of all Θ_n values implies equality.
- `ReductivePseudocharacter.IsContinuous` (characterisation): Every invariant function has continuous tuple evaluation.

**Uses.**

- `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`: Arbitrary characteristic reconstruction.
- `GlobalShtukasAndFunctionFieldLanglands:GS.5`: The global Galois instance imports this group-theoretic interface.

**Unit-test specifications.**

- `pseudocharacter_rank_one` (computation): For H=G_m, evaluation of a character χ gives Θ_n(t₁^{a₁}⋯t_n^{a_n})(γ)=∏χ(γ_i)^{a_i}.
- `pseudocharacter_conjugate` (compatibility): Conjugate representations have equal pseudocharacters.
- `pseudocharacter_trivial_group` (degenerate): For Γ=1, the pseudocharacter of the trivial representation evaluates f at (1,…,1).
- `pseudocharacter_unipotent` (non-example): For Γ=Z and H=SL₂, a nontrivial unipotent generator representation and the trivial representation have the same pseudocharacter but are not conjugate; pseudocharacters classify their semisimplifications.

### Finite anchors in characteristic zero

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor`. Kind: theorem.

For compatible invariant families of an arbitrary Γ over Q and algebraically closed characteristic-zero L, choose an anchor tuple maximising the dimension of its reductive generated Zariski closure, then minimising centralizer dimension, then centralizer component count. There is a closed-orbit representative ḡ such that each γ has a unique g(γ) with (ḡ,g(γ)) in the prescribed closed orbit and with centralizer unchanged. The elements g(γ) lie in the double centralizer of ḡ.

**Hypotheses and conventions.** Use reductivity of the generated closure in characteristic zero; minimise the centralizer as an algebraic subgroup, not merely its dimension. For Q≠1 use the nonconnected relative-H orbit formulation.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use Richardson closed-tuple criterion; the three finite-dimensional extrema stabilise both the closure and full centralizer.
2. For an extended tuple, a Levi comparison gives existence; equality of centralizers forces uniqueness of its last coordinate.
3. Apply the two-extended-variable tuple and the multiplication relation to obtain g(γγ′)=g(γ)g(γ′), with the semidirect product law in the twisted case.

Source: [Vincent Lafforgue, Proposition11.7, Lemmas11.9–11.10, pp.143–147](https://arxiv.org/pdf/1209.5352).

**Acceptance.**

- Omitting the component-count minimisation does not certify equality of possibly disconnected centralizers.

### Finite anchors in arbitrary characteristic

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor`. Kind: theorem.

For a compatible pseudocharacter over algebraically closed k, choose an anchor minimising the dimension of a containing parabolic, then centralizer dimension and component count. Its closed-orbit representative uniquely determines each appended element by its prescribed invariant values and unchanged centralizer. The resulting representation is completely reducible. This uses minimal parabolics and Levi irreducibility, rather than identifying complete reducibility with reductivity of the image in characteristic p.

**Hypotheses and conventions.** BHKT4.5 for connected H; the finite-Q twisted form uses the RG-requested nonconnected orbit/minimal-parabolic/finite-anchor extension. No very-good characteristic or good π₁ prime is required.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. The invariant quotient supplies the unique closed orbit for each tuple. Minimising the parabolic dimension stabilises its Levi irreducibility by BHKT3.7.
2. The centralizer dimension and component count then stabilise the centralizer; an appended coordinate is unique.
3. Use augmented pairs and the pseudocharacter product relation for the group law; finite parabolic/Levi detection gives uniqueness among completely reducible representations.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, Theorem4.5 and proof, pp.20–23](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- In positive characteristic a subgroup may be reductive without being G-completely reducible; the proof cannot replace the latter by the former.

### Group-agnostic semisimple reconstruction

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`. Kind: theorem.

For any group Γ→Q, H/Z_l with action of finite Q and algebraically closed Z_l-field L, compatible Θ families as in the excursion universal property correspond bijectively to H(L)-conjugacy classes of semisimple crossed cocycles Γ→H(L). The forward family evaluates invariant functions on the associated lifts Γ→H(L)⋊Q. This theorem is algebraic; continuity is a separate clause.

**Hypotheses and conventions.** Use relative H-conjugation and the prescribed Q-projection. In characteristic l use the complete-reducibility anchor; in characteristic zero use the reductive anchor.

**Direct inputs.** `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`.

**Construction or proof.**

1. Construct the representation with either finite-anchor theorem, checking the Q projection by O(Q^n)-linearity.
2. Use appended pairs to verify the group law, obtaining a crossed cocycle by the section equivalence.
3. All finite invariant evaluations agree with Θ; uniqueness follows from the stabilised finite anchor and complete reducibility.

Source: [Laurent Fargues; Peter Scholze, Proof VIII.3.8 p.290; Lafforgue11.7–11.10; BHKT4.5](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For split GL_n, reducible semisimple representations reconstruct with their full multiplicities.
- The theorem also applies to the global profinite Galois group after its topology is forgotten; GS.5 supplies the continuity instance.

### Continuity from characteristic-zero anchors

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`. Kind: theorem.

In Lafforgue11.7, for profinite Γ and split H° over finite E/Q_l (possibly disconnected H), continuous invariant families over E reconstruct a continuous representation Γ→H(E′) for a finite extension E′/E, unique up to H°(Q_l-bar)-conjugation, with reductive Zariski image. For algebraically closed rank-one valued characteristic-zero coefficients the analogous reconstructed semisimple representation is continuous. For relatively discrete condensed Q_l-fields the argument is applied locally to their finite-type coefficient modules.

**Hypotheses and conventions.** Finite-Q lifts are included, with fixed component projection. The finite field extension conclusion concerns the E-valued setting, not an arbitrary coefficient ring.

**Direct inputs.** `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`.

**Construction or proof.**

1. Choose a finite closed anchor and its centralizer C, and set D=Z_H(C). The coordinate map of the anchor slice surjects onto O(D).
2. Surjectivity uses exact invariants for C in characteristic zero and the closed anchor orbit; all reconstructed coordinates are therefore continuous functions of finitely many invariant evaluations.
3. Finite-anchor descent gives E′ in the E-valued case. For condensed coefficients the same finite coordinate calculation preserves the finite-type module condition locally.

Source: [Vincent Lafforgue, Proposition11.7 proof, especially end, pp.143–147; BHKT4.7(ii)](https://arxiv.org/pdf/1209.5352).

**Acceptance.**

- Exactness of centralizer invariants here is a characteristic-zero input; this proof is not transported unchanged to characteristic l.

### Continuity with discrete coefficients

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`. Kind: theorem.

For profinite Γ and algebraically closed discrete k, continuous pseudocharacter values imply continuity of the reconstructed completely reducible representation. More generally the finite-anchor proof works locally on profinite parameter sets in a condensed group with discrete coefficients. In characteristic l the relatively discrete Z_l-field convention is discrete, so it supplies this continuity clause for W_E.

**Hypotheses and conventions.** Use finite generation of the integral tuple invariant algebra and the arbitrary-characteristic finite anchor. No characteristic-zero exact-invariants argument.

**Direct inputs.** `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. The unique appended element is determined by the values of finitely many invariant-algebra generators. Each such value is locally constant.
2. The common neighbourhood on which these values equal their values at identity forces the appended representation element to be identity. For profinite Γ obtain an open normal kernel.
3. Apply the same argument on compact inertia and its translates for W_E.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, Proposition4.7(iii) and proof, pp.23–24](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- For profinite Γ the reconstructed representation factors through a finite quotient; for W_E only its inertia image must be finite in this discrete-coefficient case.

### Continuous semisimple parameter characters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`. Kind: theorem.

For algebraically closed Z_l-field L there are canonical bijections between (i) semisimple condensed L-parameters up to H(L)-conjugation, (ii) L-points of the piecewise coarse parameter quotient, and (iii) condensed Θ families on W_E^n with the reindexing and ordered multiplication relations. All primes l≠p are allowed.

**Hypotheses and conventions.** Characteristic-zero continuity and discrete characteristic-l continuity are supplied separately. Unconditional coarse quotients are in excursion-presentation; no LP3 or integral good-prime theorem is a prerequisite.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`, `LanglandsParameterStacks:LP0/finite-wild-ramification`.

**Construction or proof.**

1. Closed-orbit classification gives (i)↔(ii) piecewise, and the universal homeomorphism identifies coarse and excursion geometric points.
2. Group-agnostic reconstruction gives the algebraic (i)↔(iii).
3. Apply the appropriate finite-anchor continuity theorem to inertia and hence W_E; the finite-wild kernel places the parameter in a piece.

Source: [Laurent Fargues; Peter Scholze, VIII.3.8 and proof, p.290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Both an algebraic closure of Q_l and F_l-bar satisfy the classification, with their respective continuity conventions.

### GL trace pseudocharacters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`. Kind: definition.

For a group Γ and commutative ring A, an r-dimensional trace pseudocharacter is τ:Γ→A with τ(1)=r, τ(xy)=τ(yx), and the Frobenius alternating identity: for every (r+1)-tuple γ, sum over σ∈S_{r+1} of sign(σ) times the product over cycles (i₁…i_d) of τ(γ_{i₁}⋯γ_{i_d}) is zero. Cyclic invariance makes the cycle term independent of its starting point.

**Hypotheses and conventions.** This definition has no reconstruction claim in small characteristic. The classification comparison below is restricted to algebraically closed characteristic-zero fields.

**Direct inputs.** `mathlib:Representation`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Equiv.Perm.cycleFactorsFinset`.

**Construction or proof.**

1. Use permutations and their cycle decomposition to define the alternating polynomial, independent of cycle ordering and starting point.
2. The trace of any r-dimensional representation satisfies the identity by the (r+1)st exterior-power alternating relation.

Source: [Vincent Lafforgue, Remark11.8, pp.144–145](https://arxiv.org/pdf/1209.5352).

**API.**

- `TracePseudocharacter` (data): Normalised central trace function satisfying the alternating identity.
- `TracePseudocharacter.ofRepresentation` (constructor): Trace of an r-dimensional representation.
- `TracePseudocharacter.cycleValue` (data): The product of trace values along a permutation’s cycles.
- `TracePseudocharacter.map` (functoriality): Coefficient ring maps preserve all identities.

**Uses.**

- `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`: The classical shadow of reductive excursion characters.

**Unit-test specifications.**

- `trace_rank_one` (computation): For r=1 the identity is τ(x)τ(y)=τ(xy), so normalised pseudocharacters are characters.
- `trace_zero_rank` (degenerate): For r=0 the one-variable alternating identity forces τ=0.
- `trace_semisimple_sum` (compatibility): The trace of a direct sum of characters is a trace pseudocharacter of the sum of their ranks.
- `trace_not_rank_one_constant` (non-example): The constant function 1 is not rank-two because τ(1) must be 2 in characteristic zero.

### Trace and excursion character comparison

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`. Kind: theorem.

For algebraically closed characteristic-zero L, GL_r-pseudocharacters, r-dimensional trace pseudocharacters and conjugacy classes of semisimple representations Γ→GL_r(L) correspond. The invariant functions on tuples are generated by permutation cycle-trace functions (and inverse-determinant functions on GL_r); Cayley–Hamilton/Newton identities and group inverses express these using traces of words.

**Hypotheses and conventions.** Characteristic zero is essential for this stated trace classification. Higher invariant Θ data, not traces alone, give the arbitrary-characteristic reductive theorem.

**Direct inputs.** `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Apply the RG-requested Procesi invariant generation and the alternating identity to construct the compatible Θ family.
2. Use the group-agnostic reconstruction theorem for GL_r.
3. Trace word invariants separate its semisimple conjugacy classes; use Newton identities to recover determinant and inverse determinant from traces of powers and inverse words.

Source: [Vincent Lafforgue, Remark11.8 pp.144–145 (Procesi/Taylor inputs)](https://arxiv.org/pdf/1209.5352).

**Acceptance.**

- For Γ=1 the unique semisimple rank-r representation has τ(1)=r.

### Parameters of Schur objects

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/schur-object-parameter`. Kind: theorem.

If L is algebraically closed and a categorical Hecke datum acts on C, every object X with End_C(X)=L receives a unique semisimple cocycle Γ→H(L), up to H(L)-conjugation, whose invariant evaluations equal the excursion action on X.

**Hypotheses and conventions.** End_C(X)=L is given as an L-algebra identification. This is for the discrete Γ datum; continuity requires the separately checked continuous consumer data.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`.

**Construction or proof.**

1. Evaluate the abstract centre map on X and compose with End_C(X)≃L.
2. Apply the universal excursion relations and semisimple reconstruction.

Source: [Laurent Fargues; Peter Scholze, VIII.4.3, p.293](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- Do not infer continuity for W_E from an arbitrary discrete categorical datum.

## LP3 — LanglandsParameterStacks:LP3

LP3 imports general highest-weight theory and uses it to construct and test the good-filtration t-structure on IndPerf. The induced perfect subcategory, bar criterion, connective tensor criterion, adjoint-unit equivalence and derived-unit fibre establish the tame relation case. Both sides of the adjoint-unit criterion are needed: the prime restriction is mathematically substantive.

The rest of VIII.5 is essential for wild inertia. Prime-to-ℓ fixed groups, the cyclic fixed-locus resolution, the solvable Donkin theorem, induction/counit and restriction generation, and preservation of fundamental-group torsion feed the gerbe pushforward. The characteristic-two swap example prevents weakening the order hypothesis to preservation of a pinning. Mapping approximation and free-gerbe comparison then remove finite solvable wild groups and finish the equivariant colimit proof.

The BHKT branch adds separable centralizers with the correct root-type exclusions, étale descent of finite quotients, the formal slice with scheme-theoretically trivial stabilizer, and integral group Chevalley restriction. These are distinct from the good-π₁ condition used for parameter generation.

**Coverage: planned.** Register RG2.6 and supply its highest-weight/centralizer/root-case inputs, SF.4 normalisation/completion and the E5/S.1 enhanced bar/mapping categories; then elaborate the missing categorical signatures.

**Planets:** Good-filtration t-structures; Induced perfect complexes; Adjoint perfect generation; Prime-to-l fixed-group components; Donkin fixed subgroups; Integral Chevalley restriction.

### Good-filtration t-structures

Identifier: `LanglandsParameterStacks:LP3/good-filtration-t-structure`. Kind: construction.

Over algebraically closed L of characteristic l, for G with reductive identity G° and |π₀G| prime to l, IndPerf(BG) carries the good-filtration t-structure: connective M satisfy H^i(G°,M⊗∇_λ)=0 for i>0, coconnective M satisfy H^i(G°,M⊗Δ_λ)=0 for i<0 for all dominant λ. ∇_λ are induced/dual-Weyl modules and Δ_λ their Weyl counterparts. Degree-zero good-filtered modules are connective.

**Hypotheses and conventions.** Cohomological connective convention D^{≤0}; the t-structure is on IndPerf, not a claim that Perf is closed under truncation. General ∇,Δ, Kempf, Donkin criterion and tensor stability are RG2.6-extension requests.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CategoryTheory.Triangulated.TStructure`.

**Construction or proof.**

1. Import highest-weight modules and their duality/vanishing and construct the orthogonal classes as FS5.4.
2. Use generation by the highest-weight test objects to obtain truncations in the presentable Ind category; the finite component group allows passing between G and G°.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1, Definition VIII.5.4, pp.294–295](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `goodFiltrationTStructure` (data): The t-structure on IndPerf(BG) with its connective convention.
- `goodFiltrationTStructure.connective_iff` (characterisation): Vanishing of H^i(G°,M⊗∇_λ) for all i>0 and λ.
- `goodFiltrationTStructure.coconnective_iff` (characterisation): Vanishing with Δ_λ for i<0.
- `goodFiltrationTStructure.tensorConnective` (relation): Tensor products of connective objects are connective under the imported Donkin–Mathieu tensor theorem.
- `goodFiltrationTStructure.homotopy` (compatibility): Its homotopy-category t-structure uses the baseline TStructure convention; this does not recover its infinity enhancement.

**Uses.**

- `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`: The tensor-connectivity criterion.
- `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`: Finite-dimensional cohomology argument.

**Unit-test specifications.**

- `good_torus` (computation): For a torus every rational module decomposes into weights, so the good-filtration t-structure is the usual cohomological one.
- `good_zero` (degenerate): The zero object is in both halves.
- `good_induced` (compatibility): A dual-Weyl module ∇_λ in degree zero is connective.
- `good_shift_sign` (non-example): For a nonzero torus representation V, V[−1] lies in positive cohomological degree and is not connective in the convention D^{≤0}.

### Separatedness of good filtrations

Identifier: `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`. Kind: theorem.

The good-filtration t-structure on IndPerf(BG) is separated: an infinitely connective object and an infinitely coconnective object are zero. The induced test modules detect zero.

**Hypotheses and conventions.** G° reductive and |π₀G| prime to l; use the Ind category.

**Direct inputs.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. For infinite connectivity all H^i(G°,M⊗∇_λ) vanish, so M has no maps from the corresponding dual tests.
2. Highest-weight generation detects M=0; dual testing gives the other half.
3. This separatedness justifies later increasing-connectivity bar-cone arguments; it is not merely an assertion of finite amplitude.

Source: [Laurent Fargues; Peter Scholze, VIII.5.5 and proof, p.295](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- A complex cannot be discarded just because its ordinary underlying module forgetful image vanishes in an Ind quotient; use the actual test detection.

### Good filtrations of free cocycle algebras

Identifier: `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`. Kind: theorem.

For every action F_n→Aut(G), O(Z¹(F_n,G)) with twisted diagonal G°-conjugation has a good G°-filtration. Hence its higher rational G°-cohomology vanishes; for prime-to-l π₀G the corresponding G-cohomology also vanishes.

**Hypotheses and conventions.** G° reductive; π₀G prime to l for the final G assertion. Generic good filtration of O(G) as a G°×G°-module is imported from RG.

**Direct inputs.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Identify the free cocycle space with G^n. Each twisted conjugation restriction of O(G) preserves the imported good-filtration structure.
2. Apply Donkin–Mathieu tensor stability to the n factors and the Donkin vanishing criterion.
3. Use exact finite-component invariants for the final assertion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.6–VIII.5.7, p.296](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For F₀ the algebra is L with the trivial good filtration.

### Perfect complexes generated from the classifying stack

Identifier: `LanglandsParameterStacks:LP3/induced-perfect-complexes`. Kind: definition.

For X=Spec A with algebraic G-action define Perf^ind(X/G) as the smallest stable idempotent-complete full subcategory of Perf(X/G) containing pullbacks of Perf(BG), closed under shifts, cones and retracts. Its Ind-completion maps to Mod_A(IndPerf(BG)); equality with all Perf is a theorem under additional hypotheses, not a definition.

**Hypotheses and conventions.** A can be a derived finite-type algebra as required by the derived-unit-fibre theorem. Perfectness and pullback are imported from S.1/E5.

**Direct inputs.** `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`, `mathlib:CategoryTheory.Idempotents.Karoubi`.

**Construction or proof.**

1. Use the general stable/idempotent closure construction on the image of pullback.
2. Extend to the Ind category; on bounded induced perfect objects the algebra module comparison is fully faithful.

Source: [Laurent Fargues; Peter Scholze, VIII.5.2, pp.296–297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `InducedPerfectComplexes` (data): Stable retract closure of the image of Perf(BG).
- `InducedPerfectComplexes.pullback` (constructor): Any classifying-stack perfect complex yields an induced one.
- `InducedPerfectComplexes.retract` (structure): Closed under shifts, cones and retracts.
- `InducedPerfectComplexes.moduleFunctor` (functoriality): The fully faithful comparison on the induced Ind subcategory to A-modules in IndPerf(BG).
- `InducedPerfectComplexes.minimal` (universal-property): Every stable idempotent-complete subcategory containing the pullbacks contains Perf^ind.

**Uses.**

- `LanglandsParameterStacks:LP3/bar-criterion`: The bar test for membership.
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`: Generation of all parameter perfect complexes.

**Unit-test specifications.**

- `induced_point` (degenerate): For X=Spec L, Perf^ind(BG)=Perf(BG).
- `induced_trivial_group` (computation): For G=1, finite-cell A-complexes and their retracts give all Perf(A).
- `induced_retract` (characterisation): A direct summand of an induced finite complex lies in Perf^ind.
- `induced_not_all_bad_prime` (non-example): For X=G with conjugation and l dividing |π₁(G°)_tors|, the unit skyscraper fails to be induced by VIII.5.11.

### The induced-perfect bar criterion

Identifier: `LanglandsParameterStacks:LP3/bar-criterion`. Kind: theorem.

For M∈Perf(X/G), M lies in Perf^ind iff the canonical bar map colim[…→M⊗_L A⊗_L M^∨→M⊗_L M^∨]→M⊗_A M^∨ is an isomorphism in IndPerf(BG). All tensor products on the left and its geometric realisation are formed in IndPerf(BG).

**Hypotheses and conventions.** X affine finite type, G° reductive, π₀G prime to l in the surrounding setting; M dualisable.

**Direct inputs.** `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`.

**Construction or proof.**

1. For induced objects the bar construction has extra degeneracies after the correct comparison, and extends over finite cones/retracts.
2. Conversely the isomorphism makes the module object M compact, using compactness of the unit and duality; it becomes a retract of a finite induced complex.
3. For a Borel B⊂G° use Kempf full faithfulness Perf(BG°)→Perf(BB) and conservative finite-component restriction to test the criterion there (VIII.5.9).

Source: [Laurent Fargues; Peter Scholze, VIII.5.8–VIII.5.9, pp.296–297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For M=A the standard augmented bar map is an isomorphism.

### Tensor-connectivity criterion for induced perfectness

Identifier: `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`. Kind: theorem.

Assume A has a good G°-filtration and M∈Perf(X/G) is connective in the good-filtration t-structure after forgetting its A-action. Then M∈Perf^ind iff for every similarly connective N∈Perf(X/G), M⊗_A N remains connective.

**Hypotheses and conventions.** G° reductive, π₀G prime to l. Finite good-filtration dimension of coherent modules is an explicit supplier input.

**Direct inputs.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/bar-criterion`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. For induced M the tensor product is the bar realisation of connective terms, hence connective.
2. For the converse, approximate the dual bar resolution by finite colimits with increasingly connective cones, using finite good-filtration dimension.
3. Tensor by M and apply separatedness to recover the bar criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.10 and proof, p.297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- The criterion includes the connectivity hypothesis on M itself.

### Adjoint perfect generation and its prime restriction

Identifier: `LanglandsParameterStacks:LP3/adjoint-unit-generation`. Kind: theorem.

For G acting on itself by conjugation, let i:Spec L→G be the unit. With G° reductive and π₀G prime to l, the following are equivalent: l∤|π₁(G°)_tors|; i_*L∈Perf^ind(G/G); Perf^ind(G/G)=Perf(G/G).

**Hypotheses and conventions.** L algebraically closed of characteristic l; do not drop the π₁ restriction from integral generation.

**Direct inputs.** `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/bar-criterion`, `ReductiveGroupsPartII:RG2.5`, `SchemeKTheoryOperations:S.1`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. For sufficiency reduce via prime-to-l central covers to simply connected derived group; build a Borel-equivariant Cartier/Bruhat flag whose divisor line bundles come from B-characters, then apply the Borel bar criterion.
2. The diagonal kernel is pulled back from the unit along (g,g′)↦gg′⁻¹; generation of the unit forces the identity functor to factor through the induced subcategory.
3. For necessity a central cover with l-primary kernel would force invariant functions on that kernel to be surjected by conjugation invariants; their constancy on the unipotent kernel contradicts this, using the tensor criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.11 and proof, pp.297–299](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For a torus π₁ has no torsion and the unit is induced-perfect.
- For PGL_l the fundamental-group l-torsion excludes the generation conclusion.

### Twisted free-group perfect generation

Identifier: `LanglandsParameterStacks:LP3/twisted-free-generation`. Kind: theorem.

If G° is reductive and the orders of π₀G and π₁(G°)_tors are prime to l, then for any action F_n→Aut(G), Perf(Z¹(F_n,G)/G) is generated under cones and retracts by Perf(BG).

**Hypotheses and conventions.** Twisted conjugation, not just the untwisted diagonal action.

**Direct inputs.** `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `SchemeKTheoryOperations:S.1`.

**Construction or proof.**

1. Express the diagonal kernel on the twisted G^n quotient as a pullback of the adjoint unit kernel.
2. Apply adjoint-unit generation to the kernel and its integral transforms; the induced subcategory then contains the identity image of every perfect object.

Source: [Laurent Fargues; Peter Scholze, VIII.5.12 and proof, p.299](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For F₀ this reduces to Perf(BG) itself.

### Derived unit fibres and generation

Identifier: `LanglandsParameterStacks:LP3/derived-unit-fibre`. Kind: theorem.

For a G-equivariant map X̃→G with conjugation action on G, put X=X̃×^R_G Spec L at the unit and Ã=O(X̃), A=O(X). If G° is reductive and π₀G, π₁(G°)_tors have prime-to-l orders, then L⊗_{O(G)}Ã→A is an isomorphism in IndPerf(BG). If additionally Perf(X̃/G)=Perf^ind and Ã is connective for the good-filtration t-structure, then A is connective and Perf(X/G)=Perf^ind.

**Hypotheses and conventions.** Tensor product is in IndPerf(BG), and X may be derived. The statement does not assume the derived fibre is already classical.

**Direct inputs.** `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Adjoint-unit generation makes the tensor calculation finitary on bounded representations and agrees with the geometric derived fibre.
2. Connectivity follows from the tensor formula. Apply the bar criterion to perfect complexes over A.
3. Control the bar-cone resolution in the good-filtration t-structure, using finite coherent good-filtration dimension and separatedness, as in VIII.5.13.

Source: [Laurent Fargues; Peter Scholze, VIII.5.13 and proof, pp.299–301](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For X̃=G and the identity map the fibre is the unit and the formula is tautological.

### Surface and tame relation fibres

Identifier: `LanglandsParameterStacks:LP3/surface-and-tame-relations`. Kind: comparison.

The derived character stack of a compact oriented surface with relation ∏[a_i,b_i]=1 and the tame Weil parameter stack with relation σ⁻¹τσ=τ^q are unit fibres of equivariant maps G^{2g}→G and G²→G respectively. Under the good π₁ and component hypotheses their coordinate algebras are connective and their Perf categories are generated from BG. The surface comparison is an application of the same mechanism; no new surface roadmap is created here.

**Hypotheses and conventions.** L algebraically closed characteristic l; integral lifting is a separate step. Tame semidirect twisting is included when the finite action is nontrivial.

**Direct inputs.** `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Use the free cocycle algebra good filtration and twisted free generation for the source.
2. Apply the derived-unit-fibre theorem to the relation word. For tame W include the prime-to-l tame/wild gerbe passage before identifying the desired finite-wild piece.

Source: [Laurent Fargues; Peter Scholze, End VIII.5.2, p.301, and tame reduction p.312](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For genus one the relation is the commuting-pair fibre.
- The tame relation uses geometric Frobenius in the displayed form.

### Prime-to-l components of fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`. Kind: theorem.

Let L be algebraically closed of characteristic l, G smooth affine with G° reductive and π₀G of order prime to l, and P finite of order prime to l acting on G. For H=G^P, the order of π₀H is prime to l. Smoothness and reductivity of H° are imported from the RG2.6 fixed-point request; this LP3 theorem owns only the component-order assertion.

**Hypotheses and conventions.** No solvability assumption for this component theorem; all group orders are prime to l as specified.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`.

**Construction or proof.**

1. Embed G/H as the closed orbit of the fixed action data in a product of twisted copies of G; its coordinate algebra has a good G°-filtration.
2. Use the requested finite good-filtration-dimension theorem to bound H-cohomology via induction.
3. If π₀H had l-torsion, restrict to a subgroup mapping onto C_l to obtain nonzero cohomology in arbitrarily high degrees, contradicting the bound.

Source: [Laurent Fargues; Peter Scholze, VIII.5.14 and proof, pp.301–302](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- P=1 gives π₀H=π₀G.
- LP1 obtains reductivity directly from RG, never through this LP3 theorem.

### Cyclic fixed-locus resolutions

Identifier: `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`. Kind: theorem.

Let Θ have prime order r≠l on G with G° reductive and π₀G prime to l. Put X={(g₀,…,g_{r−1}):g₀Θ(g₁)⋯Θ^{r−1}(g_{r−1})=1}, with G twisted conjugation and C_r cyclic permutation. For the augmented cosimplicial G-space X^{C_r}→X⇒∏_{C_r}X→…, the coordinate-algebra realisation is O(X^{C_r}) in IndPerf(BG).

**Hypotheses and conventions.** No π₁ good-prime assumption. Formal completions and pro-objects are used in the proof; their algebraic exactness is an explicit E5/SF.4 input.

**Direct inputs.** `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCeti.fixedSubgroup`.

**Construction or proof.**

1. Complete the cosimplicial terms along the common fixed locus; the induced colimit is unchanged.
2. The formal-unit rth-root map exists because r is invertible, and constructs a (G,C_r)-equivariant retraction of the completion onto X^{C_r}, providing an extra degeneracy.
3. Use exactness in the Ind–Pro representation enlargement and a faithful GL embedding when needed; this is not averaging without a resolution.

Source: [Laurent Fargues; Peter Scholze, VIII.5.16 and proof, pp.304–307](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- r must be prime to l for the formal rth-root construction.

### Solvable fixed groups as Donkin subgroups

Identifier: `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`. Kind: theorem.

If P is finite solvable of order prime to l acting on G with G° reductive and π₀G prime to l, then H°=(G^P)° is a Donkin subgroup of G°: restriction of a good G°-filtered representation has a good H°-filtration. Equivalently induction of a good H°-filtered representation has a good G°-filtration.

**Hypotheses and conventions.** The theorem is not asserted for arbitrary P. No π₁ condition is imposed.

**Direct inputs.** `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`.

**Construction or proof.**

1. Reduce through a solvable normal series to a cyclic prime-order automorphism and reduce the simple-group factors and central covers carefully.
2. For permutation actions the fixed identity subgroup is diagonal and tensor stability applies; for simple inner/outer actions use the explicit root/highest-weight calculations in VIII.5.15.
3. The cyclic fixed-locus resolution gives the good filtration of O(G/H); the highest-weight cohomological criterion gives Donkin restriction/induction.

Source: [Laurent Fargues; Peter Scholze, VIII.5.15 and proof, pp.302–304](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For a factor-permuting cyclic group on K^r, the diagonal K is Donkin by tensor stability.

### Fixed-group induction and good counit kernels

Identifier: `LanglandsParameterStacks:LP3/fixed-induction-and-counit`. Kind: theorem.

In the solvable prime-to-l fixed-group setting H=G^P, a representation W of H° has good H°-filtration iff Ind_{H°}^{G°}W has good G°-filtration, and a representation of H has good H°-filtration iff Ind_H^G W has good G°-filtration. For good W the respective restriction–induction counit kernels also have good H°-filtrations.

**Hypotheses and conventions.** Induction here is algebraic rational induction, not compact induction of locally profinite groups. The finite component groups are prime to l.

**Direct inputs.** `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Combine Donkin restriction with the counit and its good kernel.
2. Use the highest-weight criterion and the separated bar resolution to relate the converse, the good kernels and generation.
3. Pass from identity groups to full groups by their finite prime-to-l component representations, keeping central-cover descent as in VIII.5.17.

Source: [Laurent Fargues; Peter Scholze, VIII.5.17(i)–(iv) and proof, pp.307–310](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For P=1 induction and counit are identity and their kernels are zero.

### Generation by restriction to fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-restriction-generation`. Kind: theorem.

In the same solvable prime-to-l setting, Perf(BH°) is generated under cones and retracts by restrictions from Perf(BG°), and Perf(BH) is generated by restrictions from Perf(BG). No π₁ good-prime hypothesis is added.

**Hypotheses and conventions.** Both identity and full group statements are required; the central quotient can affect the full-group statement.

**Direct inputs.** `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`.

**Construction or proof.**

1. The successive restriction–induction counit resolution is split after induction. Good-filtration kernels and separatedness give its convergence in IndPerf.
2. Conservativity of induction supplies generation; compactness cuts the resolution down to finite cones and retracts.
3. Use simply connected central covers and diagonalizable kernel character decompositions, rather than assume that centres do not matter.

Source: [Laurent Fargues; Peter Scholze, VIII.5.17(v)–(vi), pp.307–310](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For P=1 restriction generates tautologically.

### The central-character fixed-group counterexample

Identifier: `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`. Kind: comparison.

In characteristic2, for G=(SL₂×SL₂)/μ₂ with factor-swap P=C₂, the fixed group is H=PGL₂×(μ₂×μ₂)/μ₂. The nontrivial central character of H is not generated by restrictions of Perf(BG) under cones and retracts. Thus prime-to-l cannot be replaced by preserving a Borel, torus or pinning.

**Hypotheses and conventions.** This is a counterexample outside the order hypothesis, not a claim contradicting the preceding theorem.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. For the nontrivial central-character summand of a restricted perfect G-object, homotopy C₂-invariants in PGL₂ remain perfect.
2. This property is stable under cones and retracts, but fails for the nontrivial central character itself. Keep the full centre, not just the identity component, in the calculation.

Source: [Laurent Fargues; Peter Scholze, VIII.5.18, p.308](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- The acting group order equals l here; the good theorem does not apply.

### Fundamental groups of solvable fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-fundamental-group`. Kind: theorem.

If G° is reductive, P is finite solvable of order prime to l and l∤|π₁(G°)_tors|, then l∤|π₁((G^P)°)_tors|.

**Hypotheses and conventions.** The smooth fixed identity group is supplied by RG. This is distinct from π₀(G^P) having prime-to-l order.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`.

**Construction or proof.**

1. Reduce to prime-order actions via the solvable series and to the simply connected simple derived factors by prime-to-l central isogenies.
2. Permutation and outer actions preserve the required prime property. For inner actions use the root-subsystem list in VIII.5.19 and track the image of the centre, including exceptional types.
3. Descend central covers, noting that any new offending prime is the acting prime, already distinct from l.

Source: [Laurent Fargues; Peter Scholze, VIII.5.19 and proof, pp.310–311](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- A cyclic diagonal fixed group in G^r has the same π₁ torsion as G.
- Do not infer this from the component-group assertion alone.

### Sifted parameter mapping approximations

Identifier: `LanglandsParameterStacks:LP3/mapping-approximation`. Kind: construction.

For a gerbe 𝒢 over BΓ with fibres a finite union of BG for groups with reductive identity, define Perf(Map^Σ_{BΓ}(S,𝒢)) as the sifted-colimit-preserving left Kan extension of Perf(Map_{BΓ}(S,𝒢)) from finite Γ-torsors to anima over BΓ. This denotes a category, not an assertion that a new representing stack exists. Use its Ind-completion and canonical comparison to actual mapping stacks. The same definition over BQ and a coefficient DVR supplies the integral categorical universal property.

**Hypotheses and conventions.** Generic left Kan extension, anima, linear stable categories and compact objects are imported from E5. Only parameter/gerbe instances are planned here.

**Direct inputs.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`, `SchemeKTheoryOperations:S.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Restrict actual Perf mapping categories to finite torsors and left Kan extend in the specified linear category universe.
2. Use the universal property to obtain the comparison and its naturality. Ind extends the compact linear-category diagram.

Source: [Laurent Fargues; Peter Scholze, VIII.5.4 pp.311–312; X.3 setup pp.348–349](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `ParameterMappingApproximation` (data): The left Kan extension category denoted Perf(Map^Σ).
- `ParameterMappingApproximation.compare` (projection): Natural comparison to the actual Perf mapping category.
- `ParameterMappingApproximation.finiteTorsor` (compatibility): It agrees with the defining Perf category on finite torsors.
- `ParameterMappingApproximation.leftKan` (universal-property): Restriction to finite torsors classifies sifted-colimit-preserving extensions.
- `ParameterMappingApproximation.ind` (functoriality): Ind-completion of the compact category diagram.

**Uses.**

- `LanglandsParameterStacks:LP3/free-gerbe-comparison`: Free-group comparison for wild reduction.
- `LanglandsParameterStacks:LP4/integral-universal-property`: Integral universal property without falsely replacing the approximation.

**Unit-test specifications.**

- `approx_point` (degenerate): On the base one-point torsor the category equals Perf of the gerbe fibre.
- `approx_coproduct` (characterisation): A finite coproduct of torsors maps to the tensor product of their linear Perf categories.
- `approx_bad_prime` (non-example): Over F_l-bar with G=PGL_l and Γ=Z, the free-group approximation has induced-perfect image and excludes the unit skyscraper in Perf(G/G); it is not the actual mapping category.

### Free-group gerbe comparisons

Identifier: `LanglandsParameterStacks:LP3/free-gerbe-comparison`. Kind: theorem.

For a gerbe 𝒢 over BΓ banded by G with G° reductive and π₀G prime to l, the comparison IndPerf(Map^Σ_{BΓ}(BF_n,𝒢))→IndPerf(Map_{BΓ}(BF_n,𝒢)) is fully faithful, with image generated by IndPerf(BG). For a connected gerbe and extension E_G→Γ its source is modules over O(∏π⁻¹(γ_i)) in IndPerf(BG). It is an equivalence if π₁(G°)_tors has prime-to-l order; finite unions of gerbes satisfy the analogous statement.

**Hypotheses and conventions.** L algebraically closed characteristic l; γ_i are the generator images in Γ.

**Direct inputs.** `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Write the circle as the pushout of point←two points→point and use Barr–Beck for the G-torsor.
2. Base change the module categories and take products for n generators.
3. Apply twisted-free-generation for equivalence at good primes; without it retain just full faithfulness and the induced essential image.

Source: [Laurent Fargues; Peter Scholze, VIII.5.20 and proof, p.312](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For F₀ the module algebra is the base and the comparison is identity.

### Solvable wild gerbe elimination

Identifier: `LanglandsParameterStacks:LP3/wild-gerbe-elimination`. Kind: theorem.

For finite solvable normal P⊂Γ of order prime to l, and a stack 𝒢 over BΓ with fibre a finite union of BG with G° reductive and π₀G prime to l, its pushforward along BΓ→B(Γ/P) has fibre Map_{BΓ}(BP,𝒢), a finite union of BH with H° reductive and π₀H prime to l. The Map^Σ(BP) comparison is an equivalence. Prime-to-l π₁ torsion of every input G° is preserved in every H°.

**Hypotheses and conventions.** Normal subgroup version suffices for the wild application; P finite solvable and l invertible in its order.

**Direct inputs.** `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/fixed-fundamental-group`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/mapping-approximation`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. For cyclic prime P, the twisted norm fixed-locus resolution computes the free-resolution algebra; fixed-group restriction generation gives equivalence.
2. If no extension section exists the mapping stack is empty and geometric reductivity forces the corresponding invariant colimit to vanish.
3. Induct through a solvable normal series using pushforward and left Kan extension compatibility; use the fixed-fundamental-group theorem for the good-prime clause.

Source: [Laurent Fargues; Peter Scholze, VIII.5.21 and proof, pp.313–315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For P=1 this is the identity comparison.
- Finite p-groups from wild inertia are solvable and have order prime to l.

### Tame reduction of finite-wild parameter categories

Identifier: `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`. Kind: comparison.

For a finite-wild discrete W with finite normal p-group P and tame W/P, the gerbe pushforward and Map^Σ comparison reduce the characteristic-l cocycle algebra and Perf generation assertions to the tame relation-fibre case. Consequently colim free-cocycle algebras→O(Z¹(W,H)) is an isomorphism in IndPerf(BH), its algebra is connective in the good-filtration t-structure, and Perf(Z¹(W,H)/H) is generated from Perf(BH), under the good π₁ restriction.

**Hypotheses and conventions.** l≠p, l∤|π₁(H)_tors|; H split connected dual group, and finite action carried through the gerbe.

**Direct inputs.** `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/surface-and-tame-relations`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Eliminate the finite wild p-group using VIII.5.21; the new bands retain reductive identity, prime-to-l components and good π₁.
2. Apply the tame unit-fibre result and the free-gerbe module comparison.
3. Translate the equivalence back to the coordinate-algebra and induced-perfect statements as in the end of VIII.5.2. No LP4 universal property is needed.

Source: [Laurent Fargues; Peter Scholze, VIII.5.2 and concluding proof, pp.294,312–315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For trivial wild P the reduction is the tame relation-fibre argument.

### Very-good and reductive-pair centralizers

Identifier: `LanglandsParameterStacks:LP3/separable-centralizers`. Kind: theorem.

Over algebraically closed k, every closed subgroup of reductive G has smooth scheme-theoretic centralizer if char(k) is very good for G in the BMRT sense, or if G has a faithful V with G-equivariant splitting Lie(G)⊂Lie(GL(V)). Its tuple orbit maps are then separable. For simple root systems the very-good exclusions are l∤n+1 for A_n, l≠2 for B,C,D,E,F,G, l≠3 for E,F,G, and l≠5 for E₈. A positive characteristic prime to |W_G| is sufficient.

**Hypotheses and conventions.** Do not infer that the Lie algebra of a general reductive group is semisimple: its torus centre remains. The BMRT centralizer theorem is requested from RG, and the root-system table is scoped to simple factors.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `mathlib:RootPairing`, `mathlib:CoxeterSystem`.

**Construction or proof.**

1. Apply the requested BMRT theorem under either hypothesis; the orbit differential criterion equates separability with smooth stabilizer.
2. Check the simple root-system exclusions and Weyl group orders using the RG root datum interface.
3. Record the torus correction in source issue E2; the quotient/slice statements retain their separate hypotheses.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Theorem3.8, table and Lemma3.9, pp.13–14](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- For GL(V) the reductive-pair hypothesis holds with zero complement, so closed subgroup centralizers are smooth.
- For G_m, Lie(G_m) is one-dimensional abelian, not a nonzero semisimple Lie algebra.

### Descent of étaleness to reductive quotients

Identifier: `LanglandsParameterStacks:LP3/quotient-etale-descent`. Kind: theorem.

Let G/O be reductive and X,Y normal integral affine flat finite-type O-schemes, with a finite equivariant φ:Y→X. If y∈Y(k) and x=φ(y) have closed residual orbits, φ is étale at y, and its map on these orbits is injective on geometric points, then φ//G is étale at π(y).

**Hypotheses and conventions.** O the excellent coefficient DVR; finiteness, normality, closedness and orbit injectivity are explicit. The normalisation/inertia criterion is an SF.4 extension request, not implicitly available from field inertia subgroups.

**Direct inputs.** `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use a Galois closure of the finite function-field extension and normalisations, with the SF.4 étaleness criterion for intermediate integral closures.
2. Translate the finite inertia inclusion through the closed orbit and its injectivity, showing the quotient normalisation is unramified at the quotient point.
3. Use the invariant-neighbourhood property to localise and conclude étaleness as in BHKT3.11.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.2 Lemmas3.11–3.12, pp.16–17](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- For identity φ all hypotheses hold and the quotient map is étale.

### Formal quotient slices over coefficient DVRs

Identifier: `LanglandsParameterStacks:LP3/formal-etale-slice`. Kind: theorem.

Let G/O be reductive, X integral affine smooth finite type over O, and x∈X(k) have closed residual orbit and scheme-theoretically trivial stabilizer. For Artin local O-algebras with residue field k, the formal G-identity neighbourhood acts freely on X̂_x, and X̂_x/Ĝ≃(X//G)̂_{π(x)} as deformation functors.

**Hypotheses and conventions.** Scheme-theoretically trivial stabilizer is stronger than triviality of its k-points. No claim with arbitrary finite/nontrivial stabilizer is made.

**Direct inputs.** `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Choose an O-smooth transversal by splitting the tangent space of the orbit, using the trivial stabilizer.
2. The action G×S→X is étale near the point. Use Zariski main/normalisation and quotient étale descent to compare S with X//G.
3. Invariant principal neighbourhoods and formal étaleness identify the completed functors, yielding free formal action and the quotient equivalence.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.2 Proposition3.13 and proof, pp.17–19](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- For X=G with left translation the formal quotient is a point.
- For tuple conjugation the action must first be by an effective adjoint group when the original centre is nontrivial.

### Integral Chevalley restriction for Levi groups

Identifier: `LanglandsParameterStacks:LP3/integral-chevalley-restriction`. Kind: theorem.

For a split reductive standard dual Levi M over Z, maximal split torus T and Weyl group W(M,T), restriction gives an isomorphism Z[M]^M≃Z[T]^{W(M,T)}. This is integral over Z with no good-prime hypothesis.

**Hypotheses and conventions.** The action is conjugation on M. This is group Chevalley restriction, not a statement about Lie algebra invariants in bad characteristic.

**Direct inputs.** `ReductiveGroupsPartII:RG2.5`, `mathlib:RootPairing`.

**Construction or proof.**

1. Injectivity follows from density of regular semisimple conjugates over Q and torsion-freeness.
2. Dominant highest-weight characters form a triangular Z-basis of Weyl-invariant torus characters.
3. Stable Z-lattices in the corresponding rational representations give integral characters in Z[M]^M, proving surjectivity. The highest-weight integral lattice theory is the RG2.6 request.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, Proposition8.3 and proof, p.53](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf).

**Acceptance.**

- For M=G_m, restriction is the identity Z[t,t⁻¹].
- For GL₂, the target is Z[t₁+t₂,t₁t₂,(t₁t₂)⁻¹], realised by trace and determinant.

## LP4 — LanglandsParameterStacks:LP4

Universal representation bundles and their tensor action are constructed before imposing a generation hypothesis. VIII.5.1 then gives generation of actual parameter Perf and its IndPerf module comparison under the integral good-prime condition.

The X.1 branch treats arbitrary characteristic-zero anima and small idempotent-complete stable linear categories. The X.3 branch treats integral Map^Σ, its preservation of all colimits and its module description; free-group comparison is fully faithful before a generation theorem gives essential surjectivity. For the finite-wild Weil group the good-prime theorem identifies approximation with actual Perf. Compact support on the full clopen union is objectwise: no single ramification bound for every object is required.

**Coverage: planned.** Supply the E5/S.1 linear tensor/module/compact/left-Kan foundations and RG integral highest-weight tensor compatibility; elaborate the generic action signatures. ES2/ES3 perform the Bun_G and W→W_E/P applications.

**Planets:** Universal representation bundles; Perfect generation on parameter stacks; Rational mapping-stack Perf colimits; Rational categorical parameter actions; Integral categorical parameter actions.

### Universal representation bundles

Identifier: `LanglandsParameterStacks:LP4/rep-action-on-perf`. Kind: construction.

For X=[Z¹(W,H)/H], evaluation of the universal H⋊Q-torsor gives, for finite I, exact Rep(Q^I)-linear symmetric monoidal functors Rep((H⋊Q)^I)→Perf(X)^{BW^I}. Tensoring these universal representation bundles acts on Perf(X). The construction exists before any good-prime generation theorem.

**Hypotheses and conventions.** Coefficients are the chosen base Z_l-algebra and representations finite projective; the W^I action is the universal cocycle action.

**Direct inputs.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `ReductiveGroupsPartII:RG2.5`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:abstract`.

**Construction or proof.**

1. Pull back a representation along the universal torsor with its W-equivariance.
2. Tensor I copies and use evaluation/fusion along finite-set maps.
3. Tensor with the resulting perfect bundle to obtain an exact endofunctor. Use S.1 for local perfectness and pullback stability.

Source: [Laurent Fargues; Peter Scholze, X introduction, p.340](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `UniversalRepresentationBundle` (constructor): Associated finite-projective bundle with universal W-equivariance.
- `UniversalRepresentationBundle.unit` (simp): The trivial representation gives O_X.
- `UniversalRepresentationBundle.tensor` (compatibility): Associated bundles preserve tensor product.
- `UniversalRepresentationBundle.reindex` (functoriality): Finite-set pullbacks give the fusion compatibilities.
- `UniversalRepresentationBundle.act` (functoriality): Tensoring defines the exact Perf action, compatible with unit and composition.

**Uses.**

- `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`: The canonical direction of the action classification.
- `ExcursionOperatorsAndSpectralAction:ES2`: The universal bundle action used by the Bun_G consumer.

**Unit-test specifications.**

- `rep_bundle_unit` (degenerate): The trivial representation acts by identity on Perf(X).
- `rep_bundle_at_parameter` (computation): The fibre at φ is V with the W-action supplied by φ.
- `rep_bundle_tensor` (compatibility): The fibre of the tensor product is the tensor product of the two parameter representations.

### Perfect generation on parameter stacks

Identifier: `LanglandsParameterStacks:LP4/generation-and-module-comparison`. Kind: theorem.

For finite-wild W and l∤|π₁(H)_tors|, Perf(Z¹(W,H)/H) over Z_l is generated under cones and retracts by the image of Perf(BH). The analogous characteristic-l statement holds over F_l-bar, and over a characteristic-zero field no restriction on l is needed.

**Hypotheses and conventions.** l≠p; finite-wild piece. Generation by representation bundles is a theorem, not the definition of Perf.

**Direct inputs.** `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use wild-to-tame reduction for the mod-l assertion.
2. Over Z_l reduce perfect amplitude by surjections from induced bundles. A vector bundle splits off an induced bundle rationally, hence up to an l-power.
3. The remaining mod-l object is induced-generated; devissage and retracts recover integral generation.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1 and reduction proof, pp.293–294](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For W=1 the category is Perf(BH).
- The unquotiented Z¹ and the quotient Z¹/H are not interchangeable in this statement.

### Parameter IndPerf module comparison

Identifier: `LanglandsParameterStacks:LP4/module-comparison`. Kind: theorem.

Under integral good-prime generation, IndPerf(Z¹(W,H)/H)≃Mod_{O(Z¹(W,H))}(IndPerf(BH)), compatibly with pullback, tensor products and the representation bundles. Over characteristic-zero fields the same comparison holds without a π₁ restriction.

**Hypotheses and conventions.** Modules are in IndPerf(BH), not in the ordinary derived category with the equivariance forgotten.

**Direct inputs.** `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`.

**Construction or proof.**

1. Pullback from BH and its right adjoint form the affine algebra adjunction. Generation makes the right adjoint conservative.
2. Apply Barr–Beck–Lurie and identify its monad with tensor by the cocycle coordinate algebra.
3. The canonical comparison identifies compact objects and the induced action.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1 and proof, p.293](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For H=1 this is the ordinary affine perfect/module comparison.

### Rational mapping-stack Perf colimits

Identifier: `LanglandsParameterStacks:LP4/rational-all-colimits`. Kind: theorem.

Let H/L be reductive over characteristic-zero L, with finite Q-action. The functor S↦Perf(Map_{BQ}(S,B(H⋊Q))) from anima over BQ to L-linear symmetric monoidal small stable idempotent-complete categories preserves all colimits; in particular it preserves sifted colimits after forgetting the monoidal structure.

**Hypotheses and conventions.** Arbitrary anima S, not just BF_n. Derived fpqc quotient and pro-reductive representation foundations are imported from E5/SF.1/RG.

**Direct inputs.** `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeAndStackFoundations:SF.1`, `SchemeKTheoryOperations:S.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Present the mapping stacks by affine derived X_i and pro-reductive G_i from chosen point surjections. Semisimplicity gives induced perfect generation and makes filtered comparisons fully faithful and essentially surjective.
2. Finite disjoint unions become tensor products. For pushouts use a common quotient group and Barr–Beck module categories; the algebra tensor computes the affine derived fibre product.
3. Combine filtered colimits, disjoint unions and pushouts; use the symmetric-monoidal sifted-colimit compatibility.

Source: [Laurent Fargues; Peter Scholze, X.1.2 and complete proof, pp.342–343](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For a finite set S with trivialised Q-torsor the category is Perf(BH^S).
- The proof uses characteristic-zero semisimplicity and does not justify the analogous actual integral mapping-stack statement.

### Rational categorical parameter actions

Identifier: `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`. Kind: theorem.

For any anima S→BQ, reductive H over characteristic-zero L with finite Q-action, and small idempotent-complete stable L-linear C, the anima of L-linear Perf(Map_{BQ}(S,B(H⋊Q)))-actions on C is equivalent to the anima of finite-set-functorial exact Rep_L(Q^I)-linear monoidal functors Rep_L((H⋊Q)^I)→End_L(C)^{S^I}. The comparison is given by universal representation bundles.

**Hypotheses and conventions.** No good π₁ prime condition over L. This is the generic X.1.1 theorem retained in LP4 by the issue’s more specific ownership instruction; ES2 applies it to Bun_G.

**Direct inputs.** `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Both data functors in S take sifted colimits to limits: for actions use the rational all-colimits theorem; for finite-set data use preservation of sifted colimits by finite powers.
2. Reduce to a finite set with trivialised Q-torsor. Highest-weight base change removes Q, and Yoneda in finite I identifies the datum with a monoidal action of Rep(H^S).
3. Extend exact representation functors uniquely to Perf(BH^S), including all higher coherence.

Source: [Laurent Fargues; Peter Scholze, X.1.1 and proof, pp.340–342](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For S a point this classifies Rep(H)-actions, extended to Perf(BH).

### Integral categorical parameter actions

Identifier: `LanglandsParameterStacks:LP4/integral-universal-property`. Kind: theorem.

For split reductive H over a coefficient DVR R with finite Q-action, anima S→BQ and small idempotent-complete stable R-linear C, the same finite-set monoidal datum classifies R-linear actions of ParameterMappingApproximation(S)=Perf(Map^Σ_{BQ}(S,B(H⋊Q))). No π₁ restriction is needed for this approximation theorem.

**Hypotheses and conventions.** This is not the naive actual integral mapping-stack universal property; equality with actual Weil Perf is a separate theorem.

**Direct inputs.** `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Use the definition as left Kan extension from finite Q-torsors, so both sides take sifted colimits to limits.
2. On finite torsors use the finite-set Yoneda/highest-weight proof of X.1.1 over R and exact representation-to-Perf extension.
3. The coherent natural equivalence extends by animation.

Source: [Laurent Fargues; Peter Scholze, X.3.1 and proof, pp.348–349](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For finite torsors the approximation and actual mapping categories agree.
- Do not assert the result with actual mapping Perf for arbitrary S over R.

### Colimits of integral parameter approximations

Identifier: `LanglandsParameterStacks:LP4/approximation-all-colimits`. Kind: theorem.

Over a coefficient DVR R the functor S↦Perf(Map^Σ_{BQ}(S,B(H⋊Q))) preserves all colimits into symmetric monoidal idempotent-complete small stable R-linear categories.

**Hypotheses and conventions.** The functor is the approximation; split reductive H. Sifted-colimit preservation is built into its definition, whereas coproduct tensor compatibility is a theorem.

**Direct inputs.** `LanglandsParameterStacks:LP3/mapping-approximation`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. For finite Q-torsors trivialise the torsors; finite disjoint unions give Perf(BH^{S₁})⊗_R Perf(BH^{S₂})≃Perf(BH^{S₁⊔S₂}) by highest-weight theory.
2. Extend this compatibility along animation and combine with the defining sifted-colimit property.

Source: [Laurent Fargues; Peter Scholze, X.3.2 and proof, p.349](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For S=∅ the tensor unit category is Perf(R).

### Integral free-group approximation comparison

Identifier: `LanglandsParameterStacks:LP4/integral-free-group-comparison`. Kind: theorem.

For S=BF_n→BQ, the integral approximation-to-actual Perf comparison is fully faithful and its image is the stable retract closure of Rep_R(H). Its Ind category is modules over O(H^n), with pulled-back twisted conjugation, in IndPerf(BH); compact objects give the approximation.

**Hypotheses and conventions.** No good π₁ condition for full faithfulness. Essential surjectivity onto all actual Perf requires a generation theorem.

**Direct inputs.** `LanglandsParameterStacks:LP4/approximation-all-colimits`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`, `SchemeKTheoryOperations:S.1`.

**Construction or proof.**

1. Express BF₁ as the point/two-point pushout and use the diagonal and Q-twisted diagonal maps H→H².
2. Apply Barr–Beck to the corresponding O(H)-modules, then take n tensor factors.
3. Identify the resulting compact module category with the induced-perfect subcategory.

Source: [Laurent Fargues; Peter Scholze, X.3.3 and proof, pp.349–350](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For F₀ both categories are Perf(BH).

### Discrete-group approximation algebras

Identifier: `LanglandsParameterStacks:LP4/sifted-approximation`. Kind: theorem.

For any discrete Γ→Q, BΓ is the sifted colimit of BF_n over FreeCocycleIndex(Γ) in anima. The integral approximation Perf(Map^Σ_{BQ}(BΓ,B(H⋊Q))) is the compact-object category of modules over colim_{F_n→Γ}O(H^n) in IndPerf(BH), with the tuple-dependent twisted action.

**Hypotheses and conventions.** The colimit is animated/equivariant, not merely a colimit of underlying ordinary rings.

**Direct inputs.** `LanglandsParameterStacks:LP4/integral-free-group-comparison`, `LanglandsParameterStacks:LP4/approximation-all-colimits`, `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Finite free groups are compact projective generators of animated groups; delooping gives the sifted anima presentation.
2. Use integral free-group comparison and preservation of sifted colimits; the module algebra is the indicated equivariant colimit.
3. Take compact objects in the resulting compactly generated module category.

Source: [Laurent Fargues; Peter Scholze, X.3.4 and proof, p.350](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- For Γ=F_n the index identity object is terminal and the algebra is O(H^n).

### Weil approximation and categorical actions

Identifier: `LanglandsParameterStacks:LP4/weil-approximation-equivalence`. Kind: theorem.

For finite-wild W, coefficient ring Λ the integers of a finite Q_l-extension and l∤|π₁(H)_tors|, the comparison Perf(Map^Σ_{BQ}(BW,B(H⋊Q)))_Λ→Perf(Z¹(W,H)_Λ/H) is an equivalence. Thus finite-set exact monoidal representation data classify Λ-linear actions of the actual finite-wild parameter Perf category on any small idempotent-complete stable C. Over a Q_l-field this holds at every l.

**Hypotheses and conventions.** The passage from W to W_E/P and to compactly supported actions on D_lis(Bun_G) is the ES2/ES3 consumer instance, using IX.5.1; it is not a prerequisite here.

**Direct inputs.** `LanglandsParameterStacks:LP4/sifted-approximation`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP4/module-comparison`, `LanglandsParameterStacks:LP4/integral-universal-property`, `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. The sifted approximation theorem identifies the compact module category over the free cocycle algebra colimit.
2. Use the integral invariant-stage IndPerf algebra comparison and the LP4 module comparison to identify it with actual parameter Perf.
3. Combine with the integral or rational categorical universal property. This is generic X.0.2, without a Bun_G application.

Source: [Laurent Fargues; Peter Scholze, X.0.2 p.340 and final combination p.350](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**Acceptance.**

- The good-prime restriction survives in the integral actual-category theorem; the approximation theorem had none.

### Compactly supported parameter actions

Identifier: `LanglandsParameterStacks:LP4/compactly-supported-actions`. Kind: definition.

For the clopen finite-wild union parameter stack, an action on C is compactly supported if for every object c∈C there is a quasi-compact open-and-closed substack U such that M↦M*c factors through restriction Perf(X)→Perf(U). The support bound is objectwise; no common P or U for every c is required.

**Hypotheses and conventions.** The whole parameter union can have infinitely many components. If it has finitely many pieces it may be quasi-compact; no universal non-quasi-compactness claim.

**Direct inputs.** `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `EnhancedDerivedSheaves:E5:abstract`, `SchemeKTheoryOperations:S.1`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Define objectwise factorisation through a quasi-compact clopen restriction.
2. Finite unions of support bounds control finite sums and cones, and retracts preserve the bound. The action-to-finite-wild Hecke comparison is checked in ES3.

Source: [Laurent Fargues; Peter Scholze, X introduction, pp.339–340](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

**API.**

- `IsCompactlySupportedParameterAction` (characterisation): Each object has its own quasi-compact clopen factorisation.
- `ParameterAction.supportUnion` (relation): A finite union controls a finite sum or cone.
- `ParameterAction.supportRetract` (relation): Retracts retain the same support bound.
- `ParameterAction.restrictPiece` (functoriality): Actions supported on a finite piece factor through that piece’s Perf category.

**Uses.**

- `ExcursionOperatorsAndSpectralAction:ES3`: W→W_E/P passage and compact-support instance on compact D_lis objects.

**Unit-test specifications.**

- `support_zero` (degenerate): The zero object has empty support.
- `support_finite_sum` (computation): Supports U,V for c,d give U∪V for c⊕d.
- `support_objectwise` (non-example): On a disjoint infinite union, objects each supported on one distinct component satisfy the condition without a common finite-component bound for the whole category.

## Supplier contracts

These are the 13 stage-addressed requests. Each describes the extension needed, rather than presuming that the current stage already supplies it. The packet gives the exact list of consuming node identifiers for every request.

### ArithmeticGaloisRepresentations:R01.2

Grothendieck quasi-unipotence for continuous l-adic linear representations of W_E, l≠p, with its finite tame logarithm/exponential consequence after a faithful dual-group embedding. LP1 owns the Weil–Deligne parameter comparison instance.

Consumed by: `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`.

### DeformationAndDerivedPatchingAlgebra:R03.3

Extend complete-intersection algebra to syntomic maps over regular noetherian bases: regular-sequence/dimension/flatness criterion; Sing=Spec Sym H¹(L^∨), representing H⁻¹(L⊗T); Gulliksen finite generation of graded Ext as a coherent Sing-module; Jørgensen/Arinkin–Gaitsgory perfect iff zero-section support and the maximal perfectness locus; smooth pullback compatibility. The parameter instances stay in LP1. The general singular-support extension is a Part II/rescope request, not assumed current R03.3 content.

Consumed by: `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`.

### DerivedDeRhamCohomology:DD.0

Full animated cotangent complex, mapping-stack tangent formula, dualisation and shift conventions, regular-quotient amplitude and base-change/smooth descent; naive H1Cotangent is insufficient.

Consumed by: `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`.

### EnhancedDerivedSheaves:E5:abstract

Small stable infinity-categories with exact monoidal functors, endofunctors, equivariant objects, idempotent completion and coherent finite-set data. Ordinary baseline monoidal functors, equivalences and Karoubi supply only their ordinary shadows.

Consumed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`, `LanglandsParameterStacks:LP4/integral-universal-property`, `LanglandsParameterStacks:LP4/compactly-supported-actions`.

### EnhancedDerivedSheaves:E5:animation

Animated rings, derived affine mapping/zero loci, derived fpqc quotient stacks, QCoh and Perf with pullback/descent on [X/G], reusing SF.1 and S.1/E1; full mapping-stack/classical-truncation comparison and animated free-group resolutions. This is the general derived extension requested by finding27, not new general machinery inside LP1.

Consumed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/sifted-approximation`.

### EnhancedDerivedSheaves:E5:presentability

Ind-completion/compact objects; linear monoidal categories and tensor/module categories; Barr–Beck–Lurie and base change of module categories; sifted left Kan extension on anima, exact Ind–Pro constructions/formal power series and compact bar-resolution arguments. Supply continuous/condensed derived invariants and coefficient base-change so the Weil two-term resolution and good-filtration reduction have actual complexes.

Consumed by: `LanglandsParameterStacks:LP1/local-tate-duality`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/module-comparison`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`, `LanglandsParameterStacks:LP4/integral-universal-property`, `LanglandsParameterStacks:LP4/approximation-all-colimits`, `LanglandsParameterStacks:LP4/integral-free-group-comparison`, `LanglandsParameterStacks:LP4/sifted-approximation`, `LanglandsParameterStacks:LP4/weil-approximation-equivalence`.

### ReductiveGroupsPartII:RG2.5

Existing RG2.5 supplies the integral pinned dual and finite action, semidirect L-group, parabolics/Levis and change of pinning. EXTENSION ROUTE, NOT EXISTING RG2.5 CONTENT: register the proposed RG2.6 independent of LP1 for (1) smooth fixed loci with reductive identity for prime-to-characteristic finite automorphism groups (Prasad–Yu PY02 Thm2.1, and related PY06 Cor5.2 in the confirmed routing); (2) finite unipotent classes in a smooth group with reductive identity (Lusztig/FG12 Cor2.6); (3) ∇λ, Δλ over Z and fields, Kempf vanishing, Donkin criterion, Donkin–Mathieu tensor stability and Koppinen/Donkin O(G) good G×G filtration, finite coherent good-filtration dimension (TvdK); (4) geometric reductivity, finite invariant generation, power lifting after arbitrary base change, unique closed orbit/separation, Hilbert–Mumford–Kempf, Richardson/BMR tuple/minimal-parabolic/finite-anchor criteria in connected and relative-H finite-Q nonconnected forms; (5) BMRT centralizer separability and the very-good root tables; (6) central isogenies, Borel/Bruhat Cartier flags and fixed-root case calculations used by VIII.5.15/5.19; (7) integral highest-weight character lattices for group Chevalley restriction and Procesi trace-word invariant generation in characteristic zero; (8) admissible enhanced complex classical-group L-parameters and their component-group representations for KSS1.20–1.21. No statement here certifies these extensions as already supplied; gap G1 and the rescope proposal record registration and proof obligations.

Consumed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `LanglandsParameterStacks:LP0/wild-enhancement-group`, `LanglandsParameterStacks:LP0/extended-wild-parameters`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/dimension-bound-lemma`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/fixed-fundamental-group`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/separable-centralizers`, `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP3/formal-etale-slice`, `LanglandsParameterStacks:LP3/integral-chevalley-restriction`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property`, `LanglandsParameterStacks:LP4/integral-universal-property`, `LanglandsParameterStacks:LP4/approximation-all-colimits`, `LanglandsParameterStacks:LP4/integral-free-group-comparison`.

### SchemeAndStackFoundations:SF.1

Effective fpqc/fppf descent, algebraic quotient-stack interface and smooth charts, coaction-to-affine-functor equaliser construction. Reuse Mathlib nonabelian Čech cocycles for the descent bridge; they are not continuous group crossed cocycles. LP1 only instantiates these constructions for parameters.

Consumed by: `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/formal-etale-slice`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/compactly-supported-actions`.

### SchemeAndStackFoundations:SF.4

Excellent normalisations and intermediate integral-closure étaleness criterion of BHKT3.12: A excellent normal domain, finite Galois L/K, subgroup H, B integral closure in L^H and C in L; Spec B→Spec A is étale at b below geometric c iff Stab_G(c)⊂H. Also Zariski main theorem, formal completion/deformation functors, smooth transversal lifting and exact equivariant formal-unit rth roots for r invertible. These are extensions in SF.4’s direction; LP3 owns the quotient-slice applications.

Consumed by: `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP3/formal-etale-slice`.

### SchemeKTheoryOperations:S.1

Locally bounded finite-free/perfect complexes, pullback stability, tensor/dual and cone/retract closure on schemes; provide the existing E1-enhanced descent interface to E5 quotient-stack Perf. LP1/LP4 do not own general perfectness.

Consumed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/module-comparison`, `LanglandsParameterStacks:LP4/rational-all-colimits`, `LanglandsParameterStacks:LP4/integral-free-group-comparison`, `LanglandsParameterStacks:LP4/compactly-supported-actions`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The topological local Weil group W_E, degree map, open profinite inertia and finite quotient actions; tame Frobenius normalisation and dense discrete models. Supply the exact topology and compact-inertia coordinate interface used to construct the two-stage continuous cochain model. LP1 owns the resulting Weil cohomology/duality theorem, not a new Weil-group carrier. Baseline AbsoluteGaloisGroup and valuation inertia do not supply this.

Consumed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/local-tate-duality`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`.

### tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality

Hochschild cochains HH(B/A)=RHom_{B⊗^L_A B}(B,B), graded composition, action on Ext(N,N) and the natural map H¹(L^∨)→HH² supplied by forgetting commutativity of square-zero extensions. It is not an identification of all HH²; a smooth two-variable polynomial ring is a counterexample (E4). Request the relative coefficient and full-cotangent bridge as an extension if the upstream Layer8 only supplies the absolute DG version; do not duplicate Hochschild cochains.

Consumed by: `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/bar-criterion`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

Wild inertia P_E as pro-p normal subgroup, cofinal open W_E-normal kernels, tame I_E/P_E and Frobenius action τ↦τ^q, with geometric/arithmetic Frobenius conversion. Existing abstract inertia is not the wild filtration.

Consumed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/finite-wild-ramification`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/local-tate-duality`.

## Ownership proposals

The following seven proposals record edits for the maintainer. This job changes the blueprint deliverables only, so consumer campaign documents and graph edges have not been edited.

Confirmed findings4/16/24/19 require a common, parameter-independent supplier; RG2.6 is proposed in the issue but absent from the current atlas. Add ReductiveGroupsPartII:RG2.6 for the eight explicit extension groups in the RG2.5 routing request, with fixed-group reductivity/unipotent finiteness available before LP1 and highest-weight foundations before LP3 and PA.1. Add RG2.6→LP1, RG2.6→LP3, RG2.6→PA.1. RG2.5 remains pinned-dual/L-group structure; all RG2.6 extension links currently end at recorded gap G1. PA.1 retains GL_n-specific bounds.

Finding26: duplicate integral finite-wild scheme construction. LP1 constructs the single chosen model over Z[1/p] with Z_l base changes and the precise DHKM/FS Frobenius comparison. SR.6 imports LP1 and owns only DHKM1.7/1.8 finiteness/Hecke consequences. Do not claim canonical framed choice independence over Z[1/p].

Findings5/6 and the more specific LP/BunG/VStack instruction give LP the abstract ownership. LP2:excursion-presentation owns VIII.3.7, VIII.4.1–4.2 and all abstract operators/relations; LP2:semisimple-characters owns VIII.4.3. ES0 checks HS1/HS4 categorical data and applies these results; ES1 retains finite-wild Bun_G pieces. LP4 owns VIII.5.1 generation/module comparison, X.1.1–1.2, X.3.1–3.4 and generic X.0.2. ES2/ES3 apply these to compact D_lis(Bun_G), perform W→W_E/P using IX.5.1, compact support and ES1 comparison. This follows the issue’s explicit more specific resolution, rather than the earlier alternative placing the abstract X theorems in ES.

Finding25: local/global duplication of the group-theoretic core. LP2 supplies group-agnostic reconstruction and excursion relations for every Γ→Q, continuity as separate characteristic-zero/discrete clauses. Add excursion-presentation→GS.5 and semisimple-characters→GS.5; GS.5 retains shtuka-specific constructions and its global Galois continuity/application. No dependency from LP into GS.5.

Finding27: general derived quotient/Perf foundations have independent owners. SF.1 owns fpqc descent/ordinary quotient interfaces; S.1 with E1 owns perfectness and pullback; extend E5 animation to derived quotient stacks, QCoh and Perf using both. LP1 owns only the parameter instances and their tangent/singularity calculations.

General syntomic singular-support ingredients extend existing complete-intersection direction. R03.3 (or its Part II) supplies the explicit Gulliksen/Jørgensen/Arinkin–Gaitsgory construction in the request, using DD.0 and DGAInfinity8. LP1 applies it to parameter charts and owns their dual-Lie fibre/nullcone condition.

Finding23 and the old monodromy/continuity placement caused backwards ownership. Unconditional invariants, coarse quotient, closed orbits, all-prime universal homeomorphism and torsion-free continuity belong in excursion-presentation. Integral-invariants has only good-prime isomorphism/cohomology/base change. Move the legacy monodromy comparison to LP1 and the legacy transition/continuity theorem to excursion-presentation, retaining their IDs and changing parentStageId. No LP3 prerequisite for semisimple reconstruction or coarse points.

## Gaps and acceptance of this pass

### LanglandsParameterStacks:G1 — Registration and verification of the RG2.6 extension

RG2.6 is named in the confirmed fix but is not a current or reserved atlas stage. The packet routes its exact eight input groups to the existing RG2.5 owner, explicitly as extensions, and proposes registration; this does not establish the inputs from RG2.5’s current statement. Prasad–Yu, Lusztig/FG, BMRT, TvdK, Procesi and the general highest-weight theorems cited by the six papers were not independently read. Their supplier must supply verified nodes before these chains close.

### LanglandsParameterStacks:G2 — Independence of the full integral excursion algebra

FS after VIII.3.7 proves independence for the l-torsion-free quotient and says it does not know whether removal of torsion is necessary. The full Exc(W,H) at arbitrary bad primes is not claimed choice independent. This is an open source question, not an unread extension theorem.

### LanglandsParameterStacks:G3 — Unrepresented future carriers in suggested signatures

The pinned libraries have no full animated parameter/quotient stack, stable infinity-category Perf/IndPerf, full cotangent or coherent singular-support carrier. The suggested file gives exact algebraic/ordinary prototypes where possible, and explicitly lists unavailable definition/API/test signatures rather than disguising them as true propositions. The supplier requests must settle these carriers and infinity coherence before those signatures can be elaborated in full. The condensed relatively discrete coefficient tensor, algebraic group functor of points/regularity, geometric parabolic families, and admissible complex enhancement carriers are also explicit omissions: the compiled group and GL_n shadows do not assert their full signatures. The shared build lacks the TauCeti.GroupTheory.FixedSubgroup object file; its baseline point checks are recorded without rebuilding the library.

### LanglandsParameterStacks:G4 — Finite-Q positive-characteristic reconstruction extension

BHKT4.5 proves the connected split reductive case; Lafforgue11.7 uses characteristic zero. FS VIII.3.8 asserts the finite-Q all-characteristic reconstruction. This packet spells out its anchor route, but the nonconnected relative-H minimal-parabolic/finite-anchor extension is requested from RG and needs a full independent check. It is not supplied by quoting the characteristic-zero continuity proof.

The suggested file elaborates in the existing pinned Mathlib build with only proof-placeholder warnings. It gives actual algebraic signatures and concrete examples where the carriers exist. Its explicit inventory records every API name and test specification, and every theorem target that cannot yet be given a full enhanced signature. Continuous-group and split GL_n versions are identified as shadows, with the omitted condensed, admissible or geometric conditions named. Missing conditions have not been represented by vacuous proposition fields. The shared build has no object file for the read Tau Ceti fixed-subgroup module, so its two point-compatibility checks are recorded without building that library. This compilation establishes the consistency of the expressed signatures, not their proofs or the omitted enhanced signatures.

The packet validator reports zero errors and warnings. The direct local prerequisite graph is acyclic. Every stage target has a declaration or an explicit supplier/gap endpoint. A follow-up must discharge the supplier contracts, register and verify the reductive extension, independently check G4, and replace the omission inventory with full signatures once the carriers exist. G2 is a source-open problem and must stay visible unless new mathematics settles it.

## Corrections found in the sources

The four findings are scoped to the exact versions and hashes above and have no independent-review verdict in this packet. The reader and node statements use the proposed corrected forms. No message has been sent to the authors.

### LanglandsParameterStacks/E1 — misprint

Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale, Lemma11.10, p.145, public French arXiv PDF read 2026-10-07.

The finding concerns `g ∈ G`. The appended element belongs to H (the reductive group of Proposition11.7), with the specified component, not the global automorphic group G.

Check: Lemma11.10 is inside the proof for an arbitrary H, and its tuple orbit lies in H^{n+1}; G is not this coefficient group.

Effect: nothing. No existing correction was located in the searches recorded in the packet; independent review must confirm the finding.

### LanglandsParameterStacks/E2 — error

G-hat-local systems on smooth projective curves are potentially automorphic, Published Acta223 (2019) §3.1, p.14, paragraph after the very-good table.

The finding concerns `In this case g is a semisimple Lie algebra`. For a general reductive group retain the central torus Lie algebra; do not assert semisimplicity of all g. The subsequent smooth-centralizer statements retain their own hypotheses.

Check: Take G=G_m in characteristic3. There are no simple-factor exclusions, but Lie(G_m) is one-dimensional abelian, so not a nonzero semisimple Lie algebra.

Effect: a stated result. No existing correction was located in the searches recorded in the packet; independent review must confirm the finding.

### LanglandsParameterStacks/E3 — misprint

Geometrization of the local Langlands correspondence, Proof VIII.4.1, p.292, author-hosted 356-page PDF.

The finding concerns `cartesian`. The natural reindexing square of invariant functions and maps to End(id_C) is commutative; the required proof uses commutativity, not a pullback property.

Check: Take C the zero stable category, Q=1, H=G_m, Γ=1, and fold a two-element I onto one-element J. The right rings are zero, while the left rings are Z_l[t,t⁻¹] and Z_l. A pullback square would force these two left rings to be isomorphic, which they are not.

Effect: nothing. No existing correction was located in the searches recorded in the packet; independent review must confirm the finding.

### LanglandsParameterStacks/E4 — error

Geometrization of the local Langlands correspondence, VIII.2.2.1, p.282, author-hosted 356-page PDF; repeated p.283.

The finding concerns `HH²(B/A) = Ext¹_B(L_{B/A}, B)`. Use the natural map Ext¹_B(L_{B/A},B)→HH²(B/A) from commutative to associative square-zero extensions, then the Hochschild action. It is not an equality with all associative Hochschild cohomology, defined in the preceding paragraph as bimodule Ext.

Check: Take A=Q and B=Q[x,y]. The cotangent complex is the free module B dx⊕B dy in degree zero, so Ext¹_B(L,B)=0. Resolve the diagonal B over B⊗_Q B by the two-variable Koszul complex on x⊗1−1⊗x and y⊗1−1⊗y. After Hom(−,B) its differentials vanish, giving HH²(B/Q)≅B, which is nonzero. B is flat and syntomic, so the displayed hypotheses do not repair the equality.

Effect: a stated result. No existing correction was located in the searches recorded in the packet; independent review must confirm the finding.

