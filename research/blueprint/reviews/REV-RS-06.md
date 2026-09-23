# REV-RS-06 — review of the RS-06 restructuring (Beyond Katz–Mazur: modular curves, Serre modularity and Faltings finiteness)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-a71f92`. This reviewer took no part in it.

**What was read.**
- `RS-06.json`: eight members and two Tau Ceti anchors (ModularCurves and ModularForms). The members are AlgebraicModularFormsAndSerreWeights, ArakelovGeometryAndAbelianHeights, ClassicalSerreModularity, EllipticCurveModularity, FaltingsFinitenessAndIsogenyTheorems, ModularCurvesPartII, SerreWeightAndLevelOptimisation and SmallRamificationAndAbelianVarietyBaseCases.
- The family's 106 evidence records (63 unordered pairs).
- The proposal `RS-06.result.json` (74 layer entries, 595 links, 88 owners) and its report `RS-06.md`, in particular:
  - the decision tables;
  - the ordering table that splits R13.4 into R13.4a and R13.4b and R28.2/R28.3 into early and late phases;
  - the numbered evidence table.
- The original texts of R28.5, R12.4 and R15.1 against their entries.
- The accepted proposals in `data/restructure/`, and RS-25 (reviewed by this reviewer) for the Néron-model suppliers.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-06.result.json` reports `ok`.
- **Coverage.** Every one of the 74 member stages has an entry (59 narrow, 15 keep).
- **Evidence.** 55 of the 63 evidence pairs share an owner entry. The other 8 are resolved by the report's evidence table:
  - R15.1 and R12.5 versus R35.2: the unmetrized elliptic Hodge line versus the metrized abelian Hodge determinant (rows 1, 14, 15, 62).
  - R28.5 versus R25.3 and R25.4: Fontaine's and Schoof's nonexistence theorems are owned by R25, while R28.5 owns Shafarevich finiteness (rows 30, 102 and the R25 entries).
  - The ModularCurves anchor handoffs R12.4, R13.1, R13.2 and R13.4a (rows 58–60, 70, 71, 74).
- **Forwarding (§15).** For each of the 59 narrowed layers, every atlas consumer receives a link from every supplier.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. 518 new edges apply and none closes a cycle. The 29 skipped links all have `UPSTREAM:` sources, which the checker allows as external contracts.
- **Dropped stages.** No link, supplier or owner refers to a stage that an accepted proposal drops.

## 1. Duplication

The proposal is careful about two ordering traps and one ownership split:
- **R13.4.** It is split into an algebraic-only R13.4a and a later comparison R13.4b, so that R12.3 depends on R13.4a and not on the completed R13.4.
- **R28.2/R28.3.** The stage-level loop is broken into explicit early and late phases, so that no full isogeny-class bound is used before Tate's theorem.
- **Hodge lines.** R12.5 owns the elliptic Hodge-line comparison, and R35.2 owns the different, metrized abelian determinant.

The external supplier choices agree with RS-25:
- R11.1 supplies Néron models (for R35.2);
- R11.3 supplies abelian semistable reduction (for R28.3 and R28.5);
- R11.4 supplies the semistable Picard and character-group theory (for R13.6, R14.2 and R14.6).

## 2. Nothing lost

**The narrowings checked.**
- **R28.5** keeps Frobenius-data isogeny-class finiteness, the Raynaud-type height bound, Shafarevich finiteness with its polarization and bad-set data, and the curve corollary through a separately proved Torelli step.
- **R12.4** keeps the missing geometric connectedness, the base-extension and analytic comparison and the descent of the chosen component. It imports the twisted curve rather than rebuilding it.
- **R15.1** keeps all-weight geometric forms, cusp-ideal twists, coefficient and base-change maps and the analytic comparison. Its integral q-expansion comparison is supplied inside the family (formal cusps from R13.3, section detection from R15.2).

**Consumers.** The forwarding check covers every consumer of every narrowed layer.

## 3. Extensions, anchors, format

- **The extensions.**
  - AlgebraicModularFormsAndSerreWeights becomes "Modular forms — Hecke theory, newforms, and L-functions, Part II: Geometric reduction, Serre weights and eigenvalue lifting".
  - ModularCurvesPartII becomes "Modular curves, following Katz–Mazur, Part II: Uniformization, integral boundary and Hecke cohomology".

  Both use their Tau Ceti base titles exactly.
- **Anchors.** They are not changed. Anchor layers appear only as suppliers, owners and link sources.
- **Format.** The JSON follows PROTOCOL §15.

## Questions for the orchestrator

1. **ModularForms may get two Part IIs.** RS-08 (unreviewed) proposes ModularSymbolsPadicLFunctions as "Modular forms, Part II: cohomological symbols and analytic p-adic L-functions". RS-06 proposes AlgebraicModularFormsAndSerreWeights as a second Part II of the same Tau Ceti ModularForms.
   - Two sequels of one base are not forbidden, but their scopes must not overlap, and each must start where ModularForms stops.
   - RS-08's title also shortens the base title "Modular forms — Hecke theory, newforms, and L-functions" to "Modular forms".

   REV-RS-08 should reconcile the two.
2. **Many links.** 595 links, 547 of them new, will make the stage map dense. Many are §15 forwarding links from the 59 narrowings, and the consumer blueprints should prune those they do not use.
