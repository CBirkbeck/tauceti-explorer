# Independent review: EDC.5, the early perverse category and intermediate extension

Job `REV-EtaleDualityAndPerverseSheaves--EDC.5`, [issue #9380](https://github.com/CBirkbeck/tauceti-explorer/issues/9380).
Reviewer: Claude (session claude-cIgQD1), 2026-10-13. This session wrote none of the plan under review
(`BP-EtaleDualityAndPerverseSheaves--EDC.5`, session claude-4vCUBq, #9409/#9443) and none of the earlier
EDC.4-part draft.

**Verdict: accepted.** Every error found had a clear fix, and the fixes are applied in the packet, the reader and the
suggested file. One target was stated falsely (the natural-truncation form of Deligne's formula without its degree
condition). One definition was too weak to give its conclusion (smallness without the semismall inequality on the dense
stratum). After correction no contradiction remains. The open items are supplier requests, gaps owned elsewhere and
lemma-level refinement, all recorded precisely.

## What was checked

- **Sources, at every locator.** The sources were the same files the packet records, with matching SHA-256 hashes:
  - BBD, *Faisceaux pervers*, Numdam scan, sha256 `b1e10440…`. Read in the OCR text: §§1.3–1.4, 2.1–2.2, 3.3, 4.0–4.3.
    The pages that decide a statement were read on page images: p.55–56 (1.4.23–1.4.26), p.59–61 (2.1.7–2.1.11),
    p.68 (2.2.3–2.2.5), p.103 (4.1.2–4.1.5) and p.112–113 (4.2.8–4.3.4).
  - de Cataldo–Migliorini, arXiv:0712.0349v2, §4.2, p.56.
  - Juteau, arXiv:0901.3671v1, §1.1 (1.2)–(1.9) and §1.3.
  - Stacks Project tags 04DY (Theorem 59.45.2) and 0BQI (Lemma 58.10.7), fetched 2026-10-13.

  No verbatim excerpt is in the packet, and none was added.
- **Baseline.** All 19 `baseline.declarations` were re-read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, in the
  shared pinned build. Each exists under the cited name and namespace and provides what its nodes use: `TStructure`,
  `heart` (no abelian instance at the pin), `truncLE`/`truncGE`, `bounded`, `AbelianSubcategory.abelian` (which needs
  `IsTriangulated`, negative-shift Hom vanishing and admissibility), `Abelian.image`, `Adjunction`, `IsHomological`,
  `Functor.IsTriangulated`, `IsTriangulated`, `Simple`, `IsArtinianObject`, `IsNoetherianObject`,
  `DerivedCategory.TStructure.t`, `DerivedCategory.homologyFunctor`, `topologicalKrullDim`, `closure` and `Specializes`.
  None was removed or replaced.
- **Duplication.** Searches found no t-structure hearts, recollement or perverse sheaves in Tau Ceti, in the current
  TauCetiRoadmap checkout or in the reviewed audit (`data/library-coverage.json`, verdict "not built").
- **Suppliers.**
  - The 19 cross-roadmap EDC.0–EDC.3 node ids all resolve to nodes of the accepted EDC.0 packet. Each statement was read
    against its use.
  - `SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits` sits in a packet whose review is `needs_changes` for
    unrelated nodes. Its part (3), étale cohomology of a qcqs scheme commuting with filtered colimits, is exactly what
    the enlarged-costalk argument uses.
  - The five SF.2 requests are precise.
- **Stage targets.** Every target of the EDC.5 stage text is realised: the t-structure, abelian heart, perverse
  cohomology, recollement, L[d], j_!* with the no-sub/quotient characterisation, IC independent of the open, self-duality
  and the IC duality formula, finite/smooth/affine exactness, Artin vanishing, p⁺ by a torsion pair, and the enlarged
  criterion for IG.4.
- **Requests addressed to EDC.5 by other packets.** Every packet was scanned. GS0, HodgeStructuresPartII H.5, IG, LPV.0,
  LPV.7 and GlobalShtukas each ask something of EDC.5; each request is supplied or recorded as a gap. The GS0 part that
  is not supplied is now a gap (below).
- **Red-team findings.** RT-AREA-etale/3 (stacks) and /16 (perfect schemes, equivariant coefficients, hyperbolic
  localization) are handled by the two gaps and the restructure entry, consistently with EDC.0's Part II proposals. The
  in-scope PAPER-ZHU-17 item on stratified semismall maps is planned by `semismall-pushforward-perversity`.
- **Granularity, API, tests and planets.**
  - Target level is respected; no node needs splitting.
  - Every definition and construction has at least three tests, at least one of them able to fail a plausible wrong
    definition.
  - The six planets are key notions, named from the source.

## Counts

29 nodes: 15 verified, 14 corrected, 0 added; 16 theorems, 7 constructions, 6 definitions. 119 API items (2 added), 64
unit tests (one replaced, three restated), 6 planets, 19 baseline declarations (all confirmed), 5 requests and 7 gaps (1
added). Packet status `complete`; stage EDC.5 `planned`. `python3 scripts/check_blueprint.py`: 0 errors, 0 warnings.

## Corrections

1. **`deligne-truncation-formula` — false statement.** The node said j_!*A ≅ τ_{≤−d−1}Rj_*A for the natural truncation
   of X, given only local constancy along the smooth boundary F. BBD (2.2.4.1)–(2.2.4.3) (p.68, page image) are
   truncations τ^F *relative to F* (BBD 1.4.13), obtained from (2.2.3.1). The absolute truncation agrees with the
   relative one only when A ∈ D^{≤−d−1}(U). Without that, the statement fails: for 𝔾_m ⊂ 𝔸¹ and A a skyscraper at 1,
   j_!*A ≠ 0 = τ_{≤−1}Rj_*A, which is the packet's own test `not_unrestricted_standard_truncation`. The iterated form of
   BBD 2.1.11 has A ∈ D^{≤k}(U_k) built in, because the perversity on U_k is ≤ k. Rewritten:
   - the statement and hypotheses now give the relative form, the absolute form under the degree condition, and the
     iterated form;
   - the proof steps and both source matches were changed to match;
   - an acceptance check was added.

   The consumers in this packet (curves, the normal-crossings case for H.5, IC of curves) satisfy the condition. The
   test in `perverse-intermediate-extension` was reworded to match.
2. **`small-pushforward-intersection-complex` — too weak a definition.** "Small" required only the strict inequalities
   off the dense stratum Y_0, which does not imply semismall. With the one-stratum partition Y_0 = 𝔸², the blow-up of a
   point is finite étale over 𝔸² ∖ 0 and satisfies the condition vacuously, and Rf_*Λ[2] is not IC. As in
   de Cataldo–Migliorini Remark 4.2.4, smallness now includes the semismall inequality on every stratum, so f is finite
   over Y_0. The proof now also covers the points of Y_0 ∖ V.
3. **`fibre-dimension-perverse-amplitude` — reversed inequality.** The f^* step wrote −dim f(x) ≥ −dim(x) + d. The
   correct inequality is −dim f(x) ≤ d − dim(x), and the step now says it proves (4.0.1) for f^*K[d]. The
   compact-support count used for Rf_! with general Λ (2δ ≤ d − q − dim y) is now written out.
4. **`semismall-pushforward-perversity` — reversed inequality.** The support step wrote −dim Y_β ≥ −dim(y). The correct
   inequality is ≤, since y ∈ Y_β. The theorem itself is right. Its cosupport half is valid under the stated hypothesis
   that i_α^*K and i_α^*D_XK are locally constant (by duality); this answers the costalk objection REV-…EDC.4~3 raised
   against the earlier draft.
5. **`enlarged-perversity-conditions` — vacuous non-example.** `not_perverseGEExt_colimit_unbounded` used a system that
   lies in no single perverseGEExt a, so it showed nothing. In fact the costalk condition forces
   K ∈ D^{≥a−dim X} (pointwise form of BBD's remark after 2.1.2, p.56): the lowest cohomology sheaf is seen by the
   costalk at a generic point of the support of one of its sections. So the uniform lower bound in (c) is automatic.
   Changes:
   - (c) now states the bound, with its proof;
   - API item `perverseGEExt_isGE` added, and `perverseGEExt_colimit` adjusted;
   - the test was replaced by `not_perverseGEExt_lowerShriek_open`: j_!Λ[2] for 𝔸² ∖ 0 ⊂ 𝔸² has costalk Λ[1] ⊕ Λ(−2)[−2]
     at the origin, so (d) rightly lists Rj_* and not j_!.
6. **`external-product-t-exact`.**
   - IC_{X₁}(L₁) ⊠ IC_{X₂}(L₂) ≅ IC_{X₁×X₂}(L₁ ⊠ L₂) now assumes X₁ ×_k X₂ irreducible, since IC is defined for
     irreducible schemes.
   - The coefficient non-example said ℤ/ℓ ⊗^L ℤ/ℓ over ℤ/ℓ² lives in degrees −1 and 0. That is the ℤ_ℓ computation;
     over ℤ/ℓ² it has ℤ/ℓ in every degree ≤ 0. Both are now stated.
7. **`recollement-situation`, `middle-perverse-t-structure` — coefficient scope.** The étale recollement was cited from
   `EDC.1:biduality/recollement-adjunctions`, which is stated for self-injective Λ only, while EDC.5 uses it for any
   noetherian Λ killed by n. Both nodes now name where the same data come from in general: `EDC.0/cohomology-with-supports`,
   `EDC.1:adjoint/local-cohomology-identification`, and the finiteness theorem requested from SF.2, with i^! constructible
   by the localization triangle. Prerequisites were added accordingly.
8. **`affine-open-complement-exactness`.** The coefficient hypothesis said "self-injective". It is now aligned with
   `perverse-artin-vanishing`, which proves the left t-exactness of Rj_! for every finite Λ, with the O and E cases
   added.
9. **`simple-perverse-sheaves-classification`.**
   - The O/λ^m finite-length claim rested on an unproved assertion that the λ-graded pieces are O/λ-perverse. It now
     rests on the same noetherian induction (lisse O/λ^m-sheaves have finite length) and on λ being nilpotent, hence
     zero on simple objects.
   - "Its algebraic closure" now points to the ℚ̄_ℓ colimit, with a new prerequisite on the adic node.
10. **`adic-perverse-t-structures`.** Added the ℚ̄_ℓ 2-colimit (BBD 2.2.18, last paragraph) with the API item
    `adicPerverse_algebraicClosure`. The classification above and the EDC.7 consumers use it.
11. **`point-dimension-function`.** The test `pointDim_eq_coheight_compat` restated the definition. It now compares
    with chains of specializations.
12. **`perverse-verdier-self-duality`.** A garbled ℓ-adic hypothesis (a stray trailing clause) was rewritten.

## Other packet changes

- **`supersededDraftNodes`.** It mapped only 20 of the 48 draft EDC.5 nodes held in the EDC.4 packet. The 28 promoted
  API-lemma drafts are now mapped to the node and API item that replace them, so the next EDC.4 round can drop all 48.
- **New gap: "Non-noetherian torsion and derived-complete adic coefficients (GS0 request, partly supplied)".** GS0 asks
  for Fargues–Scholze's coefficient generality. EDC.5 supplies noetherian torsion Λ, the ℓ-adic O/E 2-limit formalism
  and p/p⁺. Non-noetherian and solid ℤ_ℓ-algebra coefficients need the pro-étale formalism; GS0's own gap records the
  same boundary.
- **Source issues.** E16 (BBD 4.1.3 cites 4.1.7 for 4.1.1) and E17 (BBD 4.3.3–4.3.4 cite "1.4.2.5" for 1.4.25) were
  both **confirmed** on the page images (p.103, p.113) and carry review records. The inherited E11 (2.2.12's
  inequalities printed reversed) was seen in the scan as described. No further mistake was found in the sources read.
- **Review object.** Added, with a verdict and note for every node.

## Suggested Lean file

- **`TStructure.TorsionTheory`.** The structure did not require its two classes to be closed under isomorphism. As a
  result the tilted aisles need not be, and the unit tests `tilt_torsion_zero`/`tilt_free_zero` (left open with `sorry`)
  could be false as stated. Two `IsClosedUnderIsomorphisms` fields were added.
- **`Functor.heartFunctorComp`** lacked the triangulated hypotheses that BBD 1.3.17 (iv) uses; they were added.
- **Closing list.** It now names the new API items and the replaced test. A script confirmed that every packet API,
  test and suggested name appears in the file.
- **Compilation.** `lean-check` at Tau Ceti f790474 / Mathlib 082e2d3 reports no errors, and the only warnings are the
  48 for declarations using `sorry`. `scripts/check_sorry_data.py` passes.

## Reader

- The 29 node sections were re-rendered from the corrected packet. A renderer was first shown to reproduce the
  committed sections byte for byte.
- The hand-written sections were updated: counts, the étale-recollement scope, the coefficient table, the 28 new draft
  mappings, the new gap and the E16/E17 verdicts.
- The reader says nothing the corrected packet contradicts.

## Questions for the orchestrator

1. The EDC.4 packet still holds the 48 draft EDC.5 nodes, and EDC.5 is still in its scope. The next EDC.4 round should
   drop them. `supersededDraftNodes` now maps every one.
2. Accepted consumers cite draft ids. They should be repointed using that map:
   - GS0: `intersection-complex`, `perverse-recollement`, `perverse-t-structure`, `affine-perverse-artin-vanishing`,
     `semismall-pushforward-perverse`;
   - IG: `t-exact-functor`, `perverse-t-structure`, `affine-perverse-artin-vanishing`;
   - SF.0: `perverse-t-structure`.
3. HodgeStructuresPartII H.5's request is supplied by `EDC.5/intermediate-extension-low-degree-cohomology`, with the
   local-constancy hypothesis along D ∖ D_sing (automatic for tame sheaves). H.5 can cite that node.
4. The edges SF.2 → EDC.5 and EDC.3 → EDC.5 are new prerequisite edges, the second within this roadmap.
5. `SF.2/cohomology-filtered-colimits` is cited directly while the SF.2 packet is under revision. Its id should stay
   stable.
6. The GS0 coefficient gap needs an owner for perverse t-structures with pro-étale or solid coefficients. The candidates
   are the diamond-side GS1/VS1 layers or a Part II.
