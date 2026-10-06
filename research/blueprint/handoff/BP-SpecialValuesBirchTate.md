# BP-SpecialValuesBirchTate — completed target-level planning pass

Agent: Codex, session codex-vHMOxz, 2026-10-06. Refs #998. Claim confirmed by
bot comment 6010228033. This supersedes the five checkpoint handoffs; their 44
node ids and valid mathematical content are retained.

## What is complete

The packet status is **complete** at the issue's target-level granularity.
**B.1, B.2, B.3, B.4, B.5, B.6, B.7 and B.8 are planned**. No stage is closed:
each coverage record specifies the exact refinement/supplier gates. Every
implementationStatus is unchecked; no formal implementation is claimed.

51 nodes: 6 definitions, 14 lemmas, 25 theorems, 2 applications, 4 comparisons.
25 API items, 23 discriminating unit tests, 15 planets, 69 pinned baseline
declarations, 17 supplier requests and 3 gaps. No layer has more than six planets.
The packet, reader and suggested definition/API/test names agree.

The seven added targets are independent rationality, independent Deligne–Ribet
denominator integrality, enlargement of S, localization/Chern/regulator naturality,
the higher real-place correction at two, the classical even-weight abelian theorem,
and the integral equivariant Tate-motive predicate. The B.8 cohomological node
retains its id but exports hInvariant; actual groups and the integral lattice
come from the owners, rather than being chosen to match their completions.

## Ownership and confirmed findings

- **RT-AREA-ktheory-1/10:** B.1 directly imports N.3:ranks/even-K-groups-of-S-integers-are-finite,
  N.4/the-w-invariant and N.4/finiteness-of-the-w-invariant. It defines only the
  Birch–Tate predicate, with no duplicate W₂ or K₂ finiteness construction.
- **RT-AREA-ktheory-1/11:** B.3 imports N.8/real-quadratic-example-and-birch-tate.
  N.8/N.6 own the independent certificate and class-group/unit bounds; B.3 retains
  the w₂ calculation, L-function factorization and equality test.
- **Accepted RS-16:** I.9 owns the modern determinant theorem; I.10 owns the
  dictionary and exact old/new finite descent. B.6 specializes those outputs and
  outlines the arithmetic implication. Table entries (a)–(i) retain finite
  cohomology, Tor and Kurihara Lemma 4.2(1)'s order-two cokernel. The former
  unsupported real-place submodule assertion is replaced by the actual
  correction-complex/map request.
- B.7 uses **T.5/relative-s-integer-sequence**, with residues at primes in S.
  The outside-S tame-kernel sequence is a distinct import.

## What remains and where to resume

The three gaps are external proof gates:

1. **T.5/k2-of-the-integers:** independent generation upper bound for K₂(ℤ).
   The sign-symbol lower bound does not prove order two.
2. **N.8/real-quadratic-example-and-birch-tate:** independent generation upper
   bound for the tame kernel of ℚ(√5). Two sign symbols give the lower bound four.
   Reading order four from the abelian theorem gives a corollary, not the
   independent certificate required in B.3.
3. **I.10:** exact old/new comparison, especially entries (a), (b), (f), (i),
   norm-kernel minus module and derived κ² descent. A height-one identity cannot
   discard finite specialization terms: Λ/(2,T) has unit characteristic ideal
   but specialization of order two. B.6's all-prime endpoint depends on this gap.

All 17 requests and their direct consumers are in the packet. Owners:
AutomorphicPadicLFunctions L3; ArithmeticKTheory N.6; IntegralIwasawaTheory I.2,
L2, L4, I.5, I.9, I.10; DirichletPadicLFunctions L2; MotivicEtaleKTheory M.3,
M.7, M.8; PeriodsAndSpecialValues PS.3, PS.4, PS.5; GeneralAlgebraicKTheory K.5;
KTheoryFiniteLocalFields L.1.

Refinement starts with those exact interfaces, then enables signatures using
the actual supplier types and maps. M.7 must supply both even-weight
congruence-class real-restriction sequences at two, including surjectivity.
M.8/PS.3 must fix the integral motivic lattice/regulator. PS.4–PS.5 must supply
Coherence/perfectness, graded determinants and the corrected local relative-K
class. The suggested ETNC input record exposes those hypotheses; its local
equivalence separately assumes rationality, and a lattice change fixes the
rational comparison while using the finite-quotient correction and gluing.
General motivic/ETNC assertions are conjecture statements; their statement
infrastructure is not a proof. The higher abelian theorem uses Rognes–Weibel
Appendix A.1–A.3, not a modern weight-two extrapolation.

## Sources and evidence

Fresh reads used the public K-book, Kolster 2009 author preprint, Kolster 1989
journal note, Greither 1992 journal article and Kurihara 2025 author copy.
readSections distinguishes exact fresh passages from inherited complete-section
provenance. The entire Kolster 1989 note was reread, with printed p. 250 inspected
on the page image. Its fresh Cambridge PDF has a different wrapper hash; both
download hashes remain documented.

New sources: Rognes–Weibel (2000), introduction Theorems 0.1–0.3 and 0.6 plus
Kolster's Appendix A.1 and proof, A.2 and A.3; Burns–Flach (2001), conclusion
of Lemma 5, Lemma 6 with proof, Lemma 9 and Conjectures 4–6/Remark 9;
Cohen, Number Theory II (2007), Theorem 10.5.3,
Proposition 10.5.5 and proof, Theorem 10.3.1 and Corollary 10.3.3 with proof.
Public URLs, hashes and dates are in the packet.

E1–E6 are inherited findings rechecked at the recorded versions, not independently
reviewed findings. E1–E2 were inspected on the journal page; E3–E6 remain scoped
to the author preprint. The Park City version of record was not obtained.
No new source error is asserted; searches found no erratum. The historical 1987
sequence and full Wiles, higher Chern, determinant and finite-descent proof
interiors remain the named suppliers' work, with no claim to reading them here.

Two upstream documents were read in full: ArithmeticDirichletSeries and
GlobalNumberFields. All 69 baseline statements/hypotheses were read at the pins.
A full declaration index was generated from existing pinned Git objects:
70,802 Tau Ceti and 246,008 Mathlib declarations. No source-tree copy, clone or
library build was used.

## Validation and Lean status

- check_blueprint with the full pinned declaration index: **0 errors, 0 warnings**.
- intake check-files on exactly the four deliverables: **0 problems**.
- Source-issue/version projection checked with check_errata: **ok**.
- git diff --check and definition/API/test-name consistency: passed.
- lean-check on the final suggested file: **exit 0, only three sorry warnings**.
  Its native Mathlib signatures and arithmetic regression examples elaborate.
  Every unavailable higher signature is an explicit comment, as the campaign
  requires; those signatures are not checked. The original prototype fails at
  the Tau Ceti imports because the shared build lacks their three .olean files.
  Their source statements were inspected at the pinned commit. No library build
  was attempted; memory exceeded the required threshold before each invocation.

This completed planning pass goes to independent review. Follow-up refinement
must preserve the owner boundaries and discharge the exact coverage gates.
