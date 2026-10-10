# REV-ColemanPowerSeries--L0

Accepted on 10 October 2026. Independent reviewer: Codex, session `codex-Y4bmqx`, [issue #6430](https://github.com/CBirkbeck/tauceti-explorer/issues/6430). Claim comment 6100647800 was confirmed by bot comment 6100648881. The input was another worker's [L0 planning pass, #6478](https://github.com/CBirkbeck/tauceti-explorer/issues/6478), submitted in PR #8543 by session `codex-4N2rp5`; this reviewer did none of that planning.

Acceptance concerns a complete planning pass. L0 remains **planned**, with G1 and G2 open, eight supplier contracts and no closed stage. The suggested file elaborates with proof placeholders; no mathematical implementation is certified.

| Checked item | Result |
|---|---:|
| Nodes | 140: 104 verified, 30 corrected, 6 added, 0 unverifiable |
| Node kinds | 17 constructions, 7 definitions, 109 lemmas, 7 comparisons |
| Pinned baseline declarations | 20 confirmed: 15 Mathlib, 5 Tau Ceti |
| Definition/construction API | 78 items |
| Definition/construction tests | 72, three per object |
| Suggested examples | 88: 72 identified tests and 16 companion examples |
| Source findings | 6 confirmed: 4 original, 2 added |
| Planets | 6, replacing the parent's L0 selection |
| Requests / gaps | 8 / 2 |
| Expanded reachable graph | 313 nodes, 1,087 edges, acyclic |

Every input node's statement, hypotheses, proof steps, sources, prerequisites and any API/tests were checked. The packet's `review.checked` ledger gives a verdict for every final node. Corrected verdicts include changes to the associated prototype tests and their identifiers, even where the mathematical packet statement is preserved.

## Source evidence and mathematical checks

Fresh public PDFs matched the recorded SHA256 hashes. All relevant proofs were read, rather than relying on search snippets. The independent reading covers:

- [Sharifi, Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4, printed pp.143–147, and §6.1, pp.157–158. SHA256 `99b3a36201cecf55045da6913d462cacdb8dff83bff5860c5883ab7ea824bd32`.
- [Sharifi, Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4, pp.104–109; §6.1, pp.118–120; §§6.3–6.4, pp.130–134. In particular Corollary 5.4.15, Lemmas 6.3.3–6.3.6, and Proposition 6.4.6 were checked. SHA256 `153c8bb9be0f56a73b85cd9d192ec4b6360ce1dfeda3fd4babd7ee77aeb64f20`.
- [Rodrigues Jacinto–Williams, An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Essential Number Theory 4 (2025), 101–216: §9, pp.161–163; Proposition 12.1, Lemmas 12.2–12.3 and Proposition 12.5, pp.178–179. SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.

The source matches distinguish an original assertion from its coefficient-field, all-prime or semilocal specialization. In particular, the finite-family product argument is a derivation on actual local integer rings; it does not assert that an integral normal basis gives an algebra isomorphism. No book copy, passage or source excerpt was added. The original Coleman paper was not needed to replace the public proof material cited in this L0 pass.

The arithmetic checks preserve the distinctions needed downstream. The integer-normalized valuation of p is d_n, whereas the native absolute-value comparison has exponent f d_n. Consecutive field norms have degree p and residue action r↦r^p. The section uses inverse Frobenius twists. Full units retain the residue torsion; scalar modules belong to the principal subgroup. At p=2 the signed roots have trivial level zero, remain detectable at level one, and satisfy norm compatibility rather than squaring compatibility. Semilocal Frobenius fixes idempotents, while coherent coefficient transports can permute them.

## Source findings

All four original findings have independent `confirmed` verdicts at their precise locators. Two further findings are recorded without changing L1's operator plan.

| Finding | Verified repair |
|---|---|
| E-L0-1 | Sharifi-IW Theorem 5.4.9 / Definition 5.4.12, pp.145–146: align evaluation with the field's level indexing. |
| E-L0-2 | Sharifi-IW §6.1, p.157: use a local integral normal-basis generator rather than the scalar 1. |
| E-L0-3 | Same paragraph: the coefficient integers use the unramified decomposition-group quotient. |
| E-L0-4 | Sharifi-ANT proofs of Lemma 6.3.3 and Proposition 6.4.6, pp.130, 134: count nonzero residues as q−1. |
| E-L0-5, added | Sharifi-IW before Proposition 5.4.6, p.144: distinguish the fixed-root coefficient Frobenius from arbitrary lifts through inertia. Notation 5.4.10, p.146, indicates the intended splitting. |
| E-L0-6, added | Sharifi-IW proof of Proposition 5.4.6, p.144: include the zero exponent in the norm product. A constant unit detects the omitted factor. |

The corresponding [author HTML Chapter 5](https://www.math.ucla.edu/~sharifi/notes/iwasawa-ch05.html), [Chapter 6](https://www.math.ucla.edu/~sharifi/notes/iwasawa-ch06.html), and [Algebraic Number Theory Chapter 6](https://www.math.ucla.edu/~sharifi/notes/algnum-ch06.html) retain these passages. The author listing and bounded site searches revealed no linked correction. This describes the copies inspected, not an exhaustive novelty claim. No author was contacted.

## Baseline, closure and ownership

All 20 baseline names and their ambient hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 13 cited source modules in the shared build match those pinned sources byte for byte. No baseline citation was removed or replaced.

Special attention went to finite-dimensional/freeness assumptions on norm transitivity, inclusion of the norm in the conjugate-product formula, perfect-ring hypotheses on Frobenius, the native intermediate-field arguments of linear disjointness, the complete receiving-ring assumptions on power-series evaluation, and the canonical local-field hypotheses on Teichmüller lifts. The arithmetic nodes either supply these hypotheses or retain the exact owner adapter in G1. `IsProP` alone is not used as a compactness assertion, and the pin's finite-index product interface is not used to justify a countable product.

The accepted parent packet and its independent review were read, and each directly cited parent declaration was checked. The reachable prerequisite graph was expanded and checked for unresolved node references and cycles. This is a structural check of accepted dependencies; it does not claim to repeat the independent review of every parent proof or its historical book sources.

Current read-only revisions were TauCetiRoadmap `3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant LocalFieldsRamification and ProfiniteArithmetic reader documents and signatures were read, together with NumberFieldArithmetic L5 and the current pro-p modules. The library audit was checked. Existing finite-extension structures, Frobenius, norms, scalar powers and completed actions remain suppliers, not new generic constructions in Coleman.

One historical reference needs a packaging substitution: ProfiniteProPGroups L4 is an atlas link predating ProfiniteArithmetic. The scalar construction is already `TauCeti.IsProP.module` in `ProP/PadicPow`, described in current ProfiniteArithmetic §1.3. Its resolution is now explicit in `currentLibrary.ownershipResolution`; packaging must cite the existing declaration. G1 concerns adoption and coherence on these arithmetic carriers.

LocalFieldsRamification's `isTotallyRamified_iff_exists_eisenstein_generator` promises existence of an integer generator. Identifying the chosen root minus one and its integral power basis is the stronger requested refinement; an existential generator theorem is not silently substituted for it. NumberFieldArithmetic's integral semilocal comparison is a README contract, distinct from the finite-field tensor equivalence already prototyped there.

## Corrections and added nodes

1. Removed a duplicate norm-conjugate prerequisite; added direct Frobenius/cyclotomic generator API dependencies to the inclusion, order and commutation arguments. Added the finite Frobenius-order prerequisite to the limit action, the signed-root order prerequisite to the Tate embedding, and norm transitivity directly to its API node.
2. Corrected the current completed-action module locator and the unsigned-root typo. Added independent checks to baseline/source-version metadata and six source-finding verdicts. The published RJW PDF is now labelled as a published version.
3. Strengthened the prototype's basis-of-one coordinates, root/uniformizer residues, dyadic residue scalar map, alternating quadratic Teichmüller residues, signed level-one root, arithmetic/inverse Frobenius distinction, idempotent projections and signed/raw dyadic norms. Added the missing singleton norm-limit test. All 72 tests have identifying comments; companion assertions remain available.
4. Added six lemma nodes, each marked `addedBy: REV-ColemanPowerSeries--L0`, with native signatures and explicit coordinate proofs: `coefficientCyclotomicAction_continuous`; `coefficientLimitActions_continuous`, `_order`, `_principal`; `semilocalFrobenius_limit`; `semilocalPermutationAction_limit`. These make existing promises explicit rather than adding a new mathematical direction.

The six planets and ownership boundaries are unchanged. Eight current-only receiving signatures remain explicitly omitted at the pin, as listed in `prototypeOmissions`; the scalar/action refinements of `semilocalTate_eq` share that boundary. No arbitrary module instance or free proposition substitutes for them.

## Validation and handoff

- `scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- Four deliverable paths checked with `intake.py check-files`: **0 problems**; `git diff --check`: **passed**.
- `scripts/check_errata.py` on a scratch export of the six findings and source versions: **passed**.
- Independent signature/test-name, minimum-test, verdict-ledger, no-excerpt and reachable-DAG checks: **passed**.
- Thirty exact arithmetic checks: **passed**, covering shifted Eisenstein coefficients, inverse-Frobenius cycles and source rank/count/product counterexamples.
- `lean-check` on the revised suggested file: **exit 0**, with only `sorry` warnings. No language server, library rebuild or dependency update was run.

The reader is outside this review's editable paths. Packaging must incorporate the six additional API items and the two new source findings from this packet/report, and replace the legacy scalar reference. Existing reader mathematics and test meanings agree with the corrected prototypes. The full remaining work is in the accompanying handoff; acceptance does not discharge G1 or G2. No unresolved mathematical contradiction remains and no additional orchestrator decision is needed for this review.
