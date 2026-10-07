# BP-KTheoryLowDegrees--U.1~3 — revision handoff

**Complete bounded revision pass.** Issue #6974. Codex, session `codex-cSlCMz`, 2026-10-07. Branch `codex-cSlCMz-k1-revision3`. This is the third revision of part U.1, following [REV-KTheoryLowDegrees--U.1~2](../reviews/REV-KTheoryLowDegrees--U.1~2.md). It is ready for independent review, not an implementation or an acceptance verdict.

The input already had **334 nodes**, beyond PROTOCOL section 0's approximately 300-node budget. This pass adds **zero nodes**, retains every input ID and all earlier `addedBy` provenance, and leaves the independent `review` object unchanged. The previous revision audit is preserved in `previousRevisionAudits`. All implementation statuses remain `unchecked`.

## Deliverables and inventory

Only the issue's four authorized paths change: the [packet](../packets/KTheoryLowDegrees--U.1.json), [reader](../readmes/KTheoryLowDegrees--U.1.md), [suggested file](../suggested/KTheoryLowDegrees--U.1.lean), and this handoff. The reader has been regenerated from the final packet, retaining the established declaration order and including both previously missing transvection lemmas. It also exposes recorded proposed declaration names and the exact remaining obligations of each partial stage. Source corrections now render their scalar `affects` descriptions as prose instead of erroneously iterating them character by character.

| Item | Final count |
|---|---:|
| Nodes | 334 |
| Definitions / constructions | 23 / 48 |
| Lemmas / theorems / comparisons / applications | 172 / 69 / 12 / 10 |
| Definition/construction API items / unit tests | 498 / 285 |
| Planets | 44 |
| Pinned baseline declarations / modules | 484 / 221 |
| Gaps / supplier requests / source issues | 9 / 8 / 14 |

The extra API/test entries on lemma nodes are also rendered and checked; the table follows the packet checker's definition/construction counting convention.

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

No stage is closed. Packet `complete` means this bounded pass has finished and all boundaries are recorded. It does not mean every proof or stage target has been established.

## Disposition of the review corrections

The review's in-place corrections are retained and reflected in the reader:

1. **Arbitrary-ring GL maps.** `Matrix.GeneralLinearGroup.map` is described with its enclosing `CommRing` assumptions. `Z.1/stable-idempotent-monoid` and `U.5/congruence-subgroup` use the general `Units.map`/`RingHom.mapMatrix` construction in `U.1/general-linear-map`. No arbitrary-ring contract is narrowed to commutative rings.
2. **Finite bases.** `Module.finBasis` and `finBasisOfFinrankEq` have their actual `StrongRankCondition` assumptions. `Z.1/stably-free-free-class` uses `Module.Free.chooseBasis`, the finite chosen-basis index and `Fintype.equivFin`, including the subsingleton-ring branch. The obsolete restricted prerequisite is absent from `stably-free-class`.
3. **Centralizers at rank zero.** `U.1/stable-elementary-centre` first pads to `max(n,1)` and only then to rank at least two. The final identity coordinate forces the scalar to one.
4. **Identity transvections.** `division-ring-elementary-normal` no longer claims every transvection is conjugate to `e₂₁(1)`. `division-ring-transvection-conjugacy` assumes nonidentity and rank at least two; `division-ring-transvections-elementary` treats identity separately. Their atomic native signatures and identity/rank-one/rank-two-over-𝔽₂ acceptance cases survive.
5. **Finite S.** All eight corrected arithmetic native signatures still contain `(hS : S.Finite)`. The reader uses finite sets of finite places, with BMS's archimedean convention translated explicitly. Inverting every finite prime is not admitted by these statements.
6. **Milnor patching.** `U.5/ideal-boundary` and `ideal-sequence-degree-zero` point to the actual sixteen `Z.1/milnor-*` contracts. The reader no longer repeats the obsolete claim that patching has no owner.
7. **Abelianization orientation.** The field compatibility API and test use `Abelianization.equivOfComm.symm` to send the abelianized determinant into field units, agreeing with the pinned declaration and native signatures.
8. **Locator and test names.** `relative-first-row-completion` cites BMS Lemma 5.3 at printed p.101 / PDF p.44. The four relative-SK₁ examples retain their packet test-name annotations.

The review's 310 verified, 18 corrected, two added and four unverifiable verdicts are preserved as historical independent findings. This revision does not relabel any of them as accepted.

## The four proof boundaries

These remain delimited future obligations, with their owning supplier directions preserved. They are not instructions to create duplicate general constructions in this part.

- **`U.3/SK1-real-circle-nonzero`.** The missing input is a continuous retraction for every N≥2 from the determinant-one real matrix subtype with coordinate topology to the pinned `specialOrthogonalGroup (realCliffordForm N 0)`, fixing its coordinate inclusion. The LieGroups layer-9 request and direct prerequisite already specify this exact carrier and topology. The frame, Spin coordinate comparison, nonclosing lift and SO obstruction are separate existing nodes. Corrected the suggested-file comment: `circleRing_dedekind` already supplies the independent Dedekind assertion; that assertion is not an additional gap.
- **`U.4/power-reduction-non-totally-imaginary`.** Isolated n=0 first: the smaller-principal-ideal pair gives c=b′ directly. For n>0, the missing inputs remain the general-degree cohomological/Artin dictionary in BMS orientation, open finite-index local power subgroups, tame formula and product reciprocity. CFT layer 5 supplies the cohomological pairing, not all these arithmetic consequences; layer 6's exponent-two comparison cannot supply the general degree. The CA.1 → T.7 → … → U.4 cycle remains a proposed restructuring, not a removed edge.
- **`U.4/power-reduction-totally-imaginary`.** The same n=0 branch is elementary. For n>0 and j_p(𝔮)=0, the additional missing input is BMS (A.17)'s higher-unit pairing image, yielding a generator at a prime above p. BMS's printed proof invokes unread Serre propositions; no proof certification of those inputs is claimed. The general positive-j finite-level calculation remains its distinct open target.
- **`U.6/relative-K1-homotopy-comparison`.** Added the algebraic calculation behind the double-ring hint. For D=A⊕I and J=ker pr, add identifies GL(J) with GL(I) and E(D,J) with E(A,I): lift conjugating elementary matrices through the common section Δ and coefficients through (0,x). The split fibre therefore has the expected classical group. The remaining obligation is to prove that the induced map to the quotient homotopy fibre is an isomorphism on π₀ and π₁ and that both boundaries agree: the Steinberg boundary from K₂(A/I), and the Milnor-patching boundary from K₁(A/I). The packet explicitly separates this from the algebraic calculation, general Milnor-square excision and the independent T.1:plus/T.6 stage cycle. Added the direct congruence/relative-elementary prerequisites and the split-exercise source locator; clarified the prime assumption in the ℤ/p² case and included I=0.

## Remaining stage targets and ownership

All nine gap entries, eight requests, 13 structure proposals and 21 routed Bhatt–Scholze items remain visible in the reader. Accepted RS-18 governs the ring/projective extension of the existing GrothendieckEulerForms roadmap. Existing categorical K₀, stalk ranks, group completions and Spin machinery are consumed; no new categorical K₀, determinant groupoid, spectrum, plus construction or generic relative fibre is planned here.

For U.4, resume finite relative Mennicke universality at BMS §10's final swap. Keep the higher-rank Proposition 8.6 case separate from the Dedekind rank-two Proposition 8.5 case. Then supply §11's congruence defects, transition maps and compatible root normalization, the arithmetic/congruence completion specialization and Theorem 14.1. Serre's SL₂ infinite-unit theorem and the CG localized-H¹ Hecke/SL-to-GL interface remain separately delimited targets. A finite central kernel alone is insufficient for the asserted localized cohomology vanishing, especially when the coefficient characteristic divides its order.

RT-AREA-ktheory-1 findings 9, 24 and 25 retain their corrections: T.5 owns degree-two tame-kernel examples, N.6 certificates, this U.6 classical K₁ examples, and companion Z.6 K₀(ℤ); the finite-S unit rank and noncanonical splitting are distinguished; CFT/Chebotarev imports retain their number-field hypotheses. The touching CH-L17/18 links agree with these contracts. CFT-L80 is an inferred stage link, not a proof that the general BMS symbol/reciprocity/topology package has been supplied.

## Reading and validation

Read the full current issue, review and previous revision handoff, the binding protocols, accepted RS-18, the eight-stage reviewed library audit, current stage targets, upstream GrothendieckEulerForms and Chebotarev examples, the relevant supplier contracts and touching link maps. This was a revision-scoped verification, not a fresh independent reread of all 484 declarations or all source papers.

Re-read the changed library boundaries at the exact Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`: the enclosing hypotheses of GL maps and finite bases, `chooseBasis`, `ChooseBasisIndex.fintype` with its zero-ring handling, `Fintype.equivFin`, `refl_mem_transvections`, and the direction of `Abelianization.equivOfComm`. The Tau Ceti source pin remains `f790474821cf4256814db967cb154e7af3d0c369`.

Fresh public K-book, Dieudonné and BMS PDFs match their recorded SHA-256 hashes. This revision's actual reading scopes are appended to `sourceVersions`: the circle example; classical/split relative K₁ and the two relative-homotopy passages; Dieudonné's nonidentity conjugacy; BMS Theorem 3.5, (A.13)–(A.21) and Lemma 5.3. Existing source-issue reviews and source-reading provenance are unchanged.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.1.json`, with the shared pinned declaration index: **0 errors, 0 warnings**.
- Exhaustive packet-to-reader field checks for all 334 nodes, including hypotheses, proof steps, acceptance cases, uses, API, tests, prerequisites, proposed homes/names and source locators/matches; all 484 baseline descriptions, coverage notes/remaining obligations, gaps and requests agree.
- Unchanged independent review, input ID order and earlier-addition provenance; all implementation statuses unchecked; all 71 definitions/constructions have at least three tests; all API/test names occur in the suggested file; eight finite-S signatures and two atomic transvection signatures remain present; at most six planets per stage.
- `git diff --check`, valid JSON and only the four authorized paths changed; `intake.py check-files` reports **4 files, 0 problems**.

**The suggested Lean file did not compile.** `lean-check` was attempted with 99 GB available. It stopped at import line 9 because `TauCeti.CategoryTheory.Exact.Functor.olean` is missing; no body declaration was reached. The default shared Tau checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the packet pin, while Mathlib matches. Read-only inspection found no complete existing build at the exact Tau pin. No build, update, cache download or Lean server was started. This revision changes only comments in the native file; textual signature coverage is not elaboration certification. A complete existing pinned build is still required for that certification.

The next action is independent review of this synchronized bounded pass and its precise remaining proof obligations. This run takes no second job.
