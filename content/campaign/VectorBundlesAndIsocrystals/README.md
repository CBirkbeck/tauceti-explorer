# Roadmap: isocrystals, vector bundles and Banach–Colmez spaces

Construct the bundle structure theory on the relative Fargues–Fontaine curve and the
linear geometry used in its moduli stacks. Dependencies are
[RelativeFarguesFontaine](../RelativeFarguesFontaine/README.md),
[PerfectoidSpaces](../PerfectoidSpaces/README.md),
[DiamondsAndVStacks](../DiamondsAndVStacks/README.md), and the upstream field,
module and algebraic-curve APIs. Cohomological smoothness conclusions also consume
[DiamondSixOperations](../DiamondSixOperations/README.md). Geometric classification
and relative HN theory do not depend on the later Bun_G sheaf categories.

## VB0. Isocrystals and slope conventions

For E-breve with its q-Frobenius sigma, construct finite-dimensional spaces with a
bijective sigma-semilinear operator, their morphisms, exact tensor category and descent.
Prove the Dieudonné–Manin classification after the stipulated algebraically closed residue
base, including simple objects of rational slope, multiplicities, Hom and endomorphism
division algebras. Use the campaign's Brauer/local-field theory for the invariant and
prove its compatibility with the explicit cyclic algebra; absent such an input, the
cyclic-algebra and Brauer-invariant calculation is an obligation here.

Pin the convention by the standard rank-r block with Frobenius r-th power pi^s sigma^r.
Compute the slope of its associated bundle and record any sign reversal explicitly.
Prove functoriality under coefficient extension, tensor slope addition and dual slope
negation. A classification after algebraic closure is not a classification of all
descent forms over an arbitrary perfectoid field.

## VB1. Vector bundles, descent and cohomology

Define bundles as finite locally free O_X modules on the existing curve; compare with
finite projective modules on annuli and Frobenius descent. Prove rational/pro-étale/v
descent in the exact source scope, effective gluing and preservation of tensor, Hom and
duals. Construct the isocrystal-to-bundle functor and natural comparison under S-base change.

Build degree, rank, slope, saturated subbundles and semistability, including exact-sequence
degree additivity and the behavior of torsion quotients. Construct H^0 and H^1 and prove
higher vanishing for bundles in the stipulated affinoid-relative setting. Compute O(n)
sections and first cohomology with actual Frobenius maps and signs. The curve need not be
proper over an adic field for these formulas; establish them from annular descent.

## VB2. Ampleness, algebraization and geometric classification

<a id="vb2-ampleness"></a>
<a id="stage-VB2:ampleness"></a>
### VB2:ampleness — Positive twists and algebraization

For affinoid perfectoid S prove that sufficiently positive twists of a bundle are globally
generated with higher cohomology zero. Compare bundles and cohomology on X_S and the
Proj curve built in RF3. For S a geometric perfectoid point, prove regular noetherian
dimension-one structure of the schematic curve, its local principal-ideal properties and
the closed-point description under the source's hypotheses. This stage uses RF3 and
VB1, not projectivized-section properness or classification.

<a id="vb2-classification"></a>
<a id="stage-VB2:classification"></a>
### VB2:classification — Geometric points

Prove that every bundle at a geometric point is a direct sum of the stable O(lambda)
and that these stable bundles have the ranks and degrees prescribed by reduced rational
slopes. The isocrystal functor induces the source's bijection on isomorphism classes;
it is not asserted fully faithful onto all bundle morphisms. Prove Hom/Ext vanishing,
extension and uniqueness properties needed for HN filtrations and moduli charts.

## VB3. Banach–Colmez geometry without circular classification

<a id="vb3-positive-basic-examples"></a>
<a id="stage-VB3:positive-basic-examples"></a>
### VB3:positive-basic-examples — The independent local calculation

Construct the sheaf of sections T ↦ H^0(X_T,E_T), beginning with the explicit positive
line-bundle and Lubin–Tate universal-cover calculations used in the proof of VB2.
Prove diamond representability, local spatiality and exact-sequence behavior by those
calculations and v-descent. Negative H^1 spaces have their separate construction.
Use FS II.2.1's Lubin–Tate calculation and II.2.15's endomorphism analysis as the
positive/basic input to VB2:classification, alongside VB2:ampleness and the Hom/Ext
calculations. Do not use classification to prove its own positive-section input.

<a id="vb3-projectivized-properness"></a>
<a id="stage-VB3:projectivized-properness"></a>
### VB3:projectivized-properness — The input to families

Prove II.2.16's properness of `(BC(E)\{0})/E×` using II.2.6 ampleness and
II.2.5(iii); the properness proof is independent of geometric classification. Its
consumer is VB4's relative HN/nowhere-vanishing-section argument (II.2.19), not
VB2:classification. Keep these two branches distinct in the stage graph.

<a id="vb3-general-bc"></a>
<a id="stage-VB3:general-BC"></a>
### VB3:general-BC — General bundles after classification

For the positive-slope range prove dimension and cohomological smoothness; for degree-zero
pieces identify the locally profinite E-vector-space behavior. Construct projectivization
with scalar action and prove the properness and v-cover properties used to produce
nowhere-zero sections. State the slope bounds in perfectoid-open-ball identifications;
not every Banach–Colmez space is representable by a perfectoid space.

## VB4. Families and HN strata

Inputs: VB2:classification, VB3:projectivized-properness and VB1. The construction
of nowhere-vanishing sections after a v-cover uses the **proper** projectivized
section space; neither a pointwise classification nor mere surjectivity supplies it.

Construct the geometric HN polygon of E_s, prove its semicontinuity with the source's
dominance convention, and prove existence of the relative HN filtration on constant-polygon
loci. Show that constant-slope pieces become sums of O(lambda) pro-étale locally under
the precise source assumptions. Prove the equivalence between everywhere slope-zero
bundles and pro-étale E-local systems, with tensor and scalar-extension compatibility.
Keep local systems distinct from trivial constant bundles; the descent datum is essential.

## Acceptance and sources

Tests include O(-1), O, O(1), a rank-two unequal-slope sum, a nontrivial extension, a
varying HN family, and a slope-zero local system with nontrivial monodromy. Check the
isocrystal/bundle sign, tensor slopes, local-system descent and non-full-faithfulness
restriction. Source: FS
II.2–II.3, especially II.2.6, II.2.14, II.2.16 and II.2.19;
KL15 §§6–8;
Fargues–Fontaine, chapters on
isocrystals, the curve and vector bundles. Lubin–Tate inputs reuse local class field
theory; universal-cover geometry and its comparison are explicit tasks here.

## Completion contracts added on 2026-09-15

**Applies to:** `VB0`, `VB1`, `VB2:classification`, `VB3:positive-basic-examples`, `VB4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Prove the rank-one/positive-section input to geometric classification independently, then follow rank induction and the minimal twist argument. Record the failure of full faithfulness: isocrystal morphisms preserve Frobenius whereas bundle morphisms include the curve's section spaces. In families descend the HN filtration only on the loci where the polygon is constant, and retain nontrivial local-system descent for slope zero.

### Producer–consumer contract

Slope is degree divided by positive rank; the zero bundle is handled separately. The representative seed now enforces positive rank instead of letting field division silently give slope zero at rank zero. Export Hom/Ext and base-change maps in their precise geometric or relative scope.

### Acceptance and source route

O(−1), O, O(1), an unequal-slope extension and a slope-zero local system with nontrivial monodromy test the distinction between geometric splitting and global triviality.

**Source route:** FS II.2.14 and its proof, II.2.15–19; KL15 relative slope theory. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
