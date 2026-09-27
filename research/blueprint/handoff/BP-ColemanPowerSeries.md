# BP-ColemanPowerSeries — norm and logarithmic differentiation

Codex — codex-7e92bd. Refs #699. Claim5852872635 was confirmed by
bot5852873632. The whole issue was read before claiming and reread after the
winning confirmation. This is a partial continuation of merged PR3175.
All 75 preceding node objects, 83 baseline records, eleven source findings,
eight planets and stage statuses are preserved. No stage is closed.

Totals: **84 nodes** (2 definitions, 8 constructions, 61 lemmas,
6 theorems, 7 comparisons); **51 API items**; **73 packet tests**, including
36 definition/construction tests; **75 typed examples**; **8 planets**;
**95 baseline references**; **6 gaps**, **12 requests**, **11 source findings**.
Every implementation status remains unchecked.

## What this supplies

Nine declarations connect the actual determinant norm to the existing bounded
PMIA psi through the weighted logarithmic derivative. The formal determinant
adapter uses Mathlib's first-order determinant expansion and native dual
numbers, for a derivation of any commutative algebra and an actual matrix unit.
The basis-coordinate formula is c_i(partial F)=p partial(c_i(F))+i c_i(F).
With rows as output coordinates, this yields
M_(partial F)=p partial(M_F)+H M_F−M_F H, H=diag(0,…,p−1).

Matrix trace cancels the commutator, giving the integral identity
tau(Delta u)=p Delta(N_units u). The preceding independent tau=p psi comparison
then gives Delta(N_units u)=psi(Delta u) by cancellation of the nonzero prime.
Neither p inverse nor a trace-defined replacement operator is introduced.
The all-prime argument includes p=2, with its existing norm sign.

The actual restricted homomorphism maps the existing norm-fixed units into
the native kernel of psi−id. Its Multiplicative type tag records that unit
multiplication becomes series addition. Its continuity uses coefficientwise
series topology and the native Units and submodule topologies. Its kernel
consists exactly of constant units c with c^(p−1)=1. This is the restricted
logarithmic-derivative kernel; the full Coleman-map kernel and surjectivity
remain open. Three API entries and seven typed tests are added.

## Ownership and source reading

The pinned libraries, reviewed AUDIT24 and accepted RS16 ownership remain the
baseline. The current handoff and all predecessor statements were read, with
full focal norm/matrix/trace interfaces, PMIA derivation and the trace/psi
comparison. Earlier owner, protocol and upstream model reading belongs to this
continuous session; no fresh whole-reader or whole-source reread is claimed.
The current source pages and all twelve added baseline statements were read.

The pinned Mathlib first-order determinant expansion already supplies the
underlying determinant calculation. TauCeti.GeneralLinear.trace_tangentMatrix
is a counit-valued derivation statement at the identity of the coordinate
Hopf algebra. The new generic formal-derivation adapter reduces to Mathlib's
existing formula. The adapter was screened against the packet inventory;
no exact supplier was identified. Its proof is independently derived, without
copying Tau Ceti's private helper. No new matrix, derivative or tangent carrier
is introduced.

Freshly downloaded and read on 27 September2026:

- [RJW published version](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
  full PDF80–82 / printed179–181: Definition12.8, Theorem12.9 and Lemma12.10,
  together with the surrounding action discussion and start of Lemma12.11.
  SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
- [Coates–Sujatha](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf),
  full PDF30–32 / printed20–22: Definition2.4.4 and Lemma2.4.5 with their
  surrounding interpolation statements. The book's arithmetic convention is
  odd p. SHA256 `38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789`.

The source proves image containment by root products. The matrix/dual-number
argument and its generality are independent worker derivations. Earlier
Lemma10.8 and arXiv reading is retained as provenance, not claimed as a fresh
full-source reading. No new source finding or independent review is recorded.

The fresh PMIA packet supplies the exact L0 clopen restriction, section and
support characterization and L2 intrinsic unit restriction, section and
extension-projector comparison. These full interfaces were read. The inherited
L0 request is narrowed to weak/operator-norm topology comparisons, since the
supplier deliberately installs no topology on the measure carriers. Twelve
requests remain; their supplied algebraic maps must not be rebuilt in Coleman.

## Validation

The actual full suggested file compiles with **0 errors and 181 expected
placeholder warnings only**. The actual imported PMIA seed compiles with
**317 placeholder warnings only**. All **2,757 reached Mathlib modules** match
the pinned sources; no Tau Ceti module is reached. All prior seed bytes are
retained between one new native import and the appended signatures.

A separate complete Lean calculation contains one first-jet ring-homomorphism
construction and six theorems, including the generic Jacobi determinant formula
and cancellation of the connection commutator under trace. It compiles with
**0 errors, 0 warnings and 0 placeholders**. This validates the matrix argument;
the suggested file and packet remain plans.

**2,427 exact assertions** pass for p=2,3,5 and moduli p^k with k=2,3,4.
In each coefficient ring, twelve polynomials test the coordinate and matrix
formulas, and twelve units a+pG test logarithmic identities. The inverse is an
exact finite geometric sum modulo p^k. Compute Frobenius coordinates by changing
T=Y−1 and imposing Y^p=U, then set U=1+T; compute the determinant by permutations
and psi by selecting Y-exponents divisible by p. Checks cover Jacobi, the
integral trace, norm/psi identity, inverse norm, constants and dyadic signs.
Eighteen controls reject a missing factor p and a reversed commutator. These
finite checks do not prove continuity or infinite-series identities.

Unmodified-index blueprint validation: **zero errors and warnings**. Exact
four-file intake: **zero problems**. The eleven-finding errata wrapper passes.
Preservation, reader/signature/API/test parity and authorized file scope pass.
The dependency graph reaches 134 nodes and 147 baseline leaves through 512
edges, is acyclic, and has no undeclared leaves. This checks the specified
nodes; the six stage gaps remain open.

Suggested-file SHA256: `e6c89c6f0b4d04db8b5807f45167c78ff0f5d36b1253dd50cae88f913b85f582`.
Complete matrix-proof SHA256: `9ff3d51b126eb1b1b9857d274ca0c3c0c093afa08f1d25f8182f0c5ea4b5d88b`.

Final guard: all 22 captured inputs and four predecessor outputs
match main `caccea9110cda7d3df23faec83c6d7dbf53c3658`. The refreshed source registry
adds only the unrelated ColemanIntegration/E25 finding, whose full text and
register diff were read. The issue body and winning claim are unchanged.
Exactly the four authorized deliverables are published through Git Data REST.

## Exact continuation

For L3, continue with the mod-p image calculation and lifting/compactness proof
of RJW Lemmas12.11–12.14 using the actual norm-fixed subgroup and the actual
psi-fixed submodule. Establish image surjectivity and the topological sequence
of Theorem12.9. The 1−phi sequence needs the convergent Frobenius-iterate sum
and its constant-term obstruction before combining with the unit-supported
inverse derivative. Keep the full Coleman-map kernel and its cyclotomic-moment
cokernel distinct from the constant-root kernel supplied here.

L0 retains the actual cyclotomic towers, unit limits, actions and modules. L1
retains determinant/root-product and arithmetic norm/evaluation compatibility,
finite-level lifts and interpolation; the existing continuous norm-fixed limit
is not an arithmetic interpolation map. L2 retains the full Coleman composite,
its action and normalized arithmetic identification. L4 retains the local
cyclotomic-unit quotient. Exact coefficient-ring and completed-topology
comparisons remain supplier requests. Resume from the packet's coverage lists;
all five stages remain incomplete.

The preceding handoff is retained in [PR3175](https://github.com/CBirkbeck/tauceti-explorer/pull/3175).
