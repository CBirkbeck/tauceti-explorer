# Handoff: BP-KTheoryLowDegrees--U.1 (issue #764)

## Checkpoint and provenance

Author of this continuation: ChatGPT Pro (GPT-6 Astra Pro), session `gpt-20260926-c4e7b2`, 26 September 2026. The claim was confirmed by the issue workflow, comment 5848799161, in response to claim comment 5848798257.

**This is a source-verification checkpoint, not a completed blueprint.** It adds the detailed argument below for the existing Morita finite-generation gap and identifies a correction to a boundary-case acceptance statement. The packet, roadmap document and suggested Lean file are unchanged. In particular, their coverage flags, six gap records and eight supplier requests have not been removed or marked complete by this continuation. The integration checklist below is work still to do, not a claim that those edits have happened.

The inherited authoring and compilation history is preserved in the [previous handoff at the branch base](https://github.com/CBirkbeck/tauceti-explorer/blob/919bf760943644067515a97924a98953309d4123/research/blueprint/handoff/BP-KTheoryLowDegrees--U.1.md). That record covers the Claude Code session `cc-38267a` and the merged checkpoints #2918, #2919 and #2921. Its detailed source-issue register, consumer mapping, structural proposals and compilation recipe remain applicable to the unchanged deliverables. Historical checks in that record were not rerun here.

The four deliverable paths remain:

- `research/blueprint/packets/KTheoryLowDegrees--U.1.json`
- `research/blueprint/readmes/KTheoryLowDegrees--U.1.md`
- `research/blueprint/suggested/KTheoryLowDegrees--U.1.lean`
- `research/blueprint/handoff/BP-KTheoryLowDegrees--U.1.md`

The packet blob inspected was `96460bb7f0b61c4968c8dba0500bc6a169f41bf2`; the suggested-file blob was `94da862435f8ebcc2e73629b6cbb9fd14a451e77`. Do not replace the packet from scratch. Retain its existing node identifiers and the companion part `KTheoryLowDegrees--Z.3`.

## Inherited inventory, not new output counts

The preceding handoff reports 184 nodes: 16 definitions, 30 constructions, 68 lemmas, 52 theorems, 8 comparisons and 10 applications. Stage counts are Z.1: 24; Z.2: 24; U.1: 25; U.2: 18; U.3: 27; U.4: 30; U.5: 22; U.6: 14. It reports 379 API items, 200 unit tests, 44 planets, 380 baseline declarations and ten source issues, E101–E110. This continuation adds **zero packet nodes, zero API items, zero unit tests and zero planets**: the new work is the verified proof and integration specification in this handoff.

The inherited packet status is `partial`. Z.2, U.1 and U.2 were marked source-decomposed; Z.1, U.3, U.4, U.5 and U.6 were partial. No stronger status is asserted here. Implementation status remains unchecked.

## New verification: preservation of finitely generated projectives

### Target and precise hypotheses

The target is `KTheoryLowDegrees:Z.1/equivalence-preserves-finite-projective`, used by `Z.1/ring-k0-morita`, `Z.1/ring-k0-matrix` and `Z.2/matrix-division-ring-k0`.

Let A and B be associative unital rings, and let E be an equivalence between their categories of **left** modules. Use the packet's same-universe convention: both rings and the module carriers lie in a universe u. For every module M,

- M is finitely generated over A if and only if E(M) is finitely generated over B;
- M is projective over A if and only if E(M) is projective over B.

Consequently E and its inverse restrict to an additive equivalence between the existing full subcategories of finitely generated projectives.

Neither commutativity nor a Noetherian hypothesis is needed. The zero ring is allowed. The same-universe convention is relevant to the pinned comparison between categorical and module projectivity: that declaration explicitly assumes the coefficient ring is small relative to the module universe.

This verification is an argument from the actual pinned library declarations below. It is **not** a claim to have obtained or read Bass, *Algebraic K-theory* (1968), II.3. The inherited K-book quotation should retain its attribution to Bass; its statement and this independent proof route have different provenance.

### Pinned evidence read in this continuation

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
All the following statements, and the proof bodies in the specified passages, were inspected on 26 September 2026.

1. [Finiteness/Defs.lean, lines 115–166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean#L115-L166): `Module.finite_def` identifies finite generation of a module with finite generation of the top submodule. This is the library's existing notion, not a new definition.
2. [Finiteness/Basic.lean, lines 187–220](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Basic.lean#L187-L220): `Submodule.fg_iff_compact` identifies finitely generated submodules with compact elements of the submodule lattice. Its proof passes between finite spans and finite joins of singleton spans; it does not use Noetherianity.
3. [CompactlyGenerated/Basic.lean, lines 59–73](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/CompactlyGenerated/Basic.lean#L59-L73): `IsCompactElement` is formulated using nonempty directed subsets, their least upper bounds, and the order relation. The definition already makes sense for a partial order.
4. [ModuleCat/Subobject.lean, lines 25–65](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Subobject.lean#L25-L65): `ModuleCat.subobjectModule` is an order isomorphism from categorical subobjects of M to the actual submodules of M.
5. [Subobject/MonoOver.lean, lines 354–393](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Subobject/MonoOver.lean#L354-L393): `CategoryTheory.MonoOver.congr` transports monomorphisms into an object along an equivalence of categories. Its inverse uses the inverse equivalence and the unit isomorphism.
6. [Subobject/Basic.lean, lines 503–544](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Subobject/Basic.lean#L503-L544): `CategoryTheory.Subobject.lowerEquivalence` descends that equivalence to the thin skeleton defining categorical subobjects.
7. [Category/Preorder.lean, lines 222–259](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Category/Preorder.lean#L222-L259): `CategoryTheory.Equivalence.toOrderIso` turns an equivalence of partial orders into an order isomorphism. The unit and counit give its inverse identities.
8. [ModuleCat/Projective.lean, lines 19–45](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Projective.lean#L19-L45): `IsProjective.iff_projective` compares module projectivity with categorical projectivity. Retain its smallness hypothesis when generalising universes.
9. [Preadditive/Projective/Basic.lean, lines 242–253](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean#L242-L253): `CategoryTheory.Equivalence.map_projective_iff` preserves and reflects projective objects under an equivalence.
10. [Preadditive/AdditiveFunctor.lean, lines 220–240](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean#L220-L240): `CategoryTheory.Functor.additive_of_preserves_binary_products` requires both binary-product preservation and zero-morphism preservation. The second hypothesis must not disappear from the proof outline.
11. [Tau Ceti CartanMap.lean, lines 103–137](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/CartanMap.lean#L103-L137): `TauCeti.finiteProjectiveModules` is the conjunction of the actual `Module.Finite` and `Module.Projective` predicates. Its closure under isomorphisms is also proved there. The restricted equivalence must use this carrier rather than invent a second category of projectives.

### Complete order-theoretic transport argument

Here is the step previously abbreviated as “an order isomorphism preserves compact elements”. It should not remain an unexplained dependency.

Let q: L → L′ be an order isomorphism of partial orders and let k be a compact element of L in the sense of the pinned definition. Take a nonempty directed subset S of L′, a least upper bound u of S, and suppose q(k) ≤ u. Put T = q⁻¹(S).

T is nonempty because q is surjective. For x,y in T, directedness of S gives s in S with q(x) ≤ s and q(y) ≤ s. Its inverse image q⁻¹(s) is in T and is an upper bound of x and y, so T is directed.

The element q⁻¹(u) is the least upper bound of T. It is an upper bound because q preserves and reflects order. If v is any upper bound of T, then q(v) bounds S: every s in S has the inverse image q⁻¹(s) in T. Hence u ≤ q(v), and therefore q⁻¹(u) ≤ v.

Now k ≤ q⁻¹(u). Compactness of k supplies x in T with k ≤ x. Applying q gives q(x) in S and q(k) ≤ q(x), as required. Applying the same proof to the inverse order isomorphism proves reflection as well as preservation.

No choice of basis, finite presentation, tensor-bimodule representation or arbitrary-coproduct argument is used in this step. In particular it does not assume that an equivalence sends A to B.

### Finite-generation proof on the existing carriers

Compose the following three order isomorphisms:

Submodule_A(M) → Subobject(M) → Subobject(E(M)) → Submodule_B(E(M)).

The first is the inverse of `ModuleCat.subobjectModule M`. The middle map is obtained by applying `MonoOver.congr`, then `Subobject.lowerEquivalence`, then `Equivalence.toOrderIso`. The last map is `ModuleCat.subobjectModule (E(M))`.

Call the composite q. An order isomorphism sends the greatest element to the greatest element: every element of the target has an inverse image bounded above by the source's greatest element. Thus q(top) = top. The compactness transport argument gives compactness of the source's top if and only if compactness of the target's top. Apply `Submodule.fg_iff_compact` on both sides and then `Module.finite_def` on both sides. This proves the finite-generation equivalence for **every** module M, independently of projectivity.

The reverse implication can also be obtained using E's inverse and the unit isomorphism. It is not an additional finiteness assumption on E.

### Projectivity, additivity and restriction

Convert projectivity of M to categorical projectivity with `IsProjective.iff_projective`. Apply `Equivalence.map_projective_iff`. Convert back using the same module/categorical comparison over B. This supplies preservation and reflection of projectivity separately from the preceding finite-generation argument.

An equivalence preserves the universal properties of products and of zero objects. A zero morphism factors through a zero object. Its image under E consequently factors through a zero object and is zero; this explicitly supplies the zero-morphism hypothesis of `additive_of_preserves_binary_products`. With binary products preserved, that pinned lemma proves additivity. The same reasoning applies to E's inverse.

Using the two preservation statements, restrict E and its inverse to the existing full subcategories defined by `TauCeti.finiteProjectiveModules`. Morphisms are the ambient module morphisms. The components of the original unit and counit lie in those full subcategories because their endpoints do; their inverse identities and naturality are the original ones. This constructs the restricted equivalence. Its functor is additive because its hom maps are the original additive hom maps.

For declaration-level granularity, integration should separate finite-generation preservation, projectivity preservation/reuse, and the restricted-equivalence construction. The latter is data, not a second conjunct hidden in a lemma node. Before adding a general order-isomorphism compactness lemma, search both pinned libraries for that exact statement; the source search in this continuation verified the definition and the direct argument, but does not certify absence of every possible existing spelling of the transport lemma.

## Acceptance-statement correction found

The existing target node says that the countably generated free module A^(ℕ) is not finitely generated, without excluding the zero ring. The packet explicitly permits the zero ring. The acceptance statement therefore needs a hypothesis; this is a defect in the packet, **not** a new error attributed to a published source.

Use the following replacement acceptance statement when integrating:

> For a nonzero unital ring A, the free left module on a countably infinite basis is projective but is not finitely generated. Its image under a module-category equivalence is likewise projective and not finitely generated. Over the zero ring every unital module is zero, so the infinite-free non-example is not asserted there.

Proof of the negative case: a finite set of finitely supported vectors has a finite union S of supports. Every vector in its A-linear span vanishes outside S. Choose an index outside S. The corresponding standard basis vector has coefficient 1 there, which is nonzero, so it cannot lie in that span. Projectivity follows from freeness.

Proof of the zero-ring case: for every element m of a unital module, m = 1m = 0m = 0. Thus every module is the zero module and is finitely generated and projective. The main preservation theorem remains valid; only the non-example needs the nonzero hypothesis.

The matrix-equivalence acceptance statement must also retain the hypotheses of the actual matrix-equivalence construction, in particular a finite **nonempty** index type. It must not silently include the empty matrix ring.

A useful additional compatibility test is the Morita equivalence between a field k and 2-by-2 matrices over k. It sends the one-dimensional k-module to the two-dimensional column module. That column module is finitely generated projective but is not a free module over the matrix ring: its k-dimension is 2, whereas a free matrix module of finite rank n has k-dimension 4n. This test prevents the incorrect shortcut “the equivalence preserves the chosen free rank-one generator”. It is a proposed test, not one of the packet's currently committed 200 tests.

## Exact integration work still required

1. Edit the existing node `KTheoryLowDegrees:Z.1/equivalence-preserves-finite-projective` in place. Retain its ring and left-module conventions. Replace its abbreviated proof with the compactness, subobject, projectivity and additivity arguments above; preserve the same-universe/smallness condition.
2. Apply the corrected infinite-free acceptance statement, and retain the finite-nonempty matrix hypotheses. Mirror these statements in the roadmap document and the relevant suggested-file examples. Do not report the packet correction as applied until all affected deliverables are actually changed.
3. Give the required intermediate results declaration-level ownership and names. Reuse baseline declarations where they already supply the statement. A newly introduced restricted-equivalence construction needs its own uses, API and at least three genuine tests; the generic finiteness statement should not be needlessly limited to projectives.
4. Cite the primary formal sources inspected above with their pins and read date. Preserve the K-book's historical statement locator and its attribution to Bass. Do not label Bass II.3 as read. The independent proof should have its own provenance rather than making that quotation appear to contain this argument.
5. Once the declarations and their dependency chains are integrated and validated, replace the **Morita source-gap** record by the verified route. Update the corresponding remaining lists and summary counts, not unrelated gaps. Keep Z.1 partial while its separate finite-dimensional Morita comparison request remains unresolved.
6. Keep `Z.1/ring-k0-morita`, `Z.1/ring-k0-matrix` and `Z.2/matrix-division-ring-k0` pointed at the retained owning node or its explicitly split replacements. Check requests and cross-part references before removing any old node identifier.
7. Run the blueprint checker against the full current repository, verify node-level and stage-level acyclicity, check packet/document/prototype parity, and compile the suggested file at the actual pins. None of those integration checks was performed in this source-verification checkpoint.

## Remaining mathematical work inherited from the previous checkpoint

The unchanged packet records six gap groups. The first now has a detailed proposed proof route in this handoff; the others were not investigated here.

- **Z.1 Morita source gap:** integrate and validate the proof above. The independent comparison with GrothendieckEulerForms layer 4 remains a supplier request; a proof of general Morita invariance alone does not discharge that map-level comparison.
- **U.3 real-circle SK₁ example:** supply the topological inputs concerning elementary matrices/identity components and the map from the fundamental group of SO₂ to that of SO_n, or a sourced algebraic alternative. The K-book exercise statement alone is not a proof.
- **U.4 reciprocity inputs:** account for the tame formula, degree-m product formula and power reciprocity in BMS (A.16), (A.19)–(A.21), while resolving the recorded ClassicalArithmeticCompletion CA.1 to K2SymbolsBrauer T.7 dependency cycle.
- **U.4 higher-unit Hilbert symbols:** obtain and decompose the inputs of BMS (A.17)–(A.18), cited to Serre, *Corps locaux*, XIV. That source was not obtained here.
- **U.5 degree-zero ideal sequence:** Milnor patching and the K₀ Mayer–Vietoris argument of K-book I.2.7 and II.2.9, with the ownership proposal for Z.1 respected.
- **U.6 relative homotopy comparison:** compare classical relative K₁ with the fundamental group of the homotopy fibre; retain the K2SymbolsBrauer T.1:plus/T.6 inputs and the recorded combined-stage cycle. Also retain the previous warning about the unread obstruction-theory boundary of StableHomotopyKTheory H.3's plus-construction universal property.

The eight existing supplier requests remain: GrothendieckEulerForms layer 4; ClassFieldTheory layers 5, 12 and 13; Chebotarev layers 4 and 10; GlobalNumberFields layers 6 and 7. Their exact stage identifiers, requested statements and consuming nodes remain in the unchanged packet. This checkpoint neither adds requests nor claims these suppliers have finished.

## Ownership and conventions that must be preserved

The accepted RS-18 decision extends GrothendieckEulerForms by explicit ring and curve K₀ and stable-matrix K₁. Z.1 owns the general ring-level Morita extension, not a replacement for the existing categorical K₀ or the upstream finite-dimensional-algebra case.

Preserve the corrections in #2921: SchemeKTheoryOperations S.3 owns the localisation boundary and its unit-valuation normalisation; U.5 keeps its explicit cokernel-length boundary and the comparison with S.3. GeneralAlgebraicKTheory K.5 owns the relative homotopy fibre; U.6 owns the classical-relative-K₁ comparison. Do not introduce the external cycles previously identified through the combined GeneralAlgebraicKTheory K.2 stage.

Retain left modules for K₀, right modules with column vectors for the K₁ automorphism class, a finite set of finite places for S, and the positive uniformiser normalisation for the DVR boundary.

## Validation and access limits of this continuation

- The eleven primary-source passages listed above were read at the stated pins; the target node and its existing handoff were inspected.
- The zero-ring counterexample and the finite-support argument were checked mathematically, not by Lean execution.
- No packet, roadmap or Lean source was changed by this checkpoint. It therefore makes no new elaboration or implementation claim.
- The preceding author reported a successful pinned compilation of the 6,811-line suggested file and successful blueprint checks. Those are historical reports, not tests run in this continuation.
- The container could not resolve GitHub for downloading the full repository. Connected GitHub reads and branch writes worked, but this continuation did not obtain a local pinned Lean environment or run `scripts/check_blueprint.py`.
- This work did not re-audit all 380 baseline declarations, reread the six inherited mathematical sources, or re-review all 184 nodes. No claim of whole-packet source closure or independent review is made.

A continuation should begin with the integration checklist, retain all correct inherited files, and then address the remaining gap groups. The packet must stay partial until its own recorded obligations have actually been discharged.
