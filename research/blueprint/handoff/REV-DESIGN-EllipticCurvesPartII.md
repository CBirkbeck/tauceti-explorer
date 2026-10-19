# REV-DESIGN-EllipticCurvesPartII — codex-7VH71V

Complete independent review for issue #3522, by Codex session
`codex-7VH71V`, 2026-10-19. This is a finished review, not a checkpoint.
The original design session was `codex-36tJxY`.

## Result

Accepted the EllipticCurvesPartII packet as an import index and maintainer
merger proposal. All seven source targets already belong to
EllipticLegendreCharacterInterfaces. The review adds 37 individual
import verdicts, confirms the existing source-finding reference,
synchronizes the reader and supplies the review report. No mathematical
correction, baseline replacement or new node was needed. The roadmap and
suggested file were checked and left unchanged.

Reviewed inventory: 37 imports, 8 definition/construction contracts,
33 API items, 27 tests, 19 planets, 16 baseline declarations and 6 layer
mappings. The alias owns zero mathematical nodes and closes zero layers.
Every implementation status remains unchecked. All four owner gaps and
three supplier requests are preserved exactly by reference.

The [review report](../reviews/REV-DESIGN-EllipticCurvesPartII.md) contains
the source, baseline and ownership evidence. The packet records an accepted
review by `independent-review-REV-DESIGN-EllipticCurvesPartII`.

## What remains and where to resume

The maintainer applies the existing merger: keep the canonical roadmap
and its 37 identifiers, map alias LG.n to canonical LG.n for n=0,…,5,
check inbound references and queue metadata, then retire the alias roadmap
definition, packet, reader and suggested file. No merger or promotion was
performed here. Do not create a second plan for these seven targets.

Mathematical development resumes in EllipticLegendreCharacterInterfaces:

- LG.0: native full-two-torsion normalization and point transport.
- LG.1: parent Layer 4 minimal-model and rational/local unit comparisons;
  CA.1 native squareclass-character and R01.3 actual-conductor interfaces.
- LG.2: native CRT and quotient signatures and compatibility with μ.
- LG.3: halving calculations and the finite-abelian two-primary count proof.
- LG.4: corrected native doubling and descent calculations.
- LG.5: direct symmetric character counting and BSD.0 twist specialization.

The current finer supplier statements were read and fit the requests:
CA.1/quadratic-character-of-a-squareclass,
R01.3/elliptic-exponent-and-parts with elliptic-local-independence,
and BSD.0/finite-field-twist-trace. They remain plans. In particular,
the parent roadmap's Ogg exponent does not substitute for the actual
elliptic conductor. The owner's historical full-prototype compilation gap
is not discharged by the alias's successful examples.

## Source and baseline receipts

Read the Bennett–Siksek publisher PDF at pp.365–372, covering all imported
locators: §5 proof of Lemma 5.2; §6 equation (17), Lemmas 6.2,6.3,6.5 and
the local calculation in Lemma 6.6. The packet and report retain its URL
and SHA-256. No passage or source file was added to the repository; no
book was needed.

The existing finding EllipticLegendreCharacterInterfaces/E1, prior
PAPER-BENNETT-SIKSEK-20/E14, was independently confirmed. The corrected
y=8itv(t+iv) satisfies the local equation and tangent formula. The F₅
printed pair (4,4) fails; the corrected (4,3) doubles to (1,0). No new
erratum or fresh correction search is claimed.

All 16 alias baseline statements and ambient hypotheses were read at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The five relevant source files
match those git objects and the shared build's sources. This is not a
repeat of the canonical owner's 56-declaration audit.

Current upstream boundary inspection used roadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without running Lake there.
The relevant reviewed library audit entries were read. No additional
equation-level Legendre owner was found in the bounded current-tree search.

## Validation receipts

- Blueprint checker: zero errors and warnings; 0 local nodes, 0 closed
  layers and 6 import stages. The checker aggregates `source_decomposed`
  into its planned count; the packet explains its accounting meaning.
- `lean-check` on the alias suggested file: exit 0, no errors or warnings,
  13 anonymous examples. Available memory was checked before compilation.
  No library build, cache download or Lean language server was run.
- Intake `check-files` on the five review deliverables and this handoff:
  six files, zero problems. `git diff --check` passed.
- Exact assertions passed for import IDs/kinds, APIs/tests/planet names,
  stage maps, inherited obligations and an acyclic owner dependency graph
  with no back-edge to the alias.
- Independent finite arithmetic checks all passed:
  4 rational root-ordering tuples at λ=−1,2,1/2,3;
  1,071 j-valuation cases at odd primes below 20, numerators −9…9 and
  denominators 1…9, excluding λ=0,1;
  the three-square halving criterion at 12,876 affine points and 2,436
  corrected root triples for every nonzero d and λ≠0,1 at odd primes below 20;
  160 explicit eight-element subgroups for all admissible η at primes below
  50 congruent to 3 modulo 4;
  exact minus-one two-primary counts, no order eight and the sole divisible
  nonzero two-torsion root at the 6 primes below 100 congruent to 5 modulo 8;
  616 corrected halving tuples over all odd primes below 80;
  448 symmetric trace cases below 80;
  4,160 twist-trace cases at odd primes below 40, including square scalars.
  These are finite regressions, not proofs of general or native statements.

No second issue was claimed. Scratch sources and scripts are disposable;
all evidence needed to resume is recorded here, in the packet and in the
review report.
