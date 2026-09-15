# Roadmap: geometric Satake over the Fargues–Fontaine curve

Construct the relative mixed/equal characteristic affine Grassmannian, its Satake
category, convolution and fusion, and the pinned dual-group identification for every
connected reductive E-group G. Dependencies:
[RelativeFarguesFontaine](../RelativeFarguesFontaine/README.md),
[BunGAndNewtonStrata](../BunGAndNewtonStrata/README.md),
[VStackSheavesAndLisseCategories](../VStackSheavesAndLisseCategories/README.md),
[ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md),
[EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md), and
[EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md).
Use [shared conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md). Torsion and integral coefficients
have ell != p; include a square root of q wherever the normalized Satake equivalence
uses half Tate twists. Rational results and integral extension are distinct theorems.

## GS0. Beilinson–Drinfeld Grassmannians and loop groups

<a id="gs0-loop-geometry"></a>
<a id="stage-GS0:loop-geometry"></a>
### GS0:loop-geometry — Integral divisors and bounded modifications

Inputs: RF0:integral-Y, RF2:integral-divisors, RF4:G-torsors, BG0 and RG2.3/RG2.5.
Begin over `Div^d_𝒴`, with a **split reductive O_E-model** after the stipulated
splitting extension, and B_D^+⊂B_D from RF2. Construct `L+G`, `LG`, the étale
quotient `LG/L+G` and double quotient local Hecke stack; prove the torsor interpretation
and descent of finite projective modules on the completed divisor rings. Treat arbitrary
G/E by descent on the generic Y/X side; do not assert that a ramified group has a
reductive integral model over O_E. FS VI.1.5–VI.1.10 supplies the exact local construction.

For a finite set I construct ordered leg divisors on Div^1, formal neighborhoods,
positive/full loop groups and the relative Grassmannian of a G-bundle with trivialization
off those divisors. Prove that the torsor-modification and loop-quotient descriptions
agree by Beauville–Laszlo gluing. Establish v-sheaf representability, local spatiality
where asserted, changes of trivialization and base change in legs.

Define bounded relative position geometrically using dominant cocharacters after the
appropriate splitting base change, prove descent under the pinned Galois action, and
construct Schubert cells/closures. Prove properness of bounded Schubert diamonds, dimension
<2rho,mu>, closure relations and compatibility under finite extension of E. Provide the
affine flag and Demazure-resolution ingredients needed in the proof, with parahoric
models supplied by ReductiveGroupsPartII.

<a id="gs0-schubert-smoothness"></a>
<a id="stage-GS0:Schubert-smoothness"></a>
### GS0:Schubert-smoothness — Early geometric return to Bun_G

Construct truncated positive loop groups and their congruence filtration by vector-group
quotients; prove cohomological smoothness and that the action on each bounded locus
factors through a finite truncation. Identify a Schubert cell by its parabolic flag
base and positive-loop unipotent fibres. Prove FS VI.2.4/IV.1.18: over a splitting
field the open cell Gr_(G,μ) is ℓ-cohomologically smooth of ℓ-dimension <2rho,μ>,
ℓ≠p; descend the Galois-orbit cells. Also prove VI.2.8's explicit congruence bound
from weights of μ on Lie G. Supply this stage to BG2:smooth-Artin **before** Satake.
Inputs: GS0:loop-geometry, DiamondSixOperations S4–S5 and RG2.3, not VS4,
GS1–GS4, EDC.7 or DWP.9.

<a id="gs0-witt-geometry"></a>
<a id="stage-GS0:Witt-geometry"></a>
### GS0:Witt-geometry — Projectivity and the special-fibre comparison

On perfect residue algebras define the Witt-vector lattice functor and its bounded
subfunctors. Construct the perfectly finitely presented Grassmannian/flag spaces,
their Demazure resolutions, connected proper fibres and relative-position strata.
Use Zhu §§1.1–1.4 and Appendix A for the perfect-space carrier and its relation to
finite-type models; a perfect scheme need not itself be finite type. Reuse RF0's
ramified Witt algebra rather than a second coefficient ring.

Prove the Bhatt–Scholze projectivity theorem, not just its name: construct h/v-descent
for vector bundles on perfect schemes (BS17 §§2–4); use the **geometric** determinant
line construction on a Demazure resolution and the trivial-on-geometric-fibres descent
criterion (BS17 §6, especially 6.8/6.12); prove its positivity/ampleness by the
semiampleness criterion used in BS17 §§7–8. The required Keel positive-characteristic
criterion is a sub-obligation here: construct the exceptional locus of a nef line
bundle, its restriction criterion, Frobenius-power extension/descent of sections, and
the reduction yielding semiampleness; verify the positivity assumptions before the
projectivity conclusion. This route does not import the optional K-theoretic determinant
construction of BS17 §5 or assume a completed K-theory campaign.

Construct the v-sheaf associated to these perfections and identify it with the fibre
of GS0:loop-geometry over the characteristic-p point of Div^1_𝒴. Prove the integral
family and bounded properness using Berkeley §§19.2–19.3, §§20.3–20.5 and Lecture 21,
including the actual comparison maps on lattice functors. This stage owns the
projectivity/ample-line inputs to FS VI.3.7; they were not absent obligations, but
previously lacked the proof route. No scheme decomposition theorem is needed yet.

## GS1. Semi-infinite geometry and constructibility

Inputs: GS0's three substages, VS0–VS1, and EDC.4–EDC.5 **early** scheme
perversity/recollement. These imports are not EDC.7.

Construct positive-loop equivariance, orbit stratifications, semi-infinite orbits and
their intersections with Schubert strata. Prove dimension estimates, finiteness needed
for compact-support cohomology and hyperbolic-localization comparisons. Stabilizer and
unipotent quotient invariance must carry their exact prime-to-p coefficient hypotheses.

Construct the relative perverse t-structure on bounded constructible complexes, with
the stalk/costalk dimension inequalities and gluing across finite Schubert stratifications.
Import the ordinary scheme perverse/recollement foundation from
[EtaleDualityAndPerverseSheaves EDC.4–EDC.5](../EtaleDualityAndPerverseSheaves/README.md#edc-4)
(also reexported by EndoscopicTransferAndUnitaryTraceComparison ET.2a).
This stage owns its relative/diamond extension and the comparison on scheme-valued
charts; it does not reconstruct BBD's scheme category or use the later Hitchin
fundamental-lemma branch.
Prove its compatibility with change of legs, ULA and equivariant descent. In integral
coefficients distinguish flat perverse objects from arbitrary perverse objects; do not
use characteristic-zero semisimplicity to remove torsion extensions.

Construct the one-leg special/generic-fibre comparison on the ULA, flat-perverse
categories over Spd(O_C), Spd(C) and Spd(k̄), after choosing the split integral model.
Prove full faithfulness and essential surjectivity using the stratified local-constancy
criterion and Demazure resolutions in FS VI.5–VI.7. Transport through perfection using
étale-topos invariance and checked finite-type models; transport through the integral
family using these ULA comparison functors. A formal analogy between Witt and B_dR
Grassmannians is not that equivalence. Keep the comparison compatible with finite
Schubert bounds, convolution diagrams and change of coefficients.

## GS2. Satake objects and convolution

Inputs: GS1 and DiamondSixOperations S1–S4, with VS0's stack extension where required.

<a id="gs2-correspondences"></a>
<a id="stage-GS2:correspondences"></a>
### GS2:correspondences — Objects and convolution before t-exactness

Define Satake objects by the equivariance, relative perversity, ULA and coefficient
flatness conditions of FS VI.6–VI.8. Construct convolution diagrams, the convolution
map and operation in the ambient bounded-support derived category via actual
proper-support pushforward. Prove ambient associativity and unit with coherent maps.

<a id="gs2-satake-closure"></a>
<a id="stage-GS2:Satake-closure"></a>
### GS2:Satake-closure — Closure after fusion

Using GS3:fusion and the semi-infinite/hyperbolic-localization estimates, prove
perversity, flatness and ULA preservation, thereby restricting the operation to Satake
objects. This return is after GS3's geometric fusion construction, as in FS VI.8–VI.9;
GS3 does not assume the completed closure theorem. Retain coefficient-flatness to
exclude the Tor obstruction to t-exactness. Representation comparison is GS4's result.

## GS3. Fusion, symmetry and finite-set functoriality

<a id="gs3-fusion"></a>
<a id="stage-GS3:fusion"></a>
### GS3:fusion — Coherent collision and factorization maps

Inputs: GS1 and GS2:correspondences, RF2's divisor addition and VS1's ULA/hyperbolic-localization/Drinfeld
interfaces; no characteristic-zero semisimplicity is used in constructing fusion.

Over disjoint-leg loci prove factorization into products of single-leg Grassmannians.
Construct fusion by the source's ULA extension along collision diagonals, prove uniqueness
and compatibility with repeated collisions, and obtain the commutativity constraint.
Verify the Koszul/sign and half-Tate normalization so that the cohomology fibre functor
is symmetric monoidal with the chosen dual group, not a super variant by accident.

Export coCartesian finite-set functoriality: permutations, maps I → J, disjoint unions,
diagonal pullback and unit insertion with all composition laws. Pairwise isomorphisms
for two legs do not suffice for the coherent family needed by excursion operators.

## GS4. Tannakian reconstruction and the Weil action

<a id="gs4-rational-reductivity"></a>
<a id="stage-GS4:rational-reductivity"></a>
### GS4:rational-reductivity — The late decomposition-theorem input

Inputs: GS1's integral-family comparison, GS3, and
[EtaleDualityAndPerverseSheaves EDC.7](../EtaleDualityAndPerverseSheaves/README.md#edc-7).
Apply EDC.7 only to the finite-type proper models/resolutions of bounded Witt Schubert
spaces over an algebraic closure of a finite field, then transport through perfection
and the comparison above. Prove geometric semisimplicity of the rational Satake category
using the decomposition theorem and the orbit/IC calculation, hence reductivity of the
generic fibre of the Tannakian group. EDC.7's DWP.9 hard-Lefschetz input is a genuine
late dependency. Neither a mod-ℓ nor an integral decomposition/semisimplicity theorem
is asserted. This return must never be routed into GS0:Schubert-smoothness, BG2 or
the proof of EDC.7 itself.

<a id="gs4-integral-dual-group"></a>
<a id="stage-GS4:integral-dual-group"></a>
### GS4:integral-dual-group — Reconstruction and normalized functoriality

Construct the total cohomology fibre functor, prove exactness, faithfulness, tensor
compatibility and duals in the precise integral category, and reconstruct its affine
group scheme. Identify the maximal torus and root datum via weight functors, rank-one
calculations and simple reflections, then identify the group with the pinned dual.
Prove descent for nonsplit G and distinguish the geometric Weil action from the standard
pinned action, with the normalization isomorphism involving rho and the chosen sqrt(q).
Implement FS VI.9–VI.11's passage from Z/ℓ^n to Z_ℓ, then its integral recovery
from torus/rank-one Levi maps and the maximal-compact-generation argument (RG2.2–RG2.4).
Rational reductivity alone does not identify the integral group scheme. Prove naturality
for Levi restriction/constant term, products, maps inducing isomorphisms on adjoint
groups and Weil restriction: HS4/ES6–ES7 require these maps, not only an equivalence
for each G separately. The integral Satake theorem has ℓ≠p, not the later spectral
action's dual-fundamental-group exclusion.

Construct the Chevalley involution and prove its compatibility with Verdier duality,
inversion of modifications and representation duals. Export the Satake equivalence for
the finite-projective representation category and the enhanced perfect-complex closure
actually used by Hecke functors; no larger coefficient/category equivalence is inferred.

<a id="gs4-classical-satake-comparison"></a>
<a id="stage-GS4:classical-Satake-comparison"></a>
### GS4:classical-Satake-comparison — A downstream comparison, not an input

For the unramified/hyperspecial finite-residue-field cases, compare the Frobenius trace
of a Satake object on its finite-type special-fibre model with the spherical Hecke
function. Prove convolution/trace and constant-term compatibilities, checking Haar
volume of the hyperspecial subgroup, geometric Frobenius, q^(<rho,μ>) and the chosen
half twist. Import the already constructed classical Satake transform from
SmoothRepresentationsOfLocalGroups SR.4. This comparison follows both constructions;
neither owner's theorem uses it as a prerequisite.

## Acceptance and sources

Test G_m, GL_2 minuscule Schubert varieties, a nonminuscule bound, a nonsplit torus,
two colliding legs, and integral coefficients with nonsemisimple reduction. Check fibre
functor ranks/weights, convolution versus tensor, permutation signs and Weil normalization.
All tests retain ell != p. The later integral spectral action additionally requires
ell not dividing |pi_1(dual G)_tors|; Satake alone does not prove that action.

Primary source: FS
VI.1–VI.12; Bhatt–Scholze
§§2–4/6–8 and Theorems 1.1–1.3; Zhu
§§1–2 and Appendix A; Berkeley
Lectures 19–21. Zhu's independent commutativity proof is not silently imported instead
of FS fusion, nor are its inputs to equal-characteristic Satake made circular here.
The needed relative ULA and localization are FS IV.2 and IV.6. This scope includes
the Schubert/flag geometry and Tannakian proof used there, not a theorem that presupposes
an unspecified geometric Satake equivalence.

## Completion contracts added on 2026-09-15

**Applies to:** `GS0:loop-geometry`, `GS0:Schubert-smoothness`, `GS0:Witt-geometry`, `GS2:Satake-closure`, `GS3:fusion`, `GS4:integral-dual-group`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For each bound construct finite truncations of the positive loop action and prove the congruence-depth estimate from the weights of the cocharacter on Lie G. Separate this early cell calculation from rational semisimplicity. During integral reconstruction prove that weight functors and rank-one Levi restrictions determine the integral group scheme; generic-fiber reductivity alone is insufficient. For collision maps prove coherence for three legs and two different successive diagonal factorizations.

### Producer–consumer contract

Export normalized symmetric monoidal Satake with coefficient flatness, sqrt(q), and geometric/pinned Weil-action comparison. The Witt special fiber is obtained from the integral period family; a characteristic-zero B_dR Grassmannian alone omits it. Classical Satake compatibility is a downstream theorem.

### Acceptance and source route

G_m, a GL_2 minuscule orbit, a nonminuscule Schubert bound, coincident legs and nonsemisimple mod-ℓ reduction. Check all shifts and half-Tate signs on the same weight functor.

**Source route:** FS VI.1–VI.12; Bhatt–Scholze Witt Grassmannian §§6–8; ECD §24. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
