# Independent review: confirmed Chebotarev consumer fixes

Refs #5174. **Codex — codex-5ebb6f**, 30 September 2026. Reviewed explorer revision `e88303406dd3eaa2fa08e978c58f7f03a009df4b`. The bot confirmed this session’s claim before work began.

**Verdict: accepted, with two local clarifications.** The fixes were authored by Codex session `codex-rtOQ9t` for #5033; this worker did none of that fix work. This review follows `independent-review-REV-LINK-tauceti_TauCetiRoadmap_Chebotarev`, dated 23 September 2026, and preserves its complete object in `reviewHistory`. The shared repository account is not evidence of independence; the separate author/reviewer sessions identify the workers.

Read the two red-team claims and both independent verification verdicts, the complete fix report, all three added links, the affected screening entries, supplier Layers 4/10, consumer HB.2/U.4, and the complete four requesting nodes and relevant import requests. HabiroNumberFields remains **partial, accepted**; KTheoryLowDegrees--U.1 remains **partial, unreviewed**. Neither consumer packet is edited or newly accepted. Historical links between two Tau Ceti roadmaps remain outside this review under PROTOCOL sections 10 and 17.

## Verdicts and source checks

| Finding | Verdict | Checked correction |
| --- | --- | --- |
| RT-LINK-tauceti_TauCetiRoadmap_Chebotarev/1 | Fixed, clarified in place | CH-L16 imports the finite-Galois, realizable-conjugacy-class and finite-exception interface for the two named Habiro nodes; the negative Habiro screen is replaced. The source locator and detection-branch root hypothesis are clarified below. |
| RT-LINK-tauceti_TauCetiRoadmap_Chebotarev/2 | Fixed | CH-L17 imports prime selection, CH-L18 imports the arithmetic cyclotomic Frobenius formula, and the K-theory screen records the bounded follow-up. Number-field, root-absence, m ≥ 2 and prime-exclusion conditions remain explicit. |

### /1: CGZ detection and the local R map

Freshly read [Calegari–Garoufalidis–Zagier, arXiv:1712.04887v3](https://arxiv.org/pdf/1712.04887v3), physical/printed pp. 22–23 and 26–27. Proposition 4.2 uses an odd prime-power n, the Galois closure F̃, and ζ ∉ F̃(ζ + ζ⁻¹). Its Kummer extension and cyclotomic quadratic part admit the simultaneous Frobenius used in the contradiction; their compatibility is part of the argument, not a consequence of prescribing arbitrary restrictions. The extra coprimality with w₂(F) belongs to the global injectivity conclusion, not to a universal prime-selection theorem.

In the proof of Theorem 5.2, the valuation calculation for τ rules out the obstructing Kummer class. Prime selection then supplies the generating Frobenius with q ≡ −1 modulo n and q not congruent to −1 modulo np where required. That selection lies in the surrounding theorem proof after Lemma 5.4; the lemma’s own proof only supplies the valuation obstruction.

**Corrections made:** CH-L16 now cites “Theorem 5.2 proof, including Lemmas 5.1–5.4” rather than “Lemma 5.4 proof.” Its reason also explicitly states the Proposition 4.2 root exclusion and separates the injectivity coprimality assumption. These clarify the already named consumer hypotheses without planning another density or Kummer theorem. The finite-Chern-class comparison, root-choice compatibility, local-R isomorphism and scalar comparison remain Habiro work.

[Layer 10](https://github.com/CBirkbeck/tauceti-explorer/blob/e88303406dd3eaa2fa08e978c58f7f03a009df4b/content/tau-ceti/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev) supplies precisely infinitude of a Frobenius class and finite-exception invariance. [HB.2](https://github.com/CBirkbeck/tauceti-explorer/blob/e88303406dd3eaa2fa08e978c58f7f03a009df4b/content/campaign/HabiroNumberFields/README.md) requires the CGZ finite-Chern comparison with its good-n assumptions; its accepted request names both consuming nodes. The inferred edge has the correct prerequisite-to-consumer direction and does not assert a new effective bound or certify the surrounding partial blueprint.

### /2: the BMS interfaces

Freshly read [Bass–Milnor–Serre, published scan](https://www.numdam.org/item/10.1007/BF02684586.pdf), printed pp. 82–83, physical PDF pp. 25–26, both extracted text and rendered scans. (A.5) supplies reciprocity/existence for an open finite-index idele-class quotient; (A.6) supplies infinitely many unramified primes for each abelian Frobenius. Their composition yields (A.7). CH-L17 correctly keeps the existence theorem and ray-class/idele dictionary as separate imports, rather than deriving them from Chebotarev.

For the number-field part of (A.8), absence of a primitive m-th root makes K(ζₘ)/K nontrivial. A nonidentity automorphism moves its generating root. Chebotarev produces infinitely many primes away from m with that Frobenius, and the arithmetic norm-power formula implies the absolute norm is not 1 modulo m. CH-L17 and CH-L18 retain these assumptions and do not claim the stronger cyclic-completion statement, the function-field corollary (A.9), elementary generation or SK₁ vanishing from density alone. [U.4](https://github.com/CBirkbeck/tauceti-explorer/blob/e88303406dd3eaa2fa08e978c58f7f03a009df4b/content/campaign/KTheoryLowDegrees/README.md) owns the BMS arithmetic proof and explicitly asks for the actual class-field inputs.

The absolute-norm distinction is substantive: for K = ℚ(i), m = 8, the inert prime over rational 3 has norm 9, congruent to 1 modulo 8. Using the rational prime 3 would incorrectly select it. A prime over rational 5 has norm 5 and satisfies the desired exclusion. The link preserves the absolute ideal norm and arithmetic, rather than geometric, Frobenius.

## Library evidence and validation

Read the accepted AUDIT-03 records for Layers 4/10, AUDIT-28 for HB.2 and AUDIT-29 for U.4. The Layer 10 interface and consumer conclusions remain planned; the existing cyclotomic norm-power theorem is reused.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read the declarations, parameters and proofs of [apply_eq_pow_absNorm_of_pow_eq_one and autToPow_eq_absNorm](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean#L96). Their source contents equal the pinned Git blob. The first theorem needs only an m-th root, a number-field base, a prime excluding m, an ideal lying over it and an arithmetic Frobenius; the second adds primitivity and nonzero m. The consumer must construct the extension/Frobenius and transport these hypotheses. Neither theorem supplies prime existence. Mathlib remains pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; this fix makes no new Mathlib declaration claim.

| Fresh source | SHA-256 | Reading extent |
| --- | --- | --- |
| CGZ arXiv v3 | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` | 43-page file; selected pp. 22–23, 26–27 only |
| BMS published scan | `b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996` | 80-page file; selected printed 82–83/PDF 25–26 only |

Both hashes reproduce the fixer’s receipts. This review does not claim a fresh whole-paper reading.

- All fifteen earlier link payloads and three overlaps equal the promoted predecessor. All eight unresolved caveats and the original screen/worker/validation metadata remain unchanged.
- The six new endpoint quotations match literal canonical text. Each added pair has live endpoints and the prerequisite-to-consumer direction. The inferred confidence is appropriate because the source proofs establish the use.
- Read-only production assembly and `merge_links`: **2919 vertices, 8298 → 8301 distinct edges, acyclic**, adding exactly Layer 10 → HB.2, Layer 10 → U.4 and Layer 4 → U.4. Each target `requires` and source `consumers` list is populated. Repeated merge remains at 8301 pairs.
- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json`: **18 links, 3 overlaps, 218 examined, 0 errors and 0 warnings**.
- Intake `check-files` on this report and the link map, and `git diff --check`: **0 problems**.

Only the two authorized deliverables change. There is no new node, definition API or suggested Lean file; no Lean compilation or library build was performed. The current review and summary distinguish this acceptance from the historical screen. No fix remains for the two findings; the named consumer proofs and existing caveats remain their owners’ work. Graph validation is not proof-closure certification.
