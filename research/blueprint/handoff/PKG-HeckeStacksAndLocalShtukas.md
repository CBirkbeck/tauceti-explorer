# PKG-HeckeStacksAndLocalShtukas — completed package

Issue: #7489. Worker: Codex (GPT-6), session `codex-2Oy6em`.
Date: 9 October 2026.

All three package deliverables are complete. The next step is independent
package review; no continuation of this packaging job is needed. The accepted
packet, reader document and original suggested file were left unchanged.

## What was written

- `research/blueprint/packages/HeckeStacksAndLocalShtukas/README.md` contains
  the purpose, neighbouring-roadmap boundaries, conventions, library
  interfaces, supplier contracts and all 51 targets. Its five layers contain
  6, 10, 18, 10 and 7 targets respectively. Each target has explicit
  prerequisites and section/theorem/page citations; all 215 API entries and
  94 test specifications are present. Internal references use readable
  section numbers and links. The final document is 190,719 bytes, below the
  200 KB limit. It contains no programme-process narrative or source excerpts.
- `Suggested.lean` retains every declaration and test from the accepted
  suggested file. Changes are confined to explanatory comments and the
  single standard header note. A comparison after removing Lean comments
  found the executable declaration text unchanged. There is one import block
  with 35 distinct Mathlib imports and one consistent namespace.
- `metadata.toml` contains exactly `topic = "math.NT"`.

The upstream style reads were the complete Tau Ceti **ReductiveGroups** and
**RepresentationTheory/InductionRestriction** READMEs. The package orders
constructions by their use rather than by the order of a paper's sections.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/packages/HeckeStacksAndLocalShtukas/Suggested.lean`:
  exit 0 on the final file, zero errors, 999 warnings, all for declarations
  using `sorry`. No other warnings occurred. Memory availability exceeded
  20 GB before compilation, and only one compilation ran at a time.
- The shared build's Mathlib revision was
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, the required pin. This file
  imports only Mathlib. Tau Ceti interface statements were read at `f790474`;
  its current shared-build checkout has a different HEAD. Consequently the
  elaboration verifies the admitted interfaces as written, not integration
  with future native Tau Ceti geometric declarations.
- Structural checks matched all 51 targets, 215 API names and 94 test names
  to the accepted input, checked every internal anchor link, balanced math
  delimiters, table columns, the size bound and TOML metadata, and rejected
  private paths and programme-process terms in the README.
- A contiguous-source-text comparison against the eight source texts found
  no source passage in the package. The only long matching run in the README
  was bibliographic author/title information; none occurred in the Lean file.
- Submission-path/private-path checks and `git diff --check` were run before
  committing the four authorized deliverables.

## Source and mathematical checks

Fresh public PDFs were read in the versions specified in the README's source
list: [FS] author-hosted v4 (27 November 2024), [SW] print-ready Berkeley text
(27 March 2020), [HK] v2, [GL] v2, [GLX] published Inventiones version,
[DHKM] v2, [HHS] v1 and [HI] v4. Their hashes matched the accepted input's
version records. No restricted library book was needed or copied.

Spot checks included [FS], pp. 321–323 (kernel, action and adjoints); [SW],
pp. 219 and 223–224 (infinite level, twisted charts and period geometry);
[HK], Propositions 7.3.3–7.3.4, p. 43; [GL], Proposition 2.15, p. 9;
[GLX], §3.6 and equation (3.18), p. 829; [DHKM], Theorem 1.1 and Corollary 1.4,
pp. 1–2; [HHS], p. 2 footnote 1, Theorem 1.3.1 and Theorem 7.1.4;
and [HI], Propositions 4.1 and 4.3, p. 24 and following. Source citations
throughout the package retain the accepted input's precise locators.

The package preserves the inverse-cocharacter dictionary for local shtukas,
the positive Kottwitz sign for gluing a positive loop orbit, the distinction
between relative homology and exceptional direct image, and the separate
solid/ordinary coefficient conventions. The nonempty, positive-dimensional
hypotheses on failure of étaleness of the infinite-level period map remain
explicit. The one-leg Weil descent direction, collision-chain qualifications,
pullback direction of tower colimits, classical-support limit order,
pro-`p` hypotheses and torsion-only Levi formula are also retained.

## Boundaries for the independent reviewer

The accepted plan's nine gaps and 22 prerequisite requests remain supplier
contracts, with their mathematical content stated in the README. Packaging
does not close them or claim that their constructions are formalised. In
particular:

- All-prime integral highest-weight generation belongs to
  `ReductiveGroupsIntegralRepresentationsPartII`; the existing ReductiveGroups
  layer does not establish it.
- Uniformization uses the corrected positive Kottwitz sign and
  `B(G, μ)` image before inversion. The superseded opposite-sign exports
  are not asserted.
- The native smooth discrete representation carrier already exists; its
  enhanced derived extension remains a supplier contract.
- Nonbasic framed cohomology needs the chart and positive unipotent
  automorphism-group comparison; the basic case alone does not supply it.
- General integral RZ deformation spaces, formal-module comparisons across
  local fields, non-minuscule nonemptiness and the precise connectedness
  input remain conditional on their named suppliers.

No new error in the accepted plan was established during packaging. A
reviewer can resume directly at the package README and Suggested.lean,
comparing them with the unchanged accepted inputs and rerunning the commands
above. No scratch file is needed for that work.
