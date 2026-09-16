# Independent review REVIEW-COHCMP — CohomologyComparisons packet

Reviewer: independent-review-REVIEW-COHCMP. Date: 2026-09-16. Scope: the draft packet
`research/expansion/drafts/CohomologyComparisons.json` (assignment R3; handoff notes in
`cohomology-comparisons-handoff.md`). Method (per `research/expansion/PROTOCOL.md`):

* each node's statement, hypotheses, proof steps, acceptance items, locators and excerpts
  were compared with the cited passage of the source, and every excerpt was located in the
  text extraction by a whitespace-insensitive search;
* each link was checked for direction, for the place where the consumer uses the supplier's
  output, and for existence of both endpoints (atlas stage or packet node); supplier stage
  descriptions were read before a cross-roadmap link was endorsed;
* every `parentStageId`, coverage `stageId` and gap endpoint was checked against
  `data/atlas.json`; the union of the packet's links with the atlas `stageEdges` was checked
  for cycles at stage level and at node level.

Line numbers refer to the library text extraction of BMS1; printed pages come from its page
headers. The packet carries a top-level `review` object with per-node verdicts. Packet
`status` stays `partial` and `implementationStatus` stays `unchecked`.

---

## 1. CohomologyComparisons.json (scope CP.0, CP.2, CP.3, CP.5)

**Verdict: accepted.** Nodes: 7 verified, 13 corrected, 0 unverifiable (20). Links: 49 in the
draft, all kept (27 had only their locators corrected, 17 had their reasons annotated or
rewritten, 5 were unchanged), plus 3 added by the review, giving 52. Coverage: 7 records
(CP.0–CP.6), all owned by CohomologyComparisons; four `remaining` lists rewritten. Gaps: 12, of
which 11 were rewritten or extended (3 of them retitled) and 1 is unchanged.

### Sources and provenance

| Source | Copy inspected | Provenance |
| --- | --- | --- |
| Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory* | library text extraction, stamped `arXiv:1602.03148v3 [math.AG] 15 Jan 2019` (line 13) | SHA-256 `04b1f8357a38045fed39ab060d3cb01142bcdbcc15fca985bc80216b99fba774`, identical to the packet's `sources` entry |
| same, PDF | library PDF, pages 4, 13, 16, 27, 115–117, 121–122 rendered in the scratch directory | SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`; used only to resolve symbols lost in the extraction |

No external source was fetched: the packet cites only BMS1, which is in the library. The
Kisin papers [48], [49] cited inside BMS1 are not in the library (recorded as a gap, not
fetched, because the packet makes no claim that rests on reading them).

Reading beyond the draft's `readSections`, recorded there under "Review:" entries: the
introduction on pp.3–4 (Remarks 1.2–1.3, footnote 2, the convention for 𝔖 → W(k), the
definition of B_crys); the statements of Theorems 2.1, 2.10 and Remark 2.11; Proposition 3.17,
Corollary 3.18, Definition 3.22 and the proof of Lemma 3.23; the proof of Theorem 4.4; the whole
proof of Lemma 4.6 with Lemmas 4.7–4.8; Examples 4.23–4.24, Lemma 4.26 with proof, Lemma 4.27;
§4.4 (Lemma 4.30 to the proof of Proposition 4.34); Remark 5.2 and the Theorem 5.1 proof
sketch; §13.3 (Definition 13.18, Theorem 13.19 with proof, proof of Theorem 13.1); Proposition
13.23 with proof; the proof of Theorem 14.1.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| CP.0/ainf-specialization-dictionary | corrected | Example 3.16 needs ζ_p primitive (1+ζ_p+…+ζ_p^{p−1}=0, lines 1519–1522); restored, with §3.3's ξ = μ/φ^{−1}(μ), ξ_r, ξ̃_r = φ^r(μ)/μ (1676–1680). Definition 3.22 (p.27, 1681–1693): B_crys := A_crys[1/μ], B_dR^+ = ξ-adic completion of B_crys^+ — settles the draft's unverified "μ invertible in B_crys". μ a unit in W(C♭) marked as presupposed by Lemma 4.26, never proved. Locators re-anchored (Lemma 4.9(iii) proof is 2203–2212, not 2210–2225). |
| CP.0/coherence-of-witt-vectors-of-perfectoid-integers | corrected | Proposition 3.24, Lemmas 3.25–3.28, Corollary 3.29 match (1763–1871). Lemma 3.28 is an "iff". The characteristic-0 step conflated coherence of W_r(O)/p with the induction, which proves coherence of W_r(O/p^N); separated, with the implicit Lemma 3.25(ii) step and the φ^{r−1}-twisted module structure. Uncited facts flagged: valuation rings are coherent; ∏O has Artin–Rees for p; W_r(O)[1/p] is coherent. Misleading acceptance "(x,p) finitely generated yet A_inf not coherent" replaced. |
| CP.2/rational-crystalline-comparison-over-C | corrected | Theorem 14.5(i) (7782–7796; proof 7833–7836) matches. The proof step used B_crys = A_crys[1/t]; the source defines A_crys[1/μ]. The B_dR^+ identification is Proposition 13.23. Frobenius compatibility is not asserted by 14.5(i); acceptance annotated. Theorem 14.3(iii),(iv) are at 7748–7752 on p.120. |
| CP.2/rational-crystalline-base-change-along-residue-section | corrected | Proposition 13.21 (7524–7553) matches. **Remark 13.22 reads k = F̄_p**, not F_p: the overline is lost in the extraction (checked on PDF p.116), and k is algebraically closed here. Theorem 14.6 uses a section of the residue field of K, i.e. an unstated variant; recorded. "A variant on a result of Berthelot–Ogus, [7]" (7531) added. Remark 13.22 lies wholly on p.116. |
| CP.2/crystalline-comparison-over-discretely-valued-base | corrected | Theorem 14.6(i) (7852–7863; proof 7898–7911) matches. Acceptance "D_crys(V_pE)" corrected to D_crys(H^1_ét(E_C,Q_p)), the dual of V_pE. Crystallinity step marked reconstructed; it uses B_crys^{G_K} = W(k)[1/p]. The source does not say which filtration the crystalline side carries; a packet-authored composite (Propositions 13.21, 13.23, Remark 13.20) is recorded. |
| CP.3/good-reduction-bdr-lattice-identification | corrected | The good-reduction identification RΓ_crys(Y/A_crys) ⊗_{A_crys} B_dR^+ ≅ RΓ_crys(X/B_dR^+) that the draft called unread is **Proposition 13.23** (p.117, 7568–7580); the draft's reading stopped at 7560. Theorem 13.19 and Remark 13.20 are in §13.3 (p.114), not §13.4. Added: finite freeness (Theorem 13.19), and the diagram in the proof of Theorem 13.1 (p.115, checked on the PDF) that gives the agreement with Theorem 5.1. The explicit-complex check between Theorems 12.1 and 13.1 remains unread. |
| CP.5/perfectness-and-tor-bounds-for-ainf-modules | corrected | Lemma 4.9 (2165–2227) matches. The acceptance test M = A_inf/x violates the hypothesis (M[1/p] = A_inf[1/p]/x is not free) and so cannot show that x-torsion-freeness is needed; replaced. |
| CP.5/ainf-module-structure-theorem | verified | Proposition 4.13 (2254–2281), Lemma 4.10, Remark 4.11 and Corollary 4.12 match; examples checked. The Lemma 4.6 step now summarizes the essential-surjectivity half (2082–2160), read by the reviewer. |
| CP.5/specialization-length-inequality | corrected | Lemma 4.14 (2282–2305): the dévissage writes M as an extension of M/p^{n−1}M by p^{n−1}M, not of M/pM by pM; the implicit coherence use is flagged. |
| CP.5/witt-versus-tilt-specialization-inequality | verified | Corollary 4.15 (2308–2313); the reconstructed torsion form and the example are checked. |
| CP.5/derived-to-degreewise-witt-specialization | verified | Lemma 4.16 (2316–2360) matches, including the H^{i+1} x-torsion condition. The displayed Koszul sequence and the φ acceptance item are marked packet-authored. |
| CP.5/finite-presentation-and-freeness-criterion | verified | Corollary 4.17, the following remark and proof (2361–2381) match, with the exact two-degree hypothesis. |
| CP.5/mu-inverted-freeness-criterion | corrected | Lemma 4.19 and Corollary 4.20 (2406–2470) match. The acceptance claim that Theorem 14.3(iv) supplies freeness over A_inf[1/pμ] omitted finite generation of H^j_ét(X,Z_p), from Scholze [58]. Uncited Proposition 3.17(ii) and asserted steps flagged. |
| CP.5/crystalline-de-rham-torsionfreeness-equivalence | corrected | Lemma 4.18 (2385–2404) and Remarks 14.4, 14.7 match. Remark 4.21 covers only "the hypothesis on H^i(C ⊗^L W(k))" (the draft said "hypotheses"). Lemma 4.18 does not name θ. Footnote 2 of the introduction added. |
| CP.5/length-monotonicity-under-torsion-cokernel | verified | Observation in the proof of Theorem 14.5(ii) (7837–7847). |
| CP.5/integral-torsion-length-inequality-over-C | verified | Theorem 14.5(ii) (7797–7804) and its three cited inputs (7837). §2 acceptance updated with the Theorem 2.1 and 2.10 statements. |
| CP.5/lattice-recovery-over-C | corrected | Theorem 14.5(iii) (7809–7831; proof 7848–7849) matches. Added: under Tier 1, H^i_ét is torsion-free by (ii), so Theorem 4.28 applies (BKF(−) uses the torsion-free quotient, p.45). The unstated φ-equivariance of Theorem 14.3(iv) is flagged. "The inclusion may be strict" is not in the source; removed. |
| CP.5/dvr-lattice-recovery-via-breuil-kisin | corrected | Theorem 14.6(iii) (7872–7897, 7912–7913) matches, but the normalizations were missing. 𝔖 → W(k) is T ↦ 0 with Frobenius on W(k) (p.4, line 225, checked on the PDF). 𝔖 → A_inf is T ↦ [π♭]^p with Frobenius on W(k) (§4.4, line 2668). Kisin imports now named: [48, §1.2, Lemma 1.2.6], [44, Prop. 4.1.1] or [35, Prop. 2.32], and implicit full faithfulness of restriction to G_{K_∞}. Remark 5.2 added. |
| CP.5/dvr-torsion-length-inequality | verified | Theorem 14.6(ii) and its one-line proof (7864–7870, 7912). |
| CP.5/mod-p-de-rham-dimension-bound | corrected | Inequality (1) (172–175) matches; the reconstruction from (ii) in degrees i, i+1 is consistent with Remark 2.11. The acceptance item misdescribed Remark 1.2 (Enriques surfaces in characteristic 2); replaced, with Remark 2.11's strict example. Hypotheses gained finite generation of H^j_ét and CR.2's de Rham comparison. |

### Links (49 → 52)

All draft links point prerequisite → consumer and both endpoints exist. Usage sites were
re-located and every locator now gives lemma and extraction lines. Draft line numbers were
often 5–15 lines off (for example Theorem 14.6's proof is at 7898–7913, not 7894–7911).
Annotated links:

* coherence → Lemma 4.14: the use is implicit, and the dévissage uses p^{n−1}M;
* dictionary → Theorem 14.5(ii): the usage is reconstructed, and it depends on the μ-unit gap;
* Corollary 4.17 → Theorem 14.5(ii): the source's proof does not cite Corollary 4.17, and the
  finite presentation it would supply already comes from AI.5 (BKF modules, Definition 4.22),
  so this link duplicates AI.5 → node;
* Lemma 4.16 → Theorem 14.5(iii): reached through Corollaries 4.20/4.17, not cited directly;
* Proposition 13.21 → Theorem 14.5(iii): reflects the citation of Corollary 4.20; redundant if
  the BKF property is imported from AI.5;
* CR.3 → inequality (1): CR.3 supplies only the reduction to k; the de Rham identification is
  CR.2's;
* the new-edge annotations below.

Supplier scope checks (atlas descriptions read):

* **AI.5** covers Theorem 14.3 and "the linear algebra controlling integral torsion".
* **AI.2** covers Definition 4.22, Lemmas 4.26–4.27 and Fargues' Theorem 4.28.
* **CR.3** covers crystalline base change for proper smooth schemes and crystalline families,
  but not the Frobenius isogeny for smooth *affine* k-schemes used in Proposition 13.21 (gap).
* **R06.2** covers D_crys/D_dR and admissibility.
* **R07.4** does not cover Kisin's crystalline-lattice theorem (gap kept).

Added links:

* `AInfCohomology:AI.0` → CP.0 dictionary (θ, ε, μ, ξ, ξ̃, the residue map to W(k)).
* `AInfCohomology:AI.0:period-comparison` → CP.0 dictionary (A_crys → B_crys^+ → B_dR^+).
* CP.0 dictionary → CP.2 rational comparison (B_crys = A_crys[1/μ]).

All three follow existing atlas stage edges.

### Structure

All `parentStageId`s (CP.0, CP.2, CP.3, CP.5) exist and are owned by CohomologyComparisons. All
seven coverage stage ids exist; the CP.0, CP.2, CP.3 and CP.5 `remaining` lists were rewritten
to name specific unread arguments. The graph formed by the packet's links and the atlas
`stageEdges` has no cycle. Integrating the packet adds **six direct stage edges** not in the
atlas; each duplicates a path that already exists through other stages:

* CP.0 → CP.5
* AInfCohomology:AI.2 → CP.5
* CP.3 → CP.5
* CP.3 → CP.2
* CrystallineCohomology:CR.3 → CP.5
* PadicHodgeTheory:R06.2 → CP.5

The packet contains no private paths.

### Gaps: imports newly named with locators

* Proposition 13.21 is "a variant on a result of Berthelot–Ogus, [7]" (p.116), and its proof
  reduces from qcqs to affine without comment.
* Kisin imports: [49, Theorem 1.2.1]; [48, Proposition 2.1.12]; [48, §1.2, Lemma 1.2.6] (proof
  of Proposition 4.34, p.44); [44, Proposition 4.1.1] or [35, Proposition 2.32]; the implicit
  full faithfulness of restriction from crystalline G_K-representations to G_{K_∞} (proof of
  Theorem 4.4, pp.33–34).
* Theorem 4.28's proof is not in BMS1 ("we refer to [61]"). Lemma 4.27 rests on
  Fargues–Fontaine [31, Corollaire 11.1.14].
* Uncited commutative algebra:
  * Proposition 3.24 (p.30): valuation rings are coherent; Artin–Rees for ∏O;
    [1, Tag 05CU].
  * Lemma 4.9 (p.36): finitely presented O♭-modules are perfect.
  * Corollary 4.17 (p.39): the top cohomology of a perfect complex is finitely presented.
  * Lemma 4.19 (p.40): R → R̂ is injective.
  * Lemma 4.10 (p.36): the reduction to A_inf,(p).
* For inequality (1): étale universal coefficients, and finite generation of H^j_ét (Theorem
  5.1 / [58]).
* Theorem 14.3(iv) needs a φ-equivariance that is not stated, and Corollary 4.20 needs the
  finiteness of H^j_ét(X, Z_p) over C, also not stated.

Resolved or narrowed:

* μ ∈ B_crys^× holds by definition (Definition 3.22). Only μ ∈ W(C♭)^× remains open.
* The §2 examples: statements read, constructions unread.
* Lemma 4.6's essential surjectivity has been read.
* The CP.3 identification is Proposition 13.23.

### Unverifiable items

None at node level. These inputs could not be verified from the source; they remain gaps, not
assertions:

* the Theorem 12.1/13.1 explicit-complex compatibility;
* the G_K/Frobenius compatibility in Theorem 14.6(i);
* the constructions in §§2.1–2.2;
* Kisin's theorems;
* the essential surjectivity in Theorem 4.28;
* μ ∈ W(C♭)^×.

### Supplier questions and decisions for the orchestrator

1. **Re-homing supplier material.** Seven CP.5 nodes are tagged as AI.5/AI.2 material
   (Lemmas 4.9, 4.14, 4.16, 4.19 with Corollary 4.20, Proposition 4.13, Corollaries 4.15, 4.17).
   The Lemma 4.18 node is untagged because it also carries Remarks 14.4/14.7. The CP.0 coherence
   node and the §4.2 part of the dictionary node are also generic A_inf algebra.
   Decide whether to promote them under CP.5 now or to move them into an AInfCohomology AI.2/AI.5
   packet first; node ids must change on a move.
2. **Proposition 13.21 ownership.** It is used by AI.5's Theorem 14.3 and by CP.2, and AI.5 →
   CP.2 is an atlas edge. Keeping it under CP.2 blocks any node-level AI.5 dependency. Candidate
   owners are CR.3 or AI.4. CR.3 would also need its Frobenius-isogeny scope extended to smooth
   affine k-schemes.
3. **Kisin supplier.** Theorem 4.4 and Proposition 4.34 have no atlas owner; R07.4 covers only
   finite-flat and p-divisible groups. Extend R07.4 or create an owner. Kisin [48] and [49] are
   not in the library.
4. **Scholze's Theorem 5.1.** No atlas stage upstream of CP.2/CP.3 owns the global finiteness
   and comparison theorem of [58]. BMS1 proves the agreement of Theorem 13.1 with Theorem 5.1
   using Theorem 5.1's own construction (p.115). Decide whether CP.3 absorbs [58, §8] or a new
   upstream owner is created.
5. **Six new stage edges** on integration (listed above), all acyclic. Accept them, or route the
   node links through the existing transitive paths.
6. **Atlas text qualifications** (outside this review's editing scope), recorded in the packet:
   * CP.2's "claimed independence" of the residue-field section holds only for the canonical
     DVR section; for arbitrary k the source proves uniqueness only when k = F̄_p.
   * CP.5 should state n ≥ 0 over O_C, rank equality, the two-tier (degree i / degree i+1)
     lattice statement and Remark 14.7's de Rham substitute.
   * AI.0 (or R06.1) should state that μ is a unit in W(C♭).
