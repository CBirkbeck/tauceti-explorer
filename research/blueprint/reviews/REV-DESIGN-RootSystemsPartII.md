# REV-DESIGN-RootSystemsPartII — independent review

Reviewer: Claude (session `claude-ma8ENr`), issue #3605. The work under review is the design `DESIGN-RootSystemsPartII` by Codex (`codex-SmFmMR`, pull request #10328). This review did none of that work.

**Verdict: accepted.** Everything below was corrected in place; no part of the plan goes back to the designer.

## Files reviewed and corrected

- `research/blueprint/packets/RootSystemsPartII.json`: 12 nodes reviewed, one node added, review object written.
- `research/blueprint/readmes/RootSystemsPartII.md`: brought in line with every packet correction. It now also escapes `_` and lone `*` where the atlas renderer would turn them into italics.
- `research/blueprint/roadmaps/RootSystemsPartII.json`: the RS2.3 description now states the added case split.
- `research/blueprint/suggested/RootSystemsPartII.lean`: two statements of the case split added, plus one import.

## Counts

| | before | after |
|---|---|---|
| nodes (definition / construction / theorem) | 12 (2 / 4 / 6) | 13 (2 / 4 / 7) |
| API items | 35 | 36 |
| unit tests | 24 | 24 (kinds relabelled) |
| planets | 11 | 11 |
| baseline declarations | 24 | 37 (14 added, 1 removed) |
| gaps / requests | 0 / 0 | 0 / 0 |
| stages closed | 4 of 4 | 4 of 4 |

`python3 scripts/check_blueprint.py` on the packet reports 0 errors and 0 warnings, both with and without the pinned declaration index. `lean-check` on the suggested file exits 0, and its only warnings are the 14 `declaration uses sorry` warnings of the 5 theorems and 9 examples (no other warning). `scripts/check_sorry_data.py` passes.

## Sources (item 1)

All three sources were fetched again into scratch and read at every locator.

- **Rapoport 2000** (author PDF; SHA-256 matches the packet). The integral coroot order (1.8) is on p. 154 and the PU₃ and PGL₂ rank-one cases on pp. 156–157. Lemma 2.3 and Waldspurger's proof, with (2.10)–(2.13), are on pp. 157–158. Rapoport's lemma steps up from the smaller endpoint; the packet states it with the endpoints renamed, which is the same statement. Rapoport works with *relative* coroots, so for a nonreduced relative system (his PU₃ case) his order is coarser than the σ-invariant absolute order. The packet restricts to reduced systems. That restriction is harmless: the consumer is Kisin–Zhou, whose order ⋞ (§5.2.1, pp. 48–49) is the integral positive-coroot order of the *reduced* échelonnage system Σ on X\_\*(T)\_I. That is exactly the packet's order applied to the coroot system.
- **Stembridge 2008** (4-page note; SHA-256 `989cbdb4…` now recorded). Page map: p. 1 runs to equation (3); p. 2 has Claim 1, Remark 2 and the start of Claim 3; p. 3 has the end of Claim 3's proof, the proof of Claim 1 and Claim 4; p. 4 has Claim 5. Every locator in the packet is right. Formula (2), ⟨β\_i,β\_j∨⟩ = −N\_ij/b\_j, matches the orthogonal-fold statement.
- **Kisin–Zhou author file** (63 pages; SHA-256 matches). Proposition 5.2.3 and its proof are on pp. 49–52, and Corollary 5.2.7 on pp. 52–53. The orbit-sum inference that `RootSystemsPartII/E1` records is at the end of p. 49 and the top of p. 50.

No verbatim excerpt was found or added.

## Mathematics checked node by node (items 3 and 4)

- **integral-order, stembridge-step.** `TauCeti.posRootCone` is the additive closure of the simple roots, i.e. the natural-coefficient cone. The maximal-eligible-root proof is complete as sketched. Its sum-of-roots step uses `root_add_root_mem_of_pairingIn_neg`, whose non-opposite hypothesis holds because the eligible root is positive.
- **orbit-sum.** The Lean body sums over the distinct iterates. All the examples are true: identity, fixed root, shift of representative, two-member orbit, and period three padded to six.
- **orthogonal-fold, fixed-weyl-group.** Recomputed:
  - A₃ reversal: norms 4 and 2, Cartan entries −2 and −1, 8 roots.
  - D₄ triality: norms 6 and 2, entries −3 and −1, the 12 roots of G₂.

  Two distinct orthogonal orbits cannot have the same sum (descend both to a simple block). The fixed-group induction removes the |O| inversions of a block product. Restriction is injective, by a strictly dominant fixed vector. This is a cleaner argument than Stembridge's appeal to faithfulness.
- **adjacent-even-A-fold.** With e\_a ↦ −e\_(2n+2−a), the orbit sums are exactly ±f\_i and ±f\_i ± f\_j: 2n² roots, type Bₙ, base f\_i − f\_(i+1) and f\_n. The folded middle pairing is 2d\_n. The A₄ data and the non-unique short lift of f₁ are correct.
- **component-cycle, general-fold.** Orbit size multiplies by c, norms scale by c, and pairings are unchanged.
- **invariant-weight-transport, invariant-cone-transport, invariant-step.** The multipliers are 1 and 2, and they keep signs, so the chambers correspond. Simple coefficients are constant on orbits, so the integral cones correspond. The folded Stembridge step lifts to a positive orbit.
- **E1 regression, recomputed.** 2ρ has simple-coroot values 2 everywhere, and α₁ + α₂ pairs to (1, 1, −1, −1). Each translate is dominant after addition and lies below θ, but the orbit sum (1, 3, 1, 1) exceeds θ.
- **ambient-coroot-export.** V = E ⊕ Z holds because the Cartan matrix is invertible. Adding the increment to the original λ keeps the central component.

## Corrections made

1. **Unplanned case analysis (closure).** The general fold's proof needs to know every based automorphism of a connected Dynkin diagram: it is the identity on B, C, F₄ and G₂, and only the reversal of A₂ₙ has a non-orthogonal simple orbit. Tau Ceti pins the symmetry group `TauCeti.DynkinType.diagramSymmetry` and the individual graph permutations, but computes the group for no type. The packet had called this "inspection" part of the proof. It is now the added theorem `RootSystemsPartII:diagram-automorphism-orbits` (RS2.3, `addedBy` this review). Its proof:
   - non-simply-laced diagrams are paths whose reversal does not preserve the Cartan matrix;
   - in the simply-laced case, a tree automorphism fixes the tree's center. A fixed central vertex gives orthogonal orbits by the parity of distances. A swapped central edge forces two isomorphic halves, which by the pinned classification only A₂ₙ admits.

   It is stated in the suggested file as `simpleOrbit_pairing_eq_zero_or_typeA_even` and `indexEquiv_eq_self_of_multiple_edge`. `general-fold` now cites it.
2. **Type-A model.** `adjacent-even-A-fold` had cited `TauCeti.DynkinType.rationalDiagramAut` for an "existing type-A realization". The pin has a better match: `TauCeti.DynkinType.typeASimplyConnectedRootDatum`, whose roots are indexed by eₐ − e_b, and `TauCeti.DynkinType.typeAGraphAut`, which acts by exactly the packet's σ. The transport is now explicit. It goes by `RootPairing.Base.equivOfCartanMatrixEq` to the real base change (`TauCeti.rootPairingBaseChange`, `rootPairingBaseChangeBase`, `isReduced_rootPairingBaseChange`), noting that the real base change spans. `rationalDiagramAut` no longer has a citing node and was removed from the baseline.
3. **Component decomposition.** `component-cycle` now cites `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix` for the irreducibility of each block. `orthogonal-fold` cites `TauCeti.heightLinearMap_sum_nsmul_root`, which its height descent uses.
4. **Torsion on the consumer's lattice.** Kisin–Zhou apply the step on X\_\*(T)\_I, which may have torsion. `ambient-coroot-export` gains a step, and a check, lifting the conclusion from the image in X\_\*(T)\_I ⊗ ℝ. The lift works because the budget lies in the free coroot lattice and the increment is a sum of actual coroots.
5. **Neighbouring Tau Ceti roadmap.** ReductiveGroupsPartII is a TauCetiRoadmap pull request. Its RG2.1 states the coweight dominance order through the flipped `posRootCone`, and its RG2.4 orders X\_\*(T)\_I by that order. It plans neither the Stembridge step nor folding, so there is no duplication. `integral-order` records it as a use and gains the compatibility item `rootLE_flip_iff_coweight_dominance`. The current Tau Ceti (`a91d3aa`) has no dominance relation, Stembridge step or orbit-sum fold either.
6. **Unit-test kinds.** All 24 tests had kind `example`, which is not one of the five kinds in PROTOCOL §12. They are relabelled computation, degenerate, compatibility or non-example. The checker does not test this field.
7. **Baseline wording.** The `RootPairing.RootForm` entry claimed an invariance that no pinned lemma states; it now says the invariance is derived by reindexing. The finite-interval entry now says it is cited by the reader only.
8. **Bookkeeping.**
   - The Stembridge note's hash is now recorded.
   - The upstream notes are in the `{roadmaps, note}` form of PROTOCOL §10.
   - `RootSystemsPartII/E1` has the verdict **confirmed**: the inference is at pp. 49–50, and the D₄ data were recomputed.
9. **Reader.** It is synced with every change above, and the new lemma has its own section. The reader had many `β_O`, `Σ_(…)` and `X_*` spans, which the atlas renderer (`src/markdown.js`) would turn into italics; these are now escaped. A port of the renderer's emphasis rule finds no stray emphasis, and every packet statement, step, API item and test appears in the reader.

## Baseline citations

All 24 original declarations exist at Mathlib `082e2d3` and Tau Ceti `f790474`, and they say what the packet uses them for.
- Removed: `TauCeti.DynkinType.rationalDiagramAut`, which no node now cites.
- Added, each read at the pin:
  - `TauCeti.isTree_diagramGraph_cartanMatrix`, `TauCeti.diagramGraph_adj`;
  - `TauCeti.DynkinType.cartanMatrix`, `TauCeti.HasCartanType`, `TauCeti.DynkinType.mem_diagramSymmetry_iff`;
  - `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`;
  - `TauCeti.DynkinType.typeASimplyConnectedRootDatum`, its `hasCartanType_…` theorem, `typeAGraphAut`, `indexEquiv_typeAGraphAut_typeASimpleIndex`;
  - `TauCeti.rootPairingBaseChange`, `rootPairingBaseChangeBase`, `isReduced_rootPairingBaseChange`;
  - Mathlib `RootPairing.Base.equivOfCartanMatrixEq`.

## Scope, order and suppliers (item 8)

- **Order.** The layers are correctly ordered: RS2.1 → RS2.2 → RS2.3 → RS2.4.
- **Suppliers.** The only supplier is the Tau Ceti RootSystems roadmap, which already has the classification, the numbered data and the chamber and inversion APIs this plan cites.
- **The split.** The design brief named five routes to one candidate. The designer planned the Kisin–Zhou lane (the first route) and proposed the affine Demazure/Newton and the modular minuscule-bound directions as separate roadmaps. PROTOCOL §9 allows this, and the split is honest: the finite folding endpoint needs neither an affine action nor modular representation theory. All 80 briefed items are assigned exactly once (checked by script against the five paper results).
- **Brief versus outcome.** The brief said to keep the route's id and title. The design kept the job's assigned id `RootSystemsPartII` for the finite direction, and gave the briefed title (dominant subtraction and Demazure reduction) and the candidate id to the affine direction.

## Questions for the orchestrator

1. **The split.** Accepting it (`RootSystemsPartIIDominanceAndDemazure`, DA.1–DA.5; `RootSystemsPartIIMinusculeBounds`, MB.1–MB.3) is the maintainer's decision, as is retiring the old alias `RootSystemsDominancePartII`.
2. **Le–Le Hung–Levin–Morra.** That paper routes 26 more items to the affine candidate: M10, N02–N21, N24, N26, N75, N76 and N80. Its paper review (issue #1255) was still open, so they are outside the routing ledger. The affine brief in the packet now says so.
3. **Retarget the geometric consumer.** The Kisin–Zhou route that creates `GeometricSatakeLocalModelsPartII` tells its design to import the positive-coroot step from `RootSystemsPartIIDominanceAndDemazure`. Under the split, it should import `RootSystemsPartII:invariant-step` and `RootSystemsPartII:ambient-coroot-export` (RS2.4), with `RootSystemsPartII:integral-order` for ⋞.
4. **Upstream ownership.** The RootSystems and LieHighestWeight documents each assign the "dominance API" to the other. RS2.1 fills that gap for the order and the Stembridge step only. This is recorded in `upstreamNotes`.

## Mathematical changes to reviewed nodes

This review added one node and made the corrections listed above. They change no statement of a design node except two:
- the ambient export gains a torsion clause;
- the integral order gains an API item.
