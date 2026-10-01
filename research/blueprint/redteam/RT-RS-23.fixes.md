# RT-RS-23: fixes

Fixer: Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5551, job FIX-RT-RS-23).
- **Findings:** `RT-RS-23.result.json`, one finding, confirmed in `RT-RS-23.review.json`. It is applied in the form the
  verifier gave.
- **Files changed:** `restructure/RS-23.result.json`, and `restructure/RS-23.md`, which has a new section 8 and updated
  counts and ledger row.
- **Checks:** `check_restructure.py` reports ok.
- **Independence.** I wrote none of the following:
  - RS-23 (ChatGPT, `astra-7c41e9`, PR #915);
  - its review (`cc-39fac3`, PR #4650);
  - the red team (PR #5315);
  - the verification (PR #5321);
  - RT-AREA-automorphic-1 or its fixes.

## /1 (medium, duplicate): R18.3's generic algebraic-forms API: fixed

- **R18.3 is now `narrow`,** with `suppliedBy: [AutomorphicFormsOnReductiveGroups:AF.5]`.
  - **Imported:** the generic API, namely algebraic automorphic forms on compact-at-infinity reductive groups as
    functions on finite adelic double cosets valued in an algebraic representation, with AF.4's integral coefficient
    lattices, Hecke operators and change of level.
  - **Kept:**
    - the definite-quaternionic instance;
    - the class set and its stabilizer computations;
    - finiteness;
    - Taylor–Wiles freeness, with the warning that finiteness is not group-ring freeness;
    - KW II's dyadic twisting;
    - the GL₂ comparison as an application of R17.3's global Jacquet–Langlands theorem (RS-21 links R17.3 → R18.3).

    No general transfer proof is commissioned.
- **New owner record:** AF.5 owns the generic API, `formerly` R18.3.
- **New link AF.5 → R18.3** carries the exact prefix contract.
  - **Acyclicity.** I checked that it is acyclic on `data/atlas.json`'s stage edges together with every link proposed in
    the restructure, link and packet files: there is no path from R18.3 to AF.5.
  - **AF.4.** AF.4 already precedes AF.5.
- **Option chosen.** The existing AF.5 is used with an explicit contract, which the finding allows. The earlier
  `AF.5:algebraic-forms` prefix was not used: it is not a live stage, and creating it would need its own promotion and
  links first.
- **Not changed:**
  - all of AF.5 is not moved into R18.3;
  - no quaternionic or Taylor–Wiles theorem is removed;
  - campaign and data files are not touched.
- **For the maintainer.** AF.5's text names the double-coset identification but not, for general compact-at-infinity
  groups, the Hecke operators and change of level. When AF.5 is blueprinted it must export them as part of this
  contract, or the generic Hecke and level-change part should be assigned to another AF stage.
