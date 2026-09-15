# Roadmap: Hecke correspondences and local shtuka cohomology

Construct reusable modification correspondences and their coefficient functors, including
bounded local shtuka spaces and their commuting actions. Dependencies:
[RelativeFarguesFontaine](../RelativeFarguesFontaine/README.md),
[BunGAndNewtonStrata](../BunGAndNewtonStrata/README.md),
[GeometricSatakeAndFusion](../GeometricSatakeAndFusion/README.md),
[VStackSheavesAndLisseCategories](../VStackSheavesAndLisseCategories/README.md),
[SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md),
and [ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md).
Work with connected reductive G/E, ell != p and the chosen sqrt(q) normalization.

## HS0. Global and local Hecke stacks

Inputs: RF2:integral-divisors/RF2:untilts, RF4:G-torsors, BG2:uniformization and
GS0:loop-geometry/GS0:Schubert-smoothness. The correspondence does not require completed
Satake. For integral-family bounded properness import GS0:Witt-geometry's exact statement.

For a finite leg set I, define the stack of two G-bundles and an isomorphism away from
the selected divisors. Construct its source, target and leg maps, diagonal/repetition
maps, and bounded substacks for tuples of dominant cocharacters. Prove descent,
representability of relative fibres by the bounded Grassmannian and the compactifiability,
properness or dimension bounds needed for each pushforward. Global source/target maps
between stacks are not declared representable merely because individual fibres are.

Construct chains of modifications and identify composition over disjoint legs and over
collisions with the convolution diagrams. Prove compatibility with extension of structure
group, central characters and inner forms where those constructions are defined.

## HS1. Kernels and the coherent Hecke action

Inputs: HS0, GS2:Satake-closure, GS3:fusion, GS4:integral-dual-group, VS1's Drinfeld
lemma, VS2–VS3's dualizable solid/lisse kernels, VS4's compact generators and
E5:abstract. This requires completed GS4, not just GS2's convolution. Work over a
Z_ell[sqrt(q)]-algebra as interpreted in VS3, ℓ≠p; this Hecke theorem does not impose
the integral spectral-action fundamental-group restriction.

Pull the Satake sheaf attached to a finite projective representation V of the appropriate
dual L-group to the Hecke stack and define T_V by the actual pull-tensor-push construction.
First establish the geometric hypotheses for that correspondence; use the partial-support
or relative-homology operation specified by FS IX.2 when the naive ECD lower shriek
is unavailable. Show that the kernel lies in the required dualizable/ULA category.

Prove preservation of D_lis, compact objects and ULA objects in the source's range,
scalar-extension compatibility, T_unit = identity, tensor/convolution composition and
fusion across arbitrary finite sets. Construct the continuous W_E^I action through
Drinfeld's lemma and the condensed enriched functor category; a discrete abstract
action without continuity is insufficient for parameter stacks.

## HS2. Local shtuka moduli and bounds

Inputs: HS0, BG3 and RF4:G-torsors, with GS0's bounded fibres. Classifying-stack
cohomology/compact generation is not required merely to define these moduli.

For b,b' in B(G) and a bounded tuple of modifications, define the local shtuka functor
as the fibre of the Hecke correspondence over E_b,E_b', retaining trivializations and
their J_b(E) and J_b'(E) actions. Define compact-open level quotients and the transition
maps; prove diamond representability/local spatiality and the boundedness conditions
needed for compactly supported cohomology. Include minuscule and nonminuscule bounds;
do not restrict general local shtukas to classical Rapoport–Zink spaces.

Construct descent to the reflex field of the bound and the resulting Weil action.
Identify the tower as an inverse limit of level sheaves only after its cofinality and
descent properties have been proved. Match the Hecke-fibre description with known local
Shimura moduli in examples, but that comparison is not a definition for all groups.

## HS3. Cohomology as a representation-valued functor

Inputs: HS1–HS2, VS4–VS5 and SmoothRepresentationsOfLocalGroups SR.0–SR.2.
Source IX.3.1's integral pro-p-level compactness is separate from characteristic-zero
classical tower-realization identities (ET.6a/ES7).

Define compactly supported complexes with Satake coefficients at finite level and the
colimit over levels, with commuting J_b(E), J_b'(E) and Weil actions. Specify coefficient
completion/localization before taking limits. Prove compatibility with the Hecke functor
on strata using the actual fibre/base-change map and the smooth-representation comparison.

Prove the source's finiteness, compactness and admissibility statements using compact
Hecke kernels and the pro-p compact-induction generators. Distinguish a perfect invariant
complex at a level from finite-dimensionality of the entire infinite-level cohomology.
Construct duality, level-change trace/pullback and adjunction compatibilities; a trace
divided by an index requires that index invertible in coefficients.

## HS4. Reusable compatibility library

Inputs: HS1, GS3:fusion and GS4:integral-dual-group, using VS2's enriched operations.
Group-map and Levi compatibility compares these exact Satake kernels; only the
geometry of IX.6's diagrams belongs here. The parameter identities themselves are ES6–ES7.

Prove permutation, creation/annihilation of a pair of dual legs, coevaluation/evaluation
identities, iterated modification compatibility and fusion along every finite-set map.
These natural transformations are the input for excursion operators; no parameter is
introduced by choosing simultaneous eigenvalues at this stage. Export continuous
Weil actions and tensor-generator compatibility to ES1:finite-ramification, the
canonical owner of IX.5.1's uniform wild subgroup for each compact object. This
transferred theorem is not assumed in the construction of the Hecke family.

## Acceptance and sources

Tests: trivial modification, a one-leg torus modification, GL_n minuscule local Shimura
space, a nonminuscule bound, two-leg fusion, and change between two pro-p compact levels.
Verify commuting group/Weil actions and the duality/normalization signs. All coefficient
tests require ell != p; tests for the integral spectral-action consumer also require
ell not dividing |pi_1(dual G)_tors|. No full local Langlands classification is an
acceptance condition.

Source: FS VI.1, VI.8–VI.12,
VII.5, IX.1–IX.3 and the reusable compatibilities in IX.6;
Berkeley, §§23.1–23.5
(bounded local shtukas and legs), §§24.1–24.3 (local Shimura and EL/PEL comparisons),
and §19.5.1 (torsor description). Deformation theory of integral local models is outside this
scope unless needed for a specifically declared comparison; the v-sheaf moduli themselves
are constructed here.

## Completion contracts added on 2026-09-15

**Applies to:** `HS0`, `HS1`, `HS2`, `HS3`, `HS4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Give source/target/leg diagrams on actual bundles with off-divisor isomorphisms, and prove their relative-position boundedness after splitting-field descent. At a basic pair identify the stabilizer torsors and construct the two commuting local-group actions before cohomology. Define finite-level support, its transition trace and the coefficient limit in a fixed order; justify every interchange with invariants.

### Producer–consumer contract

The Hecke kernel lands in the specified ULA/dualizable lisse category. HS3 exports perfect invariant complexes in the stated pro-p-level range, not a finite-dimensional infinite-level representation. Creation and annihilation come with the two triangle identities and Weil continuity.

### Acceptance and source route

Trivial modification recovers identity; two colliding legs recover convolution; a minuscule GL_n tower compares with classical moduli only after the comparison theorem; a level index divisible by ℓ forbids normalized averaging.

**Source route:** FS VI.8–12, VII.5 and IX.1–3; Berkeley §§23–24. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
