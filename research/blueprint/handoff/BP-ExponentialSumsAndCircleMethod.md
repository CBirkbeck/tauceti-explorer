# BP-ExponentialSumsAndCircleMethod — CRT character continuation

Worker: Codex — `codex-hjdg0j`. Refs #1040. Checkpoint on 27 September 2026, based on main `5f2181ae83fa4ca8d6a5f45d51fd4a160223cb31`. Winning claim: [5854951479](https://github.com/CBirkbeck/tauceti-explorer/issues/1040#issuecomment-5854951479), confirmed by [5854954200](https://github.com/CBirkbeck/tauceti-explorer/issues/1040#issuecomment-5854954200).

## Result and scope

Ten new ES.0 nodes connect the arithmetic block packing to actual Dirichlet characters. They compose native CRT/unit/finite-product homomorphism equivalences, reconstruct at all integers, identify the exact product and component conductors, retain quadraticity, and supply a primitive first factor. The final character-block theorem includes the strict factor count and the interval-length threshold. It does not assert the Graham–Ringrose bound or full Proposition 8.2.

All35 inherited node objects are preserved exactly. The reader has been regenerated from the full packet so that its overview, source ledger, proof plans and verification counts agree with the current45-node checkpoint. The old overview and routing entries still described21 or26 nodes and open character interfaces; those descriptions are corrected. All six stages remain partial and all nodes unchecked.

## Reuse and ownership

The pin already contains ZMod.prodEquivPi, Units.mapEquiv, MulEquiv.piUnits, Pi.monoidHomMulEquiv and MulChar.mulEquivToUnitHom. The proposed crtCharacterEquiv only composes them. It introduces no character, conductor, residue-ring or unit-group carrier.

Exact supplier nodes found and read in ClassicalArithmeticCompletion:CA.1:

- `primitivity-of-a-product-at-coprime-levels` supplies binary primitive-product preservation; ES has only its finite-family adapter.
- `odd-part-of-a-quadratic-conductor-is-squarefree` supplies squarefree Q.
- `two-adic-conductor-bound` supplies a≤8 in D=aQ.

These close the previously unmatched conductor-shape interface for this application. Their proofs are not duplicated. AN.5 retains the exact explicit and uniform divisor-bound suppliers. RS-03 and the accepted RS-07 boundaries for FF, AC, AN.3 and SV.2 are retained. No cross-roadmap request is needed.

## Mathematical boundary cases

For σ modulo M, D=cond(σ), and R the product of primes of M absent from D, the period DR divides M and can be smaller. The character lifted from its primitive inducer to DR gives precisely the inherited exclusion mask at every integer. CRT component conductors equal gcd(D,nᵢ). Thus the distinguished block dividing D is primitive. The other factors keep their ambient moduli, as the corrected Theorem6 requires.

The algebraic equivalence and its integer evaluation allow empty and modulus-one families, including a zero modulus whenever pairwise coprimality permits it. Conductor-product statements require all moduli positive. The analytic blocks have every modulus greater than one. The source counts all factors as r; the new Lean form indexes by Fin(r+1), and bounds r+1. Its maximum over the other moduli is zero for a singleton family.

The accepted E11 review allows an empty principal family. Nothing changes the original two-small-block bound or alleges a missing R=1 case. The inherited E2/E3/E11 source findings and all source-version objects are unchanged. No new source finding or fresh global correction search is claimed.

## Reading and checks

Read the full claimed issue, all six reviewed AUDIT-07 rows, the inherited packet/reader/seed/handoff, atlas/campaign scope, the applicable protocol and style inputs, RS-03 with its review, the ES-relevant RS-07 ownership and its review, and all ES-related entries in both link directories (52 files). The negative link screens have differing declared depths and are not proofs of absence. The two style readers used were ArithmeticDirichletSeries and Multiquadratic.

The published Bennett–Siksek PDF was hash-verified and §8.1, printed pp.376–379, reread. Its SHA-256 is `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`. Relevant extraction items44 and92–97, the accepted route review, E2/E3/E11 and their independent review were checked. The external Graham–Ringrose proof was not read; no whole-paper coverage is claimed. Newly cited pinned library statements and their surrounding assumptions were read from source, with blobs checked against the pin trees.

The pinned-index checker passes without errors or warnings. Inventory:45 nodes (28 lemmas,16 theorems,1 definition),96 baseline declarations,28 API items,48 packet tests,68 typed examples,6 planets,8 gaps,0 requests and6 partial stages. The definition has7 API items and6 tests. All35 inherited nodes, their21 API items and42 packet tests are unchanged, as are all findings, source versions, planets and the ES.1–ES.5 coverage/gaps.

The suggested file compiles with118 expected unproved-declaration warnings and no other diagnostics. SHA-256: `82b94d488f040a44d6fc03eed8cc2ff2e42a9df464c41bbe5198405364da52dd`. All8,482 reached Mathlib sources are byte-identical to the pin; there are no Tau Ceti imports.

Three complete temporary Lean checks validated the native equivalence composition, the component unit formula and the general change-level exclusion identity. Printed axioms contain no placeholder axiom. These checks were appended only to the authorized suggested file, then removed before final compilation. No auxiliary Lean source was written. The general remaining signatures are blueprint obligations.

Exact finite regressions enumerate rational-valued unit-group character arguments with a distinct nonunit-zero marker. They test512 modulus families and8,882 characters, including nonquadratic ones:19,220 conductor comparisons,897,006 signed CRT identities and2,051,196 mask identities. Integrated block regressions test1,090 packings and31,674 primitive inputs:69,930 component conductors and1,995,462 signed identities, including137 empty principal families and188 packings with exactly two small blocks. Finite checks do not prove the general declarations.

## Resume point

Read and decompose the complete external Graham–Ringrose proof in precisely the modulus/primitive-first-factor form used by Bennett–Siksek Theorem6. Its hypotheses must permit one factor and principal or imprimitive subsequent factors at their ambient moduli. Match real interval lengths, exponent2^(−r), divisor power r² and factor4R. The character-block and numerical-saving nodes now supply the other inputs; do not repeat them or the CA.1/AN.5 supplier proofs.

Then combine the analytic bound at real length k/2 with the existing uniform large-conductor numeric threshold, and combine that branch with small-conductor-product-cancellation. At odd k the natural interval uses floor(k/2), while the source interval length remains k/2. Until the external analytic proof and this final assembly are decomposed, full Proposition8.2 remains open. Other ES.0 targets and ES.1–ES.5 retain the exact gaps in the packet.

Only the four issue deliverables were changed. Publication uses REST and leaves merge, labels and claim release to automated intake.
