# DESIGN-ClassicalGroupsPartII handoff

Issue #3382. Agent: Codex (GPT-6). Session: codex-qTA8yi.
Branch: codex-qTA8yi-classical-groups-part-ii.

The complete target-level planning pass is ready for independent review.
The five deliverables are the new roadmap definition, packet, reader,
suggested file, and this handoff. No implementation or closed stage is claimed.

## Coverage

| Stage | Status | Nodes | Planets |
| --- | --- | ---: | ---: |
| ClassicalGroupsPartII:CG.0 | planned | 5 | 5 |
| ClassicalGroupsPartII:CG.1 | planned | 9 | 6 |
| ClassicalGroupsPartII:CG.2 | planned | 6 | 5 |
| ClassicalGroupsPartII:CG.3 | planned | 6 | 5 |

Totals: 26 nodes (13 constructions, 5 definitions, 8 theorems), 74 API
items, 58 unit-test statements, 21 planets, 22 pinned baseline declarations,
11 open supplier requests, and one recorded suggested-file gap. All four
stages are planned; none is closed. Every node remains unchecked. Each
coverage entry lists its exact inherited supplier obligations and gap.

The endpoints are Yu's full rational GSp character-ring isomorphism and
the tensor-constituent subring isomorphism, with integral polynomial
generators and the negative-exterior-index convention. The positive
invariant-ring proof is elementary reciprocal orbit sums and integral
symmetric polynomials; it does not use the representation classification.
ArithmeticStatistics:ST.5/symplectic-similitude-group owns the general group
and is imported as an exact node.

## What a follow-up must supply

The eleven requests name full stage ids, exact statements and consumers
in the packet. They import existing upstream scope without re-planning it:

- ReductiveGroups Layer 0: Hopf-coordinate, functor-of-points and scheme
  dictionary for the finite-type coordinate presentation.
- ReductiveGroups Layer 1: generic size and monoidal-additive instance glue
  over the existing finite-comodule category; linear Hom spaces; finite
  minimal coefficient-generated subcomodules and flat base change, reusing
  the pinned finite matrix-coefficient coalgebra; exterior/symmetric
  comodule packaging and additive strong symmetric monoidal scalar extension.
- ReductiveGroups Layer 3: the fppf central quotient and the criterion that
  representations descend exactly when its central kernel acts trivially.
- ReductiveGroups Layer 6: connected reductivity under central isogeny and
  characteristic-zero algebraic semisimplicity over the original field.
- ReductiveGroups Layer 7: the generic split-pair, maximal-torus, root-datum
  and Weyl-normalizer interface for the explicit GSp calculation.
- ClassicalGroups Layer 0: standard Sp matrix and pairing compatibility with
  point evaluation of the pinned algebraic comodule.
- ClassicalGroups Layer 1: symmetric/exterior/tensor compatibility and the
  characteristic-zero antisymmetrization splitting.
- ClassicalGroups Layer 3: the connected complex Sp torus/Borel/root
  description, highest-weight classification, triangular weights and centre.
- ClassicalGroups Layer 4: integral connected Sp formal characters,
  Weyl invariance, highest multiplicity one and trace compatibility.
- ClassicalGroups Layer 5: the type-C fundamental dimension formula.
- LieHighestWeight Layer 4: the existing simple Cartan-component theorem.

The sole gap is the scheme-level quotient/descent portion of the suggested
central-cover signature. Its exact mathematics is stated and requested.
The file gives the actual coordinate morphism, algebraically closed point
lifting and exact lattice parity, and omits the scheme quotient/descent
clauses until the owning interfaces can express them. Add those signatures
using the supplied interfaces, then elaborate the whole file at both exact
pins. No opaque proposition or replacement axiom encodes those clauses.

For arbitrary characteristic-zero fields, the Hom base-change theorem is
stated for K/F, not merely K/Q. The classification proof descends finite
coaction coefficients to a finitely generated F/Q that embeds in C. Absolute
simplicity over every extension follows from scalar endomorphisms, generic
Hom base change and semisimplicity. The central cover is fppf-surjective,
with no assertion of surjectivity on Q-points.

## Validation and compilation

Baseline: TauCeti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. Statements of every cited
declaration were read at these pins. The reviewed coverage catalogue has no
ClassicalGroupsPartII or parent ClassicalGroups layer entries; the packet
records the direct source audit and the abstract finite-group near miss.

- Blueprint checker: zero errors and zero warnings.
- Submission file validator: all five authorized paths, valid JSON and no
  local/private paths.
- Name correspondence: every node declaration, all 74 API names, and all
  58 named examples appear in the suggested file; no proposition stand-ins.
- Individual import paths were checked against the pinned trees.
- Whitespace check passed.

**The suggested Lean file was not compiled.** No existing shared build at
both exact commits was found. Available builds used a different TauCeti
revision, and the exact source snapshot had no compiled artifacts. The
worker instructions prohibit compiling against a different baseline or
creating a new build. No Lean process or language server was started.
Name/import checks and mathematical inspection are not elaboration evidence.

## Sources and boundaries

Read Yu arXiv:1807.04659v5 §7.1, equation (7.1.1), Remark 7.1.1, printed
p.64, and the beginning of §7.2; Milne's 2022 second-edition author PDF,
Chapter 22 §a pp.464–470 and §c pp.477–479; and Sternberg's 23 April 2004
author notes, §7.9 pp.131–132. The packet records the URLs, access date,
SHA-256 hashes and exact node locators. Both ClassicalGroups and
ReductiveGroups upstream readers were read in full; the required
LieHighestWeight layer was inspected. No necessary public source remains
unread.

Source issue ClassicalGroupsPartII/E1 corrects Sternberg p.131's second
binomial lower index from 2j−2 to j−2. The contraction target and the
rank-two dimension 6−1=5 establish the correction. Author pages/current PDF,
public searches and Grinberg's 2019 Chapter 1 errata were checked; no
listed correction to this page was found. The packet records the misprint,
search evidence and corrected statements; intended mathematics is unaffected.

No restructuring is proposed. The general similitude group, generic
representation foundations, Sp classification and counting continuation keep
their owners. The counting route has no finer packet node in this snapshot.
Its exponent-cone mathematics can use the elementary algebra independently.
All source copies and working notes were confined to scratch and are removed
after submission. This handoff and the four mathematical deliverables contain
everything needed for the independent review and stage follow-ups.
