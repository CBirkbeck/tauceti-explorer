# Roadmap: parameter stacks, invariant theory and spectral coefficients

Construct the moduli of continuous L-parameters and the algebraic/categorical invariant
theory that supports excursion operators and spectral action. This develops reusable
theory for every connected reductive E-group G; it does not assume a correspondence
with irreducible representations. Dependencies:
[ReductiveGroupsPartII](../ReductiveGroupsPartII/README.md),
[EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) E0/E3/E5,
[VStackSheavesAndLisseCategories](../VStackSheavesAndLisseCategories/README.md) VS2–VS3,
upstream LocalFieldsRamification, ProfiniteCohomology and ReductiveGroups.

Use the standard pinned action of W_E on the dual group over Z_ell, ell != p.
Do not conflate ordinary group homomorphisms W_E → dual G with cocycles for a nontrivial
action. The L-group is a semidirect product with its specified projection to W_E (or
the finite quotient through which the pinned action factors).

## LP0. Weil groups and continuous cocycles

Use the local-field Weil-group carrier, inertia and wild inertia with their topologies.
Construct nonabelian continuous/condensed 1-cocycles, twisted conjugation, restriction,
scalar extension and sections of the L-group projection. Establish equivalence of these
descriptions. Finite wild ramification means triviality on an open subgroup P of wild
inertia; it does not mean the whole parameter factors through a finite Weil quotient.

For each such P stable under the relevant action, choose and construct the dense
discretization W in W_E/P using tame inertia and Frobenius. Prove the source's unique
extension theorem from W to condensed W_E/P, including the topological unipotent
binomial-series argument and its coefficients. Pin the relation sigma^(-1) tau sigma
= tau^q or its explicitly identified inverse convention. A choice of tame generator is
auxiliary, and change-of-choice comparison is part of the interface.

## LP1. Representability and local complete intersection geometry

Construct the affine scheme Z^1(W_E/P,dual G) over Z_ell from the finite presentation
and equations, prove its functor of points and representability independence of W, and
glue the open-and-closed pieces over P to Z^1(W_E,dual G). Prove flatness and local
complete-intersection structure, including the dimension dim G for each finite wild
piece, with the exact source hypotheses. Construct twisted conjugation and the quotient
stack. The quotient stack retains automorphisms and is not its affine invariant quotient.

Build derived affine schemes, fpqc quotient stacks, quasi-coherent modules, perfect
complexes and their pullback/descent from EnhancedDerivedSheaves E5:animation and
E5:presentability. Import the generic cotangent construction from
[DerivedDeRhamCohomology DD.0](../DerivedDeRhamCohomology/README.md#dd0-cotangent-complexes-and-derived-exterior-powers).
Construct the derived mapping stack over the finite pinned-action quotient, its tangent
complex by cocycle cohomology, and the comparison with the classical cocycle scheme
where the source proves it underived. Show how obstructions and centralizers appear;
an equality of classical points does not establish this comparison.

## LP2. Coarse quotient and excursion presentation

<a id="lp2-excursion-presentation"></a>
<a id="stage-LP2:excursion-presentation"></a>
### LP2:excursion-presentation — Unrestricted excursion algebra

Inputs: LP0–LP1 and E5:abstract. Construct Exc(W,dual G) from finite free-group
cocycle invariants and prove FS VIII.4's universal property. Its canonical map to
the invariant-coordinate algebra is a universal homeomorphism in the general
coefficient case, not always an isomorphism. Keep this algebra as the source of
operators when the integral invariant-base-change hypothesis fails.

<a id="lp2-semisimple-characters"></a>
<a id="stage-LP2:semisimple-characters"></a>
### LP2:semisimple-characters — Geometric characters without a good-prime exclusion

Prove FS VIII.3.8: excursion characters over an algebraically closed field L of
characteristic different from p determine a unique **conjugacy class** of continuous
semisimple L-parameters, with the required finite wild ramification. Construct
the representative from the compatible invariant evaluations, prove simultaneous
conjugacy/complete reducibility and continuity, and prove independence of the
finite-wild/discretization choices. This stage does not require the integral
base-change/generation theorem below, nor a restriction on |π₁(dual G)_tors|.

<a id="lp2-integral-invariants"></a>
<a id="stage-LP2:integral-invariants"></a>
### LP2:integral-invariants — The stronger spectral-coordinate theorem

Inputs: LP2:excursion-presentation and LP3. Keep this late return separate from
LP2:semisimple-characters so that the latter does not inherit an artificial good-prime
restriction. The invariant algebra, its base change and excursion isomorphism require
the precise FS VIII.3.6/VIII.5.1 hypotheses.

Construct the invariant algebra and the affine coarse quotient on each finite-wild piece,
its universal property for invariant maps, change of coefficients and the relation to
closed semisimple geometric orbits. Distinguish semisimplification from a full Weil–Deligne
parameter with monodromy. No Galois pseudorepresentation for GL_n alone defines the
general reductive quotient.

Prove the presentation of the invariant algebra by all finite free-group cocycle spaces
mapping to W, with the reindexing and multiplication relations of FS VIII.3–VIII.4.
Construct transition maps under shrinking P and continuity of evaluations on W_E.
For integral coefficients impose ell not dividing the torsion order of pi_1(dual G)
for the base-change/vanishing/generation theorems that require it. Prove the rational
versions separately without that restriction.

## LP3. Integral reductive invariant theory

Inputs: LP1, EnhancedDerivedSheaves E5:abstract/E5:presentability and RG2.5's dual
group on the upstream rational-representation carrier; not LP2:integral-invariants.

Construct highest-weight modules, Weyl and dual-Weyl modules, good filtrations, the
good-filtration t-structure and the relevant Ext-vanishing criteria using upstream
root-data/representation carriers. Prove stability under tensor, induction and restriction
under the FS VIII.5 hypotheses. These integral statements are not consequences of
characteristic-zero semisimplicity.

For a finite group P of order prime to ell acting on a reductive group in characteristic
ell, construct the fixed-point subgroup, prove smoothness/reductivity of its identity
component and the prime-to-ell component-group order. Under the source's solvability
hypothesis prove the Donkin subgroup property and generation of perfect complexes by
restriction. Preserve solvability and group-order hypotheses. Prove the good-filtration
and invariant cohomology results used in VIII.5.1, including vanishing of higher group
cohomology of the cocycle coordinate algebra and base change of invariants.

## LP4. Perfect complexes on parameter stacks

Inputs: LP1, LP3, E5:abstract/E5:presentability and VS2's coefficient interpretation.
LP4 does not assume ES's spectral action; it supplies its universal algebraic input.

Construct Perf on the finite-wild quotient and its action of Rep(dual G). Prove generation
by representation bundles under cones, shifts and retracts, and the comparison of
Ind-Perf with module objects over the cocycle algebra in Ind-Perf(B dual G). Establish
the finite-free-group colimit theorem and its universal property for exact monoidal
functors. Integral proofs use LP3; rational proofs use the separate reductive invariant
theory. The infinite union is non-quasicompact, so define the required compact-support
factorization through one finite-wild piece for each object of a consumer category.

## Acceptance and sources

Tests: split/nonsplit tori, GL_2 unramified cocycles, a nontrivial finite wild image,
scalar extension Z_ell → F_ell and Q_ell, and a quotient point with nontrivial centralizer.
Verify tame relation, twisted conjugation and independence of discretization. Include
the source's characteristic-two fixed-group counterexample as a guard against removing
prime-to-ell assumptions. Integral acceptance retains ell != p and ell not dividing
|pi_1(dual G)_tors| for LP2–LP4 results needing it; rational acceptance drops only the
latter restriction where proved.

Primary source: FS VIII.1–VIII.5,
especially VIII.1.3, VIII.3.5–VIII.3.6, VIII.5.1 and VIII.5.14–VIII.5.19; X.1 and X.3.
The independent parameter-moduli sources DHKM and Zhu in the reference ledger support
LP1; the actual common derived algebra construction is E5, not a missing prerequisite.

## Completion contracts added on 2026-09-15

**Applies to:** `LP0`, `LP1`, `LP2:excursion-presentation`, `LP2:semisimple-characters`, `LP3`, `LP4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct finite-wild equations using a chosen tame generator and Frobenius, then prove change-of-generator independence as an isomorphism of moduli functors. Compute tangent and obstruction groups from continuous adjoint cocycles, retaining automorphisms in degree −1 for the quotient stack convention. Compare the classical cocycle scheme with the derived mapping object by the source's amplitude calculation, never from equal geometric points alone.

### Producer–consumer contract

Keep three separate exports: excursion algebra, invariant-coordinate algebra and Perf of the quotient stack. A universal homeomorphism of spectra does not identify their integral rings. LP2 semisimple geometric characters survive primes excluded from LP3's integral invariant base-change theorem.

### Acceptance and source route

Test a nonsplit torus cocycle, nontrivial wild image, nontrivial centralizer, and derived reduction at a bad prime. The semisimple parameter must not be presented as a full Weil–Deligne pair.

**Source route:** FS VIII.1–VIII.5, especially VIII.3.8 and VIII.5.1; X.0–X.3. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
