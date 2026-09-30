# RT-PAPER-LEMKEOLIVER-WANG-WOOD-25

Red team of the extraction PAPER-LEMKEOLIVER-WANG-WOOD-25: Lemke Oliver, Wang and Wood, *The
average size of 3-torsion in class groups of 2-extensions*, Forum Math. Pi 13 (2025) e19. The red
team is Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4210.

The extraction is by `cc-fb70e5` and its review by `cc-442dc5`. The collation is by `cc-e94dc5`,
reviewed by `cc-39fac3`. I did none of them.

**Result: 1 finding, low.**

## Finding

**1. Four works the proofs use are missing from the prerequisites. (missing, low)**

The extraction's own item locators cite all four, and none appears in the prerequisites or anywhere
in `papers.json`:
- **Klüners–Malle, *Counting nilpotent Galois extensions* (2004), Corollary 7.3.**
  - It is the key input to Theorem 6.2 (item 24). It gives the O(X^{1/2+ε}) count for 2-groups
    without a transposition.
  - It also gives the upper bound for every permutation 2-group H. Klüners' Theorem 5.8 needs that
    bound to give Malle's asymptotic for C₂ ≀ H.
  - It is cited again for case (2) of Theorem 8.1.
- **Bhargava–Shankar–Wang (2015), Theorem 2.** The proof of Theorem 8.1 uses it to count quadratic
  extensions with local conditions.
- **Ellenberg–Venkatesh (2006), Proposition 1.3, and Alberts (2020), Corollary 1.8.** These justify
  the examples of case (1) of Theorem 8.1, which the review wrote into item 35.

**Fix.** Add the four works to the prerequisites.

## What held

**Routes.**
- RS-07 and RS-29 narrowed five of the six cited stages before the extraction, and the routed items
  fit what the narrowed stages keep:
  - AN.3 owns zero-density estimates.
  - AN.8 keeps prehomogeneous zeta integrals.
  - AN.4 keeps the prime-ideal applications.
  - ST.3 keeps class-group moments.
  - IG.4 keeps Shafarevich's theorem.
- The AN.8 packet so far covers only Bost–Connes, so the Shintani lemmas still await AN.8's
  blueprint.

**Consistency with other extractions.** Other extractions route the same inputs the same way:
- Ellenberg–Venkatesh to ST.3;
- Brauer–Siegel to AN.4;
- zero-density estimates to AN.3;
- Cohen–Lenstra–Martinet to ST.5.

No second owner exists.

**Version of record.**
- The extraction has no `sourceVersions`, though E9, E10 and E15 affect stated results.
- The accepted collation record reads the published version and holds all three. `collation.py`
  reads either record, so this is by design and not a finding.

**Other omitted references.** Everything else the paper cites but the prerequisites omit appears
only in the introduction or remarks, or as an alternative to a listed source.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json`: ok.
- No Lean was compiled.
