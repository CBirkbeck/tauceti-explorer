# REV-RS-05 — review of the RS-05 restructuring (Adic spaces, perfectoid spaces and diamonds)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-c83e7a`. This reviewer took no part in it.

**What was read.**
- `RS-05.json`: nine members, one Tau Ceti anchor (AdicSpaces) and 227 evidence records (116 unordered pairs). The members are:
  - AdicEtaleGeometry and AdicSpacesPartII;
  - ClassicalAdicEtaleCohomology, DiamondEtaleCohomology and DiamondSixOperations;
  - DiamondsAndVStacks and VStackSheavesAndLisseCategories;
  - PerfectoidShimuraVarieties and PerfectoidSpaces.
- The proposal `RS-05.result.json` (71 layer entries, 454 links, 62 owners) and its report `RS-05.md`, in particular:
  - its "three corrections" to reading mixed paragraphs;
  - the exception table for forwarding;
  - the "Disposition of every family evidence pair" table.
- The entries for all 20 narrowed layers, and in full those for F0, R5 and PerfectoidSpaces P0–P3.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-05.result.json` reports `ok`.
- **Coverage.** Every one of the 71 member stages has an entry (20 narrow, 51 keep).
- **Evidence.** Every one of the 116 pairs has a disposition in the report table. 73 share an owner entry. The other 43 are recorded as different objects, supplier contracts or comparisons; two examples are the analytic adic site versus the diamond site (pair 10), and structure-sheaf acyclicity versus étale acyclicity (pair 14).
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. All 363 new links apply and none closes a cycle. No link, supplier or owner refers to a stage that an accepted proposal drops.
- **Forwarding (§15).** 15 supplier → consumer links are absent. §2 covers them.

## 1. Duplication

The family has one analytic carrier per notion:
- **R0** owns analytic tensors, products and ordinary morphisms.
- **A1** owns the analytic étale and pro-étale sites.
- **P1–P3** own perfectoid Tate rings, tilting and almost purity.
- **D0–D6** own diamonds and v-stacks.
- **H0–H5** own the classical adic cohomology, **C0–C9** the diamond cohomology, and **S1–S6** the six operations.

Anchor layers 0–5 of Tau Ceti AdicSpaces are imported as carriers. The proposal adds only extensions of them: completed tensors, the étale site, and the perfectoid instances of rational localization.

**Consistency with paper routes.** The PerfectoidSpaces narrowings keep what the paper extractions route to them:
- P0 keeps general almost algebra over an abstract idempotent ideal, with descent and completion.
- P1 keeps perfectoid Tate rings, tilt/sharp and untilts.
- P2 keeps perfectoid rational-localization stability, the tilt homeomorphism and the approximation estimates (Scholze Corollary 6.7).

## 2. Nothing lost, and the forwarding exceptions

**The narrowings checked.**
- **F0** keeps Noetherian Spf, ideal-of-definition independence, coherent formal modules, completion, formal functions and formal GAGA. Its analytic paragraph becomes a forward reference to R0–R3.
- **R5** keeps the sousperfectoid class, the products and their local descriptions. Continuous profinite-torsor descent is exported by the later P9.

**The exceptions.** §15 asks that every consumer of a narrowed layer get a link from each new supplier. The report instead tabulates, one by one, the 15 pairs it omits:
- R0, R1, R2 and R3 → R09.6, R13.1 and R11.1, for the narrowed F0;
- R3 → H1:formal-adic-comparison;
- R3 → R2;
- P9 → O0 and P9 → RF0:integral-Y, for the narrowed R5.

**The reason given.** These consumers use only the retained early formal or product component. The relocated material is a later theorem that they do not use, and making it a prerequisite would reverse the construction order. For R3 → R2 this is literal: the atlas has R2 before R3, and the link would close a cycle.

**The review's judgement.** The argument is sound. Adding these links would give, for example, Néron models (R11.1) a false prerequisite on analytic adic geometry R0–R3. The review accepts the tabulated exceptions. REV-RS-16 met the same situation with one link, and there too the exception was accepted.

## 3. Extension, anchor, format

- **The extension.** AdicSpacesPartII becomes "Foundations of adic spaces, Part II: analytic and formal geometry". The Tau Ceti base title is exactly "Foundations of adic spaces".
- **The anchor.** It is not changed. Its layers appear only as suppliers, owners and link sources.
- **Format.** The JSON follows PROTOCOL §15.

## Question for the orchestrator

**Relocation versus forwarding.** Two reviewed proposals, RS-05 and RS-16, relocate the late part of a narrowed layer to a later supplier and justify not forwarding that supplier to the narrowed layer's consumers. §15 as written requires the forwarding link. The rule could be amended to allow a tabulated exception when the consumer uses only the retained part, or when the link would reverse the construction order.
