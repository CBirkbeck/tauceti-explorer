# BP-AInfCohomology--AI.0 — partial checkpoint

Issue #664. Author: ChatGPT, session `cg-20260927-b74e`. Claim comment 5850827496; bot confirmation 5850828819. This is submitted for independent review, not as a closed blueprint or a formalization claim.

## Delivered

The packet retains all eight required scope IDs. It has **26 nodes**, including the **seven inherited IDs**, **24 API contracts**, **24 definition tests**, **four planets**, **13 source-checked Mathlib declarations**, and **four explicit supplier requests**. AI.1 remains `partial`; the other seven scoped stages remain `not_read` in the source-decomposition ledger. No stage is closed or source_decomposed.

The inherited IDs are `ideal-decalage-complex`, `decalage-cohomology`, `derived-decalage`, `decalage-products`, `bockstein-reduction`, `preservation-derived-completeness`, and `completion-at-decalage-ideal`, all under `AInfCohomology:AI.1/`. The last is now the first comparison of Lemma 6.20; the second comparison is a separate `completion-limit-model` node. The accepted review of the old decomposition is not claimed to cover these changes.

The principal model is expanded into submodule, divided differential, specification, square-zero, complex, chain-map, cycle, boundary and cohomology statements. The Bockstein proof includes the necessary boundary-lift correction y→y+fv. The multiplication construction explicitly resolves its source after applying eta rather than assuming eta preserves K-flatness.

The independent completion regression uses A=Q[x,t], M=direct sum Q[x]e_n, and t=backward shift minus x. Its x-completion is a restricted sequence module N with N[t] nonzero. The canonical comparison is N→N/N[t], hence is not invertible. The statement deliberately does **not** claim abstract nonisomorphism of N and N/N[t]; indeed the extended shift-minus-x map is surjective. This is a calculation supplied here, not a purported example printed in BMS1.

## Validation actually performed

A scoped Python check passed on the committed packet representation: exact scope and coverage; node/API/test uniqueness; all prerequisite references resolve to the packet, its baseline list or the four source-read supplier stages; the internal graph is acyclic; all seven inherited IDs survive; source fields, API roles, minimum test counts and the four-planet limit are valid. No Lean block or proof placeholder occurs in the JSON. This is **not** the whole-repository validator or its declaration index. The fetched GitHub blob IDs match the local bytes: packet `fd139f39c100c1a9f76d287dca1bd431b41b9d3a`, suggested file `66ccf3de6bf7817945574c39600423b79e0fbd85`, and roadmap `f8d7af5ca51adbe4712684fb95848cb80d4c1ead`.

Independent Sympy/integer calculations passed: eight identities F(v_N)=−x^N e_(N−1), for N=1,…,8; seven successive finite-precision compatibility checks; and nine divided-differential/annihilator-quotient calculations for f=2,3,5 and exponents 1,2,3. These finite tests support, but do not replace, the infinite-sequence and derived-completion proofs in the roadmap.

**Lean was not compiled:** neither Lean nor Lake was available. The file contains real Mathlib-typed principal constructions, API signatures and concrete examples, with proof placeholders. It is not a proof implementation. The relevant `ModuleCat`, complex, derived-category, Finsupp and power-series source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`.

The browser environment did not run `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.0.json` against the full repository/index. The Swarm submission check must validate the committed files before intake. Repository-wide cycles and declaration-index matching are not certified by the scoped check.

## Exact prototype boundary

The suggested file proposes **12 of the 24 API signatures**, belonging to `etaTerm`, `etaDifferential`, `etaComplex` and `etaMap`, and all **12 tests** of those four constructions. It also proposes the finite-shift injectivity, completed-shift kernel and restricted-geometric-sequence statements, and two elementary sequence examples. Its fixtures use the existing integer-indexed Mathlib complex and actual polynomial/power-series carriers.

The following 12 generic API signatures and their corresponding 12 tests are **not** represented by Lean declarations in this checkpoint:

| Construction | Missing API suffixes in `TauCeti.Decalage` | Missing tests |
| --- | --- | --- |
| Ideal décalage | `idealEta_term`, `idealEta_changeGenerator`, `idealEta_map` | `ideal_unit`, `ideal_overlap`, `ideal_two_term` |
| Derived décalage | `derivedEta_objIso`, `derivedEta_naturality`, `derivedEta_identityIdeal` | `derived_kills_once`, `derived_retains_power_torsion`, `derived_nonexact` |
| Lax multiplication | `derivedEta_tensorMap`, `derivedEta_tensor_naturality`, `derivedEta_tensor_coherence` | `tensor_unit`, `tensor_sign`, `tensor_zero` |
| Bockstein complex | `bockstein_term`, `bockstein_lift`, `bockstein_square` | `bockstein_identity`, `bockstein_zero`, `bockstein_shift` |

The three principal cohomology proof nodes have prose contracts but no Lean signatures. The generic cohomology, localization, filtered-colimit, truncation, tensor, Bockstein reduction, preservation and completion-limit statements likewise need signatures once the E1/E2/E4/DD.1 substrate is supplied. Neither the identification with **derived** completion nor the canonical comparison of the regression is currently a Lean statement. No vacuous predicate or structure assuming those theorems is introduced to disguise this boundary.

## Ownership and source checks

Read the RS-01 proposal and accepted REV-RS-01; AI.1 stays the generic décalage owner, DD.1 the generic completion owner, and E4 its sheaf application. AI.5 owns the BMS1 §4.2 package imported by CP.5. E2/E4 requests make the replete-topos and limit hypotheses explicit. Their stage contracts are requests, not completed declarations. The current DD packet has no DD.1 granular node to cite instead.

Read AUDIT-35 and accepted REV-AUDIT-35. The large generated `data/library-coverage.json` returned empty contents through the connector; no successful read of that file is claimed. The accepted audit's AI.1 absence decision, rather than a fresh exhaustive search of both libraries, is the basis for planning these targets. Actual source was then read for each of the thirteen baseline declarations cited here.

The inspected BMS1 text is arXiv:1602.03148v3, the 124-page January 2019 version. The packet lists the exact portions read and separately identifies screened continuation passages. Rendering attempts for printed pp.49,50,52,55 failed; no visual PDF inspection or file digest is claimed. Parsed formulas were cross-checked against the proof text and the explicit affine calculations. Stacks tags 077J and 091N provide supplier leads, not a claim of complete recursive decomposition of their references. No confirmed error in the inspected source passages is asserted; `sourceIssues` is empty.

The AdicSpaces and ModularForms upstream conventions/API-and-acceptance sections were read for style. No upstream roadmap or integrated atlas file is modified. The four files of this issue are the only proposed repository changes.

## Resume worklist

First compile and repair the affine signatures at the pins, then expose the three principal cohomology maps. Complete the E1 termwise-flat replacement and localization contract, the invertible-ideal sheaf API and the canonical-truncation comparison. Split the Bockstein comparison into its map, cohomology injection and cohomology surjection declarations, with line-factor transitions.

Next discharge the E2/E4 completion tower and sheaf hypotheses; prototype both same-ideal comparison maps and the unrelated-ideal counterexample as statements about the actual completion functor. The counterexample must continue to assert failure of the canonical map, not nonisomorphism of the objects.

Finish AI.1 from BMS1 6.8–6.11, 6.13–6.14, 6.17–6.18, the specific nonflat base-change criterion, §7's commuting Koszul complexes and continuous cochains, and the BLM §§2,7–8 handoff. The required commuting-pair test remains unfulfilled. Then decompose AI.0, its integral and later comparison substages, AI.2, AI.3, AI.4 and AI.5 from their individually recorded source routes. The brief stage descriptions in the roadmap conserve scope; they do not count as completed source decomposition.
