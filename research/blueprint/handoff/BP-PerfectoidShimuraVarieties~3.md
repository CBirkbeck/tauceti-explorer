# BP-PerfectoidShimuraVarieties~3 — revision round 3 (handoff)

Claude (session `claude-A3o6FK`), 14 October 2026. Refs #9311. This is a complete revision: the packet's status is `complete` and it goes to its independent review. The `review` object of REV-PerfectoidShimuraVarieties~2 is left in place for the next reviewer to replace.

Deliverables: `research/blueprint/packets/PerfectoidShimuraVarieties.json`, `research/blueprint/readmes/PerfectoidShimuraVarieties.md`, `research/blueprint/suggested/PerfectoidShimuraVarieties.lean` and this note.

## What the review asked, and what this round did

REV-PerfectoidShimuraVarieties~2 (needs_changes) gave two reasons: the suggested file did not cover the packet's geometric definitions, APIs, tests and named theorems (Protocol §13), and eight S6 proof interfaces could not be verified against suppliers.

**Suggested file.** Since that review the maintainer fixed the shape of a roadmap (WORKERS.md and PACKAGE_REVIEW.md, 2026-10-12). The file states and does not develop. It keeps only light real-bodied definitions over carriers that exist at the pins, plus statements and examples about them. A statement whose carriers are not at the pins is a README target, never a Lean declaration. This round therefore does not add signatures over invented geometric carriers. Instead:
- Six definitions whose data was `sorry` now have real bodies or became theorems:
  - `similitude` has a body (via `Classical.choose`);
  - `levelGamma_normal` and `levelGamma1_normal_in_levelGamma0` became theorems;
  - `levelGamma0QuotGamma1` became an existence theorem;
  - `infiniteLevel_reindex` is now Mathlib's `Functor.Initial.limitIso`;
  - `lovering_id` has explicit maps.
- `scripts/check_sorry_data.py` now passes on the file.
- The repaired proof of Boxer–Pilloni Lemma 4.6.20 is stated as a group-theoretic milestone, `TauCeti.AnalyticLevelGroup.doubleCoset_inf_parabolic`, with a negative-control example.
- The header states the shape.
- The file closes with an index that names every remaining packet name under its node. The index lists 111 API items, 82 checks and all 71 theorem targets.
- The reader's "Suggested-file ledger" is regenerated from the same classification. For each definition or construction it says which names are in the file and which are README targets.
- In total, 63 of 174 API items and 27 of 109 checks are stated in the file.

**The eight S6 interfaces.**
- *kummer-to-v-bridge, general-toroidal-period-map, integral-levi-reduction.* RT-AREA-padic-1/4 assigns the log-to-v passage to S6. So does HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction, which says the comparison with the tower and its triviality "belong to PerfectoidShimuraVarieties:S6". The request to T6:comparison was therefore misdirected, and it is removed. The new lemma `S6/log-to-v-comparison` plans the passage:
  - (i) The toroidal tower is a pro-finite Kummer étale torsor under the effective deck group.
  - (ii) Completed log affinoid perfectoid objects map to the tower diamond.
  - (iii) They give a v-cover. The proof uses T6's log-perfectoid basis, its saturation and four-point lemmas, and D4's criteria.
  - (iv) Density of the interior in fibre products, so that maps into a separated v-sheaf descend.

  The bridge is rewritten around this lemma:
  - The central kernel acts trivially, because W_p is defined from the tower for representations of G^c.
  - Frames on log affinoid perfectoid objects give maps to FL^◇. These descend by the sheaf property, so no effective descent of analytic torsors is needed.
  - P_HT(S) is defined as a fibre product.

  One narrow gap remains, owned by S6: universal openness of the completed charts over the tower diamond, which is used only for density in (iv). It replaces the old broad gap "Effective deck groups and the logarithmic-to-v torsor bridge".
- *bruhat-levi-reduction, toroidal-hecke-correspondences.* Boxer–Pilloni §3.3 had no owner. It is now planned in S6 by `S6/bruhat-level-groups` and `S6/bruhat-cell-tubes`:
  - the analytic level groups G_{m,n} and G¹_{m,n};
  - strong Iwahori decompositions, including the general case the source leaves to the reader, proved via the big cell and the valued commutator estimates;
  - the normalisation lemma;
  - the unique root factorisation of wK_p𝒢¹_{m,n}w⁻¹ for K_p with an Iwahori decomposition (part (5));
  - tubes as orbits, and finite translates.

  The false step of Lemma 4.6.20 (E41) is replaced by a complete argument in toroidal-hecke-correspondences. With H = (H ∩ P)(H ∩ Ū) in both orders, k t′ k′ ∈ P forces k′_Ū = t′⁻¹k_Ū⁻¹t′, so k t′ k′ = k_P t′ k′_P. E41's `correction` field now points there. The ownerless §3.3 gap is closed.
- *abelian-auxiliary-data, torsor-fibre-product, abelian-torsor-descent.* No supplier has these yet; the supplier sweep found no Lovering B₁ node in any packet. They remain precise requests:
  - ShimuraData:D4 (tier 12): Lovering's B₁ and the G^c/Levi fibre-product identity.
  - AutomorphicBundles:B3.general: boundary inertia and descent through ramified toroidal quotients.

  These are the remaining reasons a reviewer may mark those nodes unverifiable.

**Upstream-tier correction (new in this round).** Seven S1 nodes cited TorsionCohomologyInfrastructure:TC.0. That roadmap is upstream tier 18 and has no plan; this roadmap is tier 17, and `upstream/CaraianiNewton.md` lists "move down: TorsionCohomologyInfrastructure (7)". The content therefore moved down into S1 as five new nodes, from Scholze's torsion paper (published Annals version):
- `S1/perfectoid-hebbarkeitssatz` (§2.3.1, Proposition 2.3.2, Lemma 2.3.4);
- `S1/hasse-locus-hebbarkeitssatz` (Corollary 2.3.5, Lemma 2.3.6);
- `S1/good-triple` (Definition 2.3.8, with API and four checks);
- `S1/good-triple-stability` (Lemmas 2.3.9–2.3.11, Corollary 2.3.12);
- `S1/hasse-blowup-hartogs` (Proposition 3.2.9 via SchemeAndStackFoundations SF.0/coherent-hartogs and SF.4/serre-normality-criterion, plus Lemma 3.2.10).

The TC.0 request is removed, and the seven consumers cite the new nodes. **Move record:** TorsionCohomologyInfrastructure TC.0 should import these five nodes from PerfectoidShimuraVarieties:S1 rather than plan them.

**Reviewer's in-place corrections.** I re-read the seventeen field corrections and kept them all. I spot-checked two:
- the Hilbert β₁ nonsurjectivity test (image of order 2 in 𝔽₉^×, which has order 8);
- the p = 2, m = 1 whole-fibre case ((ℤ/2)^× is trivial).

The GSp₄ fan witness is verified by `decide` in the file.

## Counts and status

- **Nodes.** 98 (90 retained with their ids, 8 added with `addedBy`): 5 definitions, 22 constructions, 55 theorems, 8 comparisons, 8 lemmas.
- **API, checks, planets.** 174 API items, 109 checks, 28 planets. The new planet is "Tubes of Bruhat cells" in S6.
- **Stages.** All eight are `planned`; none is `closed`.
- **Gaps (6).**
  - perfectoidization of integral algebras (Bhatt–Scholze 10.11);
  - Scholze Lemma 3.2.35 for general ε;
  - openness of completed log charts (new and narrow);
  - Lovering's auxiliary datum with its Levi identity;
  - torsor descent through ramified toroidal quotients;
  - the p = 2 modified-model estimate.
- **Requests (13).** The TC.0 and T6:comparison requests are removed.
- **Prerequisites.** All 189 old and all new foreign prerequisites resolve (no dangling ids). The exact prerequisite traversal visits 2,291 nodes and finds no cycle. The new cross-roadmap edges add no strongly connected component at stage level: atlas requires and stageEdges plus this packet's induced edges, compared with the old packet.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/PerfectoidShimuraVarieties.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/PerfectoidShimuraVarieties.lean` at the pinned shared build (Mathlib 082e2d3, Tau Ceti f790474): exit 0. The only warnings are the 109 "declaration uses sorry". The file has 1,147 lines.
- `python3 scripts/check_sorry_data.py` on the suggested file: no offenders.
- Reader:
  - The reader is rendered from the packet by a renderer that reproduces all 90 old node sections, the stage headers, gaps and requests byte-for-byte from the old packet.
  - Hand-written sections were edited: coverage, ledger (generated), ownership.
  - No packet statement or proof step is missing from the reader.
- Forbidden words: none added (the one "later" in the reader and the occurrences in old review notes predate this round). No `sorry` appears in the packet or the reader.
- `research/blueprint/intake.py check-files` on the four deliverables: 0 problems. `git diff --check`: clean.
- A Sonnet cross-check covered the new and changed nodes. It checked internal part references, source labels against the extracted PDF pages, Lean index coverage and reader agreement. It found no dangling reference and no wrong locator in the new nodes. Its three points were fixed: the enumerated parts of good-triple-stability (b), part (5) of bruhat-level-groups for the K_p factor, and a reverse reference in log-to-v-comparison's hypotheses.

## Sources read in this round

All sources were read on 2026-10-14, and the packet's `readSections` record each one:
- Scholze, torsion paper (published Annals PDF, sha256 ebac854f…, hash agrees with the packet): §2.3 pp. 958–970, and §3.2.2 pp. 980–983.
- Boxer–Pilloni, Higher Coleman theory, arXiv v1 (sha256 85526b90…): §3.3 pp. 37–41.
- Boxer–Pilloni, revised manuscript (sha256 d340c9a0…):
  - §3.3 pp. 38–43;
  - §4.4.38–4.4.40 pp. 79–80;
  - §4.6.1 p. 90;
  - Proposition 4.6.19 and Lemma 4.6.20, pp. 97–99.

No source passage was copied into the repository.

## For the next reviewer and the maintainer

- The remaining S6 inputs are external: ShimuraData D4 (Lovering's B₁ and its Levi identity) and AutomorphicBundles B3.general (boundary inertia). The S6-owned openness statement could also be planned generally in HodgeTateAndCanonicalSubgroups T6:log-sites, if that roadmap takes it.
- HigherHidaAndColemanTheory (not yet designed) should import Boxer–Pilloni §3.3 from S6/bruhat-level-groups and S6/bruhat-cell-tubes. OverconvergentAutomorphicForms O8 already consumes bruhat-levi-reduction.
- `upstream/CaraianiNewton.md` lists HodgeTateAndCanonicalSubgroups (tier 16) with five citations to this roadmap, and CohomologyComparisons (tier 14) with two. Those moves concern their packets, not this one.
