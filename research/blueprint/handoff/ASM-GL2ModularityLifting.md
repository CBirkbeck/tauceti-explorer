# ASM-GL2ModularityLifting handoff

Job: ASM-GL2ModularityLifting · Refs #232

Agent: Codex — codex-gGhH9J

Assembly pass: complete, 7 October 2026. This is an assembly submission, not a checkpoint of unfinished assembly work.

## Delivered

- `research/blueprint/readmes/GL2ModularityLifting.md`: one reader with purpose, boundaries, conventions, source/version register, existing-library interfaces and the twelve-layer overview. All 101 current packet nodes, 97 API items, 76 unit-test contracts and 36 planets are included, together with hypotheses, proof steps, exact prerequisites, uses, acceptance checks and locators. Definitions and applications are ordered by internal prerequisites within each owning layer.
- `research/blueprint/suggested/GL2ModularityLifting.lean`: both parts joined with one standard note and 32 unique imports. The namespaces `TauCeti.ModularityLifting` and `TauCeti.GL2Lifting` are retained to preserve the exact packet API names. Executable declarations, bodies and tests from the input fragments are unchanged; omitted arithmetic signatures remain explicitly omitted or comment-only sketches.
- This handoff: exact cross-part audit, inherited gap/review boundary and all 51 requests and both ownership proposals, including separately repeated requests to the same supplier.

The packet statements govern the assembled reader where the part readers were stale. In particular the §7.6/§8 witness constructions now precede minimal-level data in R22.1; the stable R22.5 α/β identifiers appear in their actual parent R22.1; KW I Theorem 4.1 exports appear in R22.5/R22.6; all four R32.1 proposition definitions have separate entries. The R32.3–R32.6 text now includes the reviewer-corrected supplier generality, direct dependencies, ordinary quotient normalization, determinant finiteness, Pan setup and prime selection, DP-versus-KW system data, added APIs and corrected locators.

Neither part packet was edited. No node mathematics, review verdict, ownership ruling or supplier implementation was changed by this assembly. There is no newly changed mathematical node to schedule for re-review. The ordinary independent review of the assembled outputs and the pending review of earlier fixes remain necessary.

## Cross-part prerequisite audit

The first packet has no prerequisite into the second part. The second packet has exactly these two prerequisites into the first, both already exact and satisfied as plan references:

| Consuming node | Supplying node | Contract checked |
| --- | --- | --- |
| `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd` | `GL2ModularityLifting:R32.2/odd-prime-statement-over-q` | Odd-prime regular de Rham lifting over ℚ, with residual modularity and cyclotomic absolute irreducibility, including p=3. Each lift retains its own geometric hypotheses. |
| `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd` | `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility` | Comparison of absolute irreducibility over ℚ(√p*) and ℚ(ζ_p) under the stated residual hypotheses. |

Every roadmap-internal prerequisite resolves to a node in the two-packet union; no internal prerequisite names a coarse stage or a missing node, and the internal graph is acyclic. No prerequisite goes to a later owning layer. The reader links those exact IDs. The stable α/β node prefixes differ from their parent stage, so ordering uses `parentStageId`, not a prefix guess. The old reader's suggestion that part-two dyadic/transfer references still needed cross-part sharpening is not carried forward: those references are already correct in the packets. No new consuming gap was required by the assembly audit.

General-field nonsolvable-image preservation in R32.3 uses its explicit R04.4 request; it does not silently reuse the ℚ-only R32.1 lemma. Splitting the old lifting statement table does not permit old external consumers to keep importing its former four-statement bundle. The part-one ordinary-three/external-reference gap retains that downstream obligation. The new reader exposes each distinct proposition, but other jobs' packets were outside this issue's writable scope.

No link or overlap entry with a GL2ModularityLifting endpoint was present in the link-map inputs. Boundaries were read from the base roadmap, both packets and their ownership records. `data/library-coverage.json` has no reviewed layer entry for this roadmap; its absence is not evidence of arithmetic implementation. The upstream Multiquadratic and ReductiveGroups roadmap documents were read for structure and density.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R22.1.json`: 0 errors, 0 warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.3.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/GL2ModularityLifting.lean`: elaborates successfully in the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Only `declaration uses sorry` warnings. The file imports Mathlib only; it does not test Tau Ceti arithmetic implementations at `f790474821cf4256814db967cb154e7af3d0c369`.
- Assembly correspondence check: every node has exactly one reader entry, all statements/hypotheses/proof steps/API contracts/test contracts/acceptance checks are retained, and every reader fragment link resolves. Every input executable declaration and test is retained in order within its namespace; the joined file has one import block and one standard note.
- `git diff --check`: clean.

The limited pinned Mathlib declarations in both baseline registers were read at the confirmed shared Mathlib commit, including `IsAdicComplete.henselianRing`. No new source extraction or independent theorem-proof audit is claimed. Source/version records and confirmed source issues are inherited from the packets; the reader qualifies the colliding source-issue E1 by part and keeps the two published DP source-ID aliases.

## What remains outside assembly

Both packet reviews still say `needs_changes`: part R22.1 retains `independent-review-REV-FIX-RT-AREA-langlands-2~2` (2 October); part R32.3 retains `independent-review-REV-GL2ModularityLifting--R32.3` (6 October). The latter explicitly required the stale reader to be synchronized with its corrected packet. That synchronization is supplied by the full assembled reader without changing the older part reader, which this issue does not authorize editing. The earlier part-one review's historical remarks about missing field nodes and the R33 back-edge must be read alongside the subsequently landed round-three packet, not treated as its current graph. No verdict is upgraded here.

R22.1–R22.6 and R32.1–R32.2 retain partial coverage; R32.3–R32.6 retain planned coverage. The assembly is complete while the mathematical plan remains open at the inherited obligations. In particular, elaboration cannot discharge the missing typed arithmetic signatures in PROTOCOL §13. The generic Pan prototypes still require the actual arithmetic sets/maps; classical typed signatures still use explicitly documented supplier stand-ins and omit some source clauses. Completing them requires the owners' actual carriers, not weaker proposition-valued placeholders.

Resume mathematical closure from the exact per-node obligations in the reader and the part packets, preserving the restricted supplier/source-independence boundary. Do not certify the independent R33 route from local multiplicity statements alone. The auxiliary globalisation proofs and weight-change inputs must either be established independently in their stated restricted form or expose any full-Serre dependence. The unread Durham/Kisin nonordinary k=p+1, residual-weight-two case of KW I Theorem 4.1(2) remains an explicit source action. No general Serre endpoint, Pan's unconditional corollary or Emerton §7.3 is imported as a hidden proof input.

### Retained obligations from part R22.1

1. **Typed suggested signatures and tests are incomplete.** Needed by `GL2ModularityLifting:R22.1/minimal-level-data`, `GL2ModularityLifting:R22.1/deformation-to-hecke-map`, `GL2ModularityLifting:R22.1/framed-hecke-module`, `GL2ModularityLifting:R22.2/auxiliary-level-groups`, `GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`, `GL2ModularityLifting:R22.2/taylor-wiles-module-system`, `GL2ModularityLifting:R22.2/dyadic-twists-of-forms`, `GL2ModularityLifting:R22.3/arithmetic-patching-data`, `GL2ModularityLifting:R22.4/ihara-avoidance-comparison`, `GL2ModularityLifting:R22.6/dyadic-patched-ring`, `GL2ModularityLifting:R32.1/lifting-statement-table`, `GL2ModularityLifting:R22.5/strong-residual-modularity`, `GL2ModularityLifting:R32.1/p-star`, `GL2ModularityLifting:R32.1/dyadic-lifting-proposition`, `GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`, `GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`.
2. **Declaration granularity and API promotion still required.** Needed by `GL2ModularityLifting:R22.1/minimal-level-data`, `GL2ModularityLifting:R22.1/deformation-to-hecke-map`, `GL2ModularityLifting:R22.1/framed-hecke-module`, `GL2ModularityLifting:R22.2/auxiliary-level-groups`, `GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`, `GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`, `GL2ModularityLifting:R22.2/taylor-wiles-module-system`, `GL2ModularityLifting:R22.2/dyadic-twists-of-forms`, `GL2ModularityLifting:R22.3/arithmetic-patching-data`, `GL2ModularityLifting:R22.3/patched-ring-and-module`, `GL2ModularityLifting:R22.4/ihara-avoidance-comparison`, `GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`, `GL2ModularityLifting:R22.6/dyadic-patched-ring`.
3. **Arithmetic patching constants and finite-level maps.** Needed by `GL2ModularityLifting:R22.3/arithmetic-patching-data`, `GL2ModularityLifting:R22.3/patched-ring-and-module`, `GL2ModularityLifting:R22.6/dyadic-patched-ring`.
4. **Finite presentation needed for framed tensor and support descent.** Needed by `GL2ModularityLifting:R22.1/framed-hecke-module`, `GL2ModularityLifting:R22.2/taylor-wiles-module-system`, `GL2ModularityLifting:R22.3/patched-support`, `GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`, `GL2ModularityLifting:R22.4/support-transfer-mod-lambda`, `GL2ModularityLifting:R22.4/modularity-from-full-support`.
5. **Integral R=T and numerical presentation bound.** Needed by `GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`.
6. **Solvable base change and image-preserving local prescription.** Needed by `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`, `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`, `GL2ModularityLifting:R22.5/fontaine-laffaille-lifting`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`, `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`, `GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`, `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`.
7. **Type and determinant transport of Barsotti–Tate components.** Needed by `GL2ModularityLifting:R22.5/component-patching`, `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`, `GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`, `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`, `GL2ModularityLifting:R22.5/strong-residual-modularity`, `GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`, `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`.
8. **Image-theoretic bridges in the quadratic irreducibility proof.** Needed by `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`, `GL2ModularityLifting:R32.1/non-solvable-residual-image`.
9. **Hodge–Tate twists and weight-preserving modular twists.** Needed by `GL2ModularityLifting:R32.1/hodge-tate-and-oddness-normalisation`, `GL2ModularityLifting:R32.2/odd-prime-statement-over-q`, `GL2ModularityLifting:R32.1/weight-of-modular-twist`.
10. **Finite coefficient field and stable integral lattice.** Needed by `GL2ModularityLifting:R32.2/odd-prime-statement-over-q`.
11. **Multiplicity criterion and graded-piece proof inputs.** Needed by `GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`, `GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`, `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.
12. **Exceptional local support and independence audit.** Needed by `GL2ModularityLifting:R32.1/exceptional-local-cases`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`.
13. **Prescribed-type modular witnesses not established by the existing Q-only exports.** Needed by `GL2ModularityLifting:R22.1/minimal-level-data`, `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`, `GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`, `GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`, `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`, `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.
14. **Ordinary-three predicate transport and external references after splits.** Needed by `GL2ModularityLifting:R22.5/ordinary-overlap`, `GL2ModularityLifting:R32.1/residual-modularity-forms`, `GL2ModularityLifting:R32.2/application-requirements`, `GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`.
15. **Dyadic dimension, regularity and integral faithfulness bridges.** Needed by `GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`, `GL2ModularityLifting:R22.6/dyadic-generic-fibre-regular`, `GL2ModularityLifting:R22.6/dyadic-patched-module-faithful`.
16. **One case of KW I Theorem 4.1(2) is taken from an unread paper.** Needed by `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`.

The complete detail of every obligation is reproduced in the assembled reader; the part packet remains the machine-readable record.

### Retained obligations from part R32.3

1. **Source-independence certification of the auxiliary globalisations.** Needed by `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`.
2. **Absent arithmetic carriers prevent full suggested signatures.** Needed by `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`, `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.3/typed-component-specialisation`, `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-prime`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/extension-components`, `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/extension-component-propagation`, `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`, `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`, `GL2ModularityLifting:R32.6/transfer-ordinary-three`.

The complete detail of every obligation is reproduced in the assembled reader; the part packet remains the machine-readable record.

## Ownership and restructure proposals

These are collected from the packets, not applied to other jobs or to `content/campaign/`, `data/` or the base atlas. The maintainer must reconcile the external consumers and inherited descriptions.

### Part R22.1, proposal 1

**action:** rescope

**roadmaps:** `GL2ModularityLifting`, `PotentialModularityAndCompatibleSystems`

**detail:** KW I Theorem 4.1 and the passage from 'ρ̄ modular' to the hypotheses (α), (β) are stated in two layers. This packet proves them in R22.5 and R22.6 (R22.5/alpha-beta-from-modularity-over-q, R22.5/kw-i-theorem-4-1-odd-prime, R22.6/kw-i-theorem-4-1-dyadic), where KW II §10.2 derives them from Theorem 9.7 without potential modularity or finiteness of deformation rings (confirmed finding RT-AREA-langlands-2/12). The packet PotentialModularityAndCompatibleSystems--R24.3 treats R24.4 as a consumer layer, with nodes PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1 and R24.4/alpha-beta-from-residual-modularity that restate the two statements and a request to R22.5 for the full Theorem 4.1(2); those nodes cite Theorem 9.7 (R22.5/kw-odd-prime-lifting, R22.6/kw-dyadic-lifting), not the export nodes, which did not exist when they were written. The atlas layer R24.4 still follows R24.3, and the texts of R22.5 and of the RS-08 keeps still say that the theorem is assembled in R24. Consumers are split: four nodes of ClassicalSerreModularity part R27.3 cite the R22.5/R22.6 nodes, while R26.6/corollary-8-1-ii-and-the-statement-W1 and R27.2/theorem-3-2-weight-reduction of part R26.1 cite R24.4/kw-theorem-4-1.

**proposal:** One owner, as both packets intend: GL2ModularityLifting R22.5 owns KW I Theorem 4.1(2) and the passage to (α), (β), and R22.6 owns Theorem 4.1(1). The two nodes of PotentialModularityAndCompatibleSystems R24.4 cite the three export nodes of this packet (which answers that packet's request to R22.5, except for the gap case k = p + 1 with residual weight 2 and a lift non-ordinary at p). The sentence 'The KW I Theorem 4.1 formulation is assembled in R24 after its full KW II §10 inputs' leaves the R22.5 text and the RS-08 keeps, and R24.4 no longer requires R24.3 for this theorem. Consumers may cite either layer's node; citing the R22.5/R22.6 nodes keeps them independent of R23 and R24.1–R24.3.

### Part R32.3, proposal 1

**kind:** ownership

**finding:** RT-AREA-langlands-2/21

**owner:** GL2ModularityLifting:R32.6

**consumer:** ClassicalSerreModularity:R33.1

**detail:** Keep R32.6 as sole owner of the modern ramified-coefficient-prime reducible transfer. R24.6 retains reduction/specialisation/local-compatibility-hypothesis results and imports this owner if its interface includes modern transfer. Its present linked-systems-modularity-transfer node already imports these exact R32.6 nodes. No back-edge from this packet to that bundled node is introduced. The maintainer can remove the modern-route sentence in the base R24.6 description when applying this ownership resolution; no other job files are edited.

The base GL2ModularityLifting summary still assigns final source theorems needing finiteness to R24; applying the KW I ownership proposal should preserve that distinction while removing any implication that Theorem 4.1 itself requires the R24 finiteness/potential-modularity chain. PotentialModularityAndCompatibleSystems R24.4 and RS-08 need the specific export references described above. R24.6 remains the specialization/local-compatibility owner and imports the R32.6 modern transfer where needed. These edits are for the maintainer or the respective jobs.

## Complete supplier-request register

Numbering below is local to each input packet and preserves its array order. Requests with the same supplier are kept separately because their mathematical contracts and consumers differ. Part R22.1's status and note fields are retained; part R32.3 does not have per-request status fields. Collection is not a claim that a request is delivered or accepted.

### Part R22.1, request 1: `HilbertModularVarietiesAndShimuraCurves:R18.6`

Definite quaternionic forms S_{τ,ψ}(U, A) with the weight modules W_k (including the p = 2 extension of W_2 to non-compact U with U_v = D_v^× at Σ), the Hecke algebras 𝕋_ψ(U) and 𝕋_{ψ,Q}(U_Q) with T_v, S_v, U_v and ⟨h⟩, non-Eisenstein localisation, finiteness, reducedness and the Jacquet–Langlands identification of 𝒪′-points with π. Also the isotropy groups and their Sylow exponents (KW II §7.2), the freeness criterion (KW II Lemma 7.4, Gee Proposition 5.4(2)), the Ihara-type lemma (KW II Lemma 7.1) and the dyadic twist f ↦ f_χ (KW II Proposition 7.6). Supply the HenselianRing instance at the maximal ideal of the local Hecke algebra, obtained from maximal-ideal-adic completeness using the existing pinned instance in Mathlib/RingTheory/Henselian.lean. For §8 additionally export R18.3’s Lemma 7.3 isotropy behavior under base change, the Galois-free localized freeness part of Corollary 7.5 for distinct roots of X²−T_vX+N(v)ψ(π_v), the per-place permutation-module/degeneracy injection used in Lemma 8.3 (Edixhoven–Khare §4 Proposition 1), the neat-level integral coefficient reduction surjection, and the precise algebraic level-raising inputs Kisin Corollary 3.1.11 and Lemma 3.5.3. The Galois local–global compatibility is imported separately from R19.4/R19.5.

**Needed by:** `GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`; `GL2ModularityLifting:R22.1/minimal-level-data`; `GL2ModularityLifting:R22.1/prescribed-level-raising-step`; `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`; `GL2ModularityLifting:R22.2/auxiliary-level-groups`; `GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`; `GL2ModularityLifting:R22.2/dyadic-twists-of-forms`.

**Recorded status:** open.

**Note:** R18.3 keeps these (RS-23); R18.6 exports them to KW II §§7–9.

### Part R22.1, request 2: `AutomorphicGaloisRepresentations:R19.6`

The Galois representation ρ_𝔪 : G_F → GL_2(𝕋_ψ(U)_𝔪) (Carayol's descent from ρ_π), and local–global compatibility for Hilbert modular forms: away from p (Carayol, Taylor, including the principal-series computation at Taylor–Wiles places and KW II Lemma 7.2), and at p (KW II Lemma 7.7 and Corollary 7.8).

**Needed by:** `GL2ModularityLifting:R22.1/hecke-points-local-conditions`; `GL2ModularityLifting:R22.1/deformation-to-hecke-map`; `GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`; `GL2ModularityLifting:R22.2/delta-actions-agree`; `GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`.

**Recorded status:** open.

**Note:** The existing quaternionic Hecke-representation node is now cited. This open request is only for the extra local–global and noncompact dyadic generality not furnished by that compact-level statement.

### Part R22.1, request 3: `LocalGaloisDeformationRings:R08.6`

The local conditions of KW II's lifting data (semistable with γ_v, odd at ∞, types (A), (B), (C) at p) with their rings.

**Needed by:** `GL2ModularityLifting:R22.1/hecke-points-local-conditions`; `GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`.

**Recorded status:** open.

**Note:** Also requested by GlobalGaloisDeformations R04.6.

### Part R22.1, request 4: `DeformationAndDerivedPatchingAlgebra:R03.5`

Inverse-limit patching from finite-level rings, modules and presentations (the diagonal-subsequence argument), finite generation of the patched module, its power-series action and specialisation, with integral assertions separated from those after inverting π.

**Needed by:** `GL2ModularityLifting:R22.3/arithmetic-patching-data`; `GL2ModularityLifting:R22.3/patched-ring-and-module`; `GL2ModularityLifting:R22.6/dyadic-patched-ring`.

**Recorded status:** open.

**Note:** RS-08: R22.3 applies R03.3/R03.5; R03.5 is not yet planned in the P7 packet.

### Part R22.1, request 5: `DeformationAndDerivedPatchingAlgebra:R03.3`

Auslander–Buchsbaum over the regular ring R_∞[1/p] (Kisin's Moduli paper, Lemma 3.3.4): a finite module, free over a regular subring of full dimension, is projective and faithful over R_∞[1/p].

**Needed by:** `GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`; `GL2ModularityLifting:R22.5/component-patching`; `GL2ModularityLifting:R22.6/dyadic-r-equals-t`.

**Recorded status:** open.

**Note:** The P7 packet plans parts of R03.3 (free-of-maximal-depth-regular-local).

### Part R22.1, request 6: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`

The ordinary lifting theorem over totally real F for p > 2: ρ : G_F → GL_2(𝒪) ordinary at every v | p (ρ|D_v ≅ (χ₁γ₁ ∗; 0 γ₂), γ_i unramified), with residual cyclotomic absolute irreducibility and an ordinary residually modular Hilbert eigenform, is modular; with its determinant, ramification, distinguishedness and character hypotheses stated individually.

**Needed by:** `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`; `GL2ModularityLifting:R22.5/ordinary-overlap`.

**Recorded status:** open.

**Note:** RS-08 imports R21.4 into R22.5 on the exact ordinary overlap only; ordinary-overlap proves the transport.

### Part R22.1, request 7: `LocalGaloisDeformationRings:R08.4`

Transport the Barsotti–Tate component criteria of R08.4/rank-two-bt-components and R08.5/rank-two-connected-components to the fixed-determinant, fixed-type problems after the base changes used by Kisin. For ordinary points retain the matching residual quotient (or fixed-determinant cyclotomic-line) character: split distinct unramified residual characters can give two ordinary components. Ordinarity alone suffices only after the source's extra residual hypotheses, such as indecomposable or trivial residual action, are imposed. For nonordinary points retain the residue-field/trivial-action hypotheses. Supply compatibility of component selection with the modular point and base change.

**Needed by:** `GL2ModularityLifting:R22.5/component-patching`; `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`; `GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`.

**Recorded status:** open.

**Note:** Corrected against the existing fine-node statement and Kisin Annals (3.4.7), published p.1163. The fine nodes are now prerequisites; the unsupplied type/determinant/base-change transport remains open.

### Part R22.1, request 8: `SerreWeightAndLevelOptimisation:R20.6`

Type and level changes of definite quaternionic eigenforms used by Kisin: his 2-adic Lemmas (3.3.1)–(3.3.4) (potentially ordinary type Ind θ at F_v = ℚ_2, cuspidal types, matching unramified characters at Σ, removing ramification outside Σ), his Annals (3.1.6), (3.5.2), (3.5.3), and Diamond's potentially ordinary modular lift ([Di 1, 6.4] in Kisin).

**Needed by:** `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`; `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`; `GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`; `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`; `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.

**Recorded status:** open.

**Note:** This distinct Kisin type/level-change contract remains open. KW II Theorem 8.4 is now planned at R22.1 and is not part of this request; ownership of these additional Kisin inputs still needs the R18/R20 owners to settle.

### Part R22.1, request 9: `LocalGaloisDeformationRings:R08.6`

Fontaine–Laffaille framed rings in Gee's generality: for F_v/ℚ_p unramified, any ρ̄_v, and distinct Hodge–Tate weights differing by at most p − 2 for each embedding, the crystalline framed ring with fixed determinant is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p].

**Needed by:** `GL2ModularityLifting:R22.5/fontaine-laffaille-lifting`.

**Recorded status:** open.

**Note:** R08.6/export-fontaine-laffaille-irreducible covers only F_v = ℚ_p with ρ̄_v irreducible.

### Part R22.1, request 10: `GL2AutomorphicRepresentationsAndTransfer:R17.4`

For solvable totally real E/F (a tower of Galois steps with soluble groups) and continuous r : G_F → GL₂(ℚ̄_p) with r|G_E irreducible, automorphy of r is equivalent to automorphy of r|G_E (Gee Proposition 4.25, from Langlands' cyclic base change and strong multiplicity one). Existence of the field E with prescribed completions is not requested here: it is Clozel–Harris–Taylor's Lemma 4.1.2, requested from PotentialModularityAndCompatibleSystems R23.1 and applied in R22.1/allowable-base-change-existence.

**Needed by:** `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic`.

**Recorded status:** open.

**Note:** Every lifting theorem of R22.5–R22.6 starts with such a base change.

### Part R22.1, request 11: `AutomorphicGaloisRepresentations:R19.6`

Local–global compatibility at p for Hilbert modular forms of parallel weight 2 that are Steinberg at v | p: ρ_π|D_v ≅ (γ_vχ_p ∗; 0 γ_v).

**Needed by:** `GL2ModularityLifting:R22.5/ordinary-overlap`.

**Recorded status:** open.

**Note:** A narrower form of the existing R19.6 request.

### Part R22.1, request 12: `PadicLocalLanglandsForGL2Qp:R30.6`

The local inputs of odd-prime de Rham lifting, each with its hypotheses: (1) the Breuil–Mézard conjecture in cycle form for every ρ̄ : G_{ℚ_p} → GL₂(k) and every p-adic Hodge type, for p > 2 (Tung, arXiv:1803.07451v4, Theorem 1.2; for p ≥ 5 Paškūnas, Duke 164 (2015), Theorem 1.1, End ρ̄ = k, and Hu–Tan, ÉNS 48 (2015), split non-scalar ρ̄), with the Hilbert–Samuel multiplicity and cycle formalism it is stated in; (2) Kisin's local inequality e(R̄_v/π) ≤ μ_Aut through Colmez's functor (Kisin, JAMS 22 (2009), §§1.6–1.7, as corrected by Gee–Kisin Appendix B.1–B.2); (3) Kisin's Hypothesis (1.2.6) for every de Rham type (Emerton, lg.pdf, Theorem 3.3.22, with Colmez's Theorem VI.6.50 for the crystabelline and semistable cases).

**Needed by:** `GL2ModularityLifting:R32.1/exceptional-local-cases`; `GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`; `GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`; `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`; `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.

**Recorded status:** open.

**Note:** R30.6 is charged with 'the precise Paškūnas, Hu–Tan and Tung statements needed by R32, including the dyadic and p = 3 cases'.

### Part R22.1, request 13: `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`

The global inputs of Tung's proof of the Breuil–Mézard conjecture (arXiv:1803.07451v4, §§3–4): the patched module M∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin on definite unitary groups with its projectivity; Emerton–Paškūnas' faithfulness of R∞ on M∞; and the automorphy of components in the reducible locus through Barnet-Lamb–Gee–Geraghty Theorem A.4.1 (Tung Proposition 4.4). Their auxiliary globalisations are to be checked for independence from Serre's conjecture (R31.6).

**Needed by:** `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`.

**Recorded status:** open.

**Note:** Emerton §7.4, pp.97–98 of lg.pdf (read 2026-09-30), explicitly chooses an auxiliary modular CM-induced residual representation and uses its weight theorem; this passage does not invoke Khare–Wintenberger for the target representation. That check does not certify every auxiliary globalisation in Tung/CEGGPS; the separate R31.6 independence audit remains open.

### Part R22.1, request 14: `SerreWeightAndLevelOptimisation:R20.6`

Gee, Automorphic lifts of prescribed types (Math. Ann. 350 (2011)), Theorem 4.4.12, as Kisin uses it in the proof of his Theorem (2.2.17): over a totally real F with p split, if ρ̄ is modular with ρ̄|G_{F(ζ_p)} absolutely irreducible and μ_Aut(k_v, τ_v, ρ̄|G_{F_v}) ≠ 0 at every v | p, then ρ̄ is modular of weight σ = ⊗_v σ(k_v, τ_v). Also the auxiliary smooth lifts and weight-surjection statements of Gee §4.6 used in Gee–Kisin B.5.2, with the residual modularity and local hypotheses needed to lift each filtration factor.

**Needed by:** `GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`; `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.

**Recorded status:** open.

**Note:** Gee's paper was not read here.

### Part R22.1, request 15: `AutomorphicGaloisRepresentations:R19.2`

Cuspidal Hilbert automorphic representation, weight/conductor invariants and its residual attached representation, for the existential α/β witness predicates before KW II §8 constructs minimal-level data.

**Needed by:** `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`; `GL2ModularityLifting:R22.5/kw-residual-modularity`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`.

**Recorded status:** open.

### Part R22.1, request 16: `ArithmeticGaloisRepresentations:R01.3`

The S-type residual representation and its restriction/image hypotheses for KW II §8, with coefficient field visible; finite-subgroup consequences only, no modularity or weight-one theorem.

**Needed by:** `GL2ModularityLifting:R22.1/allowable-base-change`; `GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`; `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`; `GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`.

**Recorded status:** open.

### Part R22.1, request 17: `ArithmeticGaloisRepresentations:R01.4`

The S-type residual representation and its restriction/image hypotheses for KW II §8, with coefficient field visible; finite-subgroup consequences only, no modularity or weight-one theorem. For R22.1/allowable-base-change-existence: the image of ρ̄ restricted to G_{F′} is the subgroup of Gal(K/F) fixing F′ ∩ K, so linear disjointness of F′ from K(μ_p) preserves the image over F′ and over F′(μ_p).

**Needed by:** `GL2ModularityLifting:R22.1/allowable-base-change`; `GL2ModularityLifting:R22.1/allowable-base-change-existence`; `GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`.

**Recorded status:** open.

### Part R22.1, request 18: `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Jacquet–Langlands transfers between the cuspidal witnesses and definite quaternionic forms with the discrete-series and parity hypotheses used in KW II pp. 72 and 77.

**Needed by:** `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `GL2ModularityLifting:R22.1/prescribed-level-raising-step`.

**Recorded status:** open.

### Part R22.1, request 19: `GL2AutomorphicRepresentationsAndTransfer:R17.4`

Solvable automorphic base change for cuspidal automorphic representations of GL₂ over totally real fields, along a cyclic extension of prime degree: existence, compatibility with local base change at every place (so that weights at infinity, unramifiedness and conductor exponents along unramified local extensions are preserved), and cuspidality of the base change when the attached Galois representation stays irreducible. This is automorphic transfer, not existence of a field with prescribed completions.

**Needed by:** `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`; `GL2ModularityLifting:R22.1/prescribed-level-raising-step`; `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`.

**Recorded status:** open.

### Part R22.1, request 20: `AutomorphicGaloisRepresentations:R19.4`

Local–global compatibility at the raised non-p places, as used in KW II Theorem 8.4 with Carayol/Taylor.

**Needed by:** `GL2ModularityLifting:R22.1/prescribed-level-raising-step`.

**Recorded status:** open.

### Part R22.1, request 21: `AutomorphicGaloisRepresentations:R19.5`

KW II Lemma 7.7 and Corollary 7.8, from Kisin: precise Langlands–Fontaine compatibility above p for the cuspidal Hilbert witness over a totally real field unramified at p with residually absolutely irreducible representation.

**Needed by:** `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`; `GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`.

**Recorded status:** open.

### Part R22.1, request 22: `PotentialModularityAndCompatibleSystems:R23.1`

Clozel–Harris–Taylor, Lemmas 4.1.1 and 4.1.2 (Publ. Math. IHÉS 108 (2008), pp. 116–117), which belong to R23.1's field selection. Lemma 4.1.1: for a number field F, a finite set S of places and a continuous character χ_S : ∏_{v∈S} F_v^× → ℚ̄^× of finite order, there is a continuous character χ : F^×\𝔸_F^× → ℚ̄^× with χ|_{∏_{v∈S} F_v^×} = χ_S. Lemma 4.1.2: for a number field F, a finite Galois extension D/F, a finite set S of places of F (real places allowed) and finite Galois extensions E_v/F_v for v ∈ S, there is a finite soluble Galois extension E/F, linearly disjoint from D, such that E_w/F_v ≅ E_v/F_v for every v ∈ S and every place w | v of E. Three refinements used here: (a) when the local characters all have p-power order, the p-primary component of χ has p-power order and the same restriction to ∏_{v∈S} F_v^× (χ itself need not have p-power order); (b) E is totally real when F is totally real and E_v = F_v at every real place; (c) weak approximation in the form: for a finite set S of places, F^× → ∏_{v∈S} F_v^×/(F_v^×)² is surjective, which gives quadratic extensions with prescribed completions without class field theory. The proofs use that every subgroup of finite index of the unit group is a congruence subgroup, local class field theory and global existence (Tau Ceti ClassFieldTheory, Layers 8, 11, 12), and, for the disjointness from D, places not split completely in the simple quotients of Gal(D/F) (Chebotarev). There is no automorphic input.

**Needed by:** `GL2ModularityLifting:R22.1/allowable-base-change-existence`; `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.

**Recorded status:** open.

**Note:** R23.1 has no ancestor in GL2ModularityLifting: its only stage requirement is AlgebraicModuliForArithmeticGeometry R09.3. On the stage edges of data/atlas.json it has three ancestors (R09.1–R09.3), and sixteen once the accepted restructuring links and the link maps are added; none is a consumer of R22.1, so the link R23.1 → R22.1 is acyclic. The R23.1 packet has not yet planned these lemmas; when it does, the stage prerequisite becomes their node ids.

### Part R22.1, request 23: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

Global class field theory in the form used by KW II Lemma 7.10: a continuous finite-order idele class character of a number field F cuts out a finite cyclic extension F′/F, in which a place v of F splits completely if and only if the character is trivial on F_v^×; in particular F′ is totally real when F is and the character is trivial at the real places. This is the existing Layer 12 contract of Tau Ceti's ClassFieldTheory roadmap (with Layer 11 for reciprocity), not a new declaration.

**Needed by:** `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`.

**Recorded status:** open.

### Part R22.1, request 24: `SerreWeightAndLevelOptimisation:R20.6`

For R22.5/alpha-beta-from-modularity-over-q at the small primes: (a) p = 2: a modular ρ̄ of non-solvable image arises from S₂(Γ₁(N)) with N odd when k(ρ̄) = 2, and from a weight-two form of level with 2-adic valuation at most 1 when k(ρ̄) = 4 (R20.5's Buzzard nodes and the dyadic rows of R20.6/strong-form-case-table); (b) p = 3: removal of the 3-part of the level and weight two at level 3N when N ≤ 3, where R20.4/weight-two-at-level-n-ell requires ℓ > 3 or N > 3 (enlarging N by an auxiliary prime is allowed, since only some level prime to p is needed).

**Needed by:** `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`.

**Recorded status:** open.

### Part R22.1, request 25: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

For R22.1/allowable-base-change-existence, clause (5): a finite Galois extension D/F of number fields has infinitely many places of F that split completely (the Chebotarev density theorem for the trivial class). This is the existing Layer 10 contract of Tau Ceti's Chebotarev roadmap.

**Needed by:** `GL2ModularityLifting:R22.1/allowable-base-change-existence`.

**Recorded status:** open.

### Part R32.3, request 1: `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`

Tung §5 Lemma 5.3.2 and §8 Theorem 8.0.1, with finite type-specialized modules and the ordinary §7.3.1 plus nonordinary §6.3.7 component cases. For Pan, Theorem 4.1.7: localized pseudo-ring→Hecke surjection has nilpotent kernel at Definition 4.1.4 nice primes, including the local p=3 exclusion; §§4.2–4.8 construct the one-dimensional-prime patching and finite faithful multiplicity module. Keep the raw completed homology nonfinite and use Corollary 3.5.10 to justify finite-module support. Supply Pan §8 only with its explicit residual-modularity hypothesis.

**Needed by:** `GL2ModularityLifting:R32.3/typed-component-specialisation`; `GL2ModularityLifting:R32.4/nice-prime-component-bridge`; `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

### Part R32.3, request 2: `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`

Pan Theorem 3.5.5: equality of Galois and spectral local pseudo-ring actions; Corollary 3.5.10: the block multiplicity module is finite faithful over completed Hecke and Hecke is finite over the local pseudo ring; Corollary 3.5.12: regular de Rham points locally absolutely irreducible at every p-place are classical. Preserve residual block restrictions and determinant/central-character normalization.

**Needed by:** `GL2ModularityLifting:R32.4/nice-prime-component-bridge`; `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

### Part R32.3, request 3: `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`

Pan §§3.3,3.7,4.1 completed Hecke quotient, determinant-fixed pseudo-character, p-power tame characters and the nonzero Eisenstein localization after ordinary modular seed points. Tung §4.2 Hecke Galois representation with fixed ψε determinant. Export Pan §4.1.3 pro-modularity for q in Spec R^{ps,{ξ_v}} as occurrence in the image of Spec T_m, equivalently ker(R^{ps,{ξ_v}}→T_m)⊆q; include specialization closure of this closed image. This does not identify it with SW R21.4/pro-modular-prime, whose carrier is a different ordinary representation-deformation problem.

**Needed by:** `GL2ModularityLifting:R32.4/nice-prime`; `GL2ModularityLifting:R32.4/potentially-nice-base-change`; `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

### Part R32.3, request 4: `CompletedCohomologyAndLocalGlobalCompatibility:R31.2`

Tung Lemma 5.3.2’s type-specialization/finite-level comparison and faithful algebraic quaternionic module; Pan’s classicality comparison with the actual regular algebraic eigenform objects.

**Needed by:** `GL2ModularityLifting:R32.3/typed-component-specialisation`.

### Part R32.3, request 5: `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`

Source-independence audit of Tung suitable globalizations: Lemma 4.3.3→Calegari Prop.3.2, Snowden Prop.8.2.1 and KW II Thm.6.1 (dyadic local HBAV construction); Lemma 4.3.4→Paškūnas Lemma 3.29 and KW II Lemma 3.5. Also certify the CEG+16/Emerton–Paškūnas patching and BLGG13 A.4.1 inputs of part 1, and Emerton Thm.3.3.22’s restricted CM-induced globalisation. Record full-Serre uses in Pan Remark 8.0.4 and Emerton §7.3 as excluded paths, not independent inputs.

**Needed by:** `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`; `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`; `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

### Part R32.3, request 6: `GlobalGaloisDeformations:R04.1`

The actual Pan determinant-fixed continuous two-dimensional pseudodeformation functor lifting 1+χ̄, with the tame inertia trace condition ξ_v+ξ_v^{-1}; do not identify it with unframed representation deformations at a reducible residual point.

**Needed by:** `GL2ModularityLifting:R32.4/nice-prime`.

### Part R32.3, request 7: `GlobalGaloisDeformations:R04.2`

Representability of that global pseudo functor; Pan §2 Corollaries 2.2.3 and 2.3.7: comparison at irreducible characteristic-zero points and at one-dimensional nonsplit-lattice primes, completions, dimension and minimal-prime contraction. Supply characteristic-zero extension deformation R_B and its trace map, plus the height ≤1 comparison for Pan Remark 2.4.3/Lemma 7.4.23.

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/extension-component-control`; `GL2ModularityLifting:R32.4/extension-components`; `GL2ModularityLifting:R32.4/large-component-at-regular-point`; `GL2ModularityLifting:R32.4/nice-prime`; `GL2ModularityLifting:R32.4/potentially-nice-prime`.

### Part R32.3, request 8: `GlobalGaloisDeformations:R04.3`

Euler-characteristic presentations and local-problem comparisons at Pan §§7.1,7.4 nonsplit extension points; exact reducible-locus bound dim R_B^{red}≤1+δ_F+dim H¹, and finite-order away-p inertia characters in Lemma 5.7.3. Here the reducible locus is not the ring’s nilradical reduction. Supply the trace-cut prime selection used in Pan §7.2.4 and the proof of Corollary 7.4.22: in the indicated component or component intersection, impose ϖ and the |S\Σ_p| away-p Frobenius-trace equations, track their dimension loss, exclude the reducible locus using d>|S\Σ_p|+2, and find a dimension-one characteristic-p prime with irreducible associated representation and finite local images away from p. The proof in an intersection of dimension at least 2d does not require that intersection to be an ordinary component finite over Λ_F.

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/extension-component-control`; `GL2ModularityLifting:R32.4/large-component-at-regular-point`; `GL2ModularityLifting:R32.4/potentially-nice-base-change`; `GL2ModularityLifting:R32.4/extension-component-propagation`.

### Part R32.3, request 9: `GlobalGaloisDeformations:R04.4`

Solvable field selection/restriction in Tung Theorem 8.0.3 and Pan §§7.1.2,7.2.5,7.4.2: preserve p splitting and total reality, attain even degree, kill designated finite away-p images, keep generic irreducibility and the dihedral cyclotomic disjointness used in Pan §5.7.9; allow one extension for a finite component chain. Supply nonsolvable residual-image preservation for an arbitrary totally real base field F and finite solvable Galois F′/F: the restricted image is normal with solvable quotient, so a solvable restricted image would force the original image solvable. The existing R32.1/non-solvable-residual-image statement over Q does not supply this generality.

**Needed by:** `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`; `GL2ModularityLifting:R32.4/potentially-nice-base-change`; `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`.

### Part R32.3, request 10: `IntegralHeckeAndGaloisDeterminants:IHG.1`

Generic two-dimensional determinant/pseudo-character equivalence for p odd, semisimple reconstruction at residue fields, GMA for the globally multiplicity-free odd residual characters 1,χ̄, reducibility ideal generated by off-diagonal products, and normalized nonsplit lattices. Existing cayley-hamilton nodes cover the algebra but do not yet give Pan §2’s full reducibility ideal/completion/height ≤1 export. Scalar LOCAL pairs require the separate local pseudo-ring treatment, not a multiplicity-free GMA assumption.

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/extension-components`; `GL2ModularityLifting:R32.4/nice-prime`; `GL2ModularityLifting:R32.4/potentially-nice-prime`.

### Part R32.3, request 11: `LocalGaloisDeformationRings:R08.6`

Exact Pan local pseudo-ring case table: generic ordinary ideal principal (Paškūnas B.20); scalar ring 𝒪[[t₁,t₂,t₃]] and finite chosen-character ordinary cover 𝒪[[x₁,x₂]] with three-generator comparison kernel; cyclotomic p≥5 node 𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀), ordinary ideal (x₀,x₁), and localized principality away from the ε^{±1} singular point (Pan 7.4.4,7.4.12).

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/generic-ordinary-intersection`; `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

### Part R32.3, request 12: `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`

Pan §5.1.1 reducible local pseudo quotient and Λ_F-character map; §6.1.1 chosen-character ψ₁-ordinary cover for scalar local residual ratio, keeping the chosen character and ordinary orientation. Import generic pseudo/reducibility objects from their owners.

**Needed by:** `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

### Part R32.3, request 13: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`

Pan Theorems 5.1.2(1),6.1.2(1): finite Λ_F-algebra ordinary pseudo rings, including the scalar chosen-character cover; arithmetic-point density with degree enlargement and Leopoldt for abelian F; the ordinary orientation and connectedness used in §7.4. Existing SW99 finite/support nodes do not supply these exact scalar and arbitrary-orientation extensions.

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/generic-ordinary-intersection`; `GL2ModularityLifting:R32.4/good-component`; `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

### Part R32.3, request 14: `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`

Pan Theorems 5.1.2(2),6.1.2(2) over abelian totally real F with p unramified, χ̄ extending to G_Q, χ totally odd de Rham, global irreducibility and local de Rham stable character strictly below the quotient in Pan’s convention. Export both distinguished and scalar local residual cases; the scalar theorem requires the chosen-character cover.

**Needed by:** `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`; `GL2ModularityLifting:R32.4/generic-ordinary-intersection`; `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`; `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

### Part R32.3, request 15: `ArithmeticGaloisDuality:R02.6`

Global Euler characteristic for ad⁰ρ and nonsplit extensions; Pan Lemma 7.4.15’s exact H¹ restriction isomorphism of dimension [F:Q] for ψ₁/ψ₂=εθ, including Poitou–Tate, Lichtenbaum H²(E/O(2)) vanishing and passage from p-places to finite S. The extra-S deduction must be proved, not assumed.

**Needed by:** `GL2ModularityLifting:R32.4/extension-component-control`; `GL2ModularityLifting:R32.4/large-component-at-regular-point`.

### Part R32.3, request 16: `DeformationAndDerivedPatchingAlgebra:R03.6`

Pan Proposition 5.4.7’s connectedness-dimension bound for completed local rings presented with g variables and r relations, including localization/completion comparison and the bound c≥2[F:Q]−1 used in §7.4. Read the supplied R03.6/P7 packets: ordinary finite-support/near-faithful quotient nodes are reused, while no matching connectedness theorem is present. P7’s derived residual Nakayama concerns pseudo-coherent complexes and is not a substitute for a nonfinite completed module. The same presentation/connectedness export is also needed for Pan Lemma 7.4.8 at the irreducible ordinary prime, not only for the extension-ring case.

**Needed by:** `GL2ModularityLifting:R32.4/extension-component-control`; `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`.

### Part R32.3, request 17: `SerreWeightAndLevelOptimisation:R20.6`

Source-independence/weight-change export for Gee Theorem 4.4.12 used in Kisin’s proof and Emerton §7.4’s restricted CM-induced residual representation; distinguish the weight part for an already modular representation from full Serre modularity.

**Needed by:** `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

### Part R32.3, request 18: `ArithmeticGaloisRepresentations:R01.1`

Continuous finite-coefficient characters and Teichmüller lifts, invariant lattices and residual semisimplification, restrictions, finite-order twists and coefficient extension, with determinant formulas and generic irreducibility checks.

**Needed by:** `GL2ModularityLifting:R32.4/nice-prime`; `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`; `GL2ModularityLifting:R32.4/potentially-nice-prime`; `GL2ModularityLifting:R32.5/ordinary-character-normalisation`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`; `GL2ModularityLifting:R32.6/transfer-ordinary-three`.

### Part R32.3, request 19: `ArithmeticGaloisRepresentations:R01.2`

Geometric G_Q characters finitely ramified and de Rham are finite-order times cyclotomic powers; twist shifts Hodge–Tate weights uniformly and gives the normalized modular weight. A finite-order quotient-character normalization has weight zero and preserves oddness.

**Needed by:** `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`; `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`; `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`; `GL2ModularityLifting:R32.5/ordinary-character-normalisation`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

### Part R32.3, request 20: `ArithmeticGaloisRepresentations:R01.5`

Good Frobenius characteristic-polynomial recognition for semisimple members after common coefficient extension; use it separately from the R24.6 transfer node that already consumes this packet, so the graph is acyclic.

**Needed by:** `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`; `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

### Part R32.3, request 21: `PadicHodgeTheory:R06.3`

p-adic monodromy: a de Rham representation over a finite p-adic coefficient field is potentially semistable, preserving its Hodge–Tate weights; this permits the de Rham forms of Tung/Pan. No crystalline conclusion is inferred.

**Needed by:** `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`; `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`; `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

### Part R32.3, request 22: `AutomorphicGaloisRepresentations:R19.3`

The characteristic-zero compatible system attached to a cuspidal newform with common coefficient field, good Frobenius polynomials, oddness and the regular weight/twist convention. Memberwise recognition comes from R01.5.

**Needed by:** `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`; `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

### Part R32.3, request 23: `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Jacquet–Langlands from the definite quaternionic eigenforms at the specified local types to regular algebraic cuspidal GL2/F forms.

**Needed by:** `GL2ModularityLifting:R32.3/typed-component-specialisation`; `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

### Part R32.3, request 24: `GL2AutomorphicRepresentationsAndTransfer:R17.4`

Solvable automorphic base change and descent for these irreducible GL2 representations, including the coefficient/twist convention; used to descend the exact auxiliary-field forms in Tung/Pan.

**Needed by:** `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`; `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`; `GL2ModularityLifting:R32.4/potentially-nice-base-change`.

### Part R32.3, request 25: `PadicHodgeTheory:R06.2`

Coefficient-extension and Hodge–Tate-weight comparison for Pan Corollary 4.1.8→3.5.12 over F_v=Q_p: an irreducible two-dimensional de Rham representation of G_Qp with distinct Hodge–Tate weights is absolutely irreducible. If it split after finite coefficient extension, irreducibility over the original field would make its two characters conjugate, hence of equal integer Hodge–Tate weight. Preserve the exact weights and coefficient descent; do not silently replace irreducible by absolutely irreducible.

**Needed by:** `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

### Part R32.3, request 26: `PotentialModularityAndCompatibleSystems:R24.5`

An explicit comparison/extension of the existing historical KW compatible-system carrier by DP Definition 1.10 clauses (4)–(5): every coefficient-prime member is de Rham with the common regular weights {0,k−1}, k>1. Keep the weakened clause (6) at a ramified residually reducible coefficient prime. Export the extra hypotheses as data or separately assumed predicates; do not infer them from the KW almost-strict label and do not assert general system existence from the disputed DP Theorem 1.11.

**Needed by:** `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`; `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.
