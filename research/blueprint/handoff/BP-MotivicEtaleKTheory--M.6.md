# Handoff — BP-MotivicEtaleKTheory--M.6

Issue: #10821. Agent: Codex. Session: codex-QL5yGt. Branch: `codex-QL5yGt-motivic-spectral-sequence`.

This is a complete target-level planning pass, for independent review. M.6 has coverage **planned**, not closed. Every target is planned directly or imported under its existing ID; three explicit mathematical/supplier gaps prevent closure. This submission is not a checkpoint and makes no implementation claim.

## Deliverables and result

The packet, reader and suggested file are `MotivicEtaleKTheory--M.6` in their respective blueprint directories. Only those files and this handoff are changed.

There are **7 new nodes**: 1 construction, 1 definition, 3 theorems and 2 comparisons; **12 API items**, **11 definition/construction unit tests**, **4 new planets**, **3 direct baseline declarations**, **3 gaps** and **4 requests**. Together with M.5d's two existing M.6 planets, the assembled layer has six. Additional theorem checks and worked field/projective-space/curve examples are in the reader.

The accepted M.1 packet now scopes M.1–M.5c and has no M.6 coverage record, despite the issue's older predecessor instruction. M.5d is the actual accepted M.6/M.6a/M.6b supplier. Its node IDs are preserved: tower, moving, layers, filtered global model, exact couple, convergence, products/Adams, degeneration and the two M.6 exports are imported. No supplier packet or atlas content was edited.

The new material specifies universal motivic Chern evaluation, the positive-degree scalar (−1)^(j−1)/(j−1)!, product/Adams compatibility, gamma versus homotopy-coniveau filtration, relative cycle normalization, actual equality with the edge comparison, and residue compatibility. It keeps the degree-zero Newton/rank formula separate. The full gamma-filtration comparison uses the relative K₀ moving argument and finite tower bounds, not operationwise gamma vanishing. Its use of filtered Adams is restricted to the generic supported K₀/Koszul weight calculation; the higher gamma-filtration isomorphism cannot be assumed in proving its own finite-length hypothesis.

## What remains and where to resume

1. **G1:** refine M.6a's already recorded filtered FS/Levine zigzag and M.6b's coherent simultaneous-moving products/Adams comparison. Add the precise adapter identifying the normalized edge inverse with Levine's multirelative cubical cycle class, preserving augmentation, transitions, supports and signs. An E₂-page isomorphism is insufficient. Requests name the existing `global-model-comparison` and `filtered-motivic-products` nodes.
2. **G2:** GeneralAlgebraicKTheory K.2 must extend the existing actual plus/completed-space, Hurewicz and universal evaluation adapter to derived motivic coefficients and finite relative cubical/support diagrams, with ordered iterated fibres and the continuity used for an essentially smooth local curve ring. K-book V.11 verifies group-valued universal classes; it does not alone specify this complete coherent adapter. Riou's uniqueness into motivic Eilenberg–MacLane spaces is stronger in a different target direction than S.6's K-endomorphism uniqueness.
3. **G3:** SF.5 must extend its already requested leading supported Chern normalization to relative cubes with the face nullhomotopies. This proves the actual composite of character and cycle map is one and identifies boundary maps. Read Gillet 1981 Definition 2.34(ii), §2.35 and Theorem 3.1, and Gillet–Soulé 1987 Proposition 5.5, or provide a comparably precise stable-motivic replacement. These are source leads, not verified proofs here. Ordinary Chow classes after forgetting supports cannot settle this.

No general arithmetic-base tower, nonperfect-field extension, singular K/G identification or uncorrected higher proper pushforward formula is asserted. The residue theorem is specialized to the local ring at a closed point on a smooth curve over a perfect field, with trivial normal line and weight drop one. Broader cases require the appropriate tower and Todd/purity hypotheses from their existing owners.

## Library and ownership checks

The reviewed library-coverage entries for M.6/M.6a/M.6b, stage descriptions/edges, relevant blueprint ownership and RS-18 were read. No integrated MotivicEtaleKTheory decomposition exists. The M.1 and M.5d packets and the exact S.6/S.7/M.4/K.2/MC.4 supplier statements were checked. The links screen found no separate link-file entry requiring an ownership change.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the actual `Nat.factorial`, `Nat.factorial_succ` and `Nat.factorial_ne_zero` declarations were read. They supply scalar arithmetic only. Pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was searched for higher Chow, motivic, Chern-character/class and higher-K declarations, without a matching carrier; categorical Exact K₀ is not higher scheme K. Current read-only Tau Ceti and current TauCetiRoadmap main were also checked. AlgebraicVectorBundles and JacobianChallenge README/Suggested files were the nearby upstream models; their bundle and Picard objects are imported, not replanned. No command built or modified those read-only checkouts.

## Sources and corrections

The packet records public URLs, editions, read sections, access date 2026-10-19 and hashes. The reader gives target-specific theorem/section/printed-page locators. All source descriptions and the finding are in our own words; no source passage or source file is committed.

- Weibel, August 29, 2013 author K-book PDF: V.11 pp.451–459; VI.4 pp.479–482 and 485–486.
- Levine, December 2001 author *K-theory and motivic cohomology of schemes, I*: introduction pp.1–4; relative-to-loop comparison pp.59–61; Grassmannian moving/filtration inclusion pp.65–68; finite-filtration/Adams argument pp.68–74. The field comparison uses the semilocal Grassmannian portion of the proof, including finite-field norms; the printed one-dimensional-base corollary is not applied to a field without that explanation. The full §11/Appendix D coherent product proof remains an inherited supplier refinement.
- Levine, Astérisque 226 (1994): Theorem 3.1 proof pp.276–278 and Theorem 3.3 proof pp.279–283; Theorem 3.4 statement and initial proof pp.283–284; Theorem 5.2 proof pp.313–316. Do not describe Theorem 3.4's full supported proof as read.
- Levine, arXiv math/0510334v1: introduction, Theorem 6.4.2 pp.35–37 and §11.3 pp.63–65, corroborating the imported layer normalization/indexing.
- Riou, arXiv 0907.2710v2: readable HTML §6.2 pp.31–35 and §6.3 theorem statements pp.35–36. The HTML counterpart was used because PDF text extraction was defective. No general higher proper Riemann–Roch theorem is added.

Existing M.5d source issues E6–E8 (Levine projector indices, inclusion direction and Adams weight sign) are referenced, not duplicated. New **E-M6-1** records the K-book VI.4.3 p.481 degree-three étale coefficient: the universal convention gives +2, rather than the printed negative coefficient. The packet explains the check using V.11.3, V.11.12(4) and V.11.13. This changes no exponent conclusion. The author's linked errata PDF returned 404 on the checked Rutgers hosts; no published correction was verified, and no claim of absence is made. An independent reviewer should verify the finding.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6.json --json`: **zero errors, zero packet warnings**, including resolution of all three names in the available pinned declaration index.
- `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6.lean`: **exit 0**, with nine declaration-uses-sorry warnings only. Memory available immediately before checking: 83 GiB. The helper used the existing pinned Mathlib build. No language server, build, update or cache download was run.
- The suggested file has **71 lines**, one real-bodied light scalar definition, two theorem signatures and seven examples. There are no unproved data definitions or simulated motivic carriers. All seven full mathematical targets remain README targets under the binding compact-shape rule.
- JSON parsing, packet/reader API/test/name consistency, cross-packet planet totals, authorized-path checks and whitespace checks passed. Scratch source files are disposable and will be removed after opening the PR; all resume-critical information is in these deliverables.

A successful Lean check here verifies only the compact scalar prototype's elaboration. M.6 remains planned until G1–G3 and the four supplier requests are discharged; no stage is reported closed.
