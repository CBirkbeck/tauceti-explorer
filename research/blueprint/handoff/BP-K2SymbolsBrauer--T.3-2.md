# BP-K2SymbolsBrauer--T.3-2 — T.3 umbrella integration

Issue: #10812. Agent: Codex, session `codex-diLt7e`. The claim was confirmed by
bot comment 6268665457 after claim comment 6268661879. This is one completed
planning pass, not a checkpoint or a claim of formalization.

## Deliverables

- [Packet](../packets/K2SymbolsBrauer--T.3-2.json): four new nodes, 24 explicit
  imports from existing owners, ten target-coverage entries, two supplier
  requests and four inherited gaps. Status `complete`; T.3 coverage `planned`.
- [Reader](../readmes/K2SymbolsBrauer--T.3-2.md): exact native-unit formula,
  classical and higher-residue APIs and discriminating checks, the actual
  degree-two map square, finite support, and transfer/norm examples.
- [Suggested Lean](../suggested/K2SymbolsBrauer--T.3-2.lean): 122 lines. Real-bodied
  native unit-factor and tame-pairing adapters; milestone statements and examples.
  No admitted data, missing-theory carriers or replacement localization sequence.

The issue display title mentions classical residues, but its scope is the atlas
umbrella `K2SymbolsBrauer:T.3`, whose text also contains higher residues and
localization/transfer. All of that text is assigned to owners. The separately
queued child-stage jobs are unchanged; this session has claimed only #10812.

## Mathematical decisions

The original T.3 packet keeps ownership of tame symbols, the Serre residue
algebra, higher residues, finite support and localization comparisons. Its T.4
nodes keep ownership of Milnor norms; GeneralAlgebraicKTheory K.3 keeps Quillen
transfer/localization and K.7 keeps products. The new native unit adapter uses
pinned `Valuation.exists_eq_zpow_mul_unit_of_surjective` directly.

The roadmap uses τ(u,π)=ū. Weibel's III.6.3 symbol and the right-linear boundary
use its inverse. The new dictionary fixes the all-degree factor
∂first_n=(−1)^(n−1)∂last_n; the map square includes inversion, the actual
Matsumoto/plus comparisons, plus=Q, and the degree-one Quillen/classical adapter.
No group isomorphism is silently substituted for a specified product map.

Five umbrella landmarks are proposed by owner ID in `planetSelection`; two new
comparison theorems have node-level planet metadata. Native unit plumbing is not
an additional planet.

## Remaining supplier closure

No mathematical stage is marked closed. Before closure, resolve:

1. `G-T3-localization`: K.3's actual ring torsion-Serre-quotient application.
2. `G-T3-product`: K.7/T.2's actual ordered unit-product/symbol comparison.
3. `G-T3-generic-DVR`: registration and supply of the predecessor's generic
   complete-DVR extension/lattice/norm/component-length exports, and its exact
   finite-normalization completion-product request.
4. `G-T3-field-comparison`: the inherited T.1/T.2 stable-presentation and
   root-coordinate proof inputs.

Current upstream main was checked read-only, including AlgebraicCurves and
LocalFieldsRamification README/signature scope and the nine roadmaps absent from
the atlas snapshot, together with current Tau Ceti sources. AlgebraicCurves
Layers 5 and 9 already own arbitrary-residue completion and expansion targets;
the proposed LocalFieldsRamification Part II must retain the existing division
of ownership and supply only the missing finite-extension exports. No existing
upstream target has been re-planned here and no upstream file was changed.

The norm proof's Gille–Szamuely citation is inherited from its existing owner.
This run freshly read only the public author-hosted Weibel chapter sources named
in `sources`/`sourceVersions`; it does not claim to have read that book or closed
its generic-DVR supplier chain. E9 and E11 carry the earlier confirmed source
corrections forward in new wording, scoped to the chapter PDFs actually checked.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3-2.json`
  with the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.3-2.lean`:
  **exit 0; only twelve declaration-uses-sorry warnings**, at the required pins.
  No mathematical proofs are certified by this check.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauer--T.3-2.lean`:
  passed.
- Independent rational arithmetic checked the six printed tame values, all 390
  nonzero/non-one Steinberg inputs n/d with −20≤n≤20 and 1≤d≤10, and 500 seeded
  bilinearity, parameter-change and sign examples. A concrete generator 2+X of
  𝔽₅[X]/(X²−2) has order 24 and norm 2, checking the degree-two residue norm.
- The reachable blueprint-node dependency graph has 238 nodes and no node-ID
  cycle. Source-version evidence, portable paths, target owners and unchecked
  node statuses were checked. `git diff --check` passed.

Resume with the independent review of these four files, particularly the
cross-owner map transports and the retained supplier limits. No scratch artifact
is needed to interpret or continue the plan.
