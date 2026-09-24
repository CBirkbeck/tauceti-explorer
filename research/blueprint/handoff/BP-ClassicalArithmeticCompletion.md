# Handoff — BP-ClassicalArithmeticCompletion

Job `BP-ClassicalArithmeticCompletion`, issue #1025. Agent: Claude Code, session `cc-7b31c4`, 24 September 2026.

Deliverables:

- `research/blueprint/packets/ClassicalArithmeticCompletion.json` — 10 nodes, 27 API items, 18 unit tests,
  7 planets, **56 pinned baseline declarations**, 5 gaps, 0 requests, 2 structural proposals.
  `python3 scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- `research/blueprint/readmes/ClassicalArithmeticCompletion.md` — the roadmap document, 809 lines.
- `research/blueprint/suggested/ClassicalArithmeticCompletion.lean` — 205 lines of signatures.

## The shape of this packet, and why it is small

This roadmap is **largely already built**. The reviewed library audit gives CA.0 the verdict *built*, CA.5
*process*, and the rest *partly built*. The job instructions are explicit:

> A target the libraries contain is a baseline citation, never a node; a partly built layer gets nodes only for
> its missing targets; a process layer is not mathematics and gets no nodes.

So the deliverable is mostly a register of what is already there — 56 declarations of Mathlib and Tau Ceti,
one per target the audit records as present, each with a note saying which target it discharges — together with
nodes for exactly the targets the audit records as missing **and** for which a free source could be read. Ten
nodes. A larger packet here would be a duplicate of Mathlib, which is what PROTOCOL section 15 forbids.

## What is planned

**CA.0 is closed** with one node: the Chinese remainder theorem at non-coprime moduli over the **integers**.
Mathlib's `Nat.chineseRemainder'` takes exactly the right hypothesis but works over the naturals, and the audit
records the integer existence form as unstated. Shoup's Exercise 2.18 gives the existence criterion; the
uniqueness modulo the least common multiple is not in the source and is proved in the node's steps.

**CA.1** gets three. The pinned cyclicity criterion tells you that the units modulo `2^e` are not cyclic for
`e ≥ 3` and nothing about what they are instead; the node supplies the decomposition with its explicit
generators `−1` and `5`. The `d`-th power criterion is planned in a finite cyclic group and then in a finite
field, with the greatest common divisor in the exponent so that it holds for every `d`, which is the audit's
exact missing statement; Euler's criterion is the case `d = 2`.

**CA.2** gets three: the minimal polynomial of a linearly generated sequence, from Shoup's ideal-theoretic
treatment; the rationality predicate for a formal power series, which the audit records as missing; and
Stanley's three-way equivalence between a rational generating function, a linear recurrence and the closed
form. The third is the one that matters: Mathlib has the geometric solutions attached to the roots of the
characteristic polynomial, and a repeated root of multiplicity `dᵢ` contributes a *polynomial* of degree less
than `dᵢ` times a geometric sequence, not a constant.

**CA.3** gets two: the Smith normal form of a rectangular, possibly singular integer matrix with invertible
transformations and the divisibility chain, and the invariant-factor form of the structure theorem that follows.
Mathlib has the structure theorem in *elementary-divisor* form and Tau Ceti has Smith form for square
nonsingular Gram matrices; neither is this.

**CA.4** gets one: the solvability criterion and the full parametrisation of an integer linear system, through
that Smith form. The classical two-unknown parametrisation is the case of one equation.

## What is not planned, and why

Every unplanned target is in the coverage record's `remaining` list with its reason, and the five gaps name
what a continuation job needs:

1. **CA.6 is empty** because Chris Smyth's survey on the Mahler measure of algebraic numbers could not be
   downloaded: the author's page at Edinburgh refused the request, and no arXiv version was located. That one
   survey covers every missing target of the layer, so a continuation job with access to it can plan CA.6 in
   one pass.
2. **CA.7 is marked `not_read`.** No free source for integral Galois module structure was obtained; Fröhlich's
   book is not freely available and no equivalent notes were found.
3. **Continued fractions**, which decide the negative and generalised Pell equations, are in neither source:
   Shoup says in his preface that he does not discuss them, and Stein treats Pell through unit groups.
4. **Automatic sequences, Christol's theorem and Farey sequences** have no free source among the three read.
5. **The job's supplier list is stale**: it names `BP-FoundationsAndLibraryIntegration`, retired on
   16 September 2026 and listed in `data/roadmap-retirements.json`. No node names it; the targets it would have
   supplied are cited directly to the pinned libraries.

Two further targets are unplanned for a reason worth separating from the rest: the `n`-th power residue
**symbols** and the Hilbert symbols at `2` and at a real place. For the second, a free source that states and
proves them exists and was located — John Voight's freely posted *Quaternion Algebras* — but was not read in
this session. The remaining list names it, so the next worker does not repeat the search.

## Structural proposals

Two, recorded in the packet's `restructure` list; this packet works with the current structure.

1. **CA.5 should be removed.** Its audit verdict is *process*: all seven targets are instructions to reuse
   objects that other layers own and that the pinned libraries already have. The job instructions for a process
   layer say exactly this. The proposal keeps its content as stage links so that the dependency it records
   survives the removal.
2. **CA.7 should be moved out.** It shares no object, no source and no technique with CA.0 to CA.6. Keeping it
   here means the roadmap can never close for a reason unrelated to anything else it contains — which is what
   has happened in this packet.

## One correction to the reviewed audit

The audit's CA.4 entry says that `fermatLastTheoremThree` is "missing from the index". It is in the pinned
declaration index, as `Mathlib/NumberTheory/FLT/Three.lean:751`, declared `public theorem`. The packet cites it
as a baseline declaration and the citation's note records the discrepancy. The audit's other claim of the same
kind, that the normal basis theorem is missing from the index, was not contradicted: no declaration matching
that name appears in the pinned index.

## Sources read

Three, all freely available, each read for the sections listed in the packet and each with its SHA-256 recorded:
Victor Shoup, *A Computational Introduction to Number Theory and Algebra*, Version 2 — the hash the reviewed
integrated decomposition of this roadmap records is reproduced byte for byte by a fresh download, which is the
first check this job did; Richard Stanley, *Enumerative Combinatorics*, Volume 1, second edition; and William
Stein, *Algebraic Number Theory, a Computational Approach*.

## Did the Lean file compile?

**No.** No Lean toolchain at the pinned commits was available in this session, and the shared Mathlib build on
this machine is a cache a worker must not rebuild. Every Mathlib and Tau Ceti name the file is written against
was confirmed present in the pinned declaration index; elaboration has not been established, and the file's
header says so.
