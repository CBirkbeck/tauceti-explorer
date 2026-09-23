# REV-RS-02 — review of the RS-02 restructuring (Abelian schemes and finite flat group schemes)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `gpt-20260921-c74f2a`. This reviewer took no part in it.

**What was read.**
- `RS-02.json`: two members (AbelianSchemesAndArithmeticModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory), two Tau Ceti anchors (JacobianChallenge, ModularCurves) and 36 evidence records (28 unordered pairs).
- The proposal `RS-02.result.json` (13 layer entries, 274 links, 23 owners) and its report `RS-02.md`, including its ownership table and its account of why the retained geometry cannot be collapsed into the anchors.
- The original texts of A2 and R07.1 against their entries.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-02.result.json` reports `ok`.
- **Coverage.** Every one of the 13 member stages has an entry (9 narrow, 4 keep).
- **Evidence.** 21 of the 28 pairs share an owner entry. The other 7 are member–anchor handoffs resolved in the report's table:
  - A1 against ModularCurves 1A and Layer 1;
  - A2 and A3 against Layer 2;
  - A4 against Layer 7;
  - R07.1 against Layers 0 and 7.

  In each, the anchor stage is imported and the member proves the new relative or general theorem compatibly.
- **Forwarding (§15).** For every narrowed layer, every atlas consumer receives a link from every supplier.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. All 221 new links apply and none closes a cycle. No reference is made to a stage an accepted proposal drops.

## 1. Duplication

The ownership split is precise:
- **JacobianChallenge** Layers D and E own the field-level Picard functor, Jacobian and abelian varieties. A2 imports them and owns the relative dual over general bases, through Faltings–Chai I.1.9's abelian-space-to-scheme theorem.
- **ModularCurves** owns the elliptic specializations:
  - 0B, finite locally free group schemes and Cartier duality;
  - 0C and 0E, quotients, torsors and descent;
  - 2D, Picard duality;
  - 7E, the elliptic p-divisible groups and the henselian connected–étale sequence.

  R07.1 re-exports 0B rather than building a second Cartier carrier. It owns the arbitrary-height p-divisible category, and Raynaud's e < p−1 theorems with their base hypotheses.

The report's concrete acceptance conditions are kept in A2's entry: the elliptic translation sign, and the rigidifying base-line correction.

## 2. Nothing lost

**The narrowings checked.**
- **A2** keeps the whole dimension-general relative-dual programme: Poincaré bundle, biduality, φ_L, polarizations, Rosati and polarization types. It imports only the field and elliptic objects.
- **R07.1** keeps flat closure, Raynaud's uniqueness, full faithfulness and Ext injectivity, the (p,…,p) classification and tame-inertia characters. It explicitly keeps the dyadic restriction.

**Consumers.** Forwarding covers every consumer of a narrowed layer.

## 3. Extensions, anchors, format

- **The extensions.**
  - AbelianSchemesAndArithmeticModuli becomes "The Jacobian challenge (Christian Merten's AG version), Part II: abelian schemes and arithmetic moduli".
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory becomes "Modular curves, following Katz–Mazur, Part II: finite flat groups and integral p-adic Hodge theory".

  Both use their base titles exactly. Each starts where its anchor stops: at abelian schemes over general bases, and beyond the anchor's finite-group and elliptic p-divisible/Serre–Tate branch, respectively.
- **Anchors.** They are not changed.
- **Format.** The JSON follows PROTOCOL §15.

## Question for the orchestrator

**ModularCurves may get two Part IIs.** RS-06 (reviewed) makes ModularCurvesPartII "Modular curves, following Katz–Mazur, Part II: Uniformization, integral boundary and Hecke cohomology". RS-02 makes FiniteFlatGroupsAndIntegralPadicHodgeTheory a second Part II of the same anchor. Their scopes are disjoint (analytic uniformization and compactification, versus finite flat and p-divisible groups), so this is allowed, but the atlas will then show two sequels of ModularCurves. Similarly, ModularForms may receive two Part IIs from RS-06 and RS-08 (see REV-RS-06).
