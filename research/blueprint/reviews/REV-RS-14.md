# REV-RS-14 — review of the RS-14 restructuring (p-adic L-functions and Eisenstein measures)

**Verdict: accepted, with one correction made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-a71f92`. This reviewer took no part in it. The reviewer did review the neighbouring RS-13 (REV-RS-13); its question 2 anticipated the correction below.

**What was read.**
- `RS-14.json`: two members (DirichletPadicLFunctions, AutomorphicPadicLFunctions), no anchors, and 6 evidence records (3 unordered pairs).
- The proposal `RS-14.result.json` (15 layer entries, 161 links before correction, 33 owners) and its report `RS-14.md`.
- The original texts of Dirichlet L0 and L4 and Automorphic L3 against their entries.
- The AutomorphicPadicLFunctions introduction.
- The accepted proposals RS-07 (its drop of AnalyticNumberTheory AN.1 and the upstream owners it names) and RS-13 (its owners AL.1, AL.5 and Dirichlet L0).

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-14.result.json` reports `ok` before and after the correction.
- **Coverage.** All 15 member stages have entries (12 narrow, 3 keep). The 3 evidence pairs share owner entries.
- **Forwarding (§15).** Every atlas consumer of each narrowed layer receives a link from every supplier.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. After the correction, 136 new edges apply and none closes a cycle. The 16 skipped links are the upstream Mathlib contracts introduced by the correction, which `restructure.py` records but does not draw.
- **Links to dropped stages.** Before the correction, AnalyticNumberTheory AN.1, which RS-07 dropped, was a supplier of Dirichlet L0, an owner, and the source of eight links.

## 1. Duplication

The two members share one rational construction and one automorphic extension.
- **Dirichlet** keeps the rational-field Kubota–Leopoldt spine, the Bernoulli and Mellin comparisons, the dyadic corrections and the measure-valued Eisenstein q-expansion (L4).
- **Automorphic** owns Deligne–Ribet over totally real fields, Katz's CM construction, and the GL₂ and unitary constructions. It imports the rational measures and proves equality on the F = ℚ domain.
- **ModularForms Layer 0** (Tau Ceti) owns the classical nebentypus Eisenstein series and generalized Bernoulli quantities, and **AL.1** owns general adelic GL₁ continuation.

The owners agree with the accepted RS-13:
- AL.1 owns the analytic GL₁ theory.
- Dirichlet L0 owns only the algebraic-to-complex comparison L(χ, 1−n) = −B_{n,χ}/n, which RS-14's L0 keeps.
- ModularForms Layer 0 owns the generalized Bernoulli quantities, which is the scope RS-13's corrected owner entry was written to allow.

## 2. Nothing lost

**The narrowings checked.**
- **Dirichlet L0** keeps the Mellin continuation argument, the Bernoulli application, the embedding comparisons, the Dedekind-series and residue comparison, the rational idele dictionary, and all conductor tests.
- **Dirichlet L4** keeps the p-stabilized Eisenstein series, the coefficient measures A_n and A_0, the specialization, and the measure-valued tame-character family with its integral congruences. It imports only the classical Eisenstein carrier.
- **Automorphic L3** keeps Deligne–Ribet with its algebraicity, congruences, smoothing and Euler factors, and Katz's ordinary CM construction with its differential operators, periods and evaluations. It imports the geometric objects and the rational measures, and proves equality at F = ℚ.

**Consumers.** The forwarding check covers every consumer of a narrowed layer.

## 3. Extension, anchors, format

- **The extension.** AutomorphicPadicLFunctions `extend`s DirichletPadicLFunctions with the title "Dirichlet p-adic L-functions, special values, and Eisenstein measures, Part II: Ray-class and automorphic interpolation". The base title is exactly "Dirichlet p-adic L-functions, special values, and Eisenstein measures". The Part II starts beyond the rational-field pseudomeasures, tame-character construction and Eisenstein measure, which Automorphic L3 imports.
- **Anchors.** The family has none, and no Tau Ceti layer is changed.
- **Format.** The JSON follows PROTOCOL §15.

## 4. Correction made

**Why.** RS-07 (accepted 21 September, in `data/restructure/`) drops AnalyticNumberTheory AN.1 and names two upstream owners for its content:
- `UPSTREAM:Mathlib-Riemann-and-Dirichlet-L-functions`, for zeta and Dirichlet continuation, functional equations, poles and nonvanishing, and Euler-factor corrections;
- `UPSTREAM:Mathlib-DirichletCharacter-conductor-and-orthogonality`, for primitive characters, conductor and orthogonality.

RS-14 still used AN.1 in three places. `restructure.py` keeps a dropped stage and only hides it, so RS-14's AN.1 links would have drawn eight new edges out of a hidden stage. The three changes, all in `research/blueprint/restructure/RS-14.result.json`, are:

1. **`layers[DirichletPadicLFunctions:L0].suppliedBy`.** AN.1 is replaced by the two upstream owners, and the reason records why.
2. **`owners`.** The AN.1 entry for the "classical complex Dirichlet continuation, conductor and imprimitive Euler-factor API" is replaced by two entries with the upstream owners, formerly Dirichlet L0, matching RS-07's split.
3. **`links`.** Each of the eight AN.1 links is replaced by links from both upstream owners. The targets are ColemanIntegration L0, Dirichlet KU-zeta, L0 and L1, EllipticRegulators ER.5, IntegralIwasawaTheory L0, ModularSymbolsPadicLFunctions L1 and SpecialValuesBirchTate B.1.

## Questions for the orchestrator

1. **The Automorphic document's introduction.** It should say that it is Part II of DirichletPadicLFunctions. It currently reads "Ray-class evaluation and GL₂, totally real, CM and unitary constructions", with no Part II statement, unlike the other members that have been extended so far.
2. **The upstream contracts are not drawn.** The 16 replacement links from the upstream Mathlib owners are recorded but not drawn, as with RS-07's own upstream links. If the map should show Mathlib-supplied analytic inputs, those owners need atlas stage ids.
