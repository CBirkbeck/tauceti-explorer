# Dirichlet p-adic L-functions, special values, and Eisenstein measures, Part II: Ray-class and automorphic interpolation

Roadmap `AutomorphicPadicLFunctions` (atlas title: Ray-class distributions and general automorphic constructions). Following the accepted restructuring RS-14 this roadmap is the Part II of DirichletPadicLFunctions: it starts where the rational Kubota–Leopoldt pseudo-measures, tame-character measures and Eisenstein measures of that roadmap stop, and constructs p-adic L-functions on ray-class limits of general number fields — for GL₂ over any number field (Barrera Salazar–Williams), for totally real fields (Deligne–Ribet), for ordinary CM types (Katz, Hida–Tilouine), for anticyclotomic Rankin–Selberg families (Hsieh), and for unitary groups (Eischen–Harris–Li–Skinner, Disegni–Liu, Eischen–Wan) — in one evaluation formalism.

Ray-class and automorphic interpolation over number fields, as the Part II of DirichletPadicLFunctions fixed by the accepted RS-14. L0 builds the p-power ray-class limit Cl⁺\_F(𝔫p^∞) from Tau Ceti’s finite ray class groups, with the closure of the global units, the dimension r₂ + 1 + δ\_{F,p} (Leopoldt defect), reciprocity, algebraic and p-adic avatars of Hecke characters, Gauss sums and depleted L-functions, locally analytic distributions with descent, evaluation, twist, norm and Euler-factor operations, and the conditional evaluation-and-interpolation principle (existence from norm relations; uniqueness only under a growth theorem). L1 constructs Barrera Salazar–Williams’ automorphic cycles and evaluation maps for GL₂ over any number field and proves their critical-value formula (Theorem 5.7), compared with rational modular symbols. L2 builds overconvergent modular symbols over F, the corrected compactness and slope-vanishing lemmas, the small-slope control theorem (Theorem 8.7), the distribution µ\_Φ with its norm relation and choice-independence, the interpolation Theorem 11.1 with every factor named, growth and uniqueness for F totally real (Bergdall–Hansen, under Leopoldt) or imaginary quadratic (Williams), and the ℚ/Hilbert/Bianchi specialisations. L3 proves Deligne–Ribet (partial zeta distributions, Hilbert Eisenstein series and their constant terms after Dasgupta–Kakde, the irreducibility of the Igusa tower, the p-adic q-expansion principle, the measures and pseudo-measure, group-ring Eisenstein families) and Katz’s ordinary CM construction (p-ordinary CM types, CM points, periods, differential operators and algebraicity, the Eisenstein measure, Theorem (5.3.0), the functional equation, the Hida–Tilouine tame version). L3h plans Hsieh’s anticyclotomic square-root distribution with Theorems A–C and the BDP/Castella–Hsieh specialisation, with a proposed sub-layer L3m for the mod-p nonvanishing inputs (Hida’s linear independence and density, Hida’s and Hsieh’s µ = 0, Hsieh 2012, Finis). L4 plans the EHLS doubling construction (setting, ordinary Hecke algebras and congruence ideals, the three hypotheses, differential operators, Eisenstein measure, global and local zeta integrals, Main Theorem 9.2.2) and Disegni–Liu’s cyclotomic construction (Siegel hermitian varieties, big-cell sections, Panchishkin unramified representations, the p-adic doubling integral, Theorem 3.37, the parity of the vanishing order). L4e plans the Eischen–Wan finite-slope Klingen families with their p-adic L-function and the r = 2 constant-term divisibility. L5 compares normalisations across the constructions, places every construction in the one evaluation formalism, and states the Coates–Perrin-Riou/Panchishkin existence proposition without asserting it.

The statements below are targets for formalisation, written in our own words with theorem, section and page numbers of the sources read. Every definition carries its API and unit tests; every theorem its exact hypotheses, its source and the targets or library declarations it rests on. Nothing here is formalised. The packet `research/blueprint/packets/AutomorphicPadicLFunctions.json` and this document agree node by node.

## Scope and boundaries

- **L0.** Narrowed by RS-14: finite ray groups, complex characters, infinity types and reciprocity are imported from GlobalNumberFields layers 2, 7, 9, 10 and ClassFieldTheory layer 11; character spaces and Mellin transforms from PadicMeasuresIwasawaAlgebras L0a/L1 and LocallyAnalyticDistributions L3. The Leopoldt defect is imported from IntegralIwasawaTheory:L4/leopoldt-defect (RT-AREA-ktheory-2/26).
- **L1.** Narrowed by RS-14: arithmetic quotients, Borel–Serre, Hecke local systems and GL₂ L-functions are imported (ALS.0–ALS.3, AF.3–AF.5, AL.2, GL2 R16.3–R16.5, RT-AREA-iwasawa-1/34 and RT-AREA-automorphic-1/13); the rational critical-value theorem is ModularSymbolsPadicLFunctions:L1’s.
- **L2.** Narrowed by RS-14 (generic Fredholm and slope theory from LocallyAnalyticDistributions L4; rational case from ModularSymbolsPadicLFunctions L2). The seven nodes of the 2026-09-26 checkpoint are kept with their ids and rewritten at target level; the twelve lemma nodes are folded into API items (retiredDraftNodes).
- **L3.** Narrowed by RS-14: rational pseudo-measures and Eisenstein measures from DirichletPadicLFunctions L1/L2/L4, CM theory from ShimuraVarieties V5 and ComplexMultiplicationAndExplicitReciprocity CM.0/CM.4, expansions from AutomorphicBundles B5. Hilbert Igusa inputs come from HodgeTateAndCanonicalSubgroups:T5 and HilbertModularVarietiesAndShimuraCurves H2, not IgusaVarietiesAndTorsionConcentration:IG.1 (RT-AREA-langlands-1/8).
- **L3h.** Kept by RS-14. Contains the proposed sub-layer L3m (mod-p nonvanishing; RT-AREA-iwasawa-1/7) under the node L3h/mod-p-nonvanishing; see restructure.
- **L4.** Narrowed by RS-14: PEL data, compactifications and bundles from PELModuli M5, ShimuraCompactifications C2/C5, AutomorphicBundles B2/B3/B5; IG.1 supplies only special-fibre geometry. Disegni–Liu’s construction is added as routed by PAPER-DISEGNI-LIU-24.
- **L4e.** Kept by RS-14; RT-AREA-iwasawa-1/32 (pairwise distinct Satake characters and temperedness) is in L4e/ew-setting.
- **L5.** Narrowed by RS-14: realisation and criticality data from SelmerIwasawaCohomology:L4; the proposition is exported to ModularIwasawaMainConjectures:L5.

Imports from other roadmaps are cited by node id when a node supplies exactly the statement, and by stage id with a request otherwise (see “Requests to other roadmaps”). Tau Ceti layers are cited as existing work.

## Conventions

- **frobenius.** Artin reciprocity is arithmetically normalised (Tau Ceti ClassFieldTheory layer 11); Hsieh’s geometric rec\_K and Skinner’s geometric convention are converted by inversion at each use.
- **rayClass.** Cl⁺\_F(𝔫p^∞) is the limit of the narrow ray class groups of modulus 𝔫p^m with all real places; the class of the ideal (a) corresponds to a in the ideal description and to a^{-1} under the idelic map u ↦ [u at p].
- **units.** Global units enter through the topological closure of their image in (O\_F ⊗ ℤ\_p)^×; no Leopoldt hypothesis is built into a definition (sourceIssues E4).
- **charts.** Fibre functions use the forward chart φ\_{a\_y}(z) = φ(a\_yz) (sourceIssues E1).
- **embeddings.** ι\_∞ : ℚ̄ → ℂ and ι\_p : ℚ̄ → ℂ\_p are fixed; every interpolation formula names the embedding through which algebraic values are compared, and Disegni–Liu’s formula holds for all ι.
- **uniformisers.** BSW’s U\_𝔭 are normalised by fixed uniformisers π\_𝔭 ∈ L; µ\_Φ depends on them.
- **slopes.** Slope decompositions use the endpoint convention of LocallyAnalyticDistributions §4.16 (roots of valuation ≤ h, equality included).
- **uniqueness.** Choice-independence of a construction is not uniqueness by interpolation; the latter needs a growth theorem in every chart direction.

## Library baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declarations used, each read at the pin:

- `mathlib:Subgroup.topologicalClosure` (def, `Mathlib/Topology/Algebra/Group/Subgroup.lean`): The topological closure of a subgroup of a topological group, itself a subgroup.
- `mathlib:Set.EqOn.closure` (theorem, `Mathlib/Topology/Separation/Hausdorff.lean`): Two continuous maps into a Hausdorff space that agree on a set agree on its closure.
- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` (def, `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`): The ray class group of a modulus: invertible fractional ideals prime to the modulus modulo principal ideals of elements congruent to one.
- `tauceti:TauCeti.GlobalNumberFields.Modulus` (structure, `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean`): A modulus: a nonzero integral ideal (finite part) and a finite set of real places (infinite part).
- `tauceti:TauCeti.GlobalNumberFields.classMap` (def, `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`): The transition homomorphism RayClassGroup 𝔫 → RayClassGroup 𝔪 for 𝔪 ∣ 𝔫.
- `tauceti:TauCeti.GlobalNumberFields.classMap_comp_classMap` (theorem, `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`): Transition maps compose along a tower of moduli.
- `tauceti:TauCeti.GlobalNumberFields.classMap_surjective` (theorem, `TauCeti/NumberTheory/NumberField/Global/RayClass/Exact.lean`): The transition maps between ray class groups are surjective.
- `tauceti:TauCeti.GlobalNumberFields.finite_rayClassGroup` (instance, `TauCeti/NumberTheory/NumberField/Global/RayClass/Finite.lean`): Ray class groups are finite.
- `mathlib:ProfiniteGrp.limit` (abbrev, `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean`): The limit in ProfiniteGrp of a diagram of profinite groups, realised as the compatible families.
- `tauceti:TauCeti.GlobalNumberFields.unitsResidueSignHom` (def, `TauCeti/NumberTheory/NumberField/Global/RayClass/Exact.lean`): The residues modulo the finite part and the signs at the infinite part of the integer units, the first map of the ray class exact sequence.
- `tauceti:TauCeti.GlobalNumberFields.mulExact_unitsCongruenceSubgroup_unitsResidueSignHom` (theorem, `TauCeti/NumberTheory/NumberField/Global/RayClass/Exact.lean`): Exactness at the integer units: the kernel of unitsResidueSignHom is the congruence subgroup of units.
- `mathlib:NumberField.Units.rank` (def, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`): The unit rank card(InfinitePlace K) − 1 = r₁ + r₂ − 1.
- `mathlib:NumberField.Units.finrank_modTorsion` (theorem, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`): Dirichlet’s unit theorem: the units modulo torsion form a free ℤ-module of rank NumberField.Units.rank.
- `mathlib:ContinuousMonoidHom` (structure, `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`): Continuous monoid homomorphisms between topological monoids.
- `mathlib:gaussSum` (def, `Mathlib/NumberTheory/GaussSum.lean`): The Gauss sum Σ\_a χ(a)ψ(a) of a multiplicative and an additive character of a finite commutative ring.
- `mathlib:NumberField.IsCMField` (class, `Mathlib/NumberTheory/NumberField/CMField.lean`): A CM field: totally complex and a quadratic extension of its maximal real subfield.

## L0 — Ray-class character spaces and evaluation

This layer turns Tau Ceti’s finite ray class groups into the p-power ray-class limit on which every p-adic L-function of the roadmap lives. It keeps the closure of the global units (so no Leopoldt hypothesis enters a definition), computes the dimension with the Leopoldt defect, identifies the limit with a Galois group, attaches algebraic and p-adic avatars to Hecke characters, and develops locally analytic distributions on the limit with their descent, evaluation, twist, norm and Euler-factor operations. Its last target is the conditional construction principle: compatible level distributions with a norm relation define one distribution interpolating the given algebraic values; uniqueness needs a separate growth theorem.

Planets of this layer: Ray-class tower of p-power conductor (`L0/ray-class-tower`); p-adic avatar of a Hecke character (`L0/hecke-character-avatar`); Ray-class distributions (`L0/ray-class-distributions`); Conditional evaluation principle (`L0/conditional-evaluation-principle`).

### Continuous unit invariance extends to the closure

`L0/unit-invariance-closure` — lemma.

Let G be a topological group, E ⊆ G a subgroup with topological closure Ē, Y a Hausdorff space and φ : G → Y continuous. If φ(ez) = φ(z) for every e ∈ E and z ∈ G, then φ(ez) = φ(z) for every e ∈ Ē and z ∈ G. In particular a continuous function on (O\_F ⊗ ℤ\_p)^× invariant under the totally positive global units congruent to 1 modulo f is invariant under their closure, and so factors through the quotient by that closure.

*Hypotheses.* G is a topological group (continuous multiplication suffices); Y is Hausdorff. No compactness, rank computation or Leopoldt hypothesis is used.

*Proof or construction.*

1. Fix z ∈ G. The two maps e ↦ φ(ez) and e ↦ φ(z) are continuous on G and agree on E.
2. Equality of continuous maps into a Hausdorff space on a set extends to its closure (Set.EqOn.closure); quantify over z.

*Acceptance.* Applied to G = (ℤ\_p)^× ⊃ E = {±1}·(1+pℤ)^ℤ-type examples, it is exactly the statement that the locally constant functions on the ray-class limit are the unit-invariant ones; it says nothing about locally analytic descent, which ray-class-distributions proves.

*Rests on.* `mathlib:Subgroup.topologicalClosure`, `mathlib:Set.EqOn.closure`.

*Sources.* BSW-2017-v3, §9.2.2, p. 31: BSW regard a function on the ray-class group as a family of functions on (O\_F ⊗ ℤ\_p)^× invariant under the global units E(f); continuity makes this invariance pass to the closure that the ray-class quotient actually divides by. KATZ-1978, (5.4.5)–(5.4.6), p. 275: Katz identifies Gal(L(p^∞)/L(1)) with (O\_L ⊗ ℤ\_p)^× modulo the closure of the global units, which is the quotient this lemma serves.

### The ray-class tower of p-power conductor and fixed tame modulus

`L0/ray-class-tower` — construction.

Let F be a number field, p a rational prime and 𝔫 an integral ideal of O\_F prime to p. For m ≥ 0 let 𝔪\_m be the Tau Ceti modulus with finite part 𝔫·p^m O\_F and infinite part all real places, and Cl⁺\_F(𝔫p^m) := RayClassGroup(𝔪\_m), the narrow ray class group. The transition maps classMap(𝔪\_m ∣ 𝔪\_{m'}) for m ≤ m′ form an inverse system of finite groups with surjective transition maps, and Cl⁺\_F(𝔫p^∞) := lim\_m Cl⁺\_F(𝔫p^m) is a profinite abelian group (the limit in ProfiniteGrp of the finite discrete groups). For a modulus f dividing 𝔫p^∞ the projection Cl⁺\_F(𝔫p^∞) → Cl⁺\_F(f) is continuous and surjective, and for 𝔫 ∣ 𝔫′ (both prime to p) the tame change map Cl⁺\_F(𝔫′p^∞) → Cl⁺\_F(𝔫p^∞) is the limit of the classMap’s.

*Hypotheses.* F a number field, p a prime, 𝔫 ≠ 0 an integral ideal prime to p. The narrow (all real places) modulus is used, as in BSW and Katz; the wide version is the quotient by the image of the signs and is recovered by taking the infinite part empty.

*Proof or construction.*

1. Instantiate RayClassGroup at 𝔪\_m; finiteness is finite\_rayClassGroup, transitions are classMap with classMap\_comp\_classMap, surjectivity is classMap\_surjective.
2. Form the limit with ProfiniteGrp.limit over the directed set ℕ; each finite group carries the discrete topology.
3. Surjectivity of the projections follows from surjective transitions in a countable inverse system of finite sets (compactness of the limit).
4. Tame change: classMap(𝔪\_m(𝔫) ∣ 𝔪\_m(𝔫′)) commutes with the transitions, so it passes to the limit.

*Uses.* BSW §9.2, pp. 30–31: the domain of the distribution µ\_Ψ; DR-1980 §0, p. 231: the group G on which the measures µ\_{c,k} live; KATZ-1978 (5.4.2)–(5.4.6), p. 275: Gal(L(p^∞)/L) for the Katz measure; GrossZagierAndArithmeticHeights:GZ.9: the anticyclotomic quotients Γ̃ → Γ of a ray-class limit for the BDP measure.

*API.*

- `RayClassTower.limit` (constructor): Cl⁺\_F(𝔫p^∞) as an object of ProfiniteGrp, with its commutative group structure.
- `RayClassTower.proj` (projection): The continuous surjection Cl⁺\_F(𝔫p^∞) → RayClassGroup(𝔪\_m) for each m, compatible with classMap.
- `RayClassTower.proj_surjective` (characterisation): Each projection is surjective.
- `RayClassTower.ext` (extensionality): Two elements are equal iff all their projections agree.
- `RayClassTower.tameChange` (functoriality): For 𝔫 ∣ 𝔫′ prime to p, the continuous surjection Cl⁺\_F(𝔫′p^∞) → Cl⁺\_F(𝔫p^∞), with tameChange\_id and tameChange\_comp.
- `RayClassTower.isOpen_ker_proj` (instance): The kernels of the projections form a basis of open neighbourhoods of 1.
- `RayClassTower.compactSpace` (instance): Cl⁺\_F(𝔫p^∞) is compact, Hausdorff and totally disconnected.

*Unit tests.*

- `rayClassTower_rat_one` (computation): For F = ℚ, 𝔫 = (1), p = 5: the level-5² group has order 20 = φ(25) and the limit is ℤ\_5^×.
- `rayClassTower_level_zero` (degenerate): At m = 0 the projection lands in Cl⁺\_F(𝔫); for 𝔫 = (1) this is the narrow class group (trivial for F = ℚ, of order 2 for F = ℚ(√3)).
- `rayClassTower_tameChange_comp` (compatibility): tameChange for (1) ∣ 𝔫 ∣ 𝔫′ is the composite of the two tame changes, as classMap\_comp\_classMap gives at each level.
- `rayClassTower_not_full_units` (non-example): For F real quadratic and 𝔫 = (1), the limit is not (O\_F ⊗ ℤ\_p)^×: the quotient by the closure of the infinite unit group has smaller ℤ\_p-rank.

*Acceptance.* For F = ℚ, 𝔫 = (1): Cl⁺\_ℚ(p^∞) ≅ ℤ\_p^×; the class of the ideal (a), a > 0 prime to p, corresponds to a under the ideal-theoretic description of each level and to a^{-1} under the idelic map u ↦ [u at p], a convention every comparison must track. For F imaginary quadratic of class number 1 with p split: Cl⁺\_F(p^∞) ≅ (O\_F ⊗ ℤ\_p)^× / O\_F^×, of ℤ\_p-rank 2.

*Rests on.* `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`, `tauceti:TauCeti.GlobalNumberFields.Modulus`, `tauceti:TauCeti.GlobalNumberFields.classMap`, `tauceti:TauCeti.GlobalNumberFields.classMap_comp_classMap`, `tauceti:TauCeti.GlobalNumberFields.classMap_surjective`, `tauceti:TauCeti.GlobalNumberFields.finite_rayClassGroup`, `mathlib:ProfiniteGrp.limit`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`.

*Sources.* BSW-2017-v3, §1.1 p. 5 (narrow ray class group modulo f) and §1.2.2 p. 6 (Cl⁺\_F(p^∞) as F^×\\A\_F^×/U(p^∞)F\_∞⁺): BSW define the narrow ray class groups and the p-power limit group on which their p-adic L-function lives. DR-1980, §0, p. 230: Deligne–Ribet take G to be the ray class group of conductor f·p^∞, the Galois group of the maximal abelian extension unramified outside fp and the infinite places. PAN-1994, §4.1, pp. 999–1000: Panchishkin writes Gal\_p as the projective limit over moduli supported at p of the narrow ray class groups J(m)/P(m).

### The unit-closure exact sequence of the ray-class limit

`L0/ray-class-unit-sequence` — theorem.

With 𝔫 prime to p, let E\_+(𝔫) be the group of totally positive units of O\_F congruent to 1 modulo 𝔫, embedded diagonally in U\_p := (O\_F ⊗ ℤ\_p)^×, and let Ē\_+(𝔫) be the topological closure of its image. There is an exact sequence of profinite groups 1 → Ē\_+(𝔫) → U\_p → Cl⁺\_F(𝔫p^∞) → Cl⁺\_F(𝔫) → 1, where the middle map sends a p-adic unit to the class of the idele that is it at p and 1 elsewhere. The closure is essential: with the bare image E\_+(𝔫) the kernel would not be closed when the unit rank is positive. Choosing representatives a\_y for Cl⁺\_F(𝔫f) (f ∣ p^∞, f divisible by every prime above p) gives the homeomorphism Cl⁺\_F(𝔫p^∞) ≅ ⊔\_{y∈Cl⁺\_F(𝔫f)} G\_y, G\_y the fibre over y, with each G\_y ≅ {z ∈ U\_p : z ≡ 1 mod f}/Ē\_+(𝔫f) by multiplication by a\_y^{-1}; for 𝔫 = (1) this is BSW’s decomposition over Cl⁺\_F(f).

*Hypotheses.* 𝔫 prime to p; totally positive units; the closure is taken in the p-adic topology of U\_p.

*Proof or construction.*

1. At each finite level the Tau Ceti exact sequence O\_F^× → (O\_F/𝔫p^m)^× × signs → Cl\_F(𝔫p^m) → Cl\_F → 1 (mulExact\_unitsResidueSignHom\_residueSignRayClass, mulExact\_residueSignRayClass\_rayClassToClassGroup) restricts on totally positive units to E\_+(𝔫) → (O\_F/𝔫p^m)^× → Cl⁺\_F(𝔫p^m) → Cl⁺\_F(𝔫) → 1 after quotienting the tame part.
2. Pass to the inverse limit over m: the terms are finite, so the limit of the exact sequences is exact; the limit of the images of E\_+(𝔫) is the closure of its image in U\_p (an inverse limit of finite images is closed and contains E\_+ densely).
3. The decomposition into fibres G\_y follows by fixing the image in Cl⁺\_F(𝔫f) and translating by a\_y^{-1}; the kernel of {z ≡ 1 mod f} → Cl⁺\_F(𝔫p^∞) is Ē\_+(𝔫) ∩ (1 + f) = Ē\_+(𝔫f), the closure meeting the open subgroup 1 + f in the closure of E\_+(𝔫f).

*Acceptance.* F = ℚ: Ē\_+ is trivial (the only totally positive unit is 1) and the sequence reads 1 → ℤ\_p^× → Cl⁺(p^∞) → 1. F real quadratic: Ē\_+ has ℤ\_p-rank 1, because F is abelian and so satisfies Leopoldt at every p (IntegralIwasawaTheory:L4/abelian-leopoldt); the quotient U\_p/Ē\_+ then has ℤ\_p-rank 1.

*Rests on.* `L0/ray-class-tower`, `tauceti:TauCeti.GlobalNumberFields.unitsResidueSignHom`, `tauceti:TauCeti.GlobalNumberFields.mulExact_unitsCongruenceSubgroup_unitsResidueSignHom`, `mathlib:Subgroup.topologicalClosure`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

*Sources.* BSW-2017-v3, §9.2.1, p. 30: BSW pass to the limit of the exact sequences O\_{F,+}^× → (O\_F/f)^× → Cl⁺\_F(f) → Cl⁺\_F → 0 and decompose Cl⁺\_F(p^∞) into the fibres G\_y over Cl⁺\_F(f) (equation (11)); see sourceIssues E4 for the closure. KATZ-1978, (5.4.2)–(5.4.6), p. 275: Katz identifies the kernel to the Hilbert class field with (O\_L ⊗ ℤ\_p)^× modulo the closure of E(L). PAN-1994, §4.1, p. 1000: Panchishkin's exact sequence for Gal\_p uses O\_p^× divided by the closure of the totally positive units.

### Dimension of the ray-class limit and the Leopoldt defect

`L0/leopoldt-dimension-formula` — theorem.

Cl⁺\_F(𝔫p^∞) is a compact commutative p-adic analytic group: it has an open subgroup topologically isomorphic to ℤ\_p^d, and its torsion subgroup Δ is finite. Its dimension is d = r₂ + 1 + δ\_{F,p}, where r₂ is the number of complex places and δ\_{F,p} is the Leopoldt defect of F at p (the dimension of the kernel of the p-adic logarithm on O\_F^× ⊗ ℚ\_p, IntegralIwasawaTheory:L4/leopoldt-defect). Equivalently, the ℤ\_p-rank of Ē\_+(𝔫) equals r₁ + r₂ − 1 − δ\_{F,p}. A chart Cl⁺\_F(𝔫p^∞) ≅ Δ × ℤ\_p^d (after choosing a splitting of the finite part) makes it an analytic group in the sense of LocallyAnalyticDistributions:L0/analytic-manifold-atlases, and every continuous character factors through the chart.

*Hypotheses.* No Leopoldt hypothesis is assumed; δ\_{F,p} ≥ 0 is part of the formula. The splitting Δ × ℤ\_p^d is a choice; statements that depend on it say so.

*Proof or construction.*

1. U\_p = (O\_F ⊗ ℤ\_p)^× has an open subgroup isomorphic to ℤ\_p^{[F:ℚ]} through the p-adic logarithm on a small principal-unit subgroup; [F:ℚ] = r₁ + 2r₂.
2. By Dirichlet's unit theorem (NumberField.Units.rank, finrank\_modTorsion) E\_+(𝔫) has ℤ-rank r₁ + r₂ − 1, and the ℤ\_p-rank of its closure is r₁ + r₂ − 1 − δ\_{F,p} by the definition of the defect (the logarithm of the closure spans the image of O\_F^× ⊗ ℚ\_p).
3. From ray-class-unit-sequence the dimension is [F:ℚ] − rank Ē\_+ = r₂ + 1 + δ\_{F,p}; the finite quotient Cl⁺\_F(𝔫) and the torsion of U\_p/Ē\_+ give the finite part Δ.
4. A compact commutative p-adic analytic group splits non-canonically as Δ × ℤ\_p^d.

*Acceptance.* F = ℚ: d = 1 (Δ = (ℤ/p)^× for p odd). F imaginary quadratic: d = 2 (r₂ = 1, no units of infinite order). F totally real satisfying Leopoldt at p: d = 1; abelian F satisfies Leopoldt (IntegralIwasawaTheory:L4/abelian-leopoldt). BSW's example F = ℚ(∛2): the units have rank 1, U\_p has rank 3, and d = 2 (the defect vanishes here: the unit rank is 1 and the p-adic logarithm of a unit of infinite order is nonzero), so ray-class distributions grow in two directions while the critical Hecke characters are only parallel.

*Rests on.* `L0/ray-class-unit-sequence`, `IntegralIwasawaTheory:L4/leopoldt-defect`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.Units.finrank_modTorsion`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`.

*Sources.* BSW-2017-v3, §12, p. 39: BSW explain that the quotient by the units has ℤ\_p-rank [F:ℚ] minus the unit rank when the units embed with full rank, and treat F = ℚ(∛2) as an example of rank 2. BH-2017, §1.8, p. 11; §6, p. 48: Bergdall–Hansen note that Leopoldt’s conjecture makes Γ\_F one-dimensional for F totally real and use the Leopoldt defect in the dimension of the character space.

### Reciprocity for the ray-class limit

`L0/ray-class-reciprocity` — theorem.

Global Artin reciprocity, with Tau Ceti’s arithmetic Frobenius normalisation, gives a topological isomorphism Art : Cl⁺\_F(𝔫p^∞) ≅ Gal(F(𝔫p^∞)/F), where F(𝔫p^∞) is the maximal abelian extension of F unramified outside the primes dividing 𝔫p and the infinite places; the class of a prime 𝔮 ∤ 𝔫p maps to its arithmetic Frobenius. It is compatible with the finite-level maps Cl⁺\_F(𝔫p^m) ≅ Gal(F(𝔫p^m)/F), with the tame change maps (restriction of Galois groups) and, for F ⊂ F′, with the norm/transfer maps. Hsieh’s geometrically normalised reciprocity rec\_K is the composite of Art with inversion; every statement exported from this layer names its normalisation.

*Hypotheses.* Arithmetic Frobenius convention of tauceti:ClassFieldTheory layer 11. Conversions to geometric conventions (Hsieh 2014; Skinner) are by inversion and are recorded at each use.

*Proof or construction.*

1. At each finite level apply global Artin reciprocity for the ray class field of conductor 𝔪\_m (ClassFieldTheory layer 11).
2. Compatibility of the finite-level isomorphisms with classMap and with restriction of Galois groups is functoriality of the Artin map in the modulus.
3. Pass to the inverse limit; both sides are profinite and the maps are continuous isomorphisms of compact Hausdorff groups.

*Acceptance.* For F = ℚ, 𝔫 = (1): Art identifies ℤ\_p^× with Gal(ℚ(μ\_{p^∞})/ℚ), the class of a prime ℓ ≠ p mapping to Frob\_ℓ, which acts on μ\_{p^∞} by ζ ↦ ζ^ℓ. With Hsieh’s geometric normalisation the same prime class maps to Frob\_ℓ^{-1}.

*Rests on.* `L0/ray-class-tower`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`.

*Sources.* BSW-2017-v3, §1.2.2, p. 6: By class field theory Cl⁺\_F(p^∞) is the Galois group of the maximal abelian extension unramified outside p and ∞. HSIEH-2014, Introduction, p. 711: Hsieh uses the geometrically normalised reciprocity law rec\_K to define p-adic avatars and locally algebraic characters. DR-1980, §0, p. 230: Deligne–Ribet identify the ray class group of conductor fp^∞ with the Galois group of the maximal abelian extension unramified at finite places prime to fp.

### Algebraic and p-adic avatars of Hecke characters

`L0/hecke-character-avatar` — construction.

Fix embeddings ι\_∞ : ℚ̄ → ℂ and ι\_p : ℚ̄ → ℂ\_p. Let ϕ be an algebraic (arithmetic) Hecke character of F of conductor dividing 𝔫p^∞ and infinity type r ∈ ℤ[Σ] (Σ the complex embeddings), so that ϕ\_∞(z) = ε\_ϕ(z)·z^r with ε\_ϕ the sign character of {±1}^{Σ(ℝ)} defined by ε\_ϕ(ι) = ϕ\_∞(ι)ι^r. Let w\_r : F^× → ℚ̄^× be w\_r(γ) = ∏\_σ σ(γ)^{r\_σ}, with its p-adic extension w\_r^p on (F ⊗ ℚ\_p)^×. The p-adic avatar is ϕ\_{p-fin}(x) = ε\_ϕ(x)ϕ\_f(x)w\_r^p(x\_p) on A\_F^×; it is trivial on F^×, on F\_∞⁺ and on U(𝔫p^∞), hence a continuous character Cl⁺\_F(𝔫p^∞) → ℂ\_p^× that is locally algebraic of weight r. The algebraic avatar is the ℚ̄-valued character a ↦ ι\_∞^{-1}(ϕ(a)) on ideals prime to 𝔫p. Through ray-class-reciprocity, ϕ\_{p-fin} is a Galois character; its local factors are ϕ(𝔮) := ϕ(π\_𝔮) at 𝔮 ∤ 𝔫p (0 at ramified primes), giving the Euler factors (1 − ϕ(𝔮)N𝔮^{-s})^{-1}.

*Hypotheses.* ϕ is arithmetic: its infinity type r is an admissible type (Weil); its finite part takes values in a number field. Embeddings ι\_∞, ι\_p are fixed once and for all and recorded in every interpolation formula.

*Proof or construction.*

1. Use the complex Hecke characters, their local components, conductors and infinity types of GlobalNumberFields layers 9–10.
2. Algebraicity of the finite part (Weil) lets ϕ\_f be read in ℚ̄ and then in ℂ\_p via ι\_p.
3. Check the three trivialities (on F^×: ϕ\_{p-fin}(γ) = ϕ(γ)/w\_r^∞(γ)·w\_r^p(γ) = 1 since ϕ is trivial on F^× and both w’s come from w\_r; on F\_∞⁺ by construction; on U(𝔫p^∞) since x\_p = x\_∞ = 1 and ϕ has conductor dividing 𝔫p^∞).
4. Continuity: ϕ\_f is locally constant and w\_r^p is continuous.

*Uses.* BSW Theorem 11.1, p. 38: evaluation of the distribution µ\_Ψ at ϕ\_{p-fin}; KATZ-1978 (5.3.4): the p-adic character χ\_p of an A₀-grossencharacter; HSIEH-2014 p. 711: critical specialisations X\_p^crit as p-adic avatars; GrossZagierAndArithmeticHeights:GZ.9: p-adic and algebraic avatars of anticyclotomic characters with auxiliary ψ.

*API.*

- `HeckeCharacter.pAdicAvatar` (constructor): ϕ ↦ ϕ\_{p-fin} : Cl⁺\_F(𝔫p^∞) →\* ℂ\_p^× (continuous).
- `HeckeCharacter.pAdicAvatar_mul` (simp): (ϕψ)\_{p-fin} = ϕ\_{p-fin}·ψ\_{p-fin}, with infinity types adding.
- `HeckeCharacter.pAdicAvatar_finiteOrder` (compatibility): For ϕ of finite order, ϕ\_{p-fin} = ι\_p ∘ ι\_∞^{-1} ∘ ϕ.
- `HeckeCharacter.pAdicAvatar_isLocallyAlgebraic` (characterisation): ϕ\_{p-fin} agrees with z ↦ z^r on an open subgroup of the image of U\_p.
- `HeckeCharacter.pAdicAvatar_frob` (compatibility): ϕ\_{p-fin}(Art(𝔮)) = ι\_p ι\_∞^{-1}(ϕ(𝔮)) for 𝔮 ∤ 𝔫p, in the arithmetic normalisation.
- `HeckeCharacter.algebraicAvatar` (data): The ℚ̄-valued character on ideals prime to 𝔫p and the number field Q(ϕ) it generates.
- `HeckeCharacter.signCharacter` (projection): ε\_ϕ : {±1}^{Σ(ℝ)} → {±1}, with ε\_{ϕ|·|} = −ε\_ϕ at every real place.

*Unit tests.*

- `pAdicAvatar_trivial` (degenerate): The trivial character has trivial avatar.
- `pAdicAvatar_norm_rat` (computation): For F = ℚ and ϕ = |·|^{-1}: ϕ\_{p-fin}(ℓ) = ℓ for every prime ℓ ≠ p, i.e. the cyclotomic character, and ε\_ϕ(−1) = −1 although ϕ takes positive values.
- `pAdicAvatar_dirichlet` (compatibility): For F = ℚ and a primitive Dirichlet character χ of p-power conductor (finite order), the avatar read through the ideal-theoretic identification Cl⁺\_ℚ(p^∞) ≅ lim (ℤ/p^m)^× of ray-class-tower is Mathlib’s DirichletCharacter χ composed with ι\_p; under the idelic map u ↦ [u at p] it is χ^{-1}.
- `pAdicAvatar_not_complex` (non-example): For infinity type r ≠ 0, ϕ\_{p-fin} is not ι\_p ∘ ϕ\_f: the factor w\_r^p(x\_p) is needed, and omitting it gives a function that is not trivial on F^×.

*Acceptance.* The avatar of a finite-order character is the same character read through ι\_p. For F = ℚ and ϕ = |·|^{-1} (infinity type −1), the avatar sends the class of a prime ℓ ≠ p to ℓ and a unit u at p to u^{-1}: it is the p-adic cyclotomic character composed with the arithmetic Artin map.

*Rests on.* `L0/ray-class-tower`, `L0/ray-class-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `mathlib:ContinuousMonoidHom`.

*Sources.* BSW-2017-v3, §1.2.1–1.2.2, Definition 1.3 and Proposition 1.4, pp. 6–7: BSW define ε\_ϕ, the algebraic character w\_r and the p-adic avatar ϕ\_{p-fin}, and prove it descends to Cl⁺\_F(p^∞). HSIEH-2014, Introduction, p. 711: Hsieh defines the Hecke character attached to a locally algebraic p-adic character of the anticyclotomic group (the p-adic avatar in the opposite direction). DKV-2018, §1, p. 2: Dasgupta–Kakde–Ventullo use the Euler factors χ(𝔭) at primes above p and the Teichmüller twist in the interpolation of L\_p(χω, s).

### Locally algebraic characters of the ray-class limit are avatars

`L0/locally-algebraic-characters` — theorem.

The map ϕ ↦ ϕ\_{p-fin} is a bijection from algebraic Hecke characters of F of conductor dividing 𝔫p^∞ (with values read through ι\_∞) onto continuous characters χ : Cl⁺\_F(𝔫p^∞) → ℂ\_p^× that are locally algebraic, i.e. agree with z ↦ z^r for some r ∈ ℤ[Σ] on an open subgroup of the image of U\_p. The weight r must lie in Weil’s set Ξ of admissible infinity types: r + c·r parallel (c complex conjugation) is necessary but not sufficient in general, and when F has a real place only parallel r occur; conversely every r ∈ Ξ occurs (Weil; BSW Proposition 1.2).

*Hypotheses.* Embeddings fixed as in hecke-character-avatar.

*Proof or construction.*

1. Injectivity: ϕ is recovered from ϕ\_{p-fin} by restoring ε\_ϕ and w\_r^∞ (the formula in hecke-character-avatar is invertible).
2. Surjectivity: given χ locally algebraic of weight r, the idele character x ↦ χ(x)·w\_r^p(x\_p)^{-1}·w\_r^∞(x\_∞) is continuous and trivial on F^× (both w’s restrict to w\_r on F^×), with algebraic values by the standard argument (it is locally constant on the finite ideles, and the finitely many class representatives have powers in F^×·U). Since χ is trivial on the image of the units while equal to z^r near 1, w\_r is trivial on a finite-index subgroup of O\_F^×, which is Weil’s admissibility condition on r.
3. Admissibility of r is Weil’s criterion, quoted by BSW as Proposition 1.2 with the description of the admissible set Ξ from Hida’s book.

*Acceptance.* F totally real: only parallel weights occur, so every locally algebraic character is a finite-order character times a power of the cyclotomic character. F imaginary quadratic: every (r₁, r₂) ∈ ℤ² is admissible.

*Rests on.* `L0/hecke-character-avatar`, `L0/ray-class-unit-sequence`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

*Sources.* BSW-2017-v3, §1.2.1, Definition 1.1 and Proposition 1.2, p. 6: BSW recall Weil’s theorem that r is an infinity type iff r lies in the admissible set Ξ, where r + cr parallel is necessary, and note that only parallel types occur when F has a real place. HSIEH-2014, Introduction, p. 711: Hsieh defines locally algebraic p-adic characters of weight (k₁, k₂) through rec\_K and attaches Hecke characters to them.

### Gauss sums and p-depleted Hecke L-functions

`L0/gauss-sum-and-depleted-l-function` — definition.

For a Hecke character ϕ of conductor f and a finite idele d representing the different, τ(ϕ) := ϕ(d^{-1}) Σ\_{b ∈ (O\_F/f)^×} ϕ\_f(b) e\_F(b d^{-1}(π\_f^{-1})\_{v|f}), where e\_F : A\_F/F → ℂ^× is the standard additive character (e^{2πi Tr} at infinity, e\_ℓ(−Tr) at finite places) and (π\_f^{-1})\_{v|f} has components π\_w^{-v\_w(f)} at w | f and 0 elsewhere; it is independent of d and equals the product of Deligne’s local ε-factors at the places dividing f. For a set S of finite places, the S-depleted L-function is L^{(S)}(ϕ, s) := L(ϕ, s)·∏\_{𝔮∈S}(1 − ϕ(𝔮)N𝔮^{-s}), and L\*(ϕ, s) := L^{(S\_p)}(ϕ, s) with S\_p the primes above p.

*Hypotheses.* L(ϕ, s) is the complex Hecke L-function with its meromorphic continuation (AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation). ϕ(𝔮) = 0 at primes dividing the conductor, so depletion at such 𝔮 changes nothing.

*Proof or construction.*

1. τ(ϕ) is a finite sum; independence of d is the standard change of variables b ↦ bu with u a unit at f.
2. Its factorisation into local ε-factors is AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum with AL.1/explicit-epsilon-factors.
3. The depleted L-function is a product of the continued L(ϕ, s) with finitely many entire factors.

*Uses.* BSW Theorems 4.6, 5.7 and 11.1: the Gauss factor τ(ϕ) in the critical-value and interpolation formulas; DKV-2018 (2), p. 2: L\_p(χω, n) = L\*(χω^n, n) for n ≤ 0; DR-1980 p. 230: L-values of functions on G\_f with Euler factors at fp removed; RankZeroOneBSD:BSD.7a: primitive versus imprimitive Euler factors.

*API.*

- `HeckeCharacter.gaussSum` (constructor): τ(ϕ) ∈ ℂ for ϕ of conductor f.
- `HeckeCharacter.gaussSum_eq_prod_epsilon` (compatibility): τ(ϕ) = ∏\_{v|f} ε-factor of ϕ\_v at s = 0 in AL.1’s normalisation.
- `HeckeCharacter.gaussSum_twisted_sum` (relation): BSW Proposition 1.7: the ζ-twisted sum equals ϕ\_f(ζ)^{-1}τ(ϕ) if ((ζ), f) = 1 and 0 otherwise.
- `HeckeCharacter.depletedLFunction` (constructor): L^{(S)}(ϕ, s) for a finite set S of finite places.
- `HeckeCharacter.depletedLFunction_eq` (simp): L^{(S)}(ϕ, s) = L(ϕ, s)∏\_{𝔮∈S}(1 − ϕ(𝔮)N𝔮^{-s}).
- `HeckeCharacter.depletedLFunction_union` (relation): Depleting at S ∪ S′ (disjoint) is depleting at S then at S′.

*Unit tests.*

- `gaussSum_trivial` (degenerate): τ(1) = 1 for the trivial character of conductor (1).
- `gaussSum_rat_compat` (compatibility): For F = ℚ and the primitive character of conductor 5 sending 2 ↦ i, τ(ϕ) equals Mathlib’s gaussSum with the additive character fixed by e\_5(−·), and has absolute value √5.
- `depleted_rat_zeta` (computation): For F = ℚ, ϕ = 1, S = {p}: L\*(1, s) = ζ(s)(1 − p^{-s}), so L\*(1, −1) = −(1 − p)/12.
- `depleted_not_conductor` (non-example): Depleting at a prime dividing the conductor of ϕ does not change L(ϕ, s); a definition that inserted (1 − N𝔮^{-s}) there fails the test with ϕ of conductor p.

*Acceptance.* The Gauss sum of the trivial character of conductor (1) is 1. For F = ℚ and a primitive Dirichlet character χ mod f, τ(χ) agrees with Mathlib’s gaussSum of χ with the additive character a ↦ e^{2πia/f} up to the sign convention of e\_ℓ(−Tr), which BSW fix explicitly.

*Rests on.* `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum`, `AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `mathlib:gaussSum`.

*Sources.* BSW-2017-v3, §1.2.3, Definitions 1.5–1.6 and Proposition 1.7, pp. 7–8: BSW define e\_F, the Gauss sum τ(ϕ) with the explicit adelic representative, note its independence of d and its relation with Deligne’s ε-factors, and give the twisted-sum identity of Proposition 1.7. DKV-2018, §1, p. 2: Dasgupta–Kakde–Ventullo define L\*(χ, s) as L(χ, s) with the Euler factors at the primes above p removed.

### Nonvanishing of L(χ, 0) for totally odd characters

`L0/odd-character-l-zero-nonvanishing` — theorem.

Let F be totally real and χ a totally odd finite-order Hecke character (ray class character) of F. Then L(χ, 0) ≠ 0, and L\*(χ, 0) = L(χ, 0)∏\_{𝔭|p}(1 − χ(𝔭)) vanishes exactly when χ(𝔭) = 1 for some 𝔭 | p.

*Hypotheses.* F totally real; χ of finite order with χ\_v(−1) = −1 at every real place v.

*Proof or construction.*

1. The functional equation (AL.1/hecke-l-functional-equation) relates L(χ, 0) to L(χ̄, 1) times Γ-factors; for χ totally odd the archimedean factors are Γ\_ℝ(s+1) at each real place, which have no pole or zero at s = 0, and the ε-factor is nonzero.
2. L(χ̄, 1) ≠ 0 for a nontrivial finite-order Hecke character (nonvanishing on Re s = 1, AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one).
3. The statement about L\* is the definition of depletion.

*Acceptance.* F = ℚ, χ odd Dirichlet: L(χ, 0) = −B\_{1,χ} ≠ 0. DKV’s trivial zeros: L\*(χ, 0) = 0 iff some prime above p splits completely in the field cut out by χ, so r\_p(χ) counts those primes.

*Rests on.* `L0/gauss-sum-and-depleted-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`.

*Sources.* DKV-2018, §1, pp. 2–3: Dasgupta–Kakde–Ventullo note that L(χ, 0) ≠ 0 because χ is totally odd and write L\_p(χω, 0) = L\*(χ, 0) = L(χ, 0)∏\_{𝔭|p}(1 − χ(𝔭)).

### Locally analytic distributions on the ray-class limit and their descent

`L0/ray-class-distributions` — definition.

Let L ⊂ ℂ\_p be a complete extension of ℚ\_p. D(Cl⁺\_F(𝔫p^∞), L) is the strong dual of the space A(Cl⁺\_F(𝔫p^∞), L) of locally analytic L-valued functions, for the analytic structure of leopoldt-dimension-formula: the distributions on a compact analytic manifold of LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear, a nuclear Fréchet space. Measures (bounded distributions) form the subalgebra identified with the completed group algebra (PadicMeasuresIwasawaAlgebras:L1). For f ∣ p^∞ divisible by every prime above p and representatives a\_y of Cl⁺\_F(𝔫f), a function φ on Cl⁺\_F(𝔫p^∞) is the same as the family φ\_{a\_y}(z) := φ(a\_y z) of functions on {z ∈ U\_p : z ≡ 1 mod f} invariant under Ē\_+(𝔫f) (forward chart; see sourceIssues E1); a distribution is determined by its values on the clopen pieces G\_y. The Mellin transform identifies D(Cl⁺\_F(𝔫p^∞), L) with the ring of rigid analytic functions on the character space (LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism), measures corresponding to the bounded functions.

*Hypotheses.* L contains the values needed (the images of the embeddings of F and the character values); the analytic structure comes from the chart Δ × ℤ\_p^d, and the space does not depend on the chart.

*Proof or construction.*

1. Transport the definitions of LocallyAnalyticDistributions L0 along the analytic chart of leopoldt-dimension-formula.
2. Descent: precomposition with the open map U\_p → G\_y ⊂ Cl⁺\_F(𝔫p^∞) identifies locally analytic functions on G\_y with Ē\_+-invariant locally analytic functions on the congruence subgroup; by unit-invariance-closure, invariance under E\_+(𝔫f) suffices.
3. Clopen decomposition of distributions along Cl⁺\_F(𝔫p^∞) = ⊔ G\_y (PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence for measures, the same argument for distributions).
4. Mellin transform: LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism on the chart.

*Uses.* BSW Definition 9.5 and Theorem 9.10: the p-adic L-function µ\_Ψ is an element of D(Cl⁺\_F(p^∞), L); KATZ-1978 (5.3.0): a D\_p-valued measure on Gal(L(p^∞)/L); DR-1980 (0.5), (8.2): ℤ\_p-valued measures on G; HSIEH-2014 Proposition 5.5: distributions on the anticyclotomic quotient Γ⁻; GrossZagierAndArithmeticHeights:GZ.9: pushforward along Γ̃ → Γ with a twist.

*API.*

- `RayClassDistribution` (constructor): D(Cl⁺\_F(𝔫p^∞), L) as a Fréchet L-algebra under convolution.
- `RayClassDistribution.restrictFibre` (projection): Restriction to the clopen fibre G\_y, and the reconstruction from the family of restrictions (clopen decomposition).
- `RayClassDistribution.ofUnitInvariant` (universal-property): A family of distributions on the congruence subgroups of U\_p, each invariant under E\_+(𝔫f) and supported on z ≡ 1 mod f, glues to a unique distribution on Cl⁺\_F(𝔫p^∞).
- `RayClassDistribution.mellin` (equivalence): The Mellin transform to analytic functions on the character space, from LocallyAnalyticDistributions L3.
- `RayClassDistribution.measure_coe` (coercion): Measures (PadicMeasuresIwasawaAlgebras L1) include into distributions, compatibly with Mellin.
- `RayClassDistribution.chart_independent` (compatibility): The space and its topology do not depend on the splitting Δ × ℤ\_p^d.

*Unit tests.*

- `rayClassDistribution_rat` (compatibility): For F = ℚ and 𝔫 = (1) the space is LocallyAnalyticDistributions’ D(ℤ\_p^×, L).
- `rayClassDistribution_dirac` (computation): The Dirac distribution at the class of a prime 𝔮 ∤ 𝔫p has Mellin transform χ ↦ χ(Art(𝔮)); at the identity it is the unit of convolution.
- `rayClassDistribution_fibre_count` (degenerate): When Cl⁺\_F(f) is trivial (F = ℚ, f = p) there is a single fibre and restrictFibre is the identity.
- `rayClassDistribution_not_units_dual` (non-example): For F real quadratic, a distribution on U\_p that is not E\_+-invariant does not descend: the Dirac mass at a non-unit-invariant point has no image.

*Acceptance.* For F = ℚ, 𝔫 = (1), D(Cl⁺\_ℚ(p^∞), L) = D(ℤ\_p^×, L), the space on which DirichletPadicLFunctions’ Kubota–Leopoldt distributions live.

*Rests on.* `L0/leopoldt-dimension-formula`, `L0/unit-invariance-closure`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L0a`.

*Sources.* BSW-2017-v3, §9.2, pp. 30–31: BSW define A(Cl⁺\_F(p^∞), L) and its dual D(Cl⁺\_F(p^∞), L), and view a function on the ray-class group as a family of unit-invariant functions on the fibres G\_y. PAN-1994, §4.1, pp. 1000–1001: Panchishkin describes p-adic measures on Gal\_p as bounded linear forms and their Mellin transforms on the character space X\_p, which carries the analytic structure transported from (O ⊗ ℤ\_p)^× modulo the unit closure.

### Evaluation, norm, twist and tame-change maps on ray-class distributions

`L0/evaluation-norm-twist-maps` — construction.

For µ ∈ D(Cl⁺\_F(𝔫p^∞), L): (i) evaluation at a locally algebraic character, ev\_ϕ(µ) := µ(ϕ\_{p-fin}), and at a finite-level function (a locally constant function factoring through Cl⁺\_F(𝔫p^m)); (ii) for 𝔫 ∣ 𝔫′ the pushforward (norm) along tameChange, with ev\_ϕ(tameChange\_\*µ) = ev\_{ϕ∘tameChange}(µ); (iii) twisting by a continuous character ψ, Tw\_ψ(µ)(φ) := µ(ψφ), with ev\_ϕ(Tw\_ψ µ) = ev\_{ϕψ}(µ) and Tw\_ψ Tw\_ψ′ = Tw\_{ψψ′}; (iv) pushforward along a continuous surjection of ray-class limits q : Cl⁺\_F(𝔫′p^∞) → Γ onto a quotient (for instance an anticyclotomic quotient), with ev\_φ(q\_\* Tw\_{ψ^{-1}} µ) = ev\_{ψ^{-1}(φ∘q)}(µ). Characters that do not factor through q are evaluated only through (iii).

*Hypotheses.* All maps are continuous L-linear; for distributions the twisting character ψ must be locally analytic (LocallyAnalyticDistributions:L3/mellin-twist); for measures a continuous ψ suffices.

*Proof or construction.*

1. Pushforward and multiplication by a locally analytic function are continuous operations (LocallyAnalyticDistributions:L3/mellin-pushforward, L3/mellin-twist give the Mellin formulas).
2. The evaluation formulas are the definitions of pushforward and twist applied to characters.

*Uses.* GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function: pushforward Γ̃ → Γ and twist by ψ^{-1}; BSW Theorem 11.1: evaluation at ϕ\_{p-fin}; HSIEH-2014 §5.4: evaluation of F\_{λ,c} at critical specialisations.

*API.*

- `RayClassDistribution.eval` (constructor): ev\_ϕ(µ) = µ(ϕ\_{p-fin}).
- `RayClassDistribution.twist` (constructor): Tw\_ψ, with twist\_one and twist\_mul.
- `RayClassDistribution.eval_twist` (simp): ev\_ϕ(Tw\_ψ µ) = ev\_{ϕψ}(µ).
- `RayClassDistribution.map` (functoriality): Pushforward along continuous homomorphisms, with map\_id and map\_comp.
- `RayClassDistribution.eval_map` (simp): ev\_ϕ(q\_\* µ) = ev\_{ϕ∘q}(µ).
- `RayClassDistribution.map_twist` (relation): q\_\*(Tw\_{ψ∘q} µ) = Tw\_ψ(q\_\* µ).

*Unit tests.*

- `eval_trivial_total_mass` (degenerate): ev at the trivial character is the total mass µ(1).
- `eval_dirac` (computation): ev\_ϕ(δ\_g) = ϕ\_{p-fin}(g).
- `eval_twist_compat` (compatibility): For F = ℚ and a Dirichlet character ψ, Tw\_ψ agrees with the twist of DirichletPadicLFunctions’ tame-character measures.
- `eval_map_not_factor` (non-example): A ring-class character of nontrivial prime-to-p conductor does not factor through the anticyclotomic quotient of Cl(p^∞); ev along q is not defined for it and must go through Tw.

*Acceptance.* For F = ℚ these are the twist and pushforward operations on D(ℤ\_p^×, L) used for the Kubota–Leopoldt branches. GZ.9’s convention: with q : Γ̃ → Γ and auxiliary ψ, ev\_φ(q\_\* Tw\_{ψ^{-1}} µ) = ev\_{ψ^{-1}(φ∘q)}(µ).

*Rests on.* `L0/ray-class-distributions`, `L0/hecke-character-avatar`, `LocallyAnalyticDistributions:L3/mellin-pushforward`, `LocallyAnalyticDistributions:L3/mellin-twist`.

*Sources.* BSW-2017-v3, §9.5, eq. (13), pp. 34–35: BSW evaluate µ\_Ψ at ϕ\_{p-fin} by restricting to the fibres, where (ϕ\_{p-fin})\_{a\_y} is ε\_ϕϕ\_f(a\_y)z^r. DR-1980, §0, pp. 231–232: Deligne–Ribet view ε ↦ L(1−k, ε) as distributions on G and integrate characters against them, changing f by pulling back along G → G\_f.

### The conditional evaluation-and-interpolation principle

`L0/conditional-evaluation-principle` — theorem.

Let 𝒞 be the set of moduli f ∣ p^∞ divisible by every prime above p, and suppose given: (a) for each f ∈ 𝒞 a distribution µ^f ∈ D(Cl⁺\_F(𝔫p^∞), L); (b) units α\_𝔭 ∈ L^× (𝔭 | p) with the norm relation µ^{f𝔭} = α\_𝔭 µ^f for all f ∈ 𝒞 and 𝔭 | p; (c) a set 𝒳 of algebraic Hecke characters of conductor dividing 𝔫p^∞ and, for ϕ ∈ 𝒳 of conductor f\_ϕ, with f′\_ϕ := f\_ϕ ∏\_{𝔭∈B(ϕ)} 𝔭 (B(ϕ) the primes above p not dividing f\_ϕ), an evaluation formula µ^{f′\_ϕ}(ϕ\_{p-fin}) = c(ϕ)·L^{alg}(ϕ) with explicit c(ϕ). Then µ := α\_f^{-1}µ^f, with α\_f := ∏\_{𝔭^r∥f} α\_𝔭^r, is independent of f ∈ 𝒞 and satisfies µ(ϕ\_{p-fin}) = α\_{f′\_ϕ}^{-1}c(ϕ)L^{alg}(ϕ) for every ϕ ∈ 𝒳. Uniqueness holds only under a growth theorem: if µ has order h (LocallyAnalyticDistributions:L2 order-r distributions, in the vector-order sense along the chart) and the avatars {ϕ\_{p-fin} : ϕ ∈ 𝒳}, multiplied by finite-order characters, span the locally polynomial test functions of the degrees that bound determines, then any µ′ of the same order with the same interpolation values equals µ. Without such a growth theorem the principle gives existence and choice-independence only.

*Hypotheses.* All data in (a)–(c) are actual objects with proved relations; nothing is postulated by a structure field. The uniqueness clause needs the growth bound and the spanning condition; it fails at the critical order (LocallyAnalyticDistributions:L2/critical-vector-counterexample).

*Proof or construction.*

1. Independence of f: for f ∈ 𝒞 and 𝔭 | p, α\_{f𝔭}^{-1}µ^{f𝔭} = α\_f^{-1}α\_𝔭^{-1}α\_𝔭µ^f; any two f, f′ ∈ 𝒞 are joined through f·f′ by finitely many such steps (induction on the total exponent, staying inside 𝒞).
2. Interpolation: take f = f′\_ϕ in the definition of µ.
3. Uniqueness: apply the multidegree extension/uniqueness theorem (LocallyAnalyticDistributions:L2/tensor-multidegree-extension, L2/amice-velu-vishik in dimension one) on each chart component, after the ray-class growth adapter (L2/rayclass-growth-adapter) converts conductor bounds into rectangular growth.

*Acceptance.* BSW: µ^f from overconvergent evaluations, α\_𝔭 the U\_𝔭-eigenvalues, c(ϕ) from Theorem 5.7 and Corollary 10.2; uniqueness only for F totally real (Leopoldt) or imaginary quadratic. Rational case: Pollack–Stevens’ µ is h-admissible with h = v\_p(α) and is unique when h < k + 1 (ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness).

*Rests on.* `L0/evaluation-norm-twist-maps`, `L0/ray-class-distributions`, `L0/locally-algebraic-characters`, `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`, `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `LocallyAnalyticDistributions:L2/rayclass-growth-adapter`, `LocallyAnalyticDistributions:L2/block-vector-order`.

*Sources.* BSW-2017-v3, Theorem 9.10, p. 34; Lemma 10.5, p. 38; §12, pp. 39–40: BSW normalise by λ\_f^{-1}, prove independence of f from the one-prime relation, deduce interpolation at characters unramified at some 𝔭 | p, and explain that uniqueness needs an admissibility theorem available only for F totally real or imaginary quadratic. PAN-1994, §4.2–4.3, p. 1001: Panchishkin recalls that an h-admissible measure extends uniquely to locally analytic functions and is determined by its values on characters times x\_p^r with r < h (Amice–Vélu, Višik).

### Euler factors at primes away from p as elements of the Iwasawa algebra

`L0/euler-factor-elements` — construction.

Let G be a ray-class limit Cl⁺\_F(𝔫p^∞) (or a quotient, such as an anticyclotomic group), O a coefficient ring, and for a finite place w ∤ p with Frobenius class γ\_w ∈ G (the image of the uniformiser through Art) let P\_w(T) ∈ O[T] be a local Euler polynomial (for instance det(1 − Frob\_w T | V^{I\_w}) of a Galois representation, or 1 − χ\_w(ϖ)T for a character). The Euler-factor element is e\_w := P\_w(N(w)^{-1}·[γ\_w]) ∈ O[[G]] in the convention of the consumer (evaluation of the character at ℓ^{-1}γ\_w), and for a finite set S the S-imprimitive version of a measure µ is E\_S(µ) := ∏\_{w∈S} e\_w ⋆ µ (convolution). For every character χ of G unramified at w, χ(e\_w) = P\_w(χ(γ\_w)N(w)^{-1}), so E\_S(µ) interpolates the S-imprimitive values whenever µ interpolates the primitive ones (AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction). Primitive and imprimitive normalisations of all constructions in this roadmap are related by these elements; inertia coinvariants V\_{I\_w} and the arithmetic/geometric Frobenius convention are part of the datum.

*Hypotheses.* w ∤ p; P\_w with coefficients in O; the Frobenius convention (arithmetic in this roadmap) is fixed and recorded.

*Proof or construction.*

1. e\_w is a polynomial in the group element [γ\_w] ∈ O[[G]] (PadicMeasuresIwasawaAlgebras:L1); its value at a character is the polynomial evaluated at χ(γ\_w).
2. Multiplicativity of evaluation on convolutions (LocallyAnalyticDistributions:L3/mellin-convolution) gives the interpolation of E\_S(µ).
3. If χ is ramified at w the value is the constant term P\_w(0) = 1 only if P\_w is computed on inertia coinvariants; the convention is stated by the consumer.

*Uses.* RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison: primitive versus imprimitive interpolation with inertia coinvariants and evaluation at ℓ^{-1}γ\_w; HeegnerPointEulerSystems:HE.8b: imprimitive Euler µ-terms at nonsplit primes; AutomorphicCongruences:L5w: nonsplit imprimitive Euler µ terms.

*API.*

- `EulerFactorElement` (constructor): e\_w = P\_w(N(w)^{-1}[γ\_w]) ∈ O[[G]].
- `EulerFactorElement.eval` (simp): χ(e\_w) = P\_w(χ(γ\_w)N(w)^{-1}) for χ unramified at w.
- `EulerFactorElement.imprimitive` (constructor): E\_S(µ) = ∏\_{w∈S}e\_w ⋆ µ.
- `EulerFactorElement.imprimitive_union` (relation): E\_{S∪S′} = E\_S ∘ E\_{S′} for disjoint S, S′.
- `EulerFactorElement.unit_iff` (characterisation): e\_w is a unit of O[[G]] iff its reduction is nonzero at every character of the finite quotient, i.e. iff no µ-contribution arises from w.
- `EulerFactorElement.map` (functoriality): Compatible with pushforward to quotients of G (the image of γ\_w).

*Unit tests.*

- `euler_trivial_polynomial` (degenerate): P\_w = 1 gives e\_w = 1 and E\_S = id.
- `euler_rat_value` (computation): F = ℚ, w = ℓ = 3, P(T) = 1 − T: at the character χ = trivial, χ(e\_3) = 1 − 1/3 = 2/3.
- `euler_compat_al5` (compatibility): Evaluating E\_S(µ) at a character equals AL.5’s finite Euler correction E\_S(s₀) times the evaluation of µ.
- `euler_nonunit` (non-example): For an inert prime w in the anticyclotomic setting with γ\_w of finite order and P\_w(1/N(w)·1) ≡ 0 mod p, e\_w is not a unit and contributes to µ.

*Acceptance.* F = ℚ, G = ℤ\_p^×, w = ℓ, P\_ℓ(T) = 1 − T: e\_ℓ = 1 − ℓ^{-1}[ℓ], and E\_{ℓ}(ζ\_p) is the Kubota–Leopoldt measure with the Euler factor at ℓ removed.

*Rests on.* `L0/ray-class-distributions`, `L0/ray-class-reciprocity`, `AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction`, `PadicMeasuresIwasawaAlgebras:L1`, `LocallyAnalyticDistributions:L3/mellin-convolution`.

*Sources.* CGLS-2022, Introduction p. 4; §2.1.2, Theorem 2.1.2, p. 13: Castella–Grossi–Lee–Skinner work with Σ-imprimitive anticyclotomic Katz p-adic L-functions (p. 4); in Theorem 2.1.2 the removed Euler factors appear as the factors (1 − θ(ℓ)ξ(w)ℓ^{-1}) over ℓ | C. DR-1980, §0, p. 230: Deligne–Ribet’s L-values of functions on G\_f exclude the Euler factors at the primes dividing fp. DKV-2018, §1, p. 2: Dasgupta–Kakde–Ventullo’s L\* removes the Euler factors at the primes above p.

### Dependencies of L0

Within this roadmap: none.

Other roadmaps and Tau Ceti layers: `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum`, `AutomorphicLFunctionsAndLocalFactors:AL.5/finite-euler-correction`, `IntegralIwasawaTheory:L4/leopoldt-defect`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `LocallyAnalyticDistributions:L2/block-vector-order`, `LocallyAnalyticDistributions:L2/rayclass-growth-adapter`, `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`, `LocallyAnalyticDistributions:L3/mellin-character-evaluation`, `LocallyAnalyticDistributions:L3/mellin-convolution`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-pushforward`, `LocallyAnalyticDistributions:L3/mellin-twist`, `PadicMeasuresIwasawaAlgebras:L0/clopen-decomposition-equivalence`, `PadicMeasuresIwasawaAlgebras:L0a`, `PadicMeasuresIwasawaAlgebras:L1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

### Refinements left in L0

- Refine leopoldt-dimension-formula into the chart construction Δ × ℤ\_p^d with an explicit choice of splitting and its independence statement.
- Write the explicit comparison of the idelic and ideal-theoretic coordinates of Cl⁺\_F(𝔫p^∞) (the inversion u ↦ u^{-1}) as a separate lemma when a consumer needs it.

## L1 — Cohomological automorphic input for GL₂/F

Barrera Salazar and Williams attach to a cohomological cuspidal eigenform for GL₂ over an arbitrary number field F its modular symbol in compactly supported cohomology in degree q = r₁ + r₂, normalise it by Hida’s periods, and evaluate it on automorphic cycles X\_f to obtain twisted critical L-values. The layer imports arithmetic quotients, local systems, Hecke operators and GL₂ L-functions, and owns the cycles, the evaluation maps, the integral formula, the algebraic critical-value formula (Theorem 5.7) and the comparison with rational modular symbols.

Planets of this layer: BSW critical-value formula (`L1/critical-value-formula`).

### Admissible weights and the weight-λ coefficient modules for GL₂/F

`L1/admissible-weight-coefficients` — definition.

Let F be a number field with complex embeddings Σ (d = [F:ℚ] = r₁ + 2r₂), c complex conjugation on Σ. A weight λ = (k, v) ∈ ℤ[Σ] × ℤ[Σ] is admissible if k = c·k ≥ 0 and k + 2v is parallel. For a ring A, V\_k(A) = ⊗\_σ V\_{k\_σ}(A) with V\_n(A) the homogeneous polynomials of degree n in two variables and GL₂ acting by (a b; c d)·f(X, Y) = f(bY + dX, aY + cX); V\_λ(A) is V\_k(A) with the action twisted by ∏\_σ det(γ\_σ)^{v\_σ}. Its dual V\_λ(A)\* = Hom(V\_λ(A), A) carries the right action (P|γ)(f) = P(γ·f). The level is Ω₁(𝔫) = {(a b; c d) ∈ GL₂(Ô\_F) : c ≡ 0, d ≡ 1 mod 𝔫} with p ∣ 𝔫, Y₁(𝔫) = GL₂(F)\\GL₂(A\_F)/Ω₁(𝔫)K\_∞⁺Z\_∞ (K\_∞⁺ = SO₂(ℝ)^{r₁} × SU₂(ℂ)^{r₂}), of real dimension whose middle compactly supported degree is q = r₁ + r₂. For a right GL₂(F)-module M on which the units of Ω₁(𝔫) ∩ Z act trivially, L₁(M) is the local system with action γ(g, m)ukz = (γgukz, m|γ^{-1}); for a right Ω₁(𝔫)-module, L₂(M) uses (g, m) ↦ (γgukz, m|u). For M a GL₂(F ⊗ ℚ\_p)-module the two are isomorphic by (g, m) ↦ (g, m|g\_p).

*Hypotheses.* F any number field; λ admissible; 𝔫 ⊂ O\_F with p ∣ 𝔫; the centre condition of BSW Definition 3.2 holds for the modules used.

*Proof or construction.*

1. V\_λ(A) is a finite free A-module of rank ∏\_σ(k\_σ + 1) with an algebraic GL₂(A)^Σ-action, i.e. the algebraic weight of AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight for Res\_{F/ℚ}GL₂.
2. Y₁(𝔫) is ArithmeticLocallySymmetricSpaces’ X\_K for G = Res\_{F/ℚ}GL₂ and K = Ω₁(𝔫) (with the centre and K\_∞⁺ conventions of BSW); its decomposition into h components Γ^i₁(𝔫)\\H\_F (h the narrow class number) is ALS.0/component-decomposition.
3. L₁ and L₂ are the arithmetic local systems of ALS.1/arithmetic-local-system for the GL₂(F)-action and the Ω₁(𝔫)-action respectively; the isomorphism is ALS.1’s comparison for modules that extend to GL₂(F ⊗ ℚ\_p).

*Uses.* BSW Definition 3.5: modular symbols H^q\_c(Y₁(𝔫), L₂(V\_λ(L)\*)); BSW §6: V\_λ(L) sits inside the locally analytic functions A\_λ(L); AutomorphicPadicLFunctions:L1/automorphic-cycles: the target Y₁(𝔫) of the cycles η\_f.

*API.*

- `GL2Weight.IsAdmissible` (constructor): The predicate k = c·k ≥ 0 and k + 2v parallel.
- `GL2Weight.coeffModule` (constructor): V\_λ(A) with its algebraic GL₂(A)^Σ-action; coeffModule\_rank: rank ∏(k\_σ+1).
- `GL2Weight.coeffModule_dual` (data): V\_λ(A)\* with the right action (P|γ)(f) = P(γ·f).
- `GL2Weight.coeffModule_baseChange` (functoriality): V\_λ(A) ⊗\_A B ≅ V\_λ(B) equivariantly.
- `Y1.localSystemOne` (constructor): L₁(M) for a right GL₂(F)-module.
- `Y1.localSystemTwo` (constructor): L₂(M) for a right Ω₁(𝔫)-module.
- `Y1.localSystemOneEquivTwo` (equivalence): L₁(M) ≅ L₂(M) by (g, m) ↦ (g, m|g\_p) when M is a GL₂(F ⊗ ℚ\_p)-module.

*Unit tests.*

- `weight_trivial` (degenerate): λ = (0, 0): V\_λ(A) = A with trivial action, so modular symbols are H^q\_c(Y₁(𝔫), A).
- `weight_rank_bianchi` (computation): F = ℚ(i), k = (2, 2): V\_λ has rank 9.
- `weight_rat_compat` (compatibility): F = ℚ, λ = (k, 0): V\_λ(A) is isomorphic to ModularSymbolsPadicLFunctions’ V\_k(A) as GL₂(A)-modules through the explicit change of variables relating BSW’s f(bY + dX, aY + cX) to that roadmap’s P(dX − cY, −bX + aY) convention; the isomorphism, not equality of formulas, is the test.
- `weight_not_admissible` (non-example): F real quadratic, k = (2, 0), v = (0, 0): k + 2v = (2, 0) is not parallel, so the weight is not admissible (for a field with a real place the k\_σ of an admissible weight all have the same parity).

*Acceptance.* F = ℚ: λ = (k, v) with k ≥ 0 any integer, V\_λ = Sym^k twisted by det^v, the coefficient module of ModularSymbolsPadicLFunctions:L0/polynomial-coefficients, and q = 1. F imaginary quadratic: Σ = {σ, cσ}, k = (k, k) is forced by k = c·k, matching Williams’ Bianchi weight (k, k).

*Rests on.* `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `ModularSymbolsPadicLFunctions:L0/polynomial-coefficients`.

*Sources.* BSW-2017-v3, §1.1 pp. 5–6; Definition 1.8 p. 8; Definition 3.1–3.2 and Remarks 3.3, p. 11: BSW fix Ω₁(n), Y₁(n), the polynomial modules V\_k and V\_λ with their actions, admissible weights (k = ck ≥ 0, k + 2v parallel), and the two local systems L₁, L₂ with their isomorphism. WIL-2017, §1, p. 5: Williams uses the same Ω₁(n) and strong-approximation decomposition for Bianchi forms of weight (k, k).

### Cuspidal eigenforms of weight λ over F and their twisted L-functions

`L1/cusp-forms-and-twisted-l-functions` — definition.

A cusp form of weight λ and level Ω₁(𝔫) is Φ : GL₂(A\_F) → V\_{k\*}(ℂ) satisfying the automorphy condition Φ(zgu) = Φ(g)ρ(u, z) for u ∈ K\_∞⁺, z ∈ Z\_∞ (ρ the weight-λ representation of BSW §1.3), right Ω₁(𝔫)-invariance, left GL₂(F)-invariance, the Casimir eigencondition at each infinite place, moderate growth and cuspidality; S\_λ(Ω₁(𝔫)) is the space. For a Hecke eigenform Φ with T\_I-eigenvalues λ\_I and a Hecke character ϕ, L(Φ, ϕ, s) = Σ\_{0≠I⊂O\_F} λ\_I ϕ(I) N(I)^{-s}, continued to ℂ, L(Φ, ϕ) := L(Φ, ϕ, 1), and for ϕ of infinity type j + v the completed value Λ(Φ, ϕ) := ∏\_{σ∈Σ} Γ(j\_σ + 1)/(−2πi)^{j\_σ+1} · L(Φ, ϕ). A character ϕ of infinity type j + v is critical for Φ when 0 ≤ j ≤ k.

*Hypotheses.* Φ cuspidal Hecke eigenform; ϕ arithmetic Hecke character.

*Proof or construction.*

1. S\_λ(Ω₁(𝔫)) is the space of cohomological cusp forms of AutomorphicFormsOnReductiveGroups:AF.3/cusp-form with the weight condition of AF.4/cohomological-representation for Res\_{F/ℚ}GL₂.
2. L(Φ, ϕ, s) is the standard L-function of the cuspidal representation generated by Φ twisted by ϕ, shifted by BSW’s normalisation; continuation is GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison with AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet, and for F = ℚ the shift between classical and unitary normalisations is R16.5/classical-l-function-comparison; over general F BSW’s normalisation L(Φ, ϕ) := L(Φ, ϕ, 1) is the analogous shift.

*Uses.* BSW Theorems 2.3, 4.6, 5.7, 11.1: the L-values being interpolated; AutomorphicPadicLFunctions:L1/critical-value-formula: Λ(Φ, ϕ) on the right-hand side.

*API.*

- `GL2F.CuspForm` (constructor): S\_λ(Ω₁(𝔫)) as a finite-dimensional ℂ-space with Hecke operators T\_I.
- `GL2F.twistedLFunction` (constructor): L(Φ, ϕ, s), entire for Φ cuspidal.
- `GL2F.twistedLFunction_eulerProduct` (characterisation): For Re s ≫ 0 the Dirichlet series has the Euler product with factors (1 − λ\_𝔮ϕ(𝔮)N𝔮^{-s} + ω(𝔮)ϕ(𝔮)²N𝔮^{1-2s}…)^{-1} at good 𝔮 in BSW’s normalisation.
- `GL2F.completedValue` (data): Λ(Φ, ϕ) with the Γ-factor ∏Γ(j\_σ+1)/(−2πi)^{j\_σ+1}.
- `GL2F.IsCritical` (constructor): ϕ of infinity type j + v is critical iff 0 ≤ j ≤ k.
- `GL2F.twistedLFunction_classical` (compatibility): For F = ℚ the comparison with Mathlib’s ModularForm-side L-function via R16.5/classical-l-function-comparison.

*Unit tests.*

- `cuspForm_weight_zero_rat` (compatibility): F = ℚ, λ = (0, 0), 𝔫 = (11): S\_λ is spanned by the adelisation of the weight-2 newform of level 11, as in Mathlib’s CuspForm for Γ₁(11).
- `criticality_range` (computation): For F = ℚ, k = 2 (weight 4): the critical infinity types are j ∈ {0, 1, 2}.
- `completedValue_trivial_j` (degenerate): For j = 0 the Γ-factor is ∏\_σ 1/(−2πi).
- `criticality_nonexample` (non-example): j = k + 1 is not critical; Λ(Φ, ϕ) is not divided by a period there.

*Acceptance.* F = ℚ, Φ the adelisation of a weight k + 2 newform f: L(Φ, ϕ, s) is the classical L(f, ϕ, s) up to BSW’s shift and Λ includes Deligne’s Γ-factors.

*Rests on.* `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form`, `AutomorphicFormsOnReductiveGroups:AF.4/cohomological-representation`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `L1/admissible-weight-coefficients`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

*Sources.* BSW-2017-v3, Definition 1.9 p. 9; Definitions 2.1–2.2 p. 10: BSW define cusp forms of weight λ and level Ω₁(n), the twisted L-function L(Φ, ϕ, s), its value at s = 1 and the completion Λ(Φ, ϕ) with Deligne’s Γ-factors.

### Eichler–Shimura–Harder for GL₂ over F

`L1/eichler-shimura-harder` — theorem.

There is a Hecke-equivariant injection S\_λ(Ω₁(𝔫)) ↪ H^q\_c(Y₁(𝔫), L₁(V\_λ(ℂ)\*)), q = r₁ + r₂, sending an eigenform Φ to a class φ\_ℂ with the same Hecke eigenvalues; it is the composite of Harder’s map to cuspidal cohomology with the inclusion of cuspidal into compactly supported cohomology. Under the decomposition Y₁(𝔫) = ⊔\_{i=1}^h Γ^i₁(𝔫)\\H\_F, compactly supported cohomology splits (non-canonically, after a large coefficient extension) as the direct sum over components.

*Hypotheses.* Cohomological weight λ; Hecke operators normalised as in BSW §3.2.1 (Dimitrov).

*Proof or construction.*

1. The automorphic-to-cohomology map for GL₂ over a general number field: the (𝔤, K)-cohomology of the cohomological cuspidal representation in degree q, transported to the cohomology of the locally symmetric space (Borel–Wallach range, AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range) and to the de Rham/Betti comparison (ALS.1/sheaf-singular-comparison).
2. Hecke equivariance: Hecke correspondences act compatibly on automorphic forms and on cohomology (ALS.3/hecke-operator-formula).
3. This general-F theorem is requested from ArithmeticLocallySymmetricSpaces (see requests); for F = ℚ it is ModularSymbolsPadicLFunctions:L0/eichler-shimura-isomorphism.

*Acceptance.* F = ℚ: the Eichler–Shimura isomorphism for Γ₁(N) in degree 1. F imaginary quadratic: Harder’s isomorphism in degree q = 1 for Bianchi forms (Williams §2).

*Rests on.* `L1/cusp-forms-and-twisted-l-functions`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`, `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `ModularSymbolsPadicLFunctions:L0/eichler-shimura-isomorphism`.

*Sources.* BSW-2017-v3, Theorem 3.4 and eq. (3), p. 13: BSW state the Hecke-equivariant injection from cusp forms into compactly supported cohomology in degree q, referring to Hida’s explicit recipe, and the decomposition over components. WIL-2017, §2, pp. 11–12: Williams makes the Bianchi case explicit through differentials on H₃ and the associated modular symbol.

### Periods and algebraicity of critical values (Hida)

`L1/hida-period-algebraicity` — theorem.

Let Φ be a cuspidal eigenform of weight λ = (k, v) and level Ω₁(𝔫), K a number field containing the Galois closure of F and the Hecke eigenvalues of Φ. For each character ε of the Weyl group {±1}^{Σ(ℝ)} there is a period Ω^ε\_Φ ∈ ℂ^×, depending only on Φ and ε and well defined up to K^×, such that for every Hecke character ϕ of infinity type j + v with 0 ≤ j ≤ k and ε\_ϕ = ε, Λ(Φ, ϕ)/(Ω^ε\_Φ τ(ϕ)) ∈ K(ϕ), the field generated over K by the values of ϕ. The period depends on ε\_ϕ(ι) = ϕ|\_{{±1}}(ι)ι^{j+v}, not on the restriction of ϕ alone; there are 2^{r₁} periods.

*Hypotheses.* Hecke characters are arithmetic (otherwise K(ϕ) need not be finite over K).

*Proof or construction.*

1. Hida’s theorem (Hida, Duke 1994, Theorem 8.1), proved through the rationality of the ε-isotypic parts of the cohomology class φ\_ℂ (Proposition 3.7) and the integral formula (Theorem 4.6); Shimura proved the totally real case.
2. The ε-isotypic part of the eigenclass is one-dimensional over ℂ and has a K-rational generator; Ω^ε\_Φ is the ratio.

*Acceptance.* F = ℚ: two periods Ω^± (Shimura), the period lines of ModularSymbolsPadicLFunctions:L1/period-lines. F imaginary quadratic: r₁ = 0, a single period.

*Rests on.* `L1/eichler-shimura-harder`, `L0/gauss-sum-and-depleted-l-function`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `ModularSymbolsPadicLFunctions:L1/period-lines`.

*Sources.* BSW-2017-v3, Theorem 2.3 and Remarks (i)–(iii), p. 10: BSW quote Hida’s algebraicity theorem with periods Ω^ε\_Φ indexed by Weyl-group characters and note that the period depends on ε\_ϕ, not on ϕ restricted to the signs.

### The period-normalised modular symbol θ\_K of an eigenform

`L1/period-normalised-symbol` — construction.

For an eigenform Φ with Eichler–Shimura class φ\_ℂ, the Weyl group {±1}^{Σ(ℝ)} acts on H^q\_c(Y₁(𝔫), L₁(V\_λ(ℂ)\*)) through ι·[x\_∞ components] (BSW §3.2.2), commuting with Hecke operators. For a character ε put φ^ε\_ℂ := 2^{-r₁} Σ\_ι ε(ι) φ\_ℂ|ι, which lies in the ε-eigenspace, and φ^ε\_K := φ^ε\_ℂ/Ω^ε\_Φ, which lies in H^q\_c(Y₁(𝔫), L₁(V\_λ(K)\*))[ε]. Then θ\_K := Σ\_ε φ^ε\_K and, for a finite extension L/ℚ\_p containing ι\_p(K), θ\_L is the image of θ\_K in H^q\_c(Y₁(𝔫), L₂(V\_λ(L)\*)) through L₁ ≅ L₂.

*Hypotheses.* Periods fixed once for each ε (hida-period-algebraicity).

*Proof or construction.*

1. The Weyl action is induced by ι·(g, P) ↦ (ι·g, P) on local systems; it commutes with Hecke operators.
2. φ^ε\_ℂ is the ε-isotypic projection; K-rationality of φ^ε\_K is Hida’s Theorem (BSW Proposition 3.7).
3. θ\_L is obtained by scalar extension along ι\_p and the local-system isomorphism of admissible-weight-coefficients.

*Uses.* BSW Theorem 5.7: Ev\_ϕ(θ\_K) gives the algebraic part of Λ(Φ, ϕ); BSW §10.3: θ\_L is lifted by the control theorem.

*API.*

- `GL2F.weylAction` (constructor): The action of {±1}^{Σ(ℝ)} on compactly supported cohomology, commuting with Hecke operators.
- `GL2F.isotypicPart` (projection): φ ↦ φ^ε = 2^{-r₁}Σ ε(ι)φ|ι, idempotent, with Σ\_ε φ^ε = φ.
- `GL2F.normalisedSymbol` (constructor): θ\_K = Σ\_ε φ^ε\_ℂ/Ω^ε\_Φ, a K-rational class.
- `GL2F.normalisedSymbol_padic` (data): θ\_L in H^q\_c(Y₁(𝔫), L₂(V\_λ(L)\*)).
- `GL2F.normalisedSymbol_period_change` (relation): Replacing Ω^ε\_Φ by aΩ^ε\_Φ, a ∈ K^×, replaces φ^ε\_K by a^{-1}φ^ε\_K.

*Unit tests.*

- `isotypic_sum` (characterisation): Σ\_ε φ^ε\_ℂ = φ\_ℂ by orthogonality of characters of {±1}^{r₁}.
- `isotypic_imag_quadratic` (degenerate): For r₁ = 0 there is a single ε and φ^ε\_ℂ = φ\_ℂ.
- `normalisedSymbol_rat` (compatibility): For F = ℚ, θ\_K equals ModularSymbolsPadicLFunctions’ φ⁺/Ω⁺ + φ⁻/Ω⁻ under the period-line dictionary.
- `isotypic_nonexample` (non-example): Projecting with ε but dividing by Ω^{ε′} for ε′ ≠ ε gives a class that is not K-rational in general.

*Acceptance.* F = ℚ: θ\_K = φ⁺/Ω⁺ + φ⁻/Ω⁻, the ±-decomposition of ModularSymbolsPadicLFunctions:L0/plus-minus-decomposition.

*Rests on.* `L1/eichler-shimura-harder`, `L1/hida-period-algebraicity`, `L1/admissible-weight-coefficients`, `ModularSymbolsPadicLFunctions:L0/plus-minus-decomposition`.

*Sources.* BSW-2017-v3, §3.2.2 p. 12; Definition 3.6, Proposition 3.7, Definition 3.8 p. 13; Definition 3.9 and eqs. (4)–(5), p. 14: BSW define the Weyl-group action, the ε-parts, the normalised classes φ^ε\_K, their sum θ\_K and its p-adic image θ\_L.

### BSW automorphic cycles X\_f and their embedding in Y₁(𝔫)

`L1/automorphic-cycles` — construction.

For an integral ideal f of F let E(f) = {x ∈ O\_{F,+}^× : x ≡ 1 mod f}, F\_∞¹ = {x ∈ F\_∞⁺ : |x\_v|\_v = 1 for all v | ∞}, and X\_f := F^×\\A\_F^×/U(f)F\_∞¹. Then X\_f = ⊔\_{y∈Cl⁺\_F(f)} X\_y, and for representatives a\_y (with (a\_y)\_∞ = 1) multiplication by a\_y gives E(f)F\_∞¹\\F\_∞⁺ ≅ X\_y, a connected orientable real manifold of dimension q = r₁ + r₂. The map η : A\_F^× → GL₂(A\_F), x ↦ (x, (xπ\_f^{-1})\_{v|f}; 0, 1) induces a well-defined η\_f : X\_f → Y₁(𝔫) sending X\_y into the component of Y₁(𝔫) indexed by the image of y in Cl⁺\_F.

*Hypotheses.* f integral; π\_f the finite idele with components π\_w^{-v\_w(f)} at w | f (BSW Definition 1.6).

*Proof or construction.*

1. Well-definedness: for γ ∈ F^×, u ∈ U(f), r ∈ F\_∞¹, η(γxur) = (γ 0; 0 1)·η(x)·(u, ((u−1)π\_f^{-1}); 0, 1)·(r, 0; 0, 1) with (γ 0; 0 1) ∈ GL₂(F), the third factor in Ω₁(𝔫) and the last in the centre-times-K\_∞⁺ part (BSW eq. (6)).
2. Component statement: det η\_f(x) = x.
3. The fibre description is the isomorphism (7) of BSW §4.2.2.

*Uses.* BSW §4.2 and §9.1: pullback of modular symbols to the cycles before evaluation; BSW Lemma 9.8: the trace X\_{f𝔭} → X\_f intertwines U\_𝔭.

*API.*

- `GL2F.automorphicCycle` (constructor): X\_f with its decomposition into components X\_y.
- `GL2F.cycleEmbedding` (constructor): η\_f : X\_f → Y₁(𝔫), continuous and proper on each X\_y.
- `GL2F.cycleEmbedding_component` (characterisation): η\_f(X\_y) lies in the component indexed by the image of y in Cl⁺\_F.
- `GL2F.cycleComponentEquiv` (equivalence): E(f)F\_∞¹\\F\_∞⁺ ≅ X\_y by r ↦ a\_y r, an oriented manifold of dimension q.
- `GL2F.cycleTrace` (functoriality): The finite covering X\_{f𝔭} → X\_f and its trace map on compactly supported cohomology.

*Unit tests.*

- `cycle_rat_dimension` (computation): F = ℚ: each X\_y is diffeomorphic to ℝ\_{>0}, dimension q = 1.
- `cycle_count` (degenerate): f = (1): X\_(1) has h⁺ components, h⁺ the narrow class number.
- `cycle_imag_quadratic` (compatibility): F imaginary quadratic: X\_y ≅ ℝ\_{>0} (q = 1) since E(f) is finite and F\_∞¹ is the circle, matching Williams’ path {0} − {∞} in H₃.
- `cycle_nonexample` (non-example): Replacing U(f) by U(f𝔭) changes the components: X\_{f𝔭} has [Cl⁺(f𝔭):Cl⁺(f)] times as many components as X\_f, so η\_f is not independent of f.

*Acceptance.* F = ℚ: X\_f is a disjoint union of copies of ℝ\_{>0}, and η\_f(x) traces the path from the cusp a/f to ∞ (the modular symbol {a/f} − {∞}).

*Rests on.* `L1/admissible-weight-coefficients`, `L0/ray-class-tower`, `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`.

*Sources.* BSW-2017-v3, Definitions 4.1–4.2, Remark 4.3, Proposition 4.4 and eq. (6), pp. 14–15; eq. (7), p. 16: BSW define the automorphic cycle X\_f, its decomposition over the narrow ray class group, the embedding η\_f and prove it is well defined, landing in the expected component.

### Classical evaluation maps Ev\_{f,j} and Ev\_ϕ

`L1/classical-evaluation-maps` — construction.

For a Hecke character ϕ of conductor f and infinity type j + v (0 ≤ j ≤ k), let ρ\_j : V\_λ(A)\* → A be evaluation at X^{k−j}Y^j; since e^{j+v} = 1 for e ∈ E(f), ρ\_j makes the pulled-back local system on E(f)F\_∞¹\\F\_∞⁺ constant. Ev^{a\_y}\_{f,j,1} : H^q\_c(Y₁(𝔫), L₁(V\_λ(A)\*)) → A is η\_f\* followed by restriction to X\_y via a\_y, (ρ\_j)\_\*, and integration over the oriented q-manifold. Ev\_ϕ(φ) := Σ\_{y∈Cl⁺\_F(f)} ε\_ϕϕ\_f(a\_y)Ev^{a\_y}\_{f,j,1}(φ) is independent of the representatives a\_y (Lemma 5.2), satisfies Ev\_ϕ(φ|ι) = ε\_ϕ(ι)Ev\_ϕ(φ) (Corollary 5.5), and kills the ε-parts with ε ≠ ε\_ϕ (Corollary 5.6). The variant Ev^{a\_y}\_{f,j,2} on L₂-coefficients (pullback, untwisting by ζ\_f, restriction, ρ\_j) satisfies Ev\_2(α(φ)) = π\_f^{j+v}Ev\_1(φ) (Lemma 10.1) with α : L₁ ≅ L₂, and Ev\_{ϕ,2} := Σ ε\_ϕϕ\_f(a\_y)Ev^{a\_y}\_{f,j,2}.

*Hypotheses.* A any coefficient ring in which the integration makes sense (ℂ, a number field K, or L/ℚ\_p). π\_f^{j+v} is the element of L attached to (π\_f)\_{v|p} with the fixed uniformisers; it equals N(f)^{[j+v]} up to a p-adic unit.

*Proof or construction.*

1. Construct each step as in BSW §4.2.1–4.2.3; integration is the isomorphism H^q\_c(E(f)F\_∞¹\\F\_∞⁺, A) ≅ A of an oriented connected q-manifold.
2. Lemma 5.2: changing a\_y to a′\_y = fa\_yur multiplies Ev^{a\_y} by f^{j+v} and ε\_ϕϕ\_f(a\_y) by f^{−j−v}.
3. Proposition 5.4 and Corollaries 5.5–5.6 by functoriality of the Weyl action on local systems and orthogonality.
4. Lemma 10.1: commutative diagrams of local systems with α′, α″ and the factor π\_f^{j+v} at the evaluation step.

*Uses.* BSW Theorems 4.6, 5.7: the critical-value formula is a statement about Ev\_ϕ; BSW Proposition 10.3: the overconvergent evaluation specialises to Ev\_{f,j,2}.

*API.*

- `GL2F.evalComponent` (constructor): Ev^{a\_y}\_{f,j,1}, A-linear.
- `GL2F.evalCharacter` (constructor): Ev\_ϕ, A-linear, defined with any representatives.
- `GL2F.evalCharacter_independent` (characterisation): Ev\_ϕ does not depend on {a\_y} (BSW Lemma 5.2).
- `GL2F.evalCharacter_weyl` (relation): Ev\_ϕ(φ|ι) = ε\_ϕ(ι)Ev\_ϕ(φ).
- `GL2F.evalCharacter_isotypic` (simp): Ev\_ϕ(φ^ε) = Ev\_ϕ(φ) if ε = ε\_ϕ and 0 otherwise.
- `GL2F.evalCharacterTwo` (constructor): Ev\_{ϕ,2} on L₂-coefficients.
- `GL2F.evalCharacterTwo_alpha` (compatibility): Ev\_{ϕ,2}(α(φ)) = π\_f^{j+v}Ev\_ϕ(φ).
- `GL2F.evalCharacter_baseChange` (functoriality): Ev\_ϕ commutes with extension of coefficients K → L along ι\_p.

*Unit tests.*

- `eval_trivial_character_rat` (computation): F = ℚ, f = (1), ϕ = 1, j = 0: Ev\_ϕ(φ) = φ({0} − {∞})(X^k), the value of the modular symbol on the path from 0 to ∞.
- `eval_representative_change` (characterisation): Replacing a\_y by a\_y·γ with γ ∈ F^× totally positive and ≡ 1 mod f leaves Ev\_ϕ unchanged although each Ev^{a\_y} changes by γ^{j+v}.
- `eval_imag_quadratic` (degenerate): r₁ = 0: there is no Weyl action and evalCharacter\_isotypic is vacuous.
- `eval_wrong_sign` (non-example): With ε ≠ ε\_ϕ, Ev\_ϕ(φ^ε) = 0; a definition omitting the factor ε\_ϕ in Ev\_ϕ would not satisfy evalCharacter\_weyl.

*Acceptance.* F = ℚ: Ev\_ϕ(φ) = Σ\_a ϕ(a)φ({a/f} − {∞})(X^{k−j}Y^j), the twisted modular-symbol sum of ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula.

*Rests on.* `L1/automorphic-cycles`, `L1/period-normalised-symbol`, `L0/hecke-character-avatar`, `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`.

*Sources.* BSW-2017-v3, §4.2, Definition 4.5, pp. 15–16; Definition 5.1, Lemma 5.2, Definition 5.3, Proposition 5.4, Corollaries 5.5–5.6, pp. 18–20; §10.1 and Lemma 10.1, pp. 35–36: BSW construct the evaluation maps, prove independence of representatives and the Weyl-group compatibility, and compare the L₁ and L₂ versions by the factor π\_f^{j+v}.

### The integral formula for twisted L-values (BSW Theorem 4.6)

`L1/integral-formula` — theorem.

Let Φ be a cuspidal eigenform of weight λ = (k, v) and level Ω₁(𝔫) over a number field F, and ϕ a Hecke character of conductor f and infinity type j + v with 0 ≤ j ≤ k. With representatives a\_y of Cl⁺\_F(f) having trivial infinite components, Σ\_{y∈Cl⁺\_F(f)} ϕ(a\_y)Ev^{a\_y}\_{f,j,1}(φ\_ℂ) = (−1)^{R(j,k)}·|D|·τ(ϕ)·2^{-r₂}·Λ(Φ, ϕ), where R(j, k) = Σ\_{v∈Σ(ℂ)} k\_v + Σ\_{v∈Σ(ℝ)}(k\_v + j\_v) and D is the discriminant of F. Moreover (Theorem 4.7) if 𝔭 ∣ 𝔫 does not divide f, Σ\_{x∈Cl⁺\_F(f𝔭)} ϕ(a\_x)Ev^{a\_x}\_{f𝔭,j,1}(φ\_ℂ) = (ϕ(𝔭)λ\_𝔭 − 1)Σ\_y ϕ(a\_y)Ev^{a\_y}\_{f,j,1}(φ\_ℂ), so that (Corollary 4.8) for f′ = f∏\_{𝔭∈B}𝔭 (B the primes above p unramified in ϕ) the two sums differ by ∏\_{𝔭∈B}(ϕ(𝔭)λ\_𝔭 − 1).

*Hypotheses.* Φ a Hecke eigenform (for Theorem 4.7, an eigensymbol for all Hecke operators); p ∣ 𝔫 for Corollary 4.8.

*Proof or construction.*

1. Compute δ\_y = τ\_{a\_y}\*η\_f\*φ\_ℂ through the Betti–de Rham comparison (Hida §2.5) and write it as Σ\_j δ^j\_y X^{k−j}Y^j.
2. For Re s ≫ 0 compute the Mellin-type integrals C^j\_y(s) = ∫ δ^j\_y(y)|y|^s over E(f)F\_∞¹\\F\_∞⁺ by substituting the Fourier (Whittaker) expansion of Φ (GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison) and splitting into archimedean local integrals.
3. Sum over y ∈ Cl⁺\_F(f): the sum over ideals collapses through the Gauss sum identity (BSW Proposition 1.7) to L(Φ, ϕ|·|^s); continuation to s = 0 gives the critical value; C^j\_y(0) = Ev^{a\_y}\_{f,j,1}(φ\_ℂ).
4. Theorem 4.7: examine the Gauss sum at a level raised by 𝔭 and use the U\_𝔭-eigenvalue.

*Acceptance.* F = ℚ: the classical Birch–Manin formula Σ\_a ϕ(a)φ({a/f} − {∞}) = (unit)·τ(ϕ)·Λ(f, ϕ) of ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula. Corollary 4.8 at ϕ = 1 and f = (1): passing to f′ = ∏\_{𝔭|p}𝔭 multiplies by ∏(λ\_𝔭 − 1).

*Rests on.* `L1/classical-evaluation-maps`, `L1/cusp-forms-and-twisted-l-functions`, `L0/gauss-sum-and-depleted-l-function`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model`.

*Sources.* BSW-2017-v3, Theorem 4.6 and its proof sketch, p. 17; Theorem 4.7 and Corollary 4.8, p. 18: BSW state the integral formula with the sign (−1)^{R(j,k)}, |D|, τ(ϕ), 2^{-r₂} and Λ(Φ, ϕ), sketch the proof through Fourier expansions and Gauss sums (full proof in Williams’ thesis), and record the change-of-conductor relation with factor ϕ(𝔭)λ\_𝔭 − 1. WIL-2017, Theorem 1.8 and Proposition 2.10, pp. 8 and 13: Williams proves the imaginary quadratic case explicitly, expressing L(Φ, ψ, s) through integrals of the components of Φ.

### Algebraic critical-value formula (BSW Theorem 5.7)

`L1/critical-value-formula` — theorem.

For a Hecke character ϕ of conductor f and infinity type j + v with 0 ≤ j ≤ k, Ev\_ϕ(θ\_K) = (−1)^{R(j,k)}·|D|·τ(ϕ)·Λ(Φ, ϕ)/(2^{r₂}Ω^{ε\_ϕ}\_Φ), an element of K(ϕ); and for the p-adic symbol θ\_L, Ev\_{ϕ,2}(θ\_L) = π\_f^{j+v}Ev\_ϕ(θ\_K) (Corollary 10.2). Each factor is a separate datum: the sign (−1)^{R(j,k)}, the discriminant |D|, the Gauss sum τ(ϕ), the power 2^{-r₂}, the period Ω^{ε\_ϕ}\_Φ and the completed value Λ(Φ, ϕ).

*Hypotheses.* Representatives with trivial infinite components (then ε\_ϕϕ\_f(a\_y) = ϕ(a\_y)); conductor f arbitrary (no ramification condition at p).

*Proof or construction.*

1. Apply integral-formula to φ\_ℂ, divide by the period after projecting to the ε\_ϕ-part (classical-evaluation-maps, Corollary 5.6).
2. Algebraicity of the right-hand side is hida-period-algebraicity.
3. The p-adic version is Lemma 10.1 applied to θ\_L.

*Acceptance.* F = ℚ, ϕ = 1, j = 0: Ev(θ\_K) = (−1)^{k}·Λ(f, 1)/Ω^{ε}, the period-normalised central-or-critical value.

*Rests on.* `L1/integral-formula`, `L1/period-normalised-symbol`, `L1/hida-period-algebraicity`.

*Sources.* BSW-2017-v3, Theorem 5.7, p. 20; Corollary 10.2, p. 37: BSW state the algebraic critical-value formula for θ\_K and its p-adic version with the extra factor π\_f^{j+v}.

### Agreement with rational modular symbols for F = ℚ

`L1/rational-modular-symbol-comparison` — comparison.

For F = ℚ the BSW objects specialise to the rational ones: Y₁(N) is the modular curve, H¹\_c(Y₁(N), L₂(V\_λ(L)\*)) is the space of modular symbols of ModularSymbolsPadicLFunctions:L0, the cycle η\_f(X\_y) is the path {a/f} → {∞}, θ\_K is φ⁺/Ω⁺ + φ⁻/Ω⁻ for the period lines of ModularSymbolsPadicLFunctions:L1/period-lines, and Theorem 5.7 becomes the twisted Mellin formula of ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula. The comparison records: (a) orientation of the cycle (BSW integrate from 0 to ∞ in y = Im z); (b) BSW twist by ϕ(a\_y) where the rational formula twists by ϕ^{-1}(a) or uses τ(ϕ̄) — the inversion is explicit; (c) the Gauss sum τ(ϕ) of gauss-sum-and-depleted-l-function against τ(ϕ̄) in the rational normalisation, related by τ(ϕ)τ(ϕ̄) = ϕ(−1)f; (d) period choices: Ω^ε\_Φ of BSW and the integral period of ModularSymbolsPadicLFunctions:L1/integral-period-lattices differ by an element of K^×, fixed by matching the two lines.

*Hypotheses.* F = ℚ, Φ the adelisation of a newform (AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary).

*Proof or construction.*

1. Identify Y₁(N) and the local systems with the rational ones (AF.5/gl2-dictionary, ALS.0 for G = GL₂/ℚ).
2. Identify the cycle and the evaluation: η\_f on X\_y = ℝ\_{>0}·a\_y is y ↦ (y, a/f; 0, 1), whose image is the geodesic from a/f to i∞.
3. Compare the two critical-value formulas term by term; the scalar between them is a product of a sign, a Gauss-sum inversion and a period ratio, each in K(ϕ)^×.

*Acceptance.* Weight two, ϕ = 1: Ev(θ\_K) = −L(f, 1)/Ω⁺ in both normalisations after the sign convention for the path is matched. A character ϕ of conductor 5: the two formulas differ exactly by ϕ(−1) and the Gauss-sum inversion.

*Rests on.* `L1/critical-value-formula`, `ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula`, `ModularSymbolsPadicLFunctions:L1/period-lines`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface`.

*Sources.* BSW-2017-v3, §9 opening, p. 28: BSW explain that over ℚ (and imaginary quadratic fields) their evaluation at automorphic cycles is the evaluation of a modular symbol at {0} − {∞} used by Pollack–Stevens. WIL-2017, §2, pp. 11–13: Williams’ Bianchi modular symbol evaluated at {0} − {∞} recovers the same L-values, the imaginary quadratic instance of the comparison.

### Dependencies of L1

Within this roadmap: `L0`.

Other roadmaps and Tau Ceti layers: `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`, `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `AutomorphicFormsOnReductiveGroups:AF.3/cusp-form`, `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`, `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`, `AutomorphicFormsOnReductiveGroups:AF.4/cohomological-representation`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-model`, `AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/classical-l-function-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison`, `ModularSymbolsPadicLFunctions:L0/eichler-shimura-isomorphism`, `ModularSymbolsPadicLFunctions:L0/plus-minus-decomposition`, `ModularSymbolsPadicLFunctions:L0/polynomial-coefficients`, `ModularSymbolsPadicLFunctions:L1/critical-value-algebraicity`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `ModularSymbolsPadicLFunctions:L1/period-lines`, `ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

### Refinements left in L1

- The Eichler–Shimura–Harder map for GL₂ over general F is requested from ArithmeticLocallySymmetricSpaces:ALS.4.
- Transcribe the archimedean local integrals at complex places from Williams’ thesis (gap).

## L2 — Overconvergent cohomology and the BSW construction

The overconvergent half of BSW: locally analytic coefficient modules for GL₂/F, compactness and slope decompositions (with the corrections recorded in sourceIssues E2–E3), the small-slope control theorem, the evaluation of overconvergent classes on automorphic cycles, the norm relation, the normalised distribution µ\_Φ on Cl⁺\_F(p^∞) and its interpolation of all critical values with every factor named. Over a general F only independence of choices is proved; growth and uniqueness are planned where they are known (F totally real under Leopoldt, F imaginary quadratic).

Planets of this layer: Overconvergent modular symbols over F (`L2/overconvergent-modular-symbols`); BSW control theorem (`L2/control-theorem`); BSW p-adic L-function (`L2/normalised-evaluation`); BSW interpolation theorem (`L2/bsw-interpolation`).

### Locally analytic coefficient modules A\_λ(L), D\_λ(L) for GL₂/F

`L2/locally-analytic-coefficients` — definition.

Let L/ℚ\_p be finite, containing ι\_p∘σ(F) for every σ ∈ Σ, and λ = (k, v) admissible. A(L) is the space of locally analytic L-valued functions on O\_F ⊗ ℤ\_p, with Banach stages A\_n(L) of functions analytic on every coset a + p^n(O\_F ⊗ ℤ\_p). The semigroup Σ₀(p) = {(a b; c d) ∈ M₂(O\_F ⊗ ℤ\_p) : c ∈ p(O\_F ⊗ ℤ\_p), a ∈ (O\_F ⊗ ℤ\_p)^×, ad − bc ≠ 0} acts on the left on A\_λ(L) := A(L) by (a b; c d)·f(z) = (ad − bc)^v(a + cz)^k f((b + dz)/(a + cz)), extending the action on V\_λ(L) (polynomials of degree ≤ k, de-homogenised). D\_λ(L) := Hom\_cts(A\_λ(L), L) with the right action (µ|γ)(f) = µ(γ·f); it is a nuclear Fréchet space, D\_λ(L) = lim\_n D\_{n,λ}(L) with D\_{n,λ} the dual of A\_{n,λ}. Dualising V\_λ(L) ⊂ A\_λ(L) gives the Σ₀(p)-equivariant specialisation D\_λ(L) ↠ V\_λ(L)\*.

*Hypotheses.* L large enough to contain the embeddings; λ admissible; the Σ₀(p)-action uses the chosen identification O\_F ⊗ ℤ\_p ⊂ L^Σ through the embeddings.

*Proof or construction.*

1. A(L), its Banach stages on finitely many polydiscs of O\_F ⊗ ℤ\_p ≅ ℤ\_p^{[F:ℚ]} and the compactness of A\_n ↪ A\_{n+1} are LocallyAnalyticDistributions:L0/multivariable-fixed-radius and L0/relatively-compact-restriction; the dual of the compact manifold is nuclear Fréchet by L0/locally-analytic-dual-nuclear and L0/compact-type-nuclear-duality.
2. The formula defines an action of Σ₀(p) because a + cz is a unit for z ∈ O\_F ⊗ ℤ\_p when c ∈ p and a is a unit; locally analytic functions are preserved (L0/locally-analytic-pullback).
3. Specialisation is the transpose of the inclusion of polynomials of degree ≤ k.

*Uses.* BSW Definition 6.5: coefficients of overconvergent modular symbols; BSW §8.2: theta maps between A\_λ and A\_{λ\_σ}; BSW Definition 9.1: the subspace A\_λ^{f,+} of E(f)-covariant functions.

*API.*

- `GL2F.analyticCoeff` (constructor): A\_λ(L) with its left Σ₀(p)-action and Banach stages A\_{n,λ}.
- `GL2F.distCoeff` (constructor): D\_λ(L) with its right Σ₀(p)-action; distCoeff\_eq\_limit: D\_λ = lim\_n D\_{n,λ}.
- `GL2F.specialise` (projection): The Σ₀(p)-equivariant surjection D\_λ(L) → V\_λ(L)\*.
- `GL2F.analyticCoeff_action_apply` (simp): (a b; c d)·f(z) = (ad−bc)^v(a+cz)^k f((b+dz)/(a+cz)).
- `GL2F.distCoeff_baseChange` (functoriality): D\_λ(L) ⊗\_L L′ ≅ D\_λ(L′) for finite L′/L.
- `GL2F.polynomial_le_analytic` (compatibility): V\_λ(L) ⊂ A\_λ(L) is the Σ₀(p)-stable subspace of polynomial functions of degree ≤ k.

*Unit tests.*

- `analyticCoeff_weight_zero` (degenerate): λ = (0, 0): the action is f ↦ f((b+dz)/(a+cz)) and V\_λ = constants.
- `analyticCoeff_rat` (compatibility): F = ℚ: GL2F.distCoeff equals ModularSymbolsPadicLFunctions’ D\_k(L) with the same right action.
- `specialise_monomial` (computation): F = ℚ, k = 2: specialise(µ) evaluates µ on 1, z, z², so the Dirac distribution at 0 maps to the functional P ↦ P(0).
- `analyticCoeff_not_gl2` (non-example): The matrix (0 1; 1 0) is not in Σ₀(p) and does not act on A\_λ(L): (a + cz) = z vanishes at 0.

*Acceptance.* F = ℚ: A\_λ(L) is the space of locally analytic functions on ℤ\_p with the weight-k action of Σ₀(p), and D\_λ is ModularSymbolsPadicLFunctions:L2/weight-k-distributions.

*Rests on.* `L1/admissible-weight-coefficients`, `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/relatively-compact-restriction`, `LocallyAnalyticDistributions:L0/locally-analytic-pullback`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `ModularSymbolsPadicLFunctions:L2/weight-k-distributions`.

*Sources.* BSW-2017-v3, Definitions 6.1–6.4, p. 21; §6 discussion before Definition 6.6, p. 22: BSW define V\_λ(L) as polynomial functions on O\_F ⊗ ℤ\_p, the semigroup Σ₀(p), the weight-λ action on A\_λ(L), its dual D\_λ(L), the specialisation map, and the nuclear Fréchet structure through the Banach stages of order n.

### Overconvergent modular symbols over F and the operators U\_𝔭

`L2/overconvergent-modular-symbols` — definition.

The space of overconvergent modular symbols is H^q\_c(Y₁(𝔫), L₂(D\_λ(L))), q = r₁ + r₂, with the specialisation map ρ to H^q\_c(Y₁(𝔫), L₂(V\_λ(L)\*)). For each prime 𝔭 | p fix a uniformiser π\_𝔭 ∈ L (as an element of O\_F ⊗ ℤ\_p supported at 𝔭) and let U\_𝔭 be the Hecke operator of the double coset of (1 0; 0 π\_𝔭) at 𝔭; U\_𝔭 acts on both spaces and ρ is equivariant. For a finite set of operators {U\_𝔭 : 𝔭 | p} and h = (h\_𝔭) ∈ ℚ^{{𝔭|p}}, M^{≤h} := ∩\_𝔭 M^{≤h\_𝔭, U\_𝔭}. A different uniformiser π′\_𝔭 = uπ\_𝔭 changes U\_𝔭 by the action of a unit and changes the normalisation of eigenvalues accordingly; the renormalised operator U′\_𝔭 = π\_𝔭^{−v\_𝔭(λ)}U\_𝔭 (v\_𝔭(λ) = Σ\_{σ∼𝔭}v\_σ) preserves integral structures and shifts slopes by v\_𝔭(λ)/e\_𝔭.

*Hypotheses.* The level 𝔫 is divisible by p; the centre acts trivially on D\_λ(L) (BSW Definition 3.2).

*Proof or construction.*

1. Cohomology with compact supports of the arithmetic local system L₂(D\_λ(L)) (ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes); D\_λ(L) is a right Ω₁(𝔫)-module through Ω₁(𝔫) → GL₂(O\_F ⊗ ℤ\_p) ∩ Σ₀(p).
2. Hecke operators at 𝔭 | p from the Hecke pair (Σ₀(p)-monoid, Ω₁(𝔫)) acting on (derived) invariants, ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants, realised as correspondences as in ALS.3/hecke-operator-formula; the double coset of (1 0; 0 π\_𝔭) lies in Σ₀(p).
3. Equivariance of ρ is equivariance of the specialisation D\_λ → V\_λ\*.
4. Change of uniformiser and the shift of slopes: U\_𝔭 scaled by π\_𝔭^{-v\_𝔭(λ)} multiplies eigenvalues by an element of valuation −v\_𝔭(λ)/e\_𝔭.

*Uses.* BSW Theorem 8.7: the source of the control isomorphism; BSW §9.1: the classes evaluated to produce µ\_Ψ.

*API.*

- `GL2F.overconvergentSymbols` (constructor): H^q\_c(Y₁(𝔫), L₂(D\_λ(L))) with its Hecke action.
- `GL2F.specialisationMap` (projection): ρ to classical modular symbols, equivariant for all Hecke operators.
- `GL2F.upOperator` (constructor): U\_𝔭 for 𝔭 | p from a chosen uniformiser; upOperator\_comm: the U\_𝔭 commute.
- `GL2F.upOperator_changeUniformiser` (relation): Changing π\_𝔭 to uπ\_𝔭 conjugates U\_𝔭 by the action of diag(1, u) and rescales eigenvalues by the corresponding unit factor.
- `GL2F.slopeLE` (constructor): M^{≤h} = ∩\_𝔭 M^{≤h\_𝔭,U\_𝔭}.
- `GL2F.renormalisedUp` (other): U′\_𝔭 = π\_𝔭^{−v\_𝔭(λ)}U\_𝔭, with slope shift v\_𝔭(λ)/e\_𝔭.

*Unit tests.*

- `ocSymbols_rat` (compatibility): F = ℚ, N = p: the space equals Pollack–Stevens’ Symb\_{Γ₀(p)}(D\_k(L)) with the same U\_p.
- `upOperator_weight_shift` (computation): For F = ℚ, v = 1: U′\_p = p^{-1}U\_p and an eigenvalue of slope 2 for U\_p has slope 1 for U′\_p.
- `slopeLE_empty_set` (degenerate): If F has a single prime above p, slopeLE is the usual slope ≤ h subspace for U\_p.
- `ocSymbols_not_classical` (non-example): ρ is surjective but not injective: its kernel contains the image of the theta maps (Proposition 8.6) and is infinite-dimensional.

*Acceptance.* F = ℚ: the space of overconvergent modular symbols Symb\_{Γ₀(N)}(D\_k) with U\_p of Pollack–Stevens (ModularSymbolsPadicLFunctions:L2/control-theorem).

*Rests on.* `L2/locally-analytic-coefficients`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`, `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`.

*Sources.* BSW-2017-v3, Definition 6.5, p. 22; §3.2.1 p. 12; Definition 7.2 pp. 22–23; §8 opening p. 23; Definition 8.3 and the proof of Corollary 8.4 (U′\_𝔭), pp. 24–25; introduction p. 3: BSW define overconvergent modular symbols, the specialisation map, the operators U\_𝔭 from the fixed uniformisers, slope decompositions with respect to several operators, and the renormalised U′\_𝔭. WIL-2017, §6, pp. 30–34: Williams treats the two primes above a split p separately with their own U-operators in the Bianchi case.

### Compactness of the operators at p (corrected BSW Lemma 6.7)

`L2/up-compactness` — theorem.

Let η ∈ GL₂(F) ∩ Σ₀(p) whose lower-right entry d lies in p(O\_F ⊗ ℤ\_p), for example η = (1 0; 0 p). Then the action of η on D\_λ(L) is compact in the sense of BSW Definition 6.6: it factors through D\_λ(L) → D\_{n−1,λ}(L) → D\_{n,λ}(L) for every n, because z ↦ (b + dz)/(a + cz) maps each closed disc of radius |p|^{n−1} into one of radius |p|^n. Consequently the lift of the operator U\_p of the double coset of (1 0; 0 p) at all primes above p (which agrees with ∏\_{𝔭|p} U\_𝔭^{e\_𝔭} up to the action of the unit p·∏\_𝔭π\_𝔭^{−e\_𝔭} of O\_F ⊗ ℤ\_p) to a finite complex of copies of D\_λ(L) computing H^•\_c(Y₁(𝔫), L₂(D\_λ(L))) is compact. An arbitrary element of GL₂(F) ∩ Σ₀(p), for example the identity, does not act compactly.

*Hypotheses.* d ∈ p(O\_F ⊗ ℤ\_p) (radius improvement in every coordinate); for a single U\_𝔭 the improvement is only in the 𝔭-coordinates.

*Proof or construction.*

1. For η with d ∈ p and c ∈ p, the map z ↦ (b + dz)/(a + cz) is analytic and contracts every coordinate disc by |p|, so pullback sends A\_{n,λ} into A\_{n−1,λ} and the transpose factors D\_λ → D\_{n−1,λ} → D\_{n,λ} (LocallyAnalyticDistributions:L4/contracting-family-compactness, L4/compact-frechet-factorization).
2. The cellular chains C\_• of ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model are bounded finite free over ℤ[G(F) × K], so Hom(C\_•, D\_λ(L)) computes the cohomology with terms finite sums of copies of D\_λ(L) (only the finite freeness of C\_• is used, not the finite-projective coefficient clause); lift U\_p to it; each term’s action is a finite sum of compact maps.
3. The identity is not compact: the coefficient functionals of degree m have norm 1 on D\_{0,λ} and |p|^{-m} on D\_{1,λ}, so no continuous factorisation through D\_{0,λ} → D\_{1,λ} exists (sourceIssues E2).

*Acceptance.* F = ℚ: (1 0; 0 p) acts compactly on D\_k (Pollack–Stevens), the case used by ModularSymbolsPadicLFunctions:L2/control-theorem.

*Rests on.* `L2/locally-analytic-coefficients`, `L2/overconvergent-modular-symbols`, `LocallyAnalyticDistributions:L4/contracting-family-compactness`, `LocallyAnalyticDistributions:L4/compact-frechet-factorization`, `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`.

*Sources.* BSW-2017-v3, Definition 6.6 and Lemma 6.7, p. 22; proof of Theorem 7.3, p. 23: BSW define compact endomorphisms of a nuclear Fréchet space and assert compactness of the action of elements of GL₂(F) ∩ Σ₀(p), using it for (1 0; 0 p) in the slope decomposition; see sourceIssues E2 for the restriction needed.

### Slope decompositions of overconvergent cohomology

`L2/slope-decomposition` — theorem.

For admissible λ, every i and every h ∈ ℚ, H^i\_c(Y₁(𝔫), L₂(D\_λ(L))) has a slope ≤ h decomposition for U\_p: M = M₁ ⊕ M₂ with M₁ finite-dimensional, det(1 − U\_pX)|M₁ of slope ≤ h, and Q\*(U\_p) invertible on M₂ for every Q of slope ≤ h. Because the U\_𝔭 commute with U\_p, the finite-dimensional M^{≤h,U\_p} decomposes further under each U\_𝔭, giving M^{≤h} for h ∈ ℚ^{{𝔭|p}}. Slope decompositions are exact in short exact sequences of modules that admit them, and for a compact operator on a nuclear Fréchet space M = lim M\_n, M^{≤h} ≅ M\_n^{≤h} for every n (also for complexes and their cohomology).

*Hypotheses.* The endpoint convention of LocallyAnalyticDistributions §4.16: the complement inverts every polynomial whose roots have valuation ≤ h, equality included.

*Proof or construction.*

1. Riesz theory for a compact operator on a nuclear Fréchet complex (LocallyAnalyticDistributions:L4/frechet-finite-slope, L4/finite-slope-summands) applied to the compact lift of U\_p (up-compactness).
2. Pass to cohomology (L4/cohomology-slope-comparison).
3. Refine the finite-dimensional U\_p-part by the commuting U\_𝔭.
4. Exactness and independence of n: Urban’s Corollary 2.3.5 and Lemma 2.3.13 (BSW Lemma 8.1(i)–(ii)).

*Acceptance.* F = ℚ: Pollack–Stevens’ slope decomposition of Symb(D\_k).

*Rests on.* `L2/up-compactness`, `LocallyAnalyticDistributions:L4/frechet-finite-slope`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/cohomology-slope-comparison`, `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`.

*Sources.* BSW-2017-v3, Definitions 7.1–7.2, Theorem 7.3 and its proof sketch, pp. 22–23; Lemma 8.1(i)–(ii), pp. 23–24: BSW state that compactly supported overconvergent cohomology admits slope decompositions for U\_p, following Urban, and record exactness and the comparison with the Banach stages.

### Vanishing below the weight-shifted slope (corrected BSW Lemma 8.1(iii), Corollary 8.4)

`L2/negative-slope-vanishing` — lemma.

Let ν = (k, v) with k + 2v parallel (k\_σ may be negative) and h ∈ ℚ^{{𝔭|p}} with h\_𝔭 < v\_𝔭(ν)/e\_𝔭 for some 𝔭 | p. Then H^r\_c(Y₁(𝔫), L₂(D\_ν(L)))^{≤h} = 0 for all r, and the same holds for Σ₀(p)-stable submodules of D\_ν(L) and quotients by them. The underlying lemma requires a bounded open O\_L-lattice 𝓜 in the Banach module M = H^r\_c(Y₁(𝔫), L₂(D\_{ν,0}(L))), stable under the O\_L-algebra generated by the renormalised operators U′\_𝔭 = π\_𝔭^{−v\_𝔭(ν)}U\_𝔭; then any vector of slope < 0 for some U′\_𝔭 would generate an unbounded orbit inside 𝓜.

*Hypotheses.* The lattice is bounded and open (absorbing); stability is under O\_L[U′\_𝔭], not under L-scalars (sourceIssues E3).

*Proof or construction.*

1. Take 𝓜 the image of H^r\_c(Y₁(𝔫), L₂(D\_{ν,0}(O\_L))); it is bounded because the integral distributions have norm ≤ 1, and open because it spans after inverting p; U′\_𝔭 preserves it.
2. If M^{≤h′} ≠ 0 with h′\_𝔭 < 0, after a finite extension there is x with U′\_𝔭x = αx, v\_p(α) < 0; rescale x into 𝓜; then α^n x = U′\_𝔭^n x ∈ 𝓜 for all n while ‖α^n x‖ → ∞, contradicting boundedness.
3. Pass from D\_{ν,0} to D\_ν by the Banach-stage comparison of slope-decomposition, and from U′\_𝔭 to U\_𝔭 by the slope shift h\_𝔭 = h′\_𝔭 + v\_𝔭(ν)/e\_𝔭.
4. Submodules and quotients by the long exact sequence and exactness.

*Acceptance.* F = ℚ, ν = (k, v) with v = −1: nothing of slope < −1 for U\_p.

*Rests on.* `L2/slope-decomposition`, `L2/overconvergent-modular-symbols`.

*Sources.* BSW-2017-v3, Lemma 8.1(iii), p. 24; Definitions 8.2–8.3 and Corollary 8.4 with its proof, pp. 24–25: BSW prove the vanishing below v\_𝔭(ν)/e\_𝔭 through an integral submodule stable under the renormalised operators; see sourceIssues E3 for the hypothesis.

### Theta maps and partially overconvergent coefficients

`L2/theta-maps-partial-classicality` — construction.

For σ ∈ Σ let λ\_σ = (k′, v′) with k′\_σ = −2 − k\_σ, v′\_σ = v\_σ + k\_σ + 1 and k′\_τ = k\_τ, v′\_τ = v\_τ for τ ≠ σ. The derivative (d/dz\_σ)^{k\_σ+1} defines Θ\_σ : A\_λ(L) → A\_{λ\_σ}(L), equivariant for Σ₀(p) but changing the U\_𝔭-normalisation at 𝔭 = 𝔭(σ) by det^{k\_σ+1}; Θ\*\_σ : D\_{λ\_σ}(L) → D\_λ(L) is its dual. For J ⊂ Σ, A^J\_ν(L) is the space of functions locally analytic in z\_σ (σ ∉ J) and locally polynomial of degree ≤ max(k\_σ, 0) in z\_σ (σ ∈ J), and D^J\_ν its dual. Ordering Σ = {σ₁, …, σ\_d} and J\_s = {σ₁, …, σ\_s}, coker(Θ\*\_s) = D^{J\_s}\_λ and there is the exact sequence ⊕\_σ D\_{λ\_σ}(L) → D\_λ(L) → V\_{λ,loc}(L)\* → 0 (the last terms of Urban’s locally analytic BGG resolution), together with the short exact sequences 0 → D^{J\_{s−1}}\_{λ\_{σ\_s}} → D^{J\_{s−1}}\_λ → D^{J\_s}\_λ → 0.

*Hypotheses.* λ admissible; the quotient D^{J\_{s−1}}\_{λ\_{σ\_s}} of D\_{λ\_{σ\_s}} is the one making the sequence exact (BSW eq. (10)).

*Proof or construction.*

1. Θ\_σ is well defined on locally analytic functions, expanding in local power series in the variable z\_σ.
2. Equivariance: differentiating the weight-λ action k\_σ + 1 times in z\_σ gives the weight-λ\_σ action (Urban Proposition 3.2.11).
3. Exactness of the BGG tail: a distribution not in the image of Θ\*\_1 is detected by a monomial of degree ≤ k\_{σ₁} in z\_{σ₁}; induction on s (Urban Proposition 3.2.12).

*Uses.* BSW Lemma 8.8 and Theorem 8.7: induction from overconvergent to classical coefficients one embedding at a time.

*API.*

- `GL2F.thetaMap` (constructor): Θ\_σ : A\_λ(L) → A\_{λ\_σ}(L), Σ₀(p)-equivariant.
- `GL2F.thetaWeight` (data): λ ↦ λ\_σ with k′\_σ = −2 − k\_σ, v′\_σ = v\_σ + k\_σ + 1.
- `GL2F.partiallyClassicalDist` (constructor): D^J\_ν(L) for J ⊂ Σ, with D^∅ = D\_ν and D^Σ = V\_{ν,loc}\*.
- `GL2F.bgg_exact` (characterisation): ⊕\_σ D\_{λ\_σ} → D\_λ → V\_{λ,loc}\* → 0 is exact.
- `GL2F.partialSpecialise_exact` (relation): 0 → D^{J\_{s−1}}\_{λ\_{σ\_s}} → D^{J\_{s−1}}\_λ → D^{J\_s}\_λ → 0 is exact.
- `GL2F.thetaMap_up` (compatibility): Θ\*\_σ intertwines U\_𝔭 on D\_{λ\_σ} with det^{k\_σ+1}·U\_𝔭 on D\_λ at 𝔭 = 𝔭(σ).

*Unit tests.*

- `theta_rat_weight_zero` (computation): F = ℚ, k = 0: Θ = d/dz and λ\_σ = (−2, 1).
- `theta_kills_polynomials` (characterisation): Θ\_σ vanishes on V\_λ(L) (degree ≤ k\_σ in z\_σ), so Θ\*\_σ lands in the kernel of specialisation.
- `partial_empty` (degenerate): D^∅\_λ = D\_λ(L) and D^Σ\_λ = V\_{λ,loc}(L)\*.
- `theta_wrong_order` (non-example): (d/dz)^{k\_σ} instead of (d/dz)^{k\_σ+1} does not intertwine the weight actions; the BGG sequence fails.

*Acceptance.* F = ℚ: Θ = (d/dz)^{k+1} : A\_k → A\_{−2−k} and the exact sequence D\_{−2−k} → D\_k → V\_k\* → 0 of Stevens.

*Rests on.* `L2/locally-analytic-coefficients`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`.

*Sources.* BSW-2017-v3, §8.2, eq. (8), Definition 8.5, Proposition 8.6, pp. 25–26; eq. (10), p. 27: BSW define the weights λ\_σ, the theta maps Θ\_σ and their duals, the partially classical modules D^J\_ν, the BGG tail exact sequence (following Urban) and the short exact sequences used in the control theorem.

### BSW control theorem in small slope (Theorem 8.7)

`L2/control-theorem` — theorem.

Let λ = (k, v) be admissible and h = (h\_𝔭) ∈ ℚ^{{𝔭|p}}, with k⁰\_𝔭 := min{k\_σ : σ ∼ 𝔭} and v\_𝔭(λ) := Σ\_{σ∼𝔭} v\_σ. If for every 𝔭 | p h\_𝔭 < (k⁰\_𝔭 + v\_𝔭(λ) + 1)/e\_𝔭, then for every r the specialisation ρ : H^r\_c(Y₁(𝔫), L₂(D\_λ(L)))^{≤h} → H^r\_c(Y₁(𝔫), L₂(V\_λ(L)\*))^{≤h} is an isomorphism, the slope ≤ h subspaces being taken for the U\_𝔭 normalised by the fixed uniformisers (with v\_p(p) = 1). Renormalising U\_𝔭 to U′\_𝔭 shifts the bound by −v\_𝔭(λ)/e\_𝔭.

*Hypotheses.* The level hypothesis p ∣ 𝔫 (Iwahori-type level at every 𝔭 | p); L contains the embeddings and the eigenvalues.

*Proof or construction.*

1. Replace V\_λ(L)\* by V\_{λ,loc}(L)\* using the Banach-stage comparison (Lemma 8.1(ii)): the slope ≤ h parts agree.
2. Lemma 8.8: for each s, specialisation D^{J\_{s−1}}\_λ → D^{J\_s}\_λ induces an isomorphism on slope ≤ h cohomology, because the kernel D^{J\_{s−1}}\_{λ\_{σ\_s}} has weight with v\_{𝔭}(λ\_{σ\_s}) = v\_𝔭(λ) + k\_{σ\_s} + 1 and negative-slope-vanishing kills its slope ≤ h cohomology when h\_𝔭 < (k\_{σ\_s} + v\_𝔭(λ) + 1)/e\_𝔭 (theta-maps-partial-classicality, long exact sequence).
3. Induction on s from D^∅ = D\_λ to D^Σ = V\_{λ,loc}\*.

*Acceptance.* F = ℚ: Stevens’ control theorem for slope < k + 1 (ModularSymbolsPadicLFunctions:L2/control-theorem). F imaginary quadratic, weight (k, k), p split: slope < k + 1 at each prime above p (Williams Theorem 6.10).

*Rests on.* `L2/theta-maps-partial-classicality`, `L2/negative-slope-vanishing`, `L2/slope-decomposition`, `ModularSymbolsPadicLFunctions:L2/control-theorem`.

*Sources.* BSW-2017-v3, Theorem 8.7, Lemma 8.8 and their proofs, pp. 26–27; small-slope definition in the introduction, p. 3: BSW prove that specialisation is an isomorphism on slope ≤ h parts when h\_𝔭 < (k⁰\_𝔭 + v\_𝔭(λ) + 1)/e\_𝔭 for every 𝔭 | p. WIL-2017, Theorem 6.10, p. 34: Williams’ Bianchi control theorem with the slope bound at each prime above p.

### Unique small-slope overconvergent eigenlift

`L2/small-slope-eigenlift` — theorem.

Let Φ be a cuspidal eigenform of weight λ and level Ω₁(𝔫) whose U\_𝔭-eigenvalues λ\_𝔭 satisfy v\_p(λ\_𝔭) < (k⁰\_𝔭 + v\_𝔭(λ) + 1)/e\_𝔭 for every 𝔭 | p (small slope). Then the p-adic modular symbol θ\_L of Φ lies in the small-slope part, and there is a unique Ψ\_Φ ∈ H^q\_c(Y₁(𝔫), L₂(D\_λ(L))) with ρ(Ψ\_Φ) = θ\_L; Ψ\_Φ is a Hecke eigensymbol with the same eigenvalues as Φ.

*Hypotheses.* L contains the eigenvalues of Φ; small slope at every 𝔭 | p.

*Proof or construction.*

1. θ\_L is an eigensymbol with U\_𝔭-eigenvalue λ\_𝔭, hence lies in the slope ≤ h part for h\_𝔭 = v\_p(λ\_𝔭).
2. Apply control-theorem in degree q; the preimage of an eigenvector under a Hecke-equivariant isomorphism is an eigenvector with the same eigenvalues.

*Acceptance.* F = ℚ: the Pollack–Stevens overconvergent lift of a small-slope p-stabilised newform (ModularSymbolsPadicLFunctions:L2/overconvergent-lift).

*Rests on.* `L2/control-theorem`, `L1/period-normalised-symbol`, `ModularSymbolsPadicLFunctions:L2/overconvergent-lift`.

*Sources.* BSW-2017-v3, Introduction p. 3; §9 opening p. 28; §11 opening p. 38: BSW attach to a small-slope cuspidal eigenform its p-adic modular symbol and the unique small-slope overconvergent eigenlift via the control theorem.

### Overconvergent evaluation maps Ev^{a\_y}\_{f,†}

`L2/overconvergent-evaluation` — construction.

For f ∣ p^∞ and Ψ ∈ H^q\_c(Y₁(𝔫), L₂(D\_λ(L))): pull back along η\_f; untwist the action of units by ζ : µ ↦ µ \* (1 −1; 0 (π\_f)\_{v|p}) (an element of Σ₀(p)), so that u ∈ U(f) acts by (u 0; 0 1); pull back to the component through τ\_{a\_y}, where now e ∈ E(f) acts by (e^{-1} 0; 0 1); restrict coefficients along ν : D\_λ(L) → D^{f,+}\_λ(L), the dual of A^{f,+}\_λ(L) = {f ∈ A\_λ(L) : (e 0; 0 1)·f = f for all e ∈ E(f)} = {f : f(ez) = e^{k+v}f(z)}, which makes the local system constant; integrate over the oriented q-manifold. The result is Ev^{a\_y}\_{f,†}(Ψ) ∈ D^{f,+}\_λ(L); it depends on the representative a\_y.

*Hypotheses.* f ∣ p^∞; representatives a\_y of Cl⁺\_F(f) with trivial infinite components.

*Proof or construction.*

1. Each step is a map of local systems on X\_f or on E(f)F\_∞¹\\F\_∞⁺ (BSW §9.1.1–9.1.4); the untwisting matrix lies in Σ₀(p).
2. After restriction to D^{f,+}\_λ the local system is constant, and integration identifies compactly supported top cohomology with the coefficients.

*Uses.* BSW Definition 9.5: summed over components to give µ^f\_Ψ; BSW Proposition 10.3: specialises to the classical Ev\_{f,j,2}.

*API.*

- `GL2F.ocEvalComponent` (constructor): Ev^{a\_y}\_{f,†} : H^q\_c(Y₁(𝔫), L₂(D\_λ(L))) → D^{f,+}\_λ(L), L-linear.
- `GL2F.covariantAnalytic` (data): A^{f,+}\_λ(L) = {f : f(ez) = e^{k+v}f(z), e ∈ E(f)} and its dual D^{f,+}\_λ(L).
- `GL2F.ocEvalComponent_rep_change` (relation): For a′\_y = a\_yγur: Ev^{a′\_y}\_{f,†}(Ψ) = Ev^{a\_y}\_{f,†}(Ψ) \* (ũ^{-1} 0; 0 1) (BSW proof of Proposition 9.6).
- `GL2F.ocEvalComponent_specialise` (compatibility): Evaluation at z^{k−j} after Ev^{a\_y}\_{f,†} equals Ev^{a\_y}\_{f,j,2}∘ρ (Proposition 10.3).

*Unit tests.*

- `ocEval_rat` (compatibility): F = ℚ, f = p: Ev^{a}\_{p,†}(Ψ) is the Pollack–Stevens value of Ψ at {a/p} − {∞} after the matrix twist.
- `ocEval_covariance` (characterisation): Elements of A^{f,+}\_λ satisfy f(ez) = e^{k+v}f(z); for F = ℚ, E(f) = {1} and A^{f,+}\_λ = A\_λ.
- `ocEval_specialise_zero` (computation): For Ψ in the kernel of ρ, every Ev^{a\_y}\_{f,j,2}(ρΨ) = 0 although Ev^{a\_y}\_{f,†}(Ψ) need not vanish.
- `ocEval_rep_dependence` (non-example): Without the compensating change of test function, Ev^{a\_y}\_{f,†}(Ψ) evaluated at a fixed function changes with a\_y; Definition 9.5 must use the twisted functions ϕ\*\_{a\_y}.

*Acceptance.* F = ℚ, f = p^m: Ev^{a}\_{f,†}(Ψ) is Ψ({a/p^m} − {∞}) up to the matrix (1 −1; 0 p^m).

*Rests on.* `L2/overconvergent-modular-symbols`, `L1/automorphic-cycles`, `L2/locally-analytic-coefficients`.

*Sources.* BSW-2017-v3, §9.1.1–9.1.5, Definitions 9.1–9.2, pp. 28–30: BSW define the overconvergent evaluation by pullback, twisting by ζ, passage to components and restriction of coefficients to the E(f)-covariant functions, landing in D^+\_λ(L).

### Weighted inversion of unit-invariant test functions (BSW Definition 9.4)

`L2/inversion-weight-twist` — construction.

For ψ : O\_F ⊗ ℤ\_p → L supported on {z ∈ (O\_F ⊗ ℤ\_p)^× : z ≡ 1 mod f} with ψ(ez) = ψ(z) for e ∈ E(f), define ψ\* ∈ A^{f,+}\_λ(L) by ψ\*(z) = z^{k+v}ψ(z^{-1}) on units and ψ\*(z) = 0 otherwise. It is locally analytic when ψ is, and satisfies the covariance ψ\*(ez) = e^{k+v}ψ\*(z). The inversion z^{-1} (rather than z) makes the twist compatible with the contragredient change of evaluation maps under a change of representatives: for ũ ∈ U(f), ((ũ 0; 0 1)·ψ\*)(z) = (ψ(ũ·))\*(z).

*Hypotheses.* ψ supported in the units, so extension by zero is continuous (the units are clopen in O\_F ⊗ ℤ\_p).

*Proof or construction.*

1. Define pointwise; local analyticity is preserved by multiplication by the analytic function z^{k+v} and by z ↦ z^{-1} on the units, and extension by zero along the clopen unit group (PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension for continuity, LocallyAnalyticDistributions:L0/locally-analytic-pullback for analyticity).
2. Covariance: ψ\*(ez) = (ez)^{k+v}ψ(e^{-1}z^{-1}) = e^{k+v}z^{k+v}ψ(z^{-1}) using E(f)-invariance of ψ.
3. Translation formula: ((u 0; 0 1)·f)(z) = u^{k+v}f(u^{-1}z) for the weight-λ action, which gives the stated identity.

*Uses.* BSW Definition 9.5: the test function Ev^{a\_y}\_{f,†}(Ψ) is evaluated at ϕ\*\_{a\_y}; BSW eq. (13): for ϕ = ϕ\_{p-fin} the twist produces z^{k+v−r}.

*API.*

- `GL2F.weightedInversion` (constructor): ψ ↦ ψ\*, L-linear from E(f)-invariant functions supported on z ≡ 1 mod f to A^{f,+}\_λ(L).
- `GL2F.weightedInversion_apply` (simp): ψ\*(z) = z^{k+v}ψ(z^{-1}) on units, 0 off the units.
- `GL2F.weightedInversion_covariant` (characterisation): ψ\*(ez) = e^{k+v}ψ\*(z) for e ∈ E(f).
- `GL2F.weightedInversion_translate` (compatibility): (ũ 0; 0 1)·ψ\* = (ψ(ũ·))\* for ũ ∈ U(f)/U(p^∞).
- `GL2F.weightedInversion_involutive` (equivalence): Applying the construction twice with weight k+v returns ψ (on functions supported in the units).
- `GL2F.weightedInversion_character` (example): For ψ = ϕ\_{p-fin} restricted to a fibre, ψ\* = ε\_ϕϕ\_f(a\_y)·z^{k+v−r}·1\_{G\_y}.

*Unit tests.*

- `twist_trivial_weight` (degenerate): For k + v = 0, ψ\*(z) = ψ(z^{-1}).
- `twist_character_degree` (computation): F = ℚ, k + v = 2, ψ(z) = z³ on ℤ\_p^× (p ≠ 2): ψ\*(2) = 1/2, not 2 or 32.
- `twist_constant_one` (compatibility): The constant function 1 on the units goes to z ↦ z^{k+v} extended by zero, the restriction of an element of V\_λ(L) to the units.
- `twist_no_inverse_nonexample` (non-example): The variant z^{k+v}ψ(z) fails weightedInversion\_translate: with ψ(z) = z and u = 4 on ℚ\_3 units the two sides differ by 1/16.

*Acceptance.* F = ℚ, k + v = 2, ψ(z) = z³: ψ\*(z) = z^{-1} on ℤ\_p^×; at z = 2 (p ≠ 2) the value is 1/2, not 2 or 32.

*Rests on.* `L2/locally-analytic-coefficients`, `L0/unit-invariance-closure`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension`, `LocallyAnalyticDistributions:L0/locally-analytic-pullback`.

*Sources.* BSW-2017-v3, Definition 9.4, p. 31; proofs of Propositions 9.6 and 9.9, pp. 32 and 34: BSW define ψ\* by the weight factor z^{k+v} and the inversion z^{-1}, extended by zero, and use its transformation under (ũ 0; 0 1) in the representative-independence and norm-relation proofs.

### The distribution µ^f\_Ψ of a level f (BSW Definition 9.5)

`L2/finite-evaluation` — construction.

Let f ∣ p^∞ be divisible by every prime above p and A\_f = {a\_y} representatives of Cl⁺\_F(f). For a locally analytic function ϕ on Cl⁺\_F(p^∞) with fibre functions ϕ\_{a\_y}(z) = ϕ(a\_y z) on G = {z ≡ 1 mod f}/Ē\_+(f) (forward chart, sourceIssues E1), define µ^{A\_f}\_Ψ(ϕ) := Σ\_{y∈Cl⁺\_F(f)} Ev^{a\_y}\_{f,†}(Ψ)(ϕ\*\_{a\_y}). This is a locally analytic distribution on Cl⁺\_F(p^∞) (an element of D(Cl⁺\_F(p^∞), L) of ray-class-distributions).

*Hypotheses.* f divisible by all primes above p; representatives fixed.

*Proof or construction.*

1. Each summand is a continuous linear functional of ϕ: restriction to the fibre, inversion-weight-twist, then the distribution Ev^{a\_y}\_{f,†}(Ψ).
2. Finite sum over Cl⁺\_F(f).

*Uses.* BSW Proposition 9.6 and Theorem 9.10: independence of representatives and of f after normalisation; BSW eq. (13): values at p-adic avatars.

*API.*

- `GL2F.levelDistribution` (constructor): µ^{A\_f}\_Ψ ∈ D(Cl⁺\_F(p^∞), L), L-linear in Ψ.
- `GL2F.levelDistribution_apply` (simp): µ^{A\_f}\_Ψ(ϕ) = Σ\_y Ev^{a\_y}\_{f,†}(Ψ)(ϕ\*\_{a\_y}).
- `GL2F.levelDistribution_reindex` (compatibility): Reindexing the sum along a bijection of Cl⁺\_F(f) with the representatives transported leaves the value unchanged.
- `GL2F.levelDistribution_avatar` (example): µ^{A\_f}\_Ψ(ϕ\_{p-fin}) = Σ\_y ε\_ϕϕ\_f(a\_y)Ev^{a\_y}\_{f,†}(Ψ)(z^{k+v−r}) (BSW eq. (13), before the factor λ\_f^{-1}).

*Unit tests.*

- `finite_empty` (degenerate): Ψ = 0 gives the zero distribution.
- `finite_single` (computation): F = ℚ, p = 2, f = (2): Cl⁺\_ℚ(2) is trivial, so the sum has one term, Ev^{1}\_{(2),†}(Ψ)(ϕ\*); for p odd and f = (p) there are p − 1 terms, one for each class of (ℤ/p)^×.
- `finite_rat_compat` (compatibility): For F = ℚ the value at a finite-order character of conductor p^m equals the Pollack–Stevens sum Σ\_a χ(a)Ψ({a/p^m} − {∞})(1) up to the U\_p normalisation.
- `finite_untwisted_nonexample` (non-example): Evaluating at ϕ\_{a\_y} instead of ϕ\*\_{a\_y} does not give a function in A^{f,+}\_λ; the pairing is undefined for F with infinite unit group.

*Acceptance.* F = ℚ, f = p: µ^p\_Ψ(ϕ) = Ψ({0} − {∞}) evaluated at the twisted restriction of ϕ to 1 + pℤ\_p plus the other residue classes, the Pollack–Stevens µ before normalisation.

*Rests on.* `L2/overconvergent-evaluation`, `L2/inversion-weight-twist`, `L0/ray-class-distributions`.

*Sources.* BSW-2017-v3, §9.2.2 and Definition 9.5, p. 31: BSW regard ϕ as a family of fibre functions, twist each by Definition 9.4 and sum the overconvergent evaluations at them over Cl⁺\_F(f).

### Independence of class-group representatives (BSW Proposition 9.6)

`L2/finite-evaluation-representative` — theorem.

For fixed f, µ^{A\_f}\_Ψ does not depend on the representatives A\_f; write µ^f\_Ψ. Precisely, if a′\_y = a\_yγur with γ ∈ F^×, u ∈ U(f), r ∈ F\_∞¹, then Ev^{a′\_y}\_{f,†}(Ψ) = Ev^{a\_y}\_{f,†}(Ψ) \* (ũ^{-1} 0; 0 1) and, with the forward chart, ϕ\_{a′\_y}(z) = ϕ\_{a\_y}(ũz), so ϕ\*\_{a′\_y} = (ũ 0; 0 1)·ϕ\*\_{a\_y}; the two changes cancel in each summand.

*Hypotheses.* Forward chart ϕ\_a(z) = ϕ(az) (sourceIssues E1); ũ the image of u in U(f)/U(p^∞).

*Proof or construction.*

1. Describe τ\_{a\_y} on local systems: (γa\_yur, µ) ↦ (r, µ \* (ũ^{-1} 0; 0 1)), well defined by the computation in the proof of Proposition 9.6.
2. Compute the effect of the representative change on the fibre functions and on their weighted inversions (inversion-weight-twist, weightedInversion\_translate).
3. Combine: Ev^{a′\_y}(ϕ\*\_{a′\_y}) = Ev^{a\_y}((ũ^{-1})·(ũ)·ϕ\*\_{a\_y}) = Ev^{a\_y}(ϕ\*\_{a\_y}).

*Acceptance.* F = ℚ: representatives can be changed only by elements of 1 + fℤ\_p, and the statement reduces to Γ₀-invariance of the modular symbol.

*Rests on.* `L2/finite-evaluation`, `L2/inversion-weight-twist`, `L2/overconvergent-evaluation`.

*Sources.* BSW-2017-v3, Proposition 9.3, p. 31; Proposition 9.6 and its proof, pp. 31–32: BSW prove that the change of representatives on the evaluation maps and on the test functions cancel; the chart convention needs the correction recorded in sourceIssues E1.

### The U\_f-eigenvalue λ\_f of a refined eigensymbol

`L2/refinement-eigenvalue` — definition.

Let Ψ be an eigenclass for every U\_𝔭, 𝔭 | p, with eigenvalues λ\_𝔭 ∈ L^× (nonzero because Ψ has finite slope). For f = ∏\_{𝔭|p} 𝔭^{n(𝔭)} put U\_f := ∏\_𝔭 U\_𝔭^{n(𝔭)} and λ\_f := ∏\_𝔭 λ\_𝔭^{n(𝔭)} ∈ L^×, the U\_f-eigenvalue of Ψ. It depends on the chosen uniformisers through the normalisation of the U\_𝔭.

*Hypotheses.* Finite set of primes above p; λ\_𝔭 nonzero.

*Proof or construction.*

1. Finite product in the commutative group L^×; U\_f is well defined because the U\_𝔭 commute.

*Uses.* BSW Theorem 9.10: the normalising scalar λ\_f^{-1}; BSW Theorem 11.1: the factor 1/λ\_f in the interpolation formula.

*API.*

- `GL2F.refinedEigenvalue` (constructor): λ\_f ∈ L^× for f ∣ p^∞.
- `GL2F.refinedEigenvalue_one` (simp): λ\_(1) = 1.
- `GL2F.refinedEigenvalue_mul` (relation): λ\_{ff′} = λ\_fλ\_{f′}.
- `GL2F.refinedEigenvalue_prime` (characterisation): λ\_{f𝔭} = λ\_fλ\_𝔭.
- `GL2F.refinedEigenvalue_eq_eigenvalue` (compatibility): Ψ|U\_f = λ\_fΨ.

*Unit tests.*

- `eigenvalue_empty` (degenerate): For f = (1) the eigenvalue is 1.
- `eigenvalue_two_primes` (computation): With λ\_{𝔭₁} = 2, λ\_{𝔭₂} = 3 and f = 𝔭₁²𝔭₂, λ\_f = 12.
- `eigenvalue_rat_compat` (compatibility): F = ℚ, f = p^m: λ\_f = α^m for the U\_p-eigenvalue α of ModularSymbolsPadicLFunctions:L2/refinement.
- `eigenvalue_zero_rejected` (non-example): A U\_𝔭-eigenvalue 0 (infinite slope) is excluded; no unit has underlying value 0, so the normalisation λ\_f^{-1} is undefined there.

*Acceptance.* Monoid homomorphism from exponent vectors to L^×.

*Rests on.* `L2/overconvergent-modular-symbols`.

*Sources.* BSW-2017-v3, Theorem 9.10, p. 34: BSW define U\_f as the product of the U\_𝔭^r over 𝔭^r ∥ f and λ\_f as its eigenvalue on Ψ.

### The norm relation µ^{f𝔭}\_Ψ = λ\_𝔭µ^f\_Ψ (BSW Lemma 9.8, Proposition 9.9)

`L2/norm-relation` — theorem.

Let f ∣ p^∞ be divisible by every prime above p and 𝔭 | p. (i) The trace X\_{f𝔭} → X\_f intertwines U\_𝔭: ζ\_\*η\_f^\*(Ψ|U\_𝔭) = Tr(ζ\_\*η\_{f𝔭}^\*Ψ). (ii) With representatives A\_{f𝔭} = {a\_yu\_r} built from A\_f and u\_r ∈ U(f) running over U(f)/E(f)U(f𝔭), Ev^{a\_yu\_r}\_{f𝔭,†}(Ψ) \* (ũ\_r 0; 0 1) = Ev^{a\_y}\_{f,†}(Ψ|U\_𝔭) restricted to G\_r = {z : ez ≡ u\_r mod f𝔭 for some e ∈ E(f)}. (iii) If Ψ is an eigensymbol for U\_𝔭 with eigenvalue λ\_𝔭, then µ^{f𝔭}\_Ψ = λ\_𝔭µ^f\_Ψ.

*Hypotheses.* f divisible by every prime above p (this is where the hypothesis enters).

*Proof or construction.*

1. (i) is Barrera Salazar’s Lemme 5.2 for the Hilbert case, whose proof works for any F: the trace along the finite covering of cycles X\_{f𝔭} → X\_f (L1/automorphic-cycles, cycleTrace) matches the trace in U\_𝔭 viewed as a correspondence on Y₁(𝔫) (ALS.3/level-trace).
2. (ii) follows from (i) and the commutative diagram of the trace with the restriction to G\_r, using the representative change of overconvergent-evaluation.
3. (iii) For ϕ on Cl⁺\_F(p^∞), ϕ\*\_{a\_y}|\_{G\_r} = (ũ\_r^{-1} 0; 0 1)·ϕ\*\_{a\_yu\_r}; sum (ii) over r ∈ R and y and replace Ψ|U\_𝔭 by λ\_𝔭Ψ.

*Acceptance.* F = ℚ: µ^{p^{m+1}} = αµ^{p^m}, the distribution property of Pollack–Stevens’ µ before normalisation.

*Rests on.* `L2/finite-evaluation-representative`, `L2/refinement-eigenvalue`, `L1/automorphic-cycles`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`.

*Sources.* BSW-2017-v3, §9.4, Lemma 9.8 and Proposition 9.9 with proofs, pp. 33–34: BSW relate the evaluation at level f𝔭 to the evaluation of Ψ|U\_𝔭 at level f through the trace and deduce µ^{f𝔭}\_Ψ = λ\_𝔭µ^f\_Ψ for an eigensymbol.

### The BSW p-adic L-function µ\_Ψ = λ\_f^{-1}µ^f\_Ψ (Theorem 9.10, Definition 9.11)

`L2/normalised-evaluation` — construction.

For a U\_𝔭-eigenclass Ψ (all 𝔭 | p) and any f ∣ p^∞ divisible by every prime above p, µ\_Ψ := λ\_f^{-1}µ^f\_Ψ ∈ D(Cl⁺\_F(p^∞), L). For Ψ = Ψ\_Φ the small-slope eigenlift of a cuspidal eigenform, µ\_Φ := µ\_{Ψ\_Φ} is the p-adic L-function of Φ. It depends on the fixed uniformisers at the primes above p and on the periods Ω^ε\_Φ, and on nothing else.

*Hypotheses.* Ψ an eigenclass with nonzero U\_𝔭-eigenvalues.

*Proof or construction.*

1. Scalar multiple of the distribution µ^f\_Ψ by the unit λ\_f^{-1}.
2. Independence of f and of the representatives is normalised-evaluation-common-level and finite-evaluation-representative.

*Uses.* BSW Theorem 11.1: the interpolation formula is a statement about µ\_Φ(ϕ\_{p-fin}); AutomorphicPadicLFunctions:L5/evaluation-principle-instances: the BSW instance of the conditional evaluation principle.

*API.*

- `GL2F.padicLFunction` (constructor): µ\_Ψ ∈ D(Cl⁺\_F(p^∞), L) for a finite-slope U\_𝔭-eigenclass Ψ.
- `GL2F.padicLFunction_apply` (simp): µ\_Ψ = λ\_f^{-1}µ^f\_Ψ for any admissible f.
- `GL2F.padicLFunction_smul` (simp): µ\_{cΨ} = cµ\_Ψ; in particular rescaling periods rescales µ\_Φ.
- `GL2F.padicLFunction_changeUniformiser` (relation): Changing the uniformisers changes the eigenvalues and the twisting matrices by units; the resulting µ differs by the corresponding explicit scalars on each conductor.
- `GL2F.padicLFunctionOf` (constructor): µ\_Φ := µ\_{Ψ\_Φ} for a small-slope cuspidal eigenform.

*Unit tests.*

- `normalise_one_prime` (computation): With one prime above p, λ\_𝔭 = 2 and µ^{𝔭^n} = 7·2^n·δ: normalisation gives 7δ at every n ≥ 1.
- `normalise_two_incomparable` (characterisation): With λ\_{𝔭₁} = 2, λ\_{𝔭₂} = 3 and µ^f = 5·2^{n₁}3^{n₂}δ: the incomparable levels (1, 2) and (2, 1) give the same µ = 5δ.
- `normalise_rat_compat` (compatibility): F = ℚ: µ\_Φ equals ModularSymbolsPadicLFunctions:L2/p-adic-l-function for the same refinement and periods.
- `normalise_excluded_zero_level` (non-example): A family with µ^{(1)} = 3δ and µ^{𝔭^n} = 2^nδ for n ≥ 1 satisfies every relation between admissible levels, yet λ\_{(1)}^{-1}µ^{(1)} = 3δ ≠ δ; level (1) is not admissible.

*Acceptance.* F = ℚ: µ\_Ψ is the Pollack–Stevens p-adic L-function α^{-m}µ^{p^m}.

*Rests on.* `L2/finite-evaluation`, `L2/refinement-eigenvalue`, `L2/small-slope-eigenlift`.

*Sources.* BSW-2017-v3, Theorem 9.10 and Definition 9.11, p. 34: BSW define µ\_Ψ = λ\_f^{-1}µ^f\_Ψ, show it is independent of choices up to the uniformisers, and call it the p-adic L-function of Φ.

### Independence of the level (BSW Theorem 9.10)

`L2/normalised-evaluation-common-level` — theorem.

If Ψ is an eigenclass for every U\_𝔭 (𝔭 | p), then λ\_f^{-1}µ^f\_Ψ = λ\_{f′}^{-1}µ^{f′}\_Ψ for all f, f′ ∣ p^∞ each divisible by every prime above p. The conclusion does not extend to levels missing a prime above p.

*Hypotheses.* The admissible levels are exactly those divisible by every prime above p; no comparability of f and f′ is assumed.

*Proof or construction.*

1. By norm-relation, λ\_{f𝔭}^{-1}µ^{f𝔭} = λ\_f^{-1}λ\_𝔭^{-1}λ\_𝔭µ^f = λ\_f^{-1}µ^f for each admissible f and 𝔭 | p.
2. For admissible f ∣ h, induct on the total exponent difference, raising one deficient prime at a time (each intermediate level stays admissible).
3. For arbitrary admissible f, f′ compare both with h = lcm(f, f′); this is the instance of L0/conditional-evaluation-principle’s independence clause.

*Acceptance.* Two primes above p: levels 𝔭₁𝔭₂² and 𝔭₁²𝔭₂ both compare with 𝔭₁²𝔭₂².

*Rests on.* `L2/norm-relation`, `L2/normalised-evaluation`, `L0/conditional-evaluation-principle`.

*Sources.* BSW-2017-v3, §9.4 (standing assumption) and Theorem 9.10, pp. 33–34: BSW deduce from Proposition 9.9 that λ\_f^{-1}µ^f\_Ψ is independent of f among levels divisible by every prime above p.

### Compatibility of classical and overconvergent evaluations (BSW Proposition 10.3, Corollary 10.4)

`L2/classical-overconvergent-compatibility` — theorem.

For Ψ ∈ H^q\_c(Y₁(𝔫), L₂(D\_λ(L))), evaluation at z^{k−j} of Ev^{a\_y}\_{f,†}(Ψ) equals Ev^{a\_y}\_{f,j,2}(ρ(Ψ)). Consequently, if φ is a small-slope Hecke eigensymbol with U\_f-eigenvalue λ\_f and eigenlift Ψ, then for every Hecke character ϕ of infinity type j + v (0 ≤ j ≤ k) and conductor f ∣ p^∞ divisible by every prime above p, µ\_Ψ(ϕ\_{p-fin}) = λ\_f^{-1}Ev\_{ϕ,2}(φ).

*Hypotheses.* f divisible by every prime above p for the corollary.

*Proof or construction.*

1. At steps 1–3 of the construction the specialisation commutes with η\_f, ζ\_f and τ\_{a\_y} on local systems.
2. At step 4, V\_λ(L)\* ↪ A\_λ(L) by P(X, Y) ↦ P(z, 1), so restriction to D^+\_λ followed by evaluation at z^{k−j} equals evaluation of the classical coefficient at X^{k−j}Y^j.
3. Combine with BSW eq. (13) for µ\_Ψ(ϕ\_{p-fin}).

*Acceptance.* F = ℚ: µ(χz^j) equals the twisted classical modular-symbol sum divided by α^m, Pollack–Stevens’ interpolation step.

*Rests on.* `L2/overconvergent-evaluation`, `L2/normalised-evaluation`, `L1/classical-evaluation-maps`.

*Sources.* BSW-2017-v3, Proposition 10.3 and Corollary 10.4, p. 37; eq. (13), p. 35: BSW show the overconvergent and classical evaluation maps commute with specialisation and deduce µ\_Ψ(ϕ\_{p-fin}) = λ\_f^{-1}Ev\_{ϕ,2}(φ) at characters ramified at every prime above p.

### Interpolation of critical L-values (BSW Theorem 11.1)

`L2/bsw-interpolation` — theorem.

Let Φ be a small-slope cuspidal eigenform over F of weight λ = (k, v), level Ω₁(𝔫) with p ∣ 𝔫, and µ\_Φ its p-adic L-function. For every Hecke character ϕ of conductor f ∣ p^∞ and infinity type j + v with 0 ≤ j ≤ k, with B the set of primes above p not dividing f: µ\_Φ(ϕ\_{p-fin}) = (−1)^{R(j,k)}·|D|·τ(ϕ)·π\_f^{j+v}·(2^{r₂}λ\_fΩ^{ε\_ϕ}\_Φ)^{-1}·∏\_{𝔭∈B}Z\_𝔭·Λ(Φ, ϕ), where Z\_𝔭 = ϕ\_{p-fin}(π\_𝔭)(1 − λ\_𝔭^{-1}ϕ(𝔭)^{-1}), R(j, k) = Σ\_{v∈Σ(ℝ)}(j\_v + k\_v) + Σ\_{v∈Σ(ℂ)}k\_v, D the discriminant of F, τ(ϕ) the Gauss sum, λ\_f the U\_f-eigenvalue and Ω^{ε\_ϕ}\_Φ the period. Each factor is a named quantity: sign, discriminant, Gauss sum, uniformiser power, power of 2, refined eigenvalue, period, Euler-type factor at each unramified 𝔭 | p, completed L-value.

*Hypotheses.* Small slope at every 𝔭 | p; Φ’s eigenlift Ψ\_Φ; fixed uniformisers and periods.

*Proof or construction.*

1. Characters ramified at every 𝔭 | p: classical-overconvergent-compatibility plus critical-value-formula (with Corollary 10.2’s π\_f^{j+v}).
2. General f (Lemma 10.5): pass to f′ = f∏\_{𝔭∈B}𝔭, use integral-formula’s change of conductor (Corollary 4.8) and the identity π\_𝔭^{j+v} = ϕ\_{p-fin}(π\_𝔭)ϕ(𝔭)^{-1} to turn ∏(ϕ(𝔭)λ\_𝔭 − 1) into ∏λ\_𝔭Z\_𝔭.

*Acceptance.* F = ℚ, ϕ = 1 (f = (1), B = {p}, λ\_(1) = 1, ε\_ϕ = +): µ\_Φ(1) = (−1)^{k}·(1 − λ\_p^{-1})·Λ(Φ, 1)/Ω⁺\_Φ, the factor (1 − α^{-1}) at the trivial character; Λ(Φ, 1) is the L-value of the level-𝔫 eigenform Φ itself, so for the p-stabilisation of a newform of level prime to p it already contains the second Euler factor (1 − β/p), and the product is Mazur–Tate–Teitelbaum’s (1 − α^{-1})(1 − β/p). F imaginary quadratic: compare Williams Theorem 7.4 (formula with 2ψ\_f(x\_f)λ\_f^{-1}/(ψ(x\_f)Dwτ(ψ^{-1}))).

*Rests on.* `L2/classical-overconvergent-compatibility`, `L1/critical-value-formula`, `L1/integral-formula`, `L0/hecke-character-avatar`.

*Sources.* BSW-2017-v3, Lemma 10.5 and eq. (15), p. 38; Theorem 11.1, pp. 38–39: BSW prove the interpolation formula at all characters of p-power conductor, with the factors Z\_𝔭 at the primes above p where ϕ is unramified. WIL-2017, Theorem 7.4, p. 40: Williams’ Bianchi interpolation formula, the imaginary quadratic instance in his normalisation.

### Choice-independence over a general number field and its limits

`L2/bsw-choice-independence` — theorem.

For F an arbitrary number field, µ\_Φ is independent of the class-group representatives and of the admissible level f, depending only on Φ, the periods and the uniformisers at the primes above p (Proposition 9.6, Theorem 9.10). BSW prove no growth (admissibility) bound for general F: a growth notion on Cl⁺\_F(p^∞) adapted to the available critical characters is not known in general, and when Cl⁺\_F(p^∞) has dimension r₂ + 1 + δ\_{F,p} larger than the number of independent infinity-type directions (for example F = ℚ(∛2), dimension 2 but only parallel types), interpolation cannot determine µ\_Φ. Per-place growth for general F is an open statement, not a target of this layer.

*Hypotheses.* F arbitrary; Φ small slope.

*Proof or construction.*

1. Independence: finite-evaluation-representative and normalised-evaluation-common-level.
2. Non-uniqueness mechanism: by leopoldt-dimension-formula the ray-class limit has dimension r₂ + 1 + δ, while by locally-algebraic-characters the avatars of critical characters only vary in the directions of admissible infinity types (one direction if F has a real place); the conditional-evaluation-principle’s uniqueness clause needs avatars spanning the test functions of the growth degree in every chart direction.

*Acceptance.* F = ℚ(∛2): the critical characters lie in the parallel direction while the group has dimension 2 (if the Leopoldt defect is zero).

*Rests on.* `L2/finite-evaluation-representative`, `L2/normalised-evaluation-common-level`, `L0/leopoldt-dimension-formula`, `L0/locally-algebraic-characters`, `L0/conditional-evaluation-principle`.

*Sources.* BSW-2017-v3, §12, pp. 39–40: BSW explain that admissibility gives uniqueness for F totally real or imaginary quadratic, that over a general field the right growth notion on Cl⁺\_F(p^∞) is unclear (with Loeffler’s cubic-field example), and that they settle for independence of choices.

### Growth and uniqueness when F is totally real or imaginary quadratic

`L2/growth-uniqueness-totally-real-imaginary-quadratic` — theorem.

(a) F imaginary quadratic, Φ of weight (k, k) with U\_𝔭-eigenvalues a\_𝔭, v(a\_𝔭) < (k + 1)/e\_𝔭 for every 𝔭 | p: the p-adic L-function is (h\_𝔭)\_{𝔭|p}-admissible with h\_𝔭 = v\_p(a\_𝔭), and hence is the unique such distribution with the interpolation values (Williams, Theorem 7.4). (b) F totally real, (π, α) a non-critical p-refinement of a cohomological cuspidal representation (unramified principal series at 𝔭 | p): the p-adic L-function L^ε\_p(π, α) has growth bounded by Σ\_{v|p}e\_v v\_p(α\_v) + Σ\_σ (κ\_σ − w)/2, and if the Leopoldt defect of F at p is zero it is uniquely determined by its support, growth, interpolation and variation properties (Bergdall–Hansen, Theorem 1.1.2(c),(f)); with vanishing defect the group is one-dimensional, so in small slope a distribution of the same growth is already determined by its critical values (Amice–Vélu, Bergdall–Hansen §1.8). In case (a) the BSW distribution µ\_Φ is Williams’ (BSW §12), so it is unique. In case (b) µ\_Φ equals L^ε\_p(π, α) under vanishing defect once µ\_Φ is known to have growth below the critical range; that growth bound for the overconvergent-cycle construction over totally real F is due to Barrera Salazar (cited by BSW §12 and Bergdall–Hansen §1.8), is proved neither by BSW nor by Bergdall–Hansen, and is a recorded gap here. The slope conditions are those of the cited theorems.

*Hypotheses.* (a): F imaginary quadratic, parallel weight, small slope at each prime above p. (b): F totally real, Leopoldt defect zero for uniqueness, non-critical refinement (implied by small slope); the growth bound for µ\_Φ itself is the gap on Barrera Salazar’s admissibility.

*Proof or construction.*

1. (a) Admissibility of slope-h eigensymbol values (Williams Definition 5.10 and Proposition 5.13; Definition 6.14 and Proposition 6.15 when p splits) and Amice–Vélu–Vishik uniqueness in the two-dimensional group (LocallyAnalyticDistributions:L2/tensor-multidegree-extension).
2. (b) Growth from the period maps of Bergdall–Hansen §7.4; uniqueness from Amice–Vélu in the one-dimensional group given by Leopoldt (LocallyAnalyticDistributions:L2/amice-velu-vishik).
3. Agreement with µ\_Φ: in (a) µ\_Φ is Williams’ distribution (the cycle is the path from 0 to ∞); in (b) both satisfy the interpolation of bsw-interpolation, and once µ\_Φ has the growth bound (Barrera Salazar, gap) uniqueness (L0/conditional-evaluation-principle) identifies BSW’s evaluation-map construction with Bergdall–Hansen’s period-map construction; Bergdall–Hansen leave this identification open without Leopoldt (§1.8).

*Acceptance.* F = ℚ(i), p split, weight (0, 0), ordinary at both primes: µ is a measure, unique.

*Rests on.* `L2/bsw-interpolation`, `L0/conditional-evaluation-principle`, `L0/leopoldt-dimension-formula`, `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`, `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `LocallyAnalyticDistributions:L2/rayclass-growth-adapter`.

*Sources.* WIL-2017, Definition 5.10 p. 28; Definition 6.14 and Proposition 6.15, p. 35; Theorem 7.4 p. 40: Williams proves that his Bianchi p-adic L-function is (h\_𝔭)-admissible with h\_𝔭 = v\_p(a\_𝔭) and hence unique. BH-2017, Theorem 1.1.2(c),(f), pp. 4–5; §1.8, pp. 11–12: Bergdall–Hansen give the growth bound and uniqueness under vanishing Leopoldt defect for Hilbert modular forms, and note that without Leopoldt the comparison with other constructions is not settled, while attributing the correct growth of the overconvergent-cycle construction over totally real F to Barrera Salazar’s thesis. BSW-2017-v3, §12, p. 39: BSW point to the totally real and imaginary quadratic cases as those where admissibility gives uniqueness.

### Specialisations: ℚ, Hilbert and Bianchi

`L2/specialisations-q-hilbert-bianchi` — comparison.

(a) F = ℚ: µ\_Φ equals the Pollack–Stevens p-adic L-function of ModularSymbolsPadicLFunctions:L2/p-adic-l-function for the same refinement, once the periods are matched as in L1/rational-modular-symbol-comparison. (b) F totally real: weights λ = (k, v) with k + 2v parallel include nonparallel k (Hilbert forms of nonparallel weight satisfying the parity condition), and the small-slope condition reads h\_𝔭 < (min\_{σ∼𝔭}k\_σ + v\_𝔭(λ) + 1)/e\_𝔭; µ\_Φ is the Hilbert p-adic L-function. (c) F imaginary quadratic: weight (k, k), q = 1, and µ\_Φ is Williams’ Bianchi p-adic L-function. In each case the factor dictionary (signs, Gauss sums τ(ϕ) versus τ(ϕ^{-1}), discriminant powers, periods) is stated explicitly.

*Hypotheses.* The rational, Hilbert and Bianchi constructions use their own period normalisations, recorded in the comparison.

*Proof or construction.*

1. (a) Identify the overconvergent symbols and evaluation at {a/p^m} − {∞} with Pollack–Stevens’ (BSW §9 opening), then compare the interpolation formulas.
2. (b) Specialise BSW’s weights and slope bound to F totally real; agreement with Bergdall–Hansen follows from growth-uniqueness-totally-real-imaginary-quadratic under Leopoldt.
3. (c) Compare with Williams Theorem 7.4, matching (−1)^{k+q+r}2ψ\_f(x\_f)λ\_f^{-1}/(ψ(x\_f)Dwτ(ψ^{-1})) with BSW’s factors.

*Acceptance.* F = ℚ, an ordinary weight-2 form: µ\_Φ is the Mazur–Swinnerton-Dyer measure up to the period normalisation.

*Rests on.* `L2/bsw-interpolation`, `L2/growth-uniqueness-totally-real-imaginary-quadratic`, `L1/rational-modular-symbol-comparison`, `ModularSymbolsPadicLFunctions:L2/p-adic-l-function`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`.

*Sources.* BSW-2017-v3, Introduction pp. 1–3; Definition 1.8 p. 8; §9 opening p. 28: BSW present their construction as generalising Pollack–Stevens over ℚ, Barrera Salazar’s Hilbert and Williams’ Bianchi constructions, with admissible weights allowing nonparallel k. WIL-2017, Theorem 7.4, p. 40: Williams’ Bianchi interpolation formula and normalisation.

### Dependencies of L2

Within this roadmap: `L0`, `L1`.

Other roadmaps and Tau Ceti layers: `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/locally-analytic-pullback`, `LocallyAnalyticDistributions:L0/multivariable-fixed-radius`, `LocallyAnalyticDistributions:L0/relatively-compact-restriction`, `LocallyAnalyticDistributions:L2/amice-velu-vishik`, `LocallyAnalyticDistributions:L2/rayclass-growth-adapter`, `LocallyAnalyticDistributions:L2/tensor-multidegree-extension`, `LocallyAnalyticDistributions:L4/cohomology-slope-comparison`, `LocallyAnalyticDistributions:L4/compact-frechet-factorization`, `LocallyAnalyticDistributions:L4/contracting-family-compactness`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/frechet-finite-slope`, `LocallyAnalyticDistributions:L4/numerical-slope-decomposition`, `ModularSymbolsPadicLFunctions:L2/control-theorem`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`, `ModularSymbolsPadicLFunctions:L2/overconvergent-lift`, `ModularSymbolsPadicLFunctions:L2/p-adic-l-function`, `ModularSymbolsPadicLFunctions:L2/weight-k-distributions`, `PadicMeasuresIwasawaAlgebras:L0/clopen-zero-extension`.

### Refinements left in L2

- Growth for general F is an open statement, not a target: BSW prove choice-independence only (bsw-choice-independence); growth and uniqueness are planned for F totally real (Bergdall–Hansen, under Leopoldt) and imaginary quadratic (Williams).
- Families over general F are not a BSW target; a family statement needs the eigenvariety and control hypotheses of PadicFamilies:L2a and is not claimed here.
- Barrera Salazar’s growth bound for µ\_Φ over totally real F is a recorded gap; the identification with Bergdall–Hansen under vanishing Leopoldt defect rests on it.

## L3 — Totally real abelian and CM constructions

Two constructions over totally real and CM fields. Deligne–Ribet: values of partial zeta functions at negative integers, Hilbert Eisenstein series with their constant terms at every cusp (in Dasgupta–Kakde’s normalisation), the irreducibility of the Igusa tower and the p-adic q-expansion principle, the resulting measures and congruences, the pseudo-measure and p-adic L-functions of totally real fields, and the group-ring Eisenstein families. Katz: p-ordinary CM types, CM points with their canonical trivialisations, complex and p-adic periods, Katz’s differential operators and the algebraicity of CM values, the Eisenstein measure, the main theorem (5.3.0), its functional equation, and the Hida–Tilouine version with tame conductor.

Planets of this layer: Hilbert Eisenstein series (`L3/hilbert-eisenstein-series`); p-adic q-expansion principle (`L3/padic-q-expansion-principle`); Deligne–Ribet measure (`L3/deligne-ribet-measure`); Deligne–Ribet pseudo-measure (`L3/deligne-ribet-pseudomeasure`); Katz p-adic L-function (`L3/katz-padic-l-function`).

### Values of partial zeta functions at negative integers as distributions

`L3/partial-zeta-distributions` — definition.

Let F be a totally real field (F ≠ ℚ allowed and ℚ as the base case), f a nonzero integral ideal and G\_f the narrow ray class group modulo f. For ε : G\_f → ℂ, L(s, ε) := Σ\_{𝔞 ⊂ O\_F prime to f} ε(𝔞)N𝔞^{-s} (Re s > 1), continued meromorphically with at most a simple pole at s = 1. For k ≥ 1 and ε with values in a ℚ-vector space V, L(1 − k, ε) ∈ V is defined by linearity once Siegel–Klingen rationality is known. For an ideal f′ divisible by every prime above p and G := lim\_n G\_{f′p^n} = Cl⁺\_F(f′p^∞), every locally constant V-valued ε on G factors through some G\_{f′p^n}, and ε ↦ L(1−k, ε) (Euler factors at the primes dividing f′p removed) is a V-valued distribution T\_k on G, independent of the level used. For c ∈ G define Δ\_c(1 − k, ε) := L(1 − k, ε) − N(c)^k L(1 − k, ε\_c), with ε\_c(g) := ε(cg) and N : G → ℤ\_p^× the norm character.

*Hypotheses.* F totally real; f′ divisible by every prime above p (so that the Euler factors at p are removed); ε locally constant.

*Proof or construction.*

1. Continuation of L(s, ε) for characters of G\_f: AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation; for a general function ε decompose into characters after extending coefficients.
2. Independence of the level: pulling ε back from G\_{f′p^n} to G\_{f′p^{n+1}} does not change L(s, ε) because the primes dividing p are already excluded.
3. ℚ-rationality of the values is siegel-klingen-rationality.

*Uses.* DR-1980 (0.4), (8.2): the integrality statement is about Δ\_c(1 − k, ε); IntegralIwasawaTheory:I.3: the Stickelberger dictionary uses the k = 1 values; NoncommutativeAndEquivariantIwasawa:NE.6/partial-zeta-values: partial zeta values ζ(δ(x), 1 − k).

*API.*

- `TotallyRealZeta.lValue` (constructor): ε ↦ L(1 − k, ε) ∈ V for locally constant V-valued ε on Cl⁺\_F(f′p^∞).
- `TotallyRealZeta.lValue_level` (characterisation): Independent of the level through which ε factors.
- `TotallyRealZeta.lValue_linear` (simp): ℚ-linear in ε; compatible with ℚ-linear maps V → V′.
- `TotallyRealZeta.delta` (constructor): Δ\_c(1 − k, ε) = L(1 − k, ε) − N(c)^k L(1 − k, ε\_c).
- `TotallyRealZeta.lValue_rat` (compatibility): For F = ℚ, agreement with −(1/k)f^{k−1}Σ ε(a)B\_k(a/f) (Mathlib’s Bernoulli polynomials).

*Unit tests.*

- `lValue_rat_trivial` (computation): F = ℚ, f′ = (p), ε = 1, k = 2: T\_2(1) = (1 − p)ζ(−1) = −(1 − p)/12.
- `lValue_level_independent` (characterisation): Pulling ε back from level p to level p² leaves T\_k(ε) unchanged.
- `delta_trivial_c` (degenerate): For c = 1, Δ\_1(1 − k, ε) = 0.
- `lValue_not_primitive` (non-example): T\_k uses imprimitive L-functions with Euler factors at f′p removed; for ε a primitive character of conductor prime to p the primitive value differs by ∏\_{𝔭|p}(1 − ε(𝔭)N𝔭^{k−1}).

*Acceptance.* F = ℚ, f′ = (p): T\_k(ε) = −(1/k)·p^{n(k−1)}Σ\_a ε(a)B\_k(a/p^n) for ε of level p^n, the Bernoulli-polynomial formula of Deligne–Ribet (1.3)–(1.4).

*Rests on.* `L0/ray-class-tower`, `L0/gauss-sum-and-depleted-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`.

*Sources.* DR-1980, §0, pp. 230–231; §8, (8.1) and the paragraph after it, pp. 277–278: Deligne–Ribet define L(s, ε) for functions on G\_f, recall Siegel’s rationality, extend values to V-valued functions, view ε ↦ L(1−k, ε) as a distribution on G and define Δ\_c(1−k, ε). DR-1980, §1, Theorem (1.2) and (1.4), p. 233: For K = ℚ the values are given by Bernoulli polynomials, which serves as definition in any ℚ-vector space.

### Cusps, normalised Fourier coefficients and nebentypus for Hilbert modular forms

`L3/hilbert-cusp-combinatorics` — definition.

For F totally real with different d, narrow class representatives t\_λ and an integral ideal n, put Γ\_λ(n) = {(a b; c d) ∈ GL₂⁺(F) : a, d ∈ O\_F, c ∈ t\_λ d n, b ∈ (t\_λ d)^{-1}, ad − bc ∈ O\_F^×, d ≡ 1 mod n}; cusps(n) = ⊔\_λ Γ\_λ(n)\\P¹(F). For a cusp [A] with A = (a b; c d) attached to λ put b\_A = aO\_F + c(t\_λ d)^{-1} and c\_A = (c)(t\_λ d b\_A)^{-1} (integral, depending only on [A]). The cusps above ∞ are C\_∞(b, n) = {[A] : b | c\_A} and those above 0 are C\_0(b, n) = {[A] : gcd(b, c\_A) = 1}; both sets are stable under the diamond operators S(m). The normalised Fourier coefficients of f at A are c\_A(b, f) = a\_A(b)(Nt\_λ)^{-k/2}(Nb\_A)^{-k}(N det A)^{k/2}, from the expansion f\_λ|\_k A(z) = a\_A(0) + Σ\_{b ∈ 𝔞, b ≫ 0} a\_A(b)e\_F(bz); at ∞ they are c\_λ(0, f) and c(m, f) for m = (b)t\_λ^{-1}. A form has nebentypus ψ if f|S(a) = ψ(a)f, and M\_k(n) = ⊕\_ψ M\_k(n, ψ), S\_k(n) = ⊕\_ψ S\_k(n, ψ).

*Hypotheses.* F totally real; parallel weight k; n integral.

*Proof or construction.*

1. Γ\_λ(n)\\GL₂⁺(F)/B ≅ Γ\_λ(n)\\P¹(F) (DK (87)); b\_A and c\_A are independent of the matrix representing [A] (DK §7.2.3–7.2.5).
2. Stability under S(m): the diamond operators permute the Γ\_λ(n) and preserve c\_A up to the ideal action.
3. Nebentypus decomposition: S(m) for m prime to n factors through the finite group G\_n⁺ acting semisimply over a field containing its character values.

*Uses.* DK-2023 Proposition 8.4: constant terms of Eisenstein series at every cusp, sorted by C\_0 and C\_∞; AutomorphicPadicLFunctions:L3/hilbert-eisenstein-series: q-expansions at every cusp; NoncommutativeAndEquivariantIwasawa:NE.6/hilbert-eisenstein-toolkit: constant terms at the cusps.

*API.*

- `HilbertCusp` (constructor): cusps(n) = ⊔\_λ Γ\_λ(n)\\P¹(F).
- `HilbertCusp.bIdeal` (projection): b\_A = aO\_F + c(t\_λ d)^{-1}.
- `HilbertCusp.cIdeal` (projection): c\_A = (c)(t\_λ d b\_A)^{-1}, integral and depending only on [A].
- `HilbertCusp.aboveInfty` (constructor): C\_∞(b, n), with aboveInfty\_diamond: stable under S(m).
- `HilbertCusp.aboveZero` (constructor): C\_0(b, n), with aboveZero\_diamond: stable under S(m).
- `HilbertModularForm.normalisedCoeff` (data): c\_A(b, f) = a\_A(b)(Nt\_λ)^{-k/2}(Nb\_A)^{-k}(N det A)^{k/2}.
- `HilbertModularForm.nebentypusDecomposition` (equivalence): M\_k(n) = ⊕\_ψ M\_k(n, ψ) over a field containing the character values.

*Unit tests.*

- `cusp_rat_infty` (compatibility): F = ℚ, n = 5: C\_∞(5, 5) consists of the cusps a/c with 5 | c, the cusps of Γ₁(5) above ∞ in ModularForms layer 0.
- `cusp_c_ideal_infty` (computation): The cusp ∞ (A = identity, c = 0) has c\_A = (0), which every b divides, so ∞ ∈ C\_∞(b, n) for every b, and ∞ ∈ C\_0(b, n) only for b = (1).
- `cusp_zero_trivial_level` (degenerate): For n = (1) every cusp lies in C\_0((1), (1)).
- `normalisedCoeff_not_raw` (non-example): c\_A(b, f) is not a\_A(b): for k = 2 and Nb\_A = 2 they differ by the factor 1/4 times the norm factors, and constant terms of Eisenstein series in DK’s Proposition 8.4 are only correct for the normalised ones.

*Acceptance.* F = ℚ, t = 1: Γ(n) is Γ₁(n) (with d = ℤ), cusps above ∞ are those with denominator divisible by n, and c(m, f) are the usual q-expansion coefficients.

*Rests on.* `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/hilbert-cuspidal-boundary`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

*Sources.* DK-2023, §7.2.1–7.2.6, pp. 44–46, eqs. (87)–(91): Dasgupta–Kakde define Γ\_λ(n), the cusps, the ideals b\_A and c\_A, the normalised Fourier coefficients at each cusp, the cusps above ∞ and above 0 with their diamond-stability, and the nebentypus decomposition.

### Hilbert Eisenstein series G\_{k,ε} and E\_k(ψ, 1)

`L3/hilbert-eisenstein-series` — construction.

Let k ≥ 1 and ε : I → ℂ a Schwartz function on the finite ideles with parity (−1)^k, supported on Â and defined modulo the conductor f. There is a Hilbert modular form G\_{k,ε} ∈ M\_k(Γ₀₀(f), ℂ) whose q-expansion at the cusp determined by α ∈ K̂^× is, for k > 1, N𝔞^k times the series with constant term 2^{-r}L(1−k, ε\_c) and q^µ-coefficient (µ ≫ 0) the finite sum over ideals x ⊆ 𝔅𝔞² of ε\_c(µx^{-1})N(µx^{-1})^{k−1}, with 𝔞 = (α) and c ∈ G the class defined by α (DR (2.23)), and for k = 1 the constant term is 2^{-r}(L(0, ε\_c) + L(0, ε̃\_c)) with ε̃ the modification of ε. In Dasgupta–Kakde’s normalisation, for k ≥ 1 odd and ψ a totally odd character of conductor dividing n, the S-stabilised Eisenstein series E\_k(ψ\_S, 1) ∈ M\_k(n, Frac O, ψ) has c(m, E\_k(ψ\_S, 1)) = Σ\_{r|m} ψ\_S(m/r)Nr^{k−1}, eigenvalue ψ(l) + Nl^{k−1} for T\_l (l ∤ n) and Nl^{k−1} for U\_l (l | n), and, for k > 1, constant terms c\_λ(0) = 0 at the cusps (1, λ) when the level n is not (1) and c\_λ(0) = 2^{−[F:ℚ]}ψ^{-1}(λ)L(ψ^{-1}, 1 − k) when n = (1) (DK write n both for [F:ℚ] and for the level); for k = 1 they are 2^{−[F:ℚ]}L(ψ\_S, 0) if n ≠ (1) and 2^{−[F:ℚ]}(L(ψ, 0) + ψ^{-1}(λ)L(ψ^{-1}, 0)) if n = (1) (DK (98)); the group-ring version E\_k(ψ, 1) has coefficients Σ\_{r|m,(m/r,n)=1}ψ(m/r)Nr^{k−1} in R.

*Hypotheses.* F totally real of degree r (= n in DK); ε has parity (−1)^k; for DK’s version k ≥ 1 odd and ψ totally odd.

*Proof or construction.*

1. Construct G\_{k,ε} as a function of lattices with polarisation and Γ₀₀(f)-structure by the Hecke–Siegel sum (DR (6.3)) Σ\_{𝓜⊂𝓛′} Tε(𝓜 → K/𝔇^{-1})/(vol 𝓜)^k|vol 𝓜|^s at s = 0, continued analytically for k = 1, 2.
2. Compute its q-expansion at each cusp through the Fourier transform of ε (DR §3) — this is where the constant term L(1 − k, ε\_c) appears.
3. DK’s E\_k(ψ\_S, 1) is the ψ-isotypic linear combination of such series, normalised as in DK §7.3; the Hecke eigenvalues follow from the coefficient formula.
4. The forms are geometric Hilbert modular forms in the sense of AutomorphicBundles:B5/hilbert-cusp-expansion, by the analytic–algebraic comparison there.

*Uses.* DR-1980 §8: linear combinations with p-adically integral non-constant coefficients give the congruences (8.2); DK-2023 §8: constant terms at all cusps in the construction of cusp forms; OrdinaryAutomorphicFormsAndModularityLifting:R21.2: Skinner–Wiles Eisenstein series E\_n(φ₁, φ₂) and their constant terms; NoncommutativeAndEquivariantIwasawa:NE.6/hilbert-eisenstein-toolkit: the Eisenstein series G\_{k,ε} with constant terms (DR 6.1, 2.22).

*API.*

- `HilbertEisenstein.G` (constructor): G\_{k,ε} ∈ M\_k(Γ₀₀(f), ℂ) for k ≥ 1 and ε of parity (−1)^k.
- `HilbertEisenstein.G_qExpansion` (characterisation): The q-expansion at the cusp of α is DR (6.2).
- `HilbertEisenstein.G_constantTerm` (simp): Constant term N𝔞^k 2^{-r}L(1−k, ε\_c) for k > 1.
- `HilbertEisenstein.E` (constructor): E\_k(ψ\_S, 1) ∈ M\_k(n, ψ) in DK’s normalisation.
- `HilbertEisenstein.E_hecke` (relation): T\_l E = (ψ(l) + Nl^{k−1})E for l ∤ n and U\_l E = Nl^{k−1}E for l | n.
- `HilbertEisenstein.E_groupRing` (functoriality): The group-ring valued E\_k(ψ, 1) specialises to each E\_k(χ, 1) under characters of the group ring.
- `HilbertEisenstein.G_linear` (simp): ε ↦ G\_{k,ε} is linear.

*Unit tests.*

- `eisenstein_rat` (compatibility): F = ℚ, ψ trivial, k = 4: c(m) = σ₃(m) and constant term ζ(−3)/2 = 1/240, ModularForms’ E₄ normalised accordingly.
- `eisenstein_coeff_one` (computation): c(1, E\_k(ψ\_S, 1)) = 1 for every k and ψ.
- `eisenstein_parity` (degenerate): If ε has parity different from (−1)^k then the lattice sum vanishes identically (signs cancel).
- `eisenstein_not_cusp` (non-example): G\_{k,ε} is not cuspidal when L(1 − k, ε\_c) ≠ 0 for some c, e.g. F = ℚ(√5), ε = 1, k = 2, where ζ\_F(−1) = 1/30.

*Acceptance.* F = ℚ, ψ = 1, k > 2 even (with the parity adjusted): E\_k is the classical Eisenstein series with constant term ζ(1−k)/2, ModularForms layer 0.

*Rests on.* `L3/partial-zeta-distributions`, `L3/hilbert-cusp-combinatorics`, `AutomorphicBundles:B5/hilbert-cusp-expansion`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation`.

*Sources.* DR-1980, §6, Theorem (6.1), formulas (6.2)–(6.3), pp. 267–268: Deligne–Ribet construct G\_{k,ε} on Γ₀₀(f) with explicit q-expansions at every cusp determined by α ∈ K̂^\*, including the constant term 2^{-r}L(1−k, ε\_c), the k = 1 case, and the lattice-sum construction. DK-2023, §7.3, p. 49, eqs. (98)–(99); Definition 8.2, p. 51: Dasgupta–Kakde define E\_k(ψ\_S, 1) with its Fourier coefficients, Hecke eigenvalues and constant term at ∞, its group-ring version, and the modified series W\_k(ψ\_P, 1).

### Constant terms of Hilbert Eisenstein series at every cusp (Dasgupta–Kakde Proposition 8.4)

`L3/eisenstein-constant-terms` — theorem.

Let ψ be a totally odd character, c its conductor with c₀ its part prime to the primes in P, m a divisor of t. The normalised constant terms c\_A(0) of E\_k(ψ\_P, 1)|m ∈ M\_k(n, ψ) are: for k > 1, zero unless [A] ∈ C\_0(c, n), and at [A] ∈ C\_0(c, n) equal to τ(ψ)/Nc₀^k · sgn(N(−c))ψ(c\_A) · L(ψ^{-1}, 1−k)/2^{[F:ℚ]} · ∏\_{𝔭|P}(1 − ψ(𝔭)/N𝔭^k) · ∏\_{l∈J\_m}Nl^{-k} · ∏\_{l∈J\_m^c}ψ^{-1}(l); for k = 1, the constant term vanishes outside C\_0(c, n) ∪ C\_∞(c₀, n), and on C\_0(c, n) ∩ C\_∞(c₀, n) (possible only when c₀ = 1), on C\_∞(c₀, n) \\ C\_0(c, n) and on C\_0(c, n) \\ C\_∞(c₀, n) it is given by the corresponding sums of the two terms involving L(ψ^{-1}, 0) and L(ψ, 0) (Dasgupta–Kakde eq. (100) and the three k = 1 formulas; Dasgupta–Kakde write 2^n with n = [F:ℚ], and use n also for the level). Here τ(ψ) is the Gauss sum of Dasgupta–Kakde’s Acta Arithmetica paper and J\_m, J\_m^c are the sets of Definition 8.3.

*Hypotheses.* Notation of DK §8.1 (P a set of primes above p, t, J\_m).

*Proof or construction.*

1. Dasgupta–Kakde Acta Arith. 200 (2021), Theorem 4.7, applied to E\_k(ψ\_P, 1)|m: compute the expansion at each cusp from the Fourier transform of the defining Schwartz function, using b\_A and c\_A.
2. Separate the cusps according to gcd(c, c\_A) and c₀ | c\_A (hilbert-cusp-combinatorics).

*Acceptance.* k > 1 and the cusp ∞ when n = 1: recovers the constant term (1/2^n)ψ^{-1}(λ)L(ψ^{-1}, 1−k) of hilbert-eisenstein-series.

*Rests on.* `L3/hilbert-eisenstein-series`, `L3/hilbert-cusp-combinatorics`, `L0/gauss-sum-and-depleted-l-function`.

*Sources.* DK-2023, Proposition 8.4 and eq. (100), pp. 51–52; Definition 8.3, p. 51: Dasgupta–Kakde state the normalised constant terms of E\_k(ψ\_P, 1)|m at every cusp, for k > 1 and the three k = 1 cases, citing Theorem 4.7 of their Acta Arithmetica paper for the proof and its Definition 4.1 for τ(ψ).

### Siegel–Klingen rationality of L(1 − k, ε)

`L3/siegel-klingen-rationality` — theorem.

If F is totally real and ε : G\_f → ℚ, then L(1 − k, ε) ∈ ℚ for every integer k ≥ 1. Consequently L(1 − k, ε) ∈ V is well defined for ε with values in any ℚ-vector space V, and for ε with values in a number field E it lies in E and is Galois-equivariant: σ(L(1 − k, ε)) = L(1 − k, σ∘ε).

*Hypotheses.* F totally real; ε ℚ-valued (or E-valued).

*Proof or construction.*

1. The constant term of G\_{k,ε} at ∞ is 2^{-r}L(1 − k, ε) (hilbert-eisenstein-series), while every non-constant coefficient is a finite sum of values of ε times integer powers of norms, hence rational.
2. By the q-expansion principle over subrings (AutomorphicBundles:B5/hilbert-expansion-principle: rationality of all non-constant coefficients at one cusp forces the form to be defined over ℚ up to a constant), the constant term is rational as well (Deligne–Ribet: (8.1) follows from (0.1) and the Eisenstein computations).
3. Galois equivariance by applying σ to the q-expansion.

*Acceptance.* F = ℚ: L(1 − k, ε) = −(1/k)f^{k−1}Σε(a)B\_k(a/f) ∈ ℚ. F = ℚ(√5), ε = 1, k = 2: ζ\_F(−1) = 1/30.

*Rests on.* `L3/hilbert-eisenstein-series`, `AutomorphicBundles:B5/hilbert-expansion-principle`, `L3/partial-zeta-distributions`.

*Sources.* DR-1980, §8, (8.1) and the remark after it, p. 277; §0, p. 230 ((0.1), Rapoport): Deligne–Ribet state Siegel’s rationality theorem as (8.1) and remark that it follows from Rapoport’s q-expansion principle (0.1) in view of the Eisenstein series calculations.

### p-adic Hilbert modular forms on the ordinary Igusa tower and p-adic q-expansions

`L3/padic-hilbert-modular-forms` — definition.

Let F be totally real, N ≥ 4 prime to p (Deligne–Ribet allow N ≥ 3; smaller N by descent from an auxiliary level), 𝒫 an invertible O\_F-module with positivity and R a p-adic ring. V(Γ₀₀(N), R) is the ring of R-valued functions on the ordinary Igusa tower: compatible systems of functions on triples (X, λ, ε) of an ordinary Hilbert–Blumenthal abelian variety X/S (S a p-adically complete R-algebra), a 𝒫-polarisation λ and a trivialisation ε : O\_F ⊗ µ\_{p^∞} ≅ X[p^∞]° of the multiplicative part (equivalently the Igusa torsors of HodgeTateAndCanonicalSubgroups:T5/igusa-torsor over the ordinary locus), together with the Γ₀₀(N)-structure. A p-adic cusp is a triple (𝔞, 𝔟, ε) with ε a trivialisation of the Tate object; the q-expansion of F ∈ V at it is F(𝔞, 𝔟, ε) ∈ R[[q^µ]]. For each k there is a map π\_k : M\_k(Γ₀₀(N), R) → V(Γ₀₀(N), R) (evaluating a form on (X, λ, ε) with the differential induced by ε) such that the q-expansion of π\_kF at the p-adic cusp of α ∈ K̂^\* is N α\_p^{-k}F\_α, with α\_p the component of α at p. For R flat over ℤ\_p, V(Γ₀₀(N), E) := V(Γ₀₀(N), R) ⊗ ℚ\_p.

*Hypotheses.* p unramified in F is not required for the definition; the ordinary locus is the invertibility locus of the Hasse invariant (HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal).

*Proof or construction.*

1. The ordinary locus and its Rapoport geometry: HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport, H2/hilbert-hasse-ideal, over the Deligne–Pappas model H2/dp-integral-model.
2. The formal and mod-p^n ordinary Igusa tower of trivialisations O\_F ⊗ µ\_{p^n} ≅ X[p^n]° over the ordinary locus of the Deligne–Pappas model is requested from HilbertModularVarietiesAndShimuraCurves:H2 (as RT-AREA-langlands-1/8 directs); its generic fibre is compared by Cartier duality with the tower of trivialisations of the dual canonical subgroup of HodgeTateAndCanonicalSubgroups:T5/igusa-torsor (ε = 0).
3. Define V as functions on the tower compatible with base change; q-expansions at p-adic cusps are the p-adic limits of the algebraic q-expansions over the Noetherian rings O/p^n at the Tate object (AutomorphicBundles:B5/hilbert-cusp-expansion).
4. π\_k and the formula for its q-expansion: DR (5.10)–(5.12), (5.15).

*Uses.* DR-1980 (5.13): the p-adic q-expansion principle; KATZ-1978 Chapter II: the p-adic differential operators act on V; HSIEH-2014 Proposition 5.5: the measure F\_{λ,c} takes values in V(c, K, ℤ\_p).

*API.*

- `PadicHilbertForm` (constructor): V(Γ₀₀(N), R), an R-algebra functorial in R.
- `PadicHilbertForm.qExpansion` (projection): q-expansion at a p-adic cusp (𝔞, 𝔟, ε) into R[[q^µ]].
- `PadicHilbertForm.ofClassical` (coercion): π\_k : M\_k(Γ₀₀(N), R) → V(Γ₀₀(N), R).
- `PadicHilbertForm.qExpansion_ofClassical` (simp): q-expansion of π\_kF at the p-adic cusp of α is N α\_p^{-k}F\_α.
- `PadicHilbertForm.baseChange` (functoriality): V(Γ₀₀(N), R) ⊗ R′ → V(Γ₀₀(N), R′), an isomorphism for R′ flat over R.
- `PadicHilbertForm.weightAction` (structure): The action of (O\_F ⊗ ℤ\_p)^× on V by changing the trivialisation; weight-k forms are the eigenvectors for the character x ↦ N(x)^k.

*Unit tests.*

- `padicHilbert_rat` (compatibility): F = ℚ: V(Γ₀₀(N), R) is Katz’s V(N; R) of PadicFamilies:L0/katz-padic-modular-functions.
- `padicHilbert_constant` (degenerate): The constant function 1 has q-expansion 1 at every p-adic cusp.
- `padicHilbert_qExp_factor` (computation): For α with α\_p = p at one prime and 1 elsewhere, the q-expansion of π\_kF at α is N(α\_p)^{-k}F\_α, i.e. multiplied by p^{-k f\_𝔭} for that prime.
- `padicHilbert_not_classical` (non-example): V is larger than ⊕\_k M\_k: the Eisenstein family limit lim G\_{1+(p−1)p^n} lies in V and is not classical.

*Acceptance.* F = ℚ: Katz’s ring V(N; R) of generalised p-adic modular functions (PadicFamilies:L0/katz-padic-modular-functions), with π\_k the inclusion of weight-k forms and the factor α\_p^{-k} the effect of changing the trivialisation.

*Rests on.* `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`, `AutomorphicBundles:B5/hilbert-cusp-expansion`, `PadicFamilies:L0/katz-padic-modular-functions`.

*Sources.* DR-1980, §5, (5.10)–(5.12) and (5.15), pp. 265–266; §4, pp. 254–255: Deligne–Ribet define p-adic Hilbert modular forms as functions on the covering of the ordinary locus by trivialisations, p-adic cusps (𝔞, 𝔟, ε), the map π\_k and the q-expansion formula N α\_p^{-k}F\_α at the p-adic cusp of α. KATZ-1978, Table of contents §1.9–1.12, p. 199: Katz develops p-adic Hilbert modular forms and their q-expansions at p-adic cusps in Chapter I (§1.9–1.11).

### Geometric irreducibility of the Igusa covering (Deligne–Ribet (4.5))

`L3/igusa-irreducibility` — theorem.

Let N ≥ 3 be prime to p, 𝒫 an invertible O\_F-module with positivity, 𝓜° the ordinary locus of the reduction modulo p of the moduli space 𝓜\_N[𝒫] of Hilbert–Blumenthal abelian varieties with 𝒫-polarisation and level N, and 𝓘 = 𝓘[𝒫, N, p^n] → 𝓜° the finite étale (O\_F/p^n)^×-torsor of isomorphisms O\_F ⊗ µ\_{p^n} ≅ (X\_{p^n})°. Then 𝓘 is geometrically irreducible over each geometric connected component of 𝓜°: for every algebraic closure F̄ of F\_p, 𝓘 restricts to an irreducible covering of each connected component of 𝓜° ⊗ F̄.

*Hypotheses.* N ≥ 3 prime to p; ordinary locus; p arbitrary.

*Proof or construction.*

1. Reduce to the surjectivity of the monodromy character ρ : π₁(𝓜°₁, m) → (O/p^nO)^\* on each geometric connected component, after a finite extension F\_q of F\_p (DR p. 256); GL(2, O/NO) permutes the components, so the level-N structure can be handled by enlarging N.
2. At a closed point x over F\_{q^b} the Frobenius endomorphism of the formal group of X\_x is q^b·u with u ∈ (O ⊗ ℤ\_p)^\*, and ρ of the Frobenius element at x is the image of u in (O/p^nO)^\* (DR p. 256).
3. It therefore suffices to produce, for each ū ∈ (O/p^nO)^\*, an ordinary HBAV over some F\_{q^b} with a level-N structure, Frobenius unit mapping to ū and prescribed polarisation module. DR construct it from Deligne’s equivalence between ordinary abelian varieties over a finite field and lattices with a Frobenius endomorphism (Deligne 1969, cited by DR as [4]; recorded gap: no layer of the atlas plans it): take the O-lattice of K[x]/(x² + cx + d) with Frobenius x, where d = q^b, c² − 4q^b is totally negative, c is a p-adic unit and N | (2 + c), N² | (1 + q^b + c); then u^{-1} ≡ −c mod q^b, and the polarisation module is corrected by an isogeny (DR p. 257).
4. Choosing c by approximation realises every ū, so ρ is surjective on every component and the covering is geometrically irreducible. Chebotarev density enters DR’s text only as a heuristic for why the theorem should hold, not as an input.

*Acceptance.* F = ℚ: Igusa’s theorem that the Igusa curve over the ordinary locus of X(N)\_{F\_p} is irreducible.

*Rests on.* `L3/padic-hilbert-modular-forms`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`.

*Sources.* DR-1980, §4, Theorem (4.5) and its proof, pp. 255–257: Deligne–Ribet prove that the covering 𝓘[𝒫, N, p^n] of 𝓜°[𝒫, p] is geometrically irreducible, reducing to surjectivity of the monodromy character, computing it at Frobenius elements of ordinary points and constructing the needed ordinary points through Deligne’s description of ordinary abelian varieties over finite fields (p. 257).

### The p-adic q-expansion principle (Deligne–Ribet (5.13), (5.14), (0.2), (0.3))

`L3/padic-q-expansion-principle` — theorem.

Let F ∈ V(Γ₀₀(N), E) with E = R ⊗ ℚ\_p, R a flat ℤ\_p-module, and (𝔞, 𝔟, ε) a p-adic cusp. Then the q-expansion F(𝔞, 𝔟, ε), a priori in E[[q^µ]], has coefficients in R if and only if F ∈ V(Γ₀₀(N), R). Consequently (5.14): if F has one cusp at which every non-constant coefficient lies in R, then the difference between the constant terms of its q-expansions at any two cusps lies in R. For forms F\_k of weight k ≥ 0 (all but finitely many zero) with rational q-expansion coefficients, if S(α) = Σ\_k N α\_p^{-k}F\_{k,α} has coefficients in ℤ\_p for one α, it has them for all α (0.2); and if its non-constant coefficients are in ℤ\_p for one α, the same holds for all β and the constant terms differ by elements of ℤ\_p (0.3).

*Hypotheses.* R flat over ℤ\_p; the cusps range over all p-adic cusps of Γ₀₀(N).

*Proof or construction.*

1. Irreducibility of the Igusa tower on each component (igusa-irreducibility) and the formal-local q-expansion at one cusp of each component determine F modulo p^m on that component (reduce modulo p^m: a function on an irreducible scheme vanishing on the formal neighbourhood of a cusp vanishes).
2. Components are reached by the cusps (𝔞, 𝔟, ε) as α varies, through the action of the idele class group.
3. (5.14): apply (5.13) to F − t with t the constant term at the given cusp, viewed as a weight-0 form.
4. (0.2)–(0.3) are the special cases with F = Σπ\_kF\_k, using π\_k’s q-expansion formula.

*Acceptance.* F = ℚ: Katz’s p-adic q-expansion principle for V(N; R) (PadicFamilies:L0/katz-padic-modular-functions). (0.3) applied to Eisenstein series gives the Kummer congruences over ℚ.

*Rests on.* `L3/igusa-irreducibility`, `L3/padic-hilbert-modular-forms`, `AutomorphicBundles:B5/hilbert-expansion-principle`.

*Sources.* DR-1980, (0.1)–(0.3), p. 230; (5.13)–(5.15) and the paragraph after (5.15), pp. 265–266: Deligne–Ribet prove the p-adic q-expansion principle (5.13), its corollary on constant terms (5.14), and deduce the integrality statements (0.2) and (0.3).

### The Deligne–Ribet measures and Eisenstein congruences ((0.4), (0.5), (8.2), (8.4), (8.11))

`L3/deligne-ribet-measure` — theorem.

Let F be totally real of degree r, f′ divisible by every prime above p, G = Cl⁺\_F(f′p^∞) and c ∈ G. (Main theorem (8.2)) µ\_c : ε ↦ Δ\_c(0, ε) is a measure on I (equivalently on G) with values in Ẑ, and for every Schwartz function ε and k ≥ 1, ∫ε·N^{k−1}dµ\_c = Δ\_c(1 − k, ε); in particular µ\_{c,k} := (ε ↦ Δ\_c(1 − k, ε)) is a ℤ\_p-valued measure with µ\_{c,k} = N^{k−1}µ\_{c,1} (0.5). (Integrality (0.4)) If ε₁, ε₂, … are ℚ\_p-valued locally constant functions on G, finitely many nonzero, with Σ\_k ε\_k(𝔵)N𝔵^{k−1} ∈ ℤ\_p for every prime-to-f′p ideal 𝔵, then Σ\_k Δ\_c(1 − k, ε\_k) ∈ ℤ\_p. (Eisenstein congruences (8.4)) the same for ℚ-valued Schwartz ε\_k of parity (−1)^k with Σε\_kN^{k−1} ℤ̂-valued. (2-adic refinement (8.11)) for φ : I → ℤ̂ odd, continuous, compactly supported, ∫φdµ\_c ∈ 2^{r−1}ℤ̂, and in 2^rℤ̂ unless F is exceptional and δ(φ) = 1.

*Hypotheses.* F totally real, f′ divisible by every prime above p; c ∈ G arbitrary (for p odd one may take c with N(c) of order p − 1).

*Proof or construction.*

1. For each k form G\_{k,ε\_k} (hilbert-eisenstein-series) and the p-adic form Σ\_kπ\_kG\_{k,ε\_k}; its non-constant q-expansion coefficients at the cusp of α are Σ\_kε\_k(…)N(…)^{k−1}·α\_p-power, integral by hypothesis.
2. By padic-q-expansion-principle (5.14), the constant terms at two cusps differ by an element of ℤ\_p; the two constant terms are 2^{-r}Σ\_kL(1−k, ε\_k) and 2^{-r}Σ\_kN(c)^kL(1−k, ε\_{k,c}), giving Δ\_c ∈ 2^{-r}ℤ\_p, and the extra powers of 2 are recovered by the parity argument (8.3), (8.8)–(8.10).
3. The measure statement: integrality of Δ\_c(0, ε) for ℤ̂-valued ε is (0.4) with k = 1; the moment formula is (8.4) applied to εN^{k−1} ≡ εη^{k−1} mod m with η odd and ≡ N mod m.
4. (8.11): compare φ with an odd Schwartz function congruent modulo 2^r and use (8.8)–(8.10).

*Acceptance.* F = ℚ: µ\_c is the classical regularised Bernoulli (Mazur) measure, (0.4) the Kummer congruences.

*Rests on.* `L3/padic-q-expansion-principle`, `L3/hilbert-eisenstein-series`, `L3/siegel-klingen-rationality`, `L0/ray-class-distributions`.

*Sources.* DR-1980, (0.4)–(0.5), p. 231; (8.2)–(8.4), p. 278; proof of (8.2) and (8.11), pp. 282–283: Deligne–Ribet state the integrality theorem (0.4), the measure µ\_{c,k} = N^{k−1}µ\_{c,1} (0.5), the main theorem (8.2) that µ\_c is a ℤ̂-valued measure with moments Δ\_c(1 − k, ε), the Eisenstein congruences (8.4) and the 2-adic statement (8.11). DK-2023, §1, eqs. (1)–(2), p. 4: Dasgupta–Kakde quote the integrality Θ\_{S,T} ∈ ℤ[G] of Deligne–Ribet and Cassou-Noguès under the smoothing condition (1).

### The Deligne–Ribet pseudo-measure and p-adic L-functions of totally real fields

`L3/deligne-ribet-pseudomeasure` — construction.

With λ\_c := N^{-1}µ\_{c,1}, viewed in the ring Λ\_G of ℤ\_p-valued measures on G (the completed group ring), and c chosen so that 1 − c is not a zero divisor, λ := λ\_c/(1 − c) in the total quotient ring of Λ\_G is independent of c ((1 − c′)λ\_c = (1 − c)λ\_{c′}) and is a pseudo-measure: (1 − g)λ ∈ Λ\_G for every g ∈ G. For k ≥ 1 and ε locally constant, ∫εN^k dλ = L(1 − k, ε). For a finite-order character ψ of G and the decomposition G = Δ × Γ (Γ ≅ ℤ\_p^{1+δ}; ≅ ℤ\_p under Leopoldt), for a finite-order character χ of G the p-adic L-function L\_p(χω, s) := ∫χω⟨N⟩^{1−s}dλ (⟨N⟩ = Nω^{-1}) is meromorphic in s ∈ ℤ\_p, analytic unless χ = ω^{-1}, and satisfies L\_p(χω, n) = L\*(χω^n, n) for every integer n ≤ 0 (k = 1 − n in the moment formula). On the cyclotomic quotient it is a quotient G\_ψ(u^s − 1)/H\_ψ(u^s − 1) with G\_ψ ∈ O\_ψ[[T]] and H\_ψ = 1 unless ψ factors through the cyclotomic ℤ\_p-extension, in which case H\_ψ is the linear polynomial clearing the pole at the trivial character.

*Hypotheses.* F totally real; G = Cl⁺\_F(f′p^∞) with f′ divisible by the primes above p; ω the Teichmüller character; u = N(γ) for a generator γ of the cyclotomic part.

*Proof or construction.*

1. Pseudo-measure: (1 − c′)λ\_c = (1 − c)λ\_{c′} follows from the defining formula of Δ\_c; then use PadicMeasuresIwasawaAlgebras:L3/pseudomeasures and L3/independence-of-clearing-factor.
2. Moments: ∫εN^kdλ\_c = Δ\_c(1−k, ε) = L(1−k, ε) − N(c)^kL(1−k, ε\_c), and dividing by (1 − c) gives L(1 − k, ε) (PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation).
3. The cyclotomic specialisation and the power-series form: push forward along G → Gal(F(µ\_{p^∞})/F) and use the Iwasawa algebra ℤ\_p[[Γ]] ≅ ℤ\_p[[T]] (PadicMeasuresIwasawaAlgebras:L1); the denominator comes from clearing the pole of λ at the trivial character only.

*Uses.* IntegralIwasawaTheory:I.3: the Stickelberger dictionary and main conjecture input; NoncommutativeAndEquivariantIwasawa:NE.6/abelian-case: G\_ψ ∈ O\_ψ[[T]] and the pseudo-measure ζ ∈ Q(Λ(H × Γ)); SpecialValuesBirchTate:B.5: the 2-adic and odd-primary power series G\_ψ, H\_ψ; DKV-2018 Theorem 1: the derivative L\_p^{(r)}(χω, 0) in the Gross–Stark formula; OrdinaryAutomorphicFormsAndModularityLifting:R21.2: the Deligne–Ribet p-adic L-function L\_p(F, s, χω).

*API.*

- `DeligneRibet.pseudoMeasure` (constructor): λ in the total quotient ring of Λ\_G, with pseudoMeasure\_mem: (1 − g)λ ∈ Λ\_G.
- `DeligneRibet.pseudoMeasure_eq_div` (characterisation): λ = λ\_c/(1 − c) for every admissible c.
- `DeligneRibet.pseudoMeasure_moment` (simp): ∫εN^kdλ = L(1 − k, ε) for k ≥ 1.
- `DeligneRibet.padicL` (constructor): L\_p(χω, s) for a finite-order character χ, meromorphic on ℤ\_p.
- `DeligneRibet.padicL_interpolation` (relation): L\_p(χω, n) = L\*(χω^n, n) for n ≤ 0.
- `DeligneRibet.padicL_powerSeries` (equivalence): On the cyclotomic quotient, L\_p(1 − s, ψ) = G\_ψ(u^s − 1)/H\_ψ(u^s − 1) with G\_ψ ∈ O\_ψ[[T]].
- `DeligneRibet.pseudoMeasure_map` (functoriality): Compatibility with change of f′ (pushforward) and with change of field for F ⊂ F′ through the norm map on ray-class limits.

*Unit tests.*

- `dr_rat_kubota_leopoldt` (compatibility): F = ℚ, f′ = (p): λ equals DirichletPadicLFunctions:L1/arithmetic-pseudomeasure (deligne-ribet-rational-comparison).
- `dr_moment_trivial` (computation): F = ℚ(√5), p = 5, ε = 1, k = 2: ∫N²dλ = L\*(1, −1) = ζ\_F(−1)·(1 − 5) = −2/15.
- `dr_pole` (degenerate): λ is not a measure: its image at the trivial character requires clearing (1 − c); total mass is undefined.
- `dr_not_primitive` (non-example): λ interpolates L-values with Euler factors at the primes above p removed; without depletion the interpolation fails already for F = ℚ at k = 1.

*Acceptance.* F = ℚ: λ is the Kubota–Leopoldt pseudo-measure; L\_p(ω, s) has a simple pole at s = 1. For χ totally odd, L\_p(χω, 0) = L\*(χ, 0) = L(χ, 0)∏\_{𝔭|p}(1 − χ(𝔭)) (DKV).

*Rests on.* `L3/deligne-ribet-measure`, `PadicMeasuresIwasawaAlgebras:L3/pseudomeasures`, `PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation`, `PadicMeasuresIwasawaAlgebras:L1`, `L0/odd-character-l-zero-nonvanishing`.

*Sources.* DR-1980, §0, p. 232: Deligne–Ribet define λ\_c = N^{-1}µ\_{c,1} in Λ\_G, the pseudo-measure λ = λ\_c/(1 − c), independent of c, whose integral against εN^k is L(1 − k, ε), and obtain the p-adic L-functions by integrating characters. DKV-2018, §1, eq. (2), p. 2: Dasgupta–Kakde–Ventullo characterise L\_p(χω, s) by L\_p(χω, n) = L\*(χω^n, n) for n ≤ 0, analytic unless χ = ω^{-1}, crediting Deligne–Ribet, Cassou-Noguès and Barsky.

### The rational case: Deligne–Ribet against Kubota–Leopoldt

`L3/deligne-ribet-rational-comparison` — comparison.

For F = ℚ and f′ = N p with p ∤ N, the Deligne–Ribet pseudo-measure on Cl⁺\_ℚ(Np^∞) = (ℤ/N)^× × ℤ\_p^× equals the arithmetic Kubota–Leopoldt pseudo-measure of DirichletPadicLFunctions:L1/arithmetic-pseudomeasure and its tame-character components DirichletPadicLFunctions:L2, under the identification of the class of the ideal (a) with a (and of a unit u at p with u^{-1}, ray-class-tower) and with identical normalisations: same smoothing (the class c ↔ the smoothing parameter), same Euler factors removed at p and at N, and same character conventions (primitive values computed at the primitive conductor, DirichletPadicLFunctions:L2/primitive-integral-interpolation).

*Hypotheses.* F = ℚ; the identification of Cl⁺\_ℚ(Np^∞) is the one fixed in ray-class-tower.

*Proof or construction.*

1. Both pseudo-measures are characterised by their moments against εN^k for k ≥ 1 (PadicMeasuresIwasawaAlgebras:L3/actual-pseudomoment-separation), and both moments are L(1 − k, ε) with the Euler factors at Np removed (deligne-ribet-pseudomeasure; DirichletPadicLFunctions:L1/arithmetic-positive-interpolation).
2. Match the regular smoothing parameter of DirichletPadicLFunctions L1 with the class c, and track the inversion between ideal and idelic coordinates.

*Acceptance.* k = 2, ε = 1, N = 1: both give (1 − p)ζ(−1) = −(1 − p)/12.

*Rests on.* `L3/deligne-ribet-pseudomeasure`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`, `DirichletPadicLFunctions:L1/arithmetic-positive-interpolation`, `DirichletPadicLFunctions:L2/primitive-integral-interpolation`, `PadicMeasuresIwasawaAlgebras:L3/actual-pseudomoment-separation`.

*Sources.* DR-1980, §1, pp. 233–238; §0, p. 232: Deligne–Ribet reinterpret the Kummer congruences for K = ℚ in terms of measures and the pseudo-measure λ. DKV-2018, §1, p. 2: Dasgupta–Kakde–Ventullo characterise L\_p(χω, s) by L\_p(χω, n) = L\*(χω^n, n) for n ≤ 0; taking F = ℚ in this characterisation gives the Kubota–Leopoldt interpolation (our specialisation, not stated there).

### p-ordinary CM types and polarisation data

`L3/cm-type-p-ordinary` — definition.

Let M be a CM field with maximal totally real subfield F, and Σ a CM type of M (ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type), i.e. Σ ⊔ cΣ = Hom(M, ℂ). Fix ι\_∞ and ι\_p. Σ is p-ordinary if the p-adic places Σ\_p of M induced by ι\_p∘ι\_∞^{-1}∘σ (σ ∈ Σ) and their conjugates Σ\_p^c partition the places of M above p; this forces every prime of F above p to split in M. The polarisation data is δ ∈ M with δ^c = −δ and Im σ(δ) > 0 for σ ∈ Σ, such that the alternating form ⟨x, y⟩ = Tr\_{M/F}(x^c y/(2δ)) identifies O\_M ∧ O\_M with c^{-1}d^{-1} for an ideal c (Katz’s c, Hsieh’s polarisation ideal c(O\_M) = D\_F^{-1}(2δD\_{M/F})) prime to p.

*Hypotheses.* M a CM field (Mathlib NumberField.IsCMField); p a prime; embeddings fixed.

*Proof or construction.*

1. Σ is a CM type of the CM algebra M (CM.0/cm-type); p-ordinarity is a condition on the induced p-adic places.
2. If Σ is p-ordinary, each prime of F above p splits, since its two places in M are distinguished by Σ\_p and Σ\_p^c.
3. Existence of δ with c prime to p: choose δ by weak approximation (Katz (5.3.3), Hsieh p. 711).

*Uses.* KATZ-1978 (5.3.0): the hypothesis of the main theorem; HSIEH-2014 Theorem A: the hypothesis (ord); AutomorphicPadicLFunctions:L3h/theorem-a: ordinarity of the CM type does not assert ordinarity of π.

*API.*

- `CMType.IsPOrdinary` (constructor): The predicate Σ\_p ⊔ Σ\_p^c = {places of M above p}.
- `CMType.IsPOrdinary.split` (characterisation): If Σ is p-ordinary every prime of F above p splits in M.
- `CMType.polarisationDatum` (data): δ with δ^c = −δ, Im σ(δ) > 0 on Σ, and its ideal c prime to p.
- `CMType.IsPOrdinary.conj` (relation): Σ is p-ordinary iff cΣ is, with Σ\_p and Σ\_p^c exchanged.
- `CMType.IsPOrdinary.induced` (functoriality): A CM type induced from a p-ordinary type of a CM subfield is p-ordinary.

*Unit tests.*

- `ordinary_imag_quadratic_split` (computation): M = ℚ(i), p = 5 (split): the type {σ} is 5-ordinary.
- `ordinary_imag_quadratic_inert` (non-example): M = ℚ(i), p = 3 (inert): no CM type is 3-ordinary.
- `ordinary_conj` (characterisation): Σ and cΣ are simultaneously ordinary.
- `ordinary_ramified` (degenerate): M = ℚ(√−5), p = 5 (ramified): no CM type is 5-ordinary since the unique place above 5 cannot lie in both Σ\_p and Σ\_p^c.

*Acceptance.* M imaginary quadratic: Σ = {σ} is p-ordinary iff p splits in M. M = F·K with K imaginary quadratic and p split in K: the CM type induced from K is p-ordinary.

*Rests on.* `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`, `mathlib:NumberField.IsCMField`.

*Sources.* KATZ-1978, Theorem (5.3.0), (5.3.2)–(5.3.3), p. 274: Katz’s main theorem assumes a CM type Σ of L ordinary at incl(p) and an element δ ∈ L purely imaginary with Im σ(δ) > 0 defining O ∧ O ≅ d^{-1}c^{-1} with c prime to p. HSIEH-2014, Introduction, p. 711: Hsieh assumes the p-ordinary condition (ord) that Σ\_p and its conjugate partition the p-adic places, and fixes δ with polarisation ideal prime to pNN̄. HIDA-2010, §1, (d1)–(d2), p. 43: Hida fixes δ with the same two conditions.

### CM points of Hilbert modular varieties and their p-adic trivialisations

`L3/cm-points-and-canonical-trivialisations` — construction.

For a fractional ideal 𝔞 of M prime to p, the complex torus ℂ^Σ/Σ(𝔞) with the polarisation given by δ and level structure defines an HBAV x(𝔞) with CM by O\_M over a number field, with good reduction at p (ShimuraVarieties:V5/cm-potential-good-reduction after a finite extension). When Σ is p-ordinary its reduction is ordinary, and over W = Ŵ(F̄\_p) (or the ring of integers of a p-adic field) the decomposition O\_M ⊗ ℤ\_p = O\_{Σ\_p} × O\_{Σ\_p^c} gives a canonical trivialisation of the multiplicative part X[p^∞]° ≅ O\_F ⊗ µ\_{p^∞}, so x(𝔞) defines a point of the Igusa tower over W: the p-adic CM point. The Galois action on CM points is given by the main theorem of complex multiplication (Shimura reciprocity), and the ideles of M act on the set of CM points through the reciprocity map.

*Hypotheses.* Σ p-ordinary; 𝔞 prime to p and to the level.

*Proof or construction.*

1. The CM abelian variety and its complex uniformisation: ShimuraVarieties:V5/cm-abelian-variety and V5/cm-number-field-model, viewed as a point of the Hilbert PEL moduli space (HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance).
2. Ordinary reduction from p-ordinarity: the p-divisible group splits according to O\_{Σ\_p} × O\_{Σ\_p^c}, the first factor being multiplicative.
3. Trivialisation: the Σ\_p-part identifies with O\_F ⊗ µ\_{p^∞} after choosing generators, giving a W-point of the formal ordinary Igusa tower (requested from HilbertModularVarietiesAndShimuraCurves:H2).
4. Shimura reciprocity for the Galois action: ShimuraVarieties:V5/main-cm.

*Uses.* KATZ-1978 §5.4: evaluating the Eisenstein measure at CM points; HSIEH-2014 §5: toric evaluation of F\_{λ,c}; GrossZagierAndArithmeticHeights:GZ.9: CM points and their p-adic periods.

*API.*

- `CMPoint` (constructor): x(𝔞) as a point of the Hilbert moduli space over a number field.
- `CMPoint.padic` (constructor): The Igusa-tower point over W for p-ordinary Σ.
- `CMPoint.galoisAction` (relation): σ(x(𝔞)) = x(r\_Σ(s)^{-1}𝔞) for Artin(s) = σ (Shimura reciprocity).
- `CMPoint.idele_action` (structure): The action of M̂^× on CM points through translation of the lattice.
- `CMPoint.ordinary` (characterisation): x(𝔞) has ordinary reduction iff Σ is p-ordinary.

*Unit tests.*

- `cmpoint_imag_quadratic` (compatibility): F = ℚ, M = ℚ(i), 𝔞 = O\_M: x(𝔞) is the elliptic curve ℂ/ℤ[i], j = 1728.
- `cmpoint_ordinary_split` (computation): M = ℚ(√−7), p = 2 split: the reduction of ℂ/O\_M at the prime above 2 is ordinary.
- `cmpoint_class_number_one` (degenerate): If M has class number one and level one, the CM points form a single orbit under the idele action.
- `cmpoint_inert_nonexample` (non-example): M = ℚ(i), p = 3: the reduction is supersingular and there is no canonical trivialisation of a multiplicative part.

*Acceptance.* M imaginary quadratic, F = ℚ: Heegner/CM points x(𝔞) on the modular curve, with Serre–Tate canonical trivialisation at a split p (HeegnerPointEulerSystems:HE.1 for the classical CM points).

*Rests on.* `L3/cm-type-p-ordinary`, `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/main-cm`, `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H2`.

*Sources.* KATZ-1978, Table of contents §5.1 (the HBAVs attached to a CM field, p. 263); (5.4.1)–(5.4.6), p. 275: Katz attaches HBAVs to ideals of the CM field, uses their ordinary reduction at a p-ordinary CM type, and relates the ideal class group of conductor p^n to the Galois groups through the Artin symbol. HSIEH-2014, §4.6, p. 748; proof of Theorem 5.7, p. 754: Hsieh evaluates p-adic modular forms at the CM points x(a) with their canonical trivialisations and uses the periods of [HT93] and [Kat78].

### Complex and p-adic CM periods (Ω\_∞, Ω\_p)

`L3/cm-periods` — definition.

Let A/O (O the ring of integers of a number field containing the reflex field, localised at p) be an abelian variety with CM by O\_M of type Σ and good ordinary reduction, with a nowhere-vanishing invariant differential ω(O\_M) on A over O ⊗ D\_p. The complex period Ω\_∞ = (Ω\_{∞,σ})\_{σ∈Σ} ∈ (ℂ^×)^Σ compares ω(O\_M) with the differential coming from the complex uniformisation (ω\_trans), and the p-adic period Ω\_p = (Ω\_{p,σ}) ∈ (W^×)^Σ compares it with the differential ω\_can coming from the canonical trivialisation of the formal group: ω(O\_M) = Ω\_∞·ω\_trans = Ω\_p·ω\_can. Replacing ω(O\_M) by λω(O\_M), λ ∈ (O ⊗ D\_p)^×, replaces (Ω\_∞, Ω\_p) by (λΩ\_∞, λΩ\_p), so the ratio Ω\_∞/Ω\_p (under ι\_∞, ι\_p) is canonical; Hsieh writes Ω\_K = (2πi)^{-1}Ω\_∞. For an elliptic curve with CM by O\_K at a split prime these are the classical Ω\_∞ and the Serre–Tate period Ω\_p ∈ W^×.

*Hypotheses.* Σ p-ordinary; the differential is nowhere vanishing over the integral base.

*Proof or construction.*

1. Existence of ω(O\_M): the Lie algebra is free of rank one over O\_M ⊗ O after a finite extension.
2. Ω\_∞: compare with the complex uniformisation of cm-points-and-canonical-trivialisations; Ω\_p: compare with the canonical trivialisation of the multiplicative formal group.
3. Dependence on the differential is the scaling rule (Katz remark after (5.3.7)).

*Uses.* KATZ-1978 (5.3.4)–(5.3.6): normalisation of the interpolated values; HSIEH-2014 Theorem A: the factors Ω\_p^{2(k+2m)} and Ω\_K^{2(k+2m)}; GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function: the CM periods Ω\_∞ and Ω\_p of an elliptic curve with CM at a split prime.

*API.*

- `CMPeriod.complex` (constructor): Ω\_∞ ∈ (ℂ^×)^Σ attached to (A, ω).
- `CMPeriod.padic` (constructor): Ω\_p ∈ (W^×)^Σ attached to (A, ω) and the canonical trivialisation.
- `CMPeriod.scale` (relation): Ω\_•(λω) = λ·Ω\_•(ω) for both periods.
- `CMPeriod.ratio_canonical` (characterisation): Ω\_∞/Ω\_p is independent of ω.
- `CMPeriod.galois` (functoriality): Compatibility with σ ∈ Aut(ℂ/reflex) through CM reciprocity, up to algebraic factors.

*Unit tests.*

- `period_scale` (characterisation): Scaling ω by 2 doubles both Ω\_∞ and Ω\_p and fixes their ratio.
- `period_gaussian` (computation): M = ℚ(i): Ω\_∞ for ℂ/ℤ[i] with dz is ∫ dx/√(1 − x⁴)·(constant), an explicit lemniscate value.
- `period_independent_of_level` (degenerate): Adding prime-to-p level structure does not change (Ω\_∞, Ω\_p).
- `period_not_unit_supersingular` (non-example): At an inert prime there is no multiplicative formal group, so Ω\_p is undefined; a definition that used the Néron differential alone would not detect this.

*Acceptance.* M = ℚ(i), p ≡ 1 mod 4: Ω\_∞ is a nonzero algebraic multiple of Γ(1/4)²/√(2π) (the lemniscate period), and Ω\_p a p-adic unit.

*Rests on.* `L3/cm-points-and-canonical-trivialisations`, `L3/cm-type-p-ordinary`.

*Sources.* KATZ-1978, Theorem (5.3.0), the choice of ω(𝒪\_L) and of Ω ∈ (K ⊗ ℂ)^×, c ∈ (𝒪 ⊗ D\_p)^× by (5.1.46)–(5.1.48), p. 274; remark after (5.3.7), p. 275: Katz chooses a nowhere-vanishing differential and the constants Ω and c comparing it with the complex and canonical p-adic trivialisations, and notes that rescaling the differential rescales both. HSIEH-2014, Introduction p. 711; proof of Theorem 5.7, p. 754: Hsieh uses the periods (Ω\_∞, Ω\_p) of Hida–Tilouine (4.4a)–(4.4b), Katz’s (5.1.46), (5.1.48), and Ω\_K = (2πi)^{-1}Ω\_∞. HIDA-2010, §1, p. 43: Hida defines the complex and p-adic periods as in Katz; they are unique up to algebraic multiples but their ratio is canonical.

### Maass–Shimura and Katz p-adic differential operators on Hilbert modular forms

`L3/katz-differential-operators` — construction.

For d = Σ\_σ d(σ)σ ∈ ℤ[Σ] with all d(σ) ≥ 0 there are: (i) C^∞ operators ϑ(d, C^∞) on C^∞ Hilbert modular forms, built from the Gauss–Manin connection and the Kodaira–Spencer isomorphism with the antiholomorphic (Hodge) splitting, taking weight χ to χ + 2d (Maass–Shimura δ^m\_k in Hida–Tilouine’s notation); (ii) p-adic operators ϑ(d, p-adic) = ∏\_σ ϑ(σ, p-adic)^{d(σ)} on p-adic Hilbert modular forms, built with the unit-root splitting instead (Katz (2.5.7)), which mutually commute, act as derivations of degree two on the graded ring of p-adic forms, and take ω(χ)(p-adic) to ω(χ + 2d)(p-adic) (Katz (2.5.8)–(2.5.12)). On q-expansions at a p-adic cusp, θ(σ) multiplies the coefficient of q^β by σ(β) (θ^m multiplies by β^m), Katz Corollary (2.6.25)–(2.6.27).

*Hypotheses.* F totally real; R₁ an O^{gal}[1/d\_K]-algebra separated for the p-adic topology for (ii).

*Proof or construction.*

1. Define ϑ(σ, C^∞) as in Katz (2.3.3)–(2.3.7) with the Hodge splitting, and ϑ(σ, p-adic) by replacing it with the unit-root splitting of H¹\_dR over the Igusa tower (Katz (2.5.1)–(2.5.7)).
2. Commutation, Leibniz rule and weight change: Katz (2.5.8)–(2.5.12), as in the C^∞ case (2.3.8).
3. q-expansion formula from the Tate object, where the unit-root splitting is the canonical one.

*Uses.* KATZ-1978 §5.4: applying θ^d to the Eisenstein measure before evaluating at CM points; HSIEH-2014 Proposition 5.5: F\_{λ,c}(φ̂) = θ^m f\*\_{λφ,c}; GrossZagierAndArithmeticHeights:GZ.9: algebraicity of CM values of nearly holomorphic forms via the unit-root splitting.

*API.*

- `KatzTheta.cInfty` (constructor): ϑ(d, C^∞) on C^∞ forms, weight χ ↦ χ + 2d.
- `KatzTheta.padic` (constructor): ϑ(d, p-adic) on V(Γ₀₀(N), R).
- `KatzTheta.padic_comm` (relation): The ϑ(σ, p-adic) commute.
- `KatzTheta.padic_leibniz` (structure): Each ϑ(σ, p-adic) is a derivation, homogeneous of degree two.
- `KatzTheta.padic_qExpansion` (simp): θ(σ) multiplies the q^β-coefficient by σ(β).
- `KatzTheta.rat` (compatibility): For F = ℚ, θ = q d/dq and ϑ(C^∞) = δ\_k.

*Unit tests.*

- `theta_rat_q_expansion` (computation): F = ℚ: θ(Σa\_nq^n) = Σna\_nq^n; θ applied to E₄ gives the q-expansion 240Σnσ₃(n)q^n.
- `theta_weight_shift` (characterisation): ϑ(σ, p-adic) maps weight χ to χ + 2σ.
- `theta_zero_order` (degenerate): ϑ(0) is the identity.
- `theta_not_holomorphic` (non-example): ϑ(σ, C^∞)f is not holomorphic for f a holomorphic eigenform of positive weight: it has a non-vanishing antiholomorphic correction term.

*Acceptance.* F = ℚ: ϑ(p-adic) is Serre’s θ = q d/dq on p-adic modular forms and ϑ(C^∞) is the Maass–Shimura operator δ\_k = (1/2πi)(d/dz + k/(2iy)).

*Rests on.* `L3/padic-hilbert-modular-forms`, `AutomorphicBundles:B5/hilbert-cusp-expansion`.

*Sources.* KATZ-1978, §2.3–2.5, (2.5.3)–(2.5.12) and Theorem (2.5.8), p. 240: Katz defines the p-adic operators ϑ(Σd(σ)σ, p-adic) through the unit-root splitting and proves they commute, are degree-two derivations and shift weights by 2d. HSIEH-2014, §5, p. 753 (θ^m and [Kat78, Cor. (2.6.25)]) and p. 754 ([Kat78, (2.6.27)]): Hsieh uses Katz’s p-adic operators θ^m with their effect on q-expansions, and the Maass–Shimura operator δ^m\_k of Hida–Tilouine.

### Algebraicity and p-adic comparison of CM values of derivatives (Katz (2.4.5), (2.6.7))

`L3/katz-cm-algebraicity` — theorem.

Let R ⊂ ℂ be an O^{gal}[1/d\_K]-algebra, x = (X, λ, i) an R-valued point of the moduli space of HBAVs with a nowhere-vanishing differential ω whose Hodge filtration has an R-rational splitting Split(x) that becomes the antiholomorphic subspace over ℂ (as for CM points). For f ∈ M(c, Γ₀₀(N), χ; R) and d ≥ 0, (ϑ(d, C^∞)f)(X, λ, ω, i) lies in R (Katz (2.4.5)). If in addition R ↪ R₀ (p-adic completion) and Split(x) ⊗ R₀ is the unit-root subspace (as for CM points of a p-ordinary type), then (ϑ(d, p-adic)f(p-adic))(X, λ, ω, i)\_{R₀} lies in R₁[1/d\_K] and equals ϑ(d, x, ω, Split(x))f (Katz (2.6.7)–(2.6.8)). For CM points with the periods of cm-periods: θ^m f(x(𝔞))/Ω\_p^{k+2m} = δ^m f(x(𝔞))/Ω\_K^{k+2m} (Katz (2.4.6), (2.6.8), (2.6.33), as used by Hsieh).

*Hypotheses.* The splitting condition (2.4.2) at x, and (2.6.3) for the p-adic statement; d(σ) ≥ 0.

*Proof or construction.*

1. The C^∞ derivative at x is computed algebraically from the Gauss–Manin connection and the splitting, so it lies in R when the splitting is R-rational (Katz (2.4.5), essentially Shimura’s generalisation of Damerell).
2. The p-adic operator uses the unit-root splitting; when the two splittings coincide at x the two computations agree (Katz (2.6.7)–(2.6.8)).
3. At CM points of a p-ordinary type the Hodge splitting by CM is rational and coincides p-adically with the unit-root splitting; translate the differential by the periods.

*Acceptance.* F = ℚ, M imaginary quadratic: Shimura–Katz algebraicity of δ\_k^r f at CM points and its equality with θ^r f there after dividing by Ω\_∞ and Ω\_p.

*Rests on.* `L3/katz-differential-operators`, `L3/cm-points-and-canonical-trivialisations`, `L3/cm-periods`.

*Sources.* KATZ-1978, (2.4)–(2.4.5), p. 238; (2.6)–(2.6.8) and Theorem (2.6.7), pp. 240–241: Katz proves that C^∞ derivatives at points with a rational splitting of the Hodge filtration are rational, and that the p-adic derivative at points where that splitting is the unit-root one gives the same number. HSIEH-2014, Proof of Theorem 5.7, p. 754: Hsieh uses Katz (2.4.6), (2.6.8), (2.6.33) to identify θ^m f at CM points divided by Ω\_p^{k+2m} with δ^m f divided by Ω\_K^{k+2m}.

### Katz’s Eisenstein measure

`L3/katz-eisenstein-measure` — construction.

For a fractional ideal c of F prime to p, the inverse constructions H(x, y) = N(x)^{-1}F(1/x, y), F(x, y) = N(x)^{-1}H(1/x, y) (Katz (4.2.1)) identify continuous functions F on (O\_F ⊗ ℤ\_p)^× × (O\_F ⊗ ℤ\_p)^× with F(e^{-1}x, ey) = N(e)F(x, y) for e ∈ E and continuous functions H on G := (O\_F ⊗ ℤ\_p)^× × (O\_F ⊗ ℤ\_p)^×/closure of E (diagonal). The Eisenstein measure µ\_c is the V(c, ℤ\_p)-valued measure on G with ∫H dµ\_c = G\_{1,F}, the p-adic Eisenstein series of weight one attached to F (Katz §3.4), so that integrating N(x)^k-type characters gives the p-adic avatars of the Eisenstein series G\_{k,F} of Katz §3.2 (Hilbert Eisenstein series with partial Fourier transforms). It interpolates the q-expansions of these Eisenstein series as p-adic Hilbert modular forms.

*Hypotheses.* F totally real; c prime to p; values in p-adic Hilbert modular forms V(c, ℤ\_p).

*Proof or construction.*

1. Construct the Eisenstein series G\_{k,F} for functions F of the above type (Katz §3.1–3.3), with their q-expansions; take their p-adic versions (§3.4).
2. Verify the abstract Kummer congruences for the family of q-expansions (Katz §4.0, (4.0.6)–(4.0.8)) using the explicit coefficients; then the measure exists by Katz’s criterion (4.1) and the p-adic q-expansion principle.
3. Define µ\_c by (4.2.5)–(4.2.6).

*Uses.* KATZ-1978 §5.4: the p-adic L-function is obtained by applying θ^d to µ\_c and evaluating at CM points; HIDA-2010 §1: the measure φ of Hida–Tilouine extends the construction to tame conductor.

*API.*

- `KatzEisensteinMeasure` (constructor): µ\_c, a V(c, ℤ\_p)-valued measure on G.
- `KatzEisensteinMeasure.moment` (simp): ∫H dµ\_c = G\_{1,F} for H ↔ F under (4.2.1).
- `KatzEisensteinMeasure.function_equiv` (equivalence): The linear bijection (4.2.1) between the two spaces of functions.
- `KatzEisensteinMeasure.theta` (compatibility): θ^d applied to µ\_c is the measure whose moments are θ^d of the Eisenstein moments.
- `KatzEisensteinMeasure.qExpansion` (characterisation): The q-expansion of µ\_c is the measure-valued q-expansion with coefficients given by partial Fourier transforms.

*Unit tests.*

- `katzEis_rat` (compatibility): F = ℚ: the moments are the p-depleted Eisenstein series of DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation after the change of variables (4.2.1).
- `katzEis_constant_function` (computation): Integrating the constant function 1 gives G\_{1,F} for F = N(x)^{-1}·1, the weight-one Eisenstein series.
- `katzEis_unit_invariance` (characterisation): Functions H not invariant under the diagonal units are not integrable: G divides by the closure of E.
- `katzEis_not_bounded_by_cusp` (non-example): µ\_c is not cuspidal-valued: its moments have nonzero constant terms.

*Acceptance.* F = ℚ: the Eisenstein measure on ℤ\_p^× × ℤ\_p^× whose moments are the p-depleted Eisenstein series E\_k(φ₁, φ₂); compare DirichletPadicLFunctions:L4.

*Rests on.* `L3/hilbert-eisenstein-series`, `L3/padic-hilbert-modular-forms`, `L3/padic-q-expansion-principle`, `L0/unit-invariance-closure`, `PadicMeasuresIwasawaAlgebras:L1`.

*Sources.* KATZ-1978, §4.2, (4.2.0)–(4.2.6), p. 260; table of contents §§3.1–3.5, 4.0–4.2, p. 199: Katz identifies the two function spaces by (4.2.1), defines G as the quotient by the closure of the units and the Eisenstein measure µ\_c by ∫H dµ\_c = G\_{1,F}, after constructing Eisenstein series G\_{k,F} and their p-adic versions in Chapter III.

### Katz’s p-adic L-function for CM fields (Theorem (5.3.0))

`L3/katz-padic-l-function` — theorem.

Let M be a CM field with p-ordinary CM type Σ, δ as in cm-type-p-ordinary, and ω(O\_M), Ω ∈ (F ⊗ ℂ)^×, c ∈ (O ⊗ D\_p)^× the periods of cm-periods (Katz writes K for the totally real field F and L for M). There is a D\_p-valued p-adic measure µ on Gal(M(p^∞)/M) (M(p^∞) the maximal abelian extension unramified outside p) such that for every A₀-Grössencharacter χ of M of conductor dividing p^∞ and infinity type −kΣ\_σσ − Σ\_σd(σ)(σ − σ̄) with k ≥ 1 and all d(σ) ≥ 0: (A) L\_µ(χ\_p)/∏\_σc(σ)^{k+2d(σ)} lies in incl(p)(ℚ̄); (B) Local(χ, Σ, δ)·[O\_M^×:O\_F^×]·∏\_𝔓((1 − χ̌(𝔓̄))(1 − χ(𝔓̄))) (χ̌ the dual character of (5.3.7), χ̌(𝔄) = 1/(χ(𝔄̄)N(𝔄)), so χ̌(𝔓̄) = 1/(χ(𝔓)N(𝔓)))·(−1)^{kg}(π)^{Σd(σ)}∏\_σΓ(k + d(σ))/(√d\_F∏\_σIm(σ(δ))^{d(σ)}∏\_σΩ(σ)^{k+2d(σ)})·L\_∞(χ) lies in incl(∞)(ℚ̄); and (A) = (B) under incl(p)^{-1} and incl(∞)^{-1}. Here L\_µ(χ\_p) = ∫χ\_pdµ, the product is over the primes 𝔓 of Σ\_p, and Local(χ, Σ, δ) is Katz’s local term at p (§5.2).

*Hypotheses.* (ord): Σ p-ordinary; conductor of χ dividing p^∞ (tame conductor 1); the critical range k ≥ 1, d(σ) ≥ 0. Not asserted for nonordinary primes or outside this infinity-type range.

*Proof or construction.*

1. Identify Gal(M(p^∞)/M(1)) with (O\_M ⊗ ℤ\_p)^× modulo the closure of E(M) (Katz (5.4.2)–(5.4.6), ray-class-unit-sequence).
2. Pull back the Eisenstein measure of the maximal totally real subfield along the CM points (cm-points-and-canonical-trivialisations), after applying θ^d (katz-differential-operators), and sum over ideal classes (Katz §5.4).
3. Evaluate moments: the C^∞ value at CM points of δ^d of the Eisenstein series is the Hecke L-value L\_∞(χ) times explicit factors (Katz §5.5, the explicit formulas), and katz-cm-algebraicity transfers it to the p-adic side.
4. The local term and Euler factors at Σ\_p come from the p-depletion of the Eisenstein series (Katz §5.2, formula (5.2.30)).

*Acceptance.* M imaginary quadratic, p split: the two-variable Katz p-adic L-function of M, interpolating L(χ, 0) at characters of infinity type (−k − d, d).

*Rests on.* `L3/katz-eisenstein-measure`, `L3/katz-cm-algebraicity`, `L3/cm-periods`, `L3/cm-type-p-ordinary`, `L0/ray-class-unit-sequence`, `L0/hecke-character-avatar`.

*Sources.* KATZ-1978, Theorem (5.3.0) with (5.3.1)–(5.3.6), p. 274; §5.2 (5.2.30)–(5.2.38), p. 273; §5.4, pp. 275–277: Katz states the existence of the D\_p-valued measure on Gal(L(p^∞)/L) with the interpolation (A) = (B) at A₀-grossencharacters of conductor dividing p^∞ and the stated infinity types, and constructs it from the Eisenstein measure.

### The functional equation of Katz’s p-adic L-function ((5.3.7))

`L3/katz-functional-equation` — theorem.

For every continuous ρ : Gal(M(p^∞)/M) → D\_p^×, with ρ̌ defined by ρ̌(𝔄) = 1/(ρ(𝔄̄)N\_{M/ℚ}(𝔄)), L\_µ(ρ̌) = N\_{F/ℚ}(c)·ρ(c)·L\_µ(ρ). The constants Ω and c and the measure depend on the choice of ω(O\_M) only through simultaneous rescaling (λΩ, λc), which does not affect (5.3.5).

*Hypotheses.* As in katz-padic-l-function.

*Proof or construction.*

1. Both sides are measures in ρ; compare at a dense set of characters through (A) = (B) and the complex functional equation of Hecke L-functions (AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation); Katz §5.6.

*Acceptance.* M imaginary quadratic: L\_µ(ρ̌) = N(c)ρ(c)L\_µ(ρ), the symmetry exchanging the two variables.

*Rests on.* `L3/katz-padic-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`.

*Sources.* KATZ-1978, (5.3.7) and the following remark, p. 275; table of contents §5.6, p. 200: Katz states the functional equation L\_µ(ρ̌) = N\_{K/ℚ}(c)ρ(c)L\_µ(ρ) and the effect of rescaling the differential, proved in §5.6.

### The Katz–Hida–Tilouine measure with tame conductor

`L3/katz-hida-tilouine-tame` — theorem.

Fix an O\_M-ideal C prime to p, decomposed C = 𝔉𝔉^c𝔍 with 𝔉𝔉^c split and 𝔍 inert or ramified over F, and δ satisfying (d1)–(d2) with c prime to pCC^c. There is a unique measure φ on the ray class group Z(C) of M modulo Cp^∞ such that for every Hecke character λ modulo Cp^∞ whose conductor is divisible by every prime factor of 𝔉 and whose infinity type is kΣ + κ(1 − c) with κ = Σκ\_σσ and either k > 0, κ ≥ 0 or k ≤ 1, κ ≥ 1 − k: ∫λ̂ dφ/Ω\_p^{kΣ+2κ} = (O^×:O\_F^×)W\_p(λ)·(−1)^{kΣ}π^κΓ\_Σ(kΣ + κ)/(√|D\_F|·Im(δ)^κ·Ω\_∞^{kΣ+2κ})·∏\_{𝔏|C}(1 − λ(𝔏))·∏\_{𝔓∈Σ\_p}(1 − λ(𝔓^c))(1 − λ\*(𝔓^c))·L(0, λ), with W\_p(λ) the root number at Σ\_p of (1.2), λ\*(x) = λ(x^c)^{-1}|x|\_{A\_M} the dual character, λ(𝔏) = 0 for 𝔏 dividing the conductor of λ, and L the primitive L-function. It satisfies a functional equation relating φ on Z(C) and φ^c on Z(C^c) with the factor N(c^{-1})W′(λ). For C = 1 it is Katz’s measure.

*Hypotheses.* Σ p-ordinary; C prime to p; the hypotheses (i)–(ii) on λ.

*Proof or construction.*

1. Hida–Tilouine extend Katz’s construction to tame level C by the same Eisenstein-measure method with a level-C Eisenstein series and partial Fourier transforms at 𝔉 (Hida–Tilouine 1993, as restated in Hida 2010, (1.3)).
2. Uniqueness: the interpolated characters, times finite-order characters, are dense (Hida 2010, p. 45).

*Acceptance.* C = 1: Katz’s theorem (5.3.0) in Hida’s normalisation. M imaginary quadratic: the Katz measure with tame conductor used by Castella–Grossi–Lee–Skinner (Theorem 2.1.2).

*Rests on.* `L3/katz-padic-l-function`, `L0/gauss-sum-and-depleted-l-function`.

*Sources.* HIDA-2010, §1, (1.1)–(1.3) and the functional equation, pp. 43–44: Hida restates the measure φ on Z(C) constructed with Tilouine (following Katz for C = 1), characterised by the interpolation formula (1.3), and its functional equation. CGLS-2022, §2.1.2, Theorem 2.1.2, p. 13: Castella–Grossi–Lee–Skinner use the Katz p-adic L-function as extended by Hida–Tilouine, with its interpolation property.

### Group-ring valued Hilbert Eisenstein families (Dasgupta–Kakde §§7.2.8, 8.1–8.4)

`L3/group-ring-eisenstein-families` — construction.

Let H/F be a finite abelian CM extension of conductor dividing n with Galois group G, R a quotient of O[G] by a product of character ideals (DK §7.1), Ψ the characters of R and 𝛙 : G\_n⁺ → R^× the canonical character. (i) A family (f\_ψ)\_{ψ∈Ψ}, f\_ψ ∈ M\_k(n, O, ψ), whose Fourier coefficients c(m, f\_ψ) = ψ(c(m)) and constant terms c\_λ(0, f\_ψ) = ψ(c\_λ(0)) come from elements c(m), c\_λ(0) ∈ R, glues to a unique group-ring form f ∈ M\_k(n, R, 𝛙) (Lemma 7.2, via Silliman’s characterisation of M\_k(n, R)). (ii) The group-ring Eisenstein series E\_k(𝛙, 1) has coefficients c(m) = Σ\_{r|m, (m/r, n) = 1}𝛙(m/r)Nr^{k−1} ∈ R, and the modified series W\_k(𝛙, 1) (specialising to W\_k(ψ\_P, 1) of DK Definition 8.2 for every ψ) has all non-constant coefficients in R for every odd k ≥ 1 (Proposition 8.14). (iii) For k ≡ 1 mod (p−1)p^N the ordinary projector satisfies e^ord\_p W\_k(𝛙, 1) = z·W\_k(𝛙, 1\_p) with z = ∏\_{𝔭|p}𝛙(𝔭)/(𝛙(𝔭) − N𝔭^{k−1}) ≡ 1 mod p^m for N large (DK proof of Corollary 8.19). (iv) For such k, Θ\_{S\_∞}(1−k)/Θ\_{S\_∞}(0) lies in R and is ≡ ∏\_{𝔭|p}(1 − χ(𝔭)^{-1}) mod m\_R (Lemma 8.16), a consequence of the p-adic continuity of the depleted values supplied by the Deligne–Ribet pseudo-measure.

*Hypotheses.* Notation of DK §§7–8: n, P, R, Ψ, 𝛙; case 1 (gcd(n, p) = 1) for (iii)–(iv) as in DK.

*Proof or construction.*

1. (i) Silliman’s Corollary 7.28 and Remark 7.29 (as quoted by DK) identify M\_k(n, R) inside M\_k(n, ∏\_ψO) by integrality of coefficients; the q-expansion principle (AutomorphicBundles:B5/hilbert-expansion-principle) gives uniqueness.
2. (ii) Write W\_k(𝛙, 1) as an R-linear combination of level-raised E\_k(𝛙\_m, 1) (DK proof of Proposition 8.14) and check integrality coefficientwise.
3. (iii) U\_𝔭 acts on E\_k(ψ, 1) through the Hecke eigenvalues of hilbert-eisenstein-series; the ordinary projector picks the 𝛙(𝔭)-eigencomponent.
4. (iv) Kummer-type congruence Θ(1 − k) ≡ Θ(0) from deligne-ribet-pseudomeasure.

*Uses.* IntegralIwasawaTheory:KU-brumerstark: DK §8.2–8.5 build the cusp forms F\_k(𝛙) congruent to Eisenstein series from these families (Propositions 8.11–8.12, Corollary 8.19); NoncommutativeAndEquivariantIwasawa:NE.6/hilbert-eisenstein-toolkit: group-ring Eisenstein families in the equivariant setting.

*API.*

- `GroupRingHilbertForm.glue` (universal-property): Lemma 7.2: compatible character forms glue uniquely to M\_k(n, R, 𝛙).
- `GroupRingHilbertForm.specialise` (projection): ψ : M\_k(n, R, 𝛙) → M\_k(n, O, ψ) on coefficients.
- `GroupRingEisenstein.E` (constructor): E\_k(𝛙, 1) with c(m) = Σ\_{r|m,(m/r,n)=1}𝛙(m/r)Nr^{k−1}.
- `GroupRingEisenstein.W` (constructor): W\_k(𝛙, 1), specialising to W\_k(ψ\_P, 1).
- `GroupRingEisenstein.W_integral` (characterisation): Non-constant coefficients of W\_k(𝛙, 1) lie in R (Proposition 8.14).
- `GroupRingEisenstein.ord_W` (relation): e^ord\_p W\_k(𝛙, 1) = z·W\_k(𝛙, 1\_p) with z ≡ 1 mod p^m for k ≡ 1 mod (p−1)p^N, N large.

*Unit tests.*

- `grEis_trivial_group` (degenerate): G trivial: E\_k(𝛙, 1) = E\_k(1, 1) over O.
- `grEis_specialise` (compatibility): ψ(E\_k(𝛙, 1)) = E\_k(ψ, 1) of hilbert-eisenstein-series for every ψ ∈ Ψ.
- `grEis_coeff_one` (computation): c(1, E\_k(𝛙, 1)) = 1.
- `grEis_constant_not_integral` (non-example): The constant terms of W\_k(𝛙, 1) need not lie in R: they involve L(ψ^{-1}, 1 − k)/2^n, whose denominators are the point of the construction.

*Acceptance.* H = F (trivial G): R = O and the family is a single Eisenstein series.

*Rests on.* `L3/hilbert-eisenstein-series`, `L3/eisenstein-constant-terms`, `L3/deligne-ribet-pseudomeasure`, `AutomorphicBundles:B5/hilbert-expansion-principle`, `PadicMeasuresIwasawaAlgebras:L1`.

*Sources.* DK-2023, §7.2.8 and Lemma 7.2, pp. 47–48; §7.3 eqs. (98)–(99), p. 49; Definition 8.2, p. 51; Proposition 8.14, p. 57; Lemma 8.16, p. 59; proof of Corollary 8.19, p. 61: Dasgupta–Kakde glue character-wise forms into group-ring forms, define the group-ring Eisenstein series and the modified series W\_k(𝛙, 1) with integral non-constant coefficients, compute the ordinary projector on them, and prove the congruence for Θ(1 − k)/Θ(0).

### Dependencies of L3

Within this roadmap: `L0`.

Other roadmaps and Tau Ceti layers: `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/hilbert-cuspidal-boundary`, `AutomorphicBundles:B5/hilbert-expansion-principle`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`, `DirichletPadicLFunctions:L1/arithmetic-positive-interpolation`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`, `DirichletPadicLFunctions:L2/primitive-integral-interpolation`, `DirichletPadicLFunctions:L4/cleared-eisenstein-evaluation`, `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`, `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`, `PadicFamilies:L0/katz-padic-modular-functions`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L3/actual-pseudomoment-separation`, `PadicMeasuresIwasawaAlgebras:L3/admissible-evaluation`, `PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor`, `PadicMeasuresIwasawaAlgebras:L3/pseudomeasures`, `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/main-cm`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

### Refinements left in L3

- Transcribe Katz’s local term Local(χ, Σ, δ) ((5.2.30)–(5.2.38)) into katz-padic-l-function.
- A Shintani-cone computation of the Deligne–Ribet values is permitted by the stage text but not needed by any target; it is not planned.
- Greenberg’s p-adic Artin L-functions by Brauer induction and Colmez’s residue formula are requested by consumers (requestLedger) and are not planned in this abelian layer.
- Deligne’s equivalence for ordinary abelian varieties over finite fields, used in Deligne–Ribet (4.5), is a recorded gap with no planned owner.

## L3h — Anticyclotomic toric distributions and Hsieh’s µ theorem

Hsieh’s anticyclotomic p-adic L-function for a Hilbert cusp form twisted by anticyclotomic characters of a CM extension: toric test vectors, the explicit Waldspurger formula, the square-root distribution and Theorem A, the CM-integrality criterion and Theorem B (µ = 0), Theorem C (nonvanishing modulo p), and the F = ℚ specialisation used by the Heegner-point roadmaps. The proposed sub-layer L3m collects the mod-p nonvanishing inputs (Hida’s linear independence and density, Hida’s and Hsieh’s µ = 0, Hsieh 2012, Finis).

Planets of this layer: Anticyclotomic square-root distribution (`L3h/anticyclotomic-distribution`); Hsieh’s Theorem A (`L3h/theorem-a`); Hsieh’s µ = 0 theorem (`L3h/theorem-b`).

### Hsieh’s anticyclotomic Rankin–Selberg setting

`L3h/hsieh-setting` — definition.

Let F be totally real of degree d, M/F a CM extension (Hsieh’s K), π an irreducible cuspidal automorphic representation of GL₂(A\_F) with unitary central character ω and infinity type k = Σk\_σσ ∈ ℤ\_{>0}[Σ] (discrete series or limit of discrete series of weight k\_σ), π\_M its base change, and λ a unitary Hecke character of M with λ|\_{A\_F^×} = ω^{-1} and infinity type (k/2, −k/2), so that π\_M ⊗ λ is conjugate self-dual. Write n = n⁺n⁻ for the conductor of π (n⁺ divisible only by primes split in M, n⁻ by inert or ramified ones), ε\*(π\_{M,v}, λ\_v) := ε(1/2, π\_{M,v} ⊗ λ\_v, ψ\_v)ω\_v(−1) the normalised local root number, Γ⁻ = Gal(M⁻\_{p^∞}/M) the Galois group of the maximal anticyclotomic ℤ\_p^{[F:ℚ]}-extension, Λ = ℤ\_p[[Γ⁻]], and X\_p^crit the locally algebraic p-adic characters of Γ⁻ of weight (m, −m), m ∈ ℤ\_{≥0}[Σ] (avatars, through Hsieh’s geometrically normalised reciprocity). The hypotheses are: (ord) the CM type Σ is p-ordinary; Hypothesis A: ε\*(π\_{M,v}, λ\_v) = +1 for every v | n⁻; (sf) n⁻ is squarefree; p odd. The p-adic multiplier is e\_{Σ\_p}(π, χ) = ∏\_{𝔓∈Σ\_p, 𝔭=𝔓𝔓̄} ε(1/2, π\_𝔭 ⊗ χ\_𝔓, ψ\_𝔭)L(1/2, π\_𝔭 ⊗ χ\_𝔓)^{-2}χ\_𝔓^{-2}(−2δ). Ordinarity of Σ says nothing about ordinarity of π.

*Hypotheses.* The hypotheses are data of the setting, not consequences; each theorem lists those it uses.

*Proof or construction.*

1. π\_M is Jacquet’s base change (GL2AutomorphicRepresentationsAndTransfer, quadratic base change), cuspidal unless π is induced from M.
2. Root numbers: local ε-factors of AutomorphicLFunctionsAndLocalFactors and GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison.
3. Γ⁻ and its critical characters: the anticyclotomic quotient of the ray-class limit of M (L0/evaluation-norm-twist-maps), avatars by L0/hecke-character-avatar in Hsieh’s geometric normalisation.

*Uses.* HSIEH-2014 Theorems A–C: the hypotheses of the three main theorems; GeneralizedHeegnerCycles:GH.4: the F = ℚ, n⁻ = 1 specialisation (Castella–Hsieh); AutomorphicCongruences:L5w: Hung’s and Hsieh’s inputs with their root-number hypotheses.

*API.*

- `HsiehDatum` (constructor): The tuple (F, M, Σ, π, λ, n⁺, n⁻, p) with the compatibility λ|\_{A\_F^×} = ω^{-1} and the infinity types.
- `HsiehDatum.HypothesisA` (constructor): ∀ v | n⁻, ε\*(π\_{M,v}, λ\_v) = +1.
- `HsiehDatum.SquarefreeMinus` (constructor): n⁻ squarefree.
- `HsiehDatum.criticalCharacters` (data): X\_p^crit ⊂ Hom\_cts(Γ⁻, ℂ\_p^×) of weight (m, −m), m ≥ 0.
- `HsiehDatum.padicMultiplier` (data): e\_{Σ\_p}(π, χ) as defined above.
- `HsiehDatum.HypothesisA_of_minus_one` (example): Hypothesis A holds when n⁻ = (1).

*Unit tests.*

- `hsieh_trivial_minus` (degenerate): n⁻ = (1): Hypothesis A and (sf) hold.
- `hsieh_rat_heegner` (compatibility): F = ℚ, M imaginary quadratic, π of a weight-2 newform with all primes of the level split in M: this is the Heegner setting of GeneralizedHeegnerCycles with n⁻ = 1.
- `hsieh_multiplier_unramified` (computation): If χ\_𝔓 is unramified at 𝔓 ∈ Σ\_p, ε(1/2, π\_𝔭 ⊗ χ\_𝔓) = 1 and e\_{Σ\_p} is the product of L(1/2, π\_𝔭 ⊗ χ\_𝔓)^{-2}χ\_𝔓^{-2}(−2δ).
- `hsieh_ordinary_type_not_pi` (non-example): A p-ordinary CM type does not make π ordinary at p: π may be supersingular at the primes above p while Σ is p-ordinary.

*Acceptance.* n⁻ = (1) satisfies Hypothesis A and (sf) vacuously. F = ℚ, π attached to a newform of weight k: the BDP/Castella–Hsieh setting with Heegner hypothesis when n⁻ = 1.

*Rests on.* `L3/cm-type-p-ordinary`, `L0/hecke-character-avatar`, `L0/evaluation-norm-twist-maps`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

*Sources.* HSIEH-2014, Introduction, pp. 709–711, (0.1)–(0.2), Hypothesis A, (ord), (sf): Hsieh fixes π, its base change π\_K, the character λ with λ|\_{A\_F^×} = ω^{-1}, the normalised root numbers, Hypothesis A, the p-ordinary CM type, the anticyclotomic tower Γ⁻ with Λ, the critical specialisations and the p-adic multiplier e\_{Σ\_p}(π, χ).

### Explicit Waldspurger formula for toric periods (Hsieh Proposition 2.1, Theorem 3.14)

`L3h/explicit-waldspurger` — theorem.

For ϕ₁, ϕ₂ ∈ A(π) with factorisable Whittaker functions normalised at almost all places and χ a Hecke character of M with χ|\_{A\_F^×} = ω^{-1}, the toric periods P\_χ(ϕ) = ∫\_{A\_F^×M^×\\A\_M^×}ϕ(ι(t))χ(t)dt satisfy P\_χ(ϕ₁)P\_χ(ϕ₂) = Λ(1/2, π\_M ⊗ χ)·∏\_{v∈S}L(1/2, π\_{M,v} ⊗ χ\_v)^{-1}P(W\_{1,v}, W\_{2,v}, χ\_v) for every large finite S (Proposition 2.1). For Hsieh’s normalised toric form ϕ\_χ (toric-test-vectors) and the operator V^{e+m}: P\_χ(π(ς)V^{e+m}ϕ\_χ)² = Γ\_Σ(k+m)Γ\_Σ(m+1)/(4π)^{k+2m+1·Σ}·e\_{Σ\_p}(π, χ)·L(1/2, π\_M ⊗ χ)·|D\_M|\_ℝ^{-1/2}·C′\_π(χ)N(π, χ)² (Theorem 3.14), with explicit constants C′\_π(χ), N(π, χ).

*Hypotheses.* Hypothesis A at v | n⁻ (otherwise the period vanishes identically by Saito–Tunnell); (sf) for the explicit local computations.

*Proof or construction.*

1. Proposition 2.1: combine Waldspurger’s formulas (proved through the Shimizu theta lift; GrossZagierAndArithmeticHeights:GZ.5 owns the Waldspurger period formula) into a decomposition of the global toric period into local Whittaker period integrals; Hypothesis A is the Saito–Tunnell condition for nonvanishing of the local toric functionals (GZ.4).
2. Theorem 3.14: compute each local integral for the chosen toric Whittaker function W\_{χ,v} (Hsieh §§3.3–3.8: unramified, ramified, inert and split places, archimedean place, places above p).

*Acceptance.* F = ℚ, n⁻ = 1: a Gross–Zagier/Waldspurger-type formula for the square of the CM period of a weight-k newform twisted by an anticyclotomic character.

*Rests on.* `L3h/hsieh-setting`, `L3h/toric-test-vectors`, `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GrossZagierAndArithmeticHeights:GZ.5/petersson-whittaker-factorization`.

*Sources.* HSIEH-2014, Proposition 2.1, p. 720; Theorem 3.14, p. 738: Hsieh decomposes products of toric periods into local Whittaker period integrals and computes them for his toric forms, obtaining the explicit formula for P\_χ(π(ς)V^{e+m}ϕ\_χ)² in terms of L(1/2, π\_K ⊗ χ) and the p-adic multiplier.

### Hsieh’s normalised toric forms

`L3h/toric-test-vectors` — construction.

A Whittaker function W ∈ W(π\_v, ψ\_v) is toric of character χ\_v if π(ι\_ς(t))W = χ\_v^{-1}(t)W for t ∈ T\_v (Definition 3.1). Hsieh chooses at each place a toric Whittaker function W\_{χ,v} (archimedean: V^{e+m}W\_k; finite places: explicit new and test vectors; places above p: p-modified functions W♭\_{χ,v}, Definition 3.12), shows they are toric (Lemma 3.2), and forms the automorphic form ϕ\_χ (Lemma 3.13) and the normalised Hilbert modular form f\*\_χ = N(π, χ)^{-1}|det ς\_f|^{-k\_mx/2}f\_χ (Definition 5.1). The normalised local Fourier coefficients a\*\_{χ,v} (Definition 3.16) take values in a finite extension O of O\_{L\_π}, are 1 at unramified v ∉ B(χ) and at v ∈ A(χ), and µ\_p(Ψ\_{π,χ,v}) = 0 for v ∈ B(χ) iff some a\*\_{χ,v}(η\_v) is a p-unit (Proposition 3.19).

*Hypotheses.* Hsieh’s setting; ς the chosen embedding of M^× into GL₂(F) at the relevant places.

*Proof or construction.*

1. Local choices place by place (Hsieh §§3.3–3.8), checked toric by direct computation (Lemma 3.2).
2. Global form: the product of the local Whittaker functions defines ϕ\_χ ∈ A(π) (Lemma 3.13); f\_χ and f\*\_χ by (5.1).
3. Integrality and nonvanishing modulo p of the normalised coefficients: Proposition 3.19.

*Uses.* HSIEH-2014 Theorem 3.14: the explicit Waldspurger formula is computed for these vectors; HSIEH-2014 Proposition 5.5: their p-adic interpolation; HSIEH-2014 Theorem 6.1: the µ-invariant is read off their Fourier coefficients.

*API.*

- `HsiehToric.IsToric` (constructor): W is toric of character χ\_v.
- `HsiehToric.localVector` (constructor): W\_{χ,v} at each place, with localVector\_isToric.
- `HsiehToric.globalForm` (constructor): ϕ\_χ ∈ A(π) and the normalised form f\*\_χ.
- `HsiehToric.normalisedCoeff` (data): a\*\_{χ,v}, with normalisedCoeff\_integral: values in O for v ∤ p.
- `HsiehToric.normalisedCoeff_one` (simp): a\*\_{χ,v}(1) = 1 for unramified v ∉ B(χ) and for v ∈ A(χ).
- `HsiehToric.mu_local_iff` (characterisation): µ\_p(Ψ\_{π,χ,v}) = 0 iff some a\*\_{χ,v}(η\_v) is a p-unit (v ∈ B(χ)).

*Unit tests.*

- `toric_unramified` (degenerate): At v ∉ B(χ) unramified, a\*\_{χ,v}(1) = 1.
- `toric_character` (characterisation): π(ι\_ς(t))W\_{χ,v} = χ\_v^{-1}(t)W\_{χ,v} for t in the local torus.
- `toric_rat_compat` (compatibility): F = ℚ, n⁻ = 1: f\*\_χ has the q-expansion of the newform with the χ-twisted p-depletion of BDP.
- `toric_not_newvector` (non-example): The new vector itself is not toric at ramified places of χ; using it makes P\_χ vanish.

*Acceptance.* n⁻ = 1, F = ℚ: f\*\_χ is the p-depleted, χ-toric newform used by Bertolini–Darmon–Prasanna.

*Rests on.* `L3h/hsieh-setting`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `L3/hilbert-cusp-combinatorics`.

*Sources.* HSIEH-2014, Definition 3.1, Lemma 3.2 p. 727; Definition 3.12, Lemma 3.13 pp. 736–737; Definition 3.16 p. 739; Proposition 3.19 p. 742; Definition 5.1 p. 749: Hsieh defines toric Whittaker functions, chooses them place by place including the p-modified ones, forms the toric automorphic form and its normalised Hilbert modular form, and proves integrality and the mod-p criterion for the normalised local Fourier coefficients.

### Hsieh’s square-root anticyclotomic distribution L\_{Σ\_p}(π, λ)

`L3h/anticyclotomic-distribution` — construction.

There is a unique p-adic distribution F\_{λ,c} : C(Γ⁻) → V(c, M, ℤ\_p) (p-adic Hilbert modular forms) supported on the image Γ′ of the relevant ideles, with F\_{λ,c}(φ̂) = θ^m f\*\_{λφ,c} for every φ̂ ∈ X\_p^crit of weight (m, −m) (Proposition 5.5); its q-expansion measure has coefficient a\_β(f\*\_λ, c)ϕ(rec\_{Σ\_p}(β)) at q^β. The anticyclotomic distribution L\_{Σ\_p}(π, λ) ∈ Λ is the weighted sum of the evaluations of F\_{λ,c} at the CM points x(a) (with the ideal classes and the twisting operators |[a] of Definition 5.6), divided by the p-adic period: a measure, the square root of the anticyclotomic p-adic L-function L\_{Σ\_p}(π, λ)².

*Hypotheses.* Hsieh’s setting with (ord); c a prime-to-p polarisation ideal; the evaluation at CM points uses cm-points-and-canonical-trivialisations.

*Proof or construction.*

1. Define the q-expansion measure F\_{λ,c}(q); by the p-adic q-expansion principle (L3/padic-q-expansion-principle) and the integrality of the normalised Fourier coefficients (toric-test-vectors) it is a measure with values in p-adic Hilbert modular forms; its moments are θ^m f\*\_{λφ,c} by Katz’s θ on q-expansions (L3/katz-differential-operators).
2. Evaluate at CM points with canonical trivialisations and sum over the anticyclotomic class group with the twisting operators (Hsieh §5.4).

*Uses.* HSIEH-2014 Theorem A: its square interpolates central values; GeneralizedHeegnerCycles:GH.1/coleman-depletion-calculation: p-depletion and negative θ-powers on the CM ordinary locus; GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function: the F = ℚ, n⁻ = 1 measure, which GZ.9 squares; RankZeroOneBSD:BSD.6a: Hsieh’s toric BDP measure.

*API.*

- `HsiehMeasure.qExpansionMeasure` (constructor): F\_{λ,c} with values in V(c, M, ℤ\_p).
- `HsiehMeasure.qExpansionMeasure_moment` (simp): F\_{λ,c}(φ̂) = θ^m f\*\_{λφ,c}.
- `HsiehMeasure.qExpansionMeasure_unique` (characterisation): Uniqueness given support in Γ′ and the moments.
- `HsiehMeasure.squareRoot` (constructor): L\_{Σ\_p}(π, λ) ∈ Λ = ℤ\_p[[Γ⁻]] (after a finite coefficient extension).
- `HsiehMeasure.pAdicL` (data): L\_{Σ\_p}(π, λ) := L\_{Σ\_p}(π, λ)², the anticyclotomic p-adic L-function.
- `HsiehMeasure.twist` (functoriality): Twisting λ by a character of Γ⁻ translates the measure (L0/evaluation-norm-twist-maps).

*Unit tests.*

- `hsieh_measure_trivial_char` (computation): φ̂ = 1 (m = 0): the evaluation is the CM-point sum of f\*\_λ, whose square is given by Theorem A at m = 0.
- `hsieh_measure_support` (characterisation): F\_{λ,c}(ϕ) = 0 for ϕ supported outside Γ′, since a\_β(f\*\_λ, c) = 0 unless β ∈ O\_{F,(p)}^×.
- `hsieh_rat_compat` (compatibility): F = ℚ, n⁻ = 1: L\_{Σ\_p}(π, λ) is the Castella–Hsieh measure L\_{p,ψ}(f) up to the unit factors of bdp-castella-hsieh-specialisation.
- `hsieh_square_not_root` (non-example): The unsquared element does not interpolate central values: Theorem A is a statement about L\_{Σ\_p}(π, λ)², and L\_{Σ\_p} itself is determined only up to sign at each specialisation by the square formula.

*Acceptance.* M imaginary quadratic, F = ℚ, n⁻ = 1: the Bertolini–Darmon–Prasanna / Castella–Hsieh measure (comparison bdp-castella-hsieh-specialisation).

*Rests on.* `L3h/toric-test-vectors`, `L3/padic-hilbert-modular-forms`, `L3/padic-q-expansion-principle`, `L3/katz-differential-operators`, `L3/cm-points-and-canonical-trivialisations`, `L0/ray-class-distributions`.

*Sources.* HSIEH-2014, Proposition 5.5 and its proof, p. 753; Definition 5.6, p. 754; §5.4: Hsieh constructs the unique distribution F\_{λ,c} on Γ⁻ with values in p-adic modular forms interpolating θ^m f\*\_{λφ,c}, and obtains L\_{Σ\_p}(π, λ) by evaluating it at CM points.

### Interpolation of central Rankin–Selberg values (Hsieh Theorem A, Theorem 5.7)

`L3h/theorem-a` — theorem.

Assume (ord), Hypothesis A and (sf). For every φ̂ ∈ X\_p^crit of weight (m, −m), φ̂(L\_{Σ\_p}(π, λ))²/Ω\_p^{2(k+2m)} = Γ\_Σ(k+m)Γ\_Σ(m+1)/((Im δ)^{k+2m}(4π)^{k+2m+1·Σ})·e\_{Σ\_p}(π, λφ)·L(1/2, π\_M ⊗ λφ)/Ω\_M^{2(k+2m)}·[O\_M^×:O\_F^×]²·φ(𝔉^{-1}), with Ω\_M = (2πi)^{-1}Ω\_∞, (Im δ) = (Im σ(δ))\_σ, and 𝔉 the split part of the decomposition 𝔑⁺ = 𝔉𝔉̄ of the prime-to-p conductor. Equivalently (Theorem 5.7), (L\_{Σ\_p}(π, λ)(φ̂)/Ω\_p^{k+2m})² = [O\_M^×:O\_F^×]²·e\_{Σ\_p}(π, λφ)L^{alg}(1/2, π\_M ⊗ λφ)·φ^{-1}(𝔉). Each factor (Γ-values, Im δ, (4π)-power, p-adic multiplier, unit index, φ(𝔉^{-1}), periods) is a separate datum. If π is induced from a Hecke character of M, L\_{Σ\_p}(π, λ) is, up to a unit of Λ, a product of two Katz–Hida–Tilouine p-adic L-functions.

*Hypotheses.* (ord), Hypothesis A, (sf), p odd; the CM-type ordinarity does not assume π ordinary.

*Proof or construction.*

1. Evaluate the CM-point sum of θ^m f\*\_{λφ,c} (anticyclotomic-distribution); convert θ^m to δ^m at CM points with the periods (L3/katz-cm-algebraicity).
2. The sum of δ^m f\* over CM points is the toric period P\_{λφ}(π(ς)V^{e+m}ϕ\_{λφ}); square it with explicit-waldspurger (Theorem 3.14).
3. Collect constants; the factor φ(𝔉^{-1}) comes from the choice of the split part of the level.

*Acceptance.* m = 0: the value of L\_{Σ\_p}(π, λ) at the trivial character squared is the algebraic central value L(1/2, π\_M ⊗ λ) times explicit factors. F = ℚ, n⁻ = 1: BDP Theorem 5.4 / Castella–Hsieh Proposition 3.8 up to normalisation (bdp-castella-hsieh-specialisation).

*Rests on.* `L3h/anticyclotomic-distribution`, `L3h/explicit-waldspurger`, `L3/katz-cm-algebraicity`, `L3/cm-periods`, `L3/katz-hida-tilouine-tame`.

*Sources.* HSIEH-2014, Theorem A, p. 712; Theorem 5.7 and its proof, p. 754: Hsieh proves the interpolation of the square of L\_{Σ\_p}(π, λ) at critical characters with the stated Γ-, period, multiplier and unit factors, and notes the induced case factors as two Katz–Hida–Tilouine functions.

### The µ-invariant from Fourier coefficients at CM cusps (Hsieh Theorem 6.1)

`L3h/cm-integrality-criterion` — theorem.

Assume p unramified in F (with the setting of theorem-a). The µ-invariant µ⁻\_{π,λ,Σ} := inf{r ∈ ℚ\_{≥0} : p^{-r}L\_{Σ\_p}(π, λ) ≢ 0 mod m\_pΛ} equals inf\_{(a,u)∈D₁×D₀, β∈F\_+} v\_p(a\_β(f\*\_{λ,u}, c(a))), the minimum valuation of the Fourier coefficients of the forms f\*\_{λ,u} at the cusps (a, b) for which ab^{-1} is the polarisation of an abelian variety with CM by O\_M.

*Hypotheses.* p unramified in F; Hida’s linear independence (hida-linear-independence) is the input that requires this.

*Proof or construction.*

1. Write L\_{Σ\_p}(π, λ) as a finite sum over (u, a) of the p-adic avatars F\_{u,a}|[a] evaluated along the CM points (Hsieh §6).
2. Reduce modulo p: by Hida’s linear independence of the translates a\_i(f\_ij) modulo p under the automorphisms of the Igusa tower (Hida 2010 Theorem 3.20, Corollary 3.21) and the q-expansion principle, the reduction vanishes iff each F\_{u,a} vanishes modulo p, i.e. iff all its Fourier coefficients do.

*Acceptance.* F = ℚ: µ vanishes iff some Fourier coefficient of the toric form at the cusp ∞ is a p-unit.

*Rests on.* `L3h/anticyclotomic-distribution`, `L3h/hida-linear-independence`, `L3/padic-q-expansion-principle`.

*Sources.* HSIEH-2014, Theorem 6.1 and its proof, p. 756; Introduction, pp. 715–716: Hsieh proves that the µ-invariant equals the infimum of p-adic valuations of Fourier coefficients of the toric forms at the CM cusps, reducing the question by Hida’s method.

### Vanishing of the anticyclotomic µ-invariant (Hsieh Theorem B, Theorem 6.2)

`L3h/theorem-b` — theorem.

Assume (ord), Hypothesis A, (sf), p unramified in F and (aiK) the residual representation ρ̄\_p(π\_M) := ρ\_p(π)|\_{G\_M} mod m\_p is absolutely irreducible. Then µ⁻\_{π,λ,Σ} = 0 if and only if Σ\_{v|c\_λ⁻}µ\_p(Ψ\_{π,λ,v}) = 0, with the local invariants of (3.30) (Theorem 6.2). In particular (Theorem B) µ⁻\_{π,λ,Σ} = 0 when moreover p ∤ ∏\_{v(c⁻\_λ)=1}#(∆\_{λ,v}), ∆\_{λ,v} = λ(O\_{M\_v}^×) for v | c\_λ⁻ (Remark 6.4: this local condition gives the vanishing of the local invariants).

*Hypotheses.* The three extra hypotheses p ∤ D\_F, (aiK) and the local image-order condition, in addition to those of theorem-a. The Galois representation ρ\_p(π) is imported for k\_σ ≥ 2 (AutomorphicGaloisRepresentations:R19.2); Hsieh also allows limits of discrete series (k\_σ = 1), whose Galois representations (Rogawski–Tunnell, Jarvis) are not planned in the atlas, so the weight-one case is outside this node.

*Proof or construction.*

1. If some µ\_p(Ψ\_{π,λ,v}) > 0 then every a\_β(f\*\_{λ,u}, c(a)) ≡ 0 mod m\_p (Proposition 5.3 with Proposition 3.19), so µ > 0 by cm-integrality-criterion.
2. Conversely, if all local invariants vanish, a nonzero coefficient modulo p exists by Proposition 3.19; relate the Fourier coefficients at the CM cusps to traces of Frobenius of ρ\_p(π) (Hecke eigenvalues) and use (aiK) with the group-theoretic Lemma 6.3 to find β with a\_β ≢ 0.
3. Theorem B from Theorem 6.2 and Remark 6.4.

*Acceptance.* n⁻ = 1 and λ unramified at the non-split primes: the local invariants vanish and µ = 0 under (aiK).

*Rests on.* `L3h/cm-integrality-criterion`, `L3h/toric-test-vectors`, `L3h/hsieh-setting`, `AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation`, `AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`.

*Sources.* HSIEH-2014, Theorem B, p. 713; Theorem 6.2 and proof, Lemma 6.3, Remark 6.4, pp. 757–758: Hsieh characterises µ = 0 by the vanishing of local invariants under absolute irreducibility of the residual representation restricted to G\_K, and deduces Theorem B under the character-image condition.

### Mod-p nonvanishing of central values with ℓ-power anticyclotomic twists (Hsieh Theorem C, Theorem 7.1)

`L3h/theorem-c` — theorem.

Let ℓ ≠ p be a prime, 𝔩 a prime of F above ℓ, Γ⁻\_𝔩 the Galois group of the anticyclotomic pro-ℓ extension in the ray class field of M of conductor 𝔩^∞, X⁰\_𝔩 its finite-order characters, and χ a Hecke character of infinity type (k/2 + m, −k/2 − m) and conductor c\_χ. Assume (ord), (sf), Hypothesis A, p unramified in F, (pl, n c\_χ D\_{M/F}) = 1, ρ̄\_p(π\_M) absolutely irreducible, and p ∤ ∏\_{v(c⁻\_χ)=1}#∆\_{χ,v} (Theorem 7.1: µ\_p(Ψ\_{π,χ,v}) = 0 for v | c⁻\_χ). Then for almost all φ ∈ X⁰\_𝔩, [O\_M^×:O\_F^×]²·Γ\_Σ(k+m)Γ\_Σ(m+1)/((Im δ)^{k+2m}(4π)^{k+2m+1·Σ})·L(1/2, π\_M ⊗ χφ)/Ω\_M^{2(k+2m)} ≢ 0 mod m\_p. ‘Almost all’ means all but finitely many φ if dim\_{ℚ\_ℓ}F\_𝔩 = 1, and a Zariski-dense subset if dim\_{ℚ\_ℓ}F\_𝔩 > 1.

*Hypotheses.* The conductor conditions of Theorem C, separate from those of Theorem B, and p unramified in F, which Theorem C as printed omits but Theorem 7.1 (through Theorem 6.2) assumes (sourceIssues E6); the index c⁻\_χ in the local condition follows Theorem 7.1 (sourceIssues E7); the two meanings of ‘almost all’ are distinct and must be kept.

*Proof or construction.*

1. Hida’s method (Hsieh §7.1): express the algebraic L-values as a p-adic measure on the ℓ-adic anticyclotomic class group Cl⁻\_{𝔩^∞} given by evaluating the toric form at CM points (Hsieh’s Proposition 7.3, Lemma 7.4).
2. Non-vanishing modulo p for almost all φ follows from the Zariski density of CM points in the Igusa tower modulo p and linear independence (hida-cm-density, hida-linear-independence), together with the nonvanishing modulo p of some Fourier coefficient at a CM cusp (Proposition 3.19 and (aiK)).

*Acceptance.* F = ℚ: ℓ-power anticyclotomic twists of a newform have p-unit algebraic central values for all but finitely many characters (a Vatsal-type statement).

*Rests on.* `L3h/theorem-b`, `L3h/hida-cm-density`, `L3h/hida-linear-independence`, `L3h/explicit-waldspurger`.

*Sources.* HSIEH-2014, Theorem C, p. 713; Theorem 7.1 and §7.1, pp. 759–760: Hsieh proves the nonvanishing modulo p of algebraic central values twisted by ℓ-power anticyclotomic characters, for almost all characters with the two meanings of ‘almost all’, following Hida’s method.

### The F = ℚ, n⁻ = 1 specialisation: the BDP / Castella–Hsieh measure

`L3h/bdp-castella-hsieh-specialisation` — comparison.

For F = ℚ, M an imaginary quadratic field in which p splits, π attached to a newform f of weight k and level N with every prime dividing N split in M (n⁻ = 1, so Hypothesis A and (sf) hold), and λ of infinity type (k/2, −k/2), Hsieh’s L\_{Σ\_p}(π, λ) is the anticyclotomic measure of Bertolini–Darmon–Prasanna (recovering BDP Theorem 5.4 under their extra assumptions p ∤ N and n⁻ divisible only by ramified primes) and the measure L\_{p,ψ}(f) of Castella–Hsieh on Γ̃ = Gal(M\_{p^∞}/M) used by GeneralizedHeegnerCycles, GrossZagierAndArithmeticHeights and RankZeroOneBSD. The comparison records: the change of variable φ̂ ↦ λ^{-1}φ^{-1}|·|^{k/2} between Hsieh’s X\_p^crit and BDP’s Σ\_cc^{(2)}(N), the opposite infinity-type conventions, the factor φ(𝔉^{-1}), the unit index, the periods Ω\_p, Ω\_∞, and the Euler factor at the prime above p fixed by ι\_p for p-new f.

*Hypotheses.* F = ℚ, M imaginary quadratic, p split, Heegner hypothesis for N; for p-new f the extra Euler factor is recorded, not hidden.

*Proof or construction.*

1. Specialise theorem-a; translate characters and infinity types as in Hsieh’s Remark on p. 712.
2. Match with the interpolation formula of Castella–Hsieh Proposition 3.8 as quoted by Castella–Grossi–Lee–Skinner (§2.1.2), factor by factor.

*Acceptance.* The square of the specialisation at the trivial character is L^{alg}(1/2, π\_M ⊗ λ) times the explicit factors.

*Rests on.* `L3h/theorem-a`, `L3h/anticyclotomic-distribution`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.

*Sources.* HSIEH-2014, Remark after Theorem A, p. 712: Hsieh notes that for F = ℚ his construction recovers BDP Theorem 5.4 under extra assumptions, describes the change of variables to BDP’s set of characters and that their infinity-type conventions are opposite. CGLS-2022, §2.1.1 and Theorem 2.1.1, pp. 12–13: Castella–Grossi–Lee–Skinner use the measure L\_E built from Castella–Hsieh’s Proposition 3.8 for the BDP p-adic L-function.

### Mod-p nonvanishing of anticyclotomic L-values (sub-layer L3m)

`L3h/mod-p-nonvanishing` — theorem.

This node collects the mod-p inputs that L3h’s Theorems B and C and the congruence consumers need, as one sub-layer: (i) Hida’s linear independence modulo p of translates of mod-p modular forms under the automorphisms of the Igusa tower at a CM point (hida-linear-independence); (ii) Hida’s Zariski density of CM points in the Hilbert modular Igusa tower modulo p (hida-cm-density); (iii) Hida’s µ = 0 theorem for anticyclotomic Katz–Hida–Tilouine p-adic L-functions (hida-katz-mu-vanishing); (iv) Hsieh’s mod-p nonvanishing of Hecke L-values twisted by ℓ-power anticyclotomic characters (hsieh-hecke-nonvanishing); (v) Finis’ divisibility of anticyclotomic Hecke L-values by p-adic valuation of local invariants (finis-divisibility). Statement: under the hypotheses of the respective theorems, the central L-values of the corresponding families are p-adic units for almost all characters (in the sense of each theorem).

*Hypotheses.* Each part keeps its own hypotheses (p > 2 unramified in F, ordinary CM type, root-number and residual conditions).

*Proof or construction.*

1. Assemble (i)–(v); the dependencies are the five nodes of this sub-layer.

*Acceptance.* Skinner–Urban’s Klingen-Eisenstein nonvanishing modulo p uses (v) and Vatsal’s theorem through this node; Castella–Liu–Wan’s §5.6 uses (iv).

*Rests on.* `L3h/hida-linear-independence`, `L3h/hida-cm-density`, `L3h/hida-katz-mu-vanishing`, `L3h/hsieh-hecke-nonvanishing`, `L3h/finis-divisibility`.

*Sources.* HSIEH-2014, Introduction, p. 713 (the list [Vat03], [Hid04a], [Fin06], [Hsi12]) and pp. 713–714 (applications to Eisenstein congruences): Hsieh places his Theorem C among the mod-p nonvanishing results of Vatsal, Hida, Finis and Hsieh and explains their role in Eisenstein-congruence arguments (Skinner–Urban use Finis and Vatsal).

### Hida’s linear independence modulo p at a CM point (Hida 2010 Theorem 3.20, Corollary 3.21) (sub-layer L3m)

`L3h/hida-linear-independence` — theorem.

Let F̄ be the residue field of W (an algebraic closure of F\_p), x ∈ Ig(F̄) a closed point of the Hilbert modular Igusa tower fixed by the action of T(ℤ\_(p)) (a CM point), and let a ∈ T(ℤ\_p) = O\_p^× act on the formal completion Ô\_{Ig,x} by t ↦ t^a on the canonical Serre–Tate coordinate. If a₀, …, a\_n ∈ T\_x(ℤ\_p) satisfy a\_ia\_j^{-1} ∉ T\_x(ℚ) for i ≠ j and, for a fixed parallel weight κ, the mod-p modular forms {H\_κ, f\_ij}\_j are linearly independent over F̄ for each i in a subset I, then {a\_i(f\_ij)}\_{i∈I,j} are linearly independent over F̄ in Ô\_{S,y}/F̄ (Corollary 3.21; Theorem 3.20 is the corresponding statement for the stalks).

*Hypotheses.* p unramified in F (needed where the corollary is applied in §5); F̄ an algebraic closure of F\_p.

*Proof or construction.*

1. Hida’s proof (§3): a Zariski-closed subscheme of a product of copies of the Igusa tower stable under the torus action is a union of ‘diagonal’ subschemes given by isogenies (Proposition 3.11, Corollary 3.16, via Chai’s rigidity of formal tori); a linear relation among the a\_i(f\_ij) would produce such a subscheme contradicting a\_ia\_j^{-1} ∉ T\_x(ℚ).
2. Corollary 3.21 by dividing by a(H\_κ), which is 1 at t.

*Acceptance.* F = ℚ: translates of mod-p modular forms by distinct elements of ℤ\_p^× modulo ℚ^× are linearly independent at a CM point (the one-dimensional case).

*Rests on.* `L3/igusa-irreducibility`, `L3/cm-points-and-canonical-trivialisations`, `L3/padic-hilbert-modular-forms`.

*Sources.* HIDA-2010, §3.5, Theorem 3.20 pp. 98–100, Corollary 3.21 p. 101: Hida proves linear independence modulo p of translates of modular forms under the torus action at a CM point of the Igusa tower, through rigidity of the Serre–Tate coordinates. HSIEH-2014, Proof of Theorem 6.2, p. 757: Hsieh uses Hida’s Theorem 3.20 and Corollary 3.21 with the q-expansion principle for p-adic modular forms.

### Hida’s Zariski density of CM points modulo p (as used by Hsieh) (sub-layer L3m)

`L3h/hida-cm-density` — theorem.

For a CM field M with p-ordinary CM type, ℓ ≠ p and 𝔩 | ℓ a prime of F, the CM points of conductor 𝔩^n (n ≥ 0) attached to the anticyclotomic class groups Cl⁻\_{𝔩^n} are Zariski dense in the Igusa tower over the Hilbert modular variety modulo p (in each irreducible component, of dimension [F:ℚ]), in the strong form that a function on the Igusa tower modulo p that vanishes at almost all such points (outside finitely many if dim\_{ℚ\_ℓ}F\_𝔩 = 1, outside a non-Zariski-dense set otherwise) vanishes identically. This is the input that converts ‘a Fourier coefficient at some cusp is a p-unit’ into ‘the measure on Cl⁻\_{𝔩^∞} is nonzero modulo p for almost all characters’.

*Hypotheses.* p > 2 unramified in F; p-ordinary CM type; ℓ ≠ p.

*Proof or construction.*

1. Hida, ‘Non-vanishing modulo p of Hecke L-values’ (Geometric aspects of Dwork theory, 2004), Theorems 3.2 and 3.3 — not read here (not freely available); statement taken from Hsieh 2014 §7 (p. 760) and the definition of ‘almost all’ ([Hid04a, p. 737] quoted by Hsieh, p. 713). The proof uses the irreducibility of the Igusa tower (L3/igusa-irreducibility) and Chai’s rigidity of Hecke-stable subvarieties.

*Acceptance.* F = ℚ: Heegner points of ℓ-power conductor are dense modulo p in the Igusa curve (Vatsal’s setting).

*Rests on.* `L3/igusa-irreducibility`, `L3/cm-points-and-canonical-trivialisations`.

*Sources.* HSIEH-2014, §7.1 and the proof of Theorem 7.1, pp. 759–760 (citing [Hid04a, Thm. 3.2 and Thm. 3.3]); Theorem C and the meaning of ‘almost all’, p. 713: Hsieh reduces the nonvanishing of L-values modulo p to the nonvanishing of a Fourier coefficient at some cusp via Hida’s density theorems, and quotes Hida’s meaning of ‘almost all’.

### Hida’s µ = 0 for anticyclotomic Katz–Hida–Tilouine p-adic L-functions (Hida 2010 Theorem I) and Hsieh’s refinement (sub-layer L3m)

`L3h/hida-katz-mu-vanishing` — theorem.

Let φ be the measure of L3/katz-hida-tilouine-tame on Z(C) with branch character ψ and anticyclotomic projection φ⁻\_ψ on Γ⁻. If p > 2 is unramified in F/ℚ and the inert-or-ramified part 𝔍 of C is trivial, then µ(φ⁻\_ψ) = 0 unless the condition (V) holds; when (V) holds µ(φ⁻\_ψ) is finite and positive; (V) is equivalent to (M1) M/F unramified at every finite place, (M2) the strict ideal class of the polarisation ideal c in F is not a norm class from M, (M3) a ↦ (ψ(a)N\_{F/ℚ}(a) mod m\_W) is the quadratic character of M/F (Hida 2010 Theorem I and Lemma 5.2). For self-dual characters with root number +1, Hsieh computes µ = Σ\_{v|C⁻}µ\_p(χ\_v) (Hsieh 2012/2014 Theorem A) and proves µ = 0 when the local invariants vanish and χ is not residually self-dual (Theorem B).

*Hypotheses.* p > 2, p unramified in F/ℚ, I = 1 for Hida’s Theorem I; p ∤ D\_F for Hsieh’s refinement; ordinary CM type.

*Proof or construction.*

1. Hida 2010: split the Katz measure by branch characters, compute its q-expansion at good representatives (§5.1–5.3), and conclude by linear independence (hida-linear-independence) and the q-expansion principle (Theorem 5.1).
2. Hsieh’s refinement: same strategy with self-dual characters and the local invariants µ\_p(χ\_v) (Hsieh, ‘On the µ-invariant of anticyclotomic p-adic L-functions for CM fields’, Theorems A, B, 6.5).

*Acceptance.* M imaginary quadratic, p split, ψ a branch character not satisfying (V): µ = 0, as used by Castella–Grossi–Lee–Skinner for the Eisenstein branch.

*Rests on.* `L3/katz-hida-tilouine-tame`, `L3h/hida-linear-independence`, `L3/padic-q-expansion-principle`.

*Sources.* HIDA-2010, Theorem I and conditions (V), (M1)–(M3), p. 45: Hida proves the vanishing of the anticyclotomic µ-invariant of the Katz–Hida–Tilouine measure for p > 2 unramified in F with I = 1, unless (V), where it is positive. HSIEH-2012-MU, Theorems A and B, p. 2; Theorem 6.5 p. 23: Hsieh computes µ for self-dual characters with root number +1 as the sum of local invariants and proves µ = 0 for non-residually-self-dual characters with vanishing local invariants. CGLS-2022, Introduction p. 4; Theorem 2.2.2 and proof, p. 15: Castella–Grossi–Lee–Skinner deduce µ(L\_E) = 0 from the Eisenstein congruence and Hida’s theorem for the Katz p-adic L-functions of the two characters.

### Mod-p nonvanishing of Hecke L-values with ℓ-power anticyclotomic twists (Hsieh 2012 Theorems A, B) (sub-layer L3m)

`L3h/hsieh-hecke-nonvanishing` — theorem.

Assume (unr) p > 2 unramified in F, (ord) Σ p-ordinary, and (pℓ, D\_{M/F}C) = 1. Let χ be a Hecke character of M. (Theorem B) If µ\_p(χ\_v) = 0 for every v | C⁻ and χ is not residually self-dual, then (NV) holds for (χ, 𝔩): the algebraic Hecke L-values L(0, χφ) are p-adic units for almost all ℓ-power anticyclotomic characters φ. (Theorem A) If χ is self-dual with µ\_p(χ\_v) = 0 for v | C⁻, global root number W(χ|·|\_{A\_M}^{-1/2}) = 1, R squarefree, and 𝔩 split in M, then (NV) holds for (χ, 𝔩) (the squarefreeness can be removed, Remark 6.9).

*Hypotheses.* (unr), (ord), (pℓ, D\_{M/F}C) = 1; the extra conditions of each theorem.

*Proof or construction.*

1. Hida’s method for Katz–Hida–Tilouine measures on the ℓ-adic anticyclotomic class group, with Hsieh’s computation of the local invariants and the mod-p nonvanishing of Fourier coefficients at CM cusps, then hida-cm-density and hida-linear-independence.

*Acceptance.* M imaginary quadratic: nonvanishing modulo p of L(0, χφ) for almost all ℓ-power anticyclotomic φ, used in Castella–Liu–Wan §5.6 and by Wan for U(3,1) Fourier–Jacobi coefficients.

*Rests on.* `L3/katz-hida-tilouine-tame`, `L3h/hida-cm-density`, `L3h/hida-linear-independence`.

*Sources.* HSIEH-2012-NV, Introduction pp. 1–3 (hypotheses (unr), (ord), Theorems A and B); Theorem 6.8 and Remark 6.9, pp. 23–24: Hsieh proves the mod-p nonvanishing (NV) for ℓ-power anticyclotomic twists of Hecke characters under the stated hypotheses, for non-residually-self-dual characters (Theorem B) and for self-dual characters with root number one (Theorem A). HSIEH-2014, Introduction pp. 713–714: Hsieh lists [Hsi12] among the earlier mod-p nonvanishing results (p. 713) and explains that his Theorem C is used by Wan for Fourier–Jacobi coefficients on U(3,1) (p. 714).

### Finis’ divisibility of anticyclotomic L-values and Vatsal’s nonvanishing (sub-layer L3m)

`L3h/finis-divisibility` — theorem.

Let M be imaginary quadratic, p an odd prime split in M, ℓ an odd prime different from p, k, d positive integers and Ω\_∞ a complex CM period. (1) If ℓ splits in M, then for all but finitely many anticyclotomic Hecke characters λ of M of conductor dividing dD\_Mp^∞, infinity type (−k, k − 1) and global root number W(λ) = +1, v\_ℓ(Ω\_∞^{1−2k}(k−1)!(2π/√D)^{k−1}W\_ℓ(λ)L(0, λ)) = Σ\_{q inert}µ\_ℓ(λ\_q), where W\_ℓ(λ) = N(l)^{−e(l)}G(δ, λ\_l) is the ℓ-adic root number (l the prime of M above ℓ fixed by i\_ℓ, e(l) the exponent of l in the conductor) and µ\_ℓ(λ\_q) the local invariant at an inert q. (2) If ℓ is inert or ramified and k = 1, v\_ℓ(Ω\_∞^{-1}D^{1/4}L(0, λ)) = Σ\_{q ≠ ℓ inert}µ\_ℓ(λ\_q) + b\_ℓ(λ\_ℓ, w(λ)) for all but finitely many such λ of infinity type (−1, 0). For every anticyclotomic λ of these infinity types the left side is at least the right side, except possibly for M = ℚ(√−3) and ℓ = 3. Vatsal’s nonvanishing of central L-values of weight-two forms twisted by anticyclotomic characters modulo p (Duke 116 (2003)) is the GL₂ counterpart; it is not read here and is recorded as an import for the consumers.

*Hypotheses.* M imaginary quadratic, p odd split, ℓ odd ≠ p (Finis’ ℓ plays the role of the residue characteristic of the valuation).

*Proof or construction.*

1. Finis’ proof: theta functions with complex multiplication and their reduction modulo ℓ, Shintani representation and the nonvanishing of theta functions in characteristic ℓ (Theorem 4.1), combined with Hida’s method.

*Acceptance.* k = 1, ℓ split: the ℓ-adic valuation of the algebraic L-value equals the sum of local invariants at the inert primes for almost all characters.

*Rests on.* `L3/cm-periods`, `L3h/hida-cm-density`.

*Sources.* FINIS-2006, §1, pp. 767–769, Theorem 1.1; §4, Theorem 4.1, p. 795: Finis proves the equality of valuations of algebraic anticyclotomic Hecke L-values with sums of local invariants for almost all characters, using nonvanishing of theta functions in characteristic ℓ. HSIEH-2014, Introduction, pp. 713–714: Hsieh records that Skinner–Urban use the results of Finis and Vatsal to show the nonvanishing modulo p of Klingen–Eisenstein series on U(2,2).

### Dependencies of L3h

Within this roadmap: `L0`, `L3`.

Other roadmaps and Tau Ceti layers: `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation`, `AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GrossZagierAndArithmeticHeights:GZ.5/petersson-whittaker-factorization`, `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `HeegnerPointEulerSystems:HE.1/optimal-embedding-cm-points`.

### Refinements left in L3h

- Read Hida 2004 Theorems 3.2–3.3 and Vatsal 2003 when available and refine hida-cm-density and the Vatsal part of finis-divisibility (gaps).

## L4 — Ordinary unitary groups and the doubling method

Two doubling constructions on unitary groups. Eischen–Harris–Li–Skinner: the ordinary unitary setting and doubling datum, ordinary Hecke algebras and congruence ideals, the three hypotheses of the main theorem, differential operators, the Siegel Eisenstein measure, the global doubling identity and the local zeta integrals at p and ∞, and Main Theorem 9.2.2. Disegni–Liu: Siegel hermitian varieties, big-cell sections, Panchishkin unramified representations, the p-adic local doubling integral, the cyclotomic p-adic L-function along all embeddings (Theorem 3.37) and the parity of its vanishing order.

Planets of this layer: EHLS p-adic L-function (`L4/ehls-main-theorem`); Disegni–Liu p-adic L-function (`L4/dl-padic-l-function`).

### The EHLS unitary setting and its doubling datum

`L4/ehls-unitary-datum` — definition.

Let K be a CM field with maximal totally real subfield K⁺, p a prime unramified in K such that every place of K⁺ above p splits in K, V an n-dimensional hermitian space over K with signatures (a\_σ, b\_σ) at the archimedean places, G₁ = GU(V) its similitude group with the unitary PEL datum of PELModuli:M5/unitary-pel-datum and Shimura variety Sh(V), and −V the same space with the negated form. The doubling space is W = V ⊕ (−V) with the form ⟨·,·⟩\_V ⊕ −⟨·,·⟩\_V, maximally isotropic, so U(W) has the Siegel parabolic P with Levi GL\_n(K); G₃ ⊂ G(V) × G(−V) is the pair of groups with equal similitude and G₄ = GU(W). The embedding G₃ ↪ G₄ (doubling embedding) matches the PEL data and induces a morphism of Shimura varieties Sh(V) × Sh(−V) → Sh(W) that restricts to the ordinary loci. A cuspidal anti-holomorphic representation π of G₁ is ordinary of type (κ, K\_r) if it is holomorphic of type (κ, K\_r) for −V and its image meets the ordinary forms S^κ\_ord(K\_r, R).

*Hypotheses.* p unramified in K, every place of K⁺ above p split in K; level K = K^pK\_p with K\_p of Iwahori type of depth r at p.

*Proof or construction.*

1. The PEL data, Shimura varieties, canonical models and integral models at p come from PELModuli:M5/unitary-pel-datum with ShimuraCompactifications:C5/integral-toroidal-space for compactifications; the hermitian space −V and the doubled space W are linear algebra over K.
2. The doubling embedding of groups and of PEL data (EHLS §3, ‘PEL data and restriction of forms’) and its compatibility with ordinary loci follow from the decomposition of the p-divisible groups at split places.
3. Ordinarity of π is the condition of EHLS §6.6 on the image of π in the ordinary forms.

*Uses.* EHLS Theorem 4.6.1: the doubling integral lives on G₃ ⊂ G₄; EHLS Main Theorem 9.2.2: the hypotheses on π; AutomorphicCongruences:L1: Skinner–Urban use the U(2,2) instance.

*API.*

- `EHLSDatum` (constructor): (K, p, V, signatures, level) with the splitting condition on p.
- `EHLSDatum.doubling` (constructor): W = V ⊕ (−V), its Siegel parabolic, G₃ ↪ G₄.
- `EHLSDatum.doubling_shimura` (functoriality): Sh(V) × Sh(−V) → Sh(W), compatible with ordinary loci and integral models.
- `EHLSDatum.IsOrdinaryOfType` (constructor): π ordinary of type (κ, K\_r).
- `EHLSDatum.negSpace_shimura` (relation): Sh(−V) is canonically identified with Sh(V) anti-holomorphically, exchanging holomorphic and anti-holomorphic forms.

*Unit tests.*

- `ehls_torus` (degenerate): n = 1: G₁ is a CM torus and the ordinary forms are functions on CM points.
- `ehls_split_condition` (computation): K = ℚ(i), p = 5: the condition holds; p = 3: it fails (3 is inert).
- `ehls_doubling_isotropic` (characterisation): The diagonal {(v, v)} is a maximal isotropic subspace of W.
- `ehls_not_unitary_quasisplit` (non-example): U(V) itself need not be quasi-split; it is U(W) that is quasi-split by construction, which is why the Eisenstein series live on G₄.

*Acceptance.* n = 1: G₁ = GU(1) is a torus and the doubling construction reduces to Katz’s CM setting (EHLS History §1.2). n = 2, signature (1, 1) at one place: unitary Shimura curves.

*Rests on.* `PELModuli:M5/unitary-pel-datum`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C2/canonical-toroidal-model`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `ShimuraVarieties:V5/main-cm`.

*Sources.* EHLS-2020, §1.4 notation, p. 11 (hypotheses on p); §1 introduction pp. 5–7 (doubling space, Garrett map); §3 pp. 35–40 (PEL data and restriction of forms); §6.6, p. 104 (ordinary of type (κ, K\_r)): EHLS fix p unramified in K with every place of K⁺ above p split, the hermitian space V with its signatures, the doubled space W = V ⊕ (−V) and the doubling embedding of Shimura varieties, and define ordinary anti-holomorphic representations of type (κ, K).

### Ordinary p-adic forms, the ordinary Hecke algebra and congruence ideals (EHLS §§6–7)

`L4/ehls-ordinary-forms-hecke` — construction.

For the datum of ehls-unitary-datum: the ordinary projector e on p-adic modular forms on the Igusa tower over the ordinary locus of Sh(V) (in characteristic zero and over O, built from the canonical and subcanonical extensions of the automorphic bundles), the spaces S^κ\_ord(K\_r, R), the ordinary Hecke algebra T\_{K\_r,κ,R} generated by the normalised U\_{w,j,κ} at p and the T(g) away from p, its connected component T\_π at the maximal ideal of an ordinary π, the Λ-adic module of ordinary forms with control (EHLS Theorem 7.3.1: T\_π is finite free over Λ^o\_π), the congruence ideal C(π) of Definition 6.7.2 (annihilator of the quotient of ordinary cohomology cut out by π), and the R-lattices Î\_π, Î\_{π♭} of test vectors.

*Hypotheses.* Characteristic-zero lifts of the special-fibre Igusa tower are constructed here from the canonical trivialisation over the ordinary locus; IgusaVarietiesAndTorsionConcentration:IG.1 supplies only the special-fibre and finite-level geometry.

*Proof or construction.*

1. Automorphic bundles and canonical/subcanonical extensions: AutomorphicBundles:B2, B3; Fourier–Jacobi/q-expansion principle: AutomorphicBundles:B5/vector-expansion-principle; Koecher on the ordinary locus: ShimuraCompactifications:C5/ordinary-koecher.
2. Igusa tower over the ordinary locus in characteristic zero: trivialisations of the multiplicative part of the p-divisible group of the universal abelian scheme at split places (the mixed-characteristic lift that IG.1 does not supply).
3. Ordinary projector e = lim U\_p^{n!} and Hida’s control theorem in this PEL setting (EHLS §§7.1–7.3; PadicFamilies supplies the general family formalism).
4. Congruence ideal and the test-vector lattices (EHLS §§6.7, 8.4–8.5).

*Uses.* EHLS Main Theorem 9.2.2: L(Eis, ϕ ⊗ ϕ♭) lies in Λ\_{X\_p,R} ⊗̂ T; AutomorphicCongruences:L1: Skinner–Urban’s ordinary Hecke algebra on U(2,2).

*API.*

- `EHLS.ordinaryProjector` (constructor): e on p-adic forms, idempotent, commuting with Hecke operators.
- `EHLS.ordinaryHeckeAlgebra` (constructor): T\_{K\_r,κ,R} and its component T\_π.
- `EHLS.ordinaryHeckeAlgebra_finite_free` (characterisation): T\_π is finite free over Λ^o\_π (Theorem 7.3.1).
- `EHLS.congruenceIdeal` (data): C(π) ⊂ R.
- `EHLS.testVectorLattice` (data): Î\_π and Î\_{π♭}, free R-modules of test vectors.
- `EHLS.ordinary_control` (compatibility): For κ sufficiently regular, T\_π ⊗\_{Λ^o\_π} Λ^o\_π/I\_κ ≅ T\_{K^pr,κ,O\_π} (EHLS Theorem 7.3.1(ii)), so specialisation of the Λ-adic ordinary module at such κ gives S^κ\_ord.

*Unit tests.*

- `ehls_projector_idempotent` (characterisation): e² = e.
- `ehls_torus_hecke` (degenerate): n = 1: T\_π is a component of a completed group ring and C(π) = R.
- `ehls_congruence_gl2` (compatibility): For U(1,1) ≈ GL₂ up to centre and an ordinary newform, C(π) agrees with the congruence ideal of PadicFamilies:L1/congruence-ideal under the comparison of Hecke algebras.
- `ehls_not_all_components` (non-example): T\_π need not be Gorenstein: Hypothesis 7.3.2 is not a consequence of the construction.

*Acceptance.* n = 1: the ordinary Hecke algebra of a CM torus is a group ring and C(π) is trivial.

*Rests on.* `L4/ehls-unitary-datum`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B5/vector-expansion-principle`, `ShimuraCompactifications:C5/ordinary-koecher`, `IgusaVarietiesAndTorsionConcentration:IG.1/mantovan-igusa-variety`.

*Sources.* EHLS-2020, §6.6, the ordinary Hecke algebra T\_{K\_r,κ,R}, p. 98; Hypothesis 6.6.4, p. 99; Definition 6.7.2, p. 105; Definition 6.7.9, p. 106; Theorem 7.3.1, p. 110: EHLS define the ordinary Hecke algebra, its component T\_π, the congruence ideal C(π), the Gorenstein condition and prove T\_π is finite free over Λ^o\_π.

### The EHLS hypotheses: Gorenstein, global multiplicity one, minimality

`L4/ehls-hypotheses` — definition.

For π ordinary of type (κ, K): Hypothesis 7.3.2 (Gorenstein): T̂\_π := Hom\_{Λ^o\_π}(T\_π, Λ^o\_π) is free of rank one over T\_π (an isomorphism G\_π : T̂\_π ≅ T\_π), and Hom\_{O\_π}(lim\_r S^κ\_ord(K\_rp, O\_π), O\_π)\_{m\_π} is free over T\_π. Hypothesis 7.3.3 (global multiplicity one): every π′ ∈ S(K^p, π) occurs with multiplicity one in the cuspidal spectrum of G. Proposition–Hypothesis 7.3.5 (minimality): for every (κ₁, r₁) there is an isomorphism of T\_{K\_1^p,κ₁,O,π}-modules T\_{K^p\_1,κ₁,O,π} ⊗ Î\_π ≅ Hom(S^{κ₁}\_ord(K^p\_1r₁, O)\_{m\_π}, O). These are propositions about π, not properties of every ordinary component; each consumer states which it assumes.

*Hypotheses.* Stated as propositions (Prop-valued) on the datum; no constructor asserts them.

*Proof or construction.*

1. Each is a property of the objects of ehls-ordinary-forms-hecke; EHLS discuss when they can be verified (Taylor–Wiles methods for Gorenstein, Remark 9.3.1; the stronger multiplicity-one Hypothesis 6.6.4 is expected when the bad places split and the base change is cuspidal, p. 100; Hypothesis 7.3.3 is noted on p. 110 to follow from Mok and Kaletha–Mínguez–Shin–White, whose proofs rest partly on announced results of Arthur, so it stays a stated hypothesis here).

*Uses.* EHLS Main Theorem 9.2.2: the three hypotheses of the theorem; AutomorphicCongruences:L1: Skinner–Urban’s freeness and multiplicity-one hypotheses on U(2,2).

*API.*

- `EHLS.Gorenstein` (constructor): Hypothesis 7.3.2 as a proposition.
- `EHLS.GlobalMultiplicityOne` (constructor): Hypothesis 7.3.3 as a proposition.
- `EHLS.Minimality` (constructor): Proposition–Hypothesis 7.3.5 as a proposition.
- `EHLS.Gorenstein_open` (other): The Gorenstein locus is open; replacing Λ ⊗̂ T by the fraction fields of its components removes the hypothesis at the cost of meromorphy (Remark 9.3.1).
- `EHLS.Gorenstein_iff_dual_free` (characterisation): Gorenstein iff the Λ-dual of T\_π is free of rank one over T\_π.

*Unit tests.*

- `ehls_gorenstein_torus` (degenerate): For n = 1 the Hecke algebra is a group ring, which is Gorenstein.
- `ehls_multiplicity_one_split` (computation): Hypothesis 7.3.3 asks for multiplicity one of each π′ in the cuspidal spectrum and is weaker than Hypothesis 6.6.4, which asks that no other holomorphic cuspidal π′ of the same type share the prime-to-p Hecke eigensystem of π; a second π′ ≠ π with λ^p\_{π′} = λ^p\_π, each of multiplicity one, violates 6.6.4 but not 7.3.3 (EHLS pp. 99–100, 110).
- `ehls_gorenstein_dual_free` (characterisation): Gorenstein in the sense of 7.3.2(i) is equivalent to freeness of rank one of T̂\_π over T\_π.
- `ehls_not_automatic` (non-example): A local ring like O[x, y]/(x², xy, y²) is a finite free O-algebra that is not Gorenstein; nothing in the construction excludes such T\_π.

*Acceptance.* When the residual Galois representation has large image, Gorenstein can often be verified by Taylor–Wiles (Remark 9.3.1); it is certainly not valid in complete generality.

*Rests on.* `L4/ehls-ordinary-forms-hecke`.

*Sources.* EHLS-2020, Hypotheses 7.3.2–7.3.3, p. 110; Proposition 7.3.5, p. 112; Remark 9.3.1, p. 145: EHLS state the Gorenstein, global multiplicity one and minimality hypotheses used by the main theorem and comment that the Gorenstein hypothesis is open and often verifiable but not valid in general.

### p-adic and C^∞ differential operators on unitary forms (Eischen)

`L4/ehls-differential-operators` — construction.

On the Igusa tower over the ordinary locus of the doubled Shimura variety, Eischen’s p-adic differential operators θ^{(κ,a,b)} use the unit-root splitting of the de Rham bundle in place of the Hodge splitting; the C^∞ operators D(κ, χ) = δ(r̃\_σ, s̃\_σ) use the Hodge splitting (EHLS Corollary 4.4.9, Proposition 4.4.11). For critical (κ, χ) the C^∞ operator applied to the holomorphic Siegel Eisenstein section gives the section needed by the doubling integral, and the p-adic operator θ^{(κ,a,b)} realises it p-adically; at ordinary CM-type points their values agree up to periods (EHLS Proposition 8.1.1).

*Hypotheses.* Critical pairs (κ, χ) as in EHLS (95)–(97).

*Proof or construction.*

1. Construct the operators from the Gauss–Manin connection, Kodaira–Spencer and the chosen splitting (Eischen 2012, 2016, quoted in EHLS §§4.4, 8.1).
2. Holomorphic projection and comparison at ordinary points as in Katz’s case (L3/katz-differential-operators, L3/katz-cm-algebraicity).

*Uses.* EHLS Theorem 8.2.2: the Eisenstein measure is θ^{(κ,a,b)} of the Eisenstein family; AutomorphicPadicLFunctions:L4e/klingen-family: Eischen–Wan use the same operators on U(r+1, r+1).

*API.*

- `UnitaryTheta.padic` (constructor): θ^{(κ,a,b)} on p-adic forms on the doubled Igusa tower.
- `UnitaryTheta.cInfty` (constructor): D(κ, χ) on C^∞ forms.
- `UnitaryTheta.qExpansion` (simp): Effect of θ^{(κ,a,b)} on Fourier–Jacobi/q-expansions (multiplication by a polynomial in the index).
- `UnitaryTheta.compare` (compatibility): At ordinary CM-type points the p-adic and C^∞ values agree after the period normalisation.
- `UnitaryTheta.torus` (example): n = 1: Katz’s θ.

*Unit tests.*

- `utheta_torus` (compatibility): n = 1: θ^{(κ,a,b)} is Katz’s θ on a CM torus.
- `utheta_zero` (degenerate): Order zero: the identity.
- `utheta_weight_shift` (characterisation): θ^{(κ,a,b)} changes the weight by the representation determined by (a, b).
- `utheta_not_holomorphic` (non-example): D(κ, χ) of a holomorphic form is not holomorphic; only its holomorphic projection is.

*Acceptance.* n = 1: the operators of Katz for CM tori.

*Rests on.* `L4/ehls-unitary-datum`, `L3/katz-differential-operators`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`.

*Sources.* EHLS-2020, §4.4.10, Corollary 4.4.9, Proposition 4.4.11, pp. 73–75; Proposition 8.1.1, p. 121; p. 125: EHLS define the C^∞ operators D(κ, χ) for critical pairs and the p-adic operators θ^{(κ,a,b)} via the unit-root splitting, following Eischen, and compare them.

### The EHLS Siegel Eisenstein measure (Theorem 8.2.2)

`L4/ehls-eisenstein-measure` — construction.

There is a measure Eis\_{a,b} on X\_p × T\_H(ℤ\_p) (X\_p the p-adic characters of the relevant ray-class group of K, T\_H the torus at p) with values in the space of p-adic modular forms on G₄ such that ∫χ̃ψ·ρ^υ dEis\_{a,b} = θ^{(κ,a,b)}(G\_{k,ν,χ\_unitary,ψ}) for (χ, c = ψρ^υ) in the set Y^H\_class of classical points, where G\_{k,ν,χ,ψ} is the holomorphic Siegel Eisenstein series on U(W) attached to the factorisable Siegel section f(χ, c) chosen in §4 (with the p-adic sections designed for the local zeta integral). It is an axiomatic Eisenstein measure in the sense of Definition 5.3.2 with shift (1, χ) (Corollary 8.2.4).

*Hypotheses.* Classical points in Y^H\_class; Siegel sections chosen as in EHLS §4.2–4.3 at p and §4.5 at ∞.

*Proof or construction.*

1. Construct the Siegel Eisenstein series and their Fourier coefficients (EHLS §4.1–4.2, after Eischen 2015); verify the Kummer congruences of the coefficient family and apply θ^{(κ,a,b)} (ehls-differential-operators).
2. The q-expansion principle (AutomorphicBundles:B5/vector-expansion-principle) gives a measure with values in p-adic forms.

*Uses.* EHLS Corollary 9.1.8: pairing Eis\_{a,b} with Hida families gives the p-adic L-function.

*API.*

- `EHLS.eisensteinMeasure` (constructor): Eis\_{a,b} on X\_p × T\_H(ℤ\_p) with values in p-adic forms on G₄.
- `EHLS.eisensteinMeasure_moment` (simp): Moments θ^{(κ,a,b)}(G\_{k,ν,χ,ψ}) at classical points.
- `EHLS.eisensteinMeasure_axiomatic` (characterisation): Eis\_{a,b} satisfies Definition 5.3.2 with shift (1, χ).
- `EHLS.eisensteinMeasure_restrict` (functoriality): Restriction along G₃ ↪ G₄ to the product of ordinary loci.

*Unit tests.*

- `ehlsEis_torus` (compatibility): n = 1 restricted to CM points: Katz’s Eisenstein measure.
- `ehlsEis_classical_point` (characterisation): At a classical point the moment is a classical holomorphic form after θ.
- `ehlsEis_zero_character` (degenerate): The measure is determined by its moments at Y^H\_class (density of classical points).
- `ehlsEis_not_cuspidal` (non-example): The moments are Eisenstein series, not cusp forms; cuspidality enters only after pairing with π.

*Acceptance.* n = 1: Katz’s Eisenstein measure restricted to CM points (L3/katz-eisenstein-measure).

*Rests on.* `L4/ehls-differential-operators`, `L4/ehls-unitary-datum`, `AutomorphicBundles:B5/vector-expansion-principle`, `L3/katz-eisenstein-measure`.

*Sources.* EHLS-2020, Definition 5.3.2, pp. 83–84; Theorem 8.2.2, p. 125; Corollary 8.2.4, p. 126: EHLS define axiomatic Eisenstein measures and construct the measure Eis\_{a,b} whose moments are θ^{(κ,a,b)} of Siegel Eisenstein series, an axiomatic Eisenstein measure with shift (1, χ).

### The doubling integral identity (EHLS Theorem 4.6.1)

`L4/doubling-global-identity` — theorem.

Let ϕ ∈ π and ϕ♭ ∈ π♭ be factorisable test vectors, chosen as in EHLS (48) with the local components at p and ∞ given by (49)–(50), unramified outside S = S\_π, and f a factorisable Siegel section. Writing χ = ‖·‖^mχ\_u, D(χ)·I(ϕ, ϕ♭, f, s) = ⟨ϕ, ϕ♭⟩·I\_p(χ, κ)·I\_∞(χ, ρ^υ)·I\_S·L^S(s + 1/2, π, χ\_u), where I(ϕ, ϕ♭, f, s) = ∫\_{[U(V)×U(−V)]}E(χ, s, f, (g₁, g₂))ϕ(g₁)ϕ♭(g₂)χ^{-1}(det g₂)dg₁dg₂, I\_p = L\_p(s, ord, π, χ)·∏\_w[V\_w⟨φ\_w, φ̃\_w⟩] and I\_∞ the archimedean zeta integral; the integral vanishes identically unless ϕ♭ lies in the contragredient.

*Hypotheses.* Test vectors as in EHLS (48)–(50); s in the range of convergence, then by continuation.

*Proof or construction.*

1. Unfold the Eisenstein series on U(W) against the doubled cusp form (Piatetski-Shapiro–Rallis, Garrett): the orbit filtration of the doubled principal series (MetaplecticAutomorphicForms:MP.3/doubling-filtration) leaves only the open orbit, and the integral factors into the local doubling zeta integrals of MetaplecticAutomorphicForms:MP.6/local-doubling-integral (EHLS §4.1).
2. Unramified places give L(s + 1/2, π\_v, χ\_v) (Piatetski-Shapiro–Rallis computation).
3. Places above p: local-zeta-at-p; archimedean place: archimedean-zeta-integral.

*Acceptance.* n = 1: the identity reduces to Hecke’s integral representation of L(s, χ) through a CM torus.

*Rests on.* `L4/local-zeta-at-p`, `L4/archimedean-zeta-integral`, `L4/ehls-unitary-datum`, `MetaplecticAutomorphicForms:MP.3/doubling-filtration`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `SmoothRepresentationsOfLocalGroups:SR.4`.

*Sources.* EHLS-2020, §4.1 pp. 41–43; Theorem 4.6.1, p. 78; Introduction pp. 5–6: EHLS state the doubling method’s unfolding and prove the global identity expressing the doubling integral of their test vectors as ⟨ϕ, ϕ♭⟩ times local factors at p, ∞, S and the partial standard L-function.

### Local doubling zeta integrals at p (EHLS Theorem 4.3.10)

`L4/local-zeta-at-p` — theorem.

At a place w | p (split, K\_w = K\_{v}^+ × K\_{v}^+, U(V)(K⁺\_v) ≅ GL\_n(K⁺\_v)), for the ordinary vectors φ\_w and the Siegel section designed in EHLS §4.3, the local integral factors as I₁·I₂ with I₁ = L(s + 1/2, π\_{b,w} ⊗ χ\_{2,w})/(ε(s + 1/2, π\_{b,w} ⊗ χ\_{2,w})L(−s + 1/2, π̃\_{b,w} ⊗ χ\_{2,w}^{-1}))·Vol(X(4))·⟨φ\_{b,w}, φ̃\_{b,w}⟩ and I₂ = ε(−s + 1/2, π\_{a,w} ⊗ χ\_{1,w})L(1/2 + s, π̃\_{a,w} ⊗ χ\_{1,w}^{-1})/L(−s + 1/2, π\_{a,w} ⊗ χ\_{1,w})·Vol(X(1))·⟨φ\_{a,w}, φ̃\_{a,w}⟩, where π\_{a,w}, π\_{b,w} are the GL\_{a\_w} and GL\_{b\_w} constituents determined by the ordinary condition and the signatures; together I\_w = L(s + 1/2, ord, π\_w, χ\_w)·V\_w·⟨φ\_w, φ̃\_w⟩, a modified Euler factor of the shape predicted by Coates and Perrin-Riou.

*Hypotheses.* w | p split; π\_w ordinary of the type given by the signatures at the places above p.

*Proof or construction.*

1. Reduce the doubling integral at a split place to Godement–Jacquet zeta integrals for GL\_a × GL\_b blocks; apply the Godement–Jacquet local functional equation (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation) to the ordinary vector data (EHLS §4.3, ‘The main local theorem’).

*Acceptance.* n = 1: the local factor is (1 − χ(𝔓)…)(1 − χ̌(𝔓)…), Katz’s Euler factors at Σ\_p.

*Rests on.* `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `L4/ehls-unitary-datum`.

*Sources.* EHLS-2020, §4.3, Theorem 4.3.10, pp. 49–64: EHLS compute the local zeta integral at places above p for their ordinary data as a quotient of Euler factors times an ε-factor, volumes and local pairings, using the Godement–Jacquet functional equation. EHLS-2020, Introduction, pp. 6–7: The local factor at p has the expected Coates–Perrin-Riou shape; its denominator arises from the Godement–Jacquet functional equation.

### The archimedean zeta integral is a nonzero algebraic number (EHLS Propositions 4.5.5–4.5.6)

`L4/archimedean-zeta-integral` — theorem.

For each archimedean place σ, with ϕ\_σ = ϕ\_{κ\_σ,−}, ϕ♭\_σ = ϕ\_{κ♭\_σ,−} and the Siegel section f\_σ of EHLS (107), the local zeta integral I\_σ(χ\_σ, κ\_σ) = I\_σ(ϕ\_σ, ϕ♭\_σ, f\_σ, m) is a nonzero algebraic number. It is not evaluated explicitly in general (only for scalar or half-scalar weight, by Shimura and Garrett); it depends only on the weights.

*Hypotheses.* Critical pairs (κ, χ); the section f\_σ obtained by applying D(κ, χ) to the holomorphic section.

*Proof or construction.*

1. Garrett’s method: compute the integral against the anti-holomorphic vectors via the explicit section; nonvanishing by Proposition 4.5.5, algebraicity by Proposition 4.5.6.
2. AutomorphicFormsOnReductiveGroups:AF.4/holomorphic-ds-sp2n-unn supplies the scalar-weight holomorphic discrete series of U(n,n) on the doubled side only; the vector weights of π and the zeta integral itself are EHLS §4.5’s computation.

*Acceptance.* Scalar weight: Shimura’s explicit formula.

*Rests on.* `L4/ehls-differential-operators`, `AutomorphicFormsOnReductiveGroups:AF.4/holomorphic-ds-sp2n-unn`.

*Sources.* EHLS-2020, Propositions 4.5.5–4.5.6, pp. 76–77; Introduction p. 6: EHLS prove that the archimedean local zeta integral of their data is a nonzero algebraic number, leaving it unspecified in general.

### The EHLS p-adic L-function (Main Theorem 9.2.2)

`L4/ehls-main-theorem` — theorem.

Let π be a cuspidal anti-holomorphic automorphic representation of G₁ ordinary of type (κ, K), T = T\_π its component of the ordinary Hecke algebra, and ϕ, ϕ♭ elements of R-bases of Î\_π, Î\_{π♭}. Assume Hypothesis 7.3.2 (Gorenstein), Hypothesis 7.3.3 (global multiplicity one) and Proposition–Hypothesis 7.3.5 (minimality). Then there is a unique L(Eis, ϕ ⊗ ϕ♭) ∈ Λ\_{X\_p,R} ⊗̂ T such that for every classical χ = ‖·‖^mχ\_u : X\_p → R^× and every π′ ∈ S(K\_{r₁}, κ₁, π), its image under the character χ ⊗ λ\_{π′} is c(π′, χ)·Ω\_{π′,χ}(ϕ, ϕ♭)·I\_∞(χ, κ₁)·I\_S·L\_p(m, ord, π′, χ\_u)·L^S(m + 1/2, π′, χ\_u)/P\_{π′,χ}, where Ω\_{π′,χ}(ϕ, ϕ♭) = ⟨ϕ, ϕ♭χ⟩\_χ/(Vol(I⁰\_{r₁,V} ∩ I⁰\_{r₁,−V})·Q[π′, χ]) is independent of r₁, p-integral and a p-unit for suitable ϕ, ϕ♭, P\_{π′,χ} = Q^{-1}\_{π′,χ} and c(π′, χ) generates the congruence ideal. The element lies in the completed tensor product of the character Iwasawa algebra with the Hecke algebra; it is not asserted to exist without the three hypotheses (without Gorenstein one obtains meromorphic functions on the components, Remark 9.3.1).

*Hypotheses.* All three hypotheses; π ordinary of type (κ, K); p as in ehls-unitary-datum.

*Proof or construction.*

1. Pair the Eisenstein measure with the Hida family through the Gorenstein duality (EHLS §7.4, Proposition 7.4.15): the linear form defined by ϕ ⊗ ϕ♭ on ordinary forms on G₃ is T-valued under Gorenstein and minimality.
2. Corollary 9.1.8: the pairing at classical points is the doubling integral, evaluated by doubling-global-identity with local-zeta-at-p and archimedean-zeta-integral.
3. Corollary 9.2.1 and the rewriting Q[π′, χ] = c(π′, χ)Q\_{π′,χ} (Lemma 6.7.7); the volume factors cancel (Remark 4.6.2); p-integrality and unit property of Ω (Lemma 8.5.3).

*Acceptance.* n = 1: Katz’s p-adic L-function for the CM field K (with T a group ring). U(1,1) over an imaginary quadratic field: Hida’s ordinary p-adic L-function of a GL₂ form twisted by Hecke characters of K.

*Rests on.* `L4/ehls-eisenstein-measure`, `L4/doubling-global-identity`, `L4/ehls-hypotheses`, `L4/ehls-ordinary-forms-hecke`, `PadicMeasuresIwasawaAlgebras:L1`.

*Sources.* EHLS-2020, Corollaries 9.1.8 and 9.2.1, Main Theorem 9.2.2 and proof, pp. 144–145; Remark 9.3.1, p. 145: EHLS state and prove the existence and uniqueness of L(Eis, ϕ ⊗ ϕ♭) in Λ\_{X\_p,R} ⊗̂ T with the interpolation formula, under the Gorenstein, multiplicity-one and minimality hypotheses.

### Disegni–Liu’s Siegel hermitian varieties Σ\_m(K) and their line bundles

`L4/dl-siegel-hermitian-varieties` — definition.

Let E/F be a CM extension, p a prime and m ≥ 1. The Siegel hermitian variety Σ\_m(K) of genus m and level K over ℚ\_p (more precisely over the p-adic field of definition) is the quotient Σ^δ\_m(K, K\_T)^♭ of the moduli space Σ^δ\_m(K, K\_T) of quadruples (A₀, i₀, λ₀, η₀) and their hermitian enhancements, and ω\_m is the descent of the line bundle ω^δ\_m := det\_O det\_{O⊗E}Lie(A)^∨ of automorphy; ω\_m does not depend on the auxiliary choices K\_T, δ and the orbit Σ^δ\_0(K\_T). Disegni–Liu relate Σ\_m(K) to PEL-type Shimura varieties for the similitude group G̃\_m of W̃\_m = E^{2m} with the pairing Tr\_{E/ℚ}∘⟨·,·⟩ in order to import algebraic q-expansions.

*Hypotheses.* E/F CM, p any prime; level K neat.

*Proof or construction.*

1. Construct the moduli problem and its quotient (DL §2.2); the line bundle by descent of ω^δ\_m; independence of choices.
2. Relation with PEL data (DL §2.3) through PELModuli:M5/unitary-pel-datum; q-expansions through AutomorphicBundles:B5/vector-expansion-principle.

*Uses.* DL-2024 Proposition 3.13: rationality of the diagonal pullback of Siegel Eisenstein series as sections of ω; DL-2024 Theorem 1.4: interpolation along all embeddings ℚ\_p ≃ ℂ.

*API.*

- `SiegelHermitian` (constructor): Σ\_m(K) over the p-adic field, with ω\_m.
- `SiegelHermitian.lineBundle_independent` (characterisation): ω\_m is independent of K\_T, δ and the orbit.
- `SiegelHermitian.toPEL` (compatibility): Comparison with the PEL Shimura variety of G̃\_m.
- `SiegelHermitian.qExpansion` (data): Algebraic q-expansions of sections of ω\_m^{⊗k} via the PEL comparison.

*Unit tests.*

- `siegelHerm_genus_one` (degenerate): m = 1: a curve-type variety with ω\_1 the Hodge bundle.
- `siegelHerm_independence` (characterisation): Changing δ gives a canonically isomorphic ω\_m.
- `siegelHerm_pel_compat` (compatibility): Under toPEL, ω\_m corresponds to the determinant of the Hodge bundle of AutomorphicBundles:B2.
- `siegelHerm_not_pel_itself` (non-example): Σ\_m(K) is not itself a PEL moduli space of Kottwitz type; q-expansions require the comparison.

*Acceptance.* m = 1: a unitary Shimura curve-type variety attached to E/F with its Hodge line bundle.

*Rests on.* `PELModuli:M5/unitary-pel-datum`, `AutomorphicBundles:B5/vector-expansion-principle`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`.

*Sources.* DL-2024, §2.2, Definition 2.2, pp. 11–15; §2.3, pp. 15–17: Disegni–Liu define the Siegel hermitian varieties and the line bundle of automorphy, and relate them to PEL type Shimura varieties to use algebraic q-expansions.

### Degenerate principal series, big-cell sections and U\_p-translation (Disegni–Liu Lemmas 3.10–3.11)

`L4/dl-big-cell-sections` — construction.

On the doubling space of an even-dimensional hermitian space (n = 2r), for a character χ\_p at p, the degenerate principal series I^□\_{r,p}(χ\_p) carries the sections f^{[e]}\_{χ\_p} indexed by e ∈ Z\_P (supported on the big cell, built from regularised Whittaker functionals); each is invariant under the subgroup P̃e\_{r,r}(ℤ\_p) (Lemma 3.10), and the U\_p-operators act on them by translation: (U^{e₁}\_p × U^{e₂}\_p)(f^{[e]}\_{χ\_p}) = f^{[e + e₁^c + e₂]}\_{χ\_p} for e₁, e₂ ∈ N\_P (Lemma 3.11).

*Hypotheses.* n = 2r even; P the set of places above p; notation of DL §3.1.

*Proof or construction.*

1. Construct the sections on the big cell from the regularised Whittaker functionals of DL §3.1; invariance and the translation formula are direct computations (DL proofs of Lemmas 3.10–3.11).

*Uses.* DL-2024 Proposition 3.13: the analytic family of Eisenstein series built from these sections; DL-2024 Proposition 3.32: local doubling integral at p.

*API.*

- `DL.bigCellSection` (constructor): f^{[e]}\_{χ\_p} ∈ I^□\_{r,p}(χ\_p).
- `DL.bigCellSection_invariant` (characterisation): Invariance under P̃e\_{r,r}(ℤ\_p).
- `DL.bigCellSection_up` (relation): (U^{e₁} × U^{e₂})f^{[e]} = f^{[e+e₁^c+e₂]}.
- `DL.degeneratePrincipalSeries` (data): I^□\_r(χ) with its local components.

*Unit tests.*

- `bigcell_zero_translate` (degenerate): e₁ = e₂ = 0: the identity.
- `bigcell_additivity` (characterisation): Translating by (e₁, e₂) then (e₁′, e₂′) equals translating by the sums.
- `bigcell_r1` (computation): r = 1, one place above p: U\_p shifts the index e by one.
- `bigcell_not_spherical` (non-example): f^{[e]} is not the spherical section: it is supported on the big cell.

*Acceptance.* r = 1: sections of the degenerate principal series of U(1,1) supported on the big cell.

*Rests on.* `L4/ehls-unitary-datum`, `SmoothRepresentationsOfLocalGroups:SR.4`.

*Sources.* DL-2024, §3.1, Lemmas 3.10–3.11, pp. 18–23: Disegni–Liu construct the big-cell sections f^{[e]} of the degenerate principal series and show their invariance and that the U\_p-operators act on them by translation.

### The analytic Eisenstein family and rationality of its diagonal pullback (Disegni–Liu Proposition 3.13)

`L4/dl-eisenstein-family` — theorem.

For ‖e‖ > 0 and a section f ∈ I^□\_r(χ), the diagonal pullback h̃\_{r,r}D̃^{[e]}\_♢(−, χ, f) of the Siegel hermitian Eisenstein series built from the big-cell sections is σ-equivariant: for every σ ∈ Aut(ℂ/ℚ), h̃\_{r,r}D̃^{[e]}\_♢(−, σχ, σf) = σ(h̃\_{r,r}D̃^{[e]}\_♢(−, χ, f)). Hence the family is rational over the field of definition and gives an analytic family Ẽ^{[e]}\_♢ of p-adic forms.

*Hypotheses.* ‖e‖ > 0; sections in I^□\_r(χ)^{∞p}.

*Proof or construction.*

1. Compute Fourier coefficients of the Siegel hermitian Eisenstein series for big-cell sections; rationality of q-expansions plus the q-expansion principle on the Siegel hermitian variety (dl-siegel-hermitian-varieties).

*Acceptance.* r = 1: rationality of the pullback of a U(2,2) Eisenstein series to U(1,1) × U(1,1).

*Rests on.* `L4/dl-big-cell-sections`, `L4/dl-siegel-hermitian-varieties`.

*Sources.* DL-2024, §3.2, Proposition 3.13 and proof, p. 25: Disegni–Liu prove the Aut(ℂ)-equivariance of the diagonal pullback of the Siegel hermitian Eisenstein series built from big-cell sections, giving its rationality.

### Panchishkin unramified representations and their eigenlines (Disegni–Liu §3.3)

`L4/panchishkin-unramified` — definition.

Let π be a relevant representation (DL Definition 1.1) and v a place of F above p, u ∈ P\_v the places of E above v. With P\_{π\_u}(T) = T^n + Σ\_sβ\_{u,s}q\_v^{s(s−1)/2}T^{n−s} the Satake polynomial (β\_{u,s} ∈ O\_L) and A(π\_u, m) ⊂ ℤ\_p the multiset of valuations, π\_v is Panchishkin unramified if π\_u is unramified for u ∈ P\_v and β\_{u,r} ∈ O\_L^× (n = 2r). Equivalently (Lemma 3.22) A(π\_u, r) contains a unique element of O\_L^× for some u. Then: the eigenspace π^+\_v of T^+\_u for the unit eigenvalue α(π\_u) ∈ A(π\_u, r) ∩ O\_L^× is one-dimensional and independent of u, likewise π^-\_v for T^-\_u (Lemma 3.23, Notation 3.24); there is a unique divisor Q\_{π\_u}(T) = T^r + γ\_{u,1}T^{r−1} + … + γ\_{u,r}q\_v^{r(r−1)/2} of P\_{π\_u} with γ\_{u,r} ∈ O\_L^×; π̲\_u denotes the unramified principal series of GL\_r(F\_v) with Satake polynomial Q\_{π\_u}(T); and there is a unique locally constant matrix coefficient ξ\_{π\_v} of π^-\_v with ξ\_{π\_v}(w\_r) = 1, bi-I\_v-invariant, with ξ\_{π\_v}(m(a)w\_r) = ∏\_{u∈P\_v}⟨π̲\_u(a\_{u^c})φ\_u, φ\_u^∨⟩ for spherical vectors (Proposition 3.25).

*Hypotheses.* π relevant (tempered cuspidal, holomorphic discrete series of the given Harish-Chandra parameter at ∞); v | p with π\_v unramified.

*Proof or construction.*

1. Newton polygon of the Satake polynomial: the unit root count (Lemma 3.19).
2. Hecke eigenvalues of T^±\_u on the Iwahori invariants are A(π\_u, r) and A(π\_u^c, r) (Lemma 3.20).
3. Uniqueness of the unit-root eigenline by multiplicity one of the unit root (Lemmas 3.22–3.23), and the factorisation of P\_{π\_u} by the unit roots (Proposition 3.25).

*Uses.* DL-2024 Theorem 3.37: the local condition at p of the p-adic L-function; AutomorphicPadicLFunctions:L5/cpr-panchishkin-proposition: the precise local condition the general proposition uses.

*API.*

- `Panchishkin.satakePolynomial` (constructor): P\_{π\_u}(T) with coefficients β\_{u,s} q\_v^{s(s−1)/2}.
- `Panchishkin.IsUnramified` (constructor): β\_{u,r} ∈ O\_L^× for every u ∈ P\_v.
- `Panchishkin.unitRoot` (data): α(π\_u) ∈ O\_L^×, the unique unit in A(π\_u, r).
- `Panchishkin.eigenline` (data): π^±\_v, one-dimensional and independent of u.
- `Panchishkin.unitFactor` (data): Q\_{π\_u}(T) dividing P\_{π\_u}(T) with γ\_{u,r} ∈ O\_L^×.
- `Panchishkin.matrixCoefficient` (data): ξ\_{π\_v} with ξ(w\_r) = 1, bi-I\_v-invariant.
- `Panchishkin.unitPrincipalSeries` (data): π̲\_u, the unramified principal series of GL\_r(F\_v) with Satake polynomial Q\_{π\_u}(T), and the factorisation of ξ\_{π\_v} on m(a)w\_r through it.
- `Panchishkin.dual` (relation): π\_v Panchishkin unramified iff π̂\_v is (Lemma 3.22).

*Unit tests.*

- `panchishkin_gl2_ordinary` (compatibility): n = 2: Panchishkin unramified iff the unramified π\_v is p-ordinary (one unit Satake parameter).
- `panchishkin_unit_root_unique` (characterisation): A(π\_u, r) ∩ O\_L^× has at most one element, with multiplicity one.
- `panchishkin_trivial_rank` (degenerate): r = 0 does not occur (n = 2r ≥ 2).
- `panchishkin_supersingular` (non-example): n = 2 with both Satake parameters of slope 1/2: not Panchishkin unramified.

*Acceptance.* n = 2, r = 1: π\_v Panchishkin unramified iff the Satake parameters at v have one unit and one non-unit, i.e. π\_v is ordinary.

*Rests on.* `L4/ehls-unitary-datum`, `SmoothRepresentationsOfLocalGroups:SR.4`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

*Sources.* DL-2024, Definition 1.1 (relevant) and Definition 1.2, p. 3; Lemmas 3.19–3.20, 3.22–3.23, Definition 3.21, Notation 3.24, Proposition 3.25, pp. 27–29: Disegni–Liu define Panchishkin unramified representations through the Satake polynomial and its unit roots and construct the eigenlines π^±\_v, the divisor Q\_{π\_u} and the matrix coefficient ξ\_{π\_v}.

### The p-adic local doubling integral (Disegni–Liu Proposition 3.32)

`L4/dl-local-doubling-at-p` — theorem.

If v | p and π\_v is Panchishkin unramified, then for every embedding ι : L → ℂ, ∫\_{G\_r(F\_v)}ιξ\_{π\_v}(g)·(f^{[0]}\_{χ\_v})^{χ\_v}(w\_r(g, 1\_{2r}))dg = q\_v^{d\_v r²}·∏\_{u∈P\_v}γ((1+r)/2, ιπ̲\_u ⊗ χ\_v, ψ\_{F,v})^{-1}, with π̲\_u the unramified principal series of GL\_r(F\_v) with Satake polynomial Q\_{π\_u} (Proposition 3.25(3)): a local doubling zeta integral that produces the product of inverse γ-factors of the unit-root part. At places outside V\_F^{(p)} with unramified data the integral is L(1/2, BC(ιπ\_v) ⊗ (χ\_v∘Nm))/b\_{2r,v}(χ) (Lemma 3.31, Piatetski-Shapiro–Rallis).

*Hypotheses.* π\_v Panchishkin unramified; the section f^{[0]} and ξ\_{π\_v} of the preceding nodes.

*Proof or construction.*

1. Unfold the doubling integral on the big cell and reduce to Godement–Jacquet/Tate integrals for the Levi, using ξ\_{π\_v} and the unit-root factorisation (DL §3.4).

*Acceptance.* r = 1, π\_v ordinary: π̲\_u is the unramified character with Satake parameter the unit root, and the integral is q\_v^{d\_v}γ(1, ιπ̲\_u ⊗ χ\_v)^{-1}.

*Rests on.* `L4/panchishkin-unramified`, `L4/dl-big-cell-sections`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`.

*Sources.* DL-2024, §3.4, Lemma 3.31 and Proposition 3.32, p. 32: Disegni–Liu compute the p-adic local doubling zeta integral against ξ\_{π\_v} as q\_v^{d\_v r²} times the product over u of γ((1+r)/2, ιπ̲\_u ⊗ χ\_v)^{-1}, and the unramified integral by Piatetski-Shapiro–Rallis.

### Disegni–Liu’s cyclotomic p-adic L-function (Theorem 3.37, Theorem 1.4)

`L4/dl-padic-l-function` — theorem.

Let π be a relevant L-representation of G\_r(A^∞\_F) (n = 2r) with π\_v Panchishkin unramified for every v | p, and ♢ ⊇ {∞, p} a finite set of places outside which π is unramified. The distribution L^♢\_p(π) on Γ\_{F,p} (the Galois group of the maximal abelian extension of F unramified outside p∞), defined by Ω ↦ (∏\_{u∈P}α(π\_u))^{-1}⟨φ₁ ⊗ φ₂, D\_♢(−, Ω)⟩\_{π,π̂}, is a p-adic measure, depending on ♢ only, and for every finite character χ : Γ\_{F,p} → ℚ̄\_p^× and every embedding ι : ℚ̄\_p → ℂ, ιL^♢\_p(π)(χ) = (P^ι\_π)^{-1}·Z\_r^{[F:ℚ]}/b^♢\_{2r}(1)·∏\_{v∈V\_F^{(p)}}∏\_{u∈P\_v}γ((1+r)/2, ι(π̲\_u ⊗ χ\_v), ψ\_{F,v})^{-1}·L(1/2, BC(ιπ^♢) ⊗ (ιχ^♢∘Nm\_{E/F})), with P^ι\_π the period of Lemma 3.17, b^♢\_{2r} the normalising product of abelian L-values, and Z\_r = (−1)^r2^{−2r²}·2^{r²−r}π^{r²}·Γ(1)⋯Γ(r)/(Γ(r+1)⋯Γ(2r)). Equivalently L^♢\_p(π) is a bounded analytic function on the character space X\_{F,p} ⊗ L, defined over the p-adic field of definition of π and interpolating along all embeddings ι.

*Hypotheses.* π relevant, Panchishkin unramified at every v | p; finite-order χ only (cyclotomic variable).

*Proof or construction.*

1. Pair the analytic Eisenstein family (dl-eisenstein-family) with φ₁ ⊗ φ₂ through the doubling integral; boundedness from U\_p-translation (dl-big-cell-sections) and the unit eigenvalues α(π\_u).
2. Interpolation: global doubling identity with the p-adic local integral of dl-local-doubling-at-p, the unramified computation of Piatetski-Shapiro–Rallis and the archimedean constant Z\_r (DL §3.5).
3. Rationality along all ι: Aut(ℂ)-equivariance of the family.

*Acceptance.* F = ℚ, r = 1, E imaginary quadratic: a p-adic L-function for U(1,1) interpolating L(1/2, BC(π) ⊗ χ∘Nm) at finite-order cyclotomic characters.

*Rests on.* `L4/dl-eisenstein-family`, `L4/dl-local-doubling-at-p`, `L4/panchishkin-unramified`, `L0/ray-class-distributions`.

*Sources.* DL-2024, Definition 3.36 and Theorem 3.37, p. 35; Theorem 1.4 and Remark 1.5, pp. 4–5: Disegni–Liu define the distribution L^♢\_p(π) and prove it is a measure interpolating central values of the base change twisted by finite characters along every embedding, with inverse γ-factors at p and an explicit archimedean constant.

### Parity of the order of vanishing (Disegni–Liu Proposition 3.39)

`L4/dl-vanishing-order-parity` — theorem.

The vanishing order of L^♢\_p(π) at the trivial character 1 has the same parity as r[F:ℚ] + (1 − ϵ(π))/2, where ϵ(π) = ∏\_{v finite}ϵ(π\_v) and ϵ(π\_v) := ϵ(BC(π\_v) ⊗ ιχ\_v∘Nm\_{E\_v/F\_v}) is independent of the finite character χ. The vanishing order at 1 does not depend on ♢, and L^♢\_p(π) = L^♢\_p(π̂).

*Hypotheses.* As in dl-padic-l-function.

*Proof or construction.*

1. Compare L^♢\_p(π) with the analytic functions L\_p(π\_v) interpolating the local factors at v ∈ ♢ \\ {∞, p}, which have neither zeros nor poles at the relevant characters; reduce to the functional equation of the interpolated central values, whose sign is ϵ(π)·(−1)^{r[F:ℚ]} (DL proof of Proposition 3.39).

*Acceptance.* If ϵ(π) = −1 and r[F:ℚ] is even, L^♢\_p(π) vanishes at 1.

*Rests on.* `L4/dl-padic-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`.

*Sources.* DL-2024, Proposition 3.39 and its proof, p. 38; Remark 1.5(3), p. 5: Disegni–Liu prove the parity of the vanishing order at the trivial character in terms of r[F:ℚ] and the global root number.

### Dependencies of L4

Within this roadmap: `L0`, `L3`.

Other roadmaps and Tau Ceti layers: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B5/vector-expansion-principle`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `AutomorphicFormsOnReductiveGroups:AF.4/holomorphic-ds-sp2n-unn`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`, `IgusaVarietiesAndTorsionConcentration:IG.1/mantovan-igusa-variety`, `MetaplecticAutomorphicForms:MP.3/doubling-filtration`, `MetaplecticAutomorphicForms:MP.6/local-doubling-integral`, `PELModuli:M5/unitary-pel-datum`, `PadicMeasuresIwasawaAlgebras:L1`, `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/ordinary-koecher`, `ShimuraVarieties:V5/main-cm`, `SmoothRepresentationsOfLocalGroups:SR.4`.

### Refinements left in L4

- The characteristic-zero ordinary Igusa tower over the unitary ordinary locus is constructed inside ehls-ordinary-forms-hecke; a separate node can be split off if PELModuli or HodgeTateAndCanonicalSubgroups come to plan it.
- No comparison between the EHLS and Disegni–Liu constructions is planned: neither source proves one.

## L4e — Eischen–Wan finite-slope Klingen families

Eischen–Wan’s finite-slope construction on definite unitary groups over an imaginary quadratic field: the setting with its regularity and temperedness hypotheses, the Siegel Eisenstein measures, the pullback formula and local computations, the vector-valued Klingen family, the p-adic L-function, and for r = 2 the divisibility of the constant terms.

Planets of this layer: Eischen–Wan Klingen family (`L4e/klingen-family`); Constant-term divisibility (`L4e/constant-term-divisibility`).

### The Eischen–Wan setting: definite unitary groups, unramified principal series and stabilised vectors

`L4e/ew-setting` — definition.

Let p be an odd prime, K an imaginary quadratic field in which p splits as v₀v̄₀, and GU(r, 0) the definite unitary similitude group of a diagonal matrix ζ with i^{-1}ζ positive definite and entries in O\_K prime to p, so that GU(r,0)(ℚ\_p) ≅ GL\_r(ℚ\_p) × ℚ\_p^×. Let π be an irreducible cuspidal automorphic representation of GU(r, 0) of weight k = (a₁ ≥ … ≥ a\_r ≥ 0), tempered, with π\_p ≅ π(χ₁, …, χ\_r) an unramified principal series with the χ\_i pairwise distinct, and ϕ ∈ π^{K₀(p)} an eigenvector for all the Hecke operators U\_{t\_i} at p (a p-stabilised vector with eigenvalues χ₁⋯χ\_i(p^{-1})p^{κ₁+…+κ\_i}, finite slope allowed). Let ξ₀ be an auxiliary Hecke character of K with ξ₀|·|^{-(r−1)/2} of finite order, and Σ a finite set of primes containing those above p and those where ξ₀, π or K/ℚ ramify. The auxiliary character, finite-slope refinement, coefficient module L(k) and integral local sections are part of the datum. Temperedness is used only for the explicit pullback calculation (EW p. 34) but is carried as a hypothesis until a separate argument removes it.

*Hypotheses.* p odd, split in K; π\_p unramified principal series with pairwise distinct χ\_i (regular p-stabilisation); π tempered; the datum is not asserted to extend to a CM field without separate checks.

*Proof or construction.*

1. The definite unitary group and its automorphic forms: AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms (forms on groups compact at infinity).
2. Stabilised vectors: Eischen–Wan Propositions 4.7–4.8 (eigenvectors for U\_{t\_i} in the principal series; uniqueness of the stabilisation needs the χ\_i pairwise distinct, regular in the sense of Casselman).

*Uses.* EW Theorem 1.2: the hypotheses of the main theorem; AutomorphicCongruences:L2: the Fouquet–Wan input instantiates this datum; RankZeroOneBSD:BSD.6a: the finite-slope congruence argument.

*API.*

- `EWDatum` (constructor): (K, p, ζ, π, ϕ, ξ₀, Σ) with the stated hypotheses.
- `EWDatum.RegularStabilisation` (constructor): The χ\_i are pairwise distinct.
- `EWDatum.stabilisedEigenvalues` (data): The U\_{t\_i}-eigenvalues χ₁⋯χ\_i(p^{-1})p^{κ₁+…+κ\_i} of ϕ.
- `EWDatum.Tempered` (constructor): π is tempered (kept as a hypothesis).
- `EWDatum.slope` (data): The slopes of the U\_{t\_i}-eigenvalues; finite, possibly critical (EW Remark 4.9).

*Unit tests.*

- `ew_torus` (degenerate): r = 1: π is a Hecke character and the stabilisation is unique.
- `ew_regular_needed` (non-example): r = 2 with χ₁ = χ₂: the stabilised eigenvector is not unique, and EW’s family is not defined.
- `ew_split_condition` (computation): K = ℚ(√−7): p = 11 = (2 + √−7)(2 − √−7) splits, so it is allowed; p = 3 is inert (−7 ≡ 2 is not a square mod 3) and is excluded.
- `ew_definite` (characterisation): GU(r, 0)(ℝ) is compact modulo centre, so automorphic forms are algebraic modular forms.

*Acceptance.* r = 1: GU(1, 0) is a torus and π a Hecke character of K. r = 2: definite unitary forms of rank two, the case of the constant-term divisibility.

*Rests on.* `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms`, `L4/ehls-unitary-datum`, `SmoothRepresentationsOfLocalGroups:SR.4`.

*Sources.* EW-2018, §1.3, p. 3 (setting); Theorem 1.2, p. 4 (hypotheses); §2.2 p. 5; Propositions 4.7–4.8, p. 25; unlabelled remark on temperedness, p. 34; Remark 1.1 and footnote 1, p. 3: Eischen–Wan fix p odd split in K, the definite group GU(r, 0), the tempered cuspidal π with unramified principal series π(χ₁, …, χ\_r) at p with pairwise distinct χ\_i, the eigenvector ϕ for the U\_{t\_i}, the auxiliary ξ₀ and Σ; they remark that temperedness is only a convenience in the pullback computation and that extension to CM fields is easy.

### The Eischen–Wan Siegel Eisenstein measures (Proposition 5.5)

`L4e/ew-siegel-eisenstein-measure` — construction.

There are p-adic measures E\_{D,Sieg} and E′\_{D,Sieg} on Γ\_K ≅ ℤ\_p × ℤ\_p (the Galois group of the ℤ\_p²-extension of K) with values in the spaces of p-adic automorphic forms on U(r+1, r+1) and U(r, r) respectively, such that ∫φ̂ dE\_{D,Sieg} = Ê\_{D,φ}(f\_{Sieg,φ}, z\_{κ\_φ}, −) for φ in the set X of arithmetic points used for the Siegel family (EW Remark 5.1), with the Siegel sections f\_{Sieg,φ} chosen in §4 (unramified, ℓ-adic, p-adic and archimedean) and the differential operators of EW §2.11.

*Hypotheses.* The arithmetic points X of EW §5.1; the local sections of §4.

*Proof or construction.*

1. Siegel Eisenstein series on GU\_n (EW §3.2) with explicit Fourier coefficients (§§4.2.2, 4.3, 4.4); action of the differential operators on q-expansion coefficients (§5.2, Proposition 5.3–5.4); Kummer congruences and the q-expansion principle give the measure (§5.3).

*Uses.* EW Definition 5.6: pulling back along the embedding gives the Klingen family.

*API.*

- `EW.siegelMeasure` (constructor): E\_{D,Sieg} and E′\_{D,Sieg} on Γ\_K.
- `EW.siegelMeasure_moment` (simp): ∫φ̂ dE\_{D,Sieg} = Ê\_{D,φ}(f\_{Sieg,φ}, z\_{κ\_φ}, −).
- `EW.siegelSection` (data): The local Siegel sections f\_{Sieg,φ,v} at each place.
- `EW.siegelMeasure_qExpansion` (characterisation): Fourier coefficients given by the local computations of EW §4.

*Unit tests.*

- `ewSieg_zero_rank` (degenerate): r = 0: reduces to an Eisenstein measure on U(1,1).
- `ewSieg_classical_points` (characterisation): At points of X the moments are classical Siegel Eisenstein series after the differential operator.
- `ewSieg_two_variables` (computation): Γ\_K ≅ ℤ\_p²: the measure is a two-variable object.
- `ewSieg_not_klingen` (non-example): The Siegel measure itself is not the Klingen family; the Klingen family requires pullback against ϕ (Definition 5.6).

*Acceptance.* r = 0: the Eisenstein measure on U(1,1), Katz’s CM case.

*Rests on.* `L4e/ew-setting`, `L4/ehls-differential-operators`, `AutomorphicBundles:B5/vector-expansion-principle`, `L4/ehls-eisenstein-measure`.

*Sources.* EW-2018, §3.2 pp. 19–21; §5.1–5.3, Remark 5.1, Propositions 5.3–5.5, pp. 30–33: Eischen–Wan construct Siegel Eisenstein measures on Γ\_K valued in p-adic forms on U(r+1, r+1) and U(r, r) interpolating the Siegel Eisenstein series with their chosen sections.

### Pullback formula and local computations (Eischen–Wan Proposition 3.4, §4)

`L4e/ew-pullback-and-local-computations` — theorem.

For a unitary idele class character τ of A\_K^× and f′ ∈ I\_r(τ), the pullback integral F\_{ϕ′}(f′; s, g) = ∫E(f′; s, S′^{-1}(g, g₁h)S′)τ̄(det g₁h)ϕ(g₁h)dg₁ converges absolutely and uniformly on compacta in Re(s) > r and is a Klingen section (Proposition 3.4). The local factors are computed: at unramified places the pullback section is L(π̃, τ̄^c, s + 1)/(…)·F\_{ρ,s} (Lemma 4.2); at ℓ ∤ p (Lemmas 4.4–4.6); at p for the stabilised vector of a regular unramified principal series (Propositions 4.11–4.12, Lemmas 4.13–4.14); at ∞ (Lemma 4.15, Definitions 4.16, 4.19, Lemma 4.17, Proposition 4.18).

*Hypotheses.* EW setting; τ unitary; s in the convergence range; the p-adic computation uses pairwise distinct χ\_i.

*Proof or construction.*

1. Unfold the Siegel Eisenstein series of U(r+1, r+1) along the embedding of U(r, 0) × U(1, 1)-type subgroups (Shimura’s pullback formula), then compute local integrals place by place (EW §§3.3, 4.1–4.4).

*Acceptance.* r = 1: the classical pullback of a U(2,2) Siegel Eisenstein series to U(1,1) × U(1,0).

*Rests on.* `L4e/ew-setting`, `L4/doubling-global-identity`, `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`.

*Sources.* EW-2018, §3.3 and Proposition 3.4, p. 21; §4: Lemmas 4.1–4.2 p. 23, Lemmas 4.4–4.6 p. 24, Propositions 4.7, 4.8, 4.11, 4.12 with Remark 4.9 and Definition 4.10, pp. 25–27, Lemmas 4.13–4.15 pp. 27–28, Definitions 4.16, 4.19, Lemma 4.17, Proposition 4.18 p. 29: Eischen–Wan prove the pullback formula and compute the pullback sections at unramified, ℓ-adic, p-adic and archimedean places.

### The vector-valued Klingen Eisenstein family (Eischen–Wan Definition 5.6, Theorem 1.2(ii))

`L4e/klingen-family` — construction.

Pulling the Siegel measure E\_{D,Sieg} back along U(r, 0) × U(1, 1)-type embedding, twisting by τ^{-1}(det g₁)ψ^{-1}(det g₁) and pairing with ϕ gives the Klingen measure E\_{D,Kling}; composing with the Fourier–Jacobi map defines the family E\_{ϕ,ξ₀} of formal q-expansions. For a Zariski-dense set of arithmetic points φ, φ(E\_{ϕ,ξ₀}) is the Fourier–Jacobi expansion of the projection to the highest weight vector of the holomorphic Klingen Eisenstein series E(f\_{Kling,φ}, z\_{κ\_φ}, −) on GU(r+1, 1), an eigenvector for U\_{t⁺} with nonzero eigenvalue.

*Hypotheses.* EW setting; the arithmetic points X^{pb} of EW §5.1.

*Proof or construction.*

1. Define Ẽ\_D = τ^{-1}(det g₁)ψ^{-1}(det g₁)(E\_{D,Sieg} ∘ i), pair with ϕ to get E\_{D,Kling} (EW §5.4.1).
2. Identify specialisations with Klingen Eisenstein series by the pullback formula and the local computations (ew-pullback-and-local-computations, Lemma 3.2).

*Uses.* EW Theorem 5.8, Corollary 5.9: constant terms of the family; AutomorphicCongruences:L2: the Klingen family is the Eisenstein side of the congruence argument.

*API.*

- `EW.klingenMeasure` (constructor): E\_{D,Kling}.
- `EW.klingenFamily` (constructor): E\_{ϕ,ξ₀}, a family of formal Fourier–Jacobi expansions over Λ\_{K,O\_L}.
- `EW.klingenFamily_specialise` (characterisation): At arithmetic points the specialisation is the highest-weight projection of a holomorphic Klingen Eisenstein series.
- `EW.klingenFamily_eigen` (relation): Specialisations are U\_{t⁺}-eigenvectors with nonzero eigenvalue.
- `EW.klingenFamily_constantTerm` (projection): The constant terms a\_{t[g]}(0) of the family.

*Unit tests.*

- `klingen_dense_points` (characterisation): The specialisation statement holds on a Zariski-dense set of arithmetic points, not at every point.
- `klingen_r1` (computation): r = 1: the family lives on GU(2, 1).
- `klingen_zero_slope` (degenerate): If ϕ is ordinary (all slopes 0), the family is ordinary and compares with Hida’s ordinary Klingen families.
- `klingen_not_siegel` (non-example): The Siegel Eisenstein family on U(r+1, r+1) is not the Klingen family; the latter depends on ϕ.

*Acceptance.* r = 1: a family of Klingen Eisenstein series on GU(2, 1) (Picard modular), the setting of Wan’s Rankin–Selberg main conjecture work.

*Rests on.* `L4e/ew-siegel-eisenstein-measure`, `L4e/ew-pullback-and-local-computations`, `AutomorphicBundles:B5/global-fj-expansion`.

*Sources.* EW-2018, §5.4, Definition 5.6, p. 34; Theorem 1.2(ii), p. 4; §3.1, Definition 3.1, Lemma 3.2, p. 19: Eischen–Wan define E\_{ϕ,ξ₀} as the Fourier–Jacobi expansion of the Klingen measure and show its specialisations are Klingen Eisenstein series that are U\_{t⁺}-eigenvectors with nonzero eigenvalue.

### The Eischen–Wan p-adic L-function (Theorem 1.2(i))

`L4e/ew-padic-l-function` — theorem.

There are a constant C\_{ϕ,p} and an element L^Σ\_{ϕ,ξ₀} ∈ Λ\_{K,O\_L} such that for a Zariski-dense set of arithmetic points φ ∈ Spec Λ\_{K,O\_L}, φ(L^Σ\_{ϕ,ξ₀}) = C\_{ϕ,p}·c\_{φ,π}·L^Σ(π̃, ξ\_φ, 0), where L^Σ(π̃, ξ\_φ, 0) is the L-function of the contragredient π̃ twisted by the Hecke character ξ\_φ attached to φ with the factors at Σ removed and c\_{φ,π} an explicit parameter depending on φ and π.

*Hypotheses.* EW setting (including pairwise distinct χ\_i and temperedness).

*Proof or construction.*

1. Pair the Siegel measure with ϕ ⊗ ϕ along the doubling-type embedding and evaluate at arithmetic points by the pullback formula; the archimedean, p-adic and ℓ-adic local factors of §4 give c\_{φ,π} and the Euler factors (EW §5.4).

*Acceptance.* r = 1: a two-variable p-adic L-function of a Hecke character of K twisted by ξ\_φ (Katz–Hida–Tilouine type).

*Rests on.* `L4e/ew-siegel-eisenstein-measure`, `L4e/ew-pullback-and-local-computations`, `PadicMeasuresIwasawaAlgebras:L1`.

*Sources.* EW-2018, Theorem 1.2(i), p. 4; §5.4, pp. 33–36: Eischen–Wan construct L^Σ\_{ϕ,ξ₀} ∈ Λ\_{K,O\_L} interpolating C\_{ϕ,p}c\_{φ,π}L^Σ(π̃, ξ\_φ, 0) on a Zariski-dense set of arithmetic points.

### Constant-term divisibility for r = 2 (Eischen–Wan Theorem 5.8, Corollary 5.9)

`L4e/constant-term-divisibility` — theorem.

Suppose r = 2. For arithmetic points φ ∈ X^{pb}: (i) for all k\_φ, κ\_φ with L(π̃\_φ, τ̄^c\_φ, z\_{κ\_φ} + 1) in the range of absolute convergence, c(k\_φ, 0, κ\_φ) = c′(k\_φ, 0, κ\_φ) (Definitions 4.16, 4.19); (ii) F\_ϕ(f\_{Sieg,φ}, z\_{κ\_φ}, g₀) = F′\_ϕ(f\_{Sieg,φ}, z\_{κ\_φ} + 1/2, g′₀)·φ(L^Σ\_{τ̄′}). Consequently (Corollary 5.9 = Theorem 1.2(iii)) the constant terms a\_{t[g]}(0) of E\_{ϕ,ξ₀} are divisible by L^Σ\_{ϕ,ξ₀}·L^Σ\_{τ̄′}, where L^Σ\_{τ̄′} is the Kubota–Leopoldt p-adic L-function of a Dirichlet character. The conclusion is proved only for r = 2 and is not extrapolated to other r.

*Hypotheses.* r = 2; EW setting.

*Proof or construction.*

1. (i) is archimedean: choose an auxiliary prime ℓ split in K at which π is ordinary (by Sato–Tate), where the scalar-weight case is known (Wan, Lemma 4.1.2); compare (EW proof pp. 36–37).
2. (ii) follows from (i) for p and π.
3. Corollary 5.9 from Theorem 5.8, Lemma 4.17 (cited in the text as ‘Proposition 4.17’, sourceIssues E5), Lemma 3.2 and the local pullback calculations, looking at the Fourier–Jacobi coefficient at β = 0.

*Acceptance.* The constant term along the Klingen parabolic is a product of the EW L-function and a Kubota–Leopoldt L-function, the input to the Eisenstein ideal argument of AutomorphicCongruences:L2.

*Rests on.* `L4e/klingen-family`, `L4e/ew-padic-l-function`, `DirichletPadicLFunctions:L2/primitive-integral-interpolation`, `ModularityAndLanglandsExtensions:ML.3`.

*Sources.* EW-2018, Theorem 5.8 and proof, pp. 36–37; Corollary 5.9, p. 37; Theorem 1.2(iii), p. 4: Eischen–Wan prove for r = 2 the equality of archimedean constants and the factorisation of the Siegel pullback, and deduce that the constant terms of the Klingen family are divisible by L^Σ\_{ϕ,ξ₀}·L^Σ\_{τ̄′}.

### Dependencies of L4e

Within this roadmap: `L4`.

Other roadmaps and Tau Ceti layers: `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B5/vector-expansion-principle`, `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms`, `AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor`, `DirichletPadicLFunctions:L2/primitive-integral-interpolation`, `ModularityAndLanglandsExtensions:ML.3`, `PadicMeasuresIwasawaAlgebras:L1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

### Refinements left in L4e

- A CM-field version of Eischen–Wan (their footnote 1) needs its own hypothesis checks and is not planned.

## L5 — Comparison and generalized statements

Comparisons and the general statement: Euler-factor normalisations, the dictionary between the constructions, the observation that every construction is an instance of L0’s evaluation principle on an explicit ray-class quotient, and the Coates–Perrin-Riou/Panchishkin existence proposition, stated without an existence constructor.

Planets of this layer: Coates–Perrin-Riou/Panchishkin proposition (`L5/cpr-panchishkin-proposition`).

### Comparisons of periods, coefficients and normalisations across the constructions

`L5/normalisation-comparisons` — comparison.

The constructions of L2–L4e are related as follows, with every change of normalisation explicit: (a) BSW for F = ℚ against Pollack–Stevens (L2/specialisations-q-hilbert-bianchi) and for F imaginary quadratic against Williams; (b) Deligne–Ribet for F = ℚ against Kubota–Leopoldt (L3/deligne-ribet-rational-comparison); (c) Hsieh’s square for π induced from a Hecke character of M against the product of two Katz–Hida–Tilouine measures up to a unit of Λ (L3h/theorem-a); (d) EHLS for n = 1 against Katz (L4/ehls-main-theorem); (e) changing a period Ω by a ∈ K(ϕ)^× rescales the corresponding measure by a^{-1}; extending coefficients O → O′ commutes with every construction; (f) primitive against imprimitive normalisations through L0/euler-factor-elements. No comparison between EHLS and Disegni–Liu, or between BSW and Bergdall–Hansen without Leopoldt, is asserted: the sources do not prove one.

*Hypotheses.* Each comparison carries the hypotheses of both constructions it compares.

*Proof or construction.*

1. Each item is the cited comparison node or theorem; (e) is linearity of every construction in the period-normalised class; (f) by euler-factor-elements.

*Acceptance.* Over ℚ the three constructions BSW, Pollack–Stevens and Mazur–Swinnerton-Dyer agree for an ordinary weight-2 form after matching periods.

*Rests on.* `L2/specialisations-q-hilbert-bianchi`, `L3/deligne-ribet-rational-comparison`, `L3h/theorem-a`, `L4/ehls-main-theorem`, `L0/euler-factor-elements`, `L4e/ew-padic-l-function`, `L4/dl-padic-l-function`.

*Sources.* HSIEH-2014, Introduction, p. 712: Hsieh observes that for π induced from a Hecke character, L\_{Σ\_p}(π, λ) is a product of two Katz–Hida–Tilouine p-adic L-functions up to an explicit unit. EHLS-2020, History §1.2, p. 10; introduction p. 2: EHLS present their construction as extending Hida’s and Katz’s CM constructions. BH-2017, §1.8, p. 12: Bergdall–Hansen note that without Leopoldt’s conjecture it is not known that their construction agrees with the evaluation-map constructions in overlapping cases.

### Each construction is an instance of the evaluation principle on an actual ray-class quotient

`L5/evaluation-principle-instances` — comparison.

Every p-adic L-function of this roadmap is an element of D(G, L) or of a completed group ring of an explicit quotient G of a ray-class limit, and is obtained by the conditional evaluation principle (L0/conditional-evaluation-principle) or by its measure-theoretic special case: BSW’s µ\_Φ on Cl⁺\_F(p^∞) (norm relation L2/norm-relation, interpolation L2/bsw-interpolation, uniqueness only under L2/growth-uniqueness-totally-real-imaginary-quadratic); Deligne–Ribet’s pseudo-measure on Cl⁺\_F(f′p^∞) (L3/deligne-ribet-pseudomeasure); Katz’s and Hida–Tilouine’s measures on Gal(M(Cp^∞)/M) (L3/katz-padic-l-function, L3/katz-hida-tilouine-tame); Hsieh’s measure on the anticyclotomic quotient Γ⁻ (L3h/anticyclotomic-distribution); EHLS’s element of Λ\_{X\_p} ⊗̂ T over the character group X\_p of a ray-class limit of K (L4/ehls-main-theorem); Disegni–Liu’s measure on Γ\_{F,p} (L4/dl-padic-l-function); Eischen–Wan’s element of Λ\_{K,O\_L} on Γ\_K (L4e/ew-padic-l-function). In each case the group is identified with a Galois group through L0/ray-class-reciprocity and the interpolated characters are p-adic avatars (L0/hecke-character-avatar); there is one evaluation formalism, not separate incompatible measure definitions.

*Hypotheses.* Each construction’s hypotheses.

*Proof or construction.*

1. For each construction, identify its group with the ray-class limit or the stated quotient (L0/ray-class-unit-sequence, L0/evaluation-norm-twist-maps), its characters with avatars, and its interpolation with the clause (c) of the principle; bounded constructions are measures (PadicMeasuresIwasawaAlgebras L1) and the principle’s growth clause is vacuous for them.

*Acceptance.* Hsieh’s Γ⁻ is the quotient of Cl⁺\_M(p^∞) by the image of the norm from F: its characters are the anticyclotomic avatars.

*Rests on.* `L0/conditional-evaluation-principle`, `L0/ray-class-reciprocity`, `L2/normalised-evaluation`, `L2/bsw-interpolation`, `L3/deligne-ribet-pseudomeasure`, `L3/katz-padic-l-function`, `L3/katz-hida-tilouine-tame`, `L3h/anticyclotomic-distribution`, `L4/ehls-main-theorem`, `L4/dl-padic-l-function`, `L4e/ew-padic-l-function`.

*Sources.* BSW-2017-v3, Introduction p. 3; Theorem 9.10 p. 34: BSW’s p-adic L-function is a distribution on Cl⁺\_F(p^∞) obtained from evaluation maps and a norm relation. PAN-1994, §4.1, pp. 999–1001; Conjecture 6.2, p. 1006: Panchishkin defines Gal\_p and its character space X\_p in §4.1 and, in Conjecture 6.2, places the p-adic L-function of every motive over a totally real field on X\_p. KATZ-1978, (5.4.2)–(5.4.6), p. 275: Katz identifies his Galois group with ideal-class limits by the Artin symbol.

### The Coates–Perrin-Riou/Panchishkin existence proposition

`L5/cpr-panchishkin-proposition` — definition.

Let M be a pure motive of weight w and rank d over a totally real field F with coefficients in a number field T, given through explicit realisation data (SelmerIwasawaCohomology:L4/period-realization, L4/archimedean-realization) with a critical twist (L4/criticality). For a sign ε₀ = (ε\_{0,σ}) ∈ {±1}^{J\_F}, periods c^±(σ, M) (determined modulo T^×) and Ω(ε₀, M) = (1 ⊗ (2πi))^{r(M)}∏\_σc^{ε\_{0,σ}}(σ, M), the Newton and Hodge polygons P\_Newton,σ(u, M), P\_Hodge,σ(u, M) at the embeddings σ above p, the positive integer h = max\_σ[P\_Newton,σ(d^±) − P\_Hodge,σ(d^±)] + 1 with [·] the integer part (so h = 1 when M is admissible at p, i.e. P\_Newton,σ(d^±) = P\_Hodge,σ(d^±) for all σ, and also whenever the gap at d^± is less than 1), and the modified p-Euler factors A\_p(M(χ), s) built from the inverse roots α\_i(𝔭) ordered by valuation, the proposition CPRP(M, ε₀) asserts: there is a ℂ\_p-analytic function L^{ε₀}\_{(p)} on the character space X\_p of Gal\_p = Gal(F(p^∞)/F) such that (i) for all but finitely many (m, χ) with M(χ)(m) critical at 0 and sign ε₀, L^{ε₀}\_{(p)}(χx\_p^m) equals the explicit product of i^{…}, G(χ)^{d^{ε₀}}, ∏\_{𝔭|p}A\_p(M(χ)(m), 0) and the critical value L(M(χ)(m), 0)/Ω(ε₀, M) (read p-adically); (ii) it is holomorphic if M^{…} = 0 and otherwise has poles only at a finite explicit set; (iii) the holomorphic function in (ii) is bounded if M is admissible at p; (iv) in general it is of type o(log\_p^h) and is the Mellin transform of an h-admissible measure; (v) if h ≤ m\* − m\_\* + 1 (the width of the critical strip) it is uniquely determined by (i)–(ii) (Panchishkin Conjecture 6.2). No constructor asserts CPRP; it is a proposition about the data, satisfied in the cases constructed in this roadmap.

*Hypotheses.* M given by explicit realisation and criticality data from SelmerIwasawaCohomology L4; periods fixed modulo T^×; the conjecture on factorisation of periods (Panchishkin §2.3) is part of the data, not proved.

*Proof or construction.*

1. Define the critical set, periods and polygons from the realisation data; define h from the polygons (Panchishkin §5).
2. State (i)–(iii) as a proposition (Panchishkin Conjecture 6.2) using the character space and h-admissible measures (L0/ray-class-distributions, LocallyAnalyticDistributions:L2/order-r-distributions).

*Uses.* ModularIwasawaMainConjectures:L5: the analytic existence proposition imported by the arithmetic main-conjecture statements; SelmerIwasawaCohomology:L4/greenberg-main-conjecture: Greenberg’s proposition takes a specified analytic p-adic L-function as input; AutomorphicPadicLFunctions:L4/panchishkin-unramified: Disegni–Liu’s Panchishkin condition is the local form of the admissibility at p.

*API.*

- `CPRP.periods` (data): Ω(ε₀, M) from the periods c^±(σ, M).
- `CPRP.hodgePolygon` (data): P\_Hodge,σ(u, M) from the Hodge numbers of the realisation.
- `CPRP.newtonPolygon` (data): P\_Newton,σ(u, M) from the valuations of the Frobenius inverse roots at 𝔭 | p.
- `CPRP.admissibility` (constructor): h(M) = max\_σ[P\_Newton,σ(d^±) − P\_Hodge,σ(d^±)] + 1 ([·] the integer part), and the admissibility predicate P\_Newton,σ(d^±) = P\_Hodge,σ(d^±) for all σ (Panchishkin Definition 5.5), which implies h = 1 but is not implied by it.
- `CPRP.modifiedEulerFactor` (data): A\_p(M(χ), s) as in Panchishkin §6.1.
- `CPRP.statement` (constructor): The proposition CPRP(M, ε₀) with clauses (i)–(iii); a Prop, never an axiom.
- `CPRP.admissibility_twist` (relation): h(M) is unchanged by Tate twists and by finite-order twists of conductor prime to p.
- `CPRP.of_measure` (compatibility): For M admissible at p, a measure on Gal\_p with the interpolation (i) gives CPRP via the Mellin transform; in general an h-admissible distribution with (i) does.

*Unit tests.*

- `cprp_tate_motive` (computation): M = ℚ(1), p odd: h = 1 and CPRP holds by the Kubota–Leopoldt measure.
- `cprp_ordinary_h_one` (characterisation): If M is p-ordinary (Newton = Hodge) then h = 1 and the predicted function is bounded.
- `cprp_supersingular_not_admissible` (non-example): For h¹(E)(1) with E supersingular at p, h = 1 although M is not admissible at p (the Newton polygon lies 1/2 above the Hodge polygon at d^± = 1); a definition that took h = 1 to mean bounded, or that dropped the integer part and set h = 3/2, gets the predicted growth wrong: no bounded measure has the predicted values, and the function is of type o(log\_p).
- `cprp_no_constructor` (degenerate): CPRP(M, ε₀) is a proposition: the definition provides no element of D(Gal\_p, ℂ\_p) without a construction.

*Acceptance.* M = ℚ(1) over ℚ (Tate motive), p odd: admissible and ordinary, h = 1, and CPRP is the existence of the Kubota–Leopoldt measure (DirichletPadicLFunctions). M = h¹(E)(1) for an elliptic curve with good supersingular reduction at p ≥ 5: d^± = 1, P\_Newton(1) − P\_Hodge(1) = 1/2, so h = [1/2] + 1 = 1 but M is not admissible at p; clause (iv) asks for a function of type o(log\_p), matching the order-1/2 distributions of Amice–Vélu and Višik constructed by Pollack–Stevens.

*Rests on.* `SelmerIwasawaCohomology:L4/period-realization`, `SelmerIwasawaCohomology:L4/archimedean-realization`, `SelmerIwasawaCohomology:L4/criticality`, `SelmerIwasawaCohomology:L4/hodge-gamma-factor`, `L0/ray-class-distributions`, `L0/euler-factor-elements`, `LocallyAnalyticDistributions:L2/order-r-distributions`.

*Sources.* PAN-1994, §3.2, pp. 998–999; §4.2, Definition 4.2, p. 1001; §5, Definitions 5.2–5.5 and the integer h, pp. 1002–1005; §6.1–6.2, Conjecture 6.2 (i)–(v), pp. 1005–1006: Panchishkin defines the periods Ω(ε₀, M), h-admissible measures, the Newton and Hodge polygons, the admissibility condition, the integer h and the modified p-Euler factors, and states the conjecture on the existence of p-adic L-functions of motives over totally real fields. EHLS-2020, §1.1, p. 2: EHLS refer to the conjectures of Coates, Coates–Perrin-Riou, Panchishkin and Hida predicting how critical values fit into p-adic analytic functions.

### Dependencies of L5

Within this roadmap: `L0`, `L2`, `L3`, `L3h`, `L4`, `L4e`.

Other roadmaps and Tau Ceti layers: `LocallyAnalyticDistributions:L2/order-r-distributions`, `SelmerIwasawaCohomology:L4/archimedean-realization`, `SelmerIwasawaCohomology:L4/criticality`, `SelmerIwasawaCohomology:L4/hodge-gamma-factor`, `SelmerIwasawaCohomology:L4/period-realization`.

### Refinements left in L5

- Instances of CPRP beyond the Tate motive (for example BSW over ℚ for ordinary forms) can be added as theorem nodes when a consumer needs them.

## Source corrections

The statements above use the corrected readings below (recorded in the packet’s `sourceIssues` for independent review).

- **E1** (misprint, BSW-2017-v3, §9.2.2 (definition of φ\_{a\_y}) and Proposition 9.3, p. 31; proof of Proposition 9.9 (first display), p. 34; arXiv:1602.06244v3). The fibre functions are written with the inverse chart φ\_{a\_y}(z) = φ(a\_y^{-1}z), and Proposition 9.3 and the proof of Proposition 9.9 use the corresponding transformation rules φ\_{a\_y}(z) = φ\_{a′\_y}(ũz) and φ\_{a\_yu\_r}(z) = φ\_{a\_y}(u\_r^{-1}z). Correction: Use the forward chart φ\_{a\_y}(z) = φ(a\_yz), which matches the identification G\_y ≅ G by multiplication by a\_y^{-1} and equation (13); then φ\_{a′\_y}(z) = φ\_{a\_y}(ũz), φ\_{a\_yu\_r}(z) = φ\_{a\_y}(u\_rz), and the matrix identities ϕ\*\_{a′\_y} = (ũ 0; 0 1)·ϕ\*\_{a\_y} and ϕ\*\_{a\_y}|\_{G\_r} = (ũ\_r^{-1} 0; 0 1)·ϕ\*\_{a\_yu\_r} used in the proofs of Propositions 9.6 and 9.9 hold as printed. Reason: With the weight action (u 0; 0 1)·f(z) = u^{k+v}f(u^{-1}z), the identity ϕ\*\_{a′\_y} = (ũ 0; 0 1)·ϕ\*\_{a\_y} holds for the forward chart and fails for the inverse one (it gives (ũ^{-1} 0; 0 1) instead), so with the printed chart the two changes in Proposition 9.6 do not cancel; equation (13), (ϕ\_{p-fin})\_{a\_y} = ε\_ϕϕ\_f(a\_y)z^r, also requires the forward chart (the inverse chart gives ϕ\_f(a\_y)^{-1}). Test: ℚ\_3-units, weight z², ψ(z) = z and u = 4 give 1/16 instead of 1 with the inverse chart. Review (confirmed): Checked in arXiv v3, §9.2.1–9.2.2 and the proofs of Propositions 9.6 and 9.9 (pp. 30–34): §9.2.1 identifies G\_y with G by multiplication by a\_y^{-1}, so the fibre function of φ is z ↦ φ(a\_y z), while §9.2.2 prints φ(a\_y^{-1}z). With the weight action (u 0; 0 1)·f(z) = u^{k+v}f(u^{-1}z) the identity ϕ\*\_{a′\_y} = (ũ 0; 0 1)·ϕ\*\_{a\_y} used in Proposition 9.6, the restriction identity in Proposition 9.9 and equation (13) all hold for the forward chart and fail for the printed one; Proposition 9.3 as printed is the backward-chart rule, so it must be read as ϕ\_{a′\_y}(z) = ϕ\_{a\_y}(ũz). Results unaffected.
- **E2** (error, BSW-2017-v3, Lemma 6.7, p. 22, arXiv:1602.06244v3). The lemma asserts that every η ∈ GL₂(F) ∩ Σ₀(p) acts compactly on D\_λ(L), adding that in particular (1 0; 0 p) does. Correction: Restrict to η whose lower-right entry lies in p(O\_F ⊗ ℤ\_p) (radius-improving elements such as (1 0; 0 p)); these act compactly. Only that case is used (proof of Theorem 7.3). Reason: The identity matrix lies in GL₂(F) ∩ Σ₀(p) and is not compact in the sense of Definition 6.6: the degree-m coefficient functionals have norm 1 on D\_{0,λ} and |p|^{-m} on D\_{1,λ}, so the identity of D\_λ does not factor continuously through D\_{n−1,λ} → D\_{n,λ}. Review (confirmed): Checked at Lemma 6.7, p. 22: the identity matrix lies in GL₂(F) ∩ Σ₀(p) (c = 0, a = 1) and is not compact in the sense of Definition 6.6, so the lemma as stated is false; the proof of Theorem 7.3 uses only coset representatives of (1 0; 0 p), whose lower-right entry lies in p, and these do improve the radius.
- **E3** (gap, BSW-2017-v3, Lemma 8.1(iii), p. 24, arXiv:1602.06244v3). The lemma assumes an O\_L-submodule of {m : ‖m‖ ≥ 0} stable under the algebra A = L[U\_i] and concludes that slope ≤ h parts vanish when some h\_i < 0. Correction: Assume a bounded open (absorbing) O\_L-lattice, for example the unit ball, stable under the O\_L-algebra generated by the U\_i; the proof then rescales an eigenvector into the lattice and uses the unbounded orbit of a negative-slope eigenvalue. Reason: As printed the norm condition is vacuous and stability under L-scalars forces the submodule to be an L-subspace; the zero submodule satisfies the hypotheses, while M = L with U = p^{-1} has nonzero slope −1 part, so the stated conclusion needs the lattice hypothesis, which the application in Corollary 8.4 (integral distributions, renormalised U′\_𝔭) does provide. Review (confirmed): Checked at Lemma 8.1(iii), p. 24: the hypothesis asks only for an O\_L-submodule of the elements of nonnegative norm stable under L[U\_i]; stability under L-scalars forces such a submodule to be 0, and the proof needs to rescale an eigenvector into the submodule, so an open bounded lattice stable under the integral Hecke algebra is required. Corollary 8.4 supplies one (integral distributions and the renormalised U′\_𝔭).
- **E4** (misprint, BSW-2017-v3, §9.2.1, p. 30 (the decomposition of Cl⁺\_F(p^∞) and the parenthetical on E(1)); also the definition of G after (11); arXiv:1602.06244v3). Cl⁺\_F(p^∞) is written as a disjoint union over Cl⁺\_F of (O\_F ⊗ ℤ\_p)^×/E(1), with E(1) taken to be the image of the totally positive units in (O\_F ⊗ ℤ\_p)^×, and G as the congruence units modulo E(f). Correction: Divide by the topological closure of the image of E(1) (respectively E(f)), as Katz (5.4.6) and Panchishkin §4.1 do. Reason: The kernel of (O\_F ⊗ ℤ\_p)^× → Cl⁺\_F(p^∞) is closed (the target is profinite) and contains the image of the units densely, so it is the closure; for F with positive unit rank the image itself is not closed and the quotient by it is not Hausdorff. Review (confirmed): Checked at §9.2.1, p. 30, and §12, p. 39: the quotients are written as (O\_F ⊗ ℤ\_p)^×/E(1) and {z ≡ 1 mod f}/E(f) with E the image of the units; for positive unit rank the image is not closed, and the kernel of the map to the profinite group Cl⁺\_F(p^∞) is its closure (Katz (5.4.6), p. 275, divides by the closure).
- **E5** (misprint, EW-2018, Corollary 5.9 and its justification, p. 37, arXiv:1404.7153v2). The corollary is said to follow from ‘Proposition 4.17’, Theorem 5.8 and Lemma 3.2. Correction: The item numbered 4.17 is Lemma 4.17 (p. 29: the vanishing of A(ρ, f, z\_κ)\_{−z\_κ} in Lemma 3.2(ii) in the absolute convergence range); the reference should read Lemma 4.17. Reason: No Proposition 4.17 exists in the paper; the numbered items of §4.4 are Lemma 4.15, Definition 4.16, Lemma 4.17, Proposition 4.18 and Definition 4.19, and Lemma 4.17 is the statement used about the Klingen constant term. Review (confirmed): Checked at Corollary 5.9, p. 37: the justification cites Proposition 4.17; the paper has no Proposition 4.17, and Lemma 4.17 (p. 29) is the Klingen constant-term statement the argument needs.
- **E6** (error, HSIEH-2014, Theorem C, p. 713 (published Documenta Math. 19 (2014)); also Theorem C in arXiv:1112.1580v3; compare Theorem 7.1, p. 759, and Theorem 6.2, p. 757). Theorem C lists as hypotheses (ord), (sf), Hypothesis A, the coprimality (pl, n c\_χ D\_{K/F}) = 1, absolute irreducibility of the residual representation restricted to G\_K and the local character-image condition, and does not require p to be unramified in F. Correction: Add the hypothesis that p is unramified in F. Theorem 7.1, which proves Theorem C, assumes the hypotheses of Theorem 6.2, and these include p unramified in F. Reason: The proof of Theorem 7.1 goes through the µ-invariant criterion Theorem 6.1, Hida’s linear independence (Hida 2010, Theorem 3.20, Corollary 3.21) and Hida’s density theorems (Hida 2004), each stated or used under p unramified in F; Theorem C as printed claims the conclusion without that hypothesis, which is not what is proved. Review (confirmed): Found by this review: Theorem 7.1 (p. 759) begins ‘With the same assumptions in Theorem 6.2’, and Theorem 6.2 (p. 757) assumes p unramified in F; Theorem C (p. 713) does not list it. Node L3h/theorem-c now carries the hypothesis.
- **E7** (misprint, HSIEH-2014, Theorem C, condition (3), p. 713 (published version only)). Condition (3) of Theorem C asks that p not divide the product of the orders #(∆\_{χ,v}) over the places v with v(c⁻\_λ) = 1, indexing by the conductor of λ while the groups belong to χ. Correction: Index by the conductor of χ: the product runs over v with v(c⁻\_χ) = 1, matching Theorem 7.1(2) (µ\_p(Ψ\_{π,χ,v}) = 0 for v | c⁻\_χ) and the arXiv version’s condition over v | c⁻\_χ. Reason: Theorem C concerns twists of χ, whose ramification at the nonsplit places is what the local invariants µ\_p(Ψ\_{π,χ,v}) of Theorem 7.1 measure; λ plays no role in Theorem C, and the arXiv v3 statement indexes by c⁻\_χ. Review (confirmed): Found by this review, comparing the published Theorem C (p. 713) with Theorem 7.1 (p. 759) and arXiv v3.

## Gaps

- **Hida’s density theorems of 2004 not read** (needed by `L3h/hida-cm-density`, `L3h/theorem-c`). Hida, ‘Non-vanishing modulo p of Hecke L-values’ (Geometric aspects of Dwork theory, de Gruyter 2004), Theorems 3.2–3.3, is not freely available and was not read; hida-cm-density states the result as Hsieh 2014 §7 (p. 760) uses it and quotes Hida’s meaning of ‘almost all’ (p. 737). The exact hypotheses of Theorems 3.2–3.3 must be checked against the source before the node is refined.
- **Vatsal 2003 not read** (needed by `L3h/finis-divisibility`, `L3h/mod-p-nonvanishing`). Vatsal, ‘Special values of anticyclotomic L-functions’, Duke Math. J. 116 (2003), 219–261, is cited by Hsieh and by Skinner–Urban for mod-p nonvanishing of anticyclotomic twists of weight-two forms; it is not freely available and was not read. The sub-layer records it as an import for AutomorphicCongruences:L1 without stating its theorem.
- **Proof of BSW Theorem 4.6 only sketched in BSW** (needed by `L1/integral-formula`). BSW give a sketch and refer to Chapter 12.1.4 of Williams’ thesis for the full computation; the thesis was not read. The sketch (Betti–de Rham comparison, Mellin transform of the Fourier expansion, Gauss-sum collapse) is recorded in the proof steps; the archimedean local integrals at complex places must be taken from the thesis or redone.
- **Hida–Tilouine 1993 and Katz §5.5–5.6 not read in detail** (needed by `L3/katz-hida-tilouine-tame`, `L3/katz-padic-l-function`, `L3/katz-functional-equation`). Hida–Tilouine (Ann. Sci. ÉNS 26 (1993)) is stated through Hida 2010 §1 (1.3); Katz’s proof sections §§5.4–5.6 were located but only the statements (5.3.0)–(5.3.7), (4.2.x) and (2.4.5), (2.5.8), (2.6.7) were read. The local term Local(χ, Σ, δ) of Katz §5.2 must be transcribed from (5.2.30)–(5.2.38) when the node is refined.
- **Barrera Salazar’s growth bound for the totally real construction not read** (needed by `L2/growth-uniqueness-totally-real-imaginary-quadratic`). BSW §12 (p. 39) and Bergdall–Hansen §1.8 (p. 12) attribute to Barrera Salazar (thesis, Lille 2013; Ann. Inst. Fourier 68 (2018)) the admissibility of the overconvergent-cycle p-adic L-function over a totally real field. Neither BSW nor Bergdall–Hansen proves it, and it was not read; the identification of µ\_Φ with Bergdall–Hansen’s L^ε\_p(π, α) under vanishing Leopoldt defect rests on it. The exact growth exponent and slope range must be taken from that source before the node is refined.
- **Deligne’s equivalence for ordinary abelian varieties over finite fields not planned** (needed by `L3/igusa-irreducibility`). Deligne–Ribet prove (4.5) by constructing ordinary Hilbert–Blumenthal abelian varieties over finite fields with prescribed Frobenius unit, level structure and polarisation module from Deligne’s equivalence between ordinary abelian varieties over F\_q and finite free ℤ-modules with a Frobenius endomorphism (Deligne, ‘Variétés abéliennes ordinaires sur un corps fini’, Invent. Math. 8 (1969); DR p. 257). No layer of the atlas plans it: AbelianSchemesAndArithmeticModuliPartII F3 has the Honda–Tate classification only. A finite-field layer of that roadmap is the natural owner; until it is planned, the node rests on this gap.

## Requests to other roadmaps

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`: Import (existing Tau Ceti layer): moduli, ray class groups and the transition maps classMap with their composition and surjectivity, as at the pin; this roadmap builds only the p-power inverse limit and its unit closure. Needed by `L0/ray-class-tower`, `L0/ray-class-reciprocity`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`: Import (existing Tau Ceti layer): the finite-level ray-class exact sequence with units, residues and signs, used at each level before passing to the limit. Needed by `L0/ray-class-unit-sequence`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`: Import (existing Tau Ceti layer): global Artin reciprocity with its arithmetic Frobenius normalisation, at each finite ray-class level and functorially in the modulus. Needed by `L0/ray-class-reciprocity`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`: Import (existing Tau Ceti layer): complex Hecke characters as continuous characters of the idele class group, ray class characters, local components and conductors. Needed by `L0/hecke-character-avatar`, `L0/gauss-sum-and-depleted-l-function`, `L1/cusp-forms-and-twisted-l-functions`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`: Import (existing Tau Ceti layer): archimedean components and infinity types of idele class characters. Needed by `L0/hecke-character-avatar`, `L0/locally-algebraic-characters`.
- `PadicMeasuresIwasawaAlgebras:L1`: Completed group algebras O[[G]] of the ray-class limits and their quotients, with the identification of measures with the completed group ring and convolution; the Euler-factor elements and the Deligne–Ribet ring Λ\_G live there. Needed by `L0/ray-class-distributions`, `L3/deligne-ribet-pseudomeasure`, `L3/katz-eisenstein-measure`, `L3/group-ring-eisenstein-families`, `L4/ehls-main-theorem`, `L4e/ew-padic-l-function`, `L0/euler-factor-elements`.
- `PadicMeasuresIwasawaAlgebras:L0a`: Character spaces and the universal character for compact abelian p-adic analytic groups, instantiated on the ray-class limit Cl⁺\_F(𝔫p^∞) through its chart Δ × ℤ\_p^d. Needed by `L0/ray-class-distributions`.
- `ArithmeticLocallySymmetricSpaces:ALS.4`: The Eichler–Shimura–Harder map for GL₂ over an arbitrary number field F: a Hecke-equivariant injection of cohomological cusp forms of weight λ and level Ω₁(𝔫) into H^q\_c(Y₁(𝔫), L₁(V\_λ(ℂ)\*)), q = r₁ + r₂, through cuspidal cohomology and the boundary sequence, with the Hecke normalisation of Dimitrov/Hida. No stage plans it for general F (only ModularSymbolsPadicLFunctions:L0 for F = ℚ); requested as RT-AREA-iwasawa-1/34 directs. Needed by `L1/eichler-shimura-harder`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`: Import (existing Tau Ceti layer): classical nebentypus Eisenstein series and their q-expansions, the F = ℚ case of the Hilbert Eisenstein series. Needed by `L3/hilbert-cusp-combinatorics`, `L3/hilbert-eisenstein-series`.
- `HilbertModularVarietiesAndShimuraCurves:H2`: The formal and mod-p^n ordinary Igusa tower over the Hilbert ordinary locus: for the Deligne–Pappas model, the finite étale (O\_F/p^n)^×-torsors of trivialisations O\_F ⊗ µ\_{p^n} ≅ A[p^n]° of the multiplicative part over the ordinary locus mod p^n and over its formal completion, compatible in n, with the canonical points of CM abelian varieties of p-ordinary type and the comparison with HodgeTateAndCanonicalSubgroups:T5’s generic-fibre tower by Cartier duality. RT-AREA-langlands-1/8 routes the Hilbert Igusa inputs of Deligne–Ribet, Katz and Hsieh to T5 extended or supplemented in this roadmap; T5 supplies only the generic-fibre tower. Needed by `L3/padic-hilbert-modular-forms`, `L3/igusa-irreducibility`, `L3/cm-points-and-canonical-trivialisations`.
- `SmoothRepresentationsOfLocalGroups:SR.4`: Unramified principal series of GL\_n over p-adic fields, Iwahori-fixed vectors and the U\_t-operators (Casselman’s basis), for the stabilised vectors of Eischen–Wan and the Panchishkin eigenlines of Disegni–Liu. Needed by `L4/doubling-global-identity`, `L4/dl-big-cell-sections`, `L4/panchishkin-unramified`, `L4e/ew-setting`.
- `ModularityAndLanglandsExtensions:ML.3`: Sato–Tate for the relevant cuspidal representations (Barnet-Lamb–Geraghty–Harris–Taylor), used by Eischen–Wan (proof of Theorem 5.8) to find an auxiliary prime ℓ split in K at which π is ordinary. Needed by `L4e/constant-term-divisibility`.

## What consumers asked of this roadmap

- AutomorphicCongruences:L5w/klingen-interpolation (AutomorphicCongruences--L5b) → `L4` (partial): The EHLS doubling machinery and the Eischen–Wan Klingen family are planned; Wan’s 2015 GU(2,2)/F construction (Theorems 82/88, Siegel-operator interface) is not routed to this roadmap and was not read. It needs a source route of its own (AutomorphicCongruences owns the congruence; the analytic family would be a Part II of this roadmap). Answered by `L4/ehls-eisenstein-measure`, `L4/doubling-global-identity`, `L4/ehls-ordinary-forms-hecke`, `L4e/klingen-family`.
- AutomorphicCongruences:L5w/quaternionic-period-primitivity, fourier-coefficient-coprimality → `L3h` (partial): Mod-p nonvanishing (Hsieh 2012/2014) is planned; Hung’s theorem and the quaternionic/canonical period comparison are not routed here and were not read. Answered by `L3h/mod-p-nonvanishing`, `L3h/hsieh-hecke-nonvanishing`, `L3h/theorem-c`.
- AutomorphicCongruences:L5w/fourier-coefficient-coprimality → `L3` (partial): The CM-character p-adic L-function with its infinity types, conductors and Euler factors is planned; the canonical congruence-period unit comparison (Hida–Tilouine’s anticyclotomic congruence module) is not. Answered by `L3/katz-padic-l-function`, `L3/katz-hida-tilouine-tame`.
- AutomorphicCongruences:L5b/cyclotomic-analytic-factorization → `L5` (redirected): Hida’s Rankin–Selberg p-adic L-function on the elliptic cyclotomic line (CGS 1.2.2–1.2.4) is PadicFamilies’ (PadicFamilies:L1/branch-l-functions); this roadmap supplies only the normalisation dictionary format (Euler-factor elements, period changes). Answered by `L0/euler-factor-elements`, `L5/normalisation-comparisons`.
- ColemanIntegration:L3/padic-beilinson-conjecture → `L3` (partial): Abelian characters of totally real fields are planned; the Brauer-induction extension to Artin characters with totally real kernel field is nonabelian and outside L3’s abelian scope. Answered by `L3/deligne-ribet-pseudomeasure`.
- ColemanPowerSeriesPartII:AU.4/early-cm-interface → `L3` (redirected): The nonordinary CM continuation (BKO) is excluded from L3 by its stage text (no extrapolation to nonordinary CM primes); it belongs to the Part II design of this roadmap for nonordinary CM special values (#1689 / #3350).
- GeneralizedHeegnerCycles:GH.1, GH.4, GH.6, GH.7 (GeneralizedHeegnerCycles--GH.0) → `L3h` (partial): The square-root distribution, its interpolation, Theorem C and the Castella–Hsieh specialisation are planned; values outside the interpolation range with negative θ-powers (BDP 5.9–5.10) and Castella’s family interpolation (Theorem 2.11) are not routed here. Answered by `L3h/anticyclotomic-distribution`, `L3h/theorem-a`, `L3h/theorem-c`, `L3h/bdp-castella-hsieh-specialisation`.
- GrossZagierAndArithmeticHeights:GZ.9 (bdp-p-adic-l-function and others) → `L3h` (answered): The F = ℚ, n⁻ = 1 specialisation with Castella–Hsieh’s factors, the p-new Euler factor at the prime fixed by ι\_p recorded. Answered by `L3h/bdp-castella-hsieh-specialisation`, `L3h/theorem-a`.
- GrossZagierAndArithmeticHeights:GZ.9 (bdp-weight-two-heegner-formula, imprimitive-function-dictionary and others) → `L0` (answered): Avatars, twisting by ψ^{-1}, pushforward Γ̃ → Γ with ev\_φ(q\_\*Tw\_{ψ^{-1}}µ) = ev\_{ψ^{-1}(φ∘q)}µ, and the conversion between geometric and arithmetic Artin conventions. Answered by `L0/evaluation-norm-twist-maps`, `L0/hecke-character-avatar`, `L0/ray-class-reciprocity`, `L0/euler-factor-elements`.
- GrossZagierAndArithmeticHeights:GZ.9 (CM periods) → `L3` (answered): Ω\_∞, Ω\_p, their scaling with the differential, and algebraicity of CM values of nearly holomorphic forms through the unit-root splitting. Answered by `L3/cm-periods`, `L3/katz-cm-algebraicity`.
- HeegnerPointEulerSystems:HE.8b (HE.7s and HE.8b packets) → `L3h` (partial): Hsieh’s Theorem B in the N⁻ = 1 branch is planned; the comparison with BCS’s BDP ideal (Proposition 4.2.2) is the consumer’s. Answered by `L3h/theorem-b`, `L3h/bdp-castella-hsieh-specialisation`.
- NoncommutativeAndEquivariantIwasawa:NE.6 (abelian case, partial zeta values, Hilbert Eisenstein toolkit) → `L3` (answered): G\_ψ and the pseudo-measure, Siegel–Klingen rationality, G\_{k,ε} with constant terms, the q-expansion principle and Theorem (0.4). Answered by `L3/deligne-ribet-pseudomeasure`, `L3/partial-zeta-distributions`, `L3/siegel-klingen-rationality`, `L3/hilbert-eisenstein-series`, `L3/padic-q-expansion-principle`, `L3/deligne-ribet-measure`, `L3/group-ring-eisenstein-families`.
- NoncommutativeAndEquivariantIwasawa:NE.7/padic-stark-conjecture → `L3` (not planned): Greenberg’s p-adic Artin L-functions (Brauer induction) and Colmez’s residue formula are not routed here and were not read; they are nonabelian or need Colmez’s source, and are recorded for a later route.
- OrdinaryAutomorphicFormsAndModularityLifting:R21.2, R21.5 → `L3` (partial): The Deligne–Ribet p-adic L-function and Hilbert Eisenstein series with constant terms are planned; Skinner–Wiles’ two-character series E\_n(φ₁, φ₂), Chai’s integral form and Wiles’ Proposition 1.6 are not routed here. Answered by `L3/deligne-ribet-pseudomeasure`, `L3/hilbert-eisenstein-series`, `L3/eisenstein-constant-terms`.
- RankZeroOneBSD:BSD.6a (Hsieh toric BDP measure, µ = 0) → `L3h` (partial): Hsieh’s measure and µ = 0 are planned, the square and square root kept distinct; Burungale’s Proposition 5.1.3 and JSW’s BDP/Brooks calculation are not. Answered by `L3h/anticyclotomic-distribution`, `L3h/theorem-b`.
- RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility, castella-higher-weight-input → `L4e` (answered): Eischen–Wan Klingen families on definite GU(2,0) (Klingen series on GU(3,1)) with Theorem 5.8 and Corollary 5.9. Answered by `L4e/klingen-family`, `L4e/constant-term-divisibility`.
- RankZeroOneBSD:BSD.6a (BSTW two-variable Rankin and signed functions; CGS Proposition 2.4.5) → `L3` (not planned): Hida’s two-variable Rankin–Selberg function against a CM family and BSTW’s signed functions are not routed here (PadicFamilies and a nonordinary route own them); CGS’s Greenberg-ideal comparison is the consumer’s.
- RankZeroOneBSD:BSD.7a (finite Euler factors) → `L0` (answered): Euler-factor elements with inertia coinvariants and evaluation at ℓ^{-1}γ\_w, arithmetic Frobenius convention explicit. Answered by `L0/euler-factor-elements`.
- RankZeroOneBSD:BSD.7a (Katz p-adic L-functions, congruence ideals) → `L3` (partial): Katz’s and Hida–Tilouine’s measures and Hida’s µ = 0 are planned; integral CM congruence ideals and the elliptic-unit main conjecture are not. Answered by `L3/katz-padic-l-function`, `L3/katz-hida-tilouine-tame`, `L3h/hida-katz-mu-vanishing`.
- SpecialValuesBirchTate:B.2, B.4–B.6, B.8 → `L3` (partial): Integrality of Δ\_c including the 2-adic statement (8.11), the pseudo-measure and the power-series form are planned; the exact 2-power divisibility of the 2-adic G\_F and the factorisation for abelian F are consequences the consumer derives. Answered by `L3/deligne-ribet-measure`, `L3/deligne-ribet-pseudomeasure`.
- ModularIwasawaMainConjectures:L5 (RS-14 link) → `L5` (answered): The analytic existence proposition on Selmer L4’s realisation data, without an existence constructor. Answered by `L5/cpr-panchishkin-proposition`.
- IntegralIwasawaTheory:I.3 and KU-brumerstark (RS-14 links) → `L3` (answered): One Deligne–Ribet object exported; I.3 owns the Stickelberger dictionary and KU-brumerstark the cusp-form construction. Answered by `L3/deligne-ribet-pseudomeasure`, `L3/deligne-ribet-measure`, `L3/group-ring-eisenstein-families`, `L3/eisenstein-constant-terms`.

## Proposed structure

- **split.** RT-AREA-iwasawa-1/7 found that no layer plans the mod-p nonvanishing theorems for anticyclotomic L-values and Hida’s density and linear-independence results they rest on, although L3h (Hsieh’s Theorems B and C), AutomorphicCongruences:L1 (Skinner–Urban, via Vatsal and Finis) and AutomorphicCongruences:L2s (Castella–Liu–Wan, via Hsieh 2012) need them. Add a sub-layer L3m ‘Mod-p nonvanishing of anticyclotomic Hecke and Rankin–Selberg L-values’ under L3h, containing the nodes L3h/mod-p-nonvanishing (parent), L3h/hida-linear-independence, L3h/hida-cm-density, L3h/hida-katz-mu-vanishing, L3h/hsieh-hecke-nonvanishing and L3h/finis-divisibility. It requires L3 and the Hilbert Igusa inputs (HodgeTateAndCanonicalSubgroups:T5), and supplies L3h (Theorems B and C), AutomorphicCongruences:L1 and AutomorphicCongruences:L2s; these edges are acyclic in the atlas graph.

## Red-team findings handled

- **RT-AREA-automorphic-1/13.** L1 now imports the GL₂ Whittaker and L-function interface it uses: AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet and AL.3/whittaker-model, GL2AutomorphicRepresentationsAndTransfer:R16.5/whittaker-integral-comparison and R16.5/classical-l-function-comparison, R16.3/archimedean-factor-comparison, and the AL.5 critical-value interface in the rational comparison. BSW’s general-field critical-value formula is owned here (L1/critical-value-formula); the rational formula stays ModularSymbolsPadicLFunctions:L1’s. The rewording of AL.5 itself belongs to AL’s owner.
- **RT-AREA-iwasawa-1/7.** Adopted: the mod-p nonvanishing inputs are planned as the proposed sub-layer L3m under L3h (restructure), with Hida’s linear independence (2010, Theorem 3.20, Corollary 3.21), Hida’s density (2004, Theorems 3.2–3.3, stated through Hsieh, recorded gap), Hida’s and Hsieh’s µ = 0 theorems, Hsieh 2012’s nonvanishing (Theorems A, B) and Finis 2006 (Theorem 1.1); Vatsal 2003 is a recorded gap. L3h’s Theorems B and C cite them.
- **RT-AREA-iwasawa-1/11.** L3h owns the GL₂ BDP square-root distribution through Hsieh’s construction and its F = ℚ, n⁻ = 1 specialisation (L3h/bdp-castella-hsieh-specialisation), which GrossZagierAndArithmeticHeights:GZ.9 and GeneralizedHeegnerCycles import (their packets already request L3h). The single owner of BDP Theorem 5.13 (GZ.9 or GH.1) and Brooks’s quaternionic construction are GZ’s and GH’s decisions and are not planned here.
- **RT-AREA-iwasawa-1/32.** L4e/ew-setting carries the pairwise distinct Satake characters χ₁, …, χ\_r (regular p-stabilisation) and temperedness (removable only by the argument sketched on EW p. 34) as explicit hypotheses; every L4e node inherits them.
- **RT-AREA-iwasawa-1/33.** The growth target is split: L2/bsw-choice-independence states BSW’s independence of choices for general F and records per-place growth as an open statement, not a target; L2/growth-uniqueness-totally-real-imaginary-quadratic gives growth and uniqueness for F imaginary quadratic (Williams, Theorem 7.4) and F totally real under vanishing Leopoldt defect (Bergdall–Hansen, Theorem 1.1.2(c),(f)). L0’s uniqueness clause is conditional on a growth theorem. The review adds that the growth of µ\_Φ itself over totally real F is Barrera Salazar’s admissibility result (cited by BSW §12 and Bergdall–Hansen §1.8), recorded as a gap.
- **RT-AREA-iwasawa-1/34.** L1 and L2 cite ArithmeticLocallySymmetricSpaces ALS.0 (locally symmetric spaces, components), ALS.1 (local systems, Betti complexes, finite complex model, level pullback), ALS.2 (Borel–Serre finiteness), ALS.3 (Hecke operators, level trace), AutomorphicFormsOnReductiveGroups AF.3–AF.5 and AL.2/R16.5 for GL₂ L-functions. The Eichler–Shimura–Harder map for GL₂ over a general number field is planned by no stage and is requested from ArithmeticLocallySymmetricSpaces:ALS.4.
- **RT-AREA-langlands-1/8.** Hilbert consumers take their Igusa inputs from HodgeTateAndCanonicalSubgroups:T5/igusa-torsor (Igusa torsors of the dual canonical subgroup over the Hilbert ordinary locus) and HilbertModularVarietiesAndShimuraCurves H2 (ordinary locus, Hasse ideal, Deligne–Pappas model), never from IgusaVarietiesAndTorsionConcentration:IG.1; the CM points and their canonical trivialisations are built here. L4 uses IG.1 only for special-fibre unitary geometry and builds the characteristic-zero ordinary tower itself.
- **RT-AREA-ktheory-2/26.** L0 imports the Leopoldt defect from IntegralIwasawaTheory:L4/leopoldt-defect (the node that exists; the finding proposes moving it to I.2, which is IntegralIwasawaTheory’s change) and proves the dimension formula r₂ + 1 + δ\_{F,p} itself.

## References

- **BSW-2017-v3**: Daniel Barrera Salazar and Chris Williams, *P-adic L-functions for GL2*. arXiv:1602.06244v3 (29 December 2017); published in Canadian Journal of Mathematics 71 (2019), no. 5, 1019–1059. Locators are the arXiv v3 printed pages, which equal the PDF pages. https://arxiv.org/pdf/1602.06244v3
- **DR-1980**: Pierre Deligne and Kenneth A. Ribet, *Values of abelian L-functions at negative integers over totally real fields*. Inventiones mathematicae 59 (1980), 227–286; scanned journal pages from the Göttingen digitisation centre (PDF page n is printed page 225 + n). https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0059/LOG_0021.pdf
- **KATZ-1978**: Nicholas M. Katz, *p-adic L-functions for CM fields*. Inventiones mathematicae 49 (1978), 199–297; scanned journal pages from the Göttingen digitisation centre (PDF page n is printed page 197 + n). https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0014.pdf
- **HSIEH-2014**: Ming-Lun Hsieh, *Special values of anticyclotomic Rankin–Selberg L-functions*. Documenta Mathematica 19 (2014), 709–767 (published version; PDF page n is printed page 708 + n). https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf
- **HIDA-2010**: Haruzo Hida, *The Iwasawa μ-invariant of p-adic Hecke L-functions*. Annals of Mathematics 172 (2010), no. 1, 41–137 (published version served by the journal; PDF page n is printed page 39 + n). http://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf
- **HSIEH-2012-NV**: Ming-Lun Hsieh, *On the non-vanishing of Hecke L-values modulo p*. arXiv:1208.4751v1 (23 August 2012); published in American Journal of Mathematics 134 (2012), no. 6, 1503–1539. Locators are arXiv PDF pages. https://arxiv.org/pdf/1208.4751v1
- **HSIEH-2012-MU**: Ming-Lun Hsieh, *On the μ-invariant of anticyclotomic p-adic L-functions for CM fields*. arXiv:1112.1574v3 (23 August 2012); published in Journal für die reine und angewandte Mathematik 688 (2014), 67–100. Locators are arXiv PDF pages. https://arxiv.org/pdf/1112.1574v3
- **EHLS-2020**: Ellen Eischen, Michael Harris, Jian-Shu Li and Christopher Skinner, *p-adic L-functions for unitary groups*. arXiv:1602.01776v5; published in Forum of Mathematics, Pi 8 (2020), e9. Locators are arXiv v5 printed pages, which equal the PDF pages. https://arxiv.org/pdf/1602.01776v5
- **EW-2018**: Ellen Eischen and Xin Wan, *p-adic Eisenstein series and L-functions of certain cusp forms on definite unitary groups*. arXiv:1404.7153v2 (the version dated October 2018 that the roadmap names); published in Journal of the Institute of Mathematics of Jussieu 15 (2016), 471–510. Locators are arXiv v2 printed pages, which equal the PDF pages. https://arxiv.org/pdf/1404.7153v2
- **DL-2024**: Daniel Disegni and Yifeng Liu, *A p-adic arithmetic inner product formula*. arXiv:2204.09239v3; published in Inventiones mathematicae 236 (2024), no. 1, 219–371. Locators are arXiv v3 printed pages, which equal the PDF pages. https://arxiv.org/pdf/2204.09239v3
- **DK-2023**: Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*. arXiv:2010.00657v3 (authors' final version); published in Annals of Mathematics 197 (2023), no. 1, 289–388. Locators are arXiv v3 printed pages, which equal the PDF pages. https://arxiv.org/pdf/2010.00657v3
- **DKV-2018**: Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, *On the Gross–Stark conjecture*. arXiv:1605.08169v1; published in Annals of Mathematics 188 (2018), no. 3, 833–870. Locators are arXiv v1 printed pages, which equal the PDF pages. https://arxiv.org/pdf/1605.08169v1
- **CGLS-2022**: Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. arXiv:2008.02571v2 (final version); published in Inventiones mathematicae 227 (2022), 517–580. Locators are arXiv PDF pages. https://arxiv.org/pdf/2008.02571v2
- **PAN-1994**: Alexei A. Panchishkin, *Motives over totally real fields and p-adic L-functions*. Annales de l'Institut Fourier 44 (1994), no. 4, 989–1023 (Numdam scan with text layer; PDF page n is printed page 987 + n). http://www.numdam.org/item/AIF_1994__44_4_989_0.pdf
- **FINIS-2006**: Tobias Finis, *Divisibility of anticyclotomic L-functions and theta functions with complex multiplication*. Annals of Mathematics 163 (2006), no. 3, 767–807 (published version served by the journal). http://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf
- **WIL-2017**: Chris Williams, *P-adic L-functions of Bianchi modular forms*. arXiv:1404.2100v2 (22 January 2015); published in Proceedings of the London Mathematical Society 114 (2017), no. 4, 614–656. Locators are arXiv PDF pages. https://arxiv.org/pdf/1404.2100v2
- **BH-2017**: John Bergdall and David Hansen, *On p-adic L-functions for Hilbert modular forms*. arXiv:1710.05324v2. Locators are arXiv PDF pages. https://arxiv.org/pdf/1710.05324v2
