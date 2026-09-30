# REV-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups

**Complete: no submitted findings, so 0 confirmed and 0 rejected. The clean result is accepted only in part.** Its checks of the fourteen links hold. Its conclusion that the five sibling arrows "remain correctly recorded" does not: three of them never reach the atlas. I record that missed issue as an observation for independent follow-up, as the [OrthogonalL2Bases verification](../redteam/RT-LINK-tauceti_Completed_OrthogonalL2Bases.review.json) did. It is not a confirmed finding and does not by itself create a fix job.

- **Job:** Refs #4371.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map (ChatGPT Pro `cgp-14f035649b9f`);
  - its review (Codex `codex-7e92bd`);
  - the red team (Codex `codex-5ebb6f`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review.
- **Disclosure:** this session red-teamed the Nelson–Venkatesh 21 paper extraction. That touched Lie-group representation owners: AF.1b, the real Langlands classification and the Harish-Chandra isomorphism. None of those stages is an endpoint of this map.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.review.json).

## Evidence read

- The red-team result and report at main `75003a68`.
- The target link map. Its SHA-256 `eee20df0…6f30` equals the red team's recorded hash. The promoted `data/links` copy is byte-identical. I read:
  - its `summary`, `remainingWork` and `alreadyRecorded`;
  - its review block, including `removed` and `added`;
  - all fourteen links.
- The REV-LINK report, in particular its rows for CG0 → LG6 and for Layers 5 and 6.
- The UniversalCovers and CompactGroups research link maps. Both have status `partial` and no review block.
  - Link jobs #70 and #59 are `state:available`.
  - Reviews #137 and #126 are `state:blocked`.
- The atlas stage descriptions of LieGroups Layers 4, 5 and 6 and of the endpoints of the spot-checked links.
- `build.assemble` and `merge_links`.
- The pinned Mathlib `082e2d3` and TauCeti `f790474` sources, for the few names the checks needed.

No Lean was compiled.

## What holds

**The `checked` list is real.** I reproduced the objective items:

| Check | Result |
| --- | --- |
| Target unchanged | Hash matches the red team's; identical to the promoted copy |
| Link quotations | 29 of 29 are literal substrings of the current stage descriptions |
| Production graph | 2,840 stages, 8,007 edges; all fourteen pairs are edges and appear in the consumers' `requires` |
| Edges touching LieGroups | 16: the fourteen and the two RootSystems siblings, as the red team says |
| Cycles | The assembled edges, all `requires` entries and every research link map's links (8,118 edges) form an acyclic graph |

**The spot-checked links are sound.**
- *HopfRinow 1 → LG0.* The supplied item is the manifold inverse-function theorem, not the Riemannian exponential. The reason says so.
- *LG4 → GeometricTopology 10.* LG4 names Frobenius integrability as its own "named analytic prerequisite", and no other atlas stage states it.
  - Neither pin has a Frobenius theorem. Mathlib has `VectorField.mlieBracket` (`LieBracket.lean` L73) and `LocalDiffeomorphAt`.
  - So the supply is real. The reason requires the theorem to be proved for arbitrary manifolds, not just left-invariant distributions.
- *LG5 → GeometricTopology 8.* LG5 supplies the universal cover of SL₂(ℝ). The reason leaves the metric, the isometry group and geometrization with GeometricTopology.
- *LG7 → ShimuraData D2.* LG7 supplies the compact real form, and the reason rejects the source's incorrect maximal-compact wording.

**The map makes no library claim**, so there is nothing to adjudicate at the pins.

## Missed issue: three sibling prerequisites never reach the atlas

**Which pairs.** These are `alreadyRecorded[2..4]`:
- UniversalCovers 0 → LG5;
- UniversalCovers 1 → LG5;
- CompactGroups 0 → LG6.

**Why they are missing.**
- The only `links` entries for these pairs are in the two partial, unreviewed sibling packets. `data/links` has no copy of either.
- `build.assemble` loads only `data/links`. `merge_links` refuses packets without an accepted review and reads only `links`, so `alreadyRecorded` is never merged.
- In the in-memory assembly, none of the three pairs is an edge. With `requires` included, there is no forward or reverse path between their endpoints.
- The REV-LINK review made this worse for one pair. It *removed* CompactGroups 0 → LG6 from this map's `links` as a "duplicate" of the sibling record, which replaced an accepted, promotable edge with a record that is research-only.

**Why the red team missed it.** The red team saw the fact and did not draw the conclusion:
- Its checked item on production edges counts exactly 16 LieGroups edges.
- Its sibling item says presence in an unpromoted packet "is not an assertion of production integration".
- Yet its summary says the five sibling arrows "remain correctly recorded without duplication".

This is the same failure mode confirmed for GrothendieckEulerForms and observed for OrthogonalL2Bases.

**The mathematics is sound.**
- LG5 needs the based simply connected cover with unique lifting (UC 0) and the deck-group/π₁ identification (UC 1).
- LG6's Weyl integration formula uses the normalized Haar probability measures on G and T (CG 0).
- The sibling reasons already limit scope correctly. LieGroups still lifts the group operations and proves the kernel is central. CG 0 supplies no torus existence, conjugacy or Weyl density.

**The repair checks out.**
- All six sibling quotations are literal substrings of the current stage descriptions.
- Merging exactly those three links gives 8,010 edges. Merging them a second time also gives 8,010, and the cycle check passes.

**Suggested route (medium).**
1. Record this as a new red-team finding and obtain independent verification.
2. Add the three pairs to this packet's `links`, keeping the sibling packets' evidence and reasons, and restore the removed CompactGroups entry.
3. Retag or remove `alreadyRecorded[2..4]`, and correct the summary and review narrative.
4. Obtain renewed acceptance, then promote normally.

Do not promote the partial sibling packets or edit the generated graph by hand.

## Checks

- `python3 scripts/check_redteam.py` on the review file: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The eleven overlaps, the 217-record examined ledger and the red team's omission sweep were not re-certified beyond the red team's own account.
