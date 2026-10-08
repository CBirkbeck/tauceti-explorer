# AG2.6–AG2.7 revision, round two

Issue #6925; job `BP-AutomorphicGaloisRepresentationsPartII--AG2.6~2`.
Codex (GPT-6), session `codex-HkFZzt`, 8 October 2026.

**Complete target-level revision, ready for independent review.** This is not a checkpoint. The packet is `complete`; AG2.6 and AG2.7 are both `planned`, neither `closed`. Every declaration remains implementation `unchecked`. The prior independent `needs_changes` review object is preserved verbatim for the next reviewer to replace.

The four deliverables are the existing AG2.6 packet, reader and suggested Lean file, plus this handoff. All 43 node IDs, 58 API names, 49 test names and 11 planets are retained. No supplier packet, upstream roadmap, atlas data, queue or review report was edited.

| Quantity | Revision result |
| --- | --- |
| Nodes | 43: 7 definitions, 7 constructions, 22 theorems, 6 comparisons, 1 lemma |
| Suggested main names / API names | All 38 unique main names / all 58 API names occur as actual declarations |
| Tests | All 49 have uniquely labelled typed examples; 4 additional acceptance examples |
| Planets | 11: 5 in AG2.6, 6 in AG2.7 |
| Pinned baseline citations | 11: the original 7 plus 4 actual Mathlib interfaces |
| Supplier requests | 19 entries, 17 distinct suppliers |
| Recorded gaps | 5; no full supplier closure claimed |

## What this round changed

1. Replaced the prose register with concrete definitions and typed construction, API, theorem and example signatures. The representation adapter uses Mathlib’s matrix-to-linear equivalence. Semisimplicity is the existing `Representation.IsSemisimpleRepresentation`; absolute irreducibility is the existing `Representation.IsIrreducible` after coefficient extension to `AlgebraicClosure`. Neither foundational notion is replanned.
2. Made the R24 carrier imports and automorphic assembly **conditional** on the owner correcting its data/predicate contradiction. The request now specifies raw data, separate Weak/VeryWeak/ExtremelyWeak and Pure/Polarized predicates, weakening, assembly/projection coherence and coefficient change. `System` and its operations in Lean are external parameters; AG2 declares no replacement carrier and no fake automorphic representation type.
3. Replaced the geometric node’s use of the insufficient named AG2.1a attached-representation conclusion by its owning stage’s precise raw-interface request. The raw cohomology/projector/degree/multiplicity/Tate dictionary precedes period comparison. Split the former combined request into two independently specified inputs: this raw interface and Caraiani’s tensor-square/closed-stratum concentration interface.
4. Added `suggestedCoverage` to every node and each partial test, recording what its actual algebraic statement contains and which supplier hypotheses/results are absent. Some named theorem forms omit necessary automorphic/geometric hypotheses under section 13; they are explicitly identified as output signatures, not valid assertions about arbitrary matrices. No proposition-valued placeholder field or empty predicate stands in for those hypotheses.
5. Made the residual, Galois-type and non-Eisenstein definitions concrete. The generic-prime predicate retains the entire external nonempty place fiber, complete splitting through e=f=1, every-place genericity, and coefficient characteristic ℓ. Recognition components retain characteristic-zero or finite-residue-field hypotheses as appropriate.
6. Made export tests exercise their wrappers: rank-one good/nonselfdual inhabitants, a polarized wrapper’s complete weight-k Hodge multiset, actual residual and unitary package projections, and failure of irreducibility for the two-character block sum. Replaced the weak rational-trace/based-matrix test by quaternionic matrices with rational traces and an obstruction to a Q model. The unipotent lattice tests honestly retain only the unequal reductions at t=1 with equal characteristic polynomials.
7. Rebuilt the reader from the corrected packet statements, hypotheses, proof routes, prerequisites, APIs, tests, requests, gaps and source records. Its introduction also preserves the distinctions between semisimplified Weil equality, monodromy dominance and a full map intertwining N. Removed every source `excerpt` field. The source-issue schema’s legacy `printed` fields now contain paraphrases, while the independently confirmed E3–E5 verdicts remain unchanged.

## Corrections verified against the sources

The reviewer’s in-place corrections were checked against the identified public versions and mirrored into the reader. In particular:

| Interface | Retained correction and source |
| --- | --- |
| Polarized coefficient-prime theorem | BLGGT Theorem 2.1.1(3)–(4), pp.32–34; no nonexistent (4)(b) locator |
| Monodromy bound | AHTW Definition 6.0.2 and Corollary 6.0.6, pp.111–112; ordered blocks by irreducible Weil type modulo unramified twist, with semisimplified Weil equality a separate input |
| Strong fields | CH Proposition 3.2.5, p.12 gives enlarged-field existence for the general conjugate-self-dual cohomological cuspidal branch; Liu Definition 3.2.5/Remark 3.2.6/Hypothesis 3.2.10, pp.145–146 retain the relevant specialization and conditional minimal-field consequence |
| GSp4 | CG Proposition 6.8(3)–(4), author-copy pp.38–39, retains good level, regular weights, p-Hecke eigenform and both ordinary unit conditions; Pilloni Theorem/Remark 5.1.7.1, pp.22–23, retains the reciprocal polynomial dictionary |
| Finite local realization | The compact-image, countable-closed-subgroup Baire proof in CG p.39 comes before the lattice theorem; finite coset entries provide the final finite local coefficient extension |
| Auxiliary genericity | ACC+ Definition 4.3.1(2)/(3), pp.972–973 separates a completely split all-place prime from its existential witness; Liu D.1.2/footnote 37, p.365 uses arbitrary local fields, and D.1.4, p.368 gives a split local place, not the stronger all-place rational-prime witness |
| Global transfer/unitary exports | ET.7a is the pure global supplier. CS §5.1 and Corollary 5.5.5/Remark 5.5.6, pp.730–731 and 745–746 retain the literal occurrence/setup, rank nᵢ, parity twists and corrected imaginary quadratic 𝒦 in place of undefined F₀; full local comparison is away from ℓ |
| Recognition/descent | R01.5 already owns arbitrary-rank recognition. Its additional request is the precise split regular-Frobenius descent criterion with two good places of different residue characteristics, not generic rank-two recognition |
| Pseudodeformations | AHTW §3, Theorem 3.2.4 and Theorem 3.3.6, pp.27–34 uses bounded stable-condition comparison and arbitrary residual multiplicities; no general formal GAGA equivalence is presumed |
| Source issues | E3’s odd-rank sign, E4’s degree-2n exponents and E5’s unramified local scalar-twist qualification retain their independent confirmed judgments |

AHTW **Corollary** 1.2.2, p.6 is the monodromy bound, proved by Corollary 6.0.6. The nonselfdual spherical/Iwahori admissibility node derives crystallinity/semistability using the WD criteria; Iwahori semistability does not provide full monodromy equality. This source nomenclature and distinction are explicit in the revised reader, without altering the historical review object.

## Input and source verification

Read WORKERS, both protocols, UPSTREAM_GUIDE, the whole input packet and suggested file, the review and both earlier handoffs. Checked the accepted RS-12 result, including its `independent-review-REV-FIX-RT-RS-12~3` acceptance of 1 October 2026. Its title and ownership boundary remain binding: early generic R24 operations, AG2 applications, and the precise R19 classical/Hilbert overlap.

Read the reviewed library audit entries for the scoped stages and the relevant ownership overlaps, the supplier R24.5 and AG2.1a statements, the atlas stage contracts/links, and the roadmap link entries mentioning the scoped stages. Read the HodgeStructures and GlobalNumberFields upstream documents for style and API density. The older negative Chebotarev link screen is not used as evidence that AG2’s source-level prime-existence output is supplied already; its R01-owned Chebotarev extension remains explicit.

Retrieved all ten public PDFs to disposable scratch and recomputed their full SHA-256 hashes; all matched the packet. The packet’s `revisionVerification` records the actual passages re-read, and the reader’s Sources and verification list mirrors them. This is a check of the relevant statements and proof passages, not a claim to have re-read every page of every paper. No inaccessible edition or private book was needed or credited. No PDF, extracted source text or source passage is retained in the repository.

Read the full declarations and surrounding hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` for all eleven cited baseline entries. The four added entries are `Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible`, `Matrix.GeneralLinearGroup.toLin` and `Matrix.rank`. The Tau Ceti pin stays `f790474821cf4256814db967cb154e7af3d0c369`; no new Tau Ceti declaration is claimed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.6.lean`: **exit 0**, 95 warnings, all `declaration uses sorry`. Checked memory first, used the existing shared pinned build, and waited for one compile at a time. No language server or Lake build/update/cache operation was started.
- A comment-stripping check matched all 38 main and 58 API names to actual declarations, and matched every one of the 49 test labels directly to exactly one following `example`. The file has 94 named declarations and 53 examples in total; supporting declarations and acceptance examples are additional to the packet names.
- JSON parsed; all 43 IDs and the independent review object compared equal to the input; all source-issue review verdicts are preserved; both coverage records remain planned and all implementation statuses unchecked.
- Reader statements, API statements and test names matched the packet. Checked for removed excerpt keys, empty predicate bodies, arbitrary Prop fields, forbidden local paths, source artifacts and unauthorized changed paths. `git diff --check` is clean.

These checks establish packet validity, naming/type agreement and elaboration. They do not prove the unfinished mathematical statements or close the supplier interfaces.

## What remains and where to resume

The next step for this job is a fresh independent review, which should replace the historical review only after assessing this revision. The target-level pass needs no second worker claim or continued node expansion in this run.

For full mathematical closure, the five recorded gaps remain:

1. CR.6’s two-boundary log-crystalline extension, with Frobenius/residue N and the generalized stratum sequence; R34.6’s weight inference after AG2.1a’s proved closed-stratum concentration.
2. AHTW quantitative local-Shimura cohomology annihilators and bounded arbitrary-multiplicity pseudodeformation quotients. Design the precise owner Part II extensions using the recorded sources; do not substitute generic-only IG.5 concentration or introduce an IG→AG2 consumer cycle.
3. Full automorphic, period/WD, number-field place and lattice interfaces absent from the pinned Lean baseline. The now-delivered algebraic fragments must be replaced by complete supplier-typed forms as those interfaces become available.
4. R24.5:operations must correct its single raw-data carrier and separate predicates/weakening/assembly laws. The relevant AG2 statements remain conditional until that owner supplies the request.
5. AG2.1a must supply both the raw projector-compatible geometric input and the separately requested tensor-square/closed-stratum input before geometric comparison/purity can be imported.

The 19 precise request entries also retain R06 geometric/family/ordinary comparison, ET.7a transfer/solvable descent, AG2.2–AG2.5 twisting/family/boundary/local parameter inputs, R01 finite realization and exact regular-Frobenius descent, IHG.3 integral Hecke interfaces, AF.4 coefficient conjugation and ML.4 GSp4 normalization. They belong to those owners; their statements are not newly implemented here. A closure worker should start with the data/predicate and raw-realization requests, then refine the documented fragment boundaries against the resulting supplier types.
