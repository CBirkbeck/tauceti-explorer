# Independent review: Adic coefficients and comparison with schemes

**Verdict: accepted, with corrections made in place.** Job `REV-AdicCoefficientsAndComparisons` (issue #342), reviewer Claude, session `claude-6Svxif`, 6 October 2026. The reviewed blueprint `BP-AdicCoefficientsAndComparisons` was written by Codex (session `codex-YvgtNa`), so this review is independent of it. The packet's `review` object names `independent-review-REV-AdicCoefficientsAndComparisons`.

The packet now has 46 nodes: 5 definitions, 9 constructions and 32 theorems. Of the 45 submitted nodes, 12 are verified and 33 corrected; one node was added and one moved between layers. The packet also has 80 API items, 57 unit tests (all now with a `kind`), 29 planets (at most 6 per layer), 22 baseline declarations (17 confirmed, 5 added), 14 requests (18 before), 8 gaps and 9 source issues (3 before). `python3 scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. The status `complete` and coverage `planned` for every stage L0–L6 are correct after the corrections. All implementation statuses remain `unchecked`.

## What was read

- **Sources.** Every source was downloaded afresh, and every SHA-256 matches the packet:
  - Scholze, *Étale cohomology of diamonds* (ECD): author PDF of 14 April 2026, the same text as arXiv v4. Read: §§26–27 in full; Propositions 11.10, 22.3, 24.4; Definition 23.8; Theorems 1.8–1.13.
  - Bhatt–Scholze arXiv 1309.1198: §3.5 (replete topos standing hypothesis, Lemma 3.5.7), Propositions 5.2.6, 5.3.2 and 6.8.14.
  - Zavyalov arXiv v3, §2.1.
  - Boxer–Pilloni author PDF, §2.1.1 (p. 7).
  - Česnavičius arXiv v4, §4.10.
  - Abe arXiv v2, §1.4.
  - de Jong, Numdam scan: 2.20, 4.1–4.2, 5.8, §6.1–6.5.
  - The 15 cited Stacks tags.
- **Excerpts.** A script compared every excerpt with the source text after NFKC normalisation and whitespace removal; all are verbatim. Twenty were too short or ambiguous to check anything ("Gm", "proper", "for any", "cohomology", "Proposition 6.8.14.", …) and were replaced by informative passages, each re-verified. All 44 boilerplate `match` texts were rewritten to say what the passage supports.
- **Supplier packets.** Two read-only helper passes collected statements, which the reviewer then spot-checked and verified. The packets read were: EnhancedDerivedSheaves--E0, ClassicalAdicEtaleCohomology--H0 and --H4, EtaleDualityAndPerverseSheaves--EDC.0, DiamondsAndVStacks, PerfectoidSpaces--P0, AdicSpacesPartII, SchemeAndStackFoundations, StableReductionPartII and AlgebraicModuliForArithmeticGeometry--A0-extension. For suppliers without packets (C0–C7, S0–S5), the atlas stage texts in `data/atlas.json` were used. Every cited node id was confirmed to exist, and its statement was read.
- **Other inputs.** Also read:
  - the roadmap document and atlas stage texts;
  - the reviewed library audit (AUDIT-18);
  - RS-25 and RS-27;
  - the red-team findings and their verdicts;
  - the 101 `sourceIssues` of PAPER-SCHOLZE-17.

## Baseline

All 17 cited declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and all exist with the stated meaning:
`Scheme.Hom.image`, `Scheme.Hom.toImage_imageι`, `Scheme.kerAdjunction`, `IsSchemeTheoreticallyDominant`, `IsProper`, `LocallyOfFinitePresentation`, `Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation`, `Scheme.smallEtaleTopology`, `ObjectProperty.FullSubcategory`, `TauCeti.ValuationSpectrum.spa`, `spa_antitone`, `spa_integralClosure`, `Scheme.ProEt`, `Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType`, `AffineSpace`, `IsCofiltered` and `conjugateIsoEquiv`.

None was removed. `AffineSpace` serves only the non-proper test, which is harmless.

Five declarations were added (`addedBy` this review):
- `AlgebraicGeometry.isAffineHom_π_app`, `isLimitOpensCone` and `Scheme.compactSpace_of_isLimit`. The node `L2/affine-transition-limit-existence` re-planned these as new work, although Mathlib proves them for any given limit cone; the library audit's L2 entry says the same.
- `exists_map_preimage_eq_map_preimage` (Stacks 01Z4(2)). It gives the strictness descent in `L2/fp-compactification-limit` and the open-inverse-image step of `L2/compactification-property-descent`.
- `CategoryTheory.Sheaf.H`, the native H^q carrier for `L2/etale-cohomology-continuity`.

## Mathematical corrections

1. **`L2/finite-type-fp-factorisation` was false as stated.** It claimed a closed immersion into a finitely presented scheme for every finite-type `f`. A non-quasi-separated finite-type `Y` admits none, and Stacks 32.9.6 assumes `f` separated. The node is restricted to separated `f`, and its proof now follows Stacks 32.9.5 and 32.4.17.
2. **`L2/affine-transition-limit-existence`** is narrowed to existence and quasi-separatedness. Its old only prerequisite, a factorisation lemma, has no bearing on existence.
3. **`L1/mixed-characteristic-scheme-diamond`** repeated ECD's "a functor X ↦ X♢ to diamonds over Spd O". That is false for X = Spec O: Spd Z_p contains Spd F_p = *, which is not a diamond. The node now says X♢ is a small v-sheaf whose structure map to Spd O is representable in locally spatial diamonds (sourceIssue E8, new). Added: API item `SchemeDiamond.overDVR_representable` and test `SchemeDiamond.notDiamond`. The analytification over a perfectoid S♯ is now the node's own step, because AdicSpacesPartII:R1's fibre product needs Huber's noetherian condition.
4. **Equal characteristic.** ECD 27.6 allows any complete DVR with perfect residue field, but its dévissage ("generic fibre p ≠ 0, or else of characteristic p"; "resolution … in characteristic 0") is written for mixed characteristic (sourceIssue E7, new).
   - `L6/…27-6` now splits the dévissage by π.
   - `L5/normal-crossing-local-comparison` now allows finite extensions of K = k((t)). Over such a field, de Jong's Remark 4.2 gives smoothness only over a finite extension, and purely inseparable extensions change neither étale sites nor diamonds.
5. **Layer order.** `L5/semistable-boundary-induction` used `L6/trait-open-comparison`. It is moved to L6 as **`AdicCoefficientsAndComparisons:L6/semistable-boundary-induction`**; the L6 stage text owns the semistable boundary induction. No other packet cites the old id.
6. **Stage cycle.** `L2/scheme-support-extension` and `L2/coefficient-and-unbounded-extension` cited `L0/adic-coefficient-limit`, which is a theorem about v-stacks. L2 already feeds H1, and H1 → H2 → C1 → C2 → L0 is a path in the atlas, so the citation closed a stage cycle. The scheme-side reconstruction is `E4/coefficient-system-reconstruction` on the replete pro-étale topos, and it is now cited instead. A script that adds every induced supplier edge and intra-roadmap edge finds no cycle.
7. **Smaller fixes.**
   - `L2/constructible-derived-continuity` assumed "invertibility as in the source", but Abe's lemma assumes none.
   - `L2/strict-from-dense` needs the *source* ambient to be separated.
   - The Stacks locator of `L2/compactification` was wrong: 0ATT is Section 38.32, not "Definition 38.31.1".
   - Tests `AdicEtale.point` and `SchemeAdic.geometricPoint` now name the completed constant object Rlim Λ/Iⁿ.
8. **Missing target.** L0 states "Derive the adic forms of the introductory theorems with unchanged geometric restrictions", and no node realised it. Added `L0/adic-forms-of-introduction-theorems`: ECD 1.8, 1.9, 1.10 and 1.13 for adic Λ by Remark 26.3, using the corrected Theorem 1.8(iii) (E9).
9. **Roadmap acceptance tests.** The roadmap requires two explicit tests: "a tower with nonzero lim¹" and "an alteration of ℓ-divisible degree". The first is now an acceptance item of `L0/adic-coefficient-limit` (N = ⊕ Z/ℓᵏ, whose ℓ-power-torsion tower is not Mittag-Leffler). The second is an acceptance item of `L5/alteration-hypercover-descent` (z ↦ z^ℓ on P¹ with Λ = Z/ℓ).

## Supplier closure and requests

Protocol §3 requires an exact supplier node wherever one exists. Seventeen stage citations were removed and 41 node citations added:

| Was | Now |
|---|---|
| E4/the-imported-completion-interface (×3) | E4/derived-complete-sheaves; E4/completed-sheaf-tensor, completed-colimits, completed-tensor-hom-adjunction, complete-internal-hom, completed-coefficient-ring; E4/mod-ideal-detection |
| E2/left-completion (L1, L2), which needs a replete topos | E2/postnikov-left-completion |
| E2/hypercovers-and-cohomological-descent (construction only) | + E2/unbounded-hypercover-descent, E3/coherent-diagrams-of-ringed-topoi |
| — | E3/adjoint-functor-theorem-and-localisations (27.3); H5/affine-space-cohomology-from-balls (27.2) |
| EtaleDualityAndPerverseSheaves:EDC.3 (stage) | EDC.3/smooth-pair-purity, fundamental-class, cycle-class-map, gysin-sequence; EDC.2:trace-purity/first-chern-class. The normal-crossing complement computation is in no EDC node and stays in L5 (G-local). |
| ClassicalAdicEtaleCohomology:H1 (stage) | Trait: H1:formal-adic-comparison/stalk-formula-constant-coefficients-3-5-10 and …/scheme-completion-comparison-3-5-13. Normal-crossing analytic charts: no H1 node. The H5 stage text promises them, so H5 is requested; H4/punctured-disc-cohomology covers one parameter. |
| DiamondsAndVStacks:D6 (stage) | D6/etale-site-comparison (Lemma 15.6), D6/gluing-and-the-diamond-functor, D6/untilt-descent-along-v-covers, D2/v-descent-of-functions, D4/small-v-sheaves-and-small-v-stacks. D6 excludes discrete and formal pairs, so the scheme avatars are L1's own work (as the L1 stage text says), and the eligibility of f♢ is L3/L4's own work. |
| PerfectoidSpaces:P1 (stage) | P1/marked-untilt, P1/characteristic-p-perfectoid-iff-perfect |
| AdicSpacesPartII:R1 (stage) | R1/scheme-fibre-product-analytification (for T, which satisfies Huber's condition), R1/analytification-universal-property, R2/noetherian-formal-scheme-as-adic-space, R2/fitting-ideal-invertible-locally-free |

Requests were rebuilt so that every remaining stage prerequisite has exactly one request, and every request's `neededBy` matches the prerequisites.

- **Dropped**, superseded by node ids: D6, P1, R1, EDC.3, H1.
- **Dropped as misdirected:**
  - `AlgebraicModuli…:R09.7a`. Accepted RS-27 narrows it to characteristic-zero marked ideals, and ordinary blow-ups are now requested from `tauceti:TauCetiRoadmap/StableReduction#layer-4-…`.
  - `StableReductionPartII:MC.4`. No node cites it. Its content belongs to SF.4's inputs and is folded into the SF.4 request, together with MC.6 for the pointed stable extension.
  - `DiamondSixOperations:S1`. It covers only maps representable in spatial diamonds of finite dim.trg; the general Rf_! with base change and composition is now requested from S2 (22.13–22.23).
- **Narrowed:**
  - S3 now covers 23.1 and 23.3 only; scalar extension comes from E4.
  - S5 now covers ECD 24.4 only.
  - SF.2 was one bundled need. It is now seven items (a)–(g) with their consumers. "Existing noetherian Rf_! carrier" is corrected to the upstream contract `UPSTREAM:ECD:SCH_SUPPORT_NOETH`, which SF.2 integrates; SF.2 itself has no étale Rf_! node.
- **Moved:** perfection invariance (Stacks 04DY) goes to SF.0, following PAPER-BHATT-SCHOLZE-17 route 1.
- **Added:** S4 (Definition 23.8, 23.12, 23.15, conservativity) and H5 (analytic normal-crossing computations).
- **Removed prerequisites:** the SF.2 prerequisites of `L2/finite-type-fp-factorisation` and `L2/compactification-property-descent` were unjustified.

## Red-team findings handed to the blueprint (item 9a)

- **RT-AREA-algebraicgeometry/16: correct.** SF.4 is the single owner of the alterations, L5 keeps tasks 4–5, and SF.4 → L5 is proposed.
- **RT-AREA-etale/4: correct in substance, with one adjustment.** MC.2/pointed-dm-theorem supplies the pointed DM theorem, while MC.4/finite-projective-cover is unpointed with g ≥ 2. The adjustment is that MC.4 → SF.4 closes the cycle SF.4 → SF.5 → MC.4 → SF.4, until RT-AREA-algebraicgeometry/15's fix removes SF.4 → SF.5. The restructure proposal and G-owners now say so.
- **RT-AREA-etale/15: half wrong.** The L2 half (ABE/A10–A11) is right. But the packet said H1:valuation-nearby-cycles and H1:valuation-exports "supply YZ/A07 and ABE/A14". The confirmed review says "Do not re-mark A14/A07 as fully supplied by H1", so the restructure text is corrected.
- **RT-AREA-etale/17: correct.** L3 → EDC.6 is proposed, and the L3 nodes give 27.1–27.4.
- **RT-AREA-etale/21: defensible.** The packet follows RT-AG/16 and RS-25, which keeps "source-scoped alterations" in SF.4, and this also meets /21's concern that alterations should carry no H1/H5 dependency. The handoff's phrase "contradicts accepted RS-25" overstates the case, because RS-25 never mentions L5. G-owners is reworded.
- **RT-AREA-etale/23: correct.** The packet requests SF.2's BS §4/5.2.6/5.3.2 export and proposes SF.2 → L1.

## Source issues (§18)

- **BP E1–E3: confirmed.** Each was checked on p. 7 of the hashed author PDF. For E2, the review notes that the exceptional divisor already makes Y schematically dense, so the extra closure step is harmless.
- **Added, each with this review's verdict (confirmed):**
  - E4: 27.5 cites 24.4 over the non-analytic Spa(O,O). This is PAPER-SCHOLZE-17/E70; the repair is now the proof of `L4/analytic-test-space`.
  - E5: the unwritten steps of 27.6 (= E71).
  - E6: 27.7's "finite ring" (= E73).
  - E7: equal characteristic in 27.6 (new).
  - E8: "diamonds over Spd O" (new).
  - E9: the domain swap in Theorem 1.8(iii) (= E74).
- **Searches for existing corrections:** the arXiv listing (v4 of 14 April 2026 is the latest) and the PAPER-SCHOLZE-17 errata.

## Library audit, granularity and scope

- **Audit.** Nothing the audit shows as present is still planned. The only audit "partial" in scope is L2's limit API, now cited.
- **Granularity.** Target level, as `detail.json` sets it. Every stage target is realised; the added L0 node closes the one missing target.
- **Scope.** Honest: the enhanced carriers (G-enhancement), the unbounded support bound (G-support), the local calculations (G-local), the punctured trait (G-trait), proper descent and rational lattices are recorded as gaps with precise details.
- **Proposed stage edges.** The packet's own node dependencies need stage edges the atlas lacks: L0 → L1, L2 → L4 and L4 → L5. These are added to the restructure proposal and are acyclic.
- **Splitting L2.** The proposed four-way split of L2 is now motivated: no L2 node may use L0 or L1 while L2 feeds H1.

## Suggested Lean file

The file elaborates with `lean-check` at the pinned Mathlib 082e2d3, with 53 `declaration uses 'sorry'` warnings and nothing else. It imports Mathlib modules only; the shared build's Tau Ceti is not the pinned commit.

Added native signatures:
- `quasiSeparatedSpace_of_isLimit`;
- `fpObjectDescent` (Stacks 01ZM, object clause);
- `stageMap`/`limitMap` with `openImmersion_descends` (0EUU) and `proper_descends` (081F);
- `noetherianApproximation` (01ZA);
- `finiteTypeFPFactorisation` (01ZJ, separated);
- `denseProperty` with `dense_initial` (0ATU(b)).

The four corresponding nodes moved from the inventory to `suggestedLean.nativeNodes`.

The enhanced and diamond signatures stay in the commented inventory. Mathlib has no derived completion, no internal RHom of sheaf complexes and no v-site, so their conditions cannot be stated without Prop-valued fields, which UPSTREAM_GUIDE forbids. The inventory was regenerated from the corrected packet (width 96; the same generator reproduces the original inventory exactly from the original packet). Every packet definition, API and test name appears in the file.

## Reader document: synchronisation needed

`research/blueprint/readmes/AdicCoefficientsAndComparisons.md` is not a deliverable of this review, and it no longer matches the packet. It must be regenerated from the packet, by the assembly job or a follow-up fix.

| Reader section | Packet change |
|---|---|
| L0 | `derived-I-complete-etale-category` statement and test; new node `adic-forms-of-introduction-theorems`; lim¹ acceptance on `adic-coefficient-limit`; prerequisites of the other L0 nodes |
| L1 | statements of `char-p-scheme-diamond-and-comparison-functor` and `mixed-characteristic-scheme-diamond`; new API and test names; E4/E2 suppliers of `scheme-adic-category` |
| L2 | title and statement of `affine-transition-limit-existence`; statement of `finite-type-fp-factorisation`; hypotheses of `compactification`, `strict-from-dense`, `constructible-derived-continuity`; blow-up suppliers of the Cartier and vector-bundle nodes |
| L3–L4 | D6 node ids, eligibility steps, H5/E3 additions; `analytic-test-space` statement and proof |
| L5–L6 | `normal-crossing-local-comparison` statement; `semistable-boundary-induction` moved to L6 under its new id; 27.6 hypotheses; trait proof |
| Requests, gaps, source issues, restructure | all four lists |

## Questions for the orchestrator

1. **Dangling citation in a promoted packet.** The accepted and promoted `AdicSpacesPartII` packet (F1/quasi-algebraic-affinoid-finiteness and F1/dagger-de-rham-finiteness-and-base-change) cites the retired integrated id `AdicCoefficientsAndComparisons:L5/de-jong-6-5-strictly-semistable-alteration`. Once this packet is promoted, that id disappears, and promotion silently skips the edge. Those nodes should cite SF.4's de Jong 6.5 node once SF.4 plans it; until then they should cite the SF.4 stage with a request.
2. **Alteration ownership (G-owners).** It needs a maintainer decision between RT-AREA-algebraicgeometry/16 and RT-AREA-etale/21. The SchemeAndStackFoundations packet declines to plan alterations until then, and the MC.4 → SF.4 input waits on RT-AREA-algebraicgeometry/15.
3. **Noetherian approximation has two routes.** It and EGA IV 8 limit descent are planned in L2 (stage text, RT-AREA-etale/15) and also routed to SF.0/SF.4 by PAPER-BHATT-SCHOLZE-17 route 1. Choose one owner. SF.0 → L2 already exists, so L2 → SF.0 would be cyclic.
4. **Ownership of qcqs Rf_!.** EtaleDualityAndPerverseSheaves--EDC.0 asks SF.2 for Rf_! over qcqs bases, which is the range the L2 stage text claims. That request should be redirected to `L2/scheme-support-extension`.
5. **Proposed stage edges.** Apply L0 → L1, L2 → L4 and L4 → L5 together with the packet's other proposed edges. Consider the L2 split, which the L2 → H1 → … → C2 → L0 path makes structurally necessary.
6. **Unreviewed suppliers.** The supplier packets EnhancedDerivedSheaves--E0 and DiamondsAndVStacks are unreviewed checkpoints, and PerfectoidSpaces--P0 and EtaleDualityAndPerverseSheaves--EDC.0 are not accepted. The node ids cited from them may change when those packets are revised.
