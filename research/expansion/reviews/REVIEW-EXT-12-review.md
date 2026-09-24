# Independent review REVIEW-EXT-12: the EXT-12 packets

Reviewer: independent-review-REVIEW-EXT-12 (Claude Code, session cc-39fac3). Date: 2026-09-24.

## Scope

The review covers the eight JSON packets in `research/expansion/external/EXT-12/`, the directory as it stood when the review started. They were reviewed in parallel, one reviewer per packet (one reviewer took the two small packets), and assembled here.

- HANDOFF.md lists a ninth roadmap, OrdinaryAutomorphicFormsAndModularityLifting, as "worker drafting". The directory has no packet for it, so it was not reviewed.
- None of the eight packets carried a `review` object.

## Method

The method follows `research/expansion/PROTOCOL.md` and the job's instructions.

- **Nodes.** Each node's statement, hypotheses, proof steps, acceptance items, locators and excerpts were compared with the cited passage of a public copy of the source. Wherever a text layer drops bars, primes, exponents or signs, the formula was read on a rendered page image.
- **Links.** Each link was checked for:
  - its direction;
  - the place where the consumer uses the supplier's output;
  - the existence of both endpoints, as an atlas stage or a packet node.

  Cross-roadmap suppliers were checked against their `data/atlas.json` descriptions.
- **Stages and cycles.** Every `parentStageId` and coverage `stageId` was checked against the atlas. The union of the atlas `stageEdges` with the stage edges implied by each packet's links was checked for cycles.
- **Sources.** The maintainer's reference library was not available. Every source was therefore fetched from a public copy into the reviewer's scratch space, never into the repository. Its URL, SHA-256 and date are listed under each packet. Most public copies are byte-identical to the drafter's library copies.

## How to apply this review

The swarm job's only deliverable is this report. The packets are not deliverables of REVIEW-EXT-12. The exact corrected field values, the link verdicts, the added links and gaps, the coverage notes, the provenance of fetched sources, and each packet's top-level `review` object (status, reviewer, date, notes, per-node `checked` list) are therefore applied to the eight packets in a companion pull request, left to the orchestrator. In each packet, `status` stays `partial` and every node's `implementationStatus` stays `unchecked`.

Appendix A lists the per-node verdicts. Appendix B collects the mistakes found in the sources themselves.

## Summary

Node counts are verified / corrected / unverifiable. No node was unverifiable.

| Packet | Verdict | Nodes | Links | Gaps |
| --- | --- | --- | --- | --- |
| ModularCurvesPartII | accepted (one stage-placement decision open) | 53: 19 / 34 / 0 | 99 → 164 | 21 → 24 |
| ModularityAndLanglandsExtensions | accepted | 27: 6 / 21 / 0 | 46 → 48 | 16 → 26 |
| OverconvergentAutomorphicForms | needs changes | 29: 12 / 17 / 0 | 94 → 96 | 12 → 19 |
| PELModuli | accepted | 39: 13 / 26 / 0 | 100 → 115 | 12 → 18 |
| PadicLocalLanglandsForGL2Qp | accepted | 8: 2 / 6 / 0 | 8 → 9 | 3 → 8 |
| PerfectoidShimuraVarieties | accepted (one node must move from S4 to S2) | 41: 23 / 18 / 0 | 61 → 118 | 9 → 19 |
| PotentialAutomorphyInfrastructure | accepted | 15: 14 / 1 / 0 | 37 → 38 | 9 → 12 |
| PotentialModularityAndCompatibleSystems | needs changes | 34: 6 / 28 / 0 | 63 → 69 | 20 → 40 |
| **Total** | 6 accepted, 2 needs changes | **246: 95 / 151 / 0** | **508 → 657** | **102 → 166** |

### Decisions for the orchestrator

1. **ModularCurvesPartII.** Three results that R13.2's proofs use sit in R13.1, R13.3 and R13.4a, so the stage placement must be decided (section 1).
2. **PerfectoidShimuraVarieties.** The good-towers node (HJ Definition 5.12, Proposition 5.13) must move from S4 to S2. Otherwise S2 → S4 → S2 is a stage cycle. The companion PR makes the move.
3. **OverconvergentAutomorphicForms.**
   - T5's credited results use O2's canonical section, which closes O2 → T5 → S5 → O2.
   - A sibling S3 draft node duplicates that material.
   - The packet's Prop 6.3 radius and Hilbert level m = k + r contradict the cited AIP results; they are corrected.
4. **PotentialModularityAndCompatibleSystems.**
   - Four links are removed, one of them reversed, and one is re-targeted.
   - Five coverage records call material "not yet transcribed" that the nodes already contain.
   - The gaps double from 20 to 40.

### Most consequential mathematical findings (details in each section)

- **Conrad, arithmetic moduli of generalized elliptic curves:**
  - Theorem 3.2.7's "Deligne–Mumford iff n squarefree" fails in the "only if" direction (N = n = p²).
  - Definition 4.3.3 misses the non-schematic cusps (4pˢ, 2), p odd, where his Theorems 4.3.4 and 4.3.7 contradict each other.
  - The nodal-cubic 1-gon model on p. 5 is wrong over Z.
- **Lan, PEL compactifications:** Definition 1.2.3.6(2) asks for a type-D unit that cannot exist; the proof omits the condition. The packet copied a sign fixed by the book's erratum 14.
- **ACC+:**
  - Assumption 7.2.6 omits p > (m_i+1)² and crystallinity above l_2. Both exclude only density-zero sets.
  - The proof of Theorem 7.1.11 applies a totally-real corollary (7.2.4) over a CM field.
  - Lemma 7.1.8's coefficients are Z_l, not Z̄_l.
- **Newton–Thorne (Hilbert), Theorem 6.5(2):** it proves symmetric powers over CM fields for RAECSDC π. The packet's blanket rejection of CM-field symmetric-power functoriality is qualified.
- **BHW (Ann. Inst. Fourier 2023):** the Prop 6.3 radius contradicts the cited AIP Prop 2.8 and fails for an explicit weight. The Hilbert level should be k + r − 1.
- **Hansen–Johansson v2:** Proposition 5.14 still claims a Hodge–Tate map, which it cites from [CGH+18]. Definition 5.17 mixes G^ad and G.
- **Taylor's erratum and Lemma 1.5; KW Annals Theorem 2.1; Moret-Bailly's Remarque 1.5:** transcription and statement slips, corrected in the nodes.

---

## 1. ModularCurvesPartII.json (R12.1–R14.6)

**Verdict: accepted, subject to applying the corrections in the packet's `review` object (applied in the companion pull request).**

A coordinator decision on stage placement is still open (see "Structural issue" below). Every node and every link has a verdict against the source text. The source contradictions found are resolved in the corrected nodes and listed as source issues.

| Item | Count |
| --- | --- |
| Nodes | 53: 19 verified, 34 corrected (75 field corrections), 0 unverifiable |
| Links | 99 → 164: 84 kept, 14 annotated, 1 removed, 0 re-targeted, 66 added |
| Gaps | 21 → 24: 3 resolved, 10 corrected, 8 confirmed, 6 added |
| Coverage | 20 records, one for every atlas stage of the roadmap; every `parentStageId` belongs to the roadmap; `remaining` lists updated for R13.1, R13.2, R13.3, R13.4a, R13.4b and R14.1 |

Corrected nodes by stage:

| Stage | Nodes | Corrected |
| --- | --- | --- |
| R13.1 | 14 | 8 |
| R13.2 | 19 | 12 |
| R13.3 | 8 | 5 |
| R13.4a | 4 | 3 |
| R13.4b | 2 | 1 |
| R14.1 | 6 | 5 |

There is no stage cycle in the union of the atlas stageEdges with the packet's links, before or after the reviewer's changes. The drafted packet had one node-level cycle, through link L3, which has been removed.

### Sources and provenance

All three cited sources have public copies, and each is byte-identical (same SHA-256) to the drafter's library copy:

| Source | Public copy read | SHA-256 |
| --- | --- | --- |
| Conrad, *Arithmetic moduli of generalized elliptic curves* | math.stanford.edu/~conrad/papers/kmpaper.pdf: author preprint, 49 pp.; p. 49 carries only the address; printed page = PDF page | `f53e4ff8…` |
| Česnavičius, *A modular description of X₀(n)* | arxiv.org/pdf/1511.07475v2 (5 Oct 2017), 67 pp. | `94d0532f…` |
| Deligne–Rapoport, LNM 349 | math.uni-bonn.de/people/rapoport/myalggeom/preprints/Lesschemas.pdf: 174-page scan with OCR; printed page = PDF page + 142 | `201e7583…` |

All three were fetched on 2026-09-23.

Publication data, checked with Crossref and the arXiv API:

* Conrad: J. Inst. Math. Jussieu 6 (2007), no. 2, 209–278, DOI 10.1017/S1474748006000089.
* Česnavičius: Algebra & Number Theory 11 (2017), no. 9, 2001–2089, DOI 10.2140/ant.2017.11.2001. The packet had left the journal pagination unchecked.
* Deligne–Rapoport: LNM 349, 143–316, DOI 10.1007/978-3-540-37855-6_4.

The packet's `url` fields for Conrad and DR point to paywalled DOIs. They should point to the public copies above.

**Also fetched and read by the reviewers:**

* Deligne–Mumford 1969, Publ. IHES 36 (Numdam), `79316edb…`: Thm 1.2 with proof.
* Česnavičius, *Coarse base change fails for some modular curves*, arXiv:1608.01249v2, `c2f4a031…`: Thm 3.2. Its journal version is Algebraic Geometry 4 (2017), 444–451.

**Deligne–Rapoport passages read beyond the drafter's ranges** (formulas checked on page images):

* I 1.0, 3.5–3.7 and 5.2–5.3;
* III 0.1–1.2 and 2.1–2.6;
* IV 1.3–1.6 and 2.1–2.2;
* V 1.1–1.4 and 4.9–4.13;
* VII 1.1–1.16, VII 2.1 and VII 4.1–4.8.

The Česnavičius text layer renders parentheses as p/q, so the statements used were read on page images.

Three drafted Conrad excerpts match the text layer only after rejoining a split accent ("N´eron", "´etale"): N0, N3 and N46. They are accepted. Three other drafted excerpts did not occur at all and were replaced by literal passages: N14, N35 and N39. N44's first excerpt occurs only on p. 3, so its locator was corrected and an excerpt from Thm 6.7 was added.

### Main corrections

1. **Conrad Thm 3.2.7 is false in the "only if" direction.**
   * The theorem states that M_Γ₁(N;n) is Deligne–Mumford *if and only if* n is squarefree (p. 26, page image). This settles the drafter's open gap.
   * Conrad's own proof of Lemma 3.1.8 gives étale automorphism schemes whenever ⟨P⟩ is ample. Česnavičius Prop. 4.6.5(b) (p. 47), with p. 44, gives Deligne–Mumford whenever every prime p with p² | n divides N.
   * Counterexample: N = n = p² on the standard p²-gon.
   * Remark 4.1.5 (p. 32) repeats the error. Two nodes are corrected: deligne-mumford-loci and contraction-to-M1.

2. **Conrad Def. 4.3.3 omits the non-schematic cusps (N,d) = (4pˢ, 2) with p odd.** This is a reviewer finding, confirmed independently by a second reader.
   * Take P = (i,1) on the standard 2-gon in characteristic p. The divisor Σⱼ[jP] is the subgroup scheme μ₂ₚˢ × {0} ∪ i·μ₂ₚˢ × {1}, which is ample. P is fixed by inversion followed by −1 ∈ μ₂.
   * So M^∞_{Γ₁(4pˢ),2} is not a scheme in characteristic p. For example, N = 12 in characteristic 3.
   * Conrad's p. 38 claims the 2-gon cusps are non-schematic only for N = 2pˢ.
   * His own rule in the proof of Thm 4.3.7 (δ = p when N/d = 2pˢ, p. 42) contradicts Def. 4.3.3 exactly here.
   * For N = 12, Thm 4.3.4 (M^∞ = Spec Z) and Thm 4.3.7 (Spec Z[ζ₆] → M^∞ finite étale) are incompatible, since Z[ζ₃] ramifies at 3.
   * The unit claim behind (4.3.11) fails: 1 + ζ₆⁻¹ = 1 − ζ₃.
   * Caveats were added to the cusp-substack, d ≤ 2 chart and schematic-locus nodes, and a gap was added.

3. **Conrad cites "[DR, III, 2.5(iii)]" for smoothness away from the level, but DR III Thm 2.5 has only (i)–(ii)** (printed p. 203, page image). The properness node is corrected and a gap added. The same node now records that DR IV 1.5–1.6 assume a complete DVR with *algebraically closed* residue field.

4. **Conrad's nodal-cubic model of the 1-gon (p. 5) is wrong; the drafter's diagnosis is confirmed.**
   * The map t ↦ (t²+1, t(t²+1)) glues ±i, the node is non-split over Q, and in characteristic 2 the curve is cuspidal.
   * The proposed model y²z + xyz = x³ is correct: it has a split node in every characteristic and an explicit parametrization gluing 0 and ∞.

5. **Link L3 (automorphisms of the n-gon → degeneracy locus) is removed.** DR's proof of II 1.15 (pp. 181–182) does not use 1.8–1.10. Conrad Cor. 3.1.3 is proved *from* DR II 1.15, so L3 closed a node-level cycle. It is replaced by two links:
   * standard polygons → degeneracy locus;
   * degeneracy locus → automorphisms.

6. **Refined Γ₀(n) (Česnavičius 5.2, p. 50):** with d(m) = m/gcd(m, n/m), the n = 12 example has d(2) = 1, not 2.

7. **Česnavičius Prop. 4.3.6 (p. 39) prints s ∈ Z≥1, so n = 1 is not excluded.** X(1) = Ell₁ is not a scheme. n = 2 = 2¹ is excluded correctly, which corrects a fork's "n = 1, 2". The full-level and schematic-locus nodes are corrected.

8. **Hecke correspondence at the cusps (Conrad Thm 4.4.3, pp. 44–45).**
   * The node claimed that "cusp widths multiply by p along π₂". This is wrong.
   * E/C extends to Tate_dp(ζq^{1/d}), and π₂ is then obtained after contracting away from ⟨P mod C⟩.
   * On the chart, P mod C lies on the components in pZ/dpZ, so the image is again a d-gon cusp and π₂ is ramified of index p there (reviewer computation).

9. **Γ₀ Hecke caveat.** Česnavičius Thm 4.6.6(c) (p. 48) gives X₀(N;p) = X_Γ₀(N;p) *if* |ord_q(p) − ord_q(N)| ≤ 1. The node said "only when". The claim that M_Γ₀(q²;p) ≠ X_Γ₀(q²;p) is unsupported by the sources read.

10. **Schematic locus (Conrad Thm 4.2.1(2), Remark 4.2.2).** One divisor d ≥ 5 of N gives a fine moduli scheme only over S[1/d]. For example, M_Γ₁(5) is not a scheme in characteristic 5. The drafted "hence for such level … coincide" overstated Remark 4.2.2.

11. **R13.3 cusp computations** (Conrad pp. 33–35, 37–42):
    * The 2-adic invariant ring is Z₍₂₎[ζ(q^{1/2^r})²], with exponent 2, not 2^r (page image of p. 35).
    * In the regularity reduction the finite étale map points the other way (p. 33).
    * "Z[ζ_N] ⊗ F_p is non-reduced when p | N" is false when 2 ∥ N.
    * The d = 1 and d = 2 residue fields were conflated.
    * The N = 5 chart holds only over Z[1/5], since δ₅,₁ = 5.

12. **R13.1 details.**
    * DR IV 1.3 contracts components whose *order* in π₀ does not divide n.
    * Česnavičius Remark 2.1.9 excludes S^{∞,n} for n ≠ n′, not for n ∤ n′ (page image of p. 7).
    * DR VII 1 was read on page images, where the drafter had relied on Conrad's restatement. The formal 1-gon is the quotient of Tate_n(q).
    * DR VII 2.1 identifies Z[[q]] with the completion of M₁ along f₁; the "étale double cover" wording is Česnavičius's.
    * DR III 1.2 requires C₀ smooth or n prime to p. It therefore covers Conrad's 1-gon use but not the end of Conrad's proof of Thm 2.4.5, which confirms Česnavičius's objection.
    * Several locators were corrected: DR II §3 is pp. 192–195, 1.18 is pp. 183–184, Cor. 2.8 is p. 192, and Česnavičius Lemma 2.1.10 is p. 8.

13. **R13.4a–b.**
    * Prop. 6.4(b) for H = Γ₀(p), p ≥ 5, gives coarse base change over every scheme, not only over Z[1/6].
    * Nothing in the source says regularity of the coarse X₀(n) "can fail" at the points removed in Thm 6.7.
    * In Prop. 3.3.2, finiteness of Y → P¹_Z is Lemma 3.2.3; [Ryd13, 6.12] gives only Z-properness.
    * DR VII 4 (printed pp. 310–313) was read. It compares full level only, via analytic uniformization, the growth condition at the cusps and GAGA, reducing general n to level 3n. The scan prints "poids 3n" for level 3n. It leaves the 2πi normalization open. Conrad's Γ₁ and Γ₀ versions of (4.4.2) are "by the same methods".

14. **R14.1.**
    * The proof of Conrad Thm 4.5.1 treats only multiplicative and étale C₀. The supersingular points must be discarded by the same codimension-2 normality argument, which the source leaves implicit.
    * Example 4.5.3 (page image of p. 48) is over F̄_p. Its sums start at n ≥ 1 for arbitrary Katz forms, so the constant terms are omitted. This confirms the drafter's gap and is a source misprint.
    * The acceptance item on Lemma 4.4.5 asserted failures that the source does not give.

15. **Ill-posed acceptance items were replaced by checked tests:**
    * "n-gon and n′-gon curves need not be isomorphic" is vacuous.
    * "Z_p((q))-points" is not a DVR.
    * "Level-free construction not used": Conrad uses Γ(1).
    * The unsupported N ≥ 3 restriction.
    * Non-representability of c attributed to characteristic p; Česnavičius 1.2 shows it already over C.

### Structural issue for the coordinator

Three results used in R13.2 proofs sit in later stages of this packet:

1. **Tate curves and Tate₁ as universal deformation.** The drafter already moved them to R13.1.
2. **Conrad's chart (4.2.1) / Lemma 4.2.4.** This is an R13.3 node, and the ampleness in Thm 4.2.1(2) needs it.
3. **Česnavičius Prop. 3.3.2 (coarse space of Ell_n = P¹_Z).** This is an R13.4a node. It is used by Prop. 4.3.2(b) and hence by the boundary claims for X(n), X₁(n), X₁(n;n′), X₀(n), and by Lemma 4.1.3.

Linking (2) or (3) would close the stage cycle R13.2 → R13.3 → R13.4a → R13.2. They are recorded as gaps. Their proofs use only R13.1/R13.2 material together with DR VI 1.1 and KM 10.8.2, so moving them to R13.2 would resolve the issue.

### Links

**Kept (84).** For each, the cited location was read and uses the supplier's output.

**Annotated (14), highlights:**

* **R09.5 → coarse space of Ell_n.** Česnavičius needs rigidification by a central subgroup of inertia and tame-stack coarse base change [AOV08, 3.3]. R09.5 names only rigidification by auxiliary level.
* **R12.6 → weight-k comparison.** DR VII 4.6's four ingredients map onto R12.2, R12.3, R12.5 and GAGA; all weights k ≥ 0 and Γ₁/Γ₀ must be covered.
* **R07.1 schematic-closure node → properness.** The scope is adequate, but the endpoint lies in an unreviewed EXT-07 draft.
* **R09.4 → Artin algebraicity.** Only the [LMB] formalism and the geometric-point criteria are consumed; the atlas itself is Conrad's.
* **Contraction-to-M₁ → schematic locus.** The proof also needs Lemma 4.2.4 (structural issue above).
* **Quotients → degeneracy ideals.** Prop. 2.2.11 is not proved from 2.2.10.
* **Naive Γ₀ → Γ₀ Hecke.** This link supplies a scope caveat, not an input.

**Removed (1):** L3; see correction 5.

**Added (66).** Each added link is a use found in a proof that was read. Examples:

* DR II 2.8 (negation) → Prop. 3.3.2;
* Prop. 4.2.11(b) → Česnavičius 4.7;
* the Hodge-line node → Thm 4.5.1 (ω insensitive to contraction);
* Thm 3.3.1 (CM) → Lemma 4.5.2;
* NeronModelsAndSemistableAbelianVarieties:R11.1 → Isom-schemes (the Néron-model step of Conrad Thm 3.2.4). This new cross-roadmap edge is acyclic.

### Gaps

**Resolved (3):**

* DR III 1.2 and VII 2.1: now read.
* Conrad 3.2.7 versus Česnavičius 4.6.5: settled; see correction 1.
* *Coarse base change fails*: public copy found. The drafter's arXiv placeholder "1602.xxxx" was wrong; the paper is arXiv:1608.01249. Thm 3.2 was read and matches Remark 6.6.

**Corrected (10), with the next action narrowed:**

* **DR I:** 3.7 is stated without proof; Théorème 5.3 rests on Deligne–Mumford 1969 §1 and Elkik.
* **Conrad Lemma 2.4.7:** DM Thm 1.2 was read; it is a genus ≥ 2 statement about ω^{⊗n}, so the genus-one adaptation is still unwritten.
* **DR V:** V 1.1–1.4 and the statement of V 4.13 were read.
* **Olsson [O]:** identified as M. Olsson, *On proper coverings of Artin stacks*, Adv. Math. 198 (2005).
* **DR VII 4:** read.
* **Popescu gap:** locators refined; [Gre] and [V] are used in Thm 2.2.8 and Lemma 4.1.6, not in Lemma 4.4.5.
* **Conrad Thm 2.4.5:** DR III 1.2's hypothesis confirmed.
* **Remark 4.4.2:** Conrad defines no q-expansion convention at d-gon cusps.
* **Thm 4.3.7:** affected by the Def. 4.3.3 issue.
* **Cross-stage ordering:** two further hidden dependencies recorded.

**Added (6):**

* DR II 2.1–2.7 not decomposed;
* Conrad's stack criteria 2.2.5–2.2.8 have no owner;
* minimal regular models, Néron–Kodaira reduction and [DM, 1.12];
* "[DR, III, 2.5(iii)]" has no referent;
* cross-stage placement of Prop. 3.3.2;
* Conrad Def. 4.3.3 at (4pˢ, 2).

A proposed separate gap on DR VII 2.1 in Česnavičius Prop. 2.2.11 was merged into the resolved DR III/VII gap.

### Unverifiable items

No node is unverifiable. Some imported results have no public copy that the reviewers obtained. They stay recorded as gaps with exact locators, not as node verdicts:

* Katz–Mazur (Annals of Math. Studies 108), throughout R13.2–R13.3;
* [Edi90], Olsson [O], Swan [S], [AOV08], [KM97] and [Ols06];
* Elkik (DR gives no reference).

### Source issues (errata candidates)

1. Conrad preprint p. 5: the nodal cubic.
2. Conrad Thm 3.2.7 and Remark 4.1.5: the "only if".
3. Conrad Thm 3.2.7: the citation "[DR, III, 2.5(iii)]".
4. Conrad p. 38, Def. 4.3.3 and (4.3.11): the case (4pˢ, 2).
5. Conrad Example 4.5.3: the missing constant terms.
6. Česnavičius Prop. 4.3.6: the case n = 1.
7. DR VII 4.6: "poids 3n" for level 3n.

The Conrad items concern the 2006 preprint; the journal version was not checked.

### Supplier questions for the orchestrator

1. **Stage placement.** Move Conrad's chart (4.2.1)/Lemma 4.2.4 and Česnavičius Prop. 3.3.2 into R13.2, or weaken the R13.2 statements that use them.
2. **NeronModels R11.4.** Does it supply Pic⁰ of a stable genus-one curve over an arbitrary base as a semi-abelian algebraic space, with the coincidence locus of DR II 1.14? If so, add R11.4 → R13.1.
3. **NeronModels R11.1/R11.3.** Can they supply minimal regular proper models and Néron–Kodaira stable reduction (DR IV 1.6(i))?
4. **Quotients.** Who owns quotients by finite locally free groups acting with orbits in affine opens (SGA 3 V 4.1) and diagonalizable invariants (SGA 3 I 4.7.3)? Neither R07.1 nor R09.3 names them.
5. **AlgebraicModuli R09.4.** Can it supply Conrad Thm 2.2.5/Cor. 2.2.7 and [LMB 8.1]? Who owns the tri-canonical atlas?
6. **AlgebraicModuli R09.5.** Does it cover central rigidification and tame coarse base change?
7. **AlgebraicModuli R09.6** (or an external-theorem record): Popescu desingularization, G-ring permanence, and the étale-local structure uv = t of nodes.
8. **AdicSpacesPartII F0.** Does it include EGA III₁ 5.4.5?
9. **R12.6.** Does it cover all weights k ≥ 0, Γ₁(N) and Γ₀(N), and fix the 2πi normalization?
10. **Duplicated claims.** Lemma 4.2.4 appears in two nodes (R13.2 and R13.3), and so does Prop. 2.2.10 (R13.1 and R13.3). Pick one owner for each.
11. **Packet sources.** Add Deligne–Mumford 1969 and arXiv:1608.01249 as sources, and point the Conrad and DR urls at the public copies.

---

## 2. ModularityAndLanglandsExtensions.json (ML.0–ML.5)

**Verdict: accepted, with the corrections below.**

| Item | Count |
| --- | --- |
| Nodes | 27: 6 verified, 21 corrected, 0 unverifiable |
| Links | 46 → 48: 26 kept, 20 annotated, 0 removed, 0 re-targeted, 2 added |
| Gaps | 16 → 26 |
| Coverage | 6 stage records, all atlas stages of the roadmap; `remaining` lists extended for ML.1–ML.4 |

**Cycles.** None, at stage level or node level. The check used the union of the atlas `stageEdges`,
`research/blueprint/atlas/stage-edges.json`, the stages' `requires`, and the stage edges implied by the
packet's links, including the two added links.

**Structure.** Every `parentStageId` and coverage `stageId` belongs to the roadmap. Every
`implementationStatus` is `unchecked`. The packet contains no private paths.

### Sources and provenance

Every source was fetched from a public copy on 2026-09-23 with the worker User-Agent. Nine match a hash in
the packet:

| Source | Copy read | SHA-256 |
| --- | --- | --- |
| Newton–Thorne I | arXiv 1912.11261v3 | `6d50b558…` (packet) |
| Newton–Thorne II | arXiv 2009.07180v2 | `0f08214e…` (packet) |
| Newton–Thorne (Hilbert) | arXiv 2212.03595v2 | `6a156f7a…` (packet) |
| BLGGT14 | arXiv 1010.2561v4 | `c953df62…` (packet) |
| Mok | arXiv 1206.0882v5 | `48be1920…` (packet) |
| KMSW | arXiv 1409.3731v3 | `a8458c8e…` (packet) |
| AGIKMS | arXiv 2410.13504v3 | `7aef4423…` (the library copy's hash) |
| KW I | preprint `results.pdf` on Khare's UCLA page | `3c389dc3…` (the library copy's hash, so page locators agree) |
| Scholze, torsion | free Annals PDF (citation_pdf_url) | `ebac854f…` (the library copy's hash) |
| ACC+ | arXiv 1812.09999v2, the accepted version | `7c882c4d…` (new) |

**ACC+.** The published Annals 197 (2023) PDF is not open access: the article page has no
citation_pdf_url. The reviewer therefore read arXiv v2.

* Theorem, lemma and display numbering agree with the drafter's citations.
* The drafter's printed-page locators match arXiv v2 page + 894 to 896 throughout, but cannot be checked
  exactly.
* Some excerpts differ from arXiv v2 only in "Th." against "Thm." or in punctuation. Their printed wording
  could not be checked.

**Publication data.** Confirmed via Crossref and the arXiv API: KW I (Invent. Math. 178, 485–504), BLGGT14
(Ann. of Math. 179, 501–609), Mok (Mem. AMS 235, no. 1108) and the latest arXiv version of each preprint.

**Beyond the drafter's ranges, the reviewer read:**

* the rest of the proof of NT I Theorem 2.33 (p. 51) and the twin map (p. 49);
* the proof of NT Hilbert Proposition 6.1 and Theorem 6.5 (pp. 46–50);
* NT II Lemmas 3.4–3.5 in full;
* KMSW contents;
* Scholze §5.1 through Theorem 5.1.4 (pp. 1031–1034);
* the ACC+ Lemma 7.1.8 and §7.2 passages on page images, and the ACC+ entries of the errata register
  (`data/source-issues.json`) for §§6.1 and 7.

**Page images.** Formulas were read on page images at 200 dpi:

* ACC+ pp. 133, 195, 197, 205–207 (arXiv v2);
* BLGGT14 pp. 39, 41, 42.

### Main corrections

1. **ACC+ Lemma 7.1.8 has coefficients Z_l, not Z-bar_l** (statement and hypothesis).
   * The page image of arXiv v2 p. 197 reads GL_2(**Z**_l) in both parts.
   * The proof warns that (1) "would be false if we replaced the coefficients Z_l with the ring of integers in
     an arbitrary extension of Q_l". That rules out Z-bar_l.
   * Theorem 7.1.11 applies (1) only after arranging "Q_{l_2} ≅ M_{i,λ_i}" (p. 210). This is the role of
     Assumption 7.2.6(1).
   * The inertia shapes in (1) and the image condition in (2) concern the residual r-bar.
   * The l = 2 caveat now covers both parts: e = 1 is not < p − 1 at p = 2. The register's
     PAPER-ALLEN-ETAL-23/E100 (awaiting review, not re-verified here) claims part (2) fails at l = 2.
2. **BLGGT14 Proposition 3.1.1: T is over K, not K_0.**
   * The page image of p. 41 reads "Suppose also that T/K is a smooth, geometrically connected variety", and
     σ ∈ G_{K_{0,v|K_0}}.
   * The drafter's match note ("the subscript 0 is displaced in the text layer") was wrong.
   * Both consumers apply the proposition to varieties over K: T~ over F(ζ_N)^+, and ∏X_i over F^+F_1^+.
   * Statement, hypothesis, acceptance item and match note corrected.
3. **The proof of ACC+ Theorem 7.1.11 has two unstated conditions** (gap added; checked in arXiv v2).
   * **p > n².** Theorem 6.1.1(4) needs p > n² with n = m_i + 1. Assumption 7.2.6(6) gives only
     l_1, l_2 > 2m_i + 3, which is weaker for m_i ≥ 3: m_i = 3 allows l = 11 or 13, below 16.
   * **Crystallinity above l_2.** Step 5 needs r_{i,λ_i} crystalline with Hodge–Tate numbers {0,1} above l_2.
     Very weak compatibility gives this only off a density-zero set, and the assumption omits it.
   * Both conditions exclude only density-zero sets, so the proof is repairable.
   * This matches register entry PAPER-ALLEN-ETAL-23/E106 (awaiting review), which this review confirms. The
     drafter's acceptance item asking for exactly this check is resolved accordingly.
4. **Two further gaps in ACC+ §7.2.**
   * **Corollary 7.2.4 over a CM field.** Step 8 (arXiv v2 p. 211) applies the corollary, which is stated for
     totally real F′, to the CM field F′. The passage through F′^+ and quadratic base change is not written.
   * **Disjointness.** Corollary 7.2.4 assumes F′ disjoint only from F_2^avoid, but Proposition 7.2.3 needs
     disjointness from F^avoid F_1^avoid (pp. 205–208; register E105).
   * **Step 5.** Step 5 asserts, without proof, that the direction and peu-ramifié property of the extension
     "follow easily from the connected–étale sequence" (p. 210).
   * **Step 8 citation.** Step 8's residual conditions come from parts (1), (2), (4) of Lemma 7.1.6 together
     with Lemma 7.1.8. Lemma 7.1.8 has only two parts.
5. **Corollary 7.2.4 details.**
   * **Residual inductions.** L_2 is cut out by the residual Ind ψ̄_m. The source prints Ind^{G_L}_{G_Q} there
     (p. 206), a second misprint beside the confirmed Ind_{G_F} on p. 207.
   * **Irreducibility step.** Inertia above q separates the two characters; Gal(LF′/F′) interchanges them.
   * **Imports list.** It said none of the BLGGT imports was read, contradicting this stage's own Theorem 2.4.1
     and 3.1.2 nodes.
6. **Newton–Thorne (Hilbert) Theorem 6.5(2) was missing, and the register contradicted it.**
   * Theorem 6.5 (p. 50) is Theorem A as part (1). Part (2) proves Sym^{n−1} π for RAECSDC π over CM fields,
     when π is not automorphically induced, with compatibility at every place.
   * The register's acceptance item "Reject 'symmetric power functoriality over CM fields'" is now qualified:
     only non-self-dual π over CM fields is potential-only.
   * Row (5′) was added. The Hilbert node's scope and imports ([Tho24, Thm 8.1], [CT17, Prop 7.6],
     [CHT08, Lem 4.1.4]) were added.
   * Convention ML.0(f) and the node now read rec_{F_v}(Π_{n,v}) (register PAPER-NEWTON-THORNE-26/E6,
     confirmed).
7. **NT I Theorem 2.33.** The proof continues on p. 51, where the drafter stopped. The "[Not read]" step is
   replaced by the actual argument:
   * cuspidality of π_F;
   * descent to G_2 by [Lab11, Théorème 5.4];
   * Corollary 2.28 with Example 2.10;
   * irreducibility from Lemma 3.5(2);
   * soluble descent.

   The imports and title were updated.
8. **Imports lists that called read BLGGT theorems "not read".**
   * NT I Theorem 8.1 and NT II Theorem 3.1 both apply [BLGGT14, Thm 4.2.1], which is this stage's node 10.
   * Theorem 4.2.1 is stated for imaginary CM F. Its consumers over Q or totally real fields must supply the
     soluble base change and descent. This is now in node 10's acceptance and on the links.
   * NT II's Lemma 3.4–3.5 imports were added: [BM02], [BDJ10], Jacquet–Langlands, Hida theory, [Ger19],
     and [BLGGT14] p. 524.
9. **NT II proof of Theorem 3.1, case 2 ∈ sc(π)** (checked on p. 27; register PAPER-NEWTON-THORNE-21-B/E3,
   confirmed). After Lemma 3.4 at p = 2, π″ may have 3 ∈ sc(π″). The conclusion must therefore come from the
   case already treated (weight 2, 2 ∉ sc), not from Proposition 3.11.
10. **Recorded source issues attached to the nodes that reproduce the affected proofs** (confirmed in the
    errata register, not re-verified here):
    * NT I Proposition 7.4: E21 (error), E19 and E23;
    * NT I §8: E24 and E25;
    * NT Hilbert Theorem 6.4: E10–E12.
11. **ACC+ Theorem 1.0.1 for CM elliptic curves.**
    * If the CM field K lies in F, the system over F is reducible. It is then not induced, as the node said,
      and it lies outside Corollary 7.1.13's irreducibility hypothesis.
    * The Sato–Tate clause is printed without the non-CM qualifier that Corollary 7.1.14 has.
12. **Smaller corrections.**
    * **Registry (ML.0).** Newton–Thorne write "(see e.g. [Car14])" for the whole compatibility statement, not
      for v | p. ACC+'s result is Theorem 2.3.3, with a 2n-dimensional r_ι(π).
    * **KW I.** Theorem 10.1's proof is modelled on Serre (1987) §§4.7–4.8, which was not read (gap added).
    * **BLGGT Theorem 5.4.1.** It uses the §5.1 definition of weakly compatible (de Rham at all v | l).
    * **NT II Appendix A.** It cites no source for Sym² and Sym³; the Gelbart–Jacquet and Kim–Shahidi
      attribution is from NT I p. 1.
    * **ACC+ Corollary 7.1.13 proof.** The central character of π_{ı,m} itself is unitary.
    * **AGIKMS.** The co-tempered packets belong to Main Theorem 3 only.
    * **Scholze.** The imported Arthur–Mok result is Theorem 5.1.2 (p. 1032).
    * **Locators.** Mok's Remark 2.5.3 is on p. 35. KMSW's introduction is on pp. 5–7 (printed page = PDF
      page); all four KMSW locators were one page early.
    * **Excerpts.** Three ACC+ excerpts carried the text-layer artefact "F 0" for F′.

**Verified without change:**

* KW I Corollary 10.2(i);
* BLGGT14 Theorems 2.4.1 and 3.1.2;
* NT I Theorem 3.1 (ping pong);
* NT II Theorem 2.1;
* the Clozel–Thorne framework node.

### Links

**Added:**

* **BLGGT Theorem 4.2.1 → NT Hilbert node.** Used three times in the proof of Proposition 6.1 (p. 48).
* **ACC+ Lemmas 7.1.5–7.1.8 → Corollaries 7.1.13–7.1.15.** Corollary 7.1.15 uses Lemma 7.1.10, whose proof
  uses Lemma 7.1.6(5) and Lemma 7.1.5 (pp. 199–203).

Both additions lie along the existing stage edge ML.2 → ML.3.

**Annotated:**

* **ET.6 → registry, and ML.0 → register.** The first carries a scope caveat. The second is a definitional
  dependency, and convention (f)'s cuspidality does not apply to row (4).
* **R23.1 → Prop. 3.1.1.** R23.1's own description covers only "the varieties used here". The general
  statement is in the README paragraph "General arithmetic-point and system interfaces". The variety T lies
  over K.
* **R19.1 Deligne–Serre node → NT II Appendix A.** The node asserts nothing at ramified primes, but NT use
  r_π|W_{Q_p} ≅ rec^T(π_p) at every p (gap added).
* **BLGGT 4.2.1 → NT I Theorem 8.1 and NT II Theorem 3.1.** Imaginary-CM statement applied over Q.
* **Lemmas 7.1.5–7.1.8 → Theorem 7.1.11.** The parts cited are corrected. Lemma 7.1.3 is not in the supplier.
* **KMSW links.** Locator pp. 5–6.
* **Statement-level only:** Deligne–Serre → KW I Corollary 10.2(ii), and NT Hilbert → Clozel–Thorne.
* **Others.** The drafter's scope notes on PA.5, AN.4, AS.6, ET.3, R07.1 and PadicFamilies L2 are kept.

**Stage edges.** Eleven new edges are implied: ET.6 → ML.0, ML.0 → ML.3, R19.1 → ML.1, R19.1 → ML.3,
R27.6 → ML.1, R28.4 → ML.1, R07.1 → ML.2, R07.4 → ML.2, R23.1 → ML.2, PadicFamilies:L2 → ML.3 and
ET.3 → ML.4. All are acyclic.

### Unverifiable items

No node is unverifiable. Two things could not be checked:

* the exact printed pages and the "Th."/punctuation wording of the ACC+ excerpts, because the published PDF is
  not open;
* whether the published ACC+ changed Assumption 7.2.6. The drafter's own transcription from the library copy
  records the same condition (6), so the gap in correction 3 stands in both versions as far as can be told.

### Questions for the orchestrator

1. **ACC+ §7.2 source issues.** Promote the three ACC+ findings to confirmed status: E105, E106, and the
   Corollary 7.2.4-over-CM-field step. Decide whether the ML.2 owner states the repaired Assumption 7.2.6
   (add l_i > (m_i+1)² and crystallinity above l_2) as the exported hypothesis.
2. **Symmetric powers over CM fields.** NT Hilbert Theorem 6.5(2) gives them for RAECSDC π. Should
   ML.3 or ML.5 own it, and should the ML.3 stage text stop describing CM fields as potential-only?
3. **Weight-one local-global compatibility at ramified primes.** It is needed by NT II Appendix A. Assign it
   to AutomorphicGaloisRepresentations R19.1 or GL2AutomorphicRepresentationsAndTransfer, with a source.
4. **Polarized lifting owner.** The earlier supplier request (Tho12 and BLGGT14 §§1–4) stands. Its owner
   should also state the imaginary-CM restriction of BLGGT14 Theorem 4.2.1 and the base-change bridge that
   every Newton–Thorne consumer uses.
5. **Existing gaps to edit.**
   * Drop BLGGT14 Theorem 4.2.1 and "obtain BLGGT14" from the Newton–Thorne-imports gap.
   * Retitle the ACC+ Theorem 6.1.1 gap, which still says Lemmas 7.1.6–7.1.8 are unread.
   * Add Serre §§4.7–4.8 to the KW I gap.
   * Add the ACC+ arXiv v2 hash to the `accplus` source entry.
   * Shift KMSW `readSections` by one page.
6. **HANDOFF (ML).** Correction 6 should add the second misprint (Ind^{G_L}_{G_Q} ψ̄_m on p. 1101). The
   "Next actions" line "Read ACC+ Lemmas 7.1.6–7.1.8" is done.

---

## 3. OverconvergentAutomorphicForms.json (O0–O8)

Reviewer: independent review REVIEW-EXT-12. Date: 2026-09-24.

**Verdict: needs changes.**

Every node-level problem has a correction in the packet's `review` object (applied in the companion pull request). The verdict is "needs changes" for two reasons that the reviewer cannot fix inside this packet:

* **Hidden dependency cycle.** Material this packet places in O2 is also consumed by T5, which closes a stage cycle (see the structural finding below).
* **Sign convention for ρ.** The atlas pin conflicts with the AIP source that BHW compare against.

| Item | Count |
| --- | --- |
| Nodes | 29: 12 verified, 17 corrected, 0 unverifiable |
| Links | 94 → 96: 67 kept, 24 annotated, 3 removed, 0 re-targeted, 5 added |
| Gaps | 12 → 19 (7 added; 8 existing gaps updated, 2 of them resolved) |
| Coverage | 9 records, one for each atlas stage O0–O8; every `parentStageId` belongs to the roadmap. The O7 and O8 `remaining` lists need specific items (supplied). |

**Cycles.** No stage cycle in the union of the atlas `stageEdges`, `research/blueprint/atlas/stage-edges.json`, the packet's links and the added links. The hidden dependency described below would create one if it were made explicit.

### Sources and provenance

The packet's only cited source is BHW. The reviewer fetched it and every public import that the corrections depend on.

| Source | Version read | SHA-256 | Fetched |
| --- | --- | --- | --- |
| BHW, Ann. Inst. Fourier 73 (2023) 1709–1794 | Centre Mersenne PDF, DOI 10.5802/aif.3560 | `d59b7f70…` | 2026-09-23 |
| BHW, arXiv 1902.03985 | v4 (10 May 2021, the last version) | `8ee48970…` | 2026-09-23 |
| AIP, "The adic, cuspidal, Hilbert eigenvarieties", Res. Math. Sci. 3 (2016) 34 (= BHW [2]) | open-access PDF, DOI 10.1186/s40687-016-0076-7 | `b6b0b67e…` | 2026-09-23 |
| Heuer, "Line bundles on rigid spaces in the v-topology" (= [14]) | arXiv 2012.07918v2; Forum Math. Sigma 10 (2022) e82 | `7d07fca4…`, `27d90625…` | 2026-09-24 |
| Heuer, "Cusps and q-expansion principles…" (= [13]) | arXiv 2002.02488v1; Doc. Math. 27 (2022) 2385–2439 | `34081391…`, `de9a34a7…` | 2026-09-24 |
| Chojecki–Hansen–Johansson, Doc. Math. 22 (2017) 191–262 (= [9]) | EMS PDF, DOI 10.4171/dm/564 | `227a79d3…` | 2026-09-24 |
| Pilloni, "Overconvergent modular forms", Ann. Inst. Fourier 63 (2013) 219–239 (= [24]) | Centre Mersenne PDF, DOI 10.5802/aif.2759 | `c3533f2b…` | 2026-09-24 |

All bibliographic data were checked with Crossref or the arXiv API.

**BHW copy.** The packet's library copy of BHW is byte-identical to the public journal PDF (same SHA-256), so the source is public. The page offset is printed page = PDF page + 1707. The reviewer read §§1–10 and the bibliography in full.

**Page images.** Formulas were read on page images of printed pp. 1723, 1729, 1737, 1751, 1756–1757, 1761, 1784 and 1791, and of AIP pp. 8, 14 and 31.

**arXiv v4 against the journal.** Every theorem-type item has the same number in both. The differences are editorial:

* author–year citation keys ([AIP16a] = [2], [AIP16b] = [3], [Heua] = [13], [Heub] = [14], [Heu19] = [15]);
* "Warning 6.7" becomes "Remark 6.7";
* abbreviations ("Defn.", "Prop.");
* a cross-reference "Defn. 3.13" in Definition 4.7 becomes "Definition 4.5".

Every formula at issue below is identical in the two versions. The packet's excerpts are literal for the journal; 45 of the 154 are not verbatim in v4, for editorial reasons only.

**Excerpts.** 151 of the 154 excerpts occur at the cited printed pages. The other three were text-layer artefacts: a dropped exponent in Definition 7.7, dropped superscripts in Definition 9.10, and "G b m" for Ĝ_m before Lemma 9.7. All three are re-transcribed from the page images.

**Not obtained or not read:**

* AIP, Astérisque 382 (= [3]);
* "Le halo spectral" (= [4]);
* Heuer's thesis (= [15]);
* the full text of Buzzard's "Eigenvarieties": the file on his homepage has only 6 pages and does not contain §8;
* Kedlaya–Liu II, Theorem 8.2.3 (not read).

### Main corrections

1. **The analyticity radius in Proposition 6.3 is wrong as printed.**
   * **What BHW print.** r_κ := |p|^{r₀}|T_κ| (page image, p. 1757), with "the precise value of r_κ follows from [2, Proposition 2.8]".
   * **What the cited source gives.** AIP [2, Prop. 2.8] (read, p. 8) says that over W⁰_{F,I} with I ⊂ [0, pⁿ] the character extends to T(Z_p)·(1 + p^{n+r₀}O_F ⊗ G_a). The radius is therefore |p|^{n+r₀}, where n is minimal with |T|^{pⁿ} ≤ |p|; it is not linear in |T_κ|.
   * **A weight where the printed radius fails.** Take F = Q, p = 3 and κ trivial on ±1 with κ(4) = 1 + T, v(T) = 1/3. Then r_κ = |3|^{4/3}. But |log(1+T)| = 1, so the continuation near 1 is exp(c log z) with |c| = 3, which converges only for |z − 1| < |3|^{3/2}. For T_κ = 0 the printed range of r is empty.
   * **Downstream effect.** With the printed radius, Definition 7.7's "ε_κ ⩽ ε^def_κ" fails; for example, p = 5 and |T_κ| = |p|³ give ε^def_κ = 1/1250 < ε_κ = 1/625. With AIP's radius it holds for every p. The derivation is in the O5 annuli node; BHW's constants r = 3 and r = 5 are exactly what make it work.
   * **Changes.** The node now carries the AIP radius, and the node for κ(c𝔷 + d) was adjusted to match.

2. **The Hilbert level m = k + r (Definition 7.9 and the proof of Theorem 7.14) is off by one.** The drafter's suspicion is confirmed by AIP [2]:
   * **AIP's standing assumptions.** AIP [2, §4.2] (page image, p. 14) construct w_{n,r,I} for I = [p^a, p^b] only when r ≥ 3 and r + a ≥ n ≥ b + 2 (n ≥ b + 4 if p = 2).
   * **Canonical subgroups.** AIP Proposition 3.2 gives canonical subgroups only up to level r + a.
   * **Consequence.** For W*_k = W_{F,[p^{k−1},p^k]} and BHW's r = 3 (resp. 5), these assumptions force n = k + r − 1, which is the elliptic choice of Definition 4.7.
   * **Gluing.** The gluing by AIP Proposition 4.7 works with k + r − 1 and fails with k + r.

   The three O5 nodes are corrected. Omitting k = 0 in the proofs is harmless, because W*₀ ⊂ W*₁.
3. **T_κ must be computed on the free part of weight space.** BHW define |T_κ| as a supremum over all of O_p^× (for the Hilbert case) and over Z_p^× (Definition 4.5, elliptic). For a weight nontrivial on the prime-to-p torsion, |T_κ| = 1. So as printed:
   * "bounded iff |T_κ| < 1" fails;
   * ε_κ = 0;
   * W* is not the union of the W*_k;
   * Definition 4.5's "topological generator of Z_p^×" does not exist for p = 2.

   AIP avoid all of this: they work on W⁰_F (Lemma 2.5) and twist by the torsion character separately (§6.4). The O0 and O5 nodes are corrected, and a gap is added.
4. **Sign of ρ.** The drafter's finding stands: Definition 6.1's group map x ↦ (x², N(x)) and the display κ = w²(t⁻¹∘N) disagree. AIP [2, §8.2] (page image, p. 31) defines W^G_F → W_F by the same group map, t ↦ (t², Nm t), and AIP say they follow [3].
   * **Consequence.** The displayed t⁻¹ is inconsistent with both BHW's own group map and AIP.
   * **Effect of the atlas pin.** The pin (the displayed formula with an inverted group map) relabels G-weights relative to AIP by t ↦ t⁻¹, which matters for the identification in Definition 9.11 and Theorem 9.12. (9.1) does not decide the sign.
   * **Changes.** The node and the gap are updated. The pin is left for the orchestrator.
5. **Remark 5.8 was misread.** The node said that composing with γ^∨ rather than γ⁻¹ is what makes the action a left action. BHW say instead: "the dual ensures that we obtain a left-action. One reason for us to use γ∨ rather than γ−1 to define the action is Lemma 8.23." Both α∘γ⁻¹ and α∘γ^∨ give left actions. Corrected.
6. **Most of BHW's locators for Heuer's papers are wrong; the content exists.** Both public versions of each paper were checked, and their numbering agrees.
   * **[14], the v-topology paper.** "[14, Cor. 3.5]" (the Zariski-dense-open criterion) is Corollary 3.1; Corollary 3.5 is a different criterion. Cor. 3.6 and Prop. 3.8 are cited correctly. "[14, Cor. 4.1]" and "[14, Prop. 4.8]" (Proposition 6.6) have no counterpart; the argument BHW describe is Corollary 3.1 followed by Proposition 3.8, as in [14, Example 3.9].
   * **[13], the cusps paper.** "[13, Prop. 2.10], [13, Thm 3.8], [13, Thm 3.21]" are Prop. 2.22, Thm 3.17 and Prop. 3.19.

   The analyticity and cusp nodes are corrected, and the gap is updated.
7. **Citations of AIP [2] that do not match its content.** The reviewer checked the full numbering of AIP [2].
   * **"[2, Theorem 3.16]" (Remark 6.9, Banach modules) does not exist.** The nearest statement is Corollary 8.3(3), which covers only cuspidal forms for G. This is a new gap.
   * **"[2, Theorem 6.7.3]" is item 3 of Theorem 6.7.** It is the Frobenius compatibility for the analytic sheaf; the integral analogue is Proposition 4.8.
   * **"[2, Proposition 8.4]" (Koecher) concerns push-forwards to weight space from the open variety.** It does not say that the line bundle extends; that extension is AIP's toroidal construction.

   The O3, O5 and O6 nodes are corrected.
8. **Radius conditions that were left implicit.**
   * **The n = 0 sheaf AL_*ω₁^κ (Definition 6.5) needs pε ⩽ ε^def_κ.** BHW leave this implicit; the elliptic Definition 3.15 prints "ε_κ/p > ε", with ε_κ defined only in §4.
   * **Definition 3.16 is strict** (ε < ε^def_κ).
   * **Proposition 2.6 (ε ⩽ r/c_p) is a literal special case of Proposition 5.18 only when r = p^{−m}.**
9. **Imports behind Lemma 3.7.**
   * **Lemma 3.6.** Kedlaya–Liu give v_*Ô = O. The O⁺ statement is BHW's own deduction, and it uses that Y is rigid.
   * **CHJ Lemma 2.23(2)** (read, p. 215) is stated for Q_p-Banach coefficients with ⊗̂ over Q_p. BHW apply it over L and to O⁺.

   The node and the P9 gap are updated. Minor slip: the proof of Lemma 3.7 swaps V and W in its first line.
10. **Elliptic comparison (§4).**
    * **ε ranges.** Definition 4.7 needs ε < ε_κ, but Theorem 4.8 allows ε = ε_κ.
    * **Groups.** Definition 4.7(1) and the proof of Theorem 4.8 use the group Z_p^×(1 + p^mĜ_a). The torsor group of Definition 4.4 is B_m = Z_p^×(1 + p^m Hdg^{−(p^m−1)/(p−1)}Ĝ_a), which the Hilbert Definition 7.9 uses.
    * **Pilloni [24, §3.5]** (read) defines the sheaf through Z_p^×-homogeneous sections.

    Added as hypotheses and as a gap. BHW's bibliography entry [24] also has the wrong title and swaps volume and number.
11. **Theorem 9.12.** "In particular invertible" needs integral descent along π. BHW do not argue it; it is available because AIP's Δ-quotient is finite étale on the formal model (AIP Lemma 8.1, read). AIP's twisted Δ-action (μ_ε multiplied by ν(ε)) is now recorded.

**Drafter findings confirmed:**

* the (1 + NO_F)^× versus (1 + NO_F)^{×,+} slips in Lemmas 9.2 and 9.5, and the extension via N(η) = 1;
* both "(G*,Γ*,n)" index slips in the proof of Lemma 9.3 (pp. 1782 and 1783);
* the "Γ₀(p)" base in Lemma 9.6;
* "coprime to n" in §10.1;
* the (10.4) typo: on the page image the top row is X_{c𝔭,…} over the tame correspondence F_{m,Γ₀(𝔞)}, and the middle entry also lacks Γ₀(𝔞);
* the reading of Remark 6.7's "weight 1";
* the direction of the inclusion in the proof of Proposition 7.10: AIP §6.4 cuts out the space pointwise by |H̃a^{p^{r+1}}| ⩾ sup|α|.

### Links

**Removed (3).** These links went from the Lemma 9.3, Lemma 9.6 and Lemma 9.7 nodes to the node for Definitions 9.8/9.10. Neither definition uses those lemmas; Theorem 9.12 does, and the packet already links all three to the Theorem 9.12 node.

**Added (5):**

* the node for the four torsor presentations → the node for Definitions 9.8/9.10 (Definition 9.8 takes presentation (4));
* O0 analytic continuation → the AIP sheaf node (Definition 7.9 evaluates κ⁻¹ on B_m);
* the O2 canonical-section node → the elliptic comparison node (the proof of Lemma 4.9 uses 𝔰 and (3.3));
* `PerfectoidShimuraVarieties:S5` → the cusp node (Proposition 3.8 uses completed cusp charts and the action on q-parameters, which are in S5's stated scope);
* `PerfectoidShimuraVarieties:S3` → the tame Hecke node (Lemma 10.1 uses Hodge–Tate functoriality under the prime-to-p isogeny A → A/D; this is a new but acyclic stage edge, and its scope caveat is recorded).

**Annotated (24).** The main scope caveats:

* the radius and torsion data that L0a must supply;
* P9 must provide the L-linear and O⁺ form of CHJ Lemma 2.23;
* S3's matching node is in the sibling draft `PerfectoidShimuraVarieties:S3/levi-torsor-pullback-identifies-automorphic-vector-bundles` (CS Thm 2.1.3(2)); re-target once that packet is accepted;
* the G*(Q_p)- and G(Q_p)-actions are outside S5's stated scope;
* partial Hasse invariants are outside T4's stated scope;
* Lemma 8.22 is only loosely inside H3's scope ("maps associated with changing 𝔠");
* C6 must state Koecher in AIP's form.

**Structural finding.** The packet credits `HodgeTateAndCanonicalSubgroups:T5` with Proposition 7.11, Lemma 7.12 and the first part of Lemma 4.9. Those results use Lemmas 5.31–5.32 (the canonical section 𝔰), which the packet places in O2. As a stage edge, O2 → T5 closes the cycles O2 → T5 → O2 and O2 → T5 → S5 → O2 (checked by script); S3 → T5 would be acyclic. The sibling draft node `PerfectoidShimuraVarieties:S3/elliptic-hodge-line-as-pullback-of-O1-via-quotient-line` also duplicates the elliptic content of three O2 nodes (the tautological section, the canonical section and Proposition 3.22).

### Unverifiable items

No node claim is unverifiable: every node cites BHW, which is public.

Some imported results remain unread and stay as gaps:

* AIP [3]: Lemmas 3.27 and 4.5, §§4.1 and 4.3, Theorem 5.5.1;
* "Le halo spectral" [4];
* Heuer's thesis [15, Lemma 2.8.4];
* Buzzard [6, Proposition 8.3];
* Kedlaya–Liu II, Theorem 8.2.3.

### Gaps

**Added (7):**

* the torsion normalisation of T_κ, δ_κ and the weight annuli;
* the placement of 𝔰, covering the hidden O2 → T5 dependency and the duplicate sibling S3 node;
* Heuer's thesis [15, Lemma 2.8.4], which feeds the proof of Proposition 3.24;
* no supplier for the G*(Q_p)- and G(Q_p)-actions on the towers (§8.4.1; u_n, u_𝔭, Lemma 8.23);
* partial Hasse invariants and the image of π₂ in the U_𝔭 correspondence;
* the non-existent "[2, Theorem 3.16]";
* the group in the elliptic Definition 4.7(1) versus B_m.

**Updated (8):**

* the ρ sign (new AIP evidence);
* r_κ (resolved against the printed value);
* the Lemma 3.7 imports (CHJ read);
* the Heuer papers (obtained; locators mapped);
* weight specialisation (AIP Theorem 6.7(2));
* the level m (resolved: k + r − 1);
* the direction of the inclusion (resolved);
* the AIP Hecke and Koecher imports (AIP [2] read; [3] still missing).

### Questions for the orchestrator

1. **The ρ pin.** The atlas O0 text pins κ = w²(t⁻¹∘Nm) with an inverted group map. AIP [2, §8.2] uses BHW's printed group map, t ↦ (t², Nm t). Either reconsider the pin, or keep it and require the O5 arithmetic comparison to carry the relabelling (w, t) ↔ AIP's (w, t⁻¹). Author confirmation would settle it.
2. **Where the canonical section lives.** Move BHW Lemmas 3.17–3.21 and 5.29–5.32 to `PerfectoidShimuraVarieties:S3` and add the stage edge S3 → T5. Alternatively, keep them in O2 and have O5, not T5, prove Proposition 7.11 and Lemma 7.12. Then deduplicate against the sibling S3 draft node.
3. **Misprints to confirm with the BHW authors:** r_κ in Proposition 6.3 (the reviewer's replacement is AIP's |p|^{n+r₀}); m = k + r in Definition 7.9 and Theorem 7.14 (replacement k + r − 1); the Heuer locators; "[2, Theorem 3.16]". Should the atlas record them as a published-errata item (`sourceIssues`)?
4. **Supplier scope.** Assign an owner for each of:
   * the G(Q_p)-action of §8.4.1 (S5 or H4);
   * partial Hasse invariants at 𝔭 | p (T3 or T4);
   * Heuer's analyticity criteria for v-line bundles (no atlas stage owns them);
   * the isogeny form of Lemma 8.22 (H3).

   L0a must state the analyticity radius in AIP's form, with the torsion character split off.
5. **Acquisitions:** AIP, Astérisque 382; "Le halo spectral" (Ann. Sci. ÉNS 51 (2018)); Heuer's thesis (King's College London, 2019); the full text of Buzzard's "Eigenvarieties"; Kedlaya–Liu II, Theorem 8.2.3 (arXiv 1602.06899).
6. **Packet source list.** Add the five public sources listed in `packetSourcesAdded` and replace the BHW `edition` text (`packetSourceCorrections`). The library copy of BHW is the public journal PDF.

---

## 4. PELModuli.json (M0–M6)

**Verdict: accepted, with the corrections recorded in the packet's `review` object (applied in the companion pull request).**

| Item | Count |
| --- | --- |
| Nodes | 39: 13 verified, 26 corrected (51 field corrections), 0 unverifiable. M0: 5 verified, 9 corrected. M1: 4 verified, 9 corrected. M2: 4 verified, 7 corrected. M6: 1 corrected. |
| Links | 100 → 115: 87 kept, 13 annotated, 0 removed, 0 re-targeted, 15 added |
| Gaps | 12 → 18: 6 added; all 12 existing gaps updated |
| Coverage | 7 records, one per atlas stage (M0–M6). M0, M1, M2 and M6 are `partial`; M3, M4 and M5 are `not_read`, with no nodes. Every `parentStageId` belongs to PELModuli. |

There is no stage cycle. The links imply 10 stage edges that are not in the atlas: D3→M0, A2→M1, A3→M1, R09.2→M1, R09.3→M1, M0→M2, R03.2→M2, SF.4→M2, A0-extension→M2 and R11.1→M2. Their union with the 3508 atlas `stageEdges` is acyclic, including the 15 added links. The node graph is also acyclic.

### Sources and provenance

Every source the packet cites has a public copy, so no node is unverifiable.

| Source | Public copy | SHA-256 | Match with the packet |
| --- | --- | --- | --- |
| Lan, thesis revision (14 March 2021) | kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf | `a7a454f5…` | identical |
| Lan, *An example-based introduction* | kwlan.org/articles/intro-sh-ex.pdf | `d9a3e755…` | identical |
| Milne, *Introduction to Shimura varieties* (2017) | jmilne.org/math/xnotes/svi.pdf | `f637e617…` | identical |
| Hida, *p-adic automorphic forms on reductive groups* | math.ucla.edu/~hida/Poincare.pdf | `fc85157f…` | identical |
| Faltings, Invent. Math. 73 (1983) | GDZ, PPN356556735_0073/LOG_0026.pdf | `f72a869f…` | different scan (library copy `0b7fb3e5…`); printed pages agree |

**Page numbering.**
* Lan: PDF page = printed page + 28 throughout Chapters 1–2 and Appendix B.
* Faltings (GDZ copy): no text layer and a cover sheet, so printed p. 357 is PDF p. 10. The drafter's "PDF p. 9" refers to the library scan.
* Crossref confirms Faltings 1983 as DOI 10.1007/BF01388432 and Lan's book as LMS Monographs 36, Princeton UP 2013, DOI 10.1515/9781400846016.

**Also fetched (not packet sources).**
* Lan's book errata and thesis errata (both dated 14 March 2021). Used to check that each node states the corrected result.
* Kottwitz, JAMS 5 (1992), from ams.org.
* Lan, Crelle 664 (2012), author's copy with errata.
* Schlessinger (1968), from ams.org.

The last three were fetched only to update access gaps; their relevant sections were located, not read.

**Beyond the drafter's ranges, the reviewer read:**
* Faltings pp. 353–357 on page images;
* Lan intro pp. 54–58 (5.1.3–5.1.5);
* Lan Cor. 7.2.3.10 (statement);
* Lan's bibliography entries [6], [18], [76], [94], [107], [109];
* the parts of both errata lists covering Chapters 1–2 and Appendices A–B.

Formulas carrying primes, hats, the box symbol or inequalities were read on 130–200 dpi page images. The Lan text layer prints □ as "2", drops primes (A′ → "A0") and renders ⟨·,·⟩ as "h · , · i".

### Main corrections

1. **Lan Def. 1.2.3.6(2) is inconsistent in type D.** It is not in either errata list.
   * The page image of PDF p. 76 asks for "α a unit in O_{F[τ]c,R} satisfying α = −α⋆".
   * In type D, ⋆ is trivial on F = F⁺ and p ≠ 2, so no unit satisfies this.
   * The proof's summary (printed p. 51, item 2) gives, for the symmetric O_{F,R}-pairing, "each α being a unit in O_{F,R}", with no sign condition. The O-level module is then obtained by tensoring with a self-dual pairing on O.
   * The standard-form node now follows the proof and flags the printed clause. A gap and a source issue are recorded.
2. **Sign in Lan Prop. 2.1.3.2(3).**
   * The revision (printed p. 119–120) states `o(f; m_X+X̃, m_Y+Ỹ) = o(f; X̃, Ỹ) − df(m_X) + f*(m_Y)`.
   * Its own proof ends `c′_αβ = c_αβ + df(m_X,αβ) − f*(m_Y,αβ)` (p. 121).
   * Book erratum (14) confirms `+df − f*`.
   * The obstruction node had copied the wrong sign. The revision still carries it, so it is a source issue.
3. **Faltings Satz 1 (M6 node).** Page images of pp. 353–357 show three errors in the node.
   * Satz 1 counts pairs of a semiabelian p: A → Spec(R) with proper generic fibre and a principal polarization on A/K, with h(A) ≤ c. It does not count principally polarized abelian varieties over K.
   * A_g is the coarse moduli scheme, embedded in P^n_Z (p. 354), not a stack.
   * "Es ist bekannt, daß alle diese A an denselben Stellen von K schlechte Reduktion haben" is also unproved. It relies on semistability: a ramified quadratic twist of a curve with good reduction at v has bad reduction at v.

   The node's quadratic-twist test over Q lies outside Satz 1, because such twists are never semistable. It was replaced by an unramified twist over a field with nontrivial class group. The coarse-point test needs g ≥ 2.
4. **Prop. 1.3.2.15(1) is fibrewise.**
   * The source (PDF p. 105) reads "Over each geometric point s̄ of S, λ_s̄ is of the form λ_L for some ample invertible sheaf L over A_s̄".
   * The polarization node had asserted a single global L.
5. **Multirank lemmas.** Lemmas 1.2.1.26–1.2.1.33 assume "R is a noetherian complete local ring" (printed p. 38), which the node dropped. Projectivity in Lemma 1.2.1.29 is of the O_Λ-lattice M_[Z] ⊗ Λ, not of O ⊗ Λ.
6. **Milne's dictionary.**
   * The page image of Milne p. 67 reads "ψ(Ju,Jv) = ψ(u,v) and ψ_J is positive-definite ⇔ ψ is a polarization of the Hodge structure (V, h_J)".
   * The lattice node wrote ±2πiψ. The factor 2πi belongs to Prop. 8.14. A Milne source entry was added.
7. **Lan misprint copied (étale-stack node and link 55).**
   * §2.3.4, condition 1 (page image of PDF p. 192) prints "L := (Id_A × λ)*P_A", which is a sheaf on A ×_S A.
   * The relatively ample sheaf of Prop. 1.3.2.15(3) is (Id_A, λ)*P_A.
8. **Arguments presented as proved that the source only asserts:**
   * Cor. 1.3.5.4 ("Combining the above two propositions", PDF p. 112). The quotient construction is named only in Hida 6.1.2.
   * The bijection in Prop. 2.1.6.8 ("Thus they must coincide", printed p. 136).
   * The descent back from the étale base changes in Props. 2.2.4.4 and 2.2.4.9. A gap was added.
9. **Representability node.**
   * Lan's one-sentence reduction "by Lemma 1.4.4.2 … □ empty or infinite" needs H = H′ × U_{□′−□}.
   * Thm B.3.11 needs the constant Krull dimension from Thm 2.2.4.13.
   * The thesis errata confirm that this reduction was added only in the revision.
   * The relative dimension dim_C Sym_ϱ(V_0) is derived by the node; Lan does not state it.
10. **False acceptance tests.**
    * "KS is an isomorphism exactly where the j-map is étale" is false. For the Legendre family KS is an isomorphism everywhere, while λ ↦ j ramifies over j = 0 and 1728.
    * "Degree divisible by p" does not make λ₀ inseparable, since an étale kernel of order p is separable.
    * "GO_m is disconnected" holds only for m even.
    * The ν_n test used n = 2, where Isom((Z/2)(1), μ₂) is a singleton, so it could detect nothing. It now uses n = 3.
11. **Excerpts rebuilt from the printed text.** These text-layer artefacts changed the meaning:
    * F0 for F′₀ (Lemma 1.2.5.9);
    * Λ0 for Λ′ (Def. 1.2.5.13, Props. 1.2.5.15–16), which is exactly the Λ → Λ′ change of the thesis erratum;
    * R0 for R′ (Cor. 1.2.3.10);
    * A0 and λ0 for A′ and λ′ (Def. 1.3.1.16, Prop. 1.4.3.4);
    * "b?" for b⋆;
    * "%" for ϱ with a dropped ε (Prop. 1.2.2.3);
    * "h · , · i" for the angle brackets, in six excerpts.
12. **Smaller corrections.**
    * The Prop. 2.1.2.2/2.1.3.2 liftings are required to be smooth; "flat (hence smooth)" is not the source's hypothesis.
    * Diagram (2.2.3.1) has only its vertical maps small.
    * An unstated projectivity step in the proof of Lemma 1.2.5.11 is now recorded.
    * The Cor. 2.2.4.12 locator was corrected.
    * The Siegel test base is Z[1/n] only for □ = primes not dividing n.
    * The type-D presupposition in the change-of-lattice test was removed. Rem. 1.4.4.5 says only "delicate".

**Errata cross-check.** The nodes transcribe the corrected revision, and none carries a claim Lan's errata retract. This covers the s_[τ] multiplicity, the Def. 1.2.1.6 remark, Lemmas 1.2.5.9–1.2.5.10 with F′₀ and L₀, the removal of (1.2.5.11)/(1.2.5.15), and "prime-to-□ polarization" in Defs. 1.4.1.2 and 1.4.1.4. Two residues remain in the revision itself and are not node errors: the Prop. 2.1.3.2(3) sign, and "rational principal level-H structure" in Def. 1.4.2.1(5) (book erratum 10).

**The ν_n "tension" is not a contradiction.**
* Lan intro p. 52 concerns the mod-n diagram alone. This agrees with the revision's Def. 1.2.1.6: r is determined by g only "if L ≠ {0} and R is flat over Z".
* Def. 1.3.6.2 claims determination for symplectic-liftable pairs, without proof.
* The corrected node records a short argument for it, flagged as the reviewer's: two lifts differ by g ≡ 1 mod n, which forces ν(g) ≡ 1 mod n.
* Because no source proves it, the gap stays open.

**Verified without change:**
* the discriminant, determinant-polynomial, field-of-definition, types A/C/D and reflex-field-comparison nodes (M0);
* the Kottwitz condition, level-H structures, M_H and M^rat_H nodes (M1);
* the local deformation functors, effectivity, Lemma 2.3.3.1/Cor. 2.3.3.2 and Kodaira–Spencer isomorphism nodes (M2).

Lemma 2.3.3.1 states: for A over any base S, λ a polarization and n ≥ 3, Aut_S(A, λ) → Aut_S(A[n]) is injective and its image acts via roots of unity.

### Links

**Annotated (13):**

* **0.** The hereditary property is Prop. 1.1.1.23, not part of the supplier node.
* **17.** Not a logical prerequisite: Rem. 1.2.5.18 calls Cor. 1.2.5.17 "an alternative reasoning". The link is kept for the explicit [L^#:L] hypothesis.
* **36.** Lemma 1.3.8.5 also uses Prop. 1.3.5.3.
* **49.** Lan calls Cor. 1.4.3.1 "a consequence of Theorem 1.4.1.11". The edge is valid only for the packet's re-derivation from Lemma 1.4.1.10 and Def. A.5.9, which is correct. Recommend splitting Lemma 1.4.4.2 and Prop. 1.4.4.3 into their own node.
* **51 (A2).** A2 names only the degree-zero Picard functor. Prop. 1.3.2.14 needs Pic_e and theta-group splitting.
* **52 (A3).** Covers the quotient step, but Lan gives no proof of Cor. 1.3.5.4.
* **54 (R09.2).** Covers the Hom-scheme half of Prop. 1.3.3.7 only. Jordan–Zassenhaus and positivity are not supplied.
* **55 (R09.3).** Covers SGA 1 VIII 7.8. The reason must use (Id_A, λ)*P_A.
* **66 (R03.2 node).** The supplier does not state Schlessinger Prop. 2.5(i), R = Λ[[t_1…t_m]].
* **70 (A4).** A4 does not name the de Rham duality through c_1(P) or ∧^i H^1(O) = H^i(O).
* **80 (SF.4 node).** The endpoint exists only in the unpromoted EXT-01 draft, and it omits uniqueness of algebraized morphisms (EGA III 5.4.1).
* **90 (A0-extension).** Lan's variants B.3.9 and B.3.11, with the constant-Krull-dimension hypothesis, are not named.
* **92 (R11.1).** Extension of isomorphisms compatible with λ, i and α_H is unwritten, and R11.1 is stated over excellent discrete valuation rings and Dedekind bases.

**Checked cross-roadmap links kept:**
* D3 → reflex-field comparison (link 19): D3 defines the reflex field of a datum, and the reason already says D3 proves no identification.
* M6 → R28.1 node (link 99): the reason already records the scope mismatch.

**Added (15):**
* **Within M0 (6):** multirank → universal domains; lattice → universal domains, standard form, smoothness and Lagrangian; types → smoothness.
* **Into M1 (4):** discriminant → change of lattice (Rem. 1.4.3.9 uses Prop. 1.1.1.21); level-n → rational level structures (Constr. 1.3.8.4, Lemma 1.3.8.5); polarizations → M^rat_H; O-structures → M^rat_H.
* **From M1 into M2 (5):** isogenies/rigidity → local deformation functors and → representability (Thm 1.3.1.3 limits); polarizations → local deformation functors (Cor. 2.2.2.6) and → polarized formal smoothness (Prop. 2.2.4.4); O-structures → local deformation functors (Cor. 2.2.2.7).

### Unverifiable items

None. Every cited passage, including Faltings, was obtained in a public copy.

### Gaps

**Added:**
* the type-D inconsistency of Def. 1.2.3.6(2);
* standard algebra imports: Herstein [63], Eisenbud [41], Serre *Local Fields* [110], Lemma B.1.1.11;
* imports of §1.3.2: [94, §§13, 15], [6, Cor. 6.2], [73, II 6.16], [92], [22], [37], [59, III-1 4.7.1];
* Serre's lemma and neatness of U^□(n) (Rem. 1.4.1.9);
* unwritten verification steps in §§2.1.6 and 2.2.4;
* Chapter 2 and Appendix B imports: Matsumura, BLR, EGA 0_I 5.4.10.1, 0_IV 20.4.9, III-2 6.7.8, IV-4 17.x/18.10.x, Godement, Appendix A and B.1 results, and the uncited very ampleness of L^⊗3.

**Updated:**
* **Kottwitz and Crelle 2012.** Both are public, so these are now reading tasks. Kottwitz Lemma 2.11 and §§5, 7, 8 and Crelle §§2.4–2.5 are located.
* **ν_n gap.** Retitled, because there is no contradiction; it stays open.
* **Reiner.** Lan cites the OUP "New Series 28" printing; more theorems added.
* **Mumford and SGA/EGA gaps.** Additional neededBy entries.
* **Faltings descent.** Public copy; the "same bad reduction" step was added.
* **Quasi-projectivity.** Lan intro pp. 55–56 gives an alternative route: at neat level M_U is finite over a Siegel moduli scheme. It is stated there, not proved.

### Coverage

* **M0, M1, M2, M6.** `partial` is correct; the `remaining` lists need the additions in `coverageNotes`.
  * **M0 item 5 is inaccurate.** Lan intro (5.1.2.1)–(5.1.2.2) and Hida 6.1.1 do give rational and p-integral data; they were read but not transcribed.
  * **M1.** Should list the "all-primes adelic variant", which is covered only as □ = ∅.
* **M3–M5.** `not_read` is accurate. However, the packet summary says "M3–M5 use" the survey sources, although no M3–M5 node exists. The summary should say that those passages were only located.

### Questions for the orchestrator

1. **Source issues for the errata register:**
   * Lan Def. 1.2.3.6(2), type D;
   * Prop. 2.1.3.2(3), whose sign is fixed in book erratum 14 but still wrong in the 2021 revision;
   * the (Id_A × λ)*P_A misprint in §2.3.4.
2. **Packet-level edits (not node fields):**
   * correct the summary about M3–M5;
   * give the Faltings source entry the GDZ URL;
   * add Lan's two errata files to the Lan source entry.
3. **Owners for general noncommutative algebra:** Reiner (including Jordan–Zassenhaus, which R28.1 also needs), Herstein, Hensel's lemma and Serre's successive approximation.
4. **AbelianSchemesAndArithmeticModuli.**
   * Should A2 own the full rigidified Pic_e(A/S), theta-group splitting (Prop. 1.3.2.14) and deg f = deg f^∨?
   * Should A4 state the de Rham duality between A and A^∨ via c_1(P_A) ([BBM 5.1], [Del 1.5])?
5. **No supplier** exists for SGA 1 V (finite étale group schemes ≃ finite π_1-sets; Prop. 1.3.5.3).
6. **Scope requests for other roadmaps:**
   * R03.2: state Schlessinger Prop. 2.5(i).
   * A0-extension: own Lan's B.3.9/B.3.11 variants.
   * SF.4: promote the EXT-01 node and add EGA III 5.4.1 uniqueness.
   * R11.1: cover extension of isomorphisms compatible with polarizations, endomorphisms and level structures.
7. **Faltings' "same bad reduction" step.** Needs an owner: R28.1 or NeronModelsAndSemistableAbelianVarieties.
8. **ν_n.** Either admit the reviewer's argument as an explicit lemma node, with its own check, or find a source proving Lan's claim in Def. 1.3.6.2.
9. **Link 49 / change-of-lattice node.** Approve splitting Lemma 1.4.4.2 and Prop. 1.4.4.3 into their own node. This keeps representability independent of Cor. 1.4.3.1.

---

## 5. PadicLocalLanglandsForGL2Qp.json (R30.1–R30.6)

**Verdict: accepted, with corrections.**

| Item | Count |
| --- | --- |
| Nodes | 8: 2 verified, 6 corrected, 0 unverifiable |
| Links | 8 → 9: 3 kept, 5 annotated, 0 removed, 0 re-targeted, 1 added |
| Gaps | 3 → 8 |
| Coverage | 6 stage records, covering all six atlas stages; R30.5 status should be `partial`; `remaining` extended for R30.2, R30.4, R30.5 and R30.6 |

There is no cycle at stage or node level. The only new implied stage edge is R30.4 → R30.6, a shortcut of the atlas chain R30.4 → R30.5 → R30.6. Every `parentStageId` belongs to the roadmap, and every link endpoint exists.

### Sources and provenance

Public copies were fetched on 2026-09-23 with the prescribed User-Agent.

| Source | Copy read | SHA-256 | Against packet |
| --- | --- | --- | --- |
| Dieulefait–Pacetti | arXiv 2108.07577v2 | `0c6850da…` | identical |
| Paškūnas 2015 | arXiv 1209.5205v3 | `fce17b36…` | identical |
| Tung 2021a | arXiv 1803.07451v4 | `22017bc9…` | identical |
| Tung 2021b | arXiv 1908.06174v3 | `a601da37…` | identical |
| Hu–Tan | arXiv 1309.1658v2 (13 Nov 2014) | `d36f237d…` | packet used ASENS 48 (2015); theorem numbering is the same |
| Hu–Tan | ASENS free sample (printed pp. 1383–1385) | `9a9f54ff…` | confirms the p. 1383 notation and the p. 1384 normalisation |
| Paškūnas 2016 | arXiv 1509.00332v2 (25 Apr 2016) | `727addeb…` | packet used ANT 10 (2016); numbering is the same; arXiv §§2.1–2.3 and 3.1–3.6 are ANT 2A–2C and 3A–3F |
| Kisin 2009 | DVI at people.math.harvard.edu/~kisin/dvifiles/fmc.dvi | `663d83eb…` | identical to the library DVI |
| Kisin 2009 | free JAMS PDF | `0bb3747b…` | published version |

**Kisin DVI.** No TeX tools were available, so the reviewer read the DVI with a small DVI-opcode text extractor. That was enough to confirm numbering and wording. Kisin is not on arXiv.

**Kisin: DVI versus JAMS.** The two versions differ in three ways that matter here:

* DVI Corollary (2.2.16) and Theorem (2.2.17) are numbered (2.2.17) and (2.2.18) in JAMS. Hu–Tan and Tung cite the JAMS numbers.
* The residual exception in remark (1.2.7) is printed (ω ∗; 0 1)⊗χ in the DVI but (1 ∗; 0 ω)⊗χ in JAMS. The JAMS form was checked on the page image of p. 649.
* JAMS has footnotes 1–3 that the DVI lacks.

Publication data were checked on Crossref:

* RACSAM 117, article 153;
* Duke 164;
* ASENS 48, DOI 10.24033/asens.2272;
* ANT 10 and ANT 15;
* Math. Z. 298;
* JAMS 22.

### Main corrections

1. **Kisin's residually modular theorem was mis-stated in the hypothesis table.** The table gave it as "Theorem 2.2.17 (F totally real, p totally split, ρ̄ modular)".
   * In the DVI (pp. 45–46) Theorem (2.2.17) has three hypotheses:
     1. ρ|G_{F_v} becomes semi-stable over an abelian extension and has distinct Hodge–Tate weights;
     2. ρ̄ is modular and ρ̄|F(ζ_p) is absolutely irreducible;
     3. ρ̄|G_{F_v} ≁ (ωχ ∗; 0 χ).
   * Its proof goes through Corollary (2.2.16), which assumes (1.2.6).
   * JAMS numbers these 2.2.18 and 2.2.17. Hu–Tan (Prop. 6.2, Thm 6.3 proof) and Tung 2021a (p. 15) cite 2.2.17/2.2.18 in JAMS numbering.
2. **The Kisin R30.4 node needed four fixes.**
   * It used "type (k, τ, ψ)" and σ(k, τ) without defining them. Kisin §1.1: τ is of Galois type, the Hodge–Tate weights are 0, k−1, the determinant is ψχ_cyc, and σ(τ) is the Steinberg type for scalar τ.
   * Its "equivalently … condition (2)" is not in the source. Kisin uses the implication (semi-stable over an abelian extension ⇒ τ of abelian type ⇒ (1.2.6)) only tacitly, in the proof of Thm (2.2.17)/(2.2.18).
   * The proof step's "crystabelline up to twist … built from locally algebraic principal series" is not in the source. For irreducible V the proof of (1.2.8) consists only of citations to [BB 1 §4] and [Co 1 Thm 0.4].
   * JAMS footnotes 1 and 3 were added. They say that the revised [Co 2] asserts that (1.2.6) always holds, and that the proof then relied on Emerton's local–global compatibility. This is why Dieulefait–Pacetti credit Emerton 2011 and Paškūnas 2015 with removing the hypothesis.

   An acceptance item that implicitly took σ(k, 1) = Sym^{k−2} was also fixed: it is st ⊗ Sym^{k−2}.
3. **The Dieulefait–Pacetti use map misplaced the p = 3 use of Theorem 1.4.**
   * Paso 6 applies Theorem 1.4 only at p = 5, and Theorem 1.7 at p = 3 (p. 14).
   * The explicit p = 3 use of Theorem 1.4 is the congruence modulo 3 in the proof of Lemma 2.3 (p. 13), in step (2) of Paso 4. It can also occur in Paso 3.
   * Section 3 (p = 2) also uses Theorem 1.4.

   So Tung 2021a's new residual case cannot be avoided in the argument as written. This is now recorded in the node statement.
4. **Tung 2021b.** The link out of this node supplies Theorem 8.0.1: the support of M∞(σ°) meets every component. The proof of Theorem 8.0.3 (p. 39) uses Theorem 8.0.1, not Corollary 8.0.2. Theorem 8.0.1 was added to the node's statement and sources.
5. **Tung 2021a.** Definition 3.2 defines automorphic components as those making up the support of M∞(σ), so "meets the support" became "lies in the support". The import list gained these results used in the proofs on pp. 9–14:
   * Colmez VI.6.50;
   * Paškūnas 2013 Lemma 10.26 and Cor. B.5;
   * Böckle 2010;
   * Emerton–Gee Lemma 5.5.1, Thm 5.5.2 and Prop. 3.3.1;
   * Paškūnas 2015 Lemma 2.3 and Cor. 2.5;
   * Nekovář Prop. 1.24;
   * [BLR91].
6. **Paškūnas 2016 excerpts.** The Theorem 2.34 excerpt contained the text-layer artefact "6=" for ≠. The Theorem 2.34 and Corollary 2.38 excerpts also used "nonzero" and "semistable", which arXiv v2 spells "non-zero" and "semi-stable". The excerpts were shortened to wording common to both versions, and arXiv pages were added.
7. **Hypothesis table: three smaller fixes.**
   * Tung 2021a's introduction does not cite Khare–Wintenberger. It says only that the theorem "follows immediately from the original proof of [Kis09]".
   * The stated reason for "2 splits completely" ("p-adic local Langlands is only available for GL₂(Q_p)") is in no source read, so it was removed.
   * Hu–Tan §6 imports were added: KW II Thm 9.7 and Breuil–Mézard Thm 5.3.1(i) in Lemma 6.1, and Gee–Kisin's corrected Kisin §2.

**Confirmed drafter findings.**

* The determinant typo in Paškūnas 2016 ("the determinant equal to ψ", where ψε is meant) is also present in arXiv v2, p. 21.
* The normalisations of all six local papers are as recorded:
  * Paškūnas 2015 has det = ψ;
  * Hu–Tan, Tung 2021a and Paškūnas 2016 have det = ψε;
  * Tung 2021b has det ζε.
* The identification of Dieulefait–Pacetti's "second" and "other" hypotheses with Kisin's conditions (2) and (4) is correct.
* The two "not purely local" findings are correct:
  * the Paškūnas 2015 and 2016 and Hu–Tan proofs each use a global input of Emerton;
  * both Tung papers are proved by global patching.

### Links

* **Kept:**
  * Paškūnas 2015 → table;
  * Hu–Tan → table;
  * table → Dieulefait–Pacetti map.
* **Annotated:**
  * **Tung 2021a → table.** Theorem 4.7 has only an indicated proof.
  * **Paškūnas 2016 → table.** The exact consumer is the inequality (56) at the end of the proof of Proposition 3.26 (arXiv p. 43, ANT 3E), via Remark 2.39. This resolves the drafter's "3E located but not read" for this step.
  * **Tung 2021b → table.** The link now supplies Theorem 8.0.1.
  * **Kisin → table.** The consumer is Cor. (2.2.16)/(2.2.17).
  * **Dieulefait–Pacetti → `GL2ModularityLifting:R32.1`.** This link supplies two of the four declarations R32.1 asks for. Pan's theorem and the ordinary p = 3 theorem need other suppliers.
* **Added:** Paškūnas 2015 → Hu–Tan.
  * Hu–Tan Theorem 4.2 (arXiv p. 21) uses [26, Cor. 6.5, Thm 6.6] for ρ₁.
  * Remark 5.7 (p. 30) uses [26] for the generic split case.

### Unverifiable items

None among node claims. Two page ranges in the published editions could not be seen:

* Hu–Tan printed pages after p. 1385;
* all of Paškūnas 2016's ANT pages.

Their theorem numbering agrees with arXiv, and the excerpts were re-anchored to text that occurs in arXiv.

### Gaps added

1. Hu–Tan §6 imports: KW II Thm 9.7, Breuil–Mézard 2002 Thm 5.3.1(i), and Gee–Kisin App. B.
2. The Paškūnas 2015 §2/§5 formalism has no node. It is consumed by Paškūnas 2016 §2.3, Hu–Tan §§2 and 4, and Tung 2021a (Cor. 2.5, Lemma 2.3).
3. Cross-paper reuse has no supplier node:
   * Paškūnas 2016 Prop. 2.7 is used in Tung 2021a Thm 3.7;
   * Tung 2021a Props 2.9 and 3.4 and Cors 3.8 and 3.10 are reused verbatim in Tung 2021b §§1.3 and 6.3.
4. The general validity of (1.2.6) is not decomposed. The unread sources are Colmez's revised [Co 2] (Astérisque 330, VI.6.50), Emerton 2011 §§3.3 and 7.4, and [Ki 6].
5. The Tung 2021a and 2021b patching and ordinary-component imports are unread: [CEG+16], [Pyv18], [EP20], [WE18], [BLGG13], [EG14], [Cal12], [Sno09], [Tho12].

### Questions for the orchestrator

1. **Source records.** Should the published editions of Hu–Tan and Paškūnas 2016 (library copies) stay as the recorded sources, with arXiv v2 added as the public reading copy? Should the Kisin source record the public DVI URL together with the JAMS PDF, stating the 2.2.16/2.2.17 → 2.2.17/2.2.18 renumbering?
2. **R30.6 wording.** The stage text says "All results here remain local". This is contradicted by Tung 2021a and 2021b (global proofs) and by the Emerton inputs to Paškūnas 2015 and 2016 and Hu–Tan. Should the atlas text be amended, as the existing gap proposes?
3. **R30.5 nodes.** Should the shared intermediate results get R30.5 nodes, so that the consumers in gaps 2–3 can be linked rather than only described? These are Paškūnas 2015 Thms 2.42, 2.44 and 5.2, Paškūnas 2016 Prop. 2.7 and Thm 2.22, and the Tung 2021a §3 finiteness and faithfulness results.
4. **R32.1 suppliers.** Pan's residually reducible theorem and the Skinner–Wiles ordinary p = 3 theorem (Dieulefait–Pacetti Thms 1.6, 1.7) have no supplier in this packet. Assign them to a GL2ModularityLifting or ordinary-modularity packet.

---

## 6. PerfectoidShimuraVarieties.json (S0, S0.general, S1–S6)

**Verdict: accepted, with corrections to integrate.**

The one structural change is to re-parent the good-towers node from S4 to S2 (question 1 below).

| Item | Count |
| --- | --- |
| Nodes | 41: 23 verified, 18 corrected (29 field corrections), 0 unverifiable |
| Links | 61 → 118. Of the 61 existing links, 34 are kept as written and 27 annotated; none removed or re-targeted. 57 links added, 43 of them inside S1 |
| Gaps | 9 → 19 |
| Coverage | 8 records, one per atlas stage of the roadmap. S2, S3 and S4 change from `not_read` to `partial`. S0, S0.general, S5 and S6 now list specific remaining work |
| Structure | Re-parent 1 node: `S4/good-towers-finite-maps-and-finite-quotients` → S2 |

Cycles:

* The atlas `stageEdges` plus the stage edges implied by the drafted links: acyclic.
* With the added links: acyclic, provided the good-towers node is re-parented. Without the re-parenting, the added link from that node to the S2 good-tower node closes S2 → S4 → S2.
* No node-level cycle.

### Sources and provenance

All six sources were fetched on 2026-09-23 from public copies. Every SHA-256 equals the packet's library copy, so the drafter's page numbers apply unchanged:

* Annals: printed page = PDF page + 944.
* AIF: printed page = PDF page + 1707.
* arXiv: printed page = PDF page.

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| Scholze, *On torsion…*, Ann. of Math. 182 (2015) 945–1066 | annals.math.princeton.edu …/annals-v182-n3-p03-p.pdf | `ebac854f…` |
| Hansen–Johansson v2 | arXiv 2011.03951v2 | `0054e56b…` |
| Scholze–Weinstein v2 | arXiv 1211.6357v2 | `984411ef…` |
| Caraiani–Scholze v1 | arXiv 1511.02418v1 | `aa93df39…` |
| Boxer–Pilloni v1 | arXiv 2110.10251v1 | `85526b90…` |
| Birkbeck–Heuer–Williams, AIF 73 (2023) 1709–1794 | aif.centre-mersenne.org (open access) | `d59b7f70…` |

The Perfectoid Spaces paper (arXiv 1111.4914v1, `065441a8…`) was also fetched, only to check Th. 7.9(iii).

**Bibliographic checks.** Crossref confirmed the DOIs and volume/issue data for the Annals, CJM, Annals 2017 and AIF articles. The CS17 pages 649–766 come from the Annals article page's citation metadata, since Crossref gives none. The arXiv API confirmed the version dates: HJ v2 29 Aug 2025, SW13 v2 13 Apr 2013, CS17 v1 8 Nov 2015, BP v1 19 Oct 2021.

**Text layer.** Every excerpt occurs once the text layer is normalised. Primes render as `0` (`R00` for R′₀, `G0` for G′), ℓ renders as `` ` ``, and superscripts drop out. One Boxer–Pilloni excerpt had lost its `an` superscripts and was corrected.

**Page images checked.** Printed pp. 966, 971, 974, 977–979, 981, 983, 985–989, 993–996, 999, 1003, 1015 and 1018–1019 of Scholze; HJ pp. 33–36 and 38.

**Beyond the drafter's ranges, the reviewer read:**

* HJ §2.3 (Propositions 2.11–2.13), cited in Proposition 5.19;
* BP 4.4.41–4.4.53, for the 4.4.48 and 4.4.52 references in the S4 nodes;
* BHW §1.5, §2.2, Proposition 2.6 and §5.3;
* Scholze Chapter 1, pp. 951–952 (fake-Hasse invariants);
* SW13 §2.1, Definition 2.1.5.

### Main corrections

1. **S1 had no internal dependency graph.** No drafted link joins two of the 22 S1 nodes. They connect only to external suppliers or to S2/S3 consumers, and nine of them have no link at all. The review adds 43 intra-S1 links, each with its printed locator, for example:
   * Cor. 3.2.6 → Thm 3.2.15;
   * Lemma 3.2.10 → Lemma 3.2.13, Thm 3.2.15, Cor. 3.2.22 and Lemma 3.2.24;
   * Thm 3.2.15(i) → Cor. 3.2.19 ("By Theorem 3.2.15(i), one has a canonical identification", p. 990);
   * Lemma 3.3.6 → Lemmas 3.3.8 and 3.3.14;
   * Cor. 3.3.12 → Cor. 3.3.17;
   * Cor. 3.2.20 → Thm 3.3.18(ii).

   It also adds four external links:
   * P3 → the Γ₁-untilting node (almost purity used silently, pp. 997, 999);
   * P2 fibre products and P4 → the Siegel main theorem (Lemma 2.2.9);
   * C5 → Lemma 3.2.17.

2. **The coverage records and summary contradict the packet.** S2, S3 and S4 are marked `not_read` ("Not yet decomposed in this packet"), although 19 nodes decompose them. The summary mentions only S1.

   The drafter lists BHW §§2, 5.1–5.3, 8 and BP 4.4.38–4.4.53 as read, but none of them became a node; they are the S5 and S6 material. The records are corrected, and a replacement summary is given in the packet's `review` object (applied in the companion pull request).

3. **Placement of HJ Definition 5.12 and Proposition 5.13.** Corollary 5.15 (the S2 good-tower node) applies Proposition 5.13(1), and Proposition 5.14 concludes with "a good tower in the sense of Definition 5.12" (pp. 34–35). With the node under S4, this dependency closes a stage cycle. The node is §5.1 preparatory geometry and should move to S2.

4. **Anticanonical tower (Scholze p. 988, page image).** The node put the description "D[p] ∩ C = {0}" on the compactified piece X*_{Γ₀(p^m)}(ε)_a. Scholze states it only for the good-reduction part: there is no universal abelian scheme over the boundary. On X* he claims only open-and-closedness.

   The acceptance item also reversed the pullback. By the cartesian square of Thm 3.2.15(ii) (p. 985), level m+1 is pulled back from level m.

5. **Notation in Thm 3.2.15 (p. 983, page image).** Script X_{K_p} is the preimage of the good-reduction locus inside the adic space X^ad_{K_p}; the node read it as the whole space. The drafter's reading of "weak canonical subgroup C of level p" in (iii) as level 1 is confirmed by the proof (p. 986).

6. **Good triples.** Codimension ≥ 2 is not "essential". After Proposition 3.2.33 (pp. 1000–1001) Scholze relaxes Lemma 2.3.9 to codimension 1 when V(J) does not meet V(f), and Lemma 2.3.10 when the map is finite étale. The node had joined these two conditions with "or" into a single alternative.

7. **Hebbarkeitssatz nodes.**
   * Remark 2.3.3 says that the image of I⁺ at x ∉ Z is *nonzero*, so that its p-power-root closure is almost O_{k(x)}. The node claimed that the image itself is almost everything.
   * The smooth test f = y, I₀ = (x, y) is vacuous, because Z is empty in {|f| ≥ |t|}. It is replaced by I₀ = (x, y − 1), marked as reviewer-suggested.

8. **Lemma 3.2.24(i) (p. 996, page image).** The reduction is to an equality of O-sections, "a consequence of Lemma 3.2.10". The node wrote O⁺ and "is Lemma 3.2.10". The passage from O to O⁺ is left implicit in the source.

9. **Γ₁-untilting node.**
   * Lemma 3.2.25 starts on p. 997, not p. 996.
   * The Lemma 3.2.30 step omitted Lemma 3.2.24 and the Scholze–Weinstein category [55, Def. 2.1.5].
   * X′*_{Γ₁(p^m)}(ε) is an open subset of an adic space, not a "generic fibre".
   * The goodness that extends π_HT is that of Thm 3.2.36, not the Γ₁-level triple.

10. **Proposition 3.3.1 (p. 1003, page image).** It asserts a commuting square: Lie Ĝ ⊗ C(1) equals Lie A(1), and T_pĜ ⊗ C injects into T_pA ⊗ C. The node had only "compatible". The unsourced remark about semistable reduction was removed.

11. **Siegel §3.3 nodes.**
    * **Corollary 3.3.12 node.** The overlap argument presented as the source's ("rational-subset stability") is not in it. The source only asserts the gluing (p. 1006).
    * **Theorem 3.3.18 node.** HJ Proposition 5.14 does not use (i)–(ii). It uses Theorem 3.3.18 only for perfectoidness, then the translates of X*_{Γ(p^∞)}(ε)_a (HJ footnote 9).
    * **Proof of (vi) (p. 1015).** The drafted step copied a slip in the source: the open set |h| ≤ |p|^{C+1} is empty because it lies *in* the boundary, not because it "does not meet the boundary".

12. **HJ v2 Proposition 5.14 still asserts a Hodge-Tate map.** It states a G(Q_p)-equivariant π_HT: X*_{K^p} → Fℓ_{G,µ}, functorial in the tame level (p. 34, page image). The map is defined by composing with the map on Scholze's compactification, citing [CGH+18, Thm 3.3.1] (p. 35). The node omitted this. The v2 introduction's removal of the Hodge–Tate material (p. 5) concerns only the pre-abelian towers.

13. **BHW acceptance test contradicted the source.** The node checked "s(x) = HT(α(e₁)) is the canonical differential when α(e₁) generates µ_{p^∞}". But such points map to ∞ = (1 : 0) (p. 1722), where s vanishes (Definition 3.18). Proposition 3.21 holds only on the anticanonical locus. The test is replaced. The hypothesis that BHW write X for the "whole modular curve" is clarified: X is the whole *open* modular curve.

14. **Boxer–Pilloni nodes.**
    * 4.4.27 applies Scholze Theorem IV.1.1 without its tame-level hypothesis (level-N subgroup of the Siegel group, printed p. 1018). A hypothesis now records this.
    * One acceptance item conflated ω_A with det ω_A.
    * The Siegel identification M_HT = M_dR (4.4.8) and its toroidal extension are asserted without proof or citation (gap).

15. **HJ §5.3.**
    * The statement of Proposition 5.16 conflated the complex numbers with the p-adic field C (p. 35).
    * HJ's π₀ formula G(Q)₊\G(A_f)/K^p omits the closure of G(Q)₊, which BP 4.4.48 (p. 83) write explicitly.
    * Definition 5.17 takes arithmetic Γ ⊆ G^ad(Q)^+ but forms towers for G (page image, p. 36). The proof of Proposition 5.18 uses Γ ⊆ G(Q)^+ and asserts the connected-case identification without argument.

**Confirmed drafter findings.**

* The ε < 1/2 bounds.
* The constants p^{n−(2n+1)ε} and p^{−(g²+g+1)ε/p^m} (page images, pp. 993–995).
* Level p in Thm 3.2.15(iii) means level 1.
* HJ Theorem 5.20 prints "K^p ⊆ G(A_f)" (page image), a misprint for G(A_f^p).
* The v2 revision removed the Hodge–Tate map for pre-abelian towers.
* The Zariski-closed boundary of Theorem 1.5 is not argued separately in HJ §5.

**New source misprints (for the errata register).**

* Scholze p. 986: "degree g(g+1)/2" should be p^{g(g+1)/2}.
* Scholze p. 999: "Y*_m \ ∂" should be Y*_∞.
* Scholze p. 1015: the "does not meet the boundary" slip.
* HJ p. 36: the π₀ formula without the closure.
* HJ p. 36: the G^ad/G mix in Definition 5.17.

### Links

**Kept as written (34), including:**

* the P1 tilting, P1 almost-integral, P3 almost-purity and P2 rational-localization suppliers;
* PadicHodgeTheory P8 affinoid perfectoid basis → Lemma 3.3.4;
* every Scholze-internal S1 → S2/S3 link;
* B2 → Levi-torsor node;
* D4 → pre-abelian definition;
* the HJ-internal S4 links.

**Annotated (27).**

* **P7 link.** The Frobenius-tower criterion is proved in place (Cor. 3.2.19), not imported. P7 must still export SW13 Def. 2.4.1 and Props. 2.4.2 and 2.4.5.
* **P2, P4 and C5 links.** Some cited locations belong to other nodes: Lemma 2.2.9 belongs to Thm 3.3.18(ii), and Lemma 3.2.17 to the deep-level node.
* **M4 link.** It also supplies the étaleness and the degree p^{g(g+1)/2} of level maps.
* **T2 → S1.** T2's description covers the relative Hodge–Tate sequence and the flag-valued map. The primitive comparison is T1/P8 material.
* **P4 → Theorem 4.1.1.** Lemma 2.2.2 is not transcribed by any P4 node.
* **HJ Lemma 5.6 → Proposition 5.14.** Analytic separatedness is a hypothesis of Theorem 5.8, not a good-tower condition.
* **P8 links.** [BS19, 1.16(1)] has no supplier node, and Theorem 5.8 avoids the invariant-cover hypothesis in P8's description.
* **D4 and V8 → Hodge-type set-up.** Scholze's (G, D) → Sp_{2g} convention is not D4's Deligne-style one, and [Del71, 1.15] is not in V8.
* **CS17 links.** The Siegel-valued π_HT comes from the Theorem 4.1.1 node, and the transfer "works verbatim" is unproved. T2 and the S3 nodes both transcribe CS17 §§2.2–2.3.
* **BP 4.4.29.** It consumes CS17 Proposition 2.3.9 (the Levi-torsor node).
* **C3 → Siegel toroidal node.** C3 supplies only level maps for a fixed fan. The toroidal space is C2, A_Σ is C4/C5, and [DLLZ19] is T6:log-sites.
* **TC.1 and IG.3 links.** These are scope notes.

**Added (57):**

* 43 inside S1, and 4 external links into S1 (item 1);
* the Proposition 3.3.1 node → the Theorem 3.3.18(v)–(vi) node;
* the Hodge-type set-up → HJ Proposition 5.14 and → CS17;
* Theorem 4.1.1's π_HT → CS17 Theorem 2.1.2 and → BP 4.4.27;
* Levi-torsor node → BP 4.4.29;
* the Siegel main theorem → BP 4.4.10;
* good towers → HJ Corollary 5.15 (needs the re-parenting);
* DiamondsAndVStacks D5 → HJ Lemma 5.1 ([Sch17, 11.23(iii), 11.27]);
* D4 → Proposition 5.13 ([Sch17, 11.11]).

New stage edges (all acyclic once the good-towers node is re-parented):

* PerfectoidSpaces P1, P2, P3, P4 → S1;
* T2 → S1;
* PadicHodgeTheory P8:local-rational → S1;
* P4 → S2;
* S1 → S3;
* B2 → S3;
* C3 → S3;
* ShimuraData D4 → S4;
* DiamondsAndVStacks D5 → S4;
* DiamondsAndVStacks D4 → S2.

### Unverifiable items

None among the node claims. Every node's cited passage was read in a public copy identical to the drafter's.

The following imports were not read. They are recorded as gaps, not treated as inputs:

* **Scholze:** Illusie; Faltings–Chai; [54] Props. 2.22, 4.10, 4.15; FGL; [53, Th. 1.3]; SGA2; Huber.
* **CS17:** [Sch13c 8.8, 7.9]; [Bla94]; [Kis10]; [Del82]; [Mil90]; [Del71].
* **BP:** [PS16]; [DLLZ19]; [Lan20]; [EH19]; [MP19].
* **HJ:** [CGH+18]; [Han16]; [BS19]; [KL15]; [Sch17]; [CGJ19]; [Bor63]; [PR94]; [Del79].

### Gaps added (10)

* Lemma 3.2.10's "standard" flatness of the Hasse blow-up;
* [55, Def. 2.1.5] in Lemma 3.2.30;
* Stacks Tag 07LU in Lemma 3.2.21;
* HJ Proposition 5.14's π_HT via [CGH+18, Thm 3.3.1];
* the transfer of Theorem 4.1.1 to Deligne-style data over E_p (CS17 footnote 8);
* CS17 §2 imports;
* BP §4.4 imports and the uncited Siegel identification M_HT = M_dR;
* HJ §§2.3 and 5 imports;
* Zariski-closedness of the infinite-level boundary (HJ Theorem 1.5);
* HJ Definition 5.17 and the connected case of Proposition 5.18.

### Questions for the orchestrator

1. **Re-parent the good-towers node** (HJ Definition 5.12 and Proposition 5.13) to S2, or move it to PerfectoidSpaces P8, whose description matches it. Either way, record Corollary 5.15's dependence on it.
2. **Owner of CS17 §§2.2–2.3.** T2's description claims the Hodge–Tate parabolic reduction, the Levi-torsor comparison and the tensor-cut flag variety, but T2 has no nodes. The two S3 nodes transcribe the same argument. Decide which one owns it.
3. **The atlas S1 dependency on T4.** No S1 node uses it: Scholze builds his integral canonical subgroups in §3.2.1. Keep it, or drop it from S1's `requires`.
4. **Extend the S4 warning to S2.** Hansen–Johansson must not be cited for a Hodge–Tate map on pre-abelian towers; the same should be said for Hodge type. Proposition 5.14's π_HT is only a citation of [CGH+18].
5. **Supplier requests:**
   * P7: SW13 Def. 2.4.1 and Props. 2.4.2 and 2.4.5.
   * P4: torsion-paper Lemmas 2.2.2–2.2.9.
   * P8 or PerfectoidQuotients: [BS19, Thm 1.16(1)] and [Han16, Thm 1.4].
   * DiamondsAndVStacks D4/D5: ECD 11.11, 11.23(iii), 11.27. The ECD numbering is taken from HJ and not checked against ECD.
   * T6:log-sites: [DLLZ19].
6. **Assign S5 and S6.** Assign the decomposition of BHW §§2, 5.1–5.3 and 8 (S5) and of BP 4.4.38–4.4.53 (S6), all read by the drafter but not decomposed.
7. **Errata register.** Forward the five new source misprints and the confirmed HJ Theorem 5.20 misprint.

---

## 7. PotentialAutomorphyInfrastructure.json (PA.0–PA.5)

**Verdict: accepted.** One node corrected; one link and three gaps added.

| Item | Count |
| --- | --- |
| Nodes | 15: 14 verified, 1 corrected, 0 unverifiable |
| Links | 37 → 38: 32 kept, 5 annotated, 0 removed, 0 re-targeted, 1 added |
| Gaps | 9 → 12 |
| Coverage | 6 stage records, covering all six atlas stages; statuses are accurate; `remaining` notes for PA.0, PA.3 and PA.4 |

There is no cycle.
* The links imply ten new stage edges:
  * AS.5 → PA.0;
  * G7 → PA.4;
  * P8 → PA.3 and P8 → PA.4;
  * R03.2 → PA.4;
  * R03.6 → PA.3;
  * PA.0 → PA.4;
  * three edges from the tauceti:TauCetiRoadmap Chebotarev and ProfiniteCohomology layers into PA.4.
* Their union with the atlas `stageEdges` is acyclic.
* Every endpoint exists, as an atlas stage or as a node of the promoted DeformationAndDerivedPatchingAlgebra and ArithmeticGaloisRepresentations packets.
* Every `parentStageId` belongs to the roadmap.

### Sources and provenance

| Source | Copy read | SHA-256 | Notes |
| --- | --- | --- | --- |
| ACC+ | arXiv 1812.09999v2 (16 Jun 2022, "accepted version") | `7c882c4d…` | Annals 197(3) (2023) is not yet public |
| Calegari–Geraghty | arXiv 1207.4224v2 (16 Jul 2017, "accepted version") | `67896c85…` | Invent. Math. 211 (2018), no. 1, 297–433 (Crossref); the packet's source entry lacks volume and pages |

**ACC+: arXiv versus the Annals.**
* Pagination is the same through §6.5 (arXiv page = printed page − 896), and about one page later in §6.6.
* From the Presentations subsection of §6.2 onward, arXiv's numbers are one lower than the Annals numbers used by the packet and by the atlas G7 text. Examples:
  * Prop. 6.2.24/6.2.25;
  * Lemmas 6.2.25–26/6.2.26–27;
  * Def. 6.2.28/6.2.29;
  * Lemma 6.2.31/6.2.32;
  * Prop. 6.2.32/6.2.33.
* All other numbering agrees.

**Calegari–Geraghty.** The theorem numbers agree. The subsections differ: arXiv puts Conjecture B in §9.1 and Theorem 9.19 in §9.3, where the packet has §9.3 and §9.5.

**Read by the reviewer:**
* ACC+:
  * §1 (pp. 1–3);
  * Thm 2.3.5, Def. 2.3.6, Thm 2.3.7;
  * Thm 2.4.10 with proof;
  * Lemma 2.1.7;
  * the definition of d in §4.3;
  * Thm 3.1.1;
  * all of §6.1–§6.6.1, and the proof of Thm 6.6.2.
* CG:
  * §1 (pp. 1–4);
  * Thm 6.4 and Prop. 6.6;
  * §9.1 (Conjecture B, Remarks 9.2–9.5);
  * §9.3 (Theorem 9.19 with proof).

### Confirmed drafter findings

* **The three ACC+ misprints are also in arXiv v2.**
  * "g = qn − n[F⁺:Q]" appears on arXiv pp. 174 and 186.
  * "/(λ)" appears in the ordinary component lemma (p. 147).
  * The surjection R_∞ → R_N is cited as "Proposition 6.2.31" (arXiv p. 173) and as "Proposition 6.2.32" in the Annals. Both are the number of the existence *Lemma*, not the presentation *Proposition*. So the slip predates the Annals renumbering.
* **Dimension counts.** These were recomputed independently.
  * FL case: dim R_∞ = dim S_∞ − l₀.
  * Ordinary case: dim S_∞ = n²|S| + nq + 2n[F⁺:Q] and dim R_∞ = dim S_∞ − l₀. Small components have dimension at most dim R_∞ − 2.
  * Both worked numerical checks are correct.
* **Implicit steps (a)–(d).** These are correct:
  * minimal primes of A[[X]] are P[[X]];
  * complete local domains are catenary, so R_∞/ϖ has pure dimension dim R_∞ − 1 over an equidimensional R_∞;
  * the top-degree Tor argument of Cor. 6.3.9 applies;
  * H*(C₀) and H*(X_K, V_λ(1))_m have the same support by universal coefficients.
* **Implicit step (e).** This is sharpened. The only d defined in ACC+ is d = n²[F⁺:Q] (§4.3, arXiv p. 77), which puts the rational cohomology of C₀ in [q₀+1, q₀+l₀+1]. With d = dim_R X_K = 2q₀ + l₀, the printed [q₀, q₀+l₀] is exact. Either way the interval has length l₀, which is all Assumption 6.3.6(3) needs.

### Main corrections

1. **The CG comparison node omitted Conjecture B(2).** B(2) is the Taylor–Wiles local type at v ∈ Q. Its ACC+ replacement is Prop. 6.5.11: Thm 3.1.1 at v ∈ Q plus [BC09, Prop. 1.5.1], which this packet itself decomposes. B(2) has been added to the statement and to the acceptance table.
2. **The coefficient ring of r_m was overstated.**
   * Conjecture B asks for r_m with coefficients in the Hecke algebra itself.
   * ACC+ Thm 2.3.7 gives it only modulo a nilpotent ideal J with J^δ = 0.
   * The statement now says this, and adds that (4)(b), boundary vanishing, is also not proved by ACC+.
3. **Excerpt and citation fixes in the same node.**
   * The Conjecture B(4)(a) excerpt ("Hψ (Y1 (Q), O/ )m …") was text-layer debris. It is replaced by "vanish unless i ∈ [q0, . . . , q0 + l0]." (arXiv p. 86).
   * "ACC+ §6.4.17" is Proposition 6.4.17.
   * CG's near-faithfulness step cites [Tay08, Lemma 2.2] in arXiv v2. The packet's "[11, Lemma 2.2]" could not be matched: entry 11 of the arXiv bibliography is Carayol 1994.

### Links

* **Annotated:**
  * **AS.5 → PA.0.** This covers Franke's comparison, but not the Franke–Schwermer decomposition.
  * **P8 → ordinary implication.** Λ must be a power series ring over O (§6.3.5, §6.4.1). This is not stated in the source for ⊗̂Λ_v.
  * **R03.6 → comparison.** The R03.6 node states CG Thm 6.4's content.
  * **Chebotarev layer 10 → existence lemma.** Density one of degree-one places is missing from the layer.
  * **ProfiniteCohomology layer 9 → existence lemma.** The Kummer descent is done in ACC+ itself.
* **Added:** Taylor–Wiles datum → auxiliary-level Galois representation. The proof of Prop. 6.5.11 (arXiv p. 172) checks O[Δ_v]-linearity against the §6.2.18 structure.
* **Kept:** all other links. Direction and consumer location were confirmed for each.

### Gaps added

1. [NT16, Thm 4.2] is cited for the formula for r_ι(M) in the proof of Thm 2.4.10 (arXiv p. 54). It is unread.
2. The Scholze Thm 2.3.7 gap should also name the auxiliary-level node: the proof of Lemma 6.5.8 uses ρ_m and its local–global compatibility at v ∈ Q.
3. A source-version record, listing three excerpts whose Annals or Inventiones wording could not be re-seen:
   * "Sect. 7.1" (arXiv: "Section 7.1");
   * the Annals numbering inside the Prop. 6.2.33 excerpt;
   * the Annals page of the §6.6 g-misprint (p. 1081 in the packet; arXiv p. 186).

### Unverifiable items

None among the mathematical claims.

### Questions for the orchestrator

1. **Source records.** Should arXiv v2 be recorded alongside the library copies as the public reading copies? The Annals ACC+ copy is not public until 2028. Should CG's entry gain volume 211 and pages 297–433?
2. **Stage ownership.**
   * [NT16, Thm 4.2]: AG2.7 or IntegralHeckeAndGaloisDeterminants.
   * Density one of degree-one places: the Chebotarev layer.
   * The Λ-is-a-power-series-ring step in the ordinary case: PA.4, or LocalGaloisDeformationRings L8.
3. **Implicit-steps gap.** Close items (a)–(d) as reviewer-verified, and replace (e) with the sharpened statement above.

---

## 8. PotentialModularityAndCompatibleSystems.json (R23.1–R24.6)

Reviewer: REVIEW-EXT-12. Date: 2026-09-24. Packet: `research/expansion/external/EXT-12/PotentialModularityAndCompatibleSystems.json`.

**Verdict: needs changes.** No node is unverifiable. 28 of the 34 nodes need the corrections listed in the packet's `review` object (applied in the companion pull request), and five coverage records describe work as "not yet transcribed" that the nodes already contain. Once the corrections are applied, the packet is sound. The remaining open items are gaps, not errors.

| Item | Count |
| --- | --- |
| Nodes | 34: 6 verified, 28 corrected, 0 unverifiable |
| Links | 63 → 69: 39 kept unchanged, 19 annotated, 1 re-targeted, 4 removed, 10 added |
| Gaps | 20 → 40 |
| Coverage | 13 records, which is every atlas stage of the roadmap. All `stageId`s exist and belong to the roadmap. 5 `remaining` lists are stale, 2 `not_read` statuses understate what was read, and 1 record is adequate as it stands. |

The 47 field corrections are: statement 7, hypotheses 11, proofSteps 11, acceptance 12, sources 6.

**Cycles.** None. The check used the atlas `stageEdges` (identical to `research/blueprint/atlas/stage-edges.json` plus 50 more), together with the stage edges implied by every link of this packet and by every promoted packet. It was run twice: on the packet as drafted, and after the removals, the re-target and the additions recommended here. Two other things were confirmed:

- The node-level link graph is acyclic.
- The only strongly connected components in the union lie in other roadmaps. One of them is relevant: an R03.4 ↔ R03.5 loop inside the promoted DeformationAndDerivedPatchingAlgebra packet (see supplier question 7).

### Method

- Nodes 0–9, 10–23 and 24–33 were checked in three parallel passes. The cross-roadmap links, coverage, gaps and cycles were checked centrally.
- Every excerpt was compared with the text layer after normalising whitespace, ligatures, diacritics and hyphenation.
- Every displayed condition, inequality and matrix that a node depends on was read on a page image rendered with pymupdf. This matters for three sources:
  - Moret-Bailly II is an OCR scan that drops Σ, Ω and ≤.
  - Taylor's preprint loses Greek letters, digits and reference numbers.
  - KW I and KW Annals print ≠ as `6=` and primes as `0` in pdftotext-type layers.
- Supplier links were judged against the supplier's text in `data/atlas.json`, or against the promoted node itself where the supplier is a node.

### Sources and provenance

All eleven sources were re-fetched on 2026-09-23 from the packet's public URLs (User-Agent `tauceti-worker`). Every SHA-256 matches the packet. Publication data were checked on Crossref and with the arXiv API.

| Source | Version read | SHA-256 |
| --- | --- | --- |
| Moret-Bailly, Skolem II | Numdam scan, Ann. ENS 22 (1989) 181–194, DOI 10.24033/asens.1582 | `fcd52552…` |
| Moret-Bailly, Skolem I | Numdam scan, 161–179, DOI 10.24033/asens.1581 | `b1bec60b…` |
| Taylor, Fontaine–Mazur | Stanford preprint `fm.pdf`, dated May 23, 2000 (title-page image); printed page = PDF page − 1 | `e00ebd58…` |
| KW II | UCLA `proofs.pdf`, 98 pp.; Invent. 178 (2009) 505–586, DOI 10.1007/s00222-009-0206-6 | `53f45f8b…` |
| KW I | UCLA `results.pdf`, 23 pp.; Invent. 178 (2009) 485–504 | `3c389dc3…` |
| KW Annals | Ann. of Math. 169 (2009) 229–253, DOI 10.4007/annals.2009.169.229 | `154c0c2a…` |
| Böckle appendix | 7-page author copy; appendix to Khare, Invent. 154 (2003) 199–222 | `67de08f6…` |
| Taylor, meromorphic continuation | EMS Press file, Doc. Math. Extra Vol. Coates (2006) 729–779, DOI 10.4171/dms/4/22 | `6ec26bfc…` |
| Gee | arXiv:0810.1877v2 (latest); Math. Ann. 350 (2011) 107–144 | `add03b17…` |
| Snowden | arXiv:0905.4266v1 (only version; no journal record found) | `b0c0008a…` |
| Dieulefait–Pacetti | arXiv:2108.07577v2, 3 May 2022 (the unversioned URL serves v2); RACSAM 117 (2023) | `0c6850da…` |

**Source-entry fixes.**

- The Dieulefait–Pacetti edition should state v2.
- The Snowden `readSections` says "(A1)–(A5)", but p. 6 lists (A1)–(A7). Node 33 uses only (A1)–(A2).
- The Taylor 2006 erratum and the KW papers cite Taylor 2002 by JIMJ page numbers (130, 135, 136, 137). Each cited passage was located in the preprint and agrees with it; the JIMJ text itself was not obtained.

**Beyond the drafter's ranges, the reviewer read:**

- Moret-Bailly II pp. 181–194 on page images;
- KW II 3.2.3–3.3.4 (pp. 24–37), 8.3.3, 10.2 and 10.3.2;
- KW Annals Theorem 4.2 with proof, and the §3 bibliography;
- Taylor 2006 pp. 734–737, 759–763, 767–771 and 776–777 (page images), plus its bibliography;
- Taylor 2002 printed pp. 4–16 and the reference list, on page images;
- Gee Proposition 3.1.5 and Snowden §§6.1–6.4.

### Main corrections

1. **Remarque 1.5 was mis-transcribed** (Moret-Bailly II p. 182, page image). The source reads "K′ ⊗_K L_v est un produit de copies de L_v". The Skolem-datum and Théorème 1.3 nodes wrote K′ ⊗_K K_v. That forces every completion of K′ above v to equal L_v, which is strictly stronger than Définition 1.2 unless L_v = K_v.
2. **Other Moret-Bailly details.**
   - Lemme 3.10.3 (p. 193) asserts quasi-compactness of H_1 = (R′ ⊗ K_Σ)^×/R′^×, a stronger statement than for H.
   - In 3.6 the source prints "U^(d)" where X^(d) is meant; the node's step was garbled.
   - 3.5 imports EGA IV 3.3.1, which the node did not name.
   - The proof of Lemme 2.2 applies Lemme 2.1, which is stated for discrete valuations and completions, at every v ∈ Σ. That includes archimedean v and points over L_v. Neither case is argued (gap added).
   - The source's "(1.7)" before Lemme 2.2 should be 1.9.
   - All inequalities are as the drafter read them: d ≥ 2g+z−1 in 3.6, 3.7.2(i) and 3.8; d ≥ 2g+z in 3.7.2(ii) and 3.9(i).
3. **Linear disjointness.**
   - KW Annals (p. 234) do not use KW II's split-primes device. They cite "Proposition 2.1 of [23]", where [23] is Harris–Shepherd-Barron–Taylor (bibliography checked); this is unread (gap added).
   - KW II's F must be Galois, so the node now includes the Galois-closure step.
   - Local points X(Q_q) at the added primes are never shown to exist (gap added).
4. **Taylor 2006 erratum slip** (p. 776, second bullet). It prints "β_vβ_v^c = ψ(φ_v)ψ^c(φ_v) = p". Since (1+√(1−4l))/2 has norm l, the value is #k(v), a power of l. What the argument uses is that β_v − β_v^c is prime to p. The packet had copied "= p" without comment.
5. **Taylor 2002, section 1** (page images).
   - Lemma 1.1 takes L as given and yields only a *finitely ramified* ψ at w_1. The unramifiedness asserted on printed p. 9 is not derived (gap added).
   - Lemma 1.5's proof prints "χ₁|_{I_x} = ω". With χ₁|_{I_x} ∼ ε^{−n} and n = 1 this must be ω^{−1} (printed pp. 14–15).
   - E_x ≅ Q_p is not conditional: the third condition on p forces p to split completely in F.
   - The fifth excerpt of node 19 ("to deduce that T A is modular") is the T_℘A clause, not the T_λA clause.
   - Lemma 1.2's acceptance item had put the trivial character on the multiplicative part; that part carries ε_p.
6. **Lemma 1.4 test field.** The acceptance item used Q(√5) to exhibit the error in Taylor's printed proof. But d = ((5+√5)/2) has a totally positive generator, so (d⁻¹)⁺ ≅ O⁺ there and the test cannot detect the error. Q(√3) can: its different is (2√3) and every unit has norm +1.
7. **Taylor Theorem 1.6 and Corollary 1.7** (printed pp. 15–16).
   - The Corollary 1.7 refinement concerns (χ_{v,1}, *; 0, χ_{v,2}) with (χ_{v,2}χ_{v,1}^{−1})|_{I_v} = ε^n and controls only χ′_{x,2}.
   - Lemma 1.5's range 0 ≤ n < l−1 is automatic, and "not scalar" implies n ≠ 1, so no hypothesis is missing.
   - The acceptance example det ρ̄ = εω² contradicts the local hypothesis at l.
   - The soluble-image branch is only cited ([Tu], [RT]) (gap added).
8. **Taylor 2006 §§4–5.**
   - The c-invariance of the CM point uses the second relation, the one involving μ (p. 762).
   - Proposition 4.1 also uses, without argument, the modularity of Ind χ_{℘1} and that F can be taken Galois of even degree (gap added).
   - Theorem 5.7 rests on a chain through Lemmas 1.3, 5.3, 5.6, Corollaries 5.2 and 5.5 and [SW1] (gap extended).
   - L22's Moret-Bailly application belongs to Proposition 4.1, so L22 is re-targeted there.
9. **KW II Theorem 6.1.**
   - The node said part (iii) was "recorded under R23.5", but no R23.5 node exists. (iii)(a)–(d) are now stated with their status.
   - The import list lacked [23], [34], [47], [56] and the Taylor lemmas used.
   - KW II p. 55 asserts the dyadic local points "as for p ≠ 2", but Taylor's local lemmas assume l odd (gap added).
10. **KW Annals Theorem 2.1** (p. 235, page image).
    - The shape is (χ|_D^{−1}χ̄_ℓ, *; 0, χ|_D); the node's version had the wrong determinant.
    - "[45]" is SW IHES 89. Taylor 2006 p. 769 attributes the same statement to [SW1], which is KW Annals [44]; so [45] is probably a misprint.
    - In the supersingular case, (ii) is Taylor 2006 Corollary 5.5, not Theorem 5.7.
    - One excerpt carried the pdftotext artefacts "6=" and "`".
11. **KW II Theorem 10.1** (p. 91).
    - π₁ and π₂ land in the framed rings.
    - As printed, β: R_F → R_{Q,S} and α do not exist in characteristic 0 once S contains a semistable-type place, which 10.1 allows (Theorem 3.1, 3.3.4): such lifts stay ramified over every finite extension. Condition (4) concerns τ mod p only.
    - The proof needs, and justifies, only R̄_F → R̄_{Q,S}/(p), which is exactly how KW Annals Proposition 3.8 is phrased. Node corrected and gap added.
12. **KW Annals Proposition 3.8** (p. 242) gives a mod p morphism φ: R^{univ,F}/(p) → R^univ/(p), not a surjection. The node said "maps onto".
13. **Gee and Snowden.**
    - Gee's (ord) requires f to be potentially ordinary "at all places in Z" (p. 9), not "exactly" there.
    - Snowden's ψ must be unramified outside Σ (p. 20).
    - Snowden's (A2) "= 4" and Gee's "≠ 2" are both transcribed correctly.
14. **Böckle.**
    - Lemma 1's contradiction is now stated as printed: almost all fibres of h are finite, so V^flat would be a finite union of fibres, which contradicts surjectivity onto m.
    - The imports are now named: DDT §2, Böckle 1999 Thms 2.4 and 3.8, Lemma 3.10 with Remark 3.11, Conrad §§4–5 and Ramakrishna's thesis.
    - The drafter's "Krull intersection → height theorem" remark is confirmed.
15. **KW I Theorem 5.1 and link L57.**
    - One acceptance item combined q = 7 with v₂(q+1) = 1, which q = 7 does not satisfy; it is now split into a q = 7 computation and a q = 5 check.
    - L57 pointed the wrong way. KW II 10.3.1 proves KW I Theorem 5.1's lift (KW I p. 9: the proof "is postponed to the second part"; KW II p. 92). It is replaced by node 30 → node 29.
16. **Excerpts.** Six excerpts in nodes 27–30 had `0` where the source prints a prime (E′, R′, O′, χ′). The literal text is restored.
17. **Acceptance items.** Twelve were corrected across the packet; items 1, 6, 7 and 15 above include examples. In each case the item was either wrong, trivially true, or impossible to test as stated.

**Drafter findings confirmed.**

- The "3.30.2" misprint (G2).
- KW II's "(c)" should be (iii)(b) (G12).
- The atlas pins R24.3 to "KW Annals §5.2", but no such lifting section exists; the only "§5.2" is the remark in Khare–Ramakrishna (G16, bibliography checked).
- Pointing a Böckle link from R26.1 into R24.3 would close the cycle R24.3 → … → R24.6 → R26.1 (G17).
- The deduction of Theorem G from Théorème 1.3 is written nowhere (G0).
- The Taylor 2006 corrections for det ρ̄ = ε and for Lemma 1.4 (p. 776–777, page images).

### Links

**Removed:**

- **L12, R09.3 → elementary reductions.** Remarque 1.4 uses Chow's lemma for schemes. Algebraic spaces appear only in an unused aside, and R09.3's text names neither Chow's lemma nor Knutson's version.
- **L48, R19.6 → Theorem 10.1.** R19.6 is used only inside Propositions 9.2–9.3, which L45 already covers. The direct input is ρ_{π′}, supplied by R19.2 (link added).
- **L55, R03.6 → local conditions.** R03.6 (support transport) does not state KW II Proposition 2.2 (gap added).
- **L57.** Reversed; see correction 15.

**Re-targeted:** L22 now points to the Taylor 2006 Proposition 4.1 node.

**Annotated:**

- **L2, L3.** Lemme 2.1's scope; the "(1.7)" misreference.
- **L10.** Taylor's reference [M] is on printed p. 21, not p. 20.
- **L11.** The consumer needs Théorème 1.3 with open sets, not only Theorem G.
- **L23, L24 (H6).**
  - H6's "Isom torsor" twist covers Taylor 2002's X.
  - It does not name Taylor 2006's unit-multiplier twist ψ in H¹(G_Q, Γ), and b₀ there involves three residue characteristics (gap added).
  - The P(A,i) definitions come from H1, not H6 (link added).
- **L27.** ψ̄ differs at the two places above x | p by ramification, not by Frobenius.
- **L31.** KW II uses the internals of Taylor's proof; the direct application of Theorem 1.6 proves (iii)(c).
- **L34.** Supersingular (ii) is Taylor 2006 Corollary 5.5.
- **L37, L38 (R17.5).**
  - Langlands–Tunnell is in scope.
  - The weight ≥ 2 passage (Serre p. 220) and Gross/Coleman–Voloch are not.
  - Automorphic induction of an infinite-order algebraic character over a totally real E is not stated.
- **L39 (R21.6).** SW Nearly ordinary Theorem 5.1 is a residually *irreducible* theorem, whereas R21's summary scopes R21 to residually reducible and level-one branches. R22.5 is an alternative owner.
- **L40.** Hida [30] §8 is in scope; Khare's neatness lemma is not.
- **L42, L43.** Condition (4) is mod p only. Theorem 8.2 and Khare's Lemma 4.2 are co-inputs.
- **L45.** Proposition 9.2 is R22.5 material; the export must state conclusion (II).
- **L50.** The link's own locator should read 10.3.1, p. 92.
- **L52.** Wiles' formula and Poitou–Tate belong to R04.3/R04.6 (link added).
- **L62.** The Kisin fixed-type rings must be in R08.6's export.

**Kept, supplier checked:** L44, L46, L47, L53, L54, L60 and L61. The promoted supplier nodes R03.4/finiteness, R03.4/characteristic-zero-points and R03.2/presentation were read against KW Annals Lemma 3.6 and KW II Proposition 4.5, Lemma 4.6 and Corollary 4.7.

**Added** (in the extra key `linksAdded`):

1. Théorème 1.3 → linear disjointness.
2. Generalized Picard → quasi-compactness.
3. Taylor Lemma 1.2 → KW II Theorem 6.1.
4. Taylor Lemma 1.5 → KW II Theorem 6.1.
5. Taylor Lemmas 1.3–1.4 → KW II Theorem 6.1.
6. Taylor Lemma 1.2 → KW Annals Theorem 2.1.
7. KW II 10.3.1 → KW I Theorem 5.1.
8. HilbertModularVarietiesAndShimuraCurves:H1 → M-HBAV node.
9. AutomorphicGaloisRepresentations:R19.2 → Theorem 10.1.
10. GlobalGaloisDeformations:R04.6 → characteristic-zero-points node.

The new stage edges implied by the added links are H1 → R23.2, R19.2 → R24.1 and R04.6 → R24.2; all are acyclic.

### Coverage

Every record names a real stage of this roadmap, and all 13 stages are covered.

- **Stale `remaining` lists.** R23.2, R23.3, R24.1, R24.2 and R24.3 say material is "read but not yet transcribed into nodes" when nodes 10–33 transcribe it. Replacement items are in `coverageNotes`.
- **Understated statuses.**
  - R23.4 is `not_read`, but KW II Theorem 9.7 and Taylor 2002 Theorem 2.1 with proofs were read.
  - R23.5 is `not_read`, but KW II Theorem 6.1(iii) was read, and parts of it are decomposed under R23.1 (node 9) and R24.1 (node 25).
- **Obligations in the R24.3 stage text with no node:** "auxiliary good-dihedral applications used in §§8–9" and "the local-at-2 cases".
- **Packet summary.** It still describes only R23.1.

### Unverifiable items

None among the node claims. These facts about sources could not be settled:

- The published JIMJ text of Taylor 2002 was not obtained. It was checked only through the page references in the erratum and the KW papers, and those are consistent with the preprint.
- The Inventiones pagination of KW I and KW II was not compared.
- Lemma 4.2 of Khare [33] (Duke 134). arXiv math/0504080 has only v1, and Khare's UCLA page does not carry the paper. KW II gives the page range 534–567, KW I and KW Annals give 557–589; add this to G13.
- Whether KW Annals' "[45]" means [44]. The content strongly indicates it, but the paper cannot settle it.

### Gaps added (20)

- **Moret-Bailly.** Lemme 2.1 applied beyond its scope; local points at the extra split primes; HSBT Proposition 2.1 unread.
- **Taylor.**
  - Soluble branch of Theorem 1.6.
  - The Taylor 2006 §5 chain behind Theorem 5.7 and the supersingular weight-two statement.
  - Skinner–Wiles base change ([44] or [45]).
  - Modularity of Ind χ and the Galois/even-degree field in Proposition 4.1.
  - Unramifiedness of ψ at w_1 after Lemma 1.1.
- **KW II Theorem 6.1.** Dyadic local points.
- **KW II §§2–4 and 10.**
  - β and α exist only mod p.
  - Proposition 3.2(i) for factors not known to be domains.
  - Unnamed imports of Proposition 4.5 and Lemma 4.6: Kisin 3.2.2, DDT 2.17/2.19/2.43, NSW 8.6.7–8.6.8.
  - §§2.7–2.8 (Propositions 2.10–2.12).
  - The compatible-system half of KW I Theorem 5.1 (10.3.2).
- **Other sources.** Böckle's imports; the inputs of Snowden Theorem 6.1.1 and Gee Proposition 3.1.5.
- **Missing suppliers.**
  - Chow's lemma.
  - KW II Proposition 2.2.
  - Chebotarev and class field theory, which the README says to take from existing owners; none is linked.
  - H6's multiplier twist.

**Existing gaps.**

- G15 and G18 can be narrowed. The reviewer read the bodies of KW II 3.2.3–3.3.4 and found the type-to-ring dictionary consistent with them. What remains unread is Savitt 6.22/6.24, Berger–Li–Zhu, Fontaine–Laffaille ([49]/[20]) and KW II §§2.7–2.8.
- G9's detail contains a reference-library path (`references/papers/SS_SkinnerWiles2001.pdf`), and G13, G18 and G19 name library file names. Replace them with catalogue ids.

### Supplier questions for the orchestrator

1. **HilbertModularVarietiesAndShimuraCurves H6/H1.**
   - Export twists by H¹(G_Q, Γ) including the unit multiplier, and quasi-projectivity of the twisted moduli.
   - Decide who owns the local points (G6).
   - H1 should export the ordered-module P(A,i) definitions.
2. **GL2AutomorphicRepresentationsAndTransfer R17.5.** Export automorphic induction, over totally real fields, of algebraic Hecke characters of CM quadratic extensions, with the Galois-representation identification. Needed by Taylor 2002 (G10) and Taylor 2006 Proposition 4.1.
3. **Skinner–Wiles.** Which stage owns *Nearly ordinary deformations* Theorem 5.1: R21.4/R21.6 or R22.5? Which owns *Base change and a problem of Serre* ([SW1] = KW Annals [44])?
4. **GL2ModularityLifting.** Export conclusion (II) of KW II Propositions 9.2–9.3 over a totally real F, and name an owner for Theorem 8.2 (G11, G14).
5. **GlobalGaloisDeformations R04.3/R04.6.** Export the generator and relation counts of KW II Proposition 4.5 and Lemma 4.6, including DDT 2.17/2.19 and NSW 8.6.7–8.6.8.
6. **LocalGaloisDeformationRings R08.6.** Export KW II Theorem 3.1 with Propositions 2.10–2.12, including the non-domain inertia-rigid factors, and Kisin's fixed-type rings used by Gee and Snowden.
7. **DeformationAndDerivedPatchingAlgebra.**
   - Export KW II Proposition 2.2 (R03.1 is the nearest candidate).
   - The promoted node `R03.4/finiteness-of-deformation-rings-criteria` consumes `R03.5/kisin-patching-criterion`. That creates a pre-existing R03.4 ↔ R03.5 stage cycle in that packet, and this packet links to that node twice (L44, L60). Consider re-parenting it.
8. **Foundations.** Name owners for:
   - Chow's lemma;
   - strong approximation for affine spaces over Dedekind rings (AdelicAlgebraicGroups AA.4 treats only simply connected groups);
   - the S-unit lattice;
   - Chebotarev (candidate: TauCetiRoadmap/Chebotarev Layer 10);
   - class field theory, including the Brauer-group square-root obstruction (candidate: ClassFieldTheory Layers 10–12).
9. **ModularityAndLanglandsExtensions (sibling).** Its link from R23.1 says Théorème 1.3 gives "a finite Galois K′/K". Théorème 1.3 gives a finite K′, with K′ ⊗_K L_v split. When a Galois field is needed, pass to the normal closure, which keeps complete splitting.
10. **Atlas text.** Re-pin R24.3 from "KW Annals §5.2" to KW Annals §3 (with §4 for systems) and Böckle Proposition 1 (G16). Decide the Böckle duplication with ClassicalSerreModularity R26.1 (G17).

---

## Appendix A. Per-node verdicts

The verdicts, with the reviewers' notes, are recorded in each packet's `review.checked` list in the companion pull request. Here: node (without the roadmap prefix) and verdict.

### ModularCurvesPartII

| Node | Verdict |
| --- | --- |
| `R13.1/standard-neron-polygons-and-their-group-action` | verified |
| `R13.1/stable-genus-one-curves-and-their-geometric-fibres` | verified |
| `R13.1/generalized-elliptic-curve-definition-and-morphisms` | verified |
| `R13.1/automorphism-functor-of-the-standard-n-gon` | verified |
| `R13.1/degeneracy-locus-local-structure-and-base-change` | corrected |
| `R13.1/twisted-two-gon-without-generalized-elliptic-structure` | verified |
| `R13.1/construction-principle-from-a-group-action-trivial-on-pic0` | corrected |
| `R13.1/finite-etale-covers-and-negation` | corrected |
| `R13.1/contraction-away-from-a-finite-subgroup` | corrected |
| `R13.1/quotients-by-finite-locally-free-subgroups-and-isogenies` | corrected |
| `R13.1/formal-generalized-elliptic-curves-algebraize` | verified |
| `R13.1/ample-subgroups-and-tricanonical-embeddings` | corrected |
| `R13.1/formal-and-algebraic-tate-curves-with-n-sides` | corrected |
| `R13.1/tate-one-gon-is-the-universal-deformation-of-the-standard-one-gon` | corrected |
| `R13.2/isom-schemes-finite-and-extension-of-isomorphisms` | corrected |
| `R13.2/artin-algebraicity-via-tricanonically-embedded-families` | corrected |
| `R13.2/deligne-mumford-loci-of-level-moduli` | corrected |
| `R13.2/properness-via-semistable-reduction-and-contraction` | corrected |
| `R13.2/flatness-and-cohen-macaulayness-via-deformation-rings-at-cusps` | verified |
| `R13.2/contraction-to-M1-finite-flat-normality-and-boundary-divisor` | corrected |
| `R13.2/stacks-Ell-n-of-generalized-elliptic-curves-with-n-gon-degenerations` | verified |
| `R13.2/contraction-tower-Ell-nm-to-Ell-n` | corrected |
| `R13.2/modular-stacks-X-H-by-normalization` | verified |
| `R13.2/drinfeld-structures-and-cyclic-subgroups-on-generalized-elliptic-curves` | verified |
| `R13.2/full-level-stack-X-n-regular-and-equal-to-X-Gamma-n` | corrected |
| `R13.2/weil-pairing-morphism-to-Z-zeta-N` | corrected |
| `R13.2/gamma1-stack-X1-n-regular-and-equal-to-X-Gamma1-n` | verified |
| `R13.2/axiomatic-criterion-for-a-correct-modular-description` | corrected |
| `R13.2/mixed-level-stacks-X1-n-n-prime-and-X0-n-n-prime` | corrected |
| `R13.2/naive-gamma0-n-stack-and-its-failure-for-non-squarefree-n` | verified |
| `R13.2/refined-gamma0-n-structures-with-decontraction-data` | corrected |
| `R13.2/X0-n-is-deligne-mumford-regular-and-equals-X-Gamma0-n` | verified |
| `R13.2/schematic-locus-and-fine-moduli-schemes-for-large-level` | corrected |
| `R13.3/uniqueness-of-tate-n-from-its-generic-fibre` | verified |
| `R13.3/full-level-cusp-chart-over-Z-zeta-N-q-1-over-N` | corrected |
| `R13.3/gamma1-cusp-regularity-by-invariants-including-characteristic-2` | corrected |
| `R13.3/cusp-substacks-of-X1-N-structure-and-schematicity` | corrected |
| `R13.3/formal-completion-along-cusps-with-d-greater-than-2` | verified |
| `R13.3/formal-completion-along-cusps-with-d-at-most-2-quadratic-twists` | corrected |
| `R13.3/degeneracy-ideals-under-isogenies` | corrected |
| `R13.3/hodge-line-omega-and-integral-weight-k-forms` | verified |
| `R13.4a/coarse-space-of-Ell-n-is-the-j-line-with-arbitrary-base-change` | corrected |
| `R13.4a/coarse-moduli-schemes-X-H-projective-normal-and-quotients-of-X-n` | verified |
| `R13.4a/coarse-spaces-smooth-away-from-level-and-base-change-away-from-gcd-6-n` | corrected |
| `R13.4a/regularity-of-coarse-X0-n-and-naive-versus-refined-coarse-spaces` | corrected |
| `R13.4b/geometric-connectedness-of-fibres-via-complex-uniformization` | verified |
| `R13.4b/comparison-of-integral-weight-k-forms-with-classical-modular-forms-over-C` | corrected |
| `R14.1/extension-lemma-for-morphisms-from-normal-deligne-mumford-stacks` | corrected |
| `R14.1/hecke-correspondence-gamma1-N-p-extends-finite-flat-over-Z` | corrected |
| `R14.1/hecke-correspondence-for-X1-n-via-quotients-by-squarefree-order-subgroups` | verified |
| `R14.1/gamma0-hecke-correspondence-on-the-naive-stacks` | corrected |
| `R14.1/integral-hecke-operators-T-p-and-divisibility-by-p` | corrected |
| `R14.1/hecke-operators-on-katz-forms-in-characteristic-p-and-q-expansion-formulas` | corrected |

### ModularityAndLanglandsExtensions

| Node | Verdict |
| --- | --- |
| `ML.0/galois-automorphic-normalisations-shared-by-newton-thorne-and-accplus` | corrected |
| `ML.1/odd-two-dimensional-artin-representations-of-GQ-are-modular` | corrected |
| `ML.1/gl2-type-abelian-varieties-over-Q-are-modular` | verified |
| `ML.2/accplus-lemmas-7-1-5-to-7-1-8-residual-image-and-local-shape-conditions` | corrected |
| `ML.2/accplus-corollary-7-2-4-symmetric-powers-of-a-rational-elliptic-curve-over-totally-real-fields` | corrected |
| `ML.2/accplus-theorem-7-1-11-potential-automorphy-of-symmetric-powers-over-cm-fields` | corrected |
| `ML.2/elliptic-curves-over-cm-fields-are-potentially-modular-only` | corrected |
| `ML.2/blggt-proposition-3-1-1-moret-bailly-points-with-galois-and-disjointness-control` | corrected |
| `ML.2/blggt-theorem-2-4-1-ordinary-automorphy-lifting` | verified |
| `ML.2/blggt-theorem-3-1-2-dwork-family-potential-ordinary-automorphy` | verified |
| `ML.2/blggt-theorem-4-2-1-potentially-diagonalizable-automorphy-lifting` | corrected |
| `ML.2/blggt-theorem-5-4-1-potential-automorphy-of-polarized-compatible-systems` | corrected |
| `ML.3/nt-theorem-2-33-symmetric-power-automorphy-is-constant-on-eigencurve-components` | corrected |
| `ML.3/nt-theorem-3-1-level-one-ping-pong-on-the-2-adic-eigencurve` | verified |
| `ML.3/nt-theorem-7-6-one-level-one-form-with-automorphic-symmetric-power` | corrected |
| `ML.3/nt-theorem-8-1-symmetric-powers-when-no-local-component-is-supercuspidal` | corrected |
| `ML.3/nt2-theorem-2-1-functoriality-lifting-for-symmetric-powers` | verified |
| `ML.3/nt2-theorem-3-1-all-non-cm-regular-algebraic-forms-over-Q` | corrected |
| `ML.3/nt2-appendix-a-cm-and-weight-one-symmetric-powers` | corrected |
| `ML.3/nt-hilbert-symmetric-powers-for-regular-weight-hilbert-modular-forms` | corrected |
| `ML.3/accplus-sato-tate-purity-and-symmetric-power-l-functions-over-cm-fields` | corrected |
| `ML.3/source-scoped-register-of-symmetric-power-and-sato-tate-endpoints` | corrected |
| `ML.4/endoscopic-classification-for-quasi-split-classical-groups-conditional-on-twisted-weighted-fundamental-lemma` | corrected |
| `ML.4/mok-endoscopic-classification-for-quasi-split-unitary-groups` | corrected |
| `ML.4/kmsw-inner-forms-of-unitary-groups-tempered-classification` | corrected |
| `ML.4/symplectic-torsion-branch-depends-on-arthur-classification` | corrected |
| `ML.5/clozel-thorne-conditional-implication-for-symmetric-powers` | verified |

### OverconvergentAutomorphicForms

| Node | Verdict |
| --- | --- |
| `O0/hilbert-weight-spaces-and-the-weight-map-rho` | corrected |
| `O0/analytic-continuation-of-bounded-weights` | corrected |
| `O1/left-action-pullback-and-automorphy-conventions` | corrected |
| `O1/weight-twisted-invariant-sheaf-along-a-pro-etale-torsor` | corrected |
| `O2/restriction-of-scalars-tautological-section-transformation` | verified |
| `O2/pulled-back-canonical-section-and-moduli-interpretation` | verified |
| `O2/automorphy-factor-kappa-of-cz-plus-d` | corrected |
| `O2/geometric-overconvergent-hilbert-sheaves-and-spaces` | corrected |
| `O2/analyticity-of-the-perfectoid-weight-sheaves` | corrected |
| `O2/elliptic-specialisation-and-extension-over-the-cusps` | corrected |
| `O2/classical-weight-comparison` | verified |
| `O3/integral-perfectoid-weight-sheaves-and-integral-forms` | corrected |
| `O4/arithmetic-automorphy-factors-are-well-defined` | verified |
| `O4/four-torsor-presentations-of-hilbert-weight-sheaves` | verified |
| `O4/geometric-forms-independent-of-the-full-level-tower` | verified |
| `O4/twisted-polarisation-action-and-delta-descent` | verified |
| `O4/weil-pairing-twist-identifies-the-arithmetic-presentations` | corrected |
| `O4/arithmetic-sheaves-spaces-and-polarisation-classes` | corrected |
| `O5/aip-weight-annuli-and-the-radius-epsilon-kappa` | corrected |
| `O5/aip-sheaf-on-weight-annuli-gluing-and-level-structure` | corrected |
| `O5/perfectoid-and-aip-geometric-sheaves-agree` | corrected |
| `O5/elliptic-comparison-with-the-pilloni-torsor` | corrected |
| `O5/arithmetic-comparison-with-aip-by-delta-descent` | corrected |
| `O6/cusp-forms-via-koecher-extension-and-boundary-divisor` | corrected |
| `O6/tame-hecke-operators-by-pull-identify-trace` | verified |
| `O6/u-frak-p-operators-via-the-action-of-u-frak-p` | verified |
| `O6/hecke-action-on-arithmetic-forms-and-canonicity` | verified |
| `O6/hecke-equivariance-of-the-aip-comparisons` | verified |
| `O6/compactness-of-the-controlling-operator-u-p` | verified |

### PELModuli

| Node | Verdict |
| --- | --- |
| `M0/discriminant-inverse-different-and-unramified-primes-of-an-order` | verified |
| `M0/determinant-polynomial-classifies-modules-over-a-separable-algebra` | verified |
| `M0/field-of-definition-of-a-module-and-its-trace-description` | verified |
| `M0/multirank-classification-of-projective-modules-at-unramified-primes` | corrected |
| `M0/pel-type-lattice-polarization-and-similitude-group-scheme` | corrected |
| `M0/positive-involution-types-A-C-D-and-the-invariant-I-bad` | verified |
| `M0/universal-domains-of-balanced-pairings-are-torsion-free-at-good-primes` | corrected |
| `M0/standard-form-of-self-dual-symplectic-modules-at-good-primes` | corrected |
| `M0/similitude-group-is-smooth-with-determined-geometric-type-at-good-primes` | corrected |
| `M0/gram-schmidt-lifting-of-totally-isotropic-submodules` | corrected |
| `M0/hodge-subspace-signatures-and-pel-reflex-field` | corrected |
| `M0/determinant-of-the-hodge-subspace-is-integral-over-the-reflex-field` | corrected |
| `M0/lagrangian-quotient-G-mod-P0-formally-smooth-and-G-smooth` | corrected |
| `M0/pel-reflex-field-versus-shimura-datum-reflex-field` | verified |
| `M1/isogenies-quasi-isogenies-and-prime-to-box-quasi-isogenies` | corrected |
| `M1/polarizations-and-prime-to-box-polarizations` | corrected |
| `M1/endomorphism-structures-rosati-condition-and-finite-representability` | corrected |
| `M1/kottwitz-determinantal-condition-on-the-lie-algebra` | verified |
| `M1/prime-to-box-isogenies-correspond-to-invariant-lattices-in-tate-modules` | corrected |
| `M1/symplectic-liftable-principal-level-n-structures` | corrected |
| `M1/level-H-structures-as-orbits-of-etale-locally-defined-level-structures` | verified |
| `M1/rational-level-H-structures-and-comparison-with-integral-ones` | corrected |
| `M1/good-primes-and-the-moduli-problem-M-H-by-isomorphism-classes` | verified |
| `M1/moduli-problem-M-rat-H-by-prime-to-box-isogeny-classes` | verified |
| `M1/isomorphism-classes-versus-prime-to-box-isogeny-classes` | corrected |
| `M1/etale-stack-property-of-M-H` | corrected |
| `M1/change-of-lattice-order-and-set-of-good-primes` | corrected |
| `M2/obstruction-theory-for-smooth-schemes-morphisms-and-line-bundles` | corrected |
| `M2/de-rham-lifting-criterion-for-abelian-schemes` | corrected |
| `M2/kodaira-spencer-class-and-morphism` | corrected |
| `M2/local-deformation-functors-rigidity-and-openness-of-conditions` | verified |
| `M2/prorepresentability-of-local-pel-deformation-functors` | corrected |
| `M2/formal-smoothness-of-polarized-abelian-deformations` | corrected |
| `M2/formal-smoothness-and-dimension-of-pel-deformations-at-good-primes` | corrected |
| `M2/effective-prorepresentability-by-grothendieck-existence` | verified |
| `M2/automorphisms-of-polarized-abelian-schemes-and-neat-rigidification` | verified |
| `M2/representability-smoothness-and-finite-type-of-M-H` | corrected |
| `M2/kodaira-spencer-isomorphism-on-M-H` | verified |
| `M6/level-n-rigidity-and-descent-of-isomorphism-classes-for-height-finiteness` | corrected |

### PadicLocalLanglandsForGL2Qp

| Node | Verdict |
| --- | --- |
| `R30.4/kisin-hypothesis-1-2-6-locally-algebraic-lattice-and-abelian-types` | corrected |
| `R30.6/paskunas-breuil-mezard-cycles-scalar-endomorphisms-p-at-least-5` | verified |
| `R30.6/hu-tan-breuil-mezard-cycles-split-distinct-characters-p-at-least-5` | verified |
| `R30.6/tung-breuil-mezard-cycles-all-residual-types-p-odd-via-patching` | corrected |
| `R30.6/paskunas-breuil-mezard-cycles-generic-residual-types-all-p` | corrected |
| `R30.6/tung-breuil-mezard-cycles-all-residual-types-p-equals-2-via-patching` | corrected |
| `R30.6/residually-modular-lifting-theorems-and-their-exact-hypotheses` | corrected |
| `R30.6/dieulefait-pacetti-citation-map-for-theorems-1-4-and-1-5` | corrected |

### PerfectoidShimuraVarieties

| Node | Verdict |
| --- | --- |
| `S1/perfectoid-hebbarkeitssatz-almost-hom-description` | corrected |
| `S1/hebbarkeitssatz-on-hasse-loci-under-resolution` | corrected |
| `S1/good-triples-and-their-stability` | corrected |
| `S1/integral-canonical-subgroup-via-deformation-theory` | verified |
| `S1/canonical-subgroup-functoriality-and-generic-structure` | verified |
| `S1/hartogs-extension-on-hasse-blowups` | verified |
| `S1/hasse-neighbourhood-blowups-and-frobenius-diagram` | verified |
| `S1/canonical-frobenius-lift-and-anticanonical-open-immersions` | corrected |
| `S1/anticanonical-tower-and-deep-level-affinoidness` | corrected |
| `S1/perfectoid-anticanonical-gamma0-tower-and-its-tilt` | verified |
| `S1/gamma0-infinite-level-affinoid-with-strongly-zariski-closed-boundary` | verified |
| `S1/tate-normalized-traces-on-anticanonical-tower` | verified |
| `S1/hartogs-and-perfectoid-criterion-for-finite-covers-at-infinite-level` | corrected |
| `S1/gamma1-level-perfectoid-anticanonical-tower-by-untilting` | corrected |
| `S1/full-level-anticanonical-affinoid-perfectoid-with-good-triple` | verified |
| `S1/hodge-tate-filtration-of-degenerating-abelian-varieties` | corrected |
| `S1/continuous-hodge-tate-map-away-from-boundary` | verified |
| `S1/ordinary-locus-is-preimage-of-rational-flags` | verified |
| `S1/finitely-many-symplectic-translates-cover-the-tower` | verified |
| `S1/perfectoid-minimally-compactified-siegel-tower` | corrected |
| `S1/hodge-tate-period-map-on-adic-spaces-and-boundary-extension` | verified |
| `S1/siegel-main-theorem-flag-chart-affinoid-perfectoid-cover` | corrected |
| `S2/hodge-type-embedding-and-image-compactification` | verified |
| `S2/hodge-type-perfectoid-image-compactified-tower` | verified |
| `S2/analytic-separation-and-zariski-closed-pullbacks-for-projective-towers` | verified |
| `S2/hodge-type-genuine-minimal-compactification-is-a-good-tower` | corrected |
| `S3/siegel-hodge-tate-map-tame-level-and-hecke-equivariance` | verified |
| `S3/siegel-lie-algebra-and-hodge-line-pullback` | corrected |
| `S3/elliptic-hodge-line-as-pullback-of-O1-via-quotient-line` | corrected |
| `S3/hodge-type-period-map-to-siegel-flag-variety-on-image-compactification` | verified |
| `S3/hodge-type-period-map-factors-through-G-flag-variety` | verified |
| `S3/levi-torsor-pullback-identifies-automorphic-vector-bundles` | corrected |
| `S3/siegel-toroidal-period-map-explicit-convention` | corrected |
| `S3/hodge-type-compactified-period-maps-and-toroidal-torsor-comparison` | corrected |
| `S4/pre-abelian-type-connected-and-adjoint-data` | verified |
| `S4/perfectoidness-from-perfectoid-components-under-profinite-action` | verified |
| `S4/good-towers-finite-maps-and-finite-quotients` | verified |
| `S4/full-tower-perfectoid-iff-connected-component-tower-perfectoid` | corrected |
| `S4/property-P-descends-from-adjoint-connected-datum` | corrected |
| `S4/hodge-type-adjoint-connected-towers-are-perfectoid` | verified |
| `S4/pre-abelian-minimally-compactified-towers-are-perfectoid` | verified |

### PotentialAutomorphyInfrastructure

| Node | Verdict |
| --- | --- |
| `PA.0/rational-cohomology-concentration-at-absolutely-irreducible-ideals` | verified |
| `PA.3/congruent-deformation-problems-and-twisted-coefficients` | verified |
| `PA.3/dimension-and-component-hypotheses-for-patched-local-rings` | verified |
| `PA.3/hecke-valued-galois-representation-of-type-S-chi` | verified |
| `PA.3/generic-support-implication-fontaine-laffaille-patched-data` | verified |
| `PA.3/generic-support-implication-ordinary-patched-data` | verified |
| `PA.3/unconditional-derived-ihara-avoidance-versus-calegari-geraghty-conjecture-b` | corrected |
| `PA.4/taylor-wiles-local-condition-datum-and-augmented-problem` | verified |
| `PA.4/existence-of-taylor-wiles-data-killing-dual-selmer` | verified |
| `PA.4/taylor-wiles-presentation-with-g-variables` | verified |
| `PA.4/auxiliary-level-subgroups-hecke-algebras-and-maximal-ideals` | verified |
| `PA.4/taylor-wiles-level-change-isomorphisms-of-localized-complexes` | verified |
| `PA.4/delta-Q-equivariant-galois-representation-at-auxiliary-level` | verified |
| `PA.4/arithmetic-tower-satisfies-ultrapatching-set-up-fontaine-laffaille` | verified |
| `PA.4/full-support-and-automorphy-of-type-S1-lifts-fontaine-laffaille` | verified |

### PotentialModularityAndCompatibleSystems

| Node | Verdict |
| --- | --- |
| `R23.1/skolem-datum-and-integral-point` | corrected |
| `R23.1/density-of-algebraic-and-separable-local-points` | corrected |
| `R23.1/elementary-reductions-of-skolem-data` | verified |
| `R23.1/reduction-to-relative-dimension-one` | corrected |
| `R23.1/generalized-picard-functor-and-effective-divisor-fibration` | corrected |
| `R23.1/local-picard-open-sets-and-strong-approximation` | corrected |
| `R23.1/quasi-compactness-of-the-generalized-jacobian-quotient` | corrected |
| `R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points` | corrected |
| `R23.1/taylor-theorem-g-split-completely-points-are-dense` | corrected |
| `R23.1/forcing-linear-disjointness-by-extra-split-places` | corrected |
| `R23.2/taylor-auxiliary-data-p-L-psi-N-M` | corrected |
| `R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions` | verified |
| `R23.2/m-hbav-ordered-polarisation-module-and-weil-pairing` | verified |
| `R23.2/taylor-2002-moduli-space-of-m-hbav-with-lambda-and-wp-level-structure` | corrected |
| `R23.2/taylor-lemma-1-2-local-hbav-at-places-above-l` | corrected |
| `R23.2/taylor-lemmas-1-3-1-4-local-points-at-p-and-at-infinity` | corrected |
| `R23.2/local-points-at-l-p-infinity-and-the-point-over-E` | verified |
| `R23.2/taylor-2006-twisted-moduli-X-R-psi-and-dihedral-local-points` | corrected |
| `R23.3/taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l` | corrected |
| `R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar` | corrected |
| `R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l` | corrected |
| `R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l` | corrected |
| `R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F` | corrected |
| `R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity` | corrected |
| `R24.1/the-global-rings-R-bar-S-psi-framed-and-unframed` | verified |
| `R24.1/auxiliary-totally-real-field-for-the-finiteness-argument` | verified |
| `R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring` | corrected |
| `R24.2/local-conditions-flat-nonempty-of-dimension-3-per-place` | corrected |
| `R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` | corrected |
| `R24.3/kw-i-theorem-5-1-four-prescribed-lift-types-and-minimal-lifts` | corrected |
| `R24.3/kw-ii-existence-of-p-adic-lifts-of-the-required-type` | corrected |
| `R24.3/bockle-presentation-with-relations-bounded-by-generators-and-minimal-R-equals-T` | corrected |
| `R24.3/kw-annals-theorem-3-3-minimally-ramified-lifts-for-odd-p` | corrected |
| `R24.3/modern-route-lifts-of-prescribed-inertial-type-gee-and-snowden` | corrected |

## Appendix B. Mistakes found in the sources

These are mistakes in the published or preprint sources themselves, not in the packets. Each was checked on the source text or on a page image by the packet's reviewer. The corrected nodes already use the right statements.

### From ModularCurvesPartII

- Conrad preprint p. 5: the nodal cubic y^2z = x^3 - x^2z with t -> (t^2+1, t(t^2+1)) is not a model of the standard 1-gon over Z. It glues t = +-i, its node is non-split over Q, and it is cuspidal in characteristic 2. y^2z + xyz = x^3 is a correct model (the drafter's proposal, verified).
- Conrad Thm 3.2.7 (p. 26) and Remark 4.1.5 (p. 32): 'Deligne-Mumford if and only if n is squarefree' is false in the 'only if' direction. Counterexample: N = n = p^2 (Cesnavicius Prop. 4.6.5(b), p. 47).
- Conrad Thm 3.2.7 (p. 26): the citation '[DR, III, 2.5(iii)]' has no referent; DR III Thm 2.5 (p. 203) has only (i)-(ii).
- Conrad p. 38 and Def. 4.3.3, with (4.3.11) on p. 41: the case (N,d) = (4p^s,2) with p odd and s >= 1 is omitted. The 2-gon point P = (i,1) in characteristic p is fixed by inversion followed by -1 in mu_2, and Conrad's own delta rule in the proof of Thm 4.3.7 (p. 42) gives delta = p there. For N = 12, Thms 4.3.4 and 4.3.7 contradict each other.
- Conrad Example 4.5.3 (p. 48): the T_l q-expansion formulas start both sums at n >= 1 for arbitrary Katz forms, omitting the constant terms.
- Cesnavicius Prop. 4.3.6 (arXiv p. 39): with s >= 1 the statement does not exclude n = 1, but X(1) = Ell_1 is not a scheme.
- DR VII Construction 4.6 (printed p. 312): 'dans l'espace des formes modulaires de poids 3n' evidently means level 3n (probable misprint).

### From PerfectoidShimuraVarieties

- Scholze, Annals 182, printed p. 986: 'finite and locally free of degree g(g+1)/2' should read p^{g(g+1)/2} (as on p. 987); page images checked by the reviewer.
- Scholze, printed p. 985, Theorem 3.2.15(iii): 'weak canonical subgroup C of level p' means level 1 (proof, p. 986).
- Scholze, printed p. 999, proof of Lemma 3.2.30: 'Y*_m \ boundary -> Spa(S_infty, S_infty^+)' apparently means Y*_infty.
- Scholze, printed p. 1015, proof of Theorem 3.3.18(vi): 'an open subset of U that does not meet the boundary; thus, it is empty' should say that it does not meet U \ boundary (it lies in the boundary).
- Hansen-Johansson v2, p. 38, Theorem 5.20: 'K^p ⊆ G(A_f)' should be G(A_f^p) (compare Theorem 1.5).
- Hansen-Johansson v2, p. 36, Definition 5.17 and p. 38, Theorem 5.20 (connected case): arithmetic Gamma in G^ad(Q)^+ used with towers for G; the proof of Proposition 5.18 uses Gamma in G(Q)^+.
- Hansen-Johansson v2, p. 36, Proposition 5.16: pi_0 X*_{K^p}(G, X) = G(Q)_+\G(A_f)/K^p omits the closure of G(Q)_+ in G(A_f) (cf. Boxer-Pilloni 4.4.48, p. 83).

Further source slips are recorded in the sections: Lan Definition 1.2.3.6(2) (section 4); ACC+ Assumption 7.2.6 and Lemma 7.1.8 (section 2); BHW Proposition 6.3 and Definition 7.9 (section 3); Taylor's erratum and Lemma 1.5 (section 8).
