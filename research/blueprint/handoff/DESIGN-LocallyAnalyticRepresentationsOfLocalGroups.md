# Handoff: DESIGN-LocallyAnalyticRepresentationsOfLocalGroups

Worker: Claude (session claude-TZhCcp), 2026-10-19. Issue #3411.

## What was done

New roadmap **LocallyAnalyticRepresentationsOfLocalGroups**, *Locally analytic representations of p-adic reductive groups* (area `representations`, no parent). Deliverables:

- `research/blueprint/roadmaps/LocallyAnalyticRepresentationsOfLocalGroups.json`: ten layers, LR.0–LR.9, each with its targets and its `requires`.
- `research/blueprint/packets/LocallyAnalyticRepresentationsOfLocalGroups.json`: status `complete`, 82 target-level nodes (16 definitions, 25 constructions, 41 theorems).
  - 255 API items, 165 unit tests and 40 planets (at most 6 per layer).
  - 9 Mathlib declarations, read at the pins.
  - 10 requests, 4 gaps, 11 source issues and 4 restructuring proposals.
  - Every stage is `planned`; each `remaining` list names lemma-level refinements only.
- `research/blueprint/readmes/LocallyAnalyticRepresentationsOfLocalGroups.md`: the reader document, about 43,000 words.
  - The introduction, scope and ownership, conventions, exact supplier contracts and layer introductions are written by hand.
  - Each target's section is generated from the packet, so the document and the packet agree.
  - It ends with the downstream contracts, the source corrections, the open inputs and the references.
- `research/blueprint/suggested/LocallyAnalyticRepresentationsOfLocalGroups.lean`: 254 lines, written to the 2026-10-12 shape.
  - Real-bodied light definitions over Mathlib carriers: `IsLocallyAnalyticVector`, `laVectors`, `IsLocallyAnalyticRep` and `IsSmoothVector` for a Lie group (`LieGroup I ω G`) acting on a normed space.
  - `SelfExt.eps` with `SelfExt.eps_sq`.
  - The GL_n conventions `theta`, `thetaParabolic`, `lambdaOfH`, `IsStrictlyDominant`, `IsDominant`, `permuteCharacter`, `IsGeneric` and `constituentLabels`.
  - Ding's dimension counts as natural-number functions (`extPiOneDim`, `extGPrimeDim`, `extWDim`, `extSigmaDim`, `sFPCard`, `extFPDim`), with `decide`-checked examples that pin the conventions (labels I ⊂ {1, …, n}, not {1, …, n−1}).
  - The heavy objects stay in the README as targets, since their carriers are not at the pins: D(G, E) for non-compact G, admissible representations, the Orlik–Strauch functors, J_P, π_alg ⊆ π_1 ⊆ π.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticRepresentationsOfLocalGroups.json`, with `TAUCETI_BASELINE` set to the pinned declaration index: 0 errors, 0 warnings.
- **Lean.** `lean-check` (Mathlib 082e2d3, Tau Ceti f790474) elaborates the suggested file with `sorry` as the only warning: 15 `sorry`s, exit 0.
- **Dry atlas assembly.** `build.assemble` was run with the packet, document and definition injected through a patched `build.load_promoted`, writing nothing.
  - 50 new stages and planets, 113 new stage edges, none removed, no skipped links.
- **Locator check.** Every label-plus-page locator in the node sources was tested against the text of the PDF read, with each source's page offset.
  - 140 labels were checked; all were found on the cited pages.
  - 14 are number-only matches, where French labels are cited in English (Breuil's "Théorème 2.3" cited as "Theorem 2.3", and so on).

## Scope decisions and moves (record for other roadmaps)

**Routes planned here.**
- PAPER-DING-25 route 1: all 33 items, §3.1, in LR.1 and LR.4–LR.9.
- PAPER-DOSPINESCU-LEBRAS-17 route 3: items 89, 91, 92 and the orbit-map item in LR.0–LR.2; item 90, Frommer's theorem, is imported from ND.3/frommer-theorem with DLB's c_h correction recorded as E10.
- PAPER-BREUIL-HELLMANN-SCHRAEN-19 route 6: all 5 items in LR.2, LR.5 and LR.6, including the Remark 5.1.2 obligation (products over different fields) as LR.5/orlik-strauch-products.
- PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 34: all 9 items in LR.3.

**Routes not planned here.**
- PAPER-COLMEZ-DOSPINESCU-NIZIOL-20 route 4 was rejected by its review, so it is not planned; restructure entry 4 says where it would go.
- PAPER-PAN-26 route 11 has no review verdict, so it is not in this issue's scope. Its core (locally analytic vectors, R^iLA, LA-acyclicity, Pan I §2) is planned in LR.2 anyway, because BCGP's brief asks for the derived functor here and no other layer plans it.
  - The Hausdorff LB-space criteria of Pan II §2 and the sheaf on ℙ¹(ℚ_p) of Pan II §5.1.10 are listed in restructure entry 2 for when that route is accepted.

**Imports, not re-planned.**
- D(H, E) for compact H, Fréchet–Stein algebras, coadmissible modules, Frommer and Banach–Iwasawa duality: LocallyAnalyticDistributionsPartII ND.0–ND.3 and ND.6, as that design's `restructure[2]` asked. This roadmap adds D(G, E) for non-compact G, which ND.1 explicitly leaves out.
- Locally convex foundations and Mellin for compact abelian groups: LocallyAnalyticDistributions L0, L1, L3.
- Smooth theory and Ding's Bernstein-centre maps 𝒥_w and smooth tangents: SmoothRepresentationsOfLocalGroups, including SR.3/part-ii-ordered-character-map and part-ii-principal-series-tangent.
- p-adic group structure: ReductiveGroupsPartII RG2.0 and RG2.4.
- Quasi-Stein spaces: AdicSpacesPartII R3 nodes.
- Lie theory: Tau Ceti LieHighestWeight Layers 3, 4, 7, 9 and ReductiveGroups Layers 1, 2, 7 (all through requests).
- Solid modules: SolidAnalyticRings SA.1, SA.2, SA.4 (through requests).

**New owners established here.** These are planned once, here, and nothing else in the atlas plans them:
- the rigid character variety of a topologically finitely generated abelian group (LR.6/character-variety);
- the derived locally analytic functor, classical and solid (LR.2/derived-analytic-vectors, LR.3/solid-analytic-vectors).

## Requests to re-point (restructure entries 1–2)

**PadicHodgeParametersInLocallyAnalyticRepresentations.** Its contracts LA1–LA6, now filed provisionally at LocallyAnalyticDistributions:L0 with gap G-LA, map to:

| Contract | Nodes |
|---|---|
| LA1 | LR.1/admissible-representation, admissible-anti-equivalence, ext-groups, ext1-extensions, self-extension-dual-numbers; LR.0/completed-external-tensor |
| LA2 | LR.7/pi-alg, principal-series-ps, principal-series-constituents, constituent-labels, ps1-and-pi1, finite-slope-amalgam, constituent-ext-lines, self-extensions, ext-pi1 |
| LA3 | LR.7/zeta-w, ext-ps1, ext-pi1, ext-filtration, self-extensions |
| LA4 | LR.8/parabolic-levi-data, pi-fp, ext-pi-fp, zeta-fp, zeta-fp-bijective, endpoint-amalgamation; LR.6/closed-induction; LR.0/completed-external-tensor |
| LA5 | the seven LR.9 nodes |
| LA6 | LR.7/zeta-w, ext-ps1, self-extensions; LR.6/closed-induction, emerton-adjunction, orlik-strauch-jacquet-adjunction |

The 𝒥_w part of LA6 stays with SmoothRepresentationsOfLocalGroups SR.3/part-ii-*.

**LocallyAnalyticCompletedCohomology and CompletedCohomologyPartII.**
- LocallyAnalyticCompletedCohomology's request at L0 for locally analytic vectors and R^iLA maps to LR.2/analytic-vectors, derived-analytic-vectors, la-long-exact-sequence and admissible-la-acyclic.
- CompletedCohomologyPartII CC.6/analytic-classical-comparison's "generic derived locally analytic functor from L0" maps to the same LR.2 nodes, plus LR.3/solid-analytic-vectors.

## What remains (gaps)

1. **Category O and Kostant homology.**
   - The owner, LieHighestWeightPartIICompletedCategoryO, is proposed in the accepted LieHighestWeightPartII packet but has no design job.
   - LR.4, LR.5, LR.7 and LR.8 cite the contract, which is stated in full in the packet gap and the README: O^p_alg for g ⊗_{ℚ_p} E, generalised Verma modules, Verma multiplicities for gl_n, and Kostant's theorem.
   - Restructure entry 3 asks for that design. Its algebraic layers must not import this roadmap.
2. **Solid functional analysis.**
   - The owner, LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, is proposed in the LocallyAnalyticDistributionsPartII packet's restructure but has no design job.
   - LR.3 cites the contract: Smith and LS spaces, Banach–Smith duality, RJRC22 Corollary 3.17 and Theorem 3.40, BCGP 2.2.9–2.2.14.
3. **DLB Lemme 5.10.** Weakly null sequences are null over a spherically complete field.
   - The source gives no proof. A sketch is in LR.0/weak-sequential-convergence; Perez–García–Schikhof was not read.
   - A source job should fix the reference.
4. **Breuil–Qian.** The direction Ext¹(C(I, s_{i,σ}), π_alg) of Ding's Lemma 3.5(1) is quoted by Ding from Breuil–Qian, which was not read. No target uses it.

## Source issues

There are eleven, under `sourceIssues`.
- **Ding (nine).** E1–E8 record the misprints the PAPER-DING-25 extraction found (its E1, E4, E5, E17, E18, E20, E23, E24). E6 extends E23 to (3.36) on p. 47 (new). E9 is new: p. 35 says "Lemma 3.1" for Proposition 3.1.
- **DLB (one).** E10 is the c_h correction (PAPER-DOSPINESCU-LEBRAS-17/E11).
- **BCGP (one).** E11 is the undefined r′ in §2.2.27 (PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E057).

## Sources read

All copies were in scratch and none is committed; URLs and SHA-256 hashes are in the packet's `sources` and `sourceVersions`.

- Ding, PMIHES 142 (2025), version of record: §3.1 read in full, §2.1 and (2.17), and the bibliography. arXiv:2407.21237 compared.
- Schneider–Teitelbaum:
  - JAMS 2002 (§§2–3);
  - Invent. 2003 (§§3, 6, 7; §8 table of contents);
  - Israel J. 2002 (§3);
  - Represent. Theory 2001 (§3).
- Emerton:
  - Memoir (§§1.1, 3.5–3.6, 6.1–6.5);
  - Jacquet I, Ann. ENS 2006 (introduction, §§3.2, 3.4, 4.2–4.3);
  - Jacquet II, preprint (introduction, §§2.1, 2.8, Corollaries 4.3.3 and 5.1.4).
- Orlik–Strauch, JAMS 2015 (introduction, §§2.5, 3–6.2) and Represent. Theory 2010 (main theorem); Orlik, arXiv:1802.07514v2 (Theorems 1–2).
- Breuil:
  - Vers le socle I §2 (the ℚ_p-analytic Orlik–Strauch theory);
  - Vers le socle II, Théorème 4.3 and Remarque 4.4;
  - Ext¹ localement analytique, §2.1 and Lemme 2.1.1.
- Schraen, Ann. ENS 2011: §3 (Définition 3.1, the homology) and §4 (Proposition 4.7, Corollaire 4.9, (4.37)–(4.42)).
- Ding, Simple L-invariants, Lemma 2.26.
- Breuil–Herzig, Definition 5.7.
- Breuil–Hellmann–Schraen, PMIHES 2019: §§5.1–5.2, Remark 5.1.2, Lemma 5.2.1.
- Dospinescu–Le Bras: §§1.1, 3.3, 5.2.
- Boxer–Calegari–Gee–Pilloni, arXiv:2502.20645v1: §§2.2.1–2.2.29 and 3.4.2.
- Rodrigues Jacinto–Rodríguez Camargo: §1 and §4.4.
- Pan I, arXiv v3: §2.
- P. Schneider, *p-Adic Lie Groups*, from the maintainer's cleared library: Corollaries 4.4–4.5, §13 Examples, §14, read in place.

**Not obtained or not read.** Kohlhaase, *The cohomology of locally analytic representations* (cited through Schraen §3), Breuil–Qian, Perez–García–Schikhof, Humphreys' *Category O* (the category-O contract cites it by chapter), and Schraen's GL_2(L) paper (σ-analytic representations are taken from Breuil's Ext¹ §2.1 and Ding §3.1.4).

## For the reviewer

- **Breuil's ℚ_p-analytic setting.** Check that the locally ℚ_p-analytic Orlik–Strauch theory is taken from Breuil socle I §2, not from Orlik–Strauch's L-analytic paper. BHS Remark 5.1.2 is planned as an explicit proof obligation.
- **GL_n numbers.** Check the dimension counts in LR.7–LR.9 against Ding's propositions. The Lean file re-derives them for small n.
- **Conventions.**
  - Unnormalised induction from B^- with J_B along B, as in Ding.
  - ε = N(·)|·|_L.
  - The identity ηz^λ = z^h(ε^{-1} ∘ θ) is proved in LR.7/principal-series-ps.
