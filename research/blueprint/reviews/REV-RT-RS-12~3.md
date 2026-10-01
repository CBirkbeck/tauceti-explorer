# REV-RT-RS-12~3

Independent verification of the red team RT-RS-12~3 (Codex, session `codex-rtOQ9t`, PR #5361) on the accepted
restructuring RS-12~3 (Galois representations of automorphic forms), for issue #5109.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the restructuring RS-12~3 (`cc-39fac3`, PR #3950);
- its review REV-RS-12~3 (`cc-58621d`, PR #4668);
- the red team.

**Disclosure.** My REV-FIX-RT-AREA-langlands-1~2 (PR #5313) reviewed a round-2 fix report that handed RT-AREA-langlands-1/26
to its owning blueprint, and I accepted that handoff. Finding /3 says the corresponding edge is still missing from the
accepted graph. That is consistent with a handoff that has not yet been applied.

**Result: all three findings confirmed (all medium).**

## What I read

- `research/blueprint/restructure/RS-12.result.json`, specifically:
  - the AG2.0 and R19.1 layer decisions;
  - the IHG.4 owner record;
  - all links.
- The accepted RS-06 layer for ModularCurvesPartII:R14.6.
- The inherited links of `data/decompositions/AutomorphicGaloisRepresentationsPartII.json`.
- The IHG.4 stage text in `data/atlas.json`.
- The verdicts on RT-AREA-langlands-1/26 and RT-AREA-langlands-2/9.
- The assembled stage graph: `data/atlas.json` requires and stageEdges, plus the links of the accepted restructurings
  in `data/restructure`.

## /1 (medium, error): the moved normalization node. Confirmed.

RS-12 moves AG2.0/the-normalization-dictionary-fixed-by-the-sources to AG2.5. The node's inherited link to
AG2.4/hltt-construction-of-nonselfdual-systems stays.

AG2.4 is an ancestor of AG2.5, so after the move the link projects to AG2.5 → AG2.4 and closes a cycle. The fix
supplies HLTT's construction from the rec-free dictionary of AG2.0 and ET.6's local correspondence, and keeps the rec
comparison as a later output.

## /2 (medium, missing): R14.6 → R19.1. Confirmed.

RS-06 keeps the special-fibre Eichler–Shimura relation at R14.6. RS-12's R19.1 keeps the "geometric Eichler-Shimura
polynomial" but names only R14.3.

R14.3 is an ancestor of R19.1, but R14.6 is not. Adding R14.6 → R19.1 is acyclic. This is the residual of the confirmed
RT-AREA-langlands-2/9.

## /3 (medium, missing): IHG.4 → AG2.4. Confirmed.

The IHG.4 owner record lists AG2.4 as a former owner, but the only link from IHG.4 goes to R19.6. IHG.4 is not an
ancestor of AG2.4, and adding the edge is acyclic.

This is the interpolation part of the confirmed RT-AREA-langlands-1/26. That verdict's hypothesis-comparison condition
is kept in the fix.
