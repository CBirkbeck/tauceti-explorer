# REV-RS-03 — review of the RS-03 restructuring (Classical, computational and Diophantine number theory)

**Verdict: accepted, with one correction made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT, session `gpt6-20260921-r7c42a`. This reviewer took no part in it.

**What was read.**
- `RS-03.json`: eight members, the Tau Ceti anchor EllipticCurves, and 76 evidence records (42 unordered pairs). The members are:
  - AdditiveCombinatorics and ClassicalArithmeticCompletion;
  - ComputationalNumberTheory, DiophantineApproximationAndTranscendence and EffectiveDiophantineMethods;
  - ExponentialSumsAndCircleMethod and FiniteFieldsAndCharacterSums;
  - HeightsRationalPointsAndObstructions.
- The proposal `RS-03.result.json` (22 layer entries, 21 links before correction, 25 owners) and its report `RS-03.md`, including its four ownership sections, the target-preservation ledger, and "Consumers and graph safety".

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-03.result.json` reports `ok` before and after the correction. The author could not run it without the full atlas.
- **Coverage.** The 22 layer entries (21 narrow, 1 keep) cover every changed stage. The other 30 of the 52 member stages are unchanged and omitted, which §15 allows.
- **Evidence.** 25 of the 42 pairs share an owner entry. The other 17 are resolved in the report as different contracts:
  - AC.0 versus ES.1 (finite cyclic transform versus torus Haar orthogonality);
  - AC.5 versus ES.3 and ES.4 (finite-complexity prime patterns versus optimized circle-method ranges);
  - CA.4 as "a false blanket duplicate", keeping its elementary routes;
  - DT.5 versus RP.5, and the remaining handoffs.
- **Application.** `apply_restructurings` with the twelve accepted proposals in `data/restructure/` applied first. After the correction all links apply and none closes a cycle.
- **Forwarding (§15).** For each narrowed layer, a link from each supplier to each atlas consumer was looked for. See §4.

## 1. Duplication

The ownership decisions are clear and well argued:
- CA.3 owns general matrix normal forms, with CN.0 consuming them.
- FF.0 and FF.3 own the finite-field constructors and algorithms, and CN.2 owns the certified class-group and unit algorithms. CA.5 keeps the comparison with intrinsic invariants.
- AC.0 owns the finite-abelian Fourier interface, and FF.1 its field specialization, with the |G| normalization factor made explicit.
- DT.3 owns logarithmic-form lower bounds and DT.4 the equation-specific bounds (with the added DT.4 → ED.2). ED.2 owns certified enumeration.
- RP.1 instantiates the anchor's general Selmer structures (EllipticCurves Layer 7) rather than redefining them. ED.3 consumes RP.1, and CN.3 consumes ED.3.

The anchor is used only as a supplier: its explicit isogeny formulas, Hasse bound, Mordell–Weil and descent algorithms, and bounded database search are imported, not relabelled.

## 2. Nothing lost

The target-preservation ledger lists every one of the 52 stages with what it keeps. The narrowed entries keep the application and comparison targets, and import the general constructions from named owners. The report states that "no consumer is redirected to an empty or narrower theorem without that import". That holds, but only through the narrowed layers' re-exports. §4 adds the direct links that §15 requires.

## 3. Anchor, format

- **The anchor.** It is not changed. No roadmap is extended, merged or retired.
- **Format.** The JSON follows PROTOCOL §15.

## 4. Correction made

**Why.** §15 requires that "every layer that relied on" a narrowed layer "gets a link from the new supplier". The proposal gave the consumers of its 21 narrowed layers no direct links from the new suppliers, relying on re-export instead. 66 supplier → consumer pairs were therefore missing.

**Added.** 42 of them, between atlas stages, none closing a cycle. None contradicts an edge the report explicitly excludes: CN.4 → ED.0, DT or ED → CA.4, and CN.3 → ED.3. Grouped by the narrowed layer that is being forwarded:

- **CA.1**: FF.1 → CA.4
- **CA.5**: CN.2 → CA.6; CN.2 → CA.7
- **CN.0**: CA.3 → CN.1; CA.3 → CN.4; CA.3 → ED.0; FF.0 → CN.1; FF.0 → CN.4; FF.0 → ED.0
- **CN.1**: FF.3 → CN.2
- **FF.1**: AC.0 → FF.2
- **FF.3**: EllipticCurves Layer 3 → CN.1; EllipticCurves Layer 3 → FF.4
- **ED.0**: CN.0 → DY.3; CN.0 → DY.5; CN.0 → ED.1; CN.0 → ED.3
- **ED.1**: GN.5 → ED.2
- **ED.2**: DT.3 → ED.5; DT.4 → ED.5; CN.4 → ED.5; ED.1 → ED.5
- **ED.3**: RP.1 → ED.4; RP.1 → ED.5; EllipticCurves Layer 6 → ED.4; EllipticCurves Layer 6 → ED.5; EllipticCurves Layer 7 → ED.4; EllipticCurves Layer 7 → ED.5
- **RP.0**: EllipticCurves Layer 6 → DY.1; EllipticCurves Layer 6 → DY.4; EllipticCurves Layer 6 → ED.2; EllipticCurves Layer 6 → RP.5
- **RP.1**: EllipticCurves Layer 6 → NC.5; EllipticCurves Layer 6 → ST.4; EllipticCurves Layer 6 → RP.2; EllipticCurves Layer 6 → RP.4; EllipticCurves Layer 7 → NC.5; EllipticCurves Layer 7 → ST.4; EllipticCurves Layer 7 → RP.2; EllipticCurves Layer 7 → RP.4
- **RP.3**: EllipticCurves Layer 5 → RP.6; EllipticCurves Layer 7 → RP.6

**Not added.**
- 23 pairs whose supplier is an `UPSTREAM:` audited Mathlib baseline. `restructure.py` does not draw upstream contracts, and each narrowed layer already names them in `suppliedBy`.
- 1 pair, AC.0 → AnalyticNumberTheory AN.1, forwarding FF.1. The accepted RS-07 drops AN.1.

## Questions for the orchestrator

1. **Re-export as forwarding.** RS-03 argues that a narrowed layer which re-exports an import makes direct forwarding unnecessary. §15 says otherwise, and this review followed §15. If re-export is acceptable, the 42 added links are redundant but harmless.
2. **Consistency with other proposals.** The report asks for the union with the GN.5 lattice owner, general Selmer imports, modular-symbol owners and geometric height inputs to be checked. Within the accepted restructurings there is no cycle. The unreviewed RS-02 and RS-08 should check their use of RP.1 and CN.3 against this proposal.
