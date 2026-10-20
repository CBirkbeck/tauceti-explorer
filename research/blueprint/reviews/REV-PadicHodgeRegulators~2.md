# Independent review: PadicHodgeRegulators, revision round 2

Job **REV-PadicHodgeRegulators~2**, issue **#11097**. Reviewer: **Claude (Opus)**, session **claude-TLyfvv**, 20 October 2026. The reviewed revision was written by session claude-uCHvXm (BP-PadicHodgeRegulators~2, #11092, PR #11291), after checkpoints by codex-HNxLJr and codex-428pHh; the original plan was written by codex-O1RFZ4. This session did none of that work.

**Verdict: accepted.** The packet stays `complete`, with all ten layers `planned` and none closed. Its 22 gaps (21 mathematical or supplier gaps, plus the gap for corrections owed by the parts) and its 32 requests are recorded honestly. The owed corrections can only be applied by a fix of the two part packets, which this job may not edit.

## The correction the first review asked for

REV-PadicHodgeRegulators sent the plan back for one reason. The root packet carried 27 correction records and two source aliases as an overlay. `merge_blueprints` and `promote.py` do not read an overlay, so the reader showed corrected statements while the atlas merged the uncorrected declarations. Its clearest example was the pairing order in L1/dual-exponential. The review asked for one of two things: a supported assembly path, or a migration of the corrections into the canonical nodes.

The revision does neither. It does something that also removes the contradiction: the root no longer claims any correction the merger does not apply. I checked that this holds:

- **Declarations.** I merged the three research packets with the live `data/atlas.json`. The result is 132 declarations and 34 planets (16 definitions, 33 constructions, 22 comparisons, 43 theorems, 17 lemmas, 1 application). For every declaration, the reader contains the title, statement, hypotheses, proof steps, prerequisites, source locators, API items and tests verbatim. The only differences are `|` characters escaped inside two API tables.
- **No overlay.** No field of an imported node is overridden. The two source aliases are display labels only. Node ids are defined once, and the checker forbids defining a part's node a second time in the root.
- **Owed corrections.** Every correction appears directly after its target in the reader, under a heading that says it is not applied. It is also recorded in `partCorrectionRequests` with `applied: false`.

A plan whose parts still carry known defects can be accepted when every defect is recorded with its exact correction and its owner. That condition now holds. The reader and the declarations agree; both show each defect and its correction.

**The atlas runs one version of the L3 part behind.** `promote.py` publishes a packet as it stood when its review accepted it. The D.1 part is live at the hash the root records. The L3 part went live on 6 October at SHA-256 `505bfd2c…`. The research copy (`cf912c4d…`) adds the interface edits of the assembly job of 7 October (#6776):

- the prerequisites of 17 L3/L4 targets refined from L0/L1/L2 stage ids to the exact nodes of those stages;
- three gaps;
- one reworded PG.5 request.

No statement differs. Merging the promoted parts with this packet also gives 132 declarations and 34 planets, and skips no link. I recorded this in `assembly.liveState` and `imports[1].promotedSha256`, and in the reader's opening section. These edits go live with the next reviewed fix of the L3 part.

## What was checked

| Item | Result |
| --- | --- |
| Nodes | 132: **101 verified**, **31 corrected**, 0 added. "Corrected" means a correction owed by the part is specified and checked here; it is not yet applied in the part. |
| Owed corrections | 40 records: 31 confirmed, 4 corrected here, 5 added. |
| Node locators | All checked in the public versions of 34 sources. The source texts were split by PDF page, and Haiku helpers located each cited result. I read each located passage against its node. |
| Baseline | All 31 declarations read in the pinned trees (Mathlib `082e2d3`, Tau Ceti `f790474`). All confirmed; none removed. |
| Source issues | 27. The 26 inherited issues were re-read at their locators: 25 confirmed, E103 rejected (agreeing with the earlier verdict). E122 is new. |
| Red-team handovers | All four handled correctly; details below. |
| Planets | 34. At most six per layer (D.5, L3 and L4 have six). Names come from the sources; kinds are definitions, constructions or theorems. |
| Lean | `lean-check` exit 0. Only the ten intended admission warnings; 229 lines. |
| Checker | `check_blueprint.py`: 0 errors, 0 warnings. `intake.py check-files`: 0 problems. `check_sorry_data.py`: clean. |

Most imported statements say more than the single passage they cite. They add the target-level consequences that their proof steps derive, or combine several sources. I found none that contradicts its source or drops a hypothesis. Several helper reports claimed something was "not in the source". In each case I read the passage, and the supporting text was there:

- Rubin's semilocal convention, II §2, p.25;
- the semilocal exponential in HK2, p.21;
- Berger's twist rule for Wach modules, p.124, which gives N(T(j)) = π^{−j}N(T)⊗e_j for all j;
- Besser's p-adic Arakelov Lemma 3.3: the cup product as a sum of local pairings.

## Corrections made in place

1. **L1/dual-exponential (owed statement correction).** The corrected pairing order is that of LZ2014 §2.4, p.5. The old corrected text also said this was "the order used in Appendix B.6". It is not: the proof of B.6, p.40, writes both pairings with the dual-exponential argument first, with a plus sign. The amended statement and the LZ2014 source match now say this, and cite E121 and E122.
2. **L4/good-wach-basis (owed ownership correction).** The ownership move to PG.6/wach-good-basis is right; that node states rational and analytic good-basis existence. But the corrected statement cited a node `L4/basis-change` that does not exist. It now cites L4/constant-basis-covariance, which covers basis changes over the coefficient ring.
3. **Gap "Normalized local Iwasawa pairing and dual-exponential adjunction".** It said the adjunction order "is now explicit in L1/dual-exponential". That is false while the correction is only owed. It now says the order is fixed in the owed correction. It also says that transporting LZ's factor −σ_{−1}ℓ_0 needs the swap convention of E122 fixed first.
4. **Source register.**
   - **E116:** the correction now says A.2 is *Proposition* A.2 in both Berger versions.
   - **E117:** Besser2000 has no Remark 8.6. The correction now cites Proposition 8.6(3), which Besser himself labels 8.6.3 (Proposition 9.11, p.32), together with Remark 8.7(3), p.28, where the factor (1−φ/p^n) is stated.
   - **E118:** independently confirmed. The recorded value of the second root has Q₅-component 0 modulo 5¹². That is what D₅(ζ²) requires, since the component of ζ² is −1 and Li₂(−1)=0. For D₅(ζ⁵) the component would be that of D₅(ζ), which is 1+5+4·5²+⋯.
   - Every inherited issue carries this review's verdict and reason. The earlier verdicts are kept in `reviewHistory`.
5. **Seven owed locator corrections added.** Two were merged into existing supplier records:
   - L3/logarithmic-factors: LLZ2011 §2A begins on p.1108, not p.1107.
   - L4/derham-interpolation-growth: RJ2018 numbers I.24–I.26 as lemmas (p.919), not propositions, and its footnote 10 is on p.898.

   Five are new records:
   - L4/integral-shear-choice: LLZ2011 states Proposition 5.11 on p.1128; only the proof is on p.1129.
   - D.1/etale-algebra-dilogarithm, D.1/regulator-normalisation-dictionary and D.1/logarithm-norm-trace: the two Besser–de Jeu sentences they cite stand before Remark 1.5 on p.3, not after it.
   - D.2/fontaine-messing-kato-period-map: the Ertl–Nizioł unit cocycles, with ω(c_und(u)) = p·c_div(u), are in §2.1.3, pp.5–6, not in §2.1.2.
6. **Suggested file.** The root node's own API items and tests are now in the file:
   - `residueDilogValue_excluded_one` and `residueDilogValue_zero_not_root`, as proved examples;
   - `residueDilogValue_map`, proved;
   - `residueDilogValue_cancel_double_zero`, admitted.

   Only `residueDilogValue_coleman_reduction` stays a README test, because the Coleman dilogarithm has no carrier at the pins. `leanCorrespondence` and `leanValidation` record the change.
7. **Bookkeeping.** I updated the summary, coverage `remaining` lists, `inventory`, `sourceVersions` (17 entries for this reading) and `sourceInspection` (35 receipts with SHA-256), and brought the reader in line with every change above.

No baseline citation was removed or replaced, and no mathematical node was added.

## The new source issue

**E122 (gap), LZ2014, proof of Theorem B.6, p.40, against §2.4, p.5 (arXiv v3).** Take U=V*(1+j). The proof equates ⟨exp*_U(x), log_U(y)⟩ with ⟨x, y⟩, the dual argument first in both pairings. In §2.4 the adjunction is written with exp in the first slot of the Tate pairing.

Apply §2.4 to U with a = log_U(y) and b = x. This gives ⟨y, x⟩_U = ⟨log_U y, exp*_U x⟩. The de Rham evaluation pairing is symmetric under swapping, but the cup product of two degree-one classes is graded-commutative. So the derivation gives −⟨x, y⟩, not +⟨x, y⟩, unless the transposed Tate pairing is defined without that sign. The paper does not say which convention it uses, and the sign of Theorem B.6 depends on it.

This is a gap in a stated convention, not a proof that B.6 has the wrong sign. The plan already keeps the source factor −σ_{−1}ℓ_0 as source-normalized and treats the normalized Iwasawa pairing as a gap; that gap now names this point. The finding is scoped to arXiv v3. I did not read the published version.

## Baseline

All 31 declarations exist at the pins under the cited names, in the cited modules. Their statements support the recorded `provides`. Two small notes are recorded in the review object:

- `OrzechProperty` is the class. The instance for commutative rings is `CommRing.orzechProperty`, in `Mathlib/RingTheory/FiniteType.lean`.
- `IsArithFrobAt` resolves to the group-action abbrev in `Frobenius.lean`.
- `TauCeti.kummerClassMap` comes with `kummerClassMap_injective`, as its `provides` says.

## Red-team handovers

- **RT-AREA-iwasawa-1/19.** No declaration uses SelmerIwasawaCohomology:L2. The L1 declarations use only Selmer L0 and L1 nodes. The L2/L3 declarations use Selmer L3 and L4 nodes, and merging skips no link.
- **RT-AREA-iwasawa-2/3.** The four classical log-syntomic declarations exist, with CR and CP imports and the CS.0–CS.3 request. Their exact range is r≤p−2 (EN Theorem 2.2, after Tsuji), and the undivided comparison is only bounded. The red team asked for r≤p−1. CN's announcement of that range rests on the twist convention that E106 shows is ambiguous at r=p−1, so the conservative range is right.
- **RT-AREA-ktheory-2/15.** D.3, D.4 and Habiro HB.7 inherit D.1/combined-dilogarithm, the normalization dictionary and K3BlochGroups V.4/suslin-exact-sequence. I checked this on the ancestor graph.
- **RT-AREA-ktheory-2/18.** D.2/etale-regulator imports MotivicEtaleKTheory M.7 and M.1 only; no declaration mentions M.8.

## Library and upstream screen

Current TauCetiRoadmap main (`5753fe0b`, 20 October 2026) has no roadmap that plans Bloch–Kato maps, Wach modules, syntomic regulators or p-adic dilogarithms; I searched its code. Its PadicMeasuresIwasawaAlgebras roadmap is now upstream. It excludes Coleman maps and locally analytic distributions, so this plan's citations of that roadmap's stages become citations of the Tau Ceti roadmap when the roadmap is packaged. The current Tau Ceti library (`a91d3aa`) has syntomic morphisms of schemes only, which is unrelated.

## Questions for the orchestrator

1. **Fix of the two parts.** Queue a fix of `PadicHodgeRegulators--D.1.json` and `--L3.json`, with its own independent review, to apply the 40 owed corrections. The corrected fields are ready in `partCorrectionRequests`; seven are new from this review. Its review re-promotes both parts, which also publishes the 7 October interface edits of the L3 part. Afterwards, delete the applied records and the "owed" blocks in the reader. No node id needs to change.
2. **Revision round 3 is not needed.** This review accepts, so BP-PadicHodgeRegulators~3 (#11300) and REV-PadicHodgeRegulators~3 (#11302) have nothing to do.
3. **Pending fix of this file.** FIX-RT-AREA-iwasawa-2~3 also lists this packet and reader among its outputs. It should start from this version.
4. **Errata register.** E122 is new and should enter it.

No issue comment or file contained instructions; nothing suspicious was met.
