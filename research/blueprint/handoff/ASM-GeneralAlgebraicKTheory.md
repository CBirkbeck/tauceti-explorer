# ASM-GeneralAlgebraicKTheory — assembly handoff

Issue: [#233](https://github.com/CBirkbeck/tauceti-explorer/issues/233). Agent: Codex. Session: `codex-n2m1NW`. Date: 2026-10-07. Status: **assembly complete**; the contributing packets retain their partial mathematical status and await independent review.

## Delivered

The [combined reader](../readmes/GeneralAlgebraicKTheory.md) opens with purpose, ownership boundaries, notation, sources, construction order and pinned inputs. It presents all 156 nodes from K.1–K.5 and then K.6–K.7, grouped by layer, preserving their statements, hypotheses, proof outlines, acceptance criteria, 236 API items, 159 tests and source locators. It retains the three source gaps and both parts' source discrepancies. Stale introductory node/API/test counts were replaced with the current JSON counts; source-reading records remain attributed to their contributing parts.

The [combined suggestion](../suggested/GeneralAlgebraicKTheory.lean) joins the two files with one standard note, ten distinct imports, one universe declaration and one `TauCeti.HigherK` namespace. Exact-category variables are scoped to the baseline examples. It retains the concrete Mathlib-backed data and represents every packet API/test name. Future-carrier sketches remain explicit comments, without arbitrary proposition fields, Unit substitutes or True theorems. Ring/exact-category argument order and the unital/nonunital models are reconciled.

The only packet edit adds `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors` to the prerequisites of `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`. That node's hypotheses and proof already require the all-degree pairing. The supplier is the early products prefix and has no K.6 dependency. This makes the existing proof dependency explicit; the theorem statement, hypotheses, proof and sources are unchanged.

Both `review` objects remain exactly as supplied (`needs_changes`, `independent-review-REV-FIX-RT-AREA-ktheory-1`, 2026-09-30), and both `reviewHistory` arrays are unchanged. No part readme or part suggested file was edited. No atlas, upstream roadmap, planet or accepted restructuring was changed.

## Validation and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralAlgebraicKTheory--K.1.json research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json`: both pass, **0 errors, 0 warnings**, against the pinned declaration index.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables: **4 files, 0 problems**; `git diff --check` is clean.
- Assembly preservation audit: 156 node blocks match the part documents, except the one added prerequisite line; every API/test name occurs in both assembled files; no repeated node ID or import; relative links resolve; no private paths.
- Cross-part audit: **73** explicit cross-part edges, **396** total same-roadmap edges, all endpoints present; the union graph is acyclic after adding the projection-formula edge. The full cross-part table is below.
- Pinned inputs: all **61** distinct baseline references resolve. Their declarations were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The library audit's projective-resolution and commutative-scalar-extension restrictions are retained. The recorded Grothendieck–Euler links and two upstream reader examples were inspected.
- `free -g` showed **106 GB available** before `lean-check research/blueprint/suggested/GeneralAlgebraicKTheory.lean`.
- **The full Lean file did not compile.** The check exits at line 1: the shared pinned build lacks the object file for `TauCeti.CategoryTheory.GrothendieckGroup.Exact`. Nothing later in the assembled file was elaborated. Earlier compilation claims for the Mathlib-only part do not establish compilation of this assembly. No build, dependency update, cache download or language server was started. `implementationStatus` remains `unchecked` in both packets.

## Signature corrections requiring review

The packet mathematics was preserved. The suggested sketches below change mathematically incorrect or mismatched forms from the part suggestions to agree with that mathematics. They require independent review as part of the assembly; no old verdict is superseded. These are signature comments rather than new proved declarations.

1. Class-weak maps: retain only equality in the Grothendieck quotient, without intersecting the old weak-equivalence class; use the API name KTheory.classWeakEquivalences.
2. Nil inclusion: compare in the projective-line target with (u0−u1) composed with forget, rather than polynomial scalar extension.
3. Negative Laurent decomposition: restore both Bass NK summands for an arbitrary ring.
4. Bass spectrum: use unital RingCat; the separate NonunitalBass augmentation fibre supplies nonunital functoriality.
5. Canonical resolution: use T0=H0(V) and T1=H0(Z0(1)), and a conflation in VB, not coefficients MR(V) and MR(V(-1)).
6. Chart localization model: replace a Laurent-module quotient with the packet's K,V,Q bundles, torsion M and specified conflation K↣V↠M⊕Q.
7. Resolution fibres: parameterize by the torsion length-one object M, not a vector bundle V; the nerve is initially an unbased contractible space.
8. Directed lattices: retain the split minus-chart extension and prescribed quotient bundle, rather than a bare Laurent module.
9. Chart comparison: identify the torsion-category K-space with the minus-chart homotopy fibre, not with Laurent-ring K-theory.
10. Frobenius graph factorization: explicitly require the chosen map into the projective-injective object to be an inflation.
11. Frobenius cofinality: match the stated positive-group isomorphisms and pi0 injection, without introducing an unstated discrete-spectrum cofiber.
12. Nonunital maps between unital rings: use the right-module functor P↦P⊗_R eS, e=f(1), with target P(S), not a projective over its unitization.
13. Matrix corners: compare the two maps into K(R) after Morita, retaining n>0, instead of comparing maps with incompatible source and target.
14. Artin triangulated comparison: retain the odd-prime hypothesis.
15. Artin fibration: restrict to the two counterexample rings and use their connective stable-weak module model rather than the IK completion.
16. Artin K4 distinction: use the same connective Waldhausen models as the fibration; keep the conditional ArtinK3Calculations input.
17. Negative Frobenius groups: take K0 of the completed derived category of the iterated suspension, not of the pair itself.
18. Completion comparison: use the constructed completed Frobenius model and its loop-space equivalence, not an untyped idempotent completion of a pair.
19. Group and space names: use KGroup(E,n), KGroup.ofRing(R,n), KSpace.ofRing, NilCat.exactStructure and relativeK.ofPair consistently; the Nil forgetful target is right projectives P(Rop), compared with K(R) by the early opposite equivalence.
20. Unital continuity and Karoubi–Bass agreement sketches use RingCat; NonunitalBass and its continuity remain separate augmentation-fibre constructions.

The executable `NilCat.forget` retains its module-category codomain. A future `NilCat.forgetToProjectives` restricts that codomain using the finite/projective fields before a K-map is formed; this adapter is explicit and is not claimed to exist in the pinned libraries. Naming and sheaf-flasque separation tests remain mathematical/naming obligations, not artificial Lean propositions. Repeated test labels such as `degree_zero` and `zero_ring` have their original node scopes.

## Construction order and same-roadmap requests

Stable node IDs are retained while stage proposals await maintainer integration. Construct the early K.4 S machinery, import H.5's spectrum interfaces, then construct the K.7 S-grid, stabilization and pairing coherence. This prefix supplies K.3's projection formula and localization product boundary and K.6's multiplication-by-[t] splitting. It needs neither the Bass spectrum nor the later K.7 transfer/relative compatibility node. General K.3 cofinality is late, after K.4's fibration and nonfunctorial-factorization arguments. The positive free/projective comparison remains early through H.4.

The original early-K.3 proposal below includes transfers among the statements using only Q-theory. Assembly qualification: constructing the transfer from restriction and resolution has that order, but its bundled all-degree projection formula needs the early K.7 products. When applying the split, separate these proof phases or put the bundled node after the product prefix. The added dependency records this distinction without creating a new stage ID.

Three requests name this same roadmap:

- K.6 → K.3 (relative additive triples and the five-term index germ): supplied by `K.3/additive-functor-relative-K0`, `K.3/additive-functor-stable-boundary` and `K.3/additive-functor-five-term`. `K.6/karoubi-index-and-cone-boundary` already uses the precise five-term node. This is an internal interface, independent of U.6's ring-relative π₁ comparison.
- K.1–K.5 → K.6 (negative/nonconnective extensions): the relevant interfaces are `K.6/negative-k-groups`, `K.6/nonconnective-spectrum`, `K.6/schlichting-set-up-and-negative-localization`, `K.6/frobenius-spectrum-localization` and `K.7/nonunital-bass-fibre`. It is a late extension request; the early K.5 model does not acquire a reverse prerequisite on K.6.
- K.6–K.7 → K.5 (Artin K₃ computations): **unfulfilled**. K.5 does not provide the EF82/ALPS85 calculations. The counterexample retains its numerical input gap; no stage request has been misreported as a proved node.

Requests to SchemeKTheoryOperations S.2/S.5/S.6 are downstream ownership handoffs. They must not become reverse prerequisites of these ring-level nodes. All 40 original requests are reproduced below, including their exact supplier and consuming-node metadata.

## Remaining source gaps and next source actions

### The excision criteria are quoted, not proved

Part: `K.1`. Needed by: `GeneralAlgebraicKTheory:K.5`.

The criteria that excision in degree one is equivalent to the ring being idempotent, and that excision in degrees up to n is equivalent to the vanishing of the first n torsion groups over the unitisation, are quoted by the source from Suslin and from Suslin and Wodzicki without proof, and this packet quotes them the same way. The counterexample they yield, a square-zero ring, is therefore also conditional on them. NEXT SOURCE ACTION: read Suslin and Wodzicki, 'Excision in algebraic K-theory' (Annals 136, 1992), and Suslin's 1995 sequel, and decompose the proof of the criterion in degree one at least, which is the one the counterexample uses.

### The exact-versus-additive comparison still needs Keller’s derived criterion

Part: `K.6`. Needed by: `GeneralAlgebraicKTheory:K.6`.

Section10 and AppendixA have now been read. The existential Frobenius factorization, generic approximation/fibration and spectrum comparisons are decomposed in K.4/K.6. Section10’s finitely presented effaceable functors and the auxiliary exact category are understood, but its invocation of Keller96 §§11.7,12.1 for full faithfulness and its dual has not been independently read. This remaining exact-versus-additive comparison is not required for the spectrum-localization proof; the source’s conditional consequence from Conjecture9.7 must be treated historically rather than as a current vanishing theorem.

### The finite Artin K-three calculations underlying the read counterexample remain inputs

Part: `K.6`. Needed by: `GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample`.

Schlichting2002 §§0–2 were read and the stable-model, triangulated equivalence, fibration and p-primary K4 distinction are now separate nodes. His input K3(ℤ/p²) and K3(𝔽_p[ε]/ε²) calculations cite EF82 and ALPS85; neither calculation paper was independently read. The precise numerical contracts are listed in the application and requested from the relative ring K-theory owner K.5. Next source action: read the cited odd-prime K3 computations, not search again for a triangulated counterexample.

The general all-negative vanishing for arbitrary small abelian categories is a historical conjecture in the 2003 Schlichting source and has later counterexamples. Retain the stated noetherian vanishing theorem and the degree −1 theorem; do not turn the historical conditional argument into a current unconditional result.

## Cross-part prerequisites

All identifiers below have the `GeneralAlgebraicKTheory:` prefix. An arrow is from a supplier to its consumer. This table records node dependencies, not a reordered atlas stage graph.

| Supplier node | Consumer node |
| --- | --- |
| `K.7/products-from-biexact-functors` | `K.3/transfer-maps-and-projection-formula` |
| `K.7/biexact-stabilized-pairing` | `K.3/localization-product-boundary` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/negative-k-groups` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/projective-line-over-a-ring` |
| `K.2:plus/scalar-extension-and-functoriality` | `K.6/projective-line-over-a-ring` |
| `K.1/K-groups-of-exact-categories` | `K.6/projective-line-over-a-ring` |
| `K.3/additivity-for-exact-categories` | `K.6/projective-line-splitting` |
| `K.1/elementary-properties-of-K-groups` | `K.6/projective-line-splitting` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/projective-line-splitting` |
| `K.1/K-groups-of-exact-categories` | `K.6/nil-category-and-nil-groups` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/nil-category-and-nil-groups` |
| `K.4/approximation-theorem` | `K.6/t-torsion-localisation-sequences` |
| `K.4/fibration-theorem` | `K.6/t-torsion-localisation-sequences` |
| `K.3/resolution-theorem` | `K.6/t-torsion-localisation-sequences` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/t-torsion-localisation-sequences` |
| `K.3/additivity-for-exact-categories` | `K.6/nil-inclusion-is-forgetful` |
| `K.3/additivity-for-exact-categories` | `K.6/nil-groups-are-NK` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/nil-groups-are-NK` |
| `K.3/transfer-maps-and-projection-formula` | `K.6/fundamental-theorem-positive-degrees` |
| `K.3/additivity-for-exact-categories` | `K.6/fundamental-theorem-positive-degrees` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/fundamental-theorem-positive-degrees` |
| `K.2:plus/plus-equals-Q` | `K.6/multiplication-by-t-splits-the-boundary` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/negative-k-groups-are-contracted` |
| `K.5/milnor-square-mayer-vietoris` | `K.6/mayer-vietoris-for-negative-k` |
| `K.2:plus/plus-equals-Q` | `K.6/mayer-vietoris-for-negative-k` |
| `K.2/functorial-K-theory-of-a-ring` | `K.6/nonconnective-spectrum` |
| `K.4/delooping-and-the-spectrum` | `K.6/nonconnective-spectrum` |
| `K.5/excision-and-its-failure` | `K.6/milnor-square-excision-in-nonpositive-degrees` |
| `K.5/relative-K-theory` | `K.6/milnor-square-excision-in-nonpositive-degrees` |
| `K.5/nonunital-rings-and-unitisation` | `K.6/milnor-square-excision-in-nonpositive-degrees` |
| `K.5/milnor-square-mayer-vietoris` | `K.6/milnor-square-excision-in-nonpositive-degrees` |
| `K.5/ideal-degree-zero-excision` | `K.6/milnor-square-excision-in-nonpositive-degrees` |
| `K.1/K-groups-of-exact-categories` | `K.7/morita-invariance` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/morita-invariance` |
| `K.4/approximation-theorem` | `K.7/derived-morita-and-enhancements` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/invariance-under-filtered-colimits-and-products` |
| `K.1/elementary-properties-of-K-groups` | `K.7/invariance-under-filtered-colimits-and-products` |
| `K.5/nonunital-rings-and-unitisation` | `K.7/invariance-under-filtered-colimits-and-products` |
| `K.5/relative-K-theory` | `K.7/invariance-under-filtered-colimits-and-products` |
| `K.1/K-groups-of-exact-categories` | `K.7/products-from-biexact-functors` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/products-from-biexact-functors` |
| `K.4:construction/K-theory-space-of-a-waldhausen-category` | `K.7/products-from-biexact-functors` |
| `K.4:construction/iS-versus-Q` | `K.7/products-from-biexact-functors` |
| `K.4/delooping-and-the-spectrum` | `K.7/products-from-biexact-functors` |
| `K.3/transfer-maps-and-projection-formula` | `K.7/compatibility-with-relative-groups-and-transfers` |
| `K.5/relative-K-theory` | `K.7/compatibility-with-relative-groups-and-transfers` |
| `K.3/additivity-for-exact-categories` | `K.6/projective-line-regular-filtration` |
| `K.1/elementary-properties-of-K-groups` | `K.6/projective-line-regular-filtration` |
| `K.3/resolution-theorem` | `K.6/projective-line-localisation-models` |
| `K.2:plus/extension-cartesian-lifts` | `K.6/projective-line-localisation-models` |
| `K.2:plus/localised-extension-fibration` | `K.6/projective-line-localisation-comparison` |
| `K.3/additivity-for-exact-categories` | `K.6/projective-line-localisation-comparison` |
| `K.3/cofinality-degree-zero-correction` | `K.6/projective-line-localisation-comparison` |
| `K.4:construction/waldhausen-factorization` | `K.6/frobenius-pair-factorization` |
| `K.3/three-by-three-lemma` | `K.6/frobenius-replacement-category` |
| `K.4/approximation-with-factorizations` | `K.6/frobenius-derived-invariance` |
| `K.3/cofinality-with-factorizations` | `K.6/frobenius-model-cofinality` |
| `K.4/fibration-with-factorizations` | `K.6/frobenius-nested-weak-fibration` |
| `K.5/nonunital-rings-and-unitisation` | `K.7/nonunital-bass-fibre` |
| `K.5/relative-K-theory` | `K.7/nonunital-bass-fibre` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/nonunital-bass-fibre` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/nonunital-map-idempotent-extension` |
| `K.2/functorial-K-theory-of-a-ring` | `K.7/nonunital-filtered-continuity` |
| `K.4:construction/K-theory-space-of-a-waldhausen-category` | `K.7/biexact-S-grid` |
| `K.4:construction/S-construction` | `K.7/biexact-S-grid` |
| `K.4:construction/weak-double-nerve-swallow` | `K.7/biexact-stabilized-pairing` |
| `K.4/delooping-and-the-spectrum` | `K.7/biexact-stabilized-pairing` |
| `K.3/additive-functor-five-term` | `K.6/karoubi-index-and-cone-boundary` |
| `K.4/fibration-with-factorizations` | `K.7/stable-artin-k-fibration` |
| `K.3/devissage-theorem` | `K.7/stable-artin-k-fibration` |
| `K.4/approximation-theorem` | `K.6/karoubi-complex-approximation` |
| `K.4/fibration-theorem` | `K.6/karoubi-complex-approximation` |
| `K.3/cofinality-degree-zero-correction` | `K.6/karoubi-complex-approximation` |

## Collected owner requests

### From part K.1

1. Supplier: `StableHomotopyKTheory:H.4`. Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument, including the Cofinality Theorem for a cofinal monoidal functor with the same automorphism groups (Weibel IV.4.11(b)), which K.2:plus/cofinality-of-projective-modules now uses instead of the late exact-category cofinality. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.

2. Supplier: `StableHomotopyKTheory:H.1`. The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors with the maximal-tree presentation of π₁, the fact that a natural transformation gives a homotopy (so adjoints are homotopy equivalences and categories with an initial object are contractible), and the commutation of classifying spaces with filtered colimits. The nodes cite the integrated H.1 nodes coverings-fundamental-group-local-coefficients, natural-transformations-adjoints-contractibility and filtered-colimits-of-categories by id.

3. Supplier: `StableHomotopyKTheory:H.5:S-delooping`. Assemble the connective Ω-spectrum from the iterated S-construction and the natural deloopings |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| supplied by K.4:construction (K.4/delooping-and-the-spectrum), with its indexing π_i = K_i for i ≥ 0. Spectrum assembly consumes that prefix; it is not a prerequisite of additivity or of the relative S-fibration. Generic smash products belong to H.5:spectra, and the K-theory-specific biexact pairings and their coherence to K.7, so the pairing clause of the integrated H.5:S-delooping node should move to K.7.

4. Supplier: `KTheoryLowDegrees:U.6`. The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it. U.6 also owns the comparison of π₀ and π₁ of K.5's relative fibre for a pair with K₀(I) and K₁(A, I) (U.6/relative-K1-homotopy-comparison); K.5 does not assert it, and U.6 should cite this packet's node GeneralAlgebraicKTheory:K.5/relative-K-theory rather than the integrated decomposition id.

5. Supplier: `KTheoryLowDegrees:Z.1`. Finitely generated projective modules as summands of finite free modules, with complements, scalar extension along arbitrary (noncommutative) unital ring maps and the ring Grothendieck group, and Milnor patching with the K₀ end of the Mayer–Vietoris sequence. These are planned in the KTheoryLowDegrees--U.1 packet and cited here by node id: Z.1/extend-scalars and Z.1/extend-scalars-finite-projective (K.2:plus scalar extension), Z.1/projective-karoubi, Z.1/ring-k0-exact and Z.1/ring-k0-map (the ring model), and Z.1/milnor-finite-projective, Z.1/milnor-boundary, Z.1/milnor-boundary-kernel, Z.1/milnor-exact-at-k0 and Z.1/milnor-exact-at-pair (K.5's Mayer–Vietoris node). The one missing position of Milnor's sequence, exactness at K₁(S) × K₁(T), is planned in K.5 because KTheoryLowDegrees U.5, its natural owner, lies downstream of K.5 (through SchemeKTheoryOperations S.3).

6. Supplier: `K2SymbolsBrauer:T.1:plus`. The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.

7. Supplier: `K2SymbolsBrauer:T.2:symbols`. Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.

8. Supplier: `K3BlochGroups:V.4`. Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.

9. Supplier: `GeneralAlgebraicKTheory:K.6`. The nonconnective spectrum and negative groups extend K.5 relative exact-functor fibres and central ring localisation when new projectives cause a degree-zero cokernel. K.4’s same-object change-of-weak-equivalences theorem has a surjective K₀ map and needs no such correction. General cofinality and nonunital adapters still use K.6 as separately stated.

10. Supplier: `StableHomotopyKTheory:H.2`. RT-AREA-ktheory-1/15. The realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, stated and proved in a model the relative S.-construction satisfies: for maps V. → W. → X. of simplicial spaces with compatible basepoints such that each Vₙ → Wₙ → Xₙ is a homotopy fibration sequence (Vₙ → hofib(Wₙ → Xₙ) over the basepoint is a weak equivalence), every Xₙ is connected, and the simplicial spaces are good (degeneracies closed cofibrations, automatic for realisations of multisimplicial sets), the sequence |V.| → |W.| → |X.| is a homotopy fibration sequence, the fibre identification being the canonical map into the homotopy fibre over the realised basepoint, so Ω|X.| → |V.| → |W.| → |X.| is one with the canonical connecting map. Either standard form may be adopted: Waldhausen 1978 (Algebraic K-theory of generalized free products, Lemma 5.2, as quoted in Weibel V.1.7) or Bousfield–Friedlander 1978 (Theorem B.4, for bisimplicial sets, with the π∗-Kan condition and the π₀ fibration condition, both implied when every Xₙ and Wₙ is connected); the locators are the red team's and verifier's and were not re-read here. This is neither the diagonal lemma nor the levelwise-equivalence theorem H.2 already plans, and it must not be stated for arbitrary levelwise fibrations without the connectivity (or π∗-Kan) hypothesis. Consumer: K.4/delooping-and-the-spectrum, which verifies the hypotheses for n ↦ (|wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|).

11. Supplier: `StableHomotopyKTheory:H.4`. Consumers K.2:plus/localised-extension-fibre-equivalence, extension-cartesian-lifts and extension-category-contractibility need the generic monoidal action-localisation results of Weibel IV.4.7.1 and Exercises 4.6–4.7, 4.11: a faithful compatible action with injective automorphism translations gives the homotopy fibration S⁻¹S→S⁻¹E→⟨S,E⟩; a cartesian action localises a fibred functor with localised fibres; if translations already induce realisation equivalences then E→S⁻¹E is a realisation equivalence. H.4 also supplies a homotopy inverse for connected homotopy-associative CW H-spaces. These are generic supplier obligations; the new nodes verify the specific extension-category constructions and do not purport to close H.4.

12. Supplier: `StableHomotopyKTheory:H.2`. Consumer K.4:construction/object-S-additivity needs Waldhausen’s simplicial Theorem-B form (K-spaces Lemma 1.4.B, printed p.337): for f:X→Y, if every order-map pullback between simplex fibres Δ[n]×_Y X is a realisation equivalence, each such pullback square is homotopy cartesian. Obtain this by categorical Theorem B on the category of simplices, its comma-fibre identification, and the natural equivalence from the simplex-category nerve to realisation. This is a generic translation of the existing H.2 Theorem B, not a second K-theory owner.

13. Supplier: `StableHomotopyKTheory:H.2`. K.4/fibration-theorem and K.4:construction/iS-versus-Q need the generic swallowing lemma for double nerves (Waldhausen1.6.5, printed p.352/PDF35): for A⊂B, the double category of A-vertical and B-horizontal squares realises equivalently to B, proved by first-object evaluation and the string natural transformation. The S-Q comparison also needs the generic edgewise realisation homeomorphism for d[n]=[n]^op*[n], d[n]=[2n+1]. These are general simplicial/categorical results; K.4 owns only the specific triangular Q-span diagram.

14. Supplier: `StableHomotopyKTheory:H.2`. K.4/approximation-comma-contractibility and K.4/iterated-mapping-cylinder need the last-vertex map |N simp(X)|→|X| and its realisation equivalence, the left-adjoint retraction to nondegenerate simplex posets for nonsingular X, representation of homotopy classes by finite subdivided sphere maps into a simplicial realisation, and CW Whitehead for weakly contractible classifying spaces (Waldhausen proof1.6.7, printed pp.355,359/PDF38,42). These are generic homotopy supplier results, independent of K-theory. The finite sphere and connectedness hypotheses must be retained.

15. Supplier: `StableHomotopyKTheory:H.1`. For a nonempty small category, if every functor from a finite poset contracts by natural-transformation zigzags, its nerve realization is contractible. Use finite two-point posets for connectedness and finite subdivisions of sphere maps for higher groups; do not apply the hypothesis to an infinite discrete component set. Also provide TheoremA for the weak-equivalence comma categories.

   Needed by: `GeneralAlgebraicKTheory:K.4/approximation-factorization-comma`, `GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations`.

16. Supplier: `StableHomotopyKTheory:H.1`. For an abelian discrete group G, the realization of its bar nerve BG has loop space equivalent to G_discrete, with the loop class map equal to the bar generator. The finite class-weak filtration proof imports this elementary space result; spectrum assembly belongs to H.5 later.

   Needed by: `GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations`.

17. Supplier: `StableHomotopyKTheory:H.1`. Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction.

   Needed by: `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`.

18. Supplier: `StableHomotopyKTheory:H.2`. Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction.

   Needed by: `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`.

19. Supplier: `StableHomotopyKTheory:H.5:spectra`. A homotopy-fibre sequence of right E-module spectra retains its module boundary. Specify the suspension orientation: right multiplication has no sign, moving a degree-i left coefficient across a degree−1 boundary contributes(−1)^i. K3/localization-product-boundary applies this generic fact to exact-category localisation; early ring products alone do not prove it.

   Needed by: `GeneralAlgebraicKTheory:K.3/localization-product-boundary`.

20. Supplier: `KTheoryLowDegrees:U.1`. Early classical projective K0 and stable-matrix elementary/Whitehead calculus, used by K.2:plus/zero-one-ring-comparison. These are imported constructions, not owned anew here.

21. Supplier: `KTheoryLowDegrees:U.2`. Classical ring K1=GL/E and its stabilized automorphism class with scalar-extension naturality, for K.2:plus/zero-one-ring-comparison. The relative U.6 comparison is not a prerequisite.

22. Supplier: `StableHomotopyKTheory:H.3`. The based plus fundamental-group quotient π1(X+) = π1(X)/P and its map-level naturality, with P perfect normal, for the absolute degree0/1 ring comparison. No rational Hurewicz theorem is requested here; that belongs to H.6.

### From part K.6

1. Supplier: `SchemeKTheoryOperations:S.5`. An ownership handoff, not an input: no node of this packet depends on S.5, and no edge S.5 → K.6 may be added, since K.6 precedes S.2 to S.5 in the atlas and the edge would close a cycle. S.5 owns the scheme forms and imports the ring theorems of K.6. (1) Thomason's projective line and projective bundle theorems for quasi-compact quasi-separated schemes, compared for X = Spec R with K.6/projective-line-over-a-ring and K.6/projective-line-splitting (the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R only for commutative R). (2) The Fundamental Theorem for schemes (K-book V.8.3, Thomason–Trobaugh 6.6(b)), compared on affine schemes with K.6/fundamental-theorem-with-nil-terms and K.6/nil-groups-are-NK. (3) The scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17: for a quasi-compact quasi-separated scheme X, IK_i(X) ≅ Thomason's K^B_i(X) for i ≤ 0 (Schlichting, Theorem 7.1, proved there from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b)), keeping the qcqs hypotheses and giving, for X = Spec R, the explicit comparison with the ring clause of K.6/agreement-and-vanishing-of-negative-K and with K.6/bass-spectrum-homotopy-groups.

2. Supplier: `SchemeKTheoryOperations:S.2`. An ownership handoff, not an input: the second scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17. For a noetherian scheme X, negative G-theory vanishes: IK_n(Coh(X)) = 0 for n < 0, as the instance for the small noetherian abelian category Coh(X) of the theorem K.6/agreement-and-vanishing-of-negative-K proves for noetherian abelian categories, with an explicit comparison of S.2's nonconnective G-theory with IK of Coh(X). No node of this packet depends on S.2.

3. Supplier: `SchemeKTheoryOperations:S.6`. An ownership handoff, not an input: external products for schemes, supports and relative theories, and the graded commutativity of the total K-group of a scheme, are S.6's and extend K.7/products-from-biexact-functors and K.7/graded-commutativity, which S.6 imports. AUDIT-28 records this as a duplication with K.7; the ring-level pairing is developed here. The former prerequisite of K.7/graded-commutativity on S.6 was the reverse of the stage order (S.6 requires K.7) and is removed.

4. Supplier: `StableHomotopyKTheory:H.5:spectra`. The generic spectrum toolkit K.6 and K.7 build on: homotopy pushouts and cofibres, loops and desuspensions, homotopy colimits of sequences, connective covers, homotopy fibres with their long exact sequences, stable homotopy groups indexed by all integers, and the smash product of spectra with its associativity, unit and symmetry and the sign of the twist on S^p ∧ S^q. K.7/products-from-biexact-functors builds the K-theoretic pairing K(A) ∧ K(B) → K(C) on this smash product and is its only owner; H.5:spectra is asked for the generic smash product only.

   Needed by: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`.

5. Supplier: `StableHomotopyKTheory:H.5:S-delooping`. The connective K-theory spectrum of a small Waldhausen category, and of an exact category, assembled from the iterated S-construction and the deloopings of K.4:construction (K.4/delooping-and-the-spectrum), functorial in exact functors and natural transformations; applied to the early ring model of K.2:plus it is the functorial model of connective K-theory of rings that the Bass delooping takes as input. No product structure is asked of spectrum assembly: the pairing is K.7's (RT-AREA-ktheory-1/4). This request replaces the earlier request to GeneralAlgebraicKTheory:K.3, which does not construct Waldhausen spectra.

   Needed by: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`.

6. Supplier: `StableHomotopyKTheory:H.3`. The absolute degree-one comparison K.6 uses, from H.3's plus construction: for a connected space X and a perfect normal subgroup P of π_1X, π_1(X⁺_P) = π_1(X)/P, natural for maps carrying the selected perfect subgroup into the selected one; applied to X = BGL(R) and P = E(R) (perfect, by the Whitehead lemma of KTheoryLowDegrees U.1), this gives π_1 BGL(R)⁺ ≅ GL(R)/E(R) = K_1(R) (KTheoryLowDegrees U.2's classical K_1), natural in unital ring maps, and compatible with matrix loops: the loop in BGL(R) given by g ∈ GL_n(R) goes to the class of g in GL(R)/E(R). With the plus = Q comparison (K.2:plus/plus-equals-Q) this identifies the classical K_1 with the first homotopy group of the K-theory space, which K.6 uses for the class [t] of the unit t ∈ ℤ[t,t⁻¹] and for applying the contraction to the classical K_1–K_0 Mayer–Vietoris sequence. K.6 cites H.3 rather than K.2:low-degree-comparisons/explicit-low-degree-models or KTheoryLowDegrees U.6, which lie downstream of K.6 in the assembled atlas.

   Needed by: `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`.

7. Supplier: `KTheoryLowDegrees:U.6`. An ownership handoff, not an input: the spectrum form of the degree-one clause of Bass's excision for a Milnor square (f : R → S carrying a two-sided ideal I bijectively onto an ideal J). U.6 proves that π_1 𝕂(R, I) → π_1 𝕂(S, J) is onto, equivalently that the birelative term of relative nonconnective K-theory is concentrated in degrees ≥ 1 (the 'even ≥ 1' of Clausen–Mathew–Morrow, Proposition 4.34), from its identification of π_1 of the relative fibre of GeneralAlgebraicKTheory:K.5/relative-K-theory with GL(I)/E(R, I) (U.6/relative-K1-homotopy-comparison), the classical surjectivity K_1(R, I) → K_1(S, J) (the exactness at K_1(S) ⊕ K_1(R/I) of GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris), and the agreement of connective and nonconnective relative theory in degrees ≥ 0 (K.6/bass-spectrum-homotopy-groups). K.6 proves the isomorphisms in degrees ≤ 0 (K.6/milnor-square-excision-in-nonpositive-degrees) and records only the classical degree-one surjectivity; no node of this packet depends on the spectrum form, because U.6 lies downstream of K.6 in the assembled atlas. The early K5/ideal-degree-zero-excision now supplies relative π0 with its actual boundary and patched-module comparison. For CMM4.34, compare absolute K→KB in all degrees≥0 and then take two fibres; use henselian K0-isomorphism and K1-surjectivity for connective relative1-connectivity. Do not infer relative π0 from negative absolute MV. The extra nonconnective birelative1-connectivity needs the positive relativeπ1 surjection after U6’s comparison;0-connectivity suffices for the cartesian square.

8. Supplier: `K2SymbolsBrauer:T.6`. The first and second K-groups with their symbols. K.7's degree-one unit test needs the class of a unit in the first K-group and the anticommutativity of the symbol; neither pinned library has the first K-group at all, and T.6 is where the symbols are owned.

9. Supplier: `StableHomotopyKTheory:H.1`. The Segal subdivision of a small category has naturally homotopy-equivalent nerve realization, and a nonempty filtered poset has contractible nerve. Needed in the resolution-fibre and directed-lattice comma models.

   Needed by: `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`, `GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices`.

10. Supplier: `StableHomotopyKTheory:H.4`. Monoidal localization of an acted-on category preserves an equivariant nerve equivalence and is itself a nerve equivalence when every action acts invertibly on the nerve. For the split exact chart category P, a cofinal monoidal functor isoVB→isoP gives contractibility of the localized extension category and base-change fibre comparisons. Retain the actual action and cofinality hypotheses, not an arbitrary nonsplit direct-sum group-completion claim.

   Needed by: `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`, `GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison`.

11. Supplier: `StableHomotopyKTheory:H.1`. Verdier localization/common-roof calculus for a triangulated stable category and a triangulated subcategory: derived full faithfulness/essential surjectivity produce the common roof diagram11.16, with stable commutativity witnessed by maps through projective-injectives. This is the categorical input to the explicit Frobenius strictification, not an assertion that every Frobenius category has a functorial cylinder.

   Needed by: `GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification`.

12. Supplier: `StableHomotopyKTheory:H.2`. Objectwise natural weak equivalences of exact functors induce natural transformations on each wS_n category; the nerve homotopies realize to the same homotopy of K-spaces. Preserve the good realization assumptions used in K.4.

   Needed by: `GeneralAlgebraicKTheory:K.6/frobenius-replacement-category`.

13. Supplier: `StableHomotopyKTheory:H.5:spectra`. Filtered homotopy colimits of spectra commute with finite homotopy limits, specifically fib(X_i→Y_i), and a constant spectrum has itself as hocolim over a nonempty filtered index. These map-level comparisons are needed for nonunital unitization fibres; group-level unital continuity alone does not provide them.

   Needed by: `GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity`.

14. Supplier: `StableHomotopyKTheory:H.1`. A natural isomorphism of exact multifunctors gives a natural transformation of their weak-map S-grid categories and a nerve homotopy, compatible with the pentagon/triangle/symmetry diagrams.

   Needed by: `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`.

15. Supplier: `StableHomotopyKTheory:H.5:spectra`. Assemble compatible multilinear pairings on iterated deloopings into smash pairings of spectra; preserve natural associativity/unit/symmetry diagrams and the degree(−1)^{ij} of the sphere twist. A commutative/E∞ ring-spectrum claim additionally needs the full coherent multilinear recognition theorem. The K-theoretic grids are owned by early K.7:products.

   Needed by: `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`, `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`.

16. Supplier: `GeneralAlgebraicKTheory:K.3`. The classical additive-functor relative K0 triple group and natural K1^cl(C)→K1^cl(D)→K0(T)→K0(C)→K0(D) for cofinal additive T, with explicit stable boundary and its exactness, as in Karoubi1970 Theorem2.1 and KbookII2.10/Ex2.17. This is the index germ used by the filtered cone comparison; it is independent of the later U.6 ring-relative K1 homotopy comparison.

   Needed by: `GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary`.

17. Supplier: `GeneralAlgebraicKTheory:K.5`. Finite Artin input for the triangulated counterexample: for oddp, K3(ℤ/p²)=C_(p²)⊕C_(p²−1) andK3(𝔽_p[ε]/ε²)=C_p²⊕C_(p²−1), with the relative-to-finite-field interpretation. Schlichting2002 §1.6 cites EF82/ALPS85. The counterexample proof is read; these calculations are not independently supplied by this packet.

   Needed by: `GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample`.

18. Supplier: `KTheoryFiniteLocalFields:L.1`. For the stable Artin counterexample, K3(Fp) is cyclic of order p²−1 and K4(Fp)=0; this is the single-owner higher finite-field calculation, including agreement with the exact ring K model.

   Needed by: `GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration`.


## Collected stage and boundary proposals

These are the 12 existing packet proposals. The assembly does not apply them to atlas data, create new stage IDs or change their review status.

### From part K.1

#### 1. K.2:low-degree-comparisons owns nothing and its stage text should say so

Kind: `note-duplicate-boundary`.

Every target this layer lists is owned by another roadmap, and AUDIT-28 names all four owners. The layer's real content is the combination: that the plus comparison of K.2:plus turns those three identifications into statements about the K-groups defined here, and that one of the four, Matsumoto's presentation, is field-specific while the others are not. The stage text should be narrowed to that, with the four owners named in it, so that a reader is not led to plan the identifications here. Nothing is dropped: the layer keeps two nodes and four requests.

#### 2. The localisation theorems of K.3 and K.4 are different theorems and should stay apart

Kind: `note-hypothesis-boundary`.

K.3's stage text warns against asserting localisation for arbitrary exact subcategories. This packet honours that by keeping Quillen's theorem, which is for a Serre subcategory of an abelian category, in K.3, and the Waldhausen theorem, which needs a cylinder functor with the cylinder axiom and saturation and extension for the larger class, in K.4. The two stage texts should each point at the other, because a reader who finds only one of them will be tempted to use it outside its hypotheses; that is exactly the error the K.3 text names.

#### 3. RT-AREA-ktheory-1/4: Waldhausen additivity and the relative S-fibration belong to K.4:construction

Kind: `propose-reorder`.

The atlas orders K.4:construction → H.5:S-delooping → K.4 but put Waldhausen additivity and the relative S-fibration in late K.4, although H.5:S-delooping's Ω-spectrum needs the deloopings they prove; K.4 also claimed 'the delooping theorem' that H.5:S-delooping proves, and the biexact K-pairing was planned both in H.5:S-delooping and in K.7. This packet now parents K.4/waldhausen-additivity and K.4/delooping-and-the-spectrum to K.4:construction and gives them the realisation input they need from H.2. The comparison with Q needs neither additivity nor the delooping, and the verifier's narrowing keeps late only the comparison results that need them, so the packet keeps K.4:construction/iS-versus-Q in the early part although the stage text lists the comparison among the late theorems.

action: "rescope"

roadmaps: ["GeneralAlgebraicKTheory", "StableHomotopyKTheory", "EnhancedDerivedSheaves"]

#### 4. RT-AREA-ktheory-1/20: early K.3 and a late K.3:cofinality

Kind: `propose-split`.

K.3 required all of K.4 although only its cofinality theorem uses Waldhausen theory, so every consumer of Quillen's 1973 theorems (K2SymbolsBrauer T.3:localization-comparison and T.5, ArithmeticKTheory N.2, SchemeKTheoryOperations S.3, KTheoryFiniteLocalFields L.1) inherited K.4, H.5 and the enhanced-category stages. In this packet early K.3 (the 3×3 lemma, the exact category of conflations, additivity, resolution with transfers and the degree-zero comparison with Tau Ceti's resolutionEquiv, dévissage and Serre-subcategory localisation) cites only K.1, StableHomotopyKTheory H.1 and H.2 and the pinned exact-category API; the general cofinality theorem needs the late fibration theorem and the S-versus-Q comparison.

action: "split"

roadmaps: ["GeneralAlgebraicKTheory"]

#### 5. RT-AREA-ktheory-1/19 and 18: the early ring model and Milnor squares feed K.5

Kind: `propose-edges`.

The ring model is one node, K.2/functorial-K-theory-of-a-ring, in K.2:plus, and K.5, K.6 and K.7 import it; K.2:plus no longer depends on the late exact-category cofinality, since its cofinality node uses group-completion cofinality from StableHomotopyKTheory H.4. K.5's Milnor-square nodes import KTheoryLowDegrees Z.1 (patching, boundary, K₀ exactness), U.1 and U.2 (elementary lifting and classical K₁), all upstream of K.5. They cannot import U.5 or U.6: U.5 cites SchemeKTheoryOperations S.3, which follows S.2 and K.6, and U.6 imports K.5's relative fibre, so either import would close a cycle.

action: "rescope"

roadmaps: ["GeneralAlgebraicKTheory", "KTheoryLowDegrees", "StableHomotopyKTheory"]

#### 6. Late cofinality includes the non-functorial class-weak proof

Kind: `rescope`.

The three new K.3 Grothendieck-class/cofinality nodes use K.4’s factorization fibration and cannot belong before it.

action: "rescope"

roadmaps: ["GeneralAlgebraicKTheory"]

#### 7. Early product pairing before localization consumers

Kind: `split`.

Create K.7:products requiring K.4:construction and H.5:spectra only for the generic smash/suspension interface. Move the four K.7 product-construction nodes in the K.6 packet there with ids unchanged. Generic module-fibre boundary signs are H.5 inputs, independent of K-theory localization. K.3/localization-product-boundary imports this early product component; neither product S-grid construction nor its stabilization imports K.3 localization. Keep later Morita/derived and scheme operations downstream.

action: "split"

roadmaps: ["GeneralAlgebraicKTheory"]

#### 8. Absolute degree0/1 adapter precedes the low-degree comparison aggregator

Kind: `propose-edges`.

K.2:plus/zero-one-ring-comparison imports classical K0 and GL/E from U.1/U.2 and the early plus/Q theorem. K.5/relative-triples-to-components imports this adapter. K.3 classical additive triples and its Q automorphism-boundary calculation do not require K.2:low-degree-comparisons, whose K2 and relative U.6 clauses remain late. Add U.1,U.2,H.3 → K.2:plus. No dependency from K.3 or K.5 to that late aggregator is introduced.

### From part K.6

#### 1. The two duplications AUDIT-28 records are boundaries, not overlaps to remove

Kind: `note-duplicate-boundary`.

AUDIT-28 records SchemeKTheoryOperations S.5 as duplicating K.6's fundamental theorem and S.6 as duplicating K.7's external products. Read against the source these are not duplications but the ring and scheme forms of the same theorem, and the source states them separately for exactly that reason: V.8.2 for rings and V.8.3 for quasi-projective schemes. The resolution is that the ring form, with its ring-level inputs (the projective line over an associative ring, the Nil groups, the localisation at t), is proved in this roadmap, and the scheme roadmap imports it for its scheme forms: S.5 and S.6 come after K.6 and K.7 in the atlas, so no node here may cite them (RT-AREA-ktheory-1/17 found the former prerequisite S.5 → K.6 closing a cycle). The scheme clauses of Schlichting's agreement theorem are likewise S.5's and S.2's. The stage texts of K.6, S.2, S.5 and S.6 should each say so in a sentence. No layer should be dropped on this account.

#### 2. K.6 carries two independent developments and could be split

Kind: `propose-split`.

K.6's stage text asks both for Bass's negative groups, which need only the zeroth and first K-groups and no homotopy theory, and for the Fundamental Theorem in every degree and the nonconnective spectrum, which need connective K-theory spaces, spectra, homotopy colimits and connective covers, none of which exists in either pinned library. The first part is formalisable against the pins today; the second is blocked on a library of spectra. As one layer it cannot be closed until the homotopy theory arrives, and a reader cannot see that the algebraic part is independently available. Splitting into a negative-K-groups layer and a nonconnective layer would make that visible. Along that line the Bass-side nodes divide as follows: flasque rings, contracted functors, the negative groups, the axioms and the Mayer–Vietoris continuation go to the first layer (their degree-zero and degree-one inputs being the classical K_0 and K_1); the projective line over a ring and its splitting, the Nil groups, the localisation sequences at t, Nil_n ≅ NK_{n+1}, the Fundamental Theorem in positive degrees and its splitting, the contractedness of the K-groups, the Bass spectrum and its homotopy groups, the spectrum form of Milnor-square excision and the vanishing theorem go to the second.

#### 3. The name 'flasque' is taken in both pinned libraries by a different notion

Kind: `note-naming-collision`.

Both trees have IsFlasque for the sheaf-theoretic predicate, and K.6 needs Karoubi's flasque rings, which are unrelated. The packet records the collision in the node, in its unit tests and here, because a formalisation that reused the name would produce a statement that reads as true and means something else. A name such as IsFlasqueRing, or Karoubi's own terminology of an infinite sum ring where that stronger notion suffices, should be fixed before any of this layer is written.

#### 4. K.7's product construction is needed before K.6

Kind: `propose-split`.

The Bass delooping (K-book IV.10) and the splitting of the Fundamental Theorem in positive degrees (V.8.2, Ex. V.8.1) use the external product with the class [t] ∈ K_1(ℤ[t,t⁻¹]), and K.7/products-from-biexact-functors is the only owner of that pairing (RT-AREA-ktheory-1/4). The pairing needs only K.1, K.2:plus, K.4:construction, StableHomotopyKTheory H.5:spectra and H.5:S-delooping, all upstream of K.6, but the atlas orders K.6 → K.7. Proposal: an early stage K.7:products holding K.7/products-from-biexact-functors (its parent), with edges K.2:plus, K.4:construction, H.5:spectra, H.5:S-delooping → K.7:products → K.6, and the rest of K.7 after K.6 as now. Until that stage exists the node keeps its parent K.7, and K.6/nonconnective-spectrum and K.6/multiplication-by-t-splits-the-boundary cite it directly; the node graph is acyclic, because the pairing node depends on no node of K.6.

## Where to resume

Independent review should check the unified conventions, the added transfer dependency and the signature corrections above, then evaluate the latest revised part mathematics under its existing review workflow. The three source actions remain with their consuming owners. A pinned Tau Ceti build with the required imports is needed before the full suggestion can be elaborated; the explicit future-interface comments will still require their suppliers. The maintainer can apply the collected stage proposals after review. No second worker job was claimed in this run.

Summary: assembled the complete reader and suggested file from both parts; made the projection-formula dependency explicit; preserved all node contracts, source gaps and review history; collected every request and proposal. Packet validation and structural audits pass. Full Lean elaboration is blocked at the missing Tau Ceti import object file.
