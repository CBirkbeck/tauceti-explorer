# PKG-DiamondsAndVStacks

Complete package for #7468, by Codex — codex-60DrsW, 9 October 2026. Claim confirmed by the bot in issue comment 6072783002.

## Delivered

- `packages/DiamondsAndVStacks/README.md`: standalone roadmap, D0–D6 in order, with thematic groups, 90 numbered targets, all 213 API items and 116 examples, hypotheses, sources and prerequisites. Numbered internal links resolve. The file is 186,828 bytes, below the 200 KB limit; it contains no programme-process vocabulary or source quotations.
- `packages/DiamondsAndVStacks/Suggested.lean`: the accepted unified input, with a package-local header and standalone explanation of its omitted signatures. Every active declaration, test and import is unchanged.
- `packages/DiamondsAndVStacks/metadata.toml`: `topic = "math.AG"`.

The README follows the corrected accepted JSON, rather than copying the older reader's uncorrected assertions. It retains right-adjoint w-localization, the epimorphism formulation of split covers, generalization-direction localization, the corrected two-out-of-three labels, and the conditional component-orbit theorem. It preserves the six supplier contracts and seven unresolved proof inputs as explicit construction requirements. These are mathematical obligations of the accepted plan, not claims of completed proofs. In particular the early finite-étale localization and minimal-plus-ring extension cannot import later results circularly.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondsAndVStacks.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/packages/DiamondsAndVStacks/Suggested.lean`: **exit 0, no errors, 95 warnings, all “declaration uses sorry”**. Shared Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The input imports Mathlib only; its Tau Ceti geometric tests remain explicitly omitted, not falsely reported as elaborated.
- Correspondence check: all 90 targets, 213 API entries, 116 examples and 606 prerequisite occurrences represented; all 112 anchors unique and internal links resolve. Active Lean text matches the accepted input after removing comments. All omission names remain present. TOML, size and private-path checks pass.
- Read the reviewed AUDIT-36 results and relevant link boundaries. Read cited library statements at Mathlib `082e2d3` and Tau Ceti `f790474` using existing source trees. Public manuscript downloads reproduce all eleven recorded PDF hashes. No restricted library source was needed.

## Resume and limitations

No package work remains. The next step is independent package review. Suggested signatures are prototypes with supplier parameters; comments naming missing interfaces were not elaborated. Their complete mathematical requirements remain in the README and omission list.

Source locators were supplemented with manuscript pages: KL16 Theorem 3.5.8 is on p. 76; Berkeley 10.2.3 on p. 78 and §§18.1–18.2 on pp. 161–162; ECD 14.9 on p. 86; HK geometric conventions on pp. 14–15. SGA locators distinguish transcription/PDF pagination from original marginal pagination. Stacks 0APA–0APB concern invariant neighbourhoods of groupoid schemes; the README identifies this as a counterpart, not a proof of the general topological result. No plan files were edited.
