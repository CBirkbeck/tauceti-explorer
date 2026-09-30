# Red team: profinite and pro-p group links

Codex — codex-rtOQ9t, 30 September 2026. Issue #4355.
Target: `LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups`.
This session neither wrote nor reviewed the target; its accepted review names
session codex-7e92bd. This red-team result is complete, with four findings
awaiting independent verification: two high and two medium.

The 34 links have supported mathematical relationships and all 109 evidence
quotations match the repository. The problems are two uncorrected supplier
interfaces, including a missing outgoing dependency, and two overlap proposals
that do not account for proofs already available at the pinned libraries.
No target packet or upstream file was edited.

## Findings

### 1. Continuous sections already exist — medium

Overlap 1 proposes removing the finite-kernel section milestone from PPG
Layer 5 and optionally moving its elementary proof into PC Layer 0. The
reviewed AUDIT-22 record already classifies the general theorem as built.

At Tau Ceti `f790474`, [Section.lean, line 226](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/Section.lean#L226)
proves `TauCeti.exists_continuous_section`: for compact totally disconnected
G and closed H, the quotient map has a continuous right inverse normalized
at the identity. A finite normal kernel is closed, so the PPG case is an
instance. The same file, line 253, proves the normalized between-quotients
version `exists_continuous_section_of_le`.

The overlap should cite these imports and identify only any missing wrappers
or comparisons. It should not create a new proof task or relocate an already
formalized theorem between upstream roadmaps. This is a correction to the
proposed implementation boundary, not a counterexample to the section theorem.

### 2. General algebraic Weierstrass theory is also built — medium

Overlap 6 sends the broader O-coefficient theorems to PMIA L4 without stating
that the algebraic existence and uniqueness statements are already in Mathlib.
The reviewed AUDIT-26 record makes the distinction: algebraic division and
preparation are built; continuity is a remaining obligation.

At Mathlib `082e2d3`, [WeierstrassPreparation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean#L504)
provides `exists_isWeierstrassDivision` over a local ring complete for its
maximal ideal, with nonzero reduction of the divisor. The complete-DVR case
is a specialization. `IsWeierstrassDivision.unique` is at line 594;
`exists_isWeierstrassFactorization` and its uniqueness theorem are at
lines 813 and 855.

Import these algebraic theorems. Keep continuity, coordinate comparisons and
the identification of the linear-factor remainder with evaluation as distinct
remaining work. Preserve the specialized upstream API and its elementary
proof route. Nothing in this finding claims that Mathlib already implements
the completed-group-ring coordinate or the full PMIA layer.

### 3. The all-degree Shapiro supplier asks for a false chain isomorphism — high

The PC10 → PPG6 link correctly identifies an all-degree dependency. But PC10's
construction demands `shapiroCochainIso`, an isomorphism of the two canonical
homogeneous-cochain complexes. That cannot exist as stated.

Take finite G=C₂, H=1 and A=𝔽₂. In degree zero,

```text
C⁰(G, Coind₁ᴳ A) ≅ Map(C₂,𝔽₂),  dimension 2;
C⁰(1,A)         ≅ 𝔽₂,           dimension 1.
```

This is also true on the actual homogeneous model: an equivariant map
G→Coind₁ᴳ A is determined by its arbitrary value at the identity. Thus its
underlying set has four elements, while the target has two. The pinned
[Mathlib canonical complex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L94)
is the invariants of the shifted coinduction resolution, exactly the model
used in this calculation. Exhaustive enumeration independently checked the
four-versus-two count.

The correction is a chain comparison proved to be a quasi-isomorphism, or a
chain-homotopy equivalence, inducing the Shapiro isomorphism on cohomology.
Keep its low-degree compatibility and acyclicity/dimension-shifting exports.
Keep the dependency edges; qualify the supplier interface and record the
upstream correction for the maintainer. The PC10 → PPG7 edge for all-degree
exactness remains needed. Shapiro's cohomology theorem is not in dispute.

### 4. The profinite-integer examples need the owned group, not generic procyclicity — high

PC's §6 assigns the Ẑ examples to Layers 4, 6, 10 and 11. It permits building
Ẑ again or replacing it by an arbitrary procyclic group with a generator.
The map records only incoming PC links and misses this outgoing use of PPG's
Layer 4 carrier. The ownership statement is the same one already used by the
map's Belyi links.

The unrestricted alternative is false. C₂ has a topological generator, but
H²(C₂,𝔽₂)≠0, whereas the example requires vanishing for torsion coefficients.
In additive C₂ notation, the normalized cocycle

```text
c(1,1)=1;   c(0,a)=c(a,0)=0
```

is nonzero modulo coboundaries. For a normalized one-cochain b,
δb(1,1)=b(1)−b(0)+b(1)=0. The cocycle identity holds on all eight triples.
An exhaustive computation found two normalized cocycles and one coboundary,
so H² has two classes. No topological subtlety is involved: both groups and
coefficients are finite discrete.

Add the PPG4 → PC4/PC6/PC10/PC11 example dependencies with evidence on both
sides. Require the existing `zHat` completion group, or an explicit isomorphism
to it, and record a maintainer correction removing the arbitrary-procyclic
alternative. The consumer retains the cohomology proof; PPG retains the group
carrier. A ring structure on the profinite integers is not needed here.

## Link-by-link check coverage

Numbers here are one-based positions in the target's `links` array.

| Links | Contract checked | Outcome |
|---|---|---|
| 1 | Finite discrete action factors through a finite quotient | Correct input for the pro-p filtration |
| 2–3 | Canonical coefficients and coefficient maps | Correct; retain the Z/F_p comparison in overlap 3 |
| 4–6 | Explicit cocycles, degree-one comparison and five-term sequence | Correct endpoints and roles |
| 7–8 | Low-degree exactness for dévissage, prescription and dimension arguments | Existing degree-range qualifications are necessary |
| 9–10 | Closed-subgroup coinduction and low-degree Shapiro | Correct low-degree use; all-degree construction is finding 3 |
| 11 | Hom-valued cup pairings and C₂ computation | Supplies the pairing, not its perfection or trace |
| 12–15 | All-degree operations and cohomological dimension | Keep edges; findings 3–4 correct the supplier boundary |
| 16–17 | Canonical cup and projection formula | Correct; trace normalization remains the consumer's task |
| 18, 34 | Two-/three-term finite Euler additivity | Correct provenance; the bounded finite-dimensional theorem is already in Tau Ceti |
| 19–23 | Completion, maximal pro-p quotient, free groups and peripheral descent | Correct retained Belyi specifications; no fabricated successor IDs |
| 24 | Completed group ring and procyclic coordinate for Iwasawa theory | Correct; arithmetic actions remain downstream |
| 25 | Abelian pro-p groups as compact Z_p-modules | Correct for principal units, not all local units |
| 26 | Profinite finite-quotient foundations for completed group rings | Correct |
| 27–29 | Abstract Sylow/pro-p structure in valuation arguments | Correct; valuation identifications remain downstream |
| 30–31 | Pro-order and index invertibility for Haar/Hecke normalization | Correct with the stated coefficient restrictions |
| 32 | Congruence groups as limits of finite p-groups | Correct structural input |
| 33 | Exactness through H²(C)→H³(A) for the three-term Euler formula | Necessary all-degree input; PC5 alone stops too early |

All 38 distinct endpoint/overlap descriptions were read, including 28 outside
PPG. Four evidence quotations use whole-document context rather than the
stage excerpt, as PROTOCOL §10 permits: links 21, 24, 25 and 26.

The seven overlap recommendations were checked individually. The closed-subgroup
continuity proposal correctly requires a G-module before restricting to open
overgroups. The coefficient-object proposal correctly distinguishes the Z and
F_p coefficient categories. The nonabelian power proposal preserves the
abelian upstream API and the ProfiniteArithmetic owner. The completed-algebra
proposal correctly retains continuous coefficient-extension data and compactness
hypotheses. The topology correction correctly distinguishes (p,T)-adic topology
from T-adic topology and group-quotient kernels. The embedding-problem proposal
correctly leaves properness and local arithmetic conditions downstream. Findings
1–2 concern the remaining library-use defects in the section and division
recommendations.

## Screen, graph and reproducibility

The fresh screen covered 212 integrated roadmaps and 1,968 stages, plus all nine
separate roadmap records. It searched the focal names, named group APIs and the
relevant pro-p, Sylow, Frattini, supernatural, completed-algebra and symplectic
terms. Plausible unmatched hits in completed cohomology, Hecke stacks,
v-stack sheaves and arithmetic Iwasawa stages were read. Their local-group or
arithmetic interfaces do not establish additional direct PPG dependencies.
The Mordell roadmap's symplectic-basis hit concerns characteristic-zero
monodromy; it is not the finite-field form classification in PPG9.
This is a catalogue screen, not a claim of full readings of all unrelated papers.

The three LocalFieldsRamification edges already occur in its accepted link
packet, so they are not reported as missing. ProfiniteArithmetic and
LocalGaloisGroups have no concrete atlas stage IDs at this baseline; requests
must retain those ownership boundaries without inventing endpoints.

The union of 3,508 atlas stage edges and all 25 accepted link maps contains
4,116 distinct edges. Tarjan's algorithm found no strongly connected component
touching PPG. The upstream extract has no internal edges; the diagnostic does
not pretend to reconstruct all unrecorded mathematical dependencies.

The result records the repository commit, target SHA-256 and both full library
pins. Pinned declarations and the relevant reviewed AUDIT-22/AUDIT-26 records
were read on 30 September 2026. The extra Euler check read
`HomologicalComplex.eulerChar_forgetFG_eq_homologyEulerChar` in Tau Ceti's
`Algebra/Homology/EulerCharacteristic/FiniteDimensional.lean`, line 143, with
its explicit boundedness and finite-dimensional coefficient category.

The finite counterexamples above are fully specified and do not depend on a
retained scratch program. Red-team validation, intake validation for the two
files and whitespace checks pass. No Lean file was required or compiled.
