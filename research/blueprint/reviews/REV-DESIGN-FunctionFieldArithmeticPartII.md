# Independent review checkpoint: Function Field Arithmetic Part II

Worker: Codex — codex-yqJkRM. Issue #3533. Date: 2026-10-05.

**Status: partial checkpoint, with no final verdict.** This session did none of the design or its continuations. The packet intentionally has no top-level `review` object. Its `reviewCheckpoint` records the actual reading boundary, corrections and remaining checks. Intake must retain this review job for continuation; these corrections do not accept or promote the plan.

The source comparison found a false identification of the full signed root-divisor groupoid with an effective symmetric-power space. It also found a nonexistent lemma locator and a regularity proof that used a potentially nonsmooth finite chart. These are corrected in the authorized packet and suggested-file omission ledger. Completing the remaining 638 continuation-node checks and 323 baseline statement checks is necessary before this review can give its verdict.

## Scope actually checked

| Check | Result |
|---|---|
| Packet inventory | 717 nodes; initially 347 baseline citations, 574 API items, 518 tests, 40 planets, 8 gaps, 13 requests, 10 partial stages. |
| Primary mathematical statement/source comparison | The first 79 packet nodes, from RS.0/tensor-power through GC.6/quadratic-trace, were read against the indicated source passages and proof sketches. This is not full supplier-closure verification. |
| Baseline statement reading | First 24 entries, from AlgebraicGeometry.Scheme through SheafOfModules.sectionsMap, read at the exact recorded commits. They supply the stated native carriers/maps; none was removed. |
| Additional baseline screen | All 347 module paths were fetched at their exact pins, involving 136 distinct library/module pairs. This establishes availability of files, not validity of the other 323 declaration claims. |
| Source-issue verification | E1–E9 confirmed against the published Yun–Zhang copy; E12 added and confirmed only against the inspected AGV preprint. E10–E11 remain unchecked here. |
| Remaining node audit | Nodes at packet indices 79–716 remain unverified in this session. No inherited proof receipt has been adopted as an independent verification. |
| Final packet inventory | 717 nodes; 347 baseline citations; 580 API items; 522 tests; 40 planets; 8 gaps; 13 requests; all 10 stages remain partial. |

Read both binding protocols, WORKERS and UPSTREAM_GUIDE. The two completely read upstream examples are JacobianChallenge and UniversalCovers. Only parts of the much longer AlgebraicCurves/ModularCurves documents were inspected; they are not claimed as additional complete readings. The parent library audit was inspected for its native/arithmetic versus geometric boundaries, but its full supplier composition has not been independently certified.

## Mathematical corrections

### C1. The signed root-divisor groupoid

`GC.2/root-divisor-groupoid` previously said that the groupoid in §6.2.3 was the effective open X_d^√R(k). The [published Yun–Zhang text](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), p. 498, defines instead the right action groupoid A_F×/O_{√R}×. Its following map to the root Picard groupoid adds the left F× quotient. The root-divisor groupoid is used for four arbitrary root divisors and their simultaneous translations; it is not restricted to effective divisors.

A concrete separating example has R empty and any closed point x. Uniformizer ideles and their inverses represent x and −x in the signed divisor groupoid, whereas an effective divisor space cannot contain the negative divisor. For a nonconstant rational function with nonzero principal divisor, the unit and diagonal-function objects are distinct in the right quotient and become identified only in the Picard double quotient. This also distinguishes the two quotients without relying on cardinality.

The existing node id is preserved. Its kind becomes construction and its title is “The signed root-divisor groupoid”. It now defines the actual action groupoid with unit-labelled arrows, its ordinary divisor map and its Picard map. The sign convention is E(a)=Σv_x(a_x)x and the associated Picard line is O_X(−E); π_x⁻¹ therefore gives E=−x and line O_X(x), agreeing with Lemma A.5. No general equivalence between this entire groupoid and an effective symmetric-power stack is asserted.

Added six API items: idele object, labelled arrow, ordinary divisor projection, tensor/additive structure, Abel–Jacobi functor and automorphism characterization. Added four tests: signed divisors at R empty, the uniformizer sign, the nonidentity branch kernel label, and principal divisors before the F× quotient. At every idele object the automorphism group is exactly the kernel of the modified-unit map; thus its μ₂ labels are retained. The parent FA.2 and curve-geometry SF.3 requests now name this consumer. The generic groupoid carrier is imported from the recorded Mathlib baseline.

The geometric signatures remain explicitly omitted under LEAN-GEOMETRY, with every new API/test name listed in the suggested file. Their absence is a recorded boundary, not a claim that comments are Lean declarations. No new node or planet was added.

### C2. The smoothness claim is not Lemma A.3

On printed p. 516, A.3 is a definition of the open U_d. The smoothness criterion is the Claim in the proof of Lemma A.4(1). It assumes a smooth irreducible scheme Z and requires that no section vanish identically, so the vanishing loci are actual scheme-theoretic Cartier divisors. The packet now records these hypotheses, allowing empty divisors and prescribing codimension |I| for nonempty intersections. Its suggested omission-ledger statement agrees.

### C3. A smooth atlas for wild-exponent regularity

The finite μ_n chart is a torsor in the fppf sense, but at wild exponents it is not a smooth atlas. The existing proof route could therefore not simply infer smooth-local stack regularity from that chart. AGV Appendix B.2, pp. 53–54, supplies a G_m quotient presentation. The corrected sketch uses the G_m-torsor atlas with local equation z^n=qf and q invertible: at z=0 the regular-divisor parameter f gives a nonzero linear term; at z invertible, f is invertible and q can be solved for. Regularity descends through this smooth atlas.

This corrects the route, not its remaining supplier audit: the actual local-regularity and quotient-descent interfaces still require verification under ROOT-ALGEBRAIC, and RS.1 remains partial. AGV does not print the general regularity theorem previously claimed by its locator. The invertible-exponent DM assertion and non-étale branch-inertia obstruction remain distinct.

## Source-record corrections

Eighteen first-source records were corrected, and a separate TV17 Corollary 3.13 citation was added to the finite affine-chart node. No source is claimed read beyond the passages below.

| Node suffix | Correction |
|---|---|
| key/root-stacks | Appendix B.2, pp. 53–54: scheme-base triples and classifying-stack fibre product; algebraic-stack bases are an atlas-descent extension, not a sentence in this appendix. |
| RS.1/two-pullback | Appendix B.2, p. 54: U=[A¹/G_m] and the displayed S×_U U description. |
| RS.1/affine-chart | Appendix B.2, pp. 53–54: [V_σ/G_m] and W_σ×G_m≃V_σ; finite μ_n quotient after trivializing the line. |
| RS.1/closed-fibre | Appendix B.2, p. 53: nilpotent closed embedding of the root gerbe into the zero-section fibre. |
| RS.1/regular-dm | Appendix B.2, pp. 53–54: the G_m quotient atlas; regularity is the local regular-parameter argument in proofSteps, rather than a smooth/normal-crossing theorem printed here. |
| GC.1/evaluation-smooth-criterion | Claim in the proof of Lemma A.4(1), p. 516; Definition A.3 on that page is a different item. |
| GC.1/root-addition | A.1.4, pp. 517–518; (A.2) on p. 517. |
| GC.1/ordered-divisors | A.1.4, (A.3), p. 517. |
| GC.1/root-abel-jacobi | A.1.5, p. 517: both hat Abel–Jacobi maps and their effective restrictions. |
| GC.2/root-units | A.1.6, pp. 517–518, modified local-unit groups. |
| GC.2/adelic-root-groupoid | Lemma A.5, (A.4) and complete proof, p. 518. |
| GC.3/symmetric-associativity | Lemma A.8 and concluding exercise, p. 520; Proposition A.11(3) and its proof, p. 523. |
| GC.3/symmetric-symmetry | Lemma A.8 and concluding exercise, p. 520; Proposition A.11(3), p. 523. |
| GC.5/auxiliary-divisors | A.2.2, pp. 521–522: translation by divisors and reduction to effective divisors; Lemma A.10, p. 522. |
| GC.5/effective-pullback | Lemma A.10, p. 522; the packet finding is E6, inherited from PAPER-YUN-ZHANG-19/E68. |
| GC.5/high-degree-multiplication | Proof of Proposition A.11, p. 523; product Abel–Jacobi correction E4 and Picard-superscript correction E7. |
| GC.6/trace-character | Proposition A.11, pp. 522–523, and the proof of Proposition A.12, p. 525. A.2.3 is on pp. 522–523, not p. 520. |
| GC.2/root-divisor-groupoid | §6.2.3, p. 498: definition of Div^√R(X), its two maps and O_X(−E); Lemma 6.4, (6.9), p. 499. |

The AGV key-definition source no longer attributes a stack-base sentence to p. 54: Appendix B is written for scheme bases. The algebraic-stack extension remains an atlas-descent contract. The closed-fibre citation is now the nilpotent-embedding passage on p. 53. The p. 54 affine chart instead uses the actual V_σ/G_m description, with the μ_n specialization also sourced to TV17. Source matches distinguish constructions deduced from the printed presentation from a theorem actually stated there.

## Source mistakes

E1–E9 have individual confirmations in the packet, bound to this review job. In particular E8 is confirmed as the recorded ambiguity/proof boundary: the degree test for P¹→P¹, t↦t² disproves ordinary kernel/image exactness of Picard classes, but does not disprove every possible intended coherent Picard-stack exactness notion. NORM-2EXACT stays open.

New E12 concerns only the inspected AGV arXiv v2. Its p. 53 item (3) prints φ(τ^m)=σ, although the preceding item has φ:M^{⊗d}≅L_T and no m is introduced. The rendered page confirms the exponent is m. The intended exponent is d, which the packet already uses. The arXiv version list, an exact-title erratum search and the author’s public paper directory did not identify a correction; the attempted journal page was not served. Published collation remains unestablished, and no allegation about the version of record is made. The source-version envelope now identifies this preprint and its hash.

## Reading receipts

All five PDFs below were freshly downloaded and matched their inherited SHA-256 receipts. A matching hash is not a fresh reading receipt for the whole paper.

| Source | Fresh passages read | SHA-256 |
|---|---|---|
| [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | Appendix A pp. 514–526 in full; §6.2.1 p. 497; §6.2.3 pp. 498–499; §7.1.1 p. 506. The page image of p. 516 was also checked. | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| [AGV08](https://arxiv.org/pdf/math/0603151v2) | Appendix B.1–B.2 pp. 52–54 in full; p. 53 page image checked. | `c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb` |
| [TV17](https://arxiv.org/pdf/1410.1164v2) | §3 and §3.1 pp. 12–16 in full, including proofs of 3.5, 3.7, 3.10 and 3.12. | `92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2` |
| [B24](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | pp. 134–136, including the finite/infinite DVR-root discussion on p. 135. | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| [AV23](https://arxiv.org/pdf/2303.13436v1) | Downloaded and hashed only. No fresh symplectic proof audit; the inherited split inventory remains pending. | `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` |

Exact baseline commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Baseline statements were retrieved directly from those git objects, rather than assuming the shared Tau working tree is at the pin. The 24 independently read references are explicitly listed in `reviewCheckpoint.baselineStatementsRead`; the other declarations’ prior `checked` strings remain inherited provenance. The generic `Algebra.TensorProduct.map_comp` and root-qualified `RingEquiv.toCommRingCatIso` survive the initial text-name screen after resolving multiline/_root_ syntax; neither initial regex miss establishes a false citation. Their complete consumer-fit audit remains with the unreviewed baseline continuation.

## Reader synchronization and authorized paths

The definitive reader `research/blueprint/readmes/FunctionFieldArithmeticPartII.md` is not among this review issue’s deliverables. It was not edited. Its root-divisor section currently repeats the false identification and is inconsistent with the corrected packet/ledger; this explicitly prevents final acceptance. The orchestrator must authorize its synchronization or route a correction job. Apply the corrected statement, six API items, four tests and prerequisites to the section for GC.2/root-divisor-groupoid (currently headed “Root divisors supported away from R”). Also synchronize the smoothness assumptions/Claim locator, wild-regularity proof route and the eighteen citation changes listed above. There is no silent claim of agreement with that reader. The authorized new-roadmap GC.2 description has been corrected to the signed right-action groupoid and the distinct Picard double quotient.

## Validation and continuation

`python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII.json` passed before and after the corrections, with zero errors and warnings. The packet source-issue validator and source-version checks also reported zero errors; intake check-files reported five files and zero problems; git diff --check passed. The queue completion predicate explicitly returned false for this review, confirming checkpoint treatment. Preservation checks confirmed that all node ids, baseline entries, coverage and split inventory are unchanged and the 638 continuation nodes are byte-equivalent as JSON objects. All ten coverage entries remain partial; the inherited complete planning-pass status is preserved and is distinct from this partial independent review. This checkpoint adds no implementation claim and no nodes.

A memory check showed over 20 GiB available. One `lean-check` of the canonical suggested file stopped immediately because the existing build lacks the compiled `TauCeti.Algebra.AddCircle` import. No declaration was elaborated, and full compilation is unverified. No library build, cache fetch, update or language server was started. The later suggested-file changes are the standard-note placement and the mathematical omission ledger; the declarations/import set is retained.

Resume at packet index 79, RS.0/affine-root-relation, and baseline index 24, AdjoinRoot.liftAlgHom. Then independently establish every remaining supplier fit and prerequisite chain, unit-test/API claim, planet choice, Alper finding E10–E11 and the symplectic route boundary. The reserved root-stack id occurs once and its stated general scope is retained; the complete reserved-key sample API comparison and the imported moduli-curves dependency still need the final review. Do not equate inherited proof-replay receipts or successful structural checks with mathematical verification.

The handoff beside this report is sufficient after scratch deletion. A final `review` object must only be added once the entire review required by #3533 has actually been performed.
