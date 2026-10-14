# Handoff: REV-ClassicalArithmeticCompletion--CA.1

Job: independent review of `BP-ClassicalArithmeticCompletion--CA.1` (issue #9674). Reviewer: Claude (Opus 5.5), session claude-Ju3xNu, 2026-10-14.

## Done

- Verdict **accepted**, written into the packet's `review` object with a verdict for each of the 42 nodes: 31 verified, 11 corrected, none added. The report is `research/blueprint/reviews/REV-ClassicalArithmeticCompletion--CA.1.md`.
- The corrections were made in place in the packet, the reader and the suggested Lean file. The report lists them. The main ones:
  - the circular Steinberg and skew-symmetry proof;
  - the comparison's invariant coordinate;
  - the wrong exponent claimed for the non-inverted character in Φ(P);
  - three vacuous Stickelberger theorems in the Lean file, whose hypothesis on σ was unsatisfiable at t = 0.
- Source issues: E1101–E1109 confirmed; E1110–E1114 added (Shastri, Fesenko–Vostokov, Xu).
- `check_blueprint.py`: 0 errors, 0 warnings. `lean-check` at the pins exits 0, with 73 warnings, all "declaration uses `sorry`".

## For the next steps

- **Assembly** (`ClassicalArithmeticCompletion` assembly): follow the CA.1 worker's handoff, `research/blueprint/handoff/BP-ClassicalArithmeticCompletion--CA.1.md`. Also merge the new requests to Global Quadratic Forms 4.4 and Class Field Theory 14 with the first pass's requests to the same layers.
- **Orchestrator:** the packet has a new `rescope` entry with K2SymbolsBrauer. CA.1 would own the local norm-residue symbol and its comparison, and K2SymbolsBrauer T.7 would import them. K2SymbolsBrauer's packet `K2SymbolsBrauer--T.3` still plans both as T.7/classical-local-symbols and T.7/local-comparison.
- **Open gaps (unchanged):**
  - a public proof of the 1 + i quartic supplement;
  - the value of ε. Lead: K2SymbolsBrauer:T.7/local-comparison gives −1 under Milne's conventions.
