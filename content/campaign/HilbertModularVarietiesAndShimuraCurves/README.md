# Roadmap: Hilbert Modular Varieties And Shimura Curves

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose

Construct the Hilbert examples of the general Shimura theory for every totally real number field, keeping both the geometric and arithmetic groups. Supply the integral and level structures used in the overconvergent Hilbert modular forms construction, including ramified rational primes.

Write `F` for the totally real field, `g=[F:ℚ]`, `𝒪_F` for its integers, `𝔡` for its different, and

\[
G=\operatorname{Res}_{F/\mathbf Q}GL_2,\qquad
G^*=G\times_{\operatorname{Res}_{F/\mathbf Q}\mathbf G_m}\mathbf G_m,
\]

where the maps are determinant and the scalar inclusion. These are different groups with the same derived group. The superscript `*` here means the group `G*`; it must not be confused with a star denoting a minimal compactification.

Primary construction references are Lan's PEL theory, the Hilbert moduli references used in Birkbeck–Heuer–Williams (BHW) §5.1, and BHW §§5 and 8. Hida's lectures §9 provide the polarized Hilbert moduli and ordinary comparison perspective.

## Inputs and scope

Consume D5, A0–A5, and M0–M4. For algebraic Shimura comparisons consume V8. Compactifications are supplied by C0–C6, and p-adic period maps by T and S; those later objects are not prerequisites for H0–H4.

The global datum is defined independently of p. Once p is chosen, assume only that the auxiliary tame level is prime to p and sufficiently small for the stated fine moduli problem. Any extra condition on the polarization module or its representative is explicit, and independence of that representative is proved. Neither `p∤disc(F)` nor class number one is a standing assumption.

## Milestones

<a id="h0"></a>

### H0. The two data and their domains

**Dependencies:** D0–D5.

Construct the restriction-of-scalars group and the scalar-determinant subgroup. Prove their derived-group and centre descriptions. Identify the conjugacy domains: for `G` all independent upper/lower half-plane choices occur, while the standard `G*` conjugacy class has the common-sign components. Prove that the datum morphism is the expected inclusion and that both reflex fields are `ℚ`.

Construct a symplectic representation of `G*` using a trace pairing, with the lattice and different in the pairing explicitly recorded. Prove that it is a Hodge-type datum. Prove that the `G` datum is abelian type through its derived-group comparison; do not force a symplectic embedding of this exact `G` as a substitute for the comparison.

<a id="h1"></a>

### H1. Polarization modules and Hilbert–Blumenthal moduli

**Dependencies:** H0, A2–A5, M0–M3.

Define an abelian scheme with real multiplication, its module of symmetric `𝒪_F`-linear homomorphisms to the dual, and its positive cone. Define a `𝔠`-polarization through an ordered invertible `𝒪_F`-module `𝔠`; a single chosen principal polarization is not sufficient to cover the Hilbert case.

Construct the moduli problem with tame level `µ_N` and the variants needed for `K`, `K₀`, and `K₁` level. Verify the determinant condition and the appropriate representability hypotheses. Compare its complex fibres with the adelic descriptions of H0. Keep the fractional-ideal labels, their changes by totally positive elements, and their effect on pairings visible.

Prove the trace/different dictionary for the `𝒪_F`-linear Weil pairing. A local generator or identification involving `𝔠𝔡⁻¹` is an auxiliary choice with a change-of-choice theorem; it is not treated as a canonical principal ideal.

<a id="h2"></a>

### H2. Integral models at arbitrary p

**Dependencies:** H1, A4, M2, and normalizations from M4.

Construct the Deligne–Pappas-type integral moduli model required for the chosen polarization problem, and the Rapoport locus with its locally free rank-one `𝒪_F⊗𝒪_S` Lie/differential condition. Prove the generic-fibre identification, normality/flatness statements used later, and smoothness of the stated locus. At ramified primes the whole integral model is not asserted to be smooth.

Define the ordinary locus intrinsically through the p-divisible group and prove the inclusion and regularity statements needed to place its formal neighbourhoods in the Rapoport locus. Construct its Hasse ideal and its formal blow-up/thickening models. Prove independence of a local lift of the Hasse invariant in the rational domains used downstream.

The construction must accept p=2 and ramified p. The later estimates may be more restrictive in p=2 and p=3. This is different from discarding those primes. Any splitting-model comparison that is used must identify the locus actually consumed; a flag on a ramified integral model is not assumed to split as it does in characteristic zero.

<a id="h3"></a>

### H3. Arithmetic quotient and unit actions

**Dependencies:** H1–H2 and V8.

Define the totally positive unit action on polarizations and calculate the kernel at tame level. In BHW's tame convention construct

\[
\Delta(N)=\mathcal O_F^{\times,+}/((1+N\mathcal O_F)^\times)^2.
\]

Prove finiteness using the unit theorem and prove the quotient comparison giving the arithmetic Hilbert variety for `G`. At other level conventions recompute the kernel instead of reusing this formula unmodified.

Construct the maps associated with changing `𝔠`, and the disjoint union over polarization classes needed for Hecke operators. Compare different lists of ideal representatives using explicit comparison isomorphisms. For the geometric group `G*`, retain the dependence on those identifications when expressing Hecke operators on a fixed list. For the arithmetic group `G`, prove that polarization-class descent removes this ambiguity. A Hecke correspondence can move between polarization components, so the space supported on one component is not automatically stable under the full Hecke algebra.

<a id="h4"></a>

### H4. Finite p-level structures and effective groups

**Dependencies:** H3 and A3.

Define full `G*` p-level, full `G` p-level, and the intermediate full-level moduli problem retaining a `G*` polarization but allowing a general `G`-basis. Construct the two comparison maps and calculate their components through the linearized Weil pairing. The map from the `G*` full-level variety to the arithmetic full-level variety must not simply be called a surjective torsor.

Construct Iwahori and higher `Γ₀(pⁿ)` levels as subgroup-scheme conditions; construct full p-levels as trivializations only on the characteristic-zero generic fibre. Compute the interaction of level action and polarization action, including the adjugate `γ∨=det(γ)γ⁻¹` in the BHW action on `T_pA∨`.

Calculate the ineffective central subgroup at finite level and the resulting `PΓ` groups. Prove the unit-square comparison and eventual stabilization of the finite groups `Δ_n(N)` on connected components. Distinguish them from the profinite group `lim Δ(pⁿN)` acting on the whole tower. This distinction is required for S5 and O4; do not deduce a full-tower finite quotient from a connected-component finite quotient.

<a id="h5"></a>

### H5. Classical geometry and comparison tests

**Dependencies:** H0–H4, C6, B4, and V8 where relevant.

For `F=ℚ`, identify both Hilbert groups with `GL₂` and all moduli/level constructions with the modular-curve counterparts, after matching tame level conventions. For a real quadratic field, compute the domain dimension and the zero-dimensional rational boundary components. Verify that these are not the boundary of a product of two modular curves.

For general `F`, identify the characteristic-zero Hodge bundle after extension to a splitting coefficient field as a sum of the embedding components, and prove descent before imposing that splitting. Check the weight and central-unit conditions for classical algebraic Hilbert forms. Include tests with a nontrivial polarization ideal class and with a ramified prime.

## Completion conditions

Both groups are actual instances of D4, their finite-level varieties are identified with V8, and the geometric/arithmetic quotient is proved with its correct component groups. The models needed near the ordinary locus exist at every rational prime. No universal abelian scheme is claimed on an arbitrary coarse quotient. All auxiliary lattice, ideal, pairing, and root-of-unity choices have comparison theorems.

## Additional strand: Hilbert–Blumenthal varieties and quaternionic Shimura curves for modularity


Construct the geometric automorphic varieties used in KW/Kisin and Taylor's potential-modularity argument, with modular curves as an explicit Q-case. This roadmap is the specialised consumer of a general Shimura-varieties development, not a competing definition of Shimura data.

## Existing material and ownership

Consume R09/R10 for representability and abelian moduli, R16/R17 for automorphic representations and transfer, R05 for formal/adic geometry, and #196 for general cohomology. Shared Shimura data, canonical models, PEL moduli, compactifications and automorphic bundles now have their canonical owners ShimuraData, ShimuraVarieties, PELModuli, ShimuraCompactifications and AutomorphicBundles. R18 constructs the explicitly stated Hilbert/quaternionic specializations and comparison maps, not parallel generic objects.

## Conventions

Record the totally real field, quaternion algebra, ramified places, neatness or stabiliser conditions, level and weight. A definite quaternion algebra yields a finite double-coset set, not a curve. An indefinite algebra used for a Shimura curve is split at the specified real place and ramified at the others. Small-prime stabilisers cannot be suppressed by claiming every level is neat.


<a id="r18-1"></a>

## R18.1. Hilbert–Blumenthal and quaternionic moduli

**Milestone:** `R18.1`

Hilbert moduli and their two group conventions are H0–H4 above. Apply ShimuraData and ShimuraVarieties to a quaternion algebra over a totally real field split at one specified real place, constructing its canonical Shimura curve and complex uniformization. Verify its reflex field, dimension, level and stabilizers. Compare the split rational case with ModularCurvesPartII R12.2. The definite quaternionic case is a finite class set, constructed in R18.3.

**Dependencies:** [HilbertModularVarietiesAndShimuraCurves H4](README.md#h4); [ModularCurvesPartII R12.2](../ModularCurvesPartII/README.md#r12-2); [ShimuraVarieties V8](../ShimuraVarieties/README.md#v8).

<a id="r18-2"></a>

## R18.2. Compactification and integral models

**Milestone:** `R18.2`

For bad-prime integral geometry use Carayol, *Sur la mauvaise réduction des courbes de Shimura*, Compositio 59 (1986), 151–230. This is a different source from his ASENS Galois-representation paper. Keep the selected quaternionic datum, local division algebra, level and descent field in each theorem.

Import the Hilbert compactifications from ShimuraCompactifications C6 and generic automorphic bundles from AutomorphicBundles. Construct the specific quaternionic integral models at good and bad places needed for R18.5; prove extension of Hecke maps, local flatness/regularity and their comparison to the canonical generic fibre. Keep the level and quaternion discriminant in every statement. Compact quaternionic curves carry no Hilbert cusp boundary.

**Dependencies:** [AdicSpacesPartII R2](../AdicSpacesPartII/README.md#r2); [HilbertModularVarietiesAndShimuraCurves R18.1](README.md#r18-1); [ShimuraCompactifications C6](../ShimuraCompactifications/README.md#c6).

<a id="r18-3"></a>

## R18.3. Definite quaternionic forms

**Milestone:** `R18.3`

Define algebraic automorphic forms on the finite double-coset set with their weight module and integral coefficients. Prove finiteness, the Hecke action, change of level and the comparison to the corresponding GL₂ representations. Compute stabilisers and prove freeness over Taylor–Wiles group rings under the actual hypotheses, including KW II's dyadic twisting construction. A finite set of cosets does not by itself make the module free over the required group algebra.

**Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R16.2](../GL2AutomorphicRepresentationsAndTransfer/README.md#r16-2); [HilbertModularVarietiesAndShimuraCurves R18.1](README.md#r18-1).

<a id="r18-4"></a>

## R18.4. Cohomology and Hecke correspondences

**Milestone:** `R18.4`

Construct the étale and Betti cohomology with algebraic local systems, integral Hecke modules, pairings and comparison. Prove the finite-level and degeneracy-map properties used in R19/R22. Include the relationship between definite and indefinite quaternionic realisations supplied by Jacquet–Langlands. Purity/weights come from R34, not from the existence of a trace formula alone.

**Dependencies:** [HilbertModularVarietiesAndShimuraCurves R18.2](README.md#r18-2); [HilbertModularVarietiesAndShimuraCurves R18.3](README.md#r18-3); [WeightsInEtaleCohomology R34.5](../WeightsInEtaleCohomology/README.md#r34-5).

<a id="r18-5"></a>

## R18.5. Bad-prime uniformisation

**Milestone:** `R18.5`

The detailed primary construction is Boutot–Carayol, Astérisque 196–197 (1991), pp.45–158, Parts I–II for the upper half-plane/formal moduli and Drinfeld theorem, and Part III for the arithmetic Shimura uniformization. The downloaded PDF is the full volume; use these printed page/part anchors, not its unrelated other articles. Retain the quaternion algebra ramification place, formal base completion and Frobenius descent datum in the target.

Construct the Drinfeld upper half-plane and the arithmetic quotients needed for Čerednik–Drinfeld uniformisation, including the formal model and descent datum. Prove the actual uniformisation theorem in the Shimura-curve cases used for character groups and level lowering. Identify dual graphs, monodromy pairings and Hecke/degeneracy maps under that comparison. The name of the uniformisation is not an acceptable replacement for its geometric prerequisites.

**Dependencies:** R18.4 (preceding layer).

<a id="r18-6"></a>

## R18.6. The geometric outputs used by modularity

**Milestone:** `R18.6`

Export the exact varieties, integral modules, Galois actions, local systems and stabiliser hypotheses used by KW II §§7–9 and by the Hilbert Galois construction. Export the local moduli interpretation needed in potential modularity. PerfectoidShimuraVarieties consumes this geometry independently of the finite-level modularity proofs.

**Dependencies:** R18.5 (preceding layer).

## Required examples and checks

Recover the Q modular-curve case, compute a definite quaternionic class-set example, and check a one-real-split quaternionic curve with bad-prime uniformisation. Verify the automorphic normalisation at an unramified place in both realisations.



## References

SHIMURA71, CARAYOL86, T_SAITO, FALTINGS_CHAI, KW2. The bibliography records what was inspected and what remains to be transcribed.

<a id="h6"></a>

## H6. Twisted torsion moduli and arithmetic points

For two distinct auxiliary residue characteristics and prescribed Galois modules, construct the simultaneous torsion-level twist of H1 by the actual Isom torsor. Require the determinant/Weil-pairing compatibility and the real signature prescribed by the polarization cone. Identify its base change over a splitting field, descend the selected component and prove geometric irreducibility there; prove nonempty real and finite local open loci by explicit abelian varieties and deformation calculations. Export the smooth quasi-projective scheme, universal family, field of definition, dimension and prescribed local opens to PotentialModularityAndCompatibleSystems R23.1–R23.2. Moret–Bailly does not prove these input hypotheses. This owns source R10.4 and the corresponding moduli portion of R23.2.


## Implementation handoff: Polarization components and local torsion twists

**Stages:** H1, H2, H3, H4, H6, R18.4, R18.5. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

For each polarization module and level, construct the moduli problem, unit action and effective finite or profinite quotient. At ramified p specify the exact local-model/ordinary locus and the map whose flatness or smoothness is proved. H6 constructs simultaneous torsion twists with their pairing multipliers and proves local nonemptiness component by component.

**Acceptance and consumer contract.** Compare F=Q with the modular curve and a ramified Hilbert prime with the modified differential lattice. The quaternionic branch proves its finite-level freeness, Hecke correspondences and Čerednik–Drinfeld comparison with stated discriminant/level, independent of the later modularity theorem. An abelian restriction of scalars uses A6 finite-separable field descent; the universal family alone supplies no flatness theorem for H2.

## Source anchors and prototype coverage

- HilbertModularVarieties source targets.
- HilbertBlumenthalVarietiesAndShimuraCurves source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
