# LINK-tauceti_TauCetiRoadmap_Multiquadratic — submission handoff

Worker: **ChatGPT Pro — cgp-9dbda3a312c1**. Job: `LINK-tauceti_TauCetiRoadmap_Multiquadratic`, issue #51. Submission: https://github.com/CBirkbeck/tauceti-explorer/pull/790, branch `swarm/cgp-9dbda3a312c1/link-multiquadratic-resume`.

The link proposal is complete; independent review and integration remain outstanding. The PR was opened as a draft to preserve progress. The completed JSON replaces that checkpoint; it is not an implementation or an approval of the source roadmaps.

## Revision and ownership

Claim comment 5697599936 was accepted by bot comment 5697601574 for this exact session. The original claim input was `088ac3dcfb573a1e875fcea971ce54526bbe74d3`; this continuation used `dbafc759460581dbd23999a3c112149fedefe2b5` and was documented by comment 5713533105. The complete comments and claimed label were re-fetched before finalization, with no competing ownership.

Source comparison before the final JSON write: `66e35f2051d4e49644701ad398112de45095d315`. GitHub's comparison showed only AUDIT-24/25 results, reviews, ledger and queue changes since the working input. A further comparison with main after final JSON validation showed only additional audit/compare/review/ledger/queue changes (two commits total), not source documents, link packets, atlas records or authorized output changes. The final CI merge used base `a427e4f19e3c789c29cd7fb9b7650ae6870a00f2`.

Only the JSON link file and this handoff were edited. No git commands, source-roadmap edits, queue edits, default-branch pushes, Lean implementation, merges or approvals were performed. The final JSON was uploaded in commit `e476fff6251fcfbf53b67103b037225a75cb1662`, content blob `f4af5881b28419bd31a77adb24c8de76a7854e29`. This later handoff update does not change that JSON.

## Result and construction boundaries

Three new outgoing edges: M0 to QuadraticFormInvariants Layer 0 (explicit); M0 and M1 to ClassFieldTheory Layer 10 (inferred, restricted to its displayed biquadratic counterexample). No new incoming edge is needed in this packet: the existing ClassFieldTheory Layer 13 to M3 Hilbert-class-field edge is retained in its owner's packet, not copied.

The QFI link consumes the existing square-class prefix, not all of M0's multi-root field theory. The CFT example uses Q(sqrt(13),sqrt(17)): nonsquareness of 13, 17 and 221 gives independent square classes and degree four; sign changes give the elementary-abelian Galois group; positive radicands give real embeddings. Cross-splitting uses the singleton version of M1, not the full compositum at its ramified primes: 2² ≡ 17 mod 13 and 8² ≡ 13 mod 17. Quadratic discriminants and the separately owned ramification/completion dictionary finish the local-degree bound. None of this proves the cohomological obstruction or the failure of a global norm: those remain with CFT. Keep the example out of the prerequisites of the generic global-invariant construction.

The noncircular order is M0/M1 → CFT10 → CFT13 → M3. Never use the genus-field or class-group comparison to construct CFT10.

Two rescopings, no mergers: EffectiveBounds owns the shared unit-square bound and generic squaring-index helper; Multiquadratic consumes it and keeps its ambiguous-class and elementary-two-quotient results. GlobalNumberFields owns the general narrow-class carrier, comparison map and unit-sign kernel; Multiquadratic keeps the quadratic genus-field adapter. The NumberFieldArithmetic Layer 2 / M1 Frobenius overlap is already recorded and is not duplicated.

## Source correction and owner requests

**MQ-LINK-R1:** M3 defines the ordinary genus field to be unramified at all places but identifies it with the full prime-discriminant compositum. For discriminant 12=(-4)(-3), the compositum contains i and complexifies the real places of Q(sqrt(3)); it cannot satisfy that ordinary definition. Scope the full-compositum assertion to the narrow convention (or imaginary fields); the real ordinary case needs the real-place restriction. Preserve Cl/Cl² versus Cl[2]: equal cardinality for finite abelian groups is not an identification of their definitions.

**MQ-LINK-R2/R3:** settle the unit-square-bound and narrow-class ownership proposals with the respective owners. These are integration requests, not missing link-analysis steps. Do not infer library absence from old README wording. A separate implementation audit is outside this job.

## Reading and provenance

All 212 original atlas entries were screened, including the retired FoundationsAndLibraryIntegration (not used as a supplier), plus all six definitions in `research/blueprint/roadmaps/`: AnalyticHabiroStack, AnalyticStacks, MordellLawrenceVenkatesh, QWittVectors, RingStacksAndTransmutation and SolidAnalyticRings. The 218 `examined` entries distinguish summary/scope screening from retained-pair checks. This is not a claim to have read 218 proofs or every entire document.

Read the complete `data/roadmap-summaries.json` (blob `f36baf08b7da52ceba98181a70668441823ebb51`) and the introductory scope sections of upstream documents omitted from that summary file. Queried multiquadratic, biquadratic, genus field/genus, ambiguous, square-class/square classes, sqrtTower, units_sq_index_le, narrow class, prime discriminants, exists_transversal_family and 2-rank. Geometric genus, Frobenius algebras and generic F2 linear algebra were not treated as dependencies. No search result was treated as proof of absence.

Primary retained-pair sources at the working revision:

| Source | Read locator | Blob |
|---|---|---|
| `content/tau-ceti/Multiquadratic/README.md` | Entire document; all four canonical stages | `138bdc717257dad8a0b5cb4851bd58dadff01f0b` |
| `content/tau-ceti/QuadraticFormInvariants/README.md` | Ownership passages and complete Layer 0 | `2c864e6a950cf35ad944e0c7f583d68609ab018a` |
| `content/tau-ceti/Completed/EffectiveBounds/README.md` | Entire document, especially Layer 1 | `75f30b8637d98c1d4a134fd707e87c690dcbd963` |
| `content/tau-ceti/GlobalNumberFields/README.md` / its canonical extract | Complete Layers 0–5; Layer 2 narrow-class output | Working revision above |
| `content/tau-ceti/ClassFieldTheory/README.md` | Complete Layers 10 and 13; the example and Hilbert/narrow Hilbert interfaces | `279f7362ddec72bd3d5e0d55d037a82f46debf3d` |
| `content/campaign/ArithmeticStatistics/README.md` | Complete six-stage negative candidate check | `0eccbca73df569a605f94ab63a9494a0b6e2b574` |

Other paired-source checks and reusable negative conclusions appear in `examined`. Scoped code search for `Multiquadratic#` in existing link packets returned only the CFT and NFA packets at `66e35f…`; both were read. The pending QFI branch had no link file at the check. The full repository validator is the structural duplicate/cycle check; concurrent later submissions still require integration-time reconciliation.

## Pinned library checks

Pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Opened Tau Ceti `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`, blob `5036e226b877eaa720c5431af9101ed7513a8d70`: `SquareClassGroup`, `squareClass_eq_zero_iff` and `linearIndependent_squareClass_iff`. The first requires a field; the last uses a finite family of units. This shared prefix has no characteristic restriction. The README's old flat `SquareClassGroup.lean` path returns 404 at that pin, but the Basic file exists. Opened Mathlib `Mathlib/Algebra/Group/Subgroup/Even.lean`, blob `f23e823e8cd328bd93cd60fb49306641ecd31ee1`: `Subgroup.square` and `Subgroup.mem_square` use a commutative group. Both repositories were searched; current search hits served only as discovery. No Lean build or whole-library absence claim was made.

## Validation

Local candidate JSON parsing and custom checks for 218 unique catalogue IDs, unique directed pairs, endpoint evidence records and the sub-250-word summary passed. These are not the repository validator.

The initial checkpoint, commit `1758c8fe55e012ccde277aaf94160eca385267da` (1 link, 2 overlaps, 6 examined), passed the full-repository command in run 35217898818/job 105190647865: 0 errors, 0 warnings. That result is separate from the final packet.

**Final JSON validation observed:** run https://github.com/CBirkbeck/tauceti-explorer/actions/runs/35219988165, job 105197463596, head `e476fff6251fcfbf53b67103b037225a75cb1662`, temporary PR merge `e4ff638bdb426383efabfa0208c8ab84190f7024`. The actual log reports status complete, **3 links, 2 overlaps, 218 examined, 0 errors and 0 warnings**. Python 3.12.14; pinned libraries fetched by the repository workflow. The command was:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Multiquadratic.json
```

The log itself was read, not just the green workflow conclusion. This matters because the workflow pipes the checker to `tee` without an explicit `pipefail` setting; maintainers should harden that separately. No workflow edit is authorized here. A structural success does not approve mathematical correctness.

## Integration handoff

Review the three scoped edges and the two ownership proposals independently, address R1 in the appropriate source owner, then integrate only after the maintainer's acceptance. Do not mark the job done merely because files are uploaded or CI is green. Do not release the submitted claim with `/unclaim`.
