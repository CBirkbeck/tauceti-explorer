# Roadmap: reductive bundles, B(G) and Newton strata

For every connected reductive group G over a nonarchimedean local field E, construct
Bun_G on perfectoid spaces over an algebraically closed extension k of F_q. Cover ramified
and nonsplit groups. Dependencies: [RelativeFarguesFontaine](../RelativeFarguesFontaine/README.md),
[VectorBundlesAndIsocrystals](../VectorBundlesAndIsocrystals/README.md),
[DiamondsAndVStacks](../DiamondsAndVStacks/README.md),
[ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md), and
[DiamondSixOperations](../DiamondSixOperations/README.md) for smoothness refinements.
Use upstream ReductiveGroups for algebraic root data and representations. No local
Langlands correspondence or automorphic representation is assumed.

## BG0. Torsors and isocrystals with reductive structure

Construct G-torsors on the existing sousperfectoid spaces and curve, and prove the
comparison between geometric étale torsors, étale sheaf torsors, and exact tensor functors
Rep_E(G) → vector bundles. Construct tensor isomorphisms and descent before passing to
isomorphism classes. Include fpqc/étale comparison in the exact smooth-group setting,
extension of structure group, inner twisting and faithful-representation independence.

Define B(G) as sigma-conjugacy classes in G(E-breve), with relation
b' = g b sigma(g)^(-1), and compare with isomorphism classes of G-isocrystals. Construct
J_b as its algebraic sigma-centralizer and prove representability and its inner-Levi
description. ReductiveGroupsPartII supplies algebraic group forms; the isocrystal descent,
centralizer and its rational-point identification are owned here.

## BG1. Kottwitz and Newton invariants

Construct pi_1(G), its Galois coinvariants, the Kottwitz map kappa and rational dominant
Newton cocharacter nu. Prove independence of representatives and maximal torus, behavior
under group homomorphisms, central quotients and z-extensions, and their relation for
tori and GL_n. Prove the classification/uniqueness assertions for B(G) used in FS III,
including basic classes, the centralizer Levi and the comparison with the torsor kernel.

Define the partial order with equal kappa and the dominance comparison of Newton points,
pinning its orientation. Use this order for semicontinuity; this roadmap requires continuity
of the map from Bun_G points with the stated order topology, not an unstated stronger
closure equality or topological homeomorphism.

## BG2. Bun_G and uniformization

<a id="bg2-uniformization"></a>
<a id="stage-BG2:uniformization"></a>
### BG2:uniformization — The stack and its cover

Define the groupoid-valued functor S ↦ G-bundles on X_S. Prove v-descent, smallness with
cutoffs, and the diagonal's representability using torsor-Isom sheaves. Construct the
Hecke modification uniformization around an untilt divisor through RF4 patching, including
v-surjectivity in the exact source range. Do not assume every bundle is globally trivial
off any chosen divisor without the uniformization theorem that makes this assertion valid.

Prove the bijection |Bun_G| → B(G), geometric-base independence and the kappa/nu formulas.
Prove kappa locally constant using the source z-extension route and its v-surjectivity
lemma; prove nu semicontinuous by faithful-representation HN theory. This explicitly
includes the non-simply-connected derived-group case.

<a id="bg2-smooth-artin"></a>
<a id="stage-BG2:smooth-Artin"></a>
### BG2:smooth-Artin — The whole stack, not only its strata

Import only [GS0:Schubert-smoothness](../GeometricSatakeAndFusion/README.md#gs0-schubert-smoothness)
and [VS0](../VStackSheavesAndLisseCategories/README.md#vs0-artin-v-stacks-and-eligible-operations)
in addition to BG2:uniformization. Prove FS IV.1.19: Bun_G is an ℓ-cohomologically
smooth Artin v-stack of ℓ-dimension zero, for ℓ≠p, with the separated cohomologically
smooth Beauville–Laszlo covering by the disjoint union of `[G(E)\Gr_(G,μ̄)]`.
Construct the locally spatial diagonal via Isom sheaves (IV.1.20); after a chosen untilt,
identify the cover fibres with the geometrically trivial open loci in modifications
of fixed relative position. Use VI.2.4/IV.1.18 for their smoothness and the independent
uniformization theorem for surjectivity. Prove the dimension-zero assertion by the
source's atlas/dualizing calculation, not by declaring all quotient stacks dimension zero.

This is an early return from the Schubert calculation. It uses neither GS4 Satake,
EDC.7 decomposition, DWP.9 hard Lefschetz, nor VS4 compact generation. BG3 also records
IV.1.22's stratum ℓ-dimension `−<2rho,nu_b>` using the full automorphism group.

## BG3. Basic and nonbasic strata

Construct Bun_G^b as the locally closed substack for each b. For basic b prove the
classifying-stack description by J_b(E), and prove that the union of basic strata is
open. For general b construct the full automorphism v-group Gtilde_b, its map to J_b(E),
connected kernel and quotient description Bun_G^b = [*/Gtilde_b]. Retain the connected
kernel for nonbasic b; the stack is not in general [*/J_b(E)].

Use the positive Banach–Colmez filtration to identify the kernel and prove its
ell-cohomological smoothness and dimension pairing <2rho,nu_b>. The relevant ell differs
from p. Agreement of étale coefficient categories after removing this kernel is a
separate theorem owned by VStackSheavesAndLisseCategories.

## BG4. Local charts and specialization geometry

Construct the filtered-bundle chart M_b with associated graded geometrically E_b.
Prove representability, partial properness and cohomological smoothness over [*/J_b(E)]
and for M_b → Bun_G in FS V.3's precise sense. Establish surjectivity/covering of
the neighborhoods it is intended to cover, compatibility with HN strata and dimension.
The proof uses the FS IV Jacobian theorem from VStackSheavesAndLisseCategories VS1;
only this late chart stage consumes it. Bun_G's definition and B(G) classification do
not depend on its later sheaf-category compact-generation theorem.

## Acceptance and sources

Tests: G_m, GL_2 with slopes 0 and 1, a basic division-algebra inner form, a nonsplit
torus, and a group requiring a z-extension. Check that the nonbasic automorphism group
has its connected part and that the basic stratum gives smooth representations only
after the separate sheaf comparison. No coefficient restriction on spectral action is
needed to construct Bun_G; smoothness tests retain ell != p.

Primary source: FS
III.1–III.5, IV.1.18–IV.1.22 and V.3;
Berkeley §19.5.1
(Tannakian torsors), §§22.4–22.6 (classification, Newton semicontinuity and extension),
and §19.1 (modifications). The Kottwitz classification and centralizer lemmas cited
in FS III are proof obligations of BG0–BG1, with bibliographic expansion in the campaign
reference ledger. They are not replaced by a free-standing axiom named B(G).

## Completion contracts added on 2026-09-15

**Applies to:** `BG0`, `BG1`, `BG2:uniformization`, `BG3`, `BG4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For sigma-centralizers construct the descent datum on the centralizer Levi, prove effectivity and identify rational points with the automorphisms of the G-isocrystal. For a nonbasic bundle explicitly filter its connected automorphism kernel by positive-slope section spaces; compute each dimension before forming the quotient stack. Establish a stratum immersion and its locally closed topology from the Newton conditions, retaining the source's distinction between continuity and a full closure-order theorem.

### Producer–consumer contract

Export the full automorphism v-group and the map to J_b(E), followed by the separate sheaf-category invariance theorem from VS4. A field-valued bijection with B(G) supplies no atlas, no equivalence of stacks and no cohomological dimension formula.

### Acceptance and source route

Use GL_2 with unequal slopes to retain upper-triangular positive-slope automorphisms, a basic division-algebra class, and a nonsplit torus.

**Source route:** FS III.1–III.5, IV.1.19–22 and V.3. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
