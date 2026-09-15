# Roadmap: overconvergent Hilbert modular forms and p-adic automorphic coefficients

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and endpoint

Construct p-adic automorphic coefficient sheaves from analytic characters/representations and Hodge–Tate torsors, and carry out a full worked application to the overconvergent Hilbert modular forms of Birkbeck–Heuer–Williams. Include geometric and arithmetic groups, families, integral coefficients, Hecke actions, cuspidality, and comparison with the Andreatta–Iovita–Pilloni construction. Relate the ordinary restriction to the Igusa-tower definition of Hida-style p-adic forms.

The general definitions are not limited to a scalar `cz+d` formula. They use an analytic action and a genuine cocycle with coefficients, allowing vector-valued automorphic forms. Theorems about an ordinary neighbourhood, a canonical subgroup, or locally free descent are proved for their stated geometric instances; they are not assumed for every reductive group at every prime.

References: BHW §§3–4 and 6–10; Andreatta–Iovita–Pilloni as cited there; Hida's *p-Adic Automorphic Forms on Reductive Groups*, especially §§2,7,9–10; and the coefficient/torsor portions of Boxer–Pilloni. Eigenvarieties, general finite-slope classicality, and higher Coleman cohomology are not endpoints of this roadmap. Its output is the forms and their operators on which such a successor would build.

## Inputs and conventions

Consume B, H, R5, PerfectoidSpaces P9, T0–T5, and S5. General toroidal coefficients also consume T6/S6 when needed. Fix a rational prime p, but do not assume it unramified in F. Put `𝒪_p=𝒪_F⊗ℤ_p=∏_{𝔭|p}𝒪_{F_𝔭}`. Embeddings at infinity and p-adic embeddings are separate finite types; a comparison requires an actual choice of coefficient embeddings.

Let U be a smooth rigid parameter space with a bounded weight map. For a single weight take a point. The product with the perfectoid tower is formed in the sousperfectoid setting from R5. Integral statements use an explicitly specified integral coefficient sheaf. Base change of a sheaf is distinguished from base change of its global sections.

## Milestones

<a id="o0"></a>

### O0. Weight spaces and locally analytic representations

**Dependencies:** R0–R5, p-adic analysis, and complete topological algebra.

Import rigid character spaces, universal characters and Iwasawa charts from PadicMeasuresIwasawaAlgebras L0a. This is an early coefficient-space dependency, not a dependency on the later eigenvariety or a Galois family. Specialize them to the geometric/arithmetic Hilbert tori, proving the bounded-family restriction and extension to the neighborhoods required by the Hodge–Tate cocycle. Prove a radius of analyticity locally uniformly in U using LocallyAnalyticDistributions.

For Hilbert weights construct the geometric space of characters of `𝒪_pˣ` and the arithmetic space of characters of `𝒪_pˣ×ℤ_pˣ`. Pin the BHW character formula `κ=w²·(t⁻¹∘Nm)` and supply the corresponding dual group map with inversion on the second coordinate. The dated source note §E.3 records the convention issue in the displayed description in §6.1. It is not resolved by silently changing a sign.

Define finite-rank analytic coefficient modules and locally analytic induced modules on compact open pieces of Levi/parabolic groups. Prove compatibility with tensor products, duals where appropriate, and specialization to algebraic representations. Do not call an arbitrary continuous character algebraic.

<a id="o1"></a>

### O1. Equivariant sheaves from cocycles

**Dependencies:** O0, B0, R5/PerfectoidSpaces P9.

Given an actual torsor/group action and an analytic automorphy cocycle, construct the equivariant coefficient sheaf as an equalizer in the appropriate sheaf category. Prove its sheaf property, pullback, functoriality, and independence of local trivialization. Prove local freeness/coherence only with the needed descent hypotheses. The construction must handle a nontrivial coefficient representation, not only characters.

Record left/right conventions once and prove the cocycle law in that convention. A structure storing a function `j` without its law, or a record requiring the desired descended bundle as input, is not this construction.

<a id="o2"></a>

### O2. Hilbert automorphy factors and domains

**Dependencies:** O0–O1, T4, S5.

On the anticanonical Hilbert tower use the coordinate from the Hodge–Tate map and prove that `κ(cz+d)` is an invertible analytic function on the permitted domain. Choose the radius from T4 and O0 together; it depends on the weight family. The geometric transformation rule is

\[
\gamma^*f=\kappa(cz+d)^{-1}f.
\]

For the arithmetic group include the determinant factor `w(det γ)` in the BHW convention. Prove that the factor descends through the effective `PΓ` action, using H4's calculation, rather than assuming a central element acts trivially on coefficients.

Construct the finite-level geometric sheaves using O1, and prove the change-of-level and change-of-radius maps. Include radius zero as the ordinary object, but define overconvergence by extension to a permitted **positive** radius. Sections only over the ordinary locus do not constitute the overconvergent space.

<a id="o3"></a>

### O3. Integral coefficients and variation in weight

**Dependencies:** O2 and T5.

Construct the integral coefficient sheaf from the integral cocycle and the modified lattice/weight torsor, prove local freeness, and identify its rationalization with O2. Prove compatibility with bounded smooth families and their pullbacks. Include a ramified-p calculation showing precisely where `ω^int` enters.

Construct the space of sections at a fixed radius and the direct system under restriction to smaller neighbourhoods of the ordinary locus. Define the overconvergent space as its colimit over positive permitted radii, and define its integral counterpart with the indicated coefficient lattices. Establish topologies and continuity of restriction/operator maps where those are claimed. A claim that every such module is finite projective over the weight algebra would be false in this generality and is not made.

<a id="o4"></a>

### O4. Arithmetic descent and polarization classes

**Dependencies:** O3, H3–H4, S5.

Construct arithmetic sheaves through both the effective full-level action and descent along the geometric-to-arithmetic polarization quotient. Prove the equality of the resulting sheaves by explicit isomorphisms, retaining their coefficient actions. Form the spaces over the polarization-class collection needed for the Hecke action. For `G*`, record the comparison choices and their effect on operators; for `G`, prove the canonical independence after polarization descent, as required by BHW Remark 10.6.

Distinguish the four finite/infinite-level presentations used in BHW §9. Prove their comparison rather than making them abbreviations for a common unknown object. The ordinary/full-level profinite groups and the finite connected-component groups from H4 must occur in their correct statements.

<a id="o5"></a>

### O5. Independent AIP construction and comparison

**Dependencies:** O3–O4, T5.

Construct the AIP coefficient sheaf from its torsor of modified differential trivializations. Define its integral and rational versions independently of the perfectoid definition. Use T5's torsor comparison to construct the sheaf isomorphism. Prove the results corresponding to BHW Theorems 7.14 and 9.12, with the radii, levels, families, and coefficient conditions in those statements. The arithmetic comparison descends through the polarization action.

Verify the theorem on a trivializing cover, glue it, and establish uniqueness with the chosen tautological section. Prove compatibility with change of level, weight, and radius. A comparison of dimensions or only of global sections at one classical weight does not meet this endpoint.

<a id="o6"></a>

### O6. Boundary, cusp forms, and Hecke operators

**Dependencies:** O5, C6, B5, R3.

Define cusp forms by the subcanonical coefficient/boundary ideal and prove compatibility with the classical and AIP definitions. In degree one use the compactified cusp calculation; in higher Hilbert degree use the proved Koecher statement, without confusing extension with vanishing.

Construct tame Hecke and diamond operators and the p-level correspondences, including the operators at primes `𝔭|p`. Define them as pullback, coefficient identification, and trace. Prove the domain/radius changes and all normalizing factors. Establish the Hecke compatibility of O5, corresponding to BHW §10, and compare q-expansions with B5. Do not assert compactness of every individual `U_𝔭`. At finite wild level and a fixed bounded affinoid weight family, also construct the Banach-module topology, prove the compact restriction theorem for the relevant nested affinoid neighbourhoods, and deduce complete continuity of the controlling operator `U_p=∏_{𝔭|p}U_𝔭^{e_𝔭}`, where `e_𝔭=v_𝔭(p)`. Match the domain and normalization used in BHW §10.3 and its AIP comparison. Prove the renormalization required to preserve an integral lattice; tame integral preservation alone does not give it for `U_p`. Slope decomposition and eigenvariety construction remain distinct theorems outside this roadmap.

<a id="o7"></a>

### O7. Ordinary Igusa forms and the Hida comparison

**Dependencies:** O3–O6 and T5.

Define ordinary p-adic forms on the Igusa tower by completed functions/sections with their weight action. In a finite-level description, construct the direct limit in Igusa level modulo `p^m` and then the inverse limit in m, proving the comparison with the completed structural sheaf. Pin these limit orders; they are not exchanged without a theorem.

Construct restriction of an overconvergent form to the ordinary locus and its Igusa description, and prove compatibility with weights, q-expansions, and Hecke actions. Ordinary Hida forms and finite-slope overconvergent forms are not identified as entire spaces. Hida's ordinary-projector/control theorems require additional hypotheses and are not claimed merely from this coefficient comparison.

<a id="o8"></a>

### O8. Examples beyond Hilbert

**Dependencies:** O0–O1, B4, S1–S3, and the relevant ordinary/canonical-subgroup geometry from T3.

Instantiate the general coefficient construction on Siegel varieties of arbitrary genus on the proven anticanonical domains. For scalar determinant weights derive the automorphy factor from the tautological Hodge torsor, and compare algebraic specializations with powers of the determinant Hodge bundle. For algebraic Levi representations, recover the vector-valued bundles of B4. This proves that the public construction is not intrinsically rank-two.

The same coefficient formalism accepts unitary and other datum-specific domains when their analytic reduction is supplied; no theorem asserting an ordinary canonical-subgroup neighbourhood for every Shimura datum is included. General toroidal diamond coefficients can be constructed through S6 without a claim of global perfectoid representability or classicality.

## Completion conditions

For every totally real F and every rational p, the Hilbert construction yields geometric/arithmetic overconvergent sheaves in bounded smooth families, integral versions, cusp forms, and Hecke-compatible comparison with AIP. The F=ℚ specialization agrees with the modular-curve construction after matching weight and determinant conventions. The Siegel example uses the same cocycle/representation machinery. No eigenvariety or general finite-slope theorem is silently bundled into “define p-adic automorphic forms”.


## Implementation handoff: Weight radii, independent sheaves and controlling operators

**Stages:** O0, O1, O2, O3, O5, O6, O7. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Given a bounded weight family, construct a common analytic radius on which the inverse cz+d factor is defined and satisfies the cocycle law. Build the perfectoid and AIP sheaves independently, then compare their torsors and descend through the effective polarization action. Positive-radius overconvergence and ordinary-locus sections have separate definitions.

**Acceptance and consumer contract.** Verify integral lattice compatibility at ramified p, all change-of-radius maps, cusp boundary conditions and Hecke factors. Complete continuity is proved for the stated controlling product of U_𝔭 operators on actual Banach modules; it is not automatic for each factor. The handoff to PadicFamilies L2a contains the compact operator, affinoid base-change links and slope data needed by generic eigenvariety gluing.

## Source anchors and prototype coverage

- OverconvergentAutomorphicForms source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
