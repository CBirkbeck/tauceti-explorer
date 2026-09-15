# Roadmap: Global Galois duality and compact coefficients

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Supply the global cohomological calculations behind deformation rings and Taylor–Wiles primes. The two substantial additions to the existing portfolio are Poitou–Tate duality and a justified passage from finite discrete coefficients to compact p-adic coefficients.

## Existing material and ownership

ProfiniteCohomology owns the canonical continuous cohomology object, explicit low-degree cocycles, restriction/corestriction, cup products, Shapiro and discrete-coefficient exact sequences. ClassFieldTheory already owns local Tate duality for finite modules, their local finiteness and Euler-characteristic formula. Neither is rebuilt here. ProfiniteCohomology explicitly excludes the Hochschild–Serre spectral sequence and non-discrete coefficients; those extensions are owned here and must be compared with its canonical object.

## Conventions

Use continuous cochains with the coefficient topology. Infinite places are included; at p=2 use the modified/Tate cohomology required by global duality. Local conditions are specified subgroups or subcomplexes with named maps, not arbitrary dimensions. Dual conditions are annihilators under the actual local pairing.


<a id="r02-1"></a>

## R02.1. Topological coefficients and inverse limits

**Milestone:** `R02.1`

Construct cohomology for lattices and their torsion quotients through a comparison with the canonical continuous-cohomology construction. Prove the relevant Mittag–Leffler and lim¹ statements before interchanging cohomology and inverse limit. Treat T, V=T[1/p], and V/T separately. Include completed tensor products of coefficients only with hypotheses ensuring the expected exactness. A finite-dimensional abstract vector space with a forgotten topology is not an admissible substitute.

**Dependencies:** [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1).

<a id="r02-2"></a>

## R02.2. Hochschild–Serre and descent

**Milestone:** `R02.2`

Build the spectral sequence for a closed normal subgroup in the cases needed by arithmetic applications, including its topology and convergence conditions. Identify the low-degree sequence with the existing inflation–restriction maps. Prove restriction/corestriction identities and the precise descent consequences for finite extensions of number fields. This layer is a general extension to the cohomology owner, not a private deformation-theory cohomology.

**Dependencies:** R02.1 (preceding layer).

<a id="r02-3"></a>

## R02.3. Global finiteness and cohomology with restricted ramification

**Milestone:** `R02.3`

Define G_{F,S}, including the archimedean and p-adic places demanded by the theorem. Prove finiteness of finite-coefficient cohomology, bounds on cohomological dimension with the real-place exceptions, and the global Euler-characteristic formula. Construct compactly supported arithmetic cohomology using the localisation map and the corrected infinite-place terms. Identify the global restriction maps with the placewise maps of R01.

**Dependencies:** R02.2 (preceding layer).

<a id="r02-4"></a>

## R02.4. Poitou–Tate duality

**Milestone:** `R02.4`

Prove the finite-module duality and exact sequence from the global class-field-theory and local-duality inputs. Specify the dual M^∨(1), the evaluation pairing, local invariant maps and their sum, and the restricted product where needed. Derive the lattice and rational-coefficient versions with all limit arguments recorded. The proof must include global duality itself; summing the local perfect pairings does not by itself prove it.

**Dependencies:** R02.3 (preceding layer).

<a id="r02-5"></a>

## R02.5. Selmer groups and local conditions

**Milestone:** `R02.5`

Import the Selmer local-condition/mapping-fibre construction from SelmerIwasawaCohomology L2; identify its first cohomology with the explicit global H¹ restriction kernel used in deformation theory, and compare changes of one local condition or addition of a prime. Derive the dimension formula used in global deformation presentations and auxiliary-prime arguments. Relate tangent conditions of finite-flat, ordinary and fixed-type deformation problems to the corresponding local H¹ subspaces; the deformation-specific calculations are owned by R08.

**Dependencies:** R02.4 (preceding layer).

<a id="r02-6"></a>

## R02.6. Cohomological requirements of patching

**Milestone:** `R02.6`

State and prove the global numerical inequalities used in KW II §4 and the dual-Selmer-killing argument of §5, with infinity and p=2 contributions visible. Record the exact adjoint module: trace-zero endomorphisms, its dual, and determinant-fixed tangent spaces cannot be identified by dividing by 2. Export named finiteness, dimension and annihilator results for R04 and R22, not an assumed “balanced deformation problem”.

**Dependencies:** R02.5 (preceding layer).

## Required examples and checks

Compute local and global duality for μ_p and Z/p using the existing reciprocity normalisation. Include Q at p=2 as a required test, not just totally imaginary fields. Compare finite-level and lattice H¹ in an explicit unramified example.



## References

KW2, MAZUR89, NSWC. The bibliography records what was inspected and what remains to be transcribed.

<a id="d7"></a>

## D7. Continuous derived cohomology and dimension-general duality

This roadmap is the substantial Part II extension of upstream ProfiniteCohomology, under a descriptive arithmetic title. Upstream retains its discrete continuous cochain/cohomology construction. This roadmap is the sole generic owner of its compact-coefficient and derived extension, the comparison with discrete coefficients, derived inverse limits, full continuous Hochschild–Serre and edge maps, compact-support arithmetic cohomology and finite/lattice Poitou–Tate duality. Local Tate duality for finite modules remains upstream ClassFieldTheory. SelmerIwasawaCohomology owns particular Selmer local conditions, mapping fibres and Iwasawa specialization/control; the cyclotomic (φ,Γ)/ψ comparison is PhiGammaModulesAndIwasawaCohomology.

For a number field F, finite set S containing primes above p and infinity, and a finite projective continuous coefficient module T, construct the localization morphism of continuous cochain complexes and the compact-support fibre. Specify topological restricted products, unramified subgroups, their transition maps and the topology in each finite/compact/discrete coefficient regime. Construct the derived-limit comparisons and retain lim¹ contributions until a proved Mittag–Leffler condition eliminates them. Prove continuous Hochschild–Serre with its convergence hypotheses, five-term/edge maps and agreement with the discrete upstream construction. Restriction, corestriction, cup products, Shapiro and local invariant maps obey one reciprocity/sign normalization.

Prove derived local and global duality using the derived O-linear or Pontryagin dual and Tate twist, retaining modified Tate terms at real places when p=2. Give finite, compact and discrete torsion formulations with the inverse-limit and continuous-dual hypotheses used in passage between them. Prove perfectness/amplitude only in the finite-generation and coefficient hypotheses that imply it, including the distinction between globally compact-supported complexes and arbitrary local-condition complexes. Recover the finite nine-term sequence and the lattice/rational sequences without silently discarding topological closure or derived-limit terms.

<a id="d8"></a>

## D8. Selmer and deformation comparisons

Import the Selmer complex from SelmerIwasawaCohomology L2: its local condition is an actual morphism U_v→C•(G_v,T), and its definition is the shifted cone of global plus local-condition complexes mapping to local cochains. Compare its H¹ with R02.5's deformation Selmer kernel and transport D7 duality along the proved triangle; do not define a second Selmer carrier. Prove the dual Selmer dimension calculation in all ranks, including trace-kernel exceptions when p divides n. Construct determinant/deformation tangent complexes from the actual restriction maps. Local p-adic conditions and their tangent maps belong to LocalGaloisDeformationRings. Provide a change-of-coefficients spectral sequence accounting for Tor; underived specialization holds only after its Tor terms vanish.

## Source anchors and prototype coverage

- ArithmeticGaloisDuality source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `R02.1` | Construct topological cochains for T, V and V/T, together with finite-quotient comparison and the actual derived-limit triangle; record topology in every restriction/dual map. |
| `R02.4` | Build the global pairing using compact support and modified real-place terms, then prove perfection and the finite/lattice exact sequences. Orthogonality uses the same local invariant normalization. |
| `D8` | Derive the comparison of a Selmer cone with the classical H1 kernel, retaining H0 corrections. Trace-zero adjoint duality when p divides the rank needs its own exact sequence. |

**Producer–consumer handoff.** SelmerIwasawaCohomology L2 owns local-condition cones; deformation theory receives only the transported tangent/annihilator formula, preventing a second cohomology carrier.

**Acceptance.** Check Q at 2, μ_p and Z/p, and a coefficient specialization with nonzero Tor.

**Source-readiness boundary.** Continuous global duality and compact coefficient hypotheses still require full NSW/Milne source decomposition.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
