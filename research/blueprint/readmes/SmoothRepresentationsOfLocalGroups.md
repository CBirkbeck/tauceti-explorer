# Smooth representations of local groups: imports and Part II

This roadmap extends the current Tau Ceti roadmap with compact-section gluing,
the Schwartz-algebra comparison for tempered extensions, completed principal-series
Bernstein centres and their tangent maps, and the late integral-finiteness chain.
Its application is local representation theory in automorphic cohomology: integral
Hecke actions, deformation of generic principal series, and second adjointness in
coefficients of residual characteristic different from the local field.

**Planning status:** complete target-level pass; all eleven stages are **planned**,
none is closed. There are eight explicit gaps and three supplier requests.
`implementationStatus` is `unchecked` throughout. The new packet has 11 nodes:
4 constructions, 2 definitions and 5 theorems, with 18 API items, 21 discriminating
tests and 8 planets. Existing upstream targets are imports and are excluded from
these counts. Independent review [REV-SmoothRepresentationsOfLocalGroups](../reviews/REV-SmoothRepresentationsOfLocalGroups.md)
accepted this planning pass on 16 October 2026 after the corrections recorded
there. The eight gaps and three requests remain implementation obligations.

## Existing work and scope

The base is the [merged smooth-representation roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md),
PR #793, at commit `10432b146c0828ab379e76f9c630a76578b98430` (14 October 2026).
It has 166 named target headings. The supplied read-only snapshot had 157;
the nine additions are imported below. It includes the early category, Hecke theory, derived duals and derived
Hecke algebra, induction, the early uniform bound, complex Bernstein theory,
characteristic-zero second adjointness, Satake and its explicit examples, integral
GL_n families, finite-wild cocycles, parameter finiteness, depth generators and the
algebra of stable operators. These are not new plans in this document.

The two existing atlas packets contribute 170 stable target IDs: 100 in
[SR.0](../packets/SmoothRepresentationsOfLocalGroups--SR.0.json) and 70 in
[SR.4](../packets/SmoothRepresentationsOfLocalGroups--SR.4.json). The first has an accepted review; the second
has a `needs_changes` review. Their IDs are retained as graph adapters, never
copied into a new set of nodes. Matching names point to the current upstream
target, whose statement and supplier contract take precedence. Residual late
targets retain their old IDs, with the qualified contracts below. This is not
acceptance of every claim or proof in the second packet.

The packet's `roadmapImports` gives an entry for all 170 IDs; its
`upstreamTargetInventory` links all 166 current upstream targets to immutable
source lines. Fourteen upstream targets have no same-named imported old ID:
`compact-induction-criterion`, `harish-chandra-tempered-support`,
`iwahori-components`, `classical-llc-normalization`, `integral-llc-centre`,
`unitary-spherical-coefficients`, `finite-discrete-cup-comparison`,
`distinguished-cuspidal-types`, `type-projective-construction`,
`integral-second-adjointness`, `modular-generic-segments`,
`segment-representations`, `cuspidal-stable-lattice` and
`stable-contracting-hecke-operator`. They are imported directly from the base.
The SR.5.2 `integral-second-adjointness` target is for GL_n over W(k); the
same-named old SR.6 ID retains the general DHKM theorem below. Proposed restructuring is **Smooth
representations of local groups, Part II**, with the eleven current stage IDs
preserved. No other roadmap, stage edge or packet is edited by this job.

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was also searched
for the relevant representation-theoretic carriers. Library declarations, planned
roadmap targets and requests for missing interfaces are distinguished below.

## Conventions and checks shared by the layers

G is locally profinite: Hausdorff, with a neighbourhood basis of compact open
subgroups. In reductive statements G=𝐆(F), where 𝐆 is connected reductive and F
is a nonarchimedean local field, with residue characteristic p and residue size q.
ReductiveGroupsPartII RG2.0 supplies the topology on rational points, RG2.2 the
building, RG2.3 compact subgroups and filtrations, RG2.4 decompositions and
integration, and RG2.5 integral dual data. Their exact current contracts are those
of the upstream roadmap's supplier section, not consequences of abstract
group-theoretic axioms alone.

Smooth representations use an algebraic A-module: every vector has open
stabilizer. Putting the discrete topology on both A and the module gives the comparison
with Tau Ceti's existing smooth discrete carrier, including its continuous
scalar-action requirement. It is not a Banach or locally analytic
representation. A is any commutative ring until a theorem states a restriction.
Averaging and the locally unital Hecke-module equivalence require a cofinal
family of compact open subgroups whose pro-orders are invertible in A. For a
locally pro-p group this holds when p is a unit. Compact invariants need not
commute with coefficient change outside the averaging or flatness hypotheses.

For P=MN let I_P and R_P denote unnormalized induction and N-coinvariants.
Fix δ_P, with δ_B(diag(ϖ,1))=q⁻¹ for the upper Borel of GL₂, and a specified
square root when using normalized functors:
i_P=I_P(δ_P^{1/2}⊗−), r_P=δ_P^{−1/2}⊗R_P.
The first adjunction is r_P ⊣ i_P; the second is i_P ⊣ r_opposite(P).
Without the square root the second is I_P ⊣ δ_P R_opposite(P).
Use δ_opposite(P)=δ_P⁻¹ to check this conversion.

The integral Haar normalization begins over Z[1/p] and is then changed to A.
A pro-p subgroup normalized to volume one gives the permitted local idempotents.
A compact Iwahori volume can vanish after changing coefficients; division by it
cannot define an idempotent there. Integer finite-correspondence operators keep
their own convention and are compared with Haar convolution using its scalar.
The existing Tau Ceti double-coset product is imported once.

Acceptance checks for the imported theory include: the trivial action is smooth;
the algebraic regular action of an infinite nondiscrete compact group need not
be smooth; the trivial action on an infinite-dimensional complex space is not
admissible for compact G; sign invariants over Z do not commute with reduction
modulo 2; a split torus has identity Satake transform; and normalized GL₂ Satake
sends the first elementary double coset to q^{1/2}(X₁+X₂). Keep all q powers,
the Frobenius action and the similitude in comparisons of spherical parameters.

## Layer contracts and imports

### SR.0: Smooth category

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L540) (source lines 540–967).

Import the arbitrary-ring smoothness predicate, smooth vectors, invariants, admissibility, coefficient change and smooth dual. Smoothness is closure under open stabilizers, not continuity for an unspecified module topology. Compare the discrete carrier with TauCeti.DiscreteRep through the existing equivalence.

**Checks and boundary.** Use the early abelian stage without requiring its derived successor. Test a trivial finite free action, a nonsmooth algebraic regular action of a compact nondiscrete group, and the infinite-dimensional trivial action against admissibility.

### SR.0:abelian-category: Early abelian category

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L540) (source lines 540–967).

Import the full subcategory of smooth objects, its intertwining maps, kernels, cokernels, sums, filtered colimits and the smooth-vector adjunction. The unqualified SR.0 export is this early category. Countable-coset Schur over C is independent of reductive admissibility.

**Checks and boundary.** Transport the existing profinite discrete-module API rather than reintroducing that carrier. Keep tensor and scalar-dual exactness hypotheses separate from abelian closure.

### SR.0:derived-extension: Derived extension

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1587) (source lines 1587–1830).

Upstream SR.0d supplies the derived category, derived smooth dual, tensor/internal Hom, derived invariants and the graded Hecke Ext algebra. FS Corollary V.1.4, pp. 170–171, identifies RHom with the derived smooth dual in its sheaf comparison regime. This imports an actual derived-functor target; it does not make the ordinary scalar dual exact over arbitrary rings.

**Checks and boundary.** The derived Hecke degree-zero product must recover the imported Hecke product. The invariant-function/double-coset models and the action on derived invariants use the Venkatesh targets already present upstream. Stable enhancement and equivariant K-flat comparison remain G-DERIVED-ENHANCEMENT.

### SR.1: Integral Hecke algebras and the Lambda-centre

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L968) (source lines 968–1586).

Import compact test functions, integral finite-sum integration and Fubini, convolution and support bounds, the opposite involution, local units and corner/module equivalences. Import the positive Iwahori/G-cover and Bernstein-presentation interfaces with their subgroup and index hypotheses. Add only the compact-section cosheaf below.

**Checks and boundary.** SR.1.3 owns the ordinary Lambda-linear CatCenter and its inverse-limit description lim_K Z(e_K H e_K), for cofinal pro-p K and p invertible. For Λ=Z_ell[√q], the corners and their inverse limit are ell-adically separated. These ordinary-centre targets do not require SR.0d. The additional upstream description Z(G,Λ)=π₀End(id_D(G,Λ)) needs the enhanced-to-abelian comparison in G-DERIVED-ENHANCEMENT. The ordinary centre is already the target of excursion maps for torsion and nonfield coefficients; the complex Bernstein variety does not replace it.

### SR.2: Induction and Jacquet functors

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1831) (source lines 1831–2280).

Import smooth induction from a closed subgroup as smooth sections, compact induction with compact support modulo the subgroup, Frobenius reciprocity in its valid direction, induction in stages, and the p-adic Mackey/geometric-lemma filtrations. Import parabolic induction, Jacquet coinvariants, normalization, canonical lifting, admissible contragredient comparisons and the first adjunction.

**Checks and boundary.** The Levi is P/N and the opposite parabolic is explicit. Exactness is restricted to the coefficients allowed by the source; no characteristic-p Jacquet exactness is inferred. For P=G all functors and adjunction maps are identities. The smooth flag-variety model used by Pan is an induction model, while locally analytic induction has a different owner.

### SR.2a: Second adjointness over C

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2944) (source lines 2944–3078).

Import the characteristic-zero stabilizing Hecke-operator proof, the canonical pairing, the natural Hom equivalence, unit, counit and both triangle identities. This branch is independent of geometric local Langlands and is available before the late integral theorem.

**Checks and boundary.** Use the opposite parabolic and the fixed half modulus. Test P=G and compatibility with admissible smooth duals; do not reverse the first adjunction to manufacture the second.

### SR.3a: Early uniform admissibility

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2281) (source lines 2281–2491).

Import Harish–Chandra compactness, the Bernstein/Burnside Hecke bound and uniform admissibility. For fixed compact open U, one bound B(G,U) controls dim_C V^U for every irreducible smooth V. Its early proof precedes the full Bernstein-centre construction.

**Checks and boundary.** The bound depends on G and U, not V. Individual admissibility does not imply a uniform bound. No later finite-centre finiteness is used as an input to this early branch.

### SR.3: Complex Bernstein and tempered theory

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2492) (source lines 2492–2943).

Import cuspidal support, the Bernstein product decomposition, centres and finite-type block/corner algebras, unramified characters, rational intertwining targets, tempered matrix coefficients, square-integrable and Steinberg tests, and the split Iwahori comparisons. Irreducibles are admissible and have scalar endomorphisms. For compact centre the cuspidal summands have the imported semisimplicity/projectivity theorem.

**Checks and boundary.** The Harish–Chandra tempered-support input is explicitly conditional in the upstream Langlands-classification target. Add the Schwartz Ext/projectivity chain and generic E-valued principal-series refinements below. A whole Bernstein block is not the category of tempered Schwartz modules.

### SR.4: Classical Satake

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3079) (source lines 3079–3609).

Import normalized and integral unnormalized Satake, relative Weyl/Frobenius invariants, pseudoroots and C-group normalization, the GL_n generators and Hall–Littlewood/Macdonald comparisons, Levi descent, paired unitary parameters and genericity, the explicit even/odd unitary counts, and the GSp₄ spin-polynomial comparison. Derived Satake stays at its stated Taylor–Wiles congruence and Weyl-order hypotheses.

**Checks and boundary.** For GL₂ retain q^{1/2}; for a torus retain the Frobenius quotient, not a spurious Weyl action. The GSp₄ degree-four coefficient is q⁶T₀² and must retain the similitude. Geometric Satake consumes the classical trace contract; its equivalence is not an input to the classical isomorphism. Nonspherical GSp₄ and two-parahoric unitary calculations have their assigned downstream owners.

### SR.5: Integral GL_n families

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3610) (source lines 3610–4565).

Import twisted coinvariants, Bernstein–Zelevinsky derivatives and the early complex highest-derivative adapter independently of the late family branch. For the specified noetherian Witt-coefficient rings with ell≠p, import derivative exactness/base change, integral blocks and generic projectives, co-Whittaker modules, dominance and centre action, tensor endomorphisms, and the distinct-block/Ext adapters. The merged base also owns distinguished cuspidal types, their projectives, modular generic segments, complex Z/L segment conventions, stable lattices and the GL_n W(k) type-theoretic second-adjointness theorem. Its generic stable-operator algebra is at SR.5.2; the application to contracting Hecke operators stays at SR.6.5.

**Checks and boundary.** Co-Whittaker means the actual admissibility, top-derivative and fibre conditions of the upstream target, not any arbitrary family with a chosen functional. Integral LLC interpolation is conditional where the source is conditional. Scalar-dual and invariants base change need their own flatness/averaging/projectivity conditions. The canonical integral essential-vector gap remains G-ESSENTIAL.

### SR.6: Late integral finiteness

**Status: planned.** [Base target block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4566) (source lines 4566–4905).

Import the existing integral finite-wild cocycle and excursion-algebra suppliers, finite Frobenius restriction, parameter finiteness, Z-finiteness, bounded-depth generators, cuspidal embedding and stable-operator algebra. The stable-contracting-hecke-operator target applies the imported SR.5.2 stable-operator algebra. No second cocycle scheme or ell-adic reconstruction is introduced.

**Checks and boundary.** Retain the existing late atlas IDs under the contracts in the next section. The finiteness theorem over noetherian Z_ell-algebras and second adjointness over all Z[1/p]-algebras have different coefficient scopes. The geometric action, some Dat consequences and the ownership reconciliation remain explicit gaps.

## The late integral chain, under existing IDs

All IDs in this section have prefix `SmoothRepresentationsOfLocalGroups:` and
already occur in the SR.4 packet. They are not new nodes. These contracts qualify
that packet wherever its wording or prerequisites are insufficient. References
are to [DHKM v2](https://arxiv.org/pdf/2203.04929v2) and
[FS v4](https://arxiv.org/pdf/2102.13459v4), with page numbers in those PDFs.

The noncircular chain is parameter finiteness → excursion action and its torus/
parabolic comparisons → cuspidal finiteness → fixed-depth generation → Hecke and
centre finiteness → integral centre map → uniform stability → injective
cogenerators and Jacquet duality → second adjointness → noetherian consequences.
The first parameter-finiteness arrow imports current upstream work. The
geometric action is an actual missing construction identified by G-GEOMETRIC-ACTION.

1. **SR.6/geometric-hecke-action.** Construct the finite-set-compatible monoidal
   Hecke action on the FS lisse derived category, with Weil descent, compactness/
   ULA control and a common open wild subgroup for the action on each compact
   object. FS Theorem IX.0.1, pp. 317–318, and Proposition IX.5.1, pp. 327–328,
   provide the target. The wild bound is uniform in the finite set and dual-group
   representation for a fixed compact object; it is not a global bound for the
   whole category. Bun_G and sheaf/fusion constructions are required inputs.
2. **SR.6/excursion-center-action.** From that action construct the unreduced
   excursion algebra map into the SR.1 Lambda-centre using the evaluation,
   coevaluation and Weil operators. On each finitely generated smooth object it
   factors through some finite wild level. FS Theorem VIII.4.1, pp. 291–292,
   IX.0.2–Corollary IX.0.3, pp. 318–319, and IX.5.1 supply the comparisons.
   Descent from excursion operators to the spectral invariant algebra needs the
   component-group invertibility in Corollary IX.0.3; the unreduced action does
   not. A map from one fixed finite level to the entire smooth centre is not the
   target.
3. **SR.6/torus-central-compatibility.** FS Propositions IX.6.4–IX.6.5, p. 333,
   identify the torus map with the diagonal map into the product over Bun_T
   strata. Use local class field theory and the inverse group algebras of compact
   quotients. Central-character compatibility for a general reductive group uses
   the connected-centre case and z-extensions; do not erase this reduction.
4. **SR.6/parabolic-excursion-compatibility.** FS Theorem IX.7.2, pp. 335–337,
   and Corollary IX.7.3, pp. 337–338, compare excursion operators on each stratum
   and on unnormalized parabolic induction. The dual Levi inclusion includes its
   cyclotomic twist. Reduce from Z_ell[√q] to torsion using SR.1's ell-adically
   separated inverse-corner centre. This is a centre diagram, not equality of
   scalar eigenvalues alone.
5. **SR.6/cuspidal-excursion-finiteness.** DHKM §3.1, pp. 10–11, uses
   the finite Frobenius restriction from parameters, cuspidal embedding and the
   torus action to obtain the integral excursion-finiteness argument. For the
   finitely generated ell-torsion-free cuspidal Levi lattice, central-torus
   admissibility is the separate Dat (2009), Lemma 4.2, input, retained in
   G-DAT-CONSEQUENCES. Kill the ell-torsion nilradical on that lattice and use
   finite reduced-excursion restriction and normalized parabolic compatibility
   for its induced G-module. Lemma 3.4 is the preceding projective-embedding
   input, not the excursion-finiteness theorem. Parameter finiteness alone does
   not construct the group action.
6. **SR.6/integral-center-finiteness.** DHKM Theorems 1.1–1.2, p. 1, assert
   that, for noetherian Z_ell-algebras R with ell≠p, the level Hecke algebra is
   finite over its finite-type R-centre, and every finitely generated smooth
   R[G]-module is Z-finite. Lemmas 3.1–3.4, pp. 9–11, use bounded-depth finite
   projective generators to pass from cuspidals to all finitely generated
   objects. Corollary 3.5, p. 11, gives the bounded-depth reduced-excursion-centre
   refinement over Z_ell[√q]. Use the new `FiniteCentralAlgebra` predicate for
   the level-ring endpoint; it does not assert finiteness as an R-module.
7. **SR.6/parabolic-center-map.** DHKM Theorem 4.1, p. 12, constructs the
   unique Z_R(G)→Z_R(M) compatible with unnormalized induction for noetherian
   flat Z[1/p]-algebras R. Lemma 4.2 and Theorem 4.3, p. 13, respectively make
   Z_R(G)_r and Z_R(M)_r finite over Z_Zell(G)_r⊗R for noetherian
   Z_ell-algebras R, including nonflat ones. This latter conclusion does not
   construct a centre map from Z_R(G) for arbitrary nonflat R. The fixed-depth
   scalar-extension algebra, not a presumed equality of centres under arbitrary
   base change, is what the stability argument uses.
8. **SR.6/ell-adic-stability.** At fixed depth r and fixed decomposed K,
   parabolic P and positive λ, DHKM Lemma 4.4 gives admissibility of the Jacquet
   module over the centre. Lemma 4.5 and Corollary 4.6, p. 13, yield stability:
   V^K is a direct sum where T_λ is respectively nilpotent and invertible.
   Lemma 4.7, p. 14, supplies one nilpotence exponent for all ell≠p at those
   fixed data. Compare the integral permutation generator with its Q_ell and
   complex versions to prove uniformity; do not interchange the quantifiers.
9. **SR.6/cogenerators.** At that depth, let P_r=Z_ell[G/H]_r for sufficiently
   small pro-p H and take the smooth dual into Q_ell/Z_ell. DHKM Lemma 4.8,
   p. 14, proves injectivity and detection of simple Z[1/p]-objects, including
   characteristic-zero simples, and gives smooth products for injective
   resolutions. Corollary 4.9, pp. 14–15, transfers the common stability bound.
   One fixed depth does not cogenerate all depths, and an unrestricted algebraic
   product is not the product in the smooth category.
10. **SR.6/jacquet-cogenerator-duality.** Use the faithful smooth dual into
    Q/Z[1/p], rather than Hom into the coefficient ring. DHKM Lemma 4.10, p. 15,
    identifies R_opposite(P)(V^∨) with (R_P V)^∨. Its proof uses stability and
    cofinal decomposed subgroups. This is the exact opposite-parabolic duality
    used for the Hom adjunction.
11. **SR.6/integral-second-adjointness.** DHKM Corollary 1.3, p. 2, proved
    after Lemma 4.10 on p. 15, gives I_P ⊣ δ_P R_opposite(P) for every
    commutative Z[1/p]-algebra R. With a chosen half modulus it gives
    i_P ⊣ r_opposite(P). Construct the natural Hom equivalence and its unit,
    counit and triangle identities. The final adjunction has no noetherian or
    Z_ell-algebra hypothesis.
12. **SR.6/integral-noetherian-consequences.** DHKM Corollary 1.4 and its
    proof, pp. 2 and 15–16, give noetherianity over any noetherian p-invertible
    coefficient ring. The argument uses integral second adjointness. It is not
    obtained by extending the coefficient scope of Theorem 1.1.
13. **SR.6/cuspidal-reduction-consequences.** DHKM Corollaries 1.5–1.6,
    pp. 2–3, and Corollaries 4.11–4.12, p. 16, have their stated field and
    generic-unramified-locus hypotheses. The Dat inputs to the final
    generic-irreducibility and Grothendieck-group statements remain the precise
    source obligation G-DAT-CONSEQUENCES.

Acceptance checks distinguish the two coefficient regimes, the inverse limit
from one finite wild level, smooth injective-coefficient duals from scalar duals,
opposite from identical parabolics, and a common fixed-depth stability exponent
from unrelated exponents for each ell. The new finite-central-algebra tests
below distinguish the two finiteness clauses in Theorem 1.1.

## Part II: new targets

All short target IDs in this section have the roadmap prefix. Each definition
and construction includes its uses, API and at least three tests. The theorem
checks state the boundary that a proposed implementation must preserve.

### SR.1/part-ii-compact-section-cosheaf: The compact-section cosheaf

**Kind:** construction. **Layer:** SR.1. **Planet:** Compact-section cosheaf.

For a Hausdorff locally compact totally disconnected space X, a commutative ring A and an A-module M with the discrete topology, equip U ↦ C_c^∞(U,M), on open subsets of X, with extension-by-zero maps. For every open cover U=⋃ᵢ Uᵢ the sequence ⊕ᵢⱼ C_c^∞(Uᵢ∩Uⱼ,M) → ⊕ᵢ C_c^∞(Uᵢ,M) → C_c^∞(U,M) → 0 is right exact, where the first map is the difference of the two extension maps. Construct the natural isomorphism B⊗_A C_c^∞(U,M) ≅ C_c^∞(U,B⊗_A M) for every A-algebra B; no flatness is required.

**Hypotheses.** X is Hausdorff, locally compact and totally disconnected. M is an algebraic module, given the discrete topology only to express local constancy. The cosheaf uses extension by zero on compact supports; it does not glue arbitrary noncompact sections.

**Uses.**

- He integral convolution and the smooth induction sheaf model: Finite clopen refinement makes integration and compact-section pushforwards independent of presentations.
- Coefficient changes in the Hecke action: Distinguishes exact tensoring of compact-section carriers from invariants, whose coefficient-change map needs averaging or flatness.

**Proof/construction route.**

1. Use the imported finite disjoint compact-open expansion and common-refinement theorem for compact sections.
2. Refine the compact support by finitely many compact opens subordinate to the cover; extend each indicator by zero.
3. For a relation between presentations, take a common finite disjoint refinement. Each resulting relation lies in a pairwise intersection.
4. On each finite disjoint partition the coefficient-change map is the finite direct-sum tensor isomorphism. Pass through refinements and filtered unions.

**Direct prerequisites:** `SR.1/locally-constant-compact-support`, `SR.1/open-closed-sequence`, `mathlib:CompactlySupportedContinuousMap`, `mathlib:LocallyConstant`.

**API.**

- `CompactSections.extend` (functoriality): For open V⊆U, extension by zero is A-linear; identity and composition hold, and support is the image of the original compact support.
- `CompactSections.coverCoequalizer` (universal-property): Compatible A-linear maps from compact sections on Uᵢ, agreeing after extension from pairwise intersections, extend uniquely to compact sections on U.
- `CompactSections.tensorEquiv` (compatibility): For arbitrary A→B and M, coefficient change is an isomorphism with the indicator formula, natural in U and M.

**Unit tests.**

- `CompactSections.empty` (degenerate): Compact sections on the empty open form the zero module.
- `CompactSections.overlap` (computed): On X={0,1,2}, U₁={0,1}, U₂={1,2}, a pair of sections (a,b),(c,d) maps to (a,b+c,d); the kernel is generated by ((0,m),(-m,0)).
- `CompactSections.nonflat` (base-change): For A=Z, B=F₂ and X a two-point discrete space, tensorEquiv identifies B⊗Z² with B², despite B not being Z-flat.
- `CompactSections.compactSupport` (non-example): For X=N discrete, compact sections are M^(N), not M^N; a section nonzero at every integer is excluded when M has a nonzero element.

**Acceptance checks.**

- All sums in a single section or relation have finite support, even for an infinite cover.
- The coefficient-change isomorphism sends b⊗(1_K m) to 1_K(b⊗m).

**Sources.**

- [Tau Ceti roadmap contributors](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md), SR.1.1, locally-constant-compact-support and open-closed-sequence. The existing indicator expansion and common refinement supply the carrier and the finite gluing argument; the cosheaf and arbitrary module coefficient-change API extend those targets.
- [Xuhua He](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/803823BBCAD2701B79B7C5C7BF72C1B5/S205050861800001Xa.pdf/cocenters_of_p_adic_groups_i_newton_decomposition.pdf), §1.1–§1.2, pp. 6–7. Integral compact-section and Haar conventions fix the setting. The module-valued cosheaf is deduced here from the imported compact-open partition theorem, rather than attributed as a theorem of this paper.

### SR.3/part-ii-schwartz-algebra: The Harish–Chandra Schwartz algebra

**Kind:** construction. **Layer:** SR.3. **Planet:** Harish–Chandra Schwartz algebra.

For G the rational points of a connected reductive group over a nonarchimedean local field, over C, fix Haar measure, a good base point x₀ in the enlarged building, the proper length σ(g)=d(gx₀,x₀), and Harish–Chandra’s positive spherical function Ξ normalized by Ξ(1)=1. For each compact open K define S(G,K) to be the bi-K-invariant complex functions f for which sup_g |f(g)| Ξ(g)⁻¹(1+σ(g))ⁿ is finite for every n≥0. With convolution these are Fréchet algebras. Define S(G)=⋃_K S(G,K), with its inductive-limit topology and the imported Hecke idempotents as local units. Supply the injective convolution homomorphism H(G,C)→S(G) and the canonical S(G,K)=e_K S(G)e_K comparison.

**Hypotheses.** G is connected reductive over a nonarchimedean local field; Haar measure is the same measure as for the imported complex Hecke algebra. σ is proper on the building directions including the split central factor; Ξ uses normalized unitary induction from a minimal parabolic and the normalized spherical vector. This Schwartz algebra is a completion of the Hecke algebra, distinct from the mirabolic Schwartz submodule in SR.5.

**Uses.**

- Opdam–Solleveld Proposition 4.3: Provides the actual algebra in the Ext comparison.
- Gan–Savin Proposition 5.3, p. 18: Discrete-series projectivity is a statement in a tempered module category and must be transported back to smooth Ext.

**Proof/construction route.**

1. Construct σ from the supplied enlarged building and Ξ from the spherical matrix coefficient in normalized unitary induction.
2. Prove the Harish–Chandra estimates needed for convolution and completeness on each K-corner, and compare the displayed Ξ-weighted supremum seminorms with the weighted L² model in Opdam–Solleveld §3.
3. Compare nested K-corners and form their directed union; transfer the normalized Hecke idempotents.
4. Prove independence of auxiliary good points and equivalent proper lengths by comparison of the defining seminorms.

**Direct prerequisites:** `SR.1/convolution-algebra`, `SR.1/hecke-idempotent`, `SR.3/square-integrable-tempered`, `ReductiveGroupsPartII:RG2.2`, `SR.2/parabolic-induction`.

**API.**

- `SchwartzAlgebra.heckeInclusion` (compatibility): The inclusion H(G,C)→S(G) is injective and sends e_K to the same idempotent.
- `SchwartzAlgebra.corner` (equivalence): e_K S(G)e_K is S(G,K), with unit e_K and the topology defined by the rapid-decay seminorms.
- `SchwartzAlgebra.localUnit` (characterisation): Every f∈S(G) is fixed on both sides by e_K for some compact open K; the corner inclusions are continuous.

**Unit tests.**

- `SchwartzAlgebra.compact` (comparison): For compact G every bi-K-invariant function has finite support on the finite quotient, so S(G)=H(G,C) as algebras.
- `SchwartzAlgebra.torusDecay` (non-example): For G=F×, Ξ=1 and σ grows with |v_F(g)|; the constant function 1 is not in S(G).
- `SchwartzAlgebra.hecke` (computed): For any compact open K, e_K belongs to S(G,K) and e_K*e_K=e_K.
- `SchwartzAlgebra.zero` (degenerate): The zero function has every Schwartz seminorm zero and is the zero of every corner.

**Acceptance checks.**

- The inclusion preserves the convolution order fixed in SR.1.
- Changing the length to an equivalent proper length gives the same locally convex algebra.

**Sources.**

- [Eric Opdam and Maarten Solleveld](https://arxiv.org/pdf/1203.1237v2), §3, p. 9; introduction, pp. 1–3. Opdam–Solleveld §3 defines the Schwartz corners by weighted L² seminorms and forms their union. The displayed Ξ-weighted supremum model, its topology comparison with that definition, and the Harish–Chandra estimates are explicit obligations of G-SCHWARTZ-ANALYSIS.
- [Peter Schneider and Ernst-Wilhelm Zink](https://www.uni-muenster.de/FB10/u/pschnei/publ/pap/smod2-II.pdf), §1–§2, pp. 1–5. The nondegenerate Schwartz-module category and its local units are the algebraic setting for the discrete-component argument.

### SR.3/part-ii-tempered-schwartz-modules: Tempered Schwartz modules

**Kind:** definition. **Layer:** SR.3.

Define Mod(S(G)) to be the category of algebraic nondegenerate left S(G)-modules: each vector is fixed by some e_K. Restriction along H(G,C)→S(G) gives a smooth G-representation. For an admissible smooth representation V with scalar central character ω, prove that the imported matrix-coefficient temperedness predicate holds if and only if its H(G,C)-action extends to S(G). For any admissible V, prove uniqueness when such an extension exists. The category itself includes modules without a scalar central character. Keep algebraic modules distinct from Fréchet, LF and bornological module categories; the Ext target here is the algebraic category.

**Hypotheses.** Use the complex Schwartz algebra just constructed. Comparison with the imported matrix-coefficient predicate requires admissible V with scalar central character ω; temperedness includes unitarity of ω. Uniqueness of extension requires admissibility but not a scalar central character. Exactness in the algebraic module category is exactness of underlying modules; no topological splitting is built into it.

**Uses.**

- Opdam–Solleveld Proposition 4.3: Pins the category in both sides of Ext; merely assuming tempered constituents is not a replacement for the algebra action.
- Gan–Savin Proposition 5.3: Admissible irreducible tempered targets acquire this action before Ext comparison is used.

**Proof/construction route.**

1. Apply the imported locally unital-module construction to S(G) and its e_K.
2. Recover the smooth action from the nondegenerate H(G,C)-restriction.
3. Establish the admissible temperedness/extension comparison using the Schwartz continuity estimates; do not define temperedness by an assumed extension.

**Direct prerequisites:** `SR.3/part-ii-schwartz-algebra`, `SR.1/locally-unital-algebra`, `SR.1/hecke-module-equivalence`, `SR.3/square-integrable-tempered`.

**API.**

- `TemperedSchwartzModule.restrict` (functoriality): Restriction is an exact functor to smooth complex G-representations and identifies e_KV with K-invariants.
- `TemperedSchwartzModule.extensionUnique` (characterisation): On an admissible V, any two S(G)-module extensions of its Hecke action agree.
- `TemperedSchwartzModule.temperedIff` (compatibility): For admissible V with scalar central character ω, existence of the S(G)-action is equivalent to the imported matrix-coefficient temperedness predicate, including unitarity of ω.

**Unit tests.**

- `TemperedSchwartzModule.compact` (comparison): For compact G the module category is the imported nondegenerate H(G,C)-module category.
- `TemperedSchwartzModule.trivialSL2` (non-example): The trivial representation of SL₂(F) has no Schwartz extension, because it is admissible and not tempered.
- `TemperedSchwartzModule.steinberg` (positive): The Steinberg representation of SL₂(F) has the unique Schwartz extension; it is square-integrable.
- `TemperedSchwartzModule.zero` (degenerate): The zero module is nondegenerate and its restricted smooth representation is zero.

**Acceptance checks.**

- Restriction is exact and sends e_KV to V^K.
- The imported temperedness comparison retains admissibility and a scalar central character; the algebraic category and its Ext comparison impose neither a scalar central character nor unitarizability on every object.

**Sources.**

- [Eric Opdam and Maarten Solleveld](https://arxiv.org/pdf/1203.1237v2), Introduction, p. 1; §3, pp. 9–10. Admissible tempered representations have a unique Schwartz action. The algebraic module category is explicitly distinguished from the topological categories used for comparison.

### SR.3/part-ii-schneider-stuhler-comparison-resolution: Schwartz comparison resolutions

**Kind:** theorem. **Layer:** SR.3.

For an admissible complex S(G)-module V and a sufficiently small good compact open K, the Schneider–Stuhler coefficient-system complex on the enlarged Bruhat–Tits building gives a projective resolution of V^K as an H(G,K)-module. Its scalar extension to S(G,K) is the corresponding completed coefficient-system resolution and has the continuous contracting homotopy of Opdam–Solleveld. The finite-generation and continuity properties identify algebraic Hom into arbitrary S(G,K)-modules with the required comparison complex.

**Hypotheses.** K is in the good cofinal family of Opdam–Solleveld, not an arbitrary compact open. V is admissible and generated by V^K; refine K until the relevant Bernstein component is generated at that level. The group has the enlarged affine building and coefficient systems of ReductiveGroupsPartII:RG2.2.

**Proof/construction route.**

1. Construct the cellular coefficient system from compact-open invariant spaces on facets.
2. Use the augmented building contraction and the Schneider–Stuhler exactness theorem to obtain the Hecke resolution.
3. Extend the contraction with the decay estimates to the Schwartz corners, preserving the augmentation.
4. Check the finite-generation and good-level hypotheses used to identify the Hom complexes.

**Direct prerequisites:** `SR.3/part-ii-tempered-schwartz-modules`, `ReductiveGroupsPartII:RG2.2`, `SR.3/bernstein-decomposition`, `SR.1/hecke-module-equivalence`.

**Acceptance checks.**

- The degree-zero augmentation is the original V^K.
- The contraction identity includes the augmentation degree.
- The Schwartz resolution is not obtained by claiming S(G) is flat over H(G).

**Sources.**

- [Eric Opdam and Maarten Solleveld](https://arxiv.org/pdf/1203.1237v2), Theorems 1.2, 2.1–2.2, pp. 4–6; Theorem 4.2, pp. 14–16; proof of Proposition 4.3, pp. 16–17. These are the building-resolution and continuous-contraction inputs to the Ext comparison. The augmentation, admissibility and good-level conditions are essential.

### SR.3/part-ii-schwartz-ext-comparison: Tempered Ext comparison

**Kind:** theorem. **Layer:** SR.3. **Planet:** Tempered Ext comparison.

For V,W nondegenerate algebraic S(G)-modules with V admissible, restriction gives natural isomorphisms Extⁿ_H(G)(V,W) ≅ Extⁿ_S(G)(V,W) for every n≥0. Identify the first group with Ext in smooth complex G-representations using the imported Hecke-module equivalence. If both modules are generated at a sufficiently small good compact open K, also identify these groups with the corresponding corner Ext groups. Topological Ext comparisons require the additional LF or Fréchet hypotheses and are not needed for the present application.

**Hypotheses.** Complex coefficients. V is admissible; W need not be admissible for the algebraic comparison. Both modules carry actual S(G)-actions, not just arbitrarily chosen collections of tempered constituents.

**Proof/construction route.**

1. Decompose both module categories by the imported central Bernstein idempotents; the decomposition persists to Ext. In each component choose a good level generating that whole component, without asserting a single global level for arbitrary admissible V.
2. Use the comparison resolutions to identify Hom complexes in the Hecke and Schwartz categories.
3. Pass to cohomology componentwise and transport across the exact locally unital-module equivalence.
4. Check naturality, including degree zero, before passing between good corners.

**Direct prerequisites:** `SR.3/part-ii-schneider-stuhler-comparison-resolution`, `SR.3/part-ii-tempered-schwartz-modules`, `SR.1/hecke-module-equivalence`.

**Acceptance checks.**

- In degree zero the isomorphism is the actual restriction map on equivariant morphisms.
- No general flatness of S(G) over H(G) is asserted.

**Sources.**

- [Eric Opdam and Maarten Solleveld](https://arxiv.org/pdf/1203.1237v2), Proposition 4.3(a)–(c), pp. 16–17. The algebraic Ext comparison assumes the source is admissible; the statement also separates the extra topological comparisons.

### SR.3/part-ii-discrete-series-tempered-projectivity: Discrete-series tempered projectivity

**Kind:** theorem. **Layer:** SR.3. **Planet:** Tempered projectivity.

Let G be connected reductive with compact centre, and let δ be an irreducible complex discrete-series representation. Then δ is projective as a nondegenerate S(G)-module. Consequently Extⁿ_smooth(G)(δ,W)=0 for every n>0 and every nondegenerate S(G)-module W. In particular this vanishing applies when W is an irreducible admissible tempered representation, as in Gan–Savin Proposition 5.3. No projectivity in the entire smooth category is asserted.

**Hypotheses.** The centre is compact; for noncompact centre an individual unitary unramified character can have self-extensions. δ is irreducible, unitary and square-integrable modulo the centre. Complex coefficients; W carries the Schwartz action.

**Proof/construction route.**

1. Use Schneider–Zink Proposition 2.3 to split δ into finitely many copies of the Schwartz algebra of G⁰, where G⁰ is generated by compact open subgroups.
2. The structure recalled in Schneider–Zink §2, p. 5 gives G/G⁰ free abelian and G⁰Z of finite index for the maximal split central torus Z. Compact centre makes Z trivial, so this quotient is both finite and free abelian and G⁰=G. Thus the splitting gives projectivity over S(G).
3. Apply the admissible-source Ext comparison to transfer the vanishing to smooth representations.
4. For G₂(F), use compactness of its centre and the already supplied discrete-series status of the representation in the downstream application.

**Direct prerequisites:** `SR.3/part-ii-schwartz-ext-comparison`, `SR.3/square-integrable-tempered`, `SR.3/unramified-characters`.

**Acceptance checks.**

- For G=SL₂(F), this gives Ext¹(St,π)=0 for every irreducible tempered π.
- For G=F× the compact-centre hypothesis fails: χ⊗(1+ε·v_F) gives a nontrivial smooth self-extension of a unitary character, so that false generalization is rejected.

**Sources.**

- [Peter Schneider and Ernst-Wilhelm Zink](https://www.uni-muenster.de/FB10/u/pschnei/publ/pap/smod2-II.pdf), Proposition 2.3, pp. 8–9; Corollary 3.5, pp. 17–18. Projectivity over S(G⁰) is explicit. When unramified characters vary in a positive-dimensional torus, the projective object is the whole family, so the compact-centre hypothesis must be retained.
- [Eric Opdam and Maarten Solleveld](https://arxiv.org/pdf/1203.1237v2), Introduction, p. 2; Proposition 4.3(a), p. 17. The Ext comparison transfers Schwartz projectivity to Ext against Schwartz modules.
- [Wee Teck Gan and Gordan Savin](https://arxiv.org/pdf/2102.00372v1), Proposition 5.3 and proof, pp. 17–18. The application kills the discrete-series contribution to Ext¹ against an irreducible tempered target.

### SR.3/part-ii-principal-series-centre: The principal-series Bernstein centre over E

**Kind:** construction. **Layer:** SR.3.

Let K/Q_p be finite and E/Q_p sufficiently large for the character data and the Bernstein component. Fix n≥1 and smooth E-valued characters φ₁,…,φₙ of K×. Let D be the torus component containing their tensor product, and Ω the corresponding principal-series component of GLₙ(K). Construct the E-form of the imported Bernstein block and its centre H, identifying H with H_D^W(D), where H_D is the coordinate algebra of the torus of unramified twists of this fixed inertial character datum and W(D) stabilizes its inertial class. Each GL₁ coordinate centre H_i is a one-variable Laurent algebra; Spec H_i is G_m, rather than the algebra H_i itself. Use the affine Weyl action determined by the chosen base characters when their inertial restrictions coincide.

**Hypotheses.** E contains the values needed to define the compact character data and the finite Weyl twists, as in CEGGPS §3.13. The character data and a square root of q used for normalized induction are defined over E. Only the split principal-series block is extended from the upstream complex theory; arbitrary E-forms of all Bernstein blocks are not new targets here.

**Uses.**

- Ding Proposition 3.3(2), p. 36: Makes the morphisms J_w maps between actual Bernstein spectra.
- Ding §3.6, p. 57: The completed block centre is the common first-order parameter algebra before analytic deformation directions are added.

**Proof/construction route.**

1. Use compact induction of the torus inertial character to identify its centre with the unramified character coordinate algebra.
2. Use the imported block/projective-generator construction over a splitting field, then faithfully flat descent to E.
3. Identify the GLₙ block centre with invariants under the inertial stabilizer, including the character twists in its action.
4. Identify the coordinate centres with Laurent algebras after choosing the valuation generator; record how changing that choice transports the coordinates.

**Direct prerequisites:** `SR.3/bernstein-components`, `SR.3/bernstein-centre-blocks`, `SR.3/universal-unramified-twist`, `SR.1/bernstein-presentation`, `mathlib:CategoryTheory.CatCenter`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `PrincipalSeriesCentre.torusCoordinates` (equivalence): Each coordinate component has centre H_i≅E[T_i,T_i⁻¹]; points correspond to unramified twists of the fixed character.
- `PrincipalSeriesCentre.invariants` (characterisation): The categorical centre H is H_D^W(D) under the stated splitting hypotheses, with the correctly twisted inertial Weyl action.
- `PrincipalSeriesCentre.scalarExtension` (compatibility): After a sufficiently large extension E→E′, the block and centre comparisons agree with the algebraically closed characteristic-zero model.

**Unit tests.**

- `PrincipalSeriesCentre.rankOne` (comparison): For n=1, the map H→H₁ is an isomorphism and the centre is a Laurent algebra.
- `PrincipalSeriesCentre.distinctInertia` (computed): If no two φ_i have the same restriction to O_K×, the inertial Weyl stabilizer is trivial and H is the full ordered torus algebra.
- `PrincipalSeriesCentre.repeatedInertia` (non-example): For n=2 with identical compact restrictions, swapping the two unramified characters fixes the central character; the ordered Laurent algebra is not itself the block centre.

**Acceptance checks.**

- The centre is the actual categorical centre of Ω_E, not a chosen ring of scalar parameters.
- For pairwise different inertial restrictions, W(D) is trivial; for repeated restrictions its affine action is retained.

**Sources.**

- [Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin](https://arxiv.org/pdf/1310.0831v5), §3.13, pp. 44–48, especially Lemmas 3.19, 3.21–3.22, pp. 46–47. A sufficiently large E admits the required block models, and its centre is the invariant subring of the torus-component centre.
- [Yiwen Ding](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf), §3.1.1, pp. 33–34; Proposition 3.3 proof, p. 36. The smooth principal-series representation and its individual GL₁ Bernstein centres supply the application.

### SR.3/part-ii-ordered-character-map: Ordered characters and the Bernstein spectrum

**Kind:** construction. **Layer:** SR.3. **Planet:** Bernstein character map.

In the preceding principal-series setting define η=1⊠|·|_K⊠⋯⊠|·|_K^(n−1), and w(φ)_i=φ_(w⁻¹i). For each permutation w construct J_w: X_w=∏ᵢ Spec H_(w⁻¹i)→Spec H by the central character of the unnormalized lower-Borel induction Ind_(B⁻)^(GLₙ(K))(w(φ′)η). This is the finite torus-to-invariant-quotient morphism, transported by the fixed normalizing twist. If p_(w₂,w₁):X_w₁→X_w₂ reorders by w₂w₁⁻¹, the typed equality is J_w₂∘p_(w₂,w₁)=J_w₁. Record the contravariant equality on coordinate-algebra maps.

**Hypotheses.** All inertial character data are fixed, and φ′ varies only through their unramified twists. η and the lower Borel are fixed; this is Ding’s unnormalized induction convention. An assertion about irreducibility is restricted to the generic locus φ_i/φ_j≠1,|·|_K for all i≠j.

**Uses.**

- Ding Proposition 3.3(2): Permutation compatibility produces the smooth part of the tangent-space diagram.
- Ding (3.55), p. 57: The same algebra maps induce the compatible completed-centre maps.

**Proof/construction route.**

1. Use the invariant-subring inclusion to construct the finite affine quotient map.
2. Identify its closed-point central character by the imported principal-series induction and Bernstein action, with η included.
3. Construct the source reorderings and check the equality before passing to points, completions or tangent spaces.

**Direct prerequisites:** `SR.3/part-ii-principal-series-centre`, `SR.2/parabolic-induction`, `SR.2/principal-series-jacquet`.

**API.**

- `OrderedCharacterMap.ringMap` (constructor): The map on coordinate algebras is H→O(X_w), given by the invariant inclusion with the fixed η twist.
- `OrderedCharacterMap.point` (characterisation): On E-points J_w gives the central character of Ind_(B⁻)(w(φ′)η); this holds as a block-support statement even at reducible parameters.
- `OrderedCharacterMap.permutation` (functoriality): For the source reordering p_(w₂,w₁), J_w₂∘p_(w₂,w₁)=J_w₁, and pullback reverses this composition.

**Unit tests.**

- `OrderedCharacterMap.identity` (degenerate): For w₁=w₂ the source reordering is the identity and the equality is reflexive.
- `OrderedCharacterMap.rankTwo` (computed): For n=2 and s=(12), J_s(a₂,a₁)=J_1(a₁,a₂); the coordinate-ring equality has the reverse direction of composition.
- `OrderedCharacterMap.rankOne` (comparison): For GL₁, J_1 is the identity of the character component; there is no modulus twist.

**Acceptance checks.**

- The source permutation sits before J_w₂, not after a map with codomain Spec H.
- For n=1 the lower-Borel induction is the character itself, and η=1.

**Sources.**

- [Yiwen Ding](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf), Proposition 3.3(2), proof, p. 36; §3.6, p. 57. The J_w maps encode central characters of the smooth lower-Borel principal series. The printed composition order is corrected by matching domains and codomains.
- [Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin](https://arxiv.org/pdf/1310.0831v5), Lemma 3.22, p. 47. The invariant-ring identification supplies the actual algebra map.

### SR.3/part-ii-principal-series-completion: Completed principal-series centres

**Kind:** theorem. **Layer:** SR.3. **Planet:** Completed Bernstein centre.

Assume the generic smooth tuple φ satisfies φ_i/φ_j≠1,|·|_K for every i≠j, and E contains its point coordinates. At x_w=w(φ)∈X_w and z=J_w(x_w), pullback induces an isomorphism of complete local E-algebras Ĥ_z≅Ô_(X_w,x_w). The latter represents unramified deformations of the ordered characters with fixed compact restrictions, and is a power-series algebra over E in n variables after choosing local coordinates. These isomorphisms are compatible with source reorderings. They are local statements at the specified generic points, not global isomorphisms of the ordered torus and Bernstein quotient.

**Hypotheses.** K/Q_p finite; n≥1; E is a sufficiently large finite extension of Q_p. The tuple is generic as above; in particular no nontrivial inertial Weyl element fixes its full character point. Completions are at the specified E-rational maximal ideals.

**Proof/construction route.**

1. Use the principal-series centre as a finite invariant quotient.
2. Show the stabilizer of the generic ordered point is trivial: a fixing permutation would equate two full characters.
3. Apply the finite free-orbit quotient/completion theorem over characteristic zero and the equality of residue fields.
4. Identify the ordered-character completion and transport the source-permutation identity through completion.

**Direct prerequisites:** `SR.3/part-ii-ordered-character-map`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`, `mathlib:AdicCompletion`.

**Acceptance checks.**

- For GL₁, the completed local ring of E[T,T⁻¹] at T=a≠0 is E[[u]] with u=T/a−1.
- For a repeated rank-two character the free-orbit argument fails; the completed quotient map need not be an isomorphism.
- No analytic character space or Galois deformation ring is substituted for the smooth unramified completion.

**Sources.**

- [Yiwen Ding](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf), §3.6, discussion after (3.55), p. 57. The completed Bernstein centre is identified with the formal unramified character-deformation ring. The generic tuple and the source map are fixed in §3.1.1 and Proposition 3.3.
- [Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin](https://arxiv.org/pdf/1310.0831v5), Lemma 3.22, p. 47. The torus invariant quotient is the input; local étaleness at a free orbit is the additional commutative-algebra interface requested here.

### SR.3/part-ii-principal-series-tangent: Smooth tangent and extension parameters

**Kind:** theorem. **Layer:** SR.3. **Planet:** Smooth principal-series tangent space.

For the generic tuple and smooth irreducible π_sm=Ind_(B⁻)(φ η), identify the tangent space at each ordered-character point with Hom_sm(T(K),E), of dimension n, by φ_i↦φ_i(1+εψ_i). The tangent of J_w identifies this space with the tangent of the completed block centre and with Ext¹ in the smooth E-linear representation category of π_sm by itself. For p_(w₂,w₁) the resulting maps satisfy ζ_w₂∘d p_(w₂,w₁)=ζ_w₁. This is the smooth part of Ding’s comparison; locally analytic central-character directions and the dimension n+[K:Q_p] are owned by the locally analytic roadmap.

**Hypotheses.** K/Q_p finite; φ generic; E sufficiently large; π_sm and its central character are E-rational. Hom_sm denotes additive homomorphisms with open kernel; each K× factor therefore contributes its valuation direction. Self-extension classes are in the smooth category; arbitrary locally analytic extensions are excluded from this target.

**Proof/construction route.**

1. Describe smooth first-order deformations of the coordinate characters by their additive open-kernel logarithmic derivatives.
2. Use the imported exact Jacquet/induction APIs on the generic principal-series block to identify first-order smooth deformations and self-extensions.
3. Apply the completed-centre isomorphism to identify the tangent map with this extension construction.
4. Differentiate the typed source-permutation equality to obtain the compatibility diagram.

**Direct prerequisites:** `SR.3/part-ii-principal-series-completion`, `SR.2/geometric-lemma`, `SR.2a/second-adjointness`, `SchemeAndStackFoundations:SF.4`.

**Acceptance checks.**

- For n=1 the single smooth self-extension parameter is valuation; the logarithm direction is locally analytic and excluded.
- For n=2 the transposition interchanges the two valuation directions.
- The smooth tangent dimension is n, not n+[K:Q_p].

**Sources.**

- [Yiwen Ding](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf), Proposition 3.3(1)–(2) and proof, pp. 35–36, restricted to the smooth part; §3.6, p. 57. The proof first identifies the smooth tangent comparison through the Bernstein centre, then adds analytic central-character directions. Only the former is owned here.

### SR.6/part-ii-finite-central-algebra: Algebras finite over a finite-type centre

**Kind:** definition. **Layer:** SR.6. **Planet:** Finiteness over the centre.

For a commutative ring R and a unital, possibly noncommutative R-algebra H, define FiniteCentralAlgebra(R,H) to mean that H is a finite module over Z_R(H)=Subalgebra.center R H and Z_R(H) is a finite-type R-algebra. This is the exact algebraic conclusion for a level Hecke ring in DHKM Theorem 1.1. It does not assert that H is finite as an R-module or that forming its centre commutes with arbitrary coefficient change.

**Hypotheses.** R commutative; H a unital R-algebra. The centre is the actual full algebra centre, using Mathlib’s existing subalgebra carrier. To conclude noetherianity, R is additionally noetherian.

**Uses.**

- DHKM Theorem 1.1 and Lemma 3.2: Gives a precise endpoint for each unital level Hecke ring, distinct from smooth Z-finiteness.
- DHKM Corollary 1.4: Separates the generic algebraic implication from the stronger theorem over all noetherian p-invertible coefficient rings.
- `SR.6/integral-center-finiteness`: Proves this predicate for the permitted level Hecke algebras, using it as an endpoint rather than supplying its definition.

**Proof/construction route.**

1. Use Subalgebra.center with its existing commutative-ring and scalar-action instances.
2. Define the conjunction of existing finite-module and finite-type predicates.
3. For noetherian R apply the finite-type Hilbert basis theorem to the centre and then IsNoetherianRing.of_finite to H.

The existing `SR.6/integral-center-finiteness` theorem consumes this predicate;
it is not a prerequisite of the generic algebraic definition.

**Direct prerequisites:** `mathlib:Subalgebra.center`, `mathlib:Module.Finite`, `mathlib:Algebra.FiniteType`, `mathlib:IsNoetherianRing.of_finite`, `mathlib:Algebra.FiniteType.isNoetherianRing`.

**API.**

- `FiniteCentralAlgebra.finiteModule` (projection): The first component is Module.Finite (Subalgebra.center R H) H.
- `FiniteCentralAlgebra.finiteTypeCentre` (projection): The second component is Algebra.FiniteType R (Subalgebra.center R H).
- `FiniteCentralAlgebra.noetherian` (compatibility): If R is noetherian and FiniteCentralAlgebra(R,H), then H is a left noetherian ring via the central scalar tower.

**Unit tests.**

- `FiniteCentralAlgebra.field` (computed): FiniteCentralAlgebra(Q,Q) holds, with the identity centre and rank-one module.
- `FiniteCentralAlgebra.polynomial` (non-example): FiniteCentralAlgebra(Q,Q[T]) holds, while Q[T] is not finite as a Q-module; the centre condition must not be replaced by coefficient-module finiteness.
- `FiniteCentralAlgebra.rationals` (non-example): FiniteCentralAlgebra(Z,Q) fails: Q is its own centre but is not a finite-type Z-algebra.

**Acceptance checks.**

- For the DHKM endpoint the permitted coefficients are noetherian Z_ell-algebras, ell≠p.
- The generic algebraic predicate is meaningful over all R; this does not extend the scope of the Hecke theorem.

**Sources.**

- [Jean-François Dat, David Helm, Robert Kurinczuk and Gilbert Moss](https://arxiv.org/pdf/2203.04929v2), Theorem 1.1, p. 1; Corollary 1.4 and following paragraph, p. 2. The central finiteness assertion has two different finiteness clauses; the broader p-invertible noetherianity consequence is stated separately.

## Source routing and ownership boundaries

The following is an intake map of the issue's 21 routed source entries. An
import means the named target is already planned in current TauCetiRoadmap; it
does not claim a new reading of the whole paper or a library implementation.
Exact source locators and hypotheses for those imports stay in the base target.
The new targets above and the residual DHKM chain cite the primary passages
read in this run. Specialized downstream calculations consume these general
interfaces and keep their existing owners.

| Routed source | Supplier or extension | Boundary retained |
| --- | --- | --- |
| Leslie, unitary Friedberg–Jacquet periods | SR.4 `hall-littlewood`, `macdonald-formula`, `parabolic-descent` | General spherical formulas and Levi descent are imported; no period-theory reconstruction. |
| Allen et al., CM potential automorphy, Lemmas 2.1.12–2.1.13 | SR.1 positive/G-cover Hecke targets | Monoid multiplication over arbitrary rings precedes any localization needed for group embeddings. |
| Zhu, mixed-characteristic Satake | SR.4 classical Satake and trace contract | GS4 is the geometric consumer; no upward geometric input to classical Satake. |
| Treumann–Venkatesh §7 | SR.4 `twisted-weyl-invariance`, `pseudoroot`, `frobenius-component-invariants`, `c-group-formulation` | Relative Weyl/Frobenius actions and coefficient automorphism dictionary survive without an arbitrary square-root choice. |
| Kaletha, rigid inner forms | SR.0, SR.2, SR.3 imported smooth/admissible/tempered theory | No second representation category or inner-form classification is built here. |
| Boxer–Pilloni, higher Hida theory | SR.1 positive double-coset algebra; SR.2 canonical lifting | RG2.4 supplies positivity and index identities; integer correspondences are not normalized Haar idempotents. |
| Nakamura, rank-two zeta morphisms, Lemma B.10 | SR.5 `tensor-endomorphisms` | Retain the upstream exact module and co-Whittaker hypotheses. |
| Gan–Savin, exceptional theta | Imported compact-centre cuspidal semisimplicity; new Schwartz/Ext/projectivity chain | Compact centre and actual Schwartz action are essential. |
| Liu et al., Rankin–Selberg motives | SR.4 paired unitary parameters, genericity and even/odd spherical formulas | Finite Tate–Thompson types and two-parahoric operators belong to UnitaryLevelRaisingTypesAndHeckeOperators. |
| Calegari–Geraghty, non-Taylor–Wiles lifting | SR.0 `finiteness-conditions`; SR.5 `cg-distinct-block`, `cg-derived-projector`, `ext-support-orthogonality` | The integral ell≠p distinct-parameter block is not a general complex Bernstein block. |
| Calegari–Geraghty, nonregular symplectic lifting | SR.2 canonical lifting, SR.3 Iwahori inputs, SR.4 `gsp4-galois-comparison` | Nonspherical GSp₄ oldform/Klingen eigenvalue calculations remain downstream. |
| Pilloni, singular weights | SR.4 `gsp4-spin-polynomial` and normalization | Keep T₀ and the similitude. The Klingen polynomial-algebra claim requires its specialized downstream proof. |
| Clozel–Thorne, symmetric powers III | SR.1 `bernstein-presentation`, SR.4 `unitary-iwahori-center` | The full chamber group contains the connected Iwahori with index two; complex centre comparison is not arbitrary-ring centre comparison. |
| Atobe–Kondo–Yasuda, local newforms | SR.5 `highest-derivative-adapter`; imported SR.0–SR.4 | The early complex derivative API is independent of late integral families; finite-group Mackey theory is insufficient. |
| Venkatesh, derived Hecke | SR.0d derived-Hecke targets and SR.4 `derived-satake` | Taylor–Wiles congruence and Weyl-order hypotheses; Morita comparison only on the étale locus. |
| He, Newton decomposition | Imported SR.1 finite integration/convolution; new compact-section cosheaf | Normalize in Z[1/p], then change coefficients; reuse Tau Ceti multiplication with its Haar scalar. |
| Ding, crystabelline parameters | Imported smooth skeleton; new E-centre, ordered maps, completions and smooth tangent | The locally analytic directions belong to LocallyAnalyticRepresentationsOfLocalGroups; typed source permutation is corrected below. |
| Boxer–Calegari–Gee–Pilloni, potential modularity | SR.1 positive/Iwahori Hecke, SR.2 Borel–Casselman and principal-series Jacquet | Iwahori groups are preimages of Borel/unipotent finite subgroups, not kernels; GSp₄ instances remain downstream. |
| Boxer–Calegari–Gee–Pilloni, modularity theorems | SR.1/SR.2 general interfaces and SR.4 spherical GSp₄ dictionary | The full central character is retained in the specialized GSp₄ Iwahori calculation. |
| Pan, completed cohomology II | SR.2 smooth induction as flag-variety sections | The locally analytic induction route was moved by FIX-RT-PAPER-PAN-26 and is not a smooth induction theorem. |
| Fargues–Scholze, smooth dual | SR.0d `derived-smooth-dual` | Use the derived functor and its sheaf comparison; scalar dual exactness is not automatic. |

## Baseline declarations actually read

The following statements were read at the exact pins. This is the 14-declaration
baseline inventory, not a count of current-roadmap targets. Current library
searches included the representation-theory and Hecke-ring source trees; a name
search alone is not used to claim that an unrelated equivalent construction is
absent. The reviewed library audit has cross-consumer rows for derivatives,
smooth colimits, GL₂ local representations and spherical Hecke operators; none
turns the new Schwartz or principal-series-completion targets into a baseline
declaration.

- `mathlib:Representation` — `Mathlib/RepresentationTheory/Basic.lean`. The monoid homomorphism into linear endomorphisms; there is no smoothness condition in this abbreviation.
- `mathlib:Representation.invariants` — `Mathlib/RepresentationTheory/Invariants.lean`. The submodule of vectors fixed by every acting group element; restriction gives compact-open invariants.
- `mathlib:CategoryTheory.CatCenter` — `Mathlib/CategoryTheory/Center/Basic.lean`. Endomorphisms of the identity functor, with evaluation and extensionality.
- `mathlib:CategoryTheory.Linear.toCatCenter` — `Mathlib/CategoryTheory/Center/Linear.lean`. The scalar ring map into the centre of a linear preadditive category.
- `mathlib:LocallyConstant` — `Mathlib/Topology/LocallyConstant/Basic.lean`. A function together with local constancy; compact support must be imposed separately.
- `mathlib:CompactlySupportedContinuousMap` — `Mathlib/Topology/ContinuousMap/CompactlySupported.lean`. A continuous map with compact support; with discrete target this supplies the compact-section carrier.
- `mathlib:Subalgebra.center` — `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`. The commutative subalgebra of elements commuting with every element of a possibly noncommutative algebra.
- `mathlib:Module.Finite` — `Mathlib/RingTheory/Finiteness/Defs.lean`. Finite generation of the top submodule.
- `mathlib:Algebra.FiniteType` — `Mathlib/RingTheory/FiniteType.lean`. Finite generation of the top subalgebra, distinct from finite generation as a module.
- `mathlib:IsNoetherianRing.of_finite` — `Mathlib/RingTheory/Noetherian/Basic.lean`. A ring finite as a module over a noetherian scalar ring is noetherian, with the required scalar-tower action.
- `mathlib:AdicCompletion` — `Mathlib/RingTheory/AdicCompletion/Basic.lean`. The compatible inverse limit of module quotients by powers of the specified ideal; this is the completion carrier, not the Bernstein comparison.
- `tauceti:TauCeti.DiscreteRep` — `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`. Bundled discrete modules with continuous action, using algebraic intertwining maps.
- `tauceti:TauCeti.discreteRepEquivSmoothTopRep` — `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`. The equivalence with SmoothDiscreteTopRep, identity on underlying modules; this is already available for topological monoids.
- `mathlib:Algebra.FiniteType.isNoetherianRing` — `Mathlib/RingTheory/FiniteType.lean`. The Hilbert basis theorem for a finite-type commutative algebra over a noetherian commutative ring.

## Dependencies, findings and unresolved interfaces

The three supplier requests below are to lower-tier roadmaps. No new prerequisite
points from this packet to EnhancedDerivedSheaves, LanglandsParameterStacks or
ExcursionOperatorsAndSpectralAction. The existing atlas edge inventory includes
such upward edges into SR.0d and SR.6; they are ownership-reconciliation matters,
not inputs silently used to close this plan. Of the 52 touching stage edges,
the outgoing consumers include automorphic forms and local factors, completed
cohomology, GL₂ local theory, Hecke stacks, geometric Satake and the excursion
centre. The SR.1 Lambda-centre must serve both the ES0 and ES7 parabolic returns.

**Request to SchemeAndStackFoundations:SF.1.** For an affine finite-type E-torus with a finite constant-group action in characteristic zero, construct the affine invariant quotient, prove finiteness, and prove that at an E-rational point with trivial stabilizer its completed local ring is isomorphic to the completed local ring of its image, with residue-field and permutation naturality stated. Supplier inspected: SchemeAndStackFoundations package T187, SF.1/finite-group-quotient, already owns finite-group quotients. This request asks for its free-orbit completed-local-ring specialization, not another quotient construction. Needed by `SR.3/part-ii-principal-series-centre`, `SR.3/part-ii-principal-series-completion`.

**Request to SchemeAndStackFoundations:SF.4.** For a finite-type E-algebra at an E-rational point identify tangent vectors with local maps to E[ε]/ε², identify the smooth n-torus completion with E[[u₁,…,uₙ]], and transport the derivative and source-reordering identities through completion. Supplier inspected: SchemeAndStackFoundations package T365–T370, SF.4 Artin coefficient categories, tangent spaces and hulls. This request refines that deformation interface to the completed torus and its natural derivative maps. Needed by `SR.3/part-ii-principal-series-completion`, `SR.3/part-ii-principal-series-tangent`.

**Request to ReductiveGroupsPartII:RG2.2.** Expose the enlarged affine building, its split-central Euclidean factor, oriented facets, finite facet-orbit representatives and proper length used by Opdam–Solleveld. Import the existing RG2.3–RG2.4 good compact-open filtration/factorisation contracts; the cellular coefficient system and analytic contraction remain Smooth Part II targets. Supplier inspected: ReductiveGroupsPartII RG2.2 building/apartments/facets and cocompact action; RG2.3.6 moy-prasad-filtration; RG2.4 iwahori-factorization. This request exposes their enlarged-building interface; it does not assign the analytic contraction to the reductive-group supplier. Needed by `SR.3/part-ii-schwartz-algebra`, `SR.3/part-ii-schneider-stuhler-comparison-resolution`.

### G-DERIVED-ENHANCEMENT: Enhanced smooth centre and equivariant derived tensor comparison

The ordinary Lambda-linear CatCenter and its inverse Hecke-corner description are SR.1 targets independent of a derived enhancement. The additional upstream π₀End(id_D) description requires a specified stable enhancement and a comparison with that abelian/corner centre; equivariant K-flat replacements are also needed for the derived tensor/internal Hom comparison. Keep that comparison at SR.0d/SR.1; it is not a prerequisite of the ordinary centre, and no upward EnhancedDerivedSheaves prerequisite is introduced.

Needed by `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.1`.

### G-SCHWARTZ-ANALYSIS: Analytic supplier interfaces for the Schwartz comparison

The source-level targets and proof routes are specified, but the imported building does not by itself supply the Harish–Chandra Ξ convolution estimates, the comparison of Ξ-weighted supremum and the source’s weighted L² seminorms, completed cellular coefficient modules or the bounded contraction. These must be constructed as the analytic content of the two named targets, using Opdam–Solleveld §3–§4 and its analytic references; neither flatness nor a tuple of assumed operators closes this interface.

Needed by `SR.3/part-ii-schwartz-algebra`, `SR.3/part-ii-schneider-stuhler-comparison-resolution`.

### G-PRINCIPAL-EXT: First-order generic principal-series block comparison

Ding Proposition 3.3 uses classical smooth representation theory to identify the smooth first-order self-extensions. The exact export is Ext¹_smooth(π_sm,π_sm)≅Hom_sm(T(K),E) by induction of character deformations, compatible with the centre action. Supply a direct generic-block Morita/Jacquet proof with residue field E; the completed-centre isomorphism alone does not establish this Ext identification.

Needed by `SR.3/part-ii-principal-series-tangent`.

### G-ESSENTIAL: Canonical integral essential vectors

The imported co-Whittaker and derivative APIs do not select a canonical compact-level vector over an arbitrary nonreduced coefficient ring. A theorem needs exact noetherian, reducedness, torsion and level hypotheses and a directly read source. The GL₂ field newvector theorem remains with GL₂ representations R16.2 and the minimal-lift line with AutomorphicCongruences L3.

Needed by `SR.5/essential-vector-contract`.

### G-GEOMETRIC-ACTION: Minimum geometric construction for the Hecke action

The existing atlas IDs give precise FS theorem targets, not a construction of Bun_G. Move down the minimum Fargues–Fontaine/Bun_G strata, Hecke correspondence, lisse/solid sheaf, six-operation and mixed-characteristic Satake/fusion interfaces needed for FS IX.0.1 and IX.5.1. Current Smooth upstream explicitly excludes this construction. Under the tier rule do not import EnhancedDerivedSheaves, LanglandsParameterStacks or ExcursionOperatorsAndSpectralAction as higher prerequisites. The finite-set action, its compactness/ULA control and wild bound must be proved, not put into an assumed action record.

Needed by `SR.6/geometric-hecke-action`, `SR.6/excursion-center-action`.

### G-DAT-CONSEQUENCES: Dat inputs to integral cuspidal and generic-irreducibility consequences

DHKM §3.1 also uses Dat (2009), Lemma 4.2, for admissibility of a finitely generated cuspidal lattice over the centre of its maximal central torus. Corollary 4.12 invokes Dat (2005), Proposition 3.14, and Dat (2009), Lemmas 4.12–4.13, for arbitrary ell≠p fields, the unramified open locus and Grothendieck groups. Those primary proofs were not read in this run. Preserve these exact source obligations rather than replacing them by characteristic-zero classification or assuming that central-character compatibility alone proves integral cuspidal admissibility.

Needed by `SR.6/cuspidal-excursion-finiteness`, `SR.6/cuspidal-reduction-consequences`.

### G-CONDITIONAL-CLASSIFICATION: Conditional scope and inherited source obligations

The upstream Langlands classification is conditional on its named Harish–Chandra tempered-support input; retain that implication, not an unconditional classification. General quasi-split Whittaker uniqueness/heredity, degenerate Whittaker/wave-front theory and unrestricted nonsplit Iwahori-block equivalence are not obtained from the GL₂ and split imports. Integral modular type/classification and the Hall–Littlewood/unitary count proofs remain obligations of their existing upstream target owners. Existing target sources are imported, not represented as re-read or library implementations here.

Needed by `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`.

### G-OWNERSHIP: Finite-wild single-owner and tier reconciliation

RT-AREA-geomlanglands/26 prescribes LP1 ownership, whereas the current upstream Smooth roadmap already owns the integral construction and parameter finiteness, and LP1 is above this tier. The no-duplication standing rule forbids constructing it again. This packet imports the existing construction once; the maintainer must reconcile the LP1 adapter and old stage edge without introducing an upward prerequisite. No independent ell-adic construction or comparison between duplicated schemes is planned.

Needed by `SmoothRepresentationsOfLocalGroups:SR.6`.

### Confirmed findings

**RT-AREA-geomlanglands/9.** Current upstream SR.1.3 already owns the
Lambda-linear Bernstein centre, inverse Hecke-corner description and ell-adic
separatedness. This packet imports those targets once, records SR.1 →
ES0:classical-center and SR.1 → ES7:parabolic, and identifies the ES0 sentence
that must cite SR.1. The enhanced degree-zero comparison retains its honest gap.
The complex Bernstein variety alone cannot serve torsion coefficients.

**RT-AREA-geomlanglands/26.** One integral finite-wild cocycle construction
is used, with ell-adic models obtained by base change. The current upstream
Smooth SR.6 already owns that construction and the parameter-finiteness engine.
The older instruction to move its construction to LP1 conflicts with the
standing prohibition on replanning upstream work and with the present tier
order. The maintainer must reconcile the LP1 adapter; this is G-OWNERSHIP, not
a second construction or an upward prerequisite. The current RS-21 review is
accepted; the finding's assertion that it had no accepted review is historical.

### Source issues and version collation

Ding was checked in the [published version](https://link.springer.com/article/10.1007/s10240-025-00156-2),
142 (2025), pp. 1–74, and arXiv v2. Published §3.1.1 pp. 33–34 corresponds
to preprint p. 36; Proposition 3.3 pp. 35–36 to pp. 38–40; and the completed-centre
discussion on published p. 57 to preprint p. 61. No linked correction was found
on the article page or arXiv history, or in the author/title correction search
on 16 October 2026. These are not claims about later unexamined texts.

- **SmoothRepresentationsOfLocalGroups/E1** (misprint; affects nothing), Version of record, Proposition 3.3(2), proof, p. 36; same formula in arXiv v2, p. 39. The source writes J_w₂=(w₂w₁⁻¹)∘J_w₁ while declaring that the permutation is a map between the two ordered source spectra. Writing p:X_w₁→X_w₂ for that source permutation, the typed identity is J_w₂∘p=J_w₁, or J_w₂=J_w₁∘p⁻¹. J_w₁ has codomain Spec H, on which the declared source permutation cannot be composed. The corrected identity gives exactly the stated tangent diagram ζ_w₂∘dp=ζ_w₁.
- **SmoothRepresentationsOfLocalGroups/E2** (misprint; affects nothing), Version of record, Proposition 3.3 proof, p. 36, and §3.6, p. 57; arXiv v2 pp. 39–40 and 61. The coordinate Bernstein centre H_i is identified with G_m while H_i is used as the algebra inside Spec H_i. H_i is the Laurent algebra E[T_i,T_i⁻¹] after choosing an unramified coordinate; Spec H_i is G_m. The algebra and its affine scheme have different types. With this conventional notational correction the source’s maps and completions have the intended meaning.

Independent review REV-SmoothRepresentationsOfLocalGroups confirmed both entries
in the published source and arXiv v2. The published misprints do not change
Proposition 3.3 as intended. The target
uses the correctly typed identity before completing or differentiating. The
Clozel–Thorne quadratic-sign and BCGP Iwahori-preimage corrections were already
recorded in the existing route/base; no new finding is asserted for them here.

## Lean prototype and acceptance boundary

The [suggested file](../suggested/SmoothRepresentationsOfLocalGroups.lean) has
62 lines. It contains the real-bodied light predicate `FiniteCentralAlgebra`,
its three API signatures and the field, polynomial and rational-algebra examples.
It elaborates with `lean-check` against the pinned Mathlib with six permitted
proof-placeholder warnings and no other warnings. It imports individual
modules and develops no representation-theoretic infrastructure.

The other ten nodes require new constructions and interfaces. Compact sections
already have a baseline carrier: `CompactlySupportedContinuousMap` with discrete
target. The natural open-set cosheaf diagram, gluing and coefficient-change maps
remain construction targets. Schwartz algebras/modules and their resolutions,
smooth E-linear blocks, and Bernstein spectra need carriers beyond the pins;
`AdicCompletion` supplies only the generic completion carrier. Their exact statements,
APIs, checks and uses are in this document. The binding 12 October 2026 shape
rule requires that placement; an assumed smooth category, arbitrary action
record or opaque scheme variable would not be a prototype of those targets.
The packet's `leanCoverage` records this boundary node by node. The file does
not redeclare current upstream theory or imply that these targets are formalized.

## Import-ID reconciliation

This registry makes every old ID reviewable without duplicating its statement.
Same-named upstream targets use the linked current contract. Residual IDs use
the qualified late-chain and essential-vector contracts in this document. All
IDs shown have prefix `SmoothRepresentationsOfLocalGroups:`.

| Existing ID | Supplier |
| --- | --- |
| `SR.0:abelian-category/van-dantzig` | [van-dantzig](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L549) |
| `SR.0:abelian-category/is-smooth` | [is-smooth](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L567) |
| `SR.0:abelian-category/smooth-vectors` | [smooth-vectors](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L587) |
| `SR.0:abelian-category/smooth-rep-category` | [smooth-rep-category](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L622) |
| `SR.0:abelian-category/smooth-rep-abelian` | [smooth-rep-abelian](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L645) |
| `SR.0:abelian-category/smooth-discrete-comparison` | [smooth-discrete-comparison](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L663) |
| `SR.0:abelian-category/compact-open-invariants` | [compact-open-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L690) |
| `SR.0:abelian-category/unit-pro-order` | [unit-pro-order](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L716) |
| `SR.0:abelian-category/averaging-projector` | [averaging-projector](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L752) |
| `SR.0:abelian-category/invariants-exact` | [invariants-exact](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L778) |
| `SR.0:abelian-category/admissible` | [admissible](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L794) |
| `SR.0:abelian-category/finiteness-conditions` | [finiteness-conditions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L829) |
| `SR.0:abelian-category/smooth-character` | [smooth-character](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L855) |
| `SR.0:abelian-category/smooth-dual` | [smooth-dual](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L884) |
| `SR.0:abelian-category/coefficient-change` | [coefficient-change](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L912) |
| `SR.0:abelian-category/smooth-centre` | [smooth-centre](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L933) |
| `SR.0:abelian-category/countable-schur` | [admissibility-of-irreducibles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2373) |
| `SR.0:derived-extension/grothendieck-abelian` | [grothendieck-abelian](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1597) |
| `SR.0:derived-extension/derived-smooth-category` | [derived-smooth-category](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1611) |
| `SR.0:derived-extension/derived-invariants` | [derived-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1660) |
| `SR.0:derived-extension/k-injective-resolutions` | [k-injective-resolutions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1638) |
| `SR.0:derived-extension/dg-enhancement` | [dg-enhancement](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1687) |
| `SR.0:derived-extension/compact-generation` | [compact-generation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1718) |
| `SR.0:derived-extension/derived-smooth-dual` | [derived-smooth-dual](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1735) |
| `SR.0:derived-extension/central-ext-vanishing` | [central-ext-vanishing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1780) |
| `SR.0:derived-extension/derived-hecke-algebra` | [derived-hecke-algebra](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1792) |
| `SR.1/locally-constant-compact-support` | [locally-constant-compact-support](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L978) |
| `SR.1/open-closed-sequence` | [open-closed-sequence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1003) |
| `SR.1/a-valued-haar-measure` | [a-valued-haar-measure](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1029) |
| `SR.1/integration` | [integration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1060) |
| `SR.1/convolution-algebra` | [convolution-algebra](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1092) |
| `SR.1/hecke-idempotent` | [hecke-idempotent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1123) |
| `SR.1/hecke-triple-compact-open` | [Existing supplier contract; see packet note](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L243) |
| `SR.1/permutation-hecke-algebra` | [permutation-hecke-algebra](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1152) |
| `SR.1/hecke-ring-comparison` | [hecke-ring-comparison](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1203) |
| `SR.1/locally-unital-algebra` | [locally-unital-algebra](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1236) |
| `SR.1/hecke-module-equivalence` | [hecke-module-equivalence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1268) |
| `SR.1/corner-irreducibles` | [corner-irreducibles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1291) |
| `SR.1/bernstein-centre-corners` | [bernstein-centre-corners](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1313) |
| `SR.1/l-adic-separatedness` | [l-adic-separatedness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1345) |
| `SR.1/iwahori-decomposition` | [iwahori-decomposition](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1369) |
| `SR.1/positive-hecke-homomorphism` | [positive-hecke-homomorphism](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1395) |
| `SR.1/strongly-positive-localisation` | [strongly-positive-localisation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1449) |
| `SR.1/pro-iwahori-torus` | [pro-iwahori-torus](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1462) |
| `SR.1/klingen-positive-hecke` | [klingen-positive-hecke](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1486) |
| `SR.1/iwahori-matsumoto` | [iwahori-matsumoto](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1505) |
| `SR.1/bernstein-presentation` | [bernstein-presentation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1535) |
| `SR.1/iwahori-hecke-centre` | [iwahori-hecke-centre](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1558) |
| `SR.2/smooth-induction` | [smooth-induction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1841) |
| `SR.2/compact-induction` | [compact-induction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1863) |
| `SR.2/frobenius-reciprocity` | [frobenius-reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1883) |
| `SR.2/induction-exactness` | [induction-exactness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1914) |
| `SR.2/induction-in-stages` | [induction-in-stages](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1925) |
| `SR.2/induced-invariants` | [induced-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1902) |
| `SR.2/l-sheaf-model` | [l-sheaf-model](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1939) |
| `SR.2/mackey-filtration` | [mackey-filtration](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1966) |
| `SR.2/modulus-character` | [modulus-character](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L1983) |
| `SR.2/jacquet-module` | [jacquet-module](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2035) |
| `SR.2/jacquet-lemma` | [jacquet-lemma](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2059) |
| `SR.2/parabolic-induction` | [parabolic-induction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2071) |
| `SR.2/first-adjointness` | [first-adjointness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2093) |
| `SR.2/induced-contragredient` | [induced-contragredient](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2108) |
| `SR.2/geometric-lemma` | [geometric-lemma](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2126) |
| `SR.2/principal-series-jacquet` | [principal-series-jacquet](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2145) |
| `SR.2/casselman-pairing` | [casselman-pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2188) |
| `SR.2/jacquet-invariants` | [jacquet-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2159) |
| `SR.2/borel-casselman-invariants` | [borel-casselman-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2203) |
| `SR.2/whittaker-functionals` | [whittaker-functionals](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2221) |
| `SR.3a/compact-representations` | [compact-representations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2290) |
| `SR.3a/cuspidal-representations` | [cuspidal-representations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2319) |
| `SR.3a/harish-chandra-compactness` | [harish-chandra-compactness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2345) |
| `SR.3a/jacquet-subrepresentation` | [jacquet-subrepresentation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2363) |
| `SR.3a/admissibility-of-irreducibles` | [admissibility-of-irreducibles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2373) |
| `SR.3a/hecke-algebra-decomposition` | [hecke-algebra-decomposition](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2422) |
| `SR.3a/commutative-subalgebra-bound` | [commutative-subalgebra-bound](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2444) |
| `SR.3a/uniform-admissibility` | [uniform-admissibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2453) |
| `SR.3a/finitely-many-cuspidals` | [finitely-many-cuspidals](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2469) |
| `SR.3/unramified-characters` | [unramified-characters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2505) |
| `SR.3/cuspidal-support` | [cuspidal-support](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2561) |
| `SR.3/finite-length` | [finite-length](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2545) |
| `SR.3/generic-irreducibility` | [generic-irreducibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2591) |
| `SR.3/bernstein-components` | [bernstein-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2605) |
| `SR.3/cuspidal-splitting` | [cuspidal-splitting](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2638) |
| `SR.3/bernstein-decomposition` | [bernstein-decomposition](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2670) |
| `SR.3/noetherian` | [noetherian](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2682) |
| `SR.3/bernstein-centre-blocks` | [bernstein-centre-blocks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2694) |
| `SR.3/finite-type-corners` | [finite-type-corners](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2711) |
| `SR.3/universal-unramified-twist` | [universal-unramified-twist](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2724) |
| `SR.3/centre-compatibilities` | [centre-compatibilities](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2752) |
| `SR.3/square-integrable-tempered` | [square-integrable-tempered](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2767) |
| `SR.3/casselman-criterion` | [casselman-criterion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2791) |
| `SR.3/langlands-classification` | [langlands-classification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2830) |
| `SR.3/borel-casselman-block` | [borel-casselman-block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2850) |
| `SR.3/steinberg` | [steinberg](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2893) |
| `SR.3/isotypic-quotient-regular` | [isotypic-quotient-regular](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2914) |
| `SR.2a/stabilization` | [stabilization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2955) |
| `SR.2a/jacquet-lemma-smooth` | [jacquet-lemma-smooth](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2976) |
| `SR.2a/jacquet-duality` | [jacquet-duality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L2988) |
| `SR.2a/second-adjunction-unit` | [second-adjunction-unit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3002) |
| `SR.2a/second-adjointness` | [second-adjointness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3036) |
| `SR.4/satake-transform` | [satake-transform](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3088) |
| `SR.4/twisted-weyl-invariance` | [twisted-weyl-invariance](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3115) |
| `SR.4/satake-isomorphism` | [satake-isomorphism](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3148) |
| `SR.4/torus-character-dictionary` | [torus-character-dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3158) |
| `SR.4/frobenius-component-invariants` | [frobenius-component-invariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3168) |
| `SR.4/pseudoroot` | [pseudoroot](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3184) |
| `SR.4/spherical-parameter` | [spherical-parameter](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3216) |
| `SR.4/c-group-formulation` | [c-group-formulation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3231) |
| `SR.4/gln-generators` | [gln-generators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3256) |
| `SR.4/hall-littlewood` | [hall-littlewood](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3269) |
| `SR.4/macdonald-formula` | [macdonald-formula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3315) |
| `SR.4/parabolic-descent` | [parabolic-descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3322) |
| `SR.4/paired-unitary-parameter` | [paired-unitary-parameter](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3361) |
| `SR.4/unitary-genericity` | [unitary-genericity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3378) |
| `SR.4/unitary-weyl-traces` | [unitary-weyl-traces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3406) |
| `SR.4/unitary-triangular-transform` | [unitary-triangular-transform](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3417) |
| `SR.4/unitary-isotropic-counts` | [unitary-isotropic-counts](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3434) |
| `SR.4/unitary-even-formulas` | [unitary-even-formulas](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3470) |
| `SR.4/unitary-odd-formulas` | [unitary-odd-formulas](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3487) |
| `SR.4/gsp4-spin-polynomial` | [gsp4-spin-polynomial](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3499) |
| `SR.4/gsp4-galois-comparison` | [gsp4-galois-comparison](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3525) |
| `SR.4/derived-satake` | [derived-satake](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3554) |
| `SR.4/unitary-iwahori-center` | [unitary-iwahori-center](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3571) |
| `SR.4/geometric-trace-contract` | [Existing supplier contract; see packet note](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L243) |
| `SR.5/twisted-coinvariants` | [twisted-coinvariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3621) |
| `SR.5/mirabolic-derivatives` | [mirabolic-derivatives](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3658) |
| `SR.5/derivative-exactness` | [derivative-exactness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3709) |
| `SR.5/schwartz-submodule` | [schwartz-submodule](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3724) |
| `SR.5/essentially-aig` | [essentially-aig](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3748) |
| `SR.5/integral-blocks` | [integral-blocks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4136) |
| `SR.5/type-projectives` | [type-projectives](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4194) |
| `SR.5/universal-whittaker` | [universal-whittaker](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4217) |
| `SR.5/co-whittaker` | [co-whittaker](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4279) |
| `SR.5/universal-domination` | [universal-domination](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4322) |
| `SR.5/reduced-family-reconstruction` | [reduced-family-reconstruction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4331) |
| `SR.5/llc-family-conditional` | [llc-family-conditional](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4439) |
| `SR.5/tensor-endomorphisms` | [tensor-endomorphisms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4481) |
| `SR.5/invariants-duality-base-change` | [coefficient-change](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L912) |
| `SR.5/ext-support-orthogonality` | [ext-support-orthogonality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4491) |
| `SR.5/cg-distinct-block` | [cg-distinct-block](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4507) |
| `SR.5/cg-derived-projector` | [cg-derived-projector](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4520) |
| `SR.5/highest-derivative-adapter` | [highest-derivative-adapter](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4531) |
| `SR.5/essential-vector-contract` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/crossed-cocycles` | [crossed-cocycles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4576) |
| `SR.6/finite-wild-discretization` | [finite-wild-discretization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4615) |
| `SR.6/finite-wild-representability` | [finite-wild-representability](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4629) |
| `SR.6/ell-adic-extension` | [ell-adic-extension](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4652) |
| `SR.6/wild-strata` | [wild-strata](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4665) |
| `SR.6/twisted-component-finiteness` | [twisted-component-finiteness](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4684) |
| `SR.6/tame-torus-engine` | [tame-torus-engine](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4695) |
| `SR.6/frobenius-quotient-finite` | [frobenius-quotient-finite](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4730) |
| `SR.6/excursion-algebra` | [excursion-algebra](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4741) |
| `SR.6/excursion-invariant-comparison` | [excursion-invariant-comparison](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4768) |
| `SR.6/geometric-hecke-action` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/excursion-center-action` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/torus-central-compatibility` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/parabolic-excursion-compatibility` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/z-finite` | [z-finite](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4786) |
| `SR.6/depth-generators` | [depth-generators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4814) |
| `SR.6/cuspidal-embedding` | [cuspidal-embedding](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L4854) |
| `SR.6/cuspidal-excursion-finiteness` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/integral-center-finiteness` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/parabolic-center-map` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/stable-operator` | [stable-operator](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md#L3949) |
| `SR.6/ell-adic-stability` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/cogenerators` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/jacquet-cogenerator-duality` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/integral-second-adjointness` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/integral-noetherian-consequences` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |
| `SR.6/cuspidal-reduction-consequences` | [Existing Part II target; qualified above](https://github.com/CBirkbeck/tauceti-explorer/blob/main/research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.4.json) |

## Reading record

All results and proof routes here are stated in our own words. No source passage,
PDF or extracted text is included. The following lists only the passages used
for the new targets and the qualified residual chain; imported bibliography
remains with the upstream targets. Public file hashes and versions are in the
packet. No restricted library book was used.

- **upstream-smooth**: Tau Ceti roadmap contributors, [Roadmap: smooth representations of local groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/10432b146c0828ab379e76f9c630a76578b98430/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md). TauCetiRoadmap merged PR #793, commit 10432b146c0828ab379e76f9c630a76578b98430 (14 October 2026). Read 16 October 2026: Scope and ownership; conventions; exact supplier contracts; target inventories SR.0–SR.6; SR.1.1 and SR.1.3; SR.0d; SR.2.3; SR.3.3–SR.3.4; SR.5.2 types, projectives, GL_n second adjointness and segments; SR.5.3; SR.6.1–SR.6.5; Suggested.lean import and end-theorem inventory.
- **dhkm**: Jean-François Dat, David Helm, Robert Kurinczuk and Gilbert Moss, [Finiteness for Hecke algebras of p-adic groups](https://arxiv.org/pdf/2203.04929v2). arXiv:2203.04929v2, 22 April 2022. Read 16 October 2026: Theorems 1.1, 1.2, 1.7; Corollaries 1.3–1.9, pp. 1–4; §2, especially Theorem 2.3 and Corollary 2.6, pp. 4–9; §3, Lemmas 3.1–3.4 and Corollary 3.5, pp. 9–11; §4, Theorems 4.1 and 4.3, Lemmas 4.4–4.10, Corollaries 4.11–4.12, pp. 11–16.
- **fs**: Laurent Fargues and Peter Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4, 2024 revision. Read 16 October 2026: Corollary V.1.4, pp. 170–171, derived smooth duality; VIII.4.1, pp. 291–292; IX.0.1–IX.0.3, pp. 317–319; IX.5.1–IX.5.2, pp. 327–329; IX.6.1–IX.6.5, pp. 330–333; IX.7.2–IX.7.3, pp. 335–338.
- **ding**: Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf). Publications mathématiques de l’IHÉS 142 (2025), 1–74, published 10 July 2025. Read 16 October 2026: §3.1.1, pp. 33–34, smooth character and induction conventions; Proposition 3.3 and proof, pp. 35–36, smooth part of the tangent comparison; §3.6, discussion after (3.55), p. 57, completed centres and first-order quotients.
- **ceggps**: Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin, [Patching and the p-adic local Langlands correspondence](https://arxiv.org/pdf/1310.0831v5). arXiv:1310.0831v5; page numbers in that PDF. Read 16 October 2026: §3.13, pp. 44–48, rationality and splitting field; Lemma 3.22, p. 47, invariant-ring description of the Bernstein centre.
- **gs**: Wee Teck Gan and Gordan Savin, [Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1). arXiv:2102.00372v1, 31 January 2021. Read 16 October 2026: Introduction, pp. 3–4, cuspidal summands; Proposition 5.3 and proof, pp. 17–18, use of discrete-series projectivity in the tempered category.
- **os**: Eric Opdam and Maarten Solleveld, [Resolutions of tempered representations of reductive p-adic groups](https://arxiv.org/pdf/1203.1237v2). arXiv:1203.1237v2, 1 October 2012; PDF bears 21 November 2018 date. Read 16 October 2026: Introduction, pp. 1–3; §1 and Theorem 2.2, pp. 3–8, building resolution and contraction; §3, pp. 9–12, Schwartz algebras and module categories; Theorem 4.2, pp. 14–16; Proposition 4.3, pp. 16–17.
- **sz**: Peter Schneider and Ernst-Wilhelm Zink, [The algebraic theory of tempered representations of p-adic groups, Part II: Projective generators](https://www.uni-muenster.de/FB10/u/pschnei/publ/pap/smod2-II.pdf). Author PDF, 53 pages; accessed 16 October 2026. Read 16 October 2026: §1, centres of idempotented rings; §2, pp. 4–9, discrete components and Proposition 2.3; Corollary 3.5, pp. 17–18, unramified families versus individual discrete series.
- **he**: Xuhua He, [Cocenters of p-adic groups, I: Newton decomposition](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/803823BBCAD2701B79B7C5C7BF72C1B5/S205050861800001Xa.pdf/cocenters_of_p_adic_groups_i_newton_decomposition.pdf). Forum of Mathematics, Pi 6 (2018), e2, published open-access PDF. Read 16 October 2026: §1.1–§1.2, pp. 6–7, compactly supported functions and integral Haar normalization.

## Stage coverage

| Stage | Status | Work remaining |
| --- | --- | --- |
| `SR.0` | planned | Import upstream SR.0 and the existing discrete-carrier equivalence; preserve the arbitrary-ring scope rather than adding an analytic topology on modules. |
| `SR.0:abelian-category` | planned | Import the early abelian API and existing atlas IDs; its supplier construction is planned upstream, not implemented at the pins. |
| `SR.0:derived-extension` | planned | Resolve G-DERIVED-ENHANCEMENT; upstream SR.0d supplies derived smooth duality and derived Hecke targets. |
| `SR.1` | planned | Construct the new compact-section cosheaf API; discharge the enhanced degree-zero-centre comparison in G-DERIVED-ENHANCEMENT. |
| `SR.2` | planned | Use the exact upstream induction/Jacquet adjunctions; retain the boundaries in G-CONDITIONAL-CLASSIFICATION. |
| `SR.2a` | planned | Import the independent characteristic-zero stabilization and second-adjunction construction, including unit, counit and both triangle identities. |
| `SR.3` | planned | Discharge the new Schwartz and principal-series targets, the three supplier requests, G-SCHWARTZ-ANALYSIS, G-PRINCIPAL-EXT and the conditional tempered-support boundary. |
| `SR.3a` | planned | Import the early Bernstein/Burnside bound; do not substitute the later finite-centre result as an input. |
| `SR.4` | planned | Import the current Satake targets and their coefficient/normalization dictionaries; retain the inherited count and nonsplit boundaries in G-CONDITIONAL-CLASSIFICATION. |
| `SR.5` | planned | Retain G-ESSENTIAL and the existing conditional interpolation/modular-theory hypotheses; import rather than reconstruct the upstream derivative and integral-block targets. |
| `SR.6` | planned | Resolve G-GEOMETRIC-ACTION, G-DAT-CONSEQUENCES and G-OWNERSHIP; complete the existing-ID DHKM chain and use the new finite-central-algebra interface with its exact coefficient regime. |
