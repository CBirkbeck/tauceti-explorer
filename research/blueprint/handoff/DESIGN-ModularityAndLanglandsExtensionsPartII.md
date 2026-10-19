# DESIGN-ModularityAndLanglandsExtensionsPartII: handoff

Job #3345 was done by Claude (session claude-DbaRaV) on 2026-10-19.

The roadmap is **Modularity, automorphy and Langlands endpoint extensions, Part II: the proof of symmetric power functoriality** (`ModularityAndLanglandsExtensionsPartII`). Its area is automorphic and its parent is ModularityAndLanglandsExtensions, which is TauCetiRoadmap pull request #1180.

## What was done

- **Roadmap definition:** `research/blueprint/roadmaps/ModularityAndLanglandsExtensionsPartII.json`, with 14 layers, SP.0–SP.13. The layer `requires` are derived from the node prerequisites, and a depth-first search finds no intra-roadmap stage cycle.
- **Packet:** `research/blueprint/packets/ModularityAndLanglandsExtensionsPartII.json`, status `complete`.
  - It has 105 nodes: 82 theorems, 12 constructions and 11 definitions.
  - It has 107 API items, 75 unit tests and 21 planets (at most 6 per layer).
  - It cites 3 baseline declarations, makes 25 requests and records 6 gaps.
  - All 14 layers are `planned`.
  - `scripts/check_blueprint.py` (with the declaration index) reports 0 errors and 0 warnings.
- **Reader:** `research/blueprint/readmes/ModularityAndLanglandsExtensionsPartII.md`. It is generated from the packet, escaped for `src/markdown.js` (`\ * _ $` backtick, `|` and `>`; brackets are not escaped).
- **Suggested Lean file:** `research/blueprint/suggested/ModularityAndLanglandsExtensionsPartII.lean`, 160 lines.
  - It holds the elementary layer the README's checks rest on: symmetric-power refinement parameters and n-regularity, the 2-adic boundary-annulus valuations, the ping-pong index, the Fourier coefficients of σ₀ through `GaussianInt`, the seasoned threshold and the Bertrand split.
  - It **compiles** with `lean-check` at the pinned Mathlib. The only warnings are `sorry` warnings, from four statements.
  - The Gaussian-integer checks are proved by `decide`, the 2-adic valuations through `padicValNat.pow_two_sub_one` and `padicValNat.prime_pow`, and the ping-pong index by `omega`.
  - All other targets are README targets, because their carriers (eigenvarieties, pseudocharacter spaces, automorphic representations of definite unitary groups, patched modules) are not at the pins.

## Scope decision: one direction planned, two split off

The brief carried ten continuations in three independent directions.

1. **Planned here: the proof of symmetric power functoriality.** This is four extraction routes, kept together because they depend on one another:
   - SymmetricPowersByAnalyticContinuation (Newton–Thorne I Part I);
   - SymmetricPowersByUnitaryLevelRaising (Newton–Thorne I Part II, Clozel–Thorne III and Thorne 2024 Theorem 6.11);
   - SymmetricPowerAutomorphyLifting (Newton–Thorne II);
   - SymmetricPowersByTensorFunctorialityLifting (Newton–Thorne 2026 with Thorne 2024 §7).

   Newton–Thorne 2026 §4 reuses the Newton–Thorne II patching template and Thorne 2024's level raising. Newton–Thorne I imports Theorem E from its own level-raising part.
2. **Split off:** LevelOneCuspidalCohomologyGLn (Boxer–Calegari–Gee 2025, 39 items).
3. **Split off:** GSp4LocalLanglandsAndGaloisRepresentations (BCGP 2018 route 4 with 23 items, and BCGP 2025 route 35 with 7 items). AbelianSurfacesPotentialModularity already parks requests at ML.4 and ML.5 for this; they should be re-pointed once it is designed.

Restructure entry R1 records the split. Every routed item is mapped in the packet's `routedItems`, either to node ids, to "stated by the parent and imported", or to "split off". A script confirmed that no item is unmapped.

## Relation to the parent (read this before reviewing)

The parent's package (PR #1180) already states every endpoint, and most of the intermediate theorems, as import contracts with one-line proof routes: §§4.5–4.11, 4.20, 4.22, 4.23 and 4.29–4.37. Its packet records that the methods belong to this Part II (its gap "Newton–Thorne and Clozel–Thorne methods are owned by proposed Part IIs"). This roadmap therefore:

- **imports** what the package states and develops:
  - §4.3's eigenvariety machinery (definite-unitary eigenvarieties, the Emerton Jacquet functor, family triangulation, trianguline deformations and the trianguline tangent bound, the σ_n maps, Lemma 2.30 classicality);
  - Anastassiades–Thorne in §4.4;
  - the one-prime criterion in §4.15;
  - the Clozel–Thorne reductions with NT26 Proposition 6.1 and Thorne 2024 §8 in §4.22;
  - n-regular refinements, SP_n and SP_{n≤5} in ML.3;
  - Mok and KMSW in ML.4.

  These go through one request at stage ML.3 that names the package sections.
- **supplies the proofs** of the import-contract theorems. The consumer retargets are listed in restructure entry R2: eigenvariety-propagation ← SP.2/eigencurve-propagation, buzzard-kilford ← SP.3/buzzard-kilford-boundary, level-one-ping-pong ← SP.3/level-one-propagation, and so on.

The atlas gets no edge from ML.3 to this roadmap; only this roadmap's `requires` point at ML.0–ML.5.

**Neighbouring owners imported by node id:**

- PotentialAutomorphyInfrastructurePartII PL.0–PL.9: ι-ordinarity, soluble descent, definite unitary forms and Hecke algebras, Thorne/ANT residually reducible theory, generic R = T, Thorne 2024 Theorem 7.5 (PL.7), P and adjoint Selmer vanishing (PL.8);
- PadicFamilies L2/L2a;
- AdicSpacesPartIIPartII RZ.1;
- SmoothRepresentationsOfLocalGroups SR.1–SR.5 (Tau Ceti);
- SmoothRepresentationsOfLocalGroupsPartII SRU.7;
- EndoscopicTransferAndUnitaryTraceComparison ET.1/3/4/7a;
- GlobalGaloisDeformations, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebra, GL2ModularityLifting;
- ArithmeticGaloisRepresentations G7/R01.x (adequacy, a_0(p), Clebsch–Gordan, Pieri, enormous subgroups).

## Gaps (open, precisely)

- **G1.** Deligne–Lusztig theory, Lusztig's cuspidal unipotent character of U_3(𝔽_q), Dudas–Malle, Geck, and Kazhdan–Varshavsky's transfer have no owner. A request is parked at TauCetiRoadmap CharacterTheory Layer 9 for a Part II, and restructure entry R3 records the proposal.
- **G2.** Newton–Thorne I Proposition 7.4 (the odd n case of Theorem 7.1) has the error E21: the GL_2 block is not conjugate self-dual.
  - Theorem E is therefore proved here only for n a power of 2 and n ≤ 5.
  - The endpoints do not depend on it: SP.13/sp-induction (NT26 Theorem 6.4) proves SP_n for all n over every totally real field.
  - Two upstream notes ask the maintainer to mark the package's §4.9 and to record §4.30/§4.35 as the unconditional route to §4.12.
- **G3.** Thorne 2024 §§3–5 (Steinberg detection, the mod-p cohomology of the Drinfeld half-space, p-adic forms on definite unitary groups) were routed nowhere. They are stated inputs of SP.6/thorne-steinberg-level-raising. Restructure entry R4 proposes owners.
- **G4.** Mœglin's explicit description of tempered unitary packets (Mœglin 2007) is cited via ML.4; the owner needs confirming.
- **G5.** Diamond–Taylor 1994 Theorem A, Edixhoven 1992 Theorem 2.6, and Clozel–Thorne II Proposition 3.10 with its §6 reductions have no owner. Diamond's GL_2 level raising is R20.2.
- **G6.** NT26 Lemma 5.7 has the gaps E25 (irreducibility over F(ζ_t)) and E28 (v_1 ∤ p). Both look repairable but are not repaired. E24 (σ's ramified places in Theorem 4.1) is repaired in SP.12/tensor-lifting-setup.

Each layer's `remaining` list names lemma-level refinements only, plus the gaps above.

## Source issues

`sourceIssues` is empty: this design found no new mistakes. The reader's "Corrections to the sources" section lists every extraction E-number the nodes follow, by node.

- One mistake of my own was caught during self-checks and fixed: the degree of −R_C^{U_3}θ is (q + 1)(q² − 1), which is 32 for q = 3.
- The automated locator check (each cited theorem label found on the cited PDF pages of the arXiv texts) flagged two false positives, labels printed without a period, and nothing else.
- A Sonnet cross-check of all 105 nodes against the source texts found 7 errors and 11 points to check in my drafts. All were verified on the page and fixed:
  - Y, not X, is the generic member of the Clozel–Thorne packet.
  - The shuffle exponent for m = 5 is [2, 1, 1, 0].
  - The sign of R_C(1).
  - The NT I Proposition 4.6 multiplicity can vanish whatever the signs.
  - The cuspidal and endoscopic contributions at v_0 in Clozel–Thorne Theorem 4.2.
  - The R_D dimension bound and the map P_D → 𝕋_D exclude partition rings.
  - R_1 and R_2 both non-empty in NT I Theorem 6.1, whose splitting condition is (5)(d).
  - Theorem 3.8 of Clozel–Thorne III is for l > 5.
  - Lemma 4.3 of NT I needs temperedness.
  - The character condition in the proof of NT26 Proposition 6.1 is χ² det r = ε^{−1} in characteristic zero.
  - The enormous-image Lemma 4.7 uses strong irreducibility and Hodge–Tate regularity (the Sen operator), not residual image.
  - The paving in Clozel–Thorne Theorem 2.5 is Białynicki-Birula's.

## Sources read

All sources were read on 2026-10-19; the SHA-256 hashes are in the packet.

- arXiv:1912.11261v3 (NT I)
- arXiv:2009.07180v2 (NT II)
- arXiv:2212.03595v2 (NT 2026)
- arXiv:2212.03591v2 (Thorne 2024)
- arXiv:1912.11267 (Anastassiades–Thorne, Theorem 5.1 only)
- the Clozel–Thorne III accepted manuscript (dpmms.cam.ac.uk/~jat58/lrspiii.pdf)

Locators use arXiv PDF pages. The paper extractions used the published pagination for NT I and NT II, so the page numbers differ from theirs.

**Not read:** Buzzard–Kilford 2005, which is cited through NT I Theorem 3.2; the published versions of the papers; and Mœglin 2007, Kazhdan–Varshavsky, Dudas–Malle, Geck and Diamond–Taylor, which are cited inputs.

## For the reviewer and follow-ups

- The four Part II methods could later be split into separate roadmaps if the maintainer prefers smaller ones. The layer boundaries make this possible: SP.0–3, SP.4–7, SP.8–10 and SP.11–13.
- Follow-up design jobs are needed for LevelOneCuspidalCohomologyGLn and GSp4LocalLanglandsAndGaloisRepresentations (entry R1).
- When the parent package is next revised, apply the consumer retargets of R2 and the two upstream notes.
