# Independent review REV-KTheoryLowDegrees--U.1~2

**Verdict: needs_changes.** Issue #6455. Codex, session `codex-p6t3b7`, 2026-10-05. This is a completed independent review of revision round 2, not a planning checkpoint. This session wrote neither planning round.

The clear corrections are applied to the authorized packet and suggested Lean file. The reader is read-only in this issue. It still contains a false identity-transvection conjugacy statement and proof routes that use library declarations outside their hypotheses. It must be regenerated before publication. Four explicitly delimited proof boundaries remain uncertified. Honest partial stages and supplier requests alone are not rejection grounds.

## Scope and counts

All **332 input nodes** were independently checked: statements, hypotheses, proof steps, sources and excerpts, prerequisites, API, tests and intended Lean signatures. The input's **481 named baseline declarations** were read at the exact pins, with their enclosing variables/typeclasses, across 218 modules. The two new lemmas and three new citations were checked separately. Final counts:

| Item | Count |
|---|---:|
| Nodes | 334 |
| Definitions / constructions | 23 / 48 |
| Lemmas / theorems / comparisons / applications | 172 / 69 / 12 / 10 |
| API items / unit tests / planets | 498 / 285 / 44 |
| Baseline declarations / modules | 484 / 221 |
| Gaps / supplier requests | 9 / 8 |
| Verified / corrected / added / unverifiable verdicts | 310 / 18 / 2 / 4 |

Nineteen existing nodes have corrections, including native-signature or test-label changes; one also remains `unverifiable`, so there are eighteen `corrected` verdicts. Every final node has exactly one verdict. The 32 nodes added by the previous reviewer retain their original `addedBy` provenance; only the two additions below name this review.

| Stage | Nodes | Coverage |
|---|---:|---|
| Z.1 | 53 | source_decomposed |
| Z.2 | 30 | source_decomposed |
| U.1 | 27 | source_decomposed |
| U.2 | 22 | source_decomposed |
| U.3 | 44 | partial |
| U.4 | 113 | partial |
| U.5 | 31 | partial |
| U.6 | 14 | partial |

No stage is closed. Packet `complete` describes the bounded pass, not completed implementation or the elimination of its partial stages. The two additions separate existing proof obligations rather than begin another planning pass. The four source-decomposed stages' current targets and their direct proof inputs were checked. All 71 definition/construction nodes have at least three tests; all implementation statuses remain `unchecked`.

## Previous review and revision

Read the entire previous review and revision handoff. All 32 declaration splits survive, with their atomic signatures and consumer dependencies. Checked the previous corrections to BMS principal scalar congruences and membership witnesses, common residue images, canonical supplier edges, pairing scope, determinant-value tests, rank-fibre boundary case, relative SK₁ kernel/splitting, completion inclusions, transfer direction and source errors E113–E114.

The revision regenerated the old reader's principal-ideal and relative-comparison passages: it now uses `a−1∈qA` rather than merely `a−1∈𝔮`, and explicitly rejects the double-ring five-lemma shortcut. Those particular old reader objections are resolved. The substantive proof boundaries themselves remain recorded. This fresh review found additional errors below; acceptance cannot be inferred solely from synchronizing the previous review's edits.

## Corrections applied

1. **Arbitrary-ring GL maps.** The pinned `Matrix.GeneralLinearGroup.map` inherits `[CommRing R]` and `[CommRing S]` from `GeneralLinearGroup/Defs.lean`. Qualified its baseline description. In `Z.1/stable-idempotent-monoid`, replaced that proof/prerequisite by the already planned `U.1/general-linear-map`, namely `Units.map` of `RingHom.mapMatrix`. Removed the same inappropriate citation from `U.5/congruence-subgroup` and explicitly formed its kernel using `glMap(q)`. Its native definition already uses the general map. The commutative compatibility citation in `general-linear-map` remains valid.
2. **Finite bases over arbitrary rings.** `Module.finBasis` and `Module.finBasisOfFinrankEq` inherit `[StrongRankCondition R]` from `Dimension/Free.lean`'s enclosing section. Qualified both baseline descriptions. `Z.1/stably-free-free-class` cannot invoke `finBasis` under an arbitrary `Ring R`. Its proof now uses `Module.Free.chooseBasis`, `Module.Free.ChooseBasisIndex.fintype`, and `Fintype.equivFin`; these have no strong-rank-condition requirement. The finite-index instance explicitly handles the subsingleton ring. Removed the unused restricted prerequisite from `Z.1/stably-free-class`. The commutative local-freeness citation remains applicable.
3. **Rank-zero centralizer case.** `U.1/stable-elementary-centre` formerly invoked the rank-at-least-two lemma at `n+1` for arbitrary `n`, including zero. First pad to `max(n,1)`, then add the final identity coordinate. Added the finite-representatives prerequisite. The final diagonal entry still forces the scalar to be one.
4. **Mathlib includes the identity transvection.** `U.3/division-ring-elementary-normal` claimed every Mathlib transvection was conjugate to `e₂₁(1)`. `LinearEquiv.refl_mem_transvections` supplies the counterexample: identity cannot be conjugate to a nonidentity matrix. Dieudonné n°4, printed p.31, explicitly excludes identity for conjugacy. Removed that assertion from the normality node and separated its non-routine basis argument into `U.3/division-ring-transvection-conjugacy` (nonidentity, rank at least two). Added `U.3/division-ring-transvections-elementary`, treating identity separately and using normality for the other case. Both nodes are marked `addedBy` for this review. Their native atomic signatures replace the formerly bundled membership conjunct. Acceptance cases include identity, rank one and rank two over 𝔽₂.
5. **Finite S in the native arithmetic statements.** Added `(hS : S.Finite)` to `dirichlet_theorem_arithmetic_type`, `dirichlet_theorem_number_field`, `prime_choice`, `power_reduction_non_totally_imaginary`, `power_reduction`, `mennicke_group_locally_cyclic`, `mennicke_group_exponent`, and `arithmetic_mennicke_symbols_trivial`. Their packet hypotheses already require finite S. The omission is substantive: invert all finite primes and the S-integer ring becomes F, which has no nonzero prime ideals; the prime-selection conclusions then fail. The full-ring-of-integers totally-imaginary signature needs no S parameter.
6. **Obsolete patching gap.** The hypotheses of `U.5/ideal-boundary` and `ideal-sequence-degree-zero` still said no atlas layer planned Milnor patching. Replaced this with the actual sixteen Z.1 `milnor-*` inputs. Their explicit corestriction, gluing orientation and three exactness arguments already have the correct direct prerequisites. No gap is concealed or newly removed.
7. **Abelianization direction.** The pinned `Abelianization.equivOfComm` is `H ≃* Abelianization H`. Corrected the field compatibility API and test in `dieudonne-determinant` to use `.symm` on the abelianized determinant. The corresponding native signatures already used this direction.
8. **Locator and test labels.** Corrected `relative-first-row-completion`'s BMS Lemma 5.3 locator to printed p.101, PDF p.44. Annotated the four existing relative-SK₁ examples with their packet test names; their statements are unchanged. Updated the packet summary and review record to the final inventory.

Three baseline entries had descriptions fixed; no declarations were deleted from the inventory. Inappropriate direct uses were removed or redirected as above. Added exact-pinned citations for `Module.Free.chooseBasis` (`FreeModule/Basic.lean:88`), `Module.Free.ChooseBasisIndex.fintype` (`FreeModule/Finite/Basic.lean:28`) and `Fintype.equivFin` (`Data/Fintype/EquivFin.lean:80`). All 484 final names exist at their stated pins. No unchecked current-HEAD theorem is imported into the baseline.

## Source evidence and ownership

Fresh downloads of all ten public PDFs match the recorded SHA-256 hashes. Their URLs and this review's actual reading scopes are recorded in `sourceVersions`. Read all current node passages in [Weibel's author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), [Bass 1964](https://www.numdam.org/item/10.1007/BF02684689.pdf), [Dieudonné 1943](https://www.numdam.org/item/10.24033/bsmf.1345.pdf), [BMS 1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), [Milne ANT](https://www.jmilne.org/math/CourseNotes/ANT.pdf), and [Conrad's note](https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf). PDF and printed page offsets were checked; Milne's class-group pages were also inspected as images.

Read the cited routing passages of [Bhatt–Scholze](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), [Calegari–Geraghty Remark 9.3](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), [Serre's SL₂ article](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), and the complete four-page [Serre 1974 erratum](https://www.numdam.org/item/10.1007/BF02685884.pdf). Checked all 21 routed Bhatt–Scholze contracts and retained the companion packet's nonaccepted supplier status. No higher determinant, spectrum or localization construction is duplicated here. No proof read of the inaccessible `Corps locaux` propositions or of the full Moore classification is claimed.

All **14 sourceIssues** have fresh `confirmed` reviews naming this job. Checked their printed text and mathematical corrections, including the matrix-ring free-class index, ideal-intersection misprint, displaced finite-rank commutator exception, BMS prime-index/S-integer scope, arbitrary-ring parameter in Lemma 9.4, withdrawn A.23(b) exponent, and reverse push-pull/kernel counterexamples. No new source error is asserted: the identity-transvection mistake is in the plan, not Dieudonné. K-book findings remain scoped to the author draft; historical errata searches retain their own provenance.

Read the eight relevant entries of the reviewed library audit and the full accepted RS-18 contract. Existing categorical SplitK0/ExactK0, projective exact structures, stalk rank, matrix Morita equivalence and Spin covering machinery are consumed. Read the upstream GrothendieckEulerForms and Chebotarev documents, plus the relevant CFT 5/12/13, GlobalNumberFields 6/7 and LieGroups 9 statements. Checked the finer GeneralAlgebraicKTheory and SchemeKTheoryOperations supplier nodes and the H.1–H.3 homotopy contracts. Every request has its canonical direct stage edge on every named consumer. Requests specify carriers, map orientation and topology rather than claim those suppliers are implemented.

RT-AREA-ktheory-1/9 is correct in both packet and reader: T.5 owns degree-two tame-kernel examples/sequences, N.6 owns certificates, U.6 supplies classical K₁ examples, and companion Z.6 supplies K₀(ℤ). RT-AREA-ktheory-1/24 is correctly realized by the finite-S valuation-kernel/class-group finite-index rank argument and a separate noncanonical fundamental-unit splitting. RT-AREA-ktheory-1/25 now has CFT/Chebotarev inputs with their actual number-field scopes. The higher reciprocity cycle remains a specific gap, rather than a fictitious acyclic CA.1 import. The CG route retains the missing Hecke/localization H¹ interface; finite central congruence kernel alone is not such a vanishing theorem.

The API/tests check includes row/left-module versus column/right-module conventions, nonfree projective Morita/transfer cases, zero-ring spectra, torsion fibre versus stalk rank, conjugate relative elementary generators, double-ring multiplication, boundary sign, principal scalar ideals, nonunique standard forms, determinant-value-2 cases, oriented Related and reflected-transpose formulas. These tests would reject the corresponding tempting wrong definitions. The 44 planets remain mathematical objects and named theorems, with at most six per stage.

## Unresolved boundaries and orchestrator action

The four `unverifiable` entries name exactly: the final SL-to-SO retraction in the real-circle obstruction; general-degree local-symbol/Artin/power-subgroup inputs for non-totally-imaginary power reduction; the wild higher-unit and reciprocity inputs in its totally-imaginary counterpart; and the relative-plus/excision-defect degree-one comparison. Their source statements were read, but the stated proof boundaries are not silently treated as established. Downstream conditional plans retain these transitive dependencies.

Authorize regeneration of `research/blueprint/readmes/KTheoryLowDegrees--U.1.md` from this corrected packet. In particular follow node IDs `stable-idempotent-monoid`, `stably-free-free-class`, `stable-elementary-centre`, `division-ring-elementary-normal`, the two added transvection nodes, `dieudonne-determinant`, `ideal-boundary`, `ideal-sequence-degree-zero`, and `relative-first-row-completion`; also refresh the baseline descriptions and inventory. The readonly reader currently contradicts those corrections. Do not promote it as an accepted review.

Keep the four partial stages and nine gaps precise. Closing the relative comparison requires an actual sourced low-degree relative-plus and boundary argument. Closing the BMS arithmetic proof requires the recorded reciprocity, general-degree orientation/topology and higher-unit inputs; closing the real-circle proof requires the correctly topologized retraction. These are distinct future planning obligations, not an instruction to duplicate their supplier roadmaps.

## Validation

The packet checker reports **0 errors, 0 warnings**. Additional structural checks confirm one verdict per node, all 14 current source-issue reviews, retained original node IDs, marked additions, canonical request edges, minimum test counts, API/test name presence, unchanged implementation status, valid JSON and only authorized changed paths. `git diff --check` passes.

The entire input Lean file was read. `lean-check` was attempted with 96 GB available; it stopped at the first Tau Ceti import, because `TauCeti.CategoryTheory.Exact.Functor.olean` is absent. The shared Tau checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the packet pin; Mathlib matches. The file **did not compile**, and no declarations were reached. No build, update, cache fetch or Lean server was started. A complete existing build at the exact Tau pin is needed before the final prototype can be elaboration-certified.

The review and authorized corrections are complete. Resume acceptance with reader regeneration and the explicitly identified proof boundaries; this handoff is not an unfinished reviewer checkpoint.
