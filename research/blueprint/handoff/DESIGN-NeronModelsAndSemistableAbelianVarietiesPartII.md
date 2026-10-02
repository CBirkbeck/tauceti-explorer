# Global Scheme conductor checkpoint — Codex codex-5ebb6f

Refs #3378. Claim 5953575647 confirmed by bot 5953579428; full issue reread. Continues merged PR #5762. Partial design; all seven stages and the reserved Ferrand key remain open.

Nine new targets give the annihilator comparison, finite flat/localization adapters, native conductor ideal-sheaf datum, quotient charts, canonical induced map, geometric/categorical squares and flat recomputation. The source’s reduced Noetherian finite-surjective case is a corollary of the explicitly derived finite schematically dominant statement. The generic finite-module annihilator theorem is requested at SF.0.

Totals: 137 nodes, 51 API items, 48 planned tests, 28 planets, 72 baseline declarations, 16 gaps and 20 requests. All 128 inherited IDs, 78 routes, 21 source findings and prior F₂ certificates remain. All 76 upstream imports are ordinary prerequisites; the obsolete encoding gap is removed.

Fresh reading: Ferrand pp553–557,565–569; Witaszek pp674–675, including visual inspection; complete Stacks 07T8/0BBY/0E25 displayed proofs; 34 pinned native declarations. Prior receipts retain their attribution.

Validation: indexed checker zero errors/warnings; reader/native parity, preservation, source hashes, intake and whitespace checks; actual read-only atlas integration with no own pending/skipped links; acyclic own and combined graphs; 859 finite assertions across 55 unital subrings, including localization, flat nilpotents and a nonflat cusp obstruction.

Lean NOT COMPILED: no existing build at both pins; no project/cache/build/server created. Resume with exact SF.0 annihilator/affine exports and native elaboration/gluing, then SF.1/SF.3 space types, proper nonsplit-node and remaining model/completeness/source gaps.

---

## Previous checkpoints — historical receipts, superseded current totals

# Native Scheme interface checkpoint — ChatGPT gpt-6astra-20261002-c4d9

Refs #3378. Model: GPT-6 Astra Pro. Claim comment 5952727571 was accepted by bot comment 5952731307. Continuation of merged PR #5752 on branch `gpt-6astra-20261002-c4d9-neron-ii`. Signature commit: `7c5ae7e317bd1325158b981f50b19eb4a1eccdf7`.

**Partial design checkpoint, not implementation or stage closure.** Only the suggested Lean file and this handoff change. The roadmap definition, packet and definitive reader are unchanged: all 128 nodes, existing API/test contracts, source findings, routes, requests and dependency edges are preserved. No baseline theorem is newly marked implemented, and no packet gap is closed.

## Delivered

The existing Ferrand key now has native Scheme forms for five API contracts: `GeometricPushout.lift` includes both finite Ferrand pinching and the complete Witaszek alternative; `GeometricPushout.flat_baseChange` specifies all comparison maps and actual cartesian squares; `GeometricPushout.witaszek_iff` uses the actual section-ring pullback on every open; `FerrandPushout.complementIso` identifies actual open subschemes by the unique isomorphism over the pinching map; and `FerrandPushout.conductor` supplies the actual affine Spec/quotient square.

The full `GeometricPushout.topological_not_geometric` test now constructs the four schemes and maps. It asserts the topological pushout and universal-homeomorphism properties, but denies the geometric square. The old monomial nonmembership calculation is retained as its witness, rather than being mistaken for the entire test. The omission ledger distinguishes these delivered Scheme signatures from the still-missing algebraic-space and global-conductor forms. All previous affine reconstruction, polynomial and F₂ declarations remain unchanged.

Universal homeomorphism is expressed by the native conjunction `UniversallyInjective`, `UniversallyClosed`, `Surjective`: these properties persist under base change and give a closed bijection there. No second universal-homeomorphism carrier, opaque geometric predicate, or arbitrary proposition parameter is introduced. Representability is automatic only because these signatures use Scheme. The Witaszek alternative retains qcqs for i and both universal-homeomorphisms, without incorrectly assuming finiteness. The general finite Ferrand alternative is not restricted to radicial g.

## Mathematical check of the negative example

Write B=k[t], S=k[t²,t⁵], C=B/(t²), and use C←B and C←k. The map S→k is evaluation at zero. The square commutes because every positive-degree monomial of S dies in C. B is finite over S since t satisfies the monic equation X²−t². Off V(t²), the element t equals t⁵/(t²)², so the inclusion becomes an isomorphism. Over V(t²) there is just the origin, with residue field k; the same description holds geometrically. Thus Spec B→Spec S is a universal homeomorphism. Spec C→Spec k is also one, and the commutative square is a pushout of topological spaces. However B×C k identifies with k+t²k[t]. It contains the compatible pair (t³,0), while t³ is not in S: 3 is not in the semigroup generated by 2 and 5. Consequently the square fails the global-section pullback, hence fails the geometric condition. This argument works over every field, including characteristic two.

An independent finite illustration over F₂[t]/(t⁸) checked the subring generated by t²,t⁵, all its sums/products, and every compatible pair modulo t². Its monomial basis has exponents 0,2,4,5,6,7; the subring has 64 elements, the pullback has 128, and (t³,0) is missing from the injective comparison. This is a finite check of the obstruction, not a proof of the Scheme theorem or a surface-model certificate.

## Fresh reading and verification scope

Read the displayed primary-source statements and proofs for Witaszek, *Keel's base point free theorem and quotients in mixed characteristic*, published Annals 195 (2022), Definition 2.17, Remark 2.19, Lemmas 2.23 and 2.25, and Definition 2.27 (https://par.nsf.gov/servlets/purl/10429755). Read the relevant Temkin–Tyomkin arXiv:1305.6014v3 portions, in particular Lemma 3.2.4, the complement assertion of Theorem 4.4.2, and Theorem 6.3.2 with its proof (https://arxiv.org/pdf/1305.6014v3). Flatness preserves the kernel sequence; no arbitrary nonflat compatibility or flatness of the normalization map is inferred. The conductor application retains reduced/Noetherian/finite hypotheses but not birationality. These are selected text readings, not a fresh full-paper audit. PDF screenshot requests failed; no visual inspection or newly computed PDF hash is claimed. Inherited paper-reading receipts below remain attributed to their original workers.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read the native definitions and relevant surrounding declarations in `AlgebraicGeometry/Morphisms/Flat.lean`, `OpenImmersion.lean`, `QuasiSeparated.lean`, `UniversallyClosed.lean`, and `UniversallyInjective.lean`. The four added explicit imports use those existing scheme predicates. This is a selected signature check, not a complete fresh read of every inherited baseline entry. Upstream orientation: AdicSpaces and Multiquadratic README documents were read in full; selected EllipticCurves and StableReduction material was used for the ownership boundary. The reviewed R11.1–R11.6 entries and Néron boundary discussion in RT-AUDIT-10 were consulted. The oversized integrated `data/library-coverage.json` could not be retrieved through the connector; this receipt does not claim a fresh direct read of that projection.

The GitHub commit diff was read: the changes are limited to four imports, the five API forms, the completed negative example and the corresponding omission-ledger update. No historical declarations or geometric contracts were deleted. Repository-local blueprint/atlas validators were not run in this browser environment; the official submission workflow is the validation gate. Its eventual result belongs to the PR, not to the historical receipts below.

**Lean NOT COMPILED.** No existing build at the two pins was available; no Lake project, cache, library build or Lean server was started. All proofs remain explicit prototype `sorry`s. The suggested file is not a proof certificate and elaboration is not certified.

## Resume

Keep the existing 17 gaps and 20 requests open. The native Scheme omissions addressed here should not be recreated. The remaining Ferrand work is the actual SF.1 algebraic-space carrier and small étale site, exact SF.1/SF.3 descent and flat-object patching exports, all space-valued universal properties, the nonsplit proper-node test and global conductor gluing. Thereafter continue the scheme-to-Weierstrass adapter and the canonical/wild, numerical-Picard, DVR/henselization, rational-surface, resolution and completeness gaps below. A small typo `conductor-subsheme` in the new omission comment means conductor-subscheme; it has no mathematical or declaration effect.

---

## Previous common-ideal checkpoint (unchanged historical receipt)

# Common-ideal reconstruction checkpoint — Codex codex-J6LwjP

Refs #3378. Claim 5952038870 confirmed by bot comment 5952041952; the full issue was reread. Base 9c2a511. Partial checkpoint; all seven stages and the reserved Ferrand key remain open.

The packet now contains **128 nodes: 9 definitions, 1 construction, 92 lemmas, 23 theorems and 3 comparisons; 44 API items, 40 planned tests, 28 planets, 38 baseline declarations, 17 gaps and 20 requests**. All 123 predecessor node ids, 78 routed items, 21 source findings and the previous finite F₂ certificate are retained. Only the existing geometric conductor-square proof/dependency list consumes the new chain. The roadmap definition and reserved key are unchanged.

Five added affine declarations expose the common-ideal reconstruction: a canonical comparison into the existing ring pullback, its kernel ker(f)∩I, compatible-pair lifting when f(I) is already an ideal, the cartesian if-and-only-if criterion, and its specialization to an arbitrary subring conductor. The conductor identity itself needs no finite, birational, reduced or Noetherian hypothesis. Its geometric application still requires the separately stated pinching/localization/gluing inputs.

The comparison has three API signatures and four native tests. The tests distinguish two real obstructions: Z→Z/2 with I=ker(f) has nonzero reconstruction kernel, while the injective diagonal F₂→F₂×F₂ with I=F₂ has an image that is not an ideal and a comparison missing two of four elements. Identity maps and zero ideals give the positive/degenerate cases.

Fresh reading: Ferrand, Conducteur, descente et pincement, printed pp555–557 in full, especially Lemma1.3 and its converse, 2 October2026. Public PDF SHA-256: 4f1f2438ad6d757d67d2ecf154b1bc920d210d8abd54c02e6acd020805629d91. Ten new baseline declarations were read at Mathlib082e2d3. Exact-pin searches find no existing Ferrand/common-ideal reconstruction theorem; the apparent Tau Ceti common-ideal hit concerns matrix-division-algebra uniqueness. Reviewed R11.1–R11.6 and SF.0/SF.1/SF.3 audits, parent document, complete accepted Schröer continuation brief and key-definition entry were read. The continuous session’s earlier full JacobianChallenge/StableReduction readings are reused. No new source error is asserted.

Validation: indexed blueprint checker 0 errors/0 warnings; preservation and five-declaration/three-API/four-test reader/native-name parity; all 128 declaration nodes form an acyclic 347-edge dependency graph. Read-only actual atlas assembly with the unchanged definition/current packet preserves all 67 required stage edges and 76 typed upstream references, with zero pending/skipped links. Its stage graph has 3042 vertices/8726 edges; combined declaration/stage graph has 3142 vertices/9359 edges; both are acyclic. Typed upstream references were appended only to an in-memory validation copy. No atlas or other job files were edited.

Finite checks cover 778 integer-quotient squares, both missing-hypothesis counterexamples, and the nonreduced conductor example F₂[u]/u⁴ with subring F₂+u²F₂[u]/u⁴. Its conductor is (u²) and all eight compatible pairs reconstruct the subring. These calculations are not general proofs, geometric pushout verification, or reruns of the prior elliptic/surface certificates. The packet retains the precise scope.

**Lean not compiled:** the whole suggested file imports Tau Ceti modules, and no existing build at the exact Tau Ceti pin was found. No new project, cache, library build or Lean server was started. Suggested-file SHA-256: ef166fa314cc1f1021a86372a444d4a6a0029dbf51ef97023142bd454ce5f0ad. The five new declarations have actual native ring/quotient/pullback types, but this handoff does not certify elaboration. Every implementation status remains unchecked.

Resume with the prior 17 gaps and 20 requests below: exact SF.1/SF.3 space/descent/flat-object-patching exports and full signatures, the scheme-to-Weierstrass adapter, then the canonical/wild, numerical-Picard, DVR/henselization, rational-surface and full model-resolution/completeness source boundaries. The new affine reconstruction does not close those global interfaces.

---

## Previous finite-classifier checkpoint (historical receipt)

# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII: codex-rtOQ9t continuation

Refs #3378. **Partial checkpoint** extending the merged 111-node plan. No stage or reserved Ferrand key is declared closed. Every implementation status is unchecked.

Current totals: 123 nodes (9 definitions, 89 lemmas, 22 theorems, 3 comparisons), 41 API items, 36 unit tests, 28 planets, 28 cited baseline declarations, 17 gaps and 20 requests. All 111 inherited node IDs, 78 routed items and 21 source findings are preserved. The Ferrand key and unrelated model geometry are unchanged.

This continuation decomposes the finite constant-coefficient F₂ classification into twelve native declarations: five models, binary discriminant and smooth split, eight admissible changes, model discriminants/counts/j, complete orbit witnesses, orbit disjointness, the point-count classifier, the order-four doubling calculation and cyclic point groups. The five inherited E_i nodes consume these calculations, and the existing geometric classifier imports the exact SF.3 scheme-presentation contract. The definition has four API entries and four typed tests, including same-j distinct models and a singular equation sharing count3 with a smooth model.

The durable packet certificate and reader contain every one of the sixteen smooth coefficient tuples, its forward change to the count-indexed model, and the five full point cycles. An independent modulo2 calculation verified all 32 tuples, eight changes, 1024 affine equation substitutions, discriminant/count preservation and inverse changes. Orbit sizes are 2,4,4,4,2; the E₄ cycle is O,(1,0),(0,0),(1,1),O. This finite calculation does not certify the fourteen surface models or the polynomial searches in G.5–G.6.

Fresh primary reading is Schröer arXiv:2004.07025v3, p.11 Proposition3.3/table and preceding context. Its SHA-256 matches the inherited edition receipt. The paragraph cites Knapp, whose text was not freshly obtained; geometric classification is not inferred from an isomorphism of finite point groups. Earlier source ledgers retain their attribution to the previous workers rather than becoming a claim of fresh complete rereading. JacobianChallenge and Multiquadratic upstream documents were read in full. Reviewed parent R11.1–R11.6, SF.3 and EllipticCurves Layer3 audits were read; no direct PartII audit entry exists. All 28 registered baseline statements were read at the pins. General Weierstrass carriers, variable changes, addition, pointCount and cyclic group equivalences are reused.

Validation passed: indexed blueprint checker (0 errors, 0 warnings), exact five-file intake, whitespace, inherited ID/route/source/request preservation, new reader/signature/API/test parity and source hash. Actual atlas projection includes all 76 typed upstream prerequisites and all 67 expected stage edges, with no pending or skipped links. The stage graph has 2612 vertices and 8726 edges; the combined declaration/stage graph has 2738 vertices and 9269 edges. Both are acyclic. Typed upstream imports were appended only to an in-memory validation copy to test the current merger accurately. No other job files or atlas output were edited.

Lean was **NOT COMPILED**: no existing build at both pinned commits. No Lake project, cache, library build or Lean server was started. All twelve added native forms and four API names have real library types; the order-four form includes its nonzero and self-inverse conclusions. The old space/scheme signature omission ledger remains binding.

Resume with the seventeenth gap: SF.3 must export pointed smooth proper genus-one scheme presentation by a native elliptic equation, comparison of scheme rational points with native Point, and geometric realization of admissible changes preserving infinity. This is an addition to the existing SF.3 request, with the exact five-classifier consumer named. Geometric ordinary/supersingular comparison remains an upstream EllipticCurves Layer3 import. The prior sixteen gaps and all twenty requests remain: genuine space/patching exports and signatures, canonical/wild fiber proofs, numerical-Picard descent, DVR adapters, rational surface geometry, Lang configurations, model resolution certificates and full rejection/equivalence witnesses. All seven layers remain partial.

## Previous checkpoint: historical attribution

# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII: codex-a71f92 continuation

Refs #3378. Partial continuation from the merged 99-node checkpoint; no stage or reserved
Ferrand key is closed.

Current totals: 111 nodes (8 definitions,80 lemmas,21 theorems,2 comparisons),37 API items,
32 unit tests,28 planets (G.0 has six),15 cited baseline declarations,16 gaps and20 requests.
All99 original node IDs,78 routed items and21 source findings are preserved. Only the
Ferrand key's space-site clarification/API/tests and the existing affine declaration metadata
change among old nodes. The unrelated model geometry and completeness are still conditional.

## What changed

Twelve new G.0 declarations decompose finite pinching in algebraic spaces, verify its primary
existence source, and distinguish it from the if-and-only-if scheme affine-neighborhood
criterion. They include compatible étale charts, two Hom lemmas, the relation and schematic
overlap, existence, cartesian/sheaf/finite/closed properties, flat comparison and recognition.
The overlap is constructed independently of final existence; its finite-surjective
separatedness step uses Stacks05Z2. Local quasi-finiteness is not replaced by quasi-compactness.
The existing genuine Scheme affine existence theorem now has its full suggested Lean form.

Fresh selected reading: Temkin–Tyomkin author PDF arXiv1305.6014v3 (27 May2016), the exact
sections/proofs in the reader ledger; Stacks04D1,082J,04S6,02X4,05Z2 and section0417, displayed
statements and proofs. Edition, URLs, date and download SHA-256 are recorded. Other sources
and checks retain their inherited attribution; no new source erratum is asserted.

## Remaining and requests

The source-existence uncertainty is resolved, not the integration gap. SF.1 must supply the
genuine space carrier/site, finite cofinality, lifting, descent, quotient, diagonal,
separatedness and representability exports. SF.3 must supply the flat-object patching
equivalence with cartesian unit/counit, not only preservation of existing pushouts. Exact
consumer IDs are added to the two existing requests, without changing their other consumers.

All twelve full algebraic-space forms, the two promoted API names and two new tests have an
exact omission ledger. No fictional carrier replaces them. Lean was NOT COMPILED: no
existing pinned build was available; no Lake setup/cache/build was made.

Validation: actual repository checker and intake rules; preservation; added-edge cycles
including typed upstream prerequisites and stage dependencies; reader/packet and
signature-or-omission parity; new source hashes; whitespace. The continuation did not rerun
the inherited model coefficient/orbit computations. Resume with exact SF.1/SF.3 exports and
full space signatures; then the pre-existing G.1–G.6 proof/model/completeness gaps.

## Inherited checkpoint (unchanged historical note)

# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII

Codex — codex-5ebb6f; Refs #3378. **Partial checkpoint**, not a closed blueprint.

Seven layers contain99 targets, eight definitions,35 API contracts,30 tests and27 planets. All78 routed Schröer items are accounted for. The exact reserved Ferrand node defines the general geometric square and finite-pinching specialization, distinguishes Witaszek’s radicial restriction, and states affine-neighborhood hypotheses for scheme existence. It imports the existing ring pullback and model/lattice carriers.

The reader records exact conventions, proof outlines, ownership, editions and21 source findings. Public Schröer v3, Ferrand, Witaszek, LLR/corrigendum, Bombieri–Mumford, Szydło, Serge Lang and selected2024-book passages were read. William Lang2000 and a full1989 book were not obtained.

Checks passed: official blueprint checker, combined acyclic dependency graph including76 typed upstream edges, supplier consumers,78 unique routes, text-source literal anchors, fourteen discriminant/degree/chart identities, and32 F₂ equations yielding16 smooth equations in five point-count-distinguished orbits. Intake/path checks are recorded in the PR. **Lean not compiled:** no existing pinned build; no project/cache/library build created.

Resume with the16 packet gaps and20 supplier requests: exact exports and upstream-stage checker encoding, geometric signature omissions, numerical-Picard descent, EGA/Raynaud/henselization adapters, canonical/wild and quasielliptic proofs, rational-surface proofs, Lang configurations, model-certificate granularity/resolutions and full rejection/equivalence witnesses. No stage is closed; classifications remain conditional. Missing Lean conditions are named explicitly rather than fabricated as opaque propositions.
