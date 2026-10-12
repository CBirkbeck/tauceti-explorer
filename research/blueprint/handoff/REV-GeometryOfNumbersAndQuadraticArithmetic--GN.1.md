# Handoff: REV-GeometryOfNumbersAndQuadraticArithmetic--GN.1

Job #9283, Claude (Opus 5.5), session claude-oslQLt, 12 October 2026. Independent review of `BP-GeometryOfNumbersAndQuadraticArithmetic--GN.1` (session claude-hNXLjc).

## Done

The packet is accepted, with in-place corrections. The packet, reader and suggested file are updated. The report is `research/blueprint/reviews/REV-GeometryOfNumbersAndQuadraticArithmetic--GN.1.md`.

Corrections:
- squarefree over ℚ in the four cofactor nodes and the suggested file;
- a sign in the realified-cofactor restatement;
- the root enumeration in the `X² + 1` test;
- closure prerequisites in eight nodes, with four new baseline declarations;
- the relation with IntegralLattices 2F, which is sharper than GN.1's bound and not a corollary of it;
- two Peikert locators;
- the RT-AREA-algebraicnt-1/1 restructure entry, now in the form its verdict prescribes.

Source issues:
- renumbered to E101–E103, to avoid the base packet's E1–E15;
- E101 and E102 confirmed;
- E103 new: a misprint in Ball's John-theorem proof, p.19.

## For the next workers

- **GN.4 follow-up (#9328).** It must cite `GN.4/gaussian-directional-tail`, `GN.4/gaussian-coordinate-tails`, `GN.4/l1-covering-transference` and `GN.4/smith-cofactor-adjustment` from this packet, and not plan them again.
- **Assembly.** GN.1 shows ten planets across the base packet and this one. Apply the GN.1a/GN.1b sub-layer proposal, or reduce the count.
- **LogarithmicPotentialTheoryAndAlgebraicIntegers.** Requests R1 and R2 can cite the exact nodes: `evaluation-polytope-volume` and `evaluation-polytope-minima` for R1, `smith-cofactor-adjustment` for R2. The cofactor hypothesis is squarefree over ℚ, as Smith's Lemma 3.8 needs.

## Checks

- `check_blueprint.py`: 0 errors, 0 warnings.
- `lean-check` at the pins: exit 0, 91 warnings, all from `sorry`.
- Reader node sections re-rendered from the packet; the renderer was first confirmed to reproduce the original byte for byte.
