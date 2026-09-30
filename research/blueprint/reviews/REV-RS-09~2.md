# REV-RS-09~2

Independent review of the RS-09~2 revision (Claude Code, session `cc-f805bf`, issue #4968, PR #5050) for issue #4967.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-09 round 1 (ChatGPT, `astra-d49b2f`);
- its first review, REV-RS-09 (`cc-58621d`);
- the revision.

I have done no other work on ArithmeticLocallySymmetricSpaces or CompletedCohomologyPartII.

**Verdict: accepted, with three corrections in place.** The corrections are in the section "Corrections". The
frontier holds only once the maintainer deletes three stage edges (see "Required maintainer edits").

## What I reviewed

- **The rules:** PROTOCOL.md section 15.
- **The family:** `RS-09.json`, with its 34 evidence pairs.
- **The documents, in full:** both member documents, and the anchor stages the proposal imports (AlgebraicTopology
  stages 2, 4, 5 and 6).
- **The proposal:** `RS-09.result.json` and `RS-09.md`.
- **The first review:** REV-RS-09.
- **The revision's diff** against round 1, layer by layer, link by link and owner by owner.
- **The consumer texts** behind each forwarding omission: AnalyticNumberTheory AN.9, ShimuraVarieties V0 and
  AutomorphicSpectralTheory AS.5.

Both member documents, the anchor document, the family file and `data/atlas.json` are byte-identical to the versions
REV-RS-09 hashed. Only the proposal and its report changed.

**What round 2 changed.**
- **ALS.6** is narrowed to finite-level descent.
- **CC.0 and CC.1** take the tower assembly, including the tame-level systems.
- **One link is withdrawn:** CC.0 → ALS.6.
- **39 links are added:** 38 §15 forwarding links and ALS.6 → CC.6. The 24 round-1 links minus the withdrawn one plus
  these 39 gives 62.
- **Owner records** no longer list their own owner under `formerly`.
- **The anchor's entry** is removed from `roadmaps`.
- **Layer entries:** the other nine layer entries are unchanged in substance, apart from reasons that record forwarding.

## Checks

- **`python3 scripts/check_restructure.py research/blueprint/restructure/RS-09.result.json`:** ok, before and after my
  corrections.
- **`research/blueprint/intake.py check-files`** on the two deliverables: no problems.
- **The links.** All 62 endpoints are atlas stages. There are no duplicates, and none is already an edge.
- **Replay.** I assembled the atlas with `scripts/build.py`'s `assemble` at main `d0016c72`, with RS-09 added to the
  accepted proposals. I ran it three ways: with the proposal file (before and after my corrections), with the three
  edges CC.2/CC.4/CC.7 → ALS.6 removed from the snapshot, and with no RS-09 at all.

| Atlas | RS-09 links applied | Skipped | Cycle | ALS stages with a CC ancestor |
|---|---|---|---|---|
| without RS-09 | – | – | no | ALS.6 (CC.0–CC.4, CC.7) |
| with RS-09 | 62 | none | no | ALS.6 (CC.0–CC.4, CC.7) |
| with RS-09 and the three edges deleted | 62 | none | no | none |

In the last case, CC's ALS ancestors are:
- ALS.0–ALS.4;
- ALS.5:finite-level-duality, for CC.7 and CC.8;
- ALS.6, for CC.6 and CC.8, through ALS.6 → CC.6.

After RS-09, ALS.6's only consumer is CC.6. These are the revision's figures.

**Why the RT-RS-15 failure cannot occur here.** That failure was a narrowing in force while its supplier link was
skipped. Here no link is skipped, with or without the deletions. The stale edges only keep ALS.6's three old
prerequisites until the maintainer removes them.

## 1. Duplication: resolved

The fifteen owner records each have exactly one owner, and every owner is an atlas stage. Of the 34 evidence pairs:
- **30** are covered by owner records.
- **The four CC.6 pairs** (ALS.4 ~ CC.6 and ALS.6 ~ CC.6, each listed twice) are distinct theorems, as the report's
  "Finite-cover and completed descent are different applications" says:
  - ALS.4's Hochschild–Serre is for unipotent/Levi boundary strata;
  - ALS.6's is for a finite normal cover K′ ⊂ K;
  - CC.6's is the continuous descent from the completed object.

  The new link ALS.6 → CC.6 makes CC.6 import the finite-level theorem rather than restate it.
- **REV-RS-09's four distinctions** still hold (Ext versus Tor, finite cells versus the completed model, generic versus
  corner duality, finite versus completed descent). Round 2 did not touch them.

I found no missed duplicate.

## 2. Nothing lost: right, after one correction

**ALS.6's stage text has four parts.** Each now has an owner:

| Part of ALS.6's text | Now owned by |
|---|---|
| "Assemble direct/inverse systems in tame and p-power level, including corestriction, restriction and compatible Hecke actions" | CC.0's `keeps` (named explicitly), with the tame-place colimit in CC.1's `keeps` |
| "Prove finite-level descent and the finite-cover Hochschild–Serre application" | ALS.6's `keeps` |
| "Reexport CC.2/CC.4/CC.7 …, retaining lim¹" | CC.2, CC.4 and CC.7, which own those objects; lim¹ is kept at CC.2 |
| "Test the tower on modular curves and an anisotropic compact quotient" | finite-cover versions at ALS.6; the tower versions at CC.0 (my correction 3) |

**The two descent claims** in ALS.6's `keeps` are right as stated for a normal finite-index K′ ⊂ K:
- the derived identification RΓ(X_K) ≅ RΓ(K/K′, RΓ(X_{K′}));
- the spectral sequence H^i(K/K′, H^j(X_{K′}, V)) ⇒ H^{i+j}(X_K, V), with the Hecke comparison restricted to places
  where K and K′ agree.

The non-neat stabilizer qualification is kept.

**Tower-level paper routes.** The report says fifteen paper items are planned at ALS.6 and names five tower-level ones
for re-homing. I counted the same fifteen items: ALLEN-ETAL-23 ×3, CALEGARI-GERAGHTY-18 ×6, CALEGARI-GERAGHTY-20 ×1,
CARAIANI-NEWTON-23 ×4 and SCHOLZE-15 ×1. The five tower-level ones are right.

**Forwarding.** I recomputed forwarding on the assembled atlas with the deletions, after my corrections. For each of the
nine narrowed layers, every supplier-to-consumer pair is a link or an existing edge, except these:

| Narrowed layer | Pair without a link | The stated reason, checked against the consumer's text |
|---|---|---|
| ALS.0 | T6 → AN.9, T6 → V0 | AN.9 (Selberg/spectral zeta on the quotient) and V0 (arithmetic groups, components, proper discontinuity) use the quotient ALS.0 keeps, not the orientation system. Right. |
| ALS.1 | T4 → ALS.2 | ALS.2's stratification spectral sequence and monodromy use ALS.1's local systems and cochains, not cellular chains. Right. |
| ALS.1 | T4 → AS.5 | AS.5 compares ordinary local-coefficient cohomology with weighted L² and relative Lie complexes. Right. |
| ALS.1 | T4 → CC.1 | CC.1 takes colimits of finite-level cohomology. The cellular refinements are CC.0's and CC.4's, which import T4 directly. Right. |
| CC.4 | ALS.3 → CC.5 | Finite generation and admissibility use the completed cell complex and the Iwasawa algebra, not Hecke operators. Right. |
| ALS.6 | T5, ALS.3, ALS.4 → CC.6 | CC.6 is a new consumer. It takes only the finite-level descent ALS.6 keeps and already reaches all three through existing paths. Right. |

This meets the stricter reading of REV-RS-09's third question: every direct consumer gets a link or a stated reason.

**One slip in the report.** `RS-09.md` calls ALS.1 → CC.1 "the round-1 link". It is a round-2 forwarding link for the
narrowed CC.0; it is not in round 1. The JSON says "the new link", which is correct. The report is not mine to edit;
the maintainer or the next revision can fix the word.

## 3. Anchors and the extension: right, with the maintainer deletion

- **The anchor.** No layer entry names a Tau Ceti stage, so the anchor is unchanged. Tau Ceti stages appear only as
  suppliers and link sources.
- **The title** has the required form: "Arithmetic locally symmetric spaces and their cohomology, Part II: completed
  cohomology and homology".
- **The frontier.** The extension starts where the base stops once the three stage edges CC.2/CC.4/CC.7 → ALS.6 are
  deleted (table above). The later full ALS.5 is a base layer that CC does not import, which the standard allows.
- **ALS.6 → CC.6** runs from base to extension, the permitted direction.

`restructure.py` can only add links, so the deletion cannot be expressed in the proposal. That is why the deletion is a
required maintainer edit rather than a reason to send the file back.

## 4. Format: right

- The result file has only §15 keys, with a `review` object.
- Every narrowed layer has `keeps` and `suppliedBy`, and `keep` layers carry only a reason.
- `roadmaps` lists only proposed roadmaps.

## Corrections

1. **`layers[ALS.5].suppliedBy`: added anchor stage 6.** Two owner records name ALS.5 under `formerly`: the generic
   orientation system and manifold-with-boundary duality, both owned by stage 6. The revision's own rule is that a
   narrowed layer lists every owner whose record names it, and this layer had been missed. The link stage 6 → ALS.5 was
   already in `links`, and ALS.5 has no consumer, so no forwarding follows.
2. **`layers[ALS.6].suppliedBy`: added ALS.3 and ALS.4.** Their records (the normalized Hecke correspondence and the
   finite-level boundary triangle) name ALS.6 under `formerly`, and ALS.6's `keeps` imports both. ALS.3 → ALS.6 is in
   `links`, and ALS.4 → ALS.6 is an existing edge. CC.0, CC.2, CC.4 and CC.7, whose records also name ALS.6, are
   deliberately not suppliers: they received the parts ALS.6 no longer keeps, and listing them would read as the
   dependency the frontier forbids. ALS.6's reason now says so.
3. **`layers[CC.0].keeps`: named ALS.6's tower tests.** ALS.6's "Test the tower on modular curves and an anisotropic
   compact quotient" had moved to CC only by allusion. CC's own tests are a constant tower, a Z_p tower with finite CW
   quotient and a modular-curve boundary class, none of which is either tower. CC.0 owns the assembly, so its `keeps`
   now names both towers with their restriction, corestriction, conjugation and Hecke checks. The CC.0 and ALS.6 reasons
   record this.

My review object replaces REV-RS-09's, which remains in REV-RS-09.md. Nothing else in the file changed.

## Required maintainer edits

These are the revision's own maintainer steps. The first is required for the frontier to hold:
1. **Delete three stage edges.** Delete CC.2 → ALS.6, CC.4 → ALS.6 and CC.7 → ALS.6 from `data/atlas.json`. The
   snapshot takes them from ALS.6's "Reexport CompletedCohomologyPartII:CC.2/CC.4/CC.7" sentence, so rewrite that
   README text too, or a regeneration restores them.
2. **Rewrite ALS.6's README text** to its new `keeps`. The title "Finite-level descent" is optional.
3. **Name TC.2 alone** in three places that also name ALS.6 as a CC consumer:
   - the CC README's "Ownership and scope";
   - CC.7's "Export … to ALS.6 and TC.2";
   - the R31 README.
4. **Re-home the five tower-level paper items** listed in RS-09.md when those records are next touched.

## Questions for the orchestrator

1. **Edge deletion.** Should `restructure.py` gain a way for a proposal to withdraw an existing stage edge? This is
   the second family, after RS-15, where an accepted repair depends on a deletion by hand. RS-09's repair is safe
   without it, since no link is skipped, but the frontier holds only after the deletion.
2. **The frontier after acceptance.** Until the three edges are deleted, the atlas shows ALS.6 narrowed but still
   requiring CC.2/CC.4/CC.7. Should the promotion of RS-09 wait for the deletion, so that the two land together?

## Inputs

Pre-review inputs at main `d0016c724086c2c81dd20f6512fbcc0815b4f4dc` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-09.result.json | `207ec5b6e2d1647a753d47c878fc7926c6728a06a5c116f5618e29ebab9a9146` |
| RS-09.md | `05d2c57e7e7569be7c81f8b7c6a4568c37a9cd2be3e37b15811c32cfd010e6a0` |
| RS-09.json | `b933bcc973812d9cce77b405d9d11ff974ad82d2236efa0f37d861f8e271dc5e` |
| ArithmeticLocallySymmetricSpaces/README.md | `e08c8acacd68d8f7793a6f65e9f8925901ec1214927a6d675304607f601999ac` |
| CompletedCohomologyPartII/README.md | `833b542ad278a00eb8086bc8dba7f9a5e86d1249843a4954d85766f4f6b71427` |
| tau-ceti/AlgebraicTopology/README.md | `f894faf00311049f7032eb488d43c75bcfeffbafc528010e72b9b679ca0bef3f` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable, and no Lean was run.
