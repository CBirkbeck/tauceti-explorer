# Roadmap: Hodge–Tate theory, canonical subgroups, and automorphic period maps

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and scope

Build the p-adic Hodge-theoretic input for perfectoid Shimura varieties and their automorphic coefficients. There are two ordered parts. T0–T5 supply the concrete abelian/Hilbert route needed by BHW. T6 supplies the logarithmic period-sheaf comparison for general canonical automorphic local systems, and therefore the general toroidal tower's Hodge–Tate morphism. The Hilbert construction does not wait for T6.

Sources are the relative p-adic Hodge theory used by Scholze and Caraiani–Scholze, the canonical-subgroup results of Fargues and Andreatta–Iovita–Pilloni used in BHW, BHW §§2,4,5.4,7, and the general comparison in Boxer–Pilloni §§4.4.38–4.4.40, based on Diao–Lan–Liu–Zhu. The exact small-prime estimates are part of the theorem statements, not implicit “p sufficiently large” assumptions.

## Inputs and conventions

Use A3–A5, R0–R5, PerfectoidSpaces P1–PerfectoidSpaces P9, the models in M/H/C, and B1–B2 where canonical automorphic local systems are used.

For an abelian variety over a complete algebraically closed p-adic field, use the BHW convention

\[
0\longrightarrow\operatorname{Lie}(A^\vee)(1)
\longrightarrow T_pA^\vee\otimes C
\xrightarrow{\mathrm{HT}}\omega_A\longrightarrow0.
\]

The basis trivializes `T_p A∨`. The rank-one quotient yields the point of projective space. This convention makes the pulled-back `𝒪(1)` the Hodge line in the elliptic case. A construction using `T_pA` or lines instead of quotients must first prove the duality/sign comparison.

## Milestones

<a id="t0"></a>

### T0. p-divisible groups and integral differentials

**Dependencies:** A3–A4, formal schemes R2, and C4 for the degeneration charts.

Use the Barsotti–Tate group, duality, and Lie/conormal definitions of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2, and their abelian comparison in A4. Extend that same API to the generic-fibre Tate modules and the integral differential calculations here; do not define a second p-divisible group. Construct the relevant Hodge ideal, invariant under duality where used. Extend the local construction to semi-abelian degeneration charts with the explicit toric/abelian pieces; do not suppose that the p-divisible group of a degenerating family has constant abelian height without accounting for the boundary.

Build the finite-level Hodge–Tate map using Cartier duality and differentials of characters. Prove functoriality, its compatibility with endomorphisms and polarizations, and its passage to the completed p-adic map.

<a id="t1"></a>

### T1. Period rings and relative comparison

**Dependencies:** [AdicEtaleGeometry A1](../AdicEtaleGeometry/README.md); [AutomorphicBundles B1](../AutomorphicBundles/README.md#b1); [ClassicalAdicEtaleCohomology C0](../ClassicalAdicEtaleCohomology/README.md); [HodgeTateAndCanonicalSubgroups T0](README.md#t0); [PadicHodgeTheory P8](../PadicHodgeTheory/README.md#p8); [PadicHodgeTheory R06.5](../PadicHodgeTheory/README.md#r06-5); [PerfectoidSpaces P0](../PerfectoidSpaces/README.md); [PerfectoidSpaces P3](../PerfectoidSpaces/README.md).

Import the period rings, structural period sheaves, relative Poincaré lemma and geometric comparison from PadicHodgeTheory R06.1/R06.5/P8. Apply them to degree-one proper smooth abelian families with connection, filtration and tensor compatibility, and identify the resulting maps with T0. This roadmap owns that abelian/automorphic comparison, not another period-ring construction. The general perfectoid tilting theorem is not itself this comparison theorem.

For the Hodge-type application prove compatibility of Hodge tensors with the comparison maps. The required absolute-Hodge/tensor statement from B1 is a proved dependency, not an assumption that the Hodge conjecture holds.

<a id="t2"></a>

### T2. Hodge–Tate exact sequence and torsors

**Dependencies:** T0–T1, A4, B0–B2.

Prove the displayed Hodge–Tate exact sequence and its relative form on the pro-étale site. Construct the Hodge–Tate parabolic reduction and Levi torsor, compare its Levi torsor with the de Rham/Hodge torsor, and establish Hecke and base-change compatibility. For PEL data prove that the filtration respects endomorphisms and the polarization. For Hodge type prove that the tensor conditions cut out the expected flag variety.

Construct the universal flag-valued map on a tower where the Tate module is trivialized. The map is constructed before asserting perfectoid representability of that tower; S identifies the representing space. Check the elliptic `𝒪(1)` formula and the Hilbert restriction-of-scalars formula without assuming that F splits in the coefficient field.

<a id="t3"></a>

### T3. Canonical subgroups with quantitative bounds

**Dependencies:** T0–T2 and the Hasse neighbourhoods R2/H2/C6.

Prove existence, uniqueness, base change, and isogeny compatibility of canonical subgroups on the Hasse neighbourhoods used by BHW. For the Hilbert application prove that the geometric generic-fibre points of a level-n canonical subgroup form a locally free rank-one `𝒪_F/pⁿ`-module, while its integral finite locally free group scheme has rank `p^(ng)`. Do not identify the integral subgroup with the constant group scheme `𝒪_F/pⁿ`; it can have a multiplicative, non-étale special fibre.

A uniform sufficient radius for the chosen BHW formal construction is `ε≤p^(-(n+1))`. Record the stronger bounds used for the position of the Hodge–Tate filtration separately. Prove the reduction-to-iterated-Frobenius characterization, integral differential estimates, and the effect of division by the canonical subgroup on the Hasse radius. Give independent proofs/references for the p=2 estimates rather than extending a p>2 statement by notation.

<a id="t4"></a>

### T4. Canonical/anticanonical geometry and period estimates

**Dependencies:** T3 and H4.

Define canonical and anticanonical loci by subgroup conditions, construct their finite-level maps, and prove the comparison through Atkin–Lehner with the correct change of radius and level. Define the balls about the integral points of the restriction-of-scalars flag variety and prove the quantitative period-map inclusions.

For BHW Proposition 5.18, the chosen sufficient inequalities are `p^(-m)≤r<1`, `m≥1`, and `ε≤1/(c_p p^m)`, where `c_p=2` for p≥5, `3` for p=3, and `4` for p=2. Prove the canonical and anticanonical image inclusions with those bounds. They are what make evaluation of a locally analytic weight on `cz+d` legitimate. Coordinate calculations after splitting must descend to the original coefficient field.

<a id="t5"></a>

### T5. Igusa trivializations and the modified integral lattice

**Dependencies:** T3–T4, A2, R5/PerfectoidSpaces P9.

Construct the finite Igusa torsors of trivializations of the relevant dual canonical subgroup, and their ordinary inverse tower. Compare them to the full p-level tower through the quotient by the canonical subgroup. A partial Igusa trivialization is not a full Tate-module basis.

Construct the integral differential lattice `ω^int` used in BHW §7 by its finite-level Hodge–Tate image and inverse-image description. Prove its independence from level choices, local freeness over `𝒪_F⊗𝒪⁺`, comparison with the natural formal-model lattice, and the cokernel estimates needed for the analytic weight torsor. In particular, do not replace it by `ω⁺` at ramified primes without a theorem.

Construct the torsor used for the Andreatta–Iovita–Pilloni coefficient sheaf. Prove the comparison of this torsor with the Hodge–Tate trivialization on the anticanonical tower. This is the substantive input to O5's comparison, not a redefinition of one sheaf as the other.

<a id="t6"></a>

### T6. General canonical local systems and logarithmic comparison

T6 has an early site-construction prefix and a later period-comparison suffix. The prefix does not depend on T1, P8, or any geometric p-adic comparison theorem.

<a id="t6-log-sites"></a>
<a id="stage-T6:log-sites"></a>

#### T6:log-sites. Logarithmic adic sites before period sheaves

**Dependencies:** CrystallineCohomology CR.5 for fine saturated log structures, charts, characteristic monoids and saturation; AdicEtaleGeometry A1 for ordinary adic étale sites and presentations; AdicSpacesPartII R4 for smooth adic pairs. No P8 or CohomologyComparisons CP.3 input.

For smooth rigid/adic spaces over a characteristic-zero nonarchimedean field with a strict normal-crossings boundary, construct the associated fine saturated log adic space, its Kummer-étale site, and the pro-Kummer-étale site of Diao–Lan–Liu–Zhu. Define chartwise Kummer maps, the permitted indices, log-étaleness and coverings; prove independence of charts, saturated fibre products, composition and pullback. Keep the corresponding log schemes and analytic log spaces distinct, with an analytification comparison rather than an identification by notation.

Construct the site morphisms to the ordinary étale site, restriction to the boundary complement, inverse-image functors and their sheaf properties. Build local toric Kummer towers with all required roots of unity, control their transition maps and prove the cofinal/local chart statements actually used in the source. Define structural integral/completed sheaves and the log differential complex, with residues and pullback, without asserting the later period-sheaf Poincaré lemma. Log smoothness does not make the underlying morphism ordinarily smooth. Export this geometric package to PrismaticCohomology PR.8; it does not export a logarithmic comparison theorem.

<a id="t6-comparison"></a>
<a id="stage-T6:comparison"></a>

#### T6:comparison. Logarithmic periods and canonical local systems

**Dependencies:** T6:log-sites, T1–T2, PadicHodgeTheory P8:local-rational, CohomologyComparisons CP.3 for the ordinary comparison interface, the general-data instance of B1–B3 (hence V7), C1–C3, R4, DiamondsAndVStacks D4/D6.

On the sites constructed in T6:log-sites, construct the logarithmic structural de Rham period sheaves, their connections and filtrations, and prove the logarithmic Poincaré lemma. Prove logarithmic Riemann–Hilbert and the comparison between the canonical p-adic local system attached to a representation of `Gᶜ` and its canonical filtered de Rham bundle. This includes the regularity, boundary extension, and arithmetic rigidity statements used by Diao–Lan–Liu–Zhu; they are owned here. Ordinary CP.3 is a compatibility input, not a proof of the logarithmic extension.

Derive the Hodge–Tate filtration from the two de Rham lattices, prove its tensor compatibility, and obtain the canonical Levi-torsor identification. Apply this to the toroidal tower in diamonds, giving the general Hodge–Tate map and coefficient pullback statement of Boxer–Pilloni Theorem 4.4.40. This is not an assertion that every such diamond is a perfectoid space, or that the map automatically factors through every minimal compactification.

## Completion conditions

The abelian/Hilbert route works at every rational prime with the explicit permitted radius. Its line-bundle normalization agrees with BHW, including at modular cusps. The general route constructs the logarithmic comparison rather than treating it as an unexplained extension of the abelian case. Any restriction on coefficients, smoothness, boundary, or integral lattices appears in the theorem statement.


## Implementation handoff: Quantitative canonical subgroups and logarithmic sites

**Stages:** T0, T2, T3, T4, T5, T6:log-sites, T6:comparison. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Canonical-subgroup inputs contain p, ramification, height, level and the actual Hasse bound; their outputs contain a finite-flat subgroup, rank, duality and quotient compatibility. T4 combines the period-position inequality with the locally analytic weight radius before evaluating an automorphy factor. T5 constructs the modified integral differential lattice through the finite-level Hodge–Tate map.

**Acceptance and consumer contract.** Test p=2 and p=3 using their distinct constants and a ramified Hilbert coefficient algebra. Verify the Tate-module dual and the quotient-line O(1) convention. T6:log-sites exports chart-independent Kummer sites without a comparison theorem; T6:comparison later proves period-sheaf Poincaré and logarithmic Riemann–Hilbert results with residues and tensor compatibility.

## Source anchors and prototype coverage

- HodgeTateAndCanonicalSubgroups source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
