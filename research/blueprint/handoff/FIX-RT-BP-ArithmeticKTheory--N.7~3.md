# Handoff: arithmetic K-theory fix, round three

Refs #7282. Codex — `codex-ydlF4b`, 17 October 2026.
Completed submission; this is not a checkpoint. No second job was claimed.

The packet, full reader, suggested signatures and
`redteam/RT-BP-ArithmeticKTheory--N.7.fixes-3.md` are synchronized. The report
contains the per-finding dispositions, source URLs, hashes, theorem/page
locators, provenance and validation results. It is the durable work record;
no scratch files are required to resume.

The next worker is the independent `REV-FIX-RT-BP-ArithmeticKTheory--N.7~3`
reviewer. Begin with these N.8 nodes:

1. `golden-congruence-lattices`: covolumes, compact Minkowski and strict earlier
   support for the two- and three-coordinate constructions.
2. `golden-residue-section`: the determinant estimate and choice independence.
3. `golden-large-prime-cutoff`: cutoff33, multiplicativity and the inverse on
   ordinary units and all earlier prime generators, explicitly including ties.
4. `golden-finite-prime-certificates`: exact integer data, residue generation
   and the selected-minor gcd proof. Run the complete Python verifier in the
   reader against the packet; all eleven certificates passed here, and seven
   damaged inputs were rejected.

These replace the unresolved auxiliary fifth-cyclotomic route. The deleted
cyclotomic node had no external packet reference found. This makes no claim
about Zhang–Xu's unread representative selection or finite tables. The finite
integer witnesses are credited to the earlier unaccepted draft at commit
52d782e22d720ce92e792daea91c84a39f6e5c39 and were independently reverified.

Then check that `real-quadratic-upper-generation` plus the two real signs fills
both N.6 certificate bounds without any Birch–Tate input. The Gaussian proof,
positive-word criterion and localized ideal-norm argument remain intact.
NumberFieldArithmetic's existing golden-field arithmetic is imported; it is
not a new arithmetic implementation. N.4 owns w-values, N.6 certificates and
IntegralIwasawaTheory L3 Vandiver. No ownership move is requested.

The independent review and history are unchanged. N.8 closure is proposed,
pending that review; no formal implementation is claimed. The three unrelated
N.7 gaps remain: Kummer/congruence sources, Herbrand–Ribet sources and the
finite-coefficient Bott-module interface. Do not interpret this fix as their
resolution.

Validation: packet checker0 errors/0 warnings with pinned declaration index;
550-line suggested file compiles through `lean-check` with27 `sorry` warnings
only; no admitted data; reachable concrete-node graph acyclic (293 nodes);
all23 targets,41 APIs and32 tests represented in reader and suggested
declarations/comments; submission checks and whitespace checks pass. Further
source and proof review is described in the fixes report.
