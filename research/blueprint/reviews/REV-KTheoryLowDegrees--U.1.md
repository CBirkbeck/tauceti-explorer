# Independent review REV-KTheoryLowDegrees--U.1

Verdict: **needs_changes**. Issue #441. Reviewer: Codex, session `codex-w9JjfU`, 2026-10-05. The original plan and its earlier continuations were written by other sessions. This review is complete; it is not an unfinished planning checkpoint.

The packet and suggested Lean file have been corrected within the issue's authorized paths. The reader document is not a deliverable of this review and remains unchanged. It still contains the false ambient-ideal version of BMS's scalar congruence and the invalid relative-comparison five-lemma argument. Regenerate those passages from the corrected packet before accepting the plan. Honest partial stages and open requests alone are not grounds for rejection.

## Counts and scope

The original bounded pass had 300 nodes. The reviewed packet has **332 nodes**, including **32 added** declarations marked `addedBy: REV-KTheoryLowDegrees--U.1`. There are 23 definitions, 48 constructions, 170 lemmas, 69 theorems, 12 comparisons and 10 applications. The checker counts **498 API items, 285 tests, 44 planets, 479 baseline declarations, 9 gaps and 8 requests**. All definitions/constructions retain at least three tests. All 332 nodes have an individual `review.checked` entry: 32 added, 59 corrected, 4 unverifiable, 237 verified.

| Stage | Nodes | Coverage verdict |
|---|---:|---|
| Z.1 | 53 | source_decomposed |
| Z.2 | 30 | source_decomposed |
| U.1 | 27 | source_decomposed |
| U.2 | 22 | source_decomposed |
| U.3 | 42 | partial |
| U.4 | 113 | partial |
| U.5 | 31 | partial |
| U.6 | 14 | partial |

Z.1, Z.2, U.1 and U.2 are source-decomposed; U.3–U.6 are partial. No stage is closed. Packet `complete` means the original bounded planning pass finished, not that these partial stages or the Lean implementation are complete. Review additions are splits/corrections of that pass, not a second planning job.

## Independent evidence

Every original node's sources, statement, hypotheses, proof sketch, prerequisites and intended native signature were read. Every definition/construction's API and tests were reviewed for usability and plausible wrong definitions. The added nodes were checked against the same source passages and explicit algebraic arguments. The per-node table in the packet is the exhaustive checklist; `verified` certifies a planning route under its listed dependencies, not a formal proof or acceptance of an unread upstream implementation. Four entries mark directly unestablished proof routes `unverifiable`. Other conditional consequences retain their transitive gaps.

All 479 named baseline declarations were found and their actual statement and enclosing variables/typeclasses read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, covering 217 modules. The `checked` field of each entry now records independent reconfirmation. **No baseline citation was removed or replaced.** General noncommutative statements are not attributed to commutative matrix or scalar-extension APIs; those APIs appear only as compatibility cases. Existing `SplitK0`, `ExactK0`, finite projective exact structure, stalk rank, matrix Morita equivalence and Spin covering infrastructure are reused. The reviewed coverage audit and RS-18 ownership split were checked; no second categorical K₀, localization boundary, Steinberg/K₂ target or general topology carrier is introduced.

Public PDF bytes matched all ten source hashes in the packet. Node passages were read in [Weibel's 2013 author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), [Bass 1964](https://www.numdam.org/item/10.1007/BF02684689.pdf), [Dieudonné 1943](https://www.numdam.org/item/10.24033/bsmf.1345.pdf), [Bass–Milnor–Serre 1967](https://www.numdam.org/item/10.1007/BF02684586.pdf), [Milne ANT](https://www.jmilne.org/math/CourseNotes/ANT.pdf) and [Conrad's ideal-factorization note](https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf). The supplied node locators distinguish PDF and printed page numbering. The garbled Milne ideal passages were checked on rendered pages. BMS's formula at printed p.67 was checked in the scan as well as the text layer. The cited pinned Morita/cofinality Lean sources were also read directly.

The auxiliary routing/scope check read CG Remark 9.3 in [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), the stated SL₂ theorem at §2.6 in [Serre's paper](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), the routed passages of [Bhatt–Scholze](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), and all four pages of [Serre's 1974 erratum](https://www.numdam.org/item/10.1007/BF02685884.pdf). This does not claim a full proof read of Serre's SL₂ theorem, inaccessible `Corps locaux` propositions, CG Conjecture B, or the undecomposed BMS §10–§11 arithmetic/extension arguments. These remain precisely scoped follow-ups. Historical author errata searches in inherited records remain provenance; this review could not retrieve the current K-book errata URL (404), so the new finding's previously-known status is unknown.

## Corrections and unresolved boundaries

1. **Scalar congruence in BMS 2.7–2.9 and 3.5.** The residue symbol requires `a−1∈qA`, where `q` is a scalar in the ambient ideal `𝔮`. The weaker `a−1∈𝔮` is insufficient: over ℤ, take `𝔮=2ℤ`, `a=3`, `q=6`, and the residue unit `b=1 mod 3`. Then `(a,bq)=(3,6)` is not unimodular. The corrected signatures provide an actual membership witness with the evaluation equation; a universally quantified impossible witness would be vacuous. The common-residue-image proof now includes the principal-level move and finite-family/empty-family cases. The power-reduction outputs and consumers use the same principal congruence. A native regression encodes the counterexample.
2. **Canonical upstream graph edges.** All eight supplier requests were checked against their roadmap text. Twelve missing stage-to-consuming-node edges were restored. Noncanonical `Layer` side fields and claims that the checker could not accept canonical stage IDs were removed/corrected. LieGroups L.9, Chebotarev L.4/L.10, GlobalNumberFields L.6/L.7, and ClassFieldTheory L.5/L.12/L.13 remain precisely requested. No Tau Ceti roadmap is rewritten.
3. **Class-field-theory scope.** Layer 5 supplies the named cohomological pairing's bilinearity/perfectness, not Artin normalization. Layer 6 only promises the exponent-two comparison. A new gap names the general degree-m dictionary, its transpose relative to CA.1, and openness/finite index of power subgroups, including BMS A.13–A.15. The existing tame/product/reciprocity cycle and higher-unit A.17–A.18 gap remain. Reading the appendix did not establish an unavailable supplier proof.
4. **Relative K₁ comparison.** Replaced the obsolete broad integrated GeneralAlgebraicKTheory K.5 assertion by the current finer `K.5/relative-K-theory` definition, which explicitly delegates the classical comparison to U.6. The proposed double-ring five-lemma proof has nonisomorphic neighboring absolute K-groups. Merely importing π₂=K₂ does not establish excision or the required degree-two boundary comparison. The corrected proof steps describe the precise missing relative-plus argument and retain the T.1:plus/T.6 cycle as a gap. This is not claimed solved by the double-ring hint in K-book IV Ex.1.15.
5. **Tests and conventions.** Qualified the one-rank-fibre acceptance case by A≠0; the zero ring has no prime-spectrum fibre. Corrected the DVR test’s description: in `(π 1;0 1)` the valuation-one entry is diagonal; the off-diagonal entry 1 has valuation zero. Added determinant-value-2 tests for standard-form evaluation and the next-rank value: all three original cases were compatible with a constant-1 definition. The relative SK₁ definition has kernel, zero-level, ℤ/p² and conditional nontrivial real-circle tests. Column/right-module and row/left-module conventions stay explicit. Planets retain their 44 mathematical definition/theorem names.
6. **Native outline.** Added atomic signatures for the splits, strengthened the scalar congruences and witness quantifiers, restored the full common-image conclusion and identity equation in multiplicativity, and added the new tests and splitting compatibility. Existing bundled theorems remain clearly marked aggregate helpers where their projections are already used. All mathematical proof obligations still use `sorry` honestly; none is certified by a successful compile.

The unchanged reader still states the weaker congruence around lines 6210–6248 and in the power-reduction passages around lines 6531–6689. Its relative comparison around line 7963 still uses the invalid five lemma. These are line numbers in the reviewed input, not stable edit anchors. Regeneration should follow the node IDs and corrected hypotheses. No reader edits were made because the issue lists only the packet, native outline and review report as deliverables.

## Declaration-sized additions

The following 32 nodes separate independently proved parts or a previously hidden definition. Existing IDs are retained for the first part of each bundle. Consumers' dependencies were expanded to retain the formerly bundled conclusions; added nodes' dependencies were expanded too, while explicit within-bundle dependencies avoid cycles.

| Added node (KTheoryLowDegrees prefix omitted) | Kind |
|---|---|
| `Z.1/ring-k0-class-difference` | lemma |
| `Z.1/ring-k0-free-cofinality` | lemma |
| `Z.1/stably-free-free-class` | lemma |
| `Z.1/free-class-bijective` | lemma |
| `Z.1/extend-scalars-projective` | lemma |
| `Z.1/extend-scalars-idempotent` | lemma |
| `Z.1/extend-scalars-projective-functor` | lemma |
| `Z.2/rank-at-prime-local-equivalence` | lemma |
| `Z.2/rank-kernel-stalkwise` | lemma |
| `Z.2/local-ideal-jacobson` | lemma |
| `Z.2/local-invertible-matrix-lift` | lemma |
| `Z.2/pi-ring-cross-extension` | lemma |
| `Z.2/pi-ring-module-decomposition` | lemma |
| `U.1/rank-two-failure-three` | theorem |
| `U.2/automorphism-class-basis-independent` | lemma |
| `U.2/automorphism-class-free-stabilization` | lemma |
| `U.2/automorphism-class-complement-independent` | lemma |
| `U.2/automorphism-class-presentation-multiplicative` | lemma |
| `U.4/q-equivalence-near-unit` | lemma |
| `U.4/mennicke-symbol-smaller-ideal` | lemma |
| `U.4/mennicke-symbol-residue-function` | lemma |
| `U.4/mennicke-symbol-common-residue-image` | lemma |
| `U.4/mennicke-symbol-image-abelian` | lemma |
| `U.5/relative-elementary-stable-normal` | theorem |
| `U.5/relative-commutator-containment` | theorem |
| `U.4/K1-S-integers-local` | comparison |
| `U.4/K1-S-integers-completion` | comparison |
| `U.5/projection-formula-transfer-k0` | theorem |
| `U.5/transfer-base-change-composite` | theorem |
| `U.5/relative-SK1` | definition |
| `U.5/relative-SK1-quotient` | comparison |
| `U.5/relative-K1-units-split` | lemma |

The original bundles split are class induction/difference/free cofinality; stable freeness/free class; free-class IBN/bijectivity; finite-projective scalar extension; rank-localization descriptions; the noncommutative local-ring lifting ingredients; finite-product module descriptions; rank-two examples; projective automorphism presentation invariance; BMS 2.2, 2.7 and 2.9; the relative Whitehead ingredients; S-integer residue/local/completion specializations; the two projection formulas and their corollary; and relative determinant/kernel/quotient/splitting. The per-node `review.checked` notes record all original nodes changed, including prerequisite-only changes.

## Red-team findings, routing and source mistakes

RT-AREA-ktheory-1/9: global K₂ and its certificates remain with T.5/T.6 and ArithmeticKTheory N.6; U.6 owns only the concrete classical K₁ comparisons/examples in scope. The proposed graded determinant remains with the companion Z.3–Z.6 owners and their current `needs_changes` supplier status is retained.

RT-AREA-ktheory-1/24: finite S means finite places; S=∅ recovers ordinary unit rank. The canonical determinant identification is distinguished from a choice of fundamental S-units. The reader's finite-S convention was already correct and is retained.

RT-AREA-ktheory-1/25: imported CFT/Chebotarev scopes were read. The canonical edges and narrowed pairing request now expose the remaining reciprocity/topology inputs. The theorem is not generalized to all Dedekind domains. The real-circle obstruction remains partial at the SL-to-SO retraction.

BS-21: all 21 routed Bhatt–Scholze entries were checked against the paper and their finer companion contracts, including Proposition 4.7, Propositions 5.16/5.20, Corollaries 5.14/5.26, Theorems 5.17/9.1 and Lemma 9.3. No duplicate coherent/graded determinant construction is added here; the companion packet's nonaccepted status is not hidden. CG routing distinguishes SL₃/ℚ from SL₂ over a CM quartic and excludes imaginary-quadratic SL₂ with S=∅. Finite central congruence kernel alone does not imply every mod-p H¹ class vanishes; the Hecke/localization interface retains its own explicit gap.

All twelve inherited source issues E101–E112 have independent `confirmed` review entries at their locators. The checks distinguish actual mathematical errors from typography and displaced exceptions. E112 is a known published correction: the BMS A.23(b) numerical exponent is withdrawn by Serre 1974 and no current node uses it. New **E113** disproves the reverse push-pull claim in K-book II Ex.2.2(b): for k→k×k, restriction followed by extension sends (1,0) to (1,1), whereas multiplication by the extended regular-ring class gives (2,0). New **E114** records the resulting false reverse-kernel assertion in part (c): its kernel contains (1,−1)∈ℤ², which is not annihilated by any power of the extension rank 2. Only the true forward composite is used in the projection-formula nodes. K-book findings are scoped to the hash-pinned author draft, not asserted for an unread published edition.

## Validation and handoff to the orchestrator

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.1.json` reports **0 errors, 0 warnings**, using the available pinned declaration index. Additional structural checks confirm one verdict for each of the 332 nodes, exact new-node markings, all request consumers' canonical supplier edges, 14 reviewed source issues, valid JSON, and no edit outside the issue's deliverables and this job's handoff note.

`lean-check research/blueprint/suggested/KTheoryLowDegrees--U.1.lean` was attempted with 95 GB available memory. It exits at the first import because the shared build lacks `TauCeti.CategoryTheory.Exact.Functor.olean`. The shared Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the packet pin, although Mathlib matches. **The complete file has not elaborated; its body and new declarations were not reached.** No build, cache download, Lake project or Lean server was started. No fragment success is represented as a full-file result.

For acceptance, arrange an authorized reader regeneration reflecting the corrected principal congruences, supplier graph and relative comparison gap. Keep the nine gaps and four partial stages precise. If the relative comparison is to become established, require an actual sourced relative-plus/degree-two argument; if the BMS arithmetic proof is to close, resolve the symbol orientation, power-subgroup topology, reciprocity cycle and higher-unit inputs. Separately arrange a complete build at the exact Tau Ceti pin and run the complete suggested file. Review this corrected plan and the regenerated reader together before promotion. Do not promote this review automatically as an acceptance.
