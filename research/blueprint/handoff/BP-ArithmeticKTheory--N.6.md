# Handoff — BP-ArithmeticKTheory--N.6

Issue: #6477. Agent: Codex, session `codex-jToARl`.
Branch: `codex-jToARl-arithmetic-k-theory-n6`.

This is a complete target-level planning pass, ready for independent review.
The packet has status `complete`; its single stage, `ArithmeticKTheory:N.6`,
has coverage `planned`. No stage is claimed closed and no declaration is
claimed implemented. Every implementation status remains `unchecked`.

## Deliverables and coverage

- [Packet](../packets/ArithmeticKTheory--N.6.json): 28 new nodes — 4 definitions,
  2 constructions, 10 theorems, 5 comparisons and 7 applications; 26 API items,
  20 discriminating unit tests, 7 baseline declarations, 7 supplier requests,
  2 proof gaps and 2 source findings. No restructuring is proposed.
- [Reader document](../readmes/ArithmeticKTheory--N.6.md): definitions,
  conventions, statements, proof steps, direct inputs, uses, API, tests,
  acceptance conditions, ownership and source limitations.
- [Suggested Lean](../suggested/ArithmeticKTheory--N.6.lean): elaborating
  numerical and generic map interfaces, with mathematical signature comments
  at the boundaries where actual supplier carriers do not yet exist.

All four items in the accepted N.1 packet's N.6 remaining list are accounted
for: VI.9.6.3/9.7/9.9 and the even two-ranks; local norm applications;
finite-coefficient and cohomological kernels with the Moore sequences; and
Weibel's divisibility proof and the two wild-kernel conventions. The proof
architecture includes the imaginary, exceptional, special and real cases,
including the hidden degree-four K-classes. Definitions and key theorems are
nodes; smaller proof steps remain in their outlines.

Existing parent nodes are imports, including the integral tables, signature
defect, divisible subgroup, raw wild kernel and certificate engine. The tame
kernel, local K-theory, foundational K-groups, twists, cohomology, cyclotomic
systems and local reciprocity retain their existing owners. The reviewed
library audit, accepted parent and its review, stage edges, links, suppliers
and consumers were read. Two complete upstream documents were used for
style: Multiquadratic and IntegralLattices, with ClassFieldTheory also checked
for the norm criterion.

The two new planets are **Even K-group two-ranks** and **Weibel divisibility
theorem**. Together with the four N.6 planets in the parent, the assembled
layer has six. No parent packet or atlas data was changed.

## Checks and the compiled boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.6.json`
  passed: **0 errors, 0 warnings**.
- The same checker with the pinned declaration index passed: **0 errors,
  0 warnings**. The seven baseline statements were read at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- `lean-check` passed with **only 14 expected warnings about `sorry`**.
  Available memory was 107 GB before compilation. Only individual Mathlib
  modules are imported; their shared build is at the pinned Mathlib commit.
  The build's Tau Ceti package is at a different revision, but this file
  imports no Tau Ceti module. Tau Ceti baseline citations were verified from
  its separate pinned source tree, rather than compiled against that package.
- Name parity and the internal dependency graph were checked. Whitespace and
  deliverable-path checks passed.

The elaborating part comprises three node interfaces (`evenTwoRank`, the
generic joint `localSymbolFamily`, and its `symbolWildKernel`), seven API
signatures, four rank-table test examples, and two additional compatibility
examples. The generic maps use genuine additive homomorphisms; supplying
their arithmetic instances is separate work. The other 25 nodes, 19 API
items and 16 tests are mathematical signature comments, not Lean declarations.
They await actual imported K/coefficient/cohomology/cyclotomic carriers.
There are no opaque stand-ins or proposition fields that assume the missing
theorems. Elaborating this portion does not establish any arithmetic theorem.

## What remains and where to resume

**G1 — higher raw/symbol comparison.** The raw completion kernel is contained
in the symbol kernel, and degree-two equality follows from Moore's uniquely
divisible local kernel. In higher degree the local divisible part can contain
residue-characteristic divisible torsion. Prove that global torsion classes
with all symbols zero have zero image in those parts, with the corresponding
real detection statement, or correct the parent's unconditional higher claim
to the symbol formulation. Resume at `raw-and-symbol-kernel-boundary` and the
L.6/L.7/M.7 comparisons. Global torsion alone does not discharge this gap.

**G2 — exceptional odd dyadic localisation.** The preprint's unrestricted
Lemma 4.4 is false: over Q(i) no prime has norm three modulo four. Obtain a
correct prime-selection statement with compatible ideal-class and cyclotomic
Frobenius conditions and prove it suffices for Theorems 4.5 and 6.11, or verify
an independent localisation-image proof. Resume at `cyclotomic-divisible-image`
and the source diagrams on preprint pp.12 and 17. The odd-prime, even-twist and
nonexceptional branches instead use surjective residue norms and do not need
Lemma 4.4. The full symbol divisibility theorem retains G2 for its remaining
branch. This is not a claim that Theorem A is false.

Supplier requests identify the precise interfaces needed from M.2
(Kummer/Brauer, modified/positive cohomology, descent, cyclic homology and
localisation), M.7 (coefficient filtrations, real and motivic comparisons,
spectral maps), H.6 (functorial coefficient UCT), SelmerIwasawaCohomology L2
(strict degree-two local conditions), I.1 (cyclotomic fields/actions and
decomposition groups), I.2 (finite class-group systems and twisted
coinvariants), and the existing ClassFieldTheory layer 6 (norm-kernel local
reciprocity). The requests are recorded in the packet; no separate tickets
were created. Once their actual carriers exist, replace the mathematical
signature comments with declarations on those carriers and rerun Lean.

Preserve the acceptance distinctions: s counts inverted finite primes; 1/2
is a unit and n is positive even in the real rank theorem; j is the Selmer
signature cokernel defect, distinct from a unit-sign defect and from ρ;
rank does not determine order; coefficient K-theory is not an integral
quotient; ordinary, modified and totally positive cohomology are different;
and the real symbols must match the chosen positive/full Moore sequence.

## Sources and version limitations

Read Weibel's [combined K-book author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
dated 29 August 2013: III.6.2.2–6.2.5, V.6.8–6.8.2, VI.7.1–7.5 and VI.9.6–9.11.
Book page plus eight gives the PDF page. Also read all 22 rendered pages of
the [wild-kernel author preprint](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf),
dated 23 July 2004, including the proof inputs in §§1–8. Its extracted font
text is corrupt; its page locators refer to the rendered preprint. Access
date and full hashes are in the packet.

The [version of record](https://doi.org/10.1016/j.jpaa.2005.03.018), JPAA 206
(2006), 222–244, returned 403 and was not collated. Both source findings are
therefore scoped to the preprint. E-N6-1 records Lemma 4.4's false unrestricted
prime-selection statement; E-N6-2 corrects the signature-defect kernel/cokernel
misprint after (8.2), checked on Q and Z[1/2]. The nodes use the corrected
cokernel convention. Searches located no verified published correction.
The parent's existing K-book source finding is retained through its import.
Collating these two findings is part of the follow-up. The external results
cited inside the preprint remain the named supplier interfaces above.

No source PDFs, extracted texts, scratch scripts or compile logs are submitted.
This note retains all information needed after scratch cleanup.
