# REV-RS-13 — review of the RS-13 restructuring (Automorphic L-functions and special values)

**Verdict: accepted, with one correction made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `astra-20260921-f6b2d8`. This reviewer took no part in it or in any other RS job.

**What was read.**
- `RS-13.json`: the family, two members, no anchors, and six directed leads (three pairs).
- The proposal `RS-13.result.json` and its report `RS-13.md`.
- Both member documents with all their layer descriptions: AutomorphicLFunctionsAndLocalFactors AL.0–AL.5 and PeriodsAndSpecialValues PS.0–PS.9.
- The stage extracts, with every recorded consumer of PS.1, AL.1, AL.4 and AL.5.
- The reviewed library audit targets of PS.1, AL.1, AL.5 and DirichletPadicLFunctions L0.
- The DirichletPadicLFunctions L0 and KU-zeta descriptions.
- The neighbouring proposals that touch the same mathematics: RS-07 (accepted and applied, in `data/restructure/`), RS-14 (unreviewed) and RS-21.

**Check.** `python3 scripts/check_restructure.py research/blueprint/restructure/RS-13.result.json` reports `ok` after the correction.

## 1. Duplication

- **AL.1 ↔ PS.1.** PS.1's audited targets include the Dirichlet/Tate case and its analytic factors. The analytic GL₁ package (local and global Tate theory, L/ε/γ factors, Γ_ℝ and Γ_ℂ, and the global functional equation) is AL.1's. The owner entry is right. It also agrees with RS-07 and RS-21, which name AL.1 as the owner of Tate integrals.
- **AL.5 ↔ PS.1.** PS.1's modular-form case needs the GL₂/Rankin critical-value normalization, local corrections and algebraicity inputs. AL.5 plans exactly these, for the GL₂/Rankin families of AutomorphicPadicLFunctions. The motivic period identification stays in PS.1. The owner entry is right.
- **AL.4 ↔ PS.1.** This pair is a comparison between an unramified Satake factor and a motivic Weil–Deligne factor, not a duplicate. The proposal rightly records no owner.
- **PS.1 and DirichletPadicLFunctions L0.** PS.1's Dirichlet case needs L(χ, 1−n) = −B_{n,χ}/n and the Gauss/conductor identities, which L0 plans. So PS.1 imports them.
- **Nothing missed.** No other layer pair between AL and PS plans the same mathematics. PS.2–PS.9 (formal periods, regulators, fundamental lines, ETNC, BSD, computation, mirror symmetry, MZVs) do not meet AL.

## 2. Nothing lost

**PS.1 keeps every motivic target.** Its narrowed `keeps` retains all five audited targets:
- the completed motivic L-function from Weil–Deligne data;
- critical integers from both infinity factors;
- the Deligne-type statement;
- the Dirichlet/Tate motivic comparison;
- the modular motivic comparison.

What it loses (the analytic factors, the GL₂/Rankin normalization and the Dirichlet algebraicity) has named suppliers: AL.1, AL.5 and L0.

**Consumers.**
- **PS.1's consumer.** Its only recorded consumer, PS.7, receives direct links from AL.1, AL.5 and L0.
- **AL's consumers.** No AL layer changes, so their outside consumers lose nothing. These are AN.8, R16.2, R16.5, GZ.0, GZ.4, GZ.5, MP.0, BSD.0, ET.6, R.5, and L0 and KU-zeta of DirichletPadicLFunctions.

**Acyclicity.** Every new edge ends at PS.1 or PS.7. Neither has a path back to AL.1, AL.5 or L0, so no cycle is created.

## 3. Anchors and extensions

The family has no anchors, no Tau Ceti roadmap changes, and no roadmap is extended, merged or retired.

## 4. Format

The JSON follows PROTOCOL §15:
- `roadmaps` keep both members;
- `layers` lists three `keep` entries and one `narrow` with `keeps` and `suppliedBy`;
- there are seven `links`, of which three restate existing edges and four are new;
- each of the three `owners` has exactly one owner.

## 5. Correction made

**owners[2] (owner DirichletPadicLFunctions L0).**
- **The old target.** "Generalized Bernoulli numbers and the primitive-character Gauss/conductor identities giving the algebraic-to-complex Dirichlet special-value comparison".
- **The new target.** The algebraic-to-complex comparison itself (L(χ, 1−n) = −B_{n,χ}/n, with the Gauss and conductor identities it uses).
- **Why.** RS-14 (unreviewed) narrows L0 and proposes the Tau Ceti ModularForms layer 0 as owner of the generalized Bernoulli quantities, while keeping this comparison in L0. The old wording would have given L0 ownership of the generalized Bernoulli numbers in conflict with RS-14. The corrected entry is right whether or not RS-14 is accepted.

## Questions for the orchestrator

1. **A stale sentence in the report.** `RS-13.md` says "Keep PS.0 → PS.1, AN.1 → PS.1 and PS.1 → PS.7". RS-07 (accepted 21 September) dropped AnalyticNumberTheory AN.1 and rewired PS.1 to `UPSTREAM:Mathlib-Riemann-and-Dirichlet-L-functions`. The RS-13 JSON adds no AN.1 edge, so applying it is unaffected, but the report sentence is stale. This review may not edit `RS-13.md`, which is not one of its deliverables.
2. **RS-14 relies on a dropped layer.** RS-14 (unreviewed) lists `AnalyticNumberTheory:AN.1` among the suppliers of its narrowed L0 and names AN.1 an owner, although RS-07 dropped AN.1. REV-RS-14 should reconcile this, most likely by naming the upstream Mathlib owner RS-07 chose.
3. **Order of application.** If RS-14 is accepted, L0 imports the generalized Bernoulli quantities from Tau Ceti ModularForms layer 0. RS-13's link L0 → PS.1 then still carries what PS.1 needs, namely the comparison. No change to RS-13 would be required.
