# Independent review REVIEW-EXT-03 — EXT-03 packets

Reviewer: independent-review-REVIEW-EXT-03. Date: 2026-09-15. Scope: the draft packets in
`research/expansion/external/EXT-03/`, reviewed one at a time in the order set by the
orchestrator. Method (per `research/expansion/PROTOCOL.md`):

* each node's statement, hypotheses, proof steps, acceptance items, locators and excerpts
  were compared with the cited passage of the source;
* each link was checked for direction, for the place where the consumer uses the supplier's
  output, and for existence of both endpoints (atlas stage or packet node);
* every `parentStageId` and coverage `stageId` was checked against `data/atlas.json`.

Line numbers refer to text extractions of the PDFs named in each packet's `sources`. Where the
drafter's extraction is not in the library, the reviewer regenerated it with `pdftotext -layout`
and confirmed that the cited line numbers match. Each reviewed packet carries a top-level
`review` object with per-node verdicts. Packet `status` stays `partial` and
`implementationStatus` stays `unchecked`.

---

## 1. PadicDifferentialEquationsAndRigidCohomology.json (scope RD.2)

**Verdict: accepted.** Nodes: 0 verified, 2 corrected, 0 unverifiable. Links: 2, both kept
with corrected reasons and locators. Gaps: 2 → 4. Coverage: 8 stage records, all atlas stages
of the roadmap, owner checked.

### Sources and provenance

| Source | Copy inspected | Provenance |
| --- | --- | --- |
| Kedlaya, *A p-adic local monodromy theorem*, arXiv:math/0110124v4 (stamped 1 Jan 2003, 85 pp.) | Re-fetched by the reviewer to scratch (not in the library) | URL `https://arxiv.org/pdf/math/0110124v4`, fetched 2026-09-15, 813805 bytes, SHA-256 `f38f45d4a956187ba26872363fcb880bf9e18c20f611bd07e25825022c9fc568`, identical to the packet's recorded hash. `pdftotext -layout` gives 4508 lines, matching the drafter's line numbers. |
| Berger, *Représentations p-adiques et équations différentielles*, arXiv:math/0102179v3 (5 Oct 2001) | Library copy | SHA-256 `142e7948f3c2da0cba0e0e764c2543cb3f0cf039470711fae729c9c3d2f54f6c`; added to the packet as a new source entry. |

Read by the reviewer:

* Kedlaya abstract, §§1.1–1.5 (pp. 2–8), §2.5 opening, Theorem 6.10 with proof (pp. 77–78),
  §6.4 (Proposition 6.11 and Theorem 6.12 with proofs, pp. 79–82), §6.5 (Theorem 6.13 with
  proof, pp. 82–83), and the relevant reference-list entries.
* Berger §0.3, §0.5, §5.5 (Théorèmes 5.19–5.20 and the proof of 5.19, pp. 56–58), and the
  statement of Théorème 5.23.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| RD.2/quasi-unipotence-and-local-monodromy-statement | corrected | The excerpt of Theorem 1.1 (lines 139–140) and the definition of quasi-unipotence (130–135) are verbatim. **Hypotheses corrected.** "Robba ring over a complete discretely valued field … σ any Frobenius lift" replaced by the source's setting: k of characteristic p, not assumed perfect; O finite totally ramified over a Cohen ring C(k); a Frobenius is a composition power of an endomorphism preserving Γ_con and lifting the p-th power map. The σ-module and (σ,∇)-module definitions were added. **Unsourced claim removed.** "The theorem is false for differential modules without Frobenius" is not in any passage read. It was replaced by what §1.2 says (the Christol–Mebkhout filtration exists without Frobenius; André and Mebkhout need Frobenius for quasi-unipotence), and the missing counterexample is recorded as remaining work. **Acceptance.** The consumer list is not an acceptance test and was relabelled. The stage's "nilpotent residue" item is now tied to the abstract's nilpotent-matrix formulation, and the source's Bessel isocrystal example (§1.5) was added. **Added.** The reviewer read and added the precise form (Theorem 6.12(d)–(g)), the logarithmic form (Theorem 6.13) and the σ-independence remark ([T2, Thm 3.4.10], "not needed in this paper"), with proof outlines. |
| RD.2/slope-filtration-for-frobenius-modules-statement | corrected | Theorem 1.2 is verbatim (lines 199–207). **Dieudonné–Manin summary.** It dropped the source's hypothesis (complete DVR of mixed characteristic with algebraically closed residue field) and turned "the slopes that occur do not depend on the decomposition" into a "multiset" claim; both were fixed. **"Canonical (functorial)".** The source states uniqueness, not functoriality: (a)–(b) determine the filtration and the N_i are unique (Theorem 6.10, read). Corrected. **"So Theorem 1.2 implies Theorem 1.1".** §1.2 only says that it "makes it possible to deduce" 1.1; the deduction given needs Theorem 6.12(d)–(e) (∇-stability) before Proposition 6.11 applies. Qualified. **Unit-root acceptance item.** Aligned with Proposition 6.11: a finite extension K of k((t)), separable if k is perfect and nearly separable otherwise, under the hypothesis v_p(A−I) > 1/(p−1). |

### Links

* **slope filtration → local monodromy (internal).** Direction correct. The locator was
  "§1.2, last paragraph", which only announces the deduction. The actual use site is added:
  sentence before Theorem 6.12 and its proof, pp. 80–82, lines 4240–4328.
* **local monodromy → PadicHodgeTheory:R06.3.** Direction and endpoint correct: R06.3
  requires RD.2 in the atlas, and its description asks for the p-adic monodromy theorem.
  **Annotated.** The consumer argument (Berger, library arXiv v3, proof of Théorème 5.19,
  p. 58) does not use Theorem 1.1 as stated. It first reduces to k algebraically closed, then
  applies Théorème 5.20, which gives a basis of solutions over R_L[log π] for a finitely
  presented differential module with Frobenius structure over R_K = B†_rig,K. Berger
  attributes 5.20 to André and names Kedlaya only as another proof. The export RD.2 must
  supply is therefore Kedlaya's Theorem 6.13 transported to Berger's rings. The reason and
  locators were rewritten, and a gap records the unchecked transport: field of norms
  identification, Frobenius normalization, finite presentation versus finite free.

### Structure

* Both `parentStageId`s are `PadicDifferentialEquationsAndRigidCohomology:RD.2`, owned by the
  roadmap.
* All eight coverage stage ids exist.
* RD.1's remaining list now notes that the slope filtration, which the atlas assigns to RD.1,
  is filed under RD.2.
* RD.2's remaining list now names the unread internal inputs of Chapters 2–5 (Propositions
  2.5, 3.18, 3.19(c), 4.4–4.5, 5.5, 5.8–5.11, 5.16, 6.9, Corollary 3.16, Theorem 5.6), Tsuzuki
  [T1, Thm 5.1.1] and [T2, Thm 3.4.10].

### Gaps added or updated

* **Proof-reading gap.** Updated to the reviewer's reading, and no longer points to a
  vanished scratch extraction.
* **New: form of the export consumed by R06.3.** Records Berger Théorème 5.20 versus Kedlaya
  Theorem 6.13.
* **New: imports named in the Chapter 6 proofs.**
  * [T1, Thm 5.1.1] is imported at line 4166. The existence of a finite K with
    v_p(A−I) > 1/(p−1), needed to apply Proposition 6.11 in Theorem 6.12(f), is not argued in
    the text.
  * [Bg, Lemme V.14] is the attribution for Theorem 6.12(e).
  * Two printed misprints: "which span M" for N_1 in 6.12(f), and the indices in the proof of
    6.13.
* **Theorem 6.13's integration step.** Justified in the source only by "recall from
  calculus"; convergence of the termwise antiderivatives is not discussed. Recorded under RD.2
  coverage.

### Unverifiable items

None. Every node claim is now either traced to a passage read or explicitly marked as unread
input.

### Questions for the orchestrator

1. **RD.1 vs RD.2 placement.** The atlas RD.1 text owns "slope filtrations … existence/uniqueness
   and descent", but the packet files Theorem 1.2/6.10 under RD.2. Either move the node to RD.1
   (node id changes) or amend the stage texts. No other packet references the node id.
2. **R06.3 export form.** Confirm that RD.2 should export the logarithmic form (Theorem 6.13),
   since that is the form Berger's deduction consumes. The alternative is for R06.3 to cite
   André's Hasse–Arf paper, which is unread.
3. **Catalogue registration.** Kedlaya math/0110124v4 is not in `CATALOGUE.json`. The hash above
   is ready for registration. Tsuzuki, Amer. J. Math. 120 (1998), is needed for [T1, Thm 5.1.1].

---

## 2. PadicHodgeTheory.json (scope R06.1 B_dR^+ part, P8:local-rational)

**Verdict: accepted.** Nodes: 0 verified, 10 corrected, 0 unverifiable. Links: 21 → 24.

* Re-pointed: 1 supplier and 1 target.
* Added: 3.
* Annotated: 2 (atlas compatibility and unread consumer).
* Remaining links verified, some with sharpened reasons.

Gaps: 6 → 9. Coverage: 10 stage records, all atlas stages of the roadmap. No stage-level cycle
(checked against atlas `stageEdges` and `requires`).

### Sources and provenance

All three sources are library copies. SHA-256 re-verified:

| Source | SHA-256 |
| --- | --- |
| Scholze, *p-adic Hodge theory for rigid-analytic varieties*, author version dated 3 Nov 2012 | `73dded06…` |
| Scholze, *Erratum* | `3cfa56b9…` |
| Scholze, *Perfectoid spaces*, arXiv:1111.4914v1 | `065441a8…` |

The packet's line numbers match the library text extraction of the rigid-analytic paper. For
Sch12 the reviewer regenerated a `pdftotext -layout` extraction. Nothing was fetched.

Besides every cited passage, the reviewer read:

* Proposition 3.15 with the base-change paragraph (p. 19);
* the statements of Lemma 3.16 and Corollary 3.17 (pp. 19–20);
* Definition 5.9 and Lemma 5.10 (p. 33);
* the reference list;
* Sch12 Theorem 6.3 (p. 30).

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| R06.1/bdr-plus-of-perfectoid-affinoid-algebras | corrected | Lemma 6.3/Corollary 6.4 (lines 2029–2076) match. **x_i.** ξ = [π] − Σ p^i[x_i] must lie in W(K♭+), so x_i ∈ K♭+, not O_{K♭} as printed; the surjectivity argument produces such x_i. **Imports named.** θ-surjectivity (recalled at line 2037) and R♭+/π ≅ R^+/p. **Minor.** The misprint "f" for y is noted, and the acceptance items are marked as recalled or definitional. |
| P8:local-rational/proetale-structure-sheaves-and-valuations | corrected | Definition 4.1/Lemma 4.2 match. **Acceptance.** "Ô_X^+(X) is the p-adic completion of O^+(X)" contradicts the remark after Lemma 4.2, which says this is unknown for general U. Replaced by the Lemma 3.16 identity for U ∈ X_ét and the affinoid perfectoid statement. **Misprint.** "g ∈ p^n Ô_X^+(Ũ)" in the proof of (v) should read g ∈ Ô_X^+(Ũ). |
| P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks | corrected | Definition 4.3–Proposition 4.8 match. **Field hypothesis.** The source says "for simplicity", not "needed"; Remark 4.11 is added. **Asserted steps named.** "One immediately checks", "Recall", the universal property of rational localization, and completed direct limits in Lemma 4.6. **Imports.** Colmez [6] §4.4 / Lemma 1.15(iii) for Proposition 4.8. **Acceptance.** The example {\|T\| ≤ \|p\|} is empty on the torus; replaced. **Pages.** 23–25. |
| P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids | corrected | Lemma 4.10 matches. **Lemma 3.18.** It is on p. 21 (not 20–21), and "i ∈ N" was restored. **Unwritten step.** The "almost version of Lemma 3.18" is not written in the source; the drafter's R^1 lim justification is now labelled packet-authored. |
| P8:local-rational/period-sheaves-definitions | corrected | Definition 6.1/Remark 6.2 match. **Hypothesis.** It said Ô^+_{X♭} is "lim_Φ Ô_X^+/p on affinoid perfectoids". Definition 5.9 (read) defines lim_Φ O_X^+/p as a sheaf on all of X_proét; its values are Lemma 5.10. |
| P8:local-rational/period-sheaves-on-affinoid-perfectoids | corrected | Theorem 6.5, Corollary 6.6 and Proposition 6.7 match. **Base.** Proposition 6.7 is over Spa(Q_p, Z_p), not Spa(K, K^+). **Tilted input.** Lemma 5.10 is now named, replacing "tilted version of Lemma 4.10". **Recalled/asserted.** t = log([ε]) and Proposition 3.15. |
| P8:local-rational/corrected-structural-de-rham-sheaf | corrected | Erratum item (3) and Definition 6.8/Remark 6.9 match. **Acceptance.** It had X_proét/X̃ where the erratum has X_proét/X̃_K. **Filtrations.** Marked as carried over from Definition 6.8. |
| P8:local-rational/local-structure-of-structural-de-rham-sheaf | corrected | Proposition 6.10 and Lemmas 6.11–6.12 match. **Lemma 6.11.** Its hypothesis is a perfectoid affinoid (K, O_K)-algebra; restored. **Proof step.** The original "easily seen to be inverse" is exactly what the erratum says fails; flagged. **Erratum proof.** The erratum's asserted maps (S_i → B_dR^+[[X]], and R_i^+ → B_dR/ξ^r with bounded image) and its terse passage to (B_dR/ξ^r)_0 are recorded. **Base.** The W(κ)[1/p]-versus-k step in applying Lemma 6.12 is noted. |
| P8:local-rational/poincare-lemma-and-faltings-extension | corrected | Corollaries 6.13–6.15 match. **Proof.** The source proof is "obvious"; the packet's power-series argument is now labelled packet-authored. **Corollary 6.15.** Has no proof. **Local charts.** The Huber 1.6.10 input was added. |
| P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf | corrected | Proposition 6.16, Lemmas 6.17–6.18, Corollary 6.19 and Lemma 5.5 match. **Remark 6.20 misprint.** The statement copied "R^iν_*Ô_X(j) = Ω^i log χ for i = j+1". Proposition 6.16(ii) and the graded Poincaré sequences give Rν_*Ô_X(j) ≅ Ω^j[−j] ⊕ Ω^j log χ[−j−1]. For j = 0 the printed form would give Ω^1 log χ instead of O log χ. Corrected. **Γ_k-descent.** R(i) → R⊗̂K(i) is asserted "similarly to Lemma 5.5" but is a Tate-type result; relabelled. **Asserted steps listed.** The Corollary 6.6 variant, "inspection of the proof", and local toric charts. |

### Links

* **Re-pointed supplier.** The Sch12 Theorem 6.3(ii) supplier is now
  PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets. It was
  P2/sheaf-theorem-and-almost-acyclicity, which states only 6.3(iii)–(iv), and Lemma 4.5 does
  not use those.
* **Re-targeted.** The Definition 4.1/Lemma 4.2 node → affinoid-perfectoid node link now
  targets the Lemma 4.10 node. Definition 4.3 and Lemmas 4.5–4.7 do not use Definition 4.1,
  while Lemma 4.10(iii) and its final assertion do.
* **Added (3).**
  * PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel → R06.1 node (θ-surjectivity).
  * PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring → R06.1 node (R♭+/π ≅ R^+/p).
  * R06.1 node → local-structure node (Corollary 6.4 and ξ in the proof of Lemma 6.11). This
    use was previously attributed to Theorem 6.5.
* **Annotated.**
  * AInfCohomology:AI.0:integral → R06.1 node: an atlas compatibility constraint, not a proof
    input. AI.0:integral's description covers only A_inf/θ/ξ for (C, O_C), while Lemma 6.3
    needs every perfectoid affinoid (K, K^+)-algebra.
  * P8 Poincaré lemma → CohomologyComparisons:CP.3: CP.3's description names this supply, but
    the consumer use site is unread. The CohomologyComparisons draft has no CP.3 node consuming
    P8, and the supply is limited to smooth X over discretely valued k with perfect residue field.
* **Sharpened reasons.**
  * P7/tilde-limits: the Theorem 4.9 clause lies outside the target and was removed.
  * Lemma 4.10 → Theorem 6.5: now names Lemma 5.10.
  * Theorem 6.5 → OB_dR: (R, R^+) comes from Definition 4.3, not Theorem 6.5.
  * Theorem 6.5 → Faltings and → Proposition 6.16: implicit uses marked.
* **Verified unchanged.** A1 → Definition 4.1 (A1's description owns the corrected pro-étale
  covers), the other PerfectoidSpaces imports into Lemmas 4.5 and 4.10, and the internal chain
  of Section 6.

### Structure

* parentStageIds R06.1 and P8:local-rational are owned by PadicHodgeTheory.
* All 10 coverage ids exist.
* **P7.** Its coverage said "container stage", but its atlas text has real content (PG
  imports, Wach/D_cris comparison); rewritten.
* **R06.3.** Now cross-references the Berger finding from packet 1.
* **P8:local-rational.** The import list is updated with what the reviewer read (Proposition
  3.15, Lemma 3.16/Corollary 3.17, Definition 5.9/Lemma 5.10) and with asserted steps.
* **Cross-stage edges.** Two packet edges are not in the atlas: PerfectoidSpaces:P2 →
  P8:local-rational and PerfectoidSpaces:P7 → P8:local-rational. The atlas lists only P3 among
  P8:local-rational's PerfectoidSpaces requirements. Both edges are acyclic.

### Gaps added

* **Supplier scope for A_inf/θ of perfectoid affinoid algebras.** Records the AI.0:integral
  versus PerfectoidSpaces P1 question.
* **Lemma 5.10 has no node.** Theorem 6.5's induction depends on its one-sentence proof.
* **Remark 6.20 misprint and missing proof.**
* **Updated gaps.** The Lean-primitives gap was confirmed against the TauCeti checkout's vendored
  mathlib (`surjective_fontaineTheta`, `fontaineThetaInvertP`, `BDeRhamPlus`, `BDeRham`). The
  unread-inputs gap now includes Colmez [6] and Tate [19].

### Unverifiable items

None.

### Questions for the orchestrator

1. **R06.1 generality.** Should the R06.1 B_dR^+ node keep the (R, R^+) generality of Lemma 6.3
   with PerfectoidSpaces P1 as proof supplier, or restrict to (C, O_C) and import
   AInfCohomology:AI.0:integral? The atlas currently names only the latter.
2. **Atlas edges.** Add PerfectoidSpaces:P2 and P7 to P8:local-rational's `requires`, since
   Lemma 4.5 uses Sch12 Theorem 6.3(ii), Lemma 6.4 and Definition 7.14. Alternatively route them
   through P3.
3. **Relocation.** The Definition 4.1/Lemma 4.2 and Lemma 4.10 nodes remain relocation
   candidates for AInfCohomology:AI.3 (drafter's gap, unchanged).

---

## 3. PerfectoidQuotients.json (scope Q0:integral-algebra, Q0:animated-application, Q2–Q4)

**Verdict: accepted.** Nodes: 1 verified, 11 corrected, 0 unverifiable. Links: 24 → 28
(4 added, 1 re-targeted, reasons of 1 more sharpened). Gaps: 7 → 8. Coverage: 7 stage records,
all atlas stages of the roadmap. No stage-level cycle.

### Sources and provenance

All sources are library copies, and nothing was fetched.

| Source | Check |
| --- | --- |
| BS22 | Stamp `arXiv:1905.08229v4 [math.AG] 12 Jan 2022` confirmed in the extraction; SHA-256 `1d91a6eb…` matches |
| BMS2 | Stamp `arXiv:1802.03261v2 [math.AG] 9 Apr 2019` confirmed |
| ECD (supplied 14 April 2026 revision) | SHA-256 `4ce3d123…` re-verified. A regenerated `pdftotext -layout` extraction reproduces the cited lines 1107–1133. The packet's URL pointed to arXiv:1709.07343, a different version; replaced by the catalogue URL, with the preprint noted in `edition`. |
| BMS1 (added as a source) | `arXiv:1602.03148v3`, SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |

Reviewer's additional reading:

* BS22 Lemma 3.5, Lemmas 3.8–3.9 and Theorem 3.10 with proofs;
* BS22 Remarks 4.6–4.7 and Lemma 4.8;
* statements of BS22 Corollary 2.31, Lemma 2.34, Corollary 2.39 and Definition 2.42;
* BS22 §8.1 through the proof of Proposition 8.5 (pp. 63–66);
* BMS2 Lemmas 4.15–4.25;
* ECD Definitions 5.6–5.10 and Propositions 5.9 and 5.11;
* BMS1 Lemma 3.20 with proof and Lemma 3.21.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings | corrected | Definitions match BMS2 4.10/4.18/4.20, Proposition 4.19 and BS22 Notation 7.1. **"Equivalently".** The reconciliation of Notation 7.1 with BMS2 4.20 is packet-authored and is now labelled. **Remark 4.21.** Its degree −1 conclusion needs S ∈ QSyn. **Acceptance.** It claimed O_C/p is "not quasisyntomic-relevant". O_C/p is quasiregular semiperfectoid by BMS2 Lemma 4.25 (quotient of O_C by the nonzerodivisor p). |
| Q0:animated-application/perfect-prism-is-initial-over-its-perfectoid-ring | corrected | Lemma 4.8 and its proof match. **Rigidity step.** The packet's third proof step (Lemma 3.5) is not part of that proof, which ends once α is a δ-map with α(I) ⊂ J. Removed; the rigidity link was re-targeted to Proposition 7.2, which uses it ("K = dC by Lemma 3.5"). **Asserted input.** The vanishing of L^∧_{W(S)/Z_p} is recorded as asserted. |
| Q2/initial-prism-of-a-semiperfectoid-ring | corrected | Proposition 7.2 matches. **Category.** The proposition is about *all* prisms under S. The source identifies that category with Remark 4.7's absolute prismatic site, whose objects are bounded prisms, but Δ^init_S "is not bounded in general". The statement is now qualified and the point recorded as a gap. **Acceptance.** Examples reworded ("no relations needed" → Lemma 4.8; the perfection statement now combines Corollary 7.3 with the proof of Theorem 7.4). |
| Q2/universal-perfectoidization | verified | Corollary 7.3 and Lemma 3.9 (read with proof, including the derived-versus-classical completion claims) match. The source's "perfect prisms (A, I) with a map R → A/I" is a misprint for S → A/I; the packet already uses the correct form. |
| Q2/derived-prismatic-cohomology-and-hodge-tate-filtration | corrected | Construction 7.6 and the Theorem 6.3 statement match. **Consequences (2)–(5).** The source calls them "immediate consequences"; the packet's derivation is now labelled packet-authored, and the [BMS19, Example 5.11] pointer for (3) is recorded as unread. |
| Q2/discrete-derived-prismatic-cohomology-gives-a-weakly-initial-prism | corrected | Lemmas 7.7–7.8 and proofs match. **Idempotent completeness.** Lemma 7.8 requires an idempotent complete category, which the source never checks for (R/A)_Δ; recorded as a hypothesis and gap. **Part (3).** The asserted δ-map property is noted. |
| Q2/lci-quotient-prism-is-initial | corrected | Example 7.9 matches. **Hypothesis.** Bounded p-torsion added to the acceptance example. **Inputs.** The uses of Lemma 7.7(1)–(2) and "commutes with arbitrary base change" are recorded. |
| Q2/qrsp-derived-prismatic-cohomology-is-the-initial-prism | corrected | Proposition 7.10 matches. **Quasiregularity.** Notation 7.1 defines it via L_{S/Z_p}[−1], not L_{S/R}[−1]. **Acceptance.** It said O_C/p is "not semiperfectoid in the required sense", which is wrong. The Example 7.9 specialization lacked the nonzerodivisor and bounded-torsion hypotheses. **Implicit.** The reduction needs naturality of the idempotents; recorded. |
| Q3/lifting-quasisyntomic-covers-to-prisms | corrected | Proposition 7.11 matches. **Assertions.** "It is easy to see" claims are labelled, and the passage from p-complete flatness of A/I → B/IB to (p, I)-complete flatness of A → B is noted as unwritten. **Attribution.** Footnote 12 belongs to Example 7.12, not to 7.11. |
| Q3/andre-flatness-lemma | corrected | Theorem 7.14 and Remark 7.15 match. **Acceptance.** O_C is absolutely integrally closed only for C algebraically closed. **Notation.** The source's "perfect prism (B, IB)" means the perfection. |
| Q4/surjectivity-of-perfectoidization | corrected | The proof of Theorem 7.4 matches, with the printed misprint "I = (f)" for J. **Acceptance.** The example (f = T − 1) silently used the unproved base change. Replaced by a root-bearing example (f = T, giving S_perfd = Z_p^cycl) plus an explicit pointer to the gap. |
| Q4/zariski-closed-subsets-are-strongly-zariski-closed | corrected | Remark 7.5 and ECD Definition 5.7, Theorem 5.8, the following remark and Proposition 5.9 match, and the ECD misprint S^+ → R^+ is confirmed. **Completions.** "ϖ-adic = p-adic completion because ϖ^p \| p" is insufficient. The two topologies agree when p is a unit of R; in characteristic p only the ϖ-adic completion is meaningful; the source discusses neither case. **Semiperfectoid input.** Located and read: BMS1 Lemma 3.20 ("If R is perfectoid in Fontaine's sense, then R^+ is perfectoid"). It also covers T° in the universal-property step, which the packet had glossed. **Acceptance.** The closed-disc example was rewritten: R' = K, and the kernel is the closed ideal generated by all T^{1/p^n}, not (T). |

### Links

* **Re-targeted.** PrismaticCohomology:PR.0/rigidity-prism-ideal → Lemma 4.8 node becomes → Q2
  initial-prism node (Proposition 7.2 proof, line 2438).
* **Added.**
  * Q2 derived Hodge–Tate node → Example 7.9 node (discreteness, gr^1).
  * Lemma 7.7 node → Proposition 7.10 node (idempotent).
  * Lemma 7.7 node → Proposition 7.11 node (δ-structure).
  * Q0:integral-algebra node → Remark 7.5 node (semiperfectoid definition; BMS1 3.20).
* **Suppliers checked against atlas descriptions.** All scopes are adequate:
  * DD.1: derived (p, d)-completion and exchange with filtered colimits.
  * DD.0: derived exterior powers and base change.
  * DD.5: quasisyntomic covers with compatible roots.
  * E5:animation: sifted left Kan extensions.
  * PR.1: Hodge–Tate comparison.
  * PerfectoidSpaces:P4: definitions of (strongly) Zariski closed immersions.
* **PR.0 draft nodes.** Their statements (rigidity, perfect prisms ↔ perfectoid rings, regular
  envelopes with Definition 2.42) state what Section 7 uses.
* **Atlas edges.** Nine packet edges have no atlas edge but are acyclic: DD.0/DD.1/E5/PR.0/PR.1 →
  Q2, PR.0 → Q3, Q0:integral-algebra → Q2/Q4, Q0:animated-application → Q2. The atlas routes most
  of them through Q0/Q1.

### Structure

All parentStageIds belong to PerfectoidQuotients, and all coverage ids exist. Changes by coverage
record:

* **Q0:integral-algebra.** Now points to BMS1 Lemma 3.20 and its imports.
* **Q2.** Gained the idempotent-completeness and bounded-prism items.
* **Q4.** Gained the §8 finding.

### Gaps

* **Base change of perfectoidization.** BS22 §8 does not close the gap. Proposition 8.5's proof
  uses Theorem 7.4 and re-asserts "the formation of S ↦ S_perfd commutes with p-completely flat
  base change on R" (line 2917), so citing §8 for the step inside the proof of Theorem 7.4 would
  be circular.
* **Integral perfectoidness of R^+.** Rewritten with BMS1 Lemma 3.20 and its unread imports
  (BMS1 Lemmas 3.9–3.10, [45, Lemma 5.5]).
* **Lean.** "No cotangent complex" corrected: mathlib has the naive cotangent complex
  (`Mathlib/RingTheory/Extension/Cotangent/*`, `H1Cotangent`).
* **New gap.** Lists unverified hypotheses and asserted steps in §§4.1 and 7.1–7.3.

### Unverifiable items

None.

### Questions for the orchestrator

1. **Base change.** The base-change compatibility of perfectoidization needed by Theorem 7.4 has
   no non-circular source in BS22. Should Q2/Q4 carry an explicit reconstruction task, or should
   another source be sought (André's original, or Česnavičius–Scholze)?
2. **Integral perfectoidness.** Add BMS1 Lemma 3.20 as a Q0:integral-algebra node, or record it
   as a PerfectoidSpaces P1 export? The atlas says Q0:integral-algebra owns "relation to Tate
   perfectoid rings and integral subrings".
3. **Absolute prismatic site.** Should the orchestrator adopt a convention that the absolute
   prismatic site of a semiperfectoid ring allows unbounded prisms, or record the Proposition 7.2
   initial object as living outside Remark 4.7's bounded site?

---

## 4. PerfectoidSpaces.json (scope P0, P1, P2, P3, P5, P7)

**Verdict: accepted.** Nodes: 26 verified, 7 corrected, 0 unverifiable. Links: 47 → 50 (3 added).
Gaps: 8 → 9. Coverage: 10 records, covering every stage of the roadmap. No stage-level cycle.

This is the most accurate packet of the EXT-03 set. Its proof steps reproduce the source
arguments closely enough that I could follow them line by line, and the boundary between what
Sch12 proves over a perfectoid field and what ECD asserts for general perfectoid Tate rings is
stated honestly in the nodes, the coverage and the gaps.

### Sources and provenance

All three sources are library copies; nothing was fetched. The reviewer regenerated
`pdftotext -layout` extractions of each PDF, and every cited extraction line number reproduces.

| Source | Check |
| --- | --- |
| Scholze, *Perfectoid spaces* | Stamp `arXiv:1111.4914v1 [math.AG] 21 Nov 2011` on the first page; SHA-256 `065441a8…` |
| Scholze, *Étale cohomology of diamonds* (supplied revision) | SHA-256 `4ce3d123…` |
| Gabber–Ramero, *Almost ring theory* | Stamp `arXiv:math/0201175v3 [math.AG] 22 Jul 2002`, "sixth (and final) release"; SHA-256 `c4ab39ad…` |

Read by the reviewer: Sch12 Theorem 1.1 and §§3–7 in full, with the reference list; ECD §3 in
full and §6 through Proposition 6.5; and the eleven cited Gabber–Ramero statements
(2.4.18, 2.5.36, 3.2.9, 3.2.16, 3.5.13, 3.5.28, 4.1.14, 5.3.21–5.3.29, 5.4.21, 5.4.54, 6.3.6,
6.6.2, 6.6.6).

**Numbering.** Sch12's [14] is the LNM 1800 *book*, so every Gabber–Ramero number in Sch12 is a
book number. The packet's per-node arXiv correspondences are correct where stated, and the two
unlocated ones ("Theorem 2.5.36", "Lemma 6.5.13 i)") are genuinely unlocatable: the arXiv 2.5.36
is a Tor-vanishing criterion for L_{S/R} ≃ 0, not the transitivity triangle Sch12 uses it for.

### Corrections (7 nodes)

| Node | Finding |
| --- | --- |
| P0/almost-modules-over-perfectoid-base | The hypothesis justified m² = m by p-divisibility of the value group (Lemma 3.2). Nondiscreteness of the rank-1 valuation alone gives it, and the source gives no argument at all; both facts now recorded. |
| P0/almost-finite-projective-and-finite-etale-algebras | The list of Gabber–Ramero citations behind Definition/Proposition 4.7 was incomplete; §2.4.10, Remarks 2.4.12(i) and 2.3.9(i) and Corollary 2.3.13 added, with the book-numbering note. |
| P1/perfectoid-field-definition | ECD Remark 3.7 added: it is not a priori clear that a perfectoid Tate ring which is a field is a perfectoid field; ECD attributes the affirmative answer to Kedlaya [Ked18], which is unread. |
| P1/fontaine-theta-and-primitive-kernel | ECD Lemma 3.16 prints α ∈ W(R⁺) where W(R♭⁺) is meant. The packet had silently used the corrected form; the misprint is now recorded. |
| P3/finite-etale-covers-in-characteristic-p | The acceptance example wrote the Artin–Schreier equation as u² + u = t^{-1}, which is Artin–Schreier only for p = 2; corrected to u^p − u = t^{-1}. The accompanying claim that S° is not free of rank 2 at finite level is unsourced and was removed. |
| P3/finite-extensions-of-perfectoid-fields | The Gabber–Ramero locator listed the propositions (6.6.2, 6.6.6, 6.3.6) and the line ranges (9020, 9983, 10029) in different orders; aligned. |
| P3/strongly-etale-morphisms-and-base-change | The reference label "[Hub93] Lemma 3.9(i)" is Sch12's [19] = Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994). Also recorded: Lemma 7.3(i) prints the surjectivity as \|X ×_Z Y\| → \|X\| ×_{\|Z\|} \|Y\| where \|X ×_Y Z\| → \|X\| ×_{\|Y\|} \|Z\| is meant. |

### Links

* **Added (3).**
  * P0 almost modules → P0 almost finite projective (Definition/Proposition 4.7 and Theorem 4.11
    live in the almost category).
  * P1 perfectoid Tate rings → P1 tilt of a perfectoid Tate ring (ECD Lemma 3.10 uses
    Definition 3.1).
  * P3 local structure of étale maps → P5 ECD 6.4(ii) (the essential-surjectivity step assumes
    the composite-of-rational-open-and-finite-étale structure of Proposition 7.7).
* **Verified.** Every internal link's cited proof location genuinely uses the source node's
  output; I followed each one in the text.
* **Cross-roadmap suppliers.** All adequate for what the reasons claim: AdicEtaleGeometry:A0
  (its description explicitly defers the perfectoid pullback to P2), DiamondsAndVStacks:D0
  (acyclic-basis comparison, named for P2), AdicSpacesPartII:R3 (Tate acyclicity only; the BGR
  boundedness statements have no supplier, recorded as a gap in the link reason itself),
  AdicEtaleGeometry:A1, DerivedDeRhamCohomology:DD.0 (classical cotangent complex; the almost
  version has no supplier, recorded).
* **Atlas edges.** Three packet edges are not in the atlas and are acyclic: AdicSpacesPartII:R3 →
  P2, DerivedDeRhamCohomology:DD.0 → P1, P1 → P3.

### Structure and gaps

All 33 parentStageIds are owned by PerfectoidSpaces; all coverage ids exist. The drafter's
**P3-versus-P5 finding is confirmed**: the proofs of Proposition 7.6 and of Theorem 7.9(ii) both
use Lemma 7.5(i), so the henselian approximation is consumed by P3, while the atlas stage text
places it in P5. A new gap records the printed misprints above together with two small unargued
steps (m² = m; the completion-invariance of the absolute Galois group implicit in Theorem 1.1).

### Unverifiable items

None.

### Questions for the orchestrator

1. **P3/P5 stage texts.** Adjust them so that P3 states the henselian finite-étale approximation
   import (Sch12 Prop. 7.4 / Lemma 7.5) and P5 reuses it for ECD 6.4(i). A P5 → P3 link would be
   a cycle.
2. **Atlas edges.** Add AdicSpacesPartII:R3 → P2 (Tate acyclicity) and
   DerivedDeRhamCohomology:DD.0 → P1 (cotangent complex) to the stage `requires`, or route them
   through P0.
3. **Almost cotangent complex.** No stage owns the almost-context deformation theory (GR §2.5,
   §3.2) that Theorem 5.10 needs. DD.0 covers only the classical theory.

---

## 5. TropicalAndBerkovichArithmetic.json (scope TB.2, TB.5)

**Verdict: accepted.** Nodes: 0 verified, 4 corrected, 0 unverifiable. Links: 3, all kept with
sharpened reasons and locators. Gaps: 2 → 3. Coverage: 8 records, all stages of the roadmap.

### Sources and provenance

Neither paper is in the library. Both were re-fetched from arXiv into the scratch directory:

| Source | Provenance |
| --- | --- |
| Baker–Payne–Rabinoff, *On the structure of nonarchimedean analytic curves* | `https://arxiv.org/pdf/1404.0279v1`, fetched 2026-09-16, 363304 bytes, SHA-256 `5e40117270a0051d9661c9bbd0317968b810573796a5c2408582f20692568a11` — **matches the packet**. Stamp `arXiv:1404.0279v1 [math.AG] 1 Apr 2014`. This is the paper the other one cites as [BPR13]. |
| Baker–Payne–Rabinoff, *Nonarchimedean geometry, tropicalization, and metrics on curves* | `https://arxiv.org/pdf/1104.0320v3`, fetched 2026-09-16, 577783 bytes, SHA-256 `19fbd64ec043835cbadad0375df562d78aa62b26b4820bd1e9f0f79d45c4348e` — **matches the packet**. Stamp `arXiv:1104.0320v3 [math.AG] 10 Jun 2015`. |

A `pdftotext -layout` extraction of each reproduces the cited line numbers. The reviewer read all
of Section 3 and Theorem 4.22 with its full printed proof in the first paper, and the whole
introduction plus Remark 5.6 in the second.

### Nodes (all four corrected)

| Node | Finding |
| --- | --- |
| TB.2/semistable-vertex-sets-and-skeleta | Definitions 3.1–3.6 and Lemmas 3.2, 3.4 match with their proofs. **Conventions garbled.** The packet had "X a smooth connected projective curve, X̂ its analytification and X = X̂ minus punctures". The source has X a smooth connected *algebraic* curve, X̂ its *smooth completion* and D = X̂ ∖ X. Rewritten. The two acceptance items were attributed (vertex genus needs the unread Section 4; the loop length is quoted from the other paper). |
| TB.2/retraction-to-the-skeleton | Definition 3.7, Lemma 3.8 and Proposition 3.9 match, including the "left as an exercise to the reader" boundary, which the packet correctly records. **Acceptance corrected.** The retraction of a ball component is the single point of its limit boundary, which lies in Σ but need not be a vertex of V. The refinement claim is reviewer-authored (Proposition 3.13 is unread). |
| TB.2/stable-reduction-and-minimal-skeleta | Theorem 4.22 and Corollary 4.23 are verbatim. **Proof step corrected.** The packet guessed that existence for a punctured curve comes from "adding vertices separating punctures"; the printed proof says it follows from Proposition 3.13(3). The step now names Proposition 3.13(3), Proposition 4.21 and Lemma 3.4(4), which the printed proof uses, and the locator covers the whole proof. |
| TB.5/faithful-tropicalization-and-expansion-factors | Theorems 1.1, 1.3, 1.4 and the gcd formula match; the gcd formula is in the introduction, with Remark 5.6 (read) giving (5.6.1). **Two corrections.** H°(X^an) is the space of *non-leaves*, and the leaves are the K-points *together with the type-4 points*, so it is not the complement of the type-1 points. And the standing hypotheses (K algebraically closed and complete with a nontrivial valuation, X nonsingular) *are* stated in the introduction, contrary to the packet's note. The slopes s_i(e) are absolute values. |

### Links

All three have the right direction and their cited locations do use the supplier's output. The
TB.2 → TB.5 reason now records that the tropicalization paper defines the metric on H°(X^an)
through semistable models, citing [BPR13] — the very paper decomposed in the TB.2 nodes. The
TB.2 → stable-reduction reason now points at the place in the printed proof that uses
Lemma 3.4(4).

**Atlas edge.** TB.2 → TB.5 is a stage-level edge the atlas does not have (it routes
TB.2 → TB.3 → TB.5). It is acyclic.

### Gaps

* Updated: the standing hypotheses of the tropicalization paper are in the introduction, so what
  remains unread is the body (Theorems 4.28, 4.30, 5.8, Corollary 5.9, the domination order).
* Added: neither paper is in `CATALOGUE.json`; the packet's SHA-256 values are confirmed correct,
  so catalogue records can be created from the source entries.

### Unverifiable items

None.

### Questions for the orchestrator

1. **Catalogue.** Register both BPR papers (hashes above), and the other uncatalogued sources the
   coverage names (Chambert-Loir math/0304023 for TB.6).
2. **Atlas edge.** Either add TB.2 → TB.5 to the stage `requires`, or route the skeleton input
   through TB.3 as the atlas currently does.

---

## 6. WeightsInEtaleCohomology.json (scope R34.1, R34.5)

**Verdict: accepted.** Nodes: 2 verified, 3 corrected, 0 unverifiable. Links: 10, all verified.
Gaps: 3 → 4. Coverage: 6 records, all stages of the roadmap.

### Source

Deligne, *La conjecture de Weil II*, Publ. Math. IHÉS 52 (1980), library copy from Numdam,
SHA-256 `b06eea61…`. The extraction is an OCR of the scan, so symbols are frequently mangled and
every statement had to be reconstructed from context; the cited line ranges reproduce. The
reviewer re-read Section 1.2, Section 3.3 (Theorem 3.3.1 through 3.3.11) and Section 3.4
(Theorem 3.4.1, Lemmas 3.4.2–3.4.4, the proof 3.4.5 of (iii), the opening of 3.4.6).

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| R34.1/pure-numbers-punctually-pure-and-mixed-sheaves | corrected | Every item of §1.2 matches, including the zero sheaf being pure of every weight with empty weight set, the automatic ι-mixedness of W(k̄/k)-representations, and Conjectures 1.2.9–1.2.10 recorded as unproved. The justification of (1.2.14) is packet-authored (the source states it without proof) and is now labelled. |
| R34.5/direct-image-with-compact-support-preserves-upper-weight-bounds | verified | Theorem 3.3.1 and its proof match in every detail: dévissages (a)–(f), the reduction to relative dimension 1 with F lisse punctually pure, facts (α) and (β) about curves over a perfect field, the tame cover with F a direct summand of u_*u^*F, the spreading out from the generic point, and the final use of Theorem 3.2.3 and Theorem 1.8.4 with 1.8.6–1.8.8. The listed imports are exactly those the proof names. |
| R34.5/integral-sheaves-and-lower-weight-bounds | verified | (3.3.2) and Corollary 3.3.3 match, including the norm argument and the citation of SGA 7 XXI (5.2.2) applied to the fibres. |
| R34.5/weights-of-cohomology-over-finite-fields | corrected | Corollaries 3.3.4–3.3.9 and variants 3.3.10–3.3.11 match. **Rendering of 3.3.10 corrected**: the weights that can appear in R^i f_! F are those ≤ β + i congruent mod ℤ to a weight of F. **Printed slip recorded**: the proof of 3.3.5 cites (3.3.3), which assumes integrality, where (3.3.1)/(3.3.4) is what is used. |
| R34.5/structure-of-mixed-sheaves-and-geometric-semisimplicity | corrected | Theorem 3.4.1(i)–(iii), Lemmas 3.4.2–3.4.4 and the proof of (iii) match, including the invariants/coinvariants convention and the maximal-semisimple-subsheaf argument. **Proof step corrected**: the relevant sheaf is Hom(F, G) of weight γ − β; the source's first sentence names Hom(G, F), which is the slip. |

### Links

All ten links have the right direction, and the cited location in each case is where the
consumer uses the supplier's output. Supplier scopes checked against the atlas: DWP.0 (Weil
numbers, ι-weights, twists, duals, tensor rules), DWP.7 (the proof of 3.3.1 with its dévissages,
and it explicitly promises the smooth-proper export), DWP.8 (its description quotes 3.4.1 almost
verbatim) and EDC.2 (Poincaré duality, the only extra input of 3.3.5). The export
R34.5 → WeilConjectures:WC.6/purity-for-proper-smooth-varieties matches the node in that packet.

**Atlas edges.** Three packet edges are not in the atlas and are acyclic: EDC.2 → R34.5,
R34.1 → R34.5, R34.5 → WeilConjectures:WC.6.

### Gaps

A new gap records the two printed slips above and the fact that 3.4.6 (uniqueness in 3.4.1(i)–(ii))
begins at the end of the range read and was not decomposed.

### Unverifiable items

None.

### Question for the orchestrator

**Relocation.** The drafter's own finding stands: DWP.7 and DWP.8 own Theorems 3.3.1 and 3.4.1,
and their packets (EXT-02) do not exist. These four R34.5 nodes are records of what was read, not
a claim of ownership; when the DWP packets are written they should become links.

---

## 7. WeilConjectures.json (scope WC.1, WC.2, WC.3, WC.6)

**Verdict: accepted.** Nodes: 3 verified, 3 corrected, 0 unverifiable. Links: 8, all verified.
Gaps: 3, one corrected. Coverage: 10 records, all stages and sub-stages of the roadmap.

### Sources

Three library copies, all OCR extractions of scans; the cited line numbers reproduce, and each
statement had to be reconstructed from context.

| Source | SHA-256 | Re-read |
| --- | --- | --- |
| Deligne, *La conjecture de Weil I* (Numdam) | `8392b345…` | Section 1 in full: (1.1)–(1.5.4), Theorem (1.6), Lemma (1.7) with the whole proof of (1.7) ⇒ (1.6), (1.8)–(1.14.3), and the Galois dictionary (1.15) |
| SGA 4½ (IAS scan) | `fb293952…` | [Rapport] §3 (Theorems 3.1–3.2, the T = t^f deduction, Proposition 3.3 with its full proof, Corollary 3.4), Theorem 4.10; [Cycle] §3 (3.1–3.8) |
| Deligne, *Weil II* | `b06eea61…` | (3.3.7)–(3.3.11) and the derivation of Corollary 3.3.9 |

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| WC.1/zeta-function-euler-product-and-point-counts | corrected | (1.1.1)–(1.1.3), (1.4)a)–d) with (1.4.1), (1.5.2)–(1.5.3) and Rapport Proposition 3.3 all match. **Corrected:** the hypothesis called the trace identity proved "in Sch12-style generality", which is meaningless here. It holds for a finitely generated projective module over a commutative ring, and the proof first reduces to a free module (M ⊕ M′), then to an algebraically closed field of characteristic 0, then to rank 1. |
| WC.1/cohomological-formula-from-the-trace-formula | corrected | (1.5.1), (1.5.4), (1.12.1), (1.14.1)–(1.14.3), Rapport 3.1–3.2 and Theorem 4.10 with its Λ-hypotheses all match. **Corrected:** the normalization step read "Set T = t^f-free normalization as in the Rapport (T = t)", which is garbled. Weil I uses t over F_q; the Rapport sets T = t^f with q = p^f and states 3.1 with det(1 − F\*t^f, H^i_c). Both are now recorded, with a hypothesis telling consumers to fix one convention. |
| WC.1/rationality-over-q-via-hankel-determinants | verified | The Hankel/Fatou paragraph matches, and the packet correctly records that both the Hankel criterion and Fatou's lemma are cited without proof. |
| WC.2/lefschetz-trace-formula-proper-smooth-via-duality | corrected | [Cycle] 3.1–3.8 match, including the ℤ/2-grading and Q_ℓ(1) ≅ Q_ℓ normalization, η_XY ∈ Hom(H\*(Y), H\*(X)), the reduction to Tr_{X×Y} = Tr_X ⊗ Tr_Y, and the graph specialization. **Added:** the even-degree argument of 3.1, and the printed misprint "la preuve de 3.4" (for 3.3) in Remark 3.4. |
| WC.3/integral-factors-and-ell-independence-from-purity | verified | Theorem (1.6), Lemma (1.7) and the proof match in every step: coprimality from distinct absolute values, P and Q as products over odd and even i, Galois stability of the root set of P_i, Gauss's lemma, and ℓ-independence. The packet's note that invertibility of F\* is not stated in this passage is correct. |
| WC.6/purity-for-proper-smooth-varieties | verified | Weil II (3.3.7)–(3.3.11) match, as does the derivation of 3.3.9 from the coincidence of the 3.3.4 and 3.3.5 bounds, "raisonnant comme dans I". |

### Links

All eight have the right direction and their cited locations do use the supplier's output. Supplier
scopes: DWP.4 is the atlas owner of Lemma (1.7), and the source says so explicitly ("La suite de cet
article est consacrée à la démonstration de (1.7)"); EDC.2 owns the trace morphism and Poincaré
duality that [Cycle] 3.1–3.3 use; DWP.7's description explicitly promises the smooth proper
nonprojective export (3.3.9) that WC.6 consumes. No packet edge is missing from the atlas.

### Gap corrected

The packet said `UPSTREAM:CohomologicalPointCounting:TraceFormula` "does not exist as a stage record
in data/atlas.json". That is literally true but incomplete: it is an `atlas.external` entry with
`integration_owner: SchemeAndStackFoundations:SF.2`, `encoded_stage_dependency: true`, consumer
`WeilConjectures:WC.1` and status `requires_declaration_and_proof_verification`. So the import
boundary has a recorded owner but no stage node to link to.

### Unverifiable items

None.

### Questions for the orchestrator

1. **Trace-formula owner.** Should SF.2 (the recorded integration owner) carry Grothendieck's trace
   formula as a stage, so that WC.1 and WC.2 can link to it instead of to an external id?
2. **Functional equation.** WC.2's exact functional equation has no source read in this packet;
   EDC.8's description promises the reciprocal-pairing interface. Which source should be assigned?
3. **Normalization.** Weil I and the SGA 4½ Rapport use different zeta normalizations (t over F_q
   versus T = t^f). One should be fixed campaign-wide before these nodes are consumed.

---

# Summary of the review

| Packet | Review | Nodes (verified / corrected / unverifiable) | Links | Gaps |
| --- | --- | --- | --- | --- |
| PadicDifferentialEquationsAndRigidCohomology | accepted | 0 / 2 / 0 | 2 | 2 → 4 |
| PadicHodgeTheory | accepted | 0 / 10 / 0 | 21 → 24 | 6 → 9 |
| PerfectoidQuotients | accepted | 1 / 11 / 0 | 24 → 28 | 7 → 8 |
| PerfectoidSpaces | accepted | 26 / 7 / 0 | 47 → 50 | 8 → 9 |
| TropicalAndBerkovichArithmetic | accepted | 0 / 4 / 0 | 3 | 2 → 3 |
| WeightsInEtaleCohomology | accepted | 2 / 3 / 0 | 10 | 3 → 4 |
| WeilConjectures | accepted | 3 / 3 / 0 | 8 | 3 |
| **Total** | **7 accepted** | **32 / 40 / 0** | **115 → 125** | **31 → 40** |

Every packet keeps `status: partial` and `implementationStatus: unchecked` on every node.

## Validation

* All seven files parse with `python3 json.load`.
* Every `parentStageId` exists in `data/atlas.json` and is owned by the packet's roadmap; every node
  id is prefixed by its parent stage id.
* Every link endpoint is an atlas stage, a node of the same packet, or a node of a named packet
  (EXT-03 packets and the PrismaticCohomology draft); every coverage `stageId` exists and every
  roadmap stage has a coverage record.
* No stage-level cycle is created by any packet link, checked against `stageEdges` and `requires`.
* No private filesystem path, PDF or extracted text was written into the repository.
* Nothing outside the seven packets and this review file was modified; nothing was committed.

## Sources fetched (scratch only, never into the repository)

| Source | URL | SHA-256 | Result |
| --- | --- | --- | --- |
| Kedlaya, *A p-adic local monodromy theorem* | `https://arxiv.org/pdf/math/0110124v4` | `f38f45d4a956187ba26872363fcb880bf9e18c20f611bd07e25825022c9fc568` | matches the packet |
| Baker–Payne–Rabinoff, *Structure of nonarchimedean analytic curves* | `https://arxiv.org/pdf/1404.0279v1` | `5e40117270a0051d9661c9bbd0317968b810573796a5c2408582f20692568a11` | matches the packet |
| Baker–Payne–Rabinoff, *Tropicalization and metrics on curves* | `https://arxiv.org/pdf/1104.0320v3` | `19fbd64ec043835cbadad0375df562d78aa62b26b4820bd1e9f0f79d45c4348e` | matches the packet |

Berger, *Représentations p-adiques et équations différentielles* (arXiv:math/0102179v3, SHA-256
`142e7948…`) and BMS1 (arXiv:1602.03148v3, SHA-256 `285f7d20…`) were read from the library and added
as sources to the RD and PerfectoidQuotients packets.

## Decisions the orchestrator must make

1. **Stage-text corrections.** Three stage texts contradict the sources: P3/P5 (the henselian
   finite-étale approximation is consumed by P3's almost purity proof, not first by P5); RD.1/RD.2
   (the slope filtration theorem is RD.1 content but is filed under RD.2); P7 in PadicHodgeTheory
   (not a container stage).
2. **Atlas edges.** Nine packet edges have no atlas counterpart and are all acyclic; the most
   substantive are PerfectoidSpaces:P2 and P7 → PadicHodgeTheory:P8:local-rational,
   AdicSpacesPartII:R3 → PerfectoidSpaces:P2, DerivedDeRhamCohomology:DD.0 → PerfectoidSpaces:P1,
   and TropicalAndBerkovichArithmetic:TB.2 → TB.5.
3. **Supplier scope for A_inf/θ.** AInfCohomology:AI.0:integral covers only the field case, while
   PadicHodgeTheory R06.1's B_dR^+ node needs every perfectoid affinoid algebra. Either restrict the
   node or accept the new PerfectoidSpaces P1 suppliers.
4. **Unproved base change.** BS22 has no non-circular proof of the base-change compatibility of
   perfectoidization used inside Theorem 7.4. Decide whether Q2/Q4 carry a reconstruction task.
5. **Missing owners.** The almost-context cotangent complex (GR §2.5/§3.2), the trace formula
   (`UPSTREAM:CohomologicalPointCounting:TraceFormula`, owner SF.2 but no stage) and the functional
   equation have no stage to link to.
6. **Export forms.** RD.2 → R06.3 consumes the logarithmic form of the monodromy theorem (Kedlaya
   Theorem 6.13), not Theorem 1.1 as stated; and DWP.7/DWP.8 own the Weil II theorems recorded in
   the Weights packet.
7. **Catalogue.** Kedlaya math/0110124v4 and both Baker–Payne–Rabinoff papers are not in
   `CATALOGUE.json`; the hashes above are confirmed and ready for registration.
