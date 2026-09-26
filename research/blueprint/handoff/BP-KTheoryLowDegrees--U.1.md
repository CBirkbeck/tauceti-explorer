# Handoff: BP-KTheoryLowDegrees--U.1 (issue #764)

Author of this continuation: **Codex — codex-hjdg0j**, 26 September 2026. Claim comment 5848949496 won, confirmed by bot comment 5848950581. This is a **partial checkpoint**, not a completed blueprint or an independent review of all inherited material.

The preceding [source-verification handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/20a6471227850694beb51569058f0a874d4b4142/research/blueprint/handoff/BP-KTheoryLowDegrees--U.1.md) is now integrated for the Morita-preservation argument. It preserves the earlier cc-38367a checkpoints #2918, #2919 and #2921 and the gpt-20260926-c4e7b2 verification checkpoint #2947. Their work is retained; this continuation does not restart the packet.

## What changed

Five nodes separate the proof previously hidden inside `Z.1/equivalence-preserves-finite-projective`:

1. `Z.1/compact-element-order-iso`: preserve and reflect the actual nonempty-directed-set/least-upper-bound definition of a compact element, for partial orders without completeness assumptions.
2. `Z.1/module-equivalence-submodule-order-iso`: compose the actual `subobjectModule`, `MonoOver.congr`, `Subobject.lowerEquivalence` and `Equivalence.toOrderIso` maps.
3. `Z.1/equivalence-preserves-finite`: finite generation of **every** module is invariant under equivalence, by compactness of its top submodule. Projectivity is not assumed.
4. `Z.1/finite-projective-equivalence`: restrict both functors to the existing Tau Ceti full subcategories, with the original unit and counit.
5. `Z.1/finite-projective-equivalence-additive`: establish both binary-product and zero-morphism preservation before applying the pinned additivity theorem. Zero morphisms are preserved because the equivalence is full.

The original preservation-node identifier remains and now states only preservation of finite projectives. Its projectivity proof reuses the categorical comparison at the correct universe size. `Z.1/ring-k0-morita` consumes the separate restriction and additivity nodes. The other 182 inherited node objects are unchanged, as are all eight requests, ten source issues, and the five unrelated gap records.

The infinite-free non-example now requires a nonzero unital ring. A finite set of finitely supported vectors has a finite support union; a basis vector outside it has a nonzero coefficient 1. Over the zero ring every unital module is zero, so that non-example is false there. Matrix-equivalence acceptance clauses require a finite nonempty index type, matching the chosen-index argument of the pinned construction.

The two new constructions have nine API entries and six tests between them. Tests cover identity and zero behavior, preservation of proper submodules, and the nonfree two-dimensional column module over a 2-by-2 matrix algebra. In the last test, finite generation would force a free basis to be finite, and a free matrix module would have base-field dimension 4n rather than 2.

## Current inventory

The packet has **189 nodes**: 16 definitions, 32 constructions, 71 lemmas, 52 theorems, 8 comparisons and 10 applications; **388 API items**, **206 unit tests**, **44 planets**, and **383 baseline declarations**. This continuation adds five nodes, nine API items, six tests and three baseline references, with no new planets. Implementation status remains unchecked everywhere.

The one Morita **source gap** is closed by the explicitly decomposed direct proof from pinned library definitions and theorems. This does not assert that Bass II.3 was read, or prove every clause of its full structure theorem. Z.1 remains partial because the separate finite-dimensional Morita comparison request is open. Overall there remain **five gaps and eight requests**.

## Reading and source limits

Freshly read: the relevant pinned compactness/finiteness definitions and proof bodies, submodule/subobject equivalences, projectivity comparison and transport, full-subcategory lift, additivity and its zero/product-preservation inputs, the finite-projective carrier, and the matrix equivalence. Exact line ranges and pin-checked blob hashes are in `continuationAudit.pinReads`; source `Mathlib.Morita.Pin` lists the mathematical proof inputs.

Freshly read in the [author-hosted K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf): combined 29 August 2013 draft, PDF pages 83–84 (draft pages 75–76), SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. The book attributes Theorem II.2.7 to Bass; this attribution is preserved. The categorical proof here has separate provenance. No new published-source mistake is alleged; the zero-ring problem was an acceptance-statement defect in the packet.

The current reviewed AUDIT-29 rows for all eight scoped stages, accepted RS-18, the owner document and touching link rows were read. GrothendieckEulerForms and JacobianChallenge were read in full by this same worker on the companion Z.3 job, then checked byte-identical here; Layer4's current Morita contract was re-read. Searches across both pinned Lean trees and current atlas documents/packets found no existing compactness-transport or full module-equivalence preservation statement to import. The standard subobject and projectivity infrastructure is imported, not duplicated.

The inherited six mathematical-source registers and 380 baseline citations remain historical evidence. This continuation does not claim to have reread all those sources or independently reviewed all inherited 184 nodes. Its full 383-name elaboration check validates name resolution, not that every inherited statement has the correct scope.

## Validation

- The full suggested file compiled with Lean **4.34.0-rc2**, against the actual Mathlib and Tau Ceti pins, with **645 warnings, all “declaration uses sorry”**, and no errors. Before using Mathlib cache objects, the 8482 reached Mathlib source files were byte-compared with the pinned tree; 51 Tau Ceti modules were built from the pin in the worker's separate build area.
- All **383 baseline declaration names** resolve in the same Lean environment. The three new cited statements were also read independently at the pin.
- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.1.json` reports zero errors and zero packet warnings. The same declaration index used by CI was generated locally from the pins and passed with the explicit --index argument.
- The explicit internal graph is acyclic, with **518 edges**. External prerequisite pairs are unchanged; the cross-roadmap cycle gaps listed below remain unresolved. No whole-atlas acyclicity claim is made.
- Packet/document/prototype parity was checked for every new and changed node and all of its API/test entries. The other 182 node objects, the old 380 baseline entries, source findings, requests and unrelated gaps are unchanged.

## Remaining mathematical work

Begin with one of the following source gaps. Keep their precise hypotheses and dependency-cycle boundaries. Do not restore the removed Morita source gap; its separate finite-dimensional comparison request remains.

### Topological inputs for SK₁ of the real circle ring

U.3/SK1-real-circle-nonzero follows K-book Example III.1.5.4: it needs Proposition III.1.5 (for a commutative Banach algebra R, E_n(R) is the path component of 1 in SL_n(R), using a continuous factorisation of matrices near 1 into n² + 5n − 6 elementary matrices and Ex. I.1.10), Example III.1.5.3 (SK₁(C(X, ℝ)) = [X, SO]) and the homotopy groups π₁(SO_2) ≅ ℤ, π₁(SO_n) ≅ ℤ/2 (n ≥ 3) with π₁(SO_2) → π₁(SO) onto. Mathlib and Tau Ceti have neither the Banach-algebra statement nor these fundamental groups. The algebraic route (Mennicke symbols, K-book Ex. III.1.10, where SK₁ ≅ ℤ/2 is stated) is an exercise without proof in the sources read. The statement SK₁ ≠ 1 is used only as a non-example (tests of U.3/special-K1, U.3/stable-determinant, U.3/stable-special-linear-group and U.1/elementary-subgroup).

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`.

### The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21))

U.4's arithmetic Mennicke argument (BMS Theorem 3.5) uses (A.16) (a, b / 𝔭)_m = (a/𝔭)_m^{ord_𝔭 b} for a a unit at 𝔭 ∤ m, the product formula ∏_𝔭 (a, b / 𝔭)_m = 1 (Artin–Tate XII Theorem 13) and its consequence (A.21) (b/a)_m = ∏_{𝔭∤a}(a, b / 𝔭)_m. ClassicalArithmeticCompletion CA.1 plans exactly these (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law), but those nodes cite K2SymbolsBrauer:T.7 for the norm-residue symbol, and T.7 lies downstream of U.4 (CA.1 ← T.7 ← T.3:localization-comparison ← T.2:graded-map ← K3BlochGroups:V.2 ← ArithmeticKTheory:N.5 ← U.4), so U.4 cannot import them without a stage cycle; Tau Ceti ClassFieldTheory lists 'explicit power-reciprocity laws beyond quadratic reciprocity' as outside its scope. BMS's orientation of the symbol is the transpose of CA.1's. Resolution proposed in restructure.

Needed by: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18))

The totally imaginary case of BMS Theorem 3.5 (Case 3, through Lemma 3.4(a)) needs (A.17): for k/ℚ_p finite containing μ_{p^n}, with e = ord_𝔭(p), (U_𝔭(h), U_𝔭 / 𝔭)_{p^n} = (U_𝔭(h+1), k^× / 𝔭)_{p^n} = μ_{p^{n−j}}, j = [h/e − 1/(p−1)]_{[0,n]}. BMS prove it (pp. 87–88) from Serre, Corps locaux, Ch. XIV Prop. 6 (p. 237) and Ch. XV Prop. 9 (p. 219), which are not freely available and were not read; no roadmap of the atlas plans the statement. Needed only for S = ∅ and F totally complex, where U.4 uses j = 0 (the pairing U_𝔭(h) × U_𝔭 → μ_{p^n} is onto).

Needed by: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Milnor patching and the K₀ Mayer–Vietoris sequence (K-book I.2.7, II.2.9)

The degree-zero part of the relative sequence, K₁(A/I) → K₀(I) → K₀(A) → K₀(A/I) (K-book Ex. II.2.3(c), an exercise), follows from Milnor's Mayer–Vietoris theorem for the double-ring Milnor square; the K-book proves part (3) of Milnor patching and outlines the rest in Ex. I.2.8, and derives II.2.9 from it. No layer plans Milnor patching (KTheoryLowDegrees Z.1 does not list it; GrothendieckEulerForms is K₀ of categories). Proposed for Z.1 in restructure.

Needed by: `KTheoryLowDegrees:U.5/ideal-sequence-degree-zero`.

### Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15)

The source gives only a hint ('Use Ex. III.2.7 to show that π₁K(R → R/I) is isomorphic to the group K₁(R, I)'). Completing the five-lemma argument needs π₂BGL⁺ = K₂ (K2SymbolsBrauer T.1:plus) and the classical relative K₂-sequence (K2SymbolsBrauer T.6), which the helper places downstream of U.6 because K2SymbolsBrauer:T.1/k2-definition cites GeneralAlgebraicKTheory:K.2, whose combined stage requires K.2:low-degree-comparisons ← U.6. GeneralAlgebraicKTheory's decomposition node K.5/relative-K-theory-and-excision-boundary asserts the identification with the same exercise as its only source. See restructure.

Needed by: `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`.


The eight supplier requests remain unchanged: GrothendieckEulerForms layer 4; ClassFieldTheory layers 5, 12 and 13; Chebotarev layers 4 and 10; GlobalNumberFields layers 6 and 7. Their exact stages, map-level statements and consuming nodes are in the packet.

For U.5, respect S.3's ownership of localization boundaries and retain the explicit cokernel-length comparison. For U.6, K.5 owns the relative homotopy fibre; this packet owns comparison with classical relative K₁. The previously recorded obstruction-theory boundary of H.3's plus-construction universal property remains unread. Do not solve a combined-stage cycle by dropping a needed mathematical hypothesis or silently removing another owner's edge.

Preserve left modules for K₀, right modules with column vectors for the K₁ automorphism class, finite sets of finite places for S, and the positive uniformizer normalization for the DVR boundary. Preserve the accepted RS-18 extension of GrothendieckEulerForms and its separation of generic categorical K₀ from the explicit ring-level extension.

The initial CI run rejected two valid named instances because its approximate declaration index skips priority-bearing instance declarations. Their citations were replaced by three indexed declarations, with the short fullness/zero-morphism argument spelled out and limit preservation taken through the adjunction of the inverse equivalence. This repairs the evidence interface without changing any Lean signature.

Only the four authorized files are changed: packet, roadmap document, suggested file and this handoff. The next pass should keep all current identifiers and retain the companion Z.3 packet.

